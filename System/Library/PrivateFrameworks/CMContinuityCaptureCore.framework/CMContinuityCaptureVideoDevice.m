@implementation CMContinuityCaptureVideoDevice

- (CMContinuityCaptureVideoDevice)initWithCapabilities:(id)a3 compositeDelegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  CMContinuityCaptureVideoDevice *v10;
  NSMutableArray *v11;
  NSMutableArray *centerStageStateRestorationDataArray;
  CMContinuityCaptureCMIOVideoDevice *v13;
  CMContinuityCaptureCMIOVideoDevice *cmioCaptureDevice;
  CMContinuityCaptureVideoDevice *v15;
  NSObject *v17;
  objc_super v18;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v6, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "device");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)CMContinuityCaptureVideoDevice;
  v10 = -[CMContinuityCaptureDeviceBase initWithCapabilities:compositeDelegate:transportDevice:queue:](&v18, sel_initWithCapabilities_compositeDelegate_transportDevice_queue_, v7, v6, v9, 0);

  if (!v10)
  {
LABEL_8:
    v15 = 0;
    goto LABEL_4;
  }
  v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  centerStageStateRestorationDataArray = v10->_centerStageStateRestorationDataArray;
  v10->_centerStageStateRestorationDataArray = v11;

  v13 = -[CMContinuityCaptureCMIOVideoDevice initWithCaptureDevice:]([CMContinuityCaptureCMIOVideoDevice alloc], "initWithCaptureDevice:", v10);
  cmioCaptureDevice = v10->_cmioCaptureDevice;
  v10->_cmioCaptureDevice = v13;

  if (!v10->_cmioCaptureDevice)
  {
    CMContinuityCaptureLog(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice initWithCapabilities:compositeDelegate:].cold.1();

    goto LABEL_8;
  }
  v10->_manualFramingEnabled = _os_feature_enabled_impl();
  v15 = v10;
LABEL_4:

  return v15;
}

- (id)deviceID
{
  return -[CMContinuityCaptureCMIOVideoDevice deviceID](self->_cmioCaptureDevice, "deviceID");
}

- (void)forceDeviceRemoval
{
  -[CMContinuityCaptureCMIOVideoDevice forceDeviceRemoval](self->_cmioCaptureDevice, "forceDeviceRemoval");
}

- (void)dealloc
{
  opaqueCMSampleBuffer *lastDispatchedSampleBuffer;
  opaqueCMSampleBuffer *blurredSampleBuffer;
  NSObject *blurredFrameDispatchTimer;
  OS_dispatch_source *v6;
  NSObject *blackFrameDispatchTimer;
  OS_dispatch_source *v8;
  opaqueCMSampleBuffer *blackFrameSampleBuffer;
  objc_super v10;

  lastDispatchedSampleBuffer = self->_lastDispatchedSampleBuffer;
  if (lastDispatchedSampleBuffer)
  {
    CFRelease(lastDispatchedSampleBuffer);
    self->_lastDispatchedSampleBuffer = 0;
  }
  blurredSampleBuffer = self->_blurredSampleBuffer;
  if (blurredSampleBuffer)
  {
    CFRelease(blurredSampleBuffer);
    self->_blurredSampleBuffer = 0;
  }
  blurredFrameDispatchTimer = self->_blurredFrameDispatchTimer;
  if (blurredFrameDispatchTimer)
  {
    dispatch_source_cancel(blurredFrameDispatchTimer);
    v6 = self->_blurredFrameDispatchTimer;
    self->_blurredFrameDispatchTimer = 0;

  }
  blackFrameDispatchTimer = self->_blackFrameDispatchTimer;
  if (blackFrameDispatchTimer)
  {
    dispatch_source_cancel(blackFrameDispatchTimer);
    v8 = self->_blackFrameDispatchTimer;
    self->_blackFrameDispatchTimer = 0;

  }
  blackFrameSampleBuffer = self->_blackFrameSampleBuffer;
  if (blackFrameSampleBuffer)
  {
    CFRelease(blackFrameSampleBuffer);
    self->_blackFrameSampleBuffer = 0;
  }
  v10.receiver = self;
  v10.super_class = (Class)CMContinuityCaptureVideoDevice;
  -[CMContinuityCaptureDeviceBase dealloc](&v10, sel_dealloc);
}

- (void)resetTransportDevice:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  CMContinuityCaptureVideoDevice *v10;

  v4 = a3;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v5);

  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CMContinuityCaptureVideoDevice_resetTransportDevice___block_invoke;
  block[3] = &unk_24F06ADE8;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async_and_wait(v6, block);

}

void __55__CMContinuityCaptureVideoDevice_resetTransportDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_super v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "transportDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "isEqual:", v3);

  if ((v2 & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 248), "resetTransportDevice:", *(_QWORD *)(a1 + 32));
    v4 = *(_QWORD *)(a1 + 32);
    v5.receiver = *(id *)(a1 + 40);
    v5.super_class = (Class)CMContinuityCaptureVideoDevice;
    objc_msgSendSuper2(&v5, sel_resetTransportDevice_, v4);
  }
}

- (BOOL)isCenterStageForceEnableSupported
{
  return 1;
}

- (void)updateCameraHiddenControlIfApplicable
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__CMContinuityCaptureVideoDevice_updateCameraHiddenControlIfApplicable__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__CMContinuityCaptureVideoDevice_updateCameraHiddenControlIfApplicable__block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v2;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained[31], "_updateCameraHiddenControlIfApplicable");
    WeakRetained = v2;
  }

}

- (opaqueCMSampleBuffer)createBlackSampleBuffer
{
  void *v3;
  void *v4;
  const __CFDictionary *v5;
  const __CFAllocator *v6;
  void *v7;
  void *v8;
  size_t v9;
  void *v10;
  void *v11;
  size_t Width;
  size_t Height;
  void *BaseAddress;
  NSObject *v15;
  opaqueCMSampleBuffer *v16;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMSampleTimingInfo sampleTiming;
  CVPixelBufferRef pixelBufferOut;
  CMSampleBufferRef sampleBufferOut;
  uint8_t buf[4];
  CMContinuityCaptureVideoDevice *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  CMSampleBufferRef v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  sampleBufferOut = 0;
  pixelBufferOut = 0;
  *(_OWORD *)&sampleTiming.duration.value = *MEMORY[0x24BDC0D40];
  sampleTiming.duration.epoch = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
  sampleTiming.presentationTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D88];
  sampleTiming.decodeTimeStamp = sampleTiming.duration;
  formatDescriptionOut = 0;
  v4 = (void *)*MEMORY[0x24BDC5668];
  v28[0] = *MEMORY[0x24BDC54E0];
  v3 = (void *)v28[0];
  v28[1] = v4;
  v29[0] = &unk_24F07F7E0;
  v29[1] = MEMORY[0x24BDBD1B8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v5 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "format");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "width");
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "format");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = CVPixelBufferCreate(v6, v9, objc_msgSend(v11, "height"), 0x42475241u, v5, &pixelBufferOut);

  if (!(_DWORD)v9)
  {
    CVPixelBufferLockBaseAddress(pixelBufferOut, 0);
    Width = CVPixelBufferGetWidth(pixelBufferOut);
    Height = CVPixelBufferGetHeight(pixelBufferOut);
    BaseAddress = CVPixelBufferGetBaseAddress(pixelBufferOut);
    if (Height * Width)
      memset_pattern16(BaseAddress, &unk_227CED580, 4 * Height * Width);
    CVPixelBufferUnlockBaseAddress(pixelBufferOut, 0);
    CMVideoFormatDescriptionCreateForImageBuffer(v6, pixelBufferOut, &formatDescriptionOut);
    CMSampleBufferCreateReadyWithImageBuffer(v6, pixelBufferOut, formatDescriptionOut, &sampleTiming, &sampleBufferOut);
    if (sampleBufferOut)
      CMSetAttachment(sampleBufferOut, CFSTR("kCMContinuityCaptureAttachmentFrameType"), &unk_24F07F7F8, 1u);
  }
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  CMContinuityCaptureLog(2);
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v23 = self;
    v24 = 2080;
    v25 = "-[CMContinuityCaptureVideoDevice createBlackSampleBuffer]";
    v26 = 2048;
    v27 = sampleBufferOut;
    _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %p", buf, 0x20u);
  }

  v16 = sampleBufferOut;
  return v16;
}

- (opaqueCMSampleBuffer)createBlurredSampleBuffer
{
  opaqueCMSampleBuffer *lastDispatchedSampleBuffer;
  __int128 v4;
  __CVBuffer *ImageBuffer;
  __CVBuffer *v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  size_t Width;
  size_t Height;
  OSType PixelFormatType;
  void *v19;
  int64_t HostTimeInNanoSec;
  void *v21;
  opaqueCMSampleBuffer *v22;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  CMTime v29;
  CVPixelBufferRef pixelBufferOut;
  CMSampleTimingInfo sampleTiming;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef sampleBufferOut;

  formatDescriptionOut = 0;
  sampleBufferOut = 0;
  pixelBufferOut = 0;
  lastDispatchedSampleBuffer = self->_lastDispatchedSampleBuffer;
  if (!lastDispatchedSampleBuffer)
  {
    lastDispatchedSampleBuffer = -[CMContinuityCaptureVideoDevice createBlackSampleBuffer](self, "createBlackSampleBuffer");
    self->_lastDispatchedSampleBuffer = lastDispatchedSampleBuffer;
  }
  sampleTiming.decodeTimeStamp.epoch = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&sampleTiming.presentationTimeStamp.timescale = v4;
  *(_OWORD *)&sampleTiming.decodeTimeStamp.value = v4;
  *(_OWORD *)&sampleTiming.duration.value = v4;
  *(_OWORD *)&sampleTiming.duration.epoch = v4;
  ImageBuffer = CMSampleBufferGetImageBuffer(lastDispatchedSampleBuffer);
  if (!ImageBuffer)
    goto LABEL_25;
  v6 = ImageBuffer;
  v7 = CVPixelBufferCopyCreationAttributes(ImageBuffer);
  if (!v7)
  {
    CMContinuityCaptureLog(2);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.1();

LABEL_25:
    v13 = 0;
    v15 = 0;
    v8 = 0;
    v9 = 0;
    goto LABEL_15;
  }
  v8 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v7);
  v10 = (void *)*MEMORY[0x24BDC54E0];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", &unk_24F07F7E0, *MEMORY[0x24BDC54E0]);

  v11 = (void *)*MEMORY[0x24BDC5668];
  objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1B8], *MEMORY[0x24BDC5668]);

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithCVPixelBuffer:", v6);
  if (!v12)
  {
    CMContinuityCaptureLog(2);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.2();

    v13 = 0;
    goto LABEL_32;
  }
  v13 = v12;
  objc_msgSend(v12, "imageByApplyingGaussianBlurWithSigma:", 26.0);
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14)
  {
    CMContinuityCaptureLog(2);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.3();

LABEL_32:
    v15 = 0;
    goto LABEL_15;
  }
  v15 = (void *)v14;
  Width = CVPixelBufferGetWidth(v6);
  Height = CVPixelBufferGetHeight(v6);
  PixelFormatType = CVPixelBufferGetPixelFormatType(v6);
  if (CVPixelBufferCreate(0, Width, Height, PixelFormatType, (CFDictionaryRef)v9, &pixelBufferOut) || !pixelBufferOut)
  {
    CMContinuityCaptureLog(2);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.4();
    goto LABEL_37;
  }
  CVBufferPropagateAttachments(v6, pixelBufferOut);
  objc_msgSend(MEMORY[0x24BDBF648], "context");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "render:toCVPixelBuffer:", v15, pixelBufferOut);

  if (!pixelBufferOut)
  {
    CMContinuityCaptureLog(2);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.5();
LABEL_37:

    goto LABEL_15;
  }
  if (CMVideoFormatDescriptionCreateForImageBuffer(0, pixelBufferOut, &formatDescriptionOut) || !formatDescriptionOut)
  {
    CMContinuityCaptureLog(2);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.6();
  }
  else
  {
    sampleTiming.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
    HostTimeInNanoSec = CMContinuityCaptureGetHostTimeInNanoSec();
    CMTimeMake(&sampleTiming.presentationTimeStamp, HostTimeInNanoSec, 1000000000);
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    CMTimeMake(&v29, 1, objc_msgSend(v21, "maxFrameRate"));
    sampleTiming.duration = v29;

    if (!CMSampleBufferCreateReadyWithImageBuffer(0, pixelBufferOut, formatDescriptionOut, &sampleTiming, &sampleBufferOut)&& sampleBufferOut)
    {
      CMSetAttachment(sampleBufferOut, CFSTR("kCMContinuityCaptureAttachmentFrameType"), &unk_24F07F810, 1u);
      goto LABEL_15;
    }
    CMContinuityCaptureLog(2);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice createBlurredSampleBuffer].cold.7();
  }

LABEL_15:
  if (pixelBufferOut)
    CFRelease(pixelBufferOut);
  if (v8)
    CFRelease(v8);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  v22 = sampleBufferOut;

  return v22;
}

- (void)dispatchFrame:(opaqueCMSampleBuffer *)a3 entity:(int64_t)a4 completion:(id)a5
{
  opaqueCMSampleBuffer *v5;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  opaqueCMSampleBuffer *lastDispatchedSampleBuffer;
  CMTimeFlags flags;
  opaqueCMSampleBuffer *blurredSampleBuffer;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  int v31;
  __int128 v32;
  const __CFAllocator *v33;
  OSStatus v34;
  const __CFAllocator *v35;
  CFDictionaryRef v36;
  NSObject *v37;
  void *v38;
  int v39;
  NSObject *v40;
  Float64 v41;
  Float64 Seconds;
  Float64 v43;
  uint64_t hostTime;
  CMTimeEpoch epoch;
  CMTimeScale timescale;
  CMTimeValue value;
  objc_super v48;
  CMSampleTimingInfo v49;
  CMSampleBufferRef sampleBufferOut;
  CMTime time;
  CMTime v52;
  CMTime duration;
  Float64 v54;
  __int16 v55;
  OSStatus v56;
  uint64_t v57;

  v5 = a3;
  v57 = *MEMORY[0x24BDAC8D0];
  CFRetain(a3);
  v7 = MEMORY[0x24BDC0D40];
  memset(&v52, 170, sizeof(v52));
  CMSampleBufferGetPresentationTimeStamp(&v52, v5);
  CMGetAttachment(v5, (CFStringRef)*MEMORY[0x24BE10868], 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NetworkTime"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("NetworkTimeClockIdentity"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  lastDispatchedSampleBuffer = self->_lastDispatchedSampleBuffer;
  if (lastDispatchedSampleBuffer)
    CFRelease(lastDispatchedSampleBuffer);
  value = *(_QWORD *)v7;
  flags = *(_DWORD *)(v7 + 12);
  timescale = *(_DWORD *)(v7 + 8);
  epoch = *(_QWORD *)(v7 + 16);
  self->_lastDispatchedSampleBuffer = v5;
  CFRetain(v5);
  blurredSampleBuffer = self->_blurredSampleBuffer;
  if (blurredSampleBuffer)
  {
    CFRelease(blurredSampleBuffer);
    self->_blurredSampleBuffer = 0;
  }
  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "client");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "timeSyncClock");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0x255921000;
  if (v16 && v9)
  {
    v18 = v8;
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "client");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "timeSyncClock");
    v21 = v10;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    hostTime = objc_msgSend(v22, "machAbsoluteTimeForDomainTime:", objc_msgSend(v9, "unsignedLongLongValue"));

    if (v21)
    {
      -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "client");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "timeSyncClock");
      v25 = v9;
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "grandMasterIdentifier");

      v9 = v25;
      v28 = v21;
      v29 = objc_msgSend(v21, "unsignedLongLongValue") == v27;
    }
    else
    {
      v28 = 0;
      v29 = 1;
    }
    v8 = v18;
    if (CMContinityCaptureDebugLogEnabled())
    {
      CMContinuityCaptureLog(2);
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        -[CMContinuityCaptureVideoDevice dispatchFrame:entity:completion:].cold.1();

    }
    if (hostTime != *MEMORY[0x24BEB70D8] && v29)
    {
      CMClockMakeHostTimeFromSystemUnits(&time, hostTime);
      CMTimeConvertScale(&v49.duration, &time, 100000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
      value = v49.duration.value;
      flags = v49.duration.flags;
      timescale = v49.duration.timescale;
      epoch = v49.duration.epoch;
    }
    if (self->_lastBufferNetworkTimeClockSynchronized != v29 && self->_numberOfFramesDispatched)
      CMSetAttachment(v5, CFSTR("ContinuityCaptureTimeDiscontinuity"), MEMORY[0x24BDBD1C8], 1u);
    self->_lastBufferNetworkTimeClockSynchronized = v29;
    v10 = v28;
    v17 = 0x255921000uLL;
  }
  v31 = flags & 1;
  if ((flags & 1) == 0 && v52.timescale > 100000)
  {
    duration = v52;
    CMTimeConvertScale(&v49.duration, &duration, 100000, kCMTimeRoundingMethod_RoundHalfAwayFromZero);
    value = v49.duration.value;
    flags = v49.duration.flags;
    timescale = v49.duration.timescale;
    epoch = v49.duration.epoch;
    v31 = v49.duration.flags & 1;
  }
  if (v31)
  {
    v49.decodeTimeStamp.epoch = 0xAAAAAAAAAAAAAAAALL;
    sampleBufferOut = 0;
    *(_QWORD *)&v32 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v32 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v49.presentationTimeStamp.timescale = v32;
    *(_OWORD *)&v49.decodeTimeStamp.value = v32;
    *(_OWORD *)&v49.duration.value = v32;
    *(_OWORD *)&v49.duration.epoch = v32;
    CMSampleBufferGetSampleTimingInfo(v5, 0, &v49);
    v49.presentationTimeStamp.value = value;
    v49.presentationTimeStamp.timescale = timescale;
    v49.presentationTimeStamp.flags = flags;
    v49.presentationTimeStamp.epoch = epoch;
    v33 = CFGetAllocator(v5);
    v34 = CMSampleBufferCreateCopyWithNewTiming(v33, v5, 1, &v49, &sampleBufferOut);
    if (v34 || !sampleBufferOut)
    {
      CMContinuityCaptureLog(2);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        duration.value = value;
        duration.timescale = timescale;
        duration.flags = flags;
        duration.epoch = epoch;
        Seconds = CMTimeGetSeconds(&duration);
        duration = v52;
        v43 = CMTimeGetSeconds(&duration);
        LODWORD(duration.value) = 138544130;
        *(CMTimeValue *)((char *)&duration.value + 4) = (CMTimeValue)self;
        LOWORD(duration.flags) = 2048;
        *(Float64 *)((char *)&duration.flags + 2) = Seconds;
        HIWORD(duration.epoch) = 2048;
        v54 = v43;
        v55 = 1024;
        v56 = v34;
        _os_log_error_impl(&dword_227C5D000, v37, OS_LOG_TYPE_ERROR, "%{public}@ Failed to create retimed video frame with PTS %.4f, falling back to unsynced PTS %.4f. err: %d", (uint8_t *)&duration, 0x26u);
      }

    }
    else
    {
      CFRelease(v5);
      v5 = sampleBufferOut;
      v35 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
      duration = v52;
      v36 = CMTimeCopyAsDictionary(&duration, v35);
      CMSetAttachment(v5, (CFStringRef)*MEMORY[0x24BE10820], v36, 1u);
      CFRelease(v36);
    }
  }
  memset(&v49, 170, 24);
  CMSampleBufferGetPresentationTimeStamp(&v49.duration, v5);
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("CaptureSessionRestarted"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "BOOLValue");

  if (v39)
  {
    CMSetAttachment(v5, CFSTR("ContinuityCaptureTimeDiscontinuity"), MEMORY[0x24BDBD1C8], 1u);
    CMContinuityCaptureLog(2);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      duration = v49.duration;
      v41 = CMTimeGetSeconds(&duration);
      LODWORD(duration.value) = 138543618;
      *(CMTimeValue *)((char *)&duration.value + 4) = (CMTimeValue)self;
      LOWORD(duration.flags) = 2048;
      *(Float64 *)((char *)&duration.flags + 2) = v41;
      _os_log_impl(&dword_227C5D000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ marking time discontinuity on buffer %.4f because capture session just restarted on remote device", (uint8_t *)&duration, 0x16u);
    }

  }
  if (-[CMContinuityCaptureDeviceBase hasStreamIntent](self, "hasStreamIntent", hostTime))
    -[CMContinuityCaptureCMIOVideoDevice dispatchFrame:entity:completion:](self->_cmioCaptureDevice, "dispatchFrame:entity:completion:", v5, -[CMContinuityCaptureDeviceBase entity](self, "entity"), &__block_literal_global_163);
  ++*(Class *)((char *)&self->super.super.isa + *(int *)(v17 + 4084));
  v48.receiver = self;
  v48.super_class = (Class)CMContinuityCaptureVideoDevice;
  -[CMContinuityCaptureDeviceBase dispatchFrame:entity:completion:](&v48, sel_dispatchFrame_entity_completion_, v5, -[CMContinuityCaptureDeviceBase entity](self, "entity"), &__block_literal_global_164);
  CFRelease(v5);

}

- (void)streamOutput:(id)a3 didReceiveSampleBuffer:(opaqueCMSampleBuffer *)a4
{
  AVCStreamOutput *v6;
  NSObject *v7;
  AVCStreamOutput *avcStreamOutput;
  BOOL v9;
  NSObject *v10;
  AVCStreamOutput *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  void *v17;
  unsigned int v18;
  void *v19;
  int v20;
  CMContinuityCaptureVideoDevice *v21;
  __int16 v22;
  AVCStreamOutput *v23;
  __int16 v24;
  AVCStreamOutput *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = (AVCStreamOutput *)a3;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  avcStreamOutput = self->_avcStreamOutput;
  if (avcStreamOutput)
    v9 = avcStreamOutput == v6;
  else
    v9 = 0;
  if (v9)
  {
    if (-[CMContinuityCaptureDeviceBase streaming](self, "streaming"))
    {
      -[CMContinuityCaptureDeviceBase scheduleSendingInvalidFramesAfterTimeout:](self, "scheduleSendingInvalidFramesAfterTimeout:", 0);
      -[CMContinuityCaptureVideoDevice stateMachineStopSendingBlurredFrames](self, "stateMachineStopSendingBlurredFrames");
      -[CMContinuityCaptureVideoDevice dispatchFrame:entity:completion:](self, "dispatchFrame:entity:completion:", a4, -[CMContinuityCaptureDeviceBase entity](self, "entity"), &__block_literal_global_166);
      self->_failedBufferCountDueToMismatchState = 0;
      self->_canIssueStateMismatchEvent = 0;
      goto LABEL_8;
    }
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v20 = 138543362;
      v21 = self;
      v13 = "%{public}@ dropping since we are not in streaming state";
      v14 = v10;
      v15 = 12;
      goto LABEL_13;
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12 = self->_avcStreamOutput;
      v20 = 138543874;
      v21 = self;
      v22 = 2112;
      v23 = v6;
      v24 = 2112;
      v25 = v12;
      v13 = "%{public}@ discarding sample buffer from streamOutput %@ current _avcStreamOutput %@";
      v14 = v10;
      v15 = 32;
LABEL_13:
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_INFO, v13, (uint8_t *)&v20, v15);
    }
  }

  if (self->_canIssueStateMismatchEvent)
  {
    -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
    v16 = objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      v17 = (void *)v16;
      v18 = self->_failedBufferCountDueToMismatchState + 1;
      self->_failedBufferCountDueToMismatchState = v18;
      if (v18 >= 0x3C)
      {
        v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1012, 0);
        objc_msgSend(v17, "connectionInterrupted:forDevice:", v19, 0);

        self->_canIssueStateMismatchEvent = 0;
        self->_failedBufferCountDueToMismatchState = 0;
      }

    }
  }
LABEL_8:

}

- (void)streamOutputServerDidDie:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[4];
  id v8;
  _BYTE buf[12];
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    v10 = 2080;
    v11 = "-[CMContinuityCaptureVideoDevice streamOutputServerDidDie:]";
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureVideoDevice_streamOutputServerDidDie___block_invoke;
  block[3] = &unk_24F06AE60;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(v6, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);

}

void __59__CMContinuityCaptureVideoDevice_streamOutputServerDidDie___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "stopCaptureStack:completion:", 0, &__block_literal_global_170);
    WeakRetained = v2;
  }

}

- (void)streamOutputDidBecomeInvalid:(id)a3
{
  NSObject *v4;
  int v5;
  CMContinuityCaptureVideoDevice *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138543618;
    v6 = self;
    v7 = 2080;
    v8 = "-[CMContinuityCaptureVideoDevice streamOutputDidBecomeInvalid:]";
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
  }

}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  id v6;
  NSObject *v7;
  int v8;
  CMContinuityCaptureVideoDevice *v9;
  __int16 v10;
  unint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138544130;
    v9 = self;
    v10 = 2048;
    v11 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
    v12 = 2080;
    v13 = "-[CMContinuityCaptureVideoDevice stream:didStart:error:]";
    v14 = 2112;
    v15 = v6;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] AVCOutput setup complete %s %@", (uint8_t *)&v8, 0x2Au);
  }

  self->_avcStreamOutputActive = 1;
}

- (void)streamDidStop:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __48__CMContinuityCaptureVideoDevice_streamDidStop___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __48__CMContinuityCaptureVideoDevice_streamDidStop___block_invoke(uint64_t a1)
{
  id *v2;
  _QWORD *WeakRetained;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = objc_loadWeakRetained(v2);
      v6 = *(_QWORD *)(a1 + 32);
      v10 = 138543874;
      v11 = v5;
      v12 = 2080;
      v13 = "-[CMContinuityCaptureVideoDevice streamDidStop:]_block_invoke";
      v14 = 2112;
      v15 = v6;
      _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", (uint8_t *)&v10, 0x20u);

    }
    v7 = WeakRetained[35];
    if (v7)
    {
      (*(void (**)(uint64_t, _QWORD))(v7 + 16))(v7, 0);
      v8 = (void *)WeakRetained[35];
      WeakRetained[35] = 0;

    }
    v9 = (void *)WeakRetained[34];
    WeakRetained[34] = 0;

    *((_BYTE *)WeakRetained + 376) = 0;
  }

}

- (void)streamDidRTPTimeOut:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CMContinuityCaptureVideoDevice_streamDidRTPTimeOut___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __54__CMContinuityCaptureVideoDevice_streamDidRTPTimeOut___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 138543874;
    v8 = WeakRetained;
    v9 = 2080;
    v10 = "-[CMContinuityCaptureVideoDevice streamDidRTPTimeOut:]_block_invoke";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", (uint8_t *)&v7, 0x20u);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "postAVCStreamInterruption");

}

- (void)streamDidRTCPTimeOut:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__CMContinuityCaptureVideoDevice_streamDidRTCPTimeOut___block_invoke;
  block[3] = &unk_24F06AE88;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__CMContinuityCaptureVideoDevice_streamDidRTCPTimeOut___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v4 = *(_QWORD *)(a1 + 32);
    v7 = 138543874;
    v8 = WeakRetained;
    v9 = 2080;
    v10 = "-[CMContinuityCaptureVideoDevice streamDidRTCPTimeOut:]_block_invoke";
    v11 = 2112;
    v12 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %s %@", (uint8_t *)&v7, 0x20u);

  }
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "postAVCStreamInterruption");

}

- (void)streamDidServerDie:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __53__CMContinuityCaptureVideoDevice_streamDidServerDie___block_invoke;
  v6[3] = &unk_24F06AE60;
  objc_copyWeak(&v7, &location);
  dispatch_async(v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);

}

void __53__CMContinuityCaptureVideoDevice_streamDidServerDie___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  void *v7;
  int v8;
  id v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v8 = 138543618;
    v9 = WeakRetained;
    v10 = 2080;
    v11 = "-[CMContinuityCaptureVideoDevice streamDidServerDie:]_block_invoke";
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v8, 0x16u);

  }
  v4 = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = v4;
  if (v4)
  {
    v6 = v4[35];
    if (v6)
    {
      (*(void (**)(uint64_t, _QWORD))(v6 + 16))(v6, 0);
      v7 = (void *)v5[35];
      v5[35] = 0;

    }
    objc_msgSend(v5, "postAVCStreamInterruption");
  }

}

- (void)postAVCStreamInterruption
{
  NSObject *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;
  _BYTE buf[12];
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = self;
    v8 = 2080;
    v9 = "-[CMContinuityCaptureVideoDevice postAVCStreamInterruption]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__CMContinuityCaptureVideoDevice_postAVCStreamInterruption__block_invoke;
  block[3] = &unk_24F06AE60;
  objc_copyWeak(&v6, (id *)buf);
  dispatch_async(v4, block);

  objc_destroyWeak(&v6);
  objc_destroyWeak((id *)buf);
}

void __59__CMContinuityCaptureVideoDevice_postAVCStreamInterruption__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "compositeDelegate");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), -1007, 0);
      objc_msgSend(v2, "connectionInterrupted:forDevice:", v3, 0);

    }
    WeakRetained = v4;
  }

}

- (id)createAVCVideoStream
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSString *v11;
  NSString *avcStreamCallID;
  id v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  unint64_t v18;
  id v19;
  id v21;
  id v22;
  uint8_t buf[4];
  CMContinuityCaptureVideoDevice *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  void *v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x24BDAC8D0];
  v29[0] = 0xAAAAAAAAAAAAAAAALL;
  v29[1] = 0xAAAAAAAAAAAAAAAALL;
  -[CMContinuityCaptureDeviceBase transportStream](self, "transportStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    v16 = 0;
    v15 = 0;
    v5 = 0;
LABEL_19:
    v9 = 0;
    v13 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v3, "streamUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v16 = 0;
    v15 = 0;
    goto LABEL_19;
  }
  CMContinuityCaptureLog(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v24 = self;
    v25 = 2048;
    v26 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
    v27 = 2112;
    v28 = v5;
    _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCVideoStream for StreamUUID %@", buf, 0x20u);
  }

  objc_msgSend(v5, "getUUIDBytes:", v29);
  -[CMContinuityCaptureDeviceBase avcStreamNegotiator](self, "avcStreamNegotiator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v10 = 0;
    goto LABEL_9;
  }
  -[CMContinuityCaptureDeviceBase avcStreamNegotiator](self, "avcStreamNegotiator");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(v8, "generateMediaStreamInitOptionsWithError:", &v22);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v22;

  objc_msgSend(v9, "objectForKeyedSubscript:", *MEMORY[0x24BDFDAA0]);
  v11 = (NSString *)objc_claimAutoreleasedReturnValue();
  avcStreamCallID = self->_avcStreamCallID;
  self->_avcStreamCallID = v11;

  if (!v9)
  {
LABEL_9:
    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v24 = self;
      v25 = 2112;
      v26 = (unint64_t)v10;
      _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Invalid avcStreamInitOptions, error %@", buf, 0x16u);
    }

    v13 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v9 = 0;
    v10 = 0;
    goto LABEL_12;
  }
  v13 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithDictionary:", v9);
LABEL_12:
  objc_msgSend(v13, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFDAB8]);
  v21 = v10;
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFDA40]), "initWithNWConnectionClientID:options:error:", v29, v13, &v21);
  v16 = v21;

  if (v15)
  {
    objc_msgSend(v15, "setDelegate:", self);
    CMContinuityCaptureLog(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
      *(_DWORD *)buf = 138543874;
      v24 = self;
      v25 = 2048;
      v26 = v18;
      v27 = 2048;
      v28 = v15;
      _os_log_impl(&dword_227C5D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] createAVCVideoStream %p Success", buf, 0x20u);
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice createAVCVideoStream].cold.1();
    v15 = 0;
  }

LABEL_16:
  v19 = v15;

  return v19;
}

- (id)newVideoStreamCurrentConfiguration
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  double v12;
  void *v13;
  void *v14;
  uint64_t AVCVideoResolutionForFormat;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  NSObject *v31;
  int v32;
  void *v33;
  id v34;
  int v35;
  void *v36;
  void *v37;
  int v38;
  int v39;
  id v40;
  unint64_t v42;
  void *v43;
  id v44;
  uint8_t buf[4];
  CMContinuityCaptureVideoDevice *v46;
  __int16 v47;
  unint64_t v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  -[CMContinuityCaptureDeviceBase transportStream](self, "transportStream");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sessionID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "cipherKeyforSessionID:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[CMContinuityCaptureDeviceBase avcStreamNegotiator](self, "avcStreamNegotiator");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v44 = 0;
      objc_msgSend(v7, "generateMediaStreamConfigurationWithError:", &v44);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v44;

      if (v8)
      {
        objc_msgSend(v8, "setRtcpSendInterval:", 1.0);
        objc_msgSend(v8, "setRtcpTimeOutEnabled:", 1);
        -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "wired");
        v12 = 12.0;
        if (v11)
          v12 = 8.0;
        objc_msgSend(v8, "setRtcpTimeOutInterval:", v12);

        objc_msgSend(v8, "setSRTPCipherSuite:", 5);
        objc_msgSend(v8, "setSRTCPCipherSuite:", 5);
        objc_msgSend(v8, "setSendMediaKey:", v6);
        objc_msgSend(v8, "setReceiveMediaKey:", v6);
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "format");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        AVCVideoResolutionForFormat = CMContinuityCaptureGetAVCVideoResolutionForFormat(v14);
        objc_msgSend(v8, "video");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "setVideoResolution:", AVCVideoResolutionForFormat);

        objc_msgSend(v8, "video");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "videoResolution");

        if (v18 == 12)
        {
          -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "format");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "width");
          objc_msgSend(v8, "video");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setCustomWidth:", v21);

          -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "format");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "height");
          objc_msgSend(v8, "video");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "setCustomHeight:", v25);

        }
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "maxFrameRate");
        objc_msgSend(v8, "video");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setFramerate:", v28);

        objc_msgSend(v8, "video");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "setLatencySensitiveModeEnabled:", 1);

        CMContinuityCaptureLog(2);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v42 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
          objc_msgSend(v8, "video");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v43, "videoResolution");
          -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v9;
          v35 = objc_msgSend(v33, "maxFrameRate");
          v36 = v6;
          v37 = v3;
          v38 = objc_msgSend(v8, "localSSRC");
          v39 = objc_msgSend(v8, "remoteSSRC");
          *(_DWORD *)buf = 138413570;
          v46 = self;
          v47 = 2048;
          v48 = v42;
          v49 = 1024;
          v50 = v32;
          v51 = 1024;
          v52 = v35;
          v9 = v34;
          v53 = 1024;
          v54 = v38;
          v3 = v37;
          v6 = v36;
          v55 = 1024;
          v56 = v39;
          _os_log_impl(&dword_227C5D000, v31, OS_LOG_TYPE_DEFAULT, "%@ [sessionID:%llx] Stream Resolution %u at frameRate %u localSSRC %x remoteSSRC %x", buf, 0x2Eu);

        }
      }
      else
      {
        CMContinuityCaptureLog(2);
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureVideoDevice newVideoStreamCurrentConfiguration].cold.2();
        v8 = 0;
      }
    }
    else
    {
      CMContinuityCaptureLog(2);
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureVideoDevice newVideoStreamCurrentConfiguration].cold.1(self, v31);
      v8 = 0;
      v9 = 0;
      v6 = 0;
    }

  }
  else
  {
    v8 = 0;
    v9 = 0;
    v6 = 0;
  }
  v40 = v8;

  return v40;
}

- (BOOL)startAVConferenceStack:(unint64_t)a3
{
  NSObject *v5;
  id *p_avcVideoStream;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  char v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  AVCStreamOutput *v22;
  id v23;
  AVCStreamOutput *avcStreamOutput;
  BOOL v25;
  NSObject *v27;
  NSObject *v28;
  const char *v29;
  objc_super v30;
  id v31;
  id v32;
  uint8_t buf[4];
  CMContinuityCaptureVideoDevice *v34;
  __int16 v35;
  const char *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v34 = self;
    v35 = 2080;
    v36 = "-[CMContinuityCaptureVideoDevice startAVConferenceStack:]";
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
  }

  p_avcVideoStream = (id *)&self->_avcVideoStream;
  if (!self->_avcVideoStream)
  {
    -[CMContinuityCaptureVideoDevice createAVCVideoStream](self, "createAVCVideoStream");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *p_avcVideoStream;
    *p_avcVideoStream = (id)v7;

    if (!*p_avcVideoStream)
      goto LABEL_17;
  }
  v9 = -[CMContinuityCaptureVideoDevice newVideoStreamCurrentConfiguration](self, "newVideoStreamCurrentConfiguration");
  if (!v9)
  {
    CMContinuityCaptureLog(2);
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice startAVConferenceStack:].cold.1();

LABEL_17:
    v25 = 0;
    v13 = 0;
    v10 = 0;
    goto LABEL_13;
  }
  v10 = v9;
  v11 = *p_avcVideoStream;
  v32 = 0;
  v12 = objc_msgSend(v11, "configure:error:", v10, &v32);
  v13 = v32;
  CMContinuityCaptureLog(2);
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if ((v12 & 1) == 0)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v29 = (const char *)*p_avcVideoStream;
      *(_DWORD *)buf = 138543874;
      v34 = self;
      v35 = 2048;
      v36 = v29;
      v37 = 2112;
      v38 = v13;
      _os_log_error_impl(&dword_227C5D000, v15, OS_LOG_TYPE_ERROR, "%{public}@ AVCVideoStream %p configure error %@", buf, 0x20u);
    }

    goto LABEL_21;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v16 = -[CMContinuityCaptureDeviceBase currentSessionID](self, "currentSessionID");
    v17 = *p_avcVideoStream;
    v18 = objc_msgSend(*p_avcVideoStream, "streamToken");
    *(_DWORD *)buf = 138544130;
    v34 = self;
    v35 = 2048;
    v36 = (const char *)v16;
    v37 = 2048;
    v38 = v17;
    v39 = 2048;
    v40 = v18;
    _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ [sessionID:%llx] AVCVideoStream %p StreamToken %lu", buf, 0x2Au);
  }

  if (!objc_msgSend(*p_avcVideoStream, "streamToken"))
  {
LABEL_21:
    v25 = 0;
    goto LABEL_13;
  }
  v19 = objc_alloc(MEMORY[0x24BDFDA38]);
  v20 = objc_msgSend(*p_avcVideoStream, "streamToken");
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v13;
  v22 = (AVCStreamOutput *)objc_msgSend(v19, "initWithStreamToken:delegate:queue:error:", v20, self, v21, &v31);
  v23 = v31;

  avcStreamOutput = self->_avcStreamOutput;
  self->_avcStreamOutput = v22;

  if (self->_avcStreamOutput)
  {
    objc_msgSend(*p_avcVideoStream, "start");
    v25 = 1;
  }
  else
  {
    CMContinuityCaptureLog(2);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice startAVConferenceStack:].cold.2();

    v25 = 0;
  }
  v13 = v23;
LABEL_13:
  v30.receiver = self;
  v30.super_class = (Class)CMContinuityCaptureVideoDevice;
  -[CMContinuityCaptureDeviceBase startAVConferenceStack:](&v30, sel_startAVConferenceStack_, a3);

  return v25;
}

- (void)stopCaptureStack:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  NSObject *v7;
  NSObject *v8;
  AVCVideoStream *avcVideoStream;
  NSString *avcStreamCallID;
  NSObject *v11;
  void *v12;
  void *v13;
  id stopCompletionBlock;
  dispatch_time_t v15;
  NSObject *v16;
  _BOOL4 v17;
  AVCVideoStream *v18;
  AVCStreamOutput *avcStreamOutput;
  AVCVideoStream *v20;
  NSString *v21;
  NSObject *v22;
  id v23;
  objc_super v24;
  _QWORD block[4];
  id v26;
  _BYTE buf[12];
  __int16 v28;
  const char *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, void *))a4;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  if (self->_stopCompletionBlock)
  {
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = self;
      v28 = 2080;
      v29 = "-[CMContinuityCaptureVideoDevice stopCaptureStack:completion:]";
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ %s already in progress", buf, 0x16u);
    }

    if ((a3 & 4) != 0)
    {
      avcVideoStream = self->_avcVideoStream;
      self->_avcVideoStream = 0;

      avcStreamCallID = self->_avcStreamCallID;
      self->_avcStreamCallID = 0;

      CMContinuityCaptureLog(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCVideo reference", buf, 0xCu);
      }

    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1540]), "initWithDomain:code:userInfo:", CFSTR("ContinuityCapture"), 3, 0);
    v6[2](v6, v12);

  }
  else
  {
    if (self->_avcStreamOutputActive)
    {
      v13 = (void *)MEMORY[0x22E2A7CB0](v6);
      stopCompletionBlock = self->_stopCompletionBlock;
      self->_stopCompletionBlock = v13;

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v15 = dispatch_time(0, 5000000000);
      -[CMContinuityCaptureDeviceBase queue](self, "queue");
      v16 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __62__CMContinuityCaptureVideoDevice_stopCaptureStack_completion___block_invoke;
      block[3] = &unk_24F06AE60;
      objc_copyWeak(&v26, (id *)buf);
      dispatch_after(v15, v16, block);

      objc_destroyWeak(&v26);
      objc_destroyWeak((id *)buf);
    }
    v17 = -[CMContinuityCaptureVideoDevice stopAVConferenceStack](self, "stopAVConferenceStack");
    if ((a3 & 4) != 0)
    {
      v18 = self->_avcVideoStream;
      if (v18)
        -[AVCVideoStream stop](v18, "stop");
      avcStreamOutput = self->_avcStreamOutput;
      self->_avcStreamOutput = 0;

      v20 = self->_avcVideoStream;
      self->_avcVideoStream = 0;

      v21 = self->_avcStreamCallID;
      self->_avcStreamCallID = 0;

      self->_avcStreamOutputActive = 0;
      CMContinuityCaptureLog(2);
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_227C5D000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ clear AVCVideo reference", buf, 0xCu);
      }

    }
    v24.receiver = self;
    v24.super_class = (Class)CMContinuityCaptureVideoDevice;
    -[CMContinuityCaptureDeviceBase stopCaptureStack:completion:](&v24, sel_stopCaptureStack_completion_, a3, &__block_literal_global_176);
    if (!v17 || !self->_avcStreamOutputActive)
    {
      v23 = self->_stopCompletionBlock;
      self->_stopCompletionBlock = 0;

      v6[2](v6, 0);
    }
  }

}

void __62__CMContinuityCaptureVideoDevice_stopCaptureStack_completion___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = WeakRetained[35];
    if (v3)
    {
      v5 = v2;
      (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
      v4 = (void *)v5[35];
      v5[35] = 0;

      v2 = v5;
    }
  }

}

- (BOOL)stopAVConferenceStack
{
  NSObject *v3;
  AVCVideoStream *avcVideoStream;
  BOOL v5;
  AVCStreamOutput *avcStreamOutput;
  int v8;
  CMContinuityCaptureVideoDevice *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(2);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138543618;
    v9 = self;
    v10 = 2080;
    v11 = "-[CMContinuityCaptureVideoDevice stopAVConferenceStack]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v8, 0x16u);
  }

  if (self->_avcStreamOutput && (avcVideoStream = self->_avcVideoStream) != 0)
  {
    -[AVCVideoStream stop](avcVideoStream, "stop");
    v5 = 1;
  }
  else
  {
    v5 = 0;
  }
  if (!self->_avcStreamOutputActive)
  {
    avcStreamOutput = self->_avcStreamOutput;
    self->_avcStreamOutput = 0;

  }
  return v5;
}

- (void)postEvent:(id)a3 entity:(int64_t)a4 data:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  CMContinuityCaptureVideoDevice *v16;
  id v17[2];
  id location;

  v8 = a3;
  v9 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__CMContinuityCaptureVideoDevice_postEvent_entity_data___block_invoke;
  v13[3] = &unk_24F06AFA0;
  objc_copyWeak(v17, &location);
  v14 = v8;
  v15 = v9;
  v16 = self;
  v17[1] = (id)a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __56__CMContinuityCaptureVideoDevice_postEvent_entity_data___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  objc_super v43;
  objc_super v44;
  objc_super v45;
  objc_super v46;
  objc_super v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "compositeDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventImageCapture")))
      {
        v5 = v3[41];
        if (!v5)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v6 = objc_claimAutoreleasedReturnValue();
          v7 = v3[41];
          v3[41] = (id)v6;

          v5 = v3[41];
        }
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("ImageRequest"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v8);

        CMContinuityCaptureLog(2);
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          v10 = *(_QWORD *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("ImageRequest"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v3[41], "count");
          *(_DWORD *)buf = 138543874;
          v49 = v10;
          v50 = 2112;
          v51 = v11;
          v52 = 2048;
          v53 = v12;
          _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Added request %@ to stillImageRequestsQueue. Current queue count: %lu", buf, 0x20u);

        }
        v13 = *(_QWORD *)(a1 + 40);
        v14 = *(_QWORD *)(a1 + 64);
        v15 = *(_QWORD *)(a1 + 32);
        v47.receiver = *(id *)(a1 + 48);
        v47.super_class = (Class)CMContinuityCaptureVideoDevice;
        objc_msgSendSuper2(&v47, sel_postEvent_entity_data_, v15, v14, v13, v43.receiver, v43.super_class);
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventEnqueueReactionEffect")))
      {
        v16 = v3[42];
        if (!v16)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v17 = objc_claimAutoreleasedReturnValue();
          v18 = v3[42];
          v3[42] = (id)v17;

          v16 = v3[42];
        }
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("ReactionType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addObject:", v19);

        CMContinuityCaptureLog(2);
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          v21 = *(_QWORD *)(a1 + 48);
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("ReactionType"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v3[42], "count");
          *(_DWORD *)buf = 138543874;
          v49 = v21;
          v50 = 2112;
          v51 = v22;
          v52 = 2048;
          v53 = v23;
          _os_log_impl(&dword_227C5D000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Added request %@ to reactionRequestsQueue. Current queue count: %lu", buf, 0x20u);

        }
        v24 = *(_QWORD *)(a1 + 40);
        v25 = *(_QWORD *)(a1 + 64);
        v26 = *(_QWORD *)(a1 + 32);
        v46.receiver = *(id *)(a1 + 48);
        v46.super_class = (Class)CMContinuityCaptureVideoDevice;
        objc_msgSendSuper2(&v46, sel_postEvent_entity_data_, v26, v25, v24, v43.receiver, v43.super_class);
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventStopStream")))
      {
        objc_msgSend(v3, "scheduleSendingInvalidFramesAfterTimeout:", 0);
        +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "activeSession");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (v28)
        {
          +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "activeSession");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "activeConfiguration");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "logPowerLoggingEvent:configuration:", 0, v31);

        }
        v32 = *(_QWORD *)(a1 + 40);
        v33 = *(_QWORD *)(a1 + 64);
        v34 = *(_QWORD *)(a1 + 32);
        v45.receiver = *(id *)(a1 + 48);
        v45.super_class = (Class)CMContinuityCaptureVideoDevice;
        objc_msgSendSuper2(&v45, sel_postEvent_entity_data_, v34, v33, v32, v43.receiver, v43.super_class);
      }
      else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("kCMContinuityCaptureEventStartStream")))
      {
        objc_msgSend(v3, "scheduleSendingInvalidFramesAfterTimeout:", 1);
        v35 = *(_QWORD *)(a1 + 40);
        v36 = *(_QWORD *)(a1 + 64);
        v37 = *(_QWORD *)(a1 + 32);
        v44.receiver = *(id *)(a1 + 48);
        v44.super_class = (Class)CMContinuityCaptureVideoDevice;
        objc_msgSendSuper2(&v44, sel_postEvent_entity_data_, v37, v36, v35);
        +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "activeSession");
        v39 = (void *)objc_claimAutoreleasedReturnValue();

        if (v39)
        {
          +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "activeSession");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 48), "activeConfiguration");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "logPowerLoggingEvent:configuration:", 1, v42);

        }
      }
      else
      {
        objc_msgSendSuper2(&v43, sel_postEvent_entity_data_, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CMContinuityCaptureVideoDevice);
      }
    }

  }
}

- (void)scheduleResumeUserNotification:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = continuityCaptureNotificationCenter_isiPhone(v5);

    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = CFSTR("RESUME_NOTIFICATION_TITLE_IPAD");
    if (v6)
      v8 = CFSTR("RESUME_NOTIFICATION_TITLE_IPHONE");
    v22[0] = CFSTR("kContinuityCaptureNotificationKeyTitle");
    v22[1] = CFSTR("kContinuityCaptureNotificationKeyBody");
    v9 = CFSTR("RESUME_NOTIFICATION_BODY_IPAD");
    if (v6)
      v9 = CFSTR("RESUME_NOTIFICATION_BODY_IPHONE");
    v23[0] = v8;
    v23[1] = v9;
    v22[2] = CFSTR("kContinuityCaptureNotificationKeyIdentifier");
    v10 = (void *)MEMORY[0x24BDD17C8];
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "deviceIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "UUIDString");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@%@"), CFSTR("CMContinuityCaptureResumeNotification"), v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v13;
    v23[3] = MEMORY[0x24BDBD1C8];
    v22[3] = CFSTR("kContinuityCaptureNotificationKeyOneTime");
    v22[4] = CFSTR("kContinuityCaptureNotificationKeyDeviceModel");
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deviceModel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[4] = v15;
    v22[5] = CFSTR("kContinuityCaptureNotificationKeyDeviceIdentifier");
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "deviceIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "UUIDString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v23[5] = v18;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduleNotification:data:", 3, v19);

  }
  else
  {
    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v21 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "unscheduleNotification:", 3);

  }
}

- (void)scheduleDeviceBusyNotification:(BOOL)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  _QWORD v25[7];
  _QWORD v26[9];

  v26[7] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deviceModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = continuityCaptureNotificationCenter_isiPhone(v5);

    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = CFSTR("kContinuityCaptureNotificationKeyTitle");
    v25[1] = CFSTR("kContinuityCaptureNotificationKeyBody");
    v8 = CFSTR("DEVICE_BUSY_UNABLE_TO_CONNECT_IPAD");
    if (v6)
      v8 = CFSTR("DEVICE_BUSY_UNABLE_TO_CONNECT_IPHONE");
    v26[0] = CFSTR("DEVICE_BUSY_UNABLE_TO_CONNECT");
    v26[1] = v8;
    v25[2] = CFSTR("kContinuityCaptureNotificationKeyBodyArgs");
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "deviceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v21;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v24, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v26[2] = v20;
    v25[3] = CFSTR("kContinuityCaptureNotificationKeyIdentifier");
    v9 = (void *)MEMORY[0x24BDD17C8];
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "deviceIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UUIDString");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", CFSTR("%@%@"), CFSTR("CMContinuityCaptureSessionBusyNotification"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v26[3] = v12;
    v26[4] = MEMORY[0x24BDBD1C0];
    v25[4] = CFSTR("kContinuityCaptureNotificationKeyOneTime");
    v25[5] = CFSTR("kContinuityCaptureNotificationKeyDeviceModel");
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deviceModel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v26[5] = v14;
    v25[6] = CFSTR("kContinuityCaptureNotificationKeyDeviceIdentifier");
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "deviceIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "UUIDString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v26[6] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v26, v25, 7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scheduleNotification:data:", 11, v18);

  }
  else
  {
    +[CMContinuityCaptureUserNotificationCenter sharedInstance](CMContinuityCaptureUserNotificationCenter, "sharedInstance");
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "unscheduleNotification:", 11);

  }
}

- (void)startSendingInvalidFrames
{
  NSObject *v3;
  OS_dispatch_source *v4;
  OS_dispatch_source *blackFrameDispatchTimer;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  objc_super v11;
  _QWORD handler[4];
  id v13;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  if (!self->_blackFrameDispatchTimer)
  {
    -[CMContinuityCaptureDeviceBase queue](self, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v3);
    blackFrameDispatchTimer = self->_blackFrameDispatchTimer;
    self->_blackFrameDispatchTimer = v4;

    v6 = self->_blackFrameDispatchTimer;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke;
    handler[3] = &unk_24F06AE60;
    objc_copyWeak(&v13, &location);
    dispatch_source_set_event_handler(v6, handler);
    dispatch_source_set_timer((dispatch_source_t)self->_blackFrameDispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    dispatch_resume((dispatch_object_t)self->_blackFrameDispatchTimer);
    objc_destroyWeak(&v13);
  }
  -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "maxFrameRate");

  if (v8)
  {
    v11.receiver = self;
    v11.super_class = (Class)CMContinuityCaptureVideoDevice;
    -[CMContinuityCaptureDeviceBase startSendingInvalidFrames](&v11, sel_startSendingInvalidFrames);
    v9 = self->_blackFrameDispatchTimer;
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_source_set_timer(v9, 0, 1000 * (0xF4240 / objc_msgSend(v10, "maxFrameRate")), 0);

  }
  objc_destroyWeak(&location);
}

void __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke(uint64_t a1)
{
  __int128 v1;
  id *v2;
  _QWORD *WeakRetained;
  id *v4;
  CFTypeRef *v5;
  uint64_t v6;
  NSObject *v7;
  int64_t HostTimeInNanoSec;
  void *v9;
  const __CFAllocator *v10;
  NSObject *v11;
  CMTime v12;
  CMSampleBufferRef sampleBufferOut;
  CMSampleTimingInfo sampleTimingArray;

  sampleTimingArray.decodeTimeStamp.epoch = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = v1;
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v1;
  *(_OWORD *)&sampleTimingArray.duration.value = v1;
  *(_OWORD *)&sampleTimingArray.duration.epoch = v1;
  sampleBufferOut = 0;
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (id *)WeakRetained;
  if (WeakRetained)
  {
    v5 = (CFTypeRef *)(WeakRetained + 38);
    if (WeakRetained[38] || (v6 = objc_msgSend(WeakRetained, "createBlackSampleBuffer"), (*v5 = (CFTypeRef)v6) != 0))
    {
      if (CMContinityCaptureDebugLogEnabled())
      {
        CMContinuityCaptureLog(2);
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_3(v2);

      }
      sampleTimingArray.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
      HostTimeInNanoSec = CMContinuityCaptureGetHostTimeInNanoSec();
      CMTimeMake(&sampleTimingArray.presentationTimeStamp, HostTimeInNanoSec, 1000000000);
      objc_msgSend(v4, "activeConfiguration");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMake(&v12, 1, objc_msgSend(v9, "maxFrameRate"));
      sampleTimingArray.duration = v12;

      v10 = CFGetAllocator(*v5);
      CMSampleBufferCreateCopyWithNewTiming(v10, (CMSampleBufferRef)*v5, 1, &sampleTimingArray, &sampleBufferOut);
      if (sampleBufferOut)
      {
        objc_msgSend(v4[31], "dispatchFrame:entity:completion:", sampleBufferOut, objc_msgSend(v4, "entity"), &__block_literal_global_205);
        CFRelease(sampleBufferOut);
        goto LABEL_13;
      }
      CMContinuityCaptureLog(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_2(v2, v11);
    }
    else
    {
      if (!CMContinityCaptureDebugLogEnabled())
        goto LABEL_13;
      CMContinuityCaptureLog(2);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_1(v2);
    }

  }
LABEL_13:

}

- (void)stopSendingInvalidFrames
{
  NSObject *blackFrameDispatchTimer;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMContinuityCaptureVideoDevice;
  -[CMContinuityCaptureDeviceBase stopSendingInvalidFrames](&v4, sel_stopSendingInvalidFrames);
  blackFrameDispatchTimer = self->_blackFrameDispatchTimer;
  if (blackFrameDispatchTimer)
    dispatch_source_set_timer(blackFrameDispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
}

- (void)restartSendingInvalidFramesIfApplicable
{
  opaqueCMSampleBuffer *blackFrameSampleBuffer;
  objc_super v4;

  blackFrameSampleBuffer = self->_blackFrameSampleBuffer;
  if (blackFrameSampleBuffer)
  {
    CFRelease(blackFrameSampleBuffer);
    self->_blackFrameSampleBuffer = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CMContinuityCaptureVideoDevice;
  -[CMContinuityCaptureDeviceBase restartSendingInvalidFramesIfApplicable](&v4, sel_restartSendingInvalidFramesIfApplicable);
}

- (void)stateMachineStartSendingBlurredFrames
{
  NSObject *v3;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *blurredFrameDispatchTimer;
  NSObject *v7;
  void *v8;
  BOOL v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  id v16;
  id location;
  uint8_t buf[4];
  CMContinuityCaptureVideoDevice *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  if (!self->_blurredFrameTimerActive)
  {
    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v19 = self;
      v20 = 2080;
      v21 = "-[CMContinuityCaptureVideoDevice stateMachineStartSendingBlurredFrames]";
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", buf, 0x16u);
    }

    if (!self->_blurredFrameDispatchTimer)
    {
      -[CMContinuityCaptureDeviceBase queue](self, "queue");
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, v4);
      blurredFrameDispatchTimer = self->_blurredFrameDispatchTimer;
      self->_blurredFrameDispatchTimer = v5;

      v7 = self->_blurredFrameDispatchTimer;
      v12 = MEMORY[0x24BDAC760];
      v13 = 3221225472;
      v14 = __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke;
      v15 = &unk_24F06AE60;
      objc_copyWeak(&v16, &location);
      dispatch_source_set_event_handler(v7, &v12);
      dispatch_source_set_timer((dispatch_source_t)self->_blurredFrameDispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
      dispatch_resume((dispatch_object_t)self->_blurredFrameDispatchTimer);
      objc_destroyWeak(&v16);
    }
    -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration", v12, v13, v14, v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "maxFrameRate") == 0;

    if (!v9)
    {
      v10 = self->_blurredFrameDispatchTimer;
      -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      dispatch_source_set_timer(v10, 0, 1000 * (0xF4240 / objc_msgSend(v11, "maxFrameRate")), 0);

    }
    self->_blurredFrameTimerActive = 1;
    objc_destroyWeak(&location);
  }
}

void __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke(uint64_t a1)
{
  __int128 v1;
  id *v2;
  _QWORD *WeakRetained;
  id *v4;
  CFTypeRef *v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  int64_t HostTimeInNanoSec;
  void *v10;
  const __CFAllocator *v11;
  NSObject *v12;
  CMTime v13;
  CMSampleBufferRef sampleBufferOut;
  CMSampleTimingInfo sampleTimingArray;

  sampleTimingArray.decodeTimeStamp.epoch = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = v1;
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v1;
  *(_OWORD *)&sampleTimingArray.duration.value = v1;
  *(_OWORD *)&sampleTimingArray.duration.epoch = v1;
  sampleBufferOut = 0;
  v2 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = (id *)WeakRetained;
  if (WeakRetained)
  {
    v5 = (CFTypeRef *)(WeakRetained + 37);
    if (WeakRetained[37]
      || (v6 = objc_msgSend(WeakRetained, "createBlurredSampleBuffer"), (*v5 = (CFTypeRef)v6) != 0)
      || (v7 = objc_msgSend(v4, "createBlackSampleBuffer"), (*v5 = (CFTypeRef)v7) != 0))
    {
      if (CMContinityCaptureDebugLogEnabled())
      {
        CMContinuityCaptureLog(2);
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke_cold_3(v2);

      }
      sampleTimingArray.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
      HostTimeInNanoSec = CMContinuityCaptureGetHostTimeInNanoSec();
      CMTimeMake(&sampleTimingArray.presentationTimeStamp, HostTimeInNanoSec, 1000000000);
      objc_msgSend(v4, "activeConfiguration");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      CMTimeMake(&v13, 1, objc_msgSend(v10, "maxFrameRate"));
      sampleTimingArray.duration = v13;

      v11 = CFGetAllocator(*v5);
      CMSampleBufferCreateCopyWithNewTiming(v11, (CMSampleBufferRef)*v5, 1, &sampleTimingArray, &sampleBufferOut);
      if (sampleBufferOut)
      {
        objc_msgSend(v4[31], "dispatchFrame:entity:completion:", sampleBufferOut, objc_msgSend(v4, "entity"), &__block_literal_global_213);
        CFRelease(sampleBufferOut);
        goto LABEL_14;
      }
      CMContinuityCaptureLog(2);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_2(v2, v12);
    }
    else
    {
      if (!CMContinityCaptureDebugLogEnabled())
        goto LABEL_14;
      CMContinuityCaptureLog(2);
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke_cold_1(v2);
    }

  }
LABEL_14:

}

- (void)stateMachineStopSendingBlurredFrames
{
  NSObject *v3;
  NSObject *blurredFrameDispatchTimer;
  int v5;
  CMContinuityCaptureVideoDevice *v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (self->_blurredFrameTimerActive)
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543618;
      v6 = self;
      v7 = 2080;
      v8 = "-[CMContinuityCaptureVideoDevice stateMachineStopSendingBlurredFrames]";
      _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ %s", (uint8_t *)&v5, 0x16u);
    }

    blurredFrameDispatchTimer = self->_blurredFrameDispatchTimer;
    if (blurredFrameDispatchTimer)
      dispatch_source_set_timer(blurredFrameDispatchTimer, 0xFFFFFFFFFFFFFFFFLL, 0, 0);
    self->_blurredFrameTimerActive = 0;
  }
}

- (void)completeImageCaptureRequest:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  opaqueCMSampleBuffer *v10;
  void *v11;
  CMTimeValue value;
  CMTimeEpoch epoch;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  OpaqueCMClock *HostTimeClock;
  void (**v24)(_QWORD, _QWORD, _QWORD);
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  CMTime buf;
  uint64_t v33;
  __int16 v34;
  opaqueCMSampleBuffer *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[CMContinuityCaptureDeviceBase queue](self, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    if (!-[NSMutableArray count](self->_stillImageRequestsQueue, "count"))
    {
      CMContinuityCaptureLog(2);
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureVideoDevice completeImageCaptureRequest:].cold.1();
      goto LABEL_28;
    }
    -[NSMutableArray firstObject](self->_stillImageRequestsQueue, "firstObject");
    v7 = objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectAtIndex:](self->_stillImageRequestsQueue, "removeObjectAtIndex:", 0);
    CMContinuityCaptureLog(2);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf.value) = 138412802;
      *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
      LOWORD(buf.flags) = 2112;
      *(_QWORD *)((char *)&buf.flags + 2) = v4;
      HIWORD(buf.epoch) = 2112;
      v33 = (uint64_t)v7;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%@ completeImageCaptureRequest with error %@. Removed %@ from queue", (uint8_t *)&buf, 0x20u);
    }

    if (v4)
    {
      -[NSObject error](v7, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v9)
        -[NSObject setError:](v7, "setError:", v4);
    }
    -[NSObject completionHandler](v7, "completionHandler");
    v10 = (opaqueCMSampleBuffer *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
LABEL_24:
      CMContinuityCaptureLog(2);
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject completionHandler](v7, "completionHandler");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = (void *)MEMORY[0x22E2A7CB0]();
        v29 = -[NSObject uniqueID](v7, "uniqueID");
        -[NSObject error](v7, "error");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(buf.value) = 138413314;
        *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)self;
        LOWORD(buf.flags) = 2048;
        *(_QWORD *)((char *)&buf.flags + 2) = v28;
        HIWORD(buf.epoch) = 2048;
        v33 = v29;
        v34 = 2048;
        v35 = v10;
        v36 = 2112;
        v37 = v30;
        _os_log_impl(&dword_227C5D000, v26, OS_LOG_TYPE_DEFAULT, "%@ Called %p for completed image capture request ID:%lld. sbuf:%p error:%@", (uint8_t *)&buf, 0x34u);

      }
      if (v10)
        CFRelease(v10);
LABEL_28:

      goto LABEL_29;
    }
    -[NSObject error](v7, "error");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

      v10 = 0;
LABEL_23:
      -[NSObject completionHandler](v7, "completionHandler");
      v24 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      -[NSObject error](v7, "error");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, opaqueCMSampleBuffer *, uint64_t))v24)[2](v24, v10, objc_msgSend(v25, "code"));

      goto LABEL_24;
    }
    -[NSObject imageFileData](v7, "imageFileData");
    v10 = (opaqueCMSampleBuffer *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_23;
    value = *MEMORY[0x24BDC0D40];
    v31 = *(_QWORD *)(MEMORY[0x24BDC0D40] + 8);
    epoch = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
    objc_msgSend(v5, "client");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "timeSyncClock");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[NSObject networkTimestamp](v7, "networkTimestamp");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
      {
        objc_msgSend(v5, "client");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timeSyncClock");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject networkTimestamp](v7, "networkTimestamp");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = objc_msgSend(v19, "machAbsoluteTimeForDomainTime:", objc_msgSend(v20, "unsignedLongLongValue"));

        v22 = v31;
        if (v21 != *MEMORY[0x24BEB70D8])
        {
          CMClockMakeHostTimeFromSystemUnits(&buf, v21);
          value = buf.value;
          epoch = buf.epoch;
          v22 = *(_QWORD *)&buf.timescale;
        }
        goto LABEL_20;
      }
    }
    else
    {

    }
    v22 = v31;
LABEL_20:
    if ((v22 & 0x100000000) == 0)
    {
      HostTimeClock = CMClockGetHostTimeClock();
      CMClockGetTime(&buf, HostTimeClock);
      value = buf.value;
      epoch = buf.epoch;
      v22 = *(_QWORD *)&buf.timescale;
    }
    buf.value = value;
    *(_QWORD *)&buf.timescale = v22;
    buf.epoch = epoch;
    v10 = -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:](self, "_createStillImageDataBufferFromRequest:timestamp:", v7, &buf);
    goto LABEL_23;
  }
LABEL_29:

}

- (opaqueCMSampleBuffer)_createStillImageDataBufferFromRequest:(id)a3 timestamp:(id *)a4
{
  id v5;
  __int128 v6;
  void *v7;
  const __CFAllocator *v8;
  char *v9;
  id v10;
  opaqueCMSampleBuffer *v11;
  NSObject *v13;
  size_t sampleSizeArray;
  CMSampleTimingInfo sampleTimingArray;
  char *dataPointerOut;
  CMBlockBufferRef blockBufferOut;
  CMVideoFormatDescriptionRef formatDescriptionOut;
  CMSampleBufferRef v19;

  v5 = a3;
  formatDescriptionOut = 0;
  v19 = 0;
  dataPointerOut = (char *)0xAAAAAAAAAAAAAAAALL;
  blockBufferOut = 0;
  sampleTimingArray.decodeTimeStamp.epoch = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&sampleTimingArray.presentationTimeStamp.timescale = v6;
  *(_OWORD *)&sampleTimingArray.decodeTimeStamp.value = v6;
  *(_OWORD *)&sampleTimingArray.duration.value = v6;
  *(_OWORD *)&sampleTimingArray.duration.epoch = v6;
  objc_msgSend(v5, "imageFileData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
  {
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    if (CMBlockBufferCreateWithMemoryBlock(v8, 0, objc_msgSend(v7, "length"), v8, 0, 0, objc_msgSend(v7, "length"), 1u, &blockBufferOut))
    {
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.5();
    }
    else if (CMBlockBufferGetDataPointer(blockBufferOut, 0, 0, 0, &dataPointerOut))
    {
      CMContinuityCaptureLog(2);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.4();
    }
    else
    {
      v9 = dataPointerOut;
      v10 = objc_retainAutorelease(v7);
      memcpy(v9, (const void *)objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"));
      sampleTimingArray.presentationTimeStamp = (CMTime)*a4;
      sampleTimingArray.decodeTimeStamp = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
      sampleSizeArray = CMBlockBufferGetDataLength(blockBufferOut);
      if (CMVideoFormatDescriptionCreate(v8, objc_msgSend(v5, "imageCodecType"), objc_msgSend(v5, "imageWidth"), objc_msgSend(v5, "imageHeight"), 0, &formatDescriptionOut))
      {
        CMContinuityCaptureLog(2);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.3();
      }
      else
      {
        if (!CMSampleBufferCreate(v8, blockBufferOut, 1u, 0, 0, formatDescriptionOut, 1, 1, &sampleTimingArray, 1, &sampleSizeArray, &v19))goto LABEL_6;
        CMContinuityCaptureLog(2);
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.2();
      }
    }
  }
  else
  {
    CMContinuityCaptureLog(2);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CMContinuityCaptureVideoDevice _createStillImageDataBufferFromRequest:timestamp:].cold.1();
  }

LABEL_6:
  if (blockBufferOut)
    CFRelease(blockBufferOut);
  if (formatDescriptionOut)
    CFRelease(formatDescriptionOut);
  v11 = v19;

  return v11;
}

- (void)stateMachineImageCapture
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%@ Got action from state machine to capture still image but couldn't find enqueued request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __58__CMContinuityCaptureVideoDevice_stateMachineImageCapture__block_invoke(uint64_t a1)
{
  id *v1;
  _QWORD *WeakRetained;
  NSObject *v3;
  void *v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMContinuityCaptureLog(2);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __58__CMContinuityCaptureVideoDevice_stateMachineImageCapture__block_invoke_cold_1(v1, v3);

    v4 = (void *)WeakRetained[43];
    WeakRetained[43] = 0;

    objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 12, 0, 0);
  }

}

void __58__CMContinuityCaptureVideoDevice_stateMachineImageCapture__block_invoke_214(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    dispatch_block_cancel(*(dispatch_block_t *)(a1 + 32));
    v3 = (void *)v6[43];
    v6[43] = 0;

    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (v4 && objc_msgSend(v4, "code"))
      v5 = 12;
    else
      v5 = 13;
    objc_msgSend(v6, "postActionOfType:forEvent:option:", v5, 0, 0);
    WeakRetained = v6;
  }

}

void __58__CMContinuityCaptureVideoDevice_stateMachineImageCapture__block_invoke_2(uint64_t a1, void *a2)
{
  dispatch_group_t *WeakRetained;
  dispatch_group_t *v5;

  WeakRetained = (dispatch_group_t *)objc_loadWeakRetained((id *)(a1 + 40));
  if (a2 && WeakRetained)
  {
    v5 = WeakRetained;
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
    dispatch_group_leave(v5[43]);
    WeakRetained = v5;
  }

}

- (void)stateMachineEnqueueReactionEffect
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%@ Got action from state machine to perform reaction effect but couldn't find enqueued request", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __67__CMContinuityCaptureVideoDevice_stateMachineEnqueueReactionEffect__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "postActionOfType:forEvent:option:", 13, 0, 0);

}

- (void)postActionOfType:(unint64_t)a3 forEvent:(id)a4 option:(unint64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  OpaqueCMClock *HostTimeClock;
  _OWORD *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  char v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  int v40;
  void *v41;
  unint64_t v42;
  id obj;
  objc_super v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  CMTime v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = v8;
  switch(a3)
  {
    case 1uLL:
      -[CMContinuityCaptureDeviceBase compositeDelegate](self, "compositeDelegate");
      v10 = objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v11 = (void *)v10;
        -[CMContinuityCaptureVideoDevice stateMachineStopSendingBlurredFrames](self, "stateMachineStopSendingBlurredFrames");
        self->_canIssueStateMismatchEvent = 1;
        HostTimeClock = CMClockGetHostTimeClock();
        CMClockGetTime(&v49, HostTimeClock);
        self->_streamStartsTime = ($95D729B680665BEAEFA1D6FCA8238556)v49;

        goto LABEL_42;
      }
      goto LABEL_43;
    case 2uLL:
      self->_numberOfFramesDispatched = 0;
      v13 = (_OWORD *)MEMORY[0x24BDC0D40];
      self->_streamStartsTime.epoch = *(_QWORD *)(MEMORY[0x24BDC0D40] + 16);
      *(_OWORD *)&self->_streamStartsTime.value = *v13;
      -[CMContinuityCaptureDeviceBase scheduleSendingInvalidFramesAfterTimeout:](self, "scheduleSendingInvalidFramesAfterTimeout:", 0);
      if (-[CMContinuityCaptureDeviceBase entity](self, "entity") == 1)
      {
        -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "forcefulCenterStageEnablementType");

        if (v15 == 1)
          -[CMContinuityCaptureVideoDevice restoreAffectedClientsCenterStageState](self, "restoreAffectedClientsCenterStageState");
      }
      if (a5 == 1)
        goto LABEL_42;
      -[CMContinuityCaptureDeviceBase capabilities](self, "capabilities");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "controls");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v18 = v17;
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
      obj = v18;
      if (!v19)
        goto LABEL_40;
      v20 = v19;
      v42 = a5;
      v21 = *(_QWORD *)v46;
      break;
    case 4uLL:
      -[CMContinuityCaptureVideoDevice stateMachineImageCapture](self, "stateMachineImageCapture");
      goto LABEL_42;
    case 5uLL:
      -[CMContinuityCaptureVideoDevice stateMachineEnqueueReactionEffect](self, "stateMachineEnqueueReactionEffect");
      goto LABEL_42;
    case 6uLL:
      objc_msgSend(v8, "data");
      v26 = objc_claimAutoreleasedReturnValue();
      if (v26)
      {
        v27 = (void *)v26;
        objc_msgSend(v9, "data");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          objc_msgSend(v9, "data");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyOption"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          a5 |= objc_msgSend(v31, "integerValue");

        }
      }
      if ((a5 & 2) != 0)
      {
        -[CMContinuityCaptureDeviceBase scheduleSendingInvalidFramesAfterTimeout:](self, "scheduleSendingInvalidFramesAfterTimeout:", 0);
        -[CMContinuityCaptureVideoDevice stateMachineStartSendingBlurredFrames](self, "stateMachineStartSendingBlurredFrames");
      }
      if ((a5 & 4) != 0)
      {
        objc_msgSend(v9, "data");
        v32 = objc_claimAutoreleasedReturnValue();
        if (!v32)
          goto LABEL_37;
        v33 = (void *)v32;
        objc_msgSend(v9, "data");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        if (v35)
        {
          objc_msgSend(v9, "data");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("CMContinuityCaptureStateMachineEventDataKeyPostTime"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "unsignedLongLongValue");

          if (v38 > -[CMContinuityCaptureDeviceBase cameraCaptureStackStartTime](self, "cameraCaptureStackStartTime")
            || v38 > -[CMContinuityCaptureDeviceBase avCaptureStackStartTime](self, "avCaptureStackStartTime"))
          {
            -[CMContinuityCaptureVideoDevice stopCaptureStack:completion:](self, "stopCaptureStack:completion:", 4, &__block_literal_global_215);
          }
        }
        else
        {
LABEL_37:
          -[CMContinuityCaptureDeviceBase cameraCaptureStackStartTime](self, "cameraCaptureStackStartTime");
          -[CMContinuityCaptureDeviceBase avCaptureStackStartTime](self, "avCaptureStackStartTime");
        }
      }
      goto LABEL_42;
    case 7uLL:
      if ((a5 & 0x40) == 0)
        goto LABEL_42;
      goto LABEL_36;
    case 8uLL:
      objc_msgSend(v8, "name");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v39, "isEqualToString:", CFSTR("kCMContinuityCaptureEventUserPause"));

      if (v40)
        -[CMContinuityCaptureVideoDevice scheduleResumeUserNotification:](self, "scheduleResumeUserNotification:", 1);
      -[CMContinuityCaptureVideoDevice stateMachineStartSendingBlurredFrames](self, "stateMachineStartSendingBlurredFrames");
      goto LABEL_42;
    case 9uLL:
      -[CMContinuityCaptureVideoDevice scheduleResumeUserNotification:](self, "scheduleResumeUserNotification:", 0);
LABEL_36:
      -[CMContinuityCaptureVideoDevice stateMachineStopSendingBlurredFrames](self, "stateMachineStopSendingBlurredFrames");
      goto LABEL_42;
    default:
LABEL_42:
      v44.receiver = self;
      v44.super_class = (Class)CMContinuityCaptureVideoDevice;
      -[CMContinuityCaptureDeviceBase postActionOfType:forEvent:option:](&v44, sel_postActionOfType_forEvent_option_, a3, v9, a5);
LABEL_43:

      return;
  }
  while (1)
  {
    for (i = 0; i != v20; ++i)
    {
      if (*(_QWORD *)v46 != v21)
        objc_enumerationMutation(v18);
      v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
      objc_msgSend(v23, "name", v42);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "isEqualToString:", CFSTR("4cc_cfri_glob_0000"));

      if ((v25 & 1) != 0)
      {
        v18 = v23;

        a5 = v42;
        if (v18)
        {
          -[CMContinuityCaptureDeviceBase activeConfiguration](self, "activeConfiguration");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "setCenterStageRectOfInterest:", 0x24F07FDC8);

          objc_msgSend(v18, "setValue:", 0x24F07FDC8);
          -[CMContinuityCaptureCMIOVideoDevice setValueForControl:completion:](self->_cmioCaptureDevice, "setValueForControl:completion:", v18, 0);
LABEL_40:

        }
        goto LABEL_42;
      }
    }
    v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v50, 16);
    if (!v20)
    {
      a5 = v42;
      goto LABEL_40;
    }
  }
}

- (void)postActionCompletionForEventName:(id)a3 eventData:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  objc_super v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("kCMContinuityCaptureEventImageCapture")))
  {
    -[CMContinuityCaptureVideoDevice completeImageCaptureRequest:](self, "completeImageCaptureRequest:", v10);
  }
  else if (objc_msgSend(v8, "isEqualToString:", CFSTR("kCMContinuityCaptureEventStopStream")))
  {
    self->_canIssueStateMismatchEvent = 0;
    self->_failedBufferCountDueToMismatchState = 0;
    -[CMContinuityCaptureDeviceBase transportDevice](self, "transportDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stopStream:option:completion:", -[CMContinuityCaptureDeviceBase entity](self, "entity"), 0, &__block_literal_global_218);

  }
  v12.receiver = self;
  v12.super_class = (Class)CMContinuityCaptureVideoDevice;
  -[CMContinuityCaptureDeviceBase postActionCompletionForEventName:eventData:error:](&v12, sel_postActionCompletionForEventName_eventData_error_, v8, v9, v10);

}

- (id)controls
{
  return -[CMContinuityCaptureCMIOVideoDevice controls](self->_cmioCaptureDevice, "controls");
}

- (void)didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11[2];
  id location;

  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__CMContinuityCaptureVideoDevice_didCaptureStillImage_entity___block_invoke;
  v9[3] = &unk_24F06B750;
  objc_copyWeak(v11, &location);
  v10 = v6;
  v11[1] = (id)a4;
  v8 = v6;
  dispatch_async(v7, v9);

  objc_destroyWeak(v11);
  objc_destroyWeak(&location);
}

void __62__CMContinuityCaptureVideoDevice_didCaptureStillImage_entity___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_didCaptureStillImage:entity:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)_didCaptureStillImage:(id)a3 entity:(int64_t)a4
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *stillImageCaptureGroup;
  NSObject *v14;
  int v15;
  CMContinuityCaptureVideoDevice *v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  CMContinuityCaptureLog(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138543618;
    v16 = self;
    v17 = 2112;
    v18 = v5;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ Got back still image %@", (uint8_t *)&v15, 0x16u);
  }

  -[NSMutableArray firstObject](self->_stillImageRequestsQueue, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "uniqueID");
  if (v9 == objc_msgSend(v5, "uniqueID"))
  {
    objc_msgSend(v8, "setCaptureComplete:", objc_msgSend(v5, "captureComplete"));
    objc_msgSend(v5, "error");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:", v10);

    objc_msgSend(v5, "networkTimestamp");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setNetworkTimestamp:", v11);

    objc_msgSend(v5, "imageFileData");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setImageFileData:", v12);

    objc_msgSend(v8, "setImageCodecType:", objc_msgSend(v5, "imageCodecType"));
    objc_msgSend(v8, "setImageWidth:", objc_msgSend(v5, "imageWidth"));
    objc_msgSend(v8, "setImageHeight:", objc_msgSend(v5, "imageHeight"));
    stillImageCaptureGroup = self->_stillImageCaptureGroup;
    if (stillImageCaptureGroup)
      dispatch_group_leave(stillImageCaptureGroup);
  }
  else
  {
    CMContinuityCaptureLog(2);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = 138543874;
      v16 = self;
      v17 = 2112;
      v18 = v8;
      v19 = 2112;
      v20 = v5;
      _os_log_error_impl(&dword_227C5D000, v14, OS_LOG_TYPE_ERROR, "%{public}@ Got back still image for an unknown request. inflight:%@ received:%@", (uint8_t *)&v15, 0x20u);
    }

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21[2];
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v13 = objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __81__CMContinuityCaptureVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke;
  v17[3] = &unk_24F06AFA0;
  objc_copyWeak(v21, &location);
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v21[1] = a6;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(v13, v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
}

void __81__CMContinuityCaptureVideoDevice_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_observeValueForKeyPath:ofObject:change:context:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64));
    WeakRetained = v3;
  }

}

- (void)_observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  NSObject *v23;
  void *v24;
  char v25;
  int v26;
  CMContinuityCaptureVideoDevice *v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  id v31;
  __int16 v32;
  id v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (CMContinityCaptureDebugLogEnabled())
  {
    CMContinuityCaptureLog(2);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v26 = 138413058;
      v27 = self;
      v28 = 2080;
      v29 = "-[CMContinuityCaptureVideoDevice _observeValueForKeyPath:ofObject:change:context:]";
      v30 = 2112;
      v31 = v9;
      v32 = 2112;
      v33 = v10;
      _os_log_debug_impl(&dword_227C5D000, v12, OS_LOG_TYPE_DEBUG, "%@ %s forKeyPath: %@ ofObject: %@", (uint8_t *)&v26, 0x2Au);
    }

  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("active")))
  {
    v13 = *MEMORY[0x24BDD0E70];
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E70]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "BOOLValue"))
    {

    }
    else
    {
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "BOOLValue");

      if (v22)
      {
        CMContinuityCaptureLog(2);
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          v26 = 138543362;
          v27 = self;
          _os_log_impl(&dword_227C5D000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ active 1 -> 0", (uint8_t *)&v26, 0xCu);
        }

        -[CMContinuityCaptureVideoDevice stopCaptureStack:completion:](self, "stopCaptureStack:completion:", 4, &__block_literal_global_221);
        goto LABEL_23;
      }
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", v13);
    v15 = objc_claimAutoreleasedReturnValue();
    if ((-[NSObject BOOLValue](v15, "BOOLValue") & 1) == 0)
    {
LABEL_22:

      goto LABEL_23;
    }
    objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x24BDD0E80]);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "BOOLValue");

    if ((v25 & 1) == 0)
    {
      CMContinuityCaptureLog(2);
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v26 = 138543362;
        v27 = self;
        _os_log_impl(&dword_227C5D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ active 0 -> 1", (uint8_t *)&v26, 0xCu);
      }
      goto LABEL_22;
    }
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("currentState")))
  {
    v15 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    v16 = (void *)MEMORY[0x24BDC1378];
    -[CMContinuityCaptureDeviceBase stateMachineCurrentState](self, "stateMachineCurrentState");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "name");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDC1370], "readOnlyPropertyAttribute");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "propertyStateWithValue:attributes:", v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (v20)
      -[NSObject setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", v20, CFSTR("CMIOExtensionPropertyContinuityCaptureDeviceState"));
    if (-[NSObject count](v15, "count"))
      -[CMIOExtensionDevice notifyPropertiesChanged:](self->_cmioCaptureDevice, "notifyPropertiesChanged:", v15);

    goto LABEL_22;
  }
LABEL_23:

}

- (void)terminateComplete:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)CMContinuityCaptureVideoDevice;
  -[CMContinuityCaptureDeviceBase terminateComplete:](&v6, sel_terminateComplete_, &__block_literal_global_222);
  -[CMContinuityCaptureCMIOVideoDevice terminateComplete:](self->_cmioCaptureDevice, "terminateComplete:", v4);

}

- (void)setValueForControl:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  CMContinuityCaptureVideoDevice *v12;
  id v13;
  id location;

  v6 = a3;
  v7 = a4;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  -[CMContinuityCaptureDeviceBase queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __64__CMContinuityCaptureVideoDevice_setValueForControl_completion___block_invoke;
  v10[3] = &unk_24F06AF00;
  objc_copyWeak(&v13, &location);
  v11 = v6;
  v12 = self;
  v9 = v6;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

void __64__CMContinuityCaptureVideoDevice_setValueForControl_completion___block_invoke(id *a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  char isKindOfClass;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v35;
  double v36;
  void *v37;
  int v38;
  id v39;
  void *v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  NSObject *v46;
  void *v47;
  int v48;
  void *v49;
  int v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  void *v55;
  int v56;
  const char *v57;
  void *v58;
  int v59;
  void *v60;
  int v61;
  void *v62;
  int v63;
  void *v64;
  uint64_t v65;
  void *v66;
  int v67;
  const char *v68;
  void *v69;
  int v70;
  void *v71;
  int v72;
  void *v73;
  int v74;
  void *v75;
  uint64_t v76;
  void *v77;
  int v78;
  const char *v79;
  void *v80;
  int v81;
  void *v82;
  int v83;
  void *v84;
  int v85;
  void *v86;
  uint64_t v87;
  void *v88;
  int v89;
  const char *v90;
  void *v91;
  int v92;
  void *v93;
  int v94;
  void *v95;
  int v96;
  void *v97;
  uint64_t v98;
  void *v99;
  int v100;
  const char *v101;
  void *v102;
  int v103;
  void *v104;
  int v105;
  void *v106;
  int v107;
  void *v108;
  uint64_t v109;
  void *v110;
  int v111;
  const char *v112;
  void *v113;
  int v114;
  id v115;
  void *v116;
  double v117;
  double v118;
  void *v119;
  double v120;
  double v121;
  void *v122;
  double v123;
  void *v124;
  int v125;
  void *v126;
  int v127;
  void *v128;
  int v129;
  void *v130;
  uint64_t v131;
  void *v132;
  int v133;
  const char *v134;
  void *v135;
  int v136;
  void *v137;
  int v138;
  void *v139;
  int v140;
  void *v141;
  uint64_t v142;
  void *v143;
  int v144;
  const char *v145;
  void *v146;
  int v147;
  void *v148;
  int v149;
  void *v150;
  int v151;
  void *v152;
  uint64_t v153;
  void *v154;
  int v155;
  const char *v156;
  void *v157;
  int v158;
  id v159;
  void *v160;
  void *v161;
  NSObject *v162;
  void *v163;
  double v164;
  void *v165;
  int v166;
  void *v167;
  uint64_t v168;
  void *v169;
  int v170;
  void *v171;
  uint64_t v172;
  void *v173;
  void *v174;
  int v175;
  const __CFDictionary *v176;
  const char *v177;
  void *v178;
  int v179;
  const __CFDictionary *v180;
  NSObject *v181;
  uint32_t v182;
  void *v183;
  int v184;
  void *v185;
  int v186;
  void *v187;
  int v188;
  id v189;
  void *v190;
  uint64_t v191;
  NSObject *v192;
  void *v193;
  void *v194;
  void *v195;
  int v196;
  id v197;
  void *v198;
  uint64_t v199;
  void *v200;
  uint64_t v201;
  void *v202;
  int v203;
  void *v204;
  int v205;
  void *v206;
  int v207;
  void *v208;
  uint64_t v209;
  void *v210;
  NSObject *v211;
  void *v212;
  void *v213;
  void *v214;
  int v215;
  void *v216;
  int v217;
  void *v218;
  int v219;
  void *v220;
  uint64_t v221;
  void *v222;
  void *v223;
  int v224;
  NSObject *v225;
  void *v226;
  double v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  int v234;
  void *v235;
  int v236;
  void *v237;
  float v238;
  float v239;
  void *v240;
  float v241;
  float v242;
  void *v243;
  int v244;
  int v245;
  void *v246;
  double v247;
  float v248;
  void *v249;
  int v250;
  void *v251;
  float v252;
  float v253;
  void *v254;
  float v255;
  float v256;
  void *v257;
  int v258;
  int v259;
  void *v260;
  double v261;
  float v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  uint64_t v267;
  void *v268;
  void *v269;
  void *v270;
  uint64_t v271;
  void *v272;
  NSObject *v273;
  void *v274;
  double v275;
  void *v276;
  NSObject *v277;
  void *v278;
  double v279;
  int v280;
  void *v281;
  int v282;
  void *v283;
  int v284;
  void *v285;
  int v286;
  void *v287;
  uint64_t v288;
  void *v289;
  void *v290;
  int v291;
  NSObject *v292;
  double v293;
  void *v294;
  int v295;
  void *v296;
  uint64_t v297;
  void *v298;
  void *v299;
  void *v300;
  CGPoint v301;
  uint8_t buf[4];
  id *v303;
  __int16 v304;
  double v305;
  __int16 v306;
  CGFloat x;
  __int16 v308;
  CGFloat y;
  uint64_t v310;

  v310 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (id *)objc_loadWeakRetained(a1 + 6);
  if (!WeakRetained)
    goto LABEL_4;
  v3 = a1 + 4;
  if (objc_msgSend(a1[4], "entity") == 4)
    goto LABEL_3;
  objc_msgSend(*v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("4cc_cfen_glob_0000"));

  if (v5)
  {
    v6 = a1[5];
    objc_msgSend(a1[4], "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateForcefulCenterStageEnablementStateIfNeededWithCenterStageEnabled:", objc_msgSend(v7, "BOOLValue"));

    objc_msgSend(WeakRetained, "activeConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v7) = objc_msgSend(v8, "centerStageEnabled");
    objc_msgSend(a1[4], "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

    if ((_DWORD)v7 != v10)
    {
      objc_msgSend(*v3, "value");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "BOOLValue");
      objc_msgSend(WeakRetained, "activeConfiguration");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setCenterStageEnabled:", v12);

      CMContinuityCaptureLog(2);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "activeConfiguration");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "centerStageEnabled");
        *(double *)&v17 = COERCE_DOUBLE("Off");
        if (v16)
          *(double *)&v17 = COERCE_DOUBLE("On");
        *(_DWORD *)buf = 138543618;
        v303 = WeakRetained;
        v304 = 2080;
        v305 = *(double *)&v17;
        _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ CenterStageEnabled %s", buf, 0x16u);

      }
      objc_msgSend(WeakRetained, "transportDevice");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setValueForControl:completion:", *v3, 0);

      +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "activeSession");
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (v20)
      {
        +[CMContinuityCaptureSessionStateManager sharedInstance](CMContinuityCaptureSessionStateManager, "sharedInstance");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "activeSession");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(a1[5], "streaming");
        objc_msgSend(a1[5], "activeConfiguration");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "logPowerLoggingEvent:configuration:", v23, v24);

      }
    }
    goto LABEL_3;
  }
  objc_msgSend(*v3, "name");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "isEqualToString:", CFSTR("4cc_cfac_glob_0000"));

  if (v26)
    goto LABEL_3;
  objc_msgSend(*v3, "name");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v27, "isEqualToString:", CFSTR("4cc_cfri_glob_0000"))
    && (objc_msgSend(*v3, "value"), (v28 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v29 = (void *)v28;
    objc_msgSend(*v3, "value");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(*v3, "value");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "activeConfiguration");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setCenterStageRectOfInterest:", v32);

      CMContinuityCaptureLog(2);
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "activeConfiguration");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "centerStageRectOfInterest");
        v36 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
        *(_DWORD *)buf = 138543618;
        v303 = WeakRetained;
        v304 = 2112;
        v305 = v36;
        _os_log_impl(&dword_227C5D000, v34, OS_LOG_TYPE_DEFAULT, "%{public}@ CenterStageRectOfInterest %@", buf, 0x16u);

LABEL_25:
      }
LABEL_26:

      objc_msgSend(WeakRetained[31], "setValueForControl:completion:", *v3, 0);
LABEL_27:
      objc_msgSend(WeakRetained, "transportDevice");
      v46 = objc_claimAutoreleasedReturnValue();
      -[NSObject setValueForControl:completion:](v46, "setValueForControl:completion:", *v3, 0);
LABEL_28:

      goto LABEL_4;
    }
  }
  else
  {

  }
  objc_msgSend(*v3, "name");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = objc_msgSend(v37, "isEqualToString:", CFSTR("4cc_cffm_glob_0000"));

  v39 = *v3;
  if (v38)
  {
    objc_msgSend(v39, "value");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = (int)objc_msgSend(v40, "intValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "setCenterStageFramingMode:", v41);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2048;
    v305 = COERCE_DOUBLE(objc_msgSend(v35, "centerStageFramingMode"));
    v43 = "%{public}@ CenterStageControlMode %ld";
    goto LABEL_23;
  }
  objc_msgSend(v39, "name");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "isEqualToString:", CFSTR("FaceDetectionEnabled"));

  if (v48)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "faceDetectionEnabled");
    objc_msgSend(*v3, "value");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "BOOLValue");

    if (v50 == v52)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = objc_msgSend(v53, "BOOLValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setFaceDetectionEnabled:", v54);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = objc_msgSend(v35, "faceDetectionEnabled");
    *(double *)&v57 = COERCE_DOUBLE("Off");
    if (v56)
      *(double *)&v57 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = *(double *)&v57;
    v43 = "%{public}@ FaceDetectionEnabled %s";
    goto LABEL_23;
  }
  objc_msgSend(*v3, "name");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v58, "isEqualToString:", CFSTR("HumanBodyDetectionEnabled"));

  if (v59)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v60, "humanBodyDetectionEnabled");
    objc_msgSend(*v3, "value");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(v62, "BOOLValue");

    if (v61 == v63)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    v65 = objc_msgSend(v64, "BOOLValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "setHumanBodyDetectionEnabled:", v65);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend(v35, "humanBodyDetectionEnabled");
    *(double *)&v68 = COERCE_DOUBLE("Off");
    if (v67)
      *(double *)&v68 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = *(double *)&v68;
    v43 = "%{public}@ HumanBodyDetectionEnabled %s";
    goto LABEL_23;
  }
  objc_msgSend(*v3, "name");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_msgSend(v69, "isEqualToString:", CFSTR("HumanFullBodyDetectionEnabled"));

  if (v70)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = objc_msgSend(v71, "humanFullBodyDetectionEnabled");
    objc_msgSend(*v3, "value");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend(v73, "BOOLValue");

    if (v72 == v74)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend(v75, "BOOLValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v77, "setHumanFullBodyDetectionEnabled:", v76);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v35, "humanFullBodyDetectionEnabled");
    *(double *)&v79 = COERCE_DOUBLE("Off");
    if (v78)
      *(double *)&v79 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = *(double *)&v79;
    v43 = "%{public}@ HumanFullBodyDetectionEnabled %s";
    goto LABEL_23;
  }
  objc_msgSend(*v3, "name");
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  v81 = objc_msgSend(v80, "isEqualToString:", CFSTR("AsyncStillCaptureEnabled"));

  if (v81)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v83 = objc_msgSend(v82, "asyncStillCaptureEnabled");
    objc_msgSend(*v3, "value");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v85 = objc_msgSend(v84, "BOOLValue");

    if (v83 == v85)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "BOOLValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v88, "setAsyncStillCaptureEnabled:", v87);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v35, "asyncStillCaptureEnabled");
    *(double *)&v90 = COERCE_DOUBLE("Off");
    if (v89)
      *(double *)&v90 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = *(double *)&v90;
    v43 = "%{public}@ AsyncStillCaptureEnabled %s";
    goto LABEL_23;
  }
  objc_msgSend(*v3, "name");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v92 = objc_msgSend(v91, "isEqualToString:", CFSTR("SuppressVideoEffects"));

  if (v92)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend(v93, "suppressVideoEffects");
    objc_msgSend(*v3, "value");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v96 = objc_msgSend(v95, "BOOLValue");

    if (v94 == v96)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v98 = objc_msgSend(v97, "BOOLValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v99, "setSuppressVideoEffects:", v98);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = objc_msgSend(v35, "suppressVideoEffects");
    *(double *)&v101 = COERCE_DOUBLE("Off");
    if (v100)
      *(double *)&v101 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = *(double *)&v101;
    v43 = "%{public}@ SuppressVideoEffects %s";
    goto LABEL_23;
  }
  objc_msgSend(*v3, "name");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = objc_msgSend(v102, "isEqualToString:", CFSTR("PortraitEffectEnabled"));

  if (v103)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v104 = (void *)objc_claimAutoreleasedReturnValue();
    v105 = objc_msgSend(v104, "portraitEffectEnabled");
    objc_msgSend(*v3, "value");
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = objc_msgSend(v106, "BOOLValue");

    if (v105 == v107)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = objc_msgSend(v108, "BOOLValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v110, "setPortraitEffectEnabled:", v109);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = objc_msgSend(v35, "portraitEffectEnabled");
    *(double *)&v112 = COERCE_DOUBLE("Off");
    if (v111)
      *(double *)&v112 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = *(double *)&v112;
    v43 = "%{public}@ PortraitEffectEnabled %s";
    goto LABEL_23;
  }
  objc_msgSend(*v3, "name");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = objc_msgSend(v113, "isEqualToString:", CFSTR("VideoZoomFactor"));

  v115 = *v3;
  if (v114)
  {
    objc_msgSend(v115, "value");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "doubleValue");
    v118 = v117;

    objc_msgSend(WeakRetained, "activeConfiguration");
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v119, "videoZoomFactor");
    v121 = v120;

    if (v121 == v118)
      goto LABEL_4;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v122, "setVideoZoomFactor:", v118);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "videoZoomFactor");
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2048;
    v305 = v123;
    v43 = "%{public}@ VideoZoomFactor %.2f";
    goto LABEL_23;
  }
  objc_msgSend(v115, "name");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  v125 = objc_msgSend(v124, "isEqualToString:", CFSTR("StudioLightingEnabled"));

  if (v125)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    v127 = objc_msgSend(v126, "studioLightingEnabled");
    objc_msgSend(*v3, "value");
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v129 = objc_msgSend(v128, "BOOLValue");

    if (v127 == v129)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = objc_msgSend(v130, "BOOLValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "setStudioLightingEnabled:", v131);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v133 = objc_msgSend(v35, "studioLightingEnabled");
    *(double *)&v134 = COERCE_DOUBLE("Off");
    if (v133)
      *(double *)&v134 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = *(double *)&v134;
    v43 = "%{public}@ StudioLightingEnabled %s";
    goto LABEL_23;
  }
  objc_msgSend(*v3, "name");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  v136 = objc_msgSend(v135, "isEqualToString:", CFSTR("ReactionEffectsEnabled"));

  if (v136)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v137 = (void *)objc_claimAutoreleasedReturnValue();
    v138 = objc_msgSend(v137, "reactionEffectsEnabled");
    objc_msgSend(*v3, "value");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = objc_msgSend(v139, "BOOLValue");

    if (v138 == v140)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    v142 = objc_msgSend(v141, "BOOLValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v143, "setReactionEffectsEnabled:", v142);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v144 = objc_msgSend(v35, "reactionEffectsEnabled");
    *(double *)&v145 = COERCE_DOUBLE("Off");
    if (v144)
      *(double *)&v145 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = *(double *)&v145;
    v43 = "%{public}@ ReactionEffectsEnabled %s";
    goto LABEL_23;
  }
  objc_msgSend(*v3, "name");
  v146 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = objc_msgSend(v146, "isEqualToString:", CFSTR("BackgroundReplacementEnabled"));

  if (v147)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    v149 = objc_msgSend(v148, "backgroundReplacementEnabled");
    objc_msgSend(*v3, "value");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v150, "BOOLValue");

    if (v149 == v151)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = objc_msgSend(v152, "BOOLValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v154, "setBackgroundReplacementEnabled:", v153);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = objc_msgSend(v35, "backgroundReplacementEnabled");
    *(double *)&v156 = COERCE_DOUBLE("Off");
    if (v155)
      *(double *)&v156 = COERCE_DOUBLE("On");
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = *(double *)&v156;
    v43 = "%{public}@ BackgroundReplacementEnabled %s";
    goto LABEL_23;
  }
  objc_msgSend(*v3, "name");
  v157 = (void *)objc_claimAutoreleasedReturnValue();
  v158 = objc_msgSend(v157, "isEqualToString:", CFSTR("AsyncStillCaptureConfigurations"));

  v159 = *v3;
  if (v158)
  {
    objc_msgSend(v159, "value");
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "activeConfiguration");
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v161, "setAsyncStillCaptureConfigs:", v160);

    CMContinuityCaptureLog(2);
    v162 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "activeConfiguration");
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v163, "asyncStillCaptureConfigs");
      v164 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543618;
      v303 = WeakRetained;
      v304 = 2112;
      v305 = v164;
      _os_log_impl(&dword_227C5D000, v162, OS_LOG_TYPE_DEFAULT, "%{public}@ AsyncStillCaptureConfigs %@", buf, 0x16u);

    }
    goto LABEL_103;
  }
  objc_msgSend(v159, "name");
  v165 = (void *)objc_claimAutoreleasedReturnValue();
  v166 = objc_msgSend(v165, "isEqualToString:", CFSTR("OverheadCameraMode"));

  if (v166)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = objc_msgSend(v167, "deskViewCameraMode");
    objc_msgSend(*v3, "value");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    v170 = objc_msgSend(v169, "unsignedIntValue");

    if (v168 == v170)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    v172 = objc_msgSend(v171, "unsignedIntValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "setDeskViewCameraMode:", v172);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 1024;
    LODWORD(v305) = objc_msgSend(v35, "deskViewCameraMode");
    v43 = "%{public}@ DeskViewCameraMode %u";
    goto LABEL_94;
  }
  objc_msgSend(*v3, "name");
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  v175 = objc_msgSend(v174, "isEqualToString:", CFSTR("StartPanningAtPoint"));

  if (v175)
  {
    v301.x = NAN;
    v301.y = NAN;
    objc_msgSend(*v3, "value");
    v176 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGPointMakeWithDictionaryRepresentation(v176, &v301);

    CMContinuityCaptureLog(2);
    v162 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v303 = WeakRetained;
      v304 = 2080;
      v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
      v306 = 2048;
      x = v301.x;
      v308 = 2048;
      y = v301.y;
      v177 = "%{public}@ (%s) StartPanningAtPoint {%.3f, %.3f}";
LABEL_101:
      v181 = v162;
      v182 = 42;
LABEL_102:
      _os_log_impl(&dword_227C5D000, v181, OS_LOG_TYPE_DEFAULT, v177, buf, v182);
      goto LABEL_103;
    }
    goto LABEL_103;
  }
  objc_msgSend(*v3, "name");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = objc_msgSend(v178, "isEqualToString:", CFSTR("PanWithTranslation"));

  if (v179)
  {
    v301.x = NAN;
    v301.y = NAN;
    objc_msgSend(*v3, "value");
    v180 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGPointMakeWithDictionaryRepresentation(v180, &v301);

    CMContinuityCaptureLog(2);
    v162 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138544130;
      v303 = WeakRetained;
      v304 = 2080;
      v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
      v306 = 2048;
      x = v301.x;
      v308 = 2048;
      y = v301.y;
      v177 = "%{public}@ (%s) PanWithTransaltion {%.3f, %.3f}";
      goto LABEL_101;
    }
LABEL_103:

    goto LABEL_27;
  }
  objc_msgSend(*v3, "name");
  v183 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = objc_msgSend(v183, "isEqualToString:", CFSTR("PerformOneShotFraming"));

  if (v184)
  {
    CMContinuityCaptureLog(2);
    v162 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
      goto LABEL_103;
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
    v177 = "%{public}@ (%s) PerformOneShotFraming";
    goto LABEL_110;
  }
  objc_msgSend(*v3, "name");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v186 = objc_msgSend(v185, "isEqualToString:", CFSTR("ResetFraming"));

  if (v186)
  {
    CMContinuityCaptureLog(2);
    v162 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v162, OS_LOG_TYPE_DEFAULT))
      goto LABEL_103;
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
    v177 = "%{public}@ (%s) ResetFraming";
LABEL_110:
    v181 = v162;
    v182 = 22;
    goto LABEL_102;
  }
  objc_msgSend(*v3, "name");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v188 = objc_msgSend(v187, "isEqualToString:", CFSTR("CenterStageFieldOfViewRestrictedToWide"));

  v189 = *v3;
  if (v188)
  {
    objc_msgSend(v189, "value");
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v191 = objc_msgSend(v190, "BOOLValue");

    CMContinuityCaptureLog(2);
    v192 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v192, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543874;
      v303 = WeakRetained;
      v304 = 2080;
      v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
      v306 = 1024;
      LODWORD(x) = v191;
      _os_log_impl(&dword_227C5D000, v192, OS_LOG_TYPE_DEFAULT, "%{public}@ (%s) CenterStageFieldOfViewRestrictedToWide %d", buf, 0x1Cu);
    }

    objc_msgSend(WeakRetained, "transportDevice");
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v193, "setValueForControl:completion:", *v3, 0);

    objc_msgSend(WeakRetained, "activeConfiguration");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v194, "setCenterStageFieldOfViewRestrictedToWide:", v191);

    objc_msgSend(WeakRetained, "updateForcefulCenterStageEnablementStateIfNeededWithCenterStageRestrictedToWide:", v191);
    goto LABEL_4;
  }
  objc_msgSend(v189, "name");
  v195 = (void *)objc_claimAutoreleasedReturnValue();
  v196 = objc_msgSend(v195, "isEqualToString:", CFSTR("ManualFramingDeviceType"));

  v197 = *v3;
  if (v196)
  {
    objc_msgSend(v197, "value");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    v199 = objc_msgSend(v198, "integerValue");

    objc_msgSend(WeakRetained, "activeConfiguration");
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = objc_msgSend(v200, "manualFramingDeviceType");

    if (v201 == v199)
      goto LABEL_4;
    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    +[CMContinuityCaptureConfiguration stringForManualFramingDeviceType:](CMContinuityCaptureConfiguration, "stringForManualFramingDeviceType:", v199);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v303 = WeakRetained;
    v304 = 2080;
    v305 = COERCE_DOUBLE("-[CMContinuityCaptureVideoDevice setValueForControl:completion:]_block_invoke");
    v306 = 2112;
    x = *(double *)&v35;
    v43 = "%{public}@ (%s) ManualFramingDeviceType %@";
    v44 = v34;
    v45 = 32;
    goto LABEL_24;
  }
  objc_msgSend(v197, "name");
  v202 = (void *)objc_claimAutoreleasedReturnValue();
  v203 = objc_msgSend(v202, "isEqualToString:", CFSTR("CMIOExtensionPropertyStreamFrameDuration"));

  if (v203)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = objc_msgSend(v204, "maxFrameRate");
    objc_msgSend(*v3, "value");
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    v207 = objc_msgSend(v206, "unsignedIntValue");

    if (v205 != v207)
    {
      objc_msgSend(*v3, "value");
      v208 = (void *)objc_claimAutoreleasedReturnValue();
      v209 = objc_msgSend(v208, "unsignedIntValue");
      objc_msgSend(WeakRetained, "activeConfiguration");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v210, "setMaxFrameRate:", v209);

      CMContinuityCaptureLog(2);
      v211 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v211, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(WeakRetained, "activeConfiguration");
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v303 = WeakRetained;
        v304 = 1024;
        LODWORD(v305) = objc_msgSend(v212, "maxFrameRate");
        _os_log_impl(&dword_227C5D000, v211, OS_LOG_TYPE_DEFAULT, "%{public}@ MaxFrameRate %u", buf, 0x12u);

      }
      objc_msgSend(WeakRetained[31], "setValueForControl:completion:", *v3, 0);
      objc_msgSend(WeakRetained, "transportDevice");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v213, "setValueForControl:completion:", *v3, 0);

LABEL_124:
      objc_msgSend(WeakRetained, "restartSendingInvalidFramesIfApplicable");
      goto LABEL_4;
    }
LABEL_3:
    objc_msgSend(WeakRetained[31], "setValueForControl:completion:", *v3, 0);
    goto LABEL_4;
  }
  objc_msgSend(*v3, "name");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  v215 = objc_msgSend(v214, "isEqualToString:", CFSTR("CMIOExtensionPropertyStreamMaxFrameDuration"));

  if (v215)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    v217 = objc_msgSend(v216, "minFrameRate");
    objc_msgSend(*v3, "value");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = objc_msgSend(v218, "unsignedIntValue");

    if (v217 != v219)
    {
      objc_msgSend(*v3, "value");
      v220 = (void *)objc_claimAutoreleasedReturnValue();
      v221 = objc_msgSend(v220, "unsignedIntValue");
      objc_msgSend(WeakRetained, "activeConfiguration");
      v222 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v222, "setMinFrameRate:", v221);

      CMContinuityCaptureLog(2);
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      objc_msgSend(WeakRetained, "activeConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v303 = WeakRetained;
      v304 = 1024;
      LODWORD(v305) = objc_msgSend(v35, "minFrameRate");
      v43 = "%{public}@ MinFrameRate %u";
      goto LABEL_94;
    }
    goto LABEL_3;
  }
  objc_msgSend(*v3, "name");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  v224 = objc_msgSend(v223, "isEqualToString:", CFSTR("ActiveFormat"));

  if (!v224)
  {
    objc_msgSend(*v3, "name");
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    v236 = objc_msgSend(v235, "isEqualToString:", CFSTR("PortraitEffectAperture"));

    if (v236)
    {
      objc_msgSend(WeakRetained, "activeConfiguration");
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v237, "portraitEffectAperture");
      v239 = v238;
      objc_msgSend(*v3, "value");
      v240 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v240, "floatValue");
      v242 = v241;

      if (v239 == v242)
        goto LABEL_4;
      objc_msgSend(*v3, "value");
      v243 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "floatValue");
      v245 = v244;
      objc_msgSend(WeakRetained, "activeConfiguration");
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v247) = v245;
      objc_msgSend(v246, "setPortraitEffectAperture:", v247);

      CMContinuityCaptureLog(2);
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      objc_msgSend(WeakRetained, "activeConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "portraitEffectAperture");
      *(_DWORD *)buf = 138543618;
      v303 = WeakRetained;
      v304 = 2048;
      v305 = v248;
      v43 = "%{public}@ PortraitEffectAperture %f";
      goto LABEL_23;
    }
    objc_msgSend(*v3, "name");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    v250 = objc_msgSend(v249, "isEqualToString:", CFSTR("StudioLightingIntensity"));

    if (v250)
    {
      objc_msgSend(WeakRetained, "activeConfiguration");
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v251, "studioLightingIntensity");
      v253 = v252;
      objc_msgSend(*v3, "value");
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "floatValue");
      v256 = v255;

      if (v253 == v256)
        goto LABEL_4;
      objc_msgSend(*v3, "value");
      v257 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v257, "floatValue");
      v259 = v258;
      objc_msgSend(WeakRetained, "activeConfiguration");
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v261) = v259;
      objc_msgSend(v260, "setStudioLightingIntensity:", v261);

      CMContinuityCaptureLog(2);
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      objc_msgSend(WeakRetained, "activeConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "studioLightingIntensity");
      *(_DWORD *)buf = 138543618;
      v303 = WeakRetained;
      v304 = 2048;
      v305 = v262;
      v43 = "%{public}@ StudioLightingIntensity %f";
      goto LABEL_23;
    }
    objc_msgSend(*v3, "name");
    v281 = (void *)objc_claimAutoreleasedReturnValue();
    v282 = objc_msgSend(v281, "isEqualToString:", CFSTR("GesturesEnabled"));

    if (!v282)
    {
      objc_msgSend(*v3, "name");
      v290 = (void *)objc_claimAutoreleasedReturnValue();
      v291 = objc_msgSend(v290, "isEqualToString:", CFSTR("ReactionsInProgress"));

      if (v291)
      {
        CMContinuityCaptureLog(2);
        v292 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v292, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*v3, "value");
          v293 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138543618;
          v303 = WeakRetained;
          v304 = 2112;
          v305 = v293;
          _os_log_impl(&dword_227C5D000, v292, OS_LOG_TYPE_DEFAULT, "%{public}@ ReactionsInProgress %@", buf, 0x16u);

        }
        goto LABEL_3;
      }
      objc_msgSend(*v3, "name");
      v294 = (void *)objc_claimAutoreleasedReturnValue();
      v295 = objc_msgSend(v294, "isEqualToString:", CFSTR("BackgroundReplacementPixelBuffer"));

      if (!v295)
      {
        CMContinuityCaptureLog(2);
        v46 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
          __64__CMContinuityCaptureVideoDevice_setValueForControl_completion___block_invoke_cold_1();
        goto LABEL_28;
      }
      objc_msgSend(WeakRetained, "activeConfiguration");
      v296 = (void *)objc_claimAutoreleasedReturnValue();
      v297 = objc_msgSend(v296, "backgroundReplacementPixelBuffer");
      objc_msgSend(*v3, "value");
      v298 = (void *)objc_claimAutoreleasedReturnValue();

      if ((void *)v297 == v298)
        goto LABEL_4;
      objc_msgSend(*v3, "value");
      v299 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "activeConfiguration");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v300, "setBackgroundReplacementPixelBuffer:", v299);

      CMContinuityCaptureLog(2);
      v34 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        goto LABEL_26;
      objc_msgSend(WeakRetained, "activeConfiguration");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v303 = WeakRetained;
      v304 = 2112;
      v305 = COERCE_DOUBLE(objc_msgSend(v35, "backgroundReplacementPixelBuffer"));
      v43 = "%{public}@ BackgroundReplacementPixelBuffer %@";
LABEL_23:
      v44 = v34;
      v45 = 22;
LABEL_24:
      _os_log_impl(&dword_227C5D000, v44, OS_LOG_TYPE_DEFAULT, v43, buf, v45);
      goto LABEL_25;
    }
    objc_msgSend(WeakRetained, "activeConfiguration");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    v284 = objc_msgSend(v283, "reactionEffectGesturesEnabled");
    objc_msgSend(*v3, "value");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    v286 = objc_msgSend(v285, "BOOLValue");

    if (v284 == v286)
      goto LABEL_4;
    objc_msgSend(*v3, "value");
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    v288 = objc_msgSend(v287, "BOOLValue");
    objc_msgSend(WeakRetained, "activeConfiguration");
    v289 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v289, "setReactionEffectGesturesEnabled:", v288);

    CMContinuityCaptureLog(2);
    v34 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      goto LABEL_26;
    objc_msgSend(WeakRetained, "activeConfiguration");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v303 = WeakRetained;
    v304 = 1024;
    LODWORD(v305) = objc_msgSend(v35, "reactionEffectGesturesEnabled");
    v43 = "%{public}@ ReactionEffectGesturesEnabled %d";
LABEL_94:
    v44 = v34;
    v45 = 18;
    goto LABEL_24;
  }
  CMContinuityCaptureLog(2);
  v225 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v225, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v226, "format");
    v227 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    objc_msgSend(*v3, "value");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v303 = WeakRetained;
    v304 = 2114;
    v305 = v227;
    v306 = 2114;
    x = *(double *)&v228;
    _os_log_impl(&dword_227C5D000, v225, OS_LOG_TYPE_DEFAULT, "%{public}@ format change %{public}@ to %{public}@", buf, 0x20u);

  }
  objc_msgSend(WeakRetained, "activeConfiguration");
  v229 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v229, "format");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  if (v230)
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "format");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*v3, "value");
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    v234 = objc_msgSend(v232, "isEqual:", v233) ^ 1;

  }
  else
  {
    v234 = 0;
  }

  objc_msgSend(*v3, "value");
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "activeConfiguration");
  v264 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v264, "setFormat:", v263);

  objc_msgSend(WeakRetained, "activeConfiguration");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v265, "format");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  v267 = objc_msgSend(v266, "maxFrameRate");
  objc_msgSend(WeakRetained, "activeConfiguration");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v268, "setMaxFrameRate:", v267);

  objc_msgSend(WeakRetained, "activeConfiguration");
  v269 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v269, "format");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  v271 = objc_msgSend(v270, "maxFrameRate");
  objc_msgSend(WeakRetained, "activeConfiguration");
  v272 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v272, "setMinFrameRate:", v271);

  if (v234 && objc_msgSend(WeakRetained, "streaming"))
  {
    CMContinuityCaptureLog(2);
    v273 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v273, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "activeConfiguration");
      v274 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v274, "format");
      v275 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      *(_DWORD *)buf = 138543618;
      v303 = WeakRetained;
      v304 = 2114;
      v305 = v275;
      _os_log_impl(&dword_227C5D000, v273, OS_LOG_TYPE_DEFAULT, "%{public}@ format changed to %{public}@", buf, 0x16u);

    }
    objc_msgSend(WeakRetained, "compositeDelegate");
    v276 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v276, "postEvent:entity:data:", CFSTR("kCMContinuityCaptureEventForceRestartStream"), objc_msgSend(WeakRetained, "entity"), 0);

    goto LABEL_124;
  }
  CMContinuityCaptureLog(2);
  v277 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v277, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(WeakRetained, "activeConfiguration");
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v278, "format");
    v279 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
    v280 = objc_msgSend(WeakRetained, "streaming");
    *(_DWORD *)buf = 138543874;
    v303 = WeakRetained;
    v304 = 2114;
    v305 = v279;
    v306 = 1024;
    LODWORD(x) = v280;
    _os_log_impl(&dword_227C5D000, v277, OS_LOG_TYPE_DEFAULT, "%{public}@ format unchanged %{public}@ or invalid stream state %d", buf, 0x1Cu);

  }
LABEL_4:

}

- (id)debugInfo
{
  return 0;
}

- (CMContinuityCaptureVideoDevice)companionDevice
{
  return (CMContinuityCaptureVideoDevice *)objc_loadWeakRetained((id *)&self->_companionDevice);
}

- (void)setCompanionDevice:(id)a3
{
  objc_storeWeak((id *)&self->_companionDevice, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_companionDevice);
  objc_storeStrong((id *)&self->_stillImageCaptureGroup, 0);
  objc_storeStrong((id *)&self->_pendingReactionRequests, 0);
  objc_storeStrong((id *)&self->_stillImageRequestsQueue, 0);
  objc_storeStrong((id *)&self->_blackFrameDispatchTimer, 0);
  objc_storeStrong((id *)&self->_blurredFrameDispatchTimer, 0);
  objc_storeStrong(&self->_stopCompletionBlock, 0);
  objc_storeStrong((id *)&self->_avcStreamOutput, 0);
  objc_storeStrong((id *)&self->_avcVideoStream, 0);
  objc_storeStrong((id *)&self->_cmioCaptureDevice, 0);
  objc_storeStrong((id *)&self->_centerStageStateRestorationDataArray, 0);
  objc_storeStrong((id *)&self->_avcStreamCallID, 0);
}

- (void)initWithCapabilities:compositeDelegate:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "%{public}@ Invalid CMIO capture device ", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)createBlurredSampleBuffer
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_7(&dword_227C5D000, v0, v1, "%@ Failed to create sample buffer %u");
  OUTLINED_FUNCTION_1_0();
}

- (void)dispatchFrame:entity:completion:.cold.1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  v3 = 2048;
  v4 = v0;
  _os_log_debug_impl(&dword_227C5D000, v1, OS_LOG_TYPE_DEBUG, "%{public}@ networkTimeClockIdentity identity %llx", v2, 0x16u);
  OUTLINED_FUNCTION_1_0();
}

- (void)createAVCVideoStream
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ AVCVideoStream create error %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)newVideoStreamCurrentConfiguration
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ AVCMediaStreamConfig error %@");
  OUTLINED_FUNCTION_1_0();
}

- (void)startAVConferenceStack:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ AVCVideoStream %p Invalid configuration");
  OUTLINED_FUNCTION_1_0();
}

- (void)startAVConferenceStack:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ AVCStreamOutput create error %@");
  OUTLINED_FUNCTION_1_0();
}

void __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_1(id *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = OUTLINED_FUNCTION_11(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_12(&dword_227C5D000, v2, v3, "%@ Failed to get Black Sample buffer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

void __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_2(id *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_11(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_227C5D000, a2, v4, "%@ Invalid sample buffer to send", v5);

  OUTLINED_FUNCTION_8();
}

void __59__CMContinuityCaptureVideoDevice_startSendingInvalidFrames__block_invoke_cold_3(id *a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  WeakRetained = objc_loadWeakRetained(a1);
  CMContinuityCaptureGetHostTimeInNanoSec();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_227C5D000, v2, v3, "%@ DispatchBlackFrame %llu %p", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_15();
}

void __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke_cold_1(id *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v1 = OUTLINED_FUNCTION_11(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_12(&dword_227C5D000, v2, v3, "%@ Failed to get Blurred Sample buffer", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

void __71__CMContinuityCaptureVideoDevice_stateMachineStartSendingBlurredFrames__block_invoke_cold_3(id *a1)
{
  id WeakRetained;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  WeakRetained = objc_loadWeakRetained(a1);
  CMContinuityCaptureGetHostTimeInNanoSec();
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_13(&dword_227C5D000, v2, v3, "%@ DispatchFakeFrame %llu %p", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_15();
}

- (void)completeImageCaptureRequest:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%@ completeImageCaptureRequest got called with error %@, but still image requests queue is empty");
  OUTLINED_FUNCTION_1_0();
}

- (void)_createStillImageDataBufferFromRequest:timestamp:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_227C5D000, v0, v1, "Called with nil imageFileData %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_createStillImageDataBufferFromRequest:timestamp:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_227C5D000, v0, v1, "CMSampleBufferCreate(stillImageData) failed (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)_createStillImageDataBufferFromRequest:timestamp:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_227C5D000, v0, v1, "CMVideoFormatDescriptionCreate(stillImageData) failed (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)_createStillImageDataBufferFromRequest:timestamp:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_227C5D000, v0, v1, "CMBlockBufferGetDataPointer failed (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

- (void)_createStillImageDataBufferFromRequest:timestamp:.cold.5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_16();
  OUTLINED_FUNCTION_6(&dword_227C5D000, v0, v1, "CMBlockBufferCreateWithMemoryBlock failed (%d)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_14();
}

void __58__CMContinuityCaptureVideoDevice_stateMachineImageCapture__block_invoke_cold_1(id *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_11(a1);
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_1(&dword_227C5D000, a2, v4, "%@ still image capture hit timeout. Notifying state machine that the action is complete.", v5);

  OUTLINED_FUNCTION_8();
}

void __64__CMContinuityCaptureVideoDevice_setValueForControl_completion___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2_1(&dword_227C5D000, v0, v1, "%{public}@ unhandled control %{public}@");
  OUTLINED_FUNCTION_1_0();
}

@end
