@implementation EMTTranslator

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

- (EMTTranslator)initWithModelURL:(id)a3
{
  return -[EMTTranslator initWithModelURL:task:](self, "initWithModelURL:task:", a3, CFSTR("siri"));
}

- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4
{
  id v6;
  id v7;
  void *v8;
  EMTTranslator *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[EMTTranslator initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:](self, "initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:", v8, v7, 0, -1, 0);

  return v9;
}

- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  EMTTranslator *v11;
  _QWORD v13[2];

  v5 = a5;
  v13[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v13[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[EMTTranslator initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:](self, "initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:", v10, v9, v5, -1, 0);

  return v11;
}

- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void *v12;
  EMTTranslator *v13;
  _QWORD v15[2];

  v7 = a5;
  v15[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v15[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[EMTTranslator initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:](self, "initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:", v12, v11, v7, a6, 0);

  return v13;
}

- (EMTTranslator)initWithModelURL:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6 useGlobalTranslationQueue:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v9;
  id v12;
  id v13;
  void *v14;
  EMTTranslator *v15;
  _QWORD v17[2];

  v7 = a7;
  v9 = a5;
  v17[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v17[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[EMTTranslator initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:](self, "initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:", v14, v13, v9, a6, v7);

  return v15;
}

- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4
{
  return -[EMTTranslator initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:](self, "initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:", a3, a4, 0, -1, 0);
}

- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5
{
  return -[EMTTranslator initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:](self, "initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:", a3, a4, a5, -1, 0);
}

- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6
{
  return -[EMTTranslator initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:](self, "initWithModelURLs:task:skipNonFinalToCatchup:translatorCacheSize:useGlobalTranslationQueue:", a3, a4, a5, a6, 0);
}

- (EMTTranslator)initWithModelURLs:(id)a3 task:(id)a4 skipNonFinalToCatchup:(BOOL)a5 translatorCacheSize:(int64_t)a6 useGlobalTranslationQueue:(BOOL)a7
{
  _BOOL4 v7;
  EMTTranslator *v12;
  EMTTranslator *v13;
  NSOperationQueue *v14;
  NSOperationQueue *translationRequestsQueue;
  void *v16;
  uint64_t v17;
  OS_dispatch_queue *translationQueue;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  SystemConfig *end;
  uint64_t p_info;
  NSObject *v26;
  EMTTranslator *v27;
  void *v29;
  id v31;
  id v32;
  id obj;
  _QWORD block[4];
  EMTTranslator *v35;
  id v36;
  int64_t v37;
  _OWORD v38[2];
  int v39;
  uint64_t v40[3];
  void *__p[2];
  char v42;
  _BYTE v43[1544];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  objc_super v48;
  _BYTE v49[128];
  uint64_t v50;

  v7 = a7;
  v50 = *MEMORY[0x1E0C80C00];
  v32 = a3;
  v31 = a4;
  if (!v31)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EMTTranslator.mm"), 195, CFSTR("Task string cannot be nil"));

  }
  v48.receiver = self;
  v48.super_class = (Class)EMTTranslator;
  v12 = -[EMTTranslator init](&v48, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_skipNonFinalToCatchup = a5;
    v14 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
    translationRequestsQueue = v13->_translationRequestsQueue;
    v13->_translationRequestsQueue = v14;

    -[NSOperationQueue setMaxConcurrentOperationCount:](v13->_translationRequestsQueue, "setMaxConcurrentOperationCount:", 1);
    -[NSOperationQueue progress](v13->_translationRequestsQueue, "progress");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTotalUnitCount:", 1);

    if (v7)
      +[EMTTranslationQueue globalTranslationQueue](EMTTranslationQueue, "globalTranslationQueue");
    else
      +[EMTTranslationQueue createTranslationQueue](EMTTranslationQueue, "createTranslationQueue");
    v17 = objc_claimAutoreleasedReturnValue();
    translationQueue = v13->_translationQueue;
    v13->_translationQueue = (OS_dispatch_queue *)v17;

    objc_storeStrong((id *)&v13->_callbackQueue, MEMORY[0x1E0C80D38]);
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    obj = v32;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v45 != v20)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "URLByAppendingPathComponent:", CFSTR("mt-quasar-config.json"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v43);
          v23 = objc_retainAutorelease(v22);
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v23, "fileSystemRepresentation"));
          memset(v40, 0, sizeof(v40));
          memset(v38, 0, sizeof(v38));
          v39 = 1065353216;
          quasar::SystemConfig::readJsonFile((uint64_t)v43, (uint64_t)__p, v40, (uint64_t)v38, 0, 0);
          std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v38);
          *(_QWORD *)&v38[0] = v40;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v38);
          if (v42 < 0)
            operator delete(__p[0]);
          end = v13->_configs.__end_;
          if (end >= v13->_configs.__end_cap_.__value_)
          {
            p_info = std::vector<quasar::SystemConfig>::__push_back_slow_path<quasar::SystemConfig const&>((uint64_t *)&v13->_configs, (const quasar::SystemConfig *)v43);
          }
          else
          {
            quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v13->_configs.__end_, (const quasar::SystemConfig *)v43, 1, 1);
            p_info = (uint64_t)&end[32].info;
            v13->_configs.__end_ = (SystemConfig *)((char *)end + 1544);
          }
          v13->_configs.__end_ = (SystemConfig *)p_info;
          quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v43);

        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v19);
    }

    v26 = v13->_translationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __108__EMTTranslator_initWithModelURLs_task_skipNonFinalToCatchup_translatorCacheSize_useGlobalTranslationQueue___block_invoke;
    block[3] = &unk_1E5D48A70;
    v35 = v13;
    v36 = v31;
    v37 = a6;
    dispatch_async(v26, block);

  }
  v27 = v13;

  return v27;
}

void __108__EMTTranslator_initWithModelURLs_task_skipNonFinalToCatchup_translatorCacheSize_useGlobalTranslationQueue___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t *v4;
  std::__shared_weak_count *v5;
  unint64_t *v6;
  unint64_t v7;
  __int128 __p;
  uint64_t v9;
  __int128 v10;

  v3 = *(_QWORD *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = (uint64_t *)(v3 + 56);
  if (v2)
  {
    objc_msgSend(v2, "ear_toString");
  }
  else
  {
    __p = 0uLL;
    v9 = 0;
  }
  quasar::TranslatorFactory::createTranslatorFactory(v4, &__p, *(_DWORD *)(a1 + 48), &v10);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 8, &v10);
  v5 = (std::__shared_weak_count *)*((_QWORD *)&v10 + 1);
  if (*((_QWORD *)&v10 + 1))
  {
    v6 = (unint64_t *)(*((_QWORD *)&v10 + 1) + 8);
    do
      v7 = __ldaxr(v6);
    while (__stlxr(v7 - 1, v6));
    if (!v7)
    {
      ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
      std::__shared_weak_count::__release_weak(v5);
    }
  }
  if (SHIBYTE(v9) < 0)
    operator delete((void *)__p);
}

- (void)loadTranslatorFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *translationQueue;
  _QWORD block[4];
  id v10;
  id v11;
  EMTTranslator *v12;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqual:", v7) & 1) == 0)
  {
    translationQueue = self->_translationQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __39__EMTTranslator_loadTranslatorFrom_to___block_invoke;
    block[3] = &unk_1E5D46FD8;
    v10 = v6;
    v11 = v7;
    v12 = self;
    dispatch_async(translationQueue, block);

  }
}

void __39__EMTTranslator_loadTranslatorFrom_to___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  void *__p[2];
  uint64_t v10;
  void *v11[2];
  uint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localeIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (!v2)
  {
    v11[0] = 0;
    v11[1] = 0;
    v12 = 0;
    if (v3)
      goto LABEL_3;
LABEL_5:
    __p[0] = 0;
    __p[1] = 0;
    v10 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v2, "ear_toString");
  if (!v4)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v4, "ear_toString");
LABEL_6:
  (*(void (**)(uint64_t *__return_ptr, uint64_t, void **, void **))(*(_QWORD *)v5 + 16))(&v13, v5, v11, __p);
  v6 = v14;
  if (v14)
  {
    p_shared_owners = (unint64_t *)&v14->__shared_owners_;
    do
      v8 = __ldaxr(p_shared_owners);
    while (__stlxr(v8 - 1, p_shared_owners));
    if (!v8)
    {
      ((void (*)(std::__shared_weak_count *))v6->__on_zero_shared)(v6);
      std::__shared_weak_count::__release_weak(v6);
    }
  }
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v12) < 0)
    operator delete(v11[0]);

}

- (BOOL)isCompileRequiredFrom:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  NSObject *translationQueue;
  _QWORD v12[4];
  id v13;
  id v14;
  EMTTranslator *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    if ((objc_msgSend(v6, "isEqual:", v7) & 1) != 0)
    {
      v9 = 0;
    }
    else
    {
      v17 = 0;
      v18 = &v17;
      v19 = 0x2020000000;
      v20 = 0;
      translationQueue = self->_translationQueue;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __42__EMTTranslator_isCompileRequiredFrom_to___block_invoke;
      v12[3] = &unk_1E5D48A98;
      v13 = v6;
      v15 = self;
      v16 = &v17;
      v14 = v8;
      dispatch_async_and_wait(translationQueue, v12);
      v9 = *((_BYTE *)v18 + 24) != 0;

      _Block_object_dispose(&v17, 8);
    }
  }

  return v9;
}

void __42__EMTTranslator_isCompileRequiredFrom_to___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *__p[2];
  uint64_t v7;
  void *v8[2];
  uint64_t v9;

  objc_msgSend(*(id *)(a1 + 32), "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "localeIdentifier");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  if (v2)
  {
    objc_msgSend(v2, "ear_toString");
    if (v4)
    {
LABEL_3:
      objc_msgSend(v4, "ear_toString");
      goto LABEL_6;
    }
  }
  else
  {
    v8[0] = 0;
    v8[1] = 0;
    v9 = 0;
    if (v3)
      goto LABEL_3;
  }
  __p[0] = 0;
  __p[1] = 0;
  v7 = 0;
LABEL_6:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = (*(uint64_t (**)(uint64_t, void **, void **))(*(_QWORD *)v5 + 40))(v5, v8, __p);
  if (SHIBYTE(v7) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v9) < 0)
    operator delete(v8[0]);

}

- (void)translateSpeech:(id)a3 completion:(id)a4
{
  -[EMTTranslator translateSpeech:from:to:completion:](self, "translateSpeech:from:to:completion:", a3, 0, 0, a4);
}

- (void)translateSpeech:(id)a3 from:(id)a4 to:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  v22 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  objc_msgSend(v10, "rawTranscription");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "segments");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__EMTTranslator_translateSpeech_from_to_completion___block_invoke;
  v16[3] = &unk_1E5D48AC0;
  v16[4] = &v17;
  objc_msgSend(v15, "enumerateObjectsUsingBlock:", v16);

  -[EMTTranslator translateTokens:from:to:spans:options:completion:](self, "translateTokens:from:to:spans:options:completion:", v18[5], v11, v12, 0, 0, v13);
  _Block_object_dispose(&v17, 8);

}

void __52__EMTTranslator_translateSpeech_from_to_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(a2, "substring");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:");

}

- (void)translateString:(id)a3 completion:(id)a4
{
  -[EMTTranslator translateString:from:to:options:completion:](self, "translateString:from:to:options:completion:", a3, 0, 0, 0, a4);
}

- (void)translateString:(id)a3 from:(id)a4 to:(id)a5 completion:(id)a6
{
  -[EMTTranslator translateString:from:to:options:completion:](self, "translateString:from:to:options:completion:", a3, a4, a5, 0, a6);
}

- (void)translateString:(id)a3 from:(id)a4 to:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *translationQueue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  translationQueue = self->_translationQueue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __60__EMTTranslator_translateString_from_to_options_completion___block_invoke;
  v23[3] = &unk_1E5D48AE8;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(translationQueue, v23);

}

void __60__EMTTranslator_translateString_from_to_options_completion___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t *p_shared_owners;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  void **v13;
  std::__shared_weak_count *v14;
  std::string v15;
  __int128 **v16;
  std::__shared_weak_count *v17;
  __int128 *v18;
  __int128 *v19;
  uint64_t v20;
  std::string *v21;

  v2 = (void *)a1[4];
  if (v2)
  {
    objc_msgSend(v2, "_tokenizeString:", a1[5]);
    v3 = (void *)a1[4];
    if (v3)
    {
      objc_msgSend(v3, "_prepareFor:to:", a1[6], a1[7]);
      v4 = (void *)a1[4];
      goto LABEL_6;
    }
  }
  else
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
  }
  v4 = 0;
  v16 = 0;
  v17 = 0;
LABEL_6:
  memset(&v15, 0, sizeof(v15));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v15, v18, v19, 0xAAAAAAAAAAAAAAABLL * (((char *)v19 - (char *)v18) >> 3));
  v13 = (void **)v16;
  v14 = v17;
  if (v17)
  {
    p_shared_owners = (unint64_t *)&v17->__shared_owners_;
    do
      v6 = __ldxr(p_shared_owners);
    while (__stxr(v6 + 1, p_shared_owners));
  }
  objc_msgSend(v4, "_dispatchTranslationRequest:isFinal:spans:translator:sourceLocale:targetLocale:options:completion:", &v15, 1, 0, &v13, a1[6], a1[7], a1[8], a1[9]);
  v7 = v14;
  if (v14)
  {
    v8 = (unint64_t *)&v14->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  v21 = &v15;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v21);
  v10 = v17;
  if (v17)
  {
    v11 = (unint64_t *)&v17->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v16 = &v18;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v16);
}

- (void)translateString:(id)a3 from:(id)a4 to:(id)a5 overrides:(id)a6 completion:(id)a7
{
  -[EMTTranslator translateString:from:to:options:completion:](self, "translateString:from:to:options:completion:", a3, a4, a5, 0, a7);
}

- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 completion:(id)a6
{
  -[EMTTranslator translateTokens:from:to:spans:options:completion:](self, "translateTokens:from:to:spans:options:completion:", a3, a4, a5, 0, 0, a6);
}

- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 spans:(id)a6 completion:(id)a7
{
  -[EMTTranslator translateTokens:from:to:spans:options:completion:](self, "translateTokens:from:to:spans:options:completion:", a3, a4, a5, a6, 0, a7);
}

- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 spans:(id)a6 options:(id)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *translationQueue;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  EMTTranslator *v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  translationQueue = self->_translationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__EMTTranslator_translateTokens_from_to_spans_options_completion___block_invoke;
  block[3] = &unk_1E5D48B10;
  v28 = v14;
  v29 = self;
  v30 = v15;
  v31 = v16;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v21 = v19;
  v22 = v18;
  v23 = v17;
  v24 = v16;
  v25 = v15;
  v26 = v14;
  dispatch_async(translationQueue, block);

}

void __66__EMTTranslator_translateTokens_from_to_spans_options_completion___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  std::vector<std::string>::pointer end;
  __int128 v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  std::string *v11;
  std::string *v12;
  __int128 v13;
  std::string *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  unint64_t *p_size;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  std::__split_buffer<std::string>::pointer first;
  std::__split_buffer<std::string>::pointer begin;
  std::string v29;
  void *__p[2];
  std::string::size_type v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  std::vector<std::string> v36;
  std::__split_buffer<std::string> __v;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  memset(&v36, 0, sizeof(v36));
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v33 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (v5)
        {
          objc_msgSend(v5, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v31 = 0;
        }
        end = v36.__end_;
        if (v36.__end_ >= v36.__end_cap_.__value_)
        {
          v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v36.__end_ - (char *)v36.__begin_) >> 3);
          v9 = v8 + 1;
          if (v8 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v36.__end_cap_.__value_ - (char *)v36.__begin_) >> 3) > v9)
            v9 = 0x5555555555555556 * (((char *)v36.__end_cap_.__value_ - (char *)v36.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v36.__end_cap_.__value_ - (char *)v36.__begin_) >> 3) >= 0x555555555555555)
            v10 = 0xAAAAAAAAAAAAAAALL;
          else
            v10 = v9;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v36.__end_cap_;
          if (v10)
            v11 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v36.__end_cap_, v10);
          else
            v11 = 0;
          v12 = v11 + v8;
          __v.__first_ = v11;
          __v.__begin_ = v12;
          __v.__end_cap_.__value_ = &v11[v10];
          v13 = *(_OWORD *)__p;
          v12->__r_.__value_.__r.__words[2] = v31;
          *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
          __p[1] = 0;
          v31 = 0;
          __p[0] = 0;
          __v.__end_ = v12 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v36, &__v);
          v14 = v36.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v36.__end_ = v14;
        }
        else
        {
          v7 = *(_OWORD *)__p;
          v36.__end_->__r_.__value_.__r.__words[2] = v31;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v7;
          v36.__end_ = end + 1;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v2);
  }

  v15 = *(void **)(a1 + 40);
  if (v15)
  {
    objc_msgSend(v15, "_prepareFor:to:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
    v16 = *(void **)(a1 + 40);
  }
  else
  {
    v16 = 0;
    __v.__first_ = 0;
    __v.__begin_ = 0;
  }
  memset(&v29, 0, sizeof(v29));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v29, (__int128 *)v36.__begin_, (__int128 *)v36.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v36.__end_ - (char *)v36.__begin_) >> 3));
  v17 = *(_QWORD *)(a1 + 64);
  first = __v.__first_;
  begin = __v.__begin_;
  if (__v.__begin_)
  {
    p_size = &__v.__begin_->__r_.__value_.__l.__size_;
    do
      v19 = __ldxr(p_size);
    while (__stxr(v19 + 1, p_size));
  }
  objc_msgSend(v16, "_dispatchTranslationRequest:isFinal:spans:translator:sourceLocale:targetLocale:options:completion:", &v29, 1, v17, &first, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80));
  v20 = (std::__shared_weak_count *)begin;
  if (begin)
  {
    v21 = &begin->__r_.__value_.__l.__size_;
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  __p[0] = &v29;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)__p);
  v23 = (std::__shared_weak_count *)__v.__begin_;
  if (__v.__begin_)
  {
    v24 = &__v.__begin_->__r_.__value_.__l.__size_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v36;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
}

- (void)translateTokens:(id)a3 from:(id)a4 to:(id)a5 spans:(id)a6 overrides:(id)a7 completion:(id)a8
{
  -[EMTTranslator translateTokens:from:to:spans:options:completion:](self, "translateTokens:from:to:spans:options:completion:", a3, a4, a5, a6, 0, a8);
}

- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 completion:(id)a5
{
  -[EMTTranslator translateTokens:isFinal:spans:options:completion:](self, "translateTokens:isFinal:spans:options:completion:", a3, a4, 0, 0, a5);
}

- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 spans:(id)a5 completion:(id)a6
{
  -[EMTTranslator translateTokens:isFinal:spans:options:completion:](self, "translateTokens:isFinal:spans:options:completion:", a3, a4, a5, 0, a6);
}

- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 spans:(id)a5 options:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  NSObject *translationQueue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  EMTTranslator *v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;

  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  translationQueue = self->_translationQueue;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __66__EMTTranslator_translateTokens_isFinal_spans_options_completion___block_invoke;
  v21[3] = &unk_1E5D48B38;
  v22 = v12;
  v23 = self;
  v27 = a4;
  v24 = v13;
  v25 = v14;
  v26 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  v20 = v12;
  dispatch_async(translationQueue, v21);

}

void __66__EMTTranslator_translateTokens_isFinal_spans_options_completion___block_invoke(uint64_t a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  void *v5;
  std::vector<std::string>::pointer end;
  __int128 v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  std::string *v11;
  std::string *v12;
  __int128 v13;
  std::string *v14;
  void *v15;
  int v16;
  uint64_t v17;
  _QWORD *v18;
  std::__shared_weak_count *v19;
  unint64_t *p_shared_owners;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  uint64_t v26;
  std::__shared_weak_count *v27;
  std::string v28;
  void *__p[2];
  std::string::size_type v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  std::vector<std::string> v35;
  std::__split_buffer<std::string> __v;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  memset(&v35, 0, sizeof(v35));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v1 = *(id *)(a1 + 32);
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v32 != v3)
          objc_enumerationMutation(v1);
        v5 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
        if (v5)
        {
          objc_msgSend(v5, "ear_toString");
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v30 = 0;
        }
        end = v35.__end_;
        if (v35.__end_ >= v35.__end_cap_.__value_)
        {
          v8 = 0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_ - (char *)v35.__begin_) >> 3);
          v9 = v8 + 1;
          if (v8 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 3) > v9)
            v9 = 0x5555555555555556 * (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_cap_.__value_ - (char *)v35.__begin_) >> 3) >= 0x555555555555555)
            v10 = 0xAAAAAAAAAAAAAAALL;
          else
            v10 = v9;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v35.__end_cap_;
          if (v10)
            v11 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v35.__end_cap_, v10);
          else
            v11 = 0;
          v12 = v11 + v8;
          __v.__first_ = v11;
          __v.__begin_ = v12;
          __v.__end_cap_.__value_ = &v11[v10];
          v13 = *(_OWORD *)__p;
          v12->__r_.__value_.__r.__words[2] = v30;
          *(_OWORD *)&v12->__r_.__value_.__l.__data_ = v13;
          __p[1] = 0;
          v30 = 0;
          __p[0] = 0;
          __v.__end_ = v12 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v35, &__v);
          v14 = v35.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v35.__end_ = v14;
        }
        else
        {
          v7 = *(_OWORD *)__p;
          v35.__end_->__r_.__value_.__r.__words[2] = v30;
          *(_OWORD *)&end->__r_.__value_.__l.__data_ = v7;
          v35.__end_ = end + 1;
        }
      }
      v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v2);
  }

  v15 = *(void **)(a1 + 40);
  memset(&v28, 0, sizeof(v28));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v28, (__int128 *)v35.__begin_, (__int128 *)v35.__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)v35.__end_ - (char *)v35.__begin_) >> 3));
  v16 = *(unsigned __int8 *)(a1 + 72);
  v18 = *(_QWORD **)(a1 + 40);
  v17 = *(_QWORD *)(a1 + 48);
  v19 = (std::__shared_weak_count *)v18[4];
  v26 = v18[3];
  v27 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v21 = __ldxr(p_shared_owners);
    while (__stxr(v21 + 1, p_shared_owners));
    v18 = *(_QWORD **)(a1 + 40);
  }
  objc_msgSend(v15, "_dispatchTranslationRequest:isFinal:spans:translator:sourceLocale:targetLocale:options:completion:", &v28, v16 != 0, v17, &v26, v18[5], v18[6], *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v22 = v27;
  if (v27)
  {
    v23 = (unint64_t *)&v27->__shared_owners_;
    do
      v24 = __ldaxr(v23);
    while (__stlxr(v24 - 1, v23));
    if (!v24)
    {
      ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
      std::__shared_weak_count::__release_weak(v22);
    }
  }
  __v.__first_ = &v28;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
  __v.__first_ = (std::__split_buffer<std::string>::pointer)&v35;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__v);
}

- (void)translateTokens:(id)a3 isFinal:(BOOL)a4 spans:(id)a5 overrides:(id)a6 completion:(id)a7
{
  -[EMTTranslator translateTokens:isFinal:spans:options:completion:](self, "translateTokens:isFinal:spans:options:completion:", a3, a4, a5, 0, a7);
}

- (void)prepareFor:(id)a3 to:(id)a4
{
  id v6;
  id v7;
  NSObject *translationQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  translationQueue = self->_translationQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__EMTTranslator_prepareFor_to___block_invoke;
  block[3] = &unk_1E5D46FD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(translationQueue, block);

}

void __31__EMTTranslator_prepareFor_to___block_invoke(uint64_t a1)
{
  unint64_t *p_shared_owners;
  unint64_t v2;
  std::__shared_weak_count *v3;

  objc_msgSend(*(id *)(a1 + 32), "_prepareFor:to:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v2 = __ldaxr(p_shared_owners);
    while (__stlxr(v2 - 1, p_shared_owners));
    if (!v2)
    {
      ((void (*)())v3->__on_zero_shared)();
      std::__shared_weak_count::__release_weak(v3);
    }
  }
}

- (vector<std::string,)_tokenizeString:(EMTTranslator *)self
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  char *end;
  char *value;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  std::string *v17;
  std::string *v18;
  void *v19;
  vector<std::string, std::allocator<std::string>> *result;
  id v21;
  id obj;
  void *__p[2];
  std::string::size_type v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  std::__split_buffer<std::string> __v;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = a4;
  objc_msgSend(v21, "componentsSeparatedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  obj = v5;
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "lowercaseString");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v9;
        if (v9)
        {
          objc_msgSend(v9, "ear_toString");
        }
        else
        {
          *(_OWORD *)__p = 0uLL;
          v24 = 0;
        }
        end = (char *)retstr->__end_;
        value = (char *)retstr->__end_cap_.__value_;
        if (end >= value)
        {
          v13 = 0xAAAAAAAAAAAAAAABLL * ((end - (char *)retstr->__begin_) >> 3);
          v14 = v13 + 1;
          if (v13 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v15 = 0xAAAAAAAAAAAAAAABLL * ((value - (char *)retstr->__begin_) >> 3);
          if (2 * v15 > v14)
            v14 = 2 * v15;
          if (v15 >= 0x555555555555555)
            v16 = 0xAAAAAAAAAAAAAAALL;
          else
            v16 = v14;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&retstr->__end_cap_;
          if (v16)
            v17 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&retstr->__end_cap_, v16);
          else
            v17 = 0;
          v18 = v17 + v13;
          __v.__first_ = v17;
          __v.__begin_ = v18;
          __v.__end_cap_.__value_ = &v17[v16];
          v18->__r_.__value_.__r.__words[2] = v24;
          *(_OWORD *)&v18->__r_.__value_.__l.__data_ = *(_OWORD *)__p;
          v24 = 0;
          *(_OWORD *)__p = 0uLL;
          __v.__end_ = v18 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)retstr, &__v);
          v19 = retstr->__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          retstr->__end_ = v19;
        }
        else
        {
          *((_QWORD *)end + 2) = v24;
          *(_OWORD *)end = *(_OWORD *)__p;
          v24 = 0;
          *(_OWORD *)__p = 0uLL;
          retstr->__end_ = end + 24;
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v6);
  }

  return result;
}

- (shared_ptr<quasar::Translator>)_prepareFor:(id)a3 to:(id)a4
{
  Translator **v4;
  Translator **v8;
  id v9;
  id v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  TranslatorFactory *ptr;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  __shared_weak_count *cntrl;
  unint64_t *v22;
  unint64_t v23;
  Translator *v24;
  __shared_weak_count *v25;
  void *__p[2];
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  __int128 v30;
  shared_ptr<quasar::Translator> result;

  v8 = v4;
  v9 = a3;
  v10 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_translationQueue);
  if (-[NSLocale isEqual:](self->_sourceLocale, "isEqual:", v9)
    && (-[NSLocale isEqual:](self->_targetLocale, "isEqual:", v10) & 1) != 0)
  {
    goto LABEL_26;
  }
  objc_storeStrong((id *)&self->_sourceLocale, a3);
  objc_storeStrong((id *)&self->_targetLocale, a4);
  if (!v9 || !v10 || objc_msgSend(v9, "isEqual:", v10))
  {
    v28 = 0uLL;
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&self->_translator, &v28);
    v11 = (std::__shared_weak_count *)*((_QWORD *)&v28 + 1);
    if (*((_QWORD *)&v28 + 1))
    {
      v12 = (unint64_t *)(*((_QWORD *)&v28 + 1) + 8);
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    goto LABEL_26;
  }
  objc_msgSend(v9, "localeIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  ptr = self->_translatorFactory.__ptr_;
  if (v14)
  {
    objc_msgSend(v14, "ear_toString");
    if (v16)
    {
LABEL_13:
      objc_msgSend(v16, "ear_toString");
      goto LABEL_16;
    }
  }
  else
  {
    v28 = 0uLL;
    v29 = 0;
    if (v15)
      goto LABEL_13;
  }
  __p[0] = 0;
  __p[1] = 0;
  v27 = 0;
LABEL_16:
  (*(void (**)(__int128 *__return_ptr, TranslatorFactory *, __int128 *, void **))(*(_QWORD *)ptr + 16))(&v30, ptr, &v28, __p);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&self->_translator, &v30);
  v18 = (std::__shared_weak_count *)*((_QWORD *)&v30 + 1);
  if (*((_QWORD *)&v30 + 1))
  {
    v19 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 8);
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  if (SHIBYTE(v27) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v29) < 0)
    operator delete((void *)v28);

LABEL_26:
  cntrl = self->_translator.__cntrl_;
  *v8 = self->_translator.__ptr_;
  v8[1] = (Translator *)cntrl;
  if (cntrl)
  {
    v22 = (unint64_t *)((char *)cntrl + 8);
    do
      v23 = __ldxr(v22);
    while (__stxr(v23 + 1, v22));
  }

  result.__cntrl_ = v25;
  result.__ptr_ = v24;
  return result;
}

- (void)_dispatchTranslationRequest:()vector<std:(std:(BOOL)a4 :(id)a5 allocator<std:(shared_ptr<quasar:(id)a7 :(id)a8 Translator>)a6 :(id)a9 string>> *)a3 :(id)a10 string isFinal:spans:translator:sourceLocale:targetLocale:options:completion:
{
  __shared_weak_count *cntrl;
  Translator *ptr;
  __shared_weak_count *v16;
  id v17;
  uint64_t v18;
  void *v19;
  NSOperationQueue *translationRequestsQueue;
  void *v21;
  id v22;
  __shared_weak_count *v23;
  id v24;
  std::__shared_weak_count *v25;
  uint64_t v26;
  unint64_t *p_shared_owners;
  unint64_t v28;
  id v29;
  id v30;
  void *v31;
  std::__shared_weak_count *v32;
  unint64_t *v33;
  unint64_t v34;
  id v35;
  id v36;
  id v37;
  _QWORD v38[5];
  __shared_weak_count *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  std::string v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  BOOL v47;
  _QWORD v48[5];
  std::string *v49;

  cntrl = a6.__cntrl_;
  ptr = a6.__ptr_;
  v37 = a5;
  v16 = cntrl;
  v36 = a7;
  v35 = a8;
  v17 = a9;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_translationQueue);
  v18 = MEMORY[0x1E0C809B0];
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke;
  v48[3] = &unk_1E5D470A0;
  v48[4] = self;
  objc_msgSend(MEMORY[0x1E0CB34C8], "blockOperationWithBlock:", v48, v17, v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setQueuePriority:", 8);
  -[NSOperationQueue addOperation:](self->_translationRequestsQueue, "addOperation:", v19);
  translationRequestsQueue = self->_translationRequestsQueue;
  v21 = (void *)MEMORY[0x1E0CB34C8];
  v38[0] = v18;
  v38[1] = 3321888768;
  v38[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_2;
  v38[3] = &unk_1E5D468E8;
  v47 = a4;
  v38[4] = self;
  memset(&v44, 0, sizeof(v44));
  std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v44, (__int128 *)a3->__begin_, (__int128 *)a3->__end_, 0xAAAAAAAAAAAAAAABLL * (((char *)a3->__end_ - (char *)a3->__begin_) >> 3));
  v22 = v17;
  v43 = v22;
  v23 = v16;
  v39 = v23;
  v24 = v36;
  v26 = *(_QWORD *)ptr;
  v25 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v40 = v24;
  v45 = v26;
  v46 = v25;
  if (v25)
  {
    p_shared_owners = (unint64_t *)&v25->__shared_owners_;
    do
      v28 = __ldxr(p_shared_owners);
    while (__stxr(v28 + 1, p_shared_owners));
  }
  v29 = v37;
  v41 = v29;
  v30 = v35;
  v42 = v30;
  objc_msgSend(v21, "blockOperationWithBlock:", v38);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSOperationQueue addOperation:](translationRequestsQueue, "addOperation:", v31);

  v32 = v46;
  if (v46)
  {
    v33 = (unint64_t *)&v46->__shared_owners_;
    do
      v34 = __ldaxr(v33);
    while (__stlxr(v34 - 1, v33));
    if (!v34)
    {
      ((void (*)(std::__shared_weak_count *))v32->__on_zero_shared)(v32);
      std::__shared_weak_count::__release_weak(v32);
    }
  }

  v49 = &v44;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v49);

}

void __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "progress");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setTotalUnitCount:", objc_msgSend(v1, "totalUnitCount") + 2);

}

void __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t *v10;
  uint64_t *i;
  EMTToken *v12;
  uint64_t *v13;
  void *v14;
  double v15;
  EMTToken *v16;
  EMTResult *v17;
  double v18;
  EMTResult *v19;
  NSObject *v20;
  EMTResult *v21;
  NSObject *v22;
  __int128 *v23;
  __int128 *v24;
  __int128 v25;
  int v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  int v36;
  int v37;
  int v38;
  int v39;
  char v40;
  char v41;
  int v42;
  std::string::size_type size;
  std::string::size_type v44;
  unint64_t v45;
  unint64_t v46;
  unint64_t v47;
  char *v48;
  char *v49;
  _BYTE *v50;
  std::string::size_type v51;
  std::string::size_type v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t *v60;
  uint64_t *v61;
  EMTToken *v62;
  uint64_t *v63;
  void *v64;
  double v65;
  double v66;
  EMTToken *v67;
  std::string::size_type v68;
  uint64_t v69;
  std::string::size_type v70;
  uint64_t v71;
  id v72;
  int *v73;
  int *v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  EMTAlternative *v80;
  unint64_t v81;
  std::__shared_weak_count *v82;
  unint64_t *p_shared_owners;
  unint64_t v84;
  std::string::size_type v85;
  std::string *v86;
  std::string *v87;
  std::string *v88;
  unint64_t v89;
  std::string::size_type *v90;
  std::string *v91;
  uint64_t v92;
  char *v93;
  EMTAlternative *v94;
  std::__shared_weak_count *v95;
  unint64_t *v96;
  unint64_t v97;
  EMTAlternativeSelectionSpan *v98;
  EMTResult *v99;
  double v100;
  EMTResult *v101;
  NSObject *v102;
  id v103;
  id v104;
  NSObject *v105;
  std::string::size_type v106;
  id v107;
  uint64_t v108;
  void *v109;
  void *v110;
  std::string::size_type k;
  id v112;
  int *v113;
  uint64_t v114;
  uint64_t v115;
  id obj;
  id obja;
  _QWORD v118[4];
  id v119;
  id v120;
  unint64_t v121;
  std::__shared_weak_count *v122;
  _QWORD v123[4];
  id v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  std::string v129;
  std::string v130;
  __int16 v131;
  __int128 __p;
  uint64_t v133;
  uint64_t v134;
  int v135;
  std::string v136;
  std::string v137;
  char v138;
  char v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  int v144;
  unint64_t v145;
  char v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  void *v150;
  char v151;
  char v152;
  char v153;
  char v154;
  char v155;
  char v156;
  _QWORD v157[4];
  id v158;
  _QWORD block[4];
  EMTResult *v160;
  id v161;
  _QWORD v162[4];
  id v163;
  char v164;
  uint64_t v165;
  char *v166;
  _BYTE v167[128];
  uint64_t v168;

  v1 = a1;
  v168 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 80))
  {
    if (!*(_BYTE *)(a1 + 120))
    {
      objc_msgSend(*(id *)(v2 + 88), "progress");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "totalUnitCount");
      objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 88), "progress");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5 + ~objc_msgSend(v6, "completedUnitCount");

      v1 = a1;
      if (v7 > 1)
        return;
    }
  }
  if (*(_QWORD *)(v1 + 88) == *(_QWORD *)(v1 + 80))
  {
    v22 = *(NSObject **)(*(_QWORD *)(v1 + 32) + 112);
    v162[0] = MEMORY[0x1E0C809B0];
    v162[1] = 3221225472;
    v162[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_3;
    v162[3] = &unk_1E5D48B60;
    v163 = *(id *)(v1 + 72);
    dispatch_async(v22, v162);

    return;
  }
  if (objc_msgSend(*(id *)(v1 + 40), "isEqual:", *(_QWORD *)(v1 + 48)))
  {
    v8 = v1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(uint64_t **)(v1 + 80);
    for (i = *(uint64_t **)(v1 + 88); v10 != i; v10 += 3)
    {
      v12 = [EMTToken alloc];
      v13 = v10;
      if (*((char *)v10 + 23) < 0)
        v13 = (uint64_t *)*v10;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v15) = 1148846080;
      v16 = -[EMTToken initWithText:confidence:precededBySpace:followedBySpace:](v12, "initWithText:confidence:precededBySpace:followedBySpace:", v14, 1, 1, v15);

      objc_msgSend(v9, "addObject:", v16);
    }
    v17 = [EMTResult alloc];
    LODWORD(v18) = 1148846080;
    v19 = -[EMTResult initWithLocale:tokens:confidence:lowConfidence:metaInfo:romanization:alternativeSelectionSpans:](v17, "initWithLocale:tokens:confidence:lowConfidence:metaInfo:romanization:alternativeSelectionSpans:", *(_QWORD *)(v8 + 40), v9, 0, 0, 0, 0, v18);
    v20 = *(NSObject **)(*(_QWORD *)(v8 + 32) + 112);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_4;
    block[3] = &unk_1E5D470C8;
    v161 = *(id *)(v8 + 72);
    v160 = v19;
    v21 = v19;
    dispatch_async(v20, block);

    return;
  }
  if (!*(_QWORD *)(v1 + 104))
  {
    v59 = *(NSObject **)(*(_QWORD *)(v1 + 32) + 112);
    v157[0] = MEMORY[0x1E0C809B0];
    v157[1] = 3221225472;
    v157[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_5;
    v157[3] = &unk_1E5D48B60;
    v158 = *(id *)(v1 + 72);
    dispatch_async(v59, v157);

    return;
  }
  v145 = 0xBF80000000000000;
  v146 = 0;
  v152 = 0;
  v153 = 0;
  v154 = 0;
  v147 = 0u;
  v148 = 0u;
  v149 = 0u;
  LOBYTE(v150) = 0;
  v156 = 0;
  v155 = *(_BYTE *)(v1 + 120);
  v108 = v1;
  v23 = *(__int128 **)(v1 + 80);
  v24 = *(__int128 **)(v1 + 88);
  if (v23 != v24)
  {
    do
    {
      if (*((char *)v23 + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v136, *(const std::string::value_type **)v23, *((_QWORD *)v23 + 1));
      }
      else
      {
        v25 = *v23;
        v136.__r_.__value_.__r.__words[2] = *((_QWORD *)v23 + 2);
        *(_OWORD *)&v136.__r_.__value_.__l.__data_ = v25;
      }
      v137 = v136;
      memset(&v136, 0, sizeof(v136));
      v139 = 0;
      v141 = 0;
      v142 = 0;
      v140 = 0;
      v143 = 3212836864;
      v144 = -1;
      v26 = *((char *)v23 + 23);
      v138 = 1;
      if (v26 < 0)
      {
        std::string::__init_copy_ctor_external(&v129, *(const std::string::value_type **)v23, *((_QWORD *)v23 + 1));
      }
      else
      {
        v27 = *v23;
        v129.__r_.__value_.__r.__words[2] = *((_QWORD *)v23 + 2);
        *(_OWORD *)&v129.__r_.__value_.__l.__data_ = v27;
      }
      v130 = v129;
      memset(&v129, 0, sizeof(v129));
      v131 = 0;
      v133 = 0;
      __p = 0uLL;
      v134 = 3212836864;
      v135 = -1;
      v28 = *((_QWORD *)&v147 + 1);
      if (*((_QWORD *)&v147 + 1) >= (unint64_t)v148)
      {
        *((_QWORD *)&v147 + 1) = std::vector<quasar::TranslationToken>::__push_back_slow_path<quasar::TranslationToken>((uint64_t *)&v147, (__int128 *)&v130);
        if ((_QWORD)__p)
        {
          *((_QWORD *)&__p + 1) = __p;
          operator delete((void *)__p);
        }
      }
      else
      {
        v29 = *(_OWORD *)&v130.__r_.__value_.__l.__data_;
        *(_QWORD *)(*((_QWORD *)&v147 + 1) + 16) = *((_QWORD *)&v130.__r_.__value_.__l + 2);
        *(_OWORD *)v28 = v29;
        memset(&v130, 0, sizeof(v130));
        *(_WORD *)(v28 + 24) = v131;
        *(_QWORD *)(v28 + 40) = 0;
        *(_QWORD *)(v28 + 48) = 0;
        *(_QWORD *)(v28 + 32) = 0;
        *(_OWORD *)(v28 + 32) = __p;
        *(_QWORD *)(v28 + 48) = v133;
        __p = 0uLL;
        v133 = 0;
        v30 = v134;
        *(_DWORD *)(v28 + 64) = v135;
        *(_QWORD *)(v28 + 56) = v30;
        *((_QWORD *)&v147 + 1) = v28 + 72;
      }
      if (SHIBYTE(v130.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v130.__r_.__value_.__l.__data_);
      if (SHIBYTE(v129.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v129.__r_.__value_.__l.__data_);
      if (SHIBYTE(v137.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v137.__r_.__value_.__l.__data_);
      v23 = (__int128 *)((char *)v23 + 24);
    }
    while (v23 != v24);
    if ((_QWORD)v147 != *((_QWORD *)&v147 + 1))
      *(_BYTE *)(*((_QWORD *)&v147 + 1) - 48) = 0;
  }
  v31 = *(void **)(v108 + 56);
  if (v31)
  {
    memset(&v137, 0, sizeof(v137));
    v125 = 0u;
    v126 = 0u;
    v127 = 0u;
    v128 = 0u;
    obj = v31;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v167, 16);
    if (v32)
    {
      v33 = *(_QWORD *)v126;
      do
      {
        for (j = 0; j != v32; ++j)
        {
          if (*(_QWORD *)v126 != v33)
            objc_enumerationMutation(obj);
          v35 = *(void **)(*((_QWORD *)&v125 + 1) + 8 * j);
          v36 = objc_msgSend(v35, "range");
          v37 = objc_msgSend(v35, "range");
          objc_msgSend(v35, "range");
          v39 = v38;
          v40 = objc_msgSend(v35, "doNotTranslate");
          v41 = v40;
          v42 = v39 + v37;
          size = v137.__r_.__value_.__l.__size_;
          if (v137.__r_.__value_.__l.__size_ >= v137.__r_.__value_.__r.__words[2])
          {
            v45 = 0xAAAAAAAAAAAAAAABLL
                * ((uint64_t)(v137.__r_.__value_.__l.__size_ - v137.__r_.__value_.__r.__words[0]) >> 2);
            v46 = v45 + 1;
            if (v45 + 1 > 0x1555555555555555)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556
               * ((uint64_t)(v137.__r_.__value_.__r.__words[2] - v137.__r_.__value_.__r.__words[0]) >> 2) > v46)
              v46 = 0x5555555555555556
                  * ((uint64_t)(v137.__r_.__value_.__r.__words[2] - v137.__r_.__value_.__r.__words[0]) >> 2);
            if (0xAAAAAAAAAAAAAAABLL
               * ((uint64_t)(v137.__r_.__value_.__r.__words[2] - v137.__r_.__value_.__r.__words[0]) >> 2) >= 0xAAAAAAAAAAAAAAALL)
              v47 = 0x1555555555555555;
            else
              v47 = v46;
            if (v47)
              v48 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::tuple<int,float,int>>>((uint64_t)&v137.__r_.__value_.__r.__words[2], v47);
            else
              v48 = 0;
            v49 = &v48[12 * v45];
            *(_DWORD *)v49 = v36;
            *((_DWORD *)v49 + 1) = v42;
            v49[8] = v41;
            v50 = (_BYTE *)v137.__r_.__value_.__l.__size_;
            v51 = v137.__r_.__value_.__r.__words[0];
            v52 = (std::string::size_type)v49;
            if (v137.__r_.__value_.__l.__size_ != v137.__r_.__value_.__r.__words[0])
            {
              do
              {
                v53 = *(_QWORD *)(v50 - 12);
                v50 -= 12;
                v54 = v50[8];
                *(_QWORD *)(v52 - 12) = v53;
                v52 -= 12;
                *(_BYTE *)(v52 + 8) = v54;
              }
              while (v50 != (_BYTE *)v51);
              v50 = (_BYTE *)v137.__r_.__value_.__r.__words[0];
            }
            v44 = (std::string::size_type)(v49 + 12);
            v137.__r_.__value_.__r.__words[0] = v52;
            v137.__r_.__value_.__l.__size_ = (std::string::size_type)(v49 + 12);
            v137.__r_.__value_.__r.__words[2] = (std::string::size_type)&v48[12 * v47];
            if (v50)
              operator delete(v50);
          }
          else
          {
            *(_DWORD *)v137.__r_.__value_.__l.__size_ = v36;
            *(_DWORD *)(size + 4) = v42;
            v44 = size + 12;
            *(_BYTE *)(size + 8) = v40;
          }
          v137.__r_.__value_.__l.__size_ = v44;
        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v125, v167, 16);
      }
      while (v32);
    }

    quasar::TranslationPhrase::populateMetaInfoWithAlignmentQueries((uint64_t)&v145, (int **)&v137);
    if (v137.__r_.__value_.__r.__words[0])
    {
      v137.__r_.__value_.__l.__size_ = v137.__r_.__value_.__r.__words[0];
      operator delete(v137.__r_.__value_.__l.__data_);
    }
  }
  v55 = *(_QWORD *)(v108 + 104);
  v56 = *(id *)(v108 + 64);
  v57 = v56;
  if (v56)
    v58 = objc_msgSend(v56, "enableDisambiguationAlternatives");
  else
    v58 = 0;

  (*(void (**)(std::string *__return_ptr, uint64_t, unint64_t *, uint64_t, _QWORD))(*(_QWORD *)v55 + 24))(&v137, v55, &v145, v58, 0);
  if (v137.__r_.__value_.__r.__words[0] == v137.__r_.__value_.__l.__size_)
  {
    v105 = *(NSObject **)(*(_QWORD *)(v108 + 32) + 112);
    v123[0] = MEMORY[0x1E0C809B0];
    v123[1] = 3221225472;
    v123[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_6;
    v123[3] = &unk_1E5D48B60;
    v124 = *(id *)(v108 + 72);
    dispatch_async(v105, v123);
    v104 = v124;
  }
  else
  {
    v107 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v106 = v137.__r_.__value_.__l.__size_;
    for (k = v137.__r_.__value_.__r.__words[0]; k != v106; k += 136)
    {
      obja = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v60 = *(uint64_t **)(k + 16);
      v61 = *(uint64_t **)(k + 24);
      while (v60 != v61)
      {
        v62 = [EMTToken alloc];
        v63 = v60;
        if (*((char *)v60 + 23) < 0)
          v63 = (uint64_t *)*v60;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v65) = *((_DWORD *)v60 + 14);
        LODWORD(v66) = *((_DWORD *)v60 + 15);
        v67 = -[EMTToken initWithText:confidence:score:precededBySpace:followedBySpace:](v62, "initWithText:confidence:score:precededBySpace:followedBySpace:", v64, *((unsigned __int8 *)v60 + 25), *((unsigned __int8 *)v60 + 24), v65, v66);

        objc_msgSend(obja, "addObject:", v67);
        v60 += 9;
      }
      if (*(char *)(k + 63) < 0)
      {
        v68 = *(_QWORD *)(k + 40);
        v69 = *(_QWORD *)(k + 48);
      }
      else
      {
        v68 = k + 40;
        v69 = *(unsigned __int8 *)(k + 63);
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v68, v69);
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(k + 88))
      {
        if (*(char *)(k + 87) < 0)
        {
          v70 = *(_QWORD *)(k + 64);
          v71 = *(_QWORD *)(k + 72);
        }
        else
        {
          v70 = k + 64;
          v71 = *(unsigned __int8 *)(k + 87);
        }
        objc_msgSend(MEMORY[0x1E0CB3940], "ear_stringWithStringView:", v70, v71);
        v110 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v110 = 0;
      }
      *(_OWORD *)&v130.__r_.__value_.__r.__words[1] = 0uLL;
      v130.__r_.__value_.__r.__words[0] = (std::string::size_type)&v130.__r_.__value_.__l.__size_;
      if (*(_BYTE *)(k + 120))
      {
        v72 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v74 = *(int **)(k + 96);
        v73 = *(int **)(k + 104);
        v112 = v72;
        v113 = v73;
        while (v74 != v73)
        {
          v75 = *v74;
          v76 = v74[2];
          v114 = v74[3];
          v115 = v74[1];
          v77 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v78 = *((_QWORD *)v74 + 2);
          v79 = *((_QWORD *)v74 + 3);
          while (v78 != v79)
          {
            v80 = [EMTAlternative alloc];
            v81 = *(_QWORD *)v78;
            v82 = *(std::__shared_weak_count **)(v78 + 8);
            v121 = *(_QWORD *)v78;
            v122 = v82;
            if (v82)
            {
              p_shared_owners = (unint64_t *)&v82->__shared_owners_;
              do
                v84 = __ldxr(p_shared_owners);
              while (__stxr(v84 + 1, p_shared_owners));
            }
            v85 = v130.__r_.__value_.__l.__size_;
            if (!v130.__r_.__value_.__l.__size_)
              goto LABEL_97;
            v86 = (std::string *)&v130.__r_.__value_.__r.__words[1];
            do
            {
              v87 = (std::string *)v85;
              v88 = v86;
              v89 = *(_QWORD *)(v85 + 32);
              v90 = (std::string::size_type *)(v85 + 8);
              if (v89 >= v81)
              {
                v90 = (std::string::size_type *)v87;
                v86 = v87;
              }
              v85 = *v90;
            }
            while (v85);
            if (v86 != (std::string *)&v130.__r_.__value_.__r.__words[1]
              && (v89 >= v81 ? (v91 = v87) : (v91 = v88), v81 >= v91[1].__r_.__value_.__l.__size_))
            {
              if (v89 < v81)
                v87 = v88;
              v93 = v87[2].__r_.__value_.__l.__data_;
            }
            else
            {
LABEL_97:
              v92 = *(unsigned int *)(v81 + 24);
              if ((_DWORD)v92 == -1)
                std::__throw_bad_variant_access[abi:ne180100]();
              v166 = &v164;
              ((void (*)(char **))off_1E5D48B80[v92])(&v166);
              v165 = objc_claimAutoreleasedReturnValue();
              std::__tree<std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>,std::__map_value_compare<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>,std::less<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>>,true>,std::allocator<std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>>>::__emplace_hint_unique_key_args<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>&,EMTAlternativeDescription * {__strong}&>((uint64_t **)&v130, &v130.__r_.__value_.__l.__size_, &v121, &v121, (id *)&v165);
              v93 = (char *)v165;
            }
            v94 = -[EMTAlternative initWithDescription:translationPhraseIndex:selectionSpanIndex:](v80, "initWithDescription:translationPhraseIndex:selectionSpanIndex:", v93, *(int *)(v78 + 16), *(int *)(v78 + 20));

            v95 = v122;
            if (v122)
            {
              v96 = (unint64_t *)&v122->__shared_owners_;
              do
                v97 = __ldaxr(v96);
              while (__stlxr(v97 - 1, v96));
              if (!v97)
              {
                ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
                std::__shared_weak_count::__release_weak(v95);
              }
            }
            objc_msgSend(v77, "addObject:", v94);

            v78 += 24;
          }
          if (objc_msgSend(v77, "count"))
          {
            v98 = -[EMTAlternativeSelectionSpan initWithSource:projection:alternatives:]([EMTAlternativeSelectionSpan alloc], "initWithSource:projection:alternatives:", v75, v115, v76, v114, v77);
            objc_msgSend(v112, "addObject:", v98);

          }
          v74 += 10;
          v73 = v113;
        }
        if (objc_msgSend(v112, "count"))
          goto LABEL_114;

      }
      v112 = 0;
LABEL_114:
      v99 = [EMTResult alloc];
      LODWORD(v100) = *(_DWORD *)(k + 4);
      v101 = -[EMTResult initWithLocale:tokens:confidence:lowConfidence:metaInfo:romanization:alternativeSelectionSpans:](v99, "initWithLocale:tokens:confidence:lowConfidence:metaInfo:romanization:alternativeSelectionSpans:", *(_QWORD *)(v108 + 48), obja, *(unsigned __int8 *)(k + 8), v109, v110, v112, v100);
      objc_msgSend(v107, "addObject:", v101);

      std::__tree<std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>,std::__map_value_compare<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>,std::less<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>>,true>,std::allocator<std::__value_type<std::shared_ptr<std::variant<quasar::AlternativeSelectionSpan::Alternative::GenderDescription,quasar::AlternativeSelectionSpan::Alternative::MeaningDescription>>,EMTAlternativeDescription * {__strong}>>>::destroy((uint64_t)&v130, (_QWORD *)v130.__r_.__value_.__l.__size_);
    }
    v102 = *(NSObject **)(*(_QWORD *)(v108 + 32) + 112);
    v118[0] = MEMORY[0x1E0C809B0];
    v118[1] = 3221225472;
    v118[2] = __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_7;
    v118[3] = &unk_1E5D470C8;
    v103 = *(id *)(v108 + 72);
    v119 = v107;
    v120 = v103;
    v104 = v107;
    dispatch_async(v102, v118);

  }
  v130.__r_.__value_.__r.__words[0] = (std::string::size_type)&v137;
  std::vector<quasar::TranslationPhrase>::__destroy_vector::operator()[abi:ne180100]((void ***)&v130);
  if (v154)
  {
    v137.__r_.__value_.__r.__words[0] = (std::string::size_type)&v153;
    std::vector<quasar::AlternativeSelectionSpan>::__destroy_vector::operator()[abi:ne180100]((void ***)&v137);
  }
  if (v152 && v151 < 0)
    operator delete(v150);
  if (SHIBYTE(v149) < 0)
    operator delete(*((void **)&v148 + 1));
  v137.__r_.__value_.__r.__words[0] = (std::string::size_type)&v147;
  std::vector<quasar::TranslationToken>::__destroy_vector::operator()[abi:ne180100]((void ***)&v137);
}

uint64_t __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_4(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 40);
  v3[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v2);

}

uint64_t __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __115__EMTTranslator__dispatchTranslationRequest_isFinal_spans_translator_sourceLocale_targetLocale_options_completion___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)getTranslatorWithCompletion:(id)a3
{
  id v4;
  NSObject *translationQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  translationQueue = self->_translationQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__EMTTranslator_getTranslatorWithCompletion___block_invoke;
  v7[3] = &unk_1E5D470C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(translationQueue, v7);

}

void __45__EMTTranslator_getTranslatorWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  std::__shared_weak_count *v4;
  uint64_t v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 32);
  v5 = *(_QWORD *)(v3 + 24);
  v4 = *(std::__shared_weak_count **)(v3 + 32);
  v11 = v5;
  v12 = v4;
  if (v4)
  {
    p_shared_owners = (unint64_t *)&v4->__shared_owners_;
    do
      v7 = __ldxr(p_shared_owners);
    while (__stxr(v7 + 1, p_shared_owners));
  }
  (*(void (**)(uint64_t, uint64_t *))(v2 + 16))(v2, &v11);
  v8 = v12;
  if (v12)
  {
    v9 = (unint64_t *)&v12->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
      std::__shared_weak_count::__release_weak(v8);
    }
  }
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (void).cxx_destruct
{
  vector<quasar::SystemConfig, std::allocator<quasar::SystemConfig>> *p_configs;

  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_translationQueue, 0);
  objc_storeStrong((id *)&self->_translationRequestsQueue, 0);
  p_configs = &self->_configs;
  std::vector<quasar::SystemConfig>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_configs);
  objc_storeStrong((id *)&self->_targetLocale, 0);
  objc_storeStrong((id *)&self->_sourceLocale, 0);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_translator);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_translatorFactory);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  *((_QWORD *)self + 9) = 0;
  *(_OWORD *)((char *)self + 8) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  return self;
}

@end
