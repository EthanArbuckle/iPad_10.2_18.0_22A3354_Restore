@implementation EARAudioResultsGenerator

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.ear", "EARAudioResultsGenerator");
    v3 = (void *)earARGLog;
    earARGLog = (uint64_t)v2;

  }
}

- (EARAudioResultsGenerator)initWithConfigFile:(id)a3 configRoot:(id)a4 sampleRate:(unint64_t)a5 delegate:(id)a6 queue:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  EARAudioResultsGenerator *v16;
  EARAudioResultsGenerator *v17;
  uint64_t v18;
  NSMutableData *entireResultMatrix;
  void *v20;
  char v21;
  uint64_t v22;
  const char *v23;
  NSObject *v24;
  uint32_t v25;
  int JsonFile;
  uint64_t v27;
  EARAudioResultsGenerator *v28;
  uint64_t v30[3];
  void *__p[2];
  uint64_t v32;
  objc_super v33;
  uint8_t buf[16];
  __int128 v35;
  int v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  v15 = a7;
  v33.receiver = self;
  v33.super_class = (Class)EARAudioResultsGenerator;
  v16 = -[EARAudioResultsGenerator init](&v33, sel_init);
  v17 = v16;
  if (!v16)
    goto LABEL_17;
  v16->_sampleRate = a5;
  objc_storeStrong((id *)&v16->_configRoot, a4);
  objc_storeWeak((id *)&v17->_delegate, v14);
  objc_storeStrong((id *)&v17->_queue, a7);
  v17->_isAudioSessionLive = 0;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v18 = objc_claimAutoreleasedReturnValue();
  entireResultMatrix = v17->_entireResultMatrix;
  v17->_entireResultMatrix = (NSMutableData *)v18;

  v17->_sessionFrameCount = 0;
  *(_OWORD *)&v17->_globalNumVectors = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "fileExistsAtPath:", v12);

  if ((v21 & 1) != 0)
  {
    if (v12)
    {
      objc_msgSend(v12, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v32 = 0;
    }
    memset(v30, 0, sizeof(v30));
    *(_OWORD *)buf = 0u;
    v35 = 0u;
    v36 = 1065353216;
    JsonFile = quasar::SystemConfig::readJsonFile((uint64_t)&v17->_sysConfig, (uint64_t)__p, v30, (uint64_t)buf, 0, 0);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)buf);
    *(_QWORD *)buf = v30;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
    if (SHIBYTE(v32) < 0)
      operator delete(__p[0]);
    std::string::basic_string[abi:ne180100]<0>(buf, "psr");
    quasar::SystemConfig::enforceMinVersion((uint64_t)&v17->_sysConfig, 62, 0, (uint64_t)buf);
    if (SBYTE7(v35) < 0)
      operator delete(*(void **)buf);
    if (JsonFile == 2)
    {
      v27 = earARGLog;
      if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        v23 = "ARG: ERR: AudioProcessorPipeline created with incorrect version";
        v24 = v27;
        v25 = 2;
        goto LABEL_15;
      }
      goto LABEL_16;
    }
LABEL_17:
    v28 = v17;
    goto LABEL_18;
  }
  v22 = earARGLog;
  if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v12;
    v23 = "Config file does not exist at %{public}@";
    v24 = v22;
    v25 = 12;
LABEL_15:
    _os_log_impl(&dword_1AD756000, v24, OS_LOG_TYPE_DEFAULT, v23, buf, v25);
  }
LABEL_16:
  v28 = 0;
LABEL_18:

  return v28;
}

- (void)resetForNewRequest
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__EARAudioResultsGenerator_resetForNewRequest__block_invoke;
  block[3] = &unk_1E5D470A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __46__EARAudioResultsGenerator_resetForNewRequest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  quasar::SyncPSRAudioProcessor *v4;
  quasar::SystemConfig *v5;
  void *v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  uint64_t result;
  void *__p[2];
  uint64_t v12;
  __int128 v13;

  v2 = earARGLog;
  if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(__p[0]) = 0;
    _os_log_impl(&dword_1AD756000, v2, OS_LOG_TYPE_DEFAULT, "Resetting audio result generator", (uint8_t *)__p, 2u);
  }
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(quasar::SyncPSRAudioProcessor **)(v3 + 8);
  if (!v4)
  {
    v5 = (quasar::SystemConfig *)(v3 + 24);
    v6 = *(void **)(v3 + 1624);
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
    std::allocate_shared[abi:ne180100]<quasar::SyncPSRAudioProcessor,std::allocator<quasar::SyncPSRAudioProcessor>,quasar::SystemConfig &,std::string,unsigned long &,void>(v5, (uint64_t)__p, (int *)(v3 + 1568), &v13);
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
  quasar::SyncPSRAudioProcessor::reset(v4);
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1576) = 0;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1584), "setLength:", 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1592) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1600) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1608) = 0;
  return result;
}

- (id)audioResultMatrix
{
  NSObject *queue;
  EARAudioResult *v3;
  EARAudioResult *v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __45__EARAudioResultsGenerator_audioResultMatrix__block_invoke;
  v6[3] = &unk_1E5D48990;
  v6[4] = self;
  v6[5] = &v15;
  v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(queue, v6);
  v3 = [EARAudioResult alloc];
  v4 = -[EARAudioResult initWithAudioResultMat:vectorSize:numVectors:](v3, "initWithAudioResultMat:vectorSize:numVectors:", v16[5], v8[3], v12[3]);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v4;
}

void __45__EARAudioResultsGenerator_audioResultMatrix__block_invoke(_QWORD *a1)
{
  uint64_t v1;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v1 = a1[4];
  if (*(_QWORD *)(v1 + 1592) && !*(_BYTE *)(v1 + 1576))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1[5] + 8) + 40), *(id *)(v1 + 1584));
    *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = *(_QWORD *)(a1[4] + 1592);
    *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = *(_QWORD *)(a1[4] + 1600);
    v3 = earARGLog;
    if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24);
      v5 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
      v6 = 134218240;
      v7 = v4;
      v8 = 2048;
      v9 = v5;
      _os_log_impl(&dword_1AD756000, v3, OS_LOG_TYPE_DEFAULT, "Got valid result mat in sync fashion with numRows:%lu and numCols:%lu", (uint8_t *)&v6, 0x16u);
    }
  }
}

- (id)audioResultLastVector
{
  NSObject *queue;
  EARAudioResult *v3;
  EARAudioResult *v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__11;
  v19 = __Block_byref_object_dispose__11;
  v20 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__EARAudioResultsGenerator_audioResultLastVector__block_invoke;
  v6[3] = &unk_1E5D48990;
  v6[4] = self;
  v6[5] = &v15;
  v6[6] = &v11;
  v6[7] = &v7;
  dispatch_sync(queue, v6);
  v3 = [EARAudioResult alloc];
  v4 = -[EARAudioResult initWithAudioResultMat:vectorSize:numVectors:](v3, "initWithAudioResultMat:vectorSize:numVectors:", v16[5], v8[3], v12[3]);
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v15, 8);

  return v4;
}

uint64_t __49__EARAudioResultsGenerator_audioResultLastVector__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint8_t v8[40];
  uint8_t buf[4];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(a1[4] + 8), (uint64_t)v8);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v8))
  {
    if (!*(_BYTE *)(a1[4] + 1576))
    {
      _getNSDataForLastRowInMatrix((uint64_t)v8);
      v2 = objc_claimAutoreleasedReturnValue();
      v3 = *(_QWORD *)(a1[5] + 8);
      v4 = *(void **)(v3 + 40);
      *(_QWORD *)(v3 + 40) = v2;

      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
      *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v8);
      v5 = earARGLog;
      if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
      {
        v6 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
        *(_DWORD *)buf = 134217984;
        v10 = v6;
        _os_log_impl(&dword_1AD756000, v5, OS_LOG_TYPE_DEFAULT, "Got valid result row in sync fashion with numCols:%lu", buf, 0xCu);
      }
    }
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v8);
}

- (void)addAudio:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  EARAudioResultsGenerator *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __37__EARAudioResultsGenerator_addAudio___block_invoke;
  v7[3] = &unk_1E5D47110;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __37__EARAudioResultsGenerator_addAudio___block_invoke(uint64_t a1)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  id WeakRetained;
  char v7;
  EARAudioResult *v8;
  id v9;
  id v10;
  char v11;
  void *v12;
  EARAudioResult *v13;
  id v14;
  _BYTE v16[40];

  quasar::SyncPSRAudioProcessor::addAudio(*(quasar::SyncRecogAudioBuffer ***)(*(_QWORD *)(a1 + 40) + 8), (const __int16 *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "bytes"), (unint64_t)objc_msgSend(*(id *)(a1 + 32), "length") >> 1, 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 1576) = 1;
  v2 = quasar::SyncPSRAudioProcessor::processedAudioDurationMs(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 40)
                                                                                                 + 8));
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 40) + 8), (uint64_t)v16);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v16))
  {
    v3 = v2 / 10;
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1608);
    if (v3 > v4)
    {
      _getNSDataForLastNRowsInMatrix((uint64_t)v16, v3 - v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1584), "appendData:", v5);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1592) = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1592)
                                                 + v3
                                                 - *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1608);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1600) = (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v16);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1616));
      v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) != 0)
      {
        v8 = -[EARAudioResult initWithAudioResultMat:vectorSize:numVectors:]([EARAudioResult alloc], "initWithAudioResultMat:vectorSize:numVectors:", v5, (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v16), v3 - *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1608));
        v9 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1616));
        objc_msgSend(v9, "hasEARAudioResultMatrix:", v8);

      }
      v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1616));
      v11 = objc_opt_respondsToSelector();

      if ((v11 & 1) != 0)
      {
        _getNSDataForLastRowInMatrix((uint64_t)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = -[EARAudioResult initWithAudioResultMat:vectorSize:numVectors:]([EARAudioResult alloc], "initWithAudioResultMat:vectorSize:numVectors:", v12, (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v16), 1);
        v14 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 40) + 1616));
        objc_msgSend(v14, "hasEARAudioResultLastVector:", v13);

      }
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 1608) = v3;

    }
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v16);
}

- (void)endAudio
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__EARAudioResultsGenerator_endAudio__block_invoke;
  block[3] = &unk_1E5D470A0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __36__EARAudioResultsGenerator_endAudio__block_invoke(uint64_t a1)
{
  NSObject *v2;
  int v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  id WeakRetained;
  char v8;
  EARAudioResult *v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  EARAudioResult *v14;
  id v15;
  uint8_t v17[48];

  v2 = earARGLog;
  if (os_log_type_enabled((os_log_t)earARGLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_1AD756000, v2, OS_LOG_TYPE_DEFAULT, "Ending audio", v17, 2u);
  }
  quasar::SyncPSRAudioProcessor::endAudio(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 32) + 8));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1576) = 0;
  v3 = quasar::SyncPSRAudioProcessor::processedAudioDurationMs(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 32)
                                                                                                 + 8));
  quasar::SyncPSRAudioProcessor::getSpeakerRecogMatrix(*(quasar::SyncPSRAudioProcessor **)(*(_QWORD *)(a1 + 32) + 8), (uint64_t)v17);
  if (kaldi::MatrixBase<float>::NumRows((uint64_t)v17))
  {
    v4 = v3 / 10;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1608);
    if (v4 > v5)
    {
      _getNSDataForLastNRowsInMatrix((uint64_t)v17, v4 - v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1584), "appendData:", v6);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1592) = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1592)
                                                 + v4
                                                 - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1608);
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1600) = (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v17);
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1616));
      v8 = objc_opt_respondsToSelector();

      if ((v8 & 1) != 0)
      {
        v9 = -[EARAudioResult initWithAudioResultMat:vectorSize:numVectors:]([EARAudioResult alloc], "initWithAudioResultMat:vectorSize:numVectors:", v6, (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v17), v4 - *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1608));
        v10 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1616));
        objc_msgSend(v10, "hasEARAudioResultMatrix:", v9);

      }
      v11 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1616));
      v12 = objc_opt_respondsToSelector();

      if ((v12 & 1) != 0)
      {
        _getNSDataForLastRowInMatrix((uint64_t)v17);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = -[EARAudioResult initWithAudioResultMat:vectorSize:numVectors:]([EARAudioResult alloc], "initWithAudioResultMat:vectorSize:numVectors:", v13, (int)kaldi::MatrixBase<float>::NumCols((uint64_t)v17), 1);
        v15 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 1616));
        objc_msgSend(v15, "hasEARAudioResultLastVector:", v14);

      }
      *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1608) = v4;

    }
  }
  return kaldi::Matrix<float>::~Matrix((uint64_t)v17);
}

- (EARAudioResultsGeneratorDelegate)delegate
{
  return (EARAudioResultsGeneratorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
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
  objc_storeStrong((id *)&self->_entireResultMatrix, 0);
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
