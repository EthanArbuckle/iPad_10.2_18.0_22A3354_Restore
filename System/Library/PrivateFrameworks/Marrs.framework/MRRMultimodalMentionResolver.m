@implementation MRRMultimodalMentionResolver

- (MRRMultimodalMentionResolver)initWithAssets:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSString *locale;
  dispatch_queue_t v13;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  MRRMultimodalMentionResolver *v18;
  char *v19;
  std::string *v20;
  MROrchestrator *v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  int v25;
  std::string::size_type v26;
  uint64_t v27;
  std::string *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  unint64_t v36;
  id v37;
  uint64_t *v38;
  uint64_t **v39;
  uint64_t **v40;
  _QWORD *v41;
  _QWORD *v42;
  std::string *v43;
  uint64_t *v44;
  uint64_t *v45;
  std::string::size_type v46;
  std::string::size_type *data;
  uint64_t v48;
  uint64_t v49;
  int v50;
  __int128 v51;
  size_t v52;
  size_t v53;
  std::string *v54;
  uint64_t *v55;
  uint64_t *v56;
  BOOL v57;
  NSObject *v58;
  _BOOL4 v59;
  std::string *v60;
  std::string::size_type *v61;
  std::string::size_type *v62;
  NSObject *v63;
  NSObject *v64;
  NSObject *v65;
  NSObject *v66;
  MROrchestrator *value;
  void *v68;
  void *v69;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  NSObject *v73;
  void *exception;
  std::string::value_type *v76;
  std::string::value_type *v77;
  std::string *v78;
  std::string *v79;
  std::string::size_type *p_size;
  void *v81;
  std::string *v82;
  os_signpost_id_t spid;
  void *v84;
  unint64_t v85;
  MRRMultimodalMentionResolver *v86;
  id v88;
  id v89;
  MRRMultimodalMentionResolver *v91;
  std::string::size_type *v92;
  id obj;
  char *v94;
  objc_super v95;
  void *v96[2];
  std::string::size_type v97;
  std::string v98;
  std::string v99;
  std::string v100;
  std::string v101;
  uint64_t **v102;
  uint64_t *v103;
  std::string::size_type v104;
  void *__p[2];
  char v106;
  char v107;
  void *v108[2];
  uint64_t v109;
  uint8_t v110[8];
  char *v111[3];
  std::string buf[5];
  uint8_t v113[16];
  __int128 v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v88 = a3;
  v89 = a4;
  MRRLoggerForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  MRRLoggerForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  spid = v7;
  v85 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MRInitialization", ", (uint8_t *)buf, 2u);
  }

  MRRLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1C281A000, v10, OS_LOG_TYPE_INFO, "BEGIN \"MRInitialization\", (uint8_t *)buf, 2u);
  }

  v95.receiver = self;
  v95.super_class = (Class)MRRMultimodalMentionResolver;
  v91 = -[MRRMultimodalMentionResolver init](&v95, sel_init);
  v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v89);
  locale = v91->_locale;
  v91->_locale = (NSString *)v11;

  v13 = dispatch_queue_create("com.apple.sirinl.marrs", 0);
  dispatchQueue = v91->_dispatchQueue;
  v91->_dispatchQueue = (OS_dispatch_queue *)v13;

  v15 = v91->_dispatchQueue;
  dispatch_get_global_queue(25, 0);
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v15, v16);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v17, "fileExistsAtPath:", v88);

  v18 = v91;
  objc_sync_enter(v18);
  v86 = v18;
  if ((_DWORD)v16)
  {
    v94 = (char *)objc_msgSend(objc_retainAutorelease(v88), "UTF8String");
    v19 = (char *)objc_msgSend(objc_retainAutorelease(v89), "UTF8String");
    v20 = (std::string *)operator new();
    v82 = v20;
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v98, &v94);
    std::string::basic_string[abi:ne180100]<0>(v96, v19);
    v20->__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E7C677A8;
    std::__fs::filesystem::operator/[abi:ne180100](buf, (uint64_t)&v98, (std::__fs::filesystem::path *)&marrs::mrr::mr::MROrchestrator::modelMRAssetPath);
    marrs::mrr::mr::ModelBasedMR::ModelBasedMR((uint64_t)&v20->__r_.__value_.__l.__size_, (uint64_t)buf, (__int128 *)v96);
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf[0].__r_.__value_.__l.__data_);
    v20[12].__r_.__value_.__r.__words[2] = (std::string::size_type)&unk_1E7C67840;
    p_size = &v20->__r_.__value_.__l.__size_;
    if (SHIBYTE(v97) < 0)
    {
      std::string::__init_copy_ctor_external(v20 + 13, (const std::string::value_type *)v96[0], (std::string::size_type)v96[1]);
    }
    else
    {
      *(_OWORD *)&v20[13].__r_.__value_.__l.__data_ = *(_OWORD *)v96;
      v20[13].__r_.__value_.__r.__words[2] = v97;
    }
    v20[12].__r_.__value_.__r.__words[2] = (std::string::size_type)&off_1E7C678A0;
    v78 = v20 + 13;
    std::__fs::filesystem::operator/[abi:ne180100](buf, (uint64_t)&v98, (std::__fs::filesystem::path *)&marrs::mrr::mr::RuleBasedMR::ordinalFilterAssetPath);
    marrs::mrr::mr::OrdinalFilter::OrdinalFilter((uint64_t)&v20[14], (uint64_t)buf, (__int128 *)v96);
    if (SHIBYTE(buf[0].__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf[0].__r_.__value_.__l.__data_);
    v79 = v20 + 14;
    marrs::mrr::mr::MRFilterInterface::MRFilterInterface((uint64_t)&v20[22].__r_.__value_.__r.__words[2], (__int128 *)v96);
    v20[22].__r_.__value_.__r.__words[2] = (std::string::size_type)&off_1E7C676F0;
    v23 = MRRLoggerForCategory(2);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1C281A000, v23, OS_LOG_TYPE_INFO, "[SpanType filter] No assets required, initialized", (uint8_t *)buf, 2u);
    }
    v77 = &v20[22].__r_.__value_.__s.__data_[16];
    std::__fs::filesystem::operator/[abi:ne180100](&v99, (uint64_t)&v98, (std::__fs::filesystem::path *)&marrs::mrr::mr::RuleBasedMR::verbKeywordsAssetPath);
    marrs::mrr::mr::MRFilterInterface::MRFilterInterface((uint64_t)&v20[29].__r_.__value_.__l.__size_, (__int128 *)v96);
    v20[29].__r_.__value_.__l.__size_ = (std::string::size_type)&off_1E7C67900;
    v20[36].__r_.__value_.__r.__words[2] = 0;
    v20[36].__r_.__value_.__l.__size_ = 0;
    v92 = &v20[36].__r_.__value_.__l.__size_;
    v20[36].__r_.__value_.__r.__words[0] = (std::string::size_type)&v20[36].__r_.__value_.__l.__size_;
    v76 = &v20[29].__r_.__value_.__s.__data_[8];
    std::__fs::filesystem::operator/[abi:ne180100](&v100, (uint64_t)&v99, (std::__fs::filesystem::path *)&marrs::mrr::mr::keywordFilename);
    if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v101, v100.__r_.__value_.__l.__data_, v100.__r_.__value_.__l.__size_);
    else
      v101 = v100;
    v24 = (void *)MEMORY[0x1E0CB3940];
    v25 = SHIBYTE(v101.__r_.__value_.__r.__words[2]);
    v26 = v101.__r_.__value_.__r.__words[0];
    v27 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding", v76, v77, v78, v79, p_size);
    if (v25 >= 0)
      v28 = &v101;
    else
      v28 = (std::string *)v26;
    objc_msgSend(v24, "stringWithCString:encoding:", v28, v27);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v81, "fileExistsAtPath:", v84) & 1) == 0)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      std::operator+<char>();
      MEMORY[0x1C3BC5934](exception, buf);
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v29 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithJSON:", v84);
    v103 = 0;
    v104 = 0;
    v102 = &v103;
    objc_msgSend(v29, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = 0u;
    v116 = 0u;
    *(_OWORD *)v113 = 0u;
    v114 = 0u;
    obj = v30;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v113, buf, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v114;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v114 != v32)
            objc_enumerationMutation(obj);
          v34 = *(void **)(*(_QWORD *)&v113[8] + 8 * i);
          objc_msgSend(v29, "objectForKey:", v34);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = 0;
          v111[0] = 0;
          v111[1] = 0;
          *(_QWORD *)v110 = v111;
          while (objc_msgSend(v35, "count") > v36)
          {
            objc_msgSend(v35, "objectAtIndexedSubscript:", v36);
            v37 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v37, "UTF8String"));

            std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t **)v110, __p, (uint64_t)__p);
            if (v107 < 0)
              operator delete(__p[0]);
            ++v36;
          }
          std::string::basic_string[abi:ne180100]<0>(v108, (char *)objc_msgSend(objc_retainAutorelease(v34), "UTF8String"));
          v38 = v103;
          v39 = &v103;
          v40 = &v103;
          if (v103)
          {
            while (1)
            {
              while (1)
              {
                v39 = (uint64_t **)v38;
                v41 = v38 + 4;
                if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v108, v38 + 4))
                  break;
                v38 = *v39;
                v40 = v39;
                if (!*v39)
                  goto LABEL_44;
              }
              if (!std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v41, v108))
                break;
              v40 = v39 + 1;
              v38 = v39[1];
              if (!v38)
                goto LABEL_44;
            }
            v42 = v39;
          }
          else
          {
LABEL_44:
            v42 = operator new(0x50uLL);
            __p[0] = v42;
            __p[1] = &v103;
            v106 = 0;
            v43 = (std::string *)(v42 + 4);
            if (SHIBYTE(v109) < 0)
            {
              std::string::__init_copy_ctor_external(v43, (const std::string::value_type *)v108[0], (std::string::size_type)v108[1]);
            }
            else
            {
              *(_OWORD *)&v43->__r_.__value_.__l.__data_ = *(_OWORD *)v108;
              v42[6] = v109;
            }
            v42[9] = 0;
            v42[8] = 0;
            v42[7] = v42 + 8;
            v106 = 1;
            *v42 = 0;
            v42[1] = 0;
            v42[2] = v39;
            *v40 = v42;
            v44 = v42;
            if (*v102)
            {
              v102 = (uint64_t **)*v102;
              v44 = *v40;
            }
            std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(v103, v44);
            ++v104;
            __p[0] = 0;
            std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::set<std::string>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::set<std::string>>,void *>>>>::reset[abi:ne180100]((uint64_t)__p);
          }
          if (v42 + 7 != (_QWORD *)v110)
            std::__tree<std::string>::__assign_multi<std::__tree_const_iterator<std::string,std::__tree_node<std::string,void *> *,long>>(v42 + 7, *(_QWORD **)v110, v111);
          if (SHIBYTE(v109) < 0)
            operator delete(v108[0]);
          std::__tree<std::string>::destroy(v111[0]);

        }
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", v113, buf, 16);
      }
      while (v31);
    }

    std::__tree<std::__value_type<std::string,std::set<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::set<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::set<std::string>>>>::destroy((_QWORD *)v82[36].__r_.__value_.__l.__size_);
    v45 = v103;
    v82[36].__r_.__value_.__r.__words[0] = (std::string::size_type)v102;
    v82[36].__r_.__value_.__l.__size_ = (std::string::size_type)v45;
    v46 = v104;
    v82[36].__r_.__value_.__r.__words[2] = v104;
    if (v46)
    {
      v45[2] = (uint64_t)v92;
      v102 = &v103;
      v103 = 0;
      v104 = 0;
      v45 = 0;
    }
    else
    {
      v82[36].__r_.__value_.__r.__words[0] = (std::string::size_type)v92;
    }
    std::__tree<std::__value_type<std::string,std::set<std::string>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::set<std::string>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::set<std::string>>>>::destroy(v45);
    if (SHIBYTE(v101.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v101.__r_.__value_.__l.__data_);
    if (SHIBYTE(v100.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v100.__r_.__value_.__l.__data_);
    data = (std::string::size_type *)v82[36].__r_.__value_.__l.__data_;
    if (data != v92)
    {
      while (1)
      {
        if (*((char *)data + 55) < 0)
          std::string::__init_copy_ctor_external(buf, (const std::string::value_type *)data[4], data[5]);
        else
          buf[0] = *(std::string *)(data + 4);
        v48 = marrs::mrr::mr::MRREntity::EntityTypeStr;
        if ((uint64_t *)marrs::mrr::mr::MRREntity::EntityTypeStr != &qword_1ED7B1C58)
          break;
LABEL_82:
        v58 = MRRLoggerForCategory(2);
        v59 = os_log_type_enabled(v58, OS_LOG_TYPE_ERROR);
        LOBYTE(v50) = *((_BYTE *)&buf[0].__r_.__value_.__s + 23);
        if (v59)
        {
          v60 = (std::string *)buf[0].__r_.__value_.__r.__words[0];
          if ((buf[0].__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v60 = buf;
          *(_DWORD *)v113 = 136315138;
          *(_QWORD *)&v113[4] = v60;
          _os_log_impl(&dword_1C281A000, v58, OS_LOG_TYPE_ERROR, "[UtteranceKeywordFilter] entityType %s not found, please verify asset", v113, 0xCu);
          LOBYTE(v50) = *((_BYTE *)&buf[0].__r_.__value_.__s + 23);
        }
LABEL_86:
        if ((v50 & 0x80) != 0)
          operator delete(buf[0].__r_.__value_.__l.__data_);
        v61 = (std::string::size_type *)data[1];
        if (v61)
        {
          do
          {
            v62 = v61;
            v61 = (std::string::size_type *)*v61;
          }
          while (v61);
        }
        else
        {
          do
          {
            v62 = (std::string::size_type *)data[2];
            v57 = *v62 == (_QWORD)data;
            data = v62;
          }
          while (!v57);
        }
        data = v62;
        if (v62 == v92)
          goto LABEL_94;
      }
      v49 = HIBYTE(buf[0].__r_.__value_.__r.__words[2]);
      v50 = SHIBYTE(buf[0].__r_.__value_.__r.__words[2]);
      v51 = *(_OWORD *)&buf[0].__r_.__value_.__l.__data_;
      while (1)
      {
        v52 = strlen(*(const char **)(v48 + 40));
        v53 = v52;
        if (v50 < 0)
        {
          if (v52 == *((_QWORD *)&v51 + 1))
          {
            v54 = (std::string *)v51;
            if (*((_QWORD *)&v51 + 1) == -1)
              std::string::__throw_out_of_range[abi:ne180100]();
LABEL_75:
            if (!memcmp(v54, *(const void **)(v48 + 40), v53))
              goto LABEL_86;
          }
        }
        else if (v52 == v49)
        {
          v54 = buf;
          goto LABEL_75;
        }
        v55 = *(uint64_t **)(v48 + 8);
        if (v55)
        {
          do
          {
            v56 = v55;
            v55 = (uint64_t *)*v55;
          }
          while (v55);
        }
        else
        {
          do
          {
            v56 = *(uint64_t **)(v48 + 16);
            v57 = *v56 == v48;
            v48 = (uint64_t)v56;
          }
          while (!v57);
        }
        v48 = (uint64_t)v56;
        if (v56 == &qword_1ED7B1C58)
          goto LABEL_82;
      }
    }
LABEL_94:
    v63 = MRRLoggerForCategory(2);
    if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf[0].__r_.__value_.__l.__data_) = 0;
      _os_log_impl(&dword_1C281A000, v63, OS_LOG_TYPE_INFO, "[UtteranceKeywordFilter] initialized", (uint8_t *)buf, 2u);
    }
    if (SHIBYTE(v99.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v99.__r_.__value_.__l.__data_);
    marrs::mrr::mr::MRFilterInterface::MRFilterInterface((uint64_t)&v82[37], (__int128 *)v96);
    v82[37].__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E7C67100;
    v64 = MRRLoggerForCategory(2);
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v110 = 0;
      _os_log_impl(&dword_1C281A000, v64, OS_LOG_TYPE_INFO, "[MentionKeywordFilter] Not implemented yet, initialized", v110, 2u);
    }
    marrs::mrr::mr::MRFilterInterface::MRFilterInterface((uint64_t)&v82[43].__r_.__value_.__r.__words[2], (__int128 *)v96);
    v82[43].__r_.__value_.__r.__words[2] = (std::string::size_type)&off_1E7C671D8;
    v65 = MRRLoggerForCategory(2);
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v110 = 0;
      _os_log_impl(&dword_1C281A000, v65, OS_LOG_TYPE_INFO, "[ProtocolFilter] No assets required, initialized", v110, 2u);
    }
    marrs::mrr::mr::MRFilterInterface::MRFilterInterface((uint64_t)&v82[50].__r_.__value_.__l.__size_, (__int128 *)v96);
    v82[50].__r_.__value_.__l.__size_ = (std::string::size_type)&off_1E7C67498;
    v66 = MRRLoggerForCategory(2);
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v110 = 0;
      _os_log_impl(&dword_1C281A000, v66, OS_LOG_TYPE_INFO, "[GazeBased] Has no assets, initialized", v110, 2u);
    }
    v82[57].__r_.__value_.__r.__words[2] = 0;
    *(_OWORD *)&v82[57].__r_.__value_.__l.__data_ = 0u;
    if (SHIBYTE(v97) < 0)
      operator delete(v96[0]);
    if (SHIBYTE(v98.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v98.__r_.__value_.__l.__data_);
    value = v86->_mrOrchestrator.__ptr_.__value_;
    v86->_mrOrchestrator.__ptr_.__value_ = (MROrchestrator *)v82;
    if (value)
      (*(void (**)(MROrchestrator *))(*(_QWORD *)value + 16))(value);
  }
  else
  {
    v21 = v18->_mrOrchestrator.__ptr_.__value_;
    v18->_mrOrchestrator.__ptr_.__value_ = 0;
    if (v21)
      (*(void (**)(MROrchestrator *))(*(_QWORD *)v21 + 16))(v21);
    MRRLoggerForCategory(2);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0].__r_.__value_.__l.__data_) = 138412546;
      *(std::string::size_type *)((char *)buf[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)v88;
      WORD2(buf[0].__r_.__value_.__r.__words[1]) = 2112;
      *(std::string::size_type *)((char *)&buf[0].__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v89;
      _os_log_impl(&dword_1C281A000, v22, OS_LOG_TYPE_INFO, "Failed initializing MR with asset path - %@, locale - %@", (uint8_t *)buf, 0x16u);
    }

  }
  objc_sync_exit(v86);

  +[MRRMultimodalMentionResolver name](MRRMultimodalMentionResolver, "name");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  +[PredictorUtils reportInitStatusWithPredictorName:domain:code:locale:](PredictorUtils, "reportInitStatusWithPredictorName:domain:code:locale:", v68, CFSTR("com.apple.siri.marrs.rr"), 0, v89);

  if (a5)
  {
    +[MRRMultimodalMentionResolver name](MRRMultimodalMentionResolver, "name");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    +[PredictorUtils getInitStatusWithPredictorName:domain:code:](PredictorUtils, "getInitStatusWithPredictorName:domain:code:", v69, CFSTR("com.apple.siri.marrs.rr"), 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  MRRLoggerForCategory(2);
  v70 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v110 = 0;
    _os_log_impl(&dword_1C281A000, v70, OS_LOG_TYPE_INFO, "successfully initialized Marrs MR", v110, 2u);
  }

  MRRLoggerForCategory(3);
  v71 = objc_claimAutoreleasedReturnValue();
  v72 = v71;
  if (v85 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v71))
  {
    *(_WORD *)v110 = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v72, OS_SIGNPOST_INTERVAL_END, spid, "MRInitialization", " enableTelemetry=YES ", v110, 2u);
  }

  MRRLoggerForCategory(0);
  v73 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v110 = 0;
    _os_log_impl(&dword_1C281A000, v73, OS_LOG_TYPE_INFO, "END \"MRInitialization\", v110, 2u);
  }

  return v91;
}

- (id)resolveReferencesInUtteranceImpl:(id)a3 status:(id *)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  id v13;
  void *v14;
  _BOOL4 v15;
  id v16;
  void *v17;
  _BOOL4 v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  void *v26;
  NSString *v27;
  NSString *locale;
  NSObject *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  MRRMultimodalMentionResolver *v37;
  MROrchestrator *value;
  uint64_t v39;
  NSObject *v40;
  os_signpost_id_t v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  NSObject *v46;
  NSObject *v47;
  NSObject *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  NSObject *v52;
  NSObject *v53;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  BOOL v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  _BOOL4 v65;
  void *v66;
  void *v67;
  NSObject *v68;
  NSObject *v69;
  NSObject *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  NSObject *v74;
  NSObject *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  NSObject *v79;
  NSObject *v80;
  NSObject *v81;
  NSObject *v82;
  NSObject *v83;
  void *v85;
  os_signpost_id_t spid;
  unint64_t v87;
  uint64_t v89;
  uint64_t v90;
  uint8_t buf[56];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MRRLoggerForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  MRRLoggerForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  spid = v7;
  v87 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MRExecuteRequest", ", buf, 2u);
  }

  MRRLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C281A000, v10, OS_LOG_TYPE_INFO, "BEGIN \"MRExecuteRequest\", buf, 2u);
  }

  objc_msgSend(v5, "requestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11 == 0;

  if (v12)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0D9F9A0]);
    objc_msgSend(v5, "setRequestId:", v13);

  }
  objc_msgSend(v5, "nluRequestId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14 == 0;

  if (v15)
  {
    v16 = objc_alloc_init(MEMORY[0x1E0D9F9A0]);
    objc_msgSend(v5, "setNluRequestId:", v16);

  }
  objc_msgSend(v5, "resultCandidateId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v17 == 0;

  if (v18)
    objc_msgSend(v5, "setResultCandidateId:", &stru_1E7C67E88);
  objc_msgSend(v5, "tokenChain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    objc_msgSend(v5, "tokenChain");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "tokens");

  }
  objc_msgSend(v5, "embeddingTensor");

  objc_msgSend(v5, "detectedMentions");
  objc_msgSend(v5, "detectedMentions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "count"))
    goto LABEL_17;
  objc_msgSend(v5, "matchingSpans");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v22, "count"))
  {

LABEL_17:
    goto LABEL_18;
  }
  objc_msgSend(v5, "contextualSpans");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = objc_msgSend(v64, "count") == 0;

  if (v65)
  {
    +[MRRMultimodalMentionResolver name](MRRMultimodalMentionResolver, "name");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    +[PredictorUtils reportPredictStatusWithPredictorName:domain:code:locale:](PredictorUtils, "reportPredictStatusWithPredictorName:domain:code:locale:", v66, CFSTR("com.apple.siri.marrs.rr"), 0, self->_locale);

    if (a4)
    {
      +[MRRMultimodalMentionResolver name](MRRMultimodalMentionResolver, "name");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      +[PredictorUtils getPredictStatusWithPredictorName:domain:code:](PredictorUtils, "getPredictStatusWithPredictorName:domain:code:", v67, CFSTR("com.apple.siri.marrs.rr"), 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    MRRLoggerForCategory(2);
    v68 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C281A000, v68, OS_LOG_TYPE_INFO, "there is no mention, matching span, nor contextual span detected in the utterance, so there is nothing to resolve. Return early", buf, 2u);
    }

    MRRLoggerForCategory(3);
    v69 = objc_claimAutoreleasedReturnValue();
    v70 = v69;
    if (v87 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v69))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C281A000, v70, OS_SIGNPOST_INTERVAL_END, spid, "MRExecuteRequest", " enableTelemetry=YES ", buf, 2u);
    }

    MRRLoggerForCategory(0);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      goto LABEL_99;
    *(_WORD *)buf = 0;
LABEL_81:
    _os_log_impl(&dword_1C281A000, v45, OS_LOG_TYPE_INFO, "END \"MRExecuteRequest\", buf, 2u);
LABEL_99:
    v83 = 0;
    goto LABEL_100;
  }
LABEL_18:
  objc_msgSend(v5, "entityCandidates");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v23, "count"))
  {

    goto LABEL_21;
  }
  objc_msgSend(v5, "contextualSpans");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count") == 0;

  if (v25)
  {
    +[MRRMultimodalMentionResolver name](MRRMultimodalMentionResolver, "name");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    +[PredictorUtils reportPredictStatusWithPredictorName:domain:code:locale:](PredictorUtils, "reportPredictStatusWithPredictorName:domain:code:locale:", v71, CFSTR("com.apple.siri.marrs.rr"), 0, self->_locale);

    if (a4)
    {
      +[MRRMultimodalMentionResolver name](MRRMultimodalMentionResolver, "name");
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      +[PredictorUtils getPredictStatusWithPredictorName:domain:code:](PredictorUtils, "getPredictStatusWithPredictorName:domain:code:", v72, CFSTR("com.apple.siri.marrs.rr"), 0);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    MRRLoggerForCategory(2);
    v73 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C281A000, v73, OS_LOG_TYPE_INFO, "there are no entities in entity pool and no contextual spans, there is nothing to resolve. Return early", buf, 2u);
    }

    MRRLoggerForCategory(3);
    v74 = objc_claimAutoreleasedReturnValue();
    v75 = v74;
    if (v87 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v74))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C281A000, v75, OS_SIGNPOST_INTERVAL_END, spid, "MRExecuteRequest", " enableTelemetry=YES ", buf, 2u);
    }

    MRRLoggerForCategory(0);
    v45 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      goto LABEL_99;
    *(_WORD *)buf = 0;
    goto LABEL_81;
  }
LABEL_21:
  if (!objc_msgSend(v5, "maxCandidates"))
    objc_msgSend(v5, "setMaxCandidates:", 0x7FFFFFFFLL);
  if (!self->_locale)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectAtIndex:", 0);
    v27 = (NSString *)objc_claimAutoreleasedReturnValue();
    locale = self->_locale;
    self->_locale = v27;

  }
  MRRLoggerForCategory(3);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = os_signpost_id_generate(v29);

  MRRLoggerForCategory(3);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "MRObjCToCPPRequest", ", buf, 2u);
  }

  MRRLoggerForCategory(0);
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C281A000, v33, OS_LOG_TYPE_INFO, "BEGIN \"MRObjCToCPPRequest\", buf, 2u);
  }

  +[ConverterUtils convertMentionResolverRequestFromObjCToCpp:](ConverterUtils, "convertMentionResolverRequestFromObjCToCpp:", v5);
  MRRLoggerForCategory(3);
  v34 = objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v35, OS_SIGNPOST_INTERVAL_END, v30, "MRObjCToCPPRequest", " enableTelemetry=YES ", buf, 2u);
  }

  MRRLoggerForCategory(0);
  v36 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C281A000, v36, OS_LOG_TYPE_INFO, "END \"MRObjCToCPPRequest\", buf, 2u);
  }

  v37 = self;
  objc_sync_enter(v37);
  value = v37->_mrOrchestrator.__ptr_.__value_;
  if (value)
  {
    (**(void (***)(uint8_t *__return_ptr, MROrchestrator *, uint64_t))value)(buf, v37->_mrOrchestrator.__ptr_.__value_, v90);
    v39 = operator new();
    v89 = MEMORY[0x1C3BC55B0](v39, buf);
    MEMORY[0x1C3BC55C8](buf);
    MRRLoggerForCategory(3);
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = os_signpost_id_generate(v40);

    MRRLoggerForCategory(3);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C281A000, v43, OS_SIGNPOST_INTERVAL_BEGIN, v41, "MRCPPToObjCResponse", ", buf, 2u);
    }

    MRRLoggerForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C281A000, v44, OS_LOG_TYPE_INFO, "BEGIN \"MRCPPToObjCResponse\", buf, 2u);
    }

    +[ConverterUtils convertMentionResolverResponseFromCppToObjC:](ConverterUtils, "convertMentionResolverResponseFromCppToObjC:", &v89);
    v45 = objc_claimAutoreleasedReturnValue();
    MRRLoggerForCategory(3);
    v46 = objc_claimAutoreleasedReturnValue();
    v47 = v46;
    if (v41 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C281A000, v47, OS_SIGNPOST_INTERVAL_END, v41, "MRCPPToObjCResponse", " enableTelemetry=YES ", buf, 2u);
    }

    MRRLoggerForCategory(0);
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C281A000, v48, OS_LOG_TYPE_INFO, "END \"MRCPPToObjCResponse\", buf, 2u);
    }

    v49 = v89;
    v89 = 0;
    if (v49)
      (*(void (**)(uint64_t))(*(_QWORD *)v49 + 8))(v49);
    objc_sync_exit(v37);

    objc_msgSend(v5, "resultCandidateId");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (v50)
    {
      objc_msgSend(v5, "resultCandidateId");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v51, "isEqualToString:", &stru_1E7C67E88))
      {

      }
      else
      {
        objc_msgSend(v5, "cdmRequestId");
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        v57 = v56 == 0;

        if (!v57)
        {
          v58 = (void *)MEMORY[0x1E0D9FAC8];
          objc_msgSend(v5, "cdmRequestId");
          v59 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v58, "extractRequestLinkData:", v59);
          v37 = (MRRMultimodalMentionResolver *)objc_claimAutoreleasedReturnValue();

          if (v37)
          {
            objc_msgSend(v5, "nluRequestId");
            v60 = objc_claimAutoreleasedReturnValue();
            -[MRRMultimodalMentionResolver trpId](v37, "trpId");
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            -[MRRMultimodalMentionResolver targetUUID](v37, "targetUUID");
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "resultCandidateId");
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "cdmRequestId");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            +[MDMRSELFLoggingUtils emitMentionResolverEvaluatedEventWithResponse:WithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:](MDMRSELFLoggingUtils, "emitMentionResolverEvaluatedEventWithResponse:WithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:", v45, v60, v85, v61, v62, objc_msgSend(v63, "requester"));

          }
          else
          {
            MRRLoggerForCategory(2);
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1C281A000, v60, OS_LOG_TYPE_ERROR, "RequestLink data is nil", buf, 2u);
            }
          }

          goto LABEL_85;
        }
      }
    }
    MRRLoggerForCategory(2);
    v37 = (MRRMultimodalMentionResolver *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v37->super, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C281A000, &v37->super, OS_LOG_TYPE_ERROR, "resultCandidateId or cdmRequestId is either null or empty, skipped emitting MentionResolverEvaluated events", buf, 2u);
    }
LABEL_85:
    v55 = 0;
    goto LABEL_86;
  }
  MRRLoggerForCategory(3);
  v52 = objc_claimAutoreleasedReturnValue();
  v53 = v52;
  if (v87 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v52))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v53, OS_SIGNPOST_INTERVAL_END, spid, "MRExecuteRequest", " enableTelemetry=YES ", buf, 2u);
  }

  MRRLoggerForCategory(0);
  v54 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C281A000, v54, OS_LOG_TYPE_INFO, "END \"MRExecuteRequest\", buf, 2u);
  }

  objc_sync_exit(v37);
  v45 = 0;
  v55 = 137;
LABEL_86:

  v76 = v90;
  v90 = 0;
  if (v76)
    (*(void (**)(uint64_t))(*(_QWORD *)v76 + 8))(v76);
  if (!value)
    goto LABEL_99;
  +[MRRMultimodalMentionResolver name](MRRMultimodalMentionResolver, "name");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  +[PredictorUtils reportPredictStatusWithPredictorName:domain:code:locale:](PredictorUtils, "reportPredictStatusWithPredictorName:domain:code:locale:", v77, CFSTR("com.apple.siri.marrs.rr"), v55, self->_locale);

  if (a4)
  {
    +[MRRMultimodalMentionResolver name](MRRMultimodalMentionResolver, "name");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    +[PredictorUtils getPredictStatusWithPredictorName:domain:code:](PredictorUtils, "getPredictStatusWithPredictorName:domain:code:", v78, CFSTR("com.apple.siri.marrs.rr"), v55);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

  }
  MRRLoggerForCategory(2);
  v79 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C281A000, v79, OS_LOG_TYPE_INFO, "Completed running MR Request in Marrs", buf, 2u);
  }

  MRRLoggerForCategory(3);
  v80 = objc_claimAutoreleasedReturnValue();
  v81 = v80;
  if (v87 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v80))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v81, OS_SIGNPOST_INTERVAL_END, spid, "MRExecuteRequest", " enableTelemetry=YES ", buf, 2u);
  }

  MRRLoggerForCategory(0);
  v82 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C281A000, v82, OS_LOG_TYPE_INFO, "END \"MRExecuteRequest\", buf, 2u);
  }

  v45 = v45;
  v83 = v45;
LABEL_100:

  return v83;
}

- (id)resolveMentionsInUtterance:(id)a3 status:(id *)a4
{
  id v6;
  NSObject *dispatchQueue;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;
  uint64_t *v13;
  id *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  dispatchQueue = self->_dispatchQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__MRRMultimodalMentionResolver_resolveMentionsInUtterance_status___block_invoke;
  v11[3] = &unk_1E7C675D0;
  v11[4] = self;
  v12 = v6;
  v13 = &v15;
  v14 = a4;
  v8 = v6;
  dispatch_sync(dispatchQueue, v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (BOOL)resolveCandidatesForUtterance:(id)a3 status:(id *)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *dispatchQueue;
  id v11;
  id v12;
  char v13;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  _QWORD v31[5];
  id v32;

  v8 = a3;
  v9 = a5;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy_;
  v31[4] = __Block_byref_object_dispose_;
  v32 = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x2020000000;
  v30 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  v25 = __Block_byref_object_dispose_;
  v26 = 0;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_status_completionBlock___block_invoke;
  v15[3] = &unk_1E7C675F8;
  v18 = v31;
  v15[4] = self;
  v11 = v8;
  v16 = v11;
  v19 = &v21;
  v20 = &v27;
  v12 = v9;
  v17 = v12;
  dispatch_async(dispatchQueue, v15);
  if (a4)
    *a4 = objc_retainAutorelease((id)v22[5]);
  v13 = *((_BYTE *)v28 + 24);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(v31, 8);

  return v13;
}

- (id)resolveCandidatesForUtterance:(id)a3 entities:(id)a4 maximumCandidates:(unint64_t)a5 status:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  NSObject *dispatchQueue;
  void *v14;
  void *v15;
  _QWORD v17[8];
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v10 = a3;
  v11 = a4;
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = (id)objc_opt_new();
  objc_msgSend((id)v25[5], "setUtterance:", v10);
  objc_msgSend((id)v25[5], "setRequestId:", 0);
  objc_msgSend((id)v25[5], "setNluRequestId:", 0);
  objc_msgSend((id)v25[5], "setResultCandidateId:", 0);
  objc_msgSend((id)v25[5], "setTokenChain:", 0);
  objc_msgSend((id)v25[5], "setEmbeddingTensor:", 0);
  objc_msgSend((id)v25[5], "setDetectedMentions:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v25[5], "setEntityCandidates:", v12);

  objc_msgSend((id)v25[5], "setMaxCandidates:", a5);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  dispatchQueue = self->_dispatchQueue;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __96__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_entities_maximumCandidates_status___block_invoke;
  v17[3] = &unk_1E7C67668;
  v17[4] = self;
  v17[5] = &v18;
  v17[6] = &v24;
  v17[7] = a6;
  dispatch_sync(dispatchQueue, v17);
  v14 = (void *)v19[5];
  if (v14)
  {
    objc_msgSend(v14, "mentions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = 0;
  }
  _Block_object_dispose(&v18, 8);

  _Block_object_dispose(&v24, 8);
  return v15;
}

- (id)resolveCandidatesForUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 entities:(id)a6 maximumCandidates:(unint64_t)a7 status:(id *)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  NSString *locale;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *dispatchQueue;
  void *v26;
  void *v27;
  _QWORD block[8];
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = (id)objc_opt_new();
  objc_msgSend((id)v37[5], "setUtterance:", v14);
  objc_msgSend((id)v37[5], "setRequestId:", 0);
  objc_msgSend((id)v37[5], "setNluRequestId:", 0);
  objc_msgSend((id)v37[5], "setResultCandidateId:", 0);
  v18 = (void *)objc_opt_new();
  objc_msgSend((id)v37[5], "setTokenChain:", v18);

  locale = self->_locale;
  objc_msgSend((id)v37[5], "tokenChain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLocale:", locale);

  objc_msgSend((id)v37[5], "tokenChain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setStringValue:", v14);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v15);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v37[5], "tokenChain");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTokens:", v22);

  objc_msgSend((id)v37[5], "setEmbeddingTensor:", v16);
  objc_msgSend((id)v37[5], "setDetectedMentions:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v17);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v37[5], "setEntityCandidates:", v24);

  objc_msgSend((id)v37[5], "setMaxCandidates:", a7);
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy_;
  v34 = __Block_byref_object_dispose_;
  v35 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __128__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_entities_maximumCandidates_status___block_invoke;
  block[3] = &unk_1E7C67668;
  block[4] = self;
  block[5] = &v30;
  block[6] = &v36;
  block[7] = a8;
  dispatch_sync(dispatchQueue, block);
  v26 = (void *)v31[5];
  if (v26)
  {
    objc_msgSend(v26, "mentions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v27 = 0;
  }
  _Block_object_dispose(&v30, 8);

  _Block_object_dispose(&v36, 8);
  return v27;
}

- (id)resolveMentionsInUtterance:(id)a3 mentions:(id)a4 entities:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *dispatchQueue;
  void *v18;
  void *v19;
  _QWORD block[8];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy_;
  v32 = __Block_byref_object_dispose_;
  v33 = (id)objc_opt_new();
  objc_msgSend((id)v29[5], "setUtterance:", v12);
  objc_msgSend((id)v29[5], "setRequestId:", 0);
  objc_msgSend((id)v29[5], "setNluRequestId:", 0);
  objc_msgSend((id)v29[5], "setResultCandidateId:", 0);
  objc_msgSend((id)v29[5], "setTokenChain:", 0);
  objc_msgSend((id)v29[5], "setEmbeddingTensor:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v29[5], "setDetectedMentions:", v15);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v29[5], "setEntityCandidates:", v16);

  objc_msgSend((id)v29[5], "setMaxCandidates:", a6);
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __102__MRRMultimodalMentionResolver_resolveMentionsInUtterance_mentions_entities_maximumCandidates_status___block_invoke;
  block[3] = &unk_1E7C67668;
  block[4] = self;
  block[5] = &v22;
  block[6] = &v28;
  block[7] = a7;
  dispatch_sync(dispatchQueue, block);
  v18 = (void *)v23[5];
  if (v18)
  {
    objc_msgSend(v18, "mentions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
  }
  _Block_object_dispose(&v22, 8);

  _Block_object_dispose(&v28, 8);
  return v19;
}

- (id)resolveMentionsInUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 mentions:(id)a6 entities:(id)a7 maximumCandidates:(unint64_t)a8 status:(id *)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  NSString *locale;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *dispatchQueue;
  void *v28;
  void *v29;
  id v31;
  _QWORD block[8];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;

  v15 = a3;
  v31 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy_;
  v43 = __Block_byref_object_dispose_;
  v44 = (id)objc_opt_new();
  objc_msgSend((id)v40[5], "setUtterance:", v15);
  objc_msgSend((id)v40[5], "setRequestId:", 0);
  objc_msgSend((id)v40[5], "setNluRequestId:", 0);
  objc_msgSend((id)v40[5], "setResultCandidateId:", 0);
  v19 = (void *)objc_opt_new();
  objc_msgSend((id)v40[5], "setTokenChain:", v19);

  locale = self->_locale;
  objc_msgSend((id)v40[5], "tokenChain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLocale:", locale);

  objc_msgSend((id)v40[5], "tokenChain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setStringValue:", v15);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v31);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v40[5], "tokenChain");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTokens:", v23);

  objc_msgSend((id)v40[5], "setEmbeddingTensor:", v16);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v40[5], "setDetectedMentions:", v25);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v40[5], "setEntityCandidates:", v26);

  objc_msgSend((id)v40[5], "setMaxCandidates:", a8);
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __134__MRRMultimodalMentionResolver_resolveMentionsInUtterance_utteranceTokens_tokenEmbeddings_mentions_entities_maximumCandidates_status___block_invoke;
  block[3] = &unk_1E7C67668;
  block[4] = self;
  block[5] = &v33;
  block[6] = &v39;
  block[7] = a9;
  dispatch_sync(dispatchQueue, block);
  v28 = (void *)v34[5];
  if (v28)
  {
    objc_msgSend(v28, "mentions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v29 = 0;
  }
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);
  return v29;
}

- (BOOL)resolveCandidatesForUtterance:(id)a3 entities:(id)a4 maximumCandidates:(unint64_t)a5 status:(id *)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *dispatchQueue;
  id v17;
  char v18;
  _QWORD v20[5];
  id v21;
  _QWORD *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  char v35;
  _QWORD v36[5];
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;

  v12 = a3;
  v13 = a4;
  v14 = a7;
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = (id)objc_opt_new();
  objc_msgSend((id)v39[5], "setUtterance:", v12);
  objc_msgSend((id)v39[5], "setRequestId:", 0);
  objc_msgSend((id)v39[5], "setNluRequestId:", 0);
  objc_msgSend((id)v39[5], "setResultCandidateId:", 0);
  objc_msgSend((id)v39[5], "setTokenChain:", 0);
  objc_msgSend((id)v39[5], "setEmbeddingTensor:", 0);
  objc_msgSend((id)v39[5], "setDetectedMentions:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v39[5], "setEntityCandidates:", v15);

  objc_msgSend((id)v39[5], "setMaxCandidates:", a5);
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x3032000000;
  v36[3] = __Block_byref_object_copy_;
  v36[4] = __Block_byref_object_dispose_;
  v37 = 0;
  v32 = 0;
  v33 = &v32;
  v34 = 0x2020000000;
  v35 = 0;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy_;
  v30 = __Block_byref_object_dispose_;
  v31 = 0;
  dispatchQueue = self->_dispatchQueue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __112__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_entities_maximumCandidates_status_completionBlock___block_invoke;
  v20[3] = &unk_1E7C67620;
  v22 = v36;
  v20[4] = self;
  v23 = &v38;
  v24 = &v26;
  v25 = &v32;
  v17 = v14;
  v21 = v17;
  dispatch_async(dispatchQueue, v20);
  if (a6)
    *a6 = objc_retainAutorelease((id)v27[5]);
  v18 = *((_BYTE *)v33 + 24);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(v36, 8);

  _Block_object_dispose(&v38, 8);
  return v18;
}

- (BOOL)resolveCandidatesForUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 entities:(id)a6 maximumCandidates:(unint64_t)a7 status:(id *)a8 completionBlock:(id)a9
{
  id v15;
  id v16;
  void *v17;
  NSString *locale;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *dispatchQueue;
  id v25;
  char v26;
  id v28;
  id v29;
  id v30;
  _QWORD block[5];
  id v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t (*v40)(uint64_t, uint64_t);
  void (*v41)(uint64_t);
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  _QWORD v47[5];
  id v48;
  uint64_t v49;
  uint64_t *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;

  v15 = a3;
  v30 = a4;
  v29 = a5;
  v16 = a6;
  v28 = a9;
  v49 = 0;
  v50 = &v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy_;
  v53 = __Block_byref_object_dispose_;
  v54 = (id)objc_opt_new();
  objc_msgSend((id)v50[5], "setUtterance:", v15);
  objc_msgSend((id)v50[5], "setRequestId:", 0);
  objc_msgSend((id)v50[5], "setNluRequestId:", 0);
  objc_msgSend((id)v50[5], "setResultCandidateId:", 0);
  v17 = (void *)objc_opt_new();
  objc_msgSend((id)v50[5], "setTokenChain:", v17);

  locale = self->_locale;
  objc_msgSend((id)v50[5], "tokenChain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setLocale:", locale);

  objc_msgSend((id)v50[5], "tokenChain");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setStringValue:", v15);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v30);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v50[5], "tokenChain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setTokens:", v21);

  objc_msgSend((id)v50[5], "setEmbeddingTensor:", v29);
  objc_msgSend((id)v50[5], "setDetectedMentions:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v50[5], "setEntityCandidates:", v23);

  objc_msgSend((id)v50[5], "setMaxCandidates:", a7);
  v47[0] = 0;
  v47[1] = v47;
  v47[2] = 0x3032000000;
  v47[3] = __Block_byref_object_copy_;
  v47[4] = __Block_byref_object_dispose_;
  v48 = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x3032000000;
  v40 = __Block_byref_object_copy_;
  v41 = __Block_byref_object_dispose_;
  v42 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __144__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_entities_maximumCandidates_status_completionBlock___block_invoke;
  block[3] = &unk_1E7C67620;
  v33 = v47;
  block[4] = self;
  v34 = &v49;
  v35 = &v37;
  v36 = &v43;
  v25 = v28;
  v32 = v25;
  dispatch_async(dispatchQueue, block);
  if (a8)
    *a8 = objc_retainAutorelease((id)v38[5]);
  v26 = *((_BYTE *)v44 + 24);

  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(v47, 8);

  _Block_object_dispose(&v49, 8);
  return v26;
}

- (BOOL)resolveCandidatesForUtterance:(id)a3 mentions:(id)a4 entities:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  NSObject *dispatchQueue;
  id v20;
  char v21;
  id v23;
  _QWORD block[5];
  id v25;
  _QWORD *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t *v29;
  id *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _QWORD v41[5];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v23 = a8;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy_;
  v47 = __Block_byref_object_dispose_;
  v48 = (id)objc_opt_new();
  objc_msgSend((id)v44[5], "setUtterance:", v14);
  objc_msgSend((id)v44[5], "setRequestId:", 0);
  objc_msgSend((id)v44[5], "setNluRequestId:", 0);
  objc_msgSend((id)v44[5], "setResultCandidateId:", 0);
  objc_msgSend((id)v44[5], "setTokenChain:", 0);
  objc_msgSend((id)v44[5], "setEmbeddingTensor:", 0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v44[5], "setDetectedMentions:", v17);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v44[5], "setEntityCandidates:", v18);

  objc_msgSend((id)v44[5], "setMaxCandidates:", a6);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy_;
  v41[4] = __Block_byref_object_dispose_;
  v42 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy_;
  v35 = __Block_byref_object_dispose_;
  v36 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __121__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_mentions_entities_maximumCandidates_status_completionBlock___block_invoke;
  block[3] = &unk_1E7C67690;
  v26 = v41;
  block[4] = self;
  v27 = &v43;
  v28 = &v31;
  v29 = &v37;
  v30 = a7;
  v20 = v23;
  v25 = v20;
  dispatch_async(dispatchQueue, block);
  if (a7)
    *a7 = objc_retainAutorelease((id)v32[5]);
  v21 = *((_BYTE *)v38 + 24);

  _Block_object_dispose(&v31, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(v41, 8);

  _Block_object_dispose(&v43, 8);
  return v21;
}

- (BOOL)resolveCandidatesForUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 mentions:(id)a6 entities:(id)a7 maximumCandidates:(unint64_t)a8 status:(id *)a9 completionBlock:(id)a10
{
  id v16;
  id v17;
  id v18;
  void *v19;
  NSString *locale;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *dispatchQueue;
  id v28;
  char v29;
  id v31;
  id v32;
  id v33;
  _QWORD block[5];
  id v35;
  _QWORD *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _QWORD v50[5];
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;

  v16 = a3;
  v33 = a4;
  v32 = a5;
  v17 = a6;
  v18 = a7;
  v31 = a10;
  v52 = 0;
  v53 = &v52;
  v54 = 0x3032000000;
  v55 = __Block_byref_object_copy_;
  v56 = __Block_byref_object_dispose_;
  v57 = (id)objc_opt_new();
  objc_msgSend((id)v53[5], "setUtterance:", v16);
  objc_msgSend((id)v53[5], "setRequestId:", 0);
  objc_msgSend((id)v53[5], "setNluRequestId:", 0);
  objc_msgSend((id)v53[5], "setResultCandidateId:", 0);
  v19 = (void *)objc_opt_new();
  objc_msgSend((id)v53[5], "setTokenChain:", v19);

  locale = self->_locale;
  objc_msgSend((id)v53[5], "tokenChain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLocale:", locale);

  objc_msgSend((id)v53[5], "tokenChain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setStringValue:", v16);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v33);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v53[5], "tokenChain");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTokens:", v23);

  objc_msgSend((id)v53[5], "setEmbeddingTensor:", v32);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v17);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v53[5], "setDetectedMentions:", v25);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v53[5], "setEntityCandidates:", v26);

  objc_msgSend((id)v53[5], "setMaxCandidates:", a8);
  v50[0] = 0;
  v50[1] = v50;
  v50[2] = 0x3032000000;
  v50[3] = __Block_byref_object_copy_;
  v50[4] = __Block_byref_object_dispose_;
  v51 = 0;
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x3032000000;
  v43 = __Block_byref_object_copy_;
  v44 = __Block_byref_object_dispose_;
  v45 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __153__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_mentions_entities_maximumCandidates_status_completionBlock___block_invoke;
  block[3] = &unk_1E7C67620;
  v36 = v50;
  block[4] = self;
  v37 = &v52;
  v38 = &v40;
  v39 = &v46;
  v28 = v31;
  v35 = v28;
  dispatch_async(dispatchQueue, block);
  if (a9)
    *a9 = objc_retainAutorelease((id)v41[5]);
  v29 = *((_BYTE *)v47 + 24);

  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(v50, 8);

  _Block_object_dispose(&v52, 8);
  return v29;
}

- (void).cxx_destruct
{
  MROrchestrator *value;

  objc_storeStrong((id *)&self->_locale, 0);
  value = self->_mrOrchestrator.__ptr_.__value_;
  self->_mrOrchestrator.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(MROrchestrator *))(*(_QWORD *)value + 16))(value);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

void __153__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_mentions_entities_maximumCandidates_status_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "resolveReferencesInUtteranceImpl:status:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
  {
    v8 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v9)
    {
      objc_msgSend(v9, "mentions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __121__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_mentions_entities_maximumCandidates_status_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "resolveReferencesInUtteranceImpl:status:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (a1[10])
  {
    v8 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v9)
    {
      objc_msgSend(v9, "mentions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __144__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_entities_maximumCandidates_status_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "resolveReferencesInUtteranceImpl:status:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
  {
    v8 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v9)
    {
      objc_msgSend(v9, "mentions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __112__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_entities_maximumCandidates_status_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 40);
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "resolveReferencesInUtteranceImpl:status:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[6] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
  {
    v8 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
    if (v9)
    {
      objc_msgSend(v9, "mentions");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
  }
  (*(void (**)(void))(a1[5] + 16))();

}

void __134__MRRMultimodalMentionResolver_resolveMentionsInUtterance_utteranceTokens_tokenEmbeddings_mentions_entities_maximumCandidates_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "resolveReferencesInUtteranceImpl:status:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __102__MRRMultimodalMentionResolver_resolveMentionsInUtterance_mentions_entities_maximumCandidates_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "resolveReferencesInUtteranceImpl:status:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __128__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_utteranceTokens_tokenEmbeddings_entities_maximumCandidates_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "resolveReferencesInUtteranceImpl:status:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __96__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_entities_maximumCandidates_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "resolveReferencesInUtteranceImpl:status:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __85__MRRMultimodalMentionResolver_resolveCandidatesForUtterance_status_completionBlock___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "resolveReferencesInUtteranceImpl:status:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __66__MRRMultimodalMentionResolver_resolveMentionsInUtterance_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "resolveReferencesInUtteranceImpl:status:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)name
{
  return CFSTR("MRRMultimodalMentionResolver");
}

+ (id)sharedManager
{
  if (+[MRRMultimodalMentionResolver sharedManager]::onceToken != -1)
    dispatch_once(&+[MRRMultimodalMentionResolver sharedManager]::onceToken, &__block_literal_global_51);
  return (id)+[MRRMultimodalMentionResolver sharedManager]::singletonMentionResolver;
}

void __45__MRRMultimodalMentionResolver_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[MRRMultimodalMentionResolver sharedManager]::singletonMentionResolver;
  +[MRRMultimodalMentionResolver sharedManager]::singletonMentionResolver = v0;

}

@end
