@implementation CSSiriAcousticFingerprinter

- (CSSiriAcousticFingerprinter)init
{
  char *v2;
  dispatch_queue_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CSSiriAcousticFingerprinter;
  v2 = -[CSSiriAcousticFingerprinter init](&v6, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("ADAcousticFingerprinter", 0);
    v4 = (void *)*((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = v3;

    *((_QWORD *)v2 + 6) = 0x40CF400000000000;
    *(_OWORD *)(v2 + 56) = 0u;
    *(_OWORD *)(v2 + 72) = 0u;
    *((_QWORD *)v2 + 11) = 0x3FF0000000000000;
    *((_QWORD *)v2 + 5) = objc_msgSend(v2, "_samplesPerInterval");
  }
  return (CSSiriAcousticFingerprinter *)v2;
}

- (void)dealloc
{
  OpaqueAudioConverter *fingerprinterConverter;
  objc_super v4;

  fingerprinterConverter = self->_fingerprinterConverter;
  if (fingerprinterConverter)
    AudioConverterDispose(fingerprinterConverter);
  -[CSSiriAcousticFingerprinter _cleanUpConnection](self, "_cleanUpConnection");
  v4.receiver = self;
  v4.super_class = (Class)CSSiriAcousticFingerprinter;
  -[CSSiriAcousticFingerprinter dealloc](&v4, sel_dealloc);
}

- (id)_connection
{
  NSXPCConnection *asxConnection;
  NSXPCConnection *v4;
  NSXPCConnection *v5;
  NSXPCConnection *v6;
  void *v7;
  NSXPCConnection *v8;
  uint64_t v9;
  NSXPCConnection *v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id location;

  asxConnection = self->_asxConnection;
  if (!asxConnection)
  {
    v4 = (NSXPCConnection *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.siri.acousticsignature"));
    v5 = self->_asxConnection;
    self->_asxConnection = v4;

    -[NSXPCConnection _setQueue:](self->_asxConnection, "_setQueue:", self->_queue);
    v6 = self->_asxConnection;
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF7C59F0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSXPCConnection setRemoteObjectInterface:](v6, "setRemoteObjectInterface:", v7);

    objc_initWeak(&location, self);
    v8 = self->_asxConnection;
    v9 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42__CSSiriAcousticFingerprinter__connection__block_invoke;
    v14[3] = &unk_1E7C27FF0;
    objc_copyWeak(&v15, &location);
    -[NSXPCConnection setInterruptionHandler:](v8, "setInterruptionHandler:", v14);
    v10 = self->_asxConnection;
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __42__CSSiriAcousticFingerprinter__connection__block_invoke_2;
    v12[3] = &unk_1E7C27FF0;
    objc_copyWeak(&v13, &location);
    -[NSXPCConnection setInvalidationHandler:](v10, "setInvalidationHandler:", v12);
    -[NSXPCConnection resume](self->_asxConnection, "resume");
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
    asxConnection = self->_asxConnection;
  }
  return asxConnection;
}

- (void)_connectionInterrupted
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[CSSiriAcousticFingerprinter _connectionInterrupted]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[CSSiriAcousticFingerprinter _cleanUpConnection](self, "_cleanUpConnection");
}

- (void)_connectionInvalidated
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    v4 = 136315138;
    v5 = "-[CSSiriAcousticFingerprinter _connectionInvalidated]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[CSSiriAcousticFingerprinter _cleanUpConnection](self, "_cleanUpConnection");
}

- (void)_cleanUpConnection
{
  NSXPCConnection *asxConnection;
  NSXPCConnection *v4;

  asxConnection = self->_asxConnection;
  if (asxConnection)
  {
    -[NSXPCConnection setExportedObject:](asxConnection, "setExportedObject:", 0);
    -[NSXPCConnection invalidate](self->_asxConnection, "invalidate");
    v4 = self->_asxConnection;
    self->_asxConnection = 0;

  }
}

- (id)_service
{
  void *v2;
  void *v3;

  -[CSSiriAcousticFingerprinter _connection](self, "_connection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteObjectProxy");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_serviceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CSSiriAcousticFingerprinter _connection](self, "_connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (unint64_t)_samplesPerInterval
{
  return (unint64_t)(self->_sourceASBD.mSampleRate * self->_interval);
}

- (void)setFingerprintInterval:(double)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__CSSiriAcousticFingerprinter_setFingerprintInterval___block_invoke;
  v4[3] = &unk_1E7C29178;
  v4[4] = self;
  *(double *)&v4[5] = a3;
  dispatch_async(queue, v4);
}

- (void)setASBD:(AudioStreamBasicDescription *)a3
{
  __int128 v3;
  __int128 v4;

  if (a3)
  {
    v3 = *(_OWORD *)&a3->mSampleRate;
    v4 = *(_OWORD *)&a3->mBytesPerPacket;
    *(_QWORD *)&self->_sourceASBD.mBitsPerChannel = *(_QWORD *)&a3->mBitsPerChannel;
    *(_OWORD *)&self->_sourceASBD.mSampleRate = v3;
    *(_OWORD *)&self->_sourceASBD.mBytesPerPacket = v4;
    -[CSSiriAcousticFingerprinter _configureWithCurrentASBD](self, "_configureWithCurrentASBD");
  }
}

- (void)_configureWithCurrentASBD
{
  os_log_t *v3;
  NSObject *v4;
  int mSampleRate;
  uint64_t v6;
  void *v7;
  OpaqueAudioConverter *fingerprinterConverter;
  OSStatus v9;
  NSObject *v10;
  unsigned int v11;
  uint8_t v12[4];
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  unsigned int *v17;
  AudioStreamBasicDescription buf;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  self->_nextFingerprintSampleNumber = -[CSSiriAcousticFingerprinter _samplesPerInterval](self, "_samplesPerInterval");
  v3 = (os_log_t *)MEMORY[0x1E0CFE6C0];
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
  {
    mSampleRate = (int)self->_sourceASBD.mSampleRate;
    LODWORD(buf.mSampleRate) = 136315394;
    *(_QWORD *)((char *)&buf.mSampleRate + 4) = "-[CSSiriAcousticFingerprinter _configureWithCurrentASBD]";
    LOWORD(buf.mFormatFlags) = 1024;
    *(AudioFormatFlags *)((char *)&buf.mFormatFlags + 2) = mSampleRate;
    _os_log_impl(&dword_1C2614000, v4, OS_LOG_TYPE_INFO, "%s Setting sample rate to %d", (uint8_t *)&buf, 0x12u);
  }
  v6 = ASXSampleRateFromInt((uint64_t)self->_sourceASBD.mSampleRate);
  -[CSSiriAcousticFingerprinter _service](self, "_service");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSampleRate:", v6);

  fingerprinterConverter = self->_fingerprinterConverter;
  if (fingerprinterConverter)
  {
    AudioConverterDispose(fingerprinterConverter);
    self->_fingerprinterConverter = 0;
  }
  if (-[CSSiriAcousticFingerprinter _needsConversion](self, "_needsConversion"))
  {
    *(_OWORD *)&buf.mSampleRate = FingerprinterASBD;
    *(_OWORD *)&buf.mBytesPerPacket = unk_1C276CCA8;
    *(_QWORD *)&buf.mBitsPerChannel = 16;
    buf.mSampleRate = self->_sourceASBD.mSampleRate;
    v9 = AudioConverterNew(&self->_sourceASBD, &buf, &self->_fingerprinterConverter);
    if (v9)
    {
      v11 = bswap32(v9);
      v10 = *v3;
      if (os_log_type_enabled(*v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v12 = 136315650;
        v13 = "-[CSSiriAcousticFingerprinter _configureWithCurrentASBD]";
        v14 = 1042;
        v15 = 4;
        v16 = 2082;
        v17 = &v11;
        _os_log_error_impl(&dword_1C2614000, v10, OS_LOG_TYPE_ERROR, "%s Could not make Fingerprinter decoder: %{public}.4s", v12, 0x1Cu);
      }
    }
  }
}

- (BOOL)_needsConversion
{
  return self->_sourceASBD.mFormatFlags != 12 || self->_sourceASBD.mBytesPerPacket != 2;
}

- (id)_convertPCMDataForFingerprinting:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  OpaqueAudioConverter *fingerprinterConverter;
  OSStatus v11;
  NSObject *v12;
  unsigned int v14;
  _QWORD inInputDataProcUserData[4];
  id v16;
  int v17;
  AudioBufferList outOutputData;
  UInt32 ioOutputDataPacketSize;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  unsigned int *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && self->_fingerprinterConverter)
  {
    v6 = 2 * objc_msgSend(v4, "length") / (unint64_t)self->_sourceASBD.mBytesPerPacket;
    v7 = objc_msgSend(v5, "length") / (unint64_t)self->_sourceASBD.mBytesPerPacket;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", v6);
    ioOutputDataPacketSize = v7;
    *(_QWORD *)&outOutputData.mNumberBuffers = 1;
    outOutputData.mBuffers[0].mNumberChannels = 1;
    outOutputData.mBuffers[0].mDataByteSize = objc_msgSend(v8, "length");
    v9 = objc_retainAutorelease(v8);
    outOutputData.mBuffers[0].mData = (void *)objc_msgSend(v9, "mutableBytes");
    fingerprinterConverter = self->_fingerprinterConverter;
    inInputDataProcUserData[0] = MEMORY[0x1E0C809B0];
    inInputDataProcUserData[1] = 3221225472;
    inInputDataProcUserData[2] = __64__CSSiriAcousticFingerprinter__convertPCMDataForFingerprinting___block_invoke;
    inInputDataProcUserData[3] = &unk_1E7C28018;
    v17 = v7;
    v16 = v5;
    v11 = AudioConverterFillComplexBuffer(fingerprinterConverter, (AudioConverterComplexInputDataProc)AudioConverterFillComplexBuffer_BlockInvoke, inInputDataProcUserData, &ioOutputDataPacketSize, &outOutputData, 0);
    objc_msgSend(v9, "setLength:", 2 * ioOutputDataPacketSize);
    if (v11)
    {
      v14 = bswap32(v11);
      v12 = *MEMORY[0x1E0CFE6C0];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315650;
        v21 = "-[CSSiriAcousticFingerprinter _convertPCMDataForFingerprinting:]";
        v22 = 1042;
        v23 = 4;
        v24 = 2082;
        v25 = &v14;
        _os_log_error_impl(&dword_1C2614000, v12, OS_LOG_TYPE_ERROR, "%s Error during conversion for fingerprinter %{public}.4s", buf, 0x1Cu);
      }
    }

  }
  else
  {
    v9 = v4;
  }

  return v9;
}

- (void)appendPCMData:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CSSiriAcousticFingerprinter *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)flush
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CSSiriAcousticFingerprinter_flush__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)reset
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__CSSiriAcousticFingerprinter_reset__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (CSSiriAcousticFingerprinterDelegate)delegate
{
  return (CSSiriAcousticFingerprinterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_asxConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __36__CSSiriAcousticFingerprinter_reset__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  id v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[4])
  {
    objc_msgSend(v2, "_service");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reset");
    objc_msgSend(*(id *)(a1 + 32), "_configureWithCurrentASBD");
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = 0;

  }
}

void __36__CSSiriAcousticFingerprinter_flush__block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[6];
  _QWORD v7[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = (double)*(unint64_t *)(v2 + 32) / *(double *)(v2 + 48);
  v4 = MEMORY[0x1E0C809B0];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __36__CSSiriAcousticFingerprinter_flush__block_invoke_2;
  v7[3] = &unk_1E7C28040;
  v7[4] = v2;
  *(double *)&v7[5] = v3;
  objc_msgSend((id)v2, "_serviceWithErrorHandler:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __36__CSSiriAcousticFingerprinter_flush__block_invoke_62;
  v6[3] = &unk_1E7C28068;
  v6[4] = *(_QWORD *)(a1 + 32);
  *(double *)&v6[5] = v3;
  objc_msgSend(v5, "getSignature:", v6);

}

void __36__CSSiriAcousticFingerprinter_flush__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[CSSiriAcousticFingerprinter flush]_block_invoke_2";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "acousticFingerprinter:hasFingerprint:duration:", *(_QWORD *)(a1 + 32), 0, *(double *)(a1 + 40));

}

void __36__CSSiriAcousticFingerprinter_flush__block_invoke_62(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "acousticFingerprinter:hasFingerprint:duration:", *(_QWORD *)(a1 + 32), v4, *(double *)(a1 + 40));

}

void __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke(uint64_t a1)
{
  unint64_t v2;
  void *v3;
  void *v4;
  _QWORD *v5;
  uint64_t v6;
  double v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[6];
  _QWORD v12[6];
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "length") / (unint64_t)*(unsigned int *)(*(_QWORD *)(a1 + 40) + 64);
  objc_msgSend(*(id *)(a1 + 40), "_convertPCMDataForFingerprinting:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "_service");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendAcousticData:sampleCount:sampleRate:", v3, v2, ASXSampleRateFromInt((uint64_t)*(double *)(*(_QWORD *)(a1 + 40) + 48)));

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) += (int)v2;
  v5 = *(_QWORD **)(a1 + 40);
  if (v5[4] > v5[5])
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) += objc_msgSend(v5, "_samplesPerInterval");
    v6 = *(_QWORD *)(a1 + 40);
    v7 = (double)*(unint64_t *)(v6 + 32) / *(double *)(v6 + 48);
    v8 = *MEMORY[0x1E0CFE6C0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[CSSiriAcousticFingerprinter appendPCMData:]_block_invoke";
      v15 = 2048;
      v16 = v7;
      _os_log_impl(&dword_1C2614000, v8, OS_LOG_TYPE_INFO, "%s Getting signature for duration %lf", buf, 0x16u);
      v6 = *(_QWORD *)(a1 + 40);
    }
    v9 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke_58;
    v12[3] = &unk_1E7C28040;
    v12[4] = v6;
    *(double *)&v12[5] = v7;
    objc_msgSend((id)v6, "_serviceWithErrorHandler:", v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke_60;
    v11[3] = &unk_1E7C28068;
    v11[4] = *(_QWORD *)(a1 + 40);
    *(double *)&v11[5] = v7;
    objc_msgSend(v10, "getSignature:", v11);

  }
}

void __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke_58(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id WeakRetained;
  int v6;
  const char *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *MEMORY[0x1E0CFE6C0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6C0], OS_LOG_TYPE_ERROR))
  {
    v6 = 136315394;
    v7 = "-[CSSiriAcousticFingerprinter appendPCMData:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_error_impl(&dword_1C2614000, v4, OS_LOG_TYPE_ERROR, "%s %@", (uint8_t *)&v6, 0x16u);
  }
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "acousticFingerprinter:hasFingerprint:duration:", *(_QWORD *)(a1 + 32), 0, *(double *)(a1 + 40));

}

void __45__CSSiriAcousticFingerprinter_appendPCMData___block_invoke_60(uint64_t a1, void *a2)
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)(*(_QWORD *)(a1 + 32) + 24);
  v4 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "acousticFingerprinter:hasFingerprint:duration:", *(_QWORD *)(a1 + 32), v4, *(double *)(a1 + 40));

}

uint64_t __64__CSSiriAcousticFingerprinter__convertPCMDataForFingerprinting___block_invoke(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  *a2 = *(_DWORD *)(a1 + 40);
  *(_DWORD *)a3 = 1;
  *(_DWORD *)(a3 + 8) = 1;
  *(_QWORD *)(a3 + 16) = objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  *(_DWORD *)(a3 + 12) = objc_msgSend(*(id *)(a1 + 32), "length");
  return 0;
}

double __54__CSSiriAcousticFingerprinter_setFingerprintInterval___block_invoke(uint64_t a1)
{
  double result;

  result = *(double *)(a1 + 40);
  *(double *)(*(_QWORD *)(a1 + 32) + 88) = result;
  return result;
}

void __42__CSSiriAcousticFingerprinter__connection__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInterrupted");

}

void __42__CSSiriAcousticFingerprinter__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionInvalidated");

}

@end
