@implementation ASDDSPStream

- (id)getDSPCaptureDirectory
{
  return CFSTR("/tmp/AudioCapture/DSP");
}

- (id)getASDAudioDefaultsPath
{
  return CFSTR("com.apple.audio.AudioServerDriver");
}

- (int64_t)getDSPCaptureTypeFromDefault
{
  NSUserDefaults *defaults;
  int64_t v4;
  void *v5;
  void *v6;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t buf[16];

  defaults = self->_defaults;
  if (!defaults)
    return 0;
  -[NSUserDefaults valueForKey:](defaults, "valueForKey:", CFSTR("EnableDSPCapture"));
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DSPCaptureTypeBasic enabled!", buf, 2u);
    }
    v4 = 1;
  }
  -[NSUserDefaults valueForKey:](self->_defaults, "valueForKey:", CFSTR("EnableDSPCaptureOnPluginDevice"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v4 |= 2uLL;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DSPCaptureTypePluginDevice enabled!", v10, 2u);
    }
  }
  -[NSUserDefaults valueForKey:](self->_defaults, "valueForKey:", CFSTR("EnableDSPCaptureOnDSPGraph"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    if (v4)
      return v4;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "NO DSP capture is enabled!", v8, 2u);
    }
    return 0;
  }
  v4 |= 4uLL;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DSPCaptureTypeDSPGraph enabled!", v9, 2u);
  }
  return v4;
}

- (int64_t)getAudioDebugTypeWithDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v11;
  uint8_t v12[2];
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Getting Audio Debug Type...", buf, 2u);
  }
  objc_msgSend(v3, "valueForKey:", CFSTR("DebugType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    if (!os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
LABEL_14:
      v6 = 1;
      goto LABEL_15;
    }
    v11 = 0;
    v7 = MEMORY[0x24BDACB70];
    v8 = "Using default Audio Debug Type: ReinitializeGraph!";
    v9 = (uint8_t *)&v11;
LABEL_13:
    _os_log_impl(&dword_219C60000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
    goto LABEL_14;
  }
  if (!objc_msgSend(v4, "isEqualToString:", CFSTR("KeepGraphInitialized")))
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("ReinitializeGraph"))
      || !os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      goto LABEL_14;
    }
    *(_WORD *)v12 = 0;
    v7 = MEMORY[0x24BDACB70];
    v8 = "Using Audio Debug Type: ReinitializeGraph!";
    v9 = v12;
    goto LABEL_13;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Using Audio Debug Type: KeepGraphInitialized!", v13, 2u);
  }
  v6 = 0;
LABEL_15:

  return v6;
}

- (int64_t)getAudioCaptureRingBufferModeWithDict:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  uint8_t v8[16];
  uint8_t v9[16];
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t buf[16];

  v3 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Getting Audio Capture Ring Buffer Mode...", buf, 2u);
  }
  objc_msgSend(v3, "valueForKey:", CFSTR("RingBufferMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Using Audio Capture Ring Buffer Mode: None!", v8, 2u);
    }
    goto LABEL_17;
  }
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Short")))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Using Audio Capture Ring Buffer Mode: Short!", v11, 2u);
    }
    v6 = 1;
    goto LABEL_18;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Normal")))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      v6 = 2;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Using Audio Capture Ring Buffer Mode: Normal!", v10, 2u);
    }
    else
    {
      v6 = 2;
    }
    goto LABEL_18;
  }
  if (!objc_msgSend(v5, "isEqualToString:", CFSTR("Long")))
  {
LABEL_17:
    v6 = 0;
    goto LABEL_18;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Using Audio Capture Ring Buffer Mode: Long!", v9, 2u);
  }
  v6 = 3;
LABEL_18:

  return v6;
}

- (void)enableDSPCaptureInAction
{
  void *v3;
  int64_t v4;
  uint8_t v5[16];
  uint8_t buf[16];

  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "enableDSPCaptureInAction!", buf, 2u);
  }
  -[ASDDSPStream hardwareDSP](self, "hardwareDSP");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Found graph, enabling DSP Capture in action!", v5, 2u);
    }
    v4 = -[ASDDSPStream getDSPCaptureTypeFromDefault](self, "getDSPCaptureTypeFromDefault");
    self->_DSPCaptureType = v4;
    -[ASDDSPStream enableDSPCaptureByType:withGraph:](self, "enableDSPCaptureByType:withGraph:", v4, v3);
  }

}

- (ASDDSPStream)initWithDirection:(unsigned int)a3 withPlugin:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)MEMORY[0x24BDBCE88];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[ASDDSPStream initWithDirection:withPlugin:]", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Do not call %@"), v6);

  return 0;
}

- (void)doSetUnderlyingStreams:(id)a3
{
  NSArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  unint64_t *p_underlyingInputStreamCount;
  unsigned int v11;
  void *v12;
  id v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = a3;
  objc_storeStrong((id *)&self->_underlyingStreams, a3);
  self->_underlyingInputStreamCount = 0;
  self->_underlyingOutputStreamCount = 0;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = self->_underlyingStreams;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v5);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v8), "direction", v13);
        p_underlyingInputStreamCount = &self->_underlyingInputStreamCount;
        if (v9 == 1869968496)
        {
          v11 = -[ASDStream direction](self, "direction");
          p_underlyingInputStreamCount = &self->_underlyingOutputStreamCount;
          if (v11 == 1768845428)
          {
            objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDDSPStream.mm"), 248, CFSTR("Underlying stream has a different direction than the DSP stream"));

            p_underlyingInputStreamCount = &self->_underlyingOutputStreamCount;
          }
        }
        ++*p_underlyingInputStreamCount;
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

}

- (ASDDSPStream)initWithOwningDevice:(id)a3 underlyingStreams:(id)a4 direction:(unsigned int)a5 plugin:(id)a6
{
  uint64_t v7;
  id v11;
  id v12;
  DSPGraph *v13;
  ASDDSPStream *v14;
  ASDDSPStream *v15;
  OS_dispatch_source *mHUPSource;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *dspQueue;
  void *v24;
  void *v25;
  id v26;
  dispatch_queue_t v27;
  OS_dispatch_queue *propertyQueue;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  NSUserDefaults *defaults;
  uint64_t v34;
  NSString *DSPCaptureDirectory;
  NSObject *v36;
  dispatch_source_t v37;
  OS_dispatch_source *v38;
  NSObject *v39;
  void *v41;
  _QWORD handler[4];
  id v43;
  id location;
  objc_super v45;

  v7 = *(_QWORD *)&a5;
  v11 = a3;
  v12 = a4;
  v13 = (DSPGraph *)a6;
  if (DSPGraph::ABIVersion(v13) != 4)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ASDDSPStream.mm"), 261, CFSTR("DSPGraph ABI runtime/compile-time mismatch"));

  }
  v45.receiver = self;
  v45.super_class = (Class)ASDDSPStream;
  v14 = -[ASDStream initWithDirection:withPlugin:](&v45, sel_initWithDirection_withPlugin_, v7, v13);
  v15 = v14;
  if (v14)
  {
    mHUPSource = v14->mHUPSource;
    v14->mHUPSource = 0;

    objc_storeWeak((id *)&v15->_owningDevice, v11);
    -[ASDDSPStream doSetUnderlyingStreams:](v15, "doSetUnderlyingStreams:", v12);
    v15->_ioReferenceCount = 0;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bundleIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)MEMORY[0x24BDD17C8];
    -[ASDStream streamName](v15, "streamName");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("%@.dspStream.%@.dspQueue"), v18, v20);
    v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v22 = dispatch_queue_create((const char *)objc_msgSend(v21, "UTF8String"), 0);
    dspQueue = v15->_dspQueue;
    v15->_dspQueue = (OS_dispatch_queue *)v22;

    v24 = (void *)MEMORY[0x24BDD17C8];
    -[ASDStream streamName](v15, "streamName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "stringWithFormat:", CFSTR("%@.dspStream.%@.propertyQueue"), v18, v25);
    v26 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v27 = dispatch_queue_create((const char *)objc_msgSend(v26, "UTF8String"), 0);
    propertyQueue = v15->_propertyQueue;
    v15->_propertyQueue = (OS_dispatch_queue *)v27;

    -[ASDDSPStream _updateMaximumFramesPerIOCycle](v15, "_updateMaximumFramesPerIOCycle");
    v29 = operator new();
    *(_QWORD *)v29 = &unk_24DBC9C98;
    *(_QWORD *)(v29 + 24) = v29;
    *(_DWORD *)(v29 + 32) = 0;
    *(_QWORD *)(v29 + 40) = 0;
    *(_DWORD *)(v29 + 48) = 0;
    *(_QWORD *)(v29 + 56) = 0;
    *(_QWORD *)(v29 + 64) = 0;
    *(_QWORD *)(v29 + 72) = 0;
    *(_QWORD *)(v29 + 80) = 850045863;
    *(_OWORD *)(v29 + 88) = 0u;
    *(_OWORD *)(v29 + 104) = 0u;
    *(_OWORD *)(v29 + 120) = 0u;
    *(_QWORD *)(v29 + 136) = 0;
    std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>>::reset[abi:ne180100]((uint64_t *)&v15->_clientToGraphMap, v29);
    v15->_keepGraphInitialized = 0;
    v15->_bypassMode = 0;
    v15->_graphAudioValidationMode = 0;
    v30 = objc_alloc(MEMORY[0x24BDBCF50]);
    -[ASDDSPStream getASDAudioDefaultsPath](v15, "getASDAudioDefaultsPath");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v30, "initWithSuiteName:", v31);
    defaults = v15->_defaults;
    v15->_defaults = (NSUserDefaults *)v32;

    v15->_DSPCaptureType = -[ASDDSPStream getDSPCaptureTypeFromDefault](v15, "getDSPCaptureTypeFromDefault");
    -[ASDDSPStream getDSPCaptureDirectory](v15, "getDSPCaptureDirectory");
    v34 = objc_claimAutoreleasedReturnValue();
    DSPCaptureDirectory = v15->_DSPCaptureDirectory;
    v15->_DSPCaptureDirectory = (NSString *)v34;

    dispatch_get_global_queue(0, 0);
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = dispatch_source_create(MEMORY[0x24BDACA08], 1uLL, 0, v36);
    v38 = v15->mHUPSource;
    v15->mHUPSource = (OS_dispatch_source *)v37;

    objc_initWeak(&location, v15);
    v39 = v15->mHUPSource;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __72__ASDDSPStream_initWithOwningDevice_underlyingStreams_direction_plugin___block_invoke;
    handler[3] = &unk_24DBCA1A8;
    objc_copyWeak(&v43, &location);
    dispatch_source_set_event_handler(v39, handler);
    dispatch_activate((dispatch_object_t)v15->mHUPSource);
    objc_destroyWeak(&v43);
    objc_destroyWeak(&location);

  }
  return v15;
}

void __72__ASDDSPStream_initWithOwningDevice_underlyingStreams_direction_plugin___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "enableDSPCaptureInAction");

}

- (void)setUnderlyingStreams:(id)a3
{
  id v4;
  NSObject *dspQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __37__ASDDSPStream_setUnderlyingStreams___block_invoke;
  block[3] = &unk_24DBCA180;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(dspQueue, block);

}

uint64_t __37__ASDDSPStream_setUnderlyingStreams___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "doSetUnderlyingStreams:", *(_QWORD *)(a1 + 40));
}

- (NSArray)underlyingStreams
{
  NSObject *dspQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  dspQueue = self->_dspQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__ASDDSPStream_underlyingStreams__block_invoke;
  v5[3] = &unk_24DBCA1D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dspQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSArray *)v3;
}

void __33__ASDDSPStream_underlyingStreams__block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(*(_QWORD *)(a1 + 32) + 376));
}

- (void)setGraphAudioValidationMode:(int64_t)a3
{
  NSObject *dspQueue;
  _QWORD v4[6];

  dspQueue = self->_dspQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__ASDDSPStream_setGraphAudioValidationMode___block_invoke;
  v4[3] = &unk_24DBCA1F8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(dspQueue, v4);
}

uint64_t __44__ASDDSPStream_setGraphAudioValidationMode___block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(result + 32) + 384) = *(_QWORD *)(result + 40);
  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 288))
    return ASDDSPStreamHelper::setGraphAudioValidationMode(*(_QWORD *)(*(_QWORD *)(result + 32) + 288), *(_QWORD *)(result + 40));
  return result;
}

- (int64_t)graphAudioValidationMode
{
  NSObject *dspQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  dspQueue = self->_dspQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __40__ASDDSPStream_graphAudioValidationMode__block_invoke;
  v5[3] = &unk_24DBCA1D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dspQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __40__ASDDSPStream_graphAudioValidationMode__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 384);
  return result;
}

- (void)startStream
{
  NSObject *dspQueue;
  objc_super v4;
  _QWORD block[6];

  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __27__ASDDSPStream_startStream__block_invoke;
  block[3] = &unk_24DBCA1F8;
  block[4] = self;
  block[5] = a2;
  dispatch_sync(dspQueue, block);
  v4.receiver = self;
  v4.super_class = (Class)ASDDSPStream;
  -[ASDStream startStream](&v4, sel_startStream);
}

uint64_t __27__ASDDSPStream_startStream__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "_hardwareDSP");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("ASDDSPStream.mm"), 348, CFSTR("DSPStreams must have hardware DSP"));

  }
  result = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(result + 392))
  {
    objc_msgSend((id)result, "_updateMaximumFramesPerIOCycle");
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 376);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v11;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v11 != v6)
            objc_enumerationMutation(v4);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "startStream", (_QWORD)v10);
        }
        while (v5 != v7);
        v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v5);
    }

    if ((objc_msgSend(*(id *)(a1 + 32), "_allocateStreamingResources") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("ASDDSPStream.mm"), 360, CFSTR("Couldn't allocate streaming resources"));

    }
    ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 392);
    result = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(result + 408) = 1;
  return result;
}

- (void)sleepForNumberOfSamples:(unint64_t)a3
{
  void *v4;
  double v5;
  double v6;

  -[ASDStream physicalFormat](self, "physicalFormat");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sampleRate");
  v6 = (double)a3 / v5 * 1000000.0;

  usleep(v6);
}

- (void)stopStream
{
  NSObject *dspQueue;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASDDSPStream;
  -[ASDStream stopStream](&v5, sel_stopStream);
  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __26__ASDDSPStream_stopStream__block_invoke;
  block[3] = &unk_24DBC9F68;
  block[4] = self;
  dispatch_sync(dspQueue, block);
}

uint64_t __26__ASDDSPStream_stopStream__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  BOOL v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  *(_BYTE *)(*(_QWORD *)(result + 32) + 408) = 0;
  v1 = *(_QWORD *)(result + 32);
  v2 = *(_QWORD *)(v1 + 392);
  v3 = v2 < 1;
  v4 = v2 - 1;
  if (!v3)
  {
    v5 = result;
    *(_QWORD *)(v1 + 392) = v4;
    v6 = *(_QWORD *)(result + 32);
    if (!*(_QWORD *)(v6 + 392))
    {
      v7 = v6 + 296;
      v8 = *(_QWORD *)(v6 + 304);
      if (v8 != v6 + 296)
      {
        do
        {
          ASDDSPGraphHelper::resetGraph((DSPGraph::Graph **)(v8 + 16));
          v8 = *(_QWORD *)(v8 + 8);
        }
        while (v8 != v7);
        v6 = *(_QWORD *)(v5 + 32);
      }
      v15 = 0u;
      v16 = 0u;
      v13 = 0u;
      v14 = 0u;
      v9 = *(id *)(v6 + 376);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v10)
      {
        v11 = *(_QWORD *)v14;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v14 != v11)
              objc_enumerationMutation(v9);
            objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v12++), "stopStream", (_QWORD)v13);
          }
          while (v10 != v12);
          v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v10);
      }

      return objc_msgSend(*(id *)(v5 + 32), "_deallocateStreamingResources");
    }
  }
  return result;
}

- (BOOL)changePhysicalFormat:(id)a3
{
  return 0;
}

- (BOOL)_allocateStreamingResources
{
  char v2;
  uint64_t (***v3)();
  uint64_t v4;
  _QWORD v6[5];
  uint64_t (**v7)();
  char v8;
  uint64_t (***v9)();
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__ASDDSPStream__allocateStreamingResources__block_invoke;
  v6[3] = &unk_24DBCA068;
  v6[4] = self;
  v7 = &off_24DBC9E00;
  v8 = 0;
  v9 = &v7;
  v2 = ASDDSP::exceptionBarrier<BOOL({block_pointer} {__strong})(void)>(v6);
  v3 = v9;
  if (v9 == &v7)
  {
    v4 = 4;
    v3 = &v7;
    goto LABEL_5;
  }
  if (v9)
  {
    v4 = 5;
LABEL_5:
    (*v3)[v4]();
  }
  return v2;
}

uint64_t __43__ASDDSPStream__allocateStreamingResources__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  ASDDSPStreamHelper *v16;
  uint64_t v17;
  uint64_t j;
  id v20;
  id v21;
  unsigned int v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  AudioStreamBasicDescription v30;
  _BYTE v31[40];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "physicalFormat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "audioStreamBasicDescription");
  else
    memset(&v30, 0, sizeof(v30));
  CAStreamBasicDescription::CAStreamBasicDescription((CAStreamBasicDescription *)v31, &v30);

  v27 = 0;
  v28 = 0;
  v29 = 0;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 376);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v22 = objc_msgSend(v8, "direction");
        objc_msgSend(v8, "physicalFormat");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
          objc_msgSend(v9, "audioStreamBasicDescription");
        else
          memset(&v30, 0, sizeof(v30));
        objc_msgSend(v8, "readInputBlock");
        v21 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "writeMixBlock");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v11 = v28;
        if (v28 >= v29)
        {
          v12 = std::vector<ASDDSPStreamHelper::DSPStream>::__emplace_back_slow_path<ASDStreamDirection,AudioStreamBasicDescription,int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int),int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int)>(&v27, &v22, &v30, &v21, &v20);
        }
        else
        {
          std::vector<ASDDSPStreamHelper::DSPStream>::__construct_one_at_end[abi:ne180100]<ASDStreamDirection,AudioStreamBasicDescription,int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int),int({block_pointer} {__strong})(unsigned int,AudioServerPlugInIOCycleInfo const*,void *,void *,unsigned int)>((uint64_t)&v27, &v22, &v30, &v21, &v20);
          v12 = v11 + 72;
        }
        v28 = v12;

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
    }
    while (v5);
  }

  v13 = *(_QWORD **)(a1 + 32);
  v14 = v13[40];
  v15 = objc_msgSend(v13, "direction");
  v16 = (ASDDSPStreamHelper *)operator new();
  ASDDSPStreamHelper::ASDDSPStreamHelper(v16, v31, &v27, v14, v15);
  std::unique_ptr<ASDDSPStreamHelper>::reset[abi:ne180100]((ASDDSPStreamHelper **)(*(_QWORD *)(a1 + 32) + 288), v16);
  ASDDSPStreamHelper::allocateStreamingResources(*(ASDDSPStreamHelper **)(*(_QWORD *)(a1 + 32) + 288), objc_msgSend(*(id *)(a1 + 32), "maximumFramesPerIOCycle"));
  ASDDSPStreamHelper::setGraphAudioValidationMode(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 288), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 384));
  ASDDSPStreamHelper::setBypassGraphMode(*(ASDDSPStreamHelper **)(*(_QWORD *)(a1 + 32) + 288), objc_msgSend(*(id *)(a1 + 32), "bypassMode"));
  v17 = *(_QWORD *)(a1 + 32) + 296;
  for (j = v17; ; objc_msgSend(*(id *)(a1 + 32), "_allocateStreamingResourcesForGraphHelper:", j + 16))
  {
    j = *(_QWORD *)(j + 8);
    if (j == v17)
      break;
  }
  *(_QWORD *)&v30.mSampleRate = &v27;
  std::vector<ASDDSPStreamHelper::DSPStream>::__destroy_vector::operator()[abi:ne180100]((void ***)&v30);
  return 1;
}

- (void)_deallocateStreamingResources
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD v4[5];
  _QWORD v5[3];
  _QWORD *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__ASDDSPStream__deallocateStreamingResources__block_invoke;
  v4[3] = &unk_24DBC9F68;
  v4[4] = self;
  v5[0] = &off_24DBC9D70;
  v6 = v5;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v4);
  v2 = v6;
  if (v6 == v5)
  {
    v3 = 4;
    v2 = v5;
  }
  else
  {
    if (!v6)
      return;
    v3 = 5;
  }
  (*(void (**)(void))(*v2 + 8 * v3))();
}

ASDDSPStreamHelper *__45__ASDDSPStream__deallocateStreamingResources__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = v2 + 296;
  v4 = *(_QWORD *)(v2 + 304);
  if (v4 != v2 + 296)
  {
    do
    {
      ASDDSPGraphHelper::deallocateStreamingResources((DSPGraph::Graph **)(v4 + 16));
      v4 = *(_QWORD *)(v4 + 8);
    }
    while (v4 != v3);
    v2 = *(_QWORD *)(a1 + 32);
  }
  ASDDSPStreamHelper::deallocateStreamingResources(*(ASDDSPStreamHelper **)(v2 + 288));
  return std::unique_ptr<ASDDSPStreamHelper>::reset[abi:ne180100]((ASDDSPStreamHelper **)(*(_QWORD *)(a1 + 32) + 288), 0);
}

- (void)_allocateStreamingResourcesForGraphHelper:(void *)a3
{
  _QWORD *v3;
  uint64_t v4;
  _QWORD v5[6];
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    -[ASDDSPStream _allocateStreamingResourcesForGraphHelper:].cold.1();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__ASDDSPStream__allocateStreamingResourcesForGraphHelper___block_invoke;
  v5[3] = &unk_24DBCA1F8;
  v5[4] = self;
  v5[5] = a3;
  v6[0] = &off_24DBC9D70;
  v7 = v6;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v5);
  v3 = v7;
  if (v7 == v6)
  {
    v4 = 4;
    v3 = v6;
  }
  else
  {
    if (!v7)
      return;
    v4 = 5;
  }
  (*(void (**)(void))(*v3 + 8 * v4))();
}

void __58__ASDDSPStream__allocateStreamingResourcesForGraphHelper___block_invoke(uint64_t a1)
{
  uint64_t v2;
  ASDDSPStreamHelper *v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;
  _OWORD *v7;
  __int128 v8;
  _OWORD *v9;
  _QWORD *v10;
  _QWORD *v11;
  __int128 v12;
  __int128 v13;
  uint64_t v14;
  void *__p;
  void *v16;
  char *v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char *v23;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(ASDDSPStreamHelper **)(*(_QWORD *)(a1 + 32) + 288);
  if (*(_QWORD *)(v2 + 32) == -1)
  {
    v10 = (_QWORD *)ASDDSPStreamHelper::dspInStreamFormats(v3);
    v11 = (_QWORD *)ASDDSPStreamHelper::dspOutStreamFormats(*(ASDDSPStreamHelper **)(*(_QWORD *)(a1 + 32) + 288));
    ASDDSPGraphHelper::allocateStreamingResources(v2, v10, v11, objc_msgSend(*(id *)(a1 + 32), "maximumFramesPerIOCycle"), objc_msgSend(*(id *)(a1 + 32), "keepGraphInitialized"));
  }
  else
  {
    v4 = ASDDSPStreamHelper::dspFormat(v3);
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_OWORD *)(v4 + 16);
    v18 = *(_OWORD *)v4;
    v19 = v6;
    v20 = *(_QWORD *)(v4 + 32);
    v7 = operator new(0x28uLL);
    v22 = (char *)v7 + 40;
    v23 = (char *)v7 + 40;
    v8 = v19;
    *v7 = v18;
    v7[1] = v8;
    *((_QWORD *)v7 + 4) = v20;
    v21 = v7;
    v12 = *(_OWORD *)v4;
    v13 = *(_OWORD *)(v4 + 16);
    v14 = *(_QWORD *)(v4 + 32);
    v9 = operator new(0x28uLL);
    v16 = (char *)v9 + 40;
    v17 = (char *)v9 + 40;
    *v9 = v12;
    v9[1] = v13;
    *((_QWORD *)v9 + 4) = v14;
    __p = v9;
    ASDDSPGraphHelper::allocateStreamingResources(v5, &v21, &__p, objc_msgSend(*(id *)(a1 + 32), "maximumFramesPerIOCycle"), objc_msgSend(*(id *)(a1 + 32), "keepGraphInitialized"));
    if (__p)
    {
      v16 = __p;
      operator delete(__p);
    }
    if (v21)
    {
      v22 = v21;
      operator delete(v21);
    }
  }
}

- (BOOL)enableBasicDSPCaptureOnGraph:(id)a3 withLevel:(id)a4 andDebugType:(int64_t)a5
{
  return -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:](self, "enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:", a3, a4, a5, 0);
}

- (BOOL)enableBasicDSPCaptureOnGraph:(id)a3 withLevel:(id)a4 andDebugType:(int64_t)a5 andMode:(int64_t)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  BOOL v27;
  _BOOL8 v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  _QWORD v39[5];
  _QWORD v40[5];
  uint8_t v41[4];
  uint64_t v42;
  _BYTE buf[24];
  uint64_t (*v44)(uint64_t, uint64_t);
  void (*v45)(uint64_t);
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  if (!v11)
  {
    v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v18)
      -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:].cold.1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_20;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v11;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Enabling basic DSP Capture on dsp graph: %@ with level: %@", buf, 0x16u);

  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("Light")))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    v44 = __Block_byref_object_copy_;
    v45 = __Block_byref_object_dispose_;
    v46 = (id)objc_opt_new();
    objc_msgSend(v10, "inputs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x24BDAC760];
    v40[0] = MEMORY[0x24BDAC760];
    v40[1] = 3221225472;
    v40[2] = __76__ASDDSPStream_enableBasicDSPCaptureOnGraph_withLevel_andDebugType_andMode___block_invoke;
    v40[3] = &unk_24DBCA220;
    v40[4] = buf;
    objc_msgSend(v13, "enumerateObjectsUsingBlock:", v40);

    objc_msgSend(v10, "outputs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v14;
    v39[1] = 3221225472;
    v39[2] = __76__ASDDSPStream_enableBasicDSPCaptureOnGraph_withLevel_andDebugType_andMode___block_invoke_2;
    v39[3] = &unk_24DBCA220;
    v39[4] = buf;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v39);

    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
    {
      v16 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
      *(_DWORD *)v41 = 138412290;
      v42 = v16;
      _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Enabling basic DSP Capture on dsp graph box names:%@", v41, 0xCu);
    }
    v17 = +[ASDDSPGraphUtilities startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:](ASDDSPGraphUtilities, "startRecordingBoxes:inGraph:fromStream:toDirectory:withType:andMode:error:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40), v10, self, self->_DSPCaptureDirectory, a5, a6, 0);
    _Block_object_dispose(buf, 8);

    if (!v17)
      goto LABEL_18;
  }
  else
  {
    if (!objc_msgSend(v11, "isEqualToString:", CFSTR("Heavy")))
    {
      v28 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v28)
        -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:].cold.3(v28, v29, v30, v31, v32, v33, v34, v35);
      goto LABEL_18;
    }
    if (!+[ASDDSPGraphUtilities startRecordingAllBoxesInGraph:fromStream:toDirectory:withType:error:](ASDDSPGraphUtilities, "startRecordingAllBoxesInGraph:fromStream:toDirectory:withType:error:", v10, self, self->_DSPCaptureDirectory, a5, 0))
    {
LABEL_18:
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v10, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:].cold.2(v36, (uint64_t)buf, v37);
      }
LABEL_20:
      v27 = 0;
      goto LABEL_21;
    }
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v10, "name");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v26;
    _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Successfully enabled DSP Capture on dsp graph: %@", buf, 0xCu);

  }
  v27 = 1;
LABEL_21:

  return v27;
}

void __76__ASDDSPStream_enableBasicDSPCaptureOnGraph_withLevel_andDebugType_andMode___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

void __76__ASDDSPStream_enableBasicDSPCaptureOnGraph_withLevel_andDebugType_andMode___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

- (void)enableDSPCaptureByType:(int64_t)a3 withGraph:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int64_t v12;
  id WeakRetained;
  void *v14;
  id v15;
  void *v16;
  int v17;
  void *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  int64_t v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  _BYTE v37[16];
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  if (a3)
  {
    if ((a3 & 1) != 0)
    {
      -[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:", CFSTR("EnableDSPCapture"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "valueForKey:", CFSTR("Level"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:](self, "enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:", v6, v8, -[ASDDSPStream getAudioDebugTypeWithDict:](self, "getAudioDebugTypeWithDict:", v7), -[ASDDSPStream getAudioCaptureRingBufferModeWithDict:](self, "getAudioCaptureRingBufferModeWithDict:", v7));

    }
    if ((a3 & 2) != 0)
    {
      -[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:", CFSTR("EnableDSPCaptureOnPluginDevice"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKey:", CFSTR("PluginDevice"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKey:", CFSTR("Level"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "valueForKey:", CFSTR("Boxes"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[ASDDSPStream getAudioDebugTypeWithDict:](self, "getAudioDebugTypeWithDict:", v9);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
        objc_msgSend(WeakRetained, "deviceUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v14;
        v40 = 2112;
        v41 = v10;
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "OwningDeviceUID: %@, tagetPluginDeviceUID: %@", buf, 0x16u);

      }
      v15 = objc_loadWeakRetained((id *)&self->_owningDevice);
      objc_msgSend(v15, "deviceUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isEqualToString:", v10);

      if (v17)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "name");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v39 = v18;
          v40 = 2112;
          v41 = v10;
          _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Enabling DSP capture on dsp graph: %@ within Plugin Device: %@", buf, 0x16u);

        }
        if (v11)
          v19 = -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:](self, "enableBasicDSPCaptureOnGraph:withLevel:andDebugType:", v6, v11, v12);
        else
          v19 = +[ASDDSPGraphUtilities startRecordingBoxes:inGraph:fromStream:toDirectory:withType:error:](ASDDSPGraphUtilities, "startRecordingBoxes:inGraph:fromStream:toDirectory:withType:error:", v36, v6, self, self->_DSPCaptureDirectory, v12, 0);
        if (v19)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "name");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v39 = v20;
            _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Successfully enabled DSP Capture on dsp graph: %@", buf, 0xCu);

          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:].cold.2(v21, (uint64_t)v37, v22);
        }
      }

    }
    if ((a3 & 4) != 0)
    {
      -[NSUserDefaults dictionaryForKey:](self->_defaults, "dictionaryForKey:", CFSTR("EnableDSPCaptureOnDSPGraph"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "valueForKey:", CFSTR("DSPGraph"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "valueForKey:", CFSTR("Level"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "valueForKey:", CFSTR("Boxes"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = -[ASDDSPStream getAudioDebugTypeWithDict:](self, "getAudioDebugTypeWithDict:", v23);
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "name");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v39 = v28;
        v40 = 2112;
        v41 = v24;
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DSP graph name: %@, targetGraphName: %@", buf, 0x16u);

      }
      objc_msgSend(v6, "name");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isEqualToString:", v24);

      if (v30)
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "name");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v39 = v31;
          _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Enabling DSP Capture on dsp graph: %@", buf, 0xCu);

        }
        if (v25)
          v32 = -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:](self, "enableBasicDSPCaptureOnGraph:withLevel:andDebugType:", v6, v25, v27);
        else
          v32 = +[ASDDSPGraphUtilities startRecordingBoxes:inGraph:fromStream:toDirectory:withType:error:](ASDDSPGraphUtilities, "startRecordingBoxes:inGraph:fromStream:toDirectory:withType:error:", v26, v6, self, self->_DSPCaptureDirectory, v27, 0);
        if (v32)
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v6, "name");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v39 = v33;
            _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "Successfully enabled DSP Capture on dsp graph: %@", buf, 0xCu);

          }
        }
        else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v6, "name");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          -[ASDDSPStream enableBasicDSPCaptureOnGraph:withLevel:andDebugType:andMode:].cold.2(v34, (uint64_t)buf, v35);
        }
      }

    }
  }
  else
  {
    +[ASDDSPGraphUtilities stopRecordingBoxesInGraph:](ASDDSPGraphUtilities, "stopRecordingBoxesInGraph:", v6);
  }

}

- (void)enableDSPFileInjectionOnGraph:(id)a3 withFormat:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint8_t v9[32];
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v10[0] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!+[ASDDSPGraphUtilities startInjectingBoxes:inGraph:error:](ASDDSPGraphUtilities, "startInjectingBoxes:inGraph:error:", v7, v5, 0)&& os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v5, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASDDSPStream enableDSPFileInjectionOnGraph:withFormat:].cold.1(v8, (uint64_t)v6, v9);
  }

}

- (BOOL)addClientDSP:(id)a3 withKey:(unint64_t)a4
{
  id v6;
  void *v7;
  NSObject *dspQueue;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v6 = a3;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "uninitialize");
    objc_msgSend(v7, "unconfigure");
    v23 = 0;
    v24 = &v23;
    v25 = 0x2020000000;
    dspQueue = self->_dspQueue;
    v26 = 0;
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __37__ASDDSPStream_addClientDSP_withKey___block_invoke;
    v19[3] = &unk_24DBCA248;
    v19[4] = self;
    v21 = &v23;
    v22 = a4;
    v20 = v7;
    dispatch_sync(dspQueue, v19);
    v9 = *((_BYTE *)v24 + 24) != 0;

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      -[ASDDSPStream addClientDSP:withKey:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    v9 = 0;
  }

  return v9;
}

void __37__ASDDSPStream_addClientDSP_withKey___block_invoke(_QWORD *a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[3];
  _QWORD *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v7[0] = MEMORY[0x24BDAC760];
  v7[2] = __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2;
  v7[3] = &unk_24DBCA248;
  v2 = (void *)a1[5];
  v7[4] = a1[4];
  v7[1] = 3221225472;
  v3 = v2;
  v4 = a1[7];
  v9 = a1[6];
  v10 = v4;
  v8 = v3;
  v11[0] = &off_24DBC9D70;
  v12 = v11;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v7);
  v5 = v12;
  if (v12 == v11)
  {
    v6 = 4;
    v5 = v11;
    goto LABEL_5;
  }
  if (v12)
  {
    v6 = 5;
LABEL_5:
    (*(void (**)(void))(*v5 + 8 * v6))();
  }

}

void __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2(uint64_t a1)
{
  int v2;
  id WeakRetained;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  std::__shared_weak_count *v44;
  unint64_t *p_shared_owners;
  unint64_t v46;
  void *v47;
  BOOL v48;
  void *v49;
  void *v50;
  void *v51;
  int v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  unsigned int *v57;
  unsigned int v58;
  uint64_t *v59;
  uint64_t v60;
  unsigned int v61;
  _QWORD *v62;
  unsigned int v63;
  unsigned int v64;
  uint64_t v65;
  _QWORD *v66;
  _QWORD *v67;
  unsigned int v69;
  unsigned int v70;
  uint64_t v71;
  _OWORD *v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  _BYTE *v76;
  uint64_t v77;
  uint64_t v78;
  std::__shared_weak_count *v79;
  unint64_t *v80;
  unint64_t v81;
  uint64_t v82;
  std::__shared_weak_count *v83;
  uint64_t v84[3];
  uint8_t buf[32];
  _BYTE v86[10];
  __int16 v87;
  uint64_t v88;
  uint64_t v89;

  v89 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "graphStructureIsValid:clientID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 280));
  objc_msgSend(WeakRetained, "samplingRate");
  v5 = v4;

  objc_msgSend(*(id *)(a1 + 32), "physicalFormat");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 32), "maximumFramesPerIOCycle");
  if (v5 <= 0.0)
  {
    v14 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v14)
      __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_3(v14, v15, v16, v17, v18, v19, v20, v21);
  }
  else if (v6)
  {
    v8 = v7;
    if (v7 <= 0)
    {
      v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v30)
        __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_2(v30, v31, v32, v33, v34, v35, v36, v37);
    }
    else if (v2)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(*(id *)(a1 + 40), "name");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "streamName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v9;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v10;
        _os_log_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "configuring graph %@ for stream %@", buf, 0x16u);

      }
      v11 = *(void **)(a1 + 40);
      objc_msgSend(v6, "sampleRate");
      objc_msgSend(v11, "setVariableSliceDuration:forSampleRate:", v8, (uint64_t)v12);
      objc_msgSend(*(id *)(a1 + 40), "configure");
      v13 = *(void **)(a1 + 40);
      if (v13)
      {
        objc_msgSend(v13, "graph");
      }
      else
      {
        v82 = 0;
        v83 = 0;
      }
      ASDDSPGraphHelper::ASDDSPGraphHelper(buf, &v82, *(_QWORD *)(a1 + 56));
      v44 = v83;
      if (v83)
      {
        p_shared_owners = (unint64_t *)&v83->__shared_owners_;
        do
          v46 = __ldaxr(p_shared_owners);
        while (__stlxr(v46 - 1, p_shared_owners));
        if (!v46)
        {
          ((void (*)(std::__shared_weak_count *))v44->__on_zero_shared)(v44);
          std::__shared_weak_count::__release_weak(v44);
        }
      }
      objc_msgSend(*(id *)(a1 + 32), "enableDSPCaptureByType:withGraph:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 344), *(_QWORD *)(a1 + 40));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "valueForKey:", CFSTR("EnableDSPFileInjectionOnDSPGraph"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      v48 = v47 == 0;

      if (!v48)
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "dictionaryForKey:", CFSTR("EnableDSPFileInjectionOnDSPGraph"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "valueForKey:", CFSTR("DSPGraph"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "name");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "isEqualToString:", v50);

        if (v52)
        {
          objc_msgSend(v49, "valueForKey:", CFSTR("InjectionFormat"));
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "enableDSPFileInjectionOnGraph:withFormat:", *(_QWORD *)(a1 + 40), v53);

        }
      }
      v54 = *(_QWORD *)(a1 + 32);
      if (*(_BYTE *)(v54 + 408))
      {
        objc_msgSend((id)v54, "_allocateStreamingResourcesForGraphHelper:", buf);
        v54 = *(_QWORD *)(a1 + 32);
      }
      v55 = *(_QWORD *)(v54 + 320);
      v56 = *(_QWORD *)(a1 + 56);
      v57 = (unsigned int *)(v55 + 48);
      do
        v58 = __ldaxr(v57);
      while (__stlxr(v58 + 1, v57));
      v59 = (uint64_t *)atomic_load((unint64_t *)(v55 + 40));
      if (v59)
      {
        caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v59, v56);
        if (v60)
        {
          do
            v61 = __ldaxr((unsigned int *)v60);
          while (__stlxr(v61 + 1, (unsigned int *)v60));
          v62 = *(_QWORD **)(v60 + 16);
          do
            v63 = __ldaxr(v57);
          while (__stlxr(v63 - 1, v57));
          do
            v64 = __ldaxr((unsigned int *)v60);
          while (__stlxr(v64 - 1, (unsigned int *)v60));
          caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::remove(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 320), *(_QWORD *)(a1 + 56));
          v65 = *(_QWORD *)(a1 + 32) + 296;
          v84[0] = (uint64_t)v84;
          v84[1] = (uint64_t)v84;
          v84[2] = 0;
          v66 = *(_QWORD **)(v65 + 8);
          if (v66 != (_QWORD *)v65)
          {
            do
            {
              v67 = (_QWORD *)v66[1];
              if (v66 + 2 == v62)
              {
                while (v67 != (_QWORD *)v65 && v67 + 2 == v62)
                  v67 = (_QWORD *)v67[1];
                std::list<ASDDSPGraphHelper>::splice((uint64_t)v84, v84, v65, v66, v67);
                if (v67 != (_QWORD *)v65)
                  v67 = (_QWORD *)v67[1];
              }
              v66 = v67;
            }
            while (v67 != (_QWORD *)v65);
          }
          std::__list_imp<ASDDSPGraphHelper>::clear(v84);
        }
        else
        {
          do
            v70 = __ldaxr(v57);
          while (__stlxr(v70 - 1, v57));
        }
      }
      else
      {
        do
          v69 = __ldaxr(v57);
        while (__stlxr(v69 - 1, v57));
      }
      v71 = *(_QWORD *)(a1 + 32);
      v72 = operator new(0x38uLL);
      v73 = *(_OWORD *)buf;
      v74 = *(_OWORD *)&buf[16];
      memset(buf, 0, sizeof(buf));
      v72[1] = v73;
      v72[2] = v74;
      *((_QWORD *)v72 + 6) = *(_QWORD *)v86;
      *((_QWORD *)v72 + 1) = v71 + 296;
      v75 = *(_QWORD *)(v71 + 296);
      *(_QWORD *)v72 = v75;
      *(_QWORD *)(v75 + 8) = v72;
      *(_QWORD *)(v71 + 296) = v72;
      ++*(_QWORD *)(v71 + 312);
      caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::_addOrReplace(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 320), *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 296) + 16, 0);
      if (objc_msgSend(*(id *)(a1 + 32), "keepGraphInitialized"))
        objc_msgSend(*(id *)(a1 + 40), "initialize");
      v76 = *(_BYTE **)(a1 + 32);
      if (!v76[408])
        objc_msgSend(v76, "_updateLatency");
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v77 = *(_QWORD *)&buf[24];
      *(_QWORD *)&buf[24] = 0;
      if (v77)
        (*(void (**)(uint64_t))(*(_QWORD *)v77 + 8))(v77);
      v78 = *(_QWORD *)&buf[16];
      *(_QWORD *)&buf[16] = 0;
      if (v78)
        (*(void (**)(uint64_t))(*(_QWORD *)v78 + 8))(v78);
      v79 = *(std::__shared_weak_count **)&buf[8];
      if (*(_QWORD *)&buf[8])
      {
        v80 = (unint64_t *)(*(_QWORD *)&buf[8] + 8);
        do
          v81 = __ldaxr(v80);
        while (__stlxr(v81 - 1, v80));
        if (!v81)
        {
          ((void (*)(std::__shared_weak_count *))v79->__on_zero_shared)(v79);
          std::__shared_weak_count::__release_weak(v79);
        }
      }
    }
    else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(*(id *)(a1 + 40), "name");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = objc_msgSend(*(id *)(a1 + 40), "numberOfInputs");
      v40 = objc_msgSend(*(id *)(a1 + 40), "numberOfOutputs");
      v41 = *(_QWORD *)(a1 + 32);
      v42 = *(_QWORD *)(v41 + 416);
      v43 = *(_QWORD *)(v41 + 424);
      *(_DWORD *)buf = 138413314;
      *(_QWORD *)&buf[4] = v38;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v39;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = v40;
      *(_WORD *)v86 = 2048;
      *(_QWORD *)&v86[2] = v42;
      v87 = 2048;
      v88 = v43;
      _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "%@ graph structure isn't valid. numGraphInputs = %ld, numGraphOutputs = %ld, numUnderlyingInputStreams = %ld, numUnderlyingOutputStreams = %ld", buf, 0x34u);

    }
  }
  else
  {
    v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v22)
      __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
  }

}

- (BOOL)removeClientDSPwithKey:(unint64_t)a3
{
  NSObject *dspQueue;
  char v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __39__ASDDSPStream_removeClientDSPwithKey___block_invoke;
  block[3] = &unk_24DBCA290;
  block[5] = &v7;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(dspQueue, block);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __39__ASDDSPStream_removeClientDSPwithKey___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned int v8;
  _QWORD *v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  unsigned int v15;
  unsigned int v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD v21[5];
  char v22;
  _DWORD v23[2];
  _BYTE v24[7];
  uint64_t v25[3];
  uint64_t *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1[4] + 320);
  v3 = a1[6];
  v4 = (unsigned int *)(v2 + 48);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  v6 = (uint64_t *)atomic_load((unint64_t *)(v2 + 40));
  if (!v6)
  {
    do
      v15 = __ldaxr(v4);
    while (__stlxr(v15 - 1, v4));
    goto LABEL_32;
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v6, v3);
  if (!v7)
  {
    do
      v16 = __ldaxr(v4);
    while (__stlxr(v16 - 1, v4));
    goto LABEL_32;
  }
  do
    v8 = __ldaxr((unsigned int *)v7);
  while (__stlxr(v8 + 1, (unsigned int *)v7));
  v9 = *(_QWORD **)(v7 + 16);
  do
    v10 = __ldaxr(v4);
  while (__stlxr(v10 - 1, v4));
  do
    v11 = __ldaxr((unsigned int *)v7);
  while (__stlxr(v11 - 1, (unsigned int *)v7));
  v12 = a1[4];
  if (*(_BYTE *)(v12 + 408))
  {
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __39__ASDDSPStream_removeClientDSPwithKey___block_invoke_2;
    v21[3] = &__block_descriptor_48_e5_v8__0l;
    v21[4] = v9;
    v22 = 1;
    v23[0] = *(_DWORD *)v24;
    *(_DWORD *)((char *)v23 + 3) = *(_DWORD *)&v24[3];
    v25[0] = (uint64_t)&off_24DBC9D70;
    v26 = v25;
    ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v21);
    v13 = v26;
    if (v26 == v25)
    {
      v14 = 4;
      v13 = v25;
    }
    else
    {
      if (!v26)
      {
LABEL_19:
        v12 = a1[4];
        goto LABEL_20;
      }
      v14 = 5;
    }
    (*(void (**)(void))(*v13 + 8 * v14))();
    goto LABEL_19;
  }
LABEL_20:
  caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::remove(*(_QWORD *)(v12 + 320), a1[6]);
  v17 = a1[4] + 296;
  v25[0] = (uint64_t)v25;
  v25[1] = (uint64_t)v25;
  v25[2] = 0;
  v18 = *(_QWORD **)(v17 + 8);
  if (v18 != (_QWORD *)v17)
  {
    do
    {
      v19 = (_QWORD *)v18[1];
      if (v18 + 2 == v9)
      {
        while (v19 != (_QWORD *)v17 && v19 + 2 == v9)
          v19 = (_QWORD *)v19[1];
        std::list<ASDDSPGraphHelper>::splice((uint64_t)v25, v25, v17, v18, v19);
        if (v19 != (_QWORD *)v17)
          v19 = (_QWORD *)v19[1];
      }
      v18 = v19;
    }
    while (v19 != (_QWORD *)v17);
  }
  std::__list_imp<ASDDSPGraphHelper>::clear(v25);
LABEL_32:
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = 1;
}

DSPGraph::Graph *__39__ASDDSPStream_removeClientDSPwithKey___block_invoke_2(uint64_t a1)
{
  return ASDDSPGraphHelper::deallocateStreamingResources(*(DSPGraph::Graph ***)(a1 + 32));
}

- (BOOL)graphStructureIsValid:(id)a3 clientID:(unint64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  unint64_t underlyingOutputStreamCount;
  BOOL v15;

  v6 = a3;
  v7 = v6;
  if (a4 == -1)
  {
    if (-[ASDStream direction](self, "direction") == 1768845428)
    {
      v11 = objc_msgSend(v7, "numberOfInputs");
      v12 = -[NSArray count](self->_underlyingStreams, "count");
      v10 = objc_msgSend(v7, "numberOfOutputs") == 1 && v11 == v12;
    }
    else
    {
      if (-[ASDStream direction](self, "direction") != 1869968496)
      {
        v15 = 1;
        goto LABEL_16;
      }
      v13 = objc_msgSend(v7, "numberOfOutputs");
      underlyingOutputStreamCount = self->_underlyingOutputStreamCount;
      v10 = objc_msgSend(v7, "numberOfInputs") == self->_underlyingInputStreamCount + 1
         && v13 == underlyingOutputStreamCount;
    }
  }
  else
  {
    v8 = objc_msgSend(v6, "numberOfInputs");
    v9 = objc_msgSend(v7, "numberOfOutputs");
    v10 = objc_msgSend(v7, "numberOfInputs") == 1 && v8 == v9;
  }
  v15 = v10;
LABEL_16:

  return v15;
}

- (void)suspendProcessing
{
  NSObject *dspQueue;
  _QWORD block[5];

  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __33__ASDDSPStream_suspendProcessing__block_invoke;
  block[3] = &unk_24DBC9F68;
  block[4] = self;
  dispatch_sync(dspQueue, block);
}

uint64_t __33__ASDDSPStream_suspendProcessing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_suspendProcessing");
}

- (void)_suspendProcessing
{
  ASDDSPStreamHelper *value;

  value = self->_streamHelper.__ptr_.__value_;
  if (value)
    ASDDSPStreamHelper::suspendProcessing(value);
}

- (void)resumeProcessing
{
  NSObject *dspQueue;
  _QWORD block[5];

  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__ASDDSPStream_resumeProcessing__block_invoke;
  block[3] = &unk_24DBC9F68;
  block[4] = self;
  dispatch_sync(dspQueue, block);
}

uint64_t __32__ASDDSPStream_resumeProcessing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resumeProcessing");
}

- (void)_resumeProcessing
{
  ASDDSPStreamHelper *value;

  value = self->_streamHelper.__ptr_.__value_;
  if (value)
    ASDDSPStreamHelper::resumeProcessing(value);
}

- (void)updateLatency
{
  NSObject *dspQueue;
  _QWORD block[5];

  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __29__ASDDSPStream_updateLatency__block_invoke;
  block[3] = &unk_24DBC9F68;
  block[4] = self;
  dispatch_sync(dspQueue, block);
}

uint64_t __29__ASDDSPStream_updateLatency__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateLatency");
}

- (void)_updateMaximumFramesPerIOCycle
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  self->_maximumFramesPerIOCycle = objc_msgSend(WeakRetained, "timestampPeriod");

}

- (int64_t)maximumFramesPerIOCycle
{
  NSObject *propertyQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  propertyQueue = self->_propertyQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __39__ASDDSPStream_maximumFramesPerIOCycle__block_invoke;
  v5[3] = &unk_24DBCA2B8;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(propertyQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__ASDDSPStream_maximumFramesPerIOCycle__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_updateMaximumFramesPerIOCycle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 360);
  return result;
}

- (void)_updateLatency
{
  __assert_rtn("providedGraph", "ASDDSPGraphHelper.h", 45, "mProvidedGraph");
}

uint64_t __30__ASDDSPStream__updateLatency__block_invoke(uint64_t a1)
{
  DSPGraph::Box *v2;
  unsigned int v3;
  uint64_t result;
  DSPGraph::Box *v5;

  v2 = (DSPGraph::Box *)DSPGraph::Graph::out(**(DSPGraph::Graph ***)(a1 + 32));
  v3 = DSPGraph::Box::totalLatencyInSamples(v2);
  result = *(unsigned int *)(a1 + 44);
  if (v3 > result)
  {
    v5 = (DSPGraph::Box *)DSPGraph::Graph::out(**(DSPGraph::Graph ***)(a1 + 32));
    return DSPGraph::Box::totalLatencyInSamples(v5);
  }
  return result;
}

uint64_t __30__ASDDSPStream__updateLatency__block_invoke_2(uint64_t a1)
{
  DSPGraph::Box *v2;
  unsigned int v3;
  uint64_t result;
  DSPGraph::Box *v5;

  v2 = (DSPGraph::Box *)DSPGraph::Graph::out(**(DSPGraph::Graph ***)(a1 + 32));
  v3 = DSPGraph::Box::totalLatencyInSamples(v2);
  result = *(unsigned int *)(a1 + 40);
  if (v3 > result)
  {
    v5 = (DSPGraph::Box *)DSPGraph::Graph::out(**(DSPGraph::Graph ***)(a1 + 32));
    return DSPGraph::Box::totalLatencyInSamples(v5);
  }
  return result;
}

- (BOOL)addHardwareDSP:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  v6 = objc_msgSend(WeakRetained, "isRunning");

  if (v6)
  {
    v7 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v7)
      -[ASDDSPStream addHardwareDSP:].cold.1(v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = 0;
  }
  else
  {
    v15 = -[ASDDSPStream addClientDSP:withKey:](self, "addClientDSP:withKey:", v4, -1);
  }

  return v15;
}

- (BOOL)removeHardwareDSP
{
  id WeakRetained;
  int v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  WeakRetained = objc_loadWeakRetained((id *)&self->_owningDevice);
  v4 = objc_msgSend(WeakRetained, "isRunning");

  if (!v4)
    return -[ASDDSPStream removeClientDSPwithKey:](self, "removeClientDSPwithKey:", -1);
  v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v5)
    -[ASDDSPStream removeHardwareDSP].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
  return 0;
}

- (BOOL)addClientDSP:(id)a3 forClient:(unsigned int)a4
{
  return -[ASDDSPStream addClientDSP:withKey:](self, "addClientDSP:withKey:", a3, a4);
}

- (BOOL)removeClientDSPForClient:(unsigned int)a3
{
  return -[ASDDSPStream removeClientDSPwithKey:](self, "removeClientDSPwithKey:", a3);
}

- (ASDDSPGraph)hardwareDSP
{
  NSObject *dspQueue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  dspQueue = self->_dspQueue;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __27__ASDDSPStream_hardwareDSP__block_invoke;
  v5[3] = &unk_24DBCA1D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(dspQueue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (ASDDSPGraph *)v3;
}

void __27__ASDDSPStream_hardwareDSP__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_hardwareDSP");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_hardwareDSP
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __28__ASDDSPStream__hardwareDSP__block_invoke;
  v3[3] = &unk_24DBCA320;
  v3[4] = self;
  ASDDSP::exceptionBarrier<objc_object *({block_pointer} {__strong})(void)>(v3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

ASDDSPGraph *__28__ASDDSPStream__hardwareDSP__block_invoke(uint64_t a1)
{
  uint64_t v1;
  unsigned int *v2;
  unsigned int v3;
  uint64_t *v4;
  uint64_t v5;
  unsigned int *v6;
  unsigned int v7;
  uint64_t *v8;
  unsigned int v9;
  ASDDSPGraph *v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  ASDDSPGraph *v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  ASDDSPGraph *v18;
  ASDDSPGraph *v19;
  unsigned int v20;
  unsigned int v21;
  unsigned int v22;
  uint64_t v24;
  std::__shared_weak_count *v25;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
  v2 = (unsigned int *)(v1 + 48);
  do
    v3 = __ldaxr(v2);
  while (__stlxr(v3 + 1, v2));
  v4 = (uint64_t *)atomic_load((unint64_t *)(v1 + 40));
  if (!v4)
  {
    do
      v21 = __ldaxr(v2);
    while (__stlxr(v21 - 1, v2));
    goto LABEL_24;
  }
  caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v4, -1);
  if (!v5)
  {
    do
      v22 = __ldaxr(v2);
    while (__stlxr(v22 - 1, v2));
LABEL_24:
    v19 = 0;
    return v19;
  }
  v6 = (unsigned int *)v5;
  do
    v7 = __ldaxr((unsigned int *)v5);
  while (__stlxr(v7 + 1, (unsigned int *)v5));
  v8 = *(uint64_t **)(v5 + 16);
  do
    v9 = __ldaxr(v2);
  while (__stlxr(v9 - 1, v2));
  v10 = [ASDDSPGraph alloc];
  if (!*v8)
    __assert_rtn("providedGraph", "ASDDSPGraphHelper.h", 45, "mProvidedGraph");
  v11 = (std::__shared_weak_count *)v8[1];
  v24 = *v8;
  v25 = v11;
  if (v11)
  {
    p_shared_owners = (unint64_t *)&v11->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  v14 = -[ASDDSPGraph initWithDSPGraph:](v10, "initWithDSPGraph:", &v24);
  v15 = v25;
  if (v25)
  {
    v16 = (unint64_t *)&v25->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = v14;
  v19 = v18;
  do
    v20 = __ldaxr(v6);
  while (__stlxr(v20 - 1, v6));

  return v19;
}

- (id)clientDSPForClient:(unsigned int)a3
{
  NSObject *dspQueue;
  id v4;
  _QWORD block[6];
  unsigned int v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy_;
  v12 = __Block_byref_object_dispose_;
  v13 = 0;
  dspQueue = self->_dspQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __35__ASDDSPStream_clientDSPForClient___block_invoke;
  block[3] = &unk_24DBCA348;
  v7 = a3;
  block[4] = self;
  block[5] = &v8;
  dispatch_sync(dspQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

_QWORD *__35__ASDDSPStream_clientDSPForClient___block_invoke(uint64_t a1)
{
  _QWORD *result;
  uint64_t v2;
  _QWORD v3[4];
  __int128 v4;
  int v5;
  _QWORD v6[3];
  _QWORD *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __35__ASDDSPStream_clientDSPForClient___block_invoke_2;
  v3[3] = &unk_24DBCA348;
  v5 = *(_DWORD *)(a1 + 48);
  v4 = *(_OWORD *)(a1 + 32);
  v6[0] = &off_24DBC9D70;
  v7 = v6;
  ASDDSP::exceptionBarrier<void({block_pointer} {__strong})(void)>(v3);
  result = v7;
  if (v7 == v6)
  {
    v2 = 4;
    result = v6;
  }
  else
  {
    if (!v7)
      return result;
    v2 = 5;
  }
  return (_QWORD *)(*(uint64_t (**)(void))(*result + 8 * v2))();
}

void __35__ASDDSPStream_clientDSPForClient___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;
  uint64_t *v6;
  uint64_t v7;
  unsigned int *v8;
  unsigned int v9;
  uint64_t *v10;
  unsigned int v11;
  ASDDSPGraph *v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  std::__shared_weak_count *v19;
  unint64_t *v20;
  unint64_t v21;
  unsigned int v22;
  uint64_t v23;
  std::__shared_weak_count *v24;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 320);
  v3 = *(unsigned int *)(a1 + 48);
  v4 = (unsigned int *)(v2 + 48);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 + 1, v4));
  v6 = (uint64_t *)atomic_load((unint64_t *)(v2 + 40));
  if (!v6)
    goto LABEL_19;
  caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>::table_impl::findSlotForKey(v6, v3);
  if (!v7)
    goto LABEL_19;
  v8 = (unsigned int *)v7;
  do
    v9 = __ldaxr((unsigned int *)v7);
  while (__stlxr(v9 + 1, (unsigned int *)v7));
  v10 = *(uint64_t **)(v7 + 16);
  do
    v11 = __ldaxr(v4);
  while (__stlxr(v11 - 1, v4));
  v12 = [ASDDSPGraph alloc];
  if (!*v10)
    __assert_rtn("providedGraph", "ASDDSPGraphHelper.h", 45, "mProvidedGraph");
  v13 = (std::__shared_weak_count *)v10[1];
  v23 = *v10;
  v24 = v13;
  if (v13)
  {
    p_shared_owners = (unint64_t *)&v13->__shared_owners_;
    do
      v15 = __ldxr(p_shared_owners);
    while (__stxr(v15 + 1, p_shared_owners));
  }
  v16 = -[ASDDSPGraph initWithDSPGraph:](v12, "initWithDSPGraph:", &v23);
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v18 = *(void **)(v17 + 40);
  *(_QWORD *)(v17 + 40) = v16;

  v19 = v24;
  if (v24)
  {
    v20 = (unint64_t *)&v24->__shared_owners_;
    do
      v21 = __ldaxr(v20);
    while (__stlxr(v21 - 1, v20));
    v4 = v8;
    if (v21)
      goto LABEL_19;
    ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
    std::__shared_weak_count::__release_weak(v19);
  }
  v4 = v8;
  do
LABEL_19:
    v22 = __ldaxr(v4);
  while (__stlxr(v22 - 1, v4));
}

- (id)readInputBlock
{
  void *v2;
  _QWORD v4[5];
  _QWORD v5[4];

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = &self->_streamHelper;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __30__ASDDSPStream_readInputBlock__block_invoke;
  v4[3] = &unk_24DBCA370;
  v4[4] = v5;
  v2 = (void *)MEMORY[0x220733498](v4, a2);
  _Block_object_dispose(v5, 8);
  return v2;
}

uint64_t __30__ASDDSPStream_readInputBlock__block_invoke(uint64_t a1, uint64_t a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5, uint64_t a6)
{
  ASDDSPStreamHelper *v6;

  v6 = **(ASDDSPStreamHelper ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!v6)
    __30__ASDDSPStream_readInputBlock__block_invoke_cold_1();
  return ASDDSPStreamHelper::readInput(v6, a2, a3, a4, a5, a6);
}

- (id)processOutputBlock
{
  void *v2;
  _QWORD v4[5];
  _QWORD v5[4];

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = &self->_streamHelper;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __34__ASDDSPStream_processOutputBlock__block_invoke;
  v4[3] = &unk_24DBCA370;
  v4[4] = v5;
  v2 = (void *)MEMORY[0x220733498](v4, a2);
  _Block_object_dispose(v5, 8);
  return v2;
}

uint64_t __34__ASDDSPStream_processOutputBlock__block_invoke(uint64_t a1, int a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5, unsigned int a6)
{
  ASDDSPStreamHelper *v6;

  v6 = **(ASDDSPStreamHelper ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!v6)
    __34__ASDDSPStream_processOutputBlock__block_invoke_cold_1();
  return ASDDSPStreamHelper::processOutput(v6, a2, a3, a4, a5, a6);
}

- (id)writeMixBlock
{
  void *v2;
  _QWORD v4[5];
  _QWORD v5[4];

  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v5[3] = &self->_streamHelper;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __29__ASDDSPStream_writeMixBlock__block_invoke;
  v4[3] = &unk_24DBCA370;
  v4[4] = v5;
  v2 = (void *)MEMORY[0x220733498](v4, a2);
  _Block_object_dispose(v5, 8);
  return v2;
}

uint64_t __29__ASDDSPStream_writeMixBlock__block_invoke(uint64_t a1, uint64_t a2, const AudioServerPlugInIOCycleInfo *a3, void *a4, void *a5, uint64_t a6)
{
  ASDDSPStreamHelper *v6;

  v6 = **(ASDDSPStreamHelper ***)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if (!v6)
    __29__ASDDSPStream_writeMixBlock__block_invoke_cold_1();
  return ASDDSPStreamHelper::writeMix(v6, a2, a3, a4, a5, a6);
}

- (id)diagnosticDescriptionWithIndent:(id)a3 walkTree:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v4 = a4;
  v23 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v21.receiver = self;
  v21.super_class = (Class)ASDDSPStream;
  -[ASDStream diagnosticDescriptionWithIndent:walkTree:](&v21, sel_diagnosticDescriptionWithIndent_walkTree_, v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "appendFormat:", CFSTR("%@|    DSP Configuration:\n"), v6);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[ASDDSPStream currentDSPConfiguration](self, "currentDSPConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "hardwareDSP");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dspItems");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v18;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v18 != v12)
          objc_enumerationMutation(v10);
        v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v13);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v14, "path");
          v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v7, "appendFormat:", CFSTR("%@|         - Graph: %s\n"), v6, objc_msgSend(v15, "UTF8String"));
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v14, "path");
            v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|         - Strip: %s\n"), v6, objc_msgSend(v15, "UTF8String"));
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_13;
            objc_msgSend(v14, "path");
            v15 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            objc_msgSend(v7, "appendFormat:", CFSTR("%@|         - Property strip: %s\n"), v6, objc_msgSend(v15, "UTF8String"));
          }
        }

LABEL_13:
        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    }
    while (v11);
  }

  return v7;
}

- (id)driverClassName
{
  return CFSTR("DSPAudioStream");
}

- (void)dealloc
{
  NSObject *mHUPSource;
  OS_dispatch_source *v4;
  objc_super v5;

  mHUPSource = self->mHUPSource;
  if (mHUPSource)
  {
    dispatch_source_cancel(mHUPSource);
    v4 = self->mHUPSource;
    self->mHUPSource = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)ASDDSPStream;
  -[ASDObject dealloc](&v5, sel_dealloc);
}

- (void)setBypassMode:(BOOL)a3
{
  ASDDSPStreamHelper *value;

  self->_bypassMode = a3;
  value = self->_streamHelper.__ptr_.__value_;
  if (value)
    ASDDSPStreamHelper::setBypassGraphMode(value, a3);
}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (unint64_t)underlyingInputStreamCount
{
  return self->_underlyingInputStreamCount;
}

- (void)setUnderlyingInputStreamCount:(unint64_t)a3
{
  self->_underlyingInputStreamCount = a3;
}

- (unint64_t)underlyingOutputStreamCount
{
  return self->_underlyingOutputStreamCount;
}

- (void)setUnderlyingOutputStreamCount:(unint64_t)a3
{
  self->_underlyingOutputStreamCount = a3;
}

- (ASDStreamDSPConfiguration)currentDSPConfiguration
{
  return self->_currentDSPConfiguration;
}

- (void)setCurrentDSPConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_currentDSPConfiguration, a3);
}

- (BOOL)keepGraphInitialized
{
  return self->_keepGraphInitialized;
}

- (void)setKeepGraphInitialized:(BOOL)a3
{
  self->_keepGraphInitialized = a3;
}

- (BOOL)bypassMode
{
  return self->_bypassMode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentDSPConfiguration, 0);
  objc_storeStrong((id *)&self->mHUPSource, 0);
  objc_storeStrong((id *)&self->_underlyingStreams, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_DSPCaptureDirectory, 0);
  objc_storeStrong((id *)&self->_propertyQueue, 0);
  objc_storeStrong((id *)&self->_dspQueue, 0);
  std::unique_ptr<caulk::concurrent::guarded_lookup_hash_table<unsigned long long,ASDDSPGraphHelper *,(caulk::concurrent::guarded_lookup_hash_table_options)2,std::function<unsigned int ()(unsigned long long)>>>::reset[abi:ne180100]((uint64_t *)&self->_clientToGraphMap, 0);
  std::__list_imp<ASDDSPGraphHelper>::clear((uint64_t *)&self->_graphHelpers);
  std::unique_ptr<ASDDSPStreamHelper>::reset[abi:ne180100](&self->_streamHelper.__ptr_.__value_, 0);
  objc_destroyWeak((id *)&self->_owningDevice);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 36) = 0;
  *((_QWORD *)self + 37) = (char *)self + 296;
  *((_QWORD *)self + 38) = (char *)self + 296;
  *((_QWORD *)self + 39) = 0;
  *((_QWORD *)self + 40) = 0;
  return self;
}

- (void)_allocateStreamingResourcesForGraphHelper:.cold.1()
{
  __assert_rtn("-[ASDDSPStream _allocateStreamingResourcesForGraphHelper:]", "ASDDSPStream.mm", 464, "graphHelper");
}

- (void)enableBasicDSPCaptureOnGraph:(uint64_t)a3 withLevel:(uint64_t)a4 andDebugType:(uint64_t)a5 andMode:(uint64_t)a6 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Level must be specified to enable basic DSP Capture", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)enableBasicDSPCaptureOnGraph:(uint64_t)a3 withLevel:andDebugType:andMode:.cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_6_1(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Failed to enable DSP Capture on dsp graph: %@", (uint8_t *)a2);

  OUTLINED_FUNCTION_7_1();
}

- (void)enableBasicDSPCaptureOnGraph:(uint64_t)a3 withLevel:(uint64_t)a4 andDebugType:(uint64_t)a5 andMode:(uint64_t)a6 .cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "DSP Capture Level given was not presented!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)enableDSPFileInjectionOnGraph:(uint8_t *)buf withFormat:.cold.1(void *a1, uint64_t a2, uint8_t *buf)
{
  *(_DWORD *)buf = 138412546;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(_QWORD *)(buf + 14) = a2;
  _os_log_error_impl(&dword_219C60000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Failed to enable DSP file injection on dsp graph: %@, with format %@", buf, 0x16u);

  OUTLINED_FUNCTION_7_1();
}

- (void)addClientDSP:(uint64_t)a3 withKey:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Must provide a graph", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Stream must have a physical format", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "MaximumFramesPerIOCycle must be positive", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __37__ASDDSPStream_addClientDSP_withKey___block_invoke_2_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Owning device must have a positive sampling rate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)addHardwareDSP:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Adding hardware DSP while IO is running is not supported!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

- (void)removeHardwareDSP
{
  OUTLINED_FUNCTION_9(&dword_219C60000, MEMORY[0x24BDACB70], a3, "Removing hardware DSP while IO is running is not supported!", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_8();
}

void __30__ASDDSPStream_readInputBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDDSPStream readInputBlock]_block_invoke", "ASDDSPStream.mm", 1048, "*streamHelper");
}

void __34__ASDDSPStream_processOutputBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDDSPStream processOutputBlock]_block_invoke", "ASDDSPStream.mm", 1060, "*streamHelper");
}

void __29__ASDDSPStream_writeMixBlock__block_invoke_cold_1()
{
  __assert_rtn("-[ASDDSPStream writeMixBlock]_block_invoke", "ASDDSPStream.mm", 1072, "*streamHelper");
}

@end
