@implementation BWVideoCompressorNode

- (void)configurationWithID:(int64_t)a3 updatedFormat:(id)a4 didBecomeLiveForInput:(id)a5
{
  NSDictionary *compressionSettings;
  NSDictionary *v10;
  NSDictionary *v11;
  unint64_t v12;
  unint64_t v13;
  BOOL v14;
  objc_super v16;

  if (a4)
  {
    if (self->_compressionDimensionsFromInputEnabled)
    {
      compressionSettings = self->_compressionSettings;
      if (compressionSettings)
        v10 = (NSDictionary *)-[NSDictionary mutableCopy](compressionSettings, "mutableCopy");
      else
        v10 = (NSDictionary *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99E08], "init"), "alloc");
      v11 = v10;
      -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(a4, "width")), CFSTR("AVVideoWidthKey"));
      -[NSDictionary setObject:forKeyedSubscript:](v11, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(a4, "height")), CFSTR("AVVideoHeightKey"));

      self->_compressionSettings = v11;
    }
    -[BWVideoCompressorNode _verifyDimensions:]((uint64_t)self, a4);
    v12 = objc_msgSend(a4, "width");
    v13 = objc_msgSend(a4, "height");
    v14 = v12 >= 0x3C0 && v13 > 0x21B || v12 > 0x21B && v13 > 0x3BF;
    self->_sourceIsHDResolution = v14;
    self->_sourcePixelFormatType = objc_msgSend(a4, "pixelFormat");
  }
  v16.receiver = self;
  v16.super_class = (Class)BWVideoCompressorNode;
  -[BWNode configurationWithID:updatedFormat:didBecomeLiveForInput:](&v16, sel_configurationWithID_updatedFormat_didBecomeLiveForInput_, a3, a4, a5);
}

- (id)nodeType
{
  return CFSTR("Converter");
}

- (void)_registerForThermalAndPowerNotifications
{
  const char *v2;
  NSObject *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[5];
  _QWORD v8[5];
  _QWORD handler[5];

  if (a1)
  {
    v2 = (const char *)*MEMORY[0x1E0C83A00];
    v3 = *(NSObject **)(a1 + 200);
    v4 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke;
    handler[3] = &unk_1E491FB78;
    handler[4] = a1;
    notify_register_dispatch(v2, (int *)(a1 + 228), v3, handler);
    v5 = *(NSObject **)(a1 + 200);
    v8[0] = v4;
    v8[1] = 3221225472;
    v8[2] = __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke_2;
    v8[3] = &unk_1E491FB78;
    v8[4] = a1;
    notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)(a1 + 236), v5, v8);
    v6 = *(NSObject **)(a1 + 200);
    block[0] = v4;
    block[1] = 3221225472;
    block[2] = __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke_3;
    block[3] = &unk_1E491E720;
    block[4] = a1;
    dispatch_sync(v6, block);
  }
}

- (void)didSelectFormat:(id)a3 forInput:(id)a4
{
  BWVideoFormatRequirements *v6;
  void *v7;
  NSDictionary *compressionSettings;
  NSDictionary *v9;
  NSDictionary *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidth:](v6, "setWidth:", objc_msgSend(a3, "width"));
  -[BWVideoFormatRequirements setHeight:](v6, "setHeight:", objc_msgSend(a3, "height"));
  v7 = FigCaptureEncodedByteStreamFormatForPixelFormat(objc_msgSend(a3, "pixelFormat"));
  if (v7)
  {
    v11[0] = v7;
    -[BWVideoFormatRequirements setSupportedPixelFormats:](v6, "setSupportedPixelFormats:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1));
  }
  -[BWNodeOutput setFormatRequirements:](self->super._output, "setFormatRequirements:", v6);

  if (self->_compressionDimensionsFromInputEnabled)
  {
    compressionSettings = self->_compressionSettings;
    if (compressionSettings)
      v9 = (NSDictionary *)-[NSDictionary mutableCopy](compressionSettings, "mutableCopy");
    else
      v9 = (NSDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v10 = v9;
    -[NSDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(a3, "width")), CFSTR("AVVideoWidthKey"));
    -[NSDictionary setObject:forKeyedSubscript:](v10, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", objc_msgSend(a3, "height")), CFSTR("AVVideoHeightKey"));

    self->_compressionSettings = v10;
  }
  -[BWVideoCompressorNode _verifyDimensions:]((uint64_t)self, a3);
}

- (uint64_t)_verifyDimensions:(uint64_t)result
{
  uint64_t v3;

  if (result)
  {
    v3 = result;
    objc_msgSend(a2, "width");
    objc_msgSend(a2, "height");
    objc_msgSend((id)objc_msgSend(*(id *)(v3 + 96), "objectForKeyedSubscript:", CFSTR("AVVideoWidthKey")), "unsignedIntegerValue");
    return objc_msgSend((id)objc_msgSend(*(id *)(v3 + 96), "objectForKeyedSubscript:", CFSTR("AVVideoHeightKey")), "unsignedIntegerValue");
  }
  return result;
}

- (void)setPipelineTraceID:(int)a3
{
  self->_pipelineTraceID = a3;
}

- (void)setMaximumAllowedInFlightCompressedBytes:(int64_t)a3
{
  int64_t v3;

  self->_maximumAllowedInFlightCompressedBytes = a3;
  if (a3 >= 0)
    v3 = a3;
  else
    v3 = a3 + 1;
  self->_inFlightCompressedBytesWarningThreshold = v3 >> 1;
}

- (BWVideoCompressorNode)initWithCompressionSettings:(id)a3 overCaptureEnabled:(BOOL)a4 stereoVideoCompressionEnabled:(BOOL)a5 maxVideoFrameRate:(float)a6 delayedCompressorCleanupEnabled:(BOOL)a7 maxLossyCompressionLevel:(int)a8
{
  _BOOL4 v11;
  id v15;
  BWNodeInput *v16;
  BWNodeInputMediaConfiguration *v17;
  BWNodeInputMediaConfiguration *v18;
  BWNodeOutput *v19;
  BWVideoFormatRequirements *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  _QWORD handler[5];
  unsigned int v29;
  objc_super v30;

  v11 = a5;
  if (a5 && !VTIsStereoMVHEVCEncodeSupported())
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("Stereo video compression requested on system that doesn't support it"), 0));
  v30.receiver = self;
  v30.super_class = (Class)BWVideoCompressorNode;
  v15 = -[BWNode init](&v30, sel_init);
  if (v15)
  {
    v16 = -[BWNodeInput initWithMediaType:node:]([BWNodeInput alloc], "initWithMediaType:node:", 1986618469, v15);
    *((_BYTE *)v15 + 247) = a4;
    *((_BYTE *)v15 + 281) = v11;
    *((float *)v15 + 63) = a6;
    if (a3)
    {
      *((_QWORD *)v15 + 12) = objc_msgSend(a3, "copy");
      a6 = *((float *)v15 + 63);
    }
    v29 = 0;
    -[BWNodeInput setFormatRequirements:](v16, "setFormatRequirements:", +[BWVideoCompressorNode _formatRequirementsForCompressionSettings:maxVideoFrameRate:retainedBufferCountHint:maxLossyCompressionLevel:](a6, (uint64_t)BWVideoCompressorNode, a3, &v29, a8));
    -[BWNodeInput setRetainedBufferCount:](v16, "setRetainedBufferCount:", v29);
    *((_BYTE *)v15 + 113) = 0;
    *((_DWORD *)v15 + 29) = 81;
    v17 = objc_alloc_init(BWNodeInputMediaConfiguration);
    -[BWNodeInputMediaConfiguration setFormatRequirements:](v17, "setFormatRequirements:", objc_alloc_init(BWVideoFormatRequirements));
    -[BWNodeInputMediaConfiguration setPassthroughMode:](v17, "setPassthroughMode:", 0);
    -[BWNodeInput setUnspecifiedAttachedMediaConfiguration:](v16, "setUnspecifiedAttachedMediaConfiguration:", v17);
    objc_msgSend(v15, "addInput:", v16);

    if (v11)
    {
      v18 = objc_alloc_init(BWNodeInputMediaConfiguration);
      -[BWNodeInputMediaConfiguration setFormatRequirements:](v18, "setFormatRequirements:", objc_msgSend(*((id *)v15 + 1), "formatRequirements"));
      -[BWNodeInputMediaConfiguration setRetainedBufferCount:](v18, "setRetainedBufferCount:", objc_msgSend(*((id *)v15 + 1), "retainedBufferCount"));
      objc_msgSend(*((id *)v15 + 1), "setMediaConfiguration:forAttachedMediaKey:", v18, CFSTR("SynchronizedSlaveFrame"));
    }
    v19 = -[BWNodeOutput initWithMediaType:node:]([BWNodeOutput alloc], "initWithMediaType:node:", 1986618469, v15);
    v20 = objc_alloc_init(BWVideoFormatRequirements);
    -[BWNodeOutput setFormatRequirements:](v19, "setFormatRequirements:", v20);
    -[BWNodeOutput setProvidesPixelBufferPool:](v19, "setProvidesPixelBufferPool:", 0);

    objc_msgSend(v15, "addOutput:", v19);
    *((_QWORD *)v15 + 18) = FigDispatchQueueCreateWithPriority();
    *((_QWORD *)v15 + 19) = FigDispatchQueueCreateWithPriority();
    *((_BYTE *)v15 + 176) = !v11;
    if (!v11)
    {
      *((_QWORD *)v15 + 21) = 0x4014000000000000;
      v21 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v15 + 19));
      *((_QWORD *)v15 + 20) = v21;
      dispatch_source_set_timer(v21, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
      v22 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", v15);
      v23 = *((_QWORD *)v15 + 20);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __177__BWVideoCompressorNode_initWithCompressionSettings_overCaptureEnabled_stereoVideoCompressionEnabled_maxVideoFrameRate_delayedCompressorCleanupEnabled_maxLossyCompressionLevel___block_invoke;
      handler[3] = &unk_1E491E720;
      handler[4] = v22;
      dispatch_source_set_event_handler(v23, handler);
      dispatch_activate(*((dispatch_object_t *)v15 + 20));
    }
    *((_QWORD *)v15 + 26) = 0x405E000000000000;
    *((_QWORD *)v15 + 25) = FigDispatchQueueCreateWithPriority();
    *((_QWORD *)v15 + 34) = -[BWLimitedGMErrorLogger initWithName:maxLoggingCount:]([BWLimitedGMErrorLogger alloc], "initWithName:maxLoggingCount:", CFSTR("Video Compressor"), 40);
    *((_BYTE *)v15 + 246) = 1;
    *((_BYTE *)v15 + 320) = a7;
    v24 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", 0x1E495AAF8, 0x1E495AB18, 0x1E495A738, *MEMORY[0x1E0D088E8], *MEMORY[0x1E0D088F0], 0x1E495A7D8, *MEMORY[0x1E0D088A0], 0x1E4959EF8, *MEMORY[0x1E0D08898], *MEMORY[0x1E0D08878], 0);
    v25 = v24;
    if (*((_BYTE *)v15 + 247))
      objc_msgSend(v24, "addObject:", 0x1E4928E38);
    *((_QWORD *)v15 + 41) = objc_msgSend(v25, "copy");
    v26 = MEMORY[0x1E0CA2E18];
    *((_OWORD *)v15 + 21) = *MEMORY[0x1E0CA2E18];
    *((_QWORD *)v15 + 44) = *(_QWORD *)(v26 + 16);
  }
  return (BWVideoCompressorNode *)v15;
}

+ (BWVideoFormatRequirements)_formatRequirementsForCompressionSettings:(void *)a3 maxVideoFrameRate:(_DWORD *)a4 retainedBufferCountHint:(int)a5 maxLossyCompressionLevel:
{
  int v9;
  BWVideoFormatRequirements *v10;
  void *v11;

  objc_opt_self();
  if (a4)
  {
    *a4 = (int)(float)((float)((float)(a1 * 60.0) / 1000.0) + 3.0);
    if (a3)
    {
      *a4 += objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVVideoHEVCLookaheadFrames")), "intValue");
      v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("AVVideoHEVCExtraRetainedBufferCount")), "intValue");
      *a4 += objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("CVPixelBufferRecyclingSlop")), "intValue")+ v9;
    }
  }
  v10 = objc_alloc_init(BWVideoFormatRequirements);
  -[BWVideoFormatRequirements setWidthAlignment:](v10, "setWidthAlignment:", 16);
  -[BWVideoFormatRequirements setHeightAlignment:](v10, "setHeightAlignment:", 16);
  -[BWVideoFormatRequirements setBytesPerRowAlignment:](v10, "setBytesPerRowAlignment:", 64);
  -[BWVideoFormatRequirements setPlaneAlignment:](v10, "setPlaneAlignment:", 64);
  -[BWVideoFormatRequirements setSupportedCacheModes:](v10, "setSupportedCacheModes:", &unk_1E4A010B8);
  v11 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc_msgSend(v11, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(4, 1, 1, a5));
  objc_msgSend(v11, "addObjectsFromArray:", FigCaptureSupportedPixelFormatsForCompressionType(1, 1, 1, 0));
  objc_msgSend(v11, "addObjectsFromArray:", &unk_1E4A010D0);
  -[BWVideoFormatRequirements setSupportedPixelFormats:](v10, "setSupportedPixelFormats:", v11);
  return v10;
}

- (uint64_t)_updateThermalPressureLevel
{
  uint64_t v1;
  uint64_t state64;

  if (result)
  {
    v1 = result;
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    result = *(unsigned int *)(v1 + 228);
    if ((_DWORD)result)
    {
      state64 = 0;
      result = notify_get_state(result, &state64);
      if (*(_DWORD *)(v1 + 232) != (_DWORD)state64)
      {
        *(_DWORD *)(v1 + 232) = state64;
        return FigMemoryBarrier();
      }
    }
  }
  return result;
}

- (uint64_t)_updatePowerPressureLevel
{
  uint64_t v1;
  uint64_t state64;

  if (result)
  {
    v1 = result;
    if (!_FigIsCurrentDispatchQueue())
      FigDebugAssert3();
    result = *(unsigned int *)(v1 + 236);
    if ((_DWORD)result)
    {
      state64 = 0;
      result = notify_get_state(result, &state64);
      if (*(_DWORD *)(v1 + 240) != (_DWORD)state64)
      {
        *(_DWORD *)(v1 + 240) = state64;
        return FigMemoryBarrier();
      }
    }
  }
  return result;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    FigNote_AllowInternalDefaultLogs();
    fig_note_initialize_category_with_default_work_cf();
    fig_note_initialize_category_with_default_work_cf();
  }
}

uint64_t __177__BWVideoCompressorNode_initWithCompressionSettings_overCaptureEnabled_stereoVideoCompressionEnabled_maxVideoFrameRate_delayedCompressorCleanupEnabled_maxLossyCompressionLevel___block_invoke(uint64_t a1)
{
  return objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "referencedObject"), "_releaseCompressionSession");
}

- (void)dealloc
{
  NSObject *reapCompressionSessionTimer;
  __CVBuffer *thumbnailSourcePixelBuffer;
  objc_super v5;

  reapCompressionSessionTimer = self->_reapCompressionSessionTimer;
  if (reapCompressionSessionTimer)
  {
    dispatch_source_cancel(reapCompressionSessionTimer);

    self->_reapCompressionSessionTimer = 0;
  }

  self->_compressionSessionStateQueue = 0;
  if (self->_compressionSession)
  {
    -[BWVideoCompressorNode _releaseCompressionSession](self, "_releaseCompressionSession");
    self->_didPrepareToEncode = 0;
  }
  self->_encodedFirstVideoBuffer = 0;
  self->_emittedFirstVideoBuffer = 0;

  self->_compressionSettings = 0;
  self->_stereoTaggedCollections = 0;
  thumbnailSourcePixelBuffer = self->_thumbnailSourcePixelBuffer;
  if (thumbnailSourcePixelBuffer)
    CFRelease(thumbnailSourcePixelBuffer);

  self->_emitterQueue = 0;
  self->_thermalAndPowerNotificationQueue = 0;

  v5.receiver = self;
  v5.super_class = (Class)BWVideoCompressorNode;
  -[BWNode dealloc](&v5, sel_dealloc);
}

- (void)_cleanCompressor:(uint64_t)a1
{
  NSObject *v3;
  dispatch_time_t v4;

  if (a1)
  {
    if (*(_QWORD *)(a1 + 120))
    {
      if (a2 && *(_BYTE *)(a1 + 177))
      {
        v3 = *(NSObject **)(a1 + 160);
        v4 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 168) * 1000000000.0));
        dispatch_source_set_timer(v3, v4, 0xFFFFFFFFFFFFFFFFLL, 0);
      }
      else
      {
        objc_msgSend((id)a1, "_releaseCompressionSession");
      }
      *(_BYTE *)(a1 + 136) = 0;
    }
    *(_BYTE *)(a1 + 193) = 0;
    *(_BYTE *)(a1 + 194) = 0;
  }
}

- (id)nodeSubType
{
  return CFSTR("VideoCompressor");
}

- (void)suspendResources
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWVideoCompressorNode;
  -[BWNode suspendResources](&v3, sel_suspendResources);
  -[BWVideoCompressorNode _cleanCompressor:]((uint64_t)self, 1);
}

- (void)didReachEndOfDataForInput:(id)a3
{
  int thermalPressureNotificationToken;
  uint64_t v5;
  NSObject *thermalAndPowerNotificationQueue;
  int powerPressureNotificationToken;
  NSObject *v8;
  NSObject *reapCompressionSessionTimer;
  NSObject *compressionSessionStateQueue;
  NSObject *emitterQueue;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[5];
  _QWORD block[5];

  thermalPressureNotificationToken = self->_thermalPressureNotificationToken;
  v5 = MEMORY[0x1E0C809B0];
  if (thermalPressureNotificationToken)
  {
    notify_cancel(thermalPressureNotificationToken);
    thermalAndPowerNotificationQueue = self->_thermalAndPowerNotificationQueue;
    block[0] = v5;
    block[1] = 3221225472;
    block[2] = __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = self;
    dispatch_sync(thermalAndPowerNotificationQueue, block);
  }
  powerPressureNotificationToken = self->_powerPressureNotificationToken;
  if (powerPressureNotificationToken)
  {
    notify_cancel(powerPressureNotificationToken);
    v8 = self->_thermalAndPowerNotificationQueue;
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_2;
    v14[3] = &unk_1E491E720;
    v14[4] = self;
    dispatch_sync(v8, v14);
  }
  reapCompressionSessionTimer = self->_reapCompressionSessionTimer;
  if (reapCompressionSessionTimer)
    dispatch_source_set_timer(reapCompressionSessionTimer, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  compressionSessionStateQueue = self->_compressionSessionStateQueue;
  v13[0] = v5;
  v13[1] = 3221225472;
  v13[2] = __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_3;
  v13[3] = &unk_1E491E720;
  v13[4] = self;
  dispatch_sync(compressionSessionStateQueue, v13);
  -[BWLimitedGMErrorLogger resetCurrentLoggingCounter](self->_limitedGMErrorLogger, "resetCurrentLoggingCounter");
  emitterQueue = self->_emitterQueue;
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_4;
  v12[3] = &unk_1E491E720;
  v12[4] = self;
  dispatch_async(emitterQueue, v12);
}

uint64_t __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 228) = 0;
  return result;
}

uint64_t __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_2(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(result + 32) + 236) = 0;
  return result;
}

OpaqueVTCompressionSession *__51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_3(uint64_t a1)
{
  OpaqueVTCompressionSession *result;
  uint64_t v3;
  CMTime v4;

  result = *(OpaqueVTCompressionSession **)(*(_QWORD *)(a1 + 32) + 120);
  if (result)
  {
    v4 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
    result = (OpaqueVTCompressionSession *)VTCompressionSessionCompleteFrames(result, &v4);
    v3 = *(_QWORD *)(a1 + 32);
    if (v3)
    {
      if (*(_QWORD *)(v3 + 120))
      {
        result = (OpaqueVTCompressionSession *)objc_msgSend((id)v3, "_releaseCompressionSession");
        *(_BYTE *)(v3 + 136) = 0;
      }
      *(_BYTE *)(v3 + 193) = 0;
      *(_BYTE *)(v3 + 194) = 0;
    }
  }
  return result;
}

uint64_t __51__BWVideoCompressorNode_didReachEndOfDataForInput___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "markEndOfLiveOutput");
}

- (void)renderSampleBuffer:(opaqueCMSampleBuffer *)a3 forInput:(id)a4
{
  uint64_t v4;
  opaqueCMSampleBuffer *v6;
  const __CFString *v8;
  _DWORD *v9;
  CFTypeRef v10;
  const void *v11;
  OpaqueVTCompressionSession *v12;
  CVImageBufferRef ImageBuffer;
  CVImageBufferRef v14;
  opaqueCMSampleBuffer *AttachedMedia;
  opaqueCMSampleBuffer *v16;
  int64_t v17;
  _BOOL4 v18;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  const __CFDictionary *v20;
  CFTypeRef v21;
  void *v22;
  CFTypeRef v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  id v34;
  int64_t v35;
  int64_t v36;
  opaqueCMSampleBuffer *v37;
  void *v38;
  CFDictionaryRef v39;
  CFTypeRef v40;
  CFTypeRef v41;
  CFTypeRef v42;
  CVImageBufferRef v43;
  const __CFAllocator *v44;
  CFDictionaryRef v45;
  NSArray *smuggledSampleBufferAttachments;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t j;
  CVImageBufferRef v51;
  uint64_t v52;
  CFTypeRef v53;
  void *v54;
  uint64_t v55;
  char *__ptr32 *v56;
  int v57;
  int v58;
  int v59;
  int v60;
  int v61;
  int v62;
  OpaqueVTCompressionSession *compressionSession;
  NSObject *compressionSessionStateQueue;
  void *v65;
  id v66;
  void *v67;
  void *v68;
  uint64_t v69;
  CFTypeRef v70;
  _DWORD *v71;
  NSObject *v72;
  unsigned int value;
  unsigned int v74;
  NSString *v75;
  Float64 Seconds;
  int64_t maximumAllowedInFlightCompressedBytes;
  CFDictionaryRef v78;
  CFDictionaryRef v79;
  uint64_t v80;
  id v81;
  $95D729B680665BEAEFA1D6FCA8238556 *p_previousFrameOriginalPTS;
  void *v83;
  OpaqueVTCompressionSession *v84;
  OpaqueVTCompressionSession *v85;
  uint64_t v86;
  CFDictionaryRef v87;
  uint64_t *v88;
  uint64_t v89;
  id v90;
  NSObject *v91;
  void *v92;
  void *v93;
  int v94;
  void *v95;
  char v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  NSObject *emitterQueue;
  CMTime *p_lhs;
  uint64_t v102;
  __CVBuffer *v103;
  BWVideoCompressorNode *v104;
  opaqueCMSampleBuffer *v105;
  CFDictionaryRef frameProperties;
  CVImageBufferRef v107;
  const __CFString *key;
  CFTypeRef v109;
  id obj;
  opaqueCMSampleBuffer *target;
  _QWORD v112[6];
  CMTime v113;
  CMTime v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  CMTime v119;
  CMTime rhs;
  CMTime v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  os_log_type_t type;
  _QWORD v127[6];
  _QWORD block[5];
  CMTime time;
  int v130;
  CMTime v131;
  CMTime lhs;
  Float64 v133;
  __int16 v134;
  int64_t v135;
  _BYTE v136[128];
  _BYTE v137[128];
  CMTime completeUntilPresentationTimeStamp;
  uint64_t v139;

  v6 = a3;
  v139 = *MEMORY[0x1E0C80C00];
  v8 = (const __CFString *)*MEMORY[0x1E0D05CB0];
  CMGetAttachment(a3, (CFStringRef)*MEMORY[0x1E0D05CB0], 0);
  memset(&v131, 0, sizeof(v131));
  CMSampleBufferGetPresentationTimeStamp(&v131, v6);
  v130 = 0;
  v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
  if (*MEMORY[0x1E0CA1FC0])
  {
    CMSampleBufferGetPresentationTimeStamp(&time, v6);
    CMTimeGetSeconds(&time);
    FigCFDictionaryGetIntIfPresent();
    if (*v9 == 1)
    {
      -[BWVideoCompressorNode pipelineTraceID](self, "pipelineTraceID");
      kdebug_trace();
    }
  }
  target = v6;
  if (!v6)
  {
    v102 = v4;
    LODWORD(p_lhs) = 0;
    goto LABEL_168;
  }
  if (!a4)
  {
    v102 = v4;
    LODWORD(p_lhs) = 0;
    goto LABEL_168;
  }
  v10 = CMGetAttachment(v6, (CFStringRef)*MEMORY[0x1E0CA26A8], 0);
  v11 = (const void *)*MEMORY[0x1E0C9AE50];
  if (v10 == (CFTypeRef)*MEMORY[0x1E0C9AE50])
    self->_nextFrameEncodeAsKeyFrame = 1;
  if (!CMSampleBufferGetDataBuffer(v6) && !CMSampleBufferGetImageBuffer(v6))
  {
    v53 = CMGetAttachment(v6, CFSTR("FileWriterAction"), 0);
    if ((byte_1ECFE9520 & 0x20) != 0)
    {
      v54 = (void *)CMGetAttachment(v6, CFSTR("RecordingSettings"), 0);
      if (v54)
        objc_msgSend(v54, "settingsID");
    }
    v55 = MEMORY[0x1E0C809B0];
    v56 = &off_1A3161000;
    if (!v53)
      goto LABEL_154;
    v57 = CFEqual(v53, CFSTR("Stop"));
    v58 = CFEqual(v53, CFSTR("Pause"));
    v59 = CFEqual(v53, CFSTR("Terminate"));
    v60 = CFEqual(v53, CFSTR("Flush"));
    v61 = CFEqual(v53, CFSTR("Start"));
    v62 = CFEqual(v53, CFSTR("StreamForcedOff"));
    if (v57 | v60)
      CMSetAttachment(v6, CFSTR("FramesDroppedDueToFormatWriterQueueFull"), (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_numberOfFramesDroppedBecauseTooManyCompressedBytesInFlight), 1u);
    v55 = MEMORY[0x1E0C809B0];
    if (v58 || v57 || v59 || v60 || v62)
    {
      compressionSession = self->_compressionSession;
      if (compressionSession)
      {
        completeUntilPresentationTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
        VTCompressionSessionCompleteFrames(compressionSession, &completeUntilPresentationTimeStamp);
      }
      if (v57 || v59 || v60)
      {
        compressionSessionStateQueue = self->_compressionSessionStateQueue;
        block[0] = v55;
        block[1] = 3221225472;
        block[2] = __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke;
        block[3] = &unk_1E491E720;
        block[4] = self;
        dispatch_sync(compressionSessionStateQueue, block);
      }
      -[BWLimitedGMErrorLogger resetCurrentLoggingCounter](self->_limitedGMErrorLogger, "resetCurrentLoggingCounter");
    }
    v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    if (v61)
    {
      v65 = (void *)CMGetAttachment(v6, CFSTR("RecordingVideoSettings"), 0);
      v66 = v65;
      if (self->_alternateCompressionSettingsKey)
        v66 = (id)objc_msgSend(v65, "objectForKeyedSubscript:");
      if (v66 && (objc_msgSend(v66, "isEqualToDictionary:", self->_compressionSettings) & 1) == 0)
      {
        if (self->_compressionDimensionsFromInputEnabled)
        {
          v66 = (id)objc_msgSend(v66, "mutableCopy");
          objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[BWVideoFormat width](-[BWNodeOutput videoFormat](self->super._output, "videoFormat"), "width")), CFSTR("AVVideoWidthKey"));
          objc_msgSend(v66, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", -[BWVideoFormat height](-[BWNodeOutput videoFormat](self->super._output, "videoFormat"), "height")), CFSTR("AVVideoHeightKey"));
          v67 = v66;
        }
        else
        {
          v67 = 0;
        }

        self->_stereoTaggedCollections = 0;
        if (self->_stereoVideoCompressionEnabled)
        {
          v55 = MEMORY[0x1E0C809B0];
          if (self->_stereoVideoBaseline <= 0.0)
          {
            v102 = v4;
            LODWORD(p_lhs) = 0;
            FigDebugAssert3();
            LOBYTE(v78) = 1;
            v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
LABEL_169:
            v80 = FigSignalErrorAt();
            v79 = 0;
            v87 = 0;
            if (!(_DWORD)v80)
            {
LABEL_123:

              BWSampleBufferRemoveAllAttachedMedia(target);
              if ((v78 & 1) != 0)
                goto LABEL_157;
              goto LABEL_124;
            }
LABEL_122:
            -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", v80, CFSTR("when rendering"), p_lhs, v102);
            v87 = v79;
            goto LABEL_123;
          }
          if (!v67)
          {
            v66 = (id)objc_msgSend(v66, "mutableCopy");
            v67 = v66;
          }
          v94 = objc_msgSend((id)CMGetAttachment(v6, CFSTR("RecordingSettings"), 0), "videoOrientation");
          -[BWVideoCompressorNode _addStereoCompressionPropertiesToCompressionSettings:videoOrientation:]((uint64_t)self, v67, v94);
        }
        else
        {
          v55 = MEMORY[0x1E0C809B0];
        }

        self->_compressionSettings = (NSDictionary *)objc_msgSend(v66, "copy");
        -[BWVideoCompressorNode _verifyDimensions:]((uint64_t)self, -[BWNodeOutput videoFormat](self->super._output, "videoFormat"));
        v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
      }
      v95 = (void *)CMGetAttachment(v6, CFSTR("RecordingSettings"), 0);
      if (objc_msgSend(v95, "sendPreviewIOSurface"))
        self->_attachThumbnailSourcePixelBuffer = 1;
      if ((-[__CFString isEqualToString:](self->_alternateCompressionSettingsKey, "isEqualToString:", 0x1E4959D38) & 1) != 0
        || (-[__CFString isEqualToString:](self->_alternateCompressionSettingsKey, "isEqualToString:", 0x1E4959D58) & 1) != 0
        || -[__CFString isEqualToString:](self->_alternateCompressionSettingsKey, "isEqualToString:", 0x1E4959D78))
      {
        v96 = objc_msgSend(v95, "smartStyleReversibilitySupported") ^ 1;
      }
      else
      {
        v96 = 0;
      }
      if (!self->_didPrepareToEncode && (v96 & 1) == 0)
        -[BWVideoCompressorNode _prepareForVideoCompression]((uint64_t)self);
      self->_nextFrameEncodeAsKeyFrame = 1;
    }
    if (v60)
      self->_flushRequestReceived = 1;
    v56 = &off_1A3161000;
    if (v61 && self->_compressionSession)
    {
      v97 = *MEMORY[0x1E0CED010];
      v92 = (void *)-[BWVideoCompressorNode _copyCompressionSessionProperty:requireSupported:error:]((uint64_t)self, (const __CFString *)*MEMORY[0x1E0CED010], 0, 0);
      v98 = *MEMORY[0x1E0CED018];
      v93 = (void *)-[BWVideoCompressorNode _copyCompressionSessionProperty:requireSupported:error:]((uint64_t)self, (const __CFString *)*MEMORY[0x1E0CED018], 0, 0);
      v99 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
      objc_msgSend(v99, "setObject:forKeyedSubscript:", (id)objc_msgSend(v92, "copy"), v97);
      objc_msgSend(v99, "setObject:forKeyedSubscript:", (id)objc_msgSend(v93, "copy"), v98);
      if (objc_msgSend(v99, "count"))
        CMSetAttachment(v6, CFSTR("TemporalScalabilityProperties"), (id)objc_msgSend(v99, "copy"), 1u);
      v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
    }
    else
    {
LABEL_154:
      v93 = 0;
      v92 = 0;
    }
    CFRetain(v6);
    emitterQueue = self->_emitterQueue;
    v127[0] = v55;
    v127[1] = *((_QWORD *)v56 + 459);
    v127[2] = __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke_2;
    v127[3] = &unk_1E491F158;
    v127[4] = self;
    v127[5] = v6;
    dispatch_async(emitterQueue, v127);
    v79 = 0;
    goto LABEL_156;
  }
  v12 = self->_compressionSession;
  if (!self->_flushRequestReceived)
  {
    if (!v12)
    {
      v102 = v4;
      LODWORD(p_lhs) = 0;
      goto LABEL_168;
    }
    goto LABEL_14;
  }
  if (v12)
  {
LABEL_14:
    if (!self->_didPrepareToEncode)
    {
      v102 = v4;
      LODWORD(p_lhs) = 0;
      FigDebugAssert3();
      LOBYTE(v78) = 0;
      goto LABEL_169;
    }
    ImageBuffer = CMSampleBufferGetImageBuffer(v6);
    if (!ImageBuffer)
    {
      v102 = v4;
      LODWORD(p_lhs) = 0;
      goto LABEL_168;
    }
    v14 = ImageBuffer;
    v109 = v11;
    if (self->_stereoVideoCompressionEnabled)
    {
      AttachedMedia = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v6, (uint64_t)CFSTR("SynchronizedSlaveFrame"));
      if (!AttachedMedia)
      {
        v102 = v4;
        LODWORD(p_lhs) = 0;
        goto LABEL_168;
      }
      v16 = AttachedMedia;
      v107 = CMSampleBufferGetImageBuffer(AttachedMedia);
      if (!v107)
      {
        v102 = v4;
        LODWORD(p_lhs) = 0;
LABEL_168:
        FigDebugAssert3();
        LOBYTE(v78) = 0;
        goto LABEL_169;
      }
    }
    else
    {
      v16 = 0;
      v107 = 0;
    }
    v105 = v16;
    if (self->_maximumAllowedInFlightCompressedBytes && self->_encodedFirstVideoBuffer)
    {
      v17 = +[BWBufferometer totalTrackedSizeInFlight](BWBufferometer, "totalTrackedSizeInFlight");
      v18 = v17 > self->_inFlightCompressedBytesWarningThreshold;
      if (self->_inFlightCompressedBytesOverWarningThreshold != v18)
        self->_inFlightCompressedBytesOverWarningThreshold = v18;
      if (v17 > self->_maximumAllowedInFlightCompressedBytes)
      {
        ++self->_numberOfFramesDroppedBecauseTooManyCompressedBytesInFlight;
        LODWORD(rhs.value) = 0;
        type = OS_LOG_TYPE_DEFAULT;
        os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        LOBYTE(v78) = 0;
        v79 = 0;
        v80 = 4294954510;
        goto LABEL_122;
      }
    }
    if (self->_attachThumbnailSourcePixelBuffer)
    {
      self->_attachThumbnailSourcePixelBuffer = 0;
      self->_thumbnailSourcePixelBuffer = (__CVBuffer *)CFRetain(v14);
    }
    v20 = (const __CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v78 = v20;
    v21 = v109;
    if (!v20)
    {
      v102 = v4;
      LODWORD(p_lhs) = 0;
      FigDebugAssert3();
      goto LABEL_169;
    }
    if (self->_nextFrameEncodeAsKeyFrame)
    {
      self->_nextFrameEncodeAsKeyFrame = 0;
      -[__CFDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v109, *MEMORY[0x1E0CED5B8]);
    }
    if (CMGetAttachment(v6, CFSTR("FinalFrameInSequence"), 0) == v109)
      -[__CFDictionary setObject:forKeyedSubscript:](v78, "setObject:forKeyedSubscript:", v109, *MEMORY[0x1E0CED598]);
    v22 = (void *)CMGetAttachment(v6, v8, 0);
    frameProperties = v78;
    key = v8;
    if (self->_propagateStabilizedFacesToAVE)
    {
      v23 = CMGetAttachment(v6, CFSTR("DetectedFacesArrayHasBeenStabilized"), 0);
      v24 = (void *)objc_msgSend(v22, "objectForKeyedSubscript:", *MEMORY[0x1E0D06998]);
      v25 = (void *)v23;
      v21 = v109;
      if (objc_msgSend(v25, "BOOLValue"))
      {
        if (objc_msgSend(v24, "count"))
        {
          v103 = v14;
          v104 = self;
          v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          memset(&completeUntilPresentationTimeStamp, 0, sizeof(completeUntilPresentationTimeStamp));
          CMSampleBufferGetPresentationTimeStamp(&completeUntilPresentationTimeStamp, v6);
          v124 = 0u;
          v125 = 0u;
          v122 = 0u;
          v123 = 0u;
          obj = v24;
          v27 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v122, v137, 16);
          if (v27)
          {
            v28 = v27;
            v29 = *(_QWORD *)v123;
            v30 = *MEMORY[0x1E0D064D8];
            v31 = *MEMORY[0x1E0D06F20];
            do
            {
              for (i = 0; i != v28; ++i)
              {
                if (*(_QWORD *)v123 != v29)
                  objc_enumerationMutation(obj);
                v33 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
                v34 = (id)objc_msgSend(v33, "mutableCopy");
                memset(&lhs, 0, sizeof(lhs));
                objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", v30), "longLongValue");
                v35 = FigHostTimeToNanoseconds();
                CMTimeMake(&v121, v35, 1000000000);
                CMTimeConvertScale(&lhs, &v121, completeUntilPresentationTimeStamp.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                objc_msgSend(v34, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", lhs.value), v30);
                objc_msgSend((id)objc_msgSend(v33, "objectForKeyedSubscript:", v31), "longLongValue");
                v36 = FigHostTimeToNanoseconds();
                CMTimeMake(&v119, v36, 1000000000);
                CMTimeConvertScale(&rhs, &v119, completeUntilPresentationTimeStamp.timescale, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
                lhs = rhs;
                objc_msgSend(v34, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", rhs.value), v31);
                objc_msgSend(v26, "addObject:", v34);
              }
              v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v122, v137, 16);
            }
            while (v28);
          }
          v78 = frameProperties;
          -[__CFDictionary setObject:forKeyedSubscript:](frameProperties, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0CED658]);
          v14 = v103;
          self = v104;
          v9 = (_DWORD *)MEMORY[0x1E0CA1FC0];
          v21 = v109;
        }
      }
    }
    v37 = (opaqueCMSampleBuffer *)BWSampleBufferGetAttachedMedia(v6, 0x1E495B458);
    if (v37)
      -[__CFDictionary setObject:forKeyedSubscript:](v78, "setObject:forKeyedSubscript:", CMSampleBufferGetImageBuffer(v37), *MEMORY[0x1E0CED610]);
    if (self->_resetCodec)
      -[__CFDictionary setObject:forKeyedSubscript:](v78, "setObject:forKeyedSubscript:", v21, CFSTR("ResetRCState"));
    v38 = -[BWVideoCompressorNode _HDRImageStatisticsDictFromSampleBuffer:metadata:]((uint64_t)self, (uint64_t)v6, v22);
    if (v38)
      -[__CFDictionary setObject:forKeyedSubscript:](v78, "setObject:forKeyedSubscript:", v38, *MEMORY[0x1E0CED5D0]);
    v39 = CVBufferCopyAttachments(v14, kCVAttachmentMode_ShouldPropagate);
    if (v39)
      v40 = CFAutorelease(v39);
    else
      v40 = 0;
    if (BWColorSpacePropertiesIsHDR(+[BWVideoFormat colorSpacePropertiesForPixelBufferAttachments:](BWVideoFormat, "colorSpacePropertiesForPixelBufferAttachments:", v40)))
    {
      v41 = CVBufferCopyAttachment(v14, (CFStringRef)*MEMORY[0x1E0CA8CC8], 0);
      if (v41)
      {
        v42 = CFAutorelease(v41);
        if (v42)
          -[__CFDictionary setObject:forKeyedSubscript:](v78, "setObject:forKeyedSubscript:", v42, *MEMORY[0x1E0CED4B0]);
      }
    }
    v43 = v14;
    v44 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    completeUntilPresentationTimeStamp = v131;
    v45 = CMTimeCopyAsDictionary(&completeUntilPresentationTimeStamp, v44);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", v45, CFSTR("VideoCompressorNodeAttachedPTS"));

    v117 = 0u;
    v118 = 0u;
    v115 = 0u;
    v116 = 0u;
    smuggledSampleBufferAttachments = self->_smuggledSampleBufferAttachments;
    v47 = -[NSArray countByEnumeratingWithState:objects:count:](smuggledSampleBufferAttachments, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
    if (v47)
    {
      v48 = v47;
      v49 = *(_QWORD *)v116;
      do
      {
        for (j = 0; j != v48; ++j)
        {
          if (*(_QWORD *)v116 != v49)
            objc_enumerationMutation(smuggledSampleBufferAttachments);
          objc_msgSend(v22, "setObject:forKeyedSubscript:", CMGetAttachment(target, *(CFStringRef *)(*((_QWORD *)&v115 + 1) + 8 * j), 0), *(_QWORD *)(*((_QWORD *)&v115 + 1) + 8 * j));
        }
        v48 = -[NSArray countByEnumeratingWithState:objects:count:](smuggledSampleBufferAttachments, "countByEnumeratingWithState:objects:count:", &v115, v136, 16);
      }
      while (v48);
    }
    v6 = target;
    v51 = v43;
    if (self->_shouldAttachDebugSEI)
    {
      CMSetAttachment(v43, key, v22, 1u);
      if (self->_stereoVideoCompressionEnabled)
      {
        if (CMGetAttachment(v105, key, 0))
          v52 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:");
        else
          v52 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v68 = (void *)v52;
        v69 = *MEMORY[0x1E0D05D00];
        v70 = CMGetAttachment(v105, (CFStringRef)*MEMORY[0x1E0D05D00], 0);
        if (v70)
          objc_msgSend(v68, "setObject:forKeyedSubscript:", v70, v69);
        CMSetAttachment(v107, key, v68, 1u);
        v51 = v43;
      }
    }
    if (self->_bFrameEncodingAllowed)
      -[BWVideoCompressorNode _validateBFrameEncodingAbility]((uint64_t)self);
    memset(&v114, 0, sizeof(v114));
    CMSampleBufferGetDuration(&v114, target);
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CMGetAttachment(v51, CFSTR("MirroredHorizontal"), 0), CFSTR("MirroredHorizontal"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CMGetAttachment(v51, CFSTR("MirroredVertical"), 0), CFSTR("MirroredVertical"));
    objc_msgSend(v22, "setObject:forKeyedSubscript:", CMGetAttachment(v51, CFSTR("RotationDegrees"), 0), 0x1E493E838);
    if (!self->_encodedFirstVideoBuffer)
    {
      self->_encodedFirstVideoBuffer = 1;
      if (dword_1ECFE9530)
      {
        v71 = v9;
        LODWORD(rhs.value) = 0;
        type = OS_LOG_TYPE_DEFAULT;
        v72 = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
        value = rhs.value;
        if (os_log_type_enabled(v72, type))
          v74 = value;
        else
          v74 = value & 0xFFFFFFFE;
        if (v74)
        {
          v75 = -[BWNode name](self, "name");
          completeUntilPresentationTimeStamp = v131;
          Seconds = CMTimeGetSeconds(&completeUntilPresentationTimeStamp);
          maximumAllowedInFlightCompressedBytes = self->_maximumAllowedInFlightCompressedBytes;
          LODWORD(lhs.value) = 136315906;
          *(CMTimeValue *)((char *)&lhs.value + 4) = (CMTimeValue)"-[BWVideoCompressorNode renderSampleBuffer:forInput:]";
          LOWORD(lhs.flags) = 2112;
          *(_QWORD *)((char *)&lhs.flags + 2) = v75;
          HIWORD(lhs.epoch) = 2048;
          v133 = Seconds;
          v134 = 2048;
          v135 = maximumAllowedInFlightCompressedBytes;
          LODWORD(v102) = 42;
          p_lhs = &lhs;
          _os_log_send_and_compose_impl();
        }
        fig_log_call_emit_and_clean_up_after_send_and_compose();
        v9 = v71;
        v6 = target;
        v51 = v43;
      }
    }
    v81 = v22;
    memset(&v113, 0, sizeof(v113));
    BWGetOriginalPresentationTimeStampFromBuffer(v6, (uint64_t)&v113);
    p_previousFrameOriginalPTS = &self->_previousFrameOriginalPTS;
    if ((self->_previousFrameOriginalPTS.flags & 1) != 0)
    {
      memset(&completeUntilPresentationTimeStamp, 0, sizeof(completeUntilPresentationTimeStamp));
      lhs = v113;
      *(_OWORD *)&rhs.value = *(_OWORD *)&p_previousFrameOriginalPTS->value;
      rhs.epoch = self->_previousFrameOriginalPTS.epoch;
      CMTimeSubtract(&completeUntilPresentationTimeStamp, &lhs, &rhs);
      lhs = completeUntilPresentationTimeStamp;
      objc_msgSend(v22, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", CMTimeGetSeconds(&lhs)), *MEMORY[0x1E0D06D18]);
    }
    *(_OWORD *)&p_previousFrameOriginalPTS->value = *(_OWORD *)&v113.value;
    self->_previousFrameOriginalPTS.epoch = v113.epoch;
    if (self->_stereoVideoCompressionEnabled)
    {
      v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D20]), "initWithObjects:", v51, v107, 0);
      rhs.value = 0;
      v80 = MEMORY[0x1A858BEBC](v44, self->_stereoTaggedCollections, v83, &rhs);
      if ((_DWORD)v80 || !rhs.value)
      {

        -[BWLimitedGMErrorLogger logErrorNumber:errorString:](self->_limitedGMErrorLogger, "logErrorNumber:errorString:", v80, CFSTR("could not create stereo tagged buffer group"));
        v79 = frameProperties;
      }
      else
      {
        v84 = self->_compressionSession;
        completeUntilPresentationTimeStamp = v131;
        lhs = v114;
        v79 = frameProperties;
        v80 = VTCompressionSessionEncodeMultiImageFrame(v84, (CMTaggedBufferGroupRef)rhs.value, &completeUntilPresentationTimeStamp, &lhs, frameProperties, v22, 0);
        if ((_DWORD)v80)

      }
      if (rhs.value)
        CFRelease((CFTypeRef)rhs.value);

      if ((_DWORD)v80)
        goto LABEL_121;
    }
    else
    {
      v85 = self->_compressionSession;
      completeUntilPresentationTimeStamp = v131;
      lhs = v114;
      v79 = frameProperties;
      v86 = VTCompressionSessionEncodeFrame(v85, v51, &completeUntilPresentationTimeStamp, &lhs, frameProperties, v22, 0);
      if ((_DWORD)v86)
      {
        v80 = v86;

LABEL_121:
        LOBYTE(v78) = 0;
        goto LABEL_122;
      }
    }
    v92 = 0;
    v93 = 0;
    self->_resetCodec = 0;
LABEL_156:

    BWSampleBufferRemoveAllAttachedMedia(v6);
    goto LABEL_157;
  }
  BWSampleBufferRemoveAllAttachedMedia(v6);
LABEL_124:
  if (self->_numberOfFramesDroppedBecauseTooManyCompressedBytesInFlight <= 0)
    v88 = (uint64_t *)BWDroppedSampleReasonVideoCompressionFailure;
  else
    v88 = &BWDroppedSampleReasonVideoCompressionFormatWriterQueueFull;
  v89 = *v88;
  completeUntilPresentationTimeStamp = v131;
  v90 = +[BWDroppedSample newDroppedSampleWithReason:pts:](BWDroppedSample, "newDroppedSampleWithReason:pts:", v89, &completeUntilPresentationTimeStamp, p_lhs);
  v91 = self->_emitterQueue;
  v112[0] = MEMORY[0x1E0C809B0];
  v112[1] = 3221225472;
  v112[2] = __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke_58;
  v112[3] = &unk_1E491E748;
  v112[4] = self;
  v112[5] = v90;
  dispatch_async(v91, v112);
LABEL_157:
  if (*v9 == 1)
  {
    -[BWVideoCompressorNode pipelineTraceID](self, "pipelineTraceID");
    kdebug_trace();
  }
}

void __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke(uint64_t a1)
{
  -[BWVideoCompressorNode _cleanCompressor:](*(_QWORD *)(a1 + 32), 1);
}

- (void)_addStereoCompressionPropertiesToCompressionSettings:(int)a3 videoOrientation:
{
  id v6;
  void *v7;
  _BOOL8 v8;
  uint64_t v9;
  const __CFAllocator *v10;
  BOOL v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CMTagCollectionRef v19;
  CMTagCollectionRef newCollectionOut;
  CMTag v21;
  CMTag tags;
  _QWORD v23[2];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AVVideoCompressionPropertiesKey")))
      v6 = (id)objc_msgSend((id)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AVVideoCompressionPropertiesKey")), "mutableCopy");
    else
      v6 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v7 = v6;
    objc_msgSend(a2, "setObject:forKeyedSubscript:", v6, CFSTR("AVVideoCompressionPropertiesKey"));
    v11 = a3 == 4;
    v8 = a3 == 4;
    v9 = !v11;
    tags = CMTagMakeWithSInt64Value(kCMTagCategory_VideoLayerID, 0);
    v21 = CMTagMakeWithSInt64Value(kCMTagCategory_VideoLayerID, 1);
    v19 = 0;
    newCollectionOut = 0;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (!CMTagCollectionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], &tags, 1, &newCollectionOut))
    {
      v11 = CMTagCollectionCreate(v10, &v21, 1, &v19) || newCollectionOut == 0;
      if (!v11 && v19 != 0)
      {
        v24[0] = newCollectionOut;
        v24[1] = v19;
        *(_QWORD *)(a1 + 288) = (id)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v24, 2);
        v13 = (float)(*(float *)(a1 + 368) * 1000.0);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E4A010E8, *MEMORY[0x1E0CED080]);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E4A010E8, *MEMORY[0x1E0CED088]);
        v23[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
        v23[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8);
        v14 = objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v23, 2);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CED078]);
        v15 = *MEMORY[0x1E0C9AE50];
        objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0C9AE50], *MEMORY[0x1E0CED030]);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v15, *MEMORY[0x1E0CED038]);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CA4AA8], *MEMORY[0x1E0CED188]);
        v16 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v13);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CED200]);
        v17 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 200);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0CED048]);
        v18 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 63400);
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CED050]);
      }
    }

    if (newCollectionOut)
      CFRelease(newCollectionOut);
    if (v19)
      CFRelease(v19);
  }
}

- (void)_prepareForVideoCompression
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[5];

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 160);
    if (v2)
      dispatch_source_set_timer(v2, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    v3 = *(NSObject **)(a1 + 152);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __52__BWVideoCompressorNode__prepareForVideoCompression__block_invoke;
    block[3] = &unk_1E491E720;
    block[4] = a1;
    dispatch_sync(v3, block);
  }
}

- (uint64_t)_copyCompressionSessionProperty:(int)a3 requireSupported:(int *)a4 error:
{
  uint64_t v5;
  void *v6;
  int v9;
  uint64_t propertyValueOut;

  if (result)
  {
    v5 = result;
    propertyValueOut = 0;
    if (*(_QWORD *)(result + 120) && (v6 = *(void **)(result + 128)) != 0 && a2)
    {
      if (objc_msgSend(v6, "objectForKeyedSubscript:", a2))
      {
        v9 = VTSessionCopyProperty(*(VTSessionRef *)(v5 + 120), a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], &propertyValueOut);
        if (!a4)
          return propertyValueOut;
      }
      else
      {
        if (a3)
          v9 = -12787;
        else
          v9 = 0;
        if (!a4)
          return propertyValueOut;
      }
    }
    else
    {
      FigDebugAssert3();
      v9 = FigSignalErrorAt();
      if (!a4)
        return propertyValueOut;
    }
    *a4 = v9;
    return propertyValueOut;
  }
  return result;
}

void __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitSampleBuffer:", *(_QWORD *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)_HDRImageStatisticsDictFromSampleBuffer:(void *)a3 metadata:
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;
  _QWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  uint64_t v14;
  _QWORD *v15;
  void *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;

  if (!a1)
    return 0;
  v3 = 0;
  if (a2)
  {
    if (a3)
    {
      v4 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D06B00]);
      v3 = v4;
      if (v4)
      {
        v5 = *MEMORY[0x1E0D06600];
        v6 = objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0D06600]);
        v7 = (_QWORD *)MEMORY[0x1E0D065F8];
        v8 = (_QWORD *)MEMORY[0x1E0CA8E30];
        v9 = (_QWORD *)MEMORY[0x1E0D065F0];
        v10 = (_QWORD *)MEMORY[0x1E0CA8E28];
        v11 = (_QWORD *)MEMORY[0x1E0D065E0];
        v12 = (_QWORD *)MEMORY[0x1E0CA8E20];
        v13 = (_QWORD *)MEMORY[0x1E0CA8E18];
        if (v6)
        {
          v14 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          objc_msgSend((id)v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v5), "objectForKeyedSubscript:", *v7), *v8);
          objc_msgSend((id)v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v5), "objectForKeyedSubscript:", *v9), *v10);
          objc_msgSend((id)v14, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v5), "objectForKeyedSubscript:", *v11), *v12);
          v15 = (_QWORD *)MEMORY[0x1E0CA8EC8];
          objc_msgSend((id)v14, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CA8EC8], *v13);
          v16 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v5);
          v17 = (_QWORD *)MEMORY[0x1E0D065D0];
          v18 = objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0D065D0]);
          v19 = (_QWORD *)MEMORY[0x1E0CED688];
          objc_msgSend((id)v14, "setObject:forKeyedSubscript:", v18, *MEMORY[0x1E0CED688]);
          v20 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v5);
          v21 = (_QWORD *)MEMORY[0x1E0D065D8];
          v22 = objc_msgSend(v20, "objectForKeyedSubscript:", *MEMORY[0x1E0D065D8]);
          v23 = (_QWORD *)MEMORY[0x1E0CED690];
          objc_msgSend((id)v14, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0CED690]);
        }
        else
        {
          v15 = (_QWORD *)MEMORY[0x1E0CA8EC8];
          v17 = (_QWORD *)MEMORY[0x1E0D065D0];
          v19 = (_QWORD *)MEMORY[0x1E0CED688];
          v21 = (_QWORD *)MEMORY[0x1E0D065D8];
          v23 = (_QWORD *)MEMORY[0x1E0CED690];
          v14 = 0;
        }
        v24 = *MEMORY[0x1E0D065E8];
        if (objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0D065E8]))
        {
          v25 = objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          v26 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v24);
          v27 = objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0D065F8]);
          objc_msgSend((id)v25, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0CA8E30]);
          v28 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v24);
          v29 = objc_msgSend(v28, "objectForKeyedSubscript:", *MEMORY[0x1E0D065F0]);
          objc_msgSend((id)v25, "setObject:forKeyedSubscript:", v29, *MEMORY[0x1E0CA8E28]);
          v30 = (void *)objc_msgSend(v3, "objectForKeyedSubscript:", v24);
          v31 = objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x1E0D065E0]);
          objc_msgSend((id)v25, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0CA8E20]);
          objc_msgSend((id)v25, "setObject:forKeyedSubscript:", *v15, *MEMORY[0x1E0CA8E18]);
          objc_msgSend((id)v25, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v24), "objectForKeyedSubscript:", *v17), *v19);
          objc_msgSend((id)v25, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(v3, "objectForKeyedSubscript:", v24), "objectForKeyedSubscript:", *v21), *v23);
        }
        else
        {
          v25 = 0;
        }
        if (v14 | v25)
        {
          v3 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, *MEMORY[0x1E0CA8E10]);
          objc_msgSend(v3, "setObject:forKeyedSubscript:", v25, *MEMORY[0x1E0CA8E08]);
          return v3;
        }
        return 0;
      }
    }
  }
  return v3;
}

- (void)_validateBFrameEncodingAbility
{
  int v2;
  int v3;
  double v4;
  OpaqueCMClock *HostTimeClock;
  int v6;
  BOOL v8;
  CMTime time;

  if (!a1 || !*(_BYTE *)(a1 + 244))
    return;
  FigMemoryBarrier();
  v2 = *(_DWORD *)(a1 + 232);
  v3 = *(_DWORD *)(a1 + 240);
  v4 = *(double *)(a1 + 216);
  if (v4 != 0.0)
  {
    HostTimeClock = CMClockGetHostTimeClock();
    CMClockGetTime(&time, HostTimeClock);
    if (v4 > CMTimeGetSeconds(&time))
    {
      v6 = 30;
      goto LABEL_8;
    }
    *(_QWORD *)(a1 + 216) = 0;
  }
  v6 = 20;
LABEL_8:
  v8 = v2 < v6 && v3 < v6;
  *(_BYTE *)(a1 + 245) = v8;
  if (!*(_BYTE *)(a1 + 245))
  {
    if (-[BWVideoCompressorNode _setCompressionSessionProperty:value:requireSupported:](a1, (const __CFString *)*MEMORY[0x1E0CECEB0], MEMORY[0x1E0C9AAA0], 1))FigDebugAssert3();
    if (*(_DWORD *)(a1 + 224))
    {
      if (-[BWVideoCompressorNode _setCompressionSessionProperty:value:requireSupported:](a1, (const __CFString *)*MEMORY[0x1E0CECEF0], (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), 1))FigDebugAssert3();
    }
  }
}

void __53__BWVideoCompressorNode_renderSampleBuffer_forInput___block_invoke_58(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitDroppedSample:", *(_QWORD *)(a1 + 40));

}

- (void)handleDroppedSample:(id)a3 forInput:(id)a4
{
  NSObject *emitterQueue;
  _QWORD v5[6];

  emitterQueue = self->_emitterQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__BWVideoCompressorNode_handleDroppedSample_forInput___block_invoke;
  v5[3] = &unk_1E491E748;
  v5[4] = self;
  v5[5] = a3;
  dispatch_async(emitterQueue, v5);
}

uint64_t __54__BWVideoCompressorNode_handleDroppedSample_forInput___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "emitDroppedSample:", *(_QWORD *)(a1 + 40));
}

- (void)insertKeyFrame
{
  self->_nextFrameEncodeAsKeyFrame = 1;
  __dmb(0xBu);
}

_QWORD *__52__BWVideoCompressorNode__prepareForVideoCompression__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  _BYTE *v4;
  _QWORD *result;

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v2 + 120))
  {
    if (*(_BYTE *)(v2 + 177))
    {
      v3 = objc_msgSend(*(id *)(v2 + 96), "isEqualToDictionary:", *(_QWORD *)(v2 + 104));
      v4 = *(_BYTE **)(a1 + 32);
      if (v3)
      {
        v4[136] = 1;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 250) = 0;
        *(_BYTE *)(*(_QWORD *)(a1 + 32) + 178) = 1;
      }
      else
      {
        objc_msgSend(v4, "_releaseCompressionSession");
      }
    }
    else
    {
      objc_msgSend(*(id *)(v2 + 272), "logErrorNumber:errorString:", 0xFFFFFFFFLL, CFSTR("unexpectedly already have un-re-usable compression session, will continue to use"));
    }
  }
  result = *(_QWORD **)(a1 + 32);
  if (!result[15])
    return -[BWVideoCompressorNode _createCompressionSession](result);
  return result;
}

- (_QWORD)_createCompressionSession
{
  uint64_t v1;
  void *v2;
  id v3;
  CMVideoCodecType v4;
  uint64_t v5;
  uint64_t v6;
  const __CFDictionary *v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v12;
  void *v13;
  float v14;
  OpaqueCMClock *HostTimeClock;
  double v16;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  char v18;
  double v19;
  _BOOL4 v20;
  void *v21;
  uint64_t v22;
  CMTime time;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (uint64_t)result;
    if (result[15])
      return (_QWORD *)FigSignalErrorAt();
    v2 = (void *)result[12];
    if (v2)
    {
      v3 = (id)objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("AVVideoCodecKey"));
      *(_QWORD *)(v1 + 296) = v3;
      if (v3)
        v4 = BWOSTypeForString(v3);
      else
        v4 = 0;
      v5 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "objectForKeyedSubscript:", CFSTR("AVVideoWidthKey")), "unsignedIntegerValue");
      v6 = objc_msgSend((id)objc_msgSend(*(id *)(v1 + 96), "objectForKeyedSubscript:", CFSTR("AVVideoHeightKey")), "unsignedIntegerValue");
      v7 = (const __CFDictionary *)objc_msgSend(*(id *)(v1 + 96), "objectForKeyedSubscript:", CFSTR("AVVideoEncoderSpecificationKey"));
      result = (_QWORD *)objc_msgSend(*(id *)(v1 + 96), "objectForKeyedSubscript:", CFSTR("AVVideoCompressionPropertiesKey"));
      v8 = result;
      if (*(_QWORD *)(v1 + 360))
      {
        if (result)
          v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", result);
        else
          v9 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v8 = v9;
        result = (_QWORD *)objc_msgSend(v9, "setValuesForKeysWithDictionary:", *(_QWORD *)(v1 + 360));
      }
      if (v5)
        v10 = v6 == 0;
      else
        v10 = 1;
      if (!v10 && v4 != 0)
      {
        *(_QWORD *)(v1 + 120) = -[BWVideoCompressorNode _createEncoderSessionWithWidth:height:inputPixelFormat:isHDResolution:videoCodec:encoderSpecification:compressionProperties:compressorNodeRef:]((VTSessionRef)v1, v5, v6, *(unsigned int *)(v1 + 140), *(unsigned __int8 *)(v1 + 137), v4, v7, v8, (void *)v1);
        *(_BYTE *)(v1 + 245) = 0;
        *(_BYTE *)(v1 + 244) = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("AllowFrameReordering")), "BOOLValue");
        if (*(_BYTE *)(v1 + 244))
        {
          v12 = (void *)-[BWVideoCompressorNode _copyCompressionSessionProperty:requireSupported:error:](v1, (const __CFString *)*MEMORY[0x1E0CECEB0], 0, 0);
          *(_BYTE *)(v1 + 244) = objc_msgSend(v12, "BOOLValue");

        }
        *(_DWORD *)(v1 + 224) = 0;
        if (*(_BYTE *)(v1 + 244))
        {
          v13 = (void *)-[BWVideoCompressorNode _copyCompressionSessionProperty:requireSupported:error:](v1, (const __CFString *)*MEMORY[0x1E0CECEF0], 0, 0);
          objc_msgSend(v13, "floatValue");
          *(_DWORD *)(v1 + 224) = (int)(v14 * 1.15);

          if (*(double *)(v1 + 208) == 0.0)
          {
            v16 = 0.0;
          }
          else
          {
            HostTimeClock = CMClockGetHostTimeClock();
            CMClockGetTime(&time, HostTimeClock);
            v16 = CMTimeGetSeconds(&time) + *(double *)(v1 + 208);
          }
          *(double *)(v1 + 216) = v16;
          -[BWVideoCompressorNode _validateBFrameEncodingAbility](v1);
        }
        *(_BYTE *)(v1 + 248) = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DebugMetadataSEI")), "BOOLValue");
        if (*(_BYTE *)(v1 + 248) && dword_1ECFE9530)
        {
          os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
          os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
          fig_log_call_emit_and_clean_up_after_send_and_compose();
        }
        *(_BYTE *)(v1 + 249) = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("PassSerializedDepthImageBuffers"), v21, v22), "BOOLValue");
        VTCompressionSessionPrepareToEncodeFrames(*(VTCompressionSessionRef *)(v1 + 120));
        *(_BYTE *)(v1 + 136) = 1;
        *(_BYTE *)(v1 + 250) = 0;
        result = (_QWORD *)objc_msgSend(*(id *)(v1 + 96), "copy");
        *(_QWORD *)(v1 + 104) = result;
        v18 = *(_BYTE *)(v1 + 176);
        if (v18)
        {
          result = (_QWORD *)objc_msgSend(*(id *)(v1 + 296), "isEqualToString:", CFSTR("hvc1"));
          if ((_DWORD)result)
            v18 = *(_BYTE *)(v1 + 320) != 0;
          else
            v18 = 0;
        }
        *(_BYTE *)(v1 + 177) = v18;
        if (*(_BYTE *)(v1 + 113))
        {
          result = (_QWORD *)-[BWVideoCompressorNode _setCompressionSessionProperty:value:requireSupported:](v1, (const __CFString *)*MEMORY[0x1E0CED170], MEMORY[0x1E0C9AAB0], 1);
          v19 = 1.1;
          if (!*(_BYTE *)(v1 + 113))
            v19 = 1.0;
          v20 = *(unsigned __int8 *)(v1 + 247) == 0;
        }
        else
        {
          if (!*(_BYTE *)(v1 + 247))
            return result;
          v20 = 0;
          v19 = 1.0;
        }
        if (!v20)
          v19 = v19 + 0.2;
        if (v19 > 1.0)
          return -[BWVideoCompressorNode _scaleBitrateByFactor:]((void *)v1, v19);
      }
    }
    else
    {
      FigDebugAssert3();
      result = (_QWORD *)FigSignalErrorAt();
      if ((_DWORD)result)
        return (_QWORD *)objc_msgSend(*(id *)(v1 + 272), "logErrorNumber:errorString:", result, CFSTR("preparing"));
    }
  }
  return result;
}

- (void)setPrioritizeEncodingSpeedOverQuality:(BOOL)a3
{
  self->_prioritizeEncodingSpeedOverQuality = a3;
}

- (BOOL)prioritizeEncodingSpeedOverQuality
{
  return self->_prioritizeEncodingSpeedOverQuality;
}

- (int)pipelineTraceID
{
  return self->_pipelineTraceID;
}

- (void)setCompressionDimensionsFromInputEnabled:(BOOL)a3
{
  self->_compressionDimensionsFromInputEnabled = a3;
}

- (BOOL)compressionDimensionsFromInputEnabled
{
  return self->_compressionDimensionsFromInputEnabled;
}

- (void)setStereoVideoBaseline:(float)a3
{
  self->_stereoVideoBaseline = a3;
}

- (float)stereoVideoBaseline
{
  return self->_stereoVideoBaseline;
}

- (void)setAlternateCompressionSettingsKey:(__CFString *)a3
{
  self->_alternateCompressionSettingsKey = a3;
}

- (__CFString)alternateCompressionSettingsKey
{
  return self->_alternateCompressionSettingsKey;
}

- (int64_t)maximumAllowedInFlightCompressedBytes
{
  return self->_maximumAllowedInFlightCompressedBytes;
}

- (void)setCompressionPropertiesOverrides:(id)a3
{

  self->_compressionPropertiesOverrides = (NSDictionary *)a3;
}

- (id)compressionPropertiesOverrides
{
  return self->_compressionPropertiesOverrides;
}

- (OpaqueVTCompressionSession)_compresessionSession
{
  return self->_compressionSession;
}

- (void)_releaseCompressionSession
{
  OpaqueVTCompressionSession *compressionSession;

  compressionSession = self->_compressionSession;
  if (compressionSession)
  {
    if (self->_maximumAllowedInFlightCompressedBytes)
    {
      self->_numberOfFramesDroppedBecauseTooManyCompressedBytesInFlight = 0;
      self->_inFlightCompressedBytesOverWarningThreshold = 0;
    }
    VTCompressionSessionInvalidate(compressionSession);
    CFRelease(self->_compressionSession);
    self->_compressionSession = 0;

    self->_compressionSessionSupportedProperties = 0;
    self->_compressionSessionCanBeReused = 0;

    self->_compressionSettingsPreparedFor = 0;
    self->_codecNameString = 0;
  }
}

- (VTSessionRef)_createEncoderSessionWithWidth:(int32_t)a3 height:(uint64_t)a4 inputPixelFormat:(int)a5 isHDResolution:(CMVideoCodecType)codecType videoCodec:(CFDictionaryRef)encoderSpecification encoderSpecification:(void *)a8 compressionProperties:(void *)a9 compressorNodeRef:
{
  uint64_t v9;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *outputCallbackRefCon;
  uint64_t v20;
  VTSessionRef session;

  if (result)
  {
    v14 = (uint64_t)result;
    session = 0;
    v15 = VTCompressionSessionCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, a3, codecType, encoderSpecification, 0, 0, (VTCompressionOutputCallback)vcn_encoderCallback, a9, (VTCompressionSessionRef *)&session);
    if ((_DWORD)v15)
    {
      v18 = v15;
      v20 = v9;
      LODWORD(outputCallbackRefCon) = v15;
    }
    else
    {
      v16 = VTSessionCopySupportedPropertyDictionary(session, (CFDictionaryRef *)(v14 + 128));
      if ((_DWORD)v16)
      {
        v18 = v16;
        v20 = v9;
        LODWORD(outputCallbackRefCon) = v16;
      }
      else
      {
        v17 = -[BWVideoCompressorNode _setEncoderCompressionPropertiesWithCompressionSession:compressionProperties:sourcePixelType:isHDResolution:videoCodec:](v14, session, a8, a4, a5, codecType);
        if (!(_DWORD)v17)
          return session;
        v18 = v17;
        v20 = v9;
        LODWORD(outputCallbackRefCon) = v17;
      }
    }
    FigDebugAssert3();
    objc_msgSend(*(id *)(v14 + 272), "logErrorNumber:errorString:", v18, CFSTR("creating compression session"), outputCallbackRefCon, v20);
    return session;
  }
  return result;
}

- (uint64_t)_setCompressionSessionProperty:(const void *)a3 value:(int)a4 requireSupported:
{
  uint64_t v4;
  void *v5;

  if (result)
  {
    v4 = result;
    if (*(_QWORD *)(result + 120) && (v5 = *(void **)(result + 128)) != 0 && a2)
    {
      if (objc_msgSend(v5, "objectForKeyedSubscript:", a2))
      {
        return VTSessionSetProperty(*(VTSessionRef *)(v4 + 120), a2, a3);
      }
      else if (a4)
      {
        return 4294954509;
      }
      else
      {
        return 0;
      }
    }
    else
    {
      FigDebugAssert3();
      return FigSignalErrorAt();
    }
  }
  return result;
}

- (void)_scaleBitrateByFactor:(void *)result
{
  uint64_t v3;
  const __CFString *v4;
  void *v5;
  double v6;
  uint64_t v7;
  int v8;

  if (result)
  {
    v3 = (uint64_t)result;
    v4 = (const __CFString *)*MEMORY[0x1E0CECEF0];
    result = (void *)-[BWVideoCompressorNode _copyCompressionSessionProperty:requireSupported:error:]((uint64_t)result, (const __CFString *)*MEMORY[0x1E0CECEF0], 0, 0);
    if (result)
    {
      v5 = result;
      objc_msgSend(result, "doubleValue");
      v7 = (int)(v6 * a2);

      result = (void *)-[BWVideoCompressorNode _setCompressionSessionProperty:value:requireSupported:](v3, v4, (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v7), 1);
    }
    v8 = *(_DWORD *)(v3 + 224);
    if (v8 >= 1)
      *(_DWORD *)(v3 + 224) = (int)((double)v8 * a2);
  }
  return result;
}

uint64_t __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke(uint64_t a1)
{
  return -[BWVideoCompressorNode _updateThermalPressureLevel](*(_QWORD *)(a1 + 32));
}

uint64_t __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke_2(uint64_t a1)
{
  return -[BWVideoCompressorNode _updatePowerPressureLevel](*(_QWORD *)(a1 + 32));
}

uint64_t __65__BWVideoCompressorNode__registerForThermalAndPowerNotifications__block_invoke_3(uint64_t a1)
{
  -[BWVideoCompressorNode _updateThermalPressureLevel](*(_QWORD *)(a1 + 32));
  return -[BWVideoCompressorNode _updatePowerPressureLevel](*(_QWORD *)(a1 + 32));
}

- (uint64_t)_setEncoderCompressionPropertiesWithCompressionSession:(void *)a3 compressionProperties:(uint64_t)a4 sourcePixelType:(int)a5 isHDResolution:(int)a6 videoCodec:
{
  void *v10;
  uint64_t v11;
  uint64_t *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  BOOL v24;
  unsigned __int16 v25;
  uint64_t v26;
  int IsFullRange;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t j;
  __CFString *v42;
  uint64_t v43;
  uint64_t v44;
  int v46;
  int v47;
  unsigned int v48;
  uint64_t v49;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v10 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v11 = objc_msgSend(a3, "count");
  v12 = (uint64_t *)MEMORY[0x1E0CED290];
  if (v11)
  {
    v46 = a6;
    v47 = a5;
    v48 = a4;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v13 = (void *)objc_msgSend(a3, "allKeys");
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v57;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v57 != v16)
            objc_enumerationMutation(v13);
          v18 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * i);
          v19 = *(void **)(a1 + 128);
          v20 = objc_msgSend(a3, "objectForKeyedSubscript:", v18);
          if (objc_msgSend(v19, "objectForKeyedSubscript:", v18))
            objc_msgSend(v10, "setObject:forKeyedSubscript:", v20, v18);
        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v61, 16);
      }
      while (v15);
    }
    v21 = *MEMORY[0x1E0CECF48];
    v22 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CECF48]);
    v23 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CED238]) != 0;
    v12 = (uint64_t *)MEMORY[0x1E0CED290];
    v24 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0CED290]) != 0;
    if (v22)
    {
      a5 = v47;
      a4 = v48;
      a6 = v46;
      goto LABEL_18;
    }
    a5 = v47;
    a4 = v48;
    a6 = v46;
  }
  else
  {
    v24 = 0;
    v23 = 0;
    v21 = *MEMORY[0x1E0CECF48];
  }
  if (objc_msgSend(*(id *)(a1 + 128), "objectForKeyedSubscript:", v21))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CA8D88], v21);
LABEL_18:
  if (v23)
    goto LABEL_31;
  if (a6 <= 1634743415)
  {
    if (a6 == 1634742376 || a6 == 1634742888)
      goto LABEL_31;
    v25 = 13416;
  }
  else
  {
    if ((a6 - 1634755432) <= 0xB && ((1 << (a6 - 104)) & 0x8C1) != 0
      || (a6 - 1634759272) <= 6 && ((1 << (a6 - 104)) & 0x51) != 0)
    {
      goto LABEL_31;
    }
    v25 = 13432;
  }
  if (a6 != (v25 | 0x61700000))
  {
    v26 = *MEMORY[0x1E0CED238];
    if (objc_msgSend(*(id *)(a1 + 128), "objectForKeyedSubscript:", *MEMORY[0x1E0CED238]))
      objc_msgSend(v10, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CA8EB0], v26);
  }
LABEL_31:
  if (!v24)
  {
    IsFullRange = FigCapturePixelFormatIsFullRange(a4);
    v28 = *v12;
    if (objc_msgSend(*(id *)(a1 + 128), "objectForKeyedSubscript:", *v12))
    {
      if (a5)
        v29 = IsFullRange;
      else
        v29 = 1;
      if (v29)
        v30 = *MEMORY[0x1E0CA8F10];
      else
        v30 = *MEMORY[0x1E0CA8F18];
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v30, v28);
    }
  }
  v31 = *MEMORY[0x1E0CECFE0];
  if (objc_msgSend(*(id *)(a1 + 128), "objectForKeyedSubscript:", *MEMORY[0x1E0CECFE0]))
    objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E49FA9F8, v31);
  v32 = (uint64_t *)MEMORY[0x1E0CED060];
  if ((_DWORD)a4)
  {
    v33 = *(void **)(a1 + 128);
    v34 = *MEMORY[0x1E0CED060];
    v35 = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4);
    if (objc_msgSend(v33, "objectForKeyedSubscript:", v34))
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v35, v34);
  }
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  v36 = (void *)objc_msgSend(v10, "allKeys");
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  if (!v37)
    return 0;
  v38 = v37;
  v39 = 0;
  v40 = *(_QWORD *)v53;
  v49 = *v32;
  do
  {
    for (j = 0; j != v38; ++j)
    {
      if (*(_QWORD *)v53 != v40)
        objc_enumerationMutation(v36);
      v42 = *(__CFString **)(*((_QWORD *)&v52 + 1) + 8 * j);
      v43 = VTSessionSetProperty(a2, v42, (CFTypeRef)objc_msgSend(v10, "objectForKeyedSubscript:", v42));
      if ((_DWORD)v43)
      {
        v44 = v43;
        if ((_DWORD)v43 != -12900 || (-[__CFString isEqualToString:](v42, "isEqualToString:", v49) & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 272), "logErrorNumber:errorString:", v44, objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to set encoder session property %@ with %@"), v42, objc_msgSend(v10, "objectForKeyedSubscript:", v42)));
          v39 = v44;
        }
      }
    }
    v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v52, v60, 16);
  }
  while (v38);
  return v39;
}

- (void)setReapCompressionSessionTimerDurationInSeconds:(double)a3
{
  self->_reapCompressionSessionTimerDurationInSeconds = a3;
}

@end
