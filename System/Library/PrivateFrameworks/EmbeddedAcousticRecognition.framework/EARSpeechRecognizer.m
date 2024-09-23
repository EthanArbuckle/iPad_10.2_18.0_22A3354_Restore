@implementation EARSpeechRecognizer

void __228___EARSpeechRecognizer_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  std::string *v13;
  std::string *v14;
  uint64_t v15;
  void *__p[2];
  std::string::size_type v17;
  std::__split_buffer<std::string> __v;

  v3 = a2;
  v4 = v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    *(_OWORD *)__p = 0uLL;
    v17 = 0;
  }
  v6 = *(_QWORD *)(v5 + 64);
  v7 = *(_QWORD *)(v5 + 56);
  if (v7 >= v6)
  {
    v8 = *(_QWORD *)(v5 + 48);
    v9 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v7 - v8) >> 3);
    v10 = v9 + 1;
    if (v9 + 1 > 0xAAAAAAAAAAAAAAALL)
      std::vector<int>::__throw_length_error[abi:ne180100]();
    v11 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v6 - v8) >> 3);
    if (2 * v11 > v10)
      v10 = 2 * v11;
    if (v11 >= 0x555555555555555)
      v12 = 0xAAAAAAAAAAAAAAALL;
    else
      v12 = v10;
    __v.__end_cap_.__value_ = (std::allocator<std::string> *)(v5 + 64);
    if (v12)
      v13 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>(v5 + 64, v12);
    else
      v13 = 0;
    v14 = v13 + v9;
    __v.__first_ = v13;
    __v.__begin_ = v14;
    __v.__end_cap_.__value_ = &v13[v12];
    v14->__r_.__value_.__r.__words[2] = v17;
    *(_OWORD *)&v14->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
    __v.__end_ = v14 + 1;
    std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)(v5 + 48), &__v);
    v15 = *(_QWORD *)(v5 + 56);
    std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
    *(_QWORD *)(v5 + 56) = v15;
  }
  else
  {
    *(_QWORD *)(v7 + 16) = v17;
    *(_OWORD *)v7 = *(_OWORD *)__p;
    *(_QWORD *)(v5 + 56) = v7 + 24;
  }

}

void __228___EARSpeechRecognizer_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn___block_invoke_2(uint64_t a1)
{
  quasar::DecoderOptions *v2;
  double v3;
  uint64_t v4;
  _WORD *v5;
  std::__shared_weak_count *v6;
  unint64_t *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  __int128 v27;
  uint64_t v28;
  void *__p[2];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[4];
  id v46;

  v2 = (quasar::DecoderOptions *)std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation"));
  v3 = *(double *)(*(_QWORD *)(a1 + 32) + 320);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v5 = (_WORD *)quasar::DecoderOptions::defaultDecoderOptions(v2);
  quasar::SpeechRecognizer::make_shared((__int128 *)__p, 10, v3, (__int128 **)(v4 + 48), 1, v5, (uint64_t *)&v27);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 80, &v27);
  v6 = (std::__shared_weak_count *)*((_QWORD *)&v27 + 1);
  if (*((_QWORD *)&v27 + 1))
  {
    v7 = (unint64_t *)(*((_QWORD *)&v27 + 1) + 8);
    do
      v8 = __ldaxr(v7);
    while (__stlxr(v8 - 1, v7));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (SBYTE7(v30) < 0)
    operator delete(__p[0]);
  v9 = *(void **)(a1 + 48);
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __228___EARSpeechRecognizer_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn___block_invoke_3;
  v45[3] = &unk_1E5D46DA8;
  v46 = *(id *)(a1 + 32);
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v45);
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  v11 = *(void **)(a1 + 56);
  if (v11)
  {
    objc_msgSend(v11, "speechRecognizerActiveConfiguration");
  }
  else
  {
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    *(_OWORD *)__p = 0u;
    v30 = 0u;
  }
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("enableParallelLoading"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "BOOLValue");
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("keepANEModelLoaded"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");
  objc_msgSend(*(id *)(a1 + 64), "objectForKeyedSubscript:", CFSTR("taskForMemoryLock"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "ear_toString");
  }
  else
  {
    v27 = 0uLL;
    v28 = 0;
  }
  v18 = *(_QWORD *)(a1 + 32);
  v19 = *(std::__shared_weak_count **)(v18 + 232);
  v25 = *(_QWORD *)(v18 + 224);
  v26 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
    v18 = *(_QWORD *)(a1 + 32);
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = quasar::SpeechRecognizer::init(v10, (const quasar::SpeechRecognizerActiveConfiguration *)__p, v13, v15, (uint64_t)&v27, &v25, *(unsigned __int8 *)(v18 + 248));
  v22 = v26;
  if (v26)
  {
    v23 = (unint64_t *)&v26->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  if (SHIBYTE(v28) < 0)
    operator delete((void *)v27);

  quasar::SpeechRecognizerActiveConfiguration::~SpeechRecognizerActiveConfiguration((char **)__p);
}

void __228___EARSpeechRecognizer_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  std::string __p;
  void *v10[2];
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80);
  if (v5)
  {
    objc_msgSend(v5, "ear_toString");
    if (v7)
    {
LABEL_3:
      objc_msgSend(v7, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v10[0] = 0;
    v10[1] = 0;
    v11 = 0;
    if (v6)
      goto LABEL_3;
  }
  memset(&__p, 0, sizeof(__p));
LABEL_6:
  quasar::SpeechRecognizer::AddConfigOverride(v8, (unsigned __int8 *)v10, &__p);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v11) < 0)
    operator delete(v10[0]);

}

void __228___EARSpeechRecognizer_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn___block_invoke_498(uint64_t a1, void *a2)
{
  void *v3;
  int v4;

  objc_msgSend(a2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("textfield-editing"));

  if (v4)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
}

void __228___EARSpeechRecognizer_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn___block_invoke_2_503(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  _EARFormatter *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  EARLogger *v11;
  NSObject *v12;
  unint64_t v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  id v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  char v33;
  void *v34[2];
  char v35;
  __int128 *v36[3];
  void *v37[2];
  char v38;
  void *v39[2];
  char v40;
  void *v41[2];
  char v42;
  void *v43[3];
  void *v44;
  unint64_t v45;
  unint64_t v46;
  void **v47;
  std::string buf;
  _BYTE v49[22];
  __int128 v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  __int128 v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  __int128 v58;
  uint64_t v59;
  int v60;
  __int16 v61;
  __int128 __p;
  uint64_t v63;
  __int128 v64;
  int v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "systemUptime");
    v4 = v3;

    v5 = -[_EARFormatter initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:skipPathsExistCheck:]([_EARFormatter alloc], "initWithQuasarConfig:overrideConfigFiles:supportEmojiRecognition:language:skipPathsExistCheck:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 65), *(_QWORD *)(a1 + 56), 1);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 16);
    *(_QWORD *)(v6 + 16) = v5;

    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "systemUptime");
    v10 = v9;

    EARLogger::QuasarOSLogger(v11);
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
      *(double *)((char *)buf.__r_.__value_.__r.__words + 4) = v10 - v4;
      _os_log_impl(&dword_1AD756000, v12, OS_LOG_TYPE_INFO, "Formatter initialization time: %f", (uint8_t *)&buf, 0xCu);
    }

    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16))
    {
      v44 = 0;
      v45 = 0;
      v46 = 0;
      memset(v43, 0, sizeof(v43));
      std::string::basic_string[abi:ne180100]<0>(v41, "DUMMYTOKEN");
      std::string::basic_string[abi:ne180100]<0>(v39, "");
      std::string::basic_string[abi:ne180100]<0>(v37, "");
      memset(v36, 0, sizeof(v36));
      std::string::basic_string[abi:ne180100]<0>(v34, "");
      quasar::Token::Token(&buf, (__int128 *)v41, 0, 0, 0, 0, 0, (__int128 *)v39, 0.0, (__int128 *)v37, v36, 0, (__int128 *)v34, 0, 0);
      v13 = v45;
      if (v45 >= v46)
      {
        v45 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>((uint64_t *)&v44, (__int128 *)&buf);
        if (SHIBYTE(v63) < 0)
          operator delete((void *)__p);
      }
      else
      {
        v14 = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
        *(_QWORD *)(v45 + 16) = *((_QWORD *)&buf.__r_.__value_.__l + 2);
        *(_OWORD *)v13 = v14;
        *(_OWORD *)&buf.__r_.__value_.__l.__data_ = 0uLL;
        v15 = *(_QWORD *)&v49[14];
        *(_OWORD *)(v13 + 24) = *(_OWORD *)v49;
        *(_QWORD *)(v13 + 38) = v15;
        v16 = v51;
        *(_OWORD *)(v13 + 48) = v50;
        *(_QWORD *)(v13 + 64) = v16;
        *(_QWORD *)(v13 + 72) = 0;
        buf.__r_.__value_.__r.__words[2] = 0;
        v50 = 0uLL;
        *(_QWORD *)(v13 + 80) = 0;
        *(_QWORD *)(v13 + 88) = 0;
        *(_OWORD *)(v13 + 72) = v52;
        *(_QWORD *)(v13 + 88) = v53;
        v53 = 0;
        v51 = 0;
        v52 = 0uLL;
        v17 = v54;
        *(_QWORD *)(v13 + 112) = v55;
        *(_QWORD *)(v13 + 120) = 0;
        *(_OWORD *)(v13 + 96) = v17;
        v54 = 0uLL;
        *(_QWORD *)(v13 + 128) = 0;
        *(_QWORD *)(v13 + 136) = 0;
        *(_OWORD *)(v13 + 120) = v56;
        *(_QWORD *)(v13 + 136) = v57;
        v57 = 0;
        v55 = 0;
        v56 = 0uLL;
        v18 = v58;
        *(_QWORD *)(v13 + 160) = v59;
        *(_OWORD *)(v13 + 144) = v18;
        v58 = 0uLL;
        v59 = 0;
        LODWORD(v16) = v60;
        *(_WORD *)(v13 + 172) = v61;
        *(_DWORD *)(v13 + 168) = v16;
        v19 = __p;
        *(_QWORD *)(v13 + 192) = v63;
        *(_OWORD *)(v13 + 176) = v19;
        v63 = 0;
        __p = 0uLL;
        v20 = v64;
        *(_DWORD *)(v13 + 216) = v65;
        *(_OWORD *)(v13 + 200) = v20;
        v45 = v13 + 224;
      }
      if (SHIBYTE(v59) < 0)
        operator delete((void *)v58);
      v47 = (void **)&v56;
      std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v47);
      if (SHIBYTE(v55) < 0)
        operator delete((void *)v54);
      v47 = (void **)&v52;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v47);
      if (SHIBYTE(v51) < 0)
        operator delete((void *)v50);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
      if (v35 < 0)
        operator delete(v34[0]);
      v34[0] = v36;
      std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v34);
      if (v38 < 0)
        operator delete(v37[0]);
      if (v40 < 0)
        operator delete(v39[0]);
      if (v42 < 0)
        operator delete(v41[0]);
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "formatWords:unrepairedWordsOut:task:", &v44, v43, CFSTR("Dictation"));
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v33;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)v43;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
      buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v44;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
    }
    v24 = *(void **)(a1 + 56);
    if (v24 && (v25 = *(void **)(*(_QWORD *)(a1 + 32) + 16)) != 0)
    {
      std::string::basic_string[abi:ne180100]<0>(&v44, (char *)objc_msgSend(objc_retainAutorelease(v24), "UTF8String"));
      objc_msgSend(v25, "endsOfSentencePunctuationsForLanguage:", &v44);
      EARHelpers::ContainerToNSSet<std::unordered_set<std::string>>((uint64_t)&buf);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = *(_QWORD *)(a1 + 32);
      v28 = *(void **)(v27 + 72);
      *(_QWORD *)(v27 + 72) = v26;

      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&buf);
      if (SHIBYTE(v46) < 0)
        operator delete(v44);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(void **)(v30 + 72);
      *(_QWORD *)(v30 + 72) = v29;

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 496), "stringByDeletingLastPathComponent");
    v32 = (id)objc_claimAutoreleasedReturnValue();
    v21 = -[_EARFormatter initNcsWithModelRoot:]([_EARFormatter alloc], "initNcsWithModelRoot:", v32);
    v22 = *(_QWORD *)(a1 + 32);
    v23 = *(void **)(v22 + 16);
    *(_QWORD *)(v22 + 16) = v21;

  }
}

void __75___EARSpeechRecognizer_initWithConfiguration_withLanguage_withSdapiConfig___block_invoke(_QWORD *a1)
{
  _EARFormatter *v2;
  uint64_t v3;
  void *v4;

  v2 = -[_EARFormatter initWithLanguage:withSdapiConfig:quasarConfig:]([_EARFormatter alloc], "initWithLanguage:withSdapiConfig:quasarConfig:", a1[5], a1[6], *(_QWORD *)(a1[4] + 496));
  v3 = a1[4];
  v4 = *(void **)(v3 + 16);
  *(_QWORD *)(v3 + 16) = v2;

}

void __85___EARSpeechRecognizer_initWithConfiguration_useQuasarFormatter_activeConfiguration___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  _EARFormatter *obj;

  obj = -[_EARFormatter initWithQuasarConfig:]([_EARFormatter alloc], "initWithQuasarConfig:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 496));
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
    objc_storeStrong(WeakRetained + 2, obj);

}

void __46___EARSpeechRecognizer_updateUserProfileData___block_invoke(uint64_t a1)
{
  quasar::SpeechRecognizer::updateLmeProfile(*(quasar::SpeechRecognizer **)(*(_QWORD *)(a1 + 32) + 80), (int **)(a1 + 40));
}

void __45___EARSpeechRecognizer_updateJitProfileData___block_invoke(uint64_t a1)
{
  quasar::SpeechRecognizer::updateLmeProfile(*(quasar::SpeechRecognizer **)(*(_QWORD *)(a1 + 32) + 80), (int **)(a1 + 40));
}

void __116___EARSpeechRecognizer_runRecognitionWithResultStream_language_task_samplingRate_userProfileData_speakerCodeWriter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void **v3;
  uint64_t SysConfig;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  unint64_t *v14;
  unint64_t v15;
  _EARSpeechRecognitionAudioBuffer *v16;
  unint64_t *v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v25;
  std::__shared_weak_count *v26;
  void *v27;
  unint64_t *p_shared_weak_owners;
  unint64_t v29;
  std::__shared_weak_count *v30;
  std::__shared_weak_count *v31;
  unint64_t *v32;
  unint64_t v33;
  std::__shared_weak_count *v34;
  unint64_t *v35;
  unint64_t v36;
  uint64_t v37;
  std::__shared_weak_count *v38;
  void *v39;
  std::__shared_weak_count *v40;
  uint64_t v41;
  std::__shared_weak_count *v42;
  void *__p;
  std::__shared_weak_count *v44;
  uint64_t v45;

  v3 = (void **)(a1 + 32);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 64) && *(_QWORD *)(a1 + 40))
  {
    SysConfig = quasar::SpeechRecognizer::getSysConfig(*(quasar::SpeechRecognizer **)(v2 + 80));
    v5 = *(void **)(a1 + 40);
    if (v5)
    {
      objc_msgSend(v5, "ear_toString");
    }
    else
    {
      __p = 0;
      v44 = 0;
      v45 = 0;
    }
    *((_BYTE *)*v3 + 65) = quasar::localeSupportsVoiceCommands(SysConfig, (unsigned __int8 *)&__p);
    if (SHIBYTE(v45) < 0)
      operator delete(__p);
  }
  else
  {
    *(_BYTE *)(v2 + 65) = 0;
  }
  std::allocate_shared[abi:ne180100]<ResultStreamWrapper,std::allocator<ResultStreamWrapper>,_EARSpeechRecognizer * const {__strong}&,NSDictionary<NSString *,NSString> * {__strong}&,_EARSpeechRecognizer * const {__strong}&* {__strong}&<NSString,NSNumber *>,objc_object  {objcproto33_EARSpeechRecognitionResultStream}* const {__strong}&,NSString const {__strong}&,objc_object  {objcproto30_EARSpeakerCodeWriterInterface}* const {__strong}&,objc_object  {objcproto33_EARSpeechRecognitionResultStream}* const {__strong},void>(v3, (void **)(*(_QWORD *)(a1 + 32) + 328), (void **)(*(_QWORD *)(a1 + 32) + 336), (void **)(a1 + 48), (void **)(a1 + 56), (void **)(a1 + 64), (void **)(a1 + 40), &__p);
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 56);
  v9 = *(_QWORD *)(a1 + 88);
  v10 = *(_QWORD *)(a1 + 72);
  v11 = v44;
  v39 = __p;
  v40 = v44;
  if (v44)
  {
    p_shared_owners = (unint64_t *)&v44->__shared_owners_;
    do
      v13 = __ldxr(p_shared_owners);
    while (__stxr(v13 + 1, p_shared_owners));
  }
  if (v6)
  {
    objc_msgSend(v6, "_audioBufferWithLangauge:task:samplingRate:userProfileData:resultStream:", v7, v8, v9, v10, &v39);
    v11 = v40;
    if (!v40)
      goto LABEL_20;
  }
  else
  {
    v41 = 0;
    v42 = 0;
    if (!v11)
      goto LABEL_20;
  }
  v14 = (unint64_t *)&v11->__shared_owners_;
  do
    v15 = __ldaxr(v14);
  while (__stlxr(v15 - 1, v14));
  if (!v15)
  {
    ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
    std::__shared_weak_count::__release_weak(v11);
  }
LABEL_20:
  v16 = [_EARSpeechRecognitionAudioBuffer alloc];
  v37 = v41;
  v38 = v42;
  if (v42)
  {
    v17 = (unint64_t *)&v42->__shared_owners_;
    do
      v18 = __ldxr(v17);
    while (__stxr(v18 + 1, v17));
  }
  v19 = -[_EARSpeechRecognitionAudioBuffer _initWithAudioBuffer:speechRecognizer:](v16, "_initWithAudioBuffer:speechRecognizer:", &v37, *v3);
  v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v21 = *(void **)(v20 + 40);
  *(_QWORD *)(v20 + 40) = v19;

  v22 = v38;
  if (v38)
  {
    v23 = (unint64_t *)&v38->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  objc_storeWeak((id *)(*(_QWORD *)(a1 + 32) + 112), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40));
  v25 = *(_QWORD *)(a1 + 32);
  v27 = __p;
  v26 = v44;
  if (v44)
  {
    p_shared_weak_owners = (unint64_t *)&v44->__shared_weak_owners_;
    do
      v29 = __ldxr(p_shared_weak_owners);
    while (__stxr(v29 + 1, p_shared_weak_owners));
  }
  v30 = *(std::__shared_weak_count **)(v25 + 128);
  *(_QWORD *)(v25 + 120) = v27;
  *(_QWORD *)(v25 + 128) = v26;
  if (v30)
    std::__shared_weak_count::__release_weak(v30);
  v31 = v42;
  if (v42)
  {
    v32 = (unint64_t *)&v42->__shared_owners_;
    do
      v33 = __ldaxr(v32);
    while (__stlxr(v33 - 1, v32));
    if (!v33)
    {
      ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
      std::__shared_weak_count::__release_weak(v31);
    }
  }
  v34 = v44;
  if (v44)
  {
    v35 = (unint64_t *)&v44->__shared_owners_;
    do
      v36 = __ldaxr(v35);
    while (__stlxr(v36 - 1, v35));
    if (!v36)
    {
      ((void (*)(std::__shared_weak_count *))v34->__on_zero_shared)(v34);
      std::__shared_weak_count::__release_weak(v34);
    }
  }
}

void __96___EARSpeechRecognizer__audioBufferWithLangauge_task_samplingRate_userProfileData_resultStream___block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  __int128 v5;

  (*(void (**)(__int128 *__return_ptr, _QWORD, uint64_t, void (*)(_QWORD *, void (*)(void *), void *)))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80) + 24))(&v5, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80), a1 + 48, _EARSpeechRecognizerExecutor);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48, &v5);
  v2 = (std::__shared_weak_count *)*((_QWORD *)&v5 + 1);
  if (*((_QWORD *)&v5 + 1))
  {
    v3 = (unint64_t *)(*((_QWORD *)&v5 + 1) + 8);
    do
      v4 = __ldaxr(v3);
    while (__stlxr(v4 - 1, v3));
    if (!v4)
    {
      ((void (*)(std::__shared_weak_count *))v2->__on_zero_shared)(v2);
      std::__shared_weak_count::__release_weak(v2);
    }
  }
}

void __67___EARSpeechRecognizer_testFormattingWithOneBestResults_uttMillis___block_invoke(uint64_t a1)
{
  uint64_t v2;
  std::__shared_weak_count *v3;
  unint64_t *v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  __CFString *v13;
  uint64_t v14;
  __CFString *v15;
  __int128 v16;

  v2 = *(_QWORD *)(a1 + 32);
  v14 = 0;
  v15 = CFSTR("Dictation");
  v13 = CFSTR("en_US");
  std::allocate_shared[abi:ne180100]<ResultStreamWrapper,std::allocator<ResultStreamWrapper>,_EARSpeechRecognizer * const {__strong}&,NSDictionary<NSString *,NSString> * {__strong}&,_EARSpeechRecognizer * const {__strong}&* {__strong}&<NSString,NSNumber *>,_EARSyncResultStreamHelper * const {__strong}&,NSString {__strong},decltype(nullptr),_EARSyncResultStreamHelper * const {__strong},void>((void **)(a1 + 32), (void **)(v2 + 328), (void **)(v2 + 336), (void **)(a1 + 40), (void **)&v15, (uint64_t)&v14, (void **)&v13, &v16);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100](*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48, &v16);
  v3 = (std::__shared_weak_count *)*((_QWORD *)&v16 + 1);
  if (*((_QWORD *)&v16 + 1))
  {
    v4 = (unint64_t *)(*((_QWORD *)&v16 + 1) + 8);
    do
      v5 = __ldaxr(v4);
    while (__stlxr(v5 - 1, v4));
    if (!v5)
    {
      ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
      std::__shared_weak_count::__release_weak(v3);
    }
  }

  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(_QWORD *)(a1 + 32);
  v9 = *(_QWORD *)(v6 + 48);
  v8 = *(_QWORD *)(v6 + 56);
  if (v8)
  {
    v10 = (unint64_t *)(v8 + 16);
    do
      v11 = __ldxr(v10);
    while (__stxr(v11 + 1, v10));
  }
  v12 = *(std::__shared_weak_count **)(v7 + 128);
  *(_QWORD *)(v7 + 120) = v9;
  *(_QWORD *)(v7 + 128) = v8;
  if (v12)
    std::__shared_weak_count::__release_weak(v12);
}

void __65___EARSpeechRecognizer_compileRecognizerModelsWithConfiguration___block_invoke(uint64_t a1, void *a2)
{
  EARLogger *v3;
  EARLogger *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (!v3)
  {
LABEL_4:
    EARLogger::QuasarOSLogger(v3);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1AD756000, v7, OS_LOG_TYPE_INFO, "e5ml compilation succeeded, path: %@", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_9;
  }
  -[EARLogger domain](v3, "domain");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.siri.quasar.espressoV2compilation")) & 1) != 0)
  {
    v6 = -[EARLogger code](v4, "code");

    if (v6 == 2)
      goto LABEL_4;
  }
  else
  {

  }
  EARLogger::QuasarOSLogger(v3);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    __65___EARSpeechRecognizer_compileRecognizerModelsWithConfiguration___block_invoke_cold_1();
LABEL_9:

}

uint64_t __41___EARSpeechRecognizer_cancelRecognition__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

uint64_t __50___EARSpeechRecognizer__waitForAsyncRecogToFinish__block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80) + 32))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80));
}

void __41___EARSpeechRecognizer_interruptTraining__block_invoke(uint64_t a1)
{
  quasar::SpeakerCodeTraining::end(*(quasar::SpeakerCodeTraining **)(*(_QWORD *)(a1 + 32) + 32));
}

uint64_t __46___EARSpeechRecognizer_getFormatterWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
}

void __47___EARSpeechRecognizer_setActiveConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  quasar::SpeechRecognizer *v3;
  _OWORD v4[16];

  (*(void (**)(_QWORD))(**(_QWORD **)(*(_QWORD *)(a1 + 32) + 80) + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                 + 80));
  v2 = *(void **)(a1 + 40);
  v3 = *(quasar::SpeechRecognizer **)(*(_QWORD *)(a1 + 32) + 80);
  if (v2)
    objc_msgSend(v2, "speechRecognizerActiveConfiguration");
  else
    memset(v4, 0, sizeof(v4));
  quasar::SpeechRecognizer::setActiveConfiguration(v3, (const quasar::SpeechRecognizerActiveConfiguration *)v4);
  quasar::SpeechRecognizerActiveConfiguration::~SpeechRecognizerActiveConfiguration((char **)v4);
}

void __43___EARSpeechRecognizer_activeConfiguration__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = -[_EARSpeechRecognitionActiveConfiguration _initWithActiveConfiguration:]([_EARSpeechRecognitionActiveConfiguration alloc], "_initWithActiveConfiguration:", quasar::SpeechRecognizer::getActiveConfiguration(*(quasar::SpeechRecognizer **)(*(_QWORD *)(a1 + 32) + 80)));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __83___EARSpeechRecognizer_resumeRecognitionWithLeftContext_rightContext_selectedText___block_invoke(uint64_t a1)
{
  _BYTE *WeakRetained;
  _BYTE *v2;
  void *v3;
  BOOL v4;
  _BYTE *v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)*((_QWORD *)WeakRetained + 2);
    if (v3)
    {
      v5 = v2;
      if (objc_msgSend(v3, "refreshEmojiRecognizer"))
      {
        v2 = v5;
        v4 = v5[278] != 0;
      }
      else
      {
        v4 = 0;
        v2 = v5;
      }
      v2[278] = v4;
    }
  }

}

void __65___EARSpeechRecognizer_compileRecognizerModelsWithConfiguration___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1AD756000, v1, OS_LOG_TYPE_ERROR, "e5ml compilation failed, error: %@ path: %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

@end
