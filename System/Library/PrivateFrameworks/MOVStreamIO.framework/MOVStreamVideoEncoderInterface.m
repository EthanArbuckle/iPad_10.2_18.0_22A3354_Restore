@implementation MOVStreamVideoEncoderInterface

- (MOVStreamVideoEncoderInterface)init
{
  MOVStreamVideoEncoderInterface *v2;
  MOVStreamHEVCLosslessEncoder *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *m_encodingQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MOVStreamVideoEncoderInterface;
  v2 = -[MOVStreamVideoEncoderInterface init](&v7, sel_init);
  if (v2)
  {
    v3 = (MOVStreamHEVCLosslessEncoder *)operator new();
    MOVStreamHEVCLosslessEncoder::MOVStreamHEVCLosslessEncoder(v3);
    v2->m_encoder = v3;
    objc_storeStrong(&v3->var2, v2);
    v2->m_expectedFrameRate = 30.0;
    v2->m_encoderInitialized = 0;
    v2->m_qpValue = -1;
    -[MOVStreamVideoEncoderInterface setPendingFrames:](v2, "setPendingFrames:", 0);
    v4 = dispatch_queue_create("com.apple.streamwriter.vtencoding", 0);
    m_encodingQueue = v2->m_encodingQueue;
    v2->m_encodingQueue = (OS_dispatch_queue *)v4;

    *(_WORD *)&v2->m_enableAVEHighPerformanceProfile = 0;
    v2->m_convertL016toL010 = 0;
    -[MOVStreamVideoEncoderInterface setUseLegacyVTController:](v2, "setUseLegacyVTController:", 1);
    -[MOVStreamVideoEncoderInterface setEncodingQueueDepth:](v2, "setEncodingQueueDepth:", 0);
    v2->m_preSetupFormatDescription = 0;
  }
  return v2;
}

- (MOVStreamVideoEncoderInterface)initWithExpectedFrameRate:(double)a3 forStream:(id)a4 delegate:(id)a5 enableAVEHighPerformanceProfile:(BOOL)a6
{
  id v11;
  id v12;
  MOVStreamVideoEncoderInterface *v13;
  MOVStreamVideoEncoderInterface *v14;

  v11 = a4;
  v12 = a5;
  v13 = -[MOVStreamVideoEncoderInterface init](self, "init");
  v14 = v13;
  if (v13)
  {
    v13->m_expectedFrameRate = a3;
    objc_storeStrong((id *)&v13->m_stream, a4);
    objc_storeWeak((id *)&v14->m_delegate, v12);
    v14->m_enableAVEHighPerformanceProfile = a6;
  }

  return v14;
}

- (id)initForStream:(id)a3 configuration:(id)a4 delegate:(id)a5
{
  id v9;
  id v10;
  id v11;
  MOVStreamVideoEncoderInterface *v12;
  id *p_isa;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = -[MOVStreamVideoEncoderInterface init](self, "init");
  p_isa = (id *)&v12->super.isa;
  if (v12)
  {
    objc_storeStrong((id *)&v12->m_config, a4);
    objc_storeStrong(p_isa + 5, a3);
    objc_storeWeak(p_isa + 6, v11);
  }

  return p_isa;
}

- (void)dealloc
{
  MOVStreamHEVCLosslessEncoder *m_encoder;
  opaqueCMFormatDescription *m_preSetupFormatDescription;
  objc_super v5;

  m_encoder = self->m_encoder;
  if (m_encoder)
  {
    MOVStreamHEVCLosslessEncoder::~MOVStreamHEVCLosslessEncoder(m_encoder);
    MEMORY[0x212BC98B8]();
  }
  m_preSetupFormatDescription = self->m_preSetupFormatDescription;
  if (m_preSetupFormatDescription)
    CFRelease(m_preSetupFormatDescription);
  v5.receiver = self;
  v5.super_class = (Class)MOVStreamVideoEncoderInterface;
  -[MOVStreamVideoEncoderInterface dealloc](&v5, sel_dealloc);
}

- (BOOL)shouldEnableInProcessEncoding
{
  VideoEncoderInterfaceDelegate **p_m_delegate;
  id WeakRetained;
  char v4;
  id v5;
  char v6;

  p_m_delegate = &self->m_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  v5 = objc_loadWeakRetained((id *)p_m_delegate);
  v6 = objc_msgSend(v5, "shouldEnableInProcessEncoding");

  return v6;
}

- (void)useQPEncoding:(int)a3
{
  self->m_qpValue = a3;
}

- (void)setupEncoderWithWidth:(int)a3 andHeight:(int)a4 imageFormat:(int)a5 formatDescription:(opaqueCMFormatDescription *)a6 andFramerate:(double)a7
{
  int m_qpValue;
  MOVStreamHEVCLosslessEncoder *m_encoder;
  MIOVideoEncoderController *v15;
  MIOVideoEncoderController *encoderCtrl;
  MIOVideoEncoderController *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  NSObject *v21;
  NSString *m_stream;
  _BOOL4 v23;
  NSObject *v24;
  NSString *v25;
  id v26;
  uint8_t buf[4];
  NSString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  if (-[MOVStreamVideoEncoderInterface useLegacyVTController](self, "useLegacyVTController"))
  {
    m_qpValue = self->m_qpValue;
    if (m_qpValue >= 1)
      MOVStreamHEVCLosslessEncoder::useQPCompression(self->m_encoder, m_qpValue);
    m_encoder = self->m_encoder;
    m_encoder->var0 = self->m_enableAVEHighPerformanceProfile;
    if (MOVStreamHEVCLosslessEncoder::Open((uint64_t)m_encoder, a3, a4, a5, -[MOVStreamVideoEncoderInterface shouldEnableInProcessEncoding](self, "shouldEnableInProcessEncoding"), a6, (void (__cdecl *)(void *, void *, OSStatus, VTEncodeInfoFlags, CMSampleBufferRef))VTCompressionOutputCallbackImpl, self, a7))
    {
      self->m_failedState = 1;
      self->m_encoderInitialized = 0;
      MOVStreamHEVCLosslessEncoder::invalidateSession(self->m_encoder);
      return;
    }
    goto LABEL_8;
  }
  v15 = -[MIOVideoEncoderController initWithEncoderConfig:formtDescription:inProcessEncoding:frameRate:aveHighPerfMode:outputCallback:delegate:]([MIOVideoEncoderController alloc], "initWithEncoderConfig:formtDescription:inProcessEncoding:frameRate:aveHighPerfMode:outputCallback:delegate:", self->m_config, a6, -[MOVStreamVideoEncoderInterface shouldEnableInProcessEncoding](self, "shouldEnableInProcessEncoding"), self->m_enableAVEHighPerformanceProfile, VTCompressionOutputCallbackImpl, self, a7);
  encoderCtrl = self->_encoderCtrl;
  self->_encoderCtrl = v15;

  v17 = self->_encoderCtrl;
  v26 = 0;
  v18 = -[MIOVideoEncoderController openEncoderWithContext:error:](v17, "openEncoderWithContext:error:", self, &v26);
  v19 = v26;
  v20 = v19;
  if (v18)
  {

LABEL_8:
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      m_stream = self->m_stream;
      v23 = MOVStreamHEVCLosslessEncoder::frameReorderingEnabled(self->m_encoder);
      *(_DWORD *)buf = 138543618;
      v28 = m_stream;
      v29 = 1024;
      LODWORD(v30) = v23;
      _os_log_impl(&dword_210675000, v21, OS_LOG_TYPE_INFO, "%{public}@: Encoder frame reordering enabled: %d.", buf, 0x12u);
    }

    self->m_encoderInitialized = 1;
    return;
  }
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    v25 = self->m_stream;
    *(_DWORD *)buf = 138412546;
    v28 = v25;
    v29 = 2112;
    v30 = v20;
    _os_log_impl(&dword_210675000, v24, OS_LOG_TYPE_ERROR, "Error opening encoding session '%@': %@", buf, 0x16u);
  }

  self->m_failedState = 1;
  self->m_encoderInitialized = 0;
  MOVStreamHEVCLosslessEncoder::invalidateSession(self->m_encoder);

}

- (BOOL)preSetupWithFormatDescription:(opaqueCMFormatDescription *)a3
{
  signed int MediaSubType;
  unint64_t Dimensions;
  uint64_t v7;
  int v8;
  unsigned int v9;

  if (!a3)
    return 0;
  MediaSubType = CMFormatDescriptionGetMediaSubType(a3);
  Dimensions = (unint64_t)CMVideoFormatDescriptionGetDimensions(a3);
  v7 = 11;
  if (MediaSubType <= 1278226487)
  {
    if (MediaSubType == 875704422 || MediaSubType == 875704438)
      v7 = 0;
  }
  else
  {
    if (MediaSubType == 1278226742)
      v8 = 9;
    else
      v8 = 11;
    if (MediaSubType == 1278226736)
      v9 = 9;
    else
      v9 = v8;
    if (MediaSubType == 1278226488)
      v7 = 10;
    else
      v7 = v9;
  }
  -[MOVStreamVideoEncoderInterface setupEncoderWithWidth:andHeight:imageFormat:formatDescription:andFramerate:](self, "setupEncoderWithWidth:andHeight:imageFormat:formatDescription:andFramerate:", Dimensions, HIDWORD(Dimensions), v7, a3, self->m_expectedFrameRate);
  self->m_failedState = 0;
  if (!self->m_encoderInitialized)
    return 0;
  self->m_preSetupFormatDescription = a3;
  CFRetain(a3);
  return self->m_encoderInitialized;
}

- (BOOL)formatDescriptionHasChanged:(opaqueCMFormatDescription *)a3
{
  return CMFormatDescriptionEqual(a3, self->m_preSetupFormatDescription) == 0;
}

- (BOOL)processFrame:(__CVBuffer *)a3 pts:(id *)a4 frameProperties:(__CFDictionary *)a5 metadata:(id)a6
{
  id v10;
  opaqueCMFormatDescription *v11;
  void *v12;
  NSObject *v13;
  NSString *m_stream;
  OSType PixelFormatType;
  _BOOL4 m_convertL016toL010;
  char *v17;
  MOVStreamVideoEncoderInterface *v18;
  MOVStreamHEVCLosslessEncoder *m_encoder;
  int v20;
  BOOL v21;
  MIOVideoEncoderController *encoderCtrl;
  BOOL v23;
  id v24;
  void *v25;
  int v26;
  opaqueCMFormatDescription *v27;
  size_t Width;
  size_t Height;
  uint64_t v30;
  NSObject *v31;
  NSString *v32;
  BOOL v33;
  double m_expectedFrameRate;
  unsigned int v35;
  CMTime v37;
  id v38;
  __int128 v39;
  int64_t var3;
  uint8_t buf[4];
  NSString *v42;
  __int16 v43;
  void *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v10 = a6;
  if (self->m_preSetupFormatDescription && self->m_encoderInitialized)
  {
    v11 = +[MOVStreamIOUtility createFormatDescriptionFromPixelBuffer:](MOVStreamIOUtility, "createFormatDescriptionFromPixelBuffer:", a3);
    if (-[MOVStreamVideoEncoderInterface formatDescriptionHasChanged:](self, "formatDescriptionHasChanged:", v11))
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Orig fd: %@  New fd: %@"), v11, self->m_preSetupFormatDescription);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        m_stream = self->m_stream;
        *(_DWORD *)buf = 138543618;
        v42 = m_stream;
        v43 = 2114;
        v44 = v12;
        _os_log_impl(&dword_210675000, v13, OS_LOG_TYPE_INFO, "Format description changed for stream '%{public}@' failed (%{public}@)! Try re-initlialize encoder.", buf, 0x16u);
      }

      MOVStreamHEVCLosslessEncoder::InvalidateEncoder(self->m_encoder);
      self->m_encoderInitialized = 0;

    }
    CFRelease(v11);
    CFRelease(self->m_preSetupFormatDescription);
    self->m_preSetupFormatDescription = 0;
  }
  PixelFormatType = CVPixelBufferGetPixelFormatType(a3);
  if (self->m_encoderInitialized)
    goto LABEL_9;
  v26 = PixelFormatType;
  v27 = +[MOVStreamIOUtility createFormatDescriptionFromPixelBuffer:](MOVStreamIOUtility, "createFormatDescriptionFromPixelBuffer:", a3);
  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  if (v26 <= 1278226487)
  {
    v30 = 0;
    if (v26 == 875704422 || v26 == 875704438)
      goto LABEL_33;
  }
  else
  {
    if (v26 == 1278226488)
    {
      v30 = 10;
      goto LABEL_33;
    }
    if (v26 == 1278226736 || v26 == 1278226742)
    {
      v30 = 9;
LABEL_33:
      m_expectedFrameRate = self->m_expectedFrameRate;
      goto LABEL_34;
    }
  }
  v33 = -[MOVStreamVideoEncoderInterface customEncoderConfig](self, "customEncoderConfig");
  m_expectedFrameRate = 0.0;
  if (!v33 && !self->m_config)
    goto LABEL_35;
  v30 = 11;
LABEL_34:
  -[MOVStreamVideoEncoderInterface setupEncoderWithWidth:andHeight:imageFormat:formatDescription:andFramerate:](self, "setupEncoderWithWidth:andHeight:imageFormat:formatDescription:andFramerate:", Width, Height, v30, v27, m_expectedFrameRate);
LABEL_35:
  if (v27)
    CFRelease(v27);
  if (!self->m_encoderInitialized)
    goto LABEL_42;
  if (v26 == 1278226742)
  {
    v35 = -[MOVStreamEncoderConfig codecType](self->m_config, "codecType", m_expectedFrameRate);
    if (v35 == 1752589105 || !v35)
      self->m_convertL016toL010 = 1;
  }
LABEL_9:
  m_convertL016toL010 = self->m_convertL016toL010;
  if (self->m_convertL016toL010)
    a3 = +[MOVStreamVideoEncoderInterface createHEVCCompatiblePixelBuffer:](MOVStreamVideoEncoderInterface, "createHEVCCompatiblePixelBuffer:", a3);
  v17 = (char *)operator new();
  *(_QWORD *)v17 = v10;
  *(_OWORD *)(v17 + 8) = *(_OWORD *)&a4->var0;
  *((_QWORD *)v17 + 3) = a4->var3;
  v18 = self;
  *((_QWORD *)v17 + 4) = v18;
  -[MOVStreamVideoEncoderInterface setPendingFrames:](v18, "setPendingFrames:", -[MOVStreamVideoEncoderInterface pendingFrames](v18, "pendingFrames") + 1);
  if (!-[MOVStreamVideoEncoderInterface useLegacyVTController](v18, "useLegacyVTController"))
  {
    encoderCtrl = v18->_encoderCtrl;
    v39 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v38 = 0;
    v23 = -[MIOVideoEncoderController encodeFrame:pts:properties:context:error:](encoderCtrl, "encodeFrame:pts:properties:context:error:", a3, &v39, a5, v17, &v38);
    v24 = v38;
    v25 = v24;
    if (v23)
    {

      if (!m_convertL016toL010)
      {
LABEL_18:
        v21 = 1;
        goto LABEL_43;
      }
LABEL_17:
      CVPixelBufferRelease(a3);
      goto LABEL_18;
    }
    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      v32 = v18->m_stream;
      *(_DWORD *)buf = 138412546;
      v42 = v32;
      v43 = 1024;
      LODWORD(v44) = 0;
      _os_log_impl(&dword_210675000, v31, OS_LOG_TYPE_ERROR, "Error encoding frame for stream '%@': %d", buf, 0x12u);
    }

LABEL_42:
    v21 = 0;
    goto LABEL_43;
  }
  m_encoder = v18->m_encoder;
  v37 = (CMTime)*a4;
  v20 = MOVStreamHEVCLosslessEncoder::EncodeFrame(m_encoder, a3, &v37, a5, v17);
  v21 = v20 == 0;
  if (m_convertL016toL010 && !v20)
    goto LABEL_17;
LABEL_43:

  return v21;
}

- (void)encodeFrame:(__CVBuffer *)a3 pts:(id *)a4 frameProperties:(__CFDictionary *)a5 metadata:(id)a6
{
  id v10;
  NSObject *m_encodingQueue;
  _QWORD v12[4];
  id v13;
  id v14[3];
  __int128 v15;
  int64_t var3;
  id location;

  v10 = a6;
  if (!self->m_failedState)
  {
    CVPixelBufferRetain(a3);
    objc_initWeak(&location, self);
    m_encodingQueue = self->m_encodingQueue;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__MOVStreamVideoEncoderInterface_encodeFrame_pts_frameProperties_metadata___block_invoke;
    v12[3] = &unk_24CA45100;
    objc_copyWeak(v14, &location);
    v15 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    v14[1] = a3;
    v14[2] = a5;
    v13 = v10;
    dispatch_async(m_encodingQueue, v12);

    objc_destroyWeak(v14);
    objc_destroyWeak(&location);
  }

}

void __75__MOVStreamVideoEncoderInterface_encodeFrame_pts_frameProperties_metadata___block_invoke(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  id v4;
  char v5;
  id v6;
  __int128 v7;
  uint64_t v8;

  v2 = (void *)MEMORY[0x212BC9B10]();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v7 = *(_OWORD *)(a1 + 64);
    v8 = *(_QWORD *)(a1 + 80);
    v5 = objc_msgSend(WeakRetained, "processFrame:pts:frameProperties:metadata:", *(_QWORD *)(a1 + 48), &v7, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
    CVPixelBufferRelease(*(CVPixelBufferRef *)(a1 + 48));
    if ((v5 & 1) == 0)
    {
      *((_BYTE *)v4 + 73) = 1;
      MOVStreamHEVCLosslessEncoder::invalidateSession(*((MOVStreamHEVCLosslessEncoder **)v4 + 1));
      v6 = objc_loadWeakRetained((id *)v4 + 6);
      objc_msgSend(v6, "encoder:encodingFailedForStream:", v4, *((_QWORD *)v4 + 5));

    }
  }

  objc_autoreleasePoolPop(v2);
}

+ (__CVBuffer)createHEVCCompatiblePixelBuffer:(__CVBuffer *)a3
{
  size_t Width;
  size_t Height;
  __CVBuffer *v6;

  Width = CVPixelBufferGetWidth(a3);
  Height = CVPixelBufferGetHeight(a3);
  v6 = +[MIOPixelBufferUtility createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:](MIOPixelBufferUtility, "createRawPixelBufferWithWidth:height:extendedRows:extendedPixelsPerRow:pixelFormat:bytesPerRowAlignment:planeAlignment:bufferCacheMode:", Width, Height, 0, (CVPixelBufferGetBytesPerRow(a3) >> 1) - Width, 1278226736, 1, 1);
  if (!+[MIOPixelBufferUtility copyFromPixelBuffer:toPixelBuffer:andShiftBits:](MIOPixelBufferUtility, "copyFromPixelBuffer:toPixelBuffer:andShiftBits:", a3, v6, 2))return 0;
  +[MIOPixelBufferUtility transferAttachmentForKey:fromBuffer:toBuffer:](MIOPixelBufferUtility, "transferAttachmentForKey:fromBuffer:toBuffer:", *MEMORY[0x24BDC5510], a3, v6);
  +[MIOPixelBufferUtility transferAttachmentForKey:fromBuffer:toBuffer:](MIOPixelBufferUtility, "transferAttachmentForKey:fromBuffer:toBuffer:", *MEMORY[0x24BDC5570], a3, v6);
  +[MIOPixelBufferUtility transferAttachmentForKey:fromBuffer:toBuffer:](MIOPixelBufferUtility, "transferAttachmentForKey:fromBuffer:toBuffer:", *MEMORY[0x24BDC5490], a3, v6);
  +[MIOPixelBufferUtility transferAttachmentForKey:fromBuffer:toBuffer:](MIOPixelBufferUtility, "transferAttachmentForKey:fromBuffer:toBuffer:", *MEMORY[0x24BDC5418], a3, v6);
  +[MIOPixelBufferUtility transferAttachmentForKey:fromBuffer:toBuffer:](MIOPixelBufferUtility, "transferAttachmentForKey:fromBuffer:toBuffer:", *MEMORY[0x24BDC5420], a3, v6);
  return v6;
}

- (BOOL)frameReorderingEnabled
{
  MOVStreamHEVCLosslessEncoder *m_encoder;
  id v5;

  if (!-[MOVStreamVideoEncoderInterface useLegacyVTController](self, "useLegacyVTController"))
    return -[MIOVideoEncoderController frameReorderingEnabled](self->_encoderCtrl, "frameReorderingEnabled");
  m_encoder = self->m_encoder;
  if (!m_encoder)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("Encoder not configured yet."), 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v5);
  }
  return MOVStreamHEVCLosslessEncoder::frameReorderingEnabled(m_encoder);
}

- (void)awaitEncoderClosed
{
  NSObject *m_encodingQueue;
  _QWORD block[5];

  m_encodingQueue = self->m_encodingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__MOVStreamVideoEncoderInterface_awaitEncoderClosed__block_invoke;
  block[3] = &unk_24CA44D60;
  block[4] = self;
  dispatch_sync(m_encodingQueue, block);
}

uint64_t __52__MOVStreamVideoEncoderInterface_awaitEncoderClosed__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeEncoder");
}

- (void)closeEncoder
{
  MOVStreamHEVCLosslessEncoder *m_encoder;
  id var2;
  NSObject *v5;
  NSString *m_stream;
  MIOVideoEncoderController *encoderCtrl;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSString *v11;
  id v12;
  uint8_t buf[4];
  NSString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  self->m_encoderInitialized = 0;
  if (-[MOVStreamVideoEncoderInterface useLegacyVTController](self, "useLegacyVTController"))
  {
    m_encoder = self->m_encoder;
    var2 = m_encoder->var2;
    m_encoder->var2 = 0;

    +[MIOLog defaultLog](MIOLog, "defaultLog");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      m_stream = self->m_stream;
      *(_DWORD *)buf = 138543362;
      v14 = m_stream;
      _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_INFO, "[FINISH] %{public}@: Encoder complete session...", buf, 0xCu);
    }

    MOVStreamHEVCLosslessEncoder::Close(self->m_encoder);
  }
  else
  {
    encoderCtrl = self->_encoderCtrl;
    v12 = 0;
    v8 = -[MIOVideoEncoderController closeEncoderError:](encoderCtrl, "closeEncoderError:", &v12);
    v9 = v12;
    if (!v8)
    {
      +[MIOLog defaultLog](MIOLog, "defaultLog");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v11 = self->m_stream;
        *(_DWORD *)buf = 138412546;
        v14 = v11;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_210675000, v10, OS_LOG_TYPE_ERROR, "Error closing encoding session for stream '%@': %@", buf, 0x16u);
      }

    }
  }
}

- (void)closeEncoderInDispatchGroup:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSString *m_stream;
  NSObject *m_encodingQueue;
  NSObject *v8;
  _QWORD v9[5];
  NSObject *v10;
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    m_stream = self->m_stream;
    *(_DWORD *)buf = 138543362;
    v12 = m_stream;
    _os_log_impl(&dword_210675000, v5, OS_LOG_TYPE_INFO, "[FINISH] %{public}@: Encoder close...", buf, 0xCu);
  }

  dispatch_group_enter(v4);
  m_encodingQueue = self->m_encodingQueue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__MOVStreamVideoEncoderInterface_closeEncoderInDispatchGroup___block_invoke;
  v9[3] = &unk_24CA44CE8;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  dispatch_async(m_encodingQueue, v9);

}

void __62__MOVStreamVideoEncoderInterface_closeEncoderInDispatchGroup___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x212BC9B10]();
  objc_msgSend(*(id *)(a1 + 32), "closeEncoder");
  +[MIOLog defaultLog](MIOLog, "defaultLog");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_210675000, v3, OS_LOG_TYPE_INFO, "[FINISH] %{public}@: Encoder closed.", (uint8_t *)&v5, 0xCu);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  objc_autoreleasePoolPop(v2);
}

- (void)skipFrameWithStatus:(int)a3 andFlags:(unsigned int)a4
{
  id WeakRetained;

  -[MOVStreamVideoEncoderInterface setPendingFrames:](self, "setPendingFrames:", -[MOVStreamVideoEncoderInterface pendingFrames](self, "pendingFrames") - 1);
  self->_lastEncodingStatus = a3;
  self->_lastEncodingInfoFlags = a4;
  self->m_failedState = 1;
  MOVStreamHEVCLosslessEncoder::invalidateSession(self->m_encoder);
  WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
  objc_msgSend(WeakRetained, "encoder:encodingFailedForStream:", self, self->m_stream);

}

- (void)writeSampleBuffer:(opaqueCMSampleBuffer *)a3 pts:(id *)a4 metadata:(id)a5 withStatus:(int)a6 andFlags:(unsigned int)a7
{
  id v12;
  id WeakRetained;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v14;

  v12 = a5;
  -[MOVStreamVideoEncoderInterface setPendingFrames:](self, "setPendingFrames:", -[MOVStreamVideoEncoderInterface pendingFrames](self, "pendingFrames") - 1);
  CFRetain(a3);
  self->_lastEncodingStatus = a6;
  self->_lastEncodingInfoFlags = a7;
  WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
  v14 = *a4;
  objc_msgSend(WeakRetained, "encoder:encodedSampleBuffer:metadata:presentationTime:streamId:", self, a3, v12, &v14, self->m_stream);

}

- (BOOL)configureSessionOverride:(OpaqueVTCompressionSession *)a3
{
  MOVStreamEncoderConfig *m_config;
  char v7;
  id WeakRetained;

  if (!-[MOVStreamVideoEncoderInterface customEncoderConfig](self, "customEncoderConfig"))
    return 0;
  m_config = self->m_config;
  if (m_config)
    return -[MOVStreamEncoderConfig applySessionProperties:](m_config, "applySessionProperties:", a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
  v7 = objc_msgSend(WeakRetained, "encoder:configureSessionOverride:streamId:", self, a3, self->m_stream);

  return v7;
}

- (id)overrideVideoEncoderSpecification
{
  MOVStreamEncoderConfig *m_config;
  void *v4;
  id WeakRetained;

  if (-[MOVStreamVideoEncoderInterface customEncoderConfig](self, "customEncoderConfig"))
  {
    m_config = self->m_config;
    if (m_config)
    {
      -[MOVStreamEncoderConfig encoderSpecification](m_config, "encoderSpecification");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
      objc_msgSend(WeakRetained, "encoder:overrideVideoEncoderSpecificationForStreamId:", self, self->m_stream);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (unsigned)codecTypeOverride
{
  MOVStreamEncoderConfig *m_config;
  unsigned int v5;
  id WeakRetained;

  if (!-[MOVStreamVideoEncoderInterface customEncoderConfig](self, "customEncoderConfig"))
    return 0;
  m_config = self->m_config;
  if (m_config)
    return -[MOVStreamEncoderConfig codecType](m_config, "codecType");
  WeakRetained = objc_loadWeakRetained((id *)&self->m_delegate);
  v5 = objc_msgSend(WeakRetained, "encoder:codecTypeOverrideForstreamId:", self, self->m_stream);

  return v5;
}

- (unsigned)lastEncodingStatus
{
  return self->_lastEncodingStatus;
}

- (unsigned)lastEncodingInfoFlags
{
  return self->_lastEncodingInfoFlags;
}

- (int64_t)pendingFrames
{
  return self->_pendingFrames;
}

- (void)setPendingFrames:(int64_t)a3
{
  self->_pendingFrames = a3;
}

- (int64_t)encodingQueueDepth
{
  return self->_encodingQueueDepth;
}

- (void)setEncodingQueueDepth:(int64_t)a3
{
  self->_encodingQueueDepth = a3;
}

- (BOOL)customEncoderConfig
{
  return self->_customEncoderConfig;
}

- (void)setCustomEncoderConfig:(BOOL)a3
{
  self->_customEncoderConfig = a3;
}

- (BOOL)useLegacyVTController
{
  return self->_useLegacyVTController;
}

- (void)setUseLegacyVTController:(BOOL)a3
{
  self->_useLegacyVTController = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoderCtrl, 0);
  objc_storeStrong((id *)&self->m_encodingQueue, 0);
  objc_storeStrong((id *)&self->m_config, 0);
  objc_destroyWeak((id *)&self->m_delegate);
  objc_storeStrong((id *)&self->m_stream, 0);
}

@end
