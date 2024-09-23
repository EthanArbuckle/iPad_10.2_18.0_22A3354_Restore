@implementation HMIVideoEncoder

- (HMIVideoEncoder)initWithDimensions:(id)a3 codecType:(unsigned int)a4 useHardwareAcceleration:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v7;
  uint64_t v8;
  HMIVideoEncoder *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *workQueue;
  _BOOL4 v14;
  HMIVideoEncoder *v15;
  objc_super v17;

  v7 = a5;
  v8 = *(_QWORD *)&a4;
  v17.receiver = self;
  v17.super_class = (Class)HMIVideoEncoder;
  v10 = -[HMIVideoEncoder init](&v17, sel_init);
  if (!v10)
    goto LABEL_4;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = dispatch_queue_create("HMIVideoEncoderWorkQueue", v11);
  workQueue = v10->_workQueue;
  v10->_workQueue = (OS_dispatch_queue *)v12;

  v14 = -[HMIVideoEncoder _initSessionWithDimensions:codecType:useHardwareAcceleration:error:](v10, "_initSessionWithDimensions:codecType:useHardwareAcceleration:error:", a3, v8, v7, a6);
  v15 = 0;
  if (v14)
  {
    v10->super.super._status = 2;
LABEL_4:
    v15 = v10;
  }

  return v15;
}

- (BOOL)_initSessionWithDimensions:(id)a3 codecType:(unsigned int)a4 useHardwareAcceleration:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _QWORD *v15;
  const __CFDictionary *v16;
  uint64_t v17;
  uint64_t v18;
  id *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id *v24;
  VTCompressionSessionRef session;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  _QWORD v29[2];

  v7 = a5;
  v29[1] = *MEMORY[0x24BDAC8D0];
  if (-[HMIVideoEncoder session](self, "session"))
    _HMFPreconditionFailure();
  v24 = a6;
  v11 = *MEMORY[0x24BDC56B8];
  v28 = *MEMORY[0x24BDC56B8];
  v29[0] = &unk_24DC14720;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v12, "mutableCopy");

  if (v7)
    v14 = MEMORY[0x24BDBD1C8];
  else
    v14 = MEMORY[0x24BDBD1C0];
  v15 = (_QWORD *)MEMORY[0x24BDF99C0];
  if (!v7)
    v15 = (_QWORD *)MEMORY[0x24BDF99B8];
  objc_msgSend(v13, "setObject:forKey:", v14, *v15);
  v26 = v11;
  v27 = &unk_24DC14720;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v16 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  session = 0;
  v17 = VTCompressionSessionCreate(0, a3.var0, a3.var1, a4, (CFDictionaryRef)v13, v16, 0, 0, 0, &session);
  if (!session || (_DWORD)v17)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VTCompressionSessionCreate failed, err: %d"), v17);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1023, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v24;
    if (!v24)
      goto LABEL_14;
LABEL_13:
    *v19 = objc_retainAutorelease(v21);
    goto LABEL_14;
  }
  v18 = VTCompressionSessionPrepareToEncodeFrames(session);
  v19 = v24;
  if (!(_DWORD)v18)
  {
    -[HMIVideoEncoder setSession:](self, "setSession:", session);
    -[HMIVideoEncoder _setProperty:propertyValue:](self, "_setProperty:propertyValue:", *MEMORY[0x24BDF9228], *MEMORY[0x24BDC54B8]);
    -[HMIVideoEncoder _setProperty:propertyValue:](self, "_setProperty:propertyValue:", *MEMORY[0x24BDF9368], *MEMORY[0x24BDC5538]);
    -[HMIVideoEncoder _setProperty:propertyValue:](self, "_setProperty:propertyValue:", *MEMORY[0x24BDF93A0], *MEMORY[0x24BDC55A8]);
    v22 = 1;
    -[HMIVideoEncoder setForceKeyFrameOnNextEncodedFrame:](self, "setForceKeyFrameOnNextEncodedFrame:", 1);
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("VTCompressionSessionPrepareToEncodeFrames failed, err: %d"), v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1023, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
    goto LABEL_13;
LABEL_14:
  HMIErrorLog(self, v21);

  v22 = 0;
LABEL_15:

  return v22;
}

- (void)dealloc
{
  OpaqueVTCompressionSession *v3;
  NSObject *v4;
  objc_super v5;
  _QWORD block[5];

  if (-[HMIVideoEncoder session](self, "session"))
  {
    v3 = -[HMIVideoEncoder session](self, "session");
    -[HMIVideoEncoder workQueue](self, "workQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __26__HMIVideoEncoder_dealloc__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = v3;
    dispatch_async(v4, block);

    -[HMIVideoEncoder setSession:](self, "setSession:", 0);
  }
  v5.receiver = self;
  v5.super_class = (Class)HMIVideoEncoder;
  -[HMIVideoEncoder dealloc](&v5, sel_dealloc);
}

void __26__HMIVideoEncoder_dealloc__block_invoke(uint64_t a1)
{
  VTCompressionSessionInvalidate(*(VTCompressionSessionRef *)(a1 + 32));
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

- (void)setDelegate:(id)a3 queue:(id)a4
{
  OS_dispatch_queue *v6;
  OS_dispatch_queue *delegateQueue;

  v6 = (OS_dispatch_queue *)a4;
  objc_storeWeak((id *)&self->_delegate, a3);
  delegateQueue = self->_delegateQueue;
  self->_delegateQueue = v6;

}

- (void)_invalidate
{
  NSObject *v3;

  -[HMIVideoEncoder workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[HMIVideoEncoder session](self, "session"))
  {
    VTCompressionSessionInvalidate(-[HMIVideoEncoder session](self, "session"));
    CFRelease(-[HMIVideoEncoder session](self, "session"));
    -[HMIVideoEncoder setSession:](self, "setSession:", 0);
  }
}

- (void)_invalidateWithErr:(int)a3
{
  NSObject *v5;
  void *v6;
  HMIVideoEncoder *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  int v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[HMIVideoEncoder workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (-[HMIVideoNode status](self, "status") != 4)
  {
    self->super.super._status = 4;
    v6 = (void *)MEMORY[0x220735570]();
    v7 = self;
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v15 = v9;
      v16 = 1024;
      v17 = a3;
      _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@Invalidated with err: %d", buf, 0x12u);

    }
    objc_autoreleasePoolPop(v6);
    -[HMIVideoEncoder delegateQueue](v7, "delegateQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      -[HMIVideoEncoder delegateQueue](v7, "delegateQueue");
      v11 = objc_claimAutoreleasedReturnValue();
      v12[0] = MEMORY[0x24BDAC760];
      v12[1] = 3221225472;
      v12[2] = __38__HMIVideoEncoder__invalidateWithErr___block_invoke;
      v12[3] = &unk_24DBEC5A8;
      v13 = a3;
      v12[4] = v7;
      dispatch_async(v11, v12);

    }
    -[HMIVideoEncoder _invalidate](v7, "_invalidate");
  }
}

void __38__HMIVideoEncoder__invalidateWithErr___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Video encoding failed, err: %d"), *(unsigned int *)(a1 + 40));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:description:", 1023, v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "encoder:didFailWithError:", *(_QWORD *)(a1 + 32), v2);

}

- (void)handleSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  CVImageBufferRef ImageBuffer;
  NSObject *v6;
  void *v7;
  HMIVideoEncoder *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[7];
  CMTime v12;
  CMTime v13;
  CMTime v14;
  CMTime v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (-[HMIVideoNode status](self, "status") == 2)
  {
    if (!-[HMIVideoEncoder session](self, "session"))
      _HMFPreconditionFailure();
    HMICMSampleBufferGetMediaType(a3);
    ImageBuffer = CMSampleBufferGetImageBuffer(a3);
    memset(&v15, 0, sizeof(v15));
    CMSampleBufferGetPresentationTimeStamp(&v15, a3);
    memset(&v14, 0, sizeof(v14));
    CMSampleBufferGetDuration(&v14, a3);
    CFRetain(a3);
    -[HMIVideoEncoder workQueue](self, "workQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __38__HMIVideoEncoder_handleSampleBuffer___block_invoke;
    v11[3] = &unk_24DBEC620;
    v11[4] = self;
    v11[5] = a3;
    v11[6] = ImageBuffer;
    v12 = v15;
    v13 = v14;
    dispatch_sync(v6, v11);

  }
  else
  {
    v7 = (void *)MEMORY[0x220735570]();
    v8 = self;
    HMFGetOSLogHandle();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15.value) = 138543362;
      *(CMTimeValue *)((char *)&v15.value + 4) = (CMTimeValue)v10;
      _os_log_impl(&dword_219D45000, v9, OS_LOG_TYPE_ERROR, "%{public}@Encoder is in a failed state, ignoring sample.", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v7);
  }
}

void __38__HMIVideoEncoder_handleSampleBuffer___block_invoke(uint64_t a1)
{
  __CFDictionary *Mutable;
  OpaqueVTCompressionSession *v3;
  __CVBuffer *v4;
  uint64_t v5;
  CMTime duration;
  CMTime presentationTimeStamp;
  _QWORD outputHandler[4];
  id v9;
  id location;

  if (objc_msgSend(*(id *)(a1 + 32), "session"))
  {
    if (objc_msgSend(*(id *)(a1 + 32), "forceKeyFrameOnNextEncodedFrame"))
    {
      Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x24BDF9578], (const void *)*MEMORY[0x24BDBD270]);
      objc_msgSend(*(id *)(a1 + 32), "setForceKeyFrameOnNextEncodedFrame:", 0);
    }
    else
    {
      Mutable = 0;
    }
    objc_initWeak(&location, *(id *)(a1 + 32));
    v3 = (OpaqueVTCompressionSession *)objc_msgSend(*(id *)(a1 + 32), "session");
    v4 = *(__CVBuffer **)(a1 + 48);
    outputHandler[0] = MEMORY[0x24BDAC760];
    outputHandler[1] = 3221225472;
    outputHandler[2] = __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_2;
    outputHandler[3] = &unk_24DBEC5F8;
    objc_copyWeak(&v9, &location);
    presentationTimeStamp = *(CMTime *)(a1 + 56);
    duration = *(CMTime *)(a1 + 80);
    v5 = VTCompressionSessionEncodeFrameWithOutputHandler(v3, v4, &presentationTimeStamp, &duration, Mutable, 0, outputHandler);
    if (Mutable)
      CFRelease(Mutable);
    CFRelease(*(CFTypeRef *)(a1 + 40));
    if ((_DWORD)v5)
    {
      NSLog(CFSTR("VTCompressionSessionEncodeFrameWithOutputHandler failed, err: %d"), v5);
      objc_msgSend(*(id *)(a1 + 32), "_invalidateWithErr:", v5);
    }
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
  else
  {
    CFRelease(*(CFTypeRef *)(a1 + 40));
  }
}

void __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_2(uint64_t a1, int a2, char a3, const void *a4)
{
  id WeakRetained;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  _QWORD *v17;
  NSObject *v18;
  void *v19;
  _QWORD v20[6];
  _QWORD block[5];
  int v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    if (a2)
    {
      v9 = (void *)MEMORY[0x220735570]();
      v10 = v8;
      HMFGetOSLogHandle();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v12;
        v25 = 1024;
        v26 = a2;
        _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@VTCompressionSessionEncodeFrameWithOutputHandler (Handler) failed, err: %d", buf, 0x12u);

      }
      objc_autoreleasePoolPop(v9);
      objc_msgSend(v10, "workQueue");
      v13 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_40;
      block[3] = &unk_24DBEC5A8;
      block[4] = v10;
      v22 = a2;
      dispatch_async(v13, block);

    }
    else if ((a3 & 2) != 0)
    {
      v16 = (void *)MEMORY[0x220735570]();
      v17 = v8;
      HMFGetOSLogHandle();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v24 = v19;
        _os_log_impl(&dword_219D45000, v18, OS_LOG_TYPE_ERROR, "%{public}@VTCompressionSessionEncodeFrameWithOutputHandler, frame dropped.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v16);
      ++v17[5];
    }
    else
    {
      objc_msgSend(WeakRetained, "delegateQueue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        CFRetain(a4);
        objc_msgSend(v8, "delegateQueue");
        v15 = objc_claimAutoreleasedReturnValue();
        v20[0] = MEMORY[0x24BDAC760];
        v20[1] = 3221225472;
        v20[2] = __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_41;
        v20[3] = &unk_24DBEC5D0;
        v20[4] = v8;
        v20[5] = a4;
        dispatch_async(v15, v20);

      }
    }
  }

}

uint64_t __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_40(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidateWithErr:", *(unsigned int *)(a1 + 40));
}

void __38__HMIVideoEncoder_handleSampleBuffer___block_invoke_41(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "encoder:didEncodeSampleBuffer:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  CFRelease(*(CFTypeRef *)(a1 + 40));
}

- (void)flush
{
  NSObject *v3;
  _QWORD block[5];

  -[HMIVideoEncoder workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __24__HMIVideoEncoder_flush__block_invoke;
  block[3] = &unk_24DBE9C90;
  block[4] = self;
  dispatch_sync(v3, block);

}

uint64_t __24__HMIVideoEncoder_flush__block_invoke(uint64_t a1)
{
  uint64_t result;
  OpaqueVTCompressionSession *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  CMTime v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  result = objc_msgSend(*(id *)(a1 + 32), "session");
  if (result)
  {
    v3 = (OpaqueVTCompressionSession *)objc_msgSend(*(id *)(a1 + 32), "session");
    v12 = *(CMTime *)*(_QWORD *)&MEMORY[0x24BDC0D40];
    v4 = VTCompressionSessionCompleteFrames(v3, &v12);
    if ((_DWORD)v4)
    {
      v5 = v4;
      v6 = (void *)MEMORY[0x220735570]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v12.value) = 138543618;
        *(CMTimeValue *)((char *)&v12.value + 4) = (CMTimeValue)v9;
        LOWORD(v12.flags) = 1024;
        *(CMTimeFlags *)((char *)&v12.flags + 2) = v5;
        _os_log_impl(&dword_219D45000, v8, OS_LOG_TYPE_ERROR, "%{public}@VTCompressionSessionCompleteFrames failed, err: %d", (uint8_t *)&v12, 0x12u);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(*(id *)(a1 + 32), "_invalidateWithErr:", v5);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        dispatch_sync(v11, HMISyncBlock);

      }
    }
    return objc_msgSend(*(id *)(a1 + 32), "setForceKeyFrameOnNextEncodedFrame:", 1);
  }
  return result;
}

- (BOOL)prepare
{
  NSObject *v3;
  char v4;
  _Unwind_Exception *v6;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  if (!-[HMIVideoEncoder session](self, "session"))
  {
    v6 = (_Unwind_Exception *)_HMFPreconditionFailure();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v6);
  }
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[HMIVideoEncoder workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __26__HMIVideoEncoder_prepare__block_invoke;
  v7[3] = &unk_24DBEC648;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(v3, v7);

  v4 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v4;
}

void __26__HMIVideoEncoder_prepare__block_invoke(uint64_t a1)
{
  OSStatus v2;
  OSStatus v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  OSStatus v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = VTCompressionSessionPrepareToEncodeFrames((VTCompressionSessionRef)objc_msgSend(*(id *)(a1 + 32), "session"));
  if (v2)
  {
    v3 = v2;
    v4 = (void *)MEMORY[0x220735570]();
    v5 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543618;
      v9 = v7;
      v10 = 1024;
      v11 = v3;
      _os_log_impl(&dword_219D45000, v6, OS_LOG_TYPE_ERROR, "%{public}@VTCompressionSessionPrepareToEncodeFrames failed, err: %d", (uint8_t *)&v8, 0x12u);

    }
    objc_autoreleasePoolPop(v4);
  }
  else
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (int)_setProperty:(__CFString *)a3 propertyValue:(void *)a4
{
  OSStatus v7;
  void *v8;
  HMIVideoEncoder *v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  __int16 v15;
  __CFString *v16;
  __int16 v17;
  OSStatus v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  if (!-[HMIVideoEncoder session](self, "session"))
    _HMFPreconditionFailure();
  v7 = VTSessionSetProperty(-[HMIVideoEncoder session](self, "session"), a3, a4);
  if (v7)
  {
    v8 = (void *)MEMORY[0x220735570]();
    v9 = self;
    HMFGetOSLogHandle();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138543874;
      v14 = v11;
      v15 = 2112;
      v16 = a3;
      v17 = 1024;
      v18 = v7;
      _os_log_impl(&dword_219D45000, v10, OS_LOG_TYPE_ERROR, "%{public}@Cannot set property: %@, error: %d", (uint8_t *)&v13, 0x1Cu);

    }
    objc_autoreleasePoolPop(v8);
  }
  return v7;
}

- (int)_getProperty:(__CFString *)a3 propertyValue:(const void *)a4
{
  OpaqueVTCompressionSession *v7;
  OSStatus v8;
  void *v9;
  HMIVideoEncoder *v10;
  NSObject *v11;
  void *v12;
  int v14;
  void *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  OSStatus v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (!-[HMIVideoEncoder session](self, "session"))
    _HMFPreconditionFailure();
  v7 = -[HMIVideoEncoder session](self, "session");
  v8 = VTSessionCopyProperty(v7, a3, (CFAllocatorRef)*MEMORY[0x24BDBD240], a4);
  if (v8)
  {
    v9 = (void *)MEMORY[0x220735570]();
    v10 = self;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543874;
      v15 = v12;
      v16 = 2112;
      v17 = a3;
      v18 = 1024;
      v19 = v8;
      _os_log_impl(&dword_219D45000, v11, OS_LOG_TYPE_ERROR, "%{public}@Cannot copy property: %@, error: %d", (uint8_t *)&v14, 0x1Cu);

    }
    objc_autoreleasePoolPop(v9);
  }
  return v8;
}

- (int)_setSInt32Property:(__CFString *)a3 propertyValue:(int)a4
{
  const void *SInt32;

  SInt32 = (const void *)FigCFNumberCreateSInt32();
  LODWORD(a3) = -[HMIVideoEncoder _setProperty:propertyValue:](self, "_setProperty:propertyValue:", a3, SInt32);
  CFRelease(SInt32);
  return (int)a3;
}

- (int)_getSInt32Property:(__CFString *)a3 propertyValueOut:(int *)a4
{
  int v5;
  int v6;
  CFNumberRef number;

  number = 0;
  v5 = -[HMIVideoEncoder _getProperty:propertyValue:](self, "_getProperty:propertyValue:", a3, &number);
  v6 = v5;
  if (a4 && !v5)
    CFNumberGetValue(number, kCFNumberSInt32Type, a4);
  CFRelease(number);
  return v6;
}

- (int)_setFloat64Property:(__CFString *)a3 propertyValue:(double)a4
{
  const void *Float64;

  Float64 = (const void *)FigCFNumberCreateFloat64();
  LODWORD(a3) = -[HMIVideoEncoder _setProperty:propertyValue:](self, "_setProperty:propertyValue:", a3, Float64);
  CFRelease(Float64);
  return (int)a3;
}

- (int)_getFloat64Property:(__CFString *)a3 propertyValueOut:(double *)a4
{
  int v5;
  int v6;
  CFNumberRef number;

  number = 0;
  v5 = -[HMIVideoEncoder _getProperty:propertyValue:](self, "_getProperty:propertyValue:", a3, &number);
  v6 = v5;
  if (a4 && !v5)
    CFNumberGetValue(number, kCFNumberFloatType, a4);
  CFRelease(number);
  return v6;
}

- (void)setMaxFrameDelayCount:(int64_t)a3
{
  -[HMIVideoEncoder _setSInt32Property:propertyValue:](self, "_setSInt32Property:propertyValue:", *MEMORY[0x24BDF92C0], a3);
}

- (int64_t)maxFrameDelayCount
{
  int v3;

  v3 = 0;
  -[HMIVideoEncoder _getSInt32Property:propertyValueOut:](self, "_getSInt32Property:propertyValueOut:", *MEMORY[0x24BDF92C0], &v3);
  return v3;
}

- (void)setAverageBitRate:(int64_t)a3
{
  -[HMIVideoEncoder _setSInt32Property:propertyValue:](self, "_setSInt32Property:propertyValue:", *MEMORY[0x24BDF9208], a3);
}

- (int64_t)averageBitRate
{
  int v3;

  v3 = 0;
  -[HMIVideoEncoder _getSInt32Property:propertyValueOut:](self, "_getSInt32Property:propertyValueOut:", *MEMORY[0x24BDF9208], &v3);
  return v3;
}

- (void)setQuality:(double)a3
{
  -[HMIVideoEncoder _setFloat64Property:propertyValue:](self, "_setFloat64Property:propertyValue:", *MEMORY[0x24BDF9338], a3);
}

- (double)quality
{
  double v3;

  v3 = 0.0;
  -[HMIVideoEncoder _getFloat64Property:propertyValueOut:](self, "_getFloat64Property:propertyValueOut:", *MEMORY[0x24BDF9338], &v3);
  return v3;
}

- (void)setMaxKeyFrameIntervalDuration:(int64_t)a3
{
  -[HMIVideoEncoder _setSInt32Property:propertyValue:](self, "_setSInt32Property:propertyValue:", *MEMORY[0x24BDF92D0], a3);
}

- (int64_t)maxKeyFrameIntervalDuration
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)setExpectedFrameRate:(int64_t)a3
{
  -[HMIVideoEncoder _setSInt32Property:propertyValue:](self, "_setSInt32Property:propertyValue:", *MEMORY[0x24BDF9260], a3);
}

- (int64_t)expectedFrameRate
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)setExpectedDuration:(double)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = *MEMORY[0x24BDF9258];
  if (a3 == 0.0)
    v5 = *MEMORY[0x24BDBD430];
  else
    v5 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  -[HMIVideoEncoder _setProperty:propertyValue:](self, "_setProperty:propertyValue:", v4, v5);
}

- (double)expectedDuration
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)setDataRateLimit:(HMIVideoEncoderDataRate)a3
{
  uint64_t v4;
  int64_t var1;
  void *v6;
  void *v7;
  _QWORD v8[3];

  v8[2] = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDF9240];
  if (a3.var0 && (var1 = a3.var1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v6;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", var1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[1] = v7;
    -[HMIVideoEncoder _setProperty:propertyValue:](self, "_setProperty:propertyValue:", v4, objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 2));

  }
  else
  {
    -[HMIVideoEncoder _setProperty:propertyValue:](self, "_setProperty:propertyValue:", *MEMORY[0x24BDF9240], *MEMORY[0x24BDBD430]);
  }
}

- (HMIVideoEncoderDataRate)dataRateLimit
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (NSString)logIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setLogIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (unint64_t)numberOfDroppedFrames
{
  return self->_numberOfDroppedFrames;
}

- (OpaqueVTCompressionSession)session
{
  return self->_session;
}

- (void)setSession:(OpaqueVTCompressionSession *)a3
{
  self->_session = a3;
}

- (BOOL)forceKeyFrameOnNextEncodedFrame
{
  return self->_forceKeyFrameOnNextEncodedFrame;
}

- (void)setForceKeyFrameOnNextEncodedFrame:(BOOL)a3
{
  self->_forceKeyFrameOnNextEncodedFrame = a3;
}

- (HMIVideoEncoderDelegate)delegate
{
  return (HMIVideoEncoderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (OS_dispatch_queue)workQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logIdentifier, 0);
}

@end
