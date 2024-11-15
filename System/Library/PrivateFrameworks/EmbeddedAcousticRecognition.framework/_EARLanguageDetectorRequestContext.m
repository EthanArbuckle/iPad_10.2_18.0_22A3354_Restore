@implementation _EARLanguageDetectorRequestContext

- (LDContext)LDContext
{
  void *v1;
  void *v2;
  void *v4;
  __compressed_pair<std::__tree_end_node<std::__tree_node_base<void *> *>, std::allocator<std::__tree_node<std::__value_type<quasar::language_detector::Locale, double>, void *>>> *p_var1;
  _QWORD *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  LDContext *result;
  std::vector<std::pair<std::string, std::string>> v40;
  void *v41[2];
  char v42;
  void *v43;
  char v44;
  void *v45[2];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *__p;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  unint64_t v53;
  void *v54;
  char v55;
  uint64_t v56;

  v2 = v1;
  v56 = *MEMORY[0x1E0C80C00];
  quasar::LDContext::LDContext((uint64_t)retstr);
  objc_msgSend(v2, "languagePriors");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  EARHelpers::DictionaryToMap<quasar::language_detector::Locale,double,-[_EARLanguageDetectorRequestContext LDContext]::$_0,-[_EARLanguageDetectorRequestContext LDContext]::$_1>(v4, (uint64_t *)&v52);
  p_var1 = &retstr->var0.var0.var1;
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)retstr, (_QWORD *)retstr->var0.var0.var1.var0.__left_);
  v6 = (_QWORD *)*((_QWORD *)&v52 + 1);
  retstr->var0.var0.var0 = (void *)v52;
  retstr->var0.var0.var1.var0.__left_ = v6;
  v7 = v53;
  retstr->var0.var0.var2.var0 = v53;
  if (v7)
  {
    v6[2] = p_var1;
    *(_QWORD *)&v52 = (char *)&v52 + 8;
    *((_QWORD *)&v52 + 1) = 0;
    v53 = 0;
    v6 = 0;
  }
  else
  {
    retstr->var0.var0.var0 = p_var1;
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v52, v6);

  objc_msgSend(v2, "dictationLanguages");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v40.__end_ = 0;
    v40.__end_cap_.__value_ = 0;
    v40.__begin_ = (std::vector<std::pair<std::string, std::string>>::pointer)&v40.__end_;
    *(_OWORD *)v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v45, &v52, 16);
    if (v11)
    {
      v12 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v46 != v12)
            objc_enumerationMutation(v10);
          v14 = *((id *)v45[1] + i);
          v15 = v14;
          if (v14)
          {
            objc_msgSend(v14, "ear_toString");
          }
          else
          {
            __p = 0;
            v50 = 0;
            v51 = 0;
          }
          quasar::language_detector::Locale::Locale(v41, &__p);
          if (SHIBYTE(v51) < 0)
            operator delete(__p);

          std::__tree<quasar::language_detector::Locale>::__emplace_unique_key_args<quasar::language_detector::Locale,quasar::language_detector::Locale>((uint64_t **)&v40, (unsigned __int8 *)v41, (uint64_t)v41);
          if (v44 < 0)
            operator delete(v43);
          if (v42 < 0)
            operator delete(v41[0]);

        }
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", v45, &v52, 16);
      }
      while (v11);
    }

    std::optional<std::set<quasar::language_detector::Locale>>::operator=[abi:ne180100]<std::set<quasar::language_detector::Locale>,void>((uint64_t)&retstr->var1, &v40);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v40, v40.__end_->first.__r_.__value_.__r.__words);
  }

  objc_msgSend(v2, "currentDictationLanguage");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v16)
  {
    objc_msgSend(v16, "ear_toString");
    quasar::language_detector::Locale::Locale(&v52, v45);
    if (SBYTE7(v46) < 0)
      operator delete(v45[0]);
    std::optional<quasar::language_detector::Locale>::operator=[abi:ne180100]<quasar::language_detector::Locale,void>((uint64_t)&retstr->var2, &v52);
    if (v55 < 0)
      operator delete(v54);
    if (SHIBYTE(v53) < 0)
      operator delete((void *)v52);
  }

  objc_msgSend(v2, "wasLanguageToggled");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
    *((_WORD *)&retstr->var2.var1.__r_.__value_.var0.var1 + 8) = objc_msgSend(v18, "BOOLValue") | 0x100;

  objc_msgSend(v2, "multilingualKeyboardLanguages");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    v22 = v20;
    memset(&v40, 0, sizeof(v40));
    *(_OWORD *)v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v23 = v22;
    v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", v45, &v52, 16);
    if (v24)
    {
      v25 = *(_QWORD *)v46;
      do
      {
        for (j = 0; j != v24; ++j)
        {
          if (*(_QWORD *)v46 != v25)
            objc_enumerationMutation(v23);
          v27 = *((id *)v45[1] + j);
          v28 = v27;
          if (v27)
          {
            objc_msgSend(v27, "ear_toString");
          }
          else
          {
            __p = 0;
            v50 = 0;
            v51 = 0;
          }
          quasar::language_detector::Locale::Locale(v41, &__p);
          if (SHIBYTE(v51) < 0)
            operator delete(__p);

          std::vector<quasar::language_detector::Locale>::push_back[abi:ne180100]((uint64_t *)&v40, (__int128 *)v41);
          if (v44 < 0)
            operator delete(v43);
          if (v42 < 0)
            operator delete(v41[0]);

        }
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", v45, &v52, 16);
      }
      while (v24);
    }

    std::optional<std::vector<quasar::language_detector::Locale>>::operator=[abi:ne180100]<std::vector<quasar::language_detector::Locale>,void>((std::vector<std::pair<std::string, std::string>> *)&retstr->var2.var1.__r_.var0, &v40);
    *(_QWORD *)&v52 = &v40;
    std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v52);
  }

  objc_msgSend(v2, "keyboardConvoLanguagePriors");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v29)
  {
    EARHelpers::DictionaryToMap<quasar::language_detector::Locale,double,-[_EARLanguageDetectorRequestContext LDContext]::$_0,-[_EARLanguageDetectorRequestContext LDContext]::$_1>(v29, (uint64_t *)&v52);
    std::optional<std::set<quasar::language_detector::Locale>>::operator=[abi:ne180100]<std::set<quasar::language_detector::Locale>,void>((uint64_t)&retstr[1].var0.var0.var2, &v52);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v52, *((_QWORD **)&v52 + 1));
  }

  objc_msgSend(v2, "keyboardGlobalLanguagePriors");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v31)
  {
    EARHelpers::DictionaryToMap<quasar::language_detector::Locale,double,-[_EARLanguageDetectorRequestContext LDContext]::$_0,-[_EARLanguageDetectorRequestContext LDContext]::$_1>(v31, (uint64_t *)&v52);
    std::optional<std::set<quasar::language_detector::Locale>>::operator=[abi:ne180100]<std::set<quasar::language_detector::Locale>,void>((uint64_t)&retstr[1].var1.var1, &v52);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v52, *((_QWORD **)&v52 + 1));
  }

  objc_msgSend(v2, "previousMessageLanguage");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    objc_msgSend(v33, "ear_toString");
    quasar::language_detector::Locale::Locale(&v52, v45);
    if (SBYTE7(v46) < 0)
      operator delete(v45[0]);
    std::optional<quasar::language_detector::Locale>::operator=[abi:ne180100]<quasar::language_detector::Locale,void>((uint64_t)&retstr[1].var2.var0.var1.var0.__r_.var0, &v52);
    if (v55 < 0)
      operator delete(v54);
    if (SHIBYTE(v53) < 0)
      operator delete((void *)v52);
  }

  objc_msgSend(v2, "globalLastKeyboardUsed");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v35;
  if (v35)
  {
    objc_msgSend(v35, "ear_toString");
    quasar::language_detector::Locale::Locale(&v52, v45);
    if (SBYTE7(v46) < 0)
      operator delete(v45[0]);
    std::optional<quasar::language_detector::Locale>::operator=[abi:ne180100]<quasar::language_detector::Locale,void>((uint64_t)&retstr[2], &v52);
    if (v55 < 0)
      operator delete(v54);
    if (SHIBYTE(v53) < 0)
      operator delete((void *)v52);
  }

  objc_msgSend(v2, "dictationLanguagePriors");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = v37;
  if (v37)
  {
    EARHelpers::DictionaryToMap<quasar::language_detector::Locale,double,-[_EARLanguageDetectorRequestContext LDContext]::$_0,-[_EARLanguageDetectorRequestContext LDContext]::$_1>(v37, (uint64_t *)&v52);
    std::optional<std::set<quasar::language_detector::Locale>>::operator=[abi:ne180100]<std::set<quasar::language_detector::Locale>,void>((uint64_t)&retstr[2].var2, &v52);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v52, *((_QWORD **)&v52 + 1));
  }

  return result;
}

- (void)LDContext
{
  id v3;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _QWORD *(*v8)(_QWORD *, _QWORD *);
  void (*v9)(uint64_t);
  void *v10;
  _QWORD **v11;
  _QWORD *v12[2];

  v3 = a1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x4812000000;
  v8 = __Block_byref_object_copy__7;
  v9 = __Block_byref_object_dispose__7;
  v12[0] = 0;
  v12[1] = 0;
  v10 = &unk_1AE30551B;
  v11 = v12;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = ___ZN10EARHelpers15DictionaryToMapIN6quasar17language_detector6LocaleEdZ47___EARLanguageDetectorRequestContext_LDContext_E3__0Z47___EARLanguageDetectorRequestContext_LDContext_E3__1EENSt3__13mapIT_T0_NS6_4lessIS8_EENS6_9allocatorINS6_4pairIKS8_S9_EEEEEEP12NSDictionaryT1_T2__block_invoke;
  v4[3] = &unk_1E5D46E20;
  v4[4] = &v5;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v4);
  std::map<quasar::language_detector::Locale,double>::map[abi:ne180100](a2, (uint64_t)(v6 + 6));
  _Block_object_dispose(&v5, 8);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v11, v12[0]);

}

+ (id)contextFromLDContext:(const void *)a3
{
  _EARLanguageDetectorRequestContext *v4;
  void *v5;
  void *v6;
  std::string::__raw *v7;
  void *v8;
  std::string *p_p;
  std::string::size_type size;
  void *v11;
  std::string *v12;
  std::string *v13;
  BOOL v14;
  void *v15;
  void *v16;
  std::string *v17;
  std::string::size_type v18;
  void *v19;
  void *v20;
  void *v21;
  std::string::size_type i;
  std::string::size_type v23;
  __int128 v24;
  __int128 v25;
  void *v26;
  std::string *v27;
  std::string::size_type v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  std::string *v34;
  std::string::size_type v35;
  void *v36;
  void *v37;
  std::string *v38;
  std::string::size_type v39;
  void *v40;
  void *v41;
  std::string __p;
  char v44;
  std::string v45;
  std::string v46;
  char v47;
  std::string v48;

  v4 = objc_alloc_init(_EARLanguageDetectorRequestContext);
  EARHelpers::MapToDictionary<quasar::language_detector::Locale,double,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_2,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_3>(a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_EARLanguageDetectorRequestContext setLanguagePriors:](v4, "setLanguagePriors:", v5);

  std::__optional_copy_base<std::set<quasar::language_detector::Locale>,false>::__optional_copy_base[abi:ne180100]((uint64_t)&v45, (uint64_t)a3 + 24);
  if (v46.__r_.__value_.__s.__data_[0])
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", v45.__r_.__value_.__r.__words[2]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (std::string::__raw *)v45.__r_.__value_.__r.__words[0];
    if ((std::string::size_type *)v45.__r_.__value_.__l.__data_ != &v45.__r_.__value_.__r.__words[1])
    {
      do
      {
        v8 = (void *)MEMORY[0x1E0CB3940];
        quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v7[1].__words[1], &__p);
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          p_p = &__p;
        else
          p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
        if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
        else
          size = __p.__r_.__value_.__l.__size_;
        objc_msgSend(v8, "ear_stringWithStringView:", p_p, size);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p.__r_.__value_.__l.__data_);
        objc_msgSend(v6, "addObject:", v11);

        v12 = (std::string *)v7->__words[1];
        if (v12)
        {
          do
          {
            v13 = v12;
            v12 = (std::string *)v12->__r_.__value_.__r.__words[0];
          }
          while (v12);
        }
        else
        {
          do
          {
            v13 = (std::string *)v7->__words[2];
            v14 = v13->__r_.__value_.__r.__words[0] == (_QWORD)v7;
            v7 = (std::string::__raw *)v13;
          }
          while (!v14);
        }
        v7 = (std::string::__raw *)v13;
      }
      while (v13 != (std::string *)&v45.__r_.__value_.__r.__words[1]);
    }
    v15 = (void *)objc_msgSend(v6, "copy");

    -[_EARLanguageDetectorRequestContext setDictationLanguages:](v4, "setDictationLanguages:", v15);
    if (v46.__r_.__value_.__s.__data_[0])
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v45, (_QWORD *)v45.__r_.__value_.__l.__size_);
  }
  std::__optional_copy_base<quasar::language_detector::Locale,false>::__optional_copy_base[abi:ne180100](&v45, (uint64_t)a3 + 56);
  if (v47)
  {
    v16 = (void *)MEMORY[0x1E0CB3940];
    quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v45, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v17 = &__p;
    else
      v17 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v18 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v18 = __p.__r_.__value_.__l.__size_;
    objc_msgSend(v16, "ear_stringWithStringView:", v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    -[_EARLanguageDetectorRequestContext setCurrentDictationLanguage:](v4, "setCurrentDictationLanguage:", v19);

  }
  std::__optional_destruct_base<quasar::language_detector::Locale,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v45);
  if (*((unsigned __int16 *)a3 + 56) >= 0x100u)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *((_WORD *)a3 + 56) != 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARLanguageDetectorRequestContext setWasLanguageToggled:](v4, "setWasLanguageToggled:", v20);

  }
  std::__optional_copy_base<std::vector<quasar::language_detector::Locale>,false>::__optional_copy_base[abi:ne180100](&__p, (uint64_t)a3 + 120);
  if (v44)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = __p.__r_.__value_.__l.__size_;
    for (i = __p.__r_.__value_.__r.__words[0]; i != v23; i += 48)
    {
      if (*(char *)(i + 23) < 0)
      {
        std::string::__init_copy_ctor_external(&v45, *(const std::string::value_type **)i, *(_QWORD *)(i + 8));
      }
      else
      {
        v24 = *(_OWORD *)i;
        v45.__r_.__value_.__r.__words[2] = *(_QWORD *)(i + 16);
        *(_OWORD *)&v45.__r_.__value_.__l.__data_ = v24;
      }
      if (*(char *)(i + 47) < 0)
      {
        std::string::__init_copy_ctor_external(&v46, *(const std::string::value_type **)(i + 24), *(_QWORD *)(i + 32));
      }
      else
      {
        v25 = *(_OWORD *)(i + 24);
        v46.__r_.__value_.__r.__words[2] = *(_QWORD *)(i + 40);
        *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v25;
      }
      v26 = (void *)MEMORY[0x1E0CB3940];
      quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v45, &v48);
      if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v27 = &v48;
      else
        v27 = (std::string *)v48.__r_.__value_.__r.__words[0];
      if ((v48.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v28 = HIBYTE(v48.__r_.__value_.__r.__words[2]);
      else
        v28 = v48.__r_.__value_.__l.__size_;
      objc_msgSend(v26, "ear_stringWithStringView:", v27, v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v48.__r_.__value_.__l.__data_);
      objc_msgSend(v21, "addObject:", v29);

      if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v46.__r_.__value_.__l.__data_);
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v45.__r_.__value_.__l.__data_);
    }
    v30 = (void *)objc_msgSend(v21, "copy");

    -[_EARLanguageDetectorRequestContext setMultilingualKeyboardLanguages:](v4, "setMultilingualKeyboardLanguages:", v30);
    if (v44)
    {
      v45.__r_.__value_.__r.__words[0] = (std::string::size_type)&__p;
      std::vector<std::pair<std::string,std::string>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v45);
    }
  }
  std::__optional_copy_base<std::map<quasar::language_detector::Locale,double>,false>::__optional_copy_base[abi:ne180100]((uint64_t)&v45, (uint64_t)a3 + 152);
  if (v46.__r_.__value_.__s.__data_[0])
  {
    EARHelpers::MapToDictionary<quasar::language_detector::Locale,double,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_2,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_3>(&v45);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARLanguageDetectorRequestContext setKeyboardConvoLanguagePriors:](v4, "setKeyboardConvoLanguagePriors:", v31);

    if (v46.__r_.__value_.__s.__data_[0])
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v45, (_QWORD *)v45.__r_.__value_.__l.__size_);
  }
  std::__optional_copy_base<std::map<quasar::language_detector::Locale,double>,false>::__optional_copy_base[abi:ne180100]((uint64_t)&v45, (uint64_t)a3 + 184);
  if (v46.__r_.__value_.__s.__data_[0])
  {
    EARHelpers::MapToDictionary<quasar::language_detector::Locale,double,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_2,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_3>(&v45);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARLanguageDetectorRequestContext setKeyboardGlobalLanguagePriors:](v4, "setKeyboardGlobalLanguagePriors:", v32);

    if (v46.__r_.__value_.__s.__data_[0])
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v45, (_QWORD *)v45.__r_.__value_.__l.__size_);
  }
  std::__optional_copy_base<quasar::language_detector::Locale,false>::__optional_copy_base[abi:ne180100](&v45, (uint64_t)a3 + 216);
  if (v47)
  {
    v33 = (void *)MEMORY[0x1E0CB3940];
    quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v45, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v34 = &__p;
    else
      v34 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v35 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v35 = __p.__r_.__value_.__l.__size_;
    objc_msgSend(v33, "ear_stringWithStringView:", v34, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    -[_EARLanguageDetectorRequestContext setPreviousMessageLanguage:](v4, "setPreviousMessageLanguage:", v36);

  }
  std::__optional_destruct_base<quasar::language_detector::Locale,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v45);
  std::__optional_copy_base<quasar::language_detector::Locale,false>::__optional_copy_base[abi:ne180100](&v45, (uint64_t)a3 + 272);
  if (v47)
  {
    v37 = (void *)MEMORY[0x1E0CB3940];
    quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)&v45, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v38 = &__p;
    else
      v38 = (std::string *)__p.__r_.__value_.__r.__words[0];
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v39 = HIBYTE(__p.__r_.__value_.__r.__words[2]);
    else
      v39 = __p.__r_.__value_.__l.__size_;
    objc_msgSend(v37, "ear_stringWithStringView:", v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    -[_EARLanguageDetectorRequestContext setGlobalLastKeyboardUsed:](v4, "setGlobalLastKeyboardUsed:", v40);

  }
  std::__optional_destruct_base<quasar::language_detector::Locale,false>::~__optional_destruct_base[abi:ne180100]((uint64_t)&v45);
  std::__optional_copy_base<std::map<quasar::language_detector::Locale,double>,false>::__optional_copy_base[abi:ne180100]((uint64_t)&v45, (uint64_t)a3 + 328);
  if (v46.__r_.__value_.__s.__data_[0])
  {
    EARHelpers::MapToDictionary<quasar::language_detector::Locale,double,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_2,+[_EARLanguageDetectorRequestContext contextFromLDContext:]::$_3>(&v45);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARLanguageDetectorRequestContext setDictationLanguagePriors:](v4, "setDictationLanguagePriors:", v41);

    if (v46.__r_.__value_.__s.__data_[0])
      std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v45, (_QWORD *)v45.__r_.__value_.__l.__size_);
  }
  return v4;
}

+ (id)contextFromLDContext:(_QWORD *)a1
{
  id v2;
  double *v3;
  double *v4;
  double *v5;
  void *v6;
  void *v7;
  std::string *p_p;
  std::string::size_type size;
  void *v10;
  double *v11;
  double *v12;
  BOOL v13;
  void *v14;
  std::string __p;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = (double *)*a1;
  v3 = (double *)(a1 + 1);
  v4 = v5;
  if (v5 != v3)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v4[10]);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0CB3940];
      quasar::language_detector::Locale::getSiriLocaleStr((quasar::language_detector::Locale *)(v4 + 4), &__p);
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(__p.__r_.__value_.__r.__words[2]);
      else
        size = __p.__r_.__value_.__l.__size_;
      objc_msgSend(v7, "ear_stringWithStringView:", p_p, size);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      objc_msgSend(v2, "setObject:forKey:", v6, v10);

      v11 = (double *)*((_QWORD *)v4 + 1);
      if (v11)
      {
        do
        {
          v12 = v11;
          v11 = *(double **)v11;
        }
        while (v11);
      }
      else
      {
        do
        {
          v12 = (double *)*((_QWORD *)v4 + 2);
          v13 = *(_QWORD *)v12 == (_QWORD)v4;
          v4 = v12;
        }
        while (!v13);
      }
      v4 = v12;
    }
    while (v12 != v3);
  }
  v14 = (void *)objc_msgSend(v2, "copy");

  return v14;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = objc_alloc_init((Class)objc_opt_class());
  -[_EARLanguageDetectorRequestContext languagePriors](self, "languagePriors");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLanguagePriors:", v5);

  -[_EARLanguageDetectorRequestContext dictationLanguages](self, "dictationLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDictationLanguages:", v6);

  -[_EARLanguageDetectorRequestContext currentDictationLanguage](self, "currentDictationLanguage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentDictationLanguage:", v7);

  -[_EARLanguageDetectorRequestContext wasLanguageToggled](self, "wasLanguageToggled");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWasLanguageToggled:", v8);

  -[_EARLanguageDetectorRequestContext multilingualKeyboardLanguages](self, "multilingualKeyboardLanguages");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMultilingualKeyboardLanguages:", v9);

  -[_EARLanguageDetectorRequestContext keyboardConvoLanguagePriors](self, "keyboardConvoLanguagePriors");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardConvoLanguagePriors:", v10);

  -[_EARLanguageDetectorRequestContext keyboardGlobalLanguagePriors](self, "keyboardGlobalLanguagePriors");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setKeyboardGlobalLanguagePriors:", v11);

  -[_EARLanguageDetectorRequestContext previousMessageLanguage](self, "previousMessageLanguage");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPreviousMessageLanguage:", v12);

  -[_EARLanguageDetectorRequestContext globalLastKeyboardUsed](self, "globalLastKeyboardUsed");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setGlobalLastKeyboardUsed:", v13);

  -[_EARLanguageDetectorRequestContext dictationLanguagePriors](self, "dictationLanguagePriors");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDictationLanguagePriors:", v14);

  -[_EARLanguageDetectorRequestContext recentMessages](self, "recentMessages");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRecentMessages:", v15);

  return v4;
}

- (NSDictionary)languagePriors
{
  return self->_languagePriors;
}

- (void)setLanguagePriors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSSet)dictationLanguages
{
  return self->_dictationLanguages;
}

- (void)setDictationLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)currentDictationLanguage
{
  return self->_currentDictationLanguage;
}

- (void)setCurrentDictationLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)wasLanguageToggled
{
  return self->_wasLanguageToggled;
}

- (void)setWasLanguageToggled:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSArray)multilingualKeyboardLanguages
{
  return self->_multilingualKeyboardLanguages;
}

- (void)setMultilingualKeyboardLanguages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSDictionary)keyboardConvoLanguagePriors
{
  return self->_keyboardConvoLanguagePriors;
}

- (void)setKeyboardConvoLanguagePriors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)keyboardGlobalLanguagePriors
{
  return self->_keyboardGlobalLanguagePriors;
}

- (void)setKeyboardGlobalLanguagePriors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSString)previousMessageLanguage
{
  return self->_previousMessageLanguage;
}

- (void)setPreviousMessageLanguage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)globalLastKeyboardUsed
{
  return self->_globalLastKeyboardUsed;
}

- (void)setGlobalLastKeyboardUsed:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSDictionary)dictationLanguagePriors
{
  return self->_dictationLanguagePriors;
}

- (void)setDictationLanguagePriors:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSArray)recentMessages
{
  return self->_recentMessages;
}

- (void)setRecentMessages:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentMessages, 0);
  objc_storeStrong((id *)&self->_dictationLanguagePriors, 0);
  objc_storeStrong((id *)&self->_globalLastKeyboardUsed, 0);
  objc_storeStrong((id *)&self->_previousMessageLanguage, 0);
  objc_storeStrong((id *)&self->_keyboardGlobalLanguagePriors, 0);
  objc_storeStrong((id *)&self->_keyboardConvoLanguagePriors, 0);
  objc_storeStrong((id *)&self->_multilingualKeyboardLanguages, 0);
  objc_storeStrong((id *)&self->_wasLanguageToggled, 0);
  objc_storeStrong((id *)&self->_currentDictationLanguage, 0);
  objc_storeStrong((id *)&self->_dictationLanguages, 0);
  objc_storeStrong((id *)&self->_languagePriors, 0);
}

@end
