@implementation BWAppClipCodeNode

- (id)nodeType
{
  return CFSTR("Effect");
}

void __63__BWAppClipCodeNode_prepareForCurrentConfigurationToBecomeLive__block_invoke(uint64_t a1)
{
  -[BWAppClipCodeNode _startAppClipCodeSession](*(_QWORD *)(a1 + 32));
}

- (BWAppClipCodeNode)initWithProcessingQueuePriority:(unsigned int)a3
{
  BWAppClipCodeNode *v3;
  BWNodeInput *v4;
  BWNodeOutput *v5;
  BOOL v6;
  char v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWAppClipCodeNode;
  v3 = -[BWNode init](&v9, sel_init);
  if (v3)
  {
    v4 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v3);
    -[BWNodeInput setFormatRequirements:](v4, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNode addInput:](v3, "addInput:", v4);
    -[BWFormatRequirements setSupportedPixelFormats:](-[BWNodeInput formatRequirements](v3->super._input, "formatRequirements"), "setSupportedPixelFormats:", &unk_1E4A00350);
    v5 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1836016234, v3);
    -[BWNodeOutput setFormat:](v5, "setFormat:", +[BWMetadataObjectFormat formatWithMetadataIdentifiers:](BWMetadataObjectFormat, "formatWithMetadataIdentifiers:", 0));
    -[BWNode addOutput:](v3, "addOutput:", v5);
    v3->_weakSelf = (FigWeakReference *)+[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", v3);
    v3->_processingQueue = (OS_dispatch_queue *)FigDispatchQueueCreateWithPriority();
    if (MEMORY[0x1E0CF8760])
      v6 = MEMORY[0x1E0CF8790] == 0;
    else
      v6 = 1;
    v7 = !v6;
    v3->_appC3DAvailable = v7;
  }
  return v3;
}

- (void)setDetectedResultsObserver:(id)a3
{
  self->_detectedResultsObserver = (BWMetadataDetectedResultsObserver *)a3;
}

- (void)_startAppClipCodeSession
{
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      FigDebugAssert3();
    }
    if (*(_BYTE *)(a1 + 104))
    {
      if (!*(_QWORD *)(a1 + 96))
      {
        AppC3DConfigCreate();
        AppC3DConfigSetTrackingMode();
        AppC3DConfigSetMaxNumberCodesToTrack();
        AppC3DCreate();
        AppC3DSetUpdateCallback();
      }
    }
  }
}

- (void)prepareForCurrentConfigurationToBecomeLive
{
  NSObject *processingQueue;
  objc_super v4;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__BWAppClipCodeNode_prepareForCurrentConfigurationToBecomeLive__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_async(processingQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)BWAppClipCodeNode;
  -[BWNode prepareForCurrentConfigurationToBecomeLive](&v4, sel_prepareForCurrentConfigurationToBecomeLive);
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  NSObject *processingQueue;
  objc_super v4;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __28__BWAppClipCodeNode_dealloc__block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(processingQueue, block);

  v4.receiver = self;
  v4.super_class = (Class)BWAppClipCodeNode;
  -[BWNode dealloc](&v4, sel_dealloc);
}

uint64_t __28__BWAppClipCodeNode_dealloc__block_invoke(uint64_t a1)
{
  return -[BWAppClipCodeNode _endAppClipCodeSession](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_endAppClipCodeSession
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = _FigIsCurrentDispatchQueue();
    if (!(_DWORD)result)
    {
      fig_log_get_emitter();
      result = FigDebugAssert3();
    }
    if (*(_BYTE *)(v1 + 104))
    {
      result = *(_QWORD *)(v1 + 96);
      if (result)
      {
        result = AppC3DRelease();
        *(_QWORD *)(v1 + 96) = 0;
      }
    }
  }
  return result;
}

- (id)nodeSubType
{
  return CFSTR("AppClipCode");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  NSObject *v6;
  NSObject *v7;
  NSObject *processingQueue;
  _QWORD v9[6];

  v6 = CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05C40], 0);
  v7 = v6;
  if (v6)
    dispatch_group_enter(v6);
  if (objc_msgSend((id)CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05D38], 0), "BOOLValue"))
  {
    processingQueue = self->_processingQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __49__BWAppClipCodeNode_renderSampleBuffer_forInput___block_invoke;
    v9[3] = &unk_1E491F158;
    v9[4] = self;
    v9[5] = a3;
    dispatch_sync(processingQueue, v9);
  }
  if (v7)
    dispatch_group_leave(v7);
}

void __49__BWAppClipCodeNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  -[BWAppClipCodeNode _processSampleBuffer:](*(_QWORD *)(a1 + 32), *(opaqueCMSampleBuffer **)(a1 + 40));
}

- (void)_processSampleBuffer:(uint64_t)a1
{
  uint64_t v2;
  void *v5;
  void *v6;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v8;
  void *v9;
  const __CFAllocator *v10;
  CFTypeRef v11;
  uint64_t v12;
  uint64_t v13;
  CMTime v14;
  CMTime v15;
  _BYTE time[32];
  __int128 v17;
  CMTime v18;
  CFTypeRef cf;
  double v20;
  double v21;
  float64x2_t v22;
  float64x2_t v23;
  float64x2_t v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (!_FigIsCurrentDispatchQueue())
    {
      fig_log_get_emitter();
      v13 = v2;
      LODWORD(v12) = 0;
      FigDebugAssert3();
    }
    cf = 0;
    memset(&v18, 0, sizeof(v18));
    CMSampleBufferGetPresentationTimeStamp(&v18, a2);
    *(CMTime *)time = v18;
    CMTimeGetSeconds((CMTime *)time);
    v17 = 0u;
    memset(time, 0, sizeof(time));
    v5 = (void *)CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0CA2638], 0);
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend(v5, "length") == 48)
      {
        objc_msgSend(v6, "getBytes:length:", time, objc_msgSend(v6, "length"));
        v20 = *(float *)time;
        v21 = *(float *)&time[16];
        v22 = vcvtq_f64_f32((float32x2_t)__PAIR64__(*(unsigned int *)&time[4], v17));
        v23 = vcvtq_f64_f32((float32x2_t)vzip2_s32(*(int32x2_t *)&time[16], *(int32x2_t *)&v17));
        v24 = vcvtq_f64_f32((float32x2_t)vzip1_s32((int32x2_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)time, *(int8x16_t *)time, 8uLL), (int32x2_t)*(_OWORD *)&vextq_s8(*(int8x16_t *)&time[16], *(int8x16_t *)&time[16], 8uLL)));
        v25 = *((float *)&v17 + 2);
        ImageBuffer = CMSampleBufferGetImageBuffer(a2);
        if (ImageBuffer && !*(_BYTE *)(a1 + 128))
        {
          v8 = ImageBuffer;
          *(_DWORD *)(a1 + 132) = objc_msgSend((id)CMGetAttachment(ImageBuffer, CFSTR("RotationDegrees"), 0), "intValue");
          *(_BYTE *)(a1 + 136) = objc_msgSend((id)CMGetAttachment(v8, CFSTR("MirroredHorizontal"), 0), "BOOLValue");
          *(_BYTE *)(a1 + 137) = objc_msgSend((id)CMGetAttachment(v8, CFSTR("MirroredVertical"), 0), "BOOLValue");
          *(_BYTE *)(a1 + 128) = 1;
        }
        v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v12, v13);
        v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v15 = v18;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", CMTimeCopyAsDictionary(&v15, v10), CFSTR("pts"));
        memset(&v14, 0, sizeof(v14));
        BWGetOriginalPresentationTimeStampFromBuffer(a2, (uint64_t)&v14);
        v15 = v14;
        objc_msgSend(v9, "setObject:forKeyedSubscript:", CMTimeCopyAsDictionary(&v15, v10), CFSTR("OriginalPTS"));
        objc_msgSend(v9, "setObject:forKeyedSubscript:", CMGetAttachment(a2, (CFStringRef)*MEMORY[0x1E0D05D18], 0), CFSTR("primaryCaptureRectBeforeCropping"));
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v9);
        if (*(_BYTE *)(a1 + 104))
        {
          CMSampleBufferGetImageBuffer(a2);
          AppC3DProcessCameraFrameData();
          v11 = cf;
          if (cf || (AppC3DFlush(), (v11 = cf) != 0))
            CFRelease(v11);
        }
      }
    }
  }
}

- (void)didReachEndOfDataForInput:(id)a3
{
  NSObject *processingQueue;
  objc_super v6;
  _QWORD block[5];

  processingQueue = self->_processingQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__BWAppClipCodeNode_didReachEndOfDataForInput___block_invoke;
  block[3] = &unk_1E491E720;
  block[4] = self;
  dispatch_sync(processingQueue, block);
  v6.receiver = self;
  v6.super_class = (Class)BWAppClipCodeNode;
  -[BWNode didReachEndOfDataForInput:](&v6, sel_didReachEndOfDataForInput_, a3);
}

uint64_t __47__BWAppClipCodeNode_didReachEndOfDataForInput___block_invoke(uint64_t a1)
{
  return -[BWAppClipCodeNode _endAppClipCodeSession](*(_QWORD *)(a1 + 32));
}

- (void)didReceiveAppC3DUpdate:(void *)a3 userData:
{
  uint64_t NumberOfTrackingData;
  uint64_t v5;
  id v6;
  const void *v7;
  uint64_t Metadata;
  uint64_t DataVersion;
  id v10;
  CGSize v11;
  void *v12;
  uint64_t v13;
  float v14;
  float v15;
  float v16;
  float x;
  CGPoint v18;
  CGFloat y;
  const __CFDictionary *v20;
  void *v21;
  const __CFDictionary *v22;
  uint64_t v23;
  void *v24;
  CMTimeEpoch epoch;
  OSStatus v26;
  CGFloat v27;
  void *value;
  const __CFDictionary *dictionaryRepresentation;
  __int128 v31;
  CMSampleTimingInfo sampleTimingArray;
  CMTime v33;
  CGPoint point;
  CGRect rect;
  const void *v36;
  CGRect v37;

  if (a1)
  {
    v36 = 0;
    NumberOfTrackingData = AppC3DTrackingResultGetNumberOfTrackingData();
    dictionaryRepresentation = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("pts"));
    value = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    if (NumberOfTrackingData)
    {
      v5 = 0;
      do
      {
        v6 = (id)AppC3DTrackingResultCreateData();
        v7 = v36;
        if (v36)
          goto LABEL_29;
        Metadata = AppC3DTrackingResultGetMetadata();
        v7 = v36;
        if (v36)
          goto LABEL_29;
        DataVersion = AppC3DTrackingResultGetDataVersion();
        v7 = v36;
        if (v36)
          goto LABEL_29;
        v10 = (id)AppC3DTrackingResultCreateCorners();
        v7 = v36;
        if (v36)
          goto LABEL_29;
        if (objc_msgSend(v10, "count") != 4)
        {
          fig_log_get_emitter();
          FigDebugAssert3();
          goto LABEL_28;
        }
        v11 = *(CGSize *)(MEMORY[0x1E0C9D628] + 16);
        rect.origin = (CGPoint)*MEMORY[0x1E0C9D628];
        rect.size = v11;
        CGRectMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("primaryCaptureRectBeforeCropping")), &rect);
        memset(&sampleTimingArray, 0, 48);
        FigCaptureGetTransformForMirroringRotationAndCrop(*(unsigned __int8 *)(a1 + 136), *(unsigned __int8 *)(a1 + 137), *(_DWORD *)(a1 + 132), (uint64_t)&sampleTimingArray, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
        v12 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 4);
        v13 = 0;
        v14 = 1.0;
        v15 = 0.0;
        v16 = 0.0;
        x = 1.0;
        do
        {
          point.x = 0.0;
          point.y = 0.0;
          CGPointMakeWithDictionaryRepresentation((CFDictionaryRef)objc_msgSend(v10, "objectAtIndexedSubscript:", v13), &point);
          v18 = (CGPoint)vaddq_f64(*(float64x2_t *)&sampleTimingArray.presentationTimeStamp.timescale, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&sampleTimingArray.duration.epoch, point.y), *(float64x2_t *)&sampleTimingArray.duration.value, point.x));
          point = v18;
          y = v18.y;
          objc_msgSend(v12, "addObject:", CGPointCreateDictionaryRepresentation(v18));
          if (point.x < x)
            x = point.x;
          if (point.x > v16)
            v16 = point.x;
          if (point.y < v14)
            v14 = point.y;
          if (point.y > v15)
            v15 = point.y;
          ++v13;
        }
        while (v13 != 4);
        v37.origin.x = x;
        v37.origin.y = v14;
        v37.size.width = (float)(v16 - x);
        v37.size.height = (float)(v15 - v14);
        v20 = CGRectCreateDictionaryRepresentation(v37);
        v21 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v6, CFSTR("RawData"));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", Metadata), CFSTR("Metadata"));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", DataVersion), CFSTR("Version"));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v12, CFSTR("Corners"));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, CFSTR("BoundingRect"));
        objc_msgSend(v21, "setObject:forKeyedSubscript:", dictionaryRepresentation, CFSTR("TimeStamp"));
        objc_msgSend(value, "addObject:", v21);
      }
      while (++v5 != NumberOfTrackingData);
    }
    v22 = (const __CFDictionary *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("OriginalPTS"));
    memset(&v33, 0, sizeof(v33));
    CMTimeMakeFromDictionary(&v33, v22);
    v23 = NumberOfTrackingData;
    if (!NumberOfTrackingData)
      v23 = *(_QWORD *)(a1 + 152);
    *(_QWORD *)(a1 + 152) = NumberOfTrackingData;
    v24 = *(void **)(a1 + 144);
    sampleTimingArray.duration = v33;
    objc_msgSend(v24, "node:didEmitCodesCount:emittedIdentifiers:originalPTS:", a1, NumberOfTrackingData, 0, &sampleTimingArray);
    if (v23 >= 1)
    {
      *(_OWORD *)&sampleTimingArray.duration.value = *MEMORY[0x1E0CA2E18];
      v31 = *(_OWORD *)&sampleTimingArray.duration.value;
      sampleTimingArray.duration.epoch = *(_QWORD *)(MEMORY[0x1E0CA2E18] + 16);
      epoch = sampleTimingArray.duration.epoch;
      memset(&rect, 0, 24);
      CMTimeMakeFromDictionary((CMTime *)&rect, dictionaryRepresentation);
      *(CGPoint *)&sampleTimingArray.presentationTimeStamp.value = rect.origin;
      sampleTimingArray.presentationTimeStamp.epoch = *(_QWORD *)&rect.size.width;
      *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v31;
      sampleTimingArray.decodeTimeStamp.epoch = epoch;
      point.x = 0.0;
      v26 = CMSampleBufferCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 1u, 0, 0, 0, 0, 1, &sampleTimingArray, 0, 0, (CMSampleBufferRef *)&point);
      v27 = point.x;
      if (*(_QWORD *)&point.x && !v26)
      {
        CMSetAttachment(*(CMAttachmentBearerRef *)&point.x, CFSTR("AppClipCodes"), value, 1u);
        CMSetAttachment(*(CMAttachmentBearerRef *)&point.x, CFSTR("AppClipCodesCount"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(value, "count")), 1u);
        objc_msgSend(*(id *)(a1 + 16), "emitSampleBuffer:", *(_QWORD *)&point.x);
        v27 = point.x;
      }
      if (v27 != 0.0)
        CFRelease(*(CFTypeRef *)&v27);
    }
LABEL_28:
    v7 = v36;
    if (v36)
LABEL_29:
      CFRelease(v7);
  }
}

- (BWMetadataDetectedResultsObserver)detectedResultsObserver
{
  return self->_detectedResultsObserver;
}

@end
