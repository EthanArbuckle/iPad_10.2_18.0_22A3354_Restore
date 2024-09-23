@implementation BWRenderListProcessor

uint64_t __50__BWRenderListProcessor_alwaysEmitsOriginalResult__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 16);
  return result;
}

- (void)adjustMetadataOfSampleBuffer:(opaqueCMSampleBuffer *)a3 usingRenderList:(id)a4
{
  id v5;
  _QWORD *i;
  void *v7;

  if (objc_msgSend(a4, "affectsMetadata"))
  {
    if (a3)
      CFRetain(a3);
    v5 = a4;
    for (i = *(_QWORD **)objc_msgSend(a4, "rendererList"); i; i = (_QWORD *)*i)
    {
      v7 = (void *)i[1];
      if (objc_msgSend(v7, "adjustsMetadata"))
        objc_msgSend(v7, "adjustMetadataOfSampleBuffer:", a3);
    }
    if (a3)
      CFRelease(a3);

  }
}

- (void)processRenderList:(id)a3 withParameters:(id)a4 inputPixelBuffer:(__CVBuffer *)a5 inputSampleBuffer:(opaqueCMSampleBuffer *)a6 resultHandler:(id)a7
{
  id v7;

  v7 = a3;
  if (a4)
    a3 = a4;
  -[BWRenderListProcessor _processRenderList:parameterListProvider:inputPixelBuffer:inputSampleBuffer:resultHandler:]((dispatch_group_t *)self, v7, a3, a5, a6, (uint64_t)a7);
}

- (void)_processRenderList:(void *)a3 parameterListProvider:(void *)a4 inputPixelBuffer:(void *)a5 inputSampleBuffer:(uint64_t)a6 resultHandler:
{
  id v12;
  id v13;
  uint64_t *v14;
  _QWORD **v15;
  uint64_t v16;

  if (a1)
  {
    dispatch_group_wait(a1[4], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_group_enter(a1[4]);
    if (a5)
      CFRetain(a5);
    if (a4)
      CFRetain(a4);
    v12 = a2;
    v13 = a3;
    if (a6
      && -[dispatch_group_t alwaysEmitsOriginalResult](a1, "alwaysEmitsOriginalResult")
      && (objc_msgSend(a2, "producesOriginalRender") & 1) == 0)
    {
      (*(void (**)(uint64_t, uint64_t, void *, _QWORD))(a6 + 16))(a6, 1, a5, 0);
    }
    if (a2)
    {
      v14 = *(uint64_t **)objc_msgSend(a2, "rendererList");
      if (!a3)
        goto LABEL_18;
    }
    else
    {
      v14 = 0;
      if (!a3)
      {
LABEL_18:
        -[BWRenderListProcessor _finishRenderingUsingRenderList:parameterListProvider:result:resultError:inputSampleBuffer:processedPixelBuffer:finalResultHandler:]((uint64_t)a1, a2, a3, 0, 0, (opaqueCMSampleBuffer *)a5, (__CVBuffer *)a4, a6);
        return;
      }
    }
    v15 = (_QWORD **)objc_msgSend(a3, "parameterList");
    if (!v14 || !*v15)
      goto LABEL_18;
    -[BWRenderListProcessor _continueRenderingUsingRenderList:parameterListProvider:result:resultError:fromRendererNode:parameterNode:inputSampleBuffer:inputPixelBuffer:finalResultHandler:]((uint64_t)a1, a2, a3, 0, v16, v14, *v15, (opaqueCMSampleBuffer *)a5, (__CVBuffer *)a4, a6);
  }
}

- (BOOL)alwaysEmitsOriginalResult
{
  NSObject *configurationMutexQueue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  configurationMutexQueue = self->_configurationMutexQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__BWRenderListProcessor_alwaysEmitsOriginalResult__block_invoke;
  v5[3] = &unk_1E491E9A8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(configurationMutexQueue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)_finishRenderingUsingRenderList:(void *)a3 parameterListProvider:(uint64_t)a4 result:(int)a5 resultError:(opaqueCMSampleBuffer *)a6 inputSampleBuffer:(__CVBuffer *)a7 processedPixelBuffer:(uint64_t)a8 finalResultHandler:
{
  if (a1)
  {
    -[BWRenderListProcessor _emitProcessedSampleBufferFromRenderList:result:resultError:inputSampleBuffer:processedPixelBuffer:finalResultHandler:](a1, (int)a2, a4, a5, a6, a7, a8);
    if (a6)
      CFRelease(a6);

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  }
}

- (void)_emitProcessedSampleBufferFromRenderList:(uint64_t)a3 result:(int)a4 resultError:(opaqueCMSampleBuffer *)cf inputSampleBuffer:(__CVBuffer *)a6 processedPixelBuffer:(uint64_t)a7 finalResultHandler:
{
  CFTypeRef v10;
  CFTypeRef cfa;

  if (a1)
  {
    cfa = 0;
    if ((a3 & 3) != 0)
    {
      if (!BWCMSampleBufferCreateCopyWithNewPixelBuffer(cf, a6, (CFTypeRef *)(a1 + 40), (CMSampleBufferRef *)&cfa)&& cfa)
      {
LABEL_5:
        if (a7)
          (*(void (**)(uint64_t, uint64_t))(a7 + 16))(a7, a3);
        if (!a6)
          goto LABEL_9;
        goto LABEL_8;
      }
    }
    else
    {
      if (cf)
        v10 = CFRetain(cf);
      else
        v10 = 0;
      cfa = v10;
      if (v10)
        goto LABEL_5;
    }
    fig_log_get_emitter();
    FigDebugAssert3();
    if (!a6)
    {
LABEL_9:
      if (cfa)
        CFRelease(cfa);
      return;
    }
LABEL_8:
    CFRelease(a6);
    goto LABEL_9;
  }
}

- (BWRenderListProcessor)initWithRenderingPool:(id)a3
{
  BWRenderListProcessor *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BWRenderListProcessor;
  v4 = -[BWRenderListProcessor init](&v6, sel_init);
  if (v4)
  {
    v4->_configurationMutexQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.render-list-processor.configuration-queue", 0);
    v4->_renderingPool = (BWPixelBufferPool *)a3;
    v4->_renderingGroup = (OS_dispatch_group *)dispatch_group_create();
  }
  return v4;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  opaqueCMFormatDescription *mostRecentFormatDescription;
  objc_super v4;

  mostRecentFormatDescription = self->_mostRecentFormatDescription;
  if (mostRecentFormatDescription)
    CFRelease(mostRecentFormatDescription);
  v4.receiver = self;
  v4.super_class = (Class)BWRenderListProcessor;
  -[BWRenderListProcessor dealloc](&v4, sel_dealloc);
}

- (void)setAlwaysEmitsOriginalResult:(BOOL)a3
{
  NSObject *configurationMutexQueue;
  _QWORD v4[5];
  BOOL v5;

  configurationMutexQueue = self->_configurationMutexQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__BWRenderListProcessor_setAlwaysEmitsOriginalResult___block_invoke;
  v4[3] = &unk_1E491EE18;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(configurationMutexQueue, v4);
}

uint64_t __54__BWRenderListProcessor_setAlwaysEmitsOriginalResult___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 16) = *(_BYTE *)(result + 40);
  return result;
}

- (void)processRenderList:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 resultHandler:(id)a6
{
  -[BWRenderListProcessor _processRenderList:parameterListProvider:inputPixelBuffer:inputSampleBuffer:resultHandler:]((dispatch_group_t *)self, a3, a3, a4, a5, (uint64_t)a6);
}

- (void)_continueRenderingUsingRenderList:(void *)a3 parameterListProvider:(uint64_t)a4 result:(uint64_t)a5 resultError:(uint64_t *)a6 fromRendererNode:(_QWORD *)a7 parameterNode:(opaqueCMSampleBuffer *)a8 inputSampleBuffer:(__CVBuffer *)a9 inputPixelBuffer:(uint64_t)a10 finalResultHandler:
{
  __CVBuffer *v17;
  __CVBuffer *v18;
  int v19;
  __CVBuffer *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  _QWORD v27[17];
  char v28;
  _QWORD v29[4];
  _QWORD v30[6];
  uint64_t v31;
  _QWORD v32[3];

  v32[1] = *MEMORY[0x1E0C80C00];
  if (a1 && a6 && a7 && a9)
  {
    v17 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 24), "newPixelBuffer");
    if (v17)
    {
      v18 = v17;
      CVBufferPropagateAttachments(a9, v17);
      v19 = objc_msgSend(a2, "shouldAllowOriginalRenderFromNode:", a6);
      if (v19)
      {
        v26 = v19;
        v20 = (__CVBuffer *)objc_msgSend(*(id *)(a1 + 24), "newPixelBuffer");
        if (v20)
          CVBufferPropagateAttachments(a9, v20);
        LOBYTE(v19) = v26;
      }
      else
      {
        v20 = 0;
      }
      v30[0] = 0;
      v30[1] = v30;
      v30[2] = 0x3052000000;
      v30[3] = __Block_byref_object_copy__33;
      v30[4] = __Block_byref_object_dispose__33;
      v30[5] = a1;
      v29[0] = 0;
      v29[1] = v29;
      v29[2] = 0x2020000000;
      v29[3] = 0;
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __185__BWRenderListProcessor__continueRenderingUsingRenderList_parameterListProvider_result_resultError_fromRendererNode_parameterNode_inputSampleBuffer_inputPixelBuffer_finalResultHandler___block_invoke;
      v27[3] = &unk_1E4925750;
      v28 = v19;
      v27[4] = a1;
      v27[5] = a2;
      v27[10] = v20;
      v27[11] = a8;
      v27[12] = v18;
      v27[13] = a9;
      v24 = *a6;
      v23 = (void *)a6[1];
      v27[14] = a4;
      v27[15] = v24;
      v27[8] = v29;
      v27[9] = v30;
      v27[6] = a3;
      v27[7] = a10;
      v25 = a7[1];
      v27[16] = *a7;
      objc_msgSend(v23, "renderUsingParameters:inputPixelBuffer:inputSampleBuffer:originalPixelBuffer:processedPixelBuffer:completionHandler:", v25, a9, a8, v20, v18, v27);
      _Block_object_dispose(v29, 8);
      _Block_object_dispose(v30, 8);
    }
    else
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      v32[0] = CFSTR("Failed to allocate pixel buffer for processed render");
      v22 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
      -[BWRenderListProcessor _finishRenderingUsingRenderList:parameterListProvider:result:resultError:inputSampleBuffer:processedPixelBuffer:finalResultHandler:](a1, a2, a3, 0, objc_msgSend(v21, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], -12786, v22), a8, a9, a10);
    }
  }
}

- (void)waitForAllProcessingToComplete
{
  dispatch_group_wait((dispatch_group_t)self->_renderingGroup, 0xFFFFFFFFFFFFFFFFLL);
}

void __185__BWRenderListProcessor__continueRenderingUsingRenderList_parameterListProvider_result_resultError_fromRendererNode_parameterNode_inputSampleBuffer_inputPixelBuffer_finalResultHandler___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  __CVBuffer *v8;
  uint64_t v9;
  uint64_t v10;
  __CVBuffer *v11;
  const void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;

  v8 = *(__CVBuffer **)(a1 + 80);
  if (v8 && (a2 & 1) != 0 && *(_BYTE *)(a1 + 136))
    -[BWRenderListProcessor _emitProcessedSampleBufferFromRenderList:result:resultError:inputSampleBuffer:processedPixelBuffer:finalResultHandler:](*(_QWORD *)(a1 + 32), a2, 1, a3, *(opaqueCMSampleBuffer **)(a1 + 88), v8, *(_QWORD *)(a1 + 56));
  v9 = 96;
  if ((a2 & 2) != 0)
    v10 = 96;
  else
    v10 = 104;
  v11 = *(__CVBuffer **)(a1 + v10);
  if ((a2 & 2) != 0)
    v9 = 104;
  v12 = *(const void **)(a1 + v9);
  if (v12)
    CFRelease(v12);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_QWORD *)(a1 + 112) | a2;
  v13 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40);
  v14 = *(void **)(a1 + 40);
  v15 = *(void **)(a1 + 48);
  v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (a3 || (v17 = *(_QWORD *)(a1 + 120)) == 0)
    -[BWRenderListProcessor _finishRenderingUsingRenderList:parameterListProvider:result:resultError:inputSampleBuffer:processedPixelBuffer:finalResultHandler:](v13, v14, v15, v16, a3, *(opaqueCMSampleBuffer **)(a1 + 88), v11, *(_QWORD *)(a1 + 56));
  else
    -[BWRenderListProcessor _continueRenderingUsingRenderList:parameterListProvider:result:resultError:fromRendererNode:parameterNode:inputSampleBuffer:inputPixelBuffer:finalResultHandler:](v13, v14, v15, v16, a5, v17, *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 88), v11, *(_QWORD *)(a1 + 56));
}

+ (id)filterRendererResultToString:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("Passthrough");
  if (a3 == 1)
    v3 = CFSTR("Original");
  if (a3 == 2)
    return CFSTR("Processed");
  else
    return (id)v3;
}

- (BWPixelBufferPool)renderingPool
{
  return self->_renderingPool;
}

@end
