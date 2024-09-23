@implementation AVCustomVideoCompositorSession

+ (AVCustomVideoCompositorSession)sessionWithVideoComposition:(id)a3 recyclingSession:(id)a4
{
  if (!a4)
    return -[AVCustomVideoCompositorSession initWithVideoComposition:]([AVCustomVideoCompositorSession alloc], "initWithVideoComposition:", a3);
  if (!objc_msgSend(a4, "customVideoCompositor"))
    return -[AVCustomVideoCompositorSession initWithVideoComposition:]([AVCustomVideoCompositorSession alloc], "initWithVideoComposition:", a3);
  objc_msgSend(a4, "customVideoCompositor");
  objc_msgSend(a3, "customVideoCompositorClass");
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return -[AVCustomVideoCompositorSession initWithVideoComposition:]([AVCustomVideoCompositorSession alloc], "initWithVideoComposition:", a3);
  objc_msgSend(a4, "setVideoComposition:", a3);
  return (AVCustomVideoCompositorSession *)a4;
}

+ (BOOL)_colorPropertiesAreSetInVideoComposition:(id)a3
{
  return objc_msgSend(a3, "colorPrimaries")
      || objc_msgSend(a3, "colorTransferFunction")
      || objc_msgSend(a3, "colorYCbCrMatrix") != 0;
}

- (AVCustomVideoCompositorSession)initWithVideoComposition:(id)a3
{
  AVCustomVideoCompositorSession *v4;
  AVVideoComposition *v5;
  AVVideoCompositing *v6;
  const __CFAllocator *v7;
  uint64_t clientCustomCompositor_low;
  CFNumberRef v9;
  uint64_t FigBaseObject;
  uint64_t (*v11)(uint64_t, _QWORD, CFNumberRef);
  int v12;
  NSObject *v13;
  dispatch_queue_t v14;
  NSObject *v15;
  dispatch_queue_t v16;
  NSObject *v17;
  dispatch_queue_t v18;
  NSObject *v19;
  dispatch_queue_t v20;
  NSObject *v21;
  dispatch_queue_t v22;
  AVWeakReference *v23;
  uint64_t valuePtr;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)AVCustomVideoCompositorSession;
  v4 = -[AVCustomVideoCompositorSession init](&v26, sel_init);
  if (v4)
  {
    if (!a3)
      goto LABEL_19;
    v5 = (AVVideoComposition *)objc_msgSend(a3, "copy");
    v4->_videoComposition = v5;
    v6 = (AVVideoCompositing *)objc_alloc_init((Class)-[AVVideoComposition customVideoCompositorClass](v5, "customVideoCompositorClass"));
    v4->_clientCustomCompositor = v6;
    if (!v6)
      goto LABEL_19;
    v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (FigVideoCompositorCreateRemote())
      goto LABEL_19;
    clientCustomCompositor_low = LODWORD(v4->_clientCustomCompositor);
    valuePtr = clientCustomCompositor_low | (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3898], "processInfo"), "processIdentifier") << 32);
    v9 = CFNumberCreate(v7, kCFNumberSInt64Type, &valuePtr);
    FigBaseObject = FigVideoCompositorGetFigBaseObject();
    v11 = *(uint64_t (**)(uint64_t, _QWORD, CFNumberRef))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
    if (v11)
    {
      v12 = v11(FigBaseObject, *MEMORY[0x1E0CC62F8], v9);
      if (!v9)
      {
LABEL_8:
        if (!v12)
        {
          v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
          v14 = dispatch_queue_create("com.apple.avcustomvideocompositorsession.clientcustomcompositorq", v13);
          v4->_clientCustomCompositorQ = (OS_dispatch_queue *)v14;
          if (v14)
          {
            v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
            v16 = dispatch_queue_create("com.apple.avcustomvideocompositorsession.rendercontextq", v15);
            v4->_renderContextQ = (OS_dispatch_queue *)v16;
            if (v16)
            {
              v17 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
              v18 = dispatch_queue_create("com.apple.avcustomvideocompositorsession.clienterrorq", v17);
              v4->_clientErrorQ = (OS_dispatch_queue *)v18;
              if (v18)
              {
                v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                v20 = dispatch_queue_create("com.apple.avcustomvideocompositorsession.videocompositionq", v19);
                v4->_videoCompositionQ = (OS_dispatch_queue *)v20;
                if (v20)
                {
                  v21 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
                  v22 = dispatch_queue_create("com.apple.avcustomvideocompositorsession.finishedrequestq", v21);
                  v4->_finishedRequestQ = (OS_dispatch_queue *)v22;
                  if (v22)
                  {
                    v23 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v4);
                    v4->_weakSelf = v23;
                    if (v23)
                    {
                      if (!-[AVCustomVideoCompositorSession _setupFigCallbacks](v4, "_setupFigCallbacks"))
                        return v4;
                    }
                  }
                }
              }
            }
          }
        }
LABEL_19:

        return 0;
      }
    }
    else
    {
      v12 = -12782;
      if (!v9)
        goto LABEL_8;
    }
    CFRelease(v9);
    goto LABEL_8;
  }
  return v4;
}

- (id)customVideoCompositor
{
  return self->_clientCustomCompositor;
}

- (BOOL)_validateSourcePixelBufferAttributes:(id)a3 andReturnException:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  BOOL v37;

  if (a3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v16 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA9040]);
      if (v16)
      {
        v22 = (void *)v16;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!objc_msgSend(v22, "count"))
          {
            v28 = (void *)MEMORY[0x1E0C99DA0];
            v29 = *MEMORY[0x1E0C99778];
            v30 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_sourcePixelBufferAttributes, (uint64_t)CFSTR("Value of kCVPixelBufferPixelFormatTypeKey in AVVideoCompositing sourcePixelBufferAttributes must contain at least one item. (AVVideoCompositing=%p)"), v23, v24, v25, v26, v27, (uint64_t)self->_clientCustomCompositor);
            goto LABEL_14;
          }
LABEL_11:
          v36 = 0;
          v37 = 1;
          if (!a4)
            return v37;
          goto LABEL_15;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          goto LABEL_11;
        v28 = (void *)MEMORY[0x1E0C99DA0];
        v29 = *MEMORY[0x1E0C99778];
        v30 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_sourcePixelBufferAttributes, (uint64_t)CFSTR("Value of kCVPixelBufferPixelFormatTypeKey in AVVideoCompositing sourcePixelBufferAttributes must be either an NSArray or an NSNumber. (AVVideoCompositing=%p)"), v31, v32, v33, v34, v35, (uint64_t)self->_clientCustomCompositor);
      }
      else
      {
        v28 = (void *)MEMORY[0x1E0C99DA0];
        v29 = *MEMORY[0x1E0C99778];
        v30 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_sourcePixelBufferAttributes, (uint64_t)CFSTR("sourcePixelBufferAttributes must contain kCVPixelBufferPixelFormatTypeKey. (AVVideoCompositing=%p)"), v17, v18, v19, v20, v21, (uint64_t)self->_clientCustomCompositor);
      }
    }
    else
    {
      v28 = (void *)MEMORY[0x1E0C99DA0];
      v29 = *MEMORY[0x1E0C99778];
      v30 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_sourcePixelBufferAttributes, (uint64_t)CFSTR("sourcePixelBufferAttributes must be an NSDictionary. (AVVideoCompositing=%p)"), v11, v12, v13, v14, v15, (uint64_t)self->_clientCustomCompositor);
    }
  }
  else
  {
    v28 = (void *)MEMORY[0x1E0C99DA0];
    v29 = *MEMORY[0x1E0C99778];
    v30 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_sourcePixelBufferAttributes, (uint64_t)CFSTR("sourcePixelBufferAttributes must not be nil. (AVVideoCompositing=%p)"), (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self->_clientCustomCompositor);
  }
LABEL_14:
  v36 = (void *)objc_msgSend(v28, "exceptionWithName:reason:userInfo:", v29, v30, 0);
  v37 = 0;
  if (a4)
LABEL_15:
    *a4 = v36;
  return v37;
}

- (BOOL)_validateRequiredPixelBufferAttributesForRenderContext:(id)a3 andReturnException:(id *)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  BOOL v31;

  if (a3)
  {
    v10 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CA9040]);
    if (v10)
    {
      v16 = (void *)v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!objc_msgSend(v16, "count"))
        {
          v22 = (void *)MEMORY[0x1E0C99DA0];
          v23 = *MEMORY[0x1E0C99778];
          v24 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_requiredPixelBufferAttributesForRenderContext, (uint64_t)CFSTR("Value of kCVPixelBufferPixelFormatTypeKey in requiredPixelBufferAttributesForRenderContext must contain at least one item. (AVVideoCompositing=%p)"), v17, v18, v19, v20, v21, (uint64_t)self->_clientCustomCompositor);
          goto LABEL_12;
        }
LABEL_9:
        v30 = 0;
        v31 = 1;
        if (!a4)
          return v31;
        goto LABEL_13;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        goto LABEL_9;
      v22 = (void *)MEMORY[0x1E0C99DA0];
      v23 = *MEMORY[0x1E0C99778];
      v24 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_requiredPixelBufferAttributesForRenderContext, (uint64_t)CFSTR("Value of kCVPixelBufferPixelFormatTypeKey in requiredPixelBufferAttributesForRenderContext must be either an NSArray or an NSNumber. (AVVideoCompositing=%p)"), v25, v26, v27, v28, v29, (uint64_t)self->_clientCustomCompositor);
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0C99DA0];
      v23 = *MEMORY[0x1E0C99778];
      v24 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_requiredPixelBufferAttributesForRenderContext, (uint64_t)CFSTR("requiredPixelBufferAttributesForRenderContext must contain kCVPixelBufferPixelFormatTypeKey. (AVVideoCompositing=%p)"), v11, v12, v13, v14, v15, (uint64_t)self->_clientCustomCompositor);
    }
  }
  else
  {
    v22 = (void *)MEMORY[0x1E0C99DA0];
    v23 = *MEMORY[0x1E0C99778];
    v24 = AVMethodExceptionReasonWithObjectAndSelector(self->_clientCustomCompositor, sel_requiredPixelBufferAttributesForRenderContext, (uint64_t)CFSTR("requiredPixelBufferAttributesForRenderContext must not be nil. (AVVideoCompositing=%p)"), (uint64_t)a4, v4, v5, v6, v7, (uint64_t)self->_clientCustomCompositor);
  }
LABEL_12:
  v30 = (void *)objc_msgSend(v22, "exceptionWithName:reason:userInfo:", v23, v24, 0);
  v31 = 0;
  if (a4)
LABEL_13:
    *a4 = v30;
  return v31;
}

- (BOOL)commitCustomVideoCompositorPropertiesAndReturnError:(id *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t FigBaseObject;
  uint64_t (*v8)(uint64_t, _QWORD, uint64_t);
  signed int v9;
  const void *UInt32;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, _QWORD, const void *);
  void *v13;
  NSObject *renderContextQ;
  _QWORD block[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  id v29;
  uint64_t v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v29 = 0;
  v5 = -[AVVideoCompositing sourcePixelBufferAttributes](self->_clientCustomCompositor, "sourcePixelBufferAttributes");
  v6 = -[AVVideoCompositing requiredPixelBufferAttributesForRenderContext](self->_clientCustomCompositor, "requiredPixelBufferAttributesForRenderContext");
  v23 = 0;
  v24 = &v23;
  v25 = 0x3052000000;
  v26 = __Block_byref_object_copy__43;
  v27 = __Block_byref_object_dispose__43;
  v28 = 0;
  v28 = objc_msgSend((id)-[AVVideoCompositing requiredPixelBufferAttributesForRenderContext](self->_clientCustomCompositor, "requiredPixelBufferAttributesForRenderContext"), "copy");
  v17 = 0;
  v18 = &v17;
  v19 = 0x3052000000;
  v20 = __Block_byref_object_copy__43;
  v21 = __Block_byref_object_dispose__43;
  v22 = 0;
  if (!-[AVCustomVideoCompositorSession _validateSourcePixelBufferAttributes:andReturnException:](self, "_validateSourcePixelBufferAttributes:andReturnException:", v5, &v29)|| !-[AVCustomVideoCompositorSession _validateRequiredPixelBufferAttributesForRenderContext:andReturnException:](self, "_validateRequiredPixelBufferAttributesForRenderContext:andReturnException:", v6, &v29))
  {
    goto LABEL_18;
  }
  FigBaseObject = FigVideoCompositorGetFigBaseObject();
  v8 = *(uint64_t (**)(uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (!v8)
  {
    v9 = -12782;
    goto LABEL_16;
  }
  v9 = v8(FigBaseObject, *MEMORY[0x1E0CC6350], v5);
  if (v9)
  {
LABEL_16:
    v13 = (void *)AVLocalizedErrorWithUnderlyingOSStatus(v9, 0);
    goto LABEL_19;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[AVVideoCompositing canConformColorOfSourceFrames](self->_clientCustomCompositor, "canConformColorOfSourceFrames")&& !-[AVCustomVideoCompositorSession supportsHDRSourceFrames](self, "supportsHDRSourceFrames"))
  {
    -[AVCustomVideoCompositorSession supportsWideColorSourceFrames](self, "supportsWideColorSourceFrames");
  }
  UInt32 = (const void *)FigCFNumberCreateUInt32();
  v11 = FigVideoCompositorGetFigBaseObject();
  v12 = *(uint64_t (**)(uint64_t, _QWORD, const void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 56);
  if (v12)
  {
    v9 = v12(v11, *MEMORY[0x1E0CC6348], UInt32);
    if (!UInt32)
      goto LABEL_15;
    goto LABEL_14;
  }
  v9 = -12782;
  if (UInt32)
LABEL_14:
    CFRelease(UInt32);
LABEL_15:
  if (v9)
    goto LABEL_16;
  renderContextQ = self->_renderContextQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__AVCustomVideoCompositorSession_commitCustomVideoCompositorPropertiesAndReturnError___block_invoke;
  block[3] = &unk_1E3031690;
  block[4] = self;
  block[5] = &v17;
  block[6] = &v23;
  dispatch_sync(renderContextQ, block);
LABEL_18:
  v13 = 0;
LABEL_19:

  if (v29)
  {
    if (!objc_msgSend((id)objc_opt_class(), "conformsToProtocol:", &unk_1EE2F23B8))
      objc_exception_throw(v29);
    -[AVVideoCompositing customVideoCompositor:wouldHaveTriggeredException:](self->_clientCustomCompositor, "customVideoCompositor:wouldHaveTriggeredException:", self->_clientCustomCompositor, v29);
    v30 = *MEMORY[0x1E0C9AFA8];
    v31[0] = objc_msgSend(v29, "reason");
    v13 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11841, (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1));
  }
  if (a3 && v13)
    *a3 = v13;
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);
  return v13 == 0;
}

_QWORD *__86__AVCustomVideoCompositorSession_commitCustomVideoCompositorPropertiesAndReturnError___block_invoke(_QWORD *result)
{
  *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 40) = *(_QWORD *)(result[4] + 24);
  *(_QWORD *)(result[4] + 24) = *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40);
  *(_QWORD *)(*(_QWORD *)(result[6] + 8) + 40) = 0;
  return result;
}

- (void)detachVideoComposition
{
  NSObject *videoCompositionQ;
  _QWORD block[5];

  -[AVCustomVideoCompositorSession _cleanupFigCallbacks](self, "_cleanupFigCallbacks");
  videoCompositionQ = self->_videoCompositionQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AVCustomVideoCompositorSession_detachVideoComposition__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(videoCompositionQ, block);
}

void __56__AVCustomVideoCompositorSession_detachVideoComposition__block_invoke(uint64_t a1)
{

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56) = 0;
}

- (void)_willDeallocOrFinalize
{
  NSObject *renderContextQ;
  NSObject *clientErrorQ;
  NSObject *clientCustomCompositorQ;
  NSObject *videoCompositionQ;
  NSObject *finishedRequestQ;
  OpaqueFigVideoCompositor *figCustomCompositor;

  -[AVCustomVideoCompositorSession _cleanupFigCallbacks](self, "_cleanupFigCallbacks");
  renderContextQ = self->_renderContextQ;
  if (renderContextQ)
    dispatch_release(renderContextQ);
  clientErrorQ = self->_clientErrorQ;
  if (clientErrorQ)
    dispatch_release(clientErrorQ);
  clientCustomCompositorQ = self->_clientCustomCompositorQ;
  if (clientCustomCompositorQ)
    dispatch_release(clientCustomCompositorQ);
  videoCompositionQ = self->_videoCompositionQ;
  if (videoCompositionQ)
    dispatch_release(videoCompositionQ);
  finishedRequestQ = self->_finishedRequestQ;
  if (finishedRequestQ)
    dispatch_release(finishedRequestQ);
  figCustomCompositor = self->_figCustomCompositor;
  if (figCustomCompositor)
    CFRelease(figCustomCompositor);
}

- (void)dealloc
{
  objc_super v3;

  -[AVCustomVideoCompositorSession _willDeallocOrFinalize](self, "_willDeallocOrFinalize");

  v3.receiver = self;
  v3.super_class = (Class)AVCustomVideoCompositorSession;
  -[AVCustomVideoCompositorSession dealloc](&v3, sel_dealloc);
}

- (void)setVideoComposition:(id)a3
{
  NSObject *videoCompositionQ;
  _QWORD v4[6];

  videoCompositionQ = self->_videoCompositionQ;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__AVCustomVideoCompositorSession_setVideoComposition___block_invoke;
  v4[3] = &unk_1E302FCE8;
  v4[4] = a3;
  v4[5] = self;
  dispatch_sync(videoCompositionQ, v4);
}

uint64_t __54__AVCustomVideoCompositorSession_setVideoComposition___block_invoke(uint64_t result)
{
  void *v1;
  uint64_t v2;

  v1 = *(void **)(*(_QWORD *)(result + 40) + 56);
  if (*(void **)(result + 32) != v1)
  {
    v2 = result;

    result = objc_msgSend(*(id *)(v2 + 32), "copy");
    *(_QWORD *)(*(_QWORD *)(v2 + 40) + 56) = result;
    *(_BYTE *)(*(_QWORD *)(v2 + 40) + 64) = 1;
  }
  return result;
}

- (OpaqueFigVideoCompositor)_copyFigVideoCompositor
{
  OpaqueFigVideoCompositor *result;

  result = self->_figCustomCompositor;
  if (result)
    return (OpaqueFigVideoCompositor *)CFRetain(result);
  return result;
}

- (id)getAndClearClientError
{
  NSObject *clientErrorQ;
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  uint64_t v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3052000000;
  v9 = __Block_byref_object_copy__43;
  v10 = __Block_byref_object_dispose__43;
  v11 = 0;
  clientErrorQ = self->_clientErrorQ;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__AVCustomVideoCompositorSession_getAndClearClientError__block_invoke;
  v5[3] = &unk_1E302FD60;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(clientErrorQ, v5);
  v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __56__AVCustomVideoCompositorSession_getAndClearClientError__block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = *(id *)(*(_QWORD *)(a1 + 32) + 96);

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) = 0;
}

- (void)compositionFrame:(OpaqueFigVideoCompositorFrame *)a3 didFinishWithComposedPixelBuffer:(__CVBuffer *)a4
{
  NSObject *finishedRequestQ;
  _QWORD block[7];

  CFRetain(a4);
  finishedRequestQ = self->_finishedRequestQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__AVCustomVideoCompositorSession_compositionFrame_didFinishWithComposedPixelBuffer___block_invoke;
  block[3] = &unk_1E30314D8;
  block[4] = self;
  block[5] = a3;
  block[6] = a4;
  dispatch_async(finishedRequestQ, block);
}

void __84__AVCustomVideoCompositorSession_compositionFrame_didFinishWithComposedPixelBuffer___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, uint64_t, _QWORD, uint64_t);

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(void (**)(uint64_t, uint64_t, _QWORD, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v5)
    v5(v3, v2, 0, v4);
  CFRelease(*(CFTypeRef *)(a1 + 48));
}

- (void)compositionFrame:(OpaqueFigVideoCompositorFrame *)a3 didFinishWithError:(id)a4
{
  NSObject *clientErrorQ;
  uint64_t v7;
  NSObject *finishedRequestQ;
  _QWORD v9[6];
  _QWORD block[6];

  clientErrorQ = self->_clientErrorQ;
  v7 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__AVCustomVideoCompositorSession_compositionFrame_didFinishWithError___block_invoke;
  block[3] = &unk_1E302FCE8;
  block[4] = self;
  block[5] = a4;
  dispatch_sync(clientErrorQ, block);
  finishedRequestQ = self->_finishedRequestQ;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __70__AVCustomVideoCompositorSession_compositionFrame_didFinishWithError___block_invoke_2;
  v9[3] = &unk_1E302FE78;
  v9[4] = self;
  v9[5] = a3;
  dispatch_async(finishedRequestQ, v9);
}

id *__70__AVCustomVideoCompositorSession_compositionFrame_didFinishWithError___block_invoke(id *result)
{
  id *v1;

  if (!*((_QWORD *)result[4] + 12))
  {
    v1 = result;
    result = (id *)result[5];
    *((_QWORD *)v1[4] + 12) = result;
  }
  return result;
}

uint64_t __70__AVCustomVideoCompositorSession_compositionFrame_didFinishWithError___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, _QWORD);

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(result + 16) + 40);
  if (v4)
    return v4(v2, v1, 4294951116, 0);
  return result;
}

- (void)compositionFrameDidCancel:(OpaqueFigVideoCompositorFrame *)a3
{
  NSObject *finishedRequestQ;
  _QWORD v4[6];

  finishedRequestQ = self->_finishedRequestQ;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__AVCustomVideoCompositorSession_compositionFrameDidCancel___block_invoke;
  v4[3] = &unk_1E302FE78;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(finishedRequestQ, v4);
}

uint64_t __60__AVCustomVideoCompositorSession_compositionFrameDidCancel___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, _QWORD);

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  result = CMBaseObjectGetVTable();
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(result + 16) + 40);
  if (v4)
    return v4(v2, v1, 4294954788, 0);
  return result;
}

- (BOOL)supportsWideColorSourceFrames
{
  NSObject *videoCompositionQ;
  char v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__43;
  v11 = __Block_byref_object_dispose__43;
  v12 = 0;
  if (-[AVCustomVideoCompositorSession supportsHDRSourceFrames](self, "supportsHDRSourceFrames"))
    goto LABEL_3;
  videoCompositionQ = self->_videoCompositionQ;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__AVCustomVideoCompositorSession_supportsWideColorSourceFrames__block_invoke;
  v6[3] = &unk_1E302FD60;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(videoCompositionQ, v6);
  if (+[AVCustomVideoCompositorSession _colorPropertiesAreSetInVideoComposition:](AVCustomVideoCompositorSession, "_colorPropertiesAreSetInVideoComposition:", v8[5]))
  {
LABEL_3:
    v4 = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = -[AVVideoCompositing supportsWideColorSourceFrames](self->_clientCustomCompositor, "supportsWideColorSourceFrames");
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __63__AVCustomVideoCompositorSession_supportsWideColorSourceFrames__block_invoke(uint64_t a1)
{
  id result;

  result = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = result;
  return result;
}

- (BOOL)supportsHDRSourceFrames
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[AVVideoCompositing supportsHDRSourceFrames](self->_clientCustomCompositor, "supportsHDRSourceFrames");
  else
    return 0;
}

- (int)_compositionFrame:(OpaqueFigVideoCompositorFrame *)a3 atTime:(id *)a4 requiresRenderUsingSources:(id)a5 requiresSampleBuffersUsingSources:(id)a6 withInstruction:(void *)a7
{
  NSObject *videoCompositionQ;
  uint64_t v13;
  NSObject *renderContextQ;
  AVAsynchronousVideoCompositionRequest *v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  NSObject *clientCustomCompositorQ;
  int v20;
  _QWORD v22[6];
  __int128 v23;
  int64_t var3;
  _QWORD v25[8];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  uint64_t v31;
  _QWORD block[9];
  _QWORD v33[3];
  char v34;
  _QWORD v35[6];
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  uint64_t v41;

  v36 = 0;
  v37 = &v36;
  v38 = 0x3052000000;
  v39 = __Block_byref_object_copy__43;
  v40 = __Block_byref_object_dispose__43;
  v41 = 0;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x3052000000;
  v35[3] = __Block_byref_object_copy__43;
  v35[4] = __Block_byref_object_dispose__43;
  v35[5] = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v34 = 0;
  videoCompositionQ = self->_videoCompositionQ;
  v13 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke;
  block[3] = &unk_1E3035680;
  block[4] = self;
  block[5] = &v36;
  block[7] = v33;
  block[8] = a7;
  block[6] = v35;
  dispatch_sync(videoCompositionQ, block);
  v26 = 0;
  v27 = &v26;
  v28 = 0x3052000000;
  v29 = __Block_byref_object_copy__43;
  v30 = __Block_byref_object_dispose__43;
  v31 = 0;
  renderContextQ = self->_renderContextQ;
  v25[0] = v13;
  v25[1] = 3221225472;
  v25[2] = __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_2;
  v25[3] = &unk_1E3031A68;
  v25[4] = self;
  v25[5] = v33;
  v25[6] = v35;
  v25[7] = &v26;
  dispatch_sync(renderContextQ, v25);
  if (v27[5])
  {
    v15 = [AVAsynchronousVideoCompositionRequest alloc];
    v16 = v27[5];
    v17 = v37[5];
    v23 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v18 = -[AVAsynchronousVideoCompositionRequest initUsingSession:withRenderContext:compositionFrame:atTime:usingSources:instruction:withSampleBuffers:](v15, "initUsingSession:withRenderContext:compositionFrame:atTime:usingSources:instruction:withSampleBuffers:", self, v16, a3, &v23, a5, v17, a6);
    clientCustomCompositorQ = self->_clientCustomCompositorQ;
    v22[0] = v13;
    v22[1] = 3221225472;
    v22[2] = __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_4;
    v22[3] = &unk_1E302FCE8;
    v22[4] = self;
    v22[5] = v18;
    dispatch_async(clientCustomCompositorQ, v22);
    v20 = 0;
  }
  else
  {
    v20 = -12504;
  }
  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(v33, 8);
  _Block_object_dispose(v35, 8);
  _Block_object_dispose(&v36, 8);
  return v20;
}

id __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke(_QWORD *a1)
{
  id result;

  *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40) = (id)objc_msgSend(*(id *)(a1[4] + 56), "instructionForFigInstruction:", a1[8]);
  result = *(id *)(a1[4] + 56);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_BYTE *)(a1[4] + 64);
  *(_BYTE *)(a1[4] + 64) = 0;
  return result;
}

id __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_2(_QWORD *a1)
{
  void *v2;
  AVVideoCompositionRenderContext *v3;
  uint64_t v4;
  NSObject *v5;
  id result;
  _QWORD v7[6];

  v2 = *(void **)(a1[4] + 112);
  if (!v2 || *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24))
  {
    v3 = -[AVVideoCompositionRenderContext initWithFigVideoCompositor:clientRequiredPixelBufferAttributes:videoComposition:pixelBufferPool:]([AVVideoCompositionRenderContext alloc], "initWithFigVideoCompositor:clientRequiredPixelBufferAttributes:videoComposition:pixelBufferPool:", *(_QWORD *)(a1[4] + 8), *(_QWORD *)(a1[4] + 24), *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40), objc_msgSend(*(id *)(a1[4] + 112), "pixelBufferPool"));

    *(_QWORD *)(a1[4] + 112) = v3;
    v4 = a1[4];
    v5 = *(NSObject **)(v4 + 72);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_3;
    v7[3] = &unk_1E302FCE8;
    v7[4] = v4;
    v7[5] = v3;
    dispatch_async(v5, v7);
    v2 = *(void **)(a1[4] + 112);
  }
  result = v2;
  *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40) = result;
  return result;
}

uint64_t __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "renderContextChanged:", *(_QWORD *)(a1 + 40));
}

void __188__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___compositionFrame_atTime_requiresRenderUsingSources_requiresSampleBuffersUsingSources_withInstruction___block_invoke_4(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1940343FC]();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "startVideoCompositionRequest:", *(_QWORD *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (int)_customCompositorShouldAnticipateRenderingFromTime:(id *)a3 toTime:(id *)a4 andThenFromTime:(id *)a5 toTime:(id *)a6
{
  NSObject *clientCustomCompositorQ;
  _QWORD block[5];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;

  clientCustomCompositorQ = self->_clientCustomCompositorQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __167__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldAnticipateRenderingFromTime_toTime_andThenFromTime_toTime___block_invoke;
  block[3] = &unk_1E30356A8;
  block[4] = self;
  v9 = *a3;
  v10 = *a4;
  v11 = *a5;
  v12 = *a6;
  dispatch_sync(clientCustomCompositorQ, block);
  return 0;
}

void __167__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldAnticipateRenderingFromTime_toTime_andThenFromTime_toTime___block_invoke(uint64_t a1)
{
  AVVideoCompositionRenderHint *v2;
  AVVideoCompositionRenderHint *v3;
  __int128 v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = [AVVideoCompositionRenderHint alloc];
    v10 = *(_OWORD *)(a1 + 40);
    v11 = *(_QWORD *)(a1 + 56);
    v8 = *(_OWORD *)(a1 + 64);
    v9 = *(_QWORD *)(a1 + 80);
    v6 = *(_OWORD *)(a1 + 88);
    v7 = *(_QWORD *)(a1 + 104);
    v4 = *(_OWORD *)(a1 + 112);
    v5 = *(_QWORD *)(a1 + 128);
    v3 = -[AVVideoCompositionRenderHint initWithStartCompositionTime:endCompositionTime:subsequentStartCompositionTime:subsequentEndCompositionTime:](v2, "initWithStartCompositionTime:endCompositionTime:subsequentStartCompositionTime:subsequentEndCompositionTime:", &v10, &v8, &v6, &v4);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "anticipateRenderingUsingHint:", v3);

  }
}

- (int)_customCompositorShouldPrerollForRenderingFromTime:(id *)a3 toTime:(id *)a4 andThenFromTime:(id *)a5 toTime:(id *)a6 requestID:(int64_t)a7
{
  NSObject *clientCustomCompositorQ;
  _QWORD v9[6];
  $3CC8671D27C23BF42ADDB32F2B5E48AE v10;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v11;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v12;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v13;

  clientCustomCompositorQ = self->_clientCustomCompositorQ;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __177__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldPrerollForRenderingFromTime_toTime_andThenFromTime_toTime_requestID___block_invoke;
  v9[3] = &unk_1E30356D0;
  v10 = *a3;
  v11 = *a4;
  v12 = *a5;
  v13 = *a6;
  v9[4] = self;
  v9[5] = a7;
  dispatch_sync(clientCustomCompositorQ, v9);
  return 0;
}

uint64_t __177__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldPrerollForRenderingFromTime_toTime_andThenFromTime_toTime_requestID___block_invoke(uint64_t a1)
{
  AVVideoCompositionRenderHint *v2;
  AVVideoCompositionRenderHint *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t (*v8)(uint64_t, uint64_t, _QWORD);
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v2 = [AVVideoCompositionRenderHint alloc];
    v15 = *(_OWORD *)(a1 + 48);
    v16 = *(_QWORD *)(a1 + 64);
    v13 = *(_OWORD *)(a1 + 72);
    v14 = *(_QWORD *)(a1 + 88);
    v11 = *(_OWORD *)(a1 + 96);
    v12 = *(_QWORD *)(a1 + 112);
    v9 = *(_OWORD *)(a1 + 120);
    v10 = *(_QWORD *)(a1 + 136);
    v3 = -[AVVideoCompositionRenderHint initWithStartCompositionTime:endCompositionTime:subsequentStartCompositionTime:subsequentEndCompositionTime:](v2, "initWithStartCompositionTime:endCompositionTime:subsequentStartCompositionTime:subsequentEndCompositionTime:", &v15, &v13, &v11, &v9);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "prerollForRenderingUsingHint:", v3);

  }
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = *(_QWORD *)(v4 + 8);
  result = CMBaseObjectGetVTable();
  v8 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(*(_QWORD *)(result + 16) + 72);
  if (v8)
    return v8(v6, v5, 0);
  return result;
}

- (int)_customCompositorShouldCancelPendingFrames
{
  NSObject *clientCustomCompositorQ;
  _QWORD block[5];

  clientCustomCompositorQ = self->_clientCustomCompositorQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldCancelPendingFrames__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_sync(clientCustomCompositorQ, block);
  return 0;
}

uint64_t __128__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorShouldCancelPendingFrames__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "cancelAllPendingVideoCompositionRequests");
  return result;
}

- (void)_customCompositorFigPropertyDidChange
{
  NSObject *renderContextQ;
  _QWORD block[5];

  renderContextQ = self->_renderContextQ;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __123__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorFigPropertyDidChange__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(renderContextQ, block);
}

void __123__AVCustomVideoCompositorSession_AVCustomVideoCompositorSession_FigCallbackHandling___customCompositorFigPropertyDidChange__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 112);
  if (v3)
  {
    if ((objc_msgSend(v3, "hasEqualPropertiesToFigVideoCompositor:", *(_QWORD *)(v2 + 8)) & 1) == 0)
    {

      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = 0;
    }
  }
}

- (int)_setupFigCallbacks
{
  void *v3;
  OpaqueFigVideoCompositor *figCustomCompositor;
  uint64_t (*v5)(OpaqueFigVideoCompositor *, void *, void *);
  int result;

  CFRetain(self->_weakSelf);
  objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "addListenerWithWeakReference:callback:name:object:flags:", self->_weakSelf, _customCompositorPropertyChangedNotificationReceived, *MEMORY[0x1E0CC62E8], self->_figCustomCompositor, 0);
  v3 = (void *)objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "registerCallbackContextObject:", self->_weakSelf);
  self->_callbackContextToken = v3;
  figCustomCompositor = self->_figCustomCompositor;
  v5 = *(uint64_t (**)(OpaqueFigVideoCompositor *, void *, void *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                            + 48);
  if (!v5)
    return -12782;
  result = v5(figCustomCompositor, &_setupFigCallbacks_callbacks, v3);
  if (!result)
    self->_hasRegisteredFigCustomCompositorCallbacks = 1;
  return result;
}

- (void)_cleanupFigCallbacks
{
  AVWeakReference *weakSelf;
  OpaqueFigVideoCompositor *figCustomCompositor;
  void (*v5)(OpaqueFigVideoCompositor *, _QWORD, _QWORD);

  weakSelf = self->_weakSelf;
  if (weakSelf)
  {
    CFRelease(weakSelf);
    objc_msgSend(+[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter()), "removeListenerWithWeakReference:callback:name:object:", self->_weakSelf, _customCompositorPropertyChangedNotificationReceived, *MEMORY[0x1E0CC62E8], self->_figCustomCompositor);

    self->_weakSelf = 0;
  }
  if (self->_callbackContextToken)
  {
    objc_msgSend(+[AVCallbackContextRegistry sharedCallbackContextRegistry](AVCallbackContextRegistry, "sharedCallbackContextRegistry"), "unregisterCallbackContextForToken:", self->_callbackContextToken);
    self->_callbackContextToken = 0;
  }
  if (self->_hasRegisteredFigCustomCompositorCallbacks)
  {
    figCustomCompositor = self->_figCustomCompositor;
    v5 = *(void (**)(OpaqueFigVideoCompositor *, _QWORD, _QWORD))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 48);
    if (v5)
      v5(figCustomCompositor, 0, 0);
    self->_hasRegisteredFigCustomCompositorCallbacks = 0;
  }
}

@end
