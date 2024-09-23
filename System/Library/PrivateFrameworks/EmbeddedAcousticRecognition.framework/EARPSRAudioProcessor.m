@implementation EARPSRAudioProcessor

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.ear", "EARPSRAudioProcessor");
    v3 = (void *)earPSRLog;
    earPSRLog = (uint64_t)v2;

  }
}

- (EARPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6
{
  void *v11;
  EARPSRAudioProcessor *v12;

  dispatch_get_global_queue(2, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[EARPSRAudioProcessor initWithConfigFile:configRoot:sampleRate:delegate:queue:](self, "initWithConfigFile:configRoot:sampleRate:delegate:queue:", a3, a4, a5, a6, v11);

  return v12;
}

- (EARPSRAudioProcessor)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  EARPSRAudioProcessor *v16;
  EARPSRAudioProcessor *v17;
  void *v18;
  char v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  int JsonFile;
  uint64_t v25;
  EARPSRAudioProcessor *v26;
  uint64_t v28[3];
  void *__p[2];
  uint64_t v30;
  objc_super v31;
  uint8_t buf[16];
  __int128 v33;
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v31.receiver = self;
  v31.super_class = (Class)EARPSRAudioProcessor;
  v16 = -[EARPSRAudioProcessor init](&v31, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_17;
  v16->_sampleRate = a5;
  objc_storeStrong((id *)&v16->_configRoot, a4);
  objc_storeWeak((id *)&v17->_delegate, v14);
  objc_storeStrong((id *)&v17->_queue, a7);
  v17->_batchSize = 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "fileExistsAtPath:", v12);

  if ((v19 & 1) != 0)
  {
    if (v12)
    {
      objc_msgSend(v12, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v30 = 0;
    }
    memset(v28, 0, sizeof(v28));
    *(_OWORD *)buf = 0u;
    v33 = 0u;
    v34 = 1065353216;
    JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)&v17->_sysConfig, (uint64_t)__p, v28, (uint64_t)buf, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
    *(_QWORD *)buf = v28;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    if (SHIBYTE(v30) < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(buf, "psr");
    quasar::SystemConfig::enforceMinVersion((uint64_t)&v17->_sysConfig, 62, 0, (uint64_t)buf);
    if (SBYTE7(v33) < 0)
      operator delete(*(void **)buf);
    if (JsonFile == 2)
    {
      v25 = earPSRLog;
      if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v21 = "PSR: ERR: AudioProcessorPipeline created with incorrect version";
        v22 = v25;
        v23 = 2;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
LABEL_17:
    v26 = v17;
    goto LABEL_18;
  }
  v20 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v12;
    v21 = "PSR: EARAudioProcessor Config file does not exist at %@";
    v22 = v20;
    v23 = 12;
LABEL_15:
    _os_log_impl(&dword_1AD756000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
  }
LABEL_16:
  v26 = 0;
LABEL_18:

  return v26;
}

- (void)addAudio:(id)a3
{
  id v4;

  v4 = objc_retainAutorelease(a3);
  (*(void (**)(_QWORD, uint64_t, unint64_t))(**(_QWORD **)self->_audioProcessor.__ptr_ + 16))(*(_QWORD *)self->_audioProcessor.__ptr_, objc_msgSend(v4, "bytes"), (unint64_t)objc_msgSend(v4, "length") >> 1);

}

- (void)endAudio
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AD756000, v3, OS_LOG_TYPE_DEFAULT, "endAudio", v4, 2u);
  }
  (*(void (**)(_QWORD))(**(_QWORD **)self->_audioProcessor.__ptr_ + 32))(*(_QWORD *)self->_audioProcessor.__ptr_);
}

- (void)resetForNewRequest
{
  NSObject *v3;
  PSRAudioProcessor *ptr;
  NSString *configRoot;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  void *__p;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  v3 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p) = 0;
    _os_log_impl(&dword_1AD756000, v3, OS_LOG_TYPE_DEFAULT, "resetForNewRequest", (uint8_t *)&__p, 2u);
  }
  ptr = self->_audioProcessor.__ptr_;
  if (ptr)
    (*(void (**)(_QWORD))(**(_QWORD **)ptr + 32))(*(_QWORD *)ptr);
  configRoot = self->_configRoot;
  if (configRoot)
  {
    -[NSString ear_toString](configRoot, "ear_toString");
  }
  else
  {
    __p = 0;
    v10 = 0;
    v11 = 0;
  }
  std::allocate_shared[abi:ne180100]<quasar::PSRAudioProcessor,std::allocator<quasar::PSRAudioProcessor>,quasar::SystemConfig &,std::string,unsigned long &,void>((uint64_t)&self->_sysConfig, (uint64_t)&__p, (unsigned int *)&self->_sampleRate, &v12);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&self->_audioProcessor, &v12);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v12 + 1);
  if (*((_QWORD *)&v12 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v12 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (SHIBYTE(v11) < 0)
    operator delete(__p);
  -[EARPSRAudioProcessor _startComputeTask](self, "_startComputeTask", __p, v10, v11);
}

- (void)_startComputeTask
{
  __shared_weak_count *cntrl;
  PSRAudioProcessor *ptr;
  unint64_t *v5;
  unint64_t v6;
  NSObject *queue;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD block[5];
  id v16[2];
  __shared_weak_count *v17;
  id location;

  ptr = self->_audioProcessor.__ptr_;
  cntrl = self->_audioProcessor.__cntrl_;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __41__EARPSRAudioProcessor__startComputeTask__block_invoke;
  block[3] = &unk_1E5D46A00;
  v16[1] = ptr;
  v17 = cntrl;
  if (cntrl)
  {
    v8 = (unint64_t *)((char *)cntrl + 8);
    do
      v9 = __ldxr(v8);
    while (__stxr(v9 + 1, v8));
  }
  objc_copyWeak(v16, &location);
  block[4] = self;
  dispatch_async(queue, block);
  objc_destroyWeak(v16);
  v10 = (std::__shared_weak_count *)v17;
  if (v17)
  {
    v11 = (unint64_t *)((char *)v17 + 8);
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  objc_destroyWeak(&location);
  if (cntrl)
  {
    v13 = (unint64_t *)((char *)cntrl + 8);
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      (*(void (**)(__shared_weak_count *))(*(_QWORD *)cntrl + 16))(cntrl);
      std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
    }
  }
}

void __41__EARPSRAudioProcessor__startComputeTask__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  id WeakRetained;
  void *v5;
  double v6;
  double v7;
  void *v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  void *v16;
  double v17;
  double v18;
  int v19;
  void *v20;
  double v21;
  id v22;
  id v23;
  id v24;
  NSObject *v25;
  id *location;
  void *v27;
  uint8_t buf[16];
  int v29;

  v2 = (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 48) + 16) + 8))(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 16));
  v3 = quasar::PSRAudioProcessor::frameDurationMs(*(quasar::PSRAudioProcessor **)(a1 + 48));
  location = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "delegate");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "systemUptime");
  v7 = v6;

  v8 = 0;
  v9 = 0;
  do
  {
    kaldi::Matrix<float>::Matrix((uint64_t)buf, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 1600), v2, 0, 0);
    v10 = quasar::PSRAudioProcessor::compute(*(_QWORD *)(a1 + 48), (uint64_t)buf);
    if ((int)kaldi::MatrixBase<float>::NumRows((uint64_t)buf) >= 1)
    {
      v11 = kaldi::MatrixBase<float>::NumRows((uint64_t)buf);
      v12 = kaldi::MatrixBase<float>::NumRows((uint64_t)buf);
      v13 = *(_QWORD *)buf;
      v14 = v29;
      kaldi::MatrixBase<float>::NumCols((uint64_t)buf);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v13 + 4 * v14 * (v12 - 1), 4 * (int)kaldi::MatrixBase<float>::NumCols((uint64_t)buf));
      v15 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "systemUptime");
      v18 = v17;
      v9 += v11 * v3;

      if (v18 - v7 > 0.100000001)
        v19 = v10;
      else
        v19 = 0;
      if (v19 == 1)
      {
        objc_msgSend(MEMORY[0x1E0CB3898], "processInfo", v18 - v7);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "systemUptime");
        v7 = v21;

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          v22 = objc_loadWeakRetained(location);
          objc_msgSend(v27, "psrAudioProcessor:hasSpeakerVector:speakerVectorSize:processedAudioDurationMs:", v22, v15, (int)kaldi::MatrixBase<float>::NumCols((uint64_t)buf), v9);

        }
      }
      v8 = (void *)v15;
    }
    kaldi::Matrix<float>::~Matrix((uint64_t)buf);
  }
  while ((v10 & 1) != 0);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v23 = objc_loadWeakRetained(location);
    objc_msgSend(v27, "psrAudioProcessor:hasResult:numElements:", v23, v8, (int)v2);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24 = objc_loadWeakRetained(location);
    objc_msgSend(v27, "psrAudioProcessor:finishedWithFinalSpeakerVector:speakerVectorSize:processedAudioDurationMs:", v24, v8, (int)v2, v9);

  }
  v25 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AD756000, v25, OS_LOG_TYPE_DEFAULT, "ComputeTask done", buf, 2u);
  }

}

- (void)dealloc
{
  PSRAudioProcessor *ptr;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  ptr = self->_audioProcessor.__ptr_;
  if (ptr)
    (*(void (**)(_QWORD, SEL))(**(_QWORD **)ptr + 32))(*(_QWORD *)ptr, a2);
  v4 = earPSRLog;
  if (os_log_type_enabled((os_log_t)earPSRLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AD756000, v4, OS_LOG_TYPE_DEFAULT, "dealloc", buf, 2u);
  }
  v5.receiver = self;
  v5.super_class = (Class)EARPSRAudioProcessor;
  -[EARPSRAudioProcessor dealloc](&v5, sel_dealloc);
}

- (NSString)configRoot
{
  return self->_configRoot;
}

- (void)setConfigRoot:(id)a3
{
  objc_storeStrong((id *)&self->_configRoot, a3);
}

- (EARPSRAudioProcessorDelegate)delegate
{
  return (EARPSRAudioProcessorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (void)setBatchSize:(unint64_t)a3
{
  self->_batchSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configRoot, 0);
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
