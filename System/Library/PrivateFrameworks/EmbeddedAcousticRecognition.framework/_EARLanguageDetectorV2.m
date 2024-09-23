@implementation _EARLanguageDetectorV2

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARLanguageDetectorV2)initWithConfigFile:(id)a3
{
  id v4;
  _EARLanguageDetectorV2 *v5;
  void *v6;
  char v7;
  EARLogger *v8;
  NSObject *v9;
  int JsonFile;
  EARLogger *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _EARLanguageDetectorV2 *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *lidQueue;
  uint64_t v22;
  NSArray *supportedLocales;
  EARLogger *v24;
  float v25;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35[2];
  __int128 v36;
  int v37;
  uint64_t v38[3];
  void *__p[2];
  uint64_t v40;
  objc_super v41;

  v4 = a3;
  v41.receiver = self;
  v41.super_class = (Class)_EARLanguageDetectorV2;
  v5 = -[_EARLanguageDetectorV2 init](&v41, sel_init);
  if (!v5)
    goto LABEL_19;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v4);

  if ((v7 & 1) == 0)
  {
    EARLogger::QuasarOSLogger(v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[_EARLanguageDetectorV2 initWithConfigFile:].cold.3((uint64_t)v4, v9);
    goto LABEL_13;
  }
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v40 = 0;
  }
  memset(v38, 0, sizeof(v38));
  *(_OWORD *)v35 = 0u;
  v36 = 0u;
  v37 = 1065353216;
  JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)&v5->_sysConfig, (uint64_t)__p, v38, (uint64_t)v35, 0, 0);
  std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v35);
  v35[0] = v38;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v35);
  if (SHIBYTE(v40) < 0)
    operator delete(__p[0]);
  if (JsonFile != 2)
  {
    v20 = dispatch_queue_create("com.apple._EARLanguageDetectorV2", 0);
    lidQueue = v5->_lidQueue;
    v5->_lidQueue = (OS_dispatch_queue *)v20;

    std::string::basic_string[abi:ne180100]<0>(v35, "ld-inference");
    quasar::SystemConfig::enforceMinVersion((uint64_t)&v5->_sysConfig, 207, 0, (uint64_t)v35);
    if (SBYTE7(v36) < 0)
      operator delete(v35[0]);
    quasar::LanguageDetectorV2::languageIdV2Configuration((quasar::LanguageDetectorV2 *)&v5->_sysConfig, (uint64_t)v35);
    EARHelpers::VectorToArray<std::string>((__int128 **)v35);
    v22 = objc_claimAutoreleasedReturnValue();
    supportedLocales = v5->_supportedLocales;
    v5->_supportedLocales = (NSArray *)v22;

    v25 = *((double *)&v36 + 1);
    v5->_englishThreshold = v25;
    if (!v5->_supportedLocales)
    {
      EARLogger::QuasarOSLogger(v24);
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[_EARLanguageDetectorV2 initWithConfigFile:].cold.2(v27, v28, v29, v30, v31, v32, v33, v34);

      __p[0] = v35;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
      goto LABEL_14;
    }
    __p[0] = v35;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
LABEL_19:
    v19 = v5;
    goto LABEL_20;
  }
  EARLogger::QuasarOSLogger(v11);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    -[_EARLanguageDetectorV2 initWithConfigFile:].cold.1(v9, v12, v13, v14, v15, v16, v17, v18);
LABEL_13:

LABEL_14:
  v19 = 0;
LABEL_20:

  return v19;
}

- (void)dealloc
{
  _EARLanguageDetectorV2 *v2;
  PSRAudioProcessor *ptr;
  NSObject *v4;
  objc_super v5;
  uint8_t buf[16];

  v2 = self;
  ptr = self->_audioProcessor.__ptr_;
  if (ptr)
    self = (_EARLanguageDetectorV2 *)(*(uint64_t (**)(_QWORD, SEL))(**(_QWORD **)ptr + 32))(*(_QWORD *)ptr, a2);
  EARLogger::QuasarOSLogger((EARLogger *)self);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AD756000, v4, OS_LOG_TYPE_INFO, "dealloc", buf, 2u);
  }

  v5.receiver = v2;
  v5.super_class = (Class)_EARLanguageDetectorV2;
  -[_EARLanguageDetectorV2 dealloc](&v5, sel_dealloc);
}

- (id)supportedLocales
{
  return self->_supportedLocales;
}

- (id)startRequestWithSamplingRate:(unint64_t)a3 requestOptions:(id)a4 delegate:(id)a5
{
  id v7;
  EARLogger *v8;
  NSObject *v9;
  PSRAudioProcessor *ptr;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  id v20;
  _EARLanguageDetectorV2RequestOptions *v21;
  _EARLanguageDetectorV2RequestOptions *requestOptions;
  void *__p[2];
  char v25;
  int v26;
  __int128 v27;
  char v28;
  int v29;
  int v30;
  unint64_t v31;

  v31 = a3;
  v7 = a4;
  v8 = (EARLogger *)a5;
  EARLogger::QuasarOSLogger(v8);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_1AD756000, v9, OS_LOG_TYPE_INFO, "Start new request", (uint8_t *)__p, 2u);
  }

  ptr = self->_audioProcessor.__ptr_;
  if (ptr)
    (*(void (**)(_QWORD))(**(_QWORD **)ptr + 32))(*(_QWORD *)ptr);
  objc_storeWeak((id *)&self->_lidDelegate, v8);
  v29 = 0;
  v30 = -1;
  v28 = 0;
  _ZNSt3__115allocate_sharedB8ne180100IKN5kaldi5TimerENS_9allocatorIS3_EEJEvEENS_10shared_ptrIT_EERKT0_DpOT1_(&v27);
  v26 = -1;
  std::allocate_shared[abi:ne180100]<quasar::RecogAudioBuffer,std::allocator<quasar::RecogAudioBuffer>,unsigned long &,int,int,BOOL,char const(&)[1],std::shared_ptr<kaldi::Timer const>,int,void>((unsigned int *)&v31, &v30, &v29, &v28, "", &v27, &v26, __p);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&self->_audioBuffer, (__int128 *)__p);
  v11 = (std::__shared_weak_count *)__p[1];
  if (__p[1])
  {
    v12 = (unint64_t *)((char *)__p[1] + 8);
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v15 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  objc_msgSend(CFSTR("frontends.language-id"), "ear_toString");
  std::allocate_shared[abi:ne180100]<quasar::PSRAudioProcessor,std::allocator<quasar::PSRAudioProcessor>,quasar::SystemConfig &,std::string,unsigned long &,std::shared_ptr<quasar::RecogAudioBuffer> &,void>((uint64_t)&self->_sysConfig, (uint64_t)__p, (unsigned int *)&v31, &v27);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&self->_audioProcessor, &v27);
  v17 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v18 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  if (v25 < 0)
    operator delete(__p[0]);
  v20 = -[_EARLanguageDetectorAudioBuffer _initWithAudioBuffer:]([_EARLanguageDetectorAudioBuffer alloc], "_initWithAudioBuffer:", &self->_audioBuffer);
  v21 = (_EARLanguageDetectorV2RequestOptions *)objc_msgSend(v7, "copy");
  requestOptions = self->_requestOptions;
  self->_requestOptions = v21;

  -[_EARLanguageDetectorV2 _startComputeTask](self, "_startComputeTask");
  return v20;
}

- (id)startRequestWithSamplingRate:(unint64_t)a3 context:(id)a4 delegate:(id)a5
{
  id v7;
  _EARLanguageDetectorV2RequestOptions *v8;
  void *v9;

  v7 = a5;
  v8 = objc_alloc_init(_EARLanguageDetectorV2RequestOptions);
  -[_EARLanguageDetectorV2 startRequestWithSamplingRate:requestOptions:delegate:](self, "startRequestWithSamplingRate:requestOptions:delegate:", a3, v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)earLIDScores:(void *)a3
{
  double v5;
  void *v6;
  unint64_t i;
  double v8;
  void *v9;
  void *v10;

  *(float *)&v5 = kaldi::VectorBase<float>::ApplySoftMax((uint64_t)a3);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; -[NSArray count](self->_supportedLocales, "count") > i; ++i)
  {
    LODWORD(v8) = *(_DWORD *)(*(_QWORD *)a3 + 4 * i);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndexedSubscript:](self->_supportedLocales, "objectAtIndexedSubscript:", i);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, v10);

  }
  return v6;
}

- (id)languageDetectorV2Result:(id)a3
{
  id v4;
  _EARLanguageDetectorV2Result *v5;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  __CFString *v13;
  _QWORD v14[4];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  v5 = objc_alloc_init(_EARLanguageDetectorV2Result);
  -[_EARLanguageDetectorV2Result setConfidences:](v5, "setConfidences:", v4);
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  v14[0] = 0;
  v14[1] = v14;
  v14[2] = 0x2020000000;
  v14[3] = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6;
  v12 = __Block_byref_object_dispose__6;
  v13 = &stru_1E5D49530;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51___EARLanguageDetectorV2_languageDetectorV2Result___block_invoke;
  v7[3] = &unk_1E5D477E8;
  v7[4] = &v15;
  v7[5] = v14;
  v7[6] = &v8;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);
  -[_EARLanguageDetectorV2Result setDetectedLanguage:](v5, "setDetectedLanguage:", v16[3] > self->_englishThreshold);
  -[_EARLanguageDetectorV2Result setDominantLocale:](v5, "setDominantLocale:", v9[5]);
  _Block_object_dispose(&v8, 8);

  _Block_object_dispose(v14, 8);
  _Block_object_dispose(&v15, 8);

  return v5;
}

- (BOOL)shouldReportResults:(unint64_t)a3 reportingFrequency:(char)a4
{
  BOOL v4;

  v4 = a4 != 1 || a3 > 0x3C0;
  return a4 != 2 && v4;
}

- (void)_startComputeTask
{
  __shared_weak_count *cntrl;
  PSRAudioProcessor *ptr;
  unint64_t *v5;
  unint64_t v6;
  NSObject *lidQueue;
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
  lidQueue = self->_lidQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  block[2] = __43___EARLanguageDetectorV2__startComputeTask__block_invoke;
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
  dispatch_async(lidQueue, block);
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

- (_EARLanguageDetectorV2Delegate)lidDelegate
{
  return (_EARLanguageDetectorV2Delegate *)objc_loadWeakRetained((id *)&self->_lidDelegate);
}

- (void)setLidDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_lidDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_lidDelegate);
  objc_storeStrong((id *)&self->_requestOptions, 0);
  objc_storeStrong((id *)&self->_supportedLocales, 0);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_audioBuffer);
  objc_storeStrong((id *)&self->_lidQueue, 0);
  quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)&self->_sysConfig);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_audioProcessor);
}

- (id).cxx_construct
{
  self->_audioProcessor = 0u;
  quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)&self->_sysConfig);
  self->_audioBuffer = 0u;
  return self;
}

- (void)initWithConfigFile:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, a1, a3, "Config created with incorrect version", a5, a6, a7, a8, 0);
}

- (void)initWithConfigFile:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, a1, a3, "Failed to read languages-list", a5, a6, a7, a8, 0);
}

- (void)initWithConfigFile:(uint64_t)a1 .cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1AD756000, a2, OS_LOG_TYPE_ERROR, "Config file does not exist at %@", (uint8_t *)&v2, 0xCu);
}

@end
