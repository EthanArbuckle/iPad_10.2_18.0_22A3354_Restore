@implementation MRRMultimodalMentionDetector

- (MRRMultimodalMentionDetector)initWithAssets:(id)a3 forLocale:(id)a4 status:(id *)a5
{
  int v5;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
  NSString *locale;
  dispatch_queue_t v15;
  OS_dispatch_queue *dispatchQueue;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  MRRMentionDetectorInterface *v21;
  NSObject *v22;
  uint64_t v23;
  _QWORD *v24;
  void *v25;
  int v26;
  std::string::size_type v27;
  uint64_t v28;
  std::string *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  unint64_t i;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  void *v42;
  id v43;
  __int128 v44;
  std::string *v45;
  __int128 v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  std::string::size_type v51;
  _QWORD *v52;
  std::string *v53;
  __int128 v54;
  std::string::size_type size;
  std::string::size_type v56;
  std::string::size_type v57;
  uint64_t v58;
  __int128 v59;
  int64x2_t v60;
  std::string::size_type v61;
  void **v62;
  char *v63;
  void **v64;
  std::string *v65;
  char *v66;
  uint64_t *v67;
  void **v68;
  std::string::__raw *v69;
  std::string::size_type v70;
  unint64_t v71;
  uint64_t v72;
  uint64_t v73;
  std::string *v74;
  uint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  std::string *v78;
  unint64_t v79;
  uint64_t v80;
  std::string::size_type v81;
  const std::string *v82;
  std::string::size_type v83;
  std::string *v84;
  std::string *v85;
  const std::string *v86;
  std::string::size_type v87;
  char *v88;
  std::string::size_type v89;
  uint64_t v90;
  _QWORD *v91;
  _QWORD *v92;
  char *v93;
  BOOL v94;
  uint64_t **v95;
  char *v96;
  uint64_t *v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  std::string *v102;
  std::string *v103;
  _QWORD *v104;
  uint64_t v105;
  NSObject *v106;
  std::string::size_type v107;
  void *v108;
  int v109;
  std::string::size_type v110;
  uint64_t v111;
  std::string *v112;
  void *v113;
  void *v114;
  id v115;
  id v116;
  std::string::size_type v117;
  void *v118;
  int v119;
  void *v120;
  BOOL v121;
  int v122;
  void *v123;
  BOOL v124;
  void *v125;
  id v126;
  std::string::size_type v127;
  char v128;
  void *v129;
  void *v130;
  uint64_t v131;
  std::string::size_type v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  std::string *v136;
  MRRMentionDetectorInterface *value;
  void *v138;
  void *v139;
  NSObject *v140;
  NSObject *v141;
  NSObject *v142;
  NSObject *v143;
  void *exception;
  void **v146;
  void **v147;
  _QWORD *v148;
  void *v149;
  uint64_t v150;
  os_signpost_id_t spid;
  void *v152;
  unint64_t v153;
  id v155;
  id v156;
  MRRMultimodalMentionDetector *v158;
  std::string::size_type v159;
  id obj;
  uint64_t v161;
  void *v162;
  std::string::size_type v163;
  uint64_t v164;
  char v165;
  char v166;
  char *v167;
  objc_super v168;
  std::string v169;
  std::string v170;
  void *__p[2];
  __int128 v172;
  __int128 v173;
  __int128 v174;
  std::string v175;
  std::string v176;
  std::string::size_type v177;
  std::string::value_type *v178;
  char *v179;
  std::string buf;
  uint64_t v181;
  _BYTE v182[384];
  uint64_t v183;
  _QWORD v184[2];
  __int128 v185;
  uint64_t v186;
  std::string v187;
  std::string v188;
  uint64_t v189;

  v189 = *MEMORY[0x1E0C80C00];
  v155 = a3;
  v156 = a4;
  MRRLoggerForCategory(3);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  MRRLoggerForCategory(3);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  spid = v8;
  v153 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "MDInitialization", ", (uint8_t *)&buf, 2u);
  }

  MRRLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1C281A000, v11, OS_LOG_TYPE_INFO, "BEGIN \"MDInitialization\", (uint8_t *)&buf, 2u);
  }

  MRRLoggerForCategory(1);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf.__r_.__value_.__l.__data_) = 138412546;
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v155;
    WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
    *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v156;
    _os_log_impl(&dword_1C281A000, v12, OS_LOG_TYPE_INFO, "initializing MD with asset path - %@, locale - %@", (uint8_t *)&buf, 0x16u);
  }

  v168.receiver = self;
  v168.super_class = (Class)MRRMultimodalMentionDetector;
  v158 = -[MRRMultimodalMentionDetector init](&v168, sel_init);
  v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithString:", v156);
  locale = v158->_locale;
  v158->_locale = (NSString *)v13;

  v15 = dispatch_queue_create("com.apple.sirinl.marrs", 0);
  dispatchQueue = v158->_dispatchQueue;
  v158->_dispatchQueue = (OS_dispatch_queue *)v15;

  v17 = v158->_dispatchQueue;
  dispatch_get_global_queue(25, 0);
  v18 = objc_claimAutoreleasedReturnValue();
  dispatch_set_target_queue(v17, v18);

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v18) = objc_msgSend(v19, "fileExistsAtPath:", v155);

  if ((_DWORD)v18)
  {
    v167 = (char *)objc_msgSend(objc_retainAutorelease(v155), "UTF8String");
    v20 = operator new();
    v150 = v20;
    std::__fs::filesystem::path::path[abi:ne180100]<char const*,void>(&v169, &v167);
    *(_QWORD *)v20 = &unk_1E7C67780;
    if (SHIBYTE(v169.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external((std::string *)(v20 + 8), v169.__r_.__value_.__l.__data_, v169.__r_.__value_.__l.__size_);
    else
      *(std::string *)(v20 + 8) = v169;
    *(_QWORD *)v20 = &off_1E7C67730;
    std::__fs::filesystem::operator/[abi:ne180100]((std::string *)__p, (uint64_t)&v169, (std::__fs::filesystem::path *)&marrs::mrr::md::MRRVisualAndScreenMentionDetector::MODEL_FOLDER_NAME);
    std::__fs::filesystem::operator/[abi:ne180100](&v188, (uint64_t)__p, (std::__fs::filesystem::path *)&marrs::mrr::md::MRRVisualAndScreenMentionDetector::MODEL_FILE_NAME);
    if (SHIBYTE(v188.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&buf, v188.__r_.__value_.__l.__data_, v188.__r_.__value_.__l.__size_);
    else
      buf = v188;
    if (SHIBYTE(v169.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v176, v169.__r_.__value_.__l.__data_, v169.__r_.__value_.__l.__size_);
    else
      v176 = v169;
    v23 = operator new();
    marrs::inference_engine::EspressoModule::EspressoModule(v23, (uint64_t)&buf, 32);
    *(_QWORD *)(v20 + 32) = v23;
    if (SHIBYTE(v176.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v176.__r_.__value_.__l.__data_);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (SHIBYTE(v188.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v188.__r_.__value_.__l.__data_);
    if (SBYTE7(v172) < 0)
      operator delete(__p[0]);
    *(_QWORD *)(v20 + 104) = 0;
    v24 = (_QWORD *)(v20 + 104);
    *((_OWORD *)v24 - 4) = 0u;
    v146 = (void **)v24;
    v147 = (void **)(v24 - 8);
    v24[1] = 0;
    v24[2] = 0;
    *((_OWORD *)v24 - 3) = 0u;
    *((_OWORD *)v24 - 2) = 0u;
    v24[5] = 0;
    v24[6] = 0;
    v148 = v24 + 5;
    v24[4] = v24 + 5;
    std::__fs::filesystem::operator/[abi:ne180100](&buf, (uint64_t)&v169, (std::__fs::filesystem::path *)&marrs::mrr::md::MentionDetectorOverrides::OVERRIDES_FILE_NAME);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(&v187, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
      if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
        operator delete(buf.__r_.__value_.__l.__data_);
    }
    else
    {
      v187 = buf;
    }
    v25 = (void *)MEMORY[0x1E0CB3940];
    v26 = SHIBYTE(v187.__r_.__value_.__r.__words[2]);
    v27 = v187.__r_.__value_.__r.__words[0];
    v28 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v26 >= 0)
      v29 = &v187;
    else
      v29 = (std::string *)v27;
    objc_msgSend(v25, "stringWithCString:encoding:", v29, v28);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v149, "fileExistsAtPath:", v152) & 1) == 0)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      std::operator+<char>();
      MEMORY[0x1C3BC5934](exception, &buf);
      __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
    }
    v162 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithJSON:", v152);
    objc_msgSend(v162, "allKeys");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    *(_OWORD *)&v175.__r_.__value_.__r.__words[1] = 0uLL;
    v175.__r_.__value_.__r.__words[0] = (std::string::size_type)&v175.__r_.__value_.__l.__size_;
    *(_OWORD *)__p = 0u;
    v172 = 0u;
    v173 = 0u;
    v174 = 0u;
    obj = v30;
    v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __p, &v188, 16);
    if (v31)
    {
      v161 = *(_QWORD *)v172;
      do
      {
        v32 = 0;
        v164 = v31;
        do
        {
          if (*(_QWORD *)v172 != v161)
            objc_enumerationMutation(obj);
          v33 = (void *)*((_QWORD *)__p[1] + v32);
          memset(&v170, 0, sizeof(v170));
          objc_msgSend(v162, "objectForKey:", v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          for (i = 0; i < objc_msgSend(v34, "count"); ++i)
          {
            objc_msgSend(v34, "objectAtIndex:", i);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("startTokenIndex"));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v37)
              goto LABEL_78;
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("endTokenIndex"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v38)
            {

LABEL_78:
              goto LABEL_79;
            }
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("input"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v40 = v39 == 0;

            if (v40)
              goto LABEL_78;
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("startTokenIndex"));
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(buf.__r_.__value_.__l.__data_) = objc_msgSend(v41, "intValue");
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("endTokenIndex"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            HIDWORD(buf.__r_.__value_.__r.__words[0]) = objc_msgSend(v42, "intValue");
            objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("input"));
            v43 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
            std::string::basic_string[abi:ne180100]<0>(&buf.__r_.__value_.__l.__size_, (char *)objc_msgSend(v43, "UTF8String"));

            v44 = *(_OWORD *)&v170.__r_.__value_.__r.__words[1];
            if (v170.__r_.__value_.__l.__size_ >= v170.__r_.__value_.__r.__words[2])
            {
              v47 = (uint64_t)(v170.__r_.__value_.__l.__size_ - v170.__r_.__value_.__r.__words[0]) >> 5;
              if ((unint64_t)(v47 + 1) >> 59)
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v48 = (uint64_t)(v170.__r_.__value_.__r.__words[2] - v170.__r_.__value_.__r.__words[0]) >> 4;
              if (v48 <= v47 + 1)
                v48 = v47 + 1;
              if (v170.__r_.__value_.__r.__words[2] - v170.__r_.__value_.__r.__words[0] >= 0x7FFFFFFFFFFFFFE0)
                v49 = 0x7FFFFFFFFFFFFFFLL;
              else
                v49 = v48;
              v178 = &v170.__r_.__value_.__s.__data_[16];
              if (v49)
                v49 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<MDMentionOverride>>(v49);
              else
                v50 = 0;
              v52 = (_QWORD *)(v49 + 32 * v47);
              v176.__r_.__value_.__r.__words[0] = v49;
              v176.__r_.__value_.__l.__size_ = (std::string::size_type)v52;
              v176.__r_.__value_.__r.__words[2] = (std::string::size_type)v52;
              v177 = v49 + 32 * v50;
              *v52 = buf.__r_.__value_.__r.__words[0];
              v53 = (std::string *)(v52 + 1);
              if (SHIBYTE(v181) < 0)
              {
                std::string::__init_copy_ctor_external(v53, (const std::string::value_type *)buf.__r_.__value_.__l.__size_, buf.__r_.__value_.__r.__words[2]);
                v52 = (_QWORD *)v176.__r_.__value_.__r.__words[2];
              }
              else
              {
                v54 = *(_OWORD *)&buf.__r_.__value_.__r.__words[1];
                v52[3] = v181;
                *(_OWORD *)&v53->__r_.__value_.__l.__data_ = v54;
              }
              v51 = (std::string::size_type)(v52 + 4);
              v176.__r_.__value_.__r.__words[2] = (std::string::size_type)(v52 + 4);
              size = v170.__r_.__value_.__l.__size_;
              v56 = v170.__r_.__value_.__r.__words[0];
              v57 = v176.__r_.__value_.__l.__size_;
              if (v170.__r_.__value_.__l.__size_ == v170.__r_.__value_.__r.__words[0])
              {
                v60 = vdupq_n_s64(v170.__r_.__value_.__l.__size_);
              }
              else
              {
                do
                {
                  v58 = *(_QWORD *)(size - 32);
                  size -= 32;
                  *(_QWORD *)(v57 - 32) = v58;
                  v57 -= 32;
                  v59 = *(_OWORD *)(size + 8);
                  *(_QWORD *)(v57 + 24) = *(_QWORD *)(size + 24);
                  *(_OWORD *)(v57 + 8) = v59;
                  *(_QWORD *)(size + 16) = 0;
                  *(_QWORD *)(size + 24) = 0;
                  *(_QWORD *)(size + 8) = 0;
                }
                while (size != v56);
                v60 = *(int64x2_t *)&v170.__r_.__value_.__l.__data_;
                v51 = v176.__r_.__value_.__r.__words[2];
              }
              v170.__r_.__value_.__r.__words[0] = v57;
              v170.__r_.__value_.__l.__size_ = v51;
              *(int64x2_t *)&v176.__r_.__value_.__r.__words[1] = v60;
              v61 = v170.__r_.__value_.__r.__words[2];
              v170.__r_.__value_.__r.__words[2] = v177;
              v177 = v61;
              v176.__r_.__value_.__r.__words[0] = v60.i64[0];
              std::__split_buffer<MDMentionOverride>::~__split_buffer((uint64_t)&v176);
            }
            else
            {
              *(_QWORD *)v170.__r_.__value_.__l.__size_ = buf.__r_.__value_.__r.__words[0];
              v45 = (std::string *)(v44 + 8);
              if (SHIBYTE(v181) < 0)
              {
                std::string::__init_copy_ctor_external(v45, (const std::string::value_type *)buf.__r_.__value_.__l.__size_, buf.__r_.__value_.__r.__words[2]);
              }
              else
              {
                v46 = *(_OWORD *)&buf.__r_.__value_.__r.__words[1];
                *(_QWORD *)(v44 + 24) = v181;
                *(_OWORD *)&v45->__r_.__value_.__l.__data_ = v46;
              }
              v51 = v44 + 32;
            }
            v170.__r_.__value_.__l.__size_ = v51;
            if (SHIBYTE(v181) < 0)
              operator delete((void *)buf.__r_.__value_.__l.__size_);

          }
          std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(objc_retainAutorelease(v33), "UTF8String"));
          v62 = (void **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<void>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t)&v175, &v179, &buf);
          v63 = (char *)*v62;
          if (!*v62)
          {
            v64 = v62;
            v63 = (char *)operator new(0x50uLL);
            v176.__r_.__value_.__r.__words[0] = (std::string::size_type)v63;
            v176.__r_.__value_.__l.__size_ = (std::string::size_type)&v175.__r_.__value_.__l.__size_;
            v176.__r_.__value_.__s.__data_[16] = 0;
            v65 = (std::string *)(v63 + 32);
            if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
            {
              std::string::__init_copy_ctor_external(v65, buf.__r_.__value_.__l.__data_, buf.__r_.__value_.__l.__size_);
            }
            else
            {
              *(_OWORD *)&v65->__r_.__value_.__l.__data_ = *(_OWORD *)&buf.__r_.__value_.__l.__data_;
              *((_QWORD *)v63 + 6) = *((_QWORD *)&buf.__r_.__value_.__l + 2);
            }
            *((_QWORD *)v63 + 8) = 0;
            *((_QWORD *)v63 + 9) = 0;
            *((_QWORD *)v63 + 7) = 0;
            v176.__r_.__value_.__s.__data_[16] = 1;
            v66 = v179;
            *(_QWORD *)v63 = 0;
            *((_QWORD *)v63 + 1) = 0;
            *((_QWORD *)v63 + 2) = v66;
            *v64 = v63;
            v67 = (uint64_t *)v63;
            if (*(_QWORD *)v175.__r_.__value_.__l.__data_)
            {
              v175.__r_.__value_.__r.__words[0] = *(_QWORD *)v175.__r_.__value_.__l.__data_;
              v67 = (uint64_t *)*v64;
            }
            std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>((uint64_t *)v175.__r_.__value_.__l.__size_, v67);
            ++v175.__r_.__value_.__r.__words[2];
            v176.__r_.__value_.__r.__words[0] = 0;
            std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::vector<MDMentionOverride>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::vector<MDMentionOverride>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v176);
          }
          v68 = (void **)(v63 + 56);
          if (v63 + 56 != (char *)&v170)
          {
            v159 = v170.__r_.__value_.__l.__size_;
            v69 = (std::string::__raw *)v170.__r_.__value_.__r.__words[0];
            v70 = v170.__r_.__value_.__l.__size_ - v170.__r_.__value_.__r.__words[0];
            v71 = (uint64_t)(v170.__r_.__value_.__l.__size_ - v170.__r_.__value_.__r.__words[0]) >> 5;
            v72 = (uint64_t)(v63 + 72);
            v73 = *((_QWORD *)v63 + 9);
            v74 = (std::string *)*((_QWORD *)v63 + 7);
            if (v71 <= (v73 - (uint64_t)v74) >> 5)
            {
              v78 = (std::string *)*((_QWORD *)v63 + 8);
              v79 = ((char *)v78 - (char *)v74) >> 5;
              if (v79 >= v71)
              {
                if (v170.__r_.__value_.__r.__words[0] != v170.__r_.__value_.__l.__size_)
                {
                  do
                  {
                    v85 = v74;
                    v87 = v69->__words[0];
                    v86 = (const std::string *)&v69->__words[1];
                    v74->__r_.__value_.__r.__words[0] = v87;
                    std::string::operator=((std::string *)&v74->__r_.__value_.__r.__words[1], v86);
                    v69 = (std::string::__raw *)&v86[1];
                    v74 = (std::string *)((char *)v74 + 32);
                  }
                  while (v69 != (std::string::__raw *)v159);
                  v74 = (std::string *)((char *)v85 + 32);
                  v78 = (std::string *)*((_QWORD *)v63 + 8);
                }
                while (v78 != v74)
                {
                  if (SHIBYTE(v78[-1].__r_.__value_.__r.__words[2]) < 0)
                    operator delete(v78[-1].__r_.__value_.__l.__data_);
                  v78 = (std::string *)((char *)v78 - 32);
                }
                *((_QWORD *)v63 + 8) = v74;
                goto LABEL_112;
              }
              v80 = v170.__r_.__value_.__r.__words[0] + 32 * v79;
              if (v78 == v74)
              {
                v81 = v170.__r_.__value_.__l.__size_;
              }
              else
              {
                v81 = v170.__r_.__value_.__l.__size_;
                do
                {
                  v83 = v69->__words[0];
                  v82 = (const std::string *)&v69->__words[1];
                  v74->__r_.__value_.__r.__words[0] = v83;
                  v84 = (std::string *)&v74->__r_.__value_.__r.__words[1];
                  std::string::operator=(v84, v82);
                  v69 = (std::string::__raw *)&v82[1];
                  v74 = v84 + 1;
                }
                while (v69 != (std::string::__raw *)v80);
                v74 = (std::string *)*((_QWORD *)v63 + 8);
                v72 = (uint64_t)(v63 + 72);
              }
              v77 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MDMentionOverride>,MDMentionOverride*,MDMentionOverride*,MDMentionOverride*>(v72, v80, v81, v74);
            }
            else
            {
              if (v74)
              {
                std::vector<MDMentionOverride>::__clear[abi:ne180100]((uint64_t *)v63 + 7);
                operator delete(*v68);
                v73 = 0;
                *v68 = 0;
                *((_QWORD *)v63 + 8) = 0;
                *((_QWORD *)v63 + 9) = 0;
              }
              if ((v70 & 0x8000000000000000) != 0)
                std::vector<float>::__throw_length_error[abi:ne180100]();
              v75 = v73 >> 4;
              if (v73 >> 4 <= v71)
                v75 = v71;
              if ((unint64_t)v73 >= 0x7FFFFFFFFFFFFFE0)
                v76 = 0x7FFFFFFFFFFFFFFLL;
              else
                v76 = v75;
              std::vector<MDMentionOverride>::__vallocate[abi:ne180100]((_QWORD *)v63 + 7, v76);
              v77 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MDMentionOverride>,MDMentionOverride*,MDMentionOverride*,MDMentionOverride*>((uint64_t)(v63 + 72), (uint64_t)v69, v159, *((_QWORD **)v63 + 8));
            }
            *((_QWORD *)v63 + 8) = v77;
          }
LABEL_112:
          if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
            operator delete(buf.__r_.__value_.__l.__data_);
LABEL_79:

          buf.__r_.__value_.__r.__words[0] = (std::string::size_type)&v170;
          std::vector<MDMentionOverride>::__destroy_vector::operator()[abi:ne180100]((void ***)&buf);
          ++v32;
        }
        while (v32 != v164);
        v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", __p, &v188, 16);
      }
      while (v31);
    }

    v88 = (char *)&v185 + 8;
    v186 = 0;
    *((_QWORD *)&v185 + 1) = 0;
    *(_QWORD *)&v185 = (char *)&v185 + 8;
    v89 = v175.__r_.__value_.__r.__words[0];
    if ((std::string::size_type *)v175.__r_.__value_.__l.__data_ != &v175.__r_.__value_.__r.__words[1])
    {
      do
      {
        v90 = *((_QWORD *)&v185 + 1);
        v91 = (_QWORD *)&v185 + 1;
        if ((__int128 *)v185 == (__int128 *)((char *)&v185 + 8))
          goto LABEL_122;
        v92 = (_QWORD *)*((_QWORD *)&v185 + 1);
        v93 = (char *)&v185 + 8;
        if (*((_QWORD *)&v185 + 1))
        {
          do
          {
            v91 = v92;
            v92 = (_QWORD *)v92[1];
          }
          while (v92);
        }
        else
        {
          do
          {
            v91 = (_QWORD *)*((_QWORD *)v93 + 2);
            v94 = *v91 == (_QWORD)v93;
            v93 = (char *)v91;
          }
          while (v94);
        }
        if (std::less<void>::operator()[abi:ne180100]<std::string const&,std::string const&>(v91 + 4, (_QWORD *)(v89 + 32)))
        {
LABEL_122:
          if (!v90)
          {
            v179 = (char *)&v185 + 8;
            v95 = (uint64_t **)&v185 + 1;
LABEL_128:
            v96 = (char *)operator new(0x50uLL);
            v97 = (uint64_t *)v96;
            v176.__r_.__value_.__r.__words[0] = (std::string::size_type)v96;
            v176.__r_.__value_.__l.__size_ = (std::string::size_type)&v185 + 8;
            v176.__r_.__value_.__s.__data_[16] = 0;
            if (*(char *)(v89 + 55) < 0)
            {
              std::string::__init_copy_ctor_external((std::string *)(v96 + 32), *(const std::string::value_type **)(v89 + 32), *(_QWORD *)(v89 + 40));
            }
            else
            {
              v98 = *(_OWORD *)(v89 + 32);
              *((_QWORD *)v96 + 6) = *(_QWORD *)(v89 + 48);
              *((_OWORD *)v96 + 2) = v98;
            }
            v97[7] = 0;
            v97[8] = 0;
            v97[9] = 0;
            v99 = *(_QWORD *)(v89 + 56);
            v100 = *(_QWORD *)(v89 + 64);
            buf.__r_.__value_.__r.__words[0] = (std::string::size_type)(v97 + 7);
            buf.__r_.__value_.__s.__data_[8] = 0;
            if (v100 != v99)
            {
              std::vector<MDMentionOverride>::__vallocate[abi:ne180100](v97 + 7, (v100 - v99) >> 5);
              v97[8] = (uint64_t)std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<MDMentionOverride>,MDMentionOverride*,MDMentionOverride*,MDMentionOverride*>((uint64_t)(v97 + 9), v99, v100, (_QWORD *)v97[8]);
            }
            v176.__r_.__value_.__s.__data_[16] = 1;
            v101 = v179;
            *v97 = 0;
            v97[1] = 0;
            v97[2] = (uint64_t)v101;
            *v95 = v97;
            if (*(_QWORD *)v185)
            {
              *(_QWORD *)&v185 = *(_QWORD *)v185;
              v97 = *v95;
            }
            std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(*((uint64_t **)&v185 + 1), v97);
            ++v186;
            v176.__r_.__value_.__r.__words[0] = 0;
            std::unique_ptr<std::__tree_node<std::__value_type<std::string,std::vector<MDMentionOverride>>,void *>,std::__tree_node_destructor<std::allocator<std::__tree_node<std::__value_type<std::string,std::vector<MDMentionOverride>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v176);
            goto LABEL_136;
          }
          v179 = (char *)v91;
          v95 = (uint64_t **)(v91 + 1);
        }
        else
        {
          v95 = (uint64_t **)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<void>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__find_equal<std::string>((uint64_t)&v185, &v179, (_QWORD *)(v89 + 32));
        }
        if (!*v95)
          goto LABEL_128;
LABEL_136:
        v102 = *(std::string **)(v89 + 8);
        if (v102)
        {
          do
          {
            v103 = v102;
            v102 = (std::string *)v102->__r_.__value_.__r.__words[0];
          }
          while (v102);
        }
        else
        {
          do
          {
            v103 = *(std::string **)(v89 + 16);
            v94 = v103->__r_.__value_.__r.__words[0] == v89;
            v89 = (std::string::size_type)v103;
          }
          while (!v94);
        }
        v89 = (std::string::size_type)v103;
      }
      while (v103 != (std::string *)&v175.__r_.__value_.__r.__words[1]);
    }
    std::__tree<std::__value_type<std::string,std::vector<MDMentionOverride>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<MDMentionOverride>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<MDMentionOverride>>>>::destroy((_QWORD *)v175.__r_.__value_.__l.__size_);

    std::__tree<std::__value_type<std::string,std::vector<MDMentionOverride>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<MDMentionOverride>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<MDMentionOverride>>>>::destroy(*(_QWORD **)(v150 + 144));
    v104 = (_QWORD *)*((_QWORD *)&v185 + 1);
    *(_QWORD *)(v150 + 136) = v185;
    *(_QWORD *)(v150 + 144) = v104;
    v105 = v186;
    *(_QWORD *)(v150 + 152) = v186;
    if (v105)
    {
      v104[2] = v148;
      *(_QWORD *)&v185 = (char *)&v185 + 8;
      *((_QWORD *)&v185 + 1) = 0;
      v186 = 0;
      v104 = 0;
    }
    else
    {
      *(_QWORD *)(v150 + 136) = v148;
    }
    std::__tree<std::__value_type<std::string,std::vector<MDMentionOverride>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::vector<MDMentionOverride>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::vector<MDMentionOverride>>>>::destroy(v104);
    if (SHIBYTE(v187.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v187.__r_.__value_.__l.__data_);
    v106 = MRRLoggerForCategory(2);
    if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
    {
      v107 = *(_QWORD *)(v150 + 152);
      LODWORD(buf.__r_.__value_.__l.__data_) = 134217984;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = v107;
      _os_log_impl(&dword_1C281A000, v106, OS_LOG_TYPE_INFO, "md overrides count = %lu", (uint8_t *)&buf, 0xCu);
    }
    std::__fs::filesystem::operator/[abi:ne180100](&v170, (uint64_t)&v169, (std::__fs::filesystem::path *)&marrs::mrr::md::configFileName);
    if (SHIBYTE(v170.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v175, v170.__r_.__value_.__l.__data_, v170.__r_.__value_.__l.__size_);
    else
      v175 = v170;
    v108 = (void *)MEMORY[0x1E0CB3940];
    v109 = SHIBYTE(v175.__r_.__value_.__r.__words[2]);
    v110 = v175.__r_.__value_.__r.__words[0];
    v111 = objc_msgSend(MEMORY[0x1E0CB3940], "defaultCStringEncoding");
    if (v109 >= 0)
      v112 = &v175;
    else
      v112 = (std::string *)v110;
    objc_msgSend(v108, "stringWithCString:encoding:", v112, v111);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v114 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithJSON:", v113);
    *(_QWORD *)((char *)v184 + 7) = 0;
    v184[0] = 0;
    v187.__r_.__value_.__r.__words[0] = 0;
    *(std::string::size_type *)((char *)v187.__r_.__value_.__r.__words + 7) = 0;
    *(_QWORD *)&v185 = 0;
    *(_QWORD *)((char *)&v185 + 7) = 0;
    objc_msgSend(v114, "objectForKey:", CFSTR("version"));
    v115 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v115, "UTF8String"));
    v187.__r_.__value_.__r.__words[0] = buf.__r_.__value_.__l.__size_;
    v163 = buf.__r_.__value_.__r.__words[0];
    *(std::string::size_type *)((char *)v187.__r_.__value_.__r.__words + 7) = *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 7);
    v166 = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    *((_BYTE *)&buf.__r_.__value_.__s + 23) = 0;
    buf.__r_.__value_.__s.__data_[0] = 0;

    objc_msgSend(v114, "objectForKey:", CFSTR("boltTaskId"));
    v116 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v116, "UTF8String"));
    *(_QWORD *)&v185 = buf.__r_.__value_.__l.__size_;
    v117 = buf.__r_.__value_.__r.__words[0];
    *(_QWORD *)((char *)&v185 + 7) = *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 7);
    v165 = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    *((_BYTE *)&buf.__r_.__value_.__s + 23) = 0;
    buf.__r_.__value_.__s.__data_[0] = 0;

    objc_msgSend(v114, "objectForKey:", CFSTR("mentionSelectionMethod"));
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    v119 = objc_msgSend(v118, "isEqual:", CFSTR("high_f1"));
    objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("mentionScoreThreshold"));
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    v121 = v120 == 0;

    if (!v121)
    {
      objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("mentionScoreThreshold"));
      v88 = (char *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v88, "floatValue");
      v5 = v122;

    }
    objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("numberOfSpansToKeep"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = v123 == 0;

    if (!v124)
    {
      objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("numberOfSpansToKeep"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v88) = objc_msgSend(v125, "intValue");

    }
    objc_msgSend(v114, "objectForKey:", CFSTR("owlEmbeddingsTaskId"));
    v126 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v126, "UTF8String"));
    v184[0] = buf.__r_.__value_.__l.__size_;
    v127 = buf.__r_.__value_.__r.__words[0];
    *(_QWORD *)((char *)v184 + 7) = *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 7);
    v128 = HIBYTE(buf.__r_.__value_.__r.__words[2]);
    *((_BYTE *)&buf.__r_.__value_.__s + 23) = 0;
    buf.__r_.__value_.__s.__data_[0] = 0;

    objc_msgSend(v114, "objectForKey:", CFSTR("owlEmbeddingDim"));
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v126) = v129 == 0;

    if ((v126 & 1) != 0)
    {
      v131 = 192;
    }
    else
    {
      objc_msgSend(v114, "objectForKeyedSubscript:", CFSTR("owlEmbeddingDim"));
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      v131 = objc_msgSend(v130, "longValue");

    }
    if (*(char *)(v150 + 63) < 0)
      operator delete(*v147);
    v132 = v187.__r_.__value_.__r.__words[0];
    *(_QWORD *)(v150 + 40) = v163;
    *(_QWORD *)(v150 + 48) = v132;
    *(_QWORD *)(v150 + 55) = *(std::string::size_type *)((char *)v187.__r_.__value_.__r.__words + 7);
    *(_BYTE *)(v150 + 63) = v166;
    if (*(char *)(v150 + 87) < 0)
      operator delete(*(void **)(v150 + 64));
    v133 = v185;
    *(_QWORD *)(v150 + 64) = v117;
    *(_QWORD *)(v150 + 72) = v133;
    *(_QWORD *)(v150 + 79) = *(_QWORD *)((char *)&v185 + 7);
    *(_BYTE *)(v150 + 87) = v165;
    *(_DWORD *)(v150 + 88) = v119;
    *(_DWORD *)(v150 + 92) = v5;
    *(_DWORD *)(v150 + 96) = (_DWORD)v88;
    if (*(char *)(v150 + 127) < 0)
      operator delete(*v146);
    v134 = v184[0];
    *(_QWORD *)(v150 + 104) = v127;
    *(_QWORD *)(v150 + 112) = v134;
    *(_QWORD *)(v150 + 119) = *(_QWORD *)((char *)v184 + 7);
    *(_BYTE *)(v150 + 127) = v128;
    *(_QWORD *)(v150 + 128) = v131;
    if (SHIBYTE(v175.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v175.__r_.__value_.__l.__data_);
    if (SHIBYTE(v170.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v170.__r_.__value_.__l.__data_);
    if (SHIBYTE(v169.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v175, v169.__r_.__value_.__l.__data_, v169.__r_.__value_.__l.__size_);
    else
      v175 = v169;
    std::__fs::filesystem::operator/[abi:ne180100](&v170, (uint64_t)&v169, (std::__fs::filesystem::path *)&marrs::mrr::md::configFileName);
    std::ifstream::basic_ifstream(&buf);
    if (SHIBYTE(v170.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v170.__r_.__value_.__l.__data_);
    std::string::__init_with_sentinel[abi:ne180100]<std::istreambuf_iterator<char>,std::istreambuf_iterator<char>>(&v170, *(_QWORD **)&v182[*(_QWORD *)(buf.__r_.__value_.__r.__words[0] - 24)]);
    v135 = MRRLoggerForCategory(1);
    if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
    {
      v136 = &v170;
      if ((v170.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
        v136 = (std::string *)v170.__r_.__value_.__r.__words[0];
      LODWORD(v187.__r_.__value_.__l.__data_) = 136315138;
      *(std::string::size_type *)((char *)v187.__r_.__value_.__r.__words + 4) = (std::string::size_type)v136;
      _os_log_impl(&dword_1C281A000, v135, OS_LOG_TYPE_INFO, "Loaded MD Config - %s", (uint8_t *)&v187, 0xCu);
    }
    if (SHIBYTE(v170.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v170.__r_.__value_.__l.__data_);
    buf.__r_.__value_.__r.__words[0] = *MEMORY[0x1E0DE4F40];
    *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words
                              + *(_QWORD *)(buf.__r_.__value_.__r.__words[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40]
                                                                                                + 24);
    MEMORY[0x1C3BC5A3C](&buf.__r_.__value_.__r.__words[2]);
    std::istream::~istream();
    MEMORY[0x1C3BC5BC8](&v183);
    if (SHIBYTE(v175.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v175.__r_.__value_.__l.__data_);
    if (SHIBYTE(v169.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v169.__r_.__value_.__l.__data_);
    value = v158->_mentionDetector.__ptr_.__value_;
    v158->_mentionDetector.__ptr_.__value_ = (MRRMentionDetectorInterface *)v150;
    if (value)
      (*(void (**)(MRRMentionDetectorInterface *))(*(_QWORD *)value + 16))(value);
  }
  else
  {
    v21 = v158->_mentionDetector.__ptr_.__value_;
    v158->_mentionDetector.__ptr_.__value_ = 0;
    if (v21)
      (*(void (**)(MRRMentionDetectorInterface *))(*(_QWORD *)v21 + 16))(v21);
    MRRLoggerForCategory(1);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf.__r_.__value_.__l.__data_) = 138412546;
      *(std::string::size_type *)((char *)buf.__r_.__value_.__r.__words + 4) = (std::string::size_type)v155;
      WORD2(buf.__r_.__value_.__r.__words[1]) = 2112;
      *(std::string::size_type *)((char *)&buf.__r_.__value_.__r.__words[1] + 6) = (std::string::size_type)v156;
      _os_log_impl(&dword_1C281A000, v22, OS_LOG_TYPE_INFO, "Failed initializing MD with asset path - %@, locale - %@", (uint8_t *)&buf, 0x16u);
    }

  }
  +[MRRMultimodalMentionDetector name](MRRMultimodalMentionDetector, "name");
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  +[PredictorUtils reportInitStatusWithPredictorName:domain:code:locale:](PredictorUtils, "reportInitStatusWithPredictorName:domain:code:locale:", v138, CFSTR("com.apple.siri.marrs.rr"), 0, v156);

  if (a5)
  {
    +[MRRMultimodalMentionDetector name](MRRMultimodalMentionDetector, "name");
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    +[PredictorUtils getInitStatusWithPredictorName:domain:code:](PredictorUtils, "getInitStatusWithPredictorName:domain:code:", v139, CFSTR("com.apple.siri.marrs.rr"), 0);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

  }
  MRRLoggerForCategory(1);
  v140 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v140, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1C281A000, v140, OS_LOG_TYPE_INFO, "successfully initialized MD", (uint8_t *)&buf, 2u);
  }

  MRRLoggerForCategory(3);
  v141 = objc_claimAutoreleasedReturnValue();
  v142 = v141;
  if (v153 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v141))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v142, OS_SIGNPOST_INTERVAL_END, spid, "MDInitialization", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
  }

  MRRLoggerForCategory(0);
  v143 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_log_impl(&dword_1C281A000, v143, OS_LOG_TYPE_INFO, "END \"MDInitialization\", (uint8_t *)&buf, 2u);
  }

  return v158;
}

- (id)detectMentionsInUtteranceImpl:(id)a3 status:(id *)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  NSString *locale;
  MRRMentionDetectorInterface *value;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  void *v45;
  BOOL v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  uint8_t v54[8];
  uint64_t v55;
  uint8_t buf[40];
  uint64_t v57;

  v5 = a3;
  MRRLoggerForCategory(3);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);

  MRRLoggerForCategory(3);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v52 = v7 - 1;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "MDExecuteRequest", ", buf, 2u);
  }

  MRRLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C281A000, v10, OS_LOG_TYPE_INFO, "BEGIN \"MDExecuteRequest\", buf, 2u);
  }

  objc_msgSend(v5, "requestId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v12 = objc_alloc_init(MEMORY[0x1E0D9F9A0]);
    objc_msgSend(v5, "setRequestId:", v12);

  }
  objc_msgSend(v5, "nluRequestId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0D9F9A0]);
    objc_msgSend(v5, "setNluRequestId:", v14);

  }
  objc_msgSend(v5, "resultCandidateId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
    objc_msgSend(v5, "setResultCandidateId:", &stru_1E7C67E88);
  objc_msgSend(v5, "tokenChain");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    objc_msgSend(v5, "tokenChain");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tokens");

  }
  objc_msgSend(v5, "embeddingTensor");

  if (!objc_msgSend(v5, "maxCandidates"))
    objc_msgSend(v5, "setMaxCandidates:", 0x7FFFFFFFLL);
  if (!self->_locale)
  {
    objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "objectAtIndex:", 0);
    v19 = (NSString *)objc_claimAutoreleasedReturnValue();
    locale = self->_locale;
    self->_locale = v19;

  }
  +[ConverterUtils convertMentionDetectorRequestFromObjCToCpp:](ConverterUtils, "convertMentionDetectorRequestFromObjCToCpp:", v5);
  value = self->_mentionDetector.__ptr_.__value_;
  if (value)
  {
    (**(void (***)(uint8_t *__return_ptr, MRRMentionDetectorInterface *, uint64_t))value)(buf, self->_mentionDetector.__ptr_.__value_, v57);
    v22 = operator new();
    v55 = MEMORY[0x1C3BC5580](v22, buf);
    +[ConverterUtils convertMentionDetectorResponseFromCppToObjC:](ConverterUtils, "convertMentionDetectorResponseFromCppToObjC:", &v55);
    v23 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resultCandidateId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v24)
      goto LABEL_34;
    objc_msgSend(v5, "resultCandidateId");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v25, "isEqualToString:", &stru_1E7C67E88))
    {

      goto LABEL_34;
    }
    objc_msgSend(v5, "cdmRequestId");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
LABEL_34:
      MRRLoggerForCategory(1);
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl(&dword_1C281A000, v35, OS_LOG_TYPE_ERROR, "resultCandidateId or cdmRequestId is either null or empty, skipped emitting MentionDetectorEvaluated events", v54, 2u);
      }
      goto LABEL_41;
    }
    v33 = (void *)MEMORY[0x1E0D9FAC8];
    objc_msgSend(v5, "cdmRequestId");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "extractRequestLinkData:", v34);
    v35 = objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(v5, "nluRequestId");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject trpId](v35, "trpId");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject targetUUID](v35, "targetUUID");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "resultCandidateId");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "cdmRequestId");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = +[MDMRSELFLoggingUtils emitMentionDetectorEvaluatedEventWithResponse:WithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:](MDMRSELFLoggingUtils, "emitMentionDetectorEvaluatedEventWithResponse:WithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:", v23, v51, v50, v49, v48, objc_msgSend(v36, "requester"));

      if (v47)
        goto LABEL_41;
      MRRLoggerForCategory(1);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl(&dword_1C281A000, v37, OS_LOG_TYPE_ERROR, "Error emitting MentionDetectorEvaluated events", v54, 2u);
      }
    }
    else
    {
      MRRLoggerForCategory(1);
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v54 = 0;
        _os_log_impl(&dword_1C281A000, v37, OS_LOG_TYPE_ERROR, "RequestLink data is nil", v54, 2u);
      }
    }

LABEL_41:
    v38 = v55;
    v55 = 0;
    if (v38)
      (*(void (**)(uint64_t))(*(_QWORD *)v38 + 8))(v38);
    MEMORY[0x1C3BC5598](buf);
    v31 = 0;
    goto LABEL_44;
  }
  +[MRRMultimodalMentionDetector name](MRRMultimodalMentionDetector, "name");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  +[PredictorUtils getPredictStatusWithPredictorName:domain:code:](PredictorUtils, "getPredictStatusWithPredictorName:domain:code:", v26, CFSTR("com.apple.siri.marrs.rr"), 137);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

  MRRLoggerForCategory(1);
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C281A000, v27, OS_LOG_TYPE_DEBUG, "Mention detector not loaded succesfully, likely issue related to asset. Skipped emitting MentionDetectorEvaluated events", buf, 2u);
  }

  MRRLoggerForCategory(3);
  v28 = objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C281A000, v29, OS_SIGNPOST_INTERVAL_END, v7, "MDExecuteRequest", " enableTelemetry=YES ", buf, 2u);
  }

  MRRLoggerForCategory(0);
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C281A000, v30, OS_LOG_TYPE_INFO, "END \"MDExecuteRequest\", buf, 2u);
  }

  v23 = 0;
  v31 = 137;
LABEL_44:
  v39 = v57;
  v57 = 0;
  if (v39)
    (*(void (**)(uint64_t))(*(_QWORD *)v39 + 8))(v39);
  if (value)
  {
    +[MRRMultimodalMentionDetector name](MRRMultimodalMentionDetector, "name");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    +[PredictorUtils reportPredictStatusWithPredictorName:domain:code:locale:](PredictorUtils, "reportPredictStatusWithPredictorName:domain:code:locale:", v40, CFSTR("com.apple.siri.marrs.rr"), v31, self->_locale);

    if (a4)
    {
      +[MRRMultimodalMentionDetector name](MRRMultimodalMentionDetector, "name");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      +[PredictorUtils getPredictStatusWithPredictorName:domain:code:](PredictorUtils, "getPredictStatusWithPredictorName:domain:code:", v41, CFSTR("com.apple.siri.marrs.rr"), v31);
      *a4 = (id)objc_claimAutoreleasedReturnValue();

    }
    MRRLoggerForCategory(3);
    v42 = objc_claimAutoreleasedReturnValue();
    v43 = v42;
    if (v52 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1C281A000, v43, OS_SIGNPOST_INTERVAL_END, v7, "MDExecuteRequest", " enableTelemetry=YES ", buf, 2u);
    }

    MRRLoggerForCategory(0);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C281A000, v44, OS_LOG_TYPE_INFO, "END \"MDExecuteRequest\", buf, 2u);
    }

    v23 = v23;
    v45 = v23;
  }
  else
  {
    v45 = 0;
  }

  return v45;
}

- (id)detectMentionsInUtterance:(id)a3 status:(id *)a4
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
  v11[2] = __65__MRRMultimodalMentionDetector_detectMentionsInUtterance_status___block_invoke;
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

- (id)detectMentionsInUtteranceRequest:(id)a3 status:(id *)a4
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
  v11[2] = __72__MRRMultimodalMentionDetector_detectMentionsInUtteranceRequest_status___block_invoke;
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

- (BOOL)detectMentionsInUtterance:(id)a3 status:(id *)a4 completionBlock:(id)a5
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
  v15[2] = __81__MRRMultimodalMentionDetector_detectMentionsInUtterance_status_completionBlock___block_invoke;
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

- (id)detectMentionsInUtterance:(id)a3 maximumCandidates:(unint64_t)a4 status:(id *)a5
{
  id v8;
  void *v9;
  NSObject *dispatchQueue;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  MRRMultimodalMentionDetector *v19;
  id v20;
  uint64_t *v21;
  id *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v8 = a3;
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "setUtterance:", v8);
  objc_msgSend(v9, "setRequestId:", 0);
  objc_msgSend(v9, "setNluRequestId:", 0);
  objc_msgSend(v9, "setResultCandidateId:", 0);
  objc_msgSend(v9, "setTokenChain:", 0);
  objc_msgSend(v9, "setEmbeddingTensor:", 0);
  objc_msgSend(v9, "setMaxCandidates:", a4);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy_;
  v27 = __Block_byref_object_dispose_;
  v28 = 0;
  dispatchQueue = self->_dispatchQueue;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __83__MRRMultimodalMentionDetector_detectMentionsInUtterance_maximumCandidates_status___block_invoke;
  v18 = &unk_1E7C675D0;
  v21 = &v23;
  v19 = self;
  v11 = v9;
  v20 = v11;
  v22 = a5;
  dispatch_sync(dispatchQueue, &v15);
  v12 = (void *)v24[5];
  if (v12)
  {
    objc_msgSend(v12, "mentions", v15, v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

  _Block_object_dispose(&v23, 8);
  return v13;
}

- (id)detectMentionsInUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSString *locale;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *dispatchQueue;
  id v23;
  void *v24;
  void *v25;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  MRRMultimodalMentionDetector *v31;
  id v32;
  uint64_t *v33;
  id *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  void (*v39)(uint64_t);
  id v40;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = (void *)objc_opt_new();
  objc_msgSend(v15, "setUtterance:", v12);
  objc_msgSend(v15, "setRequestId:", 0);
  objc_msgSend(v15, "setNluRequestId:", 0);
  objc_msgSend(v15, "setResultCandidateId:", 0);
  v16 = (void *)objc_opt_new();
  objc_msgSend(v15, "setTokenChain:", v16);

  locale = self->_locale;
  objc_msgSend(v15, "tokenChain");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLocale:", locale);

  objc_msgSend(v15, "tokenChain");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setStringValue:", v12);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v13);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "tokenChain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setTokens:", v20);

  objc_msgSend(v15, "setEmbeddingTensor:", v14);
  objc_msgSend(v15, "setMaxCandidates:", a6);
  v35 = 0;
  v36 = &v35;
  v37 = 0x3032000000;
  v38 = __Block_byref_object_copy_;
  v39 = __Block_byref_object_dispose_;
  v40 = 0;
  dispatchQueue = self->_dispatchQueue;
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __115__MRRMultimodalMentionDetector_detectMentionsInUtterance_utteranceTokens_tokenEmbeddings_maximumCandidates_status___block_invoke;
  v30 = &unk_1E7C675D0;
  v33 = &v35;
  v31 = self;
  v23 = v15;
  v32 = v23;
  v34 = a7;
  dispatch_sync(dispatchQueue, &v27);
  v24 = (void *)v36[5];
  if (v24)
  {
    objc_msgSend(v24, "mentions", v27, v28, v29, v30, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v25 = 0;
  }

  _Block_object_dispose(&v35, 8);
  return v25;
}

- (BOOL)detectMentionsInUtterance:(id)a3 maximumCandidates:(unint64_t)a4 status:(id *)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  NSObject *dispatchQueue;
  id v13;
  char v14;
  _QWORD v16[5];
  id v17;
  _QWORD *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  char v31;
  _QWORD v32[5];
  id v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v10 = a3;
  v11 = a6;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy_;
  v38 = __Block_byref_object_dispose_;
  v39 = (id)objc_opt_new();
  objc_msgSend((id)v35[5], "setUtterance:", v10);
  objc_msgSend((id)v35[5], "setRequestId:", 0);
  objc_msgSend((id)v35[5], "setNluRequestId:", 0);
  objc_msgSend((id)v35[5], "setResultCandidateId:", 0);
  objc_msgSend((id)v35[5], "setTokenChain:", 0);
  objc_msgSend((id)v35[5], "setEmbeddingTensor:", 0);
  objc_msgSend((id)v35[5], "setMaxCandidates:", a4);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = __Block_byref_object_copy_;
  v32[4] = __Block_byref_object_dispose_;
  v33 = 0;
  v28 = 0;
  v29 = &v28;
  v30 = 0x2020000000;
  v31 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy_;
  v26 = __Block_byref_object_dispose_;
  v27 = 0;
  dispatchQueue = self->_dispatchQueue;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __99__MRRMultimodalMentionDetector_detectMentionsInUtterance_maximumCandidates_status_completionBlock___block_invoke;
  v16[3] = &unk_1E7C67620;
  v18 = v32;
  v16[4] = self;
  v19 = &v34;
  v20 = &v22;
  v21 = &v28;
  v13 = v11;
  v17 = v13;
  dispatch_async(dispatchQueue, v16);
  if (a5)
    *a5 = objc_retainAutorelease((id)v23[5]);
  v14 = *((_BYTE *)v29 + 24);

  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v28, 8);
  _Block_object_dispose(v32, 8);

  _Block_object_dispose(&v34, 8);
  return v14;
}

- (BOOL)detectMentionsInUtterance:(id)a3 utteranceTokens:(id)a4 tokenEmbeddings:(id)a5 maximumCandidates:(unint64_t)a6 status:(id *)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  NSString *locale;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *dispatchQueue;
  id v26;
  id v27;
  char v28;
  _QWORD block[5];
  id v31;
  id v32;
  _QWORD *v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _QWORD v46[5];
  id v47;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = (void *)objc_opt_new();
  objc_msgSend(v18, "setUtterance:", v14);
  objc_msgSend(v18, "setRequestId:", 0);
  objc_msgSend(v18, "setNluRequestId:", 0);
  objc_msgSend(v18, "setResultCandidateId:", 0);
  v19 = (void *)objc_opt_new();
  objc_msgSend(v18, "setTokenChain:", v19);

  locale = self->_locale;
  objc_msgSend(v18, "tokenChain");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setLocale:", locale);

  objc_msgSend(v18, "tokenChain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setStringValue:", v14);

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "tokenChain");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTokens:", v23);

  objc_msgSend(v18, "setEmbeddingTensor:", v16);
  objc_msgSend(v18, "setMaxCandidates:", a6);
  v46[0] = 0;
  v46[1] = v46;
  v46[2] = 0x3032000000;
  v46[3] = __Block_byref_object_copy_;
  v46[4] = __Block_byref_object_dispose_;
  v47 = 0;
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy_;
  v40 = __Block_byref_object_dispose_;
  v41 = 0;
  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __131__MRRMultimodalMentionDetector_detectMentionsInUtterance_utteranceTokens_tokenEmbeddings_maximumCandidates_status_completionBlock___block_invoke;
  block[3] = &unk_1E7C675F8;
  v33 = v46;
  block[4] = self;
  v26 = v18;
  v31 = v26;
  v34 = &v36;
  v35 = &v42;
  v27 = v17;
  v32 = v27;
  dispatch_async(dispatchQueue, block);
  if (a7)
    *a7 = objc_retainAutorelease((id)v37[5]);
  v28 = *((_BYTE *)v43 + 24);

  _Block_object_dispose(&v36, 8);
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(v46, 8);

  return v28;
}

- (void).cxx_destruct
{
  MRRMentionDetectorInterface *value;

  objc_storeStrong((id *)&self->_locale, 0);
  value = self->_mentionDetector.__ptr_.__value_;
  self->_mentionDetector.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(MRRMentionDetectorInterface *))(*(_QWORD *)value + 16))(value);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 2) = 0;
  return self;
}

void __131__MRRMultimodalMentionDetector_detectMentionsInUtterance_utteranceTokens_tokenEmbeddings_maximumCandidates_status_completionBlock___block_invoke(_QWORD *a1)
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
  v3 = a1[5];
  v4 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v4 + 40);
  objc_msgSend(v2, "detectMentionsInUtteranceImpl:status:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
  {
    v8 = 0;
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  }
  else
  {
    v9 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
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
  (*(void (**)(void))(a1[6] + 16))();

}

void __99__MRRMultimodalMentionDetector_detectMentionsInUtterance_maximumCandidates_status_completionBlock___block_invoke(_QWORD *a1)
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
  objc_msgSend(v2, "detectMentionsInUtteranceImpl:status:", v3, &obj);
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

void __115__MRRMultimodalMentionDetector_detectMentionsInUtterance_utteranceTokens_tokenEmbeddings_maximumCandidates_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "detectMentionsInUtteranceImpl:status:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __83__MRRMultimodalMentionDetector_detectMentionsInUtterance_maximumCandidates_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "detectMentionsInUtteranceImpl:status:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

uint64_t __81__MRRMultimodalMentionDetector_detectMentionsInUtterance_status_completionBlock___block_invoke(_QWORD *a1)
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
  objc_msgSend(v2, "detectMentionsInUtteranceImpl:status:", v3, &obj);
  v5 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v4 + 40), obj);
  v6 = *(_QWORD *)(a1[7] + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  if (*(_QWORD *)(*(_QWORD *)(a1[8] + 8) + 40))
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
  return (*(uint64_t (**)(void))(a1[6] + 16))();
}

void __72__MRRMultimodalMentionDetector_detectMentionsInUtteranceRequest_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "detectMentionsInUtteranceImpl:status:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __65__MRRMultimodalMentionDetector_detectMentionsInUtterance_status___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "detectMentionsInUtteranceImpl:status:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

+ (id)name
{
  return CFSTR("MRRMultimodalMentionDetector");
}

+ (id)sharedManager
{
  if (+[MRRMultimodalMentionDetector sharedManager]::onceToken != -1)
    dispatch_once(&+[MRRMultimodalMentionDetector sharedManager]::onceToken, &__block_literal_global_607);
  return (id)+[MRRMultimodalMentionDetector sharedManager]::singletonMentionDetector;
}

void __45__MRRMultimodalMentionDetector_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)+[MRRMultimodalMentionDetector sharedManager]::singletonMentionDetector;
  +[MRRMultimodalMentionDetector sharedManager]::singletonMentionDetector = v0;

}

@end
