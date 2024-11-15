@implementation EARSyncPSRAudioProcessor

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.ear", "EARSyncPSRAudioProcessor");
    v3 = (void *)earPSRLog;
    earPSRLog = (uint64_t)v2;

  }
}

- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6
{
  void *v11;
  EARSyncPSRAudioProcessor *v12;

  dispatch_get_global_queue(2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EARSyncPSRAudioProcessor initWithConfigFile:configRoot:sampleRate:delegate:queue:](self, "initWithConfigFile:configRoot:sampleRate:delegate:queue:", a3, a4, a5, a6, v11);

  return v12;
}

- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7
{
  return -[EARSyncPSRAudioProcessor initWithConfigFile:configRoot:sampleRate:delegate:queue:maxBufferSizeSeconds:](self, "initWithConfigFile:configRoot:sampleRate:delegate:queue:maxBufferSizeSeconds:", a3, a4, a5, a6, a7, 120);
}

- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7 outputLastRowOnly:(BOOL)a8
{
  uint64_t v9;

  BYTE1(v9) = a8;
  LOBYTE(v9) = 0;
  return -[EARSyncPSRAudioProcessor initWithConfigFile:configRoot:sampleRate:delegate:queue:maxBufferSizeSeconds:memoryLock:outputLastRowOnly:](self, "initWithConfigFile:configRoot:sampleRate:delegate:queue:maxBufferSizeSeconds:memoryLock:outputLastRowOnly:", a3, a4, a5, a6, a7, 120, v9);
}

- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7 maxBufferSizeSeconds:(int64_t)a8
{
  uint64_t v9;

  LOWORD(v9) = 0;
  return -[EARSyncPSRAudioProcessor initWithConfigFile:configRoot:sampleRate:delegate:queue:maxBufferSizeSeconds:memoryLock:outputLastRowOnly:](self, "initWithConfigFile:configRoot:sampleRate:delegate:queue:maxBufferSizeSeconds:memoryLock:outputLastRowOnly:", a3, a4, a5, a6, a7, a8, v9);
}

- (EARSyncPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7 maxBufferSizeSeconds:(int64_t)a8 memoryLock:(BOOL)a9 outputLastRowOnly:(BOOL)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  EARSyncPSRAudioProcessor *v20;
  EARSyncPSRAudioProcessor *v21;
  void *v22;
  char v23;
  uint64_t v24;
  const char *v25;
  NSObject *v26;
  uint32_t v27;
  int JsonFile;
  uint64_t v29;
  EARSyncPSRAudioProcessor *v30;
  uint64_t ModelLoader;
  uint64_t v33[3];
  void *__p[2];
  uint64_t v35;
  objc_super v36;
  uint8_t buf[16];
  __int128 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a6;
  v19 = a7;
  v36.receiver = self;
  v36.super_class = (Class)EARSyncPSRAudioProcessor;
  v20 = -[EARSyncPSRAudioProcessor init](&v36, sel_init);
  v21 = v20;
  if (!v20)
    goto LABEL_18;
  v20->_sampleRate = a5;
  objc_storeStrong((id *)&v20->_configRoot, a4);
  objc_storeWeak((id *)&v21->_delegate, v18);
  objc_storeStrong((id *)&v21->_queue, a7);
  v21->_maxBufferSizeSeconds = a8;
  v21->_accumulatedProcessingTime = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "fileExistsAtPath:", v16);

  if ((v23 & 1) != 0)
  {
    if (v16)
    {
      objc_msgSend(v16, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v35 = 0;
    }
    memset(v33, 0, sizeof(v33));
    *(_OWORD *)buf = 0u;
    v38 = 0u;
    v39 = 1065353216;
    JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)&v21->_sysConfig, (uint64_t)__p, v33, (uint64_t)buf, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
    *(_QWORD *)buf = v33;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    if (SHIBYTE(v35) < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(buf, "psr");
    quasar::SystemConfig::enforceMinVersion((uint64_t)&v21->_sysConfig, 62, 0, (uint64_t)buf);
    if (SBYTE7(v38) < 0)
      operator delete(*(void **)buf);
    if (JsonFile == 2)
    {
      v29 = earPSRLog;
      if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v25 = "PSR: ERR: AudioProcessorPipeline created with incorrect version";
        v26 = v29;
        v27 = 2;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
    v21->_lastRowOutputOnly = a10;
    ModelLoader = quasar::SystemConfig::getModelLoader((quasar::SystemConfig *)&v21->_sysConfig);
    quasar::ModelLoader::enableEmbeddedMlock(ModelLoader, a9);
LABEL_18:
    v30 = v21;
    goto LABEL_19;
  }
  v24 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v16;
    v25 = "PSR: EARSyncAudioProcessor Config file does not exist at %@";
    v26 = v24;
    v27 = 12;
LABEL_15:
    _os_log_impl(&dword_1AD756000, v26, OS_LOG_TYPE_DEFAULT, v25, buf, v27);
  }
LABEL_16:
  v30 = 0;
LABEL_19:

  return v30;
}

- (void)resetForNewRequest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EARSyncPSRAudioProcessor_resetForNewRequest__block_invoke;
  block[3] = &unk_1E5D470A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __46__EARSyncPSRAudioProcessor_resetForNewRequest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  quasar::SyncPSRAudioProcessor *v4;
  uint64_t v5;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t result;
  void *__p[2];
  uint64_t v12;
  __int128 v13;

  v2 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_1AD756000, v2, OS_LOG_TYPE_DEFAULT, "resetForNewRequest", (uint8_t *)__p, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(quasar::SyncPSRAudioProcessor **)(v3 + 8);
  if (!v4)
  {
    v5 = v3 + 24;
    v6 = *(void **)(v3 + 1616);
    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
      v3 = *(_QWORD *)(a1 + 32);
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v12 = 0;
    }
    std::allocate_shared[abi:ne180100]<quasar::SyncPSRAudioProcessor,std::allocator<quasar::SyncPSRAudioProcessor>,quasar::SystemConfig &,std::string,unsigned long &,BOOL &,long &,void>(v5, (uint64_t)__p, (unsigned int *)(v3 + 1568), (unsigned __int8 *)(v3 + 1600), (unsigned int *)(v3 + 1584), &v13);
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 8, &v13);
    v7 = (std::__shared_weak_count *)*((_QWORD *)&v13 + 1);
    if (*((_QWORD *)&v13 + 1))
    {
      v8 = (unint64_t *)(*((_QWORD *)&v13 + 1) + 8);
      do
        v9 = __ldaxr(v8);
      while (__stlxr(v9 - 1, v8));
      if (!v9)
      {
        ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
        std::__shared_weak_count::__release_weak(v7);
      }
    }
    if (SHIBYTE(v12) < 0)
      operator delete(__p[0]);
    v4 = *(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 32) + 8);
  }
  result = quasar::SyncPSRAudioProcessor::reset(v4);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1576) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1592) = 0;
  return result;
}

- (void)addAudio:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  EARSyncPSRAudioProcessor *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__EARSyncPSRAudioProcessor_addAudio___block_invoke;
  v7[3] = &unk_1E5D47110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __37__EARSyncPSRAudioProcessor_addAudio___block_invoke(uint64_t a1)
{
  const __int16 *v2;
  unint64_t v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  NSObject *v16;
  id v18;
  uint8_t v19[40];
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (const __int16 *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes");
  v3 = (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") >> 1;
  v4 = mach_absolute_time();
  quasar::SyncPSRAudioProcessor::addAudio(*(quasar::SyncRecogAudioBuffer ***)(*(_QWORD *)(a1 + 40) + 8), v2, v3, 0);
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v19);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v19))
  {
    v5 = quasar::SyncPSRAudioProcessor::processedAudioDurationMs(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 40) + 8));
    _getNSDataForLastRowInMatrix((uint64_t)v19);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = mach_absolute_time();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemUptime");
    v10 = v9;

    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1592) += v7 - v4;
    v11 = *(_QWORD *)(a1 + 40);
    if (v10 - *(double *)(v11 + 1576) > 0.100000001)
    {
      *(double *)(v11 + 1576) = v10;
      v12 = *(void **)(a1 + 40);
      v13 = objc_initWeak(&v18, v12);
      objc_msgSend(v12, "delegate");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v15 = objc_loadWeakRetained(&v18);
        objc_msgSend(v14, "psrAudioProcessor:hasSpeakerVector:speakerVectorSize:processedAudioDurationMs:", v15, v6, (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v19), v5);

      }
      v16 = earPSRLog;
      if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v21 = v3;
        v22 = 1024;
        v23 = v5;
        _os_log_impl(&dword_1AD756000, v16, OS_LOG_TYPE_DEFAULT, "Added %d samples, processed %d ms of audio so far", buf, 0xEu);
      }

      objc_destroyWeak(&v18);
    }

  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1592) += mach_absolute_time() - v4;
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v19);
}

- (void)endAudio
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EARSyncPSRAudioProcessor_endAudio__block_invoke;
  block[3] = &unk_1E5D470A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__EARSyncPSRAudioProcessor_endAudio__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v11;
  uint8_t v12[40];
  uint8_t buf[4];
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = mach_absolute_time();
  quasar::SyncPSRAudioProcessor::endAudio(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 32) + 8));
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 32) + 8), (uint64_t)v12);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v12))
  {
    v3 = quasar::SyncPSRAudioProcessor::processedAudioDurationMs(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 32) + 8));
    _getNSDataForLastRowInMatrix((uint64_t)v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1592) += mach_absolute_time() - v2;
    v5 = *(void **)(a1 + 32);
    v6 = objc_initWeak(&v11, v5);
    objc_msgSend(v5, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v8 = objc_loadWeakRetained(&v11);
      objc_msgSend(v7, "psrAudioProcessor:finishedWithFinalSpeakerVector:speakerVectorSize:processedAudioDurationMs:", v8, v4, (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v12), v3);

    }
    v9 = earPSRLog;
    if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v3;
      _os_log_impl(&dword_1AD756000, v9, OS_LOG_TYPE_DEFAULT, "End audio: Processed %d ms of audio so far", buf, 8u);
    }

    objc_destroyWeak(&v11);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1592) += mach_absolute_time() - v2;
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v12);
}

- (id)getLatestSuperVector
{
  NSObject *queue;
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
  v9 = __Block_byref_object_copy__14;
  v10 = __Block_byref_object_dispose__14;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__EARSyncPSRAudioProcessor_getLatestSuperVector__block_invoke;
  v5[3] = &unk_1E5D46D80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __48__EARSyncPSRAudioProcessor_getLatestSuperVector__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _BYTE v6[40];

  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 32) + 8), (uint64_t)v6);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v6))
  {
    _getNSDataForLastRowInMatrix((uint64_t)v6);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v6);
}

- (unint64_t)getProcessedAudioDurationMs
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__EARSyncPSRAudioProcessor_getProcessedAudioDurationMs__block_invoke;
  v5[3] = &unk_1E5D47138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__EARSyncPSRAudioProcessor_getProcessedAudioDurationMs__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = quasar::SyncPSRAudioProcessor::processedAudioDurationMs(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 32) + 8));
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (int)result;
  return result;
}

- (unint64_t)getAccmulatedProcessingTime
{
  NSObject *queue;
  unint64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __55__EARSyncPSRAudioProcessor_getAccmulatedProcessingTime__block_invoke;
  v5[3] = &unk_1E5D47138;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __55__EARSyncPSRAudioProcessor_getAccmulatedProcessingTime__block_invoke(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 32) + 1592);
  return result;
}

- (EARSyncPSRAudioProcessorDelegate)delegate
{
  return (EARSyncPSRAudioProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)configRoot
{
  return self->_configRoot;
}

- (void)setConfigRoot:(id)a3
{
  objc_storeStrong((id *)&self->_configRoot, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_configRoot, 0);
  objc_destroyWeak((id *)&self->_delegate);
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)&self->_sysConfig);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_audioProcessor);
}

- (id).cxx_construct
{
  self->_audioProcessor.__ptr_ = 0;
  self->_audioProcessor.__cntrl_ = 0;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)&self->_sysConfig);
  return self;
}

@end
