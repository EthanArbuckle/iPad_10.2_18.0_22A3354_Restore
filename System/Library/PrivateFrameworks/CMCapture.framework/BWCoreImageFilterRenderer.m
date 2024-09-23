@implementation BWCoreImageFilterRenderer

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

+ (void)prewarmCoreImageSDOFRenderingFilter
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  Class v8;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C9DD90];
  v9[0] = *MEMORY[0x1E0C9DFC8];
  v3 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *MEMORY[0x1E0C9E080]);
  v4 = *MEMORY[0x1E0C9DF58];
  v10[0] = v3;
  v10[1] = MEMORY[0x1E0C9AAA0];
  v5 = *MEMORY[0x1E0C9DFB0];
  v9[1] = v4;
  v9[2] = v5;
  v10[2] = MEMORY[0x1E0C9AAB0];
  v6 = (void *)objc_msgSend(v2, "contextWithOptions:", objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3));
  objc_msgSend(v6, "loadArchiveWithName:fromURL:", CFSTR("ccportrait_archive"), objc_msgSend(BWLoadProcessorBundle((uint64_t)CFSTR("CCPortrait"), 0xFFFFFFFFLL), "bundleURL"));
  v7 = (void *)objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIDepthBlurEffect"));
  if (v7)
  {
    objc_msgSend(v7, "performSelector:withObject:", NSSelectorFromString(CFSTR("prewarm:")), v6);
    v8 = NSClassFromString(CFSTR("EspressoWrapper"));
    -[objc_class performSelector:](v8, "performSelector:", NSSelectorFromString(CFSTR("clearCache")));
  }
}

+ (void)prewarmPortraitFilterVersion:(unsigned int)a3 semanticStyleFilters:(BOOL)a4
{
  SEL v5;
  void *v6;

  if (a4)
    objc_msgSend(MEMORY[0x1E0C9DD90], "loadArchive:", *MEMORY[0x1E0C9E2A0]);
  if (MGGetBoolAnswer())
  {
    if (a3 == 2)
    {
      v5 = NSSelectorFromString(CFSTR("prewarm:"));
      v6 = (void *)objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", CFSTR("CIPortraitEffectLightV2"));
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v6, "performSelector:withObject:", v5, 0);
    }
    else if (a3 == 1)
    {
      +[BWCoreImageFilterRenderer _prewarmCoreImagePortraitFilterV1]();
    }
  }
}

+ (void)_prewarmCoreImagePortraitFilterV1
{
  uint64_t v0;
  void *v1;
  _DWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const __CFDictionary *v6;
  const __CFAllocator *v7;
  const __CFDictionary *v8;
  CMTimeEpoch epoch;
  const __CFString *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  BWCoreImageFilterRendererParameters *v23;
  BWCoreImageFilterRendererParameters *v24;
  void *contexta[2];
  void *context;
  _QWORD v27[5];
  _QWORD v28[5];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef v34;
  CVPixelBufferRef imageBuffer;
  CVPixelBufferRef v36;
  CVPixelBufferRef pixelBufferOut;
  CFTypeRef cf;
  CMSampleBufferRef sampleBufferOut;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  CMSampleTimingInfo sampleTiming;
  _QWORD v48[6];
  _QWORD v49[8];

  v49[6] = *MEMORY[0x1E0C80C00];
  v0 = objc_opt_self();
  v1 = (void *)MEMORY[0x1A858DD40](v0);
  v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  cf = 0;
  sampleBufferOut = 0;
  v36 = 0;
  pixelBufferOut = 0;
  v34 = 0;
  imageBuffer = 0;
  formatDescriptionOut = 0;
  v3 = *MEMORY[0x1E0CA8FF0];
  v48[0] = *MEMORY[0x1E0CA8F80];
  v48[1] = v3;
  v49[0] = &unk_1E49FB0D0;
  v49[1] = MEMORY[0x1E0C9AA70];
  v48[2] = *MEMORY[0x1E0CA90E0];
  v49[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1024);
  v48[3] = *MEMORY[0x1E0CA8FD8];
  v49[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 768);
  v48[4] = *MEMORY[0x1E0CA9040];
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 875704422);
  v48[5] = *MEMORY[0x1E0CA8CE8];
  v5 = *MEMORY[0x1E0CA8D00];
  v49[4] = v4;
  v49[5] = v5;
  v6 = (const __CFDictionary *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v49, v48, 6);
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (CVPixelBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0x400uLL, 0x300uLL, 0x34323066u, v6, &pixelBufferOut))
    goto LABEL_39;
  v8 = +[BWVideoFormat pixelBufferAttachmentsForColorSpaceProperties:](BWVideoFormat, "pixelBufferAttachmentsForColorSpaceProperties:", 3);
  CVBufferSetAttachments(pixelBufferOut, v8, kCVAttachmentMode_ShouldPropagate);
  if (CMVideoFormatDescriptionCreateForImageBuffer(v7, pixelBufferOut, &formatDescriptionOut))
    goto LABEL_39;
  if (CVPixelBufferCreate(v7, 0x280uLL, 0x1E0uLL, 0x68646973u, 0, &imageBuffer))
    goto LABEL_39;
  if (CVPixelBufferCreate(v7, 0x280uLL, 0x1E0uLL, 0x4C303038u, 0, &v36))
    goto LABEL_39;
  *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x1E0CA2E18];
  *(_OWORD *)contexta = *(_OWORD *)&sampleTiming.duration.value;
  sampleTiming.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
  epoch = sampleTiming.duration.epoch;
  CMTimeMake(&sampleTiming.presentationTimeStamp, 0x858A8CD5B3FDLL, 1000000000);
  *(_OWORD *)&sampleTiming.decodeTimeStamp.value = *(_OWORD *)contexta;
  sampleTiming.decodeTimeStamp.epoch = epoch;
  if (CMSampleBufferCreateForImageBuffer(v7, pixelBufferOut, 1u, 0, 0, formatDescriptionOut, &sampleTiming, &sampleBufferOut))
  {
    goto LABEL_39;
  }
  CMSetAttachment(sampleBufferOut, CFSTR("PortraitStillImageFaceAdjustedBlurMap"), v36, 1u);
  v10 = (const __CFString *)*MEMORY[0x1E0D086F0];
  v11 = *MEMORY[0x1E0D08428];
  v45 = *MEMORY[0x1E0D08428];
  v46 = &unk_1E49FB0E8;
  CMSetAttachment(sampleBufferOut, v10, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1), 1u);
  if (formatDescriptionOut)
  {
    CFRelease(formatDescriptionOut);
    formatDescriptionOut = 0;
  }
  if (CMVideoFormatDescriptionCreateForImageBuffer(v7, imageBuffer, &formatDescriptionOut)
    || CMSampleBufferCreateForImageBuffer(v7, imageBuffer, 1u, 0, 0, formatDescriptionOut, &sampleTiming, &v34))
  {
    goto LABEL_39;
  }
  BWSampleBufferSetAttachedMedia(sampleBufferOut, (uint64_t)CFSTR("Depth"), (uint64_t)v34);
  if (formatDescriptionOut)
  {
    CFRelease(formatDescriptionOut);
    formatDescriptionOut = 0;
  }
  v44 = &unk_1E4A04740;
  CMSetAttachment(sampleBufferOut, CFSTR("PortraitFacesLandmarksArrayForPrewarm"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v44, 1), 1u);
  if (BWCMSampleBufferCreateCopyIncludingMetadata(sampleBufferOut, (CMSampleBufferRef *)&cf))
  {
LABEL_39:
    FigDebugAssert3();
  }
  else
  {
    context = v1;
    v42 = v11;
    v43 = &unk_1E49FB118;
    CMSetAttachment(cf, v10, (CFTypeRef)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v43, &v42, 1), 1u);
    v12 = dispatch_group_create();
    v13 = -[BWCoreImageFilterRenderer initForRenderingWithDepth:context:portraitRenderQuality:hairnetEnabled:metalCommandQueue:figThreadPriority:]([BWCoreImageFilterRenderer alloc], "initForRenderingWithDepth:context:portraitRenderQuality:hairnetEnabled:metalCommandQueue:figThreadPriority:", 1, 0, 0, 0, 0, 14);
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v14 = objc_msgSend(&unk_1E4A01478, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v30;
      v17 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v30 != v16)
            objc_enumerationMutation(&unk_1E4A01478);
          v19 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * i);
          v20 = (void *)MEMORY[0x1A858DD40]();
          dispatch_group_enter(v12);
          v21 = objc_msgSend(MEMORY[0x1E0C9DDB8], "filterWithName:", v19);
          if (v21)
          {
            v22 = v21;
            v23 = [BWCoreImageFilterRendererParameters alloc];
            v40 = v22;
            v24 = -[BWCoreImageFilterRendererParameters initWithFilters:originalOutputFilter:](v23, "initWithFilters:originalOutputFilter:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1), 0);
            objc_msgSend(v13, "prepareForRenderingWithParameters:inputVideoFormat:inputMediaPropertiesByAttachedMediaKey:", v24, 0, 0);
            v28[0] = v17;
            v28[1] = 3221225472;
            v28[2] = __62__BWCoreImageFilterRenderer__prewarmCoreImagePortraitFilterV1__block_invoke;
            v28[3] = &unk_1E4924658;
            v28[4] = v12;
            -[BWCoreImageFilterRenderer _renderUsingParameters:inputPixelBuffer:inputSampleBuffer:originalPixelBuffer:processedPixelBuffer:prewarming:completionHandler:]((uint64_t)v13, (uint64_t)v24, pixelBufferOut, sampleBufferOut, 0, pixelBufferOut, 1, (uint64_t)v28);
            dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
            dispatch_group_enter(v12);
            v27[0] = v17;
            v27[1] = 3221225472;
            v27[2] = __62__BWCoreImageFilterRenderer__prewarmCoreImagePortraitFilterV1__block_invoke_2;
            v27[3] = &unk_1E4924658;
            v27[4] = v12;
            -[BWCoreImageFilterRenderer _renderUsingParameters:inputPixelBuffer:inputSampleBuffer:originalPixelBuffer:processedPixelBuffer:prewarming:completionHandler:]((uint64_t)v13, (uint64_t)v24, pixelBufferOut, cf, 0, pixelBufferOut, 1, (uint64_t)v27);
            dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);

          }
          objc_autoreleasePoolPop(v20);
        }
        v15 = objc_msgSend(&unk_1E4A01478, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
      }
      while (v15);
    }

    if (v34)
      CFRelease(v34);
    v2 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (imageBuffer)
      CFRelease(imageBuffer);
    if (v36)
      CFRelease(v36);
    v1 = context;
    if (pixelBufferOut)
      CFRelease(pixelBufferOut);
    if (sampleBufferOut)
      CFRelease(sampleBufferOut);
    if (cf)
      CFRelease(cf);
  }
  objc_autoreleasePoolPop(v1);
  if (*v2 == 1)
    kdebug_trace();
}

void __62__BWCoreImageFilterRenderer__prewarmCoreImagePortraitFilterV1__block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

- (void)_renderUsingParameters:(const void *)a3 inputPixelBuffer:(const void *)a4 inputSampleBuffer:(const void *)a5 originalPixelBuffer:(const void *)a6 processedPixelBuffer:(char)a7 prewarming:(uint64_t)a8 completionHandler:
{
  NSObject *v16;
  _QWORD block[11];
  char v18;

  if (a1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (a3)
        CFRetain(a3);
      if (a4)
        CFRetain(a4);
      if (a5)
        CFRetain(a5);
      if (a6)
        CFRetain(a6);
      v16 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke;
      block[3] = &unk_1E49246A8;
      block[4] = a1;
      block[5] = a2;
      block[6] = a8;
      block[7] = a3;
      v18 = a7;
      block[8] = a4;
      block[9] = a5;
      block[10] = a6;
      dispatch_async(v16, block);
    }
    else
    {
      FigDebugAssert3();
    }
  }
}

void __62__BWCoreImageFilterRenderer__prewarmCoreImagePortraitFilterV1__block_invoke_2(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

+ (id)context:(BOOL)a3 deferredPhotoProcessorEnabled:(BOOL)a4 err:(int *)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  _DWORD *v8;
  uint64_t v9;
  unsigned int *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  int v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v6 = a4;
  v7 = a3;
  v20[4] = *MEMORY[0x1E0C80C00];
  v8 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (v6)
    v9 = 350;
  else
    v9 = 64;
  v10 = (unsigned int *)MEMORY[0x1E0C9E070];
  if (v7)
    v10 = (unsigned int *)MEMORY[0x1E0C9E080];
  v11 = *v10;
  v19[0] = *MEMORY[0x1E0C9DFC8];
  v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v13 = *MEMORY[0x1E0C9DF58];
  v20[0] = v12;
  v20[1] = MEMORY[0x1E0C9AAA0];
  v14 = *MEMORY[0x1E0C9DF78];
  v19[1] = v13;
  v19[2] = v14;
  v20[2] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
  v19[3] = *MEMORY[0x1E0C9DF70];
  v20[3] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[BWMemoryPool poolIdentifier](+[BWMemoryPool sharedMemoryPool](BWMemoryPool, "sharedMemoryPool"), "poolIdentifier"));
  v15 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v16 = (void *)objc_msgSend(MEMORY[0x1E0C9DD90], "contextWithOptions:", v15);
  if (v16)
    v17 = 0;
  else
    v17 = -12786;
  if (a5)
    *a5 = v17;
  if (*v8 == 1)
    kdebug_trace();
  return v16;
}

- (id)initForRenderingWithDepth:(BOOL)a3 context:(id)a4 portraitRenderQuality:(int)a5 hairnetEnabled:(BOOL)a6 metalCommandQueue:(id)a7 figThreadPriority:(unsigned int)a8
{
  BWCoreImageFilterRenderer *v13;
  BWCoreImageFilterRenderer *v14;
  float v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)BWCoreImageFilterRenderer;
  v13 = -[BWCoreImageFilterRenderer init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    v13->_metalCommandQueue = (MTLCommandQueue *)a7;
    v13->_usingDepth = a3;
    v13->_renderingQueueContext = (CIContext *)a4;
    v14->_portraitRenderQuality = a5;
    v15 = 1.0;
    if (!a5)
      v15 = 0.0;
    v14->_inputRenderQuality = v15;
    v14->_renderingQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    v14->_callbackQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bwgraph.callback.core-image", 0);
    v14->_hairnetEnabled = a6;
  }
  return v14;
}

- (void)dealloc
{
  NSObject *renderingQueue;
  objc_super v4;
  _QWORD block[5];

  renderingQueue = self->_renderingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__BWCoreImageFilterRenderer_dealloc__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(renderingQueue, block);

  self->_renderingQueue = 0;
  self->_callbackQueue = 0;
  v4.receiver = self;
  v4.super_class = (Class)BWCoreImageFilterRenderer;
  -[BWCoreImageFilterRenderer dealloc](&v4, sel_dealloc);
}

void __36__BWCoreImageFilterRenderer_dealloc__block_invoke(uint64_t a1)
{

}

- (signed)type
{
  return 4;
}

- (NSString)displayName
{
  return (NSString *)CFSTR("Core Image Renderer");
}

- (int)prepareForRenderingWithParameters:(id)a3 inputVideoFormat:(id)a4 inputMediaPropertiesByAttachedMediaKey:(id)a5
{
  NSObject *renderingQueue;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  renderingQueue = self->_renderingQueue;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __119__BWCoreImageFilterRenderer_prepareForRenderingWithParameters_inputVideoFormat_inputMediaPropertiesByAttachedMediaKey___block_invoke;
  v9[3] = &unk_1E491F1A0;
  v9[4] = self;
  v9[5] = &v10;
  dispatch_sync(renderingQueue, v9);
  LODWORD(a4) = objc_msgSend(a3, "prepareForRenderingWithInputVideoFormat:", a4);
  *((_DWORD *)v11 + 6) = (_DWORD)a4;
  _Block_object_dispose(&v10, 8);
  return (int)a4;
}

uint64_t __119__BWCoreImageFilterRenderer_prepareForRenderingWithParameters_inputVideoFormat_inputMediaPropertiesByAttachedMediaKey___block_invoke(uint64_t result)
{
  uint64_t v1;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_QWORD *)(v1 + 40))
    return objc_msgSend(*(id *)(result + 32), "setRenderingQueueContext:", +[BWCoreImageFilterRenderer context:deferredPhotoProcessorEnabled:err:](BWCoreImageFilterRenderer, "context:deferredPhotoProcessorEnabled:err:", *(unsigned __int8 *)(v1 + 8), 0, *(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24));
  return result;
}

- (void)renderUsingParameters:(id)a3 inputPixelBuffer:(__CVBuffer *)a4 inputSampleBuffer:(opaqueCMSampleBuffer *)a5 originalPixelBuffer:(__CVBuffer *)a6 processedPixelBuffer:(__CVBuffer *)a7 completionHandler:(id)a8
{
  -[BWCoreImageFilterRenderer _renderUsingParameters:inputPixelBuffer:inputSampleBuffer:originalPixelBuffer:processedPixelBuffer:prewarming:completionHandler:]((uint64_t)self, (uint64_t)a3, a4, a5, a6, a7, 0, (uint64_t)a8);
}

void __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _DWORD *v7;
  CFTypeRef v8;
  void *AuxiliaryImagePropertiesFromDepthMetadata;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int HasDetectedFaces;
  int v16;
  opaqueCMSampleBuffer *v17;
  const void *v18;
  opaqueCMSampleBuffer *v19;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  opaqueCMSampleBuffer *v21;
  opaqueCMSampleBuffer *v22;
  opaqueCMSampleBuffer *v23;
  opaqueCMSampleBuffer *v24;
  void *AttachedInference;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  void *v37;
  int v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  CGMutableImageMetadataRef Mutable;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  const __CFString *v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  CFTypeRef v52;
  void *v53;
  BOOL v54;
  _BOOL8 v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  double v59;
  double v60;
  float v61;
  float v62;
  double v63;
  double v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  _DWORD *v68;
  uint64_t v69;
  void *v70;
  double Width;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t k;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t m;
  uint64_t v82;
  uint64_t v83;
  NSObject *v84;
  const void *v85;
  const void *v86;
  const void *v87;
  const void *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  CVImageBufferRef v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  CVImageBufferRef ImageBuffer;
  CFTypeRef v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  const __CFString *v109;
  uint64_t v110;
  CFTypeRef v111;
  uint64_t v112;
  CVImageBufferRef v113;
  CVImageBufferRef v114;
  CVImageBufferRef v115;
  CVImageBufferRef v116;
  CVImageBufferRef v117;
  CGImageMetadata *cf;
  uint64_t v119;
  void *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  id obj;
  void *v125;
  uint64_t v126;
  _QWORD v127[7];
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  os_log_type_t type;
  int v145;
  _QWORD block[6];
  _BYTE v147[128];
  _BYTE v148[128];
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  CGImageMetadata *v160;
  _QWORD v161[3];
  _QWORD v162[3];
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  _BYTE v169[128];
  _BYTE v170[128];
  float v171[6];
  _QWORD v172[16];
  uint64_t v173;
  _QWORD v174[4];

  v174[1] = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "renderingQueueContext");
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  if (v3)
  {
    v4 = (void *)objc_msgSend(v3, "commandBuffer");
    objc_msgSend(v4, "commit");
    objc_msgSend(v4, "waitUntilCompleted");
  }
  obj = (id)objc_msgSend(*(id *)(a1 + 40), "filters");
  if (!objc_msgSend(obj, "count"))
  {
    v13 = *(_QWORD *)(a1 + 48);
    if (v13)
    {
      v14 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke_2;
      block[3] = &unk_1E4922E60;
      block[4] = v13;
      block[5] = 0;
      dispatch_async(v14, block);
    }
    return;
  }
  v112 = *MEMORY[0x1E0C9E0F8];
  v173 = *MEMORY[0x1E0C9E0F8];
  v174[0] = MEMORY[0x1E0C9AAB0];
  v5 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v174, &v173, 1);
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", *(_QWORD *)(a1 + 56), v5);
  v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  if (objc_msgSend(*(id *)(a1 + 40), "requiresDepthMap"))
  {
    v125 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), (CFStringRef)*MEMORY[0x1E0D086F0], 0);
    v8 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), CFSTR("PortraitStillImageAuxDepthMetadata"), 0);
    if (!v8 || (AuxiliaryImagePropertiesFromDepthMetadata = (void *)CFRetain(v8)) == 0)
      AuxiliaryImagePropertiesFromDepthMetadata = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromDepthMetadata(v125);
    v111 = AuxiliaryImagePropertiesFromDepthMetadata;
    v97 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), CFSTR("PortraitStillImageFaceAdjustedBlurMap"), 0);
    v103 = (uint64_t)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), CFSTR("PortraitStillImageFaceAdjustedBlurMapCIImage"), 0);
    AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), 0x1E4936818);
    if (AttachedMedia)
    {
      v11 = AttachedMedia;
      ImageBuffer = CMSampleBufferGetImageBuffer(AttachedMedia);
      v12 = (void *)CMGetAttachment(v11, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
      objc_msgSend((id)objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), CFSTR("StillSettings"), 0), "captureSettings"), "captureFlags");
      cf = FigCaptureMetadataUtilitiesCreateAuxiliaryImagePropertiesFromGainMapSampleBuffer(v12);
    }
    else
    {
      ImageBuffer = 0;
      cf = 0;
    }
    HasDetectedFaces = BWSampleBufferHasDetectedFaces(*(const void **)(a1 + 64), 0, 0, 1, 1, 1);
    v16 = HasDetectedFaces | BWSampleBufferHasDetectedHumanBodies(*(const void **)(a1 + 64));
    v17 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), (uint64_t)CFSTR("Depth"));
    if (v17)
      v92 = CMSampleBufferGetImageBuffer(v17);
    else
      v92 = 0;
    v18 = *(const void **)(a1 + 64);
    if (v16)
    {
      v19 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v18, 0x1E495AF38);
      if (v19)
        v117 = CMSampleBufferGetImageBuffer(v19);
      else
        v117 = 0;
      v21 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), (uint64_t)CFSTR("PersonSemanticsHair"));
      if (v21)
        v116 = CMSampleBufferGetImageBuffer(v21);
      else
        v116 = 0;
      v22 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), (uint64_t)CFSTR("PersonSemanticsSkin"));
      if (v22)
        v115 = CMSampleBufferGetImageBuffer(v22);
      else
        v115 = 0;
      v23 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), (uint64_t)CFSTR("PersonSemanticsTeeth"));
      if (v23)
        v114 = CMSampleBufferGetImageBuffer(v23);
      else
        v114 = 0;
      v24 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(*(const void **)(a1 + 64), (uint64_t)CFSTR("PersonSemanticsGlasses"));
      if (v24)
        v113 = CMSampleBufferGetImageBuffer(v24);
      else
        v113 = 0;
    }
    else
    {
      if (!BWInferenceGetAttachedInference(v18, 801, 0x1E4951058) || dword_1ECFE9970)
      {
        v145 = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
      }
      v113 = 0;
      v114 = 0;
      v115 = 0;
      v116 = 0;
      v117 = 0;
    }
    v119 = objc_msgSend(v125, "objectForKeyedSubscript:", *MEMORY[0x1E0D08668], v89, v90);
  }
  else
  {
    cf = 0;
    v119 = 0;
    v113 = 0;
    v114 = 0;
    v115 = 0;
    v116 = 0;
    v117 = 0;
    v92 = 0;
    ImageBuffer = 0;
    v97 = 0;
    v111 = 0;
    v125 = 0;
    v103 = 0;
  }
  v91 = (void *)v2;
  if (*v7 == 1)
  {
    kdebug_trace();
    if (*v7 == 1)
      kdebug_trace();
  }
  if (!objc_msgSend(*(id *)(a1 + 40), "requiresFaceLandmarks"))
    goto LABEL_56;
  AttachedInference = (void *)BWInferenceGetAttachedInference(*(const void **)(a1 + 64), 801, 0x1E4951058);
  if (objc_msgSend(AttachedInference, "count"))
  {
    v120 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v26 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
    v140 = 0u;
    v141 = 0u;
    v142 = 0u;
    v143 = 0u;
    v27 = objc_msgSend(AttachedInference, "countByEnumeratingWithState:objects:count:", &v140, v170, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v141;
      v30 = *MEMORY[0x1E0D05E50];
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v141 != v29)
            objc_enumerationMutation(AttachedInference);
          objc_msgSend(v120, "addObject:", -[BWCoreImageFilterRenderer _visionKitFaceObservationToCoreImageDictionary:orientation:](*(_QWORD *)(a1 + 32), *(void **)(*((_QWORD *)&v140 + 1) + 8 * i), objc_msgSend(v26, "objectForKeyedSubscript:", v30)));
        }
        v28 = objc_msgSend(AttachedInference, "countByEnumeratingWithState:objects:count:", &v140, v170, 16);
      }
      while (v28);
      v7 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    }
    goto LABEL_57;
  }
  if (*(_BYTE *)(a1 + 88))
    v120 = (void *)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), CFSTR("PortraitFacesLandmarksArrayForPrewarm"), 0);
  else
LABEL_56:
    v120 = 0;
LABEL_57:
  if (*v7 == 1)
  {
    kdebug_trace();
    if (*v7 == 1)
      kdebug_trace();
  }
  v32 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v172[0] = 0;
  v122 = objc_msgSend(*(id *)(a1 + 40), "originalOutputFilter");
  v136 = 0u;
  v137 = 0u;
  v138 = 0u;
  v139 = 0u;
  v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v169, 16);
  if (v123)
  {
    v33 = 0;
    v101 = 0;
    v102 = 0;
    v99 = 0;
    v100 = 0;
    v104 = 0;
    v98 = 0;
    v110 = 0;
    v121 = *(_QWORD *)v137;
    v34 = *MEMORY[0x1E0C9E1F8];
    v95 = *MEMORY[0x1E0C9E110];
    v93 = *MEMORY[0x1E0CBC6D0];
    v94 = *MEMORY[0x1E0C9E140];
    v109 = (const __CFString *)*MEMORY[0x1E0D087A0];
    v107 = *MEMORY[0x1E0D08480];
    v108 = *MEMORY[0x1E0D08428];
    v105 = *MEMORY[0x1E0D08360];
    v106 = *MEMORY[0x1E0C9E268];
    while (1)
    {
      for (j = 0; j != v123; ++j)
      {
        if (*(_QWORD *)v137 != v121)
          objc_enumerationMutation(obj);
        v36 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * j);
        objc_msgSend(v36, "setValue:forKey:", v6, v34);
        objc_msgSend(v32, "addObject:", v34);
        v37 = (void *)objc_msgSend(v36, "inputKeys");
        if (objc_msgSend(*(id *)(a1 + 40), "requiresDepthMap"))
        {
          v38 = objc_msgSend(*(id *)(a1 + 40), "depthTypeForFilter:", v36);
          if (v38 == 1)
          {
            if (!v103)
            {
              v163 = v112;
              v164 = MEMORY[0x1E0C9AAB0];
              v40 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v97, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v164, &v163, 1));
              v41 = v40;
              v39 = CFSTR("inputDepthMap");
              goto LABEL_79;
            }
            v39 = CFSTR("inputDepthMap");
          }
          else
          {
            if (v38 != 2)
            {
              if (v38 == 3)
              {
                if (v103)
                {
                  v39 = CFSTR("inputBlurMap");
                  goto LABEL_80;
                }
                v167 = v112;
                v168 = MEMORY[0x1E0C9AAB0];
                v40 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v97, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1));
                v41 = v40;
                v39 = CFSTR("inputBlurMap");
LABEL_79:
                v103 = v40;
                if (v41)
                  goto LABEL_80;
              }
LABEL_81:
              if (objc_msgSend(v37, "containsObject:", CFSTR("inputGainMap")))
              {
                Mutable = cf;
                if (!cf)
                  Mutable = CGImageMetadataCreateMutable();
                cf = Mutable;
                v43 = v110;
                if (!v110)
                {
                  v44 = (void *)MEMORY[0x1E0C9DDC8];
                  v162[0] = MEMORY[0x1E0C9AAB0];
                  v161[0] = v112;
                  v161[1] = v95;
                  v162[1] = objc_msgSend(MEMORY[0x1E0C99E38], "null");
                  v161[2] = v94;
                  v159 = v93;
                  v160 = cf;
                  v162[2] = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1);
                  v43 = objc_msgSend(v44, "imageWithCVPixelBuffer:options:", ImageBuffer, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v162, v161, 3));
                }
                v110 = v43;
                objc_msgSend(v36, "setValue:forKey:", v43, CFSTR("inputGainMap"));
                objc_msgSend(v32, "addObject:", CFSTR("inputGainMap"));
              }
              if (v117
                && ((objc_msgSend(v37, "containsObject:", CFSTR("inputMatte")) & 1) != 0
                 || objc_msgSend(v37, "containsObject:", CFSTR("inputMatteImage"))))
              {
                v45 = v104;
                if (!v104)
                {
                  v157 = v112;
                  v158 = MEMORY[0x1E0C9AAB0];
                  v45 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v117, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v158, &v157, 1));
                }
                v46 = CFSTR("inputMatte");
                if (!objc_msgSend(v37, "containsObject:", CFSTR("inputMatte")))
                  v46 = CFSTR("inputMatteImage");
                v104 = v45;
                objc_msgSend(v36, "setValue:forKey:", v45, v46);
                objc_msgSend(v32, "addObject:", v46);
              }
              if (v116 && objc_msgSend(v37, "containsObject:", CFSTR("inputHairMask")))
              {
                v47 = v99;
                if (!v99)
                {
                  v155 = v112;
                  v156 = MEMORY[0x1E0C9AAB0];
                  v47 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v116, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1));
                }
                v99 = v47;
                objc_msgSend(v36, "setValue:forKey:", v47, CFSTR("inputHairMask"));
                objc_msgSend(v32, "addObject:", CFSTR("inputHairMask"));
              }
              v48 = (void *)objc_msgSend((id)objc_msgSend((id)CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), CFSTR("StillSettings"), 0), "requestedSettings"), "processedImageFilters");
              if (BWCIFilterArrayContainsPortraitEffectStageFilters(v48, 0)
                && objc_msgSend(v37, "containsObject:", CFSTR("inputBestHairQuality")))
              {
                objc_msgSend(v36, "setValue:forKey:", MEMORY[0x1E0C9AAA0], CFSTR("inputBestHairQuality"));
                objc_msgSend(v32, "addObject:", CFSTR("inputBestHairQuality"));
              }
              if (v115 && objc_msgSend(v37, "containsObject:", CFSTR("inputFaceMask")))
              {
                v49 = v100;
                if (!v100)
                {
                  v153 = v112;
                  v154 = MEMORY[0x1E0C9AAB0];
                  v49 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v115, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1));
                }
                v100 = v49;
                objc_msgSend(v36, "setValue:forKey:", v49, CFSTR("inputFaceMask"));
                objc_msgSend(v32, "addObject:", CFSTR("inputFaceMask"));
              }
              if (v114 && objc_msgSend(v37, "containsObject:", CFSTR("inputTeethMask")))
              {
                v50 = v101;
                if (!v101)
                {
                  v151 = v112;
                  v152 = MEMORY[0x1E0C9AAB0];
                  v50 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v114, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1));
                }
                v101 = v50;
                objc_msgSend(v36, "setValue:forKey:", v50, CFSTR("inputTeethMask"));
                objc_msgSend(v32, "addObject:", CFSTR("inputTeethMask"));
              }
              if (v113 && objc_msgSend(v37, "containsObject:", CFSTR("inputGlassesMask")))
              {
                v51 = v102;
                if (!v102)
                {
                  v149 = v112;
                  v150 = MEMORY[0x1E0C9AAB0];
                  v51 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v113, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v150, &v149, 1));
                }
                v102 = v51;
                objc_msgSend(v36, "setValue:forKey:", v51, CFSTR("inputTeethMask"));
                objc_msgSend(v32, "addObject:", CFSTR("inputTeethMask"));
              }
              if (v119 && objc_msgSend(v37, "containsObject:", CFSTR("inputStrength")))
              {
                objc_msgSend(v36, "setValue:forKey:", v119, CFSTR("inputStrength"));
                objc_msgSend(v32, "addObject:", CFSTR("inputStrength"));
              }
              v52 = CMGetAttachment(*(CMAttachmentBearerRef *)(a1 + 64), v109, 0);
              if (objc_msgSend(v37, "containsObject:", CFSTR("inputLumaNoiseScale")))
              {
                if (v52)
                  v53 = (void *)v52;
                else
                  v53 = &unk_1E4A02EF0;
                objc_msgSend(v36, "setValue:forKey:", v53, CFSTR("inputLumaNoiseScale"));
                objc_msgSend(v32, "addObject:", CFSTR("inputLumaNoiseScale"));
              }
              goto LABEL_126;
            }
            if (v98)
            {
              v39 = CFSTR("inputDisparity");
              goto LABEL_80;
            }
            v165 = v112;
            v166 = MEMORY[0x1E0C9AAB0];
            v39 = CFSTR("inputDisparity");
            v98 = objc_msgSend(MEMORY[0x1E0C9DDC8], "imageWithCVPixelBuffer:options:", v92, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v166, &v165, 1));
            if (!v98)
              goto LABEL_81;
          }
LABEL_80:
          objc_msgSend(v36, "setValue:forKey:");
          objc_msgSend(v32, "addObject:", v39);
          goto LABEL_81;
        }
LABEL_126:
        if (objc_msgSend(v37, "containsObject:", CFSTR("inputFaceLandmarkArray")))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("face landmarks (%lu faces)"), objc_msgSend(v120, "count"));
          objc_msgSend(v36, "setValue:forKey:", v120, CFSTR("inputFaceLandmarkArray"));
          objc_msgSend(v32, "addObject:", CFSTR("inputFaceLandmarkArray"));
        }
        if (objc_msgSend(v37, "containsObject:", CFSTR("inputUseAbsoluteDisparity")))
        {
          v54 = objc_msgSend((id)objc_msgSend(v125, "objectForKeyedSubscript:", v108), "intValue") == 1;
          v55 = v54;
          v56 = "relative";
          if (v54)
            v56 = "absolute";
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s disparity"), v56);
          objc_msgSend(v36, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v55), CFSTR("inputUseAbsoluteDisparity"));
          objc_msgSend(v32, "addObject:", CFSTR("inputUseAbsoluteDisparity"));
        }
        if (objc_msgSend(v37, "containsObject:", CFSTR("inputDepthDataScore")))
        {
          v57 = objc_msgSend(v125, "objectForKeyedSubscript:", v107);
          if (v57)
          {
            v58 = v57;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("portrait score %@"), v57);
            objc_msgSend(v36, "setValue:forKey:", v58, CFSTR("inputDepthDataScore"));
            objc_msgSend(v32, "addObject:", CFSTR("inputDepthDataScore"));
          }
        }
        if (objc_msgSend(v37, "containsObject:", CFSTR("inputFocalLengthNormalized")))
        {
          v171[0] = 0.0;
          FigDepthComputeNormalizedFocalLength(v125, v171);
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("normalized focal length %.2f"), v171[0]);
          *(float *)&v59 = v171[0];
          objc_msgSend(v36, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v59), CFSTR("inputFocalLengthNormalized"));
          objc_msgSend(v32, "addObject:", CFSTR("inputFocalLengthNormalized"));
        }
        if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 12) == 2)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("input scale %.2f"), 0x3FE0000000000000);
          LODWORD(v60) = 0.5;
          objc_msgSend(v36, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v60), v106);
          objc_msgSend(v32, "addObject:", v106);
        }
        if (objc_msgSend(v37, "containsObject:", CFSTR("inputAperture")))
        {
          objc_msgSend((id)objc_msgSend(v125, "objectForKeyedSubscript:", v105), "floatValue");
          v62 = v61;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("input aperture %.2f"), v61);
          *(float *)&v63 = v62;
          objc_msgSend(v36, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v63), CFSTR("inputAperture"));
          objc_msgSend(v32, "addObject:", CFSTR("inputAperture"));
        }
        if (objc_msgSend(v37, "containsObject:", CFSTR("inputRenderProxy")))
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("input render quality %.2f"), *(float *)(*(_QWORD *)(a1 + 32) + 16));
          LODWORD(v64) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16);
          objc_msgSend(v36, "setValue:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v64), CFSTR("inputRenderProxy"));
          objc_msgSend(v32, "addObject:", CFSTR("inputRenderProxy"));
        }
        if (objc_msgSend(v37, "containsObject:", CFSTR("inputAuxDataMetadata")))
        {
          objc_msgSend(v36, "setValue:forKey:", v111, CFSTR("inputAuxDataMetadata"));
          objc_msgSend(v32, "addObject:", CFSTR("inputAuxDataMetadata"));
        }
        v65 = *(_QWORD *)(a1 + 32);
        if (*(_BYTE *)(v65 + 56))
        {
          v66 = *(_DWORD *)(v65 + 12);
          if (objc_msgSend(v37, "containsObject:", CFSTR("inputGenerateSpillMatte")) && !v66)
          {
            objc_msgSend(v36, "setValue:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("inputGenerateSpillMatte"));
            objc_msgSend(v32, "addObject:", CFSTR("inputGenerateSpillMatte"));
          }
        }
        else
        {
          objc_msgSend(v37, "containsObject:", CFSTR("inputGenerateSpillMatte"));
        }
        v67 = objc_msgSend(v36, "outputImage");
        v6 = (void *)v67;
        if ((void *)v122 == v36)
          v33 = v67;
      }
      v123 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v169, 16);
      if (!v123)
        goto LABEL_156;
    }
  }
  v6 = 0;
  v33 = 0;
LABEL_156:
  v68 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0] == 1)
  {
    kdebug_trace();
    if (*v68 == 1)
      kdebug_trace();
  }
  v69 = 0;
  if (*(_QWORD *)(a1 + 72) && v33)
  {
    objc_msgSend(v91, "render:toCVPixelBuffer:", v33);
    v69 = 1;
  }
  if (*(_QWORD *)(a1 + 80) && v6)
  {
    v70 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9DDE8]), "initWithPixelBuffer:", *(_QWORD *)(a1 + 80));
    if (*(_BYTE *)(a1 + 88))
    {
      objc_msgSend(v6, "extent");
      objc_msgSend(v91, "prepareRender:fromRect:toDestination:atPoint:error:", v6, v70, v172);
    }
    else
    {
      Width = (double)CVPixelBufferGetWidth(*(CVPixelBufferRef *)(a1 + 80));
      v72 = (void *)objc_msgSend(v91, "startTaskToRender:fromRect:toDestination:atPoint:error:", v6, v70, v172, 0.0, 0.0, Width, (double)CVPixelBufferGetHeight(*(CVPixelBufferRef *)(a1 + 80)), 0.0, 0.0);
      if (!v172[0])
        objc_msgSend(v72, "waitUntilCompletedAndReturnError:", v172);
    }

    v69 |= 2uLL;
  }
  v126 = v69;
  if (*v68 == 1)
  {
    kdebug_trace();
    if (*v68 == 1)
      kdebug_trace();
  }
  v134 = 0u;
  v135 = 0u;
  v133 = 0u;
  v132 = 0u;
  v73 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v148, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v133;
    do
    {
      for (k = 0; k != v74; ++k)
      {
        if (*(_QWORD *)v133 != v75)
          objc_enumerationMutation(obj);
        v77 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * k);
        v128 = 0u;
        v129 = 0u;
        v130 = 0u;
        v131 = 0u;
        v78 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v128, v147, 16);
        if (v78)
        {
          v79 = v78;
          v80 = *(_QWORD *)v129;
          do
          {
            for (m = 0; m != v79; ++m)
            {
              if (*(_QWORD *)v129 != v80)
                objc_enumerationMutation(v32);
              v82 = *(_QWORD *)(*((_QWORD *)&v128 + 1) + 8 * m);
              if (objc_msgSend((id)objc_msgSend(v77, "inputKeys"), "containsObject:", v82))
                objc_msgSend(v77, "setValue:forKey:", 0, v82);
            }
            v79 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v128, v147, 16);
          }
          while (v79);
        }
      }
      v74 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v132, v148, 16);
    }
    while (v74);
  }
  if (*MEMORY[0x1E0CA1FC0] == 1)
    kdebug_trace();
  v83 = *(_QWORD *)(a1 + 48);
  if (v83)
  {
    v84 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
    v127[0] = MEMORY[0x1E0C809B0];
    v127[1] = 3221225472;
    v127[2] = __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke_773;
    v127[3] = &unk_1E4924680;
    v127[5] = v83;
    v127[6] = v126;
    v127[4] = v172[0];
    dispatch_async(v84, v127);
  }
  if (cf)
    CFRelease(cf);
  if (v111)
    CFRelease(v111);
  v85 = *(const void **)(a1 + 56);
  if (v85)
    CFRelease(v85);
  v86 = *(const void **)(a1 + 64);
  if (v86)
    CFRelease(v86);
  v87 = *(const void **)(a1 + 72);
  if (v87)
    CFRelease(v87);
  v88 = *(const void **)(a1 + 80);
  if (v88)
    CFRelease(v88);
}

uint64_t __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0);
}

- (void)_visionKitFaceObservationToCoreImageDictionary:(uint64_t)a3 orientation:
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __CFDictionary *Mutable;
  CFNumberRef v16;
  CFNumberRef v17;
  CFNumberRef v18;
  CFNumberRef v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t valuePtr;

  if (!a1)
    return 0;
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 20);
  objc_msgSend(a2, "boundingBox");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  valuePtr = v8;
  v16 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("x"), v16);
  CFRelease(v16);
  valuePtr = v10;
  v17 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("y"), v17);
  CFRelease(v17);
  valuePtr = v12;
  v18 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("w"), v18);
  CFRelease(v18);
  valuePtr = v14;
  v19 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("h"), v19);
  CFRelease(v19);
  objc_msgSend(v6, "setObject:forKeyedSubscript:", Mutable, CFSTR("faceBoundingBox"));

  objc_msgSend(v6, "setObject:forKeyedSubscript:", a3, CFSTR("orientation"));
  v20 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "faceJunkinessIndex");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(v20, "numberWithFloat:"), CFSTR("faceJunkinessIndex"));
  v21 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(a2, "faceOrientationIndex");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(v21, "numberWithFloat:"), CFSTR("faceOrientationIndex"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a2, "yaw"), CFSTR("yaw"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a2, "roll"), CFSTR("roll"));
  v22 = (void *)objc_msgSend(a2, "landmarks");
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "allPoints")), CFSTR("allPoints"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "faceContour")), CFSTR("faceContour"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "leftEye")), CFSTR("leftEye"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "rightEye")), CFSTR("rightEye"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "leftEyebrow")), CFSTR("leftEyebrow"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "rightEyebrow")), CFSTR("rightEyebrow"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "nose")), CFSTR("nose"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "noseCrest")), CFSTR("noseCrest"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "medianLine")), CFSTR("medianLips"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "outerLips")), CFSTR("outerLips"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "innerLips")), CFSTR("innerLips"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "leftPupil")), CFSTR("leftPupil"));
  objc_msgSend(v6, "setObject:forKeyedSubscript:", -[BWCoreImageFilterRenderer coreImageArrayRepresentationForRegion:](a1, (void *)objc_msgSend(v22, "rightPupil")), CFSTR("rightPupil"));
  return v6;
}

uint64_t __157__BWCoreImageFilterRenderer__renderUsingParameters_inputPixelBuffer_inputSampleBuffer_originalPixelBuffer_processedPixelBuffer_prewarming_completionHandler___block_invoke_773(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[5] + 16))(a1[5], a1[6], a1[4]);
}

- (BOOL)supportsAnimation
{
  return 0;
}

- (BOOL)adjustsMetadata
{
  return 0;
}

- (void)coreImageArrayRepresentationForRegion:(uint64_t)a1
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t *v7;
  const CFDictionaryKeyCallBacks *v8;
  const CFDictionaryValueCallBacks *v9;
  uint64_t v10;
  uint64_t v11;
  __CFDictionary *Mutable;
  CFNumberRef v13;
  CFNumberRef v14;
  uint64_t valuePtr;

  if (!a1)
    return 0;
  if (!a2 || (v3 = objc_msgSend(a2, "pointCount"), v4 = objc_msgSend(a2, "normalizedPoints"), !v3) || (v5 = v4) == 0)
  {
    FigDebugAssert3();
    return 0;
  }
  v6 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v3);
  v7 = (uint64_t *)(v5 + 8);
  v8 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9B390];
  v9 = (const CFDictionaryValueCallBacks *)MEMORY[0x1E0C9B3A0];
  do
  {
    v10 = *(v7 - 1);
    v11 = *v7;
    Mutable = CFDictionaryCreateMutable(0, 0, v8, v9);
    valuePtr = v10;
    v13 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
    CFDictionarySetValue(Mutable, CFSTR("x"), v13);
    CFRelease(v13);
    valuePtr = v11;
    v14 = CFNumberCreate(0, kCFNumberDoubleType, &valuePtr);
    CFDictionarySetValue(Mutable, CFSTR("y"), v14);
    CFRelease(v14);
    objc_msgSend(v6, "addObject:", Mutable);

    v7 += 2;
    --v3;
  }
  while (v3);
  return v6;
}

- (CIContext)renderingQueueContext
{
  return self->_renderingQueueContext;
}

- (void)setRenderingQueueContext:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 40);
}

- (BOOL)usingDepth
{
  return self->_usingDepth;
}

@end
