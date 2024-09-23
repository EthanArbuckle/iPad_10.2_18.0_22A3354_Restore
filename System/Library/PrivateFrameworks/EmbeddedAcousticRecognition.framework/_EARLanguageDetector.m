@implementation _EARLanguageDetector

+ (void)initialize
{
  EARLogger *v3;
  os_log_t v4;
  void *v5;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
  {
    EARLogger::initializeLogging(v3);
    v4 = os_log_create("com.apple.ear", "EARLanguageDetector");
    v5 = (void *)earLanguageDetectorLog;
    earLanguageDetectorLog = (uint64_t)v4;

  }
}

- (_EARLanguageDetector)initWithConfigFile:(id)a3
{
  return -[_EARLanguageDetector initWithConfigFile:overrides:](self, "initWithConfigFile:overrides:", a3, MEMORY[0x1E0C9AA70]);
}

- (_EARLanguageDetector)initWithConfigFile:(id)a3 overrides:(id)a4
{
  id v6;
  id v7;
  _EARLanguageDetector *v8;
  _EARLanguageDetector *v9;
  _QWORD *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t *value;
  _BYTE v18[40];
  objc_super v19;
  _QWORD v20[6];
  void *__p;
  void **p_p;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  uint64_t (*v25)(uint64_t);
  _BYTE v26[32];
  uint64_t v27;
  int v28;
  _QWORD *v29;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)_EARLanguageDetector;
  v8 = -[_EARLanguageDetector init](&v19, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_featureQueuePriority = 0;
    v10 = (_QWORD *)operator new();
    *v10 = &unk_1E5D16F70;
    v11 = (_QWORD *)operator new();
    *v11 = &off_1E5D16FC8;
    v12 = v7;
    __p = 0;
    p_p = &__p;
    v23 = 0x5812000000;
    v24 = __Block_byref_object_copy__99;
    v25 = __Block_byref_object_dispose__100;
    memset(v26, 0, sizeof(v26));
    v27 = 0;
    v28 = 1065353216;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = ___ZN10EARHelpers24DictionaryToUnorderedMapINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEES7_Z53___EARLanguageDetector_initWithConfigFile_overrides__E3__3S8_EENS1_13unordered_mapIT_T0_NS1_4hashISA_EENS1_8equal_toISA_EENS5_INS1_4pairIKSA_SB_EEEEEEP12NSDictionaryT1_T2__block_invoke;
    v20[3] = &unk_1E5D46E20;
    v20[4] = &__p;
    objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v20);
    std::unordered_map<std::string,std::string>::unordered_map((uint64_t)v18, (uint64_t)(p_p + 6));
    _Block_object_dispose(&__p, 8);
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)&v26[8]);

    if (v6)
    {
      objc_msgSend(v6, "ear_toString");
    }
    else
    {
      __p = 0;
      p_p = 0;
      v23 = 0;
    }
    v13 = operator new();
    v20[0] = v10;
    v29 = v11;
    quasar::LanguageDetector::LanguageDetector(v13, &__p, v20, &v29, v18);
    v14 = v29;
    v29 = 0;
    if (v14)
      (*(void (**)(_QWORD *))(*v14 + 16))(v14);
    v15 = v20[0];
    v20[0] = 0;
    if (v15)
      (*(void (**)(uint64_t))(*(_QWORD *)v15 + 16))(v15);
    value = (uint64_t *)v9->languageDetector.__ptr_.__value_;
    v9->languageDetector.__ptr_.__value_ = (LanguageDetector *)v13;
    if (value)
      std::default_delete<quasar::LanguageDetector>::operator()[abi:ne180100]((uint64_t)&v9->languageDetector, value);
    if (SHIBYTE(v23) < 0)
      operator delete(__p);
    if ((quasar::LanguageDetector::init((uint64_t **)v9->languageDetector.__ptr_.__value_) & 1) == 0)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("_EARLanguageDetector init failed"), CFSTR("The configuration file or models for _EARLanguageDetector are incorrect."));
    std::__hash_table<std::__hash_value_type<std::string,std::string>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::string>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::string>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::string>>>::~__hash_table((uint64_t)v18);
  }

  return v9;
}

+ (id)localesOfMessages:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  std::string *p_p;
  void *v10;
  void *v11;
  std::string __p;
  std::string v14;
  char v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  objc_msgSend(a1, "quasarLocalesOfMessages:", v4);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 0x6DB6DB6DB6DB6DB7 * ((v17 - v16) >> 3));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v16;
  for (i = v17; v6 != i; v6 += 56)
  {
    std::__optional_copy_base<quasar::language_detector::Locale,false>::__optional_copy_base[abi:ne180100](&v14, v6);
    if (v15)
    {
      v8 = (void *)MEMORY[0x1E0CB3940];
      quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v14, &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(v8, "stringWithUTF8String:", p_p);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v5, "addObject:", v10);

    std::__optional_destruct_base<quasar::language_detector::Locale,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v14);
  }
  v11 = (void *)objc_msgSend(v5, "copy");

  v14.__r_.__value_.__r.__words[0] = (std::string::size_type)&v16;
  std::vector<std::optional<quasar::language_detector::Locale>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v14);

  return v11;
}

+ (vector<std::optional<quasar::language_detector::Locale>,)quasarLocalesOfMessages:(id)a2
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  __CFString *v10;
  NSObject *v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  _BOOL4 v18;
  __CFString *v19;
  id v20;
  void (*v21)(id);
  const __CFString *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t k;
  void *v29;
  void *v30;
  vector<std::optional<quasar::language_detector::Locale>, std::allocator<std::optional<quasar::language_detector::Locale>>> *result;
  void *v32;
  void *v33;
  id v34;
  id obj;
  void *v37;
  void *v38[2];
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  void *__p;
  char v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  std::string buf;
  void *v53;
  __int128 *v54;
  char v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v34 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v34, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = v34;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(MEMORY[0x1E0CB3730], "dominantLanguageForString:", *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * i));
        v9 = objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = (__CFString *)v9;
        else
          v10 = CFSTR("und");
        objc_msgSend(v4, "addObject:", v10);

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v57, 16);
    }
    while (v6);
  }

  v11 = earLanguageDetectorLog;
  if (os_log_type_enabled((os_log_t)earLanguageDetectorLog, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v4;
    _os_log_impl(&dword_1AD756000, v11, OS_LOG_TYPE_DEFAULT, "Identified languages of messages = %@", (uint8_t *)&buf, 0xCu);
  }
  v37 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
  if (v12)
  {
    v13 = CFSTR("und");
    v14 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v45 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * j);
        objc_msgSend(v37, "objectForKeyedSubscript:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = v17 == 0;

        if (v18)
        {
          v19 = &stru_1E5D49530;
          if ((objc_msgSend(v16, "isEqualToString:", v13) & 1) == 0)
          {
            if (!AssistantServicesLibraryCore(char **)::frameworkLibrary)
            {
              *(_OWORD *)&buf.__r_.__value_.__l.__data_ = xmmword_1E5D49150;
              buf.__r_.__value_.__r.__words[2] = 0;
              AssistantServicesLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
            }
            if (!AssistantServicesLibraryCore(char **)::frameworkLibrary)
              goto LABEL_30;
            v20 = v16;
            *(_QWORD *)&v40 = 0;
            *((_QWORD *)&v40 + 1) = &v40;
            v41 = 0x2020000000;
            v21 = (void (*)(id))getAFDictationLanguageForKeyboardLanguageSymbolLoc(void)::ptr;
            __p = getAFDictationLanguageForKeyboardLanguageSymbolLoc(void)::ptr;
            if (!getAFDictationLanguageForKeyboardLanguageSymbolLoc(void)::ptr)
            {
              buf.__r_.__value_.__r.__words[0] = MEMORY[0x1E0C809B0];
              buf.__r_.__value_.__l.__size_ = 3221225472;
              buf.__r_.__value_.__r.__words[2] = (std::string::size_type)___ZL50getAFDictationLanguageForKeyboardLanguageSymbolLocv_block_invoke;
              v53 = &unk_1E5D49170;
              v54 = &v40;
              ___ZL50getAFDictationLanguageForKeyboardLanguageSymbolLocv_block_invoke(&buf);
              v21 = *(void (**)(id))(*((_QWORD *)&v40 + 1) + 24);
            }
            _Block_object_dispose(&v40, 8);
            if (!v21)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *localAFDictationLanguageForKeyboardLanguage(NSString *__strong)");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "handleFailureInFunction:file:lineNumber:description:", v33, CFSTR("EARLanguageDetector.mm"), 45, CFSTR("%s"), dlerror());

              __break(1u);
            }
            v21(v20);
            v19 = (__CFString *)objc_claimAutoreleasedReturnValue();

            if (v19)
            {
              v22 = v13;
              v23 = v5;
              v24 = earLanguageDetectorLog;
              if (os_log_type_enabled((os_log_t)earLanguageDetectorLog, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.__r_.__value_.__l.__data_) = 138412546;
                *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v20;
                WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
                *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v19;
                _os_log_impl(&dword_1AD756000, v24, OS_LOG_TYPE_DEFAULT, "%@ maps to %@", (uint8_t *)&buf, 0x16u);
              }
              v5 = v23;
              v13 = v22;
            }
            else
            {
LABEL_30:
              v25 = earLanguageDetectorLog;
              v19 = &stru_1E5D49530;
              if (os_log_type_enabled((os_log_t)earLanguageDetectorLog, OS_LOG_TYPE_DEFAULT))
              {
                LODWORD(buf.__r_.__value_.__l.__data_) = 138412290;
                *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v16;
                _os_log_impl(&dword_1AD756000, v25, OS_LOG_TYPE_DEFAULT, "There is no keyboard language for %@", (uint8_t *)&buf, 0xCu);
              }
            }
          }
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v19, v16);

        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v56, 16);
    }
    while (v12);
  }

  v26 = objc_msgSend(obj, "count");
  std::vector<std::optional<quasar::language_detector::Locale>>::vector(retstr, v26);
  if (v26)
  {
    v27 = 0;
    for (k = 0; k != v26; ++k)
    {
      buf.__r_.__value_.__s.__data_[0] = 0;
      v55 = 0;
      objc_msgSend(obj, "objectAtIndexedSubscript:", k);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "objectForKeyedSubscript:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v30, "length"))
      {
        if (v30)
        {
          objc_msgSend(v30, "ear_toString");
        }
        else
        {
          v38[0] = 0;
          v38[1] = 0;
          v39 = 0;
        }
        quasar::language_detector::Locale::Locale(&v40, v38);
        std::optional<quasar::language_detector::Locale>::operator=[abi:ne180100]<quasar::language_detector::Locale,void>((uint64_t)&buf, &v40);
        if (v43 < 0)
          operator delete(__p);
        if (SHIBYTE(v41) < 0)
          operator delete((void *)v40);
        if (SHIBYTE(v39) < 0)
          operator delete(v38[0]);
      }
      std::__optional_storage_base<quasar::language_detector::Locale,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<quasar::language_detector::Locale,false> const&>((std::string *)((char *)retstr->var0 + v27), &buf);

      std::__optional_destruct_base<quasar::language_detector::Locale,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&buf);
      v27 += 56;
    }
  }

  return result;
}

+ (shared_ptr<const)updateContext:(const void *)a3 withMessageLocales:(const void *)a4
{
  _QWORD *v4;
  _QWORD *v6;
  LDContext *v7;
  __shared_weak_count *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD v23[2];
  __int128 *v24;
  shared_ptr<const quasar::LDContext> result;

  v6 = v4;
  v7 = (LDContext *)std::allocate_shared[abi:ne180100]<quasar::LDContext,std::allocator<quasar::LDContext>,quasar::LDContext const&,void>((const quasar::LDContext *)a3, v23);
  v9 = v23[0];
  if (!*(_BYTE *)(v23[0] + 264))
  {
    v19 = *((_QWORD *)a4 + 1);
    if (*(_QWORD *)a4 != v19)
    {
      if (*(_BYTE *)(v19 - 8))
      {
        std::__optional_storage_base<quasar::language_detector::Locale,false>::__assign_from[abi:ne180100]<std::__optional_copy_assign_base<quasar::language_detector::Locale,false> const&>((std::string *)(v23[0] + 216), (std::string *)(v19 - 56));
        v9 = v23[0];
      }
    }
  }
  if (!*(_BYTE *)(v9 + 176))
  {
    v21 = 0;
    v22 = 0;
    v20 = (uint64_t *)&v21;
    v10 = *(_QWORD *)a4;
    v11 = *((_QWORD *)a4 + 1);
    if (*(_QWORD *)a4 != v11)
    {
      v12 = 0.0;
      do
      {
        if (*(_BYTE *)(v10 + 48))
        {
          v24 = (__int128 *)v10;
          v13 = std::__tree<std::__value_type<quasar::language_detector::Locale,double>,std::__map_value_compare<quasar::language_detector::Locale,std::__value_type<quasar::language_detector::Locale,double>,std::less<quasar::language_detector::Locale>,true>,std::allocator<std::__value_type<quasar::language_detector::Locale,double>>>::__emplace_unique_key_args<quasar::language_detector::Locale,std::piecewise_construct_t const&,std::tuple<quasar::language_detector::Locale const&>,std::tuple<>>(&v20, (unsigned __int8 *)v10, (uint64_t)&std::piecewise_construct, &v24);
          *((double *)v13 + 10) = *((double *)v13 + 10) + 1.0;
          v12 = v12 + 1.0;
        }
        v10 += 56;
      }
      while (v10 != v11);
      if (v22)
      {
        v14 = v20;
        if (v20 != (uint64_t *)&v21)
        {
          do
          {
            *((double *)v14 + 10) = *((double *)v14 + 10) / v12;
            v15 = (uint64_t *)v14[1];
            if (v15)
            {
              do
              {
                v16 = v15;
                v15 = (uint64_t *)*v15;
              }
              while (v15);
            }
            else
            {
              do
              {
                v16 = (uint64_t *)v14[2];
                v17 = *v16 == (_QWORD)v14;
                v14 = v16;
              }
              while (!v17);
            }
            v14 = v16;
          }
          while (v16 != (uint64_t *)&v21);
        }
        std::optional<std::map<quasar::language_detector::Locale,double>>::operator=[abi:ne180100]<std::map<quasar::language_detector::Locale,double>&,void>(v23[0] + 152, (uint64_t)&v20);
      }
    }
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v20, v21);
    v9 = v23[0];
  }
  v18 = v23[1];
  *v6 = v9;
  v6[1] = v18;
  result.var1 = v8;
  result.var0 = v7;
  return result;
}

- (id)startRequestWith:(unint64_t)a3 context:(id)a4 delegate:(id)a5
{
  int v6;
  id v8;
  NSObject *v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  LanguageDetector *value;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  NSObject *v21;
  NSObject *v22;
  uint64_t v23;
  unint64_t *v24;
  unint64_t v25;
  std::__shared_weak_count *v26;
  void *v27;
  unint64_t *p_shared_weak_owners;
  unint64_t v29;
  __int128 v30;
  unint64_t *v31;
  unint64_t v32;
  unint64_t *v33;
  unint64_t v34;
  unint64_t *v35;
  unint64_t v36;
  unint64_t *v37;
  unint64_t v38;
  std::__shared_weak_count *v39;
  unint64_t *v40;
  unint64_t v41;
  std::__shared_weak_count *v42;
  unint64_t *v43;
  unint64_t v44;
  id v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  std::__shared_weak_count *v55;
  unint64_t *v56;
  unint64_t v57;
  std::__shared_weak_count *v58;
  unint64_t *v59;
  unint64_t v60;
  id v62;
  _QWORD v63[4];
  id v64;
  id v65[2];
  std::__shared_weak_count *v66;
  __int128 v67;
  quasar::LDContext **v68;
  std::__shared_weak_count *v69;
  _QWORD block[5];
  __int128 v71;
  id location;
  std::__shared_weak_count *v73;
  __int128 buf;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  uint64_t v96;
  quasar::LDContext **v97;
  std::__shared_weak_count *v98;
  _QWORD *v99;
  std::__shared_weak_count *v100;

  v6 = a3;
  v8 = a4;
  v62 = a5;
  v9 = earLanguageDetectorLog;
  if (os_log_type_enabled((os_log_t)earLanguageDetectorLog, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1AD756000, v9, OS_LOG_TYPE_DEFAULT, "Starting new request", (uint8_t *)&buf, 2u);
  }
  v10 = (std::__shared_weak_count *)operator new(0x38uLL);
  v10->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v10->__shared_owners_;
  v10->__shared_weak_owners_ = 0;
  v10->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E5D40A08;
  v10[1].__vftable = (std::__shared_weak_count_vtbl *)&unk_1E5D16B78;
  v10[1].__shared_owners_ = 0;
  v10[1].__shared_weak_owners_ = 0;
  v10[2].__vftable = (std::__shared_weak_count_vtbl *)0xBFF0000000000000;
  v99 = &v10[1].__vftable;
  v100 = v10;
  EARLDResultStream::init((uint64_t)&v10[1], v62, self);
  objc_msgSend(v8, "recentMessages");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v8, "previousMessageLanguage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v8, "keyboardConvoLanguagePriors");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        v15 = earLanguageDetectorLog;
        if (os_log_type_enabled((os_log_t)earLanguageDetectorLog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1AD756000, v15, OS_LOG_TYPE_DEFAULT, "previousMessageLanguage and keyboardConvoLanguagePriors are both set, so recentMessages will be ignored.", (uint8_t *)&buf, 2u);
        }

        v12 = 0;
      }
    }
  }
  if (v8)
  {
    objc_msgSend(v8, "LDContext");
  }
  else
  {
    v96 = 0;
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    v88 = 0u;
    v89 = 0u;
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v78 = 0u;
    v79 = 0u;
    v76 = 0u;
    v77 = 0u;
    buf = 0u;
    v75 = 0u;
  }
  std::allocate_shared[abi:ne180100]<quasar::LDContext const,std::allocator<quasar::LDContext const>,quasar::LDContext,void>(&v97);
  quasar::LDContext::~LDContext((quasar::LDContext *)&buf);
  value = self->languageDetector.__ptr_.__value_;
  location = &v10[1];
  v73 = v10;
  do
    v17 = __ldxr(p_shared_owners);
  while (__stxr(v17 + 1, p_shared_owners));
  quasar::LanguageDetector::startRequest(value, v6, &v97, (uint64_t *)&location, &buf);
  v18 = v73;
  if (v73)
  {
    v19 = (unint64_t *)&v73->__shared_owners_;
    do
      v20 = __ldaxr(v19);
    while (__stlxr(v20 - 1, v19));
    if (!v20)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  dispatch_get_global_queue(self->_featureQueuePriority, 0);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = v21;
  block[2] = __58___EARLanguageDetector_startRequestWith_context_delegate___block_invoke;
  block[3] = &unk_1E5D46920;
  block[4] = self;
  v71 = buf;
  v23 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3321888768;
  if (*((_QWORD *)&buf + 1))
  {
    v24 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v25 = __ldxr(v24);
    while (__stxr(v25 + 1, v24));
  }
  dispatch_async(v21, block);
  if (v12)
  {
    objc_initWeak(&location, self);
    v27 = v99;
    v26 = v100;
    if (v100)
    {
      p_shared_weak_owners = (unint64_t *)&v100->__shared_weak_owners_;
      do
        v29 = __ldxr(p_shared_weak_owners);
      while (__stxr(v29 + 1, p_shared_weak_owners));
    }
    v30 = buf;
    if (*((_QWORD *)&buf + 1))
    {
      v31 = (unint64_t *)(*((_QWORD *)&buf + 1) + 16);
      do
        v32 = __ldxr(v31);
      while (__stxr(v32 + 1, v31));
    }
    v63[0] = v23;
    v63[1] = 3321888768;
    v63[2] = __58___EARLanguageDetector_startRequestWith_context_delegate___block_invoke_56;
    v63[3] = &unk_1E5D46AA8;
    v64 = v12;
    v65[1] = v27;
    v66 = v26;
    if (v26)
    {
      v33 = (unint64_t *)&v26->__shared_weak_owners_;
      do
        v34 = __ldxr(v33);
      while (__stxr(v34 + 1, v33));
    }
    v67 = v30;
    if (*((_QWORD *)&v30 + 1))
    {
      v35 = (unint64_t *)(*((_QWORD *)&v30 + 1) + 16);
      do
        v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
    }
    objc_copyWeak(v65, &location);
    v68 = v97;
    v69 = v98;
    if (v98)
    {
      v37 = (unint64_t *)&v98->__shared_owners_;
      do
        v38 = __ldxr(v37);
      while (__stxr(v38 + 1, v37));
    }
    dispatch_async(v22, v63);
    v39 = v69;
    if (v69)
    {
      v40 = (unint64_t *)&v69->__shared_owners_;
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v39->__on_zero_shared)(v39);
        std::__shared_weak_count::__release_weak(v39);
      }
    }
    objc_destroyWeak(v65);
    if (*((_QWORD *)&v67 + 1))
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v67 + 1));
    if (v66)
      std::__shared_weak_count::__release_weak(v66);

    if (*((_QWORD *)&v30 + 1))
      std::__shared_weak_count::__release_weak(*((std::__shared_weak_count **)&v30 + 1));
    if (v26)
      std::__shared_weak_count::__release_weak(v26);
    objc_destroyWeak(&location);
  }
  v42 = *(std::__shared_weak_count **)(buf + 8);
  location = *(id *)buf;
  v73 = v42;
  if (v42)
  {
    v43 = (unint64_t *)&v42->__shared_owners_;
    do
      v44 = __ldxr(v43);
    while (__stxr(v44 + 1, v43));
  }
  v45 = -[_EARLanguageDetectorAudioBuffer _initWithAudioBuffer:]([_EARLanguageDetectorAudioBuffer alloc], "_initWithAudioBuffer:", &location);
  v46 = v73;
  if (v73)
  {
    v47 = (unint64_t *)&v73->__shared_owners_;
    do
      v48 = __ldaxr(v47);
    while (__stlxr(v48 - 1, v47));
    if (!v48)
    {
      ((void (*)(std::__shared_weak_count *))v46->__on_zero_shared)(v46);
      std::__shared_weak_count::__release_weak(v46);
    }
  }
  v49 = (std::__shared_weak_count *)*((_QWORD *)&v71 + 1);
  if (*((_QWORD *)&v71 + 1))
  {
    v50 = (unint64_t *)(*((_QWORD *)&v71 + 1) + 8);
    do
      v51 = __ldaxr(v50);
    while (__stlxr(v51 - 1, v50));
    if (!v51)
    {
      ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
      std::__shared_weak_count::__release_weak(v49);
    }
  }

  v52 = (std::__shared_weak_count *)*((_QWORD *)&buf + 1);
  if (*((_QWORD *)&buf + 1))
  {
    v53 = (unint64_t *)(*((_QWORD *)&buf + 1) + 8);
    do
      v54 = __ldaxr(v53);
    while (__stlxr(v54 - 1, v53));
    if (!v54)
    {
      ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
      std::__shared_weak_count::__release_weak(v52);
    }
  }
  v55 = v98;
  if (v98)
  {
    v56 = (unint64_t *)&v98->__shared_owners_;
    do
      v57 = __ldaxr(v56);
    while (__stlxr(v57 - 1, v56));
    if (!v57)
    {
      ((void (*)(std::__shared_weak_count *))v55->__on_zero_shared)(v55);
      std::__shared_weak_count::__release_weak(v55);
    }
  }

  v58 = v100;
  if (v100)
  {
    v59 = (unint64_t *)&v100->__shared_owners_;
    do
      v60 = __ldaxr(v59);
    while (__stlxr(v60 - 1, v59));
    if (!v60)
    {
      ((void (*)(std::__shared_weak_count *))v58->__on_zero_shared)(v58);
      std::__shared_weak_count::__release_weak(v58);
    }
  }

  return v45;
}

- (unsigned)featureQueuePriority
{
  return self->_featureQueuePriority;
}

- (void)setFeatureQueuePriority:(unsigned int)a3
{
  self->_featureQueuePriority = a3;
}

- (void).cxx_destruct
{
  unique_ptr<quasar::LanguageDetector, std::default_delete<quasar::LanguageDetector>> *p_languageDetector;
  uint64_t *v3;
  LanguageDetector *value;

  value = self->languageDetector.__ptr_.__value_;
  p_languageDetector = &self->languageDetector;
  v3 = (uint64_t *)value;
  p_languageDetector->__ptr_.__value_ = 0;
  if (value)
    std::default_delete<quasar::LanguageDetector>::operator()[abi:ne180100]((uint64_t)p_languageDetector, v3);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

- (uint64_t)initWithConfigFile:(uint64_t *)a1 overrides:(uint64_t)a2 .cold.1(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *a1;
  *a1 = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 16))(v4);
  return MEMORY[0x1AF44D190](a2, 0x10B2C4076CD4550);
}

@end
