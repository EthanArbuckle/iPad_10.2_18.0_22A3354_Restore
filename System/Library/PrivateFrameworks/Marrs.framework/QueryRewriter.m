@implementation QueryRewriter

- (QueryRewriter)initWithLocale:(id)a3 filesPath:(id)a4 predictorType:(int)a5 status:(id *)a6
{
  unint64_t v6;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  _QWORD *v13;
  NSObject *v14;
  NSObject *v15;
  std::string *v16;
  size_t size;
  std::string *v18;
  std::string *v19;
  uint64_t v20;
  int v21;
  const std::string::value_type *v22;
  std::string::size_type v23;
  std::string *v24;
  __int128 v25;
  std::ios_base::openmode v26;
  int v27;
  _QWORD *v28;
  const std::locale::facet *v29;
  unsigned __int8 v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  uint8x8_t v34;
  unint64_t v35;
  unsigned __int8 **v36;
  unsigned __int8 *i;
  unint64_t v38;
  _QWORD *v39;
  std::string *v40;
  float v41;
  float v42;
  _BOOL8 v43;
  unint64_t v44;
  unint64_t v45;
  int8x8_t prime;
  void *v47;
  _QWORD *v48;
  uint64_t v49;
  _QWORD *v50;
  unint64_t v51;
  uint8x8_t v52;
  unint64_t v53;
  uint8x8_t v54;
  uint64_t v55;
  _QWORD *v56;
  unint64_t v57;
  _QWORD *v58;
  _QWORD *v59;
  unint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  _QWORD *v66;
  const std::string *v67;
  _QWORD *v68;
  const std::string *v69;
  const std::string *v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  char *v75;
  char *v76;
  std::ios_base *v77;
  const char *v78;
  std::string::size_type v79;
  std::string::size_type v80;
  uint64_t v81;
  unint64_t v82;
  char *v83;
  _DWORD *v84;
  char *v85;
  uint64_t v86;
  unint64_t v87;
  uint64_t v88;
  BOOL v89;
  unint64_t v90;
  uint64_t v91;
  _DWORD *v92;
  int v93;
  _QWORD *v94;
  QRPredictor *v95;
  QueryRewriter *v96;
  NSString *predictorName;
  const __CFString *v98;
  _QWORD *v99;
  QRPredictor *value;
  NSObject *v101;
  NSObject *v102;
  std::string *v103;
  size_t v104;
  std::string *v105;
  std::string *v106;
  uint64_t v107;
  int v108;
  const std::string::value_type *v109;
  std::string::size_type v110;
  std::string *v111;
  __int128 v112;
  std::ios_base::openmode v113;
  int v114;
  std::locale::id *v115;
  const std::locale::facet *v116;
  unsigned __int8 v117;
  unint64_t v118;
  __int128 v119;
  std::vector<std::string>::pointer v120;
  const std::string *v121;
  const std::string *v122;
  uint64_t v123;
  const char *v124;
  QRPredictor *v125;
  NSObject *v126;
  NSObject *v127;
  os_signpost_id_t v128;
  __int128 v129;
  __int128 v130;
  NSObject *v131;
  char *extbuf;
  char *v133;
  NSObject *v134;
  marrs::inference_engine::EspressoModule *v135;
  NSObject *v136;
  QRPredictor *v137;
  NSObject *v138;
  NSObject *v139;
  std::string *v140;
  const std::string *v141;
  std::string *v142;
  const std::string *v143;
  std::string *v144;
  const std::string *v145;
  QRPredictor *v146;
  NSObject *v147;
  QueryRewriter *v148;
  std::string *v150;
  std::string *p_str;
  _QWORD *exception;
  _QWORD *v153;
  _QWORD *v154;
  _QWORD *v155;
  os_signpost_id_t spid;
  std::string *v157;
  _QWORD *v158;
  NSObject *v159;
  std::string *v160;
  std::string *v161;
  char *v163;
  int v164;
  id v165;
  void **v166;
  QueryRewriter *v167;
  void *v168[2];
  uint64_t v169;
  void *v170;
  char v171;
  objc_super v172;
  std::__fs::filesystem::path v173;
  std::__fs::filesystem::path v174;
  std::string __str;
  std::string v176;
  std::string v177;
  std::fstream buf;
  std::ios_base v179;
  uint64_t v180;
  int v181;
  std::string v182;
  void *v183;
  char v184;
  uint64_t v185;
  std::string __p[3];
  void *v187;
  char v188;
  _QWORD v189[23];

  v189[20] = *MEMORY[0x1E0C80C00];
  v165 = a3;
  v163 = (char *)a4;
  v172.receiver = self;
  v172.super_class = (Class)QueryRewriter;
  v167 = -[QueryRewriter init](&v172, sel_init);
  v164 = a5;
  v167->_predictorType = a5;
  QRLoggerForCategory(0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__sb_.__extbuf_) = 136315394;
    *(char **)((char *)&buf.__sb_.__extbuf_ + 4) = "-[QueryRewriter initWithLocale:filesPath:predictorType:status:]";
    WORD2(buf.__sb_.__extbufnext_) = 1024;
    *(_DWORD *)((char *)&buf.__sb_.__extbufnext_ + 6) = a5;
    _os_log_debug_impl(&dword_1C281A000, v10, OS_LOG_TYPE_DEBUG, "%s Marrs Predictor Initializing: Setting up type %d predictor", (uint8_t *)&buf, 0x12u);
  }

  QRLoggerForCategory(0);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    LODWORD(buf.__sb_.__extbuf_) = 136315650;
    *(char **)((char *)&buf.__sb_.__extbuf_ + 4) = "-[QueryRewriter initWithLocale:filesPath:predictorType:status:]";
    WORD2(buf.__sb_.__extbufnext_) = 2112;
    *(const char **)((char *)&buf.__sb_.__extbufnext_ + 6) = v163;
    HIWORD(buf.__sb_.__extbufend_) = 2112;
    *(_QWORD *)buf.__sb_.__extbuf_min_ = v165;
    _os_log_debug_impl(&dword_1C281A000, v11, OS_LOG_TYPE_DEBUG, "%s Path: %@, locale: %@", (uint8_t *)&buf, 0x20u);
  }

  switch(a5)
  {
    case 0:
      +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v163);
      +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v165);
      v12 = operator new();
      *(_OWORD *)(v12 + 24) = 0u;
      *(_OWORD *)(v12 + 8) = 0u;
      *(_DWORD *)(v12 + 40) = 1065353216;
      *(_OWORD *)(v12 + 48) = 0u;
      *(_OWORD *)(v12 + 64) = 0u;
      *(_DWORD *)(v12 + 80) = 1065353216;
      *(_QWORD *)(v12 + 96) = 0;
      *(_QWORD *)(v12 + 104) = 0;
      *(_QWORD *)(v12 + 88) = 0;
      *(_OWORD *)(v12 + 120) = 0u;
      *(_OWORD *)(v12 + 136) = 0u;
      *(_DWORD *)(v12 + 152) = 1065353216;
      *(_QWORD *)(v12 + 168) = 0;
      *(_QWORD *)(v12 + 160) = v12 + 168;
      v161 = (std::string *)(v12 + 160);
      *(_QWORD *)(v12 + 176) = 0;
      *(_QWORD *)(v12 + 184) = 0;
      v160 = (std::string *)(v12 + 168);
      *(_QWORD *)(v12 + 192) = 0;
      *(_QWORD *)(v12 + 200) = 0;
      *(_QWORD *)(v12 + 208) = &unk_1E7C66FB0;
      *(_QWORD *)v12 = &off_1E7C66F80;
      *(_OWORD *)(v12 + 216) = 0u;
      v13 = (_QWORD *)(v12 + 240);
      *(_OWORD *)(v12 + 232) = 0u;
      *(_OWORD *)(v12 + 248) = 0u;
      *(_DWORD *)(v12 + 272) = 1065353216;
      *(_DWORD *)(v12 + 280) = 1058642330;
      *(_QWORD *)(v12 + 264) = 0;
      std::string::basic_string[abi:ne180100]<0>((_QWORD *)(v12 + 288), "");
      v157 = (std::string *)(v12 + 312);
      *(_QWORD *)(v12 + 312) = 0;
      *(_QWORD *)(v12 + 320) = 0;
      *(_QWORD *)(v12 + 328) = 0;
      v14 = QRLoggerForCategory(0);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        v150 = &v176;
        if ((v176.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          v150 = (std::string *)v176.__r_.__value_.__r.__words[0];
        p_str = &__str;
        if ((__str.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          p_str = (std::string *)__str.__r_.__value_.__r.__words[0];
        LODWORD(buf.__sb_.__extbuf_) = 136315650;
        *(char **)((char *)&buf.__sb_.__extbuf_ + 4) = "CorrectionsRepetitionPredictorPlugin";
        WORD2(buf.__sb_.__extbufnext_) = 2080;
        *(const char **)((char *)&buf.__sb_.__extbufnext_ + 6) = (const char *)v150;
        HIWORD(buf.__sb_.__extbufend_) = 2080;
        *(_QWORD *)buf.__sb_.__extbuf_min_ = p_str;
        _os_log_debug_impl(&dword_1C281A000, v14, OS_LOG_TYPE_DEBUG, "%s Initializing Repetition Detection Predictor with asset path: %s locale: %s", (uint8_t *)&buf, 0x20u);
      }
      if (marrs::qr::orchestration::SignpostsUtils::createRdContext(void)::once[0] != -1)
        dispatch_once(marrs::qr::orchestration::SignpostsUtils::createRdContext(void)::once, &__block_literal_global);
      v15 = marrs::qr::orchestration::SignpostsUtils::createRdContext(void)::rdLogContext;
      spid = os_signpost_id_generate((os_log_t)marrs::qr::orchestration::SignpostsUtils::createRdContext(void)::rdLogContext);
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
      {
        LOWORD(buf.__sb_.__extbuf_) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C281A000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "AssetLoad", ", (uint8_t *)&buf, 2u);
      }
      v159 = v15;
      std::string::operator=((std::string *)(v12 + 216), &__str);
      RepetitionPredictorBase::readConfig(v12, (const void **)&v176.__r_.__value_.__l.__data_);
      buf.__sb_.__extbufnext_ = 0;
      v179.__vftable = (std::ios_base_vtbl *)&unk_1E7C67410;
      buf.__sb_.__extbuf_ = (char *)&unk_1E7C673E8;
      std::ios_base::init(&v179, buf.__sb_.__extbuf_min_);
      v181 = -1;
      v180 = 0;
      MEMORY[0x1C3BC5A30](buf.__sb_.__extbuf_min_);
      std::string::basic_string[abi:ne180100]<0>(__p, "skiplist_file");
      v16 = (std::string *)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>((uint64_t)v161, __p);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      if (v160 == v16)
      {
        exception = __cxa_allocate_exception(0x30uLL);
        std::string::basic_string[abi:ne180100]<0>(__p, "No skiplist file specified for this locale");
        std::string::basic_string[abi:ne180100]<0>(&v182, "QueryRewrite");
        ConfigLoadingError::ConfigLoadingError(exception, (uint64_t)__p, (uint64_t)&v182, "/Library/Caches/com.apple.xbs/Sources/Marrs/QueryRewrite.subproj/QueryRewrite/RepetitionDetection/src/CorrectionsRepetitionPredictorPlugin.cpp", 27);
      }
      if ((v176.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        size = HIBYTE(v176.__r_.__value_.__r.__words[2]);
      else
        size = v176.__r_.__value_.__l.__size_;
      std::string::basic_string[abi:ne180100]((uint64_t)&v182, size + 1);
      if ((v182.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        v18 = &v182;
      else
        v18 = (std::string *)v182.__r_.__value_.__r.__words[0];
      if (size)
      {
        if ((v176.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v19 = &v176;
        else
          v19 = (std::string *)v176.__r_.__value_.__r.__words[0];
        memmove(v18, v19, size);
      }
      *(_WORD *)((char *)&v18->__r_.__value_.__l.__data_ + size) = 47;
      std::string::basic_string[abi:ne180100]<0>(&v177, "skiplist_file");
      v20 = std::map<std::string,std::string>::at((uint64_t)v161, &v177);
      v21 = *(char *)(v20 + 23);
      if (v21 >= 0)
        v22 = (const std::string::value_type *)v20;
      else
        v22 = *(const std::string::value_type **)v20;
      if (v21 >= 0)
        v23 = *(unsigned __int8 *)(v20 + 23);
      else
        v23 = *(_QWORD *)(v20 + 8);
      v24 = std::string::append(&v182, v22, v23);
      v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
      __p[0].__r_.__value_.__r.__words[2] = v24->__r_.__value_.__r.__words[2];
      *(_OWORD *)&__p[0].__r_.__value_.__l.__data_ = v25;
      v24->__r_.__value_.__l.__size_ = 0;
      v24->__r_.__value_.__r.__words[2] = 0;
      v24->__r_.__value_.__r.__words[0] = 0;
      std::fstream::open(&buf, __p, v26);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v177.__r_.__value_.__l.__data_);
      if (SHIBYTE(v182.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v182.__r_.__value_.__l.__data_);
      if (!*(&buf.__sb_.__st_._mbstateL + 9))
      {
        v153 = __cxa_allocate_exception(0x30uLL);
        std::string::basic_string[abi:ne180100]<0>(__p, "Failed to load skiplist for this locale");
        std::string::basic_string[abi:ne180100]<0>(&v182, "QueryRewrite");
        ConfigLoadingError::ConfigLoadingError(v153, (uint64_t)__p, (uint64_t)&v182, "/Library/Caches/com.apple.xbs/Sources/Marrs/QueryRewrite.subproj/QueryRewrite/RepetitionDetection/src/CorrectionsRepetitionPredictorPlugin.cpp", 32);
      }
      v27 = 0;
      memset(__p, 0, 24);
      v28 = (_QWORD *)(v12 + 256);
      break;
    case 1:
      +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v163);
      +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v165);
      v99 = (_QWORD *)operator new();
      marrs::qr::orchestration::QueryRewriteOrchestrator::QueryRewriteOrchestrator((uint64_t)v99, (char *)&buf, __p);
      *v99 = &off_1E7C665E0;
      v99[41] = &unk_1E7C66610;
      value = v167->_plugin.__ptr_.__value_;
      v167->_plugin.__ptr_.__value_ = (QRPredictor *)(v99 + 41);
      if (value)
        (*(void (**)(QRPredictor *))(*(_QWORD *)value + 16))(value);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      v96 = v167;
      predictorName = v167->_predictorName;
      v98 = CFSTR("EllipsisAnaphoraPredictor");
      goto LABEL_339;
    case 2:
      +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v163);
      +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v165);
      v63 = operator new();
      *(_OWORD *)(v63 + 24) = 0u;
      *(_OWORD *)(v63 + 8) = 0u;
      *(_DWORD *)(v63 + 40) = 1065353216;
      *(_OWORD *)(v63 + 48) = 0u;
      *(_OWORD *)(v63 + 64) = 0u;
      *(_DWORD *)(v63 + 80) = 1065353216;
      *(_QWORD *)(v63 + 96) = 0;
      *(_QWORD *)(v63 + 104) = 0;
      *(_QWORD *)(v63 + 88) = 0;
      *(_OWORD *)(v63 + 120) = 0u;
      *(_OWORD *)(v63 + 136) = 0u;
      *(_DWORD *)(v63 + 152) = 1065353216;
      *(_QWORD *)(v63 + 168) = 0;
      v64 = (_QWORD *)(v63 + 168);
      *(_QWORD *)(v63 + 160) = v63 + 168;
      v65 = v63 + 160;
      *(_QWORD *)(v63 + 176) = 0;
      *(_QWORD *)(v63 + 184) = 0;
      *(_QWORD *)(v63 + 192) = 0;
      *(_QWORD *)(v63 + 200) = 0;
      *(_QWORD *)(v63 + 208) = &unk_1E7C66ED8;
      *(_QWORD *)(v63 + 216) = 0;
      *(_QWORD *)v63 = &off_1E7C66EA8;
      *(_DWORD *)(v63 + 240) = 1058642330;
      *(_QWORD *)(v63 + 224) = 0;
      *(_QWORD *)(v63 + 232) = 0;
      std::string::basic_string[abi:ne180100]<0>((_QWORD *)(v63 + 248), "");
      v166 = (void **)(v63 + 272);
      *(_QWORD *)(v63 + 272) = 0;
      *(_QWORD *)(v63 + 280) = 0;
      *(_QWORD *)(v63 + 288) = 0;
      RepetitionPredictorBase::readConfig(v63, (const void **)&v176.__r_.__value_.__l.__data_);
      RepetitionPredictorBase::loadCostMatrix(v63, (const void **)&v176.__r_.__value_.__l.__data_);
      std::string::basic_string[abi:ne180100]<0>(&buf, "asr_confidence_model_weight");
      v66 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(v63 + 160, &buf);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      if (v64 != v66)
      {
        std::string::basic_string[abi:ne180100]<0>(&buf, "asr_confidence_model_weight");
        v67 = (const std::string *)std::map<std::string,std::string>::at(v65, &buf);
        *(float *)(v63 + 240) = std::stof(v67, 0);
        if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
          operator delete(buf.__sb_.__extbuf_);
      }
      std::string::basic_string[abi:ne180100]<0>(&buf, "operating_point");
      v68 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(v65, &buf);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      if (v64 != v68)
      {
        std::string::basic_string[abi:ne180100]<0>(&buf, "operating_point");
        v69 = (const std::string *)std::map<std::string,std::string>::at(v65, &buf);
        std::string::operator=((std::string *)(v63 + 248), v69);
        if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
          operator delete(buf.__sb_.__extbuf_);
      }
      if (v64 != std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(v65, LOGISTIC_PARAMS))
      {
        v70 = (const std::string *)std::map<std::string,std::string>::at(v65, LOGISTIC_PARAMS);
        v158 = (_QWORD *)(v63 + 168);
        v71 = MEMORY[0x1E0DE4FD0];
        v72 = MEMORY[0x1E0DE4FD0] + 104;
        *(&buf.__sb_.__st_._mbstateL + 7) = MEMORY[0x1E0DE4FD0] + 104;
        v73 = (const char *)(MEMORY[0x1E0DE4FD0] + 64);
        v74 = MEMORY[0x1E0DE4F50];
        v75 = *(char **)(MEMORY[0x1E0DE4F50] + 16);
        v76 = *(char **)(MEMORY[0x1E0DE4F50] + 24);
        buf.__sb_.__extbufend_ = (const char *)(MEMORY[0x1E0DE4FD0] + 64);
        buf.__sb_.__extbuf_ = v75;
        *(char **)((char *)&buf.__sb_.__extbuf_ + *((_QWORD *)v75 - 3)) = v76;
        buf.__sb_.__extbufnext_ = 0;
        v77 = (std::ios_base *)((char *)&buf + *((_QWORD *)buf.__sb_.__extbuf_ - 3));
        std::ios_base::init(v77, buf.__sb_.__extbuf_min_);
        v77[1].__vftable = 0;
        v77[1].__fmtflags_ = -1;
        v78 = *(const char **)(v74 + 40);
        buf.__sb_.__extbufend_ = *(const char **)(v74 + 32);
        *(const char **)((char *)&buf.__sb_.__extbufend_ + *((_QWORD *)buf.__sb_.__extbufend_ - 3)) = v78;
        buf.__sb_.__extbuf_ = *(char **)(v74 + 8);
        *(char **)((char *)&buf.__sb_.__extbuf_ + *((_QWORD *)buf.__sb_.__extbuf_ - 3)) = *(char **)(v74 + 48);
        *(&buf.__sb_.__st_._mbstateL + 7) = v72;
        buf.__sb_.__extbuf_ = (char *)(v71 + 24);
        buf.__sb_.__extbufend_ = v73;
        std::stringbuf::basic_stringbuf[abi:ne180100]((uint64_t)buf.__sb_.__extbuf_min_, v70, 24);
        memset(&v177, 0, sizeof(v177));
        v79 = *MEMORY[0x1E0DE4F58];
        v80 = *(_QWORD *)(MEMORY[0x1E0DE4F58] + 24);
        v81 = MEMORY[0x1E0DE4FB8] + 16;
        while (1)
        {
          std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&buf, (uint64_t)&v177, 0x2Cu);
          if ((buf.__sb_.__extbuf_min_[*((_QWORD *)buf.__sb_.__extbuf_ - 3) + 8] & 5) != 0)
            break;
          std::istringstream::basic_istringstream[abi:ne180100](__p, &v177);
          LODWORD(v182.__r_.__value_.__l.__data_) = 0;
          MEMORY[0x1C3BC5A60](__p, &v182);
          v83 = *(char **)(v63 + 280);
          v82 = *(_QWORD *)(v63 + 288);
          if ((unint64_t)v83 >= v82)
          {
            v85 = (char *)*v166;
            v86 = (v83 - (_BYTE *)*v166) >> 2;
            v87 = v86 + 1;
            if ((unint64_t)(v86 + 1) >> 62)
              std::vector<float>::__throw_length_error[abi:ne180100]();
            v88 = v82 - (_QWORD)v85;
            if (v88 >> 1 > v87)
              v87 = v88 >> 1;
            v89 = (unint64_t)v88 >= 0x7FFFFFFFFFFFFFFCLL;
            v90 = 0x3FFFFFFFFFFFFFFFLL;
            if (!v89)
              v90 = v87;
            if (v90)
            {
              v90 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>(v90);
              v85 = *(char **)(v63 + 272);
              v83 = *(char **)(v63 + 280);
            }
            else
            {
              v91 = 0;
            }
            v92 = (_DWORD *)(v90 + 4 * v86);
            *v92 = v182.__r_.__value_.__l.__data_;
            v84 = v92 + 1;
            while (v83 != v85)
            {
              v93 = *((_DWORD *)v83 - 1);
              v83 -= 4;
              *--v92 = v93;
            }
            *(_QWORD *)(v63 + 272) = v92;
            *(_QWORD *)(v63 + 280) = v84;
            *(_QWORD *)(v63 + 288) = v90 + 4 * v91;
            if (v85)
              operator delete(v85);
          }
          else
          {
            *(_DWORD *)v83 = v182.__r_.__value_.__l.__data_;
            v84 = v83 + 4;
          }
          *(_QWORD *)(v63 + 280) = v84;
          __p[0].__r_.__value_.__r.__words[0] = v79;
          *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + *(_QWORD *)(v79 - 24)) = v80;
          __p[0].__r_.__value_.__r.__words[2] = v81;
          if (v188 < 0)
            operator delete(v187);
          std::streambuf::~streambuf();
          std::istream::~istream();
          MEMORY[0x1C3BC5BC8](v189);
        }
        if (v158 != std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(v65, SYS_COMB_WEIGHT_1)&& v158 != std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>(v65, SYS_COMB_WEIGHT_2))
        {
          v121 = (const std::string *)std::map<std::string,std::string>::at(v65, SYS_COMB_WEIGHT_1);
          std::istringstream::basic_istringstream[abi:ne180100](__p, v121);
          MEMORY[0x1C3BC5A60](__p, v63 + 296);
          v122 = (const std::string *)std::map<std::string,std::string>::at(v65, SYS_COMB_WEIGHT_2);
          std::istringstream::basic_istringstream[abi:ne180100](&v182, v122);
          MEMORY[0x1C3BC5A60](&v182, v63 + 300);
          v182.__r_.__value_.__r.__words[0] = v79;
          *(std::string::size_type *)((char *)v182.__r_.__value_.__r.__words + *(_QWORD *)(v79 - 24)) = v80;
          v123 = MEMORY[0x1E0DE4FB8] + 16;
          v182.__r_.__value_.__r.__words[2] = MEMORY[0x1E0DE4FB8] + 16;
          if (v184 < 0)
            operator delete(v183);
          std::streambuf::~streambuf();
          std::istream::~istream();
          MEMORY[0x1C3BC5BC8](&v185);
          __p[0].__r_.__value_.__r.__words[0] = v79;
          *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + *(_QWORD *)(v79 - 24)) = v80;
          __p[0].__r_.__value_.__r.__words[2] = v123;
          if (v188 < 0)
            operator delete(v187);
          std::streambuf::~streambuf();
          std::istream::~istream();
          MEMORY[0x1C3BC5BC8](v189);
        }
        if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v177.__r_.__value_.__l.__data_);
        buf.__sb_.__extbuf_ = (char *)*MEMORY[0x1E0DE4F50];
        v124 = *(const char **)(MEMORY[0x1E0DE4F50] + 72);
        *(char **)((char *)&buf.__sb_.__extbuf_ + *((_QWORD *)buf.__sb_.__extbuf_ - 3)) = *(char **)(MEMORY[0x1E0DE4F50] + 64);
        buf.__sb_.__extbufend_ = v124;
        *(_QWORD *)buf.__sb_.__extbuf_min_ = MEMORY[0x1E0DE4FB8] + 16;
        if (buf.__sb_.__st_.__mbstate8[39] < 0)
          operator delete(*((void **)&buf.__sb_.__st_._mbstateL + 2));
        std::streambuf::~streambuf();
        std::iostream::~basic_iostream();
        MEMORY[0x1C3BC5BC8](&buf.__sb_.__st_._mbstateL + 7);
      }
      std::string::operator=((std::string *)(v63 + 216), &__str);
      v125 = v167->_plugin.__ptr_.__value_;
      v167->_plugin.__ptr_.__value_ = (QRPredictor *)(v63 + 208);
      if (v125)
        (*(void (**)(QRPredictor *))(*(_QWORD *)v125 + 16))(v125);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      if (SHIBYTE(v176.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v176.__r_.__value_.__l.__data_);
      v96 = v167;
      predictorName = v167->_predictorName;
      v98 = CFSTR("CbR");
      goto LABEL_339;
    case 3:
      +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v163);
      +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v165);
      v94 = (_QWORD *)operator new();
      marrs::qr::orchestration::QueryRewriteOrchestrator::QueryRewriteOrchestrator((uint64_t)v94, (char *)&buf, __p);
      *v94 = &off_1E7C66640;
      v94[41] = &unk_1E7C66670;
      v95 = v167->_plugin.__ptr_.__value_;
      v167->_plugin.__ptr_.__value_ = (QRPredictor *)(v94 + 41);
      if (v95)
        (*(void (**)(QRPredictor *))(*(_QWORD *)v95 + 16))(v95);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      v96 = v167;
      predictorName = v167->_predictorName;
      v98 = CFSTR("MarrsBasedCbR");
      goto LABEL_339;
    case 4:
      +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v163);
      +[MarrsSiriNLUTypesConverter NSString2StdString:](MarrsSiriNLUTypesConverter, "NSString2StdString:", v165);
      v62 = operator new();
      *(_QWORD *)v62 = &off_1E7C674F8;
      marrs::qr::processing::Vocab::Vocab((marrs::qr::processing::Vocab *)(v62 + 8), 0, 0);
      marrs::qr::processing::Vocab::Vocab((marrs::qr::processing::Vocab *)(v62 + 80), 0, 0);
      *(_DWORD *)(v62 + 152) = 0x1000000;
      *(_QWORD *)(v62 + 156) = 0x2200000002;
      *(_OWORD *)(v62 + 168) = xmmword_1C289DFA0;
      *(_OWORD *)(v62 + 184) = xmmword_1C289DFB0;
      *(_DWORD *)(v62 + 200) = 32;
      *(_DWORD *)(v62 + 208) = 32;
      *(_QWORD *)(v62 + 216) = 26;
      *(_QWORD *)(v62 + 224) = 0;
      *(_BYTE *)(v62 + 232) = 0;
      *(_QWORD *)(v62 + 236) = 0x447A000000000000;
      if (SHIBYTE(v169) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)(v62 + 248), (const std::string::value_type *)v168[0], (std::string::size_type)v168[1]);
      }
      else
      {
        *(_OWORD *)(v62 + 248) = *(_OWORD *)v168;
        *(_QWORD *)(v62 + 264) = v169;
      }
      *(_QWORD *)(v62 + 272) = 0;
      v127 = QRLoggerForCategory(2);
      v128 = os_signpost_id_generate(v127);
      if (v128 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
      {
        LOWORD(buf.__sb_.__extbuf_) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C281A000, v127, OS_SIGNPOST_INTERVAL_BEGIN, v128, "AssetLoad", "CCQR Asset loading", (uint8_t *)&buf, 2u);
      }
      std::__fs::filesystem::path::path[abi:ne180100]<std::string,void>(__p, (char *)&v170);
      std::__fs::filesystem::path::path[abi:ne180100]<char [12],void>((std::string *)&buf, "config.json");
      std::__fs::filesystem::operator/[abi:ne180100](&v182, (uint64_t)__p, (std::__fs::filesystem::path *)&buf);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      if (SHIBYTE(v182.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v177, v182.__r_.__value_.__l.__data_, v182.__r_.__value_.__l.__size_);
      else
        v177 = v182;
      TypedJson<CcqrConfig>::fromJson((uint64_t)&buf, (uint64_t *)&v177);
      v129 = *(_OWORD *)&buf.__sb_.__ibs_;
      *(_OWORD *)(v62 + 184) = *(_OWORD *)&buf.__sb_.__ebs_;
      *(_OWORD *)(v62 + 200) = v129;
      *(_OWORD *)(v62 + 216) = *(_OWORD *)&buf.__sb_.__cv_;
      *(_OWORD *)(v62 + 228) = *(_OWORD *)((char *)&buf.__sb_.__st_._mbstateL + 4);
      v130 = *(_OWORD *)&buf.__sb_.__extbufend_;
      *(_OWORD *)(v62 + 152) = *(_OWORD *)&buf.__sb_.__extbuf_;
      *(_OWORD *)(v62 + 168) = v130;
      if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v177.__r_.__value_.__l.__data_);
      v131 = QRLoggerForCategory(2);
      if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.__sb_.__extbuf_) = 136315138;
        *(char **)((char *)&buf.__sb_.__extbuf_ + 4) = "CcqrOrchestrator";
        _os_log_debug_impl(&dword_1C281A000, v131, OS_LOG_TYPE_DEBUG, "%s Loaded config json", (uint8_t *)&buf, 0xCu);
      }
      std::__fs::filesystem::path::path[abi:ne180100]<char [10],void>((std::string *)&buf, "vocab.txt");
      std::__fs::filesystem::operator/[abi:ne180100](&v177, (uint64_t)__p, (std::__fs::filesystem::path *)&buf);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v176, v177.__r_.__value_.__l.__data_, v177.__r_.__value_.__l.__size_);
      else
        v176 = v177;
      VocabLoader::loadFrom((marrs::qr::processing::Vocab *)&buf, (uint64_t)&v176, 0x8000u);
      std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__move_assign(v62 + 8, (uint64_t *)&buf);
      std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(v62 + 48));
      *(_OWORD *)(v62 + 48) = *(_OWORD *)&buf.__sb_.__intbuf_;
      *(_QWORD *)(v62 + 64) = buf.__sb_.__file_;
      memset(&buf.__sb_.__intbuf_, 0, 24);
      *(_BYTE *)(v62 + 72) = buf.__sb_.__cv_;
      __str.__r_.__value_.__r.__words[0] = (std::string::size_type)&buf.__sb_.__intbuf_;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__str);
      std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__deallocate_node((void **)buf.__sb_.__extbufend_);
      extbuf = buf.__sb_.__extbuf_;
      buf.__sb_.__extbuf_ = 0;
      if (extbuf)
        operator delete(extbuf);
      if (SHIBYTE(v176.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v176.__r_.__value_.__l.__data_);
      std::__fs::filesystem::path::path[abi:ne180100]<char [13],void>((std::string *)&buf, "char_voc.txt");
      std::__fs::filesystem::operator/[abi:ne180100](&v176, (uint64_t)__p, (std::__fs::filesystem::path *)&buf);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      if (SHIBYTE(v176.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&__str, v176.__r_.__value_.__l.__data_, v176.__r_.__value_.__l.__size_);
      else
        __str = v176;
      VocabLoader::loadFrom((marrs::qr::processing::Vocab *)&buf, (uint64_t)&__str, 0x40u);
      std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__move_assign(v62 + 80, (uint64_t *)&buf);
      std::vector<std::string>::__vdeallocate((std::vector<std::string> *)(v62 + 120));
      *(_OWORD *)(v62 + 120) = *(_OWORD *)&buf.__sb_.__intbuf_;
      *(_QWORD *)(v62 + 136) = buf.__sb_.__file_;
      memset(&buf.__sb_.__intbuf_, 0, 24);
      *(_BYTE *)(v62 + 144) = buf.__sb_.__cv_;
      v174.__pn_.__r_.__value_.__r.__words[0] = (std::string::size_type)&buf.__sb_.__intbuf_;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v174);
      std::__hash_table<std::__hash_value_type<std::string,unsigned long>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,unsigned long>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,unsigned long>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,unsigned long>>>::__deallocate_node((void **)buf.__sb_.__extbufend_);
      v133 = buf.__sb_.__extbuf_;
      buf.__sb_.__extbuf_ = 0;
      if (v133)
        operator delete(v133);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      v134 = QRLoggerForCategory(2);
      if (os_log_type_enabled(v134, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.__sb_.__extbuf_) = 136315138;
        *(char **)((char *)&buf.__sb_.__extbuf_ + 4) = "CcqrOrchestrator";
        _os_log_debug_impl(&dword_1C281A000, v134, OS_LOG_TYPE_DEBUG, "%s Loaded vocab txt", (uint8_t *)&buf, 0xCu);
      }
      memset(&v174, 0, sizeof(v174));
      std::string::append[abi:ne180100]<char const*,0>(&v174.__pn_, "joint_ccqr.mlmodelc", ");
      std::__fs::filesystem::operator/[abi:ne180100]((std::string *)&buf, (uint64_t)__p, &v174);
      std::__fs::filesystem::path::path[abi:ne180100]<char [19],void>(&v173.__pn_, "model.espresso.net");
      std::__fs::filesystem::operator/[abi:ne180100](&__str, (uint64_t)&buf, &v173);
      if (SHIBYTE(v173.__pn_.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v173.__pn_.__r_.__value_.__l.__data_);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      if (SHIBYTE(v174.__pn_.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v174.__pn_.__r_.__value_.__l.__data_);
      v135 = (marrs::inference_engine::EspressoModule *)operator new();
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&buf, __str.__r_.__value_.__l.__data_, __str.__r_.__value_.__l.__size_);
      }
      else
      {
        *(_OWORD *)&buf.__sb_.__extbuf_ = *(_OWORD *)&__str.__r_.__value_.__l.__data_;
        buf.__sb_.__extbufend_ = (const char *)__str.__r_.__value_.__r.__words[2];
      }
      marrs::inference_engine::EspressoModule::EspressoModule((uint64_t)v135, (uint64_t)&buf, *(_DWORD *)(v62 + 208));
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      std::unique_ptr<JointCCQRModule>::reset[abi:ne180100]((marrs::inference_engine::EspressoModule **)(v62 + 272), v135);
      v136 = QRLoggerForCategory(2);
      if (os_log_type_enabled(v136, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(buf.__sb_.__extbuf_) = 136315138;
        *(char **)((char *)&buf.__sb_.__extbuf_ + 4) = "CcqrOrchestrator";
        _os_log_debug_impl(&dword_1C281A000, v136, OS_LOG_TYPE_DEBUG, "%s Loaded ccqr espresso", (uint8_t *)&buf, 0xCu);
      }
      if (v128 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v127))
      {
        LOWORD(buf.__sb_.__extbuf_) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C281A000, v127, OS_SIGNPOST_INTERVAL_END, v128, "AssetLoad", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
      }
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      if (SHIBYTE(v176.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v176.__r_.__value_.__l.__data_);
      if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v177.__r_.__value_.__l.__data_);
      if (SHIBYTE(v182.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v182.__r_.__value_.__l.__data_);
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      v137 = v167->_plugin.__ptr_.__value_;
      v167->_plugin.__ptr_.__value_ = (QRPredictor *)v62;
      if (v137)
        (*(void (**)(QRPredictor *))(*(_QWORD *)v137 + 16))(v137);
      if (SHIBYTE(v169) < 0)
        operator delete(v168[0]);
      if (v171 < 0)
        operator delete(v170);
      v96 = v167;
      predictorName = v167->_predictorName;
      v98 = CFSTR("JointPredictor");
LABEL_339:
      v96->_predictorName = &v98->isa;

      goto LABEL_340;
    default:
LABEL_340:
      -[QueryRewriter setLocale:](v167, "setLocale:", v165);
      QRLoggerForCategory(0);
      v147 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v147, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(__p[0].__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)"-[QueryRewriter initWithLocale:filesPath:predictorType:status:]";
        WORD2(__p[0].__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&__p[0].__r_.__value_.__r.__words[1] + 6) = v164;
        _os_log_debug_impl(&dword_1C281A000, v147, OS_LOG_TYPE_DEBUG, "%s Marrs Predictor Initializing: %d predictor setup complete", (uint8_t *)__p, 0x12u);
      }

      +[PredictorUtils reportInitStatusWithPredictorName:domain:code:locale:](PredictorUtils, "reportInitStatusWithPredictorName:domain:code:locale:", v167->_predictorName, CFSTR("com.apple.siri.marrs.QueryRewrite"), 0, v165);
      if (a6)
      {
        +[PredictorUtils getInitStatusWithPredictorName:domain:code:](PredictorUtils, "getInitStatusWithPredictorName:domain:code:", v167->_predictorName, CFSTR("com.apple.siri.marrs.QueryRewrite"), 0);
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      v148 = v167;

      return v148;
  }
  while (1)
  {
    std::ios_base::getloc((const std::ios_base *)((char *)&buf + *((_QWORD *)buf.__sb_.__extbuf_ - 3)));
    v29 = std::locale::use_facet((const std::locale *)&v182, MEMORY[0x1E0DE4A90]);
    v30 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v29->__vftable[2].~facet_0)(v29, 10);
    std::locale::~locale((std::locale *)&v182);
    std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&buf, (uint64_t)__p, v30);
    if ((buf.__sb_.__extbuf_min_[*((_QWORD *)buf.__sb_.__extbuf_ - 3) + 8] & 5) != 0)
    {
      v101 = QRLoggerForCategory(0);
      if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG))
      {
        LODWORD(v182.__r_.__value_.__l.__data_) = 136315394;
        *(std::string::size_type *)((char *)v182.__r_.__value_.__r.__words + 4) = (std::string::size_type)"loadSkiplist";
        WORD2(v182.__r_.__value_.__r.__words[1]) = 1024;
        *(_DWORD *)((char *)&v182.__r_.__value_.__r.__words[1] + 6) = v27;
        _os_log_debug_impl(&dword_1C281A000, v101, OS_LOG_TYPE_DEBUG, "%s Size of skiplist: %d", (uint8_t *)&v182, 0x12u);
      }
      if (!std::filebuf::close())
        std::ios_base::clear((std::ios_base *)((char *)&buf + *((_QWORD *)buf.__sb_.__extbuf_ - 3)), *(_DWORD *)&buf.__sb_.__extbuf_min_[*((_QWORD *)buf.__sb_.__extbuf_ - 3) + 8] | 4);
      v102 = v15;
      if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p[0].__r_.__value_.__l.__data_);
      MEMORY[0x1C3BC5A3C](buf.__sb_.__extbuf_min_);
      std::iostream::~basic_iostream();
      MEMORY[0x1C3BC5BC8](&v179);
      std::string::basic_string[abi:ne180100]<0>(&buf, "trigger_phrases");
      v103 = (std::string *)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>((uint64_t)v161, &buf);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      if (v160 == v103)
      {
        v138 = QRLoggerForCategory(0);
        if (os_log_type_enabled(v138, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf.__sb_.__extbuf_) = 136315138;
          *(char **)((char *)&buf.__sb_.__extbuf_ + 4) = "loadTriggerPhrases";
          _os_log_error_impl(&dword_1C281A000, v138, OS_LOG_TYPE_ERROR, "%s [ERR]: No triggers file specified for this locale", (uint8_t *)&buf, 0xCu);
        }
      }
      else
      {
        buf.__sb_.__extbufnext_ = 0;
        v179.__vftable = (std::ios_base_vtbl *)&unk_1E7C67410;
        buf.__sb_.__extbuf_ = (char *)&unk_1E7C673E8;
        std::ios_base::init(&v179, buf.__sb_.__extbuf_min_);
        v181 = -1;
        v180 = 0;
        MEMORY[0x1C3BC5A30](buf.__sb_.__extbuf_min_);
        if ((v176.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v104 = HIBYTE(v176.__r_.__value_.__r.__words[2]);
        else
          v104 = v176.__r_.__value_.__l.__size_;
        std::string::basic_string[abi:ne180100]((uint64_t)&v182, v104 + 1);
        if ((v182.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
          v105 = &v182;
        else
          v105 = (std::string *)v182.__r_.__value_.__r.__words[0];
        if (v104)
        {
          if ((v176.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
            v106 = &v176;
          else
            v106 = (std::string *)v176.__r_.__value_.__r.__words[0];
          memmove(v105, v106, v104);
        }
        *(_WORD *)((char *)&v105->__r_.__value_.__l.__data_ + v104) = 47;
        std::string::basic_string[abi:ne180100]<0>(&v177, "trigger_phrases");
        v107 = std::map<std::string,std::string>::at((uint64_t)v161, &v177);
        v108 = *(char *)(v107 + 23);
        if (v108 >= 0)
          v109 = (const std::string::value_type *)v107;
        else
          v109 = *(const std::string::value_type **)v107;
        if (v108 >= 0)
          v110 = *(unsigned __int8 *)(v107 + 23);
        else
          v110 = *(_QWORD *)(v107 + 8);
        v111 = std::string::append(&v182, v109, v110);
        v112 = *(_OWORD *)&v111->__r_.__value_.__l.__data_;
        __p[0].__r_.__value_.__r.__words[2] = v111->__r_.__value_.__r.__words[2];
        *(_OWORD *)&__p[0].__r_.__value_.__l.__data_ = v112;
        v111->__r_.__value_.__l.__size_ = 0;
        v111->__r_.__value_.__r.__words[2] = 0;
        v111->__r_.__value_.__r.__words[0] = 0;
        std::fstream::open(&buf, __p, v113);
        if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
          operator delete(__p[0].__r_.__value_.__l.__data_);
        if (SHIBYTE(v177.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v177.__r_.__value_.__l.__data_);
        if (SHIBYTE(v182.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v182.__r_.__value_.__l.__data_);
        if (*(&buf.__sb_.__st_._mbstateL + 9))
        {
          v114 = 0;
          memset(__p, 0, 24);
          v115 = (std::locale::id *)MEMORY[0x1E0DE4A90];
          while (1)
          {
            std::ios_base::getloc((const std::ios_base *)((char *)&buf + *((_QWORD *)buf.__sb_.__extbuf_ - 3)));
            v116 = std::locale::use_facet((const std::locale *)&v182, v115);
            v117 = ((uint64_t (*)(const std::locale::facet *, uint64_t))v116->__vftable[2].~facet_0)(v116, 10);
            std::locale::~locale((std::locale *)&v182);
            std::getline[abi:ne180100]<char,std::char_traits<char>,std::allocator<char>>(&buf, (uint64_t)__p, v117);
            if ((buf.__sb_.__extbuf_min_[*((_QWORD *)buf.__sb_.__extbuf_ - 3) + 8] & 5) != 0)
              break;
            v118 = *(_QWORD *)(v12 + 192);
            if (v118 >= *(_QWORD *)(v12 + 200))
            {
              v120 = std::vector<std::string>::__push_back_slow_path<std::string const&>((std::vector<std::string> *)(v12 + 184), (__int128 *)__p);
            }
            else
            {
              if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
              {
                std::string::__init_copy_ctor_external(*(std::string **)(v12 + 192), __p[0].__r_.__value_.__l.__data_, __p[0].__r_.__value_.__l.__size_);
              }
              else
              {
                v119 = *(_OWORD *)&__p[0].__r_.__value_.__l.__data_;
                *(_QWORD *)(v118 + 16) = *((_QWORD *)&__p[0].__r_.__value_.__l + 2);
                *(_OWORD *)v118 = v119;
              }
              v120 = (std::vector<std::string>::pointer)(v118 + 24);
              *(_QWORD *)(v12 + 192) = v118 + 24;
            }
            *(_QWORD *)(v12 + 192) = v120;
            ++v114;
          }
          v126 = QRLoggerForCategory(0);
          v102 = v159;
          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEBUG))
          {
            LODWORD(v182.__r_.__value_.__l.__data_) = 136315394;
            *(std::string::size_type *)((char *)v182.__r_.__value_.__r.__words + 4) = (std::string::size_type)"loadTriggerPhrases";
            WORD2(v182.__r_.__value_.__r.__words[1]) = 1024;
            *(_DWORD *)((char *)&v182.__r_.__value_.__r.__words[1] + 6) = v114;
            _os_log_debug_impl(&dword_1C281A000, v126, OS_LOG_TYPE_DEBUG, "%s Size of trigger phrase: %d", (uint8_t *)&v182, 0x12u);
          }
          if (!std::filebuf::close())
            std::ios_base::clear((std::ios_base *)((char *)&buf + *((_QWORD *)buf.__sb_.__extbuf_ - 3)), *(_DWORD *)&buf.__sb_.__extbuf_min_[*((_QWORD *)buf.__sb_.__extbuf_ - 3) + 8] | 4);
          if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p[0].__r_.__value_.__l.__data_);
        }
        else
        {
          v139 = QRLoggerForCategory(0);
          if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
          {
            LODWORD(__p[0].__r_.__value_.__l.__data_) = 136315138;
            *(std::string::size_type *)((char *)__p[0].__r_.__value_.__r.__words + 4) = (std::string::size_type)"loadTriggerPhrases";
            _os_log_error_impl(&dword_1C281A000, v139, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to load skiplist for this locale", (uint8_t *)__p, 0xCu);
          }
          if (!std::filebuf::close())
            std::ios_base::clear((std::ios_base *)((char *)&buf + *((_QWORD *)buf.__sb_.__extbuf_ - 3)), *(_DWORD *)&buf.__sb_.__extbuf_min_[*((_QWORD *)buf.__sb_.__extbuf_ - 3) + 8] | 4);
        }
        MEMORY[0x1C3BC5A3C](buf.__sb_.__extbuf_min_);
        std::iostream::~basic_iostream();
        MEMORY[0x1C3BC5BC8](&v179);
      }
      RepetitionPredictorBase::loadCostMatrix(v12, (const void **)&v176.__r_.__value_.__l.__data_);
      std::string::basic_string[abi:ne180100]<0>(&buf, "asr_confidence_model_weight");
      v140 = (std::string *)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>((uint64_t)v161, &buf);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      if (v160 == v140)
      {
        v154 = __cxa_allocate_exception(0x30uLL);
        std::string::basic_string[abi:ne180100]<0>(&buf, "Failed to load asr_confidence_model_weight");
        std::string::basic_string[abi:ne180100]<0>(__p, "QueryRewrite");
        ConfigLoadingError::ConfigLoadingError(v154, (uint64_t)&buf, (uint64_t)__p, "/Library/Caches/com.apple.xbs/Sources/Marrs/QueryRewrite.subproj/QueryRewrite/RepetitionDetection/src/CorrectionsRepetitionPredictorPlugin.cpp", 49);
      }
      std::string::basic_string[abi:ne180100]<0>(&buf, "asr_confidence_model_weight");
      v141 = (const std::string *)std::map<std::string,std::string>::at((uint64_t)v161, &buf);
      *(float *)(v12 + 280) = std::stof(v141, 0);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      std::string::basic_string[abi:ne180100]<0>(&buf, "operating_point");
      v142 = (std::string *)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>((uint64_t)v161, &buf);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      if (v160 == v142)
      {
        v155 = __cxa_allocate_exception(0x30uLL);
        std::string::basic_string[abi:ne180100]<0>(&buf, "Failed to load operating point");
        std::string::basic_string[abi:ne180100]<0>(__p, "QueryRewrite");
        ConfigLoadingError::ConfigLoadingError(v155, (uint64_t)&buf, (uint64_t)__p, "/Library/Caches/com.apple.xbs/Sources/Marrs/QueryRewrite.subproj/QueryRewrite/RepetitionDetection/src/CorrectionsRepetitionPredictorPlugin.cpp", 54);
      }
      std::string::basic_string[abi:ne180100]<0>(&buf, "operating_point");
      v143 = (const std::string *)std::map<std::string,std::string>::at((uint64_t)v161, &buf);
      std::string::operator=((std::string *)(v12 + 288), v143);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      std::string::basic_string[abi:ne180100]<0>(&buf, "asset_version");
      v144 = (std::string *)std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::find<std::string>((uint64_t)v161, &buf);
      if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
        operator delete(buf.__sb_.__extbuf_);
      if (v160 == v144)
      {
        MEMORY[0x1C3BC59A0](v157, "0.0");
      }
      else
      {
        std::string::basic_string[abi:ne180100]<0>(&buf, "asset_version");
        v145 = (const std::string *)std::map<std::string,std::string>::at((uint64_t)v161, &buf);
        std::string::operator=(v157, v145);
        if (SHIBYTE(buf.__sb_.__extbufend_) < 0)
          operator delete(buf.__sb_.__extbuf_);
      }
      if (spid - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v102))
      {
        LOWORD(buf.__sb_.__extbuf_) = 0;
        _os_signpost_emit_with_name_impl(&dword_1C281A000, v102, OS_SIGNPOST_INTERVAL_END, spid, "AssetLoad", " enableTelemetry=YES ", (uint8_t *)&buf, 2u);
      }
      v146 = v167->_plugin.__ptr_.__value_;
      v167->_plugin.__ptr_.__value_ = (QRPredictor *)(v12 + 208);
      if (v146)
        (*(void (**)(QRPredictor *))(*(_QWORD *)v146 + 16))(v146);
      if (SHIBYTE(__str.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__str.__r_.__value_.__l.__data_);
      if (SHIBYTE(v176.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v176.__r_.__value_.__l.__data_);
      v96 = v167;
      predictorName = v167->_predictorName;
      v98 = CFSTR("RepetitionDetector");
      goto LABEL_339;
    }
    v31 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)__p);
    v32 = v31;
    v33 = *(_QWORD *)(v12 + 248);
    if (v33)
    {
      v34 = (uint8x8_t)vcnt_s8((int8x8_t)v33);
      v34.i16[0] = vaddlv_u8(v34);
      v35 = v34.u32[0];
      if (v34.u32[0] > 1uLL)
      {
        v6 = v31;
        if (v31 >= v33)
          v6 = v31 % v33;
      }
      else
      {
        v6 = (v33 - 1) & v31;
      }
      v36 = *(unsigned __int8 ***)(*v13 + 8 * v6);
      if (v36)
      {
        for (i = *v36; i; i = *(unsigned __int8 **)i)
        {
          v38 = *((_QWORD *)i + 1);
          if (v38 == v32)
          {
            if (std::equal_to<std::string>::operator()[abi:ne180100](i + 16, (unsigned __int8 *)__p))
              goto LABEL_116;
          }
          else
          {
            if (v35 > 1)
            {
              if (v38 >= v33)
                v38 %= v33;
            }
            else
            {
              v38 &= v33 - 1;
            }
            if (v38 != v6)
              break;
          }
        }
      }
    }
    v39 = operator new(0x28uLL);
    *v39 = 0;
    v39[1] = v32;
    v40 = (std::string *)(v39 + 2);
    if (SHIBYTE(__p[0].__r_.__value_.__r.__words[2]) < 0)
    {
      std::string::__init_copy_ctor_external(v40, __p[0].__r_.__value_.__l.__data_, __p[0].__r_.__value_.__l.__size_);
    }
    else
    {
      *(_OWORD *)&v40->__r_.__value_.__l.__data_ = *(_OWORD *)&__p[0].__r_.__value_.__l.__data_;
      v39[4] = *((_QWORD *)&__p[0].__r_.__value_.__l + 2);
    }
    v41 = (float)(unint64_t)(*(_QWORD *)(v12 + 264) + 1);
    v42 = *(float *)(v12 + 272);
    if (!v33 || (float)(v42 * (float)v33) < v41)
      break;
LABEL_106:
    v58 = (_QWORD *)*v13;
    v59 = *(_QWORD **)(*v13 + 8 * v6);
    if (v59)
    {
      *v39 = *v59;
LABEL_114:
      *v59 = v39;
      goto LABEL_115;
    }
    *v39 = *v28;
    *v28 = v39;
    v58[v6] = v28;
    if (*v39)
    {
      v60 = *(_QWORD *)(*v39 + 8);
      if ((v33 & (v33 - 1)) != 0)
      {
        if (v60 >= v33)
          v60 %= v33;
      }
      else
      {
        v60 &= v33 - 1;
      }
      v59 = (_QWORD *)(*v13 + 8 * v60);
      goto LABEL_114;
    }
LABEL_115:
    ++*(_QWORD *)(v12 + 264);
LABEL_116:
    ++v27;
  }
  v43 = (v33 & (v33 - 1)) != 0;
  if (v33 < 3)
    v43 = 1;
  v44 = v43 | (2 * v33);
  v45 = vcvtps_u32_f32(v41 / v42);
  if (v44 <= v45)
    prime = (int8x8_t)v45;
  else
    prime = (int8x8_t)v44;
  if (*(_QWORD *)&prime == 1)
  {
    prime = (int8x8_t)2;
  }
  else if ((*(_QWORD *)&prime & (*(_QWORD *)&prime - 1)) != 0)
  {
    prime = (int8x8_t)std::__next_prime(*(_QWORD *)&prime);
  }
  v33 = *(_QWORD *)(v12 + 248);
  if (*(_QWORD *)&prime > v33)
    goto LABEL_72;
  if (*(_QWORD *)&prime < v33)
  {
    v53 = vcvtps_u32_f32((float)*(unint64_t *)(v12 + 264) / *(float *)(v12 + 272));
    if (v33 < 3 || (v54 = (uint8x8_t)vcnt_s8((int8x8_t)v33), v54.i16[0] = vaddlv_u8(v54), v54.u32[0] > 1uLL))
    {
      v53 = std::__next_prime(v53);
    }
    else
    {
      v55 = 1 << -(char)__clz(v53 - 1);
      if (v53 >= 2)
        v53 = v55;
    }
    if (*(_QWORD *)&prime <= v53)
      prime = (int8x8_t)v53;
    if (*(_QWORD *)&prime >= v33)
    {
      v33 = *(_QWORD *)(v12 + 248);
    }
    else
    {
      if (prime)
      {
LABEL_72:
        if (*(_QWORD *)&prime >> 61)
          std::__throw_bad_array_new_length[abi:ne180100]();
        v47 = operator new(8 * *(_QWORD *)&prime);
        v48 = (_QWORD *)*v13;
        *v13 = v47;
        if (v48)
          operator delete(v48);
        v49 = 0;
        *(int8x8_t *)(v12 + 248) = prime;
        do
          *(_QWORD *)(*v13 + 8 * v49++) = 0;
        while (*(_QWORD *)&prime != v49);
        v50 = (_QWORD *)*v28;
        if (*v28)
        {
          v51 = v50[1];
          v52 = (uint8x8_t)vcnt_s8(prime);
          v52.i16[0] = vaddlv_u8(v52);
          if (v52.u32[0] > 1uLL)
          {
            if (v51 >= *(_QWORD *)&prime)
              v51 %= *(_QWORD *)&prime;
          }
          else
          {
            v51 &= *(_QWORD *)&prime - 1;
          }
          *(_QWORD *)(*v13 + 8 * v51) = v28;
          v56 = (_QWORD *)*v50;
          if (*v50)
          {
            do
            {
              v57 = v56[1];
              if (v52.u32[0] > 1uLL)
              {
                if (v57 >= *(_QWORD *)&prime)
                  v57 %= *(_QWORD *)&prime;
              }
              else
              {
                v57 &= *(_QWORD *)&prime - 1;
              }
              if (v57 != v51)
              {
                if (!*(_QWORD *)(*v13 + 8 * v57))
                {
                  *(_QWORD *)(*v13 + 8 * v57) = v50;
                  goto LABEL_97;
                }
                *v50 = *v56;
                *v56 = **(_QWORD **)(*v13 + 8 * v57);
                **(_QWORD **)(*v13 + 8 * v57) = v56;
                v56 = v50;
              }
              v57 = v51;
LABEL_97:
              v50 = v56;
              v56 = (_QWORD *)*v56;
              v51 = v57;
            }
            while (v56);
          }
        }
        v33 = (unint64_t)prime;
        goto LABEL_101;
      }
      v61 = (_QWORD *)*v13;
      *v13 = 0;
      if (v61)
        operator delete(v61);
      v33 = 0;
      *(_QWORD *)(v12 + 248) = 0;
    }
  }
LABEL_101:
  if ((v33 & (v33 - 1)) != 0)
  {
    if (v32 >= v33)
      v6 = v32 % v33;
    else
      v6 = v32;
  }
  else
  {
    v6 = (v33 - 1) & v32;
  }
  goto LABEL_106;
}

- (id)predictWithInput:(id)a3 status:(id *)a4
{
  id v5;
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
  NSObject *v16;
  NSObject *v17;
  QRPredictor *value;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSString *predictorName;
  NSString *v25;
  void *v26;
  _QWORD v28[3];
  __int128 v29;
  __int128 v30;
  int v31;
  void **v32;
  _BYTE v33[12];
  __int16 v34;
  NSString *v35;
  _BYTE buf[22];
  __int128 v37;
  __int128 v38;
  int v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  +[MarrsSiriNLUTypesUtils emptyResponse](MarrsSiriNLUTypesUtils, "emptyResponse");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0D9FAC8];
  objc_msgSend(v5, "cdmRequestId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "extractRequestLinkData:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v5, "nluRequestId");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v9;
    objc_msgSend(v9, "trpId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "targetUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "resultCandidateId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cdmRequestId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[QRSELFLoggingUtils createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:](QRSELFLoggingUtils, "createEventMetadataWithNlId:andWithTrpId:andWithRequestId:andWithResultCandidateId:andWithRequester:", v10, v11, v12, v13, objc_msgSend(v14, "requester"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v26;
  }
  else
  {
    QRLoggerForCategory(0);
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[QueryRewriter predictWithInput:status:]";
      _os_log_error_impl(&dword_1C281A000, v16, OS_LOG_TYPE_ERROR, "%s [ERR]: Failed to generate metadata as RequestLinkData is nil", buf, 0xCu);
    }

    v15 = 0;
  }
  +[QRSELFLoggingUtils emitQueryRewriteStartedEventWithMetadata:byPredictorType:](QRSELFLoggingUtils, "emitQueryRewriteStartedEventWithMetadata:byPredictorType:", v15, self->_predictorType);
  QRLoggerForCategory(0);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    predictorName = self->_predictorName;
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[QueryRewriter predictWithInput:status:]";
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = predictorName;
    _os_log_debug_impl(&dword_1C281A000, v17, OS_LOG_TYPE_DEBUG, "%s Self logging emitted started event for predictor type %@", buf, 0x16u);
  }

  value = self->_plugin.__ptr_.__value_;
  +[MarrsSiriNLUTypesConverter toPluginRequestObj:](MarrsSiriNLUTypesConverter, "toPluginRequestObj:", v5);
  (**(void (***)(_BYTE *__return_ptr, QRPredictor *, _BYTE *))value)(buf, value, v33);
  v32 = (void **)&v33[8];
  std::vector<marrs::qr::orchestration::QRInteraction>::__destroy_vector::operator()[abi:ne180100](&v32);
  +[MarrsSiriNLUTypesConverter fromPluginResponseObj:](MarrsSiriNLUTypesConverter, "fromPluginResponseObj:", buf);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  memset(v28, 0, sizeof(v28));
  std::vector<marrs::qr::orchestration::QRHypothesis>::__init_with_size[abi:ne180100]<marrs::qr::orchestration::QRHypothesis*,marrs::qr::orchestration::QRHypothesis*>((uint64_t)v28, *(__int128 **)buf, *(__int128 **)&buf[8], 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 3));
  v29 = v37;
  v30 = v38;
  v31 = v39;
  +[QRSELFLoggingUtils emitQueryRewriteEvaluatedEventWithResponse:andNLXMetadata:byPredictorType:](QRSELFLoggingUtils, "emitQueryRewriteEvaluatedEventWithResponse:andNLXMetadata:byPredictorType:", v28, v15, self->_predictorType);
  *(_QWORD *)v33 = v28;
  std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100]((void ***)v33);
  QRLoggerForCategory(0);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    v25 = self->_predictorName;
    *(_DWORD *)v33 = 136315394;
    *(_QWORD *)&v33[4] = "-[QueryRewriter predictWithInput:status:]";
    v34 = 2112;
    v35 = v25;
    _os_log_debug_impl(&dword_1C281A000, v20, OS_LOG_TYPE_DEBUG, "%s Self logging emitted evaluated event for predictor type %@", v33, 0x16u);
  }

  if (v39)
  {
    QRLoggerForCategory(0);
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v33 = 136315138;
      *(_QWORD *)&v33[4] = "-[QueryRewriter predictWithInput:status:]";
      _os_log_debug_impl(&dword_1C281A000, v21, OS_LOG_TYPE_DEBUG, "%s Removing rewriteHypotheses as rewrite is not needed", v33, 0xCu);
    }

    objc_msgSend(v19, "rewriteHypotheses");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "removeAllObjects");

  }
  *(_QWORD *)v33 = buf;
  std::vector<marrs::qr::orchestration::QRHypothesis>::__destroy_vector::operator()[abi:ne180100]((void ***)v33);
  +[PredictorUtils reportPredictStatusWithPredictorName:domain:code:locale:](PredictorUtils, "reportPredictStatusWithPredictorName:domain:code:locale:", self->_predictorName, CFSTR("com.apple.siri.marrs.QueryRewrite"), 0, self->_locale);
  if (a4)
  {
    +[PredictorUtils getPredictStatusWithPredictorName:domain:code:](PredictorUtils, "getPredictStatusWithPredictorName:domain:code:", self->_predictorName, CFSTR("com.apple.siri.marrs.QueryRewrite"), 0);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (void).cxx_destruct
{
  QRPredictor *value;

  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_predictorName, 0);
  value = self->_plugin.__ptr_.__value_;
  self->_plugin.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(QRPredictor *))(*(_QWORD *)value + 16))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 1) = 0;
  return self;
}

@end
