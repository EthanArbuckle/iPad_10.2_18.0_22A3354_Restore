@implementation EMTCompiler

- (EMTCompiler)initWithModelURLs:(id)a3
{
  EMTCompiler *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  uint64_t *v10;
  unint64_t v11;
  uint64_t v12;
  NSObject *v13;
  EMTCompiler *v14;
  id v16;
  EMTCompiler *v17;
  id obj;
  _QWORD block[4];
  EMTCompiler *v20;
  uint64_t *v21;
  _OWORD v22[2];
  int v23;
  uint64_t v24[3];
  void *__p[2];
  char v26;
  void **v27[193];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  __n128 (*v35)(__n128 *, __n128 *);
  void (*v36)(uint64_t);
  void *v37;
  _QWORD v38[3];
  objc_super v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v39.receiver = self;
  v39.super_class = (Class)EMTCompiler;
  v4 = -[EMTCompiler init](&v39, sel_init);
  v17 = v4;
  if (v4)
  {
    v32 = 0;
    v33 = &v32;
    v34 = 0x4812000000;
    v35 = __Block_byref_object_copy__0;
    v36 = __Block_byref_object_dispose__0;
    v37 = &unk_1AE30551B;
    memset(v38, 0, sizeof(v38));
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    obj = v16;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v29 != v6)
            objc_enumerationMutation(obj);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * i), "URLByAppendingPathComponent:", CFSTR("mt-quasar-config.json"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v27);
          v9 = objc_retainAutorelease(v8);
          std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v9, "fileSystemRepresentation"));
          memset(v24, 0, sizeof(v24));
          memset(v22, 0, sizeof(v22));
          v23 = 1065353216;
          quasar::SystemConfig::readJsonFile((uint64_t)v27, (uint64_t)__p, v24, (uint64_t)v22, 0, 0);
          std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v22);
          *(_QWORD *)&v22[0] = v24;
          std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v22);
          if (v26 < 0)
            operator delete(__p[0]);
          v10 = v33;
          v11 = v33[7];
          if (v11 >= v33[8])
          {
            v12 = std::vector<quasar::SystemConfig>::__push_back_slow_path<quasar::SystemConfig const&>(v33 + 6, (const quasar::SystemConfig *)v27);
          }
          else
          {
            quasar::SystemConfig::SystemConfig((quasar::SystemConfig *)v33[7], (const quasar::SystemConfig *)v27, 1, 1);
            v12 = v11 + 1544;
            v10[7] = v11 + 1544;
          }
          v10[7] = v12;
          quasar::SystemConfig::~SystemConfig((quasar::SystemConfig *)v27);

        }
        v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v40, 16);
      }
      while (v5);
    }

    +[EMTTranslationQueue globalTranslationQueue](EMTTranslationQueue, "globalTranslationQueue");
    v13 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __33__EMTCompiler_initWithModelURLs___block_invoke;
    block[3] = &unk_1E5D46D80;
    v20 = v17;
    v21 = &v32;
    dispatch_sync(v13, block);

    _Block_object_dispose(&v32, 8);
    v27[0] = (void **)v38;
    std::vector<quasar::SystemConfig>::__destroy_vector::operator()[abi:ne180100](v27);
    v4 = v17;
  }
  v14 = v4;

  return v14;
}

void __33__EMTCompiler_initWithModelURLs___block_invoke(uint64_t a1)
{
  std::__shared_weak_count *v2;
  unint64_t *v3;
  unint64_t v4;
  __int128 v5;

  std::allocate_shared[abi:ne180100]<quasar::TranslatorCompiler,std::allocator<quasar::TranslatorCompiler>,std::vector<quasar::SystemConfig> &,void>(&v5);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100](*(_QWORD *)(a1 + 32) + 8, &v5);
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

- (BOOL)compile
{
  return quasar::TranslatorCompiler::compile((quasar::TranslatorCompiler *)self->_translatorCompiler.__ptr_);
}

- (BOOL)isCompileRequired
{
  return quasar::TranslatorCompiler::isCompileRequired((quasar::TranslatorCompiler *)self->_translatorCompiler.__ptr_);
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_translatorCompiler);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

@end
