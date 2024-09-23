@implementation _EARSyncSpeechRecognizer

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (_EARSyncSpeechRecognizer)initWithConfiguration:(id)a3
{
  return -[_EARSyncSpeechRecognizer initWithConfiguration:memoryLock:](self, "initWithConfiguration:memoryLock:", a3, 0);
}

- (_EARSyncSpeechRecognizer)initWithConfiguration:(id)a3 memoryLock:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  _EARSyncSpeechRecognizer *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *formatterQueue;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  EARLogger *v13;
  int v14;
  NSObject *v15;
  _EARSyncSpeechRecognizer *v16;
  uint64_t v18;
  objc_super v19;
  void *__p[2];
  char v21;

  v4 = a4;
  v6 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_EARSyncSpeechRecognizer;
  v7 = -[_EARSyncSpeechRecognizer init](&v19, sel_init);
  if (!v7)
    goto LABEL_10;
  v8 = dispatch_queue_create("com.apple._EARSpeechRecognizer.formatter", 0);
  formatterQueue = v7->_formatterQueue;
  v7->_formatterQueue = (OS_dispatch_queue *)v8;

  v10 = (char *)objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
  v11 = operator new();
  std::string::basic_string[abi:ne180100]<0>(__p, v10);
  quasar::SyncSpeechRecognizer::SyncSpeechRecognizer(v11, __p);
  v18 = v11;
  if (v21 < 0)
    operator delete(__p[0]);
  std::shared_ptr<quasar::SyncSpeechRecognizer>::operator=[abi:ne180100]<quasar::SyncSpeechRecognizer,std::default_delete<quasar::SyncSpeechRecognizer>,void>(&v7->_syncRecognizer.__ptr_, &v18);
  v12 = v18;
  v18 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  v13 = (EARLogger *)(*(uint64_t (**)(SyncSpeechRecognizer *, _BOOL8))(*(_QWORD *)v7->_syncRecognizer.__ptr_
                                                                               + 16))(v7->_syncRecognizer.__ptr_, v4);
  v14 = (int)v13;
  if ((_DWORD)v13)
  {
    EARLogger::QuasarOSLogger(v13);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[_EARSyncSpeechRecognizer initWithConfiguration:memoryLock:].cold.1(v14, v15);

    v16 = 0;
  }
  else
  {
LABEL_10:
    v16 = v7;
  }

  return v16;
}

- (void)resetWithSamplingRate:(unsigned int)a3 language:(id)a4 taskType:(id)a5 userId:(id)a6 sessionId:(id)a7 deviceId:(id)a8 farField:(BOOL)a9 audioSource:(id)a10 maxAudioBufferSizeSeconds:(unsigned int)a11
{
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SyncSpeechRecognizer *ptr;
  void *__p[2];
  uint64_t v25;
  void *v26[2];
  uint64_t v27;
  void *v28[2];
  uint64_t v29;
  void *v30[2];
  uint64_t v31;
  void *v32[2];
  uint64_t v33;

  v15 = *(_QWORD *)&a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a10;
  ptr = self->_syncRecognizer.__ptr_;
  if (v17)
  {
    objc_msgSend(v17, "ear_toString");
    if (v18)
      goto LABEL_3;
  }
  else
  {
    v32[0] = 0;
    v32[1] = 0;
    v33 = 0;
    if (v18)
    {
LABEL_3:
      objc_msgSend(v18, "ear_toString");
      if (v19)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  v30[0] = 0;
  v30[1] = 0;
  v31 = 0;
  if (v19)
  {
LABEL_4:
    objc_msgSend(v19, "ear_toString");
    if (v20)
      goto LABEL_5;
LABEL_10:
    v26[0] = 0;
    v26[1] = 0;
    v27 = 0;
    if (v21)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v28[0] = 0;
  v28[1] = 0;
  v29 = 0;
  if (!v20)
    goto LABEL_10;
LABEL_5:
  objc_msgSend(v20, "ear_toString");
  if (v21)
  {
LABEL_6:
    objc_msgSend(v21, "ear_toString");
    goto LABEL_12;
  }
LABEL_11:
  __p[0] = 0;
  __p[1] = 0;
  v25 = 0;
LABEL_12:
  (*(void (**)(SyncSpeechRecognizer *, uint64_t, void **, void **, void **, void **, void **, BOOL, _BYTE))(*(_QWORD *)ptr + 24))(ptr, v15, v32, v30, v28, v26, __p, a9, 0);
  if (SHIBYTE(v25) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v27) < 0)
    operator delete(v26[0]);
  if (SHIBYTE(v29) < 0)
    operator delete(v28[0]);
  if (SHIBYTE(v31) < 0)
    operator delete(v30[0]);
  if (SHIBYTE(v33) < 0)
    operator delete(v32[0]);

}

- (void)resetWithSamplingRate:(unsigned int)a3 language:(id)a4 taskType:(id)a5 userId:(id)a6 sessionId:(id)a7 deviceId:(id)a8 farField:(BOOL)a9 atypicalSpeech:(BOOL)a10 maxAudioBufferSizeSeconds:(unsigned int)a11
{
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  SyncSpeechRecognizer *ptr;
  void *__p[2];
  uint64_t v24;
  void *v25[2];
  uint64_t v26;
  void *v27[2];
  uint64_t v28;
  void *v29[2];
  uint64_t v30;
  void *v31[2];
  uint64_t v32;

  v15 = *(_QWORD *)&a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  ptr = self->_syncRecognizer.__ptr_;
  if (v17)
  {
    objc_msgSend(v17, "ear_toString");
    if (v18)
      goto LABEL_3;
  }
  else
  {
    v31[0] = 0;
    v31[1] = 0;
    v32 = 0;
    if (v18)
    {
LABEL_3:
      objc_msgSend(v18, "ear_toString");
      if (v19)
        goto LABEL_4;
      goto LABEL_9;
    }
  }
  v29[0] = 0;
  v29[1] = 0;
  v30 = 0;
  if (v19)
  {
LABEL_4:
    objc_msgSend(v19, "ear_toString");
    if (v20)
      goto LABEL_5;
LABEL_10:
    v25[0] = 0;
    v25[1] = 0;
    v26 = 0;
    if (v21)
      goto LABEL_6;
    goto LABEL_11;
  }
LABEL_9:
  v27[0] = 0;
  v27[1] = 0;
  v28 = 0;
  if (!v20)
    goto LABEL_10;
LABEL_5:
  objc_msgSend(v20, "ear_toString");
  if (v21)
  {
LABEL_6:
    objc_msgSend(v21, "ear_toString");
    goto LABEL_12;
  }
LABEL_11:
  __p[0] = 0;
  __p[1] = 0;
  v24 = 0;
LABEL_12:
  (*(void (**)(SyncSpeechRecognizer *, uint64_t, void **, void **, void **, void **, void **, BOOL, BOOL))(*(_QWORD *)ptr + 24))(ptr, v15, v31, v29, v27, v25, __p, a9, a10);
  if (SHIBYTE(v24) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v26) < 0)
    operator delete(v25[0]);
  if (SHIBYTE(v28) < 0)
    operator delete(v27[0]);
  if (SHIBYTE(v30) < 0)
    operator delete(v29[0]);
  if (SHIBYTE(v32) < 0)
    operator delete(v31[0]);

}

- (id)getSpeechRecognitionResultFromTokens:()vector<std:(std:(id)a4 :allocator<std::vector<quasar::Token>>> *)a3 :vector<quasar::Token> taskName:
{
  id v6;
  _EARFormatter *v7;
  id v8;
  uint64_t *begin;
  void *end;
  id v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  _EARSpeechRecognition *v16;
  void *v17;
  id v18;
  _EARSpeechRecognition *v19;
  void *v20;
  id v21;
  _EARSpeechRecognition *v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t i;
  _EARSpeechRecognitionResult *v34;
  void *v35;
  void *v36;
  id v37;
  void *v39;
  id v40;
  uint64_t v41[3];
  uint64_t v42[3];
  __int128 v43;
  uint64_t v44;
  void **v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  uint64_t v49;
  void ***v50;
  _QWORD *v51;
  unint64_t v52;
  void **v53;
  _QWORD *v54;
  unint64_t v55;
  void **v56;

  v6 = a4;
  v7 = self->_formatter;
  v8 = v6;
  v53 = 0;
  v54 = 0;
  v55 = 0;
  v50 = 0;
  v51 = 0;
  v52 = 0;
  begin = (uint64_t *)a3->__begin_;
  end = a3->__end_;
  v39 = v8;
  if (a3->__begin_ != end)
  {
    v11 = v8;
    do
    {
      v48 = 0uLL;
      v49 = 0;
      std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(&v48, *begin, begin[1], 0x6DB6DB6DB6DB6DB7 * ((begin[1] - *begin) >> 5));
      v45 = 0;
      v46 = 0;
      v47 = 0;
      if (v7)
      {
        -[_EARFormatter formatWords:unrepairedWordsOut:task:](v7, "formatWords:unrepairedWordsOut:task:", begin, &v45, v11);
        std::vector<quasar::Token>::__vdeallocate((void **)&v48);
        v48 = v43;
        v49 = v44;
        v44 = 0;
        v43 = 0uLL;
        v56 = (void **)&v43;
        std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v56);
      }
      v12 = v54;
      if ((unint64_t)v54 >= v55)
      {
        v13 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)&v53, (uint64_t *)&v48);
      }
      else
      {
        *v54 = 0;
        v12[1] = 0;
        v12[2] = 0;
        std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v12, v48, *((uint64_t *)&v48 + 1), 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*((_QWORD *)&v48 + 1) - v48) >> 5));
        v13 = (uint64_t)(v12 + 3);
      }
      v54 = (_QWORD *)v13;
      v14 = v51;
      if ((unint64_t)v51 >= v52)
      {
        v15 = std::vector<std::vector<quasar::Token>>::__push_back_slow_path<std::vector<quasar::Token> const&>((uint64_t *)&v50, (uint64_t *)&v45);
      }
      else
      {
        *v51 = 0;
        v14[1] = 0;
        v14[2] = 0;
        std::vector<quasar::Token>::__init_with_size[abi:ne180100]<quasar::Token*,quasar::Token*>(v14, (uint64_t)v45, v46, 0x6DB6DB6DB6DB6DB7 * ((v46 - (uint64_t)v45) >> 5));
        v15 = (uint64_t)(v14 + 3);
      }
      v51 = (_QWORD *)v15;
      *(_QWORD *)&v43 = &v45;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
      v45 = (void **)&v48;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v45);
      begin += 3;
    }
    while (begin != end);
  }
  v16 = [_EARSpeechRecognition alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[_EARSpeechRecognition _initWithNBestList:useHatText:endsOfSentencePunctuations:](v16, "_initWithNBestList:useHatText:endsOfSentencePunctuations:", a3, 1, v17);

  if (v7)
  {
    v19 = [_EARSpeechRecognition alloc];
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_EARSpeechRecognition _initWithNBestList:useHatText:endsOfSentencePunctuations:](v19, "_initWithNBestList:useHatText:endsOfSentencePunctuations:", &v53, 0, v20);

  }
  else
  {
    v21 = v18;
  }
  v22 = [_EARSpeechRecognition alloc];
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[_EARSpeechRecognition _initWithNBestList:useHatText:endsOfSentencePunctuations:](v22, "_initWithNBestList:useHatText:endsOfSentencePunctuations:", &v50, 0, v23);

  v25 = -[_EARSpeechRecognitionResultPackage _initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:]([_EARSpeechRecognitionResultPackage alloc], "_initWithRecognition:preITNRecognition:unrepairedRecognition:recognitionIsFormatted:isFinal:", v21, v18, v24, v7 != 0, 1);
  *(_QWORD *)&v48 = &v50;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
  v50 = &v53;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v50);

  v40 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v25, "recognition");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "nBest");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v25, "preITNRecognition");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "nBest");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_msgSend(v27, "count");
  if (v30 >= objc_msgSend(v29, "count"))
    v31 = v29;
  else
    v31 = v27;
  v32 = objc_msgSend(v31, "count");
  if (v32)
  {
    for (i = 0; i != v32; ++i)
    {
      v34 = [_EARSpeechRecognitionResult alloc];
      objc_msgSend(v27, "objectAtIndex:", i);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v35, v42);
      objc_msgSend(v29, "objectAtIndex:", i);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v36, v41);
      v37 = -[_EARSpeechRecognitionResult _initWithTokens:preITNTokens:](v34, "_initWithTokens:preITNTokens:", v42, v41);
      v53 = (void **)v41;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v53);

      v53 = (void **)v42;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100](&v53);

      objc_msgSend(v40, "addObject:", v37);
    }
  }

  return v40;
}

- (id)resultsWithAddedAudio:(id)a3 numberOfSamples:(unint64_t)a4 taskName:(id)a5
{
  id v8;
  std::__shared_weak_count *v9;
  unint64_t *p_shared_owners;
  unint64_t v11;
  void *v12;
  _QWORD v14[3];
  void **v15;
  std::__shared_weak_count *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;

  v8 = a5;
  (*(void (**)(void ***__return_ptr, SyncSpeechRecognizer *, uint64_t, unint64_t))(*(_QWORD *)self->_syncRecognizer.__ptr_
                                                                                                  + 32))(&v15, self->_syncRecognizer.__ptr_, objc_msgSend(objc_retainAutorelease(a3), "bytes"), a4);
  v18 = 0;
  v19 = 0;
  v17 = 0;
  std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(&v17, (uint64_t *)*v15, (uint64_t *)v15[1], 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v15[1] - (_BYTE *)*v15) >> 3));
  v9 = v16;
  if (v16)
  {
    p_shared_owners = (unint64_t *)&v16->__shared_owners_;
    do
      v11 = __ldaxr(p_shared_owners);
    while (__stlxr(v11 - 1, p_shared_owners));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v9->__on_zero_shared)(v9);
      std::__shared_weak_count::__release_weak(v9);
    }
  }
  memset(v14, 0, sizeof(v14));
  std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(v14, v17, v18, 0xAAAAAAAAAAAAAAABLL * (v18 - v17));
  -[_EARSyncSpeechRecognizer getSpeechRecognitionResultFromTokens:taskName:](self, "getSpeechRecognitionResultFromTokens:taskName:", v14, v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void **)v14;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v15);
  v15 = (void **)&v17;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v15);

  return v12;
}

- (id)resultsWithAddedFloatAudio:(id)a3 numberOfSamples:(unint64_t)a4 taskName:(id)a5
{
  id v8;
  id v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  void *v13;
  _QWORD v15[3];
  void **v16;
  std::__shared_weak_count *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;

  v8 = a3;
  v9 = a5;
  v18 = 0;
  v19 = 0;
  v20 = 0;
  if (objc_msgSend(v8, "length") >= 4 * a4)
  {
    (*(void (**)(void ***__return_ptr, SyncSpeechRecognizer *, uint64_t, unint64_t))(*(_QWORD *)self->_syncRecognizer.__ptr_ + 48))(&v16, self->_syncRecognizer.__ptr_, objc_msgSend(objc_retainAutorelease(v8), "bytes"), a4);
    if (&v18 != (uint64_t **)v16)
      std::vector<std::vector<quasar::Token>>::__assign_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>((uint64_t)&v18, (uint64_t *)*v16, (uint64_t *)v16[1], 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v16[1] - (_BYTE *)*v16) >> 3));
    v10 = v17;
    if (v17)
    {
      p_shared_owners = (unint64_t *)&v17->__shared_owners_;
      do
        v12 = __ldaxr(p_shared_owners);
      while (__stlxr(v12 - 1, p_shared_owners));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
  }
  memset(v15, 0, sizeof(v15));
  std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(v15, v18, v19, 0xAAAAAAAAAAAAAAABLL * (v19 - v18));
  -[_EARSyncSpeechRecognizer getSpeechRecognitionResultFromTokens:taskName:](self, "getSpeechRecognitionResultFromTokens:taskName:", v15, v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void **)v15;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v16);
  v16 = (void **)&v18;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v16);

  return v13;
}

- (id)resultsWithEndedAudio
{
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  void *v6;
  _QWORD v8[3];
  void **v9;
  std::__shared_weak_count *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t v13;

  (*(void (**)(void ***__return_ptr))(*(_QWORD *)self->_syncRecognizer.__ptr_ + 56))(&v9);
  v12 = 0;
  v13 = 0;
  v11 = 0;
  std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(&v11, (uint64_t *)*v9, (uint64_t *)v9[1], 0xAAAAAAAAAAAAAAABLL * (((_BYTE *)v9[1] - (_BYTE *)*v9) >> 3));
  v3 = v10;
  if (v10)
  {
    p_shared_owners = (unint64_t *)&v10->__shared_owners_;
    do
      v5 = __ldaxr(p_shared_owners);
    while (__stlxr(v5 - 1, p_shared_owners));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }
  memset(v8, 0, sizeof(v8));
  std::vector<std::vector<quasar::Token>>::__init_with_size[abi:ne180100]<std::vector<quasar::Token>*,std::vector<quasar::Token>*>(v8, v11, v12, 0xAAAAAAAAAAAAAAABLL * (v12 - v11));
  -[_EARSyncSpeechRecognizer getSpeechRecognitionResultFromTokens:taskName:](self, "getSpeechRecognitionResultFromTokens:taskName:", v8, CFSTR("Ending current audio stream."));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void **)v8;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v9);
  v9 = (void **)&v11;
  std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100](&v9);
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configPath, 0);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_syncRecognizer);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_formatterQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  *((_QWORD *)self + 4) = 0;
  return self;
}

- (void)initWithConfiguration:(int)a1 memoryLock:(NSObject *)a2 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1AD756000, a2, OS_LOG_TYPE_ERROR, "Could not build recognizer: %d", (uint8_t *)v2, 8u);
}

@end
