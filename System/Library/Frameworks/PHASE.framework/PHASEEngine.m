@implementation PHASEEngine

- (void)implementation
{
  return self->_impl.__ptr_.__value_;
}

- (PHASEEngine)init
{
  -[PHASEEngine doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

+ (PHASEEngine)new
{
  objc_msgSend(a1, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (PHASEEngine)initWithSampleRate:(double)a3 updateMode:(int64_t)a4
{
  PHASEEngine *v4;
  PHASEEngine *v5;
  PHASEEngine *v6;

  v4 = -[PHASEEngine initWithUpdateMode:](self, "initWithUpdateMode:", a4, a3);
  v5 = v4;
  if (v4)
    v6 = v4;

  return v5;
}

- (PHASEEngine)initWithUpdateMode:(PHASEUpdateMode)updateMode
{
  PHASEEngine *v4;
  PHASEEngine *v5;
  PHASEEngine *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PHASEEngine;
  v4 = -[PHASEEngine init](&v8, sel_init);
  if (v4)
  {
    GetDefaultClientEngineMode();
    if (-[PHASEEngine initInternalWithUpdateMode:engineMode:platform:spatialMode:](v4, "initInternalWithUpdateMode:engineMode:platform:spatialMode:", updateMode, 0, 0, 0))
    {
      v5 = v4;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  return v6;
}

- (PHASEEngine)initWithEngineMode:(int64_t)a3 updateMode:(int64_t)a4
{
  PHASEEngine *v6;
  PHASEEngine *v7;
  NSObject *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v6 = self;
  v14 = *MEMORY[0x24BDAC8D0];
  if (Phase::CurrentProcessCanSelectEngineMode(void)::onceToken != -1)
    dispatch_once(&Phase::CurrentProcessCanSelectEngineMode(void)::onceToken, &__block_literal_global_5);
  if (Phase::CurrentProcessCanSelectEngineMode(void)::currentProcessCanSelectEngineMode)
  {
    v6 = -[PHASEEngine initWithUpdateMode:engineMode:](v6, "initWithUpdateMode:engineMode:", a4, a3);
    v7 = v6;
  }
  else
  {
    v8 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 136315394;
      v11 = "PHASEEngine.mm";
      v12 = 1024;
      v13 = 550;
      _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_ERROR, "%25s:%-5d Insufficient permissions to use initWithEngineMode:engineMode:updateMode.", (uint8_t *)&v10, 0x12u);
    }
    v7 = 0;
  }

  return v7;
}

- (PHASEEngine)initWithUpdateMode:(int64_t)a3 spatialMode:(int64_t)a4
{
  PHASEEngine *v6;
  PHASEEngine *v7;
  PHASEEngine *v8;
  PHASEEngine *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHASEEngine;
  v6 = -[PHASEEngine init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    if (-[PHASEEngine initInternalWithUpdateMode:engineMode:platform:spatialMode:](v6, "initInternalWithUpdateMode:engineMode:platform:spatialMode:", a3, 0, 0, a4))
    {
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (BOOL)initInternalWithUpdateMode:(int64_t)a3 engineMode:(int64_t)a4 platform:(id)a5 spatialMode:(int64_t)a6
{
  id v10;
  void *v11;
  double v12;
  double v13;
  PHASEAssetRegistry *v14;
  PHASEAssetRegistry *assetRegistry;
  NSMutableArray *v16;
  NSMutableArray *internalSoundEvents;
  NSMutableDictionary *v18;
  NSMutableDictionary *groups;
  PHASETapRegistry *v20;
  PHASETapRegistry *tapRegistry;
  PHASEEngineImpl *v22;
  std::chrono::steady_clock::time_point v23;
  float *v24;
  BOOL *v25;
  NSUUID *v26;
  NSUUID *sceneRoomUUID;
  PHASETapInterfaceImpl *tapInterfaceImpl;
  uint64_t v29;
  PHASETapInterfaceImpl *v30;
  PHASETapInterfaceImpl *v31;
  NSObject *v32;
  const char *v33;
  _BYTE v35[18];
  __int16 v36;
  PHASEEngine *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  double v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v10 = a5;
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "sampleRate");
    v13 = v12;
  }
  else
  {
    v13 = 48000.0;
  }
  self->_sampleRate = v13;
  *(_OWORD *)&self->_defaultPrivateReverbPreset = xmmword_216739CE0;
  self->_unitsPerMeter = 1.0;
  v14 = -[PHASEAssetRegistry initWithEngine:]([PHASEAssetRegistry alloc], "initWithEngine:", self);
  assetRegistry = self->_assetRegistry;
  self->_assetRegistry = v14;

  v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  internalSoundEvents = self->_internalSoundEvents;
  self->_internalSoundEvents = v16;

  v18 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  groups = self->_groups;
  self->_groups = v18;

  v20 = -[PHASETapRegistry initWithEngine:]([PHASETapRegistry alloc], "initWithEngine:", self);
  tapRegistry = self->_tapRegistry;
  self->_tapRegistry = v20;

  v22 = (PHASEEngineImpl *)operator new();
  PHASEEngineImpl::PHASEEngineImpl((uint64_t)v22, self, a3, a4, v11, a6, 48000.0);
  std::unique_ptr<PHASEEngineImpl>::reset[abi:ne180100](&self->_impl.__ptr_.__value_, v22);
  v23.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  self->_stopWatch.mStart.__d_.__rep_ = v23.__d_.__rep_;
  self->_roomAcousticTrackingMode = 0;
  v24 = (float *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v23.__d_.__rep_);
  self->_roomAcousticMaximumReverbTime = v24[101];
  v25 = (BOOL *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v24);
  self->_roomAcousticSoftLimiting = v25[508];
  self->_roomAcousticSmoothing = *((float *)Phase::SpatialModeler::TRAP::TP((Phase::SpatialModeler::TRAP *)v25) + 102);
  *(_OWORD *)&self[1].super.isa = xmmword_2166F7280;
  self->_spaceBlendTargetPreset = 1917742958;
  self->_spaceBlendLevel = 0.0;
  self->_sceneClassification = 1935886702;
  *(_QWORD *)v35 = 0;
  *(_QWORD *)&v35[8] = 0;
  v26 = (NSUUID *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDBytes:", v35);
  sceneRoomUUID = self->_sceneRoomUUID;
  self->_sceneRoomUUID = v26;

  self->_maxGainDbSpl = 100.0;
  self->_unitsPerSecond = 1.0;
  *(_OWORD *)&self->_spatialHint = xmmword_216739CF0;
  tapInterfaceImpl = self->_tapInterfaceImpl;
  self->_balance = 1.0;
  self->_tapInterfaceImpl = 0;

  if (v11)
  {
    v29 = objc_opt_respondsToSelector();
    if ((v29 & 1) != 0)
    {
      v30 = -[PHASETapInterfaceImpl initWithTapRegistry:]([PHASETapInterfaceImpl alloc], "initWithTapRegistry:", self->_tapRegistry);
      v31 = self->_tapInterfaceImpl;
      self->_tapInterfaceImpl = v30;

      v29 = objc_msgSend(v11, "registerTapInterface:", self->_tapInterfaceImpl);
    }
  }
  v32 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v29) + 432));
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)a4 > 3)
      v33 = "unknown";
    else
      v33 = off_24D57F2A8[a4];
    *(_DWORD *)v35 = 136316418;
    *(_QWORD *)&v35[4] = "PHASEEngine.mm";
    *(_WORD *)&v35[12] = 1024;
    *(_DWORD *)&v35[14] = 629;
    v36 = 2048;
    v37 = self;
    v38 = 2080;
    v39 = v33;
    v40 = 2048;
    v41 = v13;
    v42 = 2048;
    v43 = v11;
    _os_log_impl(&dword_2164CC000, v32, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: created with mode %s, sr %.f Hz, platform@%p", v35, 0x3Au);
  }

  return 1;
}

- (PHASEEngine)initWithPlatform:(id)a3
{
  id v4;
  PHASEEngine *v5;
  PHASEEngine *v6;
  PHASEEngine *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PHASEEngine;
  v5 = -[PHASEEngine init](&v9, sel_init);
  if (v5)
  {
    GetDefaultClientEngineMode();
    if (-[PHASEEngine initInternalWithUpdateMode:engineMode:platform:spatialMode:](v5, "initInternalWithUpdateMode:engineMode:platform:spatialMode:", 0, 0, v4, 0))
    {
      v6 = v5;
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  return v7;
}

- (PHASEEngine)initWithUpdateMode:(int64_t)a3 engineMode:(int64_t)a4
{
  PHASEEngine *v6;
  PHASEEngine *v7;
  PHASEEngine *v8;
  PHASEEngine *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHASEEngine;
  v6 = -[PHASEEngine init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    if (-[PHASEEngine initInternalWithUpdateMode:engineMode:platform:spatialMode:](v6, "initInternalWithUpdateMode:engineMode:platform:spatialMode:", a3, a4, 0, 0))
    {
      v8 = v7;
    }
    else
    {
      v8 = 0;
    }
  }
  else
  {
    v8 = 0;
  }
  v9 = v8;

  return v9;
}

- (PHASEEngine)initWithUpdateMode:(int64_t)a3 engineMode:(int64_t)a4 platform:(id)a5
{
  id v8;
  PHASEEngine *v9;
  PHASEEngine *v10;
  PHASEEngine *v11;
  PHASEEngine *v12;
  objc_super v14;

  v8 = a5;
  v14.receiver = self;
  v14.super_class = (Class)PHASEEngine;
  v9 = -[PHASEEngine init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    if (-[PHASEEngine initInternalWithUpdateMode:engineMode:platform:spatialMode:](v9, "initInternalWithUpdateMode:engineMode:platform:spatialMode:", a3, a4, v8, 0))
    {
      v11 = v10;
    }
    else
    {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  v12 = v11;

  return v12;
}

- (void)destroy
{
  PHASEEngine *v2;
  Phase::Logger *v3;
  NSObject *v4;
  PHASEEngineImpl *value;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  PHASEEngine *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  v3 = (Phase::Logger *)objc_sync_enter(v2);
  v4 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v3) + 432));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315650;
    v15 = "PHASEEngine.mm";
    v16 = 1024;
    v17 = 683;
    v18 = 2048;
    v19 = v2;
    _os_log_impl(&dword_2164CC000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: PHASEEngine destroy", (uint8_t *)&v14, 0x1Cu);
  }
  -[PHASEEngine stop](v2, "stop");
  value = v2->_impl.__ptr_.__value_;
  if (value)
  {
    v6 = *((id *)value + 65);
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "registerIOBlock:", 0);
      objc_msgSend(v7, "registerOverloadNotification:", 0);
      objc_msgSend(v7, "registerRouteChangeNotification:", 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "registerTapInterface:", 0);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v7, "sessionInterface");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8 == 0;

        if (!v9)
        {
          objc_msgSend(v7, "sessionInterface");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "registerActivateAudioSessionBlock:", 0);
          objc_msgSend(v10, "registerFadeClientsInAudioSessionBlock:", 0);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "registerMuteInputClientsInAudioSessionBlock:", 0);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_msgSend(v10, "sessionVolumeInterface");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11 == 0;

            if (!v12)
            {
              objc_msgSend(v10, "sessionVolumeInterface");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "registerVolumeChangedNotificationBlock:", 0);

            }
          }

        }
      }
    }

  }
  -[PHASEAssetRegistry removeAll](v2->_assetRegistry, "removeAll");
  std::unique_ptr<PHASEEngineImpl>::reset[abi:ne180100](&v2->_impl.__ptr_.__value_, 0);
  objc_sync_exit(v2);

}

- (void)dealloc
{
  PHASEEngine *v2;
  objc_super v3;

  v2 = self;
  objc_sync_enter(v2);
  -[PHASEEngine destroy](v2, "destroy");
  objc_sync_exit(v2);

  v3.receiver = v2;
  v3.super_class = (Class)PHASEEngine;
  -[PHASEEngine dealloc](&v3, sel_dealloc);
}

- (BOOL)startAndReturnError:(NSError *)error
{
  PHASEEngine *v4;
  Phase::Logger *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v10;
  const char *v11;
  __int16 v12;
  int v13;
  __int16 v14;
  PHASEEngine *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  v5 = (Phase::Logger *)objc_sync_enter(v4);
  v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v5) + 432));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315650;
    v11 = "PHASEEngine.mm";
    v12 = 1024;
    v13 = 743;
    v14 = 2048;
    v15 = v4;
    _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: PHASEEngine start", (uint8_t *)&v10, 0x1Cu);
  }
  v4->_stopWatch.mStart.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  PHASEEngineImpl::Start(v4->_impl.__ptr_.__value_, 60.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (error)
    *error = (NSError *)objc_retainAutorelease(v7);

  objc_sync_exit(v4);
  return v8 == 0;
}

- (void)pause
{
  PHASEEngine *v2;
  Phase::Logger *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  int v8;
  __int16 v9;
  PHASEEngine *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  v3 = (Phase::Logger *)objc_sync_enter(v2);
  v4 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v3) + 432));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315650;
    v6 = "PHASEEngine.mm";
    v7 = 1024;
    v8 = 760;
    v9 = 2048;
    v10 = v2;
    _os_log_impl(&dword_2164CC000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: PHASEEngine pause", (uint8_t *)&v5, 0x1Cu);
  }
  PHASEEngineImpl::Pause(v2->_impl.__ptr_.__value_);
  objc_sync_exit(v2);

}

- (void)stop
{
  PHASEEngine *v2;
  Phase::Logger *v3;
  NSObject *v4;
  PHASEEngineImpl *value;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  PHASEEngine *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = self;
  v3 = (Phase::Logger *)objc_sync_enter(v2);
  v4 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v3) + 432));
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "PHASEEngine.mm";
    v8 = 1024;
    v9 = 770;
    v10 = 2048;
    v11 = v2;
    _os_log_impl(&dword_2164CC000, v4, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: PHASEEngine stop", (uint8_t *)&v6, 0x1Cu);
  }
  value = v2->_impl.__ptr_.__value_;
  if (value)
    PHASEEngineImpl::Stop(value);
  objc_sync_exit(v2);

}

- (int64_t)engineMode
{
  PHASEEngine *v2;
  int64_t v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = *((_QWORD *)v2->_impl.__ptr_.__value_ + 2);
  objc_sync_exit(v2);

  return v3;
}

- (PHASERenderingState)renderingState
{
  PHASEEngine *v2;
  PHASERenderingState v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = atomic_load((unint64_t *)v2->_impl.__ptr_.__value_ + 3);
  objc_sync_exit(v2);

  return v3;
}

- (PHASEObject)rootObject
{
  PHASEObject *rootObject;
  PHASERootObject *v4;
  PHASEObject *v5;

  rootObject = self->_rootObject;
  if (!rootObject)
  {
    v4 = -[PHASERootObject initWithEngine:]([PHASERootObject alloc], "initWithEngine:", self);
    v5 = self->_rootObject;
    self->_rootObject = &v4->super;

    rootObject = self->_rootObject;
  }
  return rootObject;
}

- (PHASEMedium)defaultMedium
{
  PHASEMedium *defaultMedium;
  PHASEMedium *v4;
  PHASEMedium *v5;

  defaultMedium = self->_defaultMedium;
  if (!defaultMedium)
  {
    v4 = -[PHASEMedium initWithEngine:preset:]([PHASEMedium alloc], "initWithEngine:preset:", self, 1835286898);
    v5 = self->_defaultMedium;
    self->_defaultMedium = v4;

    -[PHASEMedium setDefault](self->_defaultMedium, "setDefault");
    defaultMedium = self->_defaultMedium;
  }
  return defaultMedium;
}

- (void)setDefaultMedium:(PHASEMedium *)defaultMedium
{
  PHASEMedium *v4;
  NSObject *v5;
  PHASEMedium *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  PHASEEngine *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = defaultMedium;
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v4) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "PHASEEngine.mm";
    v9 = 1024;
    v10 = 817;
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setDefaultMedium", (uint8_t *)&v7, 0x1Cu);
  }
  -[PHASEMedium setDefault](v4, "setDefault");
  v6 = self->_defaultMedium;
  self->_defaultMedium = v4;

}

- (PHASEReverbPreset)defaultReverbPreset
{
  return self->_defaultPrivateReverbPreset;
}

- (void)setDefaultReverbPreset:(PHASEReverbPreset)defaultReverbPreset
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  PHASEEngine *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "PHASEEngine.mm";
    v8 = 1024;
    v9 = 830;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setDefaultReverbPreset", (uint8_t *)&v6, 0x1Cu);
  }
  -[PHASEEngine setDefaultPrivateReverbPreset:](self, "setDefaultPrivateReverbPreset:", defaultReverbPreset);
}

- (void)setOutputSpatializationMode:(PHASESpatializationMode)outputSpatializationMode
{
  PHASEEngine *v4;
  Phase::Logger *v5;
  NSObject *v6;
  const char *v7;
  Phase::Logger *v8;
  NSObject *v9;
  uint64_t v10;
  unint64_t SpatializerForConfig;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  PHASEEngine *v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = self;
  v5 = (Phase::Logger *)objc_sync_enter(v4);
  v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v5) + 432));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    if ((unint64_t)outputSpatializationMode > PHASESpatializationModeAlwaysUseChannelBased)
      v7 = "unknown";
    else
      v7 = off_24D57F2C8[outputSpatializationMode];
    v12 = 136315906;
    v13 = "PHASEEngine.mm";
    v14 = 1024;
    v15 = 840;
    v16 = 2048;
    v17 = v4;
    v18 = 2080;
    v19 = v7;
    _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setOutputSpatializationMode %s", (uint8_t *)&v12, 0x26u);
  }
  v8 = -[PHASEEngine engineMode](v4, "engineMode");
  if (v8)
  {
    v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v8) + 432));
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v12 = 136315394;
      v13 = "PHASEEngine.mm";
      v14 = 1024;
      v15 = 846;
      _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_ERROR, "%25s:%-5d setOverrideOutputSpatializationMode: Cannot be called when running Client/Server mode.", (uint8_t *)&v12, 0x12u);
    }
  }
  else
  {
    v10 = Phase::Controller::TaskManager::GetService<Phase::Controller::SpatializerManager>((Phase::Logger *)((char *)v4->_impl.__ptr_.__value_ + 48), 9);
    if (v10)
    {
      if (outputSpatializationMode == PHASESpatializationModeAutomatic)
        -[PHASEEngine engineMode](v4, "engineMode");
      *(_QWORD *)(v10 + 72) = outputSpatializationMode;
      SpatializerForConfig = Phase::Controller::SpatializerManager::GetSpatializerForConfig(outputSpatializationMode, *(_DWORD *)(v10 + 40), (unsigned int **)(v10 + 48));
      Phase::Controller::SpatializerManager::SetActiveSpatializer((Phase::Controller::SpatializerManager *)v10, SpatializerForConfig);
      v4->_outputSpatializationMode = outputSpatializationMode;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("PHASE system initialization failure."), CFSTR("SpatializerManager is unavailable"));
    }
  }
  objc_sync_exit(v4);

}

- (void)setOverrideOutputSpatializationMode:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  PHASEEngine *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "PHASEEngine.mm";
    v8 = 1024;
    v9 = 875;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setOverrideOutputSpatializationMode", (uint8_t *)&v6, 0x1Cu);
  }
  -[PHASEEngine setOutputSpatializationMode:](self, "setOutputSpatializationMode:", a3);
}

- (PHASESpatializationMode)outputSpatializationMode
{
  return self->_outputSpatializationMode;
}

- (int64_t)overrideOutputSpatializationMode
{
  return self->_outputSpatializationMode;
}

- (BOOL)setHeadphoneHRIRFile:(id)a3 error:(id *)a4
{
  NSURL *v6;
  PHASEEngine *v7;
  Phase::Logger *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  Phase::Logger *v13;
  NSObject *v14;
  PHASEEngine *v15;
  void *v16;
  BOOL v17;
  Phase::Controller::SpatializerManager *v19;
  uint64_t v20;
  void *v21;
  Phase::Logger *v22;
  NSObject *v23;
  PHASEEngine *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  PHASEEngine *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v6 = (NSURL *)a3;
  v7 = self;
  v8 = (Phase::Logger *)objc_sync_enter(v7);
  v9 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v8) + 432));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v30 = "PHASEEngine.mm";
    v31 = 1024;
    v32 = 898;
    v33 = 2048;
    v34 = v7;
    _os_log_impl(&dword_2164CC000, v9, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setHeadphoneHRIRFile", buf, 0x1Cu);
  }
  if (a4)
    *a4 = 0;
  if (-[PHASEEngine engineMode](v7, "engineMode"))
  {
    v10 = *MEMORY[0x24BDD0FC8];
    v27 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("setHeadphoneHRIRFile: Cannot be called when running Client/Server mode."));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v13)
                                                                                        + 432)));
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v12, "objectForKeyedSubscript:", v10);
      v15 = (PHASEEngine *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v30 = "PHASEEngine.mm";
      v31 = 1024;
      v32 = 912;
      v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_2164CC000, v14, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

    }
    if (!a4)
      goto LABEL_11;
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346913633, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v19 = (Phase::Controller::SpatializerManager *)Phase::Controller::TaskManager::GetService<Phase::Controller::SpatializerManager>((Phase::Logger *)((char *)v7->_impl.__ptr_.__value_ + 48), 9);
  if (!v19)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("PHASE system initialization failure."), CFSTR("SpatializerManager is unavailable"));
    goto LABEL_12;
  }
  if (Phase::Controller::SpatializerManager::SetHeadphoneHRIR(v19, v6) != 2)
  {
    v17 = 1;
    goto LABEL_13;
  }
  v20 = *MEMORY[0x24BDD0FC8];
  v25 = *MEMORY[0x24BDD0FC8];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Invalid headphone HRIR file %s"), -[NSURL fileSystemRepresentation](objc_retainAutorelease(v6), "fileSystemRepresentation"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v21;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v22)
                                                                                      + 432)));
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(v12, "objectForKeyedSubscript:", v20);
    v24 = (PHASEEngine *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v30 = "PHASEEngine.mm";
    v31 = 1024;
    v32 = 935;
    v33 = 2112;
    v34 = v24;
    _os_log_impl(&dword_2164CC000, v23, OS_LOG_TYPE_ERROR, "%25s:%-5d %@", buf, 0x1Cu);

  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreaudio.phase"), 1346920801, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_10:
    *a4 = v16;
  }
LABEL_11:

LABEL_12:
  v17 = 0;
LABEL_13:
  objc_sync_exit(v7);

  return v17;
}

- (void)setTargetRoomAcousticParameters:(id)a3
{
  Phase::Logger *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  PHASEEngine *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (Phase::Logger *)a3;
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v4) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "PHASEEngine.mm";
    v8 = 1024;
    v9 = 955;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setTargetRoomAcousticParameters:", (uint8_t *)&v6, 0x1Cu);
  }
  -[PHASEEngine setRoomAcousticTarget:](self, "setRoomAcousticTarget:", v4);

}

- (void)setEnableRoomAcousticParametersTracking:(BOOL)a3
{
  uint64_t v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  PHASEEngine *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "PHASEEngine.mm";
    v8 = 1024;
    v9 = 962;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setEnableRoomAcousticParametersTracking", (uint8_t *)&v6, 0x1Cu);
  }
  -[PHASEEngine setRoomAcousticTrackingMode:](self, "setRoomAcousticTrackingMode:", v3 << 63 >> 63);
  self->_enableRoomAcousticParametersTracking = v3;
}

- (void)setRoomAcousticTrackingMode:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  PHASEEngine *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "PHASEEngine.mm";
    v8 = 1024;
    v9 = 972;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setRoomAcousticTrackingMode", (uint8_t *)&v6, 0x1Cu);
  }
  (*(void (**)(_QWORD, int64_t))(**((_QWORD **)self->_impl.__ptr_.__value_ + 46) + 136))(*((_QWORD *)self->_impl.__ptr_.__value_ + 46), a3);
  self->_roomAcousticTrackingMode = a3;
}

- (void)setRoomAcousticTarget:(id)a3
{
  Phase::Logger *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  Phase::Logger *v20;
  NSObject *v21;
  double v22;
  float v23;
  float *v24;
  float *v25;
  float *v26;
  int64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  float *v32;
  int v33;
  double v34;
  float v35;
  float *v36;
  float *v37;
  float *v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  float *v44;
  int v45;
  double v46;
  float v47;
  float *v48;
  float *v49;
  float *v50;
  uint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  char *v55;
  float *v56;
  int v57;
  double v58;
  float v59;
  float *v60;
  float *v61;
  float *v62;
  uint64_t v63;
  unint64_t v64;
  uint64_t v65;
  unint64_t v66;
  char *v67;
  float *v68;
  int v69;
  double v70;
  float v71;
  float *v72;
  float *v73;
  float *v74;
  uint64_t v75;
  unint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  float *v80;
  int v81;
  PHASEEngine *v82;
  id obj;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  void *v88;
  float *v89;
  float *v90;
  void *v91;
  float *v92;
  float *v93;
  void *v94;
  float *v95;
  float *v96;
  void *v97;
  float *v98;
  float *v99;
  void *__p;
  float *v101;
  unint64_t v102;
  uint8_t buf[4];
  const char *v104;
  __int16 v105;
  int v106;
  __int16 v107;
  PHASEEngine *v108;
  int v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  int v115;
  uint64_t v116;
  int v117;
  _BYTE v118[128];
  uint64_t v119;

  v119 = *MEMORY[0x24BDAC8D0];
  v4 = (Phase::Logger *)a3;
  __p = 0;
  v101 = 0;
  v102 = 0;
  v97 = 0;
  v98 = 0;
  v99 = 0;
  v94 = 0;
  v95 = 0;
  v96 = 0;
  v91 = 0;
  v92 = 0;
  v93 = 0;
  v88 = 0;
  v89 = 0;
  v90 = 0;
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v4) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v104 = "PHASEEngine.mm";
    v105 = 1024;
    v106 = 982;
    v107 = 2048;
    v108 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setRoomAcousticTarget:", buf, 0x1Cu);
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  -[Phase::Logger subbandParameters](v4, "subbandParameters");
  v82 = self;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v118, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v85;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v85 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v84 + 1) + 8 * i);
        v10 = (void *)MEMORY[0x24BDD16A8];
        objc_msgSend(v9, "frequency");
        v12 = v11;
        objc_msgSend(v9, "rt60");
        v14 = v13;
        objc_msgSend(v9, "confidence");
        v16 = v15;
        objc_msgSend(v9, "earlyRoomEqDb");
        v18 = v17;
        objc_msgSend(v9, "lateRoomEqDb");
        objc_msgSend(v10, "stringWithFormat:", CFSTR("centerFrequency %g RT60 %g confidence %g earlyRoomEQdB %g lateRoomEQdB %g"), v12, v14, v16, v18, v19);
        v20 = (Phase::Logger *)objc_claimAutoreleasedReturnValue();
        v21 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v20) + 432));
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v104 = "PHASEEngine.mm";
          v105 = 1024;
          v106 = 990;
          v107 = 2112;
          v108 = (PHASEEngine *)v20;
          _os_log_impl(&dword_2164CC000, v21, OS_LOG_TYPE_DEFAULT, "%25s:%-5d %@", buf, 0x1Cu);
        }
        objc_msgSend(v9, "frequency");
        v23 = v22;
        v24 = v101;
        if ((unint64_t)v101 >= v102)
        {
          v26 = (float *)__p;
          v27 = ((char *)v101 - (_BYTE *)__p) >> 2;
          v28 = v27 + 1;
          if ((unint64_t)(v27 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v29 = v102 - (_QWORD)__p;
          if ((uint64_t)(v102 - (_QWORD)__p) >> 1 > v28)
            v28 = v29 >> 1;
          if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFFCLL)
            v30 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v30 = v28;
          if (v30)
          {
            v31 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v102, v30);
            v26 = (float *)__p;
            v24 = v101;
          }
          else
          {
            v31 = 0;
          }
          v32 = (float *)&v31[4 * v27];
          *v32 = v23;
          v25 = v32 + 1;
          while (v24 != v26)
          {
            v33 = *((_DWORD *)v24-- - 1);
            *((_DWORD *)v32-- - 1) = v33;
          }
          __p = v32;
          v101 = v25;
          v102 = (unint64_t)&v31[4 * v30];
          if (v26)
            operator delete(v26);
        }
        else
        {
          *v101 = v23;
          v25 = v24 + 1;
        }
        v101 = v25;
        objc_msgSend(v9, "rt60");
        v35 = v34;
        v36 = v98;
        if (v98 >= v99)
        {
          v38 = (float *)v97;
          v39 = ((char *)v98 - (_BYTE *)v97) >> 2;
          v40 = v39 + 1;
          if ((unint64_t)(v39 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v41 = (char *)v99 - (_BYTE *)v97;
          if (((char *)v99 - (_BYTE *)v97) >> 1 > v40)
            v40 = v41 >> 1;
          if ((unint64_t)v41 >= 0x7FFFFFFFFFFFFFFCLL)
            v42 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v42 = v40;
          if (v42)
          {
            v43 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v99, v42);
            v38 = (float *)v97;
            v36 = v98;
          }
          else
          {
            v43 = 0;
          }
          v44 = (float *)&v43[4 * v39];
          *v44 = v35;
          v37 = v44 + 1;
          while (v36 != v38)
          {
            v45 = *((_DWORD *)v36-- - 1);
            *((_DWORD *)v44-- - 1) = v45;
          }
          v97 = v44;
          v98 = v37;
          v99 = (float *)&v43[4 * v42];
          if (v38)
            operator delete(v38);
        }
        else
        {
          *v98 = v35;
          v37 = v36 + 1;
        }
        v98 = v37;
        objc_msgSend(v9, "earlyRoomEqDb");
        v47 = v46;
        v48 = v95;
        if (v95 >= v96)
        {
          v50 = (float *)v94;
          v51 = ((char *)v95 - (_BYTE *)v94) >> 2;
          v52 = v51 + 1;
          if ((unint64_t)(v51 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v53 = (char *)v96 - (_BYTE *)v94;
          if (((char *)v96 - (_BYTE *)v94) >> 1 > v52)
            v52 = v53 >> 1;
          if ((unint64_t)v53 >= 0x7FFFFFFFFFFFFFFCLL)
            v54 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v54 = v52;
          if (v54)
          {
            v55 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v96, v54);
            v50 = (float *)v94;
            v48 = v95;
          }
          else
          {
            v55 = 0;
          }
          v56 = (float *)&v55[4 * v51];
          *v56 = v47;
          v49 = v56 + 1;
          while (v48 != v50)
          {
            v57 = *((_DWORD *)v48-- - 1);
            *((_DWORD *)v56-- - 1) = v57;
          }
          v94 = v56;
          v95 = v49;
          v96 = (float *)&v55[4 * v54];
          if (v50)
            operator delete(v50);
        }
        else
        {
          *v95 = v47;
          v49 = v48 + 1;
        }
        v95 = v49;
        objc_msgSend(v9, "lateRoomEqDb");
        v59 = v58;
        v60 = v92;
        if (v92 >= v93)
        {
          v62 = (float *)v91;
          v63 = ((char *)v92 - (_BYTE *)v91) >> 2;
          v64 = v63 + 1;
          if ((unint64_t)(v63 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v65 = (char *)v93 - (_BYTE *)v91;
          if (((char *)v93 - (_BYTE *)v91) >> 1 > v64)
            v64 = v65 >> 1;
          if ((unint64_t)v65 >= 0x7FFFFFFFFFFFFFFCLL)
            v66 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v66 = v64;
          if (v66)
          {
            v67 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v93, v66);
            v62 = (float *)v91;
            v60 = v92;
          }
          else
          {
            v67 = 0;
          }
          v68 = (float *)&v67[4 * v63];
          *v68 = v59;
          v61 = v68 + 1;
          while (v60 != v62)
          {
            v69 = *((_DWORD *)v60-- - 1);
            *((_DWORD *)v68-- - 1) = v69;
          }
          v91 = v68;
          v92 = v61;
          v93 = (float *)&v67[4 * v66];
          if (v62)
            operator delete(v62);
        }
        else
        {
          *v92 = v59;
          v61 = v60 + 1;
        }
        v92 = v61;
        objc_msgSend(v9, "confidence");
        v71 = v70;
        v72 = v89;
        if (v89 >= v90)
        {
          v74 = (float *)v88;
          v75 = ((char *)v89 - (_BYTE *)v88) >> 2;
          v76 = v75 + 1;
          if ((unint64_t)(v75 + 1) >> 62)
            std::vector<float>::__throw_length_error[abi:ne180100]();
          v77 = (char *)v90 - (_BYTE *)v88;
          if (((char *)v90 - (_BYTE *)v88) >> 1 > v76)
            v76 = v77 >> 1;
          if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFFCLL)
            v78 = 0x3FFFFFFFFFFFFFFFLL;
          else
            v78 = v76;
          if (v78)
          {
            v79 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)&v90, v78);
            v74 = (float *)v88;
            v72 = v89;
          }
          else
          {
            v79 = 0;
          }
          v80 = (float *)&v79[4 * v75];
          *v80 = v71;
          v73 = v80 + 1;
          while (v72 != v74)
          {
            v81 = *((_DWORD *)v72-- - 1);
            *((_DWORD *)v80-- - 1) = v81;
          }
          v88 = v80;
          v89 = v73;
          v90 = (float *)&v79[4 * v78];
          if (v74)
            operator delete(v74);
        }
        else
        {
          *v89 = v71;
          v73 = v72 + 1;
        }
        v89 = v73;

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v84, v118, 16);
    }
    while (v6);
  }

  bzero(buf, 0x2C0uLL);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v97, Phase::sThreeBandFrequencies, Phase::sOctaveBandFrequencies, (uint64_t)buf);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v94, Phase::sThreeBandFrequencies, Phase::sOctaveBandFrequencies, (uint64_t)&v105);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v91, Phase::sThreeBandFrequencies, Phase::sOctaveBandFrequencies, (uint64_t)&v108 + 4);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v88, Phase::sThreeBandFrequencies, Phase::sOctaveBandFrequencies, (uint64_t)&v109);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v97, Phase::sOctaveBandFrequencies, Phase::sThirdOctaveBandFrequencies, (uint64_t)&v110);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v94, Phase::sOctaveBandFrequencies, Phase::sThirdOctaveBandFrequencies, (uint64_t)&v111);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v91, Phase::sOctaveBandFrequencies, Phase::sThirdOctaveBandFrequencies, (uint64_t)&v112);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v88, Phase::sOctaveBandFrequencies, Phase::sThirdOctaveBandFrequencies, (uint64_t)&v113);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v97, Phase::sThirdOctaveBandFrequencies, &Phase::sThirdOctaveBandFrequencies[31], (uint64_t)&v114);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v94, Phase::sThirdOctaveBandFrequencies, &Phase::sThirdOctaveBandFrequencies[31], (uint64_t)&v115);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::DecibelsToEnergy<float>,&float Phase::EnergyToDecibels<float>>((float *)__p, v101, (uint64_t)v91, Phase::sThirdOctaveBandFrequencies, &Phase::sThirdOctaveBandFrequencies[31], (uint64_t)&v116);
  Phase::GetValuesFromFrequencyResponse<std::__wrap_iter<float *>,std::__wrap_iter<float *>,float const*,float *,&float Phase::Identity<float>,&float Phase::Identity<float>>((float *)__p, v101, (uint64_t)v88, Phase::sThirdOctaveBandFrequencies, &Phase::sThirdOctaveBandFrequencies[31], (uint64_t)&v117);
  (*(void (**)(_QWORD, uint8_t *))(**((_QWORD **)v82->_impl.__ptr_.__value_ + 46) + 144))(*((_QWORD *)v82->_impl.__ptr_.__value_ + 46), buf);
  v82->_roomAcousticTarget = (PHASETargetRoomAcousticParameters *)v4;
  if (v88)
  {
    v89 = (float *)v88;
    operator delete(v88);
  }
  if (v91)
  {
    v92 = (float *)v91;
    operator delete(v91);
  }
  if (v94)
  {
    v95 = (float *)v94;
    operator delete(v94);
  }
  if (v97)
  {
    v98 = (float *)v97;
    operator delete(v97);
  }
  if (__p)
  {
    v101 = (float *)__p;
    operator delete(__p);
  }

}

- (void)setRoomAcousticMaximumReverbTime:(double)a3
{
  NSObject *v5;
  float v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  PHASEEngine *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "PHASEEngine.mm";
    v9 = 1024;
    v10 = 1082;
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setRoomAcousticMaximumReverbTime", (uint8_t *)&v7, 0x1Cu);
  }
  v6 = a3;
  (*(void (**)(_QWORD, float))(**((_QWORD **)self->_impl.__ptr_.__value_ + 46) + 152))(*((_QWORD *)self->_impl.__ptr_.__value_ + 46), v6);
  self->_roomAcousticMaximumReverbTime = a3;
}

- (void)setRoomAcousticSoftLimiting:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  PHASEEngine *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "PHASEEngine.mm";
    v8 = 1024;
    v9 = 1090;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setRoomAcousticSoftLimiting", (uint8_t *)&v6, 0x1Cu);
  }
  (*(void (**)(_QWORD, _BOOL8))(**((_QWORD **)self->_impl.__ptr_.__value_ + 46) + 160))(*((_QWORD *)self->_impl.__ptr_.__value_ + 46), v3);
  self->_roomAcousticSoftLimiting = v3;
}

- (void)setRoomAcousticSmoothing:(double)a3
{
  NSObject *v5;
  float v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  PHASEEngine *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "PHASEEngine.mm";
    v9 = 1024;
    v10 = 1098;
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setRoomAcousticSmoothing", (uint8_t *)&v7, 0x1Cu);
  }
  v6 = a3;
  (*(void (**)(_QWORD, float))(**((_QWORD **)self->_impl.__ptr_.__value_ + 46) + 168))(*((_QWORD *)self->_impl.__ptr_.__value_ + 46), v6);
  self->_roomAcousticSmoothing = a3;
}

- (void)setDefaultPrivateReverbPreset:(int64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  _BYTE *v8;
  unsigned int v9;
  unsigned __int8 *v10;
  uint64_t v11;
  unsigned int v12;
  int v13;
  const char *v14;
  __int16 v15;
  int v16;
  __int16 v17;
  PHASEEngine *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136315650;
    v14 = "PHASEEngine.mm";
    v15 = 1024;
    v16 = 1107;
    v17 = 2048;
    v18 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setDefaultPrivateReverbPreset", (uint8_t *)&v13, 0x1Cu);
  }
  if (self->_defaultPrivateReverbPreset != a3)
  {
    GetReverbPresetName(a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v8 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
      if (v8 && (v9 = *v8, *v8))
      {
        v10 = v8 + 1;
        v11 = 0xCBF29CE484222325;
        do
        {
          v11 = 0x100000001B3 * (v11 ^ v9);
          v12 = *v10++;
          v9 = v12;
        }
        while (v12);
      }
      else
      {
        v11 = 0;
      }
    }
    else
    {
      v11 = 0;
      a3 = 1917742958;
    }
    self->_defaultPrivateReverbPreset = a3;
    (*(void (**)(_QWORD, uint64_t))(**((_QWORD **)self->_impl.__ptr_.__value_ + 46) + 208))(*((_QWORD *)self->_impl.__ptr_.__value_ + 46), v11);

  }
}

- (void)setSpaceBlendTargetPreset:(int64_t)a3
{
  NSObject *v5;
  _BOOL8 v6;
  NSObject *v7;
  int64_t spaceBlendTargetPreset;
  void *v9;
  void *v10;
  _BYTE *v11;
  unsigned int v12;
  unsigned __int8 *v13;
  uint64_t v14;
  unsigned int v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  PHASEEngine *v21;
  __int16 v22;
  int64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    v16 = 136315906;
    v17 = "PHASEEngine.mm";
    v18 = 1024;
    v19 = 1121;
    v20 = 2048;
    v21 = self;
    v22 = 2048;
    v23 = a3;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Trying to set spaceBlendTargetPreset to: %ld", (uint8_t *)&v16, 0x26u);
  }
  if (self->_spaceBlendTargetPreset != a3)
  {
    v7 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v6) + 432));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      spaceBlendTargetPreset = self->_spaceBlendTargetPreset;
      v16 = 136315906;
      v17 = "PHASEEngine.mm";
      v18 = 1024;
      v19 = 1126;
      v20 = 2048;
      v21 = (PHASEEngine *)spaceBlendTargetPreset;
      v22 = 2048;
      v23 = a3;
      _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d Changing spaceBlendTargetPreset from %ld to %ld.", (uint8_t *)&v16, 0x26u);
    }
    GetReverbPresetName(a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = (_BYTE *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String");
      if (v11 && (v12 = *v11, *v11))
      {
        v13 = v11 + 1;
        v14 = 0xCBF29CE484222325;
        do
        {
          v14 = 0x100000001B3 * (v14 ^ v12);
          v15 = *v13++;
          v12 = v15;
        }
        while (v15);
      }
      else
      {
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
      a3 = 1917742958;
    }
    self->_spaceBlendTargetPreset = a3;
    (*(void (**)(_QWORD, uint64_t))(**((_QWORD **)self->_impl.__ptr_.__value_ + 46) + 176))(*((_QWORD *)self->_impl.__ptr_.__value_ + 46), v14);

  }
}

- (uint64_t)setSpaceBlendTargetPresetOrientation:(__n128 *)a1
{
  NSObject *v3;
  uint64_t v4;
  __n128 v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  __n128 *v13;
  __int16 v14;
  double v15;
  __int16 v16;
  double v17;
  __int16 v18;
  double v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)a1) + 432));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136316674;
    v9 = "PHASEEngine.mm";
    v10 = 1024;
    v11 = 1143;
    v12 = 2048;
    v13 = a1;
    v14 = 2048;
    v15 = a2.n128_f32[0];
    v16 = 2048;
    v17 = a2.n128_f32[1];
    v18 = 2048;
    v19 = a2.n128_f32[2];
    v20 = 2048;
    v21 = a2.n128_f32[3];
    _os_log_impl(&dword_2164CC000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Setting spaceBlendTargetPresetOrientation to :%f %f %f %f", buf, 0x44u);
  }
  a1[15] = a2;
  v4 = *(_QWORD *)(a1->n128_u64[1] + 368);
  v7 = a2;
  return (*(uint64_t (**)(uint64_t, __n128 *))(*(_QWORD *)v4 + 184))(v4, &v7);
}

- (void)setSpaceBlendLevel:(double)a3
{
  NSObject *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  double v10;
  float v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  PHASEEngine *v17;
  __int16 v18;
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315906;
    v13 = "PHASEEngine.mm";
    v14 = 1024;
    v15 = 1151;
    v16 = 2048;
    v17 = self;
    v18 = 2048;
    v19 = a3;
    _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: Setting spaceBlendLevel to: %.2f", (uint8_t *)&v12, 0x26u);
  }
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = PHASEGetPropertyBounded<double>(v8, v9, a3, 0.0, 1.0);

  v11 = v10;
  (*(void (**)(_QWORD, float))(**((_QWORD **)self->_impl.__ptr_.__value_ + 46) + 192))(*((_QWORD *)self->_impl.__ptr_.__value_ + 46), v11);
  self->_spaceBlendLevel = v10;
}

- (void)setSceneClassification:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int v9;
  __int16 v10;
  PHASEEngine *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315650;
    v7 = "PHASEEngine.mm";
    v8 = 1024;
    v9 = 1163;
    v10 = 2048;
    v11 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setSceneClassification", (uint8_t *)&v6, 0x1Cu);
  }
  (*(void (**)(_QWORD, int64_t))(**((_QWORD **)self->_impl.__ptr_.__value_ + 46) + 200))(*((_QWORD *)self->_impl.__ptr_.__value_ + 46), a3);
  self->_sceneClassification = a3;
}

- (void)setSceneRoomUUID:(id)a3
{
  Phase::Logger *v4;
  NSObject *v5;
  NSUUID *sceneRoomUUID;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  PHASEEngine *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = (Phase::Logger *)a3;
  v5 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v4) + 432));
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "PHASEEngine.mm";
    v9 = 1024;
    v10 = 1171;
    v11 = 2048;
    v12 = self;
    _os_log_impl(&dword_2164CC000, v5, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setSceneRoomUUID", (uint8_t *)&v7, 0x1Cu);
  }
  sceneRoomUUID = self->_sceneRoomUUID;
  self->_sceneRoomUUID = (NSUUID *)v4;

}

- (void)setMaximumGainDbSpl:(double)a3
{
  NSObject *v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    v4 = 136315394;
    v5 = "PHASEEngine.mm";
    v6 = 1024;
    v7 = 1185;
    _os_log_impl(&dword_2164CC000, v3, OS_LOG_TYPE_ERROR, "%25s:%-5d setMaximumGainDbSpl: This value is deprecated. It no longer has any effect on the engine. Ignoring request.", (uint8_t *)&v4, 0x12u);
  }
}

- (double)maximumGainDbSpl
{
  return self->_maxGainDbSpl;
}

- (void)setUnitsPerSecond:(double)unitsPerSecond
{
  PHASEEngine *v5;
  Phase::Logger *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  NSObject *v15;
  Phase::Logger *InstancePtr;
  NSObject *v17;
  std::runtime_error *exception;
  BOOL v19;
  unint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v5 = self;
  v6 = (Phase::Logger *)objc_sync_enter(v5);
  v7 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v6) + 432));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v22 = "PHASEEngine.mm";
    v23 = 1024;
    v24 = 1197;
    v25 = 2048;
    v26 = (unint64_t)v5;
    _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setUnitsPerSecond", buf, 0x1Cu);
  }
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PHASEGetPropertyBounded<double>(v9, v10, unitsPerSecond, 2.22507386e-308, 1.79769313e308);

  v12 = Phase::Controller::TaskManager::GetService<Phase::Controller::GroupManager>((Phase::Logger *)((char *)v5->_impl.__ptr_.__value_ + 48), 10);
  v13 = **(_QWORD **)(v12 + 8);
  v20 = 0;
  v19 = 1;
  v14 = (double *)Phase::LockFreeQueueMPSC::GetWriteBuffer((Phase::LockFreeQueueMPSC *)v13, 24, &v20, &v19);
  if (!v14)
  {
    InstancePtr = (Phase::Logger *)Phase::Logger::GetInstancePtr(0);
    Phase::Logger::DumpTailspinWithThrottleAsync(InstancePtr, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
    v17 = objc_retainAutorelease(**(id **)(v13 + 48));
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "CommandQueue.hpp";
      v23 = 1024;
      v24 = 100;
      _os_log_impl(&dword_2164CC000, v17, OS_LOG_TYPE_ERROR, "%25s:%-5d EXCEPTION (std::runtime_error) [true is true]: \"CommandQueue unable to retrieve write buffer; buffer "
        "is full, unable to grow.\",
        buf,
        0x12u);
    }
    exception = (std::runtime_error *)__cxa_allocate_exception(0x10uLL);
    std::runtime_error::runtime_error(exception, "CommandQueue unable to retrieve write buffer; buffer is full, unable to grow.");
  }
  if (v19)
  {
    v15 = objc_retainAutorelease(**(id **)(v13 + 48));
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315906;
      v22 = "CommandQueue.hpp";
      v23 = 1024;
      v24 = 89;
      v25 = 2048;
      v26 = v20;
      v27 = 2048;
      v28 = 24;
      _os_log_impl(&dword_2164CC000, v15, OS_LOG_TYPE_DEBUG, "%25s:%-5d Warning: CommandQueue grew buffer to %zu bytes to accommodate extra %zu bytes - this usually means the system is under load or the command queue is too small.", buf, 0x26u);
    }
  }
  *(_QWORD *)v14 = &off_24D57F290;
  *((_QWORD *)v14 + 1) = v12;
  v14[2] = v11;
  Phase::LockFreeQueueSPSC::CommitBytes((Phase::LockFreeQueueSPSC *)v13, 24);
  atomic_store(0, (unsigned __int8 *)(v13 + 40));
  v5->_unitsPerSecond = v11;
  objc_sync_exit(v5);

}

- (double)unitsPerSecond
{
  return self->_unitsPerSecond;
}

- (void)setUnitsPerMeter:(double)unitsPerMeter
{
  PHASEEngine *v5;
  Phase::Logger *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  double v11;
  int v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  PHASEEngine *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = self;
  v6 = (Phase::Logger *)objc_sync_enter(v5);
  v7 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v6) + 432));
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315650;
    v13 = "PHASEEngine.mm";
    v14 = 1024;
    v15 = 1223;
    v16 = 2048;
    v17 = v5;
    _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_DEFAULT, "%25s:%-5d engine@%p: setUnitsPerMeter", (uint8_t *)&v12, 0x1Cu);
  }
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromSelector(a2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = PHASEGetPropertyBounded<double>(v9, v10, unitsPerMeter, 2.22507386e-308, 1.79769313e308);

  if (v11 != v5->_unitsPerMeter)
  {
    (*(void (**)(_QWORD, double))(**((_QWORD **)v5->_impl.__ptr_.__value_ + 51) + 48))(*((_QWORD *)v5->_impl.__ptr_.__value_ + 51), v11);
    v5->_unitsPerMeter = v11;
  }
  objc_sync_exit(v5);

}

- (double)unitsPerMeter
{
  return self->_unitsPerMeter;
}

- (void)addSoundEvent:(id)a3
{
  id v5;
  NSMutableArray *obj;

  obj = self->_internalSoundEvents;
  v5 = a3;
  objc_sync_enter(obj);
  -[NSMutableArray addObject:](self->_internalSoundEvents, "addObject:", v5);

  objc_sync_exit(obj);
}

- (void)removeSoundEvent:(id)a3
{
  id v5;
  NSMutableArray *obj;

  obj = self->_internalSoundEvents;
  v5 = a3;
  objc_sync_enter(obj);
  -[NSMutableArray removeObject:](self->_internalSoundEvents, "removeObject:", v5);

  objc_sync_exit(obj);
}

- (NSArray)soundEvents
{
  return (NSArray *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithArray:", self->_internalSoundEvents);
}

- (void)update
{
  double v2;
  PHASEEngine *obj;

  obj = self;
  objc_sync_enter(obj);
  if (*((_QWORD *)obj->_impl.__ptr_.__value_ + 63) == 1)
  {
    v2 = (double)(std::chrono::steady_clock::now().__d_.__rep_ - obj->_stopWatch.mStart.__d_.__rep_) / 1000000000.0;
    obj->_stopWatch.mStart.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
    PHASEEngineImpl::UpdateFrame(obj->_impl.__ptr_.__value_, v2);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("API Misuse"), CFSTR("Cannot call update while in automatic mode"));
  }
  objc_sync_exit(obj);

}

- (void)addGroup:(id)a3
{
  id v4;
  NSMutableDictionary *groups;
  void *v6;
  id v7;

  v4 = a3;
  groups = self->_groups;
  v7 = v4;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](groups, "setObject:forKey:", v7, v6);

}

- (void)removeGroup:(id)a3
{
  NSMutableDictionary *groups;
  id v4;

  groups = self->_groups;
  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](groups, "removeObjectForKey:");

}

- (NSDictionary)groups
{
  return (NSDictionary *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_groups);
}

- (NSArray)duckers
{
  return (NSArray *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", self->_duckers);
}

- (void)addDucker:(id)a3
{
  id v4;
  NSMutableDictionary *duckers;
  void *v6;
  id v7;

  v4 = a3;
  duckers = self->_duckers;
  v7 = v4;
  objc_msgSend(v4, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](duckers, "setObject:forKey:", v7, v6);

}

- (void)removeDucker:(id)a3
{
  NSMutableDictionary *duckers;
  id v4;

  duckers = self->_duckers;
  objc_msgSend(a3, "identifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](duckers, "removeObjectForKey:");

}

- (void)setInternalActiveGroupMixerPreset:(id)a3
{
  objc_storeStrong((id *)&self->_activeGroupPreset, a3);
}

- (void)setSpatialHint:(int64_t)a3
{
  const __CFString *v4;
  PHASEEngine *obj;

  obj = self;
  objc_sync_enter(obj);
  if (a3)
  {
    if (a3 != 1)
      std::terminate();
    v4 = CFSTR("SimulatedIndirectPath");
  }
  else
  {
    v4 = CFSTR("Default");
  }
  -[PHASEEngine setProfileOverrideWithName:balance:](obj, "setProfileOverrideWithName:balance:", v4, 1.0);
  obj->_spatialHint = a3;
  objc_sync_exit(obj);

}

- (int64_t)spatialHint
{
  return self->_spatialHint;
}

- (void)setExperience:(int64_t)a3
{
  self->_experience = a3;
}

- (void)setBalance:(double)a3
{
  self->_balance = a3;
}

- (void)setSpatialCategoryUpdateRate:(float)a3 withName:(id)a4
{
  PHASEEngine *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  v6 = self;
  objc_sync_enter(v6);
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("direct_path_transmission")) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("early_reflections")))
  {
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("late_reverb")))
    v8 = 3;
  else
    v8 = v7;
  (*(void (**)(_QWORD, uint64_t, float))(**((_QWORD **)v6->_impl.__ptr_.__value_ + 51) + 24))(*((_QWORD *)v6->_impl.__ptr_.__value_ + 51), v8, a3);
  objc_sync_exit(v6);

}

- (void)setSpatialCategoryBandCount:(unint64_t)a3 withName:(id)a4
{
  PHASEEngine *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  v6 = self;
  objc_sync_enter(v6);
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("direct_path_transmission")) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("early_reflections")))
  {
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("late_reverb")))
    v8 = 3;
  else
    v8 = v7;
  (*(void (**)(_QWORD, uint64_t, unint64_t))(**((_QWORD **)v6->_impl.__ptr_.__value_ + 51) + 32))(*((_QWORD *)v6->_impl.__ptr_.__value_ + 51), v8, a3);
  objc_sync_exit(v6);

}

- (void)setSpatialCategoryMaxClusterCount:(unint64_t)a3 withName:(id)a4
{
  PHASEEngine *v6;
  unsigned int v7;
  uint64_t v8;
  id v9;

  v9 = a4;
  v6 = self;
  objc_sync_enter(v6);
  if ((objc_msgSend(v9, "isEqualToString:", CFSTR("direct_path_transmission")) & 1) != 0)
  {
    v7 = 1;
  }
  else if (objc_msgSend(v9, "isEqualToString:", CFSTR("early_reflections")))
  {
    v7 = 2;
  }
  else
  {
    v7 = 0;
  }
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("late_reverb")))
    v8 = 3;
  else
    v8 = v7;
  (*(void (**)(_QWORD, uint64_t, unint64_t))(**((_QWORD **)v6->_impl.__ptr_.__value_ + 51) + 40))(*((_QWORD *)v6->_impl.__ptr_.__value_ + 51), v8, a3);
  objc_sync_exit(v6);

}

- (void)setProfileOverride:(id)a3 experience:(id)a4 faceCount:(int)a5 balance:(double)a6
{
  -[PHASEEngine setProfileOverrideWithName:balance:](self, "setProfileOverrideWithName:balance:", a4, a6);
}

- (void)setProfileOverrideWithName:(id)a3 balance:(double)a4
{
  Phase::Logger *v7;
  NSObject *v8;
  Phase::Controller::DeviceInfo *v9;
  Phase::Logger *IsInternalBuild;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  NSString *v19;
  uint64_t StringHashId;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  double v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v7 = (Phase::Logger *)a3;
  v8 = objc_retainAutoreleasedReturnValue(objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(v7)
                                                                                     + 432)));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315906;
    v22 = "PHASEEngine.mm";
    v23 = 1024;
    v24 = 1452;
    v25 = 2080;
    v26 = -[Phase::Logger UTF8String](objc_retainAutorelease(v7), "UTF8String");
    v27 = 2048;
    v28 = a4;
    _os_log_impl(&dword_2164CC000, v8, OS_LOG_TYPE_DEFAULT, "%25s:%-5d received message setProfileOverrideWithName:%s balance:%f", (uint8_t *)&v21, 0x26u);
  }

  IsInternalBuild = (Phase::Logger *)Phase::Controller::DeviceInfo::IsInternalBuild(v9);
  if ((unsigned __int16)IsInternalBuild >= 0x100u && (_BYTE)IsInternalBuild)
  {
    if (a4 >= 0.0)
    {
      if (a4 <= 1.0)
        goto LABEL_14;
      v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(IsInternalBuild) + 432));
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        goto LABEL_14;
      v21 = 136315906;
      v22 = "PHASEEngine.mm";
      v23 = 1024;
      v24 = 1472;
      v25 = 2048;
      v26 = 0x3FF0000000000000;
      v27 = 2048;
      v28 = 1.0;
      v12 = "%25s:%-5d setProfileOverrideWithName: Attempting to set balance to be greater than %f. Clamping to %f";
    }
    else
    {
      v11 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(IsInternalBuild) + 432));
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
LABEL_14:
        v14 = (objc_class *)objc_opt_class();
        NSStringFromClass(v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        NSStringFromSelector(a2);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = PHASEGetPropertyBounded<double>(v15, v16, a4, 0.0, 1.0);

        v18 = *((_QWORD *)self->_impl.__ptr_.__value_ + 51);
        StringHashId = Phase::GetStringHashId(v7, v19);
        (*(void (**)(uint64_t, uint64_t, double))(*(_QWORD *)v18 + 56))(v18, StringHashId, v17);
        goto LABEL_15;
      }
      v21 = 136315906;
      v22 = "PHASEEngine.mm";
      v23 = 1024;
      v24 = 1466;
      v25 = 2048;
      v26 = 0;
      v27 = 2048;
      v28 = 0.0;
      v12 = "%25s:%-5d setProfileOverrideWithName: Attempting to set balance to be less than %f. Clamping to %f";
    }
    _os_log_impl(&dword_2164CC000, v11, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v21, 0x26u);
    goto LABEL_14;
  }
  v13 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(IsInternalBuild) + 432));
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v21 = 136315394;
    v22 = "PHASEEngine.mm";
    v23 = 1024;
    v24 = 1458;
    _os_log_impl(&dword_2164CC000, v13, OS_LOG_TYPE_ERROR, "%25s:%-5d setProfileOverrideWithName: This is not an internal build. Ignoring request.", (uint8_t *)&v21, 0x12u);
  }
LABEL_15:

}

- (void)clearProfileOverride
{
  NSObject *v3;
  _BOOL8 v4;
  Phase::Logger *IsInternalBuild;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)self) + 432));
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    v7 = 136315394;
    v8 = "PHASEEngine.mm";
    v9 = 1024;
    v10 = 1485;
    _os_log_impl(&dword_2164CC000, v3, OS_LOG_TYPE_DEFAULT, "%25s:%-5d received message clearProfileOverride", (uint8_t *)&v7, 0x12u);
  }
  IsInternalBuild = (Phase::Logger *)Phase::Controller::DeviceInfo::IsInternalBuild((Phase::Controller::DeviceInfo *)v4);
  if ((unsigned __int16)IsInternalBuild >= 0x100u && (_BYTE)IsInternalBuild)
  {
    (*(void (**)(_QWORD))(**((_QWORD **)self->_impl.__ptr_.__value_ + 51) + 64))(*((_QWORD *)self->_impl.__ptr_.__value_
                                                                                              + 51));
  }
  else
  {
    v6 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr(IsInternalBuild) + 432));
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315394;
      v8 = "PHASEEngine.mm";
      v9 = 1024;
      v10 = 1491;
      _os_log_impl(&dword_2164CC000, v6, OS_LOG_TYPE_ERROR, "%25s:%-5d setProfileOverrideWithName: This is not an internal build. Ignoring request.", (uint8_t *)&v7, 0x12u);
    }
  }
}

- (void)gatherExternalStreamDebugInformation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  v6 = *((_QWORD *)self->_impl.__ptr_.__value_ + 52);
  if (v6)
  {
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __52__PHASEEngine_gatherExternalStreamDebugInformation___block_invoke;
    v8[3] = &unk_24D57F260;
    v9 = v4;
    (*(void (**)(uint64_t, _QWORD *))(*(_QWORD *)v6 + 88))(v6, v8);

  }
  else
  {
    v7 = objc_retainAutorelease(**(id **)(Phase::Logger::GetInstancePtr((Phase::Logger *)v4) + 432));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "PHASEEngine.mm";
      v12 = 1024;
      v13 = 1505;
      _os_log_impl(&dword_2164CC000, v7, OS_LOG_TYPE_ERROR, "%25s:%-5d Engine does not have external stream dispatcher", buf, 0x12u);
    }
  }

}

uint64_t __52__PHASEEngine_gatherExternalStreamDebugInformation___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (PHASEAssetRegistry)assetRegistry
{
  return self->_assetRegistry;
}

- (PHASEGroupPreset)activeGroupPreset
{
  return self->_activeGroupPreset;
}

- (BOOL)enableRoomAcousticParametersTracking
{
  return self->_enableRoomAcousticParametersTracking;
}

- (int64_t)roomAcousticTrackingMode
{
  return self->_roomAcousticTrackingMode;
}

- (PHASETargetRoomAcousticParameters)roomAcousticTarget
{
  return self->_roomAcousticTarget;
}

- (double)roomAcousticMaximumReverbTime
{
  return self->_roomAcousticMaximumReverbTime;
}

- (BOOL)roomAcousticSoftLimiting
{
  return self->_roomAcousticSoftLimiting;
}

- (double)roomAcousticSmoothing
{
  return self->_roomAcousticSmoothing;
}

- (int64_t)defaultPrivateReverbPreset
{
  return self->_defaultPrivateReverbPreset;
}

- (int64_t)spaceBlendTargetPreset
{
  return self->_spaceBlendTargetPreset;
}

- (__n128)spaceBlendTargetPresetOrientation
{
  return a1[15];
}

- (double)spaceBlendLevel
{
  return self->_spaceBlendLevel;
}

- (double)sampleRate
{
  return self->_sampleRate;
}

- (PHASETapRegistry)tapRegistry
{
  return self->_tapRegistry;
}

- (int64_t)sceneClassification
{
  return self->_sceneClassification;
}

- (NSUUID)sceneRoomUUID
{
  return self->_sceneRoomUUID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneRoomUUID, 0);
  objc_storeStrong((id *)&self->_tapRegistry, 0);
  objc_storeStrong((id *)&self->_activeGroupPreset, 0);
  objc_storeStrong((id *)&self->_assetRegistry, 0);
  objc_storeStrong((id *)&self->_tapInterfaceImpl, 0);
  objc_storeStrong((id *)&self->_duckers, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_internalSoundEvents, 0);
  objc_storeStrong((id *)&self->_defaultMedium, 0);
  objc_storeStrong((id *)&self->_rootObject, 0);
  std::unique_ptr<PHASEEngineImpl>::reset[abi:ne180100](&self->_impl.__ptr_.__value_, 0);
}

- (id).cxx_construct
{
  self->_impl.__ptr_.__value_ = 0;
  self->_stopWatch.mStart.__d_.__rep_ = std::chrono::steady_clock::now().__d_.__rep_;
  return self;
}

- (void)setUnitsPerSecond:
{
  JUMPOUT(0x2199F9D70);
}

- (double)setUnitsPerSecond:
{
  return Phase::Controller::GroupManager::SetUnitsPerSecond(*(Phase::Controller::GroupManager **)(a1 + 8), *(double *)(a1 + 16));
}

@end
