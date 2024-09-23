@implementation AVAssetImageGenerator

+ (AVAssetImageGenerator)assetImageGeneratorWithAsset:(AVAsset *)asset
{
  return (AVAssetImageGenerator *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithAsset:", asset);
}

- (AVAssetImageGenerator)init
{
  return -[AVAssetImageGenerator initWithAsset:](self, "initWithAsset:", 0);
}

- (AVAssetImageGenerator)initWithAsset:(AVAsset *)asset
{
  AVAssetImageGenerator *v4;
  AVAssetImageGeneratorInternal *v5;
  AVAssetImageGeneratorInternal *priv;
  uint64_t v7;
  __int128 v8;
  int64_t v9;
  AVAssetImageGeneratorInternal *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AVAssetImageGenerator;
  v4 = -[AVAssetImageGenerator init](&v15, sel_init);
  if (v4)
  {
    if (asset && (v5 = objc_alloc_init(AVAssetImageGeneratorInternal), (v4->_priv = v5) != 0))
    {
      v4->_priv->weakReference = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v4);
      v4->_priv->asset = asset;
      v4->_priv->appliesPreferredTrackTransform = 0;
      v4->_priv->maximumSize = (CGSize)*MEMORY[0x1E0C9D820];
      v4->_priv->apertureMode = 0;
      priv = v4->_priv;
      v7 = MEMORY[0x1E0CA2E30];
      v8 = *MEMORY[0x1E0CA2E30];
      *(_OWORD *)&priv->requestedTimeToleranceBefore.value = *MEMORY[0x1E0CA2E30];
      v9 = *(_QWORD *)(v7 + 16);
      priv->requestedTimeToleranceBefore.epoch = v9;
      v10 = v4->_priv;
      *(_OWORD *)&v10->requestedTimeToleranceAfter.value = v8;
      v10->requestedTimeToleranceAfter.epoch = v9;
      v4->_priv->requests = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_priv->requestsQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.requestsqueue", v11);
      v4->_priv->nextRequestID = 0;
      v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_priv->imageRequestQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.imagerequestqueue", v12);
      v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v4->_priv->generateImagesAsyncQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avfoundation.generateimagesasyncqueue", v13);
      v4->_priv->dynamicRangePolicy = (NSString *)CFSTR("ForceSDR");
      v4->_priv->allowsProfessionalVideoWorkflowVideoDecoders = 1;
    }
    else
    {

      return 0;
    }
  }
  return v4;
}

- (void)dealloc
{
  AVAssetImageGeneratorInternal *priv;
  id v4;
  uint64_t FigBaseObject;
  uint64_t v6;
  void (*v7)(uint64_t);
  OpaqueFigAssetImageGenerator *generator;
  AVAssetImageGeneratorInternal *v9;
  NSObject *requestsQueue;
  AVAssetImageGeneratorInternal *v11;
  NSObject *imageRequestQueue;
  NSObject *generateImagesAsyncQueue;
  objc_super v14;

  priv = self->_priv;
  if (priv)
  {
    if (priv->generator)
    {
      v4 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_priv->weakReference, aig_didGenerateCGImage, *MEMORY[0x1E0CC3600], self->_priv->generator);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_priv->weakReference, aig_failedToGenerateCGImage, *MEMORY[0x1E0CC3608], self->_priv->generator);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_priv->weakReference, aig_serverDied, *MEMORY[0x1E0CC3610], self->_priv->generator);
      objc_msgSend(v4, "removeListenerWithWeakReference:callback:name:object:", self->_priv->weakReference, aig_serverDied, *MEMORY[0x1E0CA4B88], self->_priv->generator);
      CFRelease(self->_priv->weakReference);
      FigBaseObject = FigAssetImageGeneratorGetFigBaseObject();
      if (FigBaseObject)
      {
        v6 = FigBaseObject;
        v7 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
        if (v7)
          v7(v6);
      }
      priv = self->_priv;
      generator = priv->generator;
      if (generator)
      {
        CFRelease(generator);
        self->_priv->generator = 0;
        priv = self->_priv;
      }
    }

    v9 = self->_priv;
    requestsQueue = v9->requestsQueue;
    if (requestsQueue)
    {
      dispatch_release(requestsQueue);
      v9 = self->_priv;
    }

    v11 = self->_priv;
    imageRequestQueue = v11->imageRequestQueue;
    if (imageRequestQueue)
    {
      dispatch_release(imageRequestQueue);
      v11 = self->_priv;
    }
    generateImagesAsyncQueue = v11->generateImagesAsyncQueue;
    if (generateImagesAsyncQueue)
    {
      dispatch_release(generateImagesAsyncQueue);
      v11 = self->_priv;
    }

  }
  v14.receiver = self;
  v14.super_class = (Class)AVAssetImageGenerator;
  -[AVAssetImageGenerator dealloc](&v14, sel_dealloc);
}

- (AVAsset)asset
{
  return self->_priv->asset;
}

- (BOOL)_ensureFigAssetImageGeneratorAllowingSynchronousPropertyLoad:(BOOL)a3 error:(id *)a4
{
  OpaqueFigAsset *v7;
  AVAssetImageGeneratorInternal *priv;
  uint64_t v9;
  uint64_t RemoteFromAssetWithOptions;
  uint64_t v11;
  id v12;
  BOOL result;
  id v14;

  v7 = -[AVAsset _figAsset](self->_priv->asset, "_figAsset");
  -[AVAssetImageGenerator _optionsDictionary](self, "_optionsDictionary");
  priv = self->_priv;
  if (priv->generator)
    return 1;
  if (a3
    || -[AVAsset statusOfValueForKey:error:](priv->asset, "statusOfValueForKey:error:", CFSTR("streaming"), a4) == 2)
  {
    if (!v7)
      return 1;
    if (-[AVAsset _requiresInProcessOperation](self->_priv->asset, "_requiresInProcessOperation"))
    {
      if (-[AVAsset _isStreaming](self->_priv->asset, "_isStreaming"))
        v9 = FigStreamAssetImageGeneratorCreateFromAssetWithOptions();
      else
        v9 = FigAssetImageGeneratorCreateFromAssetWithOptions();
      v11 = v9;
      if (!(_DWORD)v9)
        goto LABEL_14;
    }
    else
    {
      RemoteFromAssetWithOptions = FigAssetImageGeneratorCreateRemoteFromAssetWithOptions();
      if (!(_DWORD)RemoteFromAssetWithOptions)
      {
LABEL_14:
        v14 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
        CFRetain(self->_priv->weakReference);
        objc_msgSend(v14, "addListenerWithWeakReference:callback:name:object:flags:", self->_priv->weakReference, aig_didGenerateCGImage, *MEMORY[0x1E0CC3600], self->_priv->generator, 0);
        objc_msgSend(v14, "addListenerWithWeakReference:callback:name:object:flags:", self->_priv->weakReference, aig_failedToGenerateCGImage, *MEMORY[0x1E0CC3608], self->_priv->generator, 0);
        objc_msgSend(v14, "addListenerWithWeakReference:callback:name:object:flags:", self->_priv->weakReference, aig_serverDied, *MEMORY[0x1E0CC3610], self->_priv->generator, 0);
        objc_msgSend(v14, "addListenerWithWeakReference:callback:name:object:flags:", self->_priv->weakReference, aig_serverDied, *MEMORY[0x1E0CA4B88], self->_priv->generator, 0);
        return 1;
      }
      v11 = RemoteFromAssetWithOptions;
    }
    if (a4)
    {
      v12 = -[AVAssetImageGenerator _NSErrorForError:](self, "_NSErrorForError:", v11);
      result = 0;
      *a4 = v12;
      return result;
    }
  }
  return 0;
}

- (id)_videoSettingWithSize:(CGSize)a3 bitDepth:(unsigned int)a4
{
  void *v4;
  uint64_t v7;
  CFTypeRef cf;

  cf = 0;
  v4 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", a3.width, a3.height);
  LODWORD(v7) = 0;
  if (!FPSupport_CreateDestinationPixelBufferAttributes())
    objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("AVVideoAllowWideColorKey"), v7);
  if (cf)
    CFRelease(cf);
  return v4;
}

- (id)_makeAutoreleasedAssetReader
{
  NSArray *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t MaximumBitsPerComponent;
  id v13;
  AVAssetReader *v14;
  NSArray *v15;
  id v16;
  id v17;
  AVAssetReaderVideoCompositionOutput *v18;
  void *v19;
  AVCustomVideoCompositorSession *customVideoCompositorSession;
  AVVideoComposition *v21;
  double v22;
  double v23;
  id v24;
  AVAssetReaderTrackOutput *v25;
  double v27;

  v3 = -[AVAsset tracksWithMediaType:](self->_priv->asset, "tracksWithMediaType:", CFSTR("vide"));
  if (-[AVAssetImageGenerator videoComposition](self, "videoComposition"))
  {
    -[AVVideoComposition renderSize](-[AVAssetImageGenerator videoComposition](self, "videoComposition"), "renderSize");
    v5 = v4;
    v7 = v6;
  }
  else if (-[NSArray count](v3, "count"))
  {
    objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "naturalSize");
    v5 = v22;
    v7 = v23;
    if (self->_priv->appliesPreferredTrackTransform)
    {
      v24 = -[NSArray objectAtIndex:](v3, "objectAtIndex:", 0);
      if (v24)
        objc_msgSend(v24, "preferredTransform");
      v27 = v7 * 0.0 + 0.0 * v5;
      v7 = fabs(v27);
      v5 = v7;
    }
  }
  else
  {
    v7 = 0.0;
    v5 = 0.0;
  }
  -[AVAssetImageGenerator _scaledSizeForRenderSize:](self, "_scaledSizeForRenderSize:", v5, v7);
  v9 = v8;
  v11 = v10;
  if (-[NSArray count](v3, "count")
    && objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "formatDescriptions"), "count"))
  {
    MaximumBitsPerComponent = FigExportSettings_GetMaximumBitsPerComponent();
  }
  else
  {
    MaximumBitsPerComponent = 8;
  }
  v13 = -[AVAssetImageGenerator _videoSettingWithSize:bitDepth:](self, "_videoSettingWithSize:bitDepth:", MaximumBitsPerComponent, v9, v11);
  v14 = +[AVAssetReader assetReaderWithAsset:error:](AVAssetReader, "assetReaderWithAsset:error:", self->_priv->asset, 0);
  if (v14)
  {
    if (-[AVAssetImageGenerator videoComposition](self, "videoComposition"))
    {
      v15 = -[AVAsset tracksWithMediaType:](self->_priv->asset, "tracksWithMediaType:", CFSTR("auxv"));
      v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v3);
      v17 = v16;
      if (v15)
        objc_msgSend(v16, "addObjectsFromArray:", v15);
      v18 = +[AVAssetReaderVideoCompositionOutput assetReaderVideoCompositionOutputWithVideoTracks:videoSettings:](AVAssetReaderVideoCompositionOutput, "assetReaderVideoCompositionOutputWithVideoTracks:videoSettings:", v17, v13);
      if (v18)
      {
        v19 = v18;
        customVideoCompositorSession = self->_priv->customVideoCompositorSession;
        v21 = -[AVAssetImageGenerator videoComposition](self, "videoComposition");
        if (customVideoCompositorSession)
          objc_msgSend(v19, "_setVideoComposition:customVideoCompositorSession:", v21, self->_priv->customVideoCompositorSession);
        else
          objc_msgSend(v19, "setVideoComposition:", v21);
        goto LABEL_22;
      }
    }
    else if (-[NSArray count](v3, "count"))
    {
      v25 = +[AVAssetReaderTrackOutput assetReaderTrackOutputWithTrack:outputSettings:](AVAssetReaderTrackOutput, "assetReaderTrackOutputWithTrack:outputSettings:", -[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), v13);
      if (v25)
      {
        v19 = v25;
        -[AVAssetReaderTrackOutput setAppliesPreferredTrackTransform:](v25, "setAppliesPreferredTrackTransform:", self->_priv->appliesPreferredTrackTransform);
LABEL_22:
        -[AVAssetReader addOutput:](v14, "addOutput:", v19);
      }
    }
  }
  return v14;
}

- (CGImageRef)copyCGImageAtTime:(CMTime *)requestedTime actualTime:(CMTime *)actualTime error:(NSError *)outError
{
  void *v9;
  id v10;
  __int128 v11;
  id v12;
  id v13;
  CGImageRef result;
  id v15;
  OpaqueFigAssetImageGenerator *generator;
  uint64_t (*v17)(OpaqueFigAssetImageGenerator *, __int128 *, id, uint64_t, CGImage **, CMTime *);
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  __int128 v22;
  CMTimeEpoch v23;
  CGImage *v24;
  id v25;
  __int128 v26;
  CMTimeEpoch epoch;

  v24 = 0;
  v25 = 0;
  v9 = (void *)MEMORY[0x1940343FC](self, a2);
  if (-[AVAssetImageGenerator videoComposition](self, "videoComposition")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v10 = -[AVAssetImageGenerator _makeAutoreleasedAssetReader](self, "_makeAutoreleasedAssetReader");
    v26 = *(_OWORD *)&requestedTime->value;
    epoch = requestedTime->epoch;
    v24 = -[AVAssetImageGenerator _copyCGImageAtTime:usingAssetReader:error:](self, "_copyCGImageAtTime:usingAssetReader:error:", &v26, v10, &v25);
    if (actualTime)
    {
      v11 = *(_OWORD *)&requestedTime->value;
      actualTime->epoch = requestedTime->epoch;
      *(_OWORD *)&actualTime->value = v11;
    }
  }
  else
  {
    v15 = -[AVAssetImageGenerator _optionsDictionary](self, "_optionsDictionary");
    if (!objc_msgSend(v15, "count"))
      v15 = 0;
    if (-[AVAssetImageGenerator _ensureFigAssetImageGeneratorAllowingSynchronousPropertyLoad:error:](self, "_ensureFigAssetImageGeneratorAllowingSynchronousPropertyLoad:error:", 1, &v25))
    {
      generator = self->_priv->generator;
      if (generator)
      {
        v22 = *(_OWORD *)&requestedTime->value;
        v23 = requestedTime->epoch;
        v17 = *(uint64_t (**)(OpaqueFigAssetImageGenerator *, __int128 *, id, uint64_t, CGImage **, CMTime *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
        if (v17)
        {
          v18 = *MEMORY[0x1E0C9AE00];
          v26 = v22;
          epoch = v23;
          v19 = v17(generator, &v26, v15, v18, &v24, actualTime);
          if (v24)
            goto LABEL_5;
          v20 = v19;
        }
        else
        {
          v20 = 4294954514;
        }
        v21 = -[AVAssetImageGenerator _NSErrorForError:](self, "_NSErrorForError:", v20, v22, v23);
      }
      else
      {
        v21 = (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11822, 0);
      }
      v25 = v21;
    }
  }
LABEL_5:
  v12 = v25;
  objc_autoreleasePoolPop(v9);
  v13 = v25;
  result = v24;
  if (outError)
  {
    if (!v24)
      *outError = (NSError *)v25;
  }
  return result;
}

- (void)generateCGImagesAsynchronouslyForTimes:(NSArray *)requestedTimes completionHandler:(AVAssetImageGeneratorCompletionHandler)handler
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v10;
  id v11;
  NSObject *generateImagesAsyncQueue;
  AVAsset *asset;
  uint64_t v14;
  void *v15;
  _QWORD v16[7];
  _QWORD block[7];
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  if (!handler)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), 0, v4, v5, v6, v7, (uint64_t)"handler != nil"), 0);
    objc_exception_throw(v15);
  }
  v10 = (id)-[NSArray copy](requestedTimes, "copy");
  v11 = (id)objc_msgSend(handler, "copy");
  if (-[AVAssetImageGenerator videoComposition](self, "videoComposition")
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    generateImagesAsyncQueue = self->_priv->generateImagesAsyncQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke;
    block[3] = &unk_1E3031070;
    block[4] = v10;
    block[5] = self;
    block[6] = v11;
    dispatch_async(generateImagesAsyncQueue, block);
  }
  else
  {
    asset = self->_priv->asset;
    v18[0] = CFSTR("streaming");
    v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_3;
    v16[3] = &unk_1E3031070;
    v16[4] = self;
    v16[5] = v10;
    v16[6] = v11;
    -[AVAsset loadValuesAsynchronouslyForKeys:completionHandler:](asset, "loadValuesAsynchronouslyForKeys:completionHandler:", v14, v16);
  }
}

uint64_t __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v16[7];
  int v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = *(void **)(a1 + 32);
  result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v23;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v7);
        v20 = 0uLL;
        v21 = 0;
        if (v8)
          objc_msgSend(v8, "CMTimeValue");
        v9 = objc_msgSend(*(id *)(a1 + 40), "_makeAutoreleasedAssetReader");
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
        v11 = *(_DWORD *)(v10 + 128);
        *(_DWORD *)(v10 + 128) = v11 + 1;
        v12 = *(_QWORD *)(a1 + 40);
        v13 = *(_QWORD *)(a1 + 48);
        v14 = *(_QWORD *)(v12 + 8);
        v17 = v11;
        v19 = v21;
        v15 = *(NSObject **)(v14 + 152);
        v16[0] = v6;
        v16[1] = 3221225472;
        v16[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_2;
        v16[3] = &unk_1E3031048;
        v18 = v20;
        v16[4] = v12;
        v16[5] = v9;
        v16[6] = v13;
        dispatch_async(v15, v16);
        ++v7;
      }
      while (v4 != v7);
      result = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v4 = result;
    }
    while (result);
  }
  return result;
}

void __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_2(uint64_t a1)
{
  int v2;
  _QWORD *v3;
  uint64_t v4;
  void (*v5)(uint64_t, __int128 *, _QWORD);
  uint64_t v6;
  const void *v7;
  uint64_t v8;
  void (*v9)(uint64_t, __int128 *, _QWORD);
  __int128 v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_DWORD *)(a1 + 56);
  v3 = *(_QWORD **)(a1 + 32);
  if (v2 >= *(_DWORD *)(v3[1] + 160))
  {
    v14 = 0;
    v6 = *(_QWORD *)(a1 + 40);
    v12 = *(_OWORD *)(a1 + 60);
    v13 = *(_QWORD *)(a1 + 76);
    v7 = (const void *)objc_msgSend(v3, "_copyCGImageAtTime:usingAssetReader:error:", &v12, v6, &v14);
    v8 = *(_QWORD *)(a1 + 48);
    v9 = *(void (**)(uint64_t, __int128 *, _QWORD))(v8 + 16);
    v12 = *(_OWORD *)(a1 + 60);
    v13 = *(_QWORD *)(a1 + 76);
    if (v7)
    {
      v10 = *(_OWORD *)(a1 + 60);
      v11 = *(_QWORD *)(a1 + 76);
      ((void (*)(uint64_t, __int128 *, const void *, __int128 *, _QWORD, _QWORD))v9)(v8, &v12, v7, &v10, 0, 0);
      CFRelease(v7);
    }
    else
    {
      v9(v8, &v12, 0);
    }
  }
  else
  {
    v4 = *(_QWORD *)(a1 + 48);
    v5 = *(void (**)(uint64_t, __int128 *, _QWORD))(v4 + 16);
    v12 = *(_OWORD *)(a1 + 60);
    v13 = *(_QWORD *)(a1 + 76);
    v10 = *MEMORY[0x1E0CA2E18];
    v11 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v5(v4, &v12, 0);
  }
}

__n128 __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_3(uint64_t a1)
{
  __int128 v1;
  NSObject *v2;
  __n128 result;
  _QWORD block[4];
  __int128 v5;
  uint64_t v6;

  block[0] = MEMORY[0x1E0C809B0];
  v1 = *(_OWORD *)(a1 + 32);
  v2 = *(NSObject **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 168);
  block[1] = 3221225472;
  block[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_4;
  block[3] = &unk_1E3031070;
  v5 = v1;
  v6 = *(_QWORD *)(a1 + 48);
  dispatch_async(v2, block);
  return result;
}

uint64_t __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  id obj;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  _QWORD v22[10];
  char v23;
  _QWORD block[6];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = objc_msgSend(*(id *)(a1 + 32), "_optionsDictionary");
  v29 = 0;
  v20 = objc_msgSend(*(id *)(a1 + 32), "_ensureFigAssetImageGeneratorAllowingSynchronousPropertyLoad:error:", 0, &v29);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = *(id *)(a1 + 40);
  result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (result)
  {
    v3 = result;
    v18 = *MEMORY[0x1E0CC35D8];
    v19 = *(_QWORD *)v26;
    v4 = *MEMORY[0x1E0CC35F8];
    v5 = MEMORY[0x1E0C809B0];
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(obj);
        v7 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v6);
        v8 = (void *)MEMORY[0x1E0CB37E8];
        ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 128);
        v9 = objc_msgSend(v8, "numberWithInt:");
        v10 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjectsAndKeys:", v9, CFSTR("RequestID"), v7, CFSTR("RequestedTime"), *(_QWORD *)(a1 + 48), CFSTR("CompletionHandler"), *(_QWORD *)(a1 + 32), CFSTR("Self"), 0);
        v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", v21);
        objc_msgSend(v11, "setObject:forKey:", v9, v18);
        objc_msgSend(v11, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0xFFFFFFFFLL), v4);
        v12 = *(_QWORD *)(a1 + 32);
        v13 = *(NSObject **)(*(_QWORD *)(v12 + 8) + 120);
        block[0] = v5;
        block[1] = 3221225472;
        block[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_5;
        block[3] = &unk_1E302FCE8;
        block[4] = v12;
        block[5] = v10;
        dispatch_async(v13, block);
        v14 = *(_QWORD *)(a1 + 32);
        v15 = *(NSObject **)(*(_QWORD *)(v14 + 8) + 152);
        v22[0] = v5;
        v22[1] = 3221225472;
        v22[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_6;
        v22[3] = &unk_1E3031098;
        v23 = v20;
        v22[4] = v29;
        v22[5] = v14;
        v22[6] = v7;
        v22[7] = v11;
        v16 = *(_QWORD *)(a1 + 48);
        v22[8] = v10;
        v22[9] = v16;
        dispatch_async(v15, v22);
        ++v6;
      }
      while (v3 != v6);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
      v3 = result;
    }
    while (result);
  }
  return result;
}

uint64_t __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112), "addObject:", *(_QWORD *)(a1 + 40));
}

void __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t, __int128 *, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void (*v12)(uint64_t, _QWORD *, _QWORD, __int128 *, uint64_t, uint64_t);
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  _QWORD v16[6];
  _QWORD v17[3];
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(a1 + 80))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 16);
    if (v3)
    {
      v4 = *(void **)(a1 + 48);
      if (v4)
      {
        objc_msgSend(v4, "CMTimeValue");
      }
      else
      {
        v18 = 0uLL;
        v19 = 0;
      }
      v6 = *(_QWORD *)(a1 + 56);
      v7 = *(uint64_t (**)(uint64_t, __int128 *, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                           + 16);
      if (v7)
      {
        v8 = *MEMORY[0x1E0C9AE00];
        v20 = v18;
        v21 = v19;
        v9 = v7(v3, &v20, v6, v8);
        if (!(_DWORD)v9)
          goto LABEL_13;
      }
      else
      {
        v9 = 4294954514;
      }
      v5 = objc_msgSend(*(id *)(a1 + 40), "_NSErrorForError:", v9);
    }
    else
    {
      v5 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11822, 0);
    }
    v2 = v5;
  }
LABEL_13:
  if (v2)
  {
    v10 = *(_QWORD *)(a1 + 72);
    v11 = *(void **)(a1 + 48);
    if (v11)
      objc_msgSend(v11, "CMTimeValue");
    else
      memset(v17, 0, sizeof(v17));
    v12 = *(void (**)(uint64_t, _QWORD *, _QWORD, __int128 *, uint64_t, uint64_t))(v10 + 16);
    v20 = *MEMORY[0x1E0CA2E18];
    v21 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    v12(v10, v17, 0, &v20, 1, v2);
    v13 = *(_QWORD *)(a1 + 40);
    v14 = *(NSObject **)(*(_QWORD *)(v13 + 8) + 120);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_7;
    v16[3] = &unk_1E302FCE8;
    v15 = *(_QWORD *)(a1 + 64);
    v16[4] = v13;
    v16[5] = v15;
    dispatch_async(v14, v16);
  }
}

uint64_t __82__AVAssetImageGenerator_generateCGImagesAsynchronouslyForTimes_completionHandler___block_invoke_7(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)generateCGImageAsynchronouslyForTime:(CMTime *)requestedTime completionHandler:(void *)handler
{
  uint64_t v6;
  _QWORD v7[5];
  CMTime v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v8 = *requestedTime;
  v9[0] = objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTime:", &v8);
  v6 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __80__AVAssetImageGenerator_generateCGImageAsynchronouslyForTime_completionHandler___block_invoke;
  v7[3] = &unk_1E30310C0;
  v7[4] = handler;
  -[AVAssetImageGenerator generateCGImagesAsynchronouslyForTimes:completionHandler:](self, "generateCGImagesAsynchronouslyForTimes:completionHandler:", v6, v7);
}

uint64_t __80__AVAssetImageGenerator_generateCGImageAsynchronouslyForTime_completionHandler___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, __int128 *a4, unint64_t a5, uint64_t a6)
{
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, __int128 *, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t, __int128 *, uint64_t);
  __int128 v13;
  uint64_t v14;

  if (a5 >= 2)
  {
    if (a5 == 2)
    {
      v10 = *(_QWORD *)(result + 32);
      v11 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11878, 0);
      v12 = *(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t))(v10 + 16);
      v13 = *a4;
      v14 = *((_QWORD *)a4 + 2);
      return v12(v10, a3, &v13, v11);
    }
  }
  else
  {
    v8 = *(_QWORD *)(result + 32);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, __int128 *, uint64_t))(v8 + 16);
    v13 = *a4;
    v14 = *((_QWORD *)a4 + 2);
    return v9(v8, a3, &v13, a6);
  }
  return result;
}

- (void)cancelAllCGImageGeneration
{
  OpaqueFigAssetImageGenerator *generator;
  void (*v4)(OpaqueFigAssetImageGenerator *);

  FigAtomicCompareAndSwap32();
  generator = self->_priv->generator;
  if (generator)
  {
    v4 = *(void (**)(OpaqueFigAssetImageGenerator *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 24);
    if (v4)
      v4(generator);
  }
}

- (void)setAppliesPreferredTrackTransform:(BOOL)appliesPreferredTrackTransform
{
  self->_priv->appliesPreferredTrackTransform = appliesPreferredTrackTransform;
}

- (BOOL)appliesPreferredTrackTransform
{
  return self->_priv->appliesPreferredTrackTransform;
}

- (void)setPrefersStandardDynamicRange:(BOOL)a3
{
  _BOOL4 v3;
  NSString *v5;
  __CFString *v6;

  v3 = a3;
  v5 = self->_priv->dynamicRangePolicy;
  v6 = CFSTR("MatchSource");
  if (v3)
    v6 = CFSTR("ForceSDR");
  self->_priv->dynamicRangePolicy = &v6->isa;
}

- (BOOL)prefersStandardDynamicRange
{
  return -[NSString isEqualToString:](self->_priv->dynamicRangePolicy, "isEqualToString:", CFSTR("ForceSDR"));
}

- (void)setDynamicRangePolicy:(id)a3
{
  NSString *v5;

  v5 = self->_priv->dynamicRangePolicy;
  self->_priv->dynamicRangePolicy = (NSString *)objc_msgSend(a3, "copy");
}

- (NSString)dynamicRangePolicy
{
  return self->_priv->dynamicRangePolicy;
}

- (void)setUseSWDecoderForAV1:(BOOL)a3
{
  self->_priv->useSWDecoderForAV1 = a3;
}

- (BOOL)useSWDecoderForAV1
{
  return self->_priv->useSWDecoderForAV1;
}

- (void)setMaximumSize:(CGSize)maximumSize
{
  self->_priv->maximumSize = maximumSize;
}

- (CGSize)maximumSize
{
  AVAssetImageGeneratorInternal *priv;
  double width;
  double height;
  CGSize result;

  priv = self->_priv;
  width = priv->maximumSize.width;
  height = priv->maximumSize.height;
  result.height = height;
  result.width = width;
  return result;
}

- (void)setApertureMode:(AVAssetImageGeneratorApertureMode)apertureMode
{
  NSString *v5;

  v5 = self->_priv->apertureMode;
  self->_priv->apertureMode = (NSString *)-[NSString copy](apertureMode, "copy");
}

- (AVAssetImageGeneratorApertureMode)apertureMode
{
  return self->_priv->apertureMode;
}

- (void)setVideoComposition:(AVVideoComposition *)videoComposition
{
  AVVideoComposition *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  float v12;
  AVCustomVideoCompositorSession *v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  AVCustomVideoCompositorSession *v19;

  v3 = self->_priv->videoComposition;
  if (v3 != videoComposition)
  {
    if (videoComposition)
    {
      v19 = 0;
      if (-[AVVideoComposition _isValidReturningExceptionReason:](videoComposition, "_isValidReturningExceptionReason:", &v19))
      {
        -[AVVideoComposition renderScale](videoComposition, "renderScale");
        if (v12 == 1.0)
        {
          v3 = self->_priv->videoComposition;
          goto LABEL_6;
        }
        v14 = (void *)MEMORY[0x1E0C99DA0];
        v15 = *MEMORY[0x1E0C99778];
        v16 = CFSTR("AVAssetImageGenerator can't use a video composition with a renderScale other than 1.0");
      }
      else
      {
        v14 = (void *)MEMORY[0x1E0C99DA0];
        v15 = *MEMORY[0x1E0C99778];
        v16 = (const __CFString *)v19;
      }
      v17 = (void *)objc_msgSend(v14, "exceptionWithName:reason:userInfo:", v15, AVMethodExceptionReasonWithObjectAndSelector((objc_class *)self, a2, (uint64_t)v16, v7, v8, v9, v10, v11, v18), 0);
      objc_exception_throw(v17);
    }
LABEL_6:

    self->_priv->videoComposition = (AVVideoComposition *)-[AVVideoComposition copy](videoComposition, "copy");
    v19 = 0;
    -[AVVideoComposition _copyFigVideoCompositor:andSession:recyclingSession:forFigRemaker:error:](self->_priv->videoComposition, "_copyFigVideoCompositor:andSession:recyclingSession:forFigRemaker:error:", 0, &v19, self->_priv->customVideoCompositorSession, 1, 0);
    v13 = self->_priv->customVideoCompositorSession;
    self->_priv->customVideoCompositorSession = v19;
  }
}

- (AVVideoComposition)videoComposition
{
  return self->_priv->videoComposition;
}

- (id)customVideoCompositor
{
  return -[AVCustomVideoCompositorSession customVideoCompositor](self->_priv->customVideoCompositorSession, "customVideoCompositor");
}

- (void)setRequestedTimeToleranceBefore:(CMTime *)requestedTimeToleranceBefore
{
  AVAssetImageGeneratorInternal *priv;
  __int128 v4;

  priv = self->_priv;
  v4 = *(_OWORD *)&requestedTimeToleranceBefore->value;
  priv->requestedTimeToleranceBefore.epoch = requestedTimeToleranceBefore->epoch;
  *(_OWORD *)&priv->requestedTimeToleranceBefore.value = v4;
}

- (CMTime)requestedTimeToleranceBefore
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale
                                                                                      + 64);
  return self;
}

- (void)setRequestedTimeToleranceAfter:(CMTime *)requestedTimeToleranceAfter
{
  AVAssetImageGeneratorInternal *priv;
  __int128 v4;

  priv = self->_priv;
  v4 = *(_OWORD *)&requestedTimeToleranceAfter->value;
  priv->requestedTimeToleranceAfter.epoch = requestedTimeToleranceAfter->epoch;
  *(_OWORD *)&priv->requestedTimeToleranceAfter.value = v4;
}

- (CMTime)requestedTimeToleranceAfter
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = *($95D729B680665BEAEFA1D6FCA8238556 *)(*(_QWORD *)&self->timescale
                                                                                      + 88);
  return self;
}

- (id)_optionsDictionary
{
  void *v3;
  uint64_t v4;
  AVAssetImageGeneratorInternal *priv;
  uint64_t v6;
  double width;
  uint64_t v8;
  double height;
  uint64_t v10;
  NSString *apertureMode;
  uint64_t v12;
  NSString *dynamicRangePolicy;
  _QWORD *v14;
  AVAssetImageGeneratorInternal *v15;
  uint64_t v16;
  $95D729B680665BEAEFA1D6FCA8238556 requestedTimeToleranceBefore;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 3);
  objc_msgSend(v3, "setObject:forKey:", v4, *MEMORY[0x1E0CC35E0]);
  priv = self->_priv;
  if (priv->appliesPreferredTrackTransform)
  {
    v6 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v3, "setObject:forKey:", v6, *MEMORY[0x1E0CC35B0]);
    priv = self->_priv;
  }
  width = priv->maximumSize.width;
  if (width > 0.0)
  {
    v8 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)width);
    objc_msgSend(v3, "setObject:forKey:", v8, *MEMORY[0x1E0CC35C8]);
    priv = self->_priv;
  }
  height = priv->maximumSize.height;
  if (height > 0.0)
  {
    v10 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", (int)height);
    objc_msgSend(v3, "setObject:forKey:", v10, *MEMORY[0x1E0CC35C0]);
    priv = self->_priv;
  }
  apertureMode = priv->apertureMode;
  if (apertureMode)
  {
    objc_msgSend(v3, "setObject:forKey:", apertureMode, *MEMORY[0x1E0CC35A8]);
    priv = self->_priv;
  }
  if (priv->useSWDecoderForAV1)
  {
    v12 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v3, "setObject:forKey:", v12, *MEMORY[0x1E0CC3590]);
    priv = self->_priv;
  }
  dynamicRangePolicy = priv->dynamicRangePolicy;
  if (dynamicRangePolicy)
  {
    if (-[NSString isEqualToString:](dynamicRangePolicy, "isEqualToString:", CFSTR("MatchSource")))
    {
      v14 = (_QWORD *)MEMORY[0x1E0CC35A0];
    }
    else
    {
      if (!-[NSString isEqualToString:](self->_priv->dynamicRangePolicy, "isEqualToString:", CFSTR("ForceSDR")))
        goto LABEL_17;
      v14 = (_QWORD *)MEMORY[0x1E0CC3598];
    }
    objc_msgSend(v3, "setObject:forKey:", *v14, *MEMORY[0x1E0CC35B8]);
  }
LABEL_17:
  v15 = self->_priv;
  if (!v15->allowsProfessionalVideoWorkflowVideoDecoders)
  {
    v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    objc_msgSend(v3, "setObject:forKey:", v16, *MEMORY[0x1E0CC35D0]);
    v15 = self->_priv;
  }
  if ((v15->requestedTimeToleranceBefore.flags & 0x1D) == 1)
  {
    requestedTimeToleranceBefore = v15->requestedTimeToleranceBefore;
    objc_msgSend(v3, "setObject:forKey:", NSDictionaryFromCMTime((CMTime *)&requestedTimeToleranceBefore), *MEMORY[0x1E0CC35F0]);
    v15 = self->_priv;
  }
  if ((v15->requestedTimeToleranceAfter.flags & 0x1D) == 1)
  {
    requestedTimeToleranceBefore = v15->requestedTimeToleranceAfter;
    objc_msgSend(v3, "setObject:forKey:", NSDictionaryFromCMTime((CMTime *)&requestedTimeToleranceBefore), *MEMORY[0x1E0CC35E8]);
  }
  return v3;
}

- (void)_didGenerateCGImage:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  const __CFDictionary *v8;
  void *v9;
  uint64_t v10;
  void (*v11)(uint64_t, _QWORD *, uint64_t, CMTime *, _QWORD, _QWORD);
  NSObject *requestsQueue;
  _QWORD v13[6];
  CMTime v14;
  _QWORD v15[3];
  CMTime v16;

  v5 = -[AVAssetImageGenerator _requestWithRequestID:](self, "_requestWithRequestID:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3628]));
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3618]);
    v8 = (const __CFDictionary *)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3620]);
    memset(&v16, 0, sizeof(v16));
    CMTimeMakeFromDictionary(&v16, v8);
    v9 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("RequestedTime"));
    v10 = objc_msgSend(v6, "objectForKey:", CFSTR("CompletionHandler"));
    if (v9)
      objc_msgSend(v9, "CMTimeValue");
    else
      memset(v15, 0, sizeof(v15));
    v11 = *(void (**)(uint64_t, _QWORD *, uint64_t, CMTime *, _QWORD, _QWORD))(v10 + 16);
    v14 = v16;
    v11(v10, v15, v7, &v14, 0, 0);
    requestsQueue = self->_priv->requestsQueue;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __45__AVAssetImageGenerator__didGenerateCGImage___block_invoke;
    v13[3] = &unk_1E302FCE8;
    v13[4] = self;
    v13[5] = v6;
    dispatch_async(requestsQueue, v13);
  }
}

uint64_t __45__AVAssetImageGenerator__didGenerateCGImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_failedToGenerateCGImage:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD *, _QWORD, __int128 *, uint64_t, _QWORD);
  id v11;
  void (*v12)(uint64_t, _QWORD *, _QWORD, __int128 *, uint64_t, id);
  NSObject *requestsQueue;
  _QWORD block[6];
  _QWORD v15[3];
  __int128 v16;
  uint64_t v17;
  _QWORD v18[3];

  v5 = -[AVAssetImageGenerator _requestWithRequestID:](self, "_requestWithRequestID:", objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3628]));
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0CC3630]), "intValue");
    v8 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("RequestedTime"));
    v9 = objc_msgSend(v6, "objectForKey:", CFSTR("CompletionHandler"));
    if ((_DWORD)v7 == -12432)
    {
      if (v8)
        objc_msgSend(v8, "CMTimeValue");
      else
        memset(v18, 0, sizeof(v18));
      v10 = *(void (**)(uint64_t, _QWORD *, _QWORD, __int128 *, uint64_t, _QWORD))(v9 + 16);
      v16 = *MEMORY[0x1E0CA2E18];
      v17 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v10(v9, v18, 0, &v16, 2, 0);
    }
    else
    {
      if (v8)
        objc_msgSend(v8, "CMTimeValue");
      else
        memset(v15, 0, sizeof(v15));
      v11 = -[AVAssetImageGenerator _NSErrorForError:](self, "_NSErrorForError:", v7);
      v12 = *(void (**)(uint64_t, _QWORD *, _QWORD, __int128 *, uint64_t, id))(v9 + 16);
      v16 = *MEMORY[0x1E0CA2E18];
      v17 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      v12(v9, v15, 0, &v16, 1, v11);
    }
    requestsQueue = self->_priv->requestsQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__AVAssetImageGenerator__failedToGenerateCGImage___block_invoke;
    block[3] = &unk_1E302FCE8;
    block[4] = self;
    block[5] = v6;
    dispatch_async(requestsQueue, block);
  }
}

uint64_t __50__AVAssetImageGenerator__failedToGenerateCGImage___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void)_serverDied
{
  NSObject *requestsQueue;
  _QWORD block[5];

  requestsQueue = self->_priv->requestsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__AVAssetImageGenerator__serverDied__block_invoke;
  block[3] = &unk_1E302FA10;
  block[4] = self;
  dispatch_async(requestsQueue, block);
}

uint64_t __36__AVAssetImageGenerator__serverDied__block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, _QWORD *, _QWORD, __int128 *, uint64_t, uint64_t);
  id obj;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  _QWORD v17[3];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112);
  v1 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v19;
    v14 = *MEMORY[0x1E0CA2E18];
    v4 = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v19 != v3)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        v7 = (void *)objc_msgSend(v6, "objectForKey:", CFSTR("RequestedTime"));
        v8 = objc_msgSend(v6, "objectForKey:", CFSTR("CompletionHandler"));
        v9 = AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0);
        if (v7)
          objc_msgSend(v7, "CMTimeValue");
        else
          memset(v17, 0, sizeof(v17));
        v10 = *(void (**)(uint64_t, _QWORD *, _QWORD, __int128 *, uint64_t, uint64_t))(v8 + 16);
        v15 = v14;
        v16 = v4;
        v10(v8, v17, 0, &v15, 1, v9);
      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v2);
  }
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 112), "removeAllObjects");
}

- (id)_requestWithRequestID:(id)a3
{
  NSObject *requestsQueue;
  id v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__4;
  v11 = __Block_byref_object_dispose__4;
  v12 = 0;
  requestsQueue = self->_priv->requestsQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AVAssetImageGenerator__requestWithRequestID___block_invoke;
  block[3] = &unk_1E302FE00;
  block[4] = self;
  block[5] = a3;
  block[6] = &v7;
  dispatch_sync(requestsQueue, block);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __47__AVAssetImageGenerator__requestWithRequestID___block_invoke(_QWORD *a1)
{
  void *v2;
  id result;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(void **)(*(_QWORD *)(a1[4] + 8) + 112);
  result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (result)
  {
    v4 = result;
    v5 = *(_QWORD *)v9;
    while (2)
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * (_QWORD)v6);
        if (objc_msgSend((id)objc_msgSend(v7, "objectForKey:", CFSTR("RequestID")), "isEqual:", a1[5]))
        {
          result = v7;
          *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) = result;
          return result;
        }
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      result = (id)objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      v4 = result;
      if (result)
        continue;
      break;
    }
  }
  return result;
}

- (CGSize)_scaledSizeForRenderSize:(CGSize)result
{
  AVAssetImageGeneratorInternal *priv;
  double width;
  double height;
  float v8;
  float v9;

  priv = self->_priv;
  width = priv->maximumSize.width;
  height = priv->maximumSize.height;
  if (width != *MEMORY[0x1E0C9D820] || height != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    if (width <= 0.0)
      width = result.width;
    if (height <= 0.0)
      height = result.height;
    if (width < result.width || height < result.height)
    {
      v8 = width / result.width;
      v9 = height / result.height;
      result.height = result.height * v8;
      result.width = result.width * v9;
      if (v8 >= v9)
        result.height = height;
      else
        result.width = width;
    }
  }
  return result;
}

- (CGImage)_copyCGImageAtTime:(id *)a3 usingAssetReader:(id)a4 error:(id *)a5
{
  void *v8;
  void *v9;
  uint64_t v10;
  opaqueCMSampleBuffer *v11;
  __CVBuffer *ImageBuffer;
  void *v13;
  CGImage *result;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  CMTime v19;
  CMTime start;
  CMTimeRange v21;
  CGImageRef imageOut;

  imageOut = 0;
  v8 = (void *)objc_msgSend(a4, "outputs");
  if (!objc_msgSend(v8, "count"))
  {
    v13 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11832, 0);
LABEL_15:
    result = 0;
    if (!a5)
      return result;
    goto LABEL_16;
  }
  v9 = (void *)objc_msgSend(v8, "objectAtIndex:", 0);
  start = (CMTime)*a3;
  v19 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E68];
  CMTimeRangeMake(&v21, &start, &v19);
  objc_msgSend(a4, "setTimeRange:", &v21);
  objc_msgSend(a4, "_setReadSingleSample:", 1);
  objc_msgSend(a4, "startReading");
  v10 = objc_msgSend(v9, "copyNextSampleBuffer");
  if (!v10)
  {
    if (objc_msgSend(a4, "status") == 3)
    {
      v13 = (void *)objc_msgSend(a4, "error");
      v15 = (void *)objc_msgSend(v13, "userInfo");
      v16 = *MEMORY[0x1E0CB3388];
      v17 = (void *)objc_msgSend(v15, "objectForKey:", *MEMORY[0x1E0CB3388]);
      if (objc_msgSend(v17, "code") == -12138)
      {
        v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v17, v16);
      }
      else
      {
        if (objc_msgSend(v13, "code") != -11841)
        {
LABEL_14:
          objc_msgSend(a4, "cancelReading");
          goto LABEL_15;
        }
        v18 = (void *)objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v13, v16);
      }
    }
    else
    {
      v18 = 0;
    }
    v13 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11832, v18);
    goto LABEL_14;
  }
  v11 = (opaqueCMSampleBuffer *)v10;
  objc_msgSend(a4, "cancelReading");
  ImageBuffer = CMSampleBufferGetImageBuffer(v11);
  if (!ImageBuffer || (VTCreateCGImageFromCVPixelBuffer(ImageBuffer, 0, &imageOut), v13 = 0, !imageOut))
    v13 = (void *)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11801, 0);
  CFRelease(v11);
  result = imageOut;
  if (a5)
  {
LABEL_16:
    if (!result)
      *a5 = v13;
  }
  return result;
}

- (id)_NSErrorForError:(int)a3
{
  if (a3 == 268435459)
    return (id)AVLocalizedError(CFSTR("AVFoundationErrorDomain"), -11819, 0);
  else
    return (id)AVLocalizedErrorWithUnderlyingOSStatus(a3, 0);
}

- (BOOL)isDefunct
{
  unsigned int (*v3)(OpaqueFigAssetImageGenerator *, unsigned __int8 *);
  OpaqueFigAssetImageGenerator *generator;
  _QWORD *v5;
  BOOL v6;
  int v7;
  unsigned __int8 v9;

  v9 = 0;
  if (-[AVAsset isDefunct](-[AVAssetImageGenerator asset](self, "asset"), "isDefunct"))
  {
    LODWORD(v3) = 1;
    return (_DWORD)v3 == 1;
  }
  generator = self->_priv->generator;
  v5 = *(_QWORD **)(CMBaseObjectGetVTable() + 8);
  if (*v5 < 5uLL)
  {
    LODWORD(v3) = 0;
    goto LABEL_7;
  }
  v3 = (unsigned int (*)(OpaqueFigAssetImageGenerator *, unsigned __int8 *))v5[11];
  if (!v3)
  {
LABEL_7:
    v6 = 0;
    goto LABEL_8;
  }
  v6 = v3(generator, &v9) == 0;
  LODWORD(v3) = v9;
LABEL_8:
  if (v6)
    v7 = (int)v3;
  else
    v7 = 1;
  if (!(_DWORD)v3)
    LODWORD(v3) = v7;
  return (_DWORD)v3 == 1;
}

@end
