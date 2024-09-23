@implementation _EARSpeechRecognizer

+ (void)initialize
{
  EARLogger *v3;

  v3 = (EARLogger *)objc_opt_class();
  if (v3 == a1)
    EARLogger::initializeLogging(v3);
}

+ (id)minimumSupportedConfigurationVersion
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d"), 14, 2);
}

+ (id)maximumSupportedConfigurationVersion
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d.%d"), 274, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3
{
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:](self, "initWithConfiguration:overrides:overrideConfigFiles:", a3, 0, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4
{
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:](self, "initWithConfiguration:overrides:overrideConfigFiles:", a3, a4, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrideConfigFiles:(id)a4
{
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:](self, "initWithConfiguration:overrides:overrideConfigFiles:", a3, 0, a4);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _EARSpeechRecognizer *v12;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything](_EARSpeechRecognitionActiveConfiguration, "activeConfigurationForEverything");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:", v8, v9, v10, 0, v11);

  return v12;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  _EARSpeechRecognizer *v15;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything](_EARSpeechRecognitionActiveConfiguration, "activeConfigurationForEverything");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:", v10, v11, v12, v13, v14);

  return v15;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7
{
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:enableSpeakerCodeTraining:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:enableSpeakerCodeTraining:", a3, a4, a5, a6, a7, 1);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 enableSpeakerCodeTraining:(BOOL)a8
{
  uint64_t v9;

  LOBYTE(v9) = a8;
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:", a3, a4, a5, a6, a7, 0, v9);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9
{
  uint64_t v10;

  LOWORD(v10) = a9;
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:", a3, a4, a5, a6, a7, a8, v10);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10
{
  uint64_t v11;

  LOWORD(v11) = __PAIR16__(a10, a9);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:", a3, a4, a5, a6, a7, a8, v11, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11
{
  uint64_t v12;

  LOWORD(v12) = __PAIR16__(a10, a9);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:", a3, a4, a5, a6, a7, a8, v12, a11, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11 modelContextDelegate:(id)a12
{
  uint64_t v13;
  uint64_t v14;

  LOBYTE(v14) = 0;
  LOWORD(v13) = __PAIR16__(a10, a9);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:", a3, a4, a5, a6, a7, a8, v13, a11, a12, v14);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 language:(id)a6 activeConfiguration:(id)a7 modelLoadingOptions:(id)a8 enableSpeakerCodeTraining:(BOOL)a9 supportEmojiRecognition:(BOOL)a10 voiceCommandActiveSet:(id)a11 modelContextDelegate:(id)a12 enableItn:(BOOL)a13
{
  id v20;
  id v21;
  dispatch_queue_t v22;
  void *v23;
  dispatch_queue_t v24;
  void *v25;
  dispatch_queue_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD *v37;
  std::__shared_weak_count *size;
  unint64_t *v39;
  unint64_t v40;
  id v41;
  id v42;
  EARLogger *v43;
  NSObject *v44;
  int v45;
  _EARSpeechModelInfo *v46;
  quasar::SystemConfig *SysConfig;
  uint64_t v48;
  void *v49;
  std::__shared_weak_count *v50;
  unint64_t *v51;
  unint64_t v52;
  _EARSpeakerCodeInfo *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  std::__shared_weak_count *v66;
  unint64_t *v67;
  unint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  std::__shared_weak_count *v72;
  unint64_t *v73;
  unint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  uint64_t v80;
  void *v81;
  std::__shared_weak_count *v82;
  unint64_t *v83;
  unint64_t v84;
  std::__shared_weak_count *v85;
  unint64_t *v86;
  unint64_t v87;
  std::__shared_weak_count *v88;
  unint64_t *v89;
  unint64_t v90;
  std::__shared_weak_count *v91;
  unint64_t *v92;
  unint64_t v93;
  std::__shared_weak_count *v94;
  unint64_t *v95;
  unint64_t v96;
  std::__shared_weak_count *v97;
  unint64_t *v98;
  unint64_t v99;
  void *v100;
  void *v101;
  std::__shared_weak_count *v102;
  unint64_t *v103;
  unint64_t v104;
  std::string::size_type v105;
  int v106;
  void *v107;
  void *v108;
  void *v109;
  quasar::SpeechRecognizer *v110;
  BOOL v111;
  NSObject *v112;
  _EARRelevantTextContext *v113;
  _EARSpeechRecognizer *v114;
  void *v116;
  int v117;
  void *v118;
  uint64_t v119;
  int v120;
  void *v121;
  uint64_t v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  int64x2_t v127;
  int v128;
  quasar *v129;
  id v130;
  id v131;
  id v132;
  id v133;
  id v134;
  id v135;
  _QWORD block[4];
  id v137;
  id v138;
  id v139;
  id v140;
  BOOL v141;
  BOOL v142;
  std::string v143;
  _QWORD *v144;
  _QWORD *v145[3];
  uint64_t v146;
  _QWORD *v147[3];
  _QWORD v148[5];
  std::string v149;
  char v150;
  std::string __p;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  _QWORD v158[4];
  id v159;
  id v160;
  id v161;
  id v162;
  id v163;
  _QWORD *v164;
  uint64_t *v165;
  uint64_t v166;
  _QWORD v167[2];
  int v168;
  _QWORD v169[5];
  _QWORD v170[6];
  _QWORD v171[3];
  objc_super v172;

  v20 = a3;
  v133 = a4;
  v134 = a5;
  v130 = a6;
  v132 = a7;
  v131 = a8;
  v129 = (quasar *)a11;
  v135 = a12;
  v172.receiver = self;
  v172.super_class = (Class)_EARSpeechRecognizer;
  v21 = -[_EARSpeechRecognizer init](&v172, sel_init);
  if (!v21)
    goto LABEL_103;
  v22 = dispatch_queue_create("com.apple._EARSpeechRecognizer.recognition", 0);
  v23 = (void *)*((_QWORD *)v21 + 20);
  *((_QWORD *)v21 + 20) = v22;

  v24 = dispatch_queue_create("com.apple._EARSpeechRecognizer.formatter", 0);
  v25 = (void *)*((_QWORD *)v21 + 1);
  *((_QWORD *)v21 + 1) = v24;

  v26 = dispatch_queue_create("com.apple._EARSpeechRecognizer.training", 0);
  v27 = (void *)*((_QWORD *)v21 + 3);
  *((_QWORD *)v21 + 3) = v26;

  v170[0] = 0;
  v170[1] = v170;
  v170[2] = 0x4812000000;
  v170[3] = __Block_byref_object_copy__479;
  v170[4] = __Block_byref_object_dispose__480;
  v170[5] = &unk_1AE30551B;
  memset(v171, 0, sizeof(v171));
  v28 = MEMORY[0x1E0C809B0];
  v169[0] = MEMORY[0x1E0C809B0];
  v169[1] = 3221225472;
  v169[2] = __228___EARSpeechRecognizer_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn___block_invoke;
  v169[3] = &unk_1E5D46F38;
  v169[4] = v170;
  objc_msgSend(v134, "enumerateObjectsUsingBlock:", v169);
  *((_QWORD *)v21 + 40) = 0x40F5180000000000;
  v29 = objc_msgSend(v20, "copy");
  v30 = (void *)*((_QWORD *)v21 + 62);
  *((_QWORD *)v21 + 62) = v29;

  v31 = (void *)*((_QWORD *)v21 + 44);
  *((_QWORD *)v21 + 44) = &stru_1E5D49530;

  v32 = (void *)*((_QWORD *)v21 + 45);
  *((_QWORD *)v21 + 45) = &stru_1E5D49530;

  v33 = (void *)*((_QWORD *)v21 + 46);
  *((_QWORD *)v21 + 46) = &stru_1E5D49530;

  v34 = (void *)*((_QWORD *)v21 + 47);
  *((_QWORD *)v21 + 47) = &stru_1E5D49530;

  *((_BYTE *)v21 + 273) = 0;
  v35 = (void *)*((_QWORD *)v21 + 48);
  *((_QWORD *)v21 + 48) = &stru_1E5D49530;

  v36 = (void *)*((_QWORD *)v21 + 49);
  *((_QWORD *)v21 + 49) = &stru_1E5D49530;

  *((_BYTE *)v21 + 248) = 0;
  v127 = vdupq_n_s64(0x4076800000000000uLL);
  *(int64x2_t *)&v143.__r_.__value_.__l.__data_ = v127;
  *((double *)v21 + 52) = quasar::Location::getLatitude((quasar::Location *)&v143);
  *(int64x2_t *)&v143.__r_.__value_.__l.__data_ = v127;
  *((double *)v21 + 53) = quasar::corrective_reranking::VoiceEditingWFST::Path::getWeight((quasar::corrective_reranking::VoiceEditingWFST::Path *)&v143);
  *((_BYTE *)v21 + 271) = a9;
  v166 = 0;
  v167[0] = &v166;
  v167[1] = 0x2020000000;
  v168 = 0;
  if (v135)
  {
    v37 = operator new(0x30uLL);
    v37[2] = 0;
    *v37 = &unk_1E5D40AB0;
    v37[1] = 0;
    v143.__r_.__value_.__r.__words[0] = EARModelInitializeContext::EARModelInitializeContext((uint64_t)(v37 + 3), v135);
    v143.__r_.__value_.__l.__size_ = (std::string::size_type)v37;
    std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)v21 + 224, (__int128 *)&v143);
    size = (std::__shared_weak_count *)v143.__r_.__value_.__l.__size_;
    if (v143.__r_.__value_.__l.__size_)
    {
      v39 = (unint64_t *)(v143.__r_.__value_.__l.__size_ + 8);
      do
        v40 = __ldaxr(v39);
      while (__stlxr(v40 - 1, v39));
      if (!v40)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
  }
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "handleFailureInMethod:object:file:lineNumber:description:", a2, v21, CFSTR("EARSpeechRecognizer.mm"), 3956, &stru_1E5D49530);

  }
  v158[0] = v28;
  v158[1] = 3221225472;
  v158[2] = __228___EARSpeechRecognizer_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn___block_invoke_2;
  v158[3] = &unk_1E5D46F60;
  v41 = v21;
  v159 = v41;
  v42 = v20;
  v160 = v42;
  v164 = v170;
  v161 = v133;
  v165 = &v166;
  v162 = v132;
  v163 = v131;
  ConvertCXXExceptionToNSException(v158);
  v128 = *(_DWORD *)(v167[0] + 24);
  if (v128)
  {
    EARLogger::QuasarOSLogger(v43);
    v44 = objc_claimAutoreleasedReturnValue();
    v45 = v128;
    if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
      -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:].cold.1((uint64_t)v167, v44);
    goto LABEL_101;
  }
  v126 = v42;
  v46 = [_EARSpeechModelInfo alloc];
  SysConfig = (quasar::SystemConfig *)quasar::SpeechRecognizer::getSysConfig(*((quasar::SpeechRecognizer **)v41 + 10));
  v48 = -[_EARSpeechModelInfo _initWithSpeechModelInfo:](v46, "_initWithSpeechModelInfo:", quasar::SystemConfig::getMainSpeechModelInfo(SysConfig));
  v49 = (void *)*((_QWORD *)v41 + 37);
  *((_QWORD *)v41 + 37) = v48;

  quasar::SpeechRecognizer::getTraining(*((_QWORD *)v41 + 10), &v143);
  std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)v41 + 32, (__int128 *)&v143);
  v50 = (std::__shared_weak_count *)v143.__r_.__value_.__l.__size_;
  if (v143.__r_.__value_.__l.__size_)
  {
    v51 = (unint64_t *)(v143.__r_.__value_.__l.__size_ + 8);
    do
      v52 = __ldaxr(v51);
    while (__stlxr(v52 - 1, v51));
    if (!v52)
    {
      ((void (*)(std::__shared_weak_count *))v50->__on_zero_shared)(v50);
      std::__shared_weak_count::__release_weak(v50);
    }
  }
  if (*((_QWORD *)v41 + 4) && *((_BYTE *)v21 + 271))
  {
    v53 = -[_EARSpeakerCodeInfo initWithLanguage:]([_EARSpeakerCodeInfo alloc], "initWithLanguage:", v130);
    v54 = (void *)*((_QWORD *)v41 + 38);
    *((_QWORD *)v41 + 38) = v53;

    objc_msgSend(*((id *)v41 + 38), "trainingSpeakerCode");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v55, "length"))
    {
      objc_msgSend(*((id *)v41 + 38), "inferenceSpeakerCode");
      v56 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v56, "length"))
      {
        objc_msgSend(*((id *)v41 + 38), "accumulatedGradient");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = objc_msgSend(v57, "length");

        if (v58)
        {
          v59 = *((_QWORD *)v41 + 4);
          objc_msgSend(*((id *)v41 + 38), "trainingSpeakerCode");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v124 = v60;
          if (v60)
            objc_msgSend(v60, "ear_toString");
          else
            memset(&v143, 0, sizeof(v143));
          v119 = v59;
          std::allocate_shared[abi:ne180100]<std::istringstream,std::allocator<std::istringstream>,std::string,void>(&v143, &v156);
          v157 = v156;
          v156 = 0uLL;
          objc_msgSend(*((id *)v41 + 38), "inferenceSpeakerCode");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v123 = v75;
          if (v75)
            objc_msgSend(v75, "ear_toString");
          else
            memset(&v149, 0, sizeof(v149));
          std::allocate_shared[abi:ne180100]<std::istringstream,std::allocator<std::istringstream>,std::string,void>(&v149, &v154);
          v155 = v154;
          v154 = 0uLL;
          objc_msgSend(*((id *)v41 + 38), "accumulatedGradient");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          v121 = v76;
          if (v76)
            objc_msgSend(v76, "ear_toString");
          else
            memset(&__p, 0, sizeof(__p));
          std::allocate_shared[abi:ne180100]<std::istringstream,std::allocator<std::istringstream>,std::string,void>(&__p, &v152);
          v153 = v152;
          v152 = 0uLL;
          objc_msgSend(*((id *)v41 + 38), "nnetVersion");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = objc_msgSend(v118, "unsignedIntValue");
          objc_msgSend(*((id *)v41 + 38), "numFrames");
          v77 = (void *)objc_claimAutoreleasedReturnValue();
          v78 = objc_msgSend(v77, "unsignedLongValue");
          objc_msgSend(*((id *)v41 + 38), "trainingOffset");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v80 = objc_msgSend(v79, "unsignedLongValue");
          objc_msgSend(*((id *)v41 + 38), "recognitionOffset");
          v81 = (void *)objc_claimAutoreleasedReturnValue();
          quasar::SpeakerCodeTraining::init(v119, &v157, &v155, &v153, v117, v78, v80, objc_msgSend(v81, "unsignedLongValue"));

          v82 = (std::__shared_weak_count *)*((_QWORD *)&v153 + 1);
          if (*((_QWORD *)&v153 + 1))
          {
            v83 = (unint64_t *)(*((_QWORD *)&v153 + 1) + 8);
            do
              v84 = __ldaxr(v83);
            while (__stlxr(v84 - 1, v83));
            if (!v84)
            {
              ((void (*)(std::__shared_weak_count *))v82->__on_zero_shared)(v82);
              std::__shared_weak_count::__release_weak(v82);
            }
          }
          v85 = (std::__shared_weak_count *)*((_QWORD *)&v152 + 1);
          if (*((_QWORD *)&v152 + 1))
          {
            v86 = (unint64_t *)(*((_QWORD *)&v152 + 1) + 8);
            do
              v87 = __ldaxr(v86);
            while (__stlxr(v87 - 1, v86));
            if (!v87)
            {
              ((void (*)(std::__shared_weak_count *))v85->__on_zero_shared)(v85);
              std::__shared_weak_count::__release_weak(v85);
            }
          }
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);

          v88 = (std::__shared_weak_count *)*((_QWORD *)&v155 + 1);
          if (*((_QWORD *)&v155 + 1))
          {
            v89 = (unint64_t *)(*((_QWORD *)&v155 + 1) + 8);
            do
              v90 = __ldaxr(v89);
            while (__stlxr(v90 - 1, v89));
            if (!v90)
            {
              ((void (*)(std::__shared_weak_count *))v88->__on_zero_shared)(v88);
              std::__shared_weak_count::__release_weak(v88);
            }
          }
          v91 = (std::__shared_weak_count *)*((_QWORD *)&v154 + 1);
          if (*((_QWORD *)&v154 + 1))
          {
            v92 = (unint64_t *)(*((_QWORD *)&v154 + 1) + 8);
            do
              v93 = __ldaxr(v92);
            while (__stlxr(v93 - 1, v92));
            if (!v93)
            {
              ((void (*)(std::__shared_weak_count *))v91->__on_zero_shared)(v91);
              std::__shared_weak_count::__release_weak(v91);
            }
          }
          if (SHIBYTE(v149.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v149.__r_.__value_.__l.__data_);

          v94 = (std::__shared_weak_count *)*((_QWORD *)&v157 + 1);
          if (*((_QWORD *)&v157 + 1))
          {
            v95 = (unint64_t *)(*((_QWORD *)&v157 + 1) + 8);
            do
              v96 = __ldaxr(v95);
            while (__stlxr(v96 - 1, v95));
            if (!v96)
            {
              ((void (*)(std::__shared_weak_count *))v94->__on_zero_shared)(v94);
              std::__shared_weak_count::__release_weak(v94);
            }
          }
          v97 = (std::__shared_weak_count *)*((_QWORD *)&v156 + 1);
          if (*((_QWORD *)&v156 + 1))
          {
            v98 = (unint64_t *)(*((_QWORD *)&v156 + 1) + 8);
            do
              v99 = __ldaxr(v98);
            while (__stlxr(v99 - 1, v98));
            if (!v99)
            {
              ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
              std::__shared_weak_count::__release_weak(v97);
            }
          }
          if (SHIBYTE(v143.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v143.__r_.__value_.__l.__data_);

          goto LABEL_86;
        }
LABEL_27:
        v122 = *((_QWORD *)v41 + 4);
        *(_OWORD *)&v143.__r_.__value_.__l.__data_ = 0uLL;
        *(_OWORD *)&v149.__r_.__value_.__l.__data_ = 0uLL;
        *(_OWORD *)&__p.__r_.__value_.__l.__data_ = 0uLL;
        objc_msgSend(*((id *)v41 + 38), "nnetVersion");
        v125 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = objc_msgSend(v125, "unsignedIntValue");
        objc_msgSend(*((id *)v41 + 38), "numFrames");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v61, "unsignedLongValue");
        objc_msgSend(*((id *)v41 + 38), "trainingOffset");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = objc_msgSend(v63, "unsignedLongValue");
        objc_msgSend(*((id *)v41 + 38), "recognitionOffset");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        quasar::SpeakerCodeTraining::init(v122, &v143, &v149, &__p, v120, v62, v64, objc_msgSend(v65, "unsignedLongValue"));

        v66 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
        if (__p.__r_.__value_.__l.__size_)
        {
          v67 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
          do
            v68 = __ldaxr(v67);
          while (__stlxr(v68 - 1, v67));
          if (!v68)
          {
            ((void (*)(std::__shared_weak_count *))v66->__on_zero_shared)(v66);
            std::__shared_weak_count::__release_weak(v66);
          }
        }
        v69 = (std::__shared_weak_count *)v149.__r_.__value_.__l.__size_;
        if (v149.__r_.__value_.__l.__size_)
        {
          v70 = (unint64_t *)(v149.__r_.__value_.__l.__size_ + 8);
          do
            v71 = __ldaxr(v70);
          while (__stlxr(v71 - 1, v70));
          if (!v71)
          {
            ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
            std::__shared_weak_count::__release_weak(v69);
          }
        }
        v72 = (std::__shared_weak_count *)v143.__r_.__value_.__l.__size_;
        if (v143.__r_.__value_.__l.__size_)
        {
          v73 = (unint64_t *)(v143.__r_.__value_.__l.__size_ + 8);
          do
            v74 = __ldaxr(v73);
          while (__stlxr(v74 - 1, v73));
          if (!v74)
          {
            ((void (*)(std::__shared_weak_count *))v72->__on_zero_shared)(v72);
            std::__shared_weak_count::__release_weak(v72);
          }
        }
        goto LABEL_86;
      }

    }
    goto LABEL_27;
  }
LABEL_86:
  objc_storeStrong((id *)v41 + 54, a11);
  v100 = (void *)*((_QWORD *)v41 + 54);
  if (v100)
  {
    v149.__r_.__value_.__r.__words[0] = 0;
    v149.__r_.__value_.__l.__size_ = (std::string::size_type)&v149;
    v149.__r_.__value_.__r.__words[2] = 0x2020000000;
    v150 = 0;
    objc_msgSend(v100, "suites");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    v148[0] = MEMORY[0x1E0C809B0];
    v148[1] = 3221225472;
    v148[2] = __228___EARSpeechRecognizer_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn___block_invoke_498;
    v148[3] = &unk_1E5D46F88;
    v148[4] = &v149;
    objc_msgSend(v101, "enumerateObjectsUsingBlock:", v148);

    if (*(_BYTE *)(v149.__r_.__value_.__l.__size_ + 24))
    {
      quasar::makeVoiceCommandActiveSetCompilation(v129, &v143);
      std::allocate_shared[abi:ne180100]<quasar::VoiceCommandActiveSetCompilation const,std::allocator<quasar::VoiceCommandActiveSetCompilation const>,quasar::VoiceCommandActiveSetCompilation,void>((uint64_t)&v143, &__p);
      std::shared_ptr<kaldi::quasar::CEAttnEncoderDecoder>::operator=[abi:ne180100]((uint64_t)v41 + 48, (__int128 *)&__p);
      v102 = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
      if (__p.__r_.__value_.__l.__size_)
      {
        v103 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
        do
          v104 = __ldaxr(v103);
        while (__stlxr(v104 - 1, v103));
        if (!v104)
        {
          ((void (*)(std::__shared_weak_count *))v102->__on_zero_shared)(v102);
          std::__shared_weak_count::__release_weak(v102);
        }
      }
      std::__tree<int>::destroy((uint64_t)v147, v147[1]);
      std::__hash_table<std::__hash_value_type<quasar::VoiceCommandActiveSetCompilation::CommandSpec,quasar::VoiceCommandActiveSetCompilation::Suite>,std::__unordered_map_hasher<quasar::VoiceCommandActiveSetCompilation::CommandSpec,std::__hash_value_type<quasar::VoiceCommandActiveSetCompilation::CommandSpec,quasar::VoiceCommandActiveSetCompilation::Suite>,quasar::VoiceCommandActiveSetCompilation::CommandSpec::hash,std::equal_to<quasar::VoiceCommandActiveSetCompilation::CommandSpec>,true>,std::__unordered_map_equal<quasar::VoiceCommandActiveSetCompilation::CommandSpec,std::__hash_value_type<quasar::VoiceCommandActiveSetCompilation::CommandSpec,quasar::VoiceCommandActiveSetCompilation::Suite>,std::equal_to<quasar::VoiceCommandActiveSetCompilation::CommandSpec>,quasar::VoiceCommandActiveSetCompilation::CommandSpec::hash,true>,std::allocator<std::__hash_value_type<quasar::VoiceCommandActiveSetCompilation::CommandSpec,quasar::VoiceCommandActiveSetCompilation::Suite>>>::~__hash_table((uint64_t)&v146);
      std::__tree<std::__value_type<int,quasar::VoiceCommandActiveSetCompilation::CommandSpec>,std::__map_value_compare<int,std::__value_type<int,quasar::VoiceCommandActiveSetCompilation::CommandSpec>,std::less<int>,true>,std::allocator<std::__value_type<int,quasar::VoiceCommandActiveSetCompilation::CommandSpec>>>::destroy((uint64_t)v145, v145[1]);
      std::__tree<int>::destroy((uint64_t)&v143.__r_.__value_.__r.__words[2], v144);
      v143.__r_.__value_.__r.__words[0] = (std::string::size_type)&unk_1E5D25F80;
      v105 = v143.__r_.__value_.__l.__size_;
      if (v143.__r_.__value_.__l.__size_)
      {
        v106 = *(_DWORD *)(v143.__r_.__value_.__l.__size_ + 56) - 1;
        *(_DWORD *)(v143.__r_.__value_.__l.__size_ + 56) = v106;
        if (!v106)
          (*(void (**)(std::string::size_type))(*(_QWORD *)v105 + 8))(v105);
      }
    }
    _Block_object_dispose(&v149, 8);
  }
  v107 = (void *)*((_QWORD *)v41 + 57);
  *((_QWORD *)v41 + 57) = &stru_1E5D49530;

  v108 = (void *)*((_QWORD *)v41 + 58);
  *((_QWORD *)v41 + 58) = &stru_1E5D49530;

  v109 = (void *)*((_QWORD *)v41 + 59);
  *((_QWORD *)v41 + 59) = &stru_1E5D49530;

  if (a13)
  {
    v110 = (quasar::SpeechRecognizer *)*((_QWORD *)v41 + 10);
    if (v110)
    {
      v111 = +[_EARFormatter supportedByQuasarSystemConfig:](_EARFormatter, "supportedByQuasarSystemConfig:", quasar::SpeechRecognizer::getSysConfig(v110));
      v112 = *((_QWORD *)v21 + 1);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __228___EARSpeechRecognizer_initWithConfiguration_overrides_overrideConfigFiles_language_activeConfiguration_modelLoadingOptions_enableSpeakerCodeTraining_supportEmojiRecognition_voiceCommandActiveSet_modelContextDelegate_enableItn___block_invoke_2_503;
      block[3] = &unk_1E5D46FB0;
      v141 = v111;
      v137 = v41;
      v138 = v126;
      v139 = v134;
      v142 = a10;
      v140 = v130;
      dispatch_async(v112, block);

    }
  }
  v113 = objc_alloc_init(_EARRelevantTextContext);
  v44 = *((_QWORD *)v41 + 64);
  *((_QWORD *)v41 + 64) = v113;
  v45 = 0;
LABEL_101:

  _Block_object_dispose(&v166, 8);
  _Block_object_dispose(v170, 8);
  v143.__r_.__value_.__r.__words[0] = (std::string::size_type)v171;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v143);
  if (!v45)
  {
LABEL_103:
    v114 = (_EARSpeechRecognizer *)v21;
    goto LABEL_104;
  }
  v114 = 0;
LABEL_104:

  return v114;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 withLanguage:(id)a4 withSdapiConfig:(id)a5
{
  id v8;
  id v9;
  id v10;
  _EARSpeechRecognizer *v11;
  _EARSpeechRecognizer *v12;
  NSObject *formatterQueue;
  _QWORD block[4];
  _EARSpeechRecognizer *v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[_EARSpeechRecognizer initWithConfiguration:](self, "initWithConfiguration:", v8);
  v12 = v11;
  if (v11)
  {
    formatterQueue = v11->_formatterQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __75___EARSpeechRecognizer_initWithConfiguration_withLanguage_withSdapiConfig___block_invoke;
    block[3] = &unk_1E5D46FD8;
    v16 = v11;
    v17 = v9;
    v18 = v10;
    dispatch_async(formatterQueue, block);

  }
  return v12;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 withGeneralVoc:(id)a4 withLexiconEnh:(id)a5 withItnEnh:(id)a6
{
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:", a3, 0, 0, a4, a5, a6);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8
{
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:", a3, a4, a5, a6, a7, a8, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 generalVoc:(id)a5 lexiconEnh:(id)a6 itnEnh:(id)a7
{
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:", a3, a4, 0, a5, a6, a7, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrideConfigFiles:(id)a4 generalVoc:(id)a5 lexiconEnh:(id)a6 itnEnh:(id)a7
{
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:", a3, 0, a4, a5, a6, a7, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  _EARSpeechRecognizer *v23;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything](_EARSpeechRecognitionActiveConfiguration, "activeConfigurationForEverything");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:", v15, v16, v17, v18, v19, v20, v21, v22);

  return v23;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10
{
  uint64_t v11;

  LOBYTE(v11) = 1;
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:enableSpeakerCodeTraining:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:enableSpeakerCodeTraining:", a3, a4, a5, a6, a7, a8, a9, a10, v11);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 enableSpeakerCodeTraining:(BOOL)a11
{
  uint64_t v12;

  LOBYTE(v12) = a11;
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:", a3, a4, a5, a6, a7, a8, a9, a10, 0, v12);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12
{
  uint64_t v13;

  LOWORD(v13) = a12;
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v13);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12 supportEmojiRecognition:(BOOL)a13
{
  uint64_t v14;

  LOWORD(v14) = __PAIR16__(a13, a12);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v14, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12 supportEmojiRecognition:(BOOL)a13 voiceCommandActiveSet:(id)a14
{
  uint64_t v15;

  LOWORD(v15) = __PAIR16__(a13, a12);
  return -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:](self, "initWithConfiguration:overrides:overrideConfigFiles:generalVoc:lexiconEnh:itnEnh:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:", a3, a4, a5, a6, a7, a8, a9, a10, a11, v15, a14, 0);
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 overrides:(id)a4 overrideConfigFiles:(id)a5 generalVoc:(id)a6 lexiconEnh:(id)a7 itnEnh:(id)a8 language:(id)a9 activeConfiguration:(id)a10 modelLoadingOptions:(id)a11 enableSpeakerCodeTraining:(BOOL)a12 supportEmojiRecognition:(BOOL)a13 voiceCommandActiveSet:(id)a14 modelContextDelegate:(id)a15
{
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  _EARSpeechRecognizer *v31;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  id v36;

  v20 = a3;
  v21 = a4;
  v36 = a5;
  v22 = a6;
  v23 = a7;
  v24 = a8;
  v25 = a9;
  v26 = a10;
  v27 = a11;
  v28 = a14;
  v29 = a15;
  v35 = v22;
  if (v22 && v23 && v24)
    v30 = +[_EARQuasarTokenizer extractModelRootFromNcsResourcePaths:lexiconEnh:tokenEnh:itnEnh:](_EARQuasarTokenizer, "extractModelRootFromNcsResourcePaths:lexiconEnh:tokenEnh:itnEnh:", v22, v23, 0, v24);
  LOBYTE(v34) = 1;
  LOWORD(v33) = __PAIR16__(a13, a12);
  v31 = -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:", v20, v21, v36, v25, v26, v27, v33, v28, v29, v34);

  return v31;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 useQuasarFormatter:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  _EARSpeechRecognizer *v8;

  v4 = a4;
  v6 = a3;
  +[_EARSpeechRecognitionActiveConfiguration activeConfigurationForEverything](_EARSpeechRecognitionActiveConfiguration, "activeConfigurationForEverything");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[_EARSpeechRecognizer initWithConfiguration:useQuasarFormatter:activeConfiguration:](self, "initWithConfiguration:useQuasarFormatter:activeConfiguration:", v6, v4, v7);

  return v8;
}

- (_EARSpeechRecognizer)initWithConfiguration:(id)a3 useQuasarFormatter:(BOOL)a4 activeConfiguration:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  _EARSpeechRecognizer *v10;
  NSObject *formatterQueue;
  _EARSpeechRecognizer *v12;
  _QWORD block[4];
  _EARSpeechRecognizer *v15;
  id v16;
  id location;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = -[_EARSpeechRecognizer initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:](self, "initWithConfiguration:overrides:overrideConfigFiles:language:activeConfiguration:", v8, 0, 0, 0, v9);
  if (v10 && v6)
  {
    if (!objc_msgSend((id)objc_opt_class(), "supportedByQuasarConfig:", v10->_configPath))
    {
      v12 = 0;
      goto LABEL_7;
    }
    objc_initWeak(&location, v10);
    formatterQueue = v10->_formatterQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __85___EARSpeechRecognizer_initWithConfiguration_useQuasarFormatter_activeConfiguration___block_invoke;
    block[3] = &unk_1E5D47000;
    v15 = v10;
    objc_copyWeak(&v16, &location);
    dispatch_async(formatterQueue, block);
    objc_destroyWeak(&v16);

    objc_destroyWeak(&location);
  }
  v12 = v10;
LABEL_7:

  return v12;
}

- (BOOL)enableVoiceCommands
{
  return self->_enableVoiceCommands;
}

- (void)loadParser
{
  OUTLINED_FUNCTION_6(&dword_1AD756000, a1, a3, "Parser initialization unknown exception", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

- (void)setEnableVoiceCommands:(BOOL)a3
{
  _EARSpeechRecognizer *v3;
  quasar *v4;
  const quasar::SystemConfig *v5;
  quasar *SysConfig;
  const quasar::SystemConfig *v7;
  _BOOL8 v8;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;
  __int16 v14;
  __int16 v15;

  v3 = self;
  if (a3
    && (v4 = (quasar *)quasar::SpeechRecognizer::getSysConfig((quasar::SpeechRecognizer *)self->_recognizer.__ptr_),
        self = (_EARSpeechRecognizer *)quasar::configSupportsVoiceCommands(v4, v5),
        (_DWORD)self))
  {
    SysConfig = (quasar *)quasar::SpeechRecognizer::getSysConfig((quasar::SpeechRecognizer *)v3->_recognizer.__ptr_);
    v8 = quasar::configSupportsCorrectiveReranking(SysConfig, v7);
    if (!v8)
    {
      if (v3->_voiceCommandCompilation.__ptr_)
      {
        v3->_supportVoiceCommands = 1;
        EARLogger::QuasarOSLogger((EARLogger *)v8);
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          goto LABEL_9;
        v14 = 0;
        v10 = "Voice commands enabled with WFST-only backend";
        v11 = (uint8_t *)&v14;
      }
      else
      {
        v3->_supportVoiceCommands = 0;
        EARLogger::QuasarOSLogger((EARLogger *)v8);
        v9 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          goto LABEL_9;
        v13 = 0;
        v10 = "Voice commands unsupported";
        v11 = (uint8_t *)&v13;
      }
      goto LABEL_8;
    }
    v3->_supportVoiceCommands = 1;
    EARLogger::QuasarOSLogger((EARLogger *)v8);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v15 = 0;
      v10 = "Voice commands enabled with Corrective Reranking backend";
      v11 = (uint8_t *)&v15;
LABEL_8:
      _os_log_impl(&dword_1AD756000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
    }
  }
  else
  {
    v3->_supportVoiceCommands = 0;
    EARLogger::QuasarOSLogger((EARLogger *)self);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 0;
      v10 = "Voice commands disabled";
      v11 = (uint8_t *)&v12;
      goto LABEL_8;
    }
  }
LABEL_9:

}

- (id)_tokenizer
{
  _EARTokenizer *tokenizer;
  _EARNLTokenizer *v4;
  _EARTokenizer *v5;

  tokenizer = self->_tokenizer;
  if (!tokenizer)
  {
    v4 = objc_alloc_init(_EARNLTokenizer);
    v5 = self->_tokenizer;
    self->_tokenizer = &v4->super;

    tokenizer = self->_tokenizer;
  }
  return tokenizer;
}

- (void)setHighPriority:(BOOL)a3
{
  NSObject *v4;
  NSObject *v5;
  OS_dispatch_queue *recognitionQueue;
  OS_dispatch_queue *v7;
  OS_dispatch_queue *v8;
  NSObject *object;

  self->_highPriority = a3;
  if (a3)
  {
    object = dispatch_workloop_create_inactive("com.apple._EARSpeechRecognizer.recognition.workloop");
    dispatch_workloop_set_scheduler_priority();
    dispatch_set_qos_class_fallback();
    dispatch_activate(object);
    dispatch_queue_attr_make_initially_inactive(0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create("com.apple._EARSpeechRecognizer.recognition", v4);

    dispatch_set_target_queue(v5, object);
    dispatch_set_qos_class_floor(v5, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_activate(v5);
    recognitionQueue = self->_recognitionQueue;
    self->_recognitionQueue = (OS_dispatch_queue *)v5;

    v7 = (OS_dispatch_queue *)object;
  }
  else
  {
    v8 = (OS_dispatch_queue *)dispatch_queue_create("com.apple._EARSpeechRecognizer.recognition", 0);
    v7 = self->_recognitionQueue;
    self->_recognitionQueue = v8;
  }

}

- (void)setLeftContextText:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  __CFString *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSArray *v14;
  id v15;
  NSArray *onScreenContextForEditLme;
  NSUInteger v17;
  NSArray *v18;
  NSArray *v19;
  NSArray *leftContextForItn;
  void *v21;
  uint64_t v22;
  id v23;
  void *__p[2];
  __int128 v25;

  v4 = a3;
  v5 = v4;
  if (!v4)
  {
    *(_OWORD *)__p = 0u;
    v25 = 0u;
LABEL_5:
    v6 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v4, "ear_toStringOrNothing");
  v6 = v5;
  if (!BYTE8(v25))
    goto LABEL_5;
LABEL_6:
  v7 = v6;
  if (BYTE8(v25) && SBYTE7(v25) < 0)
    operator delete(__p[0]);
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "componentsSeparatedByCharactersInSet:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v9, "lastObject");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = &stru_1E5D49530;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (self->_enableVoiceCommands)
    v13 = 50;
  else
    v13 = 4;
  v23 = v11;
  -[_EARSpeechRecognizer tokenizeTextFromEnd:withLimit:outTokensInVocab:](self, "tokenizeTextFromEnd:withLimit:outTokensInVocab:", v10, v13, &v23);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v15 = v23;

  onScreenContextForEditLme = self->_onScreenContextForEditLme;
  self->_onScreenContextForEditLme = v14;

  v17 = -[NSArray count](self->_onScreenContextForEditLme, "count");
  v18 = self->_onScreenContextForEditLme;
  if (v17 < 5)
  {
    v19 = v18;
  }
  else
  {
    -[NSArray subarrayWithRange:](v18, "subarrayWithRange:", -[NSArray count](self->_onScreenContextForEditLme, "count") - 4, 4);
    v19 = (NSArray *)objc_claimAutoreleasedReturnValue();
  }
  leftContextForItn = self->_leftContextForItn;
  self->_leftContextForItn = v19;

  -[_EARRelevantTextContext setLeftContext:](self->_relevantTextContext, "setLeftContext:", v7);
  if ((unint64_t)objc_msgSend(v15, "count") >= 5)
  {
    objc_msgSend(v15, "subarrayWithRange:", objc_msgSend(v15, "count") - 4, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "mutableCopy");

    v15 = (id)v22;
  }
  -[_EARSpeechRecognizer setLeftContext:](self, "setLeftContext:", v15);

}

- (void)setLeftContext:(id)a3
{
  NSArray *v4;
  NSArray *leftContext;
  id v6;

  v6 = a3;
  v4 = (NSArray *)objc_msgSend(v6, "copy");
  leftContext = self->_leftContext;
  self->_leftContext = v4;

  -[_EARSpeechRecognizer _restartActiveRecognition](self, "_restartActiveRecognition");
}

- (void)setRightContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *__p[2];
  __int128 v9;
  void **v10;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "ear_toStringOrNothing");
    if (BYTE8(v9))
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
    *(_OWORD *)__p = 0u;
    v9 = 0u;
  }
  v7 = v6;
  if (BYTE8(v9) && SBYTE7(v9) < 0)
    operator delete(__p[0]);
  -[_EARSpeechRecognizer splitWithTokenizer:isLeftContext:shouldTruncate:outTokensInVocab:](self, "splitWithTokenizer:isLeftContext:shouldTruncate:outTokensInVocab:", v7, 0, 1, 0, __p[0]);
  std::vector<std::string>::__vdeallocate((std::vector<std::wstring> *)&self->_rightContextTokens);
  *(_OWORD *)&self->_rightContextTokens.__begin_ = *(_OWORD *)__p;
  self->_rightContextTokens.__end_cap_.__value_ = (void *)v9;
  __p[1] = 0;
  *(_QWORD *)&v9 = 0;
  __p[0] = 0;
  v10 = __p;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v10);
  -[_EARRelevantTextContext setRightContext:](self->_relevantTextContext, "setRightContext:", v7);
  -[_EARSpeechRecognizer _restartActiveRecognition](self, "_restartActiveRecognition");

}

- (void)setUserProfileData:(id)a3
{
  NSData *v4;
  NSData *userProfileData;
  id v6;

  v6 = a3;
  v4 = (NSData *)objc_msgSend(v6, "copy");
  userProfileData = self->_userProfileData;
  self->_userProfileData = v4;

  -[_EARSpeechRecognizer _restartActiveRecognition](self, "_restartActiveRecognition");
}

- (void)setJitProfileData:(id)a3
{
  NSData *v4;
  NSData *jitProfileData;
  id v6;

  v6 = a3;
  v4 = (NSData *)objc_msgSend(v6, "copy");
  jitProfileData = self->_jitProfileData;
  self->_jitProfileData = v4;

  -[_EARSpeechRecognizer _restartActiveRecognition](self, "_restartActiveRecognition");
}

- (void)_setProfileContainers:(id)a3 muxIds:(id)a4
{
  id v6;
  NSDictionary *muxIdMask;
  NSDictionary *muxIdReverseMask;
  NSSet *muxIds;
  NSArray *userProfiles;
  EARHelpers *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  uint64_t v17;
  uint64_t *p_shared_owners;
  unint64_t v19;
  EARHelpers *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  void *v27;
  EARHelpers *v28;
  NSArray *v29;
  id v30;
  unint64_t k;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSDictionary *v36;
  uint64_t v37;
  NSDictionary *v38;
  uint64_t v39;
  NSArray *v40;
  uint64_t v41;
  NSArray *v42;
  uint64_t v43;
  uint64_t v44;
  id v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t m;
  void *v50;
  uint64_t v51;
  NSSet *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v58;
  id v59;
  EARHelpers *v60;
  void *v61;
  _EARSpeechRecognizer *v62;
  id v63;
  void *v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _BYTE v80[128];
  _BYTE v81[128];
  _BYTE v82[128];
  uint64_t v83;

  v83 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v59 = a4;
  muxIdMask = self->_muxIdMask;
  self->_muxIdMask = 0;

  muxIdReverseMask = self->_muxIdReverseMask;
  self->_muxIdReverseMask = 0;

  muxIds = self->_muxIds;
  self->_muxIds = 0;

  userProfiles = self->_userProfiles;
  v62 = self;
  self->_userProfiles = 0;

  v11 = (EARHelpers *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v60 = v11;
  v12 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  obj = v6;
  v61 = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16, v6);
  if (v13)
  {
    v14 = *(_QWORD *)v77;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v77 != v14)
          objc_enumerationMutation(obj);
        v16 = *(_QWORD *)(*((_QWORD *)&v76 + 1) + 8 * i);
        if (v16)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v76 + 1) + 8 * i), "lmeData");
          if (*(char *)(v74 + 295) < 0)
            v17 = *(_QWORD *)(v74 + 280);
          else
            v17 = *(unsigned __int8 *)(v74 + 295);
          if (v75)
          {
            p_shared_owners = &v75->__shared_owners_;
            do
              v19 = __ldaxr((unint64_t *)p_shared_owners);
            while (__stlxr(v19 - 1, (unint64_t *)p_shared_owners));
            if (!v19)
            {
              ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
              std::__shared_weak_count::__release_weak(v75);
            }
          }
          if (v17)
            v20 = v11;
          else
            v20 = (EARHelpers *)v12;
          -[EARHelpers addObject:](v20, "addObject:", v16);
        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v76, v82, 16);
    }
    while (v13);
  }

  v21 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v22 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  v23 = v59;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
  if (v24)
  {
    v25 = *(_QWORD *)v71;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v71 != v25)
          objc_enumerationMutation(v23);
        v27 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * j);
        if (objc_msgSend(v27, "length"))
        {
          objc_msgSend(v22, "addObject:", v27);
          objc_msgSend(v21, "addObject:", v27);
        }
      }
      v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v70, v81, 16);
    }
    while (v24);
  }

  objc_msgSend(v21, "allObjects");
  v28 = (EARHelpers *)objc_claimAutoreleasedReturnValue();
  EARHelpers::shuffledArray(v28, v29);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v63 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  for (k = 0; objc_msgSend(v64, "count") > k; ++k)
  {
    objc_msgSend(v64, "objectAtIndexedSubscript:", k);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", k);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "stringValue");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setObject:forKeyedSubscript:", v34, v32);
    objc_msgSend(v63, "setObject:forKeyedSubscript:", v32, v34);

  }
  v35 = objc_msgSend(v30, "copy");
  v36 = v62->_muxIdMask;
  v62->_muxIdMask = (NSDictionary *)v35;

  v37 = objc_msgSend(v63, "copy");
  v38 = v62->_muxIdReverseMask;
  v62->_muxIdReverseMask = (NSDictionary *)v37;

  v39 = -[NSDictionary count](v62->_muxIdMask, "count");
  if (v39 != -[NSDictionary count](v62->_muxIdReverseMask, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "handleFailureInMethod:object:file:lineNumber:description:", a2, v62, CFSTR("EARSpeechRecognizer.mm"), 4611, CFSTR("Size mismatch"));

  }
  EARHelpers::shuffledArray(v11, v40);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "arrayByAddingObjectsFromArray:", v61);
  v41 = objc_claimAutoreleasedReturnValue();
  v42 = v62->_userProfiles;
  v62->_userProfiles = (NSArray *)v41;

  v43 = -[NSArray count](v62->_userProfiles, "count");
  v44 = -[EARHelpers count](v11, "count");
  if (v43 != objc_msgSend(v61, "count") + v44)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "handleFailureInMethod:object:file:lineNumber:description:", a2, v62, CFSTR("EARSpeechRecognizer.mm"), 4617, CFSTR("Size mismatch"));

  }
  v45 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  v46 = v22;
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
  if (v47)
  {
    v48 = *(_QWORD *)v67;
    do
    {
      for (m = 0; m != v47; ++m)
      {
        if (*(_QWORD *)v67 != v48)
          objc_enumerationMutation(v46);
        objc_msgSend(v30, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v66 + 1) + 8 * m));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "addObject:", v50);

      }
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v66, v80, 16);
    }
    while (v47);
  }

  v51 = objc_msgSend(v45, "copy");
  v52 = v62->_muxIds;
  v62->_muxIds = (NSSet *)v51;

  v53 = -[NSSet count](v62->_muxIds, "count");
  if (v53 != objc_msgSend(v46, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "handleFailureInMethod:object:file:lineNumber:description:", a2, v62, CFSTR("EARSpeechRecognizer.mm"), 4625, CFSTR("Size mismatch"));

  }
  -[_EARSpeechRecognizer _restartActiveRecognition](v62, "_restartActiveRecognition");

}

- (void)setUserProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  -[_EARSpeechRecognizer _setProfileContainers:muxIds:](self, "_setProfileContainers:muxIds:", v6, 0);
  if (v5)

}

- (id)_unmaskMuxPackages:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", v10, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_muxIdReverseMask, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, v12);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v7);
  }

  v13 = (void *)objc_msgSend(v5, "copy");
  return v13;
}

- (id)runRecognitionWithResultStream:(id)a3
{
  -[_EARSpeechRecognizer runRecognitionWithResultStream:language:task:samplingRate:](self, "runRecognitionWithResultStream:language:task:samplingRate:", a3, CFSTR("en_US"), CFSTR("Dictation"), 16000);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)updateUserProfileData:(id)a3
{
  EARHelpers *v4;
  uint64_t *v5;
  std::__shared_weak_count *v6;
  std::__shared_weak_count_vtbl *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  NSData *v13;
  NSData *userProfileData;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  EARHelpers *jitProfileData;
  uint64_t *v19;
  std::__shared_weak_count *v20;
  std::__shared_weak_count_vtbl *v21;
  unint64_t *v22;
  unint64_t v23;
  std::__shared_weak_count *v24;
  unint64_t *v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  _QWORD v30[5];
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34[3];
  uint64_t *v35;
  std::__shared_weak_count *v36;
  void *__p[2];
  char v38;
  uint64_t *v39;
  std::__shared_weak_count *v40;
  void *v41;
  std::__shared_weak_count *v42;
  void *v43;
  _BYTE *v44;
  char *v45[3];

  v4 = (EARHelpers *)a3;
  quasar::LmeDataStreams::LmeDataStreams((quasar::LmeDataStreams *)&v43);
  if (v4)
  {
    EARHelpers::createNSDataInputStream(v4, (EARHelpers::NSDataInputStream **)__p);
    v5 = (uint64_t *)__p[0];
    v41 = __p[0];
    if (__p[0])
    {
      v6 = (std::__shared_weak_count *)operator new();
      v7 = (std::__shared_weak_count_vtbl *)__p[0];
      v6->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v6->__shared_owners_;
      v6->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E5D46658;
      v6->__shared_weak_owners_ = 0;
      v6[1].__vftable = v7;
      v42 = v6;
      v39 = v5;
      v40 = v6;
      do
        v9 = __ldxr(p_shared_owners);
      while (__stxr(v9 + 1, p_shared_owners));
    }
    else
    {
      v42 = 0;
      v39 = 0;
      v40 = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    quasar::LmeDataStreams::addLmeStream((uint64_t)&v43, 0, &v39, (__int128 *)__p);
    if (v38 < 0)
      operator delete(__p[0]);
    v10 = v40;
    if (v40)
    {
      v11 = (unint64_t *)&v40->__shared_owners_;
      do
        v12 = __ldaxr(v11);
      while (__stlxr(v12 - 1, v11));
      if (!v12)
      {
        ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
        std::__shared_weak_count::__release_weak(v10);
      }
    }
    v13 = (NSData *)-[EARHelpers copy](v4, "copy");
    userProfileData = self->_userProfileData;
    self->_userProfileData = v13;

    v15 = v42;
    if (v42)
    {
      v16 = (unint64_t *)&v42->__shared_owners_;
      do
        v17 = __ldaxr(v16);
      while (__stlxr(v17 - 1, v16));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
  }
  addAotLmeStreams((uint64_t)&v43, self->_userProfiles, self->_muxIdMask);
  jitProfileData = (EARHelpers *)self->_jitProfileData;
  if (jitProfileData)
  {
    EARHelpers::createNSDataInputStream(jitProfileData, (EARHelpers::NSDataInputStream **)__p);
    v19 = (uint64_t *)__p[0];
    v41 = __p[0];
    if (__p[0])
    {
      v20 = (std::__shared_weak_count *)operator new();
      v21 = (std::__shared_weak_count_vtbl *)__p[0];
      v20->__shared_owners_ = 0;
      v22 = (unint64_t *)&v20->__shared_owners_;
      v20->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E5D46658;
      v20->__shared_weak_owners_ = 0;
      v20[1].__vftable = v21;
      v42 = v20;
      v35 = v19;
      v36 = v20;
      do
        v23 = __ldxr(v22);
      while (__stxr(v23 + 1, v22));
    }
    else
    {
      v42 = 0;
      v35 = 0;
      v36 = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    quasar::LmeDataStreams::addLmeStream((uint64_t)&v43, 1, &v35, (__int128 *)__p);
    if (v38 < 0)
      operator delete(__p[0]);
    v24 = v36;
    if (v36)
    {
      v25 = (unint64_t *)&v36->__shared_owners_;
      do
        v26 = __ldaxr(v25);
      while (__stlxr(v26 - 1, v25));
      if (!v26)
      {
        ((void (*)(std::__shared_weak_count *))v24->__on_zero_shared)(v24);
        std::__shared_weak_count::__release_weak(v24);
      }
    }
    v27 = v42;
    if (v42)
    {
      v28 = (unint64_t *)&v42->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
  }
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3321888768;
  v30[2] = __46___EARSpeechRecognizer_updateUserProfileData___block_invoke;
  v30[3] = &unk_1E5D46A70;
  v30[4] = self;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  std::vector<quasar::LmeDataFactoryBase::LmeType>::__init_with_size[abi:ne180100]<quasar::LmeDataFactoryBase::LmeType*,quasar::LmeDataFactoryBase::LmeType*>(&v31, v43, (uint64_t)v44, (v44 - (_BYTE *)v43) >> 2);
  std::map<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>::map[abi:ne180100](v34, (uint64_t)v45);
  ConvertCXXExceptionToNSException(v30);
  std::__tree<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::__map_value_compare<quasar::LmeDataFactoryBase::LmeType,std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::less<quasar::LmeDataFactoryBase::LmeType>,true>,std::allocator<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>>>::destroy((uint64_t)v34, (char *)v34[1]);
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }
  std::__tree<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::__map_value_compare<quasar::LmeDataFactoryBase::LmeType,std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::less<quasar::LmeDataFactoryBase::LmeType>,true>,std::allocator<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>>>::destroy((uint64_t)v45, v45[1]);
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }

}

- (void)updateJitProfileData:(id)a3
{
  EARHelpers *v4;
  EARHelpers *userProfileData;
  uint64_t *v6;
  std::__shared_weak_count *v7;
  std::__shared_weak_count_vtbl *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t *v17;
  std::__shared_weak_count *v18;
  std::__shared_weak_count_vtbl *v19;
  unint64_t *v20;
  unint64_t v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  NSData *v25;
  NSData *jitProfileData;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  _QWORD v30[5];
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34[3];
  uint64_t *v35;
  std::__shared_weak_count *v36;
  void *__p[2];
  char v38;
  uint64_t *v39;
  std::__shared_weak_count *v40;
  void *v41;
  std::__shared_weak_count *v42;
  void *v43;
  _BYTE *v44;
  char *v45[3];

  v4 = (EARHelpers *)a3;
  quasar::LmeDataStreams::LmeDataStreams((quasar::LmeDataStreams *)&v43);
  userProfileData = (EARHelpers *)self->_userProfileData;
  if (userProfileData)
  {
    EARHelpers::createNSDataInputStream(userProfileData, (EARHelpers::NSDataInputStream **)__p);
    v6 = (uint64_t *)__p[0];
    v41 = __p[0];
    if (__p[0])
    {
      v7 = (std::__shared_weak_count *)operator new();
      v8 = (std::__shared_weak_count_vtbl *)__p[0];
      v7->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v7->__shared_owners_;
      v7->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E5D46658;
      v7->__shared_weak_owners_ = 0;
      v7[1].__vftable = v8;
      v42 = v7;
      v39 = v6;
      v40 = v7;
      do
        v10 = __ldxr(p_shared_owners);
      while (__stxr(v10 + 1, p_shared_owners));
    }
    else
    {
      v42 = 0;
      v39 = 0;
      v40 = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    quasar::LmeDataStreams::addLmeStream((uint64_t)&v43, 0, &v39, (__int128 *)__p);
    if (v38 < 0)
      operator delete(__p[0]);
    v11 = v40;
    if (v40)
    {
      v12 = (unint64_t *)&v40->__shared_owners_;
      do
        v13 = __ldaxr(v12);
      while (__stlxr(v13 - 1, v12));
      if (!v13)
      {
        ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
        std::__shared_weak_count::__release_weak(v11);
      }
    }
    v14 = v42;
    if (v42)
    {
      v15 = (unint64_t *)&v42->__shared_owners_;
      do
        v16 = __ldaxr(v15);
      while (__stlxr(v16 - 1, v15));
      if (!v16)
      {
        ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
        std::__shared_weak_count::__release_weak(v14);
      }
    }
  }
  addAotLmeStreams((uint64_t)&v43, self->_userProfiles, self->_muxIdMask);
  if (v4)
  {
    EARHelpers::createNSDataInputStream(v4, (EARHelpers::NSDataInputStream **)__p);
    v17 = (uint64_t *)__p[0];
    v41 = __p[0];
    if (__p[0])
    {
      v18 = (std::__shared_weak_count *)operator new();
      v19 = (std::__shared_weak_count_vtbl *)__p[0];
      v18->__shared_owners_ = 0;
      v20 = (unint64_t *)&v18->__shared_owners_;
      v18->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E5D46658;
      v18->__shared_weak_owners_ = 0;
      v18[1].__vftable = v19;
      v42 = v18;
      v35 = v17;
      v36 = v18;
      do
        v21 = __ldxr(v20);
      while (__stxr(v21 + 1, v20));
    }
    else
    {
      v42 = 0;
      v35 = 0;
      v36 = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(__p, "");
    quasar::LmeDataStreams::addLmeStream((uint64_t)&v43, 1, &v35, (__int128 *)__p);
    if (v38 < 0)
      operator delete(__p[0]);
    v22 = v36;
    if (v36)
    {
      v23 = (unint64_t *)&v36->__shared_owners_;
      do
        v24 = __ldaxr(v23);
      while (__stlxr(v24 - 1, v23));
      if (!v24)
      {
        ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
        std::__shared_weak_count::__release_weak(v22);
      }
    }
    v25 = (NSData *)-[EARHelpers copy](v4, "copy");
    jitProfileData = self->_jitProfileData;
    self->_jitProfileData = v25;

    v27 = v42;
    if (v42)
    {
      v28 = (unint64_t *)&v42->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
  }
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3321888768;
  v30[2] = __45___EARSpeechRecognizer_updateJitProfileData___block_invoke;
  v30[3] = &unk_1E5D46A70;
  v30[4] = self;
  v31 = 0;
  v32 = 0;
  v33 = 0;
  std::vector<quasar::LmeDataFactoryBase::LmeType>::__init_with_size[abi:ne180100]<quasar::LmeDataFactoryBase::LmeType*,quasar::LmeDataFactoryBase::LmeType*>(&v31, v43, (uint64_t)v44, (v44 - (_BYTE *)v43) >> 2);
  std::map<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>::map[abi:ne180100](v34, (uint64_t)v45);
  ConvertCXXExceptionToNSException(v30);
  std::__tree<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::__map_value_compare<quasar::LmeDataFactoryBase::LmeType,std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::less<quasar::LmeDataFactoryBase::LmeType>,true>,std::allocator<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>>>::destroy((uint64_t)v34, (char *)v34[1]);
  if (v31)
  {
    v32 = v31;
    operator delete(v31);
  }
  std::__tree<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::__map_value_compare<quasar::LmeDataFactoryBase::LmeType,std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::less<quasar::LmeDataFactoryBase::LmeType>,true>,std::allocator<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>>>::destroy((uint64_t)v45, v45[1]);
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }

}

- (id)runRecognitionWithResultStream:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6
{
  -[_EARSpeechRecognizer runRecognitionWithResultStream:language:task:samplingRate:userProfileData:speakerCodeWriter:](self, "runRecognitionWithResultStream:language:task:samplingRate:userProfileData:speakerCodeWriter:", a3, a4, a5, a6, self->_userProfileData, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)runRecognitionWithResultStream:(id)a3 speakerCodeWriter:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7
{
  -[_EARSpeechRecognizer runRecognitionWithResultStream:language:task:samplingRate:userProfileData:speakerCodeWriter:](self, "runRecognitionWithResultStream:language:task:samplingRate:userProfileData:speakerCodeWriter:", a3, a5, a6, a7, self->_userProfileData, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)runRecognitionWithResultStream:(id)a3 language:(id)a4 task:(id)a5 samplingRate:(unint64_t)a6 userProfileData:(id)a7 speakerCodeWriter:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id WeakRetained;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a7;
  v18 = a8;
  WeakRetained = objc_loadWeakRetained((id *)&self->_currentAudioBuffer);
  objc_msgSend(WeakRetained, "_detachFromRecognizer");

  v36 = 0;
  v37 = &v36;
  v38 = 0x3032000000;
  v39 = __Block_byref_object_copy__2;
  v40 = __Block_byref_object_dispose__2;
  v41 = 0;
  objc_msgSend(v15, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __116___EARSpeechRecognizer_runRecognitionWithResultStream_language_task_samplingRate_userProfileData_speakerCodeWriter___block_invoke;
  v28[3] = &unk_1E5D47028;
  v28[4] = self;
  v21 = v20;
  v29 = v21;
  v22 = v14;
  v30 = v22;
  v23 = v16;
  v31 = v23;
  v24 = v18;
  v32 = v24;
  v35 = a6;
  v25 = v17;
  v33 = v25;
  v34 = &v36;
  ConvertCXXExceptionToNSException(v28);
  v26 = (id)v37[5];

  _Block_object_dispose(&v36, 8);
  return v26;
}

- (BOOL)canCloneIsFinalAsLastNonFinal
{
  if (self->_detectUtterances)
    return self->_concatenateUtterances;
  return !self->_concatenateUtterances && self->_recognizeEagerCandidates;
}

- (void)writeRecordedStateAccesses
{
  void *__p[2];
  char v4;

  std::string::basic_string[abi:ne180100]<0>(__p, "");
  quasar::SpeechRecognizer::writeRecordedStateAccesses((uint64_t)self->_recognizer.__ptr_, (uint64_t)__p);
  if (v4 < 0)
    operator delete(__p[0]);
}

- (shared_ptr<quasar::RecogAudioBufferBase>)_audioBufferWithLangauge:(id)a3 task:(id)a4 samplingRate:(unint64_t)a5 userProfileData:(id)a6 resultStream:(shared_ptr<quasar::RecogResultStreamBase>)a7
{
  _QWORD *v7;
  _EARRecognitionMetrics *v11;
  __shared_weak_count *cntrl;
  unint64_t *v13;
  unint64_t v14;
  _EARRecognitionMetrics *v15;
  _EARRecognitionMetrics *recognitionMetrics;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  uint64_t *v20;
  std::__shared_weak_count *v21;
  std::string::size_type v22;
  unint64_t *p_shared_owners;
  unint64_t v24;
  std::__shared_weak_count *v25;
  unint64_t *v26;
  unint64_t v27;
  std::__shared_weak_count *v28;
  unint64_t *v29;
  unint64_t v30;
  EARHelpers *jitProfileData;
  uint64_t *v32;
  std::__shared_weak_count *v33;
  std::string::size_type v34;
  unint64_t *v35;
  unint64_t v36;
  std::__shared_weak_count *v37;
  unint64_t *v38;
  unint64_t v39;
  std::__shared_weak_count *v40;
  unint64_t *v41;
  unint64_t v42;
  _EARSpeechRecognizer *v43;
  NSArray *v44;
  NSArray *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t i;
  id v49;
  void *v50;
  std::vector<std::string>::pointer end;
  __int128 v52;
  unint64_t v53;
  unint64_t v54;
  unint64_t v55;
  std::string *v56;
  std::string *v57;
  __int128 v58;
  std::string *v59;
  uint64_t v60;
  std::string::size_type v61;
  std::string::size_type v62;
  NSNumber *overrideDoServerSideEndpointing;
  double endpointStart;
  NSArray *v65;
  NSArray *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  id v70;
  void *v71;
  std::vector<std::wstring>::pointer v72;
  __int128 v73;
  unint64_t v74;
  unint64_t v75;
  unint64_t v76;
  std::string *v77;
  std::string *v78;
  __int128 v79;
  std::wstring *v80;
  NSArray *v81;
  NSArray *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t k;
  id v86;
  void *v87;
  std::vector<std::string>::pointer v88;
  __int128 v89;
  unint64_t v90;
  unint64_t v91;
  unint64_t v92;
  std::string *v93;
  std::string *v94;
  __int128 v95;
  std::string *v96;
  NSString *inputOrigin;
  NSArray *v98;
  NSArray *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t m;
  id v103;
  void *v104;
  uint64_t v105;
  uint64_t v106;
  unint64_t v107;
  uint64_t v108;
  unint64_t v109;
  char *v110;
  uint64_t v111;
  int64x2_t *v112;
  _QWORD *v113;
  _QWORD *v114;
  char *v115;
  __int128 v116;
  int64x2_t v117;
  int64x2_t *v118;
  std::string *v119;
  unint64_t *v120;
  unint64_t v121;
  NSArray *v122;
  NSArray *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t n;
  id v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  unint64_t v131;
  uint64_t v132;
  unint64_t v133;
  char *v134;
  uint64_t v135;
  char *v136;
  _QWORD *v137;
  _QWORD *v138;
  char *v139;
  __int128 v140;
  int64x2_t v141;
  _OWORD *v142;
  std::string *v143;
  unint64_t *v144;
  unint64_t v145;
  void *v146;
  ResultStreamWrapper *v147;
  std::__shared_weak_count *v148;
  unint64_t *v149;
  unint64_t v150;
  char hasInterUtteranceLeftContext;
  unint64_t *v152;
  unint64_t v153;
  NSSet *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t ii;
  void *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  NSString *userId;
  uint64_t v167;
  NSString *sessionId;
  uint64_t v169;
  uint64_t TimeOutMs;
  uint64_t v171;
  uint64_t v172;
  NSString *deviceId;
  uint64_t v174;
  NSString *refTranscriptForErrorBlaming;
  uint64_t v176;
  uint64_t v177;
  NSString *bluetoothDeviceId;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t started;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  __shared_weak_count *v200;
  unint64_t *v201;
  unint64_t v202;
  std::string *active;
  NSString *aneContext;
  std::string *v205;
  NSString *cpuContext;
  std::string *v207;
  NSString *gpuContext;
  std::string *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t VoiceCommandCandidates;
  std::__shared_weak_count *v213;
  unint64_t *v214;
  unint64_t v215;
  uint64_t v216;
  unint64_t *v217;
  unint64_t v218;
  SpeakerCodeTraining *v219;
  _BOOL4 isTaskSupported;
  _BOOL4 v221;
  quasar::RunAsyncParams *v222;
  std::__shared_weak_count *size;
  unint64_t *v224;
  unint64_t v225;
  _EARSpeakerCodeInfo *speakerCodeInfo;
  void *v227;
  std::__shared_weak_count *v228;
  unint64_t *v229;
  unint64_t v230;
  _EARSpeakerCodeInfo *v231;
  void *v232;
  unint64_t *v233;
  unint64_t v234;
  uint64_t v235;
  unint64_t *v236;
  unint64_t v237;
  std::__shared_weak_count *v238;
  unint64_t *v239;
  unint64_t v240;
  std::__shared_weak_count *v241;
  unint64_t *v242;
  unint64_t v243;
  std::__shared_weak_count *v244;
  unint64_t *v245;
  unint64_t v246;
  RecogAudioBufferBase *v247;
  __shared_weak_count *v248;
  _BOOL4 enableSpeakerCodeTraining;
  _BOOL4 scoreNbest;
  _BOOL4 highPriority;
  _BOOL4 recognizeEagerCandidates;
  _BOOL4 farField;
  char detectUtterances;
  _QWORD *v255;
  id obj;
  id v257;
  RecogResultStreamBase *var0;
  id v260;
  EARHelpers *v261;
  _QWORD v262[7];
  std::__shared_weak_count *v263;
  std::string v264;
  std::string v265;
  std::string v266;
  VoiceCommandActiveSetCompilation *v267;
  __shared_weak_count *v268;
  std::string v269;
  std::string v270;
  std::string v271;
  std::string v272;
  std::string v273;
  uint64_t v274;
  quasar::RunAsyncParams *v275;
  std::__shared_weak_count *v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
  int64x2_t v281;
  _QWORD v282[2];
  int64x2_t v283;
  _QWORD v284[2];
  std::string v285;
  uint64_t v286;
  std::vector<std::string> v287;
  std::vector<std::wstring> v288;
  uint64_t *v289;
  std::__shared_weak_count *v290;
  uint64_t *v291;
  std::__shared_weak_count *v292;
  void *v293[3];
  char *v294[3];
  SpeechRecognizer *ptr;
  __shared_weak_count *v296;
  std::string __p;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  std::__split_buffer<std::string> __v;
  _BYTE v303[128];
  std::string v304;
  __n128 (*v305)(__n128 *, __n128 *);
  uint64_t (*v306)(uint64_t);
  void *v307;
  uint64_t v308;
  std::__shared_weak_count *v309;
  uint64_t v310;
  shared_ptr<quasar::RecogAudioBufferBase> result;

  var0 = a7.var0;
  v255 = v7;
  v310 = *MEMORY[0x1E0C80C00];
  v257 = a3;
  v260 = a4;
  v261 = (EARHelpers *)a6;
  v11 = [_EARRecognitionMetrics alloc];
  cntrl = self->_recognizer.__cntrl_;
  ptr = self->_recognizer.__ptr_;
  v296 = cntrl;
  if (cntrl)
  {
    v13 = (unint64_t *)((char *)cntrl + 8);
    do
      v14 = __ldxr(v13);
    while (__stxr(v14 + 1, v13));
  }
  obj = a4;
  v15 = -[_EARRecognitionMetrics initWithRecognizer:](v11, "initWithRecognizer:", &ptr);
  recognitionMetrics = self->_recognitionMetrics;
  self->_recognitionMetrics = v15;

  v17 = (std::__shared_weak_count *)v296;
  if (v296)
  {
    v18 = (unint64_t *)((char *)v296 + 8);
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  quasar::LmeDataStreams::LmeDataStreams((quasar::LmeDataStreams *)v293);
  if (v261)
  {
    EARHelpers::createNSDataInputStream(v261, (EARHelpers::NSDataInputStream **)&v304);
    v20 = (uint64_t *)v304.__r_.__value_.__r.__words[0];
    *(_QWORD *)&v298 = v304.__r_.__value_.__r.__words[0];
    if (v304.__r_.__value_.__r.__words[0])
    {
      v21 = (std::__shared_weak_count *)operator new();
      v22 = v304.__r_.__value_.__r.__words[0];
      v21->__shared_owners_ = 0;
      p_shared_owners = (unint64_t *)&v21->__shared_owners_;
      v21->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E5D46658;
      v21->__shared_weak_owners_ = 0;
      v21[1].__vftable = (std::__shared_weak_count_vtbl *)v22;
      *((_QWORD *)&v298 + 1) = v21;
      v291 = v20;
      v292 = v21;
      do
        v24 = __ldxr(p_shared_owners);
      while (__stxr(v24 + 1, p_shared_owners));
    }
    else
    {
      v298 = 0uLL;
      v291 = 0;
      v292 = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(&v304, "");
    quasar::LmeDataStreams::addLmeStream((uint64_t)v293, 0, &v291, (__int128 *)&v304);
    if (SHIBYTE(v304.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v304.__r_.__value_.__l.__data_);
    v25 = v292;
    if (v292)
    {
      v26 = (unint64_t *)&v292->__shared_owners_;
      do
        v27 = __ldaxr(v26);
      while (__stlxr(v27 - 1, v26));
      if (!v27)
      {
        ((void (*)(std::__shared_weak_count *))v25->__on_zero_shared)(v25);
        std::__shared_weak_count::__release_weak(v25);
      }
    }
    v28 = (std::__shared_weak_count *)*((_QWORD *)&v298 + 1);
    if (*((_QWORD *)&v298 + 1))
    {
      v29 = (unint64_t *)(*((_QWORD *)&v298 + 1) + 8);
      do
        v30 = __ldaxr(v29);
      while (__stlxr(v30 - 1, v29));
      if (!v30)
      {
        ((void (*)(std::__shared_weak_count *))v28->__on_zero_shared)(v28);
        std::__shared_weak_count::__release_weak(v28);
      }
    }
  }
  addAotLmeStreams((uint64_t)v293, self->_userProfiles, self->_muxIdMask);
  jitProfileData = (EARHelpers *)self->_jitProfileData;
  if (jitProfileData)
  {
    EARHelpers::createNSDataInputStream(jitProfileData, (EARHelpers::NSDataInputStream **)&v304);
    v32 = (uint64_t *)v304.__r_.__value_.__r.__words[0];
    *(_QWORD *)&v298 = v304.__r_.__value_.__r.__words[0];
    if (v304.__r_.__value_.__r.__words[0])
    {
      v33 = (std::__shared_weak_count *)operator new();
      v34 = v304.__r_.__value_.__r.__words[0];
      v33->__shared_owners_ = 0;
      v35 = (unint64_t *)&v33->__shared_owners_;
      v33->__vftable = (std::__shared_weak_count_vtbl *)&unk_1E5D46658;
      v33->__shared_weak_owners_ = 0;
      v33[1].__vftable = (std::__shared_weak_count_vtbl *)v34;
      *((_QWORD *)&v298 + 1) = v33;
      v289 = v32;
      v290 = v33;
      do
        v36 = __ldxr(v35);
      while (__stxr(v36 + 1, v35));
    }
    else
    {
      v298 = 0uLL;
      v289 = 0;
      v290 = 0;
    }
    std::string::basic_string[abi:ne180100]<0>(&v304, "");
    quasar::LmeDataStreams::addLmeStream((uint64_t)v293, 1, &v289, (__int128 *)&v304);
    if (SHIBYTE(v304.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v304.__r_.__value_.__l.__data_);
    v37 = v290;
    if (v290)
    {
      v38 = (unint64_t *)&v290->__shared_owners_;
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
        std::__shared_weak_count::__release_weak(v37);
      }
    }
    v40 = (std::__shared_weak_count *)*((_QWORD *)&v298 + 1);
    if (*((_QWORD *)&v298 + 1))
    {
      v41 = (unint64_t *)(*((_QWORD *)&v298 + 1) + 8);
      do
        v42 = __ldaxr(v41);
      while (__stlxr(v42 - 1, v41));
      if (!v42)
      {
        ((void (*)(std::__shared_weak_count *))v40->__on_zero_shared)(v40);
        std::__shared_weak_count::__release_weak(v40);
      }
    }
  }
  v43 = self;
  if (self->_enableVoiceCommands)
  {
    memset(&v288, 0, sizeof(v288));
    v44 = self->_onScreenContextForEditLme;
    memset(&v287, 0, sizeof(v287));
    v298 = 0u;
    v299 = 0u;
    v300 = 0u;
    v301 = 0u;
    v45 = v44;
    v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v298, &v304, 16);
    if (v46)
    {
      v47 = *(_QWORD *)v299;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v299 != v47)
            objc_enumerationMutation(v45);
          v49 = *(id *)(*((_QWORD *)&v298 + 1) + 8 * i);
          v50 = v49;
          if (v49)
            objc_msgSend(v49, "ear_toString");
          else
            memset(&__p, 0, sizeof(__p));

          end = v287.__end_;
          if (v287.__end_ >= v287.__end_cap_.__value_)
          {
            v53 = 0xAAAAAAAAAAAAAAABLL * (((char *)v287.__end_ - (char *)v287.__begin_) >> 3);
            v54 = v53 + 1;
            if (v53 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * (((char *)v287.__end_cap_.__value_ - (char *)v287.__begin_) >> 3) > v54)
              v54 = 0x5555555555555556 * (((char *)v287.__end_cap_.__value_ - (char *)v287.__begin_) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v287.__end_cap_.__value_ - (char *)v287.__begin_) >> 3) >= 0x555555555555555)
              v55 = 0xAAAAAAAAAAAAAAALL;
            else
              v55 = v54;
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v287.__end_cap_;
            if (v55)
              v56 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v287.__end_cap_, v55);
            else
              v56 = 0;
            v57 = v56 + v53;
            __v.__first_ = v56;
            __v.__begin_ = v57;
            __v.__end_cap_.__value_ = &v56[v55];
            v58 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v57->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
            *(_OWORD *)&v57->__r_.__value_.__l.__data_ = v58;
            memset(&__p, 0, sizeof(__p));
            __v.__end_ = v57 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v287, &__v);
            v59 = v287.__end_;
            std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
            v287.__end_ = v59;
            self = v43;
            if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
              operator delete(__p.__r_.__value_.__l.__data_);
          }
          else
          {
            v52 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
            v287.__end_->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v52;
            v287.__end_ = end + 1;
          }

        }
        v46 = -[NSArray countByEnumeratingWithState:objects:count:](v45, "countByEnumeratingWithState:objects:count:", &v298, &v304, 16);
      }
      while (v46);
    }

    std::vector<std::string>::__vdeallocate(&v288);
    v288 = (std::vector<std::wstring>)v287;
    memset(&v287, 0, sizeof(v287));
    v304.__r_.__value_.__r.__words[0] = (std::string::size_type)&v287;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v304);
    quasar::SpeechRecognizer::buildEditLmeWithLeftContext((quasar::SpeechRecognizer *)self->_recognizer.__ptr_, (uint64_t)v293, (__int128 **)&v288);
    v304.__r_.__value_.__r.__words[0] = (std::string::size_type)&v288;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v304);
  }
  v60 = operator new();
  *(_QWORD *)(v60 + 16) = 0;
  *(_QWORD *)(v60 + 24) = 850045863;
  *(_OWORD *)(v60 + 32) = 0u;
  *(_OWORD *)(v60 + 48) = 0u;
  *(_OWORD *)(v60 + 64) = 0u;
  *(_QWORD *)(v60 + 80) = 0;
  *(_QWORD *)(v60 + 88) = 1018212795;
  *(_OWORD *)(v60 + 96) = 0u;
  *(_OWORD *)(v60 + 112) = 0u;
  *(_OWORD *)(v60 + 124) = 0u;
  *(_QWORD *)v60 = &off_1E5D40300;
  *(_QWORD *)(v60 + 8) = 0;
  v286 = v60;
  quasar::Location::makeAny((quasar::Location *)v60, self->_latitude, self->_longitude);
  v304.__r_.__value_.__r.__words[0] = v61;
  v304.__r_.__value_.__l.__size_ = v62;
  if (!v286)
    std::__throw_future_error[abi:ne180100](3u);
  std::__assoc_state<quasar::Location>::set_value<quasar::Location>(v286, &v304);
  overrideDoServerSideEndpointing = self->_overrideDoServerSideEndpointing;
  if (overrideDoServerSideEndpointing)
    detectUtterances = -[NSNumber BOOLValue](overrideDoServerSideEndpointing, "BOOLValue");
  else
    detectUtterances = self->_detectUtterances;
  endpointStart = self->_endpointStart;
  recognizeEagerCandidates = self->_recognizeEagerCandidates;
  farField = self->_farField;
  scoreNbest = self->_scoreNbest;
  highPriority = self->_highPriority;
  enableSpeakerCodeTraining = self->_enableSpeakerCodeTraining;
  v65 = self->_leftContext;
  memset(&v288, 0, sizeof(v288));
  v298 = 0u;
  v299 = 0u;
  v300 = 0u;
  v301 = 0u;
  v66 = v65;
  v67 = -[NSArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v298, &v304, 16);
  if (v67)
  {
    v68 = *(_QWORD *)v299;
    do
    {
      for (j = 0; j != v67; ++j)
      {
        if (*(_QWORD *)v299 != v68)
          objc_enumerationMutation(v66);
        v70 = *(id *)(*((_QWORD *)&v298 + 1) + 8 * j);
        v71 = v70;
        if (v70)
          objc_msgSend(v70, "ear_toString");
        else
          memset(&__p, 0, sizeof(__p));

        v72 = v288.__end_;
        if (v288.__end_ >= v288.__end_cap_.__value_)
        {
          v74 = 0xAAAAAAAAAAAAAAABLL * (((char *)v288.__end_ - (char *)v288.__begin_) >> 3);
          v75 = v74 + 1;
          if (v74 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v288.__end_cap_.__value_ - (char *)v288.__begin_) >> 3) > v75)
            v75 = 0x5555555555555556 * (((char *)v288.__end_cap_.__value_ - (char *)v288.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v288.__end_cap_.__value_ - (char *)v288.__begin_) >> 3) >= 0x555555555555555)
            v76 = 0xAAAAAAAAAAAAAAALL;
          else
            v76 = v75;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v288.__end_cap_;
          if (v76)
            v77 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v288.__end_cap_, v76);
          else
            v77 = 0;
          v78 = v77 + v74;
          __v.__first_ = v77;
          __v.__begin_ = v78;
          __v.__end_cap_.__value_ = &v77[v76];
          v79 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v78->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v78->__r_.__value_.__l.__data_ = v79;
          memset(&__p, 0, sizeof(__p));
          __v.__end_ = v78 + 1;
          std::vector<std::string>::__swap_out_circular_buffer((std::vector<std::string> *)&v288, &__v);
          v80 = v288.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v288.__end_ = v80;
          self = v43;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }
        else
        {
          v73 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v288.__end_->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v72->__r_.__value_.__l.__data_ = v73;
          v288.__end_ = v72 + 1;
        }

      }
      v67 = -[NSArray countByEnumeratingWithState:objects:count:](v66, "countByEnumeratingWithState:objects:count:", &v298, &v304, 16);
    }
    while (v67);
  }

  v81 = self->_leftContextForItn;
  memset(&v287, 0, sizeof(v287));
  v298 = 0u;
  v299 = 0u;
  v300 = 0u;
  v301 = 0u;
  v82 = v81;
  v83 = -[NSArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v298, &v304, 16);
  if (v83)
  {
    v84 = *(_QWORD *)v299;
    do
    {
      for (k = 0; k != v83; ++k)
      {
        if (*(_QWORD *)v299 != v84)
          objc_enumerationMutation(v82);
        v86 = *(id *)(*((_QWORD *)&v298 + 1) + 8 * k);
        v87 = v86;
        if (v86)
          objc_msgSend(v86, "ear_toString");
        else
          memset(&__p, 0, sizeof(__p));

        v88 = v287.__end_;
        if (v287.__end_ >= v287.__end_cap_.__value_)
        {
          v90 = 0xAAAAAAAAAAAAAAABLL * (((char *)v287.__end_ - (char *)v287.__begin_) >> 3);
          v91 = v90 + 1;
          if (v90 + 1 > 0xAAAAAAAAAAAAAAALL)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          if (0x5555555555555556 * (((char *)v287.__end_cap_.__value_ - (char *)v287.__begin_) >> 3) > v91)
            v91 = 0x5555555555555556 * (((char *)v287.__end_cap_.__value_ - (char *)v287.__begin_) >> 3);
          if (0xAAAAAAAAAAAAAAABLL * (((char *)v287.__end_cap_.__value_ - (char *)v287.__begin_) >> 3) >= 0x555555555555555)
            v92 = 0xAAAAAAAAAAAAAAALL;
          else
            v92 = v91;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v287.__end_cap_;
          if (v92)
            v93 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v287.__end_cap_, v92);
          else
            v93 = 0;
          v94 = v93 + v90;
          __v.__first_ = v93;
          __v.__begin_ = v94;
          __v.__end_cap_.__value_ = &v93[v92];
          v95 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v94->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v94->__r_.__value_.__l.__data_ = v95;
          memset(&__p, 0, sizeof(__p));
          __v.__end_ = v94 + 1;
          std::vector<std::string>::__swap_out_circular_buffer(&v287, &__v);
          v96 = v287.__end_;
          std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
          v287.__end_ = v96;
          self = v43;
          if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
            operator delete(__p.__r_.__value_.__l.__data_);
        }
        else
        {
          v89 = *(_OWORD *)&__p.__r_.__value_.__l.__data_;
          v287.__end_->__r_.__value_.__r.__words[2] = __p.__r_.__value_.__r.__words[2];
          *(_OWORD *)&v88->__r_.__value_.__l.__data_ = v89;
          v287.__end_ = v88 + 1;
        }

      }
      v83 = -[NSArray countByEnumeratingWithState:objects:count:](v82, "countByEnumeratingWithState:objects:count:", &v298, &v304, 16);
    }
    while (v83);
  }

  inputOrigin = self->_inputOrigin;
  if (inputOrigin)
    -[NSString ear_toString](inputOrigin, "ear_toString");
  else
    memset(&__p, 0, sizeof(__p));
  std::string::basic_string[abi:ne180100]<0>(&v285, "");
  v98 = self->_extraLmList;
  v284[0] = 0;
  v283 = 0uLL;
  v298 = 0u;
  v299 = 0u;
  v300 = 0u;
  v301 = 0u;
  v99 = v98;
  v100 = -[NSArray countByEnumeratingWithState:objects:count:](v99, "countByEnumeratingWithState:objects:count:", &v298, &v304, 16);
  if (v100)
  {
    v101 = *(_QWORD *)v299;
    do
    {
      for (m = 0; m != v100; ++m)
      {
        if (*(_QWORD *)v299 != v101)
          objc_enumerationMutation(v99);
        v103 = *(id *)(*((_QWORD *)&v298 + 1) + 8 * m);
        v104 = v103;
        if (v103)
          objc_msgSend(v103, "handle");
        else
          v281 = 0uLL;

        v105 = v283.i64[1];
        if (v283.i64[1] >= v284[0])
        {
          v106 = (v283.i64[1] - v283.i64[0]) >> 4;
          v107 = v106 + 1;
          if ((unint64_t)(v106 + 1) >> 60)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v108 = v284[0] - v283.i64[0];
          if ((v284[0] - v283.i64[0]) >> 3 > v107)
            v107 = v108 >> 3;
          if ((unint64_t)v108 >= 0x7FFFFFFFFFFFFFF0)
            v109 = 0xFFFFFFFFFFFFFFFLL;
          else
            v109 = v107;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)v284;
          v110 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,unsigned long>>>((uint64_t)v284, v109);
          v112 = (int64x2_t *)&v110[16 * v106];
          *v112 = v281;
          v281 = 0uLL;
          v113 = (_QWORD *)v283.i64[1];
          v114 = (_QWORD *)v283.i64[0];
          if (v283.i64[1] == v283.i64[0])
          {
            v117 = vdupq_n_s64(v283.u64[1]);
            v115 = &v110[16 * v106];
          }
          else
          {
            v115 = &v110[16 * v106];
            do
            {
              v116 = *((_OWORD *)v113 - 1);
              v113 -= 2;
              *((_OWORD *)v115 - 1) = v116;
              v115 -= 16;
              *v113 = 0;
              v113[1] = 0;
            }
            while (v113 != v114);
            v117 = v283;
          }
          v118 = v112 + 1;
          v283.i64[0] = (uint64_t)v115;
          *(int64x2_t *)&__v.__begin_ = v117;
          v119 = (std::string *)v284[0];
          v284[0] = &v110[16 * v111];
          __v.__end_cap_.__value_ = v119;
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v117.i64[0];
          std::__split_buffer<std::shared_ptr<quasar::FeatureExtractor>>::~__split_buffer((uint64_t)&__v);
          v283.i64[1] = (uint64_t)v118;
          self = v43;
          if (v281.i64[1])
          {
            v120 = (unint64_t *)(v281.i64[1] + 8);
            do
              v121 = __ldaxr(v120);
            while (__stlxr(v121 - 1, v120));
            if (!v121)
            {
              (*(void (**)(uint64_t))(*(_QWORD *)v281.i64[1] + 16))(v281.i64[1]);
              std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v281.i64[1]);
            }
          }
        }
        else
        {
          *(int64x2_t *)v283.i64[1] = v281;
          v283.i64[1] = v105 + 16;
        }

      }
      v100 = -[NSArray countByEnumeratingWithState:objects:count:](v99, "countByEnumeratingWithState:objects:count:", &v298, &v304, 16);
    }
    while (v100);
  }

  v122 = self->_scoreNbestExtraLmList;
  v282[0] = 0;
  v281 = 0uLL;
  v298 = 0u;
  v299 = 0u;
  v300 = 0u;
  v301 = 0u;
  v123 = v122;
  v124 = -[NSArray countByEnumeratingWithState:objects:count:](v123, "countByEnumeratingWithState:objects:count:", &v298, &v304, 16);
  if (v124)
  {
    v125 = *(_QWORD *)v299;
    do
    {
      for (n = 0; n != v124; ++n)
      {
        if (*(_QWORD *)v299 != v125)
          objc_enumerationMutation(v123);
        v127 = *(id *)(*((_QWORD *)&v298 + 1) + 8 * n);
        v128 = v127;
        if (v127)
          objc_msgSend(v127, "handle");
        else
          *(_OWORD *)&v273.__r_.__value_.__l.__data_ = 0uLL;

        v129 = v281.i64[1];
        if (v281.i64[1] >= v282[0])
        {
          v130 = (v281.i64[1] - v281.i64[0]) >> 4;
          v131 = v130 + 1;
          if ((unint64_t)(v130 + 1) >> 60)
            std::vector<int>::__throw_length_error[abi:ne180100]();
          v132 = v282[0] - v281.i64[0];
          if ((v282[0] - v281.i64[0]) >> 3 > v131)
            v131 = v132 >> 3;
          if ((unint64_t)v132 >= 0x7FFFFFFFFFFFFFF0)
            v133 = 0xFFFFFFFFFFFFFFFLL;
          else
            v133 = v131;
          __v.__end_cap_.__value_ = (std::allocator<std::string> *)v282;
          v134 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::pair<int,unsigned long>>>((uint64_t)v282, v133);
          v136 = &v134[16 * v130];
          *(_OWORD *)v136 = *(_OWORD *)&v273.__r_.__value_.__l.__data_;
          *(_OWORD *)&v273.__r_.__value_.__l.__data_ = 0uLL;
          v137 = (_QWORD *)v281.i64[1];
          v138 = (_QWORD *)v281.i64[0];
          if (v281.i64[1] == v281.i64[0])
          {
            v141 = vdupq_n_s64(v281.u64[1]);
            v139 = &v134[16 * v130];
          }
          else
          {
            v139 = &v134[16 * v130];
            do
            {
              v140 = *((_OWORD *)v137 - 1);
              v137 -= 2;
              *((_OWORD *)v139 - 1) = v140;
              v139 -= 16;
              *v137 = 0;
              v137[1] = 0;
            }
            while (v137 != v138);
            v141 = v281;
          }
          v142 = v136 + 16;
          v281.i64[0] = (uint64_t)v139;
          *(int64x2_t *)&__v.__begin_ = v141;
          v143 = (std::string *)v282[0];
          v282[0] = &v134[16 * v135];
          __v.__end_cap_.__value_ = v143;
          __v.__first_ = (std::__split_buffer<std::string>::pointer)v141.i64[0];
          std::__split_buffer<std::shared_ptr<quasar::FeatureExtractor>>::~__split_buffer((uint64_t)&__v);
          v281.i64[1] = (uint64_t)v142;
          self = v43;
          if (v273.__r_.__value_.__l.__size_)
          {
            v144 = (unint64_t *)(v273.__r_.__value_.__l.__size_ + 8);
            do
              v145 = __ldaxr(v144);
            while (__stlxr(v145 - 1, v144));
            if (!v145)
            {
              (*(void (**)(std::string::size_type))(*(_QWORD *)v273.__r_.__value_.__l.__size_ + 16))(v273.__r_.__value_.__l.__size_);
              std::__shared_weak_count::__release_weak((std::__shared_weak_count *)v273.__r_.__value_.__l.__size_);
            }
          }
        }
        else
        {
          *(_OWORD *)v281.i64[1] = *(_OWORD *)&v273.__r_.__value_.__l.__data_;
          v281.i64[1] = v129 + 16;
        }

      }
      v124 = -[NSArray countByEnumeratingWithState:objects:count:](v123, "countByEnumeratingWithState:objects:count:", &v298, &v304, 16);
    }
    while (v124);
  }

  (*(void (**)(SpeechRecognizer *))(*(_QWORD *)self->_recognizer.__ptr_ + 40))(self->_recognizer.__ptr_);
  objc_msgSend(v257, "stringByReplacingOccurrencesOfString:withString:", CFSTR("-"), CFSTR("_"));
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  objc_storeStrong((id *)&self->_currentLanguage, v146);
  objc_storeStrong((id *)&self->_currentTask, obj);
  self->_currentSamplingRate = a5;
  if (-[_EARSpeechRecognizer isContinuousListening](self, "isContinuousListening")
    && *(_QWORD *)var0
  {
    v148 = (std::__shared_weak_count *)*((_QWORD *)var0 + 1);
    v304.__r_.__value_.__r.__words[0] = (std::string::size_type)v147;
    v304.__r_.__value_.__l.__size_ = (std::string::size_type)v148;
    if (v148)
    {
      v149 = (unint64_t *)&v148->__shared_owners_;
      do
        v150 = __ldxr(v149);
      while (__stxr(v150 + 1, v149));
    }
    hasInterUtteranceLeftContext = ResultStreamWrapper::hasInterUtteranceLeftContext(v147);
    if (v148)
    {
      v152 = (unint64_t *)&v148->__shared_owners_;
      do
        v153 = __ldaxr(v152);
      while (__stlxr(v153 - 1, v152));
      if (!v153)
      {
        ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
        std::__shared_weak_count::__release_weak(v148);
      }
    }
  }
  else
  {
    hasInterUtteranceLeftContext = 0;
  }
  *(_QWORD *)&v299 = 0;
  *((_QWORD *)&v298 + 1) = 0;
  *(_QWORD *)&v298 = (char *)&v298 + 8;
  v277 = 0u;
  v278 = 0u;
  v279 = 0u;
  v280 = 0u;
  v154 = self->_muxIds;
  v155 = -[NSSet countByEnumeratingWithState:objects:count:](v154, "countByEnumeratingWithState:objects:count:", &v277, v303, 16);
  if (v155)
  {
    v156 = *(_QWORD *)v278;
    do
    {
      for (ii = 0; ii != v155; ++ii)
      {
        if (*(_QWORD *)v278 != v156)
          objc_enumerationMutation(v154);
        v158 = *(void **)(*((_QWORD *)&v277 + 1) + 8 * ii);
        if (v158)
          objc_msgSend(v158, "ear_toString");
        else
          memset(&v304, 0, sizeof(v304));
        std::__tree<std::string>::__emplace_unique_key_args<std::string,std::string>((uint64_t **)&v298, (const void **)&v304.__r_.__value_.__l.__data_, (uint64_t)&v304);
        if (SHIBYTE(v304.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v304.__r_.__value_.__l.__data_);
      }
      v155 = -[NSSet countByEnumeratingWithState:objects:count:](v154, "countByEnumeratingWithState:objects:count:", &v277, v303, 16);
    }
    while (v155);
  }

  if ((_QWORD)v299 && -[_EARSpeechRecognizer isContinuousListening](self, "isContinuousListening"))
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Continuous Listening should not be used with Mux"));
  std::allocate_shared[abi:ne180100]<quasar::RunAsyncParams,std::allocator<quasar::RunAsyncParams>,std::shared_ptr<quasar::RecogResultStreamBase> &,void>(&v275);
  v159 = quasar::RunAsyncParams::setLmeDataStreams((uint64_t)v275, (uint64_t)v293);
  v160 = v286;
  if (!v286)
    std::__throw_future_error[abi:ne180100](3u);
  v161 = v159;
  std::__assoc_sub_state::__attach_future[abi:ne180100](v286);
  v274 = v160;
  v162 = quasar::RunAsyncParams::setLocation(v161, &v274);
  v163 = quasar::RunAsyncParams::setSamplingRate(v162, a5);
  if (v146)
    objc_msgSend(v146, "ear_toString");
  else
    memset(&v304, 0, sizeof(v304));
  v164 = quasar::RunAsyncParams::setLanguage(v163, &v304);
  if (v260)
    objc_msgSend(v260, "ear_toString");
  else
    memset(&__v, 0, 24);
  v165 = quasar::RunAsyncParams::setTaskType(v164, (const std::string *)&__v);
  userId = self->_userId;
  if (userId)
    -[NSString ear_toString](userId, "ear_toString");
  else
    memset(&v273, 0, sizeof(v273));
  v167 = quasar::RunAsyncParams::setUserId(v165, &v273);
  sessionId = self->_sessionId;
  if (sessionId)
    -[NSString ear_toString](sessionId, "ear_toString");
  else
    memset(&v272, 0, sizeof(v272));
  v169 = quasar::RunAsyncParams::setSessionId(v167, &v272);
  TimeOutMs = quasar::RunAsyncParams::setBufferReadTimeOutMs(v169, 0);
  v171 = quasar::RunAsyncParams::setDoServerSideEndPointing(TimeOutMs, detectUtterances);
  v172 = quasar::RunAsyncParams::setEnableNnetEndpointing(v171, 1);
  deviceId = self->_deviceId;
  if (deviceId)
    -[NSString ear_toString](deviceId, "ear_toString");
  else
    memset(&v271, 0, sizeof(v271));
  v174 = quasar::RunAsyncParams::setDeviceId(v172, &v271);
  refTranscriptForErrorBlaming = self->_refTranscriptForErrorBlaming;
  if (refTranscriptForErrorBlaming)
    -[NSString ear_toString](refTranscriptForErrorBlaming, "ear_toString");
  else
    memset(&v270, 0, sizeof(v270));
  v176 = quasar::RunAsyncParams::setRefTranscription(v174, &v270);
  v177 = quasar::RunAsyncParams::setFarField(v176, farField);
  bluetoothDeviceId = self->_bluetoothDeviceId;
  if (bluetoothDeviceId)
    -[NSString ear_toString](bluetoothDeviceId, "ear_toString");
  else
    memset(&v269, 0, sizeof(v269));
  v179 = quasar::RunAsyncParams::setBluetoothDeviceId(v177, &v269);
  v180 = quasar::RunAsyncParams::setEnableWhisperDetection(v179, 0);
  v181 = quasar::RunAsyncParams::setUtteranceDetection(v180, self->_detectUtterances);
  v182 = quasar::RunAsyncParams::setUtteranceConcatenation(v181, self->_concatenateUtterances);
  v183 = quasar::RunAsyncParams::setEnableEndPointCandidate(v182, 0);
  started = quasar::RunAsyncParams::setEndpointStartMs(v183, (uint64_t)(endpointStart * 1000.0));
  v185 = quasar::RunAsyncParams::setEager(started, recognizeEagerCandidates);
  v186 = quasar::RunAsyncParams::setEpExtraDelay(v185, 0);
  v187 = quasar::RunAsyncParams::setLeftContext(v186, (uint64_t)&v288);
  v188 = quasar::RunAsyncParams::setInputOrigin(v187, &__p);
  v189 = quasar::RunAsyncParams::setRegionId(v188, &v285);
  v190 = quasar::RunAsyncParams::setHighPriority(v189, highPriority);
  v191 = quasar::RunAsyncParams::setExtraLmList(v190, (uint64_t **)&v283);
  v192 = quasar::RunAsyncParams::setScoreNbestExtraLmList(v191, (uint64_t **)&v281);
  v193 = quasar::RunAsyncParams::setScoreNbest(v192, scoreNbest);
  v194 = quasar::RunAsyncParams::setDisableAudioAnalyticsReporting(v193, -[_EARSpeechRecognizer isContinuousListening](self, "isContinuousListening"));
  v195 = quasar::RunAsyncParams::setInterUtteranceLeftContext(v194, hasInterUtteranceLeftContext);
  v196 = quasar::RunAsyncParams::setMuxIds(v195, &v298);
  v197 = quasar::RunAsyncParams::setLeftContextForItn(v196, (uint64_t)&v287);
  v198 = quasar::RunAsyncParams::setRightContextForItn(v197, (uint64_t)&self->_rightContextTokens);
  v199 = quasar::RunAsyncParams::setEnableVoiceCommands(v198, -[_EARSpeechRecognizer enableVoiceCommands](self, "enableVoiceCommands"));
  v200 = self->_voiceCommandCompilation.__cntrl_;
  v267 = self->_voiceCommandCompilation.__ptr_;
  v268 = v200;
  if (v200)
  {
    v201 = (unint64_t *)((char *)v200 + 8);
    do
      v202 = __ldxr(v201);
    while (__stxr(v202 + 1, v201));
  }
  active = (std::string *)quasar::RunAsyncParams::setVoiceCommandActiveSetCompilation(v199, (uint64_t *)&v267);
  aneContext = self->_aneContext;
  if (aneContext)
    -[NSString ear_toString](aneContext, "ear_toString");
  else
    memset(&v266, 0, sizeof(v266));
  v205 = quasar::RunAsyncParams::setAneContext(active, &v266);
  cpuContext = self->_cpuContext;
  if (cpuContext)
    -[NSString ear_toString](cpuContext, "ear_toString");
  else
    memset(&v265, 0, sizeof(v265));
  v207 = quasar::RunAsyncParams::setCpuContext(v205, &v265);
  gpuContext = self->_gpuContext;
  if (gpuContext)
    -[NSString ear_toString](gpuContext, "ear_toString");
  else
    memset(&v264, 0, sizeof(v264));
  v209 = quasar::RunAsyncParams::setGpuContext(v207, &v264);
  v210 = quasar::RunAsyncParams::setAtypicalSpeech((uint64_t)v209, self->_atypicalSpeech);
  v211 = quasar::RunAsyncParams::setDisableContextualBiasing(v210, self->_disableContextualBiasing);
  VoiceCommandCandidates = quasar::RunAsyncParams::setShouldGenerateVoiceCommandCandidates(v211, -[_EARSpeechRecognizer shouldGenerateVoiceCommandCandidates](self, "shouldGenerateVoiceCommandCandidates"));
  quasar::RunAsyncParams::setIsLegacyVoiceCommandRequest(VoiceCommandCandidates, -[_EARSpeechRecognizer isLegacyVoiceCommandRequest](self, "isLegacyVoiceCommandRequest"));
  if (SHIBYTE(v264.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v264.__r_.__value_.__l.__data_);
  if (SHIBYTE(v265.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v265.__r_.__value_.__l.__data_);
  if (SHIBYTE(v266.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v266.__r_.__value_.__l.__data_);
  v213 = (std::__shared_weak_count *)v268;
  if (v268)
  {
    v214 = (unint64_t *)((char *)v268 + 8);
    do
      v215 = __ldaxr(v214);
    while (__stlxr(v215 - 1, v214));
    if (!v215)
    {
      ((void (*)(std::__shared_weak_count *))v213->__on_zero_shared)(v213);
      std::__shared_weak_count::__release_weak(v213);
    }
  }
  if (SHIBYTE(v269.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v269.__r_.__value_.__l.__data_);
  if (SHIBYTE(v270.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v270.__r_.__value_.__l.__data_);
  if (SHIBYTE(v271.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v271.__r_.__value_.__l.__data_);
  if (SHIBYTE(v272.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v272.__r_.__value_.__l.__data_);
  if (SHIBYTE(v273.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v273.__r_.__value_.__l.__data_);
  if (SHIBYTE(__v.__end_) < 0)
    operator delete(__v.__first_);
  if (SHIBYTE(v304.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v304.__r_.__value_.__l.__data_);
  v216 = v274;
  if (v274)
  {
    v217 = (unint64_t *)(v274 + 8);
    do
      v218 = __ldaxr(v217);
    while (__stlxr(v218 - 1, v217));
    if (!v218)
      (*(void (**)(uint64_t))(*(_QWORD *)v216 + 16))(v216);
  }
  v219 = self->_training.__ptr_;
  if (v219)
  {
    if (v260)
      objc_msgSend(v260, "ear_toString");
    else
      memset(&v304, 0, sizeof(v304));
    isTaskSupported = quasar::SpeakerCodeTraining::isTaskSupported((const std::string *)v219, (unsigned __int8 *)&v304);
    v221 = isTaskSupported;
    if (SHIBYTE(v304.__r_.__value_.__r.__words[2]) < 0)
    {
      operator delete(v304.__r_.__value_.__l.__data_);
      if (!v221)
        goto LABEL_289;
    }
    else if (!isTaskSupported)
    {
      goto LABEL_289;
    }
    v222 = v275;
    quasar::SpeakerCodeTraining::getSpeakerCodeForInference((quasar::SpeakerCodeTraining *)self->_training.__ptr_, &v304);
    quasar::RunAsyncParams::setSpeakerCode((uint64_t)v222, (uint64_t *)&v304);
    size = (std::__shared_weak_count *)v304.__r_.__value_.__l.__size_;
    if (v304.__r_.__value_.__l.__size_)
    {
      v224 = (unint64_t *)(v304.__r_.__value_.__l.__size_ + 8);
      do
        v225 = __ldaxr(v224);
      while (__stlxr(v225 - 1, v224));
      if (!v225)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
    quasar::RunAsyncParams::setEnableSpeakerCodeTraining((uint64_t)v275, enableSpeakerCodeTraining);
    speakerCodeInfo = self->_speakerCodeInfo;
    quasar::SpeakerCodeTraining::getInferenceSpeakerCode((quasar::SpeakerCodeTraining *)self->_training.__ptr_, &v304);
    EARHelpers::serialize((uint64_t *)&v304);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSpeakerCodeInfo setInferenceSpeakerCode:](speakerCodeInfo, "setInferenceSpeakerCode:", v227);

    v228 = (std::__shared_weak_count *)v304.__r_.__value_.__l.__size_;
    if (v304.__r_.__value_.__l.__size_)
    {
      v229 = (unint64_t *)(v304.__r_.__value_.__l.__size_ + 8);
      do
        v230 = __ldaxr(v229);
      while (__stlxr(v230 - 1, v229));
      if (!v230)
      {
        ((void (*)(std::__shared_weak_count *))v228->__on_zero_shared)(v228);
        std::__shared_weak_count::__release_weak(v228);
      }
    }
    v231 = self->_speakerCodeInfo;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", quasar::SpeakerCodeTraining::getProcessedSamples((quasar::SpeakerCodeTraining *)self->_training.__ptr_));
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    -[_EARSpeakerCodeInfo setNumFrames:](v231, "setNumFrames:", v232);

    -[_EARSpeakerCodeInfo setIsSpeakerCodeUsed:](self->_speakerCodeInfo, "setIsSpeakerCodeUsed:", quasar::SpeakerCodeTraining::getIsSpeakerCodeUsed((quasar::SpeakerCodeTraining *)self->_training.__ptr_));
  }
LABEL_289:
  v304.__r_.__value_.__r.__words[0] = 0;
  v304.__r_.__value_.__l.__size_ = (std::string::size_type)&v304;
  v304.__r_.__value_.__r.__words[2] = 0x4012000000;
  v305 = __Block_byref_object_copy__527;
  v306 = __Block_byref_object_dispose__528;
  v308 = 0;
  v309 = 0;
  v307 = &unk_1AE30551B;
  v262[0] = MEMORY[0x1E0C809B0];
  v262[1] = 3321888768;
  v262[2] = __96___EARSpeechRecognizer__audioBufferWithLangauge_task_samplingRate_userProfileData_resultStream___block_invoke;
  v262[3] = &unk_1E5D469C8;
  v262[4] = self;
  v262[5] = &v304;
  v262[6] = v275;
  v263 = v276;
  if (v276)
  {
    v233 = (unint64_t *)&v276->__shared_owners_;
    do
      v234 = __ldxr(v233);
    while (__stxr(v234 + 1, v233));
  }
  ConvertCXXExceptionToNSException(v262);
  v235 = *(_QWORD *)(v304.__r_.__value_.__l.__size_ + 56);
  *v255 = *(_QWORD *)(v304.__r_.__value_.__l.__size_ + 48);
  v255[1] = v235;
  if (v235)
  {
    v236 = (unint64_t *)(v235 + 8);
    do
      v237 = __ldxr(v236);
    while (__stxr(v237 + 1, v236));
  }
  v238 = v263;
  if (v263)
  {
    v239 = (unint64_t *)&v263->__shared_owners_;
    do
      v240 = __ldaxr(v239);
    while (__stlxr(v240 - 1, v239));
    if (!v240)
    {
      ((void (*)(std::__shared_weak_count *))v238->__on_zero_shared)(v238);
      std::__shared_weak_count::__release_weak(v238);
    }
  }
  _Block_object_dispose(&v304, 8);
  v241 = v309;
  if (v309)
  {
    v242 = (unint64_t *)&v309->__shared_owners_;
    do
      v243 = __ldaxr(v242);
    while (__stlxr(v243 - 1, v242));
    if (!v243)
    {
      ((void (*)(std::__shared_weak_count *))v241->__on_zero_shared)(v241);
      std::__shared_weak_count::__release_weak(v241);
    }
  }
  v244 = v276;
  if (v276)
  {
    v245 = (unint64_t *)&v276->__shared_owners_;
    do
      v246 = __ldaxr(v245);
    while (__stlxr(v246 - 1, v245));
    if (!v246)
    {
      ((void (*)(std::__shared_weak_count *))v244->__on_zero_shared)(v244);
      std::__shared_weak_count::__release_weak(v244);
    }
  }
  std::__tree<std::string>::destroy((uint64_t)&v298, *((char **)&v298 + 1));
  v304.__r_.__value_.__r.__words[0] = (std::string::size_type)&v281;
  std::vector<std::shared_ptr<quasar::LmeContainer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v304);
  v304.__r_.__value_.__r.__words[0] = (std::string::size_type)&v283;
  std::vector<std::shared_ptr<quasar::LmeContainer>>::__destroy_vector::operator()[abi:ne180100]((void ***)&v304);
  if (SHIBYTE(v285.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v285.__r_.__value_.__l.__data_);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  v304.__r_.__value_.__r.__words[0] = (std::string::size_type)&v287;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v304);
  v304.__r_.__value_.__r.__words[0] = (std::string::size_type)&v288;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v304);
  std::promise<quasar::Location>::~promise(&v286);
  std::__tree<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::__map_value_compare<quasar::LmeDataFactoryBase::LmeType,std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>,std::less<quasar::LmeDataFactoryBase::LmeType>,true>,std::allocator<std::__value_type<quasar::LmeDataFactoryBase::LmeType,std::vector<std::shared_ptr<quasar::LmeContainer>>>>>::destroy((uint64_t)v294, v294[1]);
  if (v293[0])
  {
    v293[1] = v293[0];
    operator delete(v293[0]);
  }

  result.__cntrl_ = v248;
  result.__ptr_ = v247;
  return result;
}

- (void)_restartActiveRecognition
{
  id WeakRetained;
  std::__shared_weak_count *cntrl;
  std::__shared_weak_count *v5;
  ResultStreamWrapper *ptr;
  NSString *currentLanguage;
  NSString *currentTask;
  unint64_t currentSamplingRate;
  NSData *userProfileData;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *v18;
  unint64_t *v19;
  unint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  NSObject *v24;
  NSObject *v25;
  unint64_t *v26;
  unint64_t v27;
  uint64_t v28;
  std::__shared_weak_count *v29;
  ResultStreamWrapper *v30;
  std::__shared_weak_count *v31;
  uint8_t v32[8];
  std::__shared_weak_count *v33;
  uint8_t buf[8];
  std::__shared_weak_count *v35;

  WeakRetained = objc_loadWeakRetained((id *)&self->_currentAudioBuffer);
  if (WeakRetained)
  {
    *(_QWORD *)buf = 0;
    v35 = 0;
    cntrl = (std::__shared_weak_count *)self->_currentResultStreamWrapper.__cntrl_;
    if (cntrl)
    {
      cntrl = std::__shared_weak_count::lock(cntrl);
      v5 = cntrl;
      v35 = cntrl;
      if (cntrl)
      {
        ptr = self->_currentResultStreamWrapper.__ptr_;
        *(_QWORD *)buf = ptr;
        if (ptr)
        {
          currentLanguage = self->_currentLanguage;
          currentTask = self->_currentTask;
          currentSamplingRate = self->_currentSamplingRate;
          userProfileData = self->_userProfileData;
          p_shared_owners = (unint64_t *)&cntrl->__shared_owners_;
          v30 = ptr;
          v31 = cntrl;
          do
            v12 = __ldxr(p_shared_owners);
          while (__stxr(v12 + 1, p_shared_owners));
          -[_EARSpeechRecognizer _audioBufferWithLangauge:task:samplingRate:userProfileData:resultStream:](self, "_audioBufferWithLangauge:task:samplingRate:userProfileData:resultStream:", currentLanguage, currentTask, currentSamplingRate, userProfileData, &v30);
          v13 = v31;
          if (v31)
          {
            v14 = (unint64_t *)&v31->__shared_owners_;
            do
              v15 = __ldaxr(v14);
            while (__stlxr(v15 - 1, v14));
            if (!v15)
            {
              ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
              std::__shared_weak_count::__release_weak(v13);
            }
          }
          v28 = *(_QWORD *)v32;
          v29 = v33;
          if (v33)
          {
            v16 = (unint64_t *)&v33->__shared_owners_;
            do
              v17 = __ldxr(v16);
            while (__stxr(v17 + 1, v16));
          }
          objc_msgSend(WeakRetained, "_setUnderlyingBuffer:", &v28);
          v18 = v29;
          if (v29)
          {
            v19 = (unint64_t *)&v29->__shared_owners_;
            do
              v20 = __ldaxr(v19);
            while (__stlxr(v20 - 1, v19));
            if (!v20)
            {
              ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
              std::__shared_weak_count::__release_weak(v18);
            }
          }
          v21 = v33;
          if (v33)
          {
            v22 = (unint64_t *)&v33->__shared_owners_;
            do
              v23 = __ldaxr(v22);
            while (__stlxr(v23 - 1, v22));
            if (!v23)
            {
              ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
              std::__shared_weak_count::__release_weak(v21);
            }
          }
          v5 = v35;
          if (!v35)
            goto LABEL_38;
LABEL_34:
          v26 = (unint64_t *)&v5->__shared_owners_;
          do
            v27 = __ldaxr(v26);
          while (__stlxr(v27 - 1, v26));
          if (!v27)
          {
            ((void (*)(std::__shared_weak_count *))v5->__on_zero_shared)(v5);
            std::__shared_weak_count::__release_weak(v5);
          }
          goto LABEL_38;
        }
      }
    }
    else
    {
      v5 = 0;
    }
    EARLogger::QuasarOSLogger((EARLogger *)cntrl);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl(&dword_1AD756000, v25, OS_LOG_TYPE_INFO, "Result stream wrapper has been deallocated; not restarting recognition",
        v32,
        2u);
    }

    if (v5)
      goto LABEL_34;
  }
  else
  {
    EARLogger::QuasarOSLogger(0);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v24, OS_LOG_TYPE_INFO, "Audio buffer has been deallocated; not restarting recognition",
        buf,
        2u);
    }

  }
LABEL_38:

}

- (id)recognitionResultsWithAudioData:(id)a3 userProfileData:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _EARSyncResultStreamHelper *v16;
  void *v17;
  void *v18;
  void *v19;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = objc_alloc_init(_EARSyncResultStreamHelper);
  -[_EARSpeechRecognizer runRecognitionWithResultStream:language:task:samplingRate:userProfileData:speakerCodeWriter:](self, "runRecognitionWithResultStream:language:task:samplingRate:userProfileData:speakerCodeWriter:", v16, v14, v15, a7, v13, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "addAudioSampleData:", v12);
  objc_msgSend(v17, "endAudio");
  -[_EARSyncResultStreamHelper waitForCompletion](v16, "waitForCompletion");
  (*(void (**)(SpeechRecognizer *))(*(_QWORD *)self->_recognizer.__ptr_ + 32))(self->_recognizer.__ptr_);
  -[_EARSyncResultStreamHelper error](v16, "error");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = 0;
  }
  else
  {
    -[_EARSyncResultStreamHelper results](v16, "results");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v19;
}

- (id)recognitionResultsWithAudioData:(id)a3 userProfileData:(id)a4 language:(id)a5 task:(id)a6 samplingRate:(unint64_t)a7 extraLanguageModel:(id)a8
{
  -[_EARSpeechRecognizer recognitionResultsWithAudioData:userProfileData:language:task:samplingRate:](self, "recognitionResultsWithAudioData:userProfileData:language:task:samplingRate:", a3, a4, a5, a6, a7, a8);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)testFormattingWithOneBestResults:(id)a3 uttMillis:(id)a4
{
  void *v4;
  id v7;
  uint64_t v8;
  _EARSyncResultStreamHelper *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t IsFinal;
  void *v22;
  void *v23;
  uint64_t started;
  void *v25;
  void *v26;
  std::__shared_weak_count *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  std::__shared_weak_count *cntrl;
  std::__shared_weak_count *v31;
  ResultStreamWrapper *ptr;
  void *v33;
  _BOOL4 v34;
  NSObject *v35;
  char v36;
  uint64_t v37;
  unint64_t *v38;
  unint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  std::__shared_weak_count *v45;
  unint64_t *v46;
  unint64_t v47;
  void *v49;
  int v50;
  _EARSyncResultStreamHelper *v51;
  id v52;
  id v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[8];
  void *__p;
  char v62;
  _QWORD v63[3];
  _QWORD v64[3];
  std::string *v65;
  std::string *v66;
  void **p_data;
  ResultStreamWrapper *v68;
  std::__shared_weak_count *v69;
  uint64_t v70;
  std::__shared_weak_count *v71;
  uint64_t v72[3];
  void *v73[3];
  _QWORD v74[5];
  _EARSyncResultStreamHelper *v75;
  _QWORD *v76;
  _QWORD v77[7];
  std::__shared_weak_count *v78;
  _BYTE v79[124];
  unsigned int v80;
  _BYTE v81[128];
  __int128 v82;
  uint64_t v83;
  __int128 v84;

  *(_QWORD *)&v84 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v54 = a4;
  v8 = objc_msgSend(v7, "count");
  if (v8 != objc_msgSend(v54, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EARSpeechRecognizer.mm"), 5088, CFSTR("Array sizes are not the same"));

  }
  v55 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  quasar::RecogResult::RecogResult((quasar::RecogResult *)v79);
  v9 = -[_EARSyncResultStreamHelper initWithTagResults:]([_EARSyncResultStreamHelper alloc], "initWithTagResults:", 1);
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x4012000000;
  v77[3] = __Block_byref_object_copy__533;
  v77[4] = __Block_byref_object_dispose__534;
  v77[6] = 0;
  v78 = 0;
  v77[5] = &unk_1AE30551B;
  v74[0] = MEMORY[0x1E0C809B0];
  v74[1] = 3221225472;
  v74[2] = __67___EARSpeechRecognizer_testFormattingWithOneBestResults_uttMillis___block_invoke;
  v74[3] = &unk_1E5D47050;
  v76 = v77;
  v74[4] = self;
  v51 = v9;
  v75 = v51;
  ConvertCXXExceptionToNSException(v74);
  v10 = 0;
LABEL_4:
  if (objc_msgSend(v7, "count") > v10)
  {
    v11 = 1;
    while (1)
    {
      objc_msgSend(v7, "objectAtIndex:", v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count") < v11;

      if (v13)
      {
        ++v10;
        goto LABEL_4;
      }
      std::vector<double>::vector(v73, 1uLL);
      memset(v72, 0, sizeof(v72));
      objc_msgSend(v7, "objectAtIndex:", v10);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "subarrayWithRange:", 0, v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      EARHelpers::QuasarResultFromEARSpeechRecognitionTokens(v15, (uint64_t *)buf);
      std::vector<std::vector<quasar::Token>>::push_back[abi:ne180100](v72, (uint64_t)buf);
      v65 = (std::string *)buf;
      std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)&v65);

      *(_QWORD *)buf = 0;
      std::allocate_shared[abi:ne180100]<quasar::RunAsyncParams,std::allocator<quasar::RunAsyncParams>,decltype(nullptr),void>(&v70);
      v16 = quasar::RecogResult::setParams((uint64_t)v79, &v70);
      v17 = quasar::RecogResult::setResultChoices(v16, (uint64_t)v72);
      v18 = quasar::RecogResult::setResultCosts(v17, (uint64_t)v73);
      v19 = objc_msgSend(v7, "count") - 1;
      if (v19 == v10)
      {
        objc_msgSend(v7, "objectAtIndex:", v10);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v4, "count") == v11;
      }
      else
      {
        v20 = 0;
      }
      IsFinal = quasar::RecogResult::setIsFinal(v18, v20);
      objc_msgSend(v54, "objectAtIndexedSubscript:", v10);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "objectAtIndexedSubscript:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      started = quasar::RecogResult::setUtteranceStartMillis(IsFinal, 1000 * objc_msgSend(v23, "intValue"));
      objc_msgSend(v54, "objectAtIndexedSubscript:", v10);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "objectAtIndexedSubscript:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      quasar::RecogResult::setUtteranceDurationMillis(started, 1000 * objc_msgSend(v26, "intValue"));

      if (v19 == v10)
      v27 = v71;
      if (v71)
      {
        p_shared_owners = (unint64_t *)&v71->__shared_owners_;
        do
          v29 = __ldaxr(p_shared_owners);
        while (__stlxr(v29 - 1, p_shared_owners));
        if (!v29)
        {
          ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
          std::__shared_weak_count::__release_weak(v27);
        }
      }
      v68 = 0;
      v69 = 0;
      cntrl = (std::__shared_weak_count *)self->_currentResultStreamWrapper.__cntrl_;
      if (!cntrl)
        break;
      cntrl = std::__shared_weak_count::lock(cntrl);
      v31 = cntrl;
      v69 = cntrl;
      if (!cntrl)
        goto LABEL_23;
      ptr = self->_currentResultStreamWrapper.__ptr_;
      v68 = ptr;
      if (!ptr)
        goto LABEL_23;
      objc_msgSend(v7, "objectAtIndex:", v10);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = objc_msgSend(v33, "count") == v11;

      if (v34)
      {
        (*(void (**)(ResultStreamWrapper *, _BYTE *, uint64_t))(*(_QWORD *)ptr + 40))(ptr, v79, 1);
      }
      else
      {
        v82 = 0uLL;
        v83 = 0;
        v66 = 0;
        p_data = 0;
        v65 = 0;
        *(_QWORD *)buf = &v65;
        LOBYTE(__p) = 0;
        v65 = (std::string *)operator new(0x18uLL);
        v66 = v65;
        p_data = (void **)&v65[1].__r_.__value_.__l.__data_;
        v66 = std::__uninitialized_allocator_copy_impl[abi:ne180100]<std::allocator<std::string>,std::string const*,std::string const*,std::string*>((uint64_t)&p_data, &v82, &v84, v65);
        v37 = v80;
        memset(v64, 0, sizeof(v64));
        memset(v63, 0, sizeof(v63));
        buf[0] = 0;
        std::string::basic_string[abi:ne180100]<0>(&__p, "▁");
        LOWORD(v50) = 0;
        (*(void (**)(ResultStreamWrapper *, std::string **, uint64_t, uint64_t, _QWORD, _QWORD, uint64_t *, _QWORD *, _QWORD *, int, uint8_t *))(*(_QWORD *)ptr + 24))(ptr, &v65, v37, 1, 0, 0, v72, v64, v63, v50, buf);
        if (v62 < 0)
          operator delete(__p);
        *(_QWORD *)buf = v63;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        *(_QWORD *)buf = v64;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        *(_QWORD *)buf = &v65;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
        if (SHIBYTE(v83) < 0)
          operator delete((void *)v82);
      }
      v36 = 0;
LABEL_32:
      v38 = (unint64_t *)&v31->__shared_owners_;
      do
        v39 = __ldaxr(v38);
      while (__stlxr(v39 - 1, v38));
      if (!v39)
      {
        ((void (*)(std::__shared_weak_count *))v31->__on_zero_shared)(v31);
        std::__shared_weak_count::__release_weak(v31);
      }
LABEL_36:
      *(_QWORD *)buf = v72;
      std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
      if (v73[0])
      {
        v73[1] = v73[0];
        operator delete(v73[0]);
      }
      ++v11;
      if ((v36 & 1) != 0)
        goto LABEL_49;
    }
    v31 = 0;
LABEL_23:
    EARLogger::QuasarOSLogger((EARLogger *)cntrl);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v35, OS_LOG_TYPE_INFO, "Result stream wrapper has been deallocated", buf, 2u);
    }

    v52 = v55;
    v36 = 1;
    if (!v31)
      goto LABEL_36;
    goto LABEL_32;
  }
  -[_EARSyncResultStreamHelper waitForCompletion](v51, "waitForCompletion");
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[_EARSyncResultStreamHelper taggedResults](v51, "taggedResults");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
  if (v41)
  {
    v42 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v41; ++i)
      {
        if (*(_QWORD *)v57 != v42)
          objc_enumerationMutation(v40);
        objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * i), "tokens");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "addObject:", v44);

      }
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v81, 16);
    }
    while (v41);
  }

  v52 = v55;
LABEL_49:

  _Block_object_dispose(v77, 8);
  v45 = v78;
  if (v78)
  {
    v46 = (unint64_t *)&v78->__shared_owners_;
    do
      v47 = __ldaxr(v46);
    while (__stlxr(v47 - 1, v46));
    if (!v47)
    {
      ((void (*)(std::__shared_weak_count *))v45->__on_zero_shared)(v45);
      std::__shared_weak_count::__release_weak(v45);
    }
  }

  quasar::RecogResult::~RecogResult((quasar::RecogResult *)v79);
  return v52;
}

- (BOOL)isContinuousListening
{
  return quasar::isContinuousListening((quasar *)self->_detectUtterances, self->_concatenateUtterances, self->_allowUtteranceDelay, self->_formatAcrossUtterances);
}

- (BOOL)isLegacyVoiceCommandRequest
{
  BOOL result;

  result = self->_shouldGenerateVoiceCommandCandidates;
  if (self->_enableVoiceCommands)
    return self->_voiceCommandCompilation.__ptr_ != 0;
  return result;
}

- (unsigned)itnEnablingFlags
{
  if (self->_disableAutoPunctuation)
    return -2;
  else
    return -1;
}

+ (id)rawTokenResultsFromRecognitionResults:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v15;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16, v15);
  if (v4)
  {
    v5 = *(_QWORD *)v22;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v22 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v6);
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v19 = 0u;
        v20 = 0u;
        v17 = 0u;
        v18 = 0u;
        objc_msgSend(v7, "tokens");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v18;
          do
          {
            v12 = 0;
            do
            {
              if (*(_QWORD *)v18 != v11)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v12), "tokenName");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v8, "addObject:", v13);

              ++v12;
            }
            while (v10 != v12);
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v10);
        }

        objc_msgSend(v3, "addObject:", v8);
        ++v6;
      }
      while (v6 != v4);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v4);
  }

  return v3;
}

+ (void)compileRecognizerModelsWithConfiguration:(id)a3
{
  void *v3;
  char v4;
  EARLogger *v5;
  id v6;
  std::vector<std::string>::pointer begin;
  std::vector<std::string>::pointer i;
  void *v9;
  EARLogger *v10;
  EARLogger *v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  id v16;
  EARLogger *v17;
  NSObject *v18;
  const char *v19;
  uint32_t v20;
  id v21;
  EARLogger *v22;
  std::vector<std::string>::pointer end;
  std::vector<std::string>::pointer v24;
  NSObject *v25;
  NSObject *v26;
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  void *v31[2];
  char v32;
  id v33;
  id v34;
  std::vector<std::string> __p;
  std::vector<std::string> v36;
  _BYTE v37[12];
  char v38;
  _BYTE buf[12];
  char v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v28 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v28);

  if ((v4 & 1) != 0)
  {
    v6 = objc_retainAutorelease(v28);
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v6, "fileSystemRepresentation"));
    std::string::basic_string[abi:ne180100]<0>(&__p, ".mlmodelc");
    getModelFilesWithSuffix((uint64_t)buf, (uint64_t)&__p, &v36);
    if (SHIBYTE(__p.__end_cap_.__value_) < 0)
      operator delete(__p.__begin_);
    v27 = v6;
    if (v40 < 0)
      operator delete(*(void **)buf);
    begin = v36.__begin_;
    for (i = v36.__end_; begin != i; ++begin)
    {
      EARHelpers::getAbsolutePath((uint64_t *)begin);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(__p.__begin_) = 0;
      v34 = 0;
      objc_msgSend(MEMORY[0x1E0C9E948], "needsANECompilationForModelAtURL:result:error:", v9, &__p, &v34, v27);
      v10 = (EARLogger *)v34;
      if (v10)
      {
        v11 = v10;
        EARLogger::QuasarOSLogger(v10);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v11;
          v13 = v12;
          v14 = "Error determining compilation status: %@\n";
LABEL_10:
          _os_log_impl(&dword_1AD756000, v13, OS_LOG_TYPE_DEFAULT, v14, buf, 0xCu);
        }
      }
      else
      {
        if (!LOBYTE(__p.__begin_))
        {
          EARLogger::QuasarOSLogger(0);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v9;
            v18 = v12;
            v19 = "Skipping model that's already compiled: %@";
            v20 = 12;
            goto LABEL_21;
          }
LABEL_22:
          v11 = 0;
          goto LABEL_23;
        }
        EARLogger::QuasarOSLogger(0);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v9;
          _os_log_impl(&dword_1AD756000, v15, OS_LOG_TYPE_INFO, "Attempting to compile ANE model: %@", buf, 0xCu);
        }

        v33 = 0;
        v16 = (id)objc_msgSend(MEMORY[0x1E0C9E938], "modelWithContentsOfURL:error:", v9, &v33);
        v17 = (EARLogger *)v33;
        if (!v17)
        {
          EARLogger::QuasarOSLogger(0);
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            v18 = v12;
            v19 = "Compilation completed.";
            v20 = 2;
LABEL_21:
            _os_log_impl(&dword_1AD756000, v18, OS_LOG_TYPE_INFO, v19, buf, v20);
          }
          goto LABEL_22;
        }
        v11 = v17;
        EARLogger::QuasarOSLogger(v17);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v11;
          v13 = v12;
          v14 = "Found an error: %@\n";
          goto LABEL_10;
        }
      }
LABEL_23:

    }
    quasar::ModelLoader::ModelLoader((quasar::ModelLoader *)buf);
    v21 = objc_retainAutorelease(v27);
    std::string::basic_string[abi:ne180100]<0>(v37, (char *)objc_msgSend(v21, "fileSystemRepresentation"));
    std::string::basic_string[abi:ne180100]<0>(v31, ".espresso.net");
    getModelFilesWithSuffix((uint64_t)v37, (uint64_t)v31, &__p);
    if (v32 < 0)
      operator delete(v31[0]);
    if (v38 < 0)
      operator delete(*(void **)v37);
    v24 = __p.__begin_;
    end = __p.__end_;
    while (v24 != end)
      v22 = (EARLogger *)quasar::ModelLoader::compileModel((uint64_t)buf, (uint64_t)v24++);
    EARLogger::QuasarOSLogger(v22);
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v37 = 138412290;
      *(_QWORD *)&v37[4] = v21;
      _os_log_impl(&dword_1AD756000, v26, OS_LOG_TYPE_INFO, "Attempting to compile e5ml models, path: %@", v37, 0xCu);
    }

    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __65___EARSpeechRecognizer_compileRecognizerModelsWithConfiguration___block_invoke;
    v29[3] = &unk_1E5D47078;
    v30 = v21;
    +[_EARe5mlCompiler compileWithModelConfig:completion:](_EARe5mlCompiler, "compileWithModelConfig:completion:", v30, v29);

    *(_QWORD *)v37 = &__p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v37);
    quasar::ModelLoader::~ModelLoader((quasar::ModelLoader *)buf);
    *(_QWORD *)buf = &v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  else
  {
    EARLogger::QuasarOSLogger(v5);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v25, OS_LOG_TYPE_DEFAULT, "Error file sent for compilation does not exist. Not compiling.", buf, 2u);
    }

  }
}

+ (void)purgeCompiledRecognizerModelsWithConfiguration:(id)a3
{
  void *v3;
  char v4;
  EARLogger *v5;
  std::vector<std::string>::pointer i;
  std::vector<std::string>::pointer begin;
  EARLogger *v8;
  NSObject *v9;
  EARLogger *v10;
  EARLogger *v11;
  NSObject *v12;
  NSObject *v13;
  os_log_type_t v14;
  const char *v15;
  uint32_t v16;
  std::vector<std::string>::pointer end;
  std::vector<std::string>::pointer v18;
  NSObject *v19;
  id v20;
  id v21;
  void *v22[2];
  char v23;
  void *v24[2];
  char v25;
  id v26;
  std::vector<std::string> __p;
  std::vector<std::string> v28;
  _BYTE buf[12];
  char v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v21 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:", v21);

  if ((v4 & 1) != 0)
  {
    v20 = objc_retainAutorelease(v21);
    std::string::basic_string[abi:ne180100]<0>(buf, (char *)objc_msgSend(v20, "fileSystemRepresentation"));
    std::string::basic_string[abi:ne180100]<0>(&__p, ".mlmodelc");
    getModelFilesWithSuffix((uint64_t)buf, (uint64_t)&__p, &v28);
    if (SHIBYTE(__p.__end_cap_.__value_) < 0)
      operator delete(__p.__begin_);
    if (v30 < 0)
      operator delete(*(void **)buf);
    begin = v28.__begin_;
    for (i = v28.__end_; begin != i; ++begin)
    {
      EARHelpers::getAbsolutePath((uint64_t *)begin);
      v8 = (EARLogger *)objc_claimAutoreleasedReturnValue();
      EARLogger::QuasarOSLogger(v8);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl(&dword_1AD756000, v9, OS_LOG_TYPE_INFO, "Attempting to purge ANE model: %@", buf, 0xCu);
      }

      v26 = 0;
      objc_msgSend(MEMORY[0x1E0C9E948], "purgeANEIRForModelAtURL:error:", v8, &v26);
      v10 = (EARLogger *)v26;
      v11 = v10;
      if (v10)
      {
        EARLogger::QuasarOSLogger(v10);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(_QWORD *)&buf[4] = v11;
          v13 = v12;
          v14 = OS_LOG_TYPE_DEFAULT;
          v15 = "Found an error: %@\n";
          v16 = 12;
LABEL_14:
          _os_log_impl(&dword_1AD756000, v13, v14, v15, buf, v16);
        }
      }
      else
      {
        EARLogger::QuasarOSLogger(0);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          v13 = v12;
          v14 = OS_LOG_TYPE_INFO;
          v15 = "Purge completed.";
          v16 = 2;
          goto LABEL_14;
        }
      }

    }
    quasar::ModelLoader::ModelLoader((quasar::ModelLoader *)buf);
    std::string::basic_string[abi:ne180100]<0>(v24, (char *)objc_msgSend(objc_retainAutorelease(v20), "fileSystemRepresentation"));
    std::string::basic_string[abi:ne180100]<0>(v22, ".espresso.net");
    getModelFilesWithSuffix((uint64_t)v24, (uint64_t)v22, &__p);
    if (v23 < 0)
      operator delete(v22[0]);
    if (v25 < 0)
      operator delete(v24[0]);
    v18 = __p.__begin_;
    end = __p.__end_;
    while (v18 != end)
      quasar::ModelLoader::purgeModel((uint64_t)buf, (uint64_t)v18++);
    v24[0] = &__p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v24);
    quasar::ModelLoader::~ModelLoader((quasar::ModelLoader *)buf);
    *(_QWORD *)buf = &v28;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)buf);
  }
  else
  {
    EARLogger::QuasarOSLogger(v5);
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v19, OS_LOG_TYPE_DEFAULT, "Error file sent for purge does not exist. Not purging.", buf, 2u);
    }

  }
}

- (void)cancelRecognition
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __41___EARSpeechRecognizer_cancelRecognition__block_invoke;
  v2[3] = &unk_1E5D470A0;
  v2[4] = self;
  ConvertCXXExceptionToNSException(v2);
}

- (void)_waitForAsyncRecogToFinish
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __50___EARSpeechRecognizer__waitForAsyncRecogToFinish__block_invoke;
  v2[3] = &unk_1E5D470A0;
  v2[4] = self;
  ConvertCXXExceptionToNSException(v2);
}

- (void)interruptTraining
{
  NSObject *v3;
  _QWORD v4[5];
  uint8_t buf[16];

  EARLogger::QuasarOSLogger((EARLogger *)self);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AD756000, v3, OS_LOG_TYPE_INFO, "Got interrupt signal, going to interrupt training if training is enabled and still running.", buf, 2u);
  }

  if (self->_training.__ptr_)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __41___EARSpeechRecognizer_interruptTraining__block_invoke;
    v4[3] = &unk_1E5D470A0;
    v4[4] = self;
    ConvertCXXExceptionToNSException(v4);
  }
}

- (id)recognitionStatistics
{
  id v2;
  char **v3;
  void *v4;
  _QWORD *v5;
  void *v6;
  char *v7;
  char **v8;
  BOOL v9;
  std::__shared_weak_count *v10;
  unint64_t *p_shared_owners;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  _QWORD **v21;
  _QWORD *v22[2];
  char **v23;
  char *v24[2];

  v24[0] = 0;
  v24[1] = 0;
  v22[1] = 0;
  v23 = v24;
  v21 = v22;
  v22[0] = 0;
  v19 = 0;
  v20 = 0;
  v17 = 0;
  v18 = 0;
  (*(void (**)(SpeechRecognizer *, char ***, _QWORD ***, uint64_t *, uint64_t *))(*(_QWORD *)self->_recognizer.__ptr_
                                                                                         + 48))(self->_recognizer.__ptr_, &v23, &v21, &v19, &v17);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = v23;
  if (v23 != v24)
  {
    do
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *((double *)v3 + 7));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v3 + 4;
      if (*((char *)v3 + 55) < 0)
        v5 = (_QWORD *)*v5;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v4, v6);

      v7 = v3[1];
      if (v7)
      {
        do
        {
          v8 = (char **)v7;
          v7 = *(char **)v7;
        }
        while (v7);
      }
      else
      {
        do
        {
          v8 = (char **)v3[2];
          v9 = *v8 == (char *)v3;
          v3 = v8;
        }
        while (!v9);
      }
      v3 = v8;
    }
    while (v8 != v24);
  }
  v10 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v12 = __ldaxr(p_shared_owners);
    while (__stlxr(v12 - 1, p_shared_owners));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v13 = v20;
  if (v20)
  {
    v14 = (unint64_t *)&v20->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v21, v22[0]);
  std::__tree<std::string>::destroy((uint64_t)&v23, v24[0]);
  return v2;
}

- (id)recognitionUtterenceStatistics
{
  id v2;
  _QWORD **v3;
  _QWORD *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _QWORD *v8;
  _QWORD **v9;
  BOOL v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  _QWORD **v22;
  _QWORD *v23[2];
  char **v24;
  char *v25[2];

  v25[0] = 0;
  v25[1] = 0;
  v23[1] = 0;
  v24 = v25;
  v22 = v23;
  v23[0] = 0;
  v20 = 0;
  v21 = 0;
  v18 = 0;
  v19 = 0;
  (*(void (**)(SpeechRecognizer *, char ***, _QWORD ***, uint64_t *, uint64_t *))(*(_QWORD *)self->_recognizer.__ptr_
                                                                                         + 48))(self->_recognizer.__ptr_, &v24, &v22, &v20, &v18);
  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v3 = v22;
  if (v22 != v23)
  {
    do
    {
      v4 = v3 + 7;
      if (*((char *)v3 + 79) < 0)
        v4 = (_QWORD *)*v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = v3 + 4;
      if (*((char *)v3 + 55) < 0)
        v6 = (_QWORD *)*v6;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, v7);

      v8 = v3[1];
      if (v8)
      {
        do
        {
          v9 = (_QWORD **)v8;
          v8 = (_QWORD *)*v8;
        }
        while (v8);
      }
      else
      {
        do
        {
          v9 = (_QWORD **)v3[2];
          v10 = *v9 == v3;
          v3 = v9;
        }
        while (!v10);
      }
      v3 = v9;
    }
    while (v9 != v23);
  }
  v11 = v19;
  if (v19)
  {
    p_shared_owners = (unint64_t *)&v19->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v21;
  if (v21)
  {
    v15 = (unint64_t *)&v21->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((uint64_t)&v22, v23[0]);
  std::__tree<std::string>::destroy((uint64_t)&v24, v25[0]);
  return v2;
}

- (id)recognitionUtteranceInfos
{
  void *v2;
  void **v4[8];
  quasar::UttInfo **v5[3];

  quasar::SpeechRecognizer::getUttInfos((quasar::SpeechRecognizer *)self->_recognizer.__ptr_, (uint64_t)v5);
  if (v5[0] == v5[1])
  {
    v2 = 0;
  }
  else
  {
    quasar::UttInfo::ptreeBatch(v5, (quasar::PTree *)v4);
    EARHelpers::arrayFromPTree((EARHelpers *)v4, (const quasar::PTree *)1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    quasar::PTree::~PTree((quasar::PTree *)v4);
  }
  v4[0] = (void **)v5;
  std::vector<std::shared_ptr<quasar::LmeContainer>>::__destroy_vector::operator()[abi:ne180100](v4);
  return v2;
}

- (void)getFormatterWithBlock:(id)a3
{
  id v4;
  NSObject *formatterQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  formatterQueue = self->_formatterQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __46___EARSpeechRecognizer_getFormatterWithBlock___block_invoke;
  v7[3] = &unk_1E5D470C8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(formatterQueue, v7);

}

- (void)_waitForInitialization
{
  dispatch_sync((dispatch_queue_t)self->_formatterQueue, &__block_literal_global);
}

- (void)dumpModelVirtualMemoryInfo
{
  quasar::SpeechRecognizer::dumpModelVirtualMemoryInfo((quasar::SystemConfig **)self->_recognizer.__ptr_);
}

- (void)setActiveConfiguration:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __47___EARSpeechRecognizer_setActiveConfiguration___block_invoke;
  v6[3] = &unk_1E5D47110;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  ConvertCXXExceptionToNSException(v6);

}

- (BOOL)isSpeakerCodeTrainingSupported:(id)a3
{
  id v4;
  void *v5;
  SpeakerCodeTraining *ptr;
  void *__p[2];
  uint64_t v9;

  v4 = a3;
  v5 = v4;
  ptr = self->_training.__ptr_;
  if (ptr)
  {
    if (v4)
    {
      objc_msgSend(v4, "ear_toString");
    }
    else
    {
      __p[0] = 0;
      __p[1] = 0;
      v9 = 0;
    }
    LOBYTE(ptr) = quasar::SpeakerCodeTraining::isTaskSupported((const std::string *)ptr, (unsigned __int8 *)__p);
    if (SHIBYTE(v9) < 0)
      operator delete(__p[0]);
  }

  return (char)ptr;
}

- (id)activeConfiguration
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  id v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3032000000;
  v8 = __Block_byref_object_copy__2;
  v9 = __Block_byref_object_dispose__2;
  v10 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __43___EARSpeechRecognizer_activeConfiguration__block_invoke;
  v4[3] = &unk_1E5D47138;
  v4[4] = self;
  v4[5] = &v5;
  ConvertCXXExceptionToNSException(v4);
  v2 = (id)v6[5];
  _Block_object_dispose(&v5, 8);

  return v2;
}

- (void)setAlternateRawRecognitionTokenSausage:(id)a3
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t k;
  id v8;
  void *v9;
  unint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v19;
  uint64_t v20;
  id obj;
  uint64_t i;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t j;
  id v27;
  uint64_t v28[3];
  uint64_t v29[3];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  void *v41[2];
  _OWORD v42[2];
  void *v43[2];
  _OWORD v44[2];
  void *v45[2];
  _OWORD v46[2];
  void *v47[2];
  __int128 v48;
  void *__p[2];
  _OWORD v50[2];
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  void **v55;
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  memset(v28, 0, sizeof(v28));
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = a3;
  v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v56, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v19; ++i)
      {
        if (*(_QWORD *)v31 != v20)
          objc_enumerationMutation(obj);
        v3 = *(id *)(*((_QWORD *)&v30 + 1) + 8 * i);
        memset(v29, 0, sizeof(v29));
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v23 = v3;
        v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
        if (v25)
        {
          v24 = *(_QWORD *)v38;
          do
          {
            for (j = 0; j != v25; ++j)
            {
              if (*(_QWORD *)v38 != v24)
                objc_enumerationMutation(v23);
              v4 = *(id *)(*((_QWORD *)&v37 + 1) + 8 * j);
              v35 = 0;
              v36 = 0;
              v34 = 0;
              v51 = 0u;
              v52 = 0u;
              v53 = 0u;
              v54 = 0u;
              v27 = v4;
              v5 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
              if (v5)
              {
                v6 = *(_QWORD *)v52;
                do
                {
                  for (k = 0; k != v5; ++k)
                  {
                    if (*(_QWORD *)v52 != v6)
                      objc_enumerationMutation(v27);
                    v8 = *(id *)(*((_QWORD *)&v51 + 1) + 8 * k);
                    v9 = v8;
                    if (v8)
                    {
                      objc_msgSend(v8, "quasarToken");
                    }
                    else
                    {
                      memset(v50, 0, sizeof(v50));
                      v48 = 0u;
                      *(_OWORD *)__p = 0u;
                      *(_OWORD *)v47 = 0u;
                      *(_OWORD *)v45 = 0u;
                      memset(v46, 0, sizeof(v46));
                      memset(v44, 0, sizeof(v44));
                      *(_OWORD *)v43 = 0u;
                      *(_OWORD *)v41 = 0u;
                      memset(v42, 0, sizeof(v42));
                    }

                    v10 = v35;
                    if (v35 >= v36)
                    {
                      v35 = std::vector<quasar::Token>::__push_back_slow_path<quasar::Token>(&v34, (__int128 *)v41);
                      if (SBYTE7(v50[0]) < 0)
                        operator delete(__p[0]);
                    }
                    else
                    {
                      v11 = *(_OWORD *)v41;
                      *(_QWORD *)(v35 + 16) = *(_QWORD *)&v42[0];
                      *(_OWORD *)v10 = v11;
                      v41[1] = 0;
                      *(_QWORD *)&v42[0] = 0;
                      v41[0] = 0;
                      v12 = *(_QWORD *)((char *)&v42[1] + 6);
                      *(_OWORD *)(v10 + 24) = *(_OWORD *)((char *)v42 + 8);
                      *(_QWORD *)(v10 + 38) = v12;
                      v13 = *(_QWORD *)&v44[0];
                      *(_OWORD *)(v10 + 48) = *(_OWORD *)v43;
                      *(_QWORD *)(v10 + 64) = v13;
                      *(_QWORD *)(v10 + 72) = 0;
                      v43[1] = 0;
                      *(_QWORD *)&v44[0] = 0;
                      v43[0] = 0;
                      *(_QWORD *)(v10 + 80) = 0;
                      *(_QWORD *)(v10 + 88) = 0;
                      *(_OWORD *)(v10 + 72) = *(_OWORD *)((char *)v44 + 8);
                      *(_QWORD *)(v10 + 88) = *((_QWORD *)&v44[1] + 1);
                      memset((char *)v44 + 8, 0, 24);
                      v14 = *(_OWORD *)v45;
                      *(_QWORD *)(v10 + 112) = *(_QWORD *)&v46[0];
                      *(_QWORD *)(v10 + 120) = 0;
                      *(_OWORD *)(v10 + 96) = v14;
                      v45[1] = 0;
                      *(_QWORD *)&v46[0] = 0;
                      v45[0] = 0;
                      *(_QWORD *)(v10 + 128) = 0;
                      *(_QWORD *)(v10 + 136) = 0;
                      *(_OWORD *)(v10 + 120) = *(_OWORD *)((char *)v46 + 8);
                      *(_QWORD *)(v10 + 136) = *((_QWORD *)&v46[1] + 1);
                      memset((char *)v46 + 8, 0, 24);
                      v15 = *(_OWORD *)v47;
                      *(_QWORD *)(v10 + 160) = v48;
                      *(_OWORD *)(v10 + 144) = v15;
                      v47[1] = 0;
                      *(_QWORD *)&v48 = 0;
                      v47[0] = 0;
                      LODWORD(v13) = DWORD2(v48);
                      *(_WORD *)(v10 + 172) = WORD6(v48);
                      *(_DWORD *)(v10 + 168) = v13;
                      v16 = *(_OWORD *)__p;
                      *(_QWORD *)(v10 + 192) = *(_QWORD *)&v50[0];
                      *(_OWORD *)(v10 + 176) = v16;
                      __p[1] = 0;
                      *(_QWORD *)&v50[0] = 0;
                      __p[0] = 0;
                      v17 = *(_OWORD *)((char *)v50 + 8);
                      *(_DWORD *)(v10 + 216) = DWORD2(v50[1]);
                      *(_OWORD *)(v10 + 200) = v17;
                      v35 = v10 + 224;
                    }
                    if (SBYTE7(v48) < 0)
                      operator delete(v47[0]);
                    v55 = (void **)v46 + 1;
                    std::vector<quasar::TextTokenizer::Token>::__destroy_vector::operator()[abi:ne180100](&v55);
                    if (SBYTE7(v46[0]) < 0)
                      operator delete(v45[0]);
                    v55 = (void **)v44 + 1;
                    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](&v55);
                    if (SBYTE7(v44[0]) < 0)
                      operator delete(v43[0]);
                    if (SBYTE7(v42[0]) < 0)
                      operator delete(v41[0]);

                  }
                  v5 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
                }
                while (v5);
              }

              std::vector<std::vector<quasar::Token>>::push_back[abi:ne180100](v29, (uint64_t)&v34);
              v41[0] = &v34;
              std::vector<quasar::Token>::__destroy_vector::operator()[abi:ne180100]((void ***)v41);

            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v37, v57, 16);
          }
          while (v25);
        }

        std::vector<std::vector<std::vector<quasar::Token>>>::push_back[abi:ne180100](v28, (uint64_t)v29);
        v41[0] = v29;
        std::vector<std::vector<quasar::Token>>::__destroy_vector::operator()[abi:ne180100]((void ***)v41);

      }
      v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v56, 16);
    }
    while (v19);
  }

  (*(void (**)(SpeechRecognizer *, uint64_t *, uint64_t))(*(_QWORD *)self->_recognizer.__ptr_ + 56))(self->_recognizer.__ptr_, v28, 3);
  v41[0] = v28;
  std::vector<std::vector<std::vector<quasar::Token>>>::__destroy_vector::operator()[abi:ne180100]((void ***)v41);

}

- (shared_ptr<quasar::SpeechRecognizer>)getRecognizer
{
  SpeechRecognizer **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::SpeechRecognizer> result;

  cntrl = self->_recognizer.__cntrl_;
  *v2 = self->_recognizer.__ptr_;
  v2[1] = (SpeechRecognizer *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (SpeechRecognizer *)self;
  return result;
}

- (shared_ptr<quasar::corrective_reranking::Parser>)getParser
{
  Parser **v2;
  __shared_weak_count *cntrl;
  unint64_t *v4;
  unint64_t v5;
  shared_ptr<quasar::corrective_reranking::Parser> result;

  cntrl = self->_parser.__cntrl_;
  *v2 = self->_parser.__ptr_;
  v2[1] = (Parser *)cntrl;
  if (cntrl)
  {
    v4 = (unint64_t *)((char *)cntrl + 8);
    do
      v5 = __ldxr(v4);
    while (__stxr(v5 + 1, v4));
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (Parser *)self;
  return result;
}

- (void)requestEagerResult:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  SpeechRecognizer *ptr;
  double v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = a3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        ptr = self->_recognizer.__ptr_;
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "doubleValue", (_QWORD)v10);
        quasar::SpeechRecognizer::requestEagerResult((quasar::SpeechRecognizer *)ptr, (int)(v9 * 1000.0));
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (int)getCachedTokensSize
{
  return quasar::SpeechRecognizer::getCachedTokensSize((quasar::SpeechRecognizer *)self->_recognizer.__ptr_);
}

- (void)pauseRecognition
{
  quasar::SpeechRecognizer::pauseRecognition((quasar::SpeechRecognizer *)self->_recognizer.__ptr_);
}

- (void)resumeRecognitionWithLeftContext:(id)a3 rightContext:(id)a4 selectedText:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *formatterQueue;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  id v19;
  void *v20;
  std::vector<std::string>::pointer end;
  __int128 v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  std::string *v26;
  std::string *v27;
  __int128 v28;
  std::string *v29;
  uint64_t ptr;
  _EARSpeechRecognizer *v31;
  void *v32;
  id v33;
  std::vector<std::string> v34;
  id v35;
  __int128 *v36[3];
  _QWORD block[4];
  id v38;
  id location;
  void *__p[2];
  std::string::size_type v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  std::__split_buffer<std::string> __v;
  void **v47[2];
  char v48;
  char v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v32 = v8;
  if (v8 && (objc_msgSend(v8, "ear_toStringOrNothing"), v49))
  {
    if (v48 < 0)
    {
      operator delete(v47[0]);
      if (!v9)
      {
LABEL_34:
        -[_EARSpeechRecognizer resumeRecognitionWithLeftContext:rightContext:selectedText:](self, "resumeRecognitionWithLeftContext:rightContext:selectedText:", v8, &stru_1E5D49530, v10);
        goto LABEL_35;
      }
    }
    else if (!v9)
    {
      goto LABEL_34;
    }
    objc_msgSend(v9, "ear_toStringOrNothing");
    if (v48 < 0)
      operator delete(v47[0]);
    v31 = self;
    objc_initWeak(&location, self);
    formatterQueue = self->_formatterQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __83___EARSpeechRecognizer_resumeRecognitionWithLeftContext_rightContext_selectedText___block_invoke;
    block[3] = &unk_1E5D47160;
    objc_copyWeak(&v38, &location);
    dispatch_async(formatterQueue, block);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v12;
    -[_EARSpeechRecognizer splitWithTokenizer:isLeftContext:shouldTruncate:outTokensInVocab:](self, "splitWithTokenizer:isLeftContext:shouldTruncate:outTokensInVocab:", v32, 1, 1, &v35);
    v13 = v35;

    v14 = v13;
    memset(&v34, 0, sizeof(v34));
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v15 = v14;
    v33 = v15;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    if (v16)
    {
      v17 = *(_QWORD *)v43;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v43 != v17)
            objc_enumerationMutation(v15);
          v19 = *(id *)(*((_QWORD *)&v42 + 1) + 8 * i);
          v20 = v19;
          if (v19)
          {
            objc_msgSend(v19, "ear_toString");
          }
          else
          {
            __p[0] = 0;
            __p[1] = 0;
            v41 = 0;
          }

          end = v34.__end_;
          if (v34.__end_ >= v34.__end_cap_.__value_)
          {
            v23 = 0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_ - (char *)v34.__begin_) >> 3);
            v24 = v23 + 1;
            if (v23 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) > v24)
              v24 = 0x5555555555555556 * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v34.__end_cap_.__value_ - (char *)v34.__begin_) >> 3) >= 0x555555555555555)
              v25 = 0xAAAAAAAAAAAAAAALL;
            else
              v25 = v24;
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v34.__end_cap_;
            if (v25)
              v26 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v34.__end_cap_, v25);
            else
              v26 = 0;
            v27 = v26 + v23;
            __v.__first_ = v26;
            __v.__begin_ = v27;
            __v.__end_cap_.__value_ = &v26[v25];
            v28 = *(_OWORD *)__p;
            v27->__r_.__value_.__r.__words[2] = v41;
            *(_OWORD *)&v27->__r_.__value_.__l.__data_ = v28;
            __p[1] = 0;
            v41 = 0;
            __p[0] = 0;
            __v.__end_ = v27 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v34, &__v);
            v29 = v34.__end_;
            std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
            v34.__end_ = v29;
            v15 = v33;
            if (SHIBYTE(v41) < 0)
              operator delete(__p[0]);
          }
          else
          {
            v22 = *(_OWORD *)__p;
            v34.__end_->__r_.__value_.__r.__words[2] = v41;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v22;
            v34.__end_ = end + 1;
          }

        }
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
      }
      while (v16);
    }

    -[_EARRelevantTextContext setLeftContext:rightContext:](v31->_relevantTextContext, "setLeftContext:rightContext:", v32, v9);
    -[_EARRelevantTextContext setFavorCommandSuppression:](v31->_relevantTextContext, "setFavorCommandSuppression:", 0);
    -[_EARRelevantTextContext setAbortCommandSuppression:](v31->_relevantTextContext, "setAbortCommandSuppression:", 0);
    ptr = (uint64_t)v31->_recognizer.__ptr_;
    -[_EARSpeechRecognizer splitWithTokenizer:isLeftContext:shouldTruncate:outTokensInVocab:](v31, "splitWithTokenizer:isLeftContext:shouldTruncate:outTokensInVocab:", v9, 0, 1, 0);
    quasar::SpeechRecognizer::resumeRecognition(ptr, (__int128 **)&v34, v36, (uint64_t)v47, 0);
    *(_QWORD *)&v42 = v47;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
    v47[0] = (void **)&v34;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v47);
    v47[0] = (void **)v36;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v47);

    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }
  else
  {
    -[_EARSpeechRecognizer resumeRecognitionWithLeftContext:rightContext:selectedText:](self, "resumeRecognitionWithLeftContext:rightContext:selectedText:", &stru_1E5D49530, v9, v10);
  }
LABEL_35:

}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9 undoEvent:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;

  v23 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (v23)
    -[_EARRelevantTextContext setLeftContext:](self->_relevantTextContext, "setLeftContext:", v23);
  if (v16)
    -[_EARRelevantTextContext setRightContext:](self->_relevantTextContext, "setRightContext:", v16);
  if (v18)
    -[_EARRelevantTextContext setDisambiguationActive:](self->_relevantTextContext, "setDisambiguationActive:", objc_msgSend(v18, "BOOLValue"));
  if (v19)
    -[_EARRelevantTextContext setCursorInVisibleText:](self->_relevantTextContext, "setCursorInVisibleText:", objc_msgSend(v19, "BOOLValue"));
  if (v20)
    -[_EARRelevantTextContext setFavorCommandSuppression:](self->_relevantTextContext, "setFavorCommandSuppression:", objc_msgSend(v20, "BOOLValue"));
  if (v21)
  {
    -[_EARRelevantTextContext setAbortCommandSuppression:](self->_relevantTextContext, "setAbortCommandSuppression:", objc_msgSend(v21, "BOOLValue"));
    if (objc_msgSend(v21, "BOOLValue"))
      -[_EARRelevantTextContext setFavorCommandSuppression:](self->_relevantTextContext, "setFavorCommandSuppression:", 0);
  }
  if (v22 && objc_msgSend(v22, "BOOLValue"))
    -[_EARRelevantTextContext notifyUndoEventFromClient](self->_relevantTextContext, "notifyUndoEventFromClient");

}

- (void)updateVoiceCommandContextWithPrefixText:(id)a3 postfixText:(id)a4 selectedText:(id)a5 disambiguationActive:(id)a6 cursorInVisibleText:(id)a7 favorCommandSuppression:(id)a8 abortCommandSuppression:(id)a9
{
  -[_EARSpeechRecognizer updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:](self, "updateVoiceCommandContextWithPrefixText:postfixText:selectedText:disambiguationActive:cursorInVisibleText:favorCommandSuppression:abortCommandSuppression:undoEvent:", a3, a4, a5, a6, a7, a8, a9, 0);
}

- (id)tokenizeTextFromEnd:(id)a3 withLimit:(unint64_t)a4 outTokensInVocab:(id *)a5
{
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  id v14;
  void *v15;
  SpeechRecognizer *ptr;
  void **v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  _QWORD *v22;
  unsigned int v23;
  void **v24;
  uint64_t v25;
  void **p_p;
  uint64_t v27;
  _QWORD *v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  unsigned int v32;
  void **v33;
  uint64_t v34;
  void **v35;
  uint64_t v36;
  _QWORD *v37;
  void *context;
  id v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45[2];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  void *__p;
  uint64_t v63;
  uint64_t v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v41 = a3;
  context = (void *)MEMORY[0x1AF44DFA0]();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "systemUptime");

  if (objc_msgSend(v41, "length"))
  {
    -[_EARSpeechRecognizer _tokenizer](self, "_tokenizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tokenize:limit:", v41, a4);
    v40 = (id)objc_claimAutoreleasedReturnValue();

    if (!a5)
      goto LABEL_27;
  }
  else
  {
    v40 = 0;
    if (!a5)
      goto LABEL_27;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v40, "reverseObjectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v66;
    while (2)
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v66 != v12)
          objc_enumerationMutation(v10);
        v14 = *(id *)(*((_QWORD *)&v65 + 1) + 8 * i);
        v15 = v14;
        ptr = self->_recognizer.__ptr_;
        if (v14)
        {
          objc_msgSend(v14, "ear_toString");
        }
        else
        {
          __p = 0;
          v63 = 0;
          v64 = 0;
        }
        quasar::SpeechRecognizer::findWord((quasar::SpeechRecognizer *)ptr, (uint64_t)&__p, (std::string *)v45);
        if (SHIBYTE(v64) < 0)
          operator delete(__p);
        if (SBYTE7(v46) < 0)
        {
          v17 = (void **)v45[0];
          if (!v45[1])
          {
            operator delete(v45[0]);
LABEL_25:

            goto LABEL_26;
          }
        }
        else
        {
          if (!BYTE7(v46))
            goto LABEL_25;
          v17 = v45;
        }
        v18 = *a5;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v17);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "insertObject:atIndex:", v19, 0);

        if (SBYTE7(v46) < 0)
          operator delete(v45[0]);

      }
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v65, v69, 16);
      if (v11)
        continue;
      break;
    }
  }
LABEL_26:

LABEL_27:
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "systemUptime");

  v21 = quasar::gLogLevel;
  if (quasar::gLogLevel >= 6)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    *(_OWORD *)v45 = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v45);
    v22 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)"Tokenized text: \", 17);
    if (v41)
    {
      objc_msgSend(v41, "ear_toString");
      v23 = HIBYTE(v64);
      v24 = (void **)__p;
      v25 = v63;
    }
    else
    {
      v25 = 0;
      v24 = 0;
      v23 = 0;
      __p = 0;
      v63 = 0;
      v64 = 0;
    }
    if ((v23 & 0x80u) == 0)
      p_p = &__p;
    else
      p_p = v24;
    if ((v23 & 0x80u) == 0)
      v27 = v23;
    else
      v27 = v25;
    v28 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v22, (uint64_t)p_p, v27);
    v29 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v28, (uint64_t)"\" to \", 6);
    objc_msgSend(v40, "componentsJoinedByString:", CFSTR("\", \"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = v30;
    if (v30)
    {
      objc_msgSend(v30, "ear_toString");
      v32 = HIBYTE(v44);
      v33 = (void **)v42;
      v34 = v43;
    }
    else
    {
      v34 = 0;
      v33 = 0;
      v32 = 0;
      v42 = 0;
      v43 = 0;
      v44 = 0;
    }
    if ((v32 & 0x80u) == 0)
      v35 = &v42;
    else
      v35 = v33;
    if ((v32 & 0x80u) == 0)
      v36 = v32;
    else
      v36 = v34;
    v37 = std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v29, (uint64_t)v35, v36);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v37, (uint64_t)"\", 1);
    if (SHIBYTE(v44) < 0)
      operator delete(v42);

    if (SHIBYTE(v64) < 0)
      operator delete(__p);
    quasar::QuasarTraceMessage::~QuasarTraceMessage((quasar::QuasarTraceMessage *)v45);
    v21 = quasar::gLogLevel;
  }
  if (v21 >= 4)
  {
    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v50 = 0u;
    v51 = 0u;
    v48 = 0u;
    v49 = 0u;
    v46 = 0u;
    v47 = 0u;
    *(_OWORD *)v45 = 0u;
    kaldi::KaldiWarnMessage::KaldiWarnMessage((kaldi::KaldiWarnMessage *)v45);
    std::__put_character_sequence[abi:ne180100]<char,std::char_traits<char>>(v45, (uint64_t)"Tokenization duration:", 22);
    std::ostream::operator<<();
    quasar::QuasarInfoMessage::~QuasarInfoMessage((quasar::QuasarInfoMessage *)v45);
  }
  objc_autoreleasePoolPop(context);

  return v40;
}

- (vector<std::string,)splitWithTokenizer:(_EARSpeechRecognizer *)self outTokensInVocab:(SEL)a3 isLeftContext:(id)a4
{
  _BOOL4 v6;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  id v16;
  void *v17;
  std::vector<std::string>::pointer end;
  __int128 v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  std::string *v23;
  std::string *v24;
  __int128 v25;
  std::string *v26;
  vector<std::string, std::allocator<std::string>> *result;
  id v28;
  std::vector<std::string> v29;
  void *__p[2];
  std::string::size_type v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  std::__split_buffer<std::string> __v;
  void **v37[18];

  v6 = a6;
  v37[16] = *(void ***)MEMORY[0x1E0C80C00];
  v10 = a4;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  retstr->__begin_ = 0;
  v28 = v10;
  if (objc_msgSend(v10, "length"))
  {
    if (v6)
    {
      if (self->_enableVoiceCommands)
        v11 = 50;
      else
        v11 = 4;
    }
    else
    {
      v11 = 4;
    }
    -[_EARSpeechRecognizer tokenizeTextFromEnd:withLimit:outTokensInVocab:](self, "tokenizeTextFromEnd:withLimit:outTokensInVocab:", v28, v11, a5);
    memset(&v29, 0, sizeof(v29));
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v33;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v33 != v14)
            objc_enumerationMutation(v12);
          v16 = *(id *)(*((_QWORD *)&v32 + 1) + 8 * i);
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "ear_toString");
          }
          else
          {
            __p[0] = 0;
            __p[1] = 0;
            v31 = 0;
          }

          end = v29.__end_;
          if (v29.__end_ >= v29.__end_cap_.__value_)
          {
            v20 = 0xAAAAAAAAAAAAAAABLL * (((char *)v29.__end_ - (char *)v29.__begin_) >> 3);
            v21 = v20 + 1;
            if (v20 + 1 > 0xAAAAAAAAAAAAAAALL)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            if (0x5555555555555556 * (((char *)v29.__end_cap_.__value_ - (char *)v29.__begin_) >> 3) > v21)
              v21 = 0x5555555555555556 * (((char *)v29.__end_cap_.__value_ - (char *)v29.__begin_) >> 3);
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v29.__end_cap_.__value_ - (char *)v29.__begin_) >> 3) >= 0x555555555555555)
              v22 = 0xAAAAAAAAAAAAAAALL;
            else
              v22 = v21;
            __v.__end_cap_.__value_ = (std::allocator<std::string> *)&v29.__end_cap_;
            if (v22)
              v23 = (std::string *)std::__allocate_at_least[abi:ne180100]<std::allocator<std::vector<int>>>((uint64_t)&v29.__end_cap_, v22);
            else
              v23 = 0;
            v24 = v23 + v20;
            __v.__first_ = v23;
            __v.__begin_ = v24;
            __v.__end_cap_.__value_ = &v23[v22];
            v25 = *(_OWORD *)__p;
            v24->__r_.__value_.__r.__words[2] = v31;
            *(_OWORD *)&v24->__r_.__value_.__l.__data_ = v25;
            __p[1] = 0;
            v31 = 0;
            __p[0] = 0;
            __v.__end_ = v24 + 1;
            std::vector<std::string>::__swap_out_circular_buffer(&v29, &__v);
            v26 = v29.__end_;
            std::__split_buffer<std::string>::~__split_buffer((std::__split_buffer<std::wstring> *)&__v);
            v29.__end_ = v26;
            if (SHIBYTE(v31) < 0)
              operator delete(__p[0]);
          }
          else
          {
            v19 = *(_OWORD *)__p;
            v29.__end_->__r_.__value_.__r.__words[2] = v31;
            *(_OWORD *)&end->__r_.__value_.__l.__data_ = v19;
            v29.__end_ = end + 1;
          }

        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      }
      while (v13);
    }

    std::vector<std::string>::__vdeallocate((std::vector<std::wstring> *)retstr);
    *(std::vector<std::string> *)retstr = v29;
    memset(&v29, 0, sizeof(v29));
    v37[0] = (void **)&v29;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100](v37);

  }
  return result;
}

- (vector<std::string,)splitWithTokenizer:(_EARSpeechRecognizer *)self isLeftContext:(SEL)a3 shouldTruncate:(id)a4 outTokensInVocab:(BOOL)a5
{
  _BOOL4 v8;
  _BOOL8 v9;
  id v11;
  void *v12;
  void *v13;
  __CFString *v14;
  vector<std::string, std::allocator<std::string>> *result;
  id v16;

  v8 = a6;
  v9 = a5;
  v11 = a4;
  v16 = v11;
  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "componentsSeparatedByCharactersInSet:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = &stru_1E5D49530;
    if (objc_msgSend(v13, "count"))
    {
      if (v9)
        objc_msgSend(v13, "lastObject");
      else
        objc_msgSend(v13, "firstObject");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    -[_EARSpeechRecognizer splitWithTokenizer:outTokensInVocab:isLeftContext:](self, "splitWithTokenizer:outTokensInVocab:isLeftContext:", v14, a7, v9);

  }
  else
  {
    -[_EARSpeechRecognizer splitWithTokenizer:outTokensInVocab:isLeftContext:](self, "splitWithTokenizer:outTokensInVocab:isLeftContext:", v11, a7, v9);
  }

  return result;
}

- (NSData)userProfileData
{
  return self->_userProfileData;
}

- (NSData)jitProfileData
{
  return self->_jitProfileData;
}

- (_EARSpeechModelInfo)modelInfo
{
  return self->_modelInfo;
}

- (_EARSpeakerCodeInfo)speakerCodeInfo
{
  return self->_speakerCodeInfo;
}

- (BOOL)detectUtterances
{
  return self->_detectUtterances;
}

- (void)setDetectUtterances:(BOOL)a3
{
  self->_detectUtterances = a3;
}

- (BOOL)concatenateUtterances
{
  return self->_concatenateUtterances;
}

- (void)setConcatenateUtterances:(BOOL)a3
{
  self->_concatenateUtterances = a3;
}

- (BOOL)allowUtteranceDelay
{
  return self->_allowUtteranceDelay;
}

- (void)setAllowUtteranceDelay:(BOOL)a3
{
  self->_allowUtteranceDelay = a3;
}

- (BOOL)formatAcrossUtterances
{
  return self->_formatAcrossUtterances;
}

- (void)setFormatAcrossUtterances:(BOOL)a3
{
  self->_formatAcrossUtterances = a3;
}

- (double)endpointStart
{
  return self->_endpointStart;
}

- (void)setEndpointStart:(double)a3
{
  self->_endpointStart = a3;
}

- (BOOL)recognizeEagerCandidates
{
  return self->_recognizeEagerCandidates;
}

- (void)setRecognizeEagerCandidates:(BOOL)a3
{
  self->_recognizeEagerCandidates = a3;
}

- (BOOL)farField
{
  return self->_farField;
}

- (void)setFarField:(BOOL)a3
{
  self->_farField = a3;
}

- (BOOL)highPriority
{
  return self->_highPriority;
}

- (BOOL)enableSpeakerCodeTraining
{
  return self->_enableSpeakerCodeTraining;
}

- (void)setEnableSpeakerCodeTraining:(BOOL)a3
{
  self->_enableSpeakerCodeTraining = a3;
}

- (double)maximumRecognitionDuration
{
  return self->_maximumRecognitionDuration;
}

- (void)setMaximumRecognitionDuration:(double)a3
{
  self->_maximumRecognitionDuration = a3;
}

- (NSDictionary)recognitionReplacements
{
  return self->_recognitionReplacements;
}

- (void)setRecognitionReplacements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 328);
}

- (NSDictionary)recognitionConfidenceSubtraction
{
  return self->_recognitionConfidenceSubtraction;
}

- (void)setRecognitionConfidenceSubtraction:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 336);
}

- (NSArray)leftContext
{
  return self->_leftContext;
}

- (NSString)inputOrigin
{
  return self->_inputOrigin;
}

- (void)setInputOrigin:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 352);
}

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 360);
}

- (NSString)refTranscriptForErrorBlaming
{
  return self->_refTranscriptForErrorBlaming;
}

- (void)setRefTranscriptForErrorBlaming:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 368);
}

- (NSString)bluetoothDeviceId
{
  return self->_bluetoothDeviceId;
}

- (void)setBluetoothDeviceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 376);
}

- (NSString)userId
{
  return self->_userId;
}

- (void)setUserId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 384);
}

- (NSString)sessionId
{
  return self->_sessionId;
}

- (void)setSessionId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 392);
}

- (NSArray)extraLmList
{
  return self->_extraLmList;
}

- (void)setExtraLmList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 400);
}

- (NSArray)scoreNbestExtraLmList
{
  return self->_scoreNbestExtraLmList;
}

- (void)setScoreNbestExtraLmList:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 408);
}

- (BOOL)scoreNbest
{
  return self->_scoreNbest;
}

- (void)setScoreNbest:(BOOL)a3
{
  self->_scoreNbest = a3;
}

- (BOOL)atypicalSpeech
{
  return self->_atypicalSpeech;
}

- (void)setAtypicalSpeech:(BOOL)a3
{
  self->_atypicalSpeech = a3;
}

- (double)latitude
{
  return self->_latitude;
}

- (void)setLatitude:(double)a3
{
  self->_latitude = a3;
}

- (double)longitude
{
  return self->_longitude;
}

- (void)setLongitude:(double)a3
{
  self->_longitude = a3;
}

- (BOOL)disableAutoPunctuation
{
  return self->_disableAutoPunctuation;
}

- (void)setDisableAutoPunctuation:(BOOL)a3
{
  self->_disableAutoPunctuation = a3;
}

- (BOOL)disablePartialResults
{
  return self->_disablePartialResults;
}

- (void)setDisablePartialResults:(BOOL)a3
{
  self->_disablePartialResults = a3;
}

- (BOOL)shouldGenerateVoiceCommandCandidates
{
  return self->_shouldGenerateVoiceCommandCandidates;
}

- (void)setShouldGenerateVoiceCommandCandidates:(BOOL)a3
{
  self->_shouldGenerateVoiceCommandCandidates = a3;
}

- (BOOL)disableContextualBiasing
{
  return self->_disableContextualBiasing;
}

- (void)setDisableContextualBiasing:(BOOL)a3
{
  self->_disableContextualBiasing = a3;
}

- (EARVoiceCommandActiveSet)voiceCommandActiveSet
{
  return self->_voiceCommandActiveSet;
}

- (BOOL)recognizeEmoji
{
  return self->_recognizeEmoji;
}

- (void)setRecognizeEmoji:(BOOL)a3
{
  self->_recognizeEmoji = a3;
}

- (NSString)rightContext
{
  return self->_rightContext;
}

- (NSString)selectedText
{
  return self->_selectedText;
}

- (void)setSelectedText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (NSString)aneContext
{
  return self->_aneContext;
}

- (void)setAneContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 456);
}

- (NSString)cpuContext
{
  return self->_cpuContext;
}

- (void)setCpuContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 464);
}

- (NSString)gpuContext
{
  return self->_gpuContext;
}

- (void)setGpuContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 472);
}

- (_EARRecognitionMetrics)recognitionMetrics
{
  return self->_recognitionMetrics;
}

- (void)setRecognitionMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (NSArray)leftContextForItn
{
  return self->_leftContextForItn;
}

- (void)setLeftContextForItn:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 488);
}

- (NSString)configPath
{
  return self->_configPath;
}

- (NSNumber)overrideDoServerSideEndpointing
{
  return self->_overrideDoServerSideEndpointing;
}

- (void)setOverrideDoServerSideEndpointing:(id)a3
{
  objc_storeStrong((id *)&self->_overrideDoServerSideEndpointing, a3);
}

- (_EARRelevantTextContext)relevantTextContext
{
  return self->_relevantTextContext;
}

- (void)setRelevantTextContext:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 512);
}

- (void).cxx_destruct
{
  __shared_weak_count *cntrl;
  vector<std::string, std::allocator<std::string>> *p_rightContextTokens;

  objc_storeStrong((id *)&self->_relevantTextContext, 0);
  objc_storeStrong((id *)&self->_overrideDoServerSideEndpointing, 0);
  objc_storeStrong((id *)&self->_configPath, 0);
  objc_storeStrong((id *)&self->_leftContextForItn, 0);
  objc_storeStrong((id *)&self->_recognitionMetrics, 0);
  objc_storeStrong((id *)&self->_gpuContext, 0);
  objc_storeStrong((id *)&self->_cpuContext, 0);
  objc_storeStrong((id *)&self->_aneContext, 0);
  objc_storeStrong((id *)&self->_selectedText, 0);
  objc_storeStrong((id *)&self->_rightContext, 0);
  objc_storeStrong((id *)&self->_voiceCommandActiveSet, 0);
  objc_storeStrong((id *)&self->_scoreNbestExtraLmList, 0);
  objc_storeStrong((id *)&self->_extraLmList, 0);
  objc_storeStrong((id *)&self->_sessionId, 0);
  objc_storeStrong((id *)&self->_userId, 0);
  objc_storeStrong((id *)&self->_bluetoothDeviceId, 0);
  objc_storeStrong((id *)&self->_refTranscriptForErrorBlaming, 0);
  objc_storeStrong((id *)&self->_deviceId, 0);
  objc_storeStrong((id *)&self->_inputOrigin, 0);
  objc_storeStrong((id *)&self->_leftContext, 0);
  objc_storeStrong((id *)&self->_recognitionConfidenceSubtraction, 0);
  objc_storeStrong((id *)&self->_recognitionReplacements, 0);
  objc_storeStrong((id *)&self->_speakerCodeInfo, 0);
  objc_storeStrong((id *)&self->_modelInfo, 0);
  objc_storeStrong((id *)&self->_jitProfileData, 0);
  objc_storeStrong((id *)&self->_userProfileData, 0);
  objc_storeStrong((id *)&self->_tokenizer, 0);
  objc_storeStrong((id *)&self->_onScreenContextForEditLme, 0);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_modelInitializeContext);
  p_rightContextTokens = &self->_rightContextTokens;
  std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&p_rightContextTokens);
  objc_storeStrong((id *)&self->_userProfiles, 0);
  objc_storeStrong((id *)&self->_muxIds, 0);
  objc_storeStrong((id *)&self->_muxIdReverseMask, 0);
  objc_storeStrong((id *)&self->_muxIdMask, 0);
  objc_storeStrong((id *)&self->_recognitionQueue, 0);
  objc_storeStrong((id *)&self->_currentTask, 0);
  objc_storeStrong((id *)&self->_currentLanguage, 0);
  cntrl = self->_currentResultStreamWrapper.__cntrl_;
  if (cntrl)
    std::__shared_weak_count::__release_weak((std::__shared_weak_count *)cntrl);
  objc_destroyWeak((id *)&self->_currentAudioBuffer);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_parser);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_recognizer);
  objc_storeStrong((id *)&self->_endsOfSentencePunctuations, 0);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_voiceCommandCompilation);
  std::shared_ptr<kaldi::quasar::ShortlistDataOnDisk>::~shared_ptr[abi:ne180100]((uint64_t)&self->_training);
  objc_storeStrong((id *)&self->_trainingQueue, 0);
  objc_storeStrong((id *)&self->_formatter, 0);
  objc_storeStrong((id *)&self->_formatterQueue, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 15) = 0;
  *((_QWORD *)self + 16) = 0;
  *((_OWORD *)self + 2) = 0u;
  *((_OWORD *)self + 3) = 0u;
  *((_OWORD *)self + 5) = 0u;
  *((_OWORD *)self + 6) = 0u;
  *(_OWORD *)((char *)self + 200) = 0u;
  *(_OWORD *)((char *)self + 216) = 0u;
  *((_QWORD *)self + 29) = 0;
  return self;
}

- (void)initWithConfiguration:(uint64_t)a1 overrides:(NSObject *)a2 overrideConfigFiles:language:activeConfiguration:modelLoadingOptions:enableSpeakerCodeTraining:supportEmojiRecognition:voiceCommandActiveSet:modelContextDelegate:enableItn:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(*(_QWORD *)a1 + 24);
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_1AD756000, a2, OS_LOG_TYPE_ERROR, "Could not build recognizer: %d", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_3_0();
}

+ (void)compileRecognizerModelsWithConfiguration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_2(a1);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_2(&dword_1AD756000, a2, v3, "Exception (...): %s", v4);
  OUTLINED_FUNCTION_3();
}

+ (void)compileRecognizerModelsWithConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_2(&dword_1AD756000, v0, v1, "Unexpected exception while compiling recognizer models with configuration path: %@", v2);
  OUTLINED_FUNCTION_1();
}

+ (void)purgeCompiledRecognizerModelsWithConfiguration:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_2_2(&dword_1AD756000, v0, v1, "Unexpected exception while purging compiled recognizer models with configuration path: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end
