@implementation _EARArtifact

- (_EARArtifact)initWithAcceptedContent:(id)a3 acceptedInfo:(id)a4 dependent:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EARArtifact *v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  id v24;
  void *v25;
  id v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  char **v31;
  char *v32[2];
  char **v33;
  char *v34[2];
  objc_super v35;
  void *__p;
  _QWORD *v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _QWORD *(*v45)(_QWORD *, _QWORD *);
  void (*v46)(uint64_t);
  void *v47;
  _QWORD **v48;
  _QWORD *v49[12];

  v49[9] = *(_QWORD **)MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)_EARArtifact;
  v11 = -[_EARArtifact init](&v35, sel_init);
  if (v11)
  {
    v12 = v8;
    v34[0] = 0;
    v34[1] = 0;
    v33 = v34;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, &v43, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v40;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v40 != v15)
            objc_enumerationMutation(v13);
          v17 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * i);
          v18 = v17;
          if (v17)
          {
            objc_msgSend(v17, "ear_toString");
          }
          else
          {
            __p = 0;
            v37 = 0;
            v38 = 0;
          }

          std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>((uint64_t **)&v33, (const void **)&__p, (uint64_t)&__p);
          if (SHIBYTE(v38) < 0)
            operator delete(__p);

        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v39, &v43, 16);
      }
      while (v14);
    }

    v19 = v9;
    v32[0] = 0;
    v32[1] = 0;
    v31 = v32;
    v39 = 0u;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v20 = v19;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, &v43, 16);
    if (v21)
    {
      v22 = *(_QWORD *)v40;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v40 != v22)
            objc_enumerationMutation(v20);
          v24 = *(id *)(*((_QWORD *)&v39 + 1) + 8 * j);
          v25 = v24;
          if (v24)
          {
            objc_msgSend(v24, "ear_toString");
          }
          else
          {
            __p = 0;
            v37 = 0;
            v38 = 0;
          }

          std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>((uint64_t **)&v31, (const void **)&__p, (uint64_t)&__p);
          if (SHIBYTE(v38) < 0)
            operator delete(__p);

        }
        v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v39, &v43, 16);
      }
      while (v21);
    }

    v26 = v10;
    *(_QWORD *)&v43 = 0;
    *((_QWORD *)&v43 + 1) = &v43;
    v44 = 0x4812000000;
    v45 = __Block_byref_object_copy__10;
    v46 = __Block_byref_object_dispose__10;
    v49[0] = 0;
    v49[1] = 0;
    v47 = &unk_1AE30551B;
    v48 = v49;
    *(_QWORD *)&v39 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v39 + 1) = 3221225472;
    *(_QWORD *)&v40 = ___ZN10EARHelpers15DictionaryToMapINSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEENS1_6vectorIS7_NS5_IS7_EEEEZ63___EARArtifact_initWithAcceptedContent_acceptedInfo_dependent__E3__2Z63___EARArtifact_initWithAcceptedContent_acceptedInfo_dependent__E3__3EENS1_3mapIT_T0_NS1_4lessISE_EENS5_INS1_4pairIKSE_SF_EEEEEEP12NSDictionaryT1_T2__block_invoke;
    *((_QWORD *)&v40 + 1) = &unk_1E5D46E20;
    *(_QWORD *)&v41 = &v43;
    objc_msgSend(v26, "enumerateKeysAndObjectsUsingBlock:", &v39);
    std::map<std::string,std::vector<std::string>>::map[abi:ne180100]((uint64_t *)&__p, (const void ***)(*((_QWORD *)&v43 + 1) + 48));
    _Block_object_dispose(&v43, 8);
    std::__tree<std::__value_type<std::string,std::vector<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::string>>>>::destroy((uint64_t)&v48, v49[0]);

    std::allocate_shared[abi:ne180100]<quasar::artifact::Artifact,std::allocator<quasar::artifact::Artifact>,std::set<std::string> &,std::set<std::string> &,std::map<std::string,std::vector<std::string>> &,void>(&v43);
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)&v11->_artifact, &v43);
    v27 = (std::__shared_weak_count *)*((_QWORD *)&v43 + 1);
    if (*((_QWORD *)&v43 + 1))
    {
      v28 = (unint64_t *)(*((_QWORD *)&v43 + 1) + 8);
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    std::__tree<std::__value_type<std::string,std::vector<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<std::string>>>>::destroy((uint64_t)&__p, v37);
    std::__tree<std::string>::destroy((uint64_t)&v31, v32[0]);
    std::__tree<std::string>::destroy((uint64_t)&v33, v34[0]);
  }

  return v11;
}

- (id)getVersion
{
  void *v2;
  char *Version;
  char *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  Version = quasar::artifact::Artifact::getVersion((quasar::artifact::Artifact *)self->_artifact.__ptr_);
  if (Version[23] >= 0)
    v4 = Version;
  else
    v4 = *(char **)Version;
  objc_msgSend(v2, "stringWithUTF8String:", v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)getLocale
{
  void *v2;
  void *p_p;
  void *v4;
  void *v6[2];
  char v7;
  void *__p;
  char v9;
  std::string v10;
  void *v11;
  char v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  quasar::artifact::Artifact::getLocale((quasar::artifact::Artifact *)self->_artifact.__ptr_, &v10);
  std::string::basic_string[abi:ne180100]<0>(v6, "_");
  quasar::Locale::toInternalShortIdentifier((uint64_t)&v10, (uint64_t)v6);
  if (v9 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  objc_msgSend(v2, "stringWithUTF8String:", p_p);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 < 0)
    operator delete(__p);
  if (v7 < 0)
    operator delete(v6[0]);
  if (v12 < 0)
    operator delete(v11);
  if (SHIBYTE(v10.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v10.__r_.__value_.__l.__data_);
  return v4;
}

- (BOOL)supportsInfo:(id)a3
{
  id v4;
  void *v5;
  Artifact *ptr;
  BOOL v7;
  void *__p[2];
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v10 = 0;
  }
  v7 = quasar::artifact::Artifact::supportsInfo((uint64_t)ptr, (const void **)__p);
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);

  return v7;
}

- (BOOL)hasInfo:(id)a3
{
  id v4;
  void *v5;
  Artifact *ptr;
  BOOL hasInfo;
  void *__p[2];
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v10 = 0;
  }
  hasInfo = quasar::artifact::Artifact::hasInfo((uint64_t)ptr, (const void **)__p);
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);

  return hasInfo;
}

- (id)getInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  Artifact *ptr;
  std::string *p_p;
  void *v9;
  void *v11[2];
  uint64_t v12;
  std::string __p;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v11[0] = 0;
    v11[1] = 0;
    v12 = 0;
  }
  quasar::artifact::Artifact::getInfo((uint64_t)ptr, (uint64_t)v11, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v6, "stringWithUTF8String:", p_p);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12) < 0)
    operator delete(v11[0]);

  return v9;
}

- (BOOL)supportsContent:(id)a3
{
  id v4;
  void *v5;
  Artifact *ptr;
  BOOL v7;
  void *__p[2];
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v10 = 0;
  }
  v7 = quasar::artifact::Artifact::supportsContent((uint64_t)ptr, (const void **)__p);
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);

  return v7;
}

- (BOOL)hasContent:(id)a3
{
  id v4;
  void *v5;
  Artifact *ptr;
  BOOL hasContent;
  void *__p[2];
  uint64_t v10;

  v4 = a3;
  v5 = v4;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v10 = 0;
  }
  hasContent = quasar::artifact::Artifact::hasContent((uint64_t)ptr, (const void **)__p);
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);

  return hasContent;
}

- (id)getContent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  Artifact *ptr;
  std::string *p_p;
  void *v9;
  void *v11[2];
  uint64_t v12;
  std::string __p;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  v6 = (void *)MEMORY[0x1E0CB3940];
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    v11[0] = 0;
    v11[1] = 0;
    v12 = 0;
  }
  quasar::artifact::Artifact::getContentAsString((uint64_t)ptr, (const void **)v11, &__p);
  if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    p_p = &__p;
  else
    p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
  objc_msgSend(v6, "stringWithUTF8String:", p_p);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12) < 0)
    operator delete(v11[0]);

  return v9;
}

- (BOOL)isMinimalistic
{
  return (*(uint64_t (**)(Artifact *))(*(_QWORD *)self->_artifact.__ptr_ + 16))(self->_artifact.__ptr_);
}

- (void)minimize
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  if ((a1 & 1) != 0)
  {
    OUTLINED_FUNCTION_1_6(a1, a2);
    OUTLINED_FUNCTION_4();
    OUTLINED_FUNCTION_0_0(&dword_1AD756000, v2, v3, "Internal C++ exception: %s", v4, v5, v6, v7, v8);
  }
  OUTLINED_FUNCTION_3();
}

- (BOOL)write:(id)a3
{
  id v4;
  void *v5;
  Artifact *ptr;
  char v7;
  void *__p[2];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  ptr = self->_artifact.__ptr_;
  if (v4)
  {
    objc_msgSend(v4, "ear_toString");
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v10 = 0;
  }
  v7 = quasar::artifact::Artifact::write((uint64_t)ptr, (unsigned __int8 *)__p);
  if (SHIBYTE(v10) < 0)
    operator delete(__p[0]);

  return v7;
}

- (BOOL)isEquivalentTo:(id)a3
{
  _QWORD **v4;

  v4 = (_QWORD **)a3;
  LOBYTE(self) = quasar::artifact::Artifact::operator==(self->_artifact.__ptr_, v4[1]);

  return (char)self;
}

+ (BOOL)isValid:(id)a3
{
  id v3;
  void *v4;
  char isValid;
  void *__p;
  char v8;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "ear_toString");
  }
  else
  {
    __p = 0;
    v8 = 0;
  }
  isValid = quasar::artifact::Artifact::isValid();
  if (v8 < 0)
    operator delete(__p);

  return isValid;
}

- (void).cxx_destruct
{
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_artifact);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  *((_QWORD *)self + 2) = 0;
  return self;
}

- (void)getVersion
{
  uint8_t v3[16];

  if ((a1 & 1) != 0)
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1AD756000, log, OS_LOG_TYPE_DEFAULT, "Internal unknown exception", v3, 2u);
  }

  __cxa_end_catch();
}

@end
