@implementation EARCaesuraSilencePosteriorGenerator

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (EARCaesuraSilencePosteriorGenerator)initWithConfigFile:(id)a3
{
  return -[EARCaesuraSilencePosteriorGenerator initWithConfigFile:samplingRate:](self, "initWithConfigFile:samplingRate:", a3, 16000);
}

- (EARCaesuraSilencePosteriorGenerator)initWithConfigFile:(id)a3 samplingRate:(unint64_t)a4
{
  void *v7;
  EARCaesuraSilencePosteriorGenerator *v8;

  dispatch_get_global_queue(2, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[EARCaesuraSilencePosteriorGenerator initWithConfigFile:samplingRate:queue:](self, "initWithConfigFile:samplingRate:queue:", a3, a4, v7);

  return v8;
}

- (EARCaesuraSilencePosteriorGenerator)initWithConfigFile:(id)a3 samplingRate:(unint64_t)a4 queue:(id)a5
{
  id v9;
  id v10;
  EARCaesuraSilencePosteriorGenerator *v11;
  EARCaesuraSilencePosteriorGenerator *v12;
  id *p_configFile;
  void *v14;
  char v15;
  EARLogger *v16;
  NSObject *v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  EARCaesuraSilencePosteriorGenerator *v21;
  void *__p[2];
  uint64_t v24;
  __int128 v25;
  objc_super v26;

  v9 = a3;
  v10 = a5;
  v26.receiver = self;
  v26.super_class = (Class)EARCaesuraSilencePosteriorGenerator;
  v11 = -[EARCaesuraSilencePosteriorGenerator init](&v26, sel_init);
  v12 = v11;
  if (!v11)
    goto LABEL_18;
  p_configFile = (id *)&v11->_configFile;
  objc_storeStrong((id *)&v11->_configFile, a3);
  v12->_samplingRate = a4;
  objc_storeStrong((id *)&v12->_spgQueue, a5);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "fileExistsAtPath:", *p_configFile);

  if ((v15 & 1) == 0)
  {
    EARLogger::QuasarOSLogger(v16);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      -[EARCaesuraSilencePosteriorGenerator initWithConfigFile:samplingRate:queue:].cold.1((uint64_t *)&v12->_configFile, v17);

    goto LABEL_19;
  }
  if (*p_configFile)
  {
    objc_msgSend(*p_configFile, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v24 = 0;
  }
  std::allocate_shared[abi:ne180100]<quasar::SilencePosteriorGenerator,std::allocator<quasar::SilencePosteriorGenerator>,std::string,unsigned long &,void>((uint64_t)__p, (unsigned int *)&v12->_samplingRate, &v25);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v12->_silenceGenerator, &v25);
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v25 + 1);
  if (*((_QWORD *)&v25 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v25 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  if (SHIBYTE(v24) < 0)
    operator delete(__p[0]);
  if (!v12->_silenceGenerator.__ptr_)
  {
LABEL_19:
    v21 = 0;
    goto LABEL_20;
  }
  -[EARCaesuraSilencePosteriorGenerator _startComputeTask](v12, "_startComputeTask");
LABEL_18:
  v21 = v12;
LABEL_20:

  return v21;
}

- (void)addAudio:(id)a3 numSamples:(unint64_t)a4
{
  id v6;

  v6 = objc_retainAutorelease(a3);
  (*(void (**)(_QWORD, uint64_t, unint64_t))(**((_QWORD **)self->_silenceGenerator.__ptr_ + 2) + 16))(*((_QWORD *)self->_silenceGenerator.__ptr_ + 2), objc_msgSend(v6, "bytes"), a4);

}

- (int64_t)getFrameDurationMs
{
  return (int)quasar::SilencePosteriorGenerator::getFrameDurationMs((quasar::SilencePosteriorGenerator *)self->_silenceGenerator.__ptr_);
}

- (void)_startComputeTask
{
  __shared_weak_count *cntrl;
  SilencePosteriorGenerator *ptr;
  unint64_t *v5;
  unint64_t v6;
  NSObject *spgQueue;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  unint64_t *v13;
  unint64_t v14;
  _QWORD v15[4];
  id v16[2];
  __shared_weak_count *v17;
  id location;

  ptr = self->_silenceGenerator.__ptr_;
  cntrl = self->_silenceGenerator.__cntrl_;
  if (cntrl)
  {
    v5 = (unint64_t *)((char *)cntrl + 8);
    do
      v6 = __ldxr(v5);
    while (__stxr(v6 + 1, v5));
  }
  objc_initWeak(&location, self);
  spgQueue = self->_spgQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3321888768;
  v15[2] = __56__EARCaesuraSilencePosteriorGenerator__startComputeTask__block_invoke;
  v15[3] = &unk_1E5D46990;
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
  dispatch_async(spgQueue, v15);
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

void __56__EARCaesuraSilencePosteriorGenerator__startComputeTask__block_invoke(uint64_t a1)
{
  uint64_t v2;
  id *v3;
  char *v4;
  __objc2_class **p_superclass;
  uint64_t v6;
  char v7;
  uint64_t v8;
  id v9;
  double SilenceFramesCountMs;
  double SilenceProbability;
  double SilenceDurationMs;
  double SilencePosterior;
  void *v14;
  id WeakRetained;
  void *v16;
  id v17;
  void *v18;
  char v19;
  char v20;
  char *v21;
  __objc2_class **v22;
  id v23;
  void *v24;
  _BYTE *v25;
  _BYTE *v26;
  double v27;
  id v28;
  void *v29;
  char v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  void *__p;
  _BYTE *v36;
  uint64_t v37;

  v2 = 0;
  v3 = (id *)(a1 + 32);
  v4 = sel_silenceDurationEstimateAvailable_numEstimates_clientProcessedAudioMs_;
  p_superclass = &OBJC_METACLASS____EARNLTokenizer.superclass;
  do
  {
    v6 = mach_absolute_time();
    __p = 0;
    v36 = 0;
    v37 = 0;
    v7 = quasar::SilencePosteriorGenerator::estimateSilenceDuration(*(_QWORD *)(a1 + 40), (uint64_t)&__p);
    v8 = mach_absolute_time();
    v9 = objc_alloc((Class)(p_superclass + 354));
    SilenceFramesCountMs = quasar::SilencePosteriorGenerator::getSilenceFramesCountMs(*(quasar::SilencePosteriorGenerator **)(a1 + 40));
    SilenceProbability = quasar::SilencePosteriorGenerator::getSilenceProbability(*(quasar::SilencePosteriorGenerator **)(a1 + 40));
    SilenceDurationMs = quasar::SilencePosteriorGenerator::getSilenceDurationMs(*(double ***)(a1 + 40));
    SilencePosterior = quasar::SilencePosteriorGenerator::getSilencePosterior(*(quasar::SilencePosteriorGenerator **)(a1 + 40));
    v2 += v8 - v6;
    v14 = (void *)objc_msgSend(v9, "initWithSilenceFramesCountMs:silenceProbability:silenceDurationMs:silencePosterior:processedAudioMs:inferenceTime:", v2, SilenceFramesCountMs, SilenceProbability, SilenceDurationMs, SilencePosterior, (double)quasar::SilencePosteriorGenerator::getProcessedAudioMs(*(quasar::SilencePosteriorGenerator **)(a1 + 40)));
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "clientSilenceFeaturesAvailable:", v14);

    v17 = objc_loadWeakRetained(v3);
    objc_msgSend(v17, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_respondsToSelector();

    if ((v19 & 1) != 0)
    {
      v34 = v14;
      v20 = v7;
      v21 = v4;
      v22 = p_superclass;
      v23 = objc_loadWeakRetained(v3);
      objc_msgSend(v23, "delegate");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = __p;
      v26 = v36;
      *(float *)&v27 = (float)quasar::SilencePosteriorGenerator::getProcessedAudioMs(*(quasar::SilencePosteriorGenerator **)(a1 + 40));
      objc_msgSend(v24, "silenceDurationEstimateAvailable:numEstimates:clientProcessedAudioMs:", v25, (v26 - v25) >> 2, v27);

      p_superclass = v22;
      v4 = v21;
      v7 = v20;
      v14 = v34;
    }

    if (__p)
    {
      v36 = __p;
      operator delete(__p);
    }
  }
  while ((v7 & 1) != 0);
  v28 = objc_loadWeakRetained(v3);
  objc_msgSend(v28, "delegate");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_opt_respondsToSelector();

  if ((v30 & 1) != 0)
  {
    v31 = objc_loadWeakRetained(v3);
    objc_msgSend(v31, "delegate");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_loadWeakRetained(v3);
    objc_msgSend(v32, "silencePosteriorGeneratorProcessorIsFinished:", v33);

  }
}

- (void)resetForNewRequest
{
  SilencePosteriorGenerator *ptr;
  shared_ptr<quasar::SilencePosteriorGenerator> *p_silenceGenerator;
  NSString *configFile;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  void *__p;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;

  p_silenceGenerator = &self->_silenceGenerator;
  ptr = self->_silenceGenerator.__ptr_;
  if (ptr)
    (*(void (**)(_QWORD, SEL))(**((_QWORD **)ptr + 2) + 32))(*((_QWORD *)ptr + 2), a2);
  configFile = self->_configFile;
  if (configFile)
  {
    -[NSString ear_toString](configFile, "ear_toString");
  }
  else
  {
    __p = 0;
    v10 = 0;
    v11 = 0;
  }
  std::allocate_shared[abi:ne180100]<quasar::SilencePosteriorGenerator,std::allocator<quasar::SilencePosteriorGenerator>,std::string,unsigned long &,void>((uint64_t)&__p, (unsigned int *)&self->_samplingRate, &v12);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)p_silenceGenerator, &v12);
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
  -[EARCaesuraSilencePosteriorGenerator _startComputeTask](self, "_startComputeTask", __p, v10, v11);
}

- (void)endAudio
{
  (*(void (**)(_QWORD))(**((_QWORD **)self->_silenceGenerator.__ptr_ + 2) + 32))(*((_QWORD *)self->_silenceGenerator.__ptr_
                                                                                              + 2));
}

- (void)dealloc
{
  SilencePosteriorGenerator *ptr;
  objc_super v4;

  ptr = self->_silenceGenerator.__ptr_;
  if (ptr)
    (*(void (**)(_QWORD, SEL))(**((_QWORD **)ptr + 2) + 32))(*((_QWORD *)ptr + 2), a2);
  v4.receiver = self;
  v4.super_class = (Class)EARCaesuraSilencePosteriorGenerator;
  -[EARCaesuraSilencePosteriorGenerator dealloc](&v4, sel_dealloc);
}

- (EARCaesuraSilencePosteriorGeneratorDelegate)delegate
{
  return (EARCaesuraSilencePosteriorGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_spgQueue, 0);
  objc_storeStrong((id *)&self->_configFile, 0);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_silenceGenerator);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)initWithConfigFile:(uint64_t *)a1 samplingRate:(NSObject *)a2 queue:.cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1AD756000, a2, OS_LOG_TYPE_ERROR, "EARSPG: SilencePosteriorGenerator Config file does not exist at %@", (uint8_t *)&v3, 0xCu);
}

@end
