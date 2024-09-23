@implementation DEExecutor

- (void)LogCurareCATExecution:(const void *)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  std::string v7;
  std::string v8;
  std::string v9;
  std::string __p;
  std::string v11;
  std::string v12;
  std::string v13;
  std::string v14;

  if (*((char *)a3 + 55) < 0)
    std::string::__init_copy_ctor_external(&v14, *((const std::string::value_type **)a3 + 4), *((_QWORD *)a3 + 5));
  else
    v14 = *(std::string *)((char *)a3 + 32);
  if (*((char *)a3 + 343) < 0)
    std::string::__init_copy_ctor_external(&v13, *((const std::string::value_type **)a3 + 40), *((_QWORD *)a3 + 41));
  else
    v13 = *(std::string *)((char *)a3 + 320);
  if (*((char *)a3 + 127) < 0)
    std::string::__init_copy_ctor_external(&v12, *((const std::string::value_type **)a3 + 13), *((_QWORD *)a3 + 14));
  else
    v12 = *(std::string *)((char *)a3 + 104);
  if (*((char *)a3 + 151) < 0)
    std::string::__init_copy_ctor_external(&v11, *((const std::string::value_type **)a3 + 16), *((_QWORD *)a3 + 17));
  else
    v11 = *(std::string *)((char *)a3 + 128);
  v4 = MEMORY[0x1E0C80D38];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3321888768;
  v6[2] = __36__DEExecutor_LogCurareCATExecution___block_invoke;
  v6[3] = &__block_descriptor_128_ea8_32c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE56c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE80c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE104c67_ZTSKNSt3__112basic_stringIcNS_11char_traitsIcEENS_9allocatorIcEEEE_e5_v8__0l;
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v7, v14.__r_.__value_.__l.__data_, v14.__r_.__value_.__l.__size_);
  else
    v7 = v14;
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v8, v13.__r_.__value_.__l.__data_, v13.__r_.__value_.__l.__size_);
  else
    v8 = v13;
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v9, v12.__r_.__value_.__l.__data_, v12.__r_.__value_.__l.__size_);
  else
    v9 = v12;
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&__p, v11.__r_.__value_.__l.__data_, v11.__r_.__value_.__l.__size_);
  else
    __p = v11;
  v5 = (void *)MEMORY[0x1E0C80D38];
  dispatch_async(MEMORY[0x1E0C80D38], v6);

  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  if (SHIBYTE(v9.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v9.__r_.__value_.__l.__data_);
  if (SHIBYTE(v8.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v8.__r_.__value_.__l.__data_);
  if (SHIBYTE(v7.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v7.__r_.__value_.__l.__data_);
  if (SHIBYTE(v11.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v11.__r_.__value_.__l.__data_);
  if (SHIBYTE(v12.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v12.__r_.__value_.__l.__data_);
  if (SHIBYTE(v13.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v13.__r_.__value_.__l.__data_);
  if (SHIBYTE(v14.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v14.__r_.__value_.__l.__data_);
}

- (DEExecutor)init
{
  DEExecutor *v2;
  DEExecutor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DEExecutor;
  v2 = -[DEExecutor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[DEExecutor setVisual:](v2, "setVisual:", 0);
    -[DEExecutor setDebug:](v3, "setDebug:", 0);
    -[DEExecutor setTest:](v3, "setTest:", 0);
    -[DEExecutor setResetState:](v3, "setResetState:", 0);
    -[DEExecutor setMultiuser:](v3, "setMultiuser:", 0);
    -[DEExecutor setGrounding:](v3, "setGrounding:", 0);
    -[DEExecutor setEnableUpdates:](v3, "setEnableUpdates:", 0);
    -[DEExecutor setCreateTrace:](v3, "setCreateTrace:", 0);
    -[DEExecutor setSwitchFallthrough:](v3, "setSwitchFallthrough:", 0);
    -[DEExecutor setIncludeKeywords:](v3, "setIncludeKeywords:", 0);
  }
  return v3;
}

- (id)getRequestJSON
{
  void *v3;
  void *v4;
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
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
  void *v39;
  const char *v40;
  id v41;
  void *v42;
  id v44;

  v3 = (void *)objc_opt_new();
  -[DEExecutor catId](self, "catId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DEExecutor catId](self, "catId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v5, CFSTR("catId"));

  }
  -[DEExecutor parameters](self, "parameters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[DEExecutor parameters](self, "parameters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v7, CFSTR("parameters"));

  }
  -[DEExecutor templateDir](self, "templateDir");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[DEExecutor templateDir](self, "templateDir");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v9, CFSTR("templateDir"));

  }
  -[DEExecutor locale](self, "locale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[DEExecutor locale](self, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v11, CFSTR("locale"));

  }
  -[DEExecutor globalParameters](self, "globalParameters");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[DEExecutor globalParameters](self, "globalParameters");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v13, CFSTR("globalParameters"));

  }
  -[DEExecutor userSettings](self, "userSettings");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    -[DEExecutor userSettings](self, "userSettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v15, CFSTR("userSettings"));

  }
  if (-[DEExecutor visual](self, "visual"))
    objc_msgSend(v3, "setValue:forKey:", CFSTR("visual"), CFSTR("requestType"));
  if (-[DEExecutor debug](self, "debug"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v16, CFSTR("debug"));

  }
  if (-[DEExecutor test](self, "test"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v17, CFSTR("test"));

  }
  if (-[DEExecutor resetState](self, "resetState"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v18, CFSTR("resetState"));

  }
  if (-[DEExecutor multiuser](self, "multiuser"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v19, CFSTR("multiuser"));

  }
  if (-[DEExecutor grounding](self, "grounding"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v20, CFSTR("grounding"));

  }
  -[DEExecutor voiceGender](self, "voiceGender");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    -[DEExecutor voiceGender](self, "voiceGender");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v22, CFSTR("voiceGender"));

  }
  -[DEExecutor dialogMetadata](self, "dialogMetadata");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[DEExecutor dialogMetadata](self, "dialogMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v24, CFSTR("dialogMetadata"));

  }
  -[DEExecutor interactionId](self, "interactionId");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[DEExecutor interactionId](self, "interactionId");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v26, CFSTR("interactionId"));

  }
  -[DEExecutor executionRequestId](self, "executionRequestId");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (v27)
  {
    -[DEExecutor executionRequestId](self, "executionRequestId");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v28, CFSTR("executionRequestId"));

  }
  if (-[DEExecutor randomSeed](self, "randomSeed"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", -[DEExecutor randomSeed](self, "randomSeed"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("randomSeed"));

  }
  if (-[DEExecutor currentTime](self, "currentTime"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", -[DEExecutor currentTime](self, "currentTime"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v30, CFSTR("currentTime"));

  }
  if (-[DEExecutor isSpotlight](self, "isSpotlight"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v31, CFSTR("isSpotlight"));

  }
  -[DEExecutor customPronunciations](self, "customPronunciations");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  if (v32)
  {
    -[DEExecutor customPronunciations](self, "customPronunciations");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v33, CFSTR("customPronunciations"));

  }
  if (-[DEExecutor createTrace](self, "createTrace"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v34, CFSTR("createTrace"));

  }
  if (-[DEExecutor switchFallthrough](self, "switchFallthrough"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v35, CFSTR("switchFallthrough"));

  }
  if (-[DEExecutor deterministic](self, "deterministic"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v36, CFSTR("deterministic"));

  }
  if (-[DEExecutor isLabelMode](self, "isLabelMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v37, CFSTR("labelMode"));

  }
  if (-[DEExecutor includeKeywords](self, "includeKeywords"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v38, CFSTR("includeKeywords"));

  }
  v44 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 3, &v44);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = v44;
  if (v39)
  {
    v42 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v39, 4);
  }
  else
  {
    siri::dialogengine::Log::Error((siri::dialogengine::Log *)"Failed to parse input parameters for CAT request", v40);
    v39 = 0;
    v42 = 0;
  }

  return v42;
}

- (shared_ptr<siri::dialogengine::Context>)getContext:(ElapsedTimer *)a3
{
  _QWORD *v3;
  std::__shared_weak_count *v4;
  _QWORD *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  siri::dialogengine::VariableObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *p_shared_owners;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *v28;
  unint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  unint64_t *v34;
  unint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  unint64_t *v40;
  unint64_t v41;
  void *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  unint64_t *v46;
  unint64_t v47;
  uint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  uint64_t v52;
  std::__shared_weak_count *v53;
  unint64_t *v54;
  unint64_t v55;
  uint64_t v56;
  std::__shared_weak_count *v57;
  unint64_t *v58;
  unint64_t v59;
  uint64_t v60;
  std::__shared_weak_count *v61;
  unint64_t *v62;
  unint64_t v63;
  uint64_t v64;
  std::__shared_weak_count *v65;
  unint64_t *v66;
  unint64_t v67;
  uint64_t v68;
  std::__shared_weak_count *v69;
  unint64_t *v70;
  unint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  std::__shared_weak_count *v75;
  unint64_t *v76;
  unint64_t v77;
  void *v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  unint64_t *v82;
  unint64_t v83;
  void *v84;
  uint64_t v85;
  id v86;
  unint64_t *v87;
  unint64_t v88;
  void *v89;
  uint64_t v90;
  id v91;
  unint64_t *v92;
  unint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  std::__shared_weak_count *v97;
  unint64_t *v98;
  unint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  std::__shared_weak_count *v103;
  unint64_t *v104;
  unint64_t v105;
  uint64_t v106;
  std::__shared_weak_count *v107;
  unint64_t *v108;
  unint64_t v109;
  uint64_t v110;
  std::__shared_weak_count *v111;
  unint64_t *v112;
  unint64_t v113;
  const char *v114;
  char *v115;
  void *v116;
  char *v117;
  _QWORD *v118;
  _BOOL4 v119;
  uint64_t v120;
  uint64_t v121;
  std::__shared_weak_count *v122;
  unint64_t *v123;
  unint64_t v124;
  void *v125;
  uint64_t v126;
  void *v127;
  uint64_t v128;
  std::__shared_weak_count *v129;
  unint64_t *v130;
  unint64_t v131;
  uint64_t v132;
  uint64_t v133;
  std::__shared_weak_count *v134;
  unint64_t *v135;
  unint64_t v136;
  uint64_t v137;
  uint64_t v138;
  std::__shared_weak_count *v139;
  unint64_t *v140;
  unint64_t v141;
  uint64_t v142;
  uint64_t v143;
  std::__shared_weak_count *v144;
  unint64_t *v145;
  unint64_t v146;
  uint64_t v147;
  std::__shared_weak_count *v148;
  unint64_t *v149;
  unint64_t v150;
  uint64_t v151;
  std::__shared_weak_count *v152;
  unint64_t *v153;
  unint64_t v154;
  NSObject *v155;
  NSObject *v156;
  siri::dialogengine *v157;
  id v158;
  std::__shared_weak_count *v159;
  unint64_t *v160;
  unint64_t v161;
  unint64_t *v162;
  unint64_t v163;
  std::__shared_weak_count *size;
  unint64_t *v165;
  unint64_t v166;
  std::__shared_weak_count *v167;
  unint64_t *v168;
  unint64_t v169;
  uint64_t v170;
  void *v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  unint64_t *v175;
  unint64_t v176;
  Context *v177;
  __shared_weak_count *v178;
  _OWORD *v179;
  __int128 v180;
  __int128 v181;
  std::__shared_weak_count *v182;
  unint64_t *v183;
  unint64_t v184;
  uint64_t v185;
  uint64_t v186;
  std::__shared_weak_count *v187;
  unint64_t *v188;
  unint64_t v189;
  uint64_t v190;
  std::__shared_weak_count *v191;
  uint64_t v192;
  std::__shared_weak_count *v193;
  std::string __p;
  std::string v195;
  __int128 v196;
  uint64_t v197;
  std::__shared_weak_count *v198;
  uint64_t v199;
  std::__shared_weak_count *v200;
  uint64_t v201;
  std::__shared_weak_count *v202;
  uint64_t v203;
  std::__shared_weak_count *v204;
  uint64_t v205;
  std::__shared_weak_count *v206;
  uint64_t v207;
  std::__shared_weak_count *v208;
  uint64_t v209;
  std::__shared_weak_count *v210;
  uint64_t v211;
  std::__shared_weak_count *v212;
  uint64_t v213;
  std::__shared_weak_count *v214;
  uint64_t v215;
  std::__shared_weak_count *v216;
  uint64_t v217;
  std::__shared_weak_count *v218;
  uint64_t v219;
  std::__shared_weak_count *v220;
  uint64_t v221;
  std::__shared_weak_count *v222;
  uint64_t v223;
  std::__shared_weak_count *v224;
  uint64_t v225;
  std::__shared_weak_count *v226;
  uint64_t v227;
  std::__shared_weak_count *v228;
  uint64_t v229;
  std::__shared_weak_count *v230;
  uint64_t v231;
  std::__shared_weak_count *v232;
  uint64_t v233;
  std::__shared_weak_count *v234;
  uint64_t v235;
  std::__shared_weak_count *v236;
  uint64_t v237;
  std::__shared_weak_count *v238;
  uint64_t v239;
  std::__shared_weak_count *v240;
  uint64_t v241;
  std::__shared_weak_count *v242;
  uint64_t v243;
  std::__shared_weak_count *v244;
  uint64_t v245;
  std::__shared_weak_count *v246;
  uint64_t v247;
  std::__shared_weak_count *v248;
  uint64_t v249;
  std::__shared_weak_count *v250;
  std::string v251;
  std::string buf;
  uint64_t v253;
  std::__shared_weak_count *v254;
  uint64_t v255;
  std::__shared_weak_count *v256;
  shared_ptr<siri::dialogengine::Context> result;

  v7 = v3;
  v8 = os_signpost_id_generate((os_log_t)_log);
  v9 = (id)_log;
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PrepareParameters", ", (uint8_t *)&buf, 2u);
  }

  v11 = (siri::dialogengine::VariableObject *)operator new();
  siri::dialogengine::VariableObject::VariableObject(v11);
  std::shared_ptr<siri::dialogengine::VariableObject>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableObject,void>(&v255, (uint64_t)v11);
  -[DEExecutor templateDir](self, "templateDir");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v255;
    v14 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "templateDir");
    -[DEExecutor templateDir](self, "templateDir");
    v4 = (std::__shared_weak_count *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v251, (char *)-[std::__shared_weak_count UTF8String](v4, "UTF8String"));
    siri::dialogengine::VariableString::VariableString(v14, &buf, (uint64_t)&v251);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableString,void>(&v253, v14);
    siri::dialogengine::VariableObject::AddProperty(v13, &v253);
    v15 = v254;
    if (v254)
    {
      p_shared_owners = (unint64_t *)&v254->__shared_owners_;
      do
        v17 = __ldaxr(p_shared_owners);
      while (__stlxr(v17 - 1, p_shared_owners));
      if (!v17)
      {
        ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
        std::__shared_weak_count::__release_weak(v15);
      }
    }
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  -[DEExecutor catId](self, "catId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    v19 = v255;
    v20 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "catId");
    -[DEExecutor catId](self, "catId");
    v4 = (std::__shared_weak_count *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v251, (char *)-[std::__shared_weak_count UTF8String](v4, "UTF8String"));
    siri::dialogengine::VariableString::VariableString(v20, &buf, (uint64_t)&v251);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableString,void>(&v249, v20);
    siri::dialogengine::VariableObject::AddProperty(v19, &v249);
    v21 = v250;
    if (v250)
    {
      v22 = (unint64_t *)&v250->__shared_owners_;
      do
        v23 = __ldaxr(v22);
      while (__stlxr(v23 - 1, v22));
      if (!v23)
      {
        ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
        std::__shared_weak_count::__release_weak(v21);
      }
    }
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  -[DEExecutor locale](self, "locale");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = v255;
    v26 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "locale");
    -[DEExecutor locale](self, "locale");
    v4 = (std::__shared_weak_count *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v251, (char *)-[std::__shared_weak_count UTF8String](v4, "UTF8String"));
    siri::dialogengine::VariableString::VariableString(v26, &buf, (uint64_t)&v251);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableString,void>(&v247, v26);
    siri::dialogengine::VariableObject::AddProperty(v25, &v247);
    v27 = v248;
    if (v248)
    {
      v28 = (unint64_t *)&v248->__shared_owners_;
      do
        v29 = __ldaxr(v28);
      while (__stlxr(v29 - 1, v28));
      if (!v29)
      {
        ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
        std::__shared_weak_count::__release_weak(v27);
      }
    }
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  -[DEExecutor parameters](self, "parameters");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  if (v30)
  {
    v31 = v255;
    -[DEExecutor parameters](self, "parameters");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&buf, "parameters");
    v33 = NSDictToVariableObjectPtr(v32, &buf);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableObject,void>(&v245, v33);
    siri::dialogengine::VariableObject::AddProperty(v31, &v245);
    v4 = v246;
    if (v246)
    {
      v34 = (unint64_t *)&v246->__shared_owners_;
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);

  }
  -[DEExecutor globalParameters](self, "globalParameters");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (v36)
  {
    v37 = v255;
    -[DEExecutor globalParameters](self, "globalParameters");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&buf, "globalParameters");
    v39 = NSDictToVariableObjectPtr(v38, &buf);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableObject,void>(&v243, v39);
    siri::dialogengine::VariableObject::AddProperty(v37, &v243);
    v4 = v244;
    if (v244)
    {
      v40 = (unint64_t *)&v244->__shared_owners_;
      do
        v41 = __ldaxr(v40);
      while (__stlxr(v41 - 1, v40));
      if (!v41)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);

  }
  -[DEExecutor userSettings](self, "userSettings");
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42)
  {
    v43 = v255;
    -[DEExecutor userSettings](self, "userSettings");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&buf, "userSettings");
    v45 = NSDictToVariableObjectPtr(v44, &buf);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableObject,void>(&v241, v45);
    siri::dialogengine::VariableObject::AddProperty(v43, &v241);
    v4 = v242;
    if (v242)
    {
      v46 = (unint64_t *)&v242->__shared_owners_;
      do
        v47 = __ldaxr(v46);
      while (__stlxr(v47 - 1, v46));
      if (!v47)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);

  }
  if (-[DEExecutor visual](self, "visual"))
  {
    v4 = (std::__shared_weak_count *)v255;
    v48 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "requestType");
    std::string::basic_string[abi:ne180100]<0>(&v251, "visual");
    siri::dialogengine::VariableString::VariableString(v48, &buf, (uint64_t)&v251);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableString,void>(&v239, v48);
    siri::dialogengine::VariableObject::AddProperty((uint64_t)v4, &v239);
    v49 = v240;
    if (v240)
    {
      v50 = (unint64_t *)&v240->__shared_owners_;
      do
        v51 = __ldaxr(v50);
      while (__stlxr(v51 - 1, v50));
      if (!v51)
      {
        ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
        std::__shared_weak_count::__release_weak(v49);
      }
    }
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor debug](self, "debug"))
  {
    v4 = (std::__shared_weak_count *)v255;
    v52 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "debug");
    siri::dialogengine::VariableBoolean::VariableBoolean(v52, &buf, 1);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableBoolean,void>(&v237, v52);
    siri::dialogengine::VariableObject::AddProperty((uint64_t)v4, &v237);
    v53 = v238;
    if (v238)
    {
      v54 = (unint64_t *)&v238->__shared_owners_;
      do
        v55 = __ldaxr(v54);
      while (__stlxr(v55 - 1, v54));
      if (!v55)
      {
        ((void (*)(std::__shared_weak_count *))v53->__on_zero_shared)(v53);
        std::__shared_weak_count::__release_weak(v53);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor test](self, "test"))
  {
    v4 = (std::__shared_weak_count *)v255;
    v56 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "test");
    siri::dialogengine::VariableBoolean::VariableBoolean(v56, &buf, 1);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableBoolean,void>(&v235, v56);
    siri::dialogengine::VariableObject::AddProperty((uint64_t)v4, &v235);
    v57 = v236;
    if (v236)
    {
      v58 = (unint64_t *)&v236->__shared_owners_;
      do
        v59 = __ldaxr(v58);
      while (__stlxr(v59 - 1, v58));
      if (!v59)
      {
        ((void (*)(std::__shared_weak_count *))v57->__on_zero_shared)(v57);
        std::__shared_weak_count::__release_weak(v57);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor resetState](self, "resetState"))
  {
    v4 = (std::__shared_weak_count *)v255;
    v60 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "resetState");
    siri::dialogengine::VariableBoolean::VariableBoolean(v60, &buf, 1);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableBoolean,void>(&v233, v60);
    siri::dialogengine::VariableObject::AddProperty((uint64_t)v4, &v233);
    v61 = v234;
    if (v234)
    {
      v62 = (unint64_t *)&v234->__shared_owners_;
      do
        v63 = __ldaxr(v62);
      while (__stlxr(v63 - 1, v62));
      if (!v63)
      {
        ((void (*)(std::__shared_weak_count *))v61->__on_zero_shared)(v61);
        std::__shared_weak_count::__release_weak(v61);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor multiuser](self, "multiuser"))
  {
    v4 = (std::__shared_weak_count *)v255;
    v64 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "multiuser");
    siri::dialogengine::VariableBoolean::VariableBoolean(v64, &buf, 1);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableBoolean,void>(&v231, v64);
    siri::dialogengine::VariableObject::AddProperty((uint64_t)v4, &v231);
    v65 = v232;
    if (v232)
    {
      v66 = (unint64_t *)&v232->__shared_owners_;
      do
        v67 = __ldaxr(v66);
      while (__stlxr(v67 - 1, v66));
      if (!v67)
      {
        ((void (*)(std::__shared_weak_count *))v65->__on_zero_shared)(v65);
        std::__shared_weak_count::__release_weak(v65);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor grounding](self, "grounding"))
  {
    v4 = (std::__shared_weak_count *)v255;
    v68 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "grounding");
    siri::dialogengine::VariableBoolean::VariableBoolean(v68, &buf, 1);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableBoolean,void>(&v229, v68);
    siri::dialogengine::VariableObject::AddProperty((uint64_t)v4, &v229);
    v69 = v230;
    if (v230)
    {
      v70 = (unint64_t *)&v230->__shared_owners_;
      do
        v71 = __ldaxr(v70);
      while (__stlxr(v71 - 1, v70));
      if (!v71)
      {
        ((void (*)(std::__shared_weak_count *))v69->__on_zero_shared)(v69);
        std::__shared_weak_count::__release_weak(v69);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  -[DEExecutor voiceGender](self, "voiceGender");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  if (v72)
  {
    v73 = v255;
    v74 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "voiceGender");
    -[DEExecutor voiceGender](self, "voiceGender");
    v4 = (std::__shared_weak_count *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v251, (char *)-[std::__shared_weak_count UTF8String](v4, "UTF8String"));
    siri::dialogengine::VariableString::VariableString(v74, &buf, (uint64_t)&v251);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableString,void>(&v227, v74);
    siri::dialogengine::VariableObject::AddProperty(v73, &v227);
    v75 = v228;
    if (v228)
    {
      v76 = (unint64_t *)&v228->__shared_owners_;
      do
        v77 = __ldaxr(v76);
      while (__stlxr(v77 - 1, v76));
      if (!v77)
      {
        ((void (*)(std::__shared_weak_count *))v75->__on_zero_shared)(v75);
        std::__shared_weak_count::__release_weak(v75);
      }
    }
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  -[DEExecutor dialogMetadata](self, "dialogMetadata");
  v78 = (void *)objc_claimAutoreleasedReturnValue();

  if (v78)
  {
    v79 = v255;
    -[DEExecutor dialogMetadata](self, "dialogMetadata");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&buf, "dialogMetadata");
    v81 = NSDictToVariableObjectPtr(v80, &buf);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableObject,void>(&v225, v81);
    siri::dialogengine::VariableObject::AddProperty(v79, &v225);
    v4 = v226;
    if (v226)
    {
      v82 = (unint64_t *)&v226->__shared_owners_;
      do
        v83 = __ldaxr(v82);
      while (__stlxr(v83 - 1, v82));
      if (!v83)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);

  }
  -[DEExecutor interactionId](self, "interactionId");
  v84 = (void *)objc_claimAutoreleasedReturnValue();

  if (v84)
  {
    v85 = v255;
    std::string::basic_string[abi:ne180100]<0>(&buf, "interactionId");
    -[DEExecutor interactionId](self, "interactionId");
    v86 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v251, (char *)objc_msgSend(v86, "UTF8String"));
    siri::dialogengine::VariableObject::AddStringProperty(v85, &buf, (uint64_t)&v251, &v223);
    v4 = v224;
    if (v224)
    {
      v87 = (unint64_t *)&v224->__shared_owners_;
      do
        v88 = __ldaxr(v87);
      while (__stlxr(v88 - 1, v87));
      if (!v88)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  -[DEExecutor executionRequestId](self, "executionRequestId");
  v89 = (void *)objc_claimAutoreleasedReturnValue();

  if (v89)
  {
    v90 = v255;
    std::string::basic_string[abi:ne180100]<0>(&buf, "executionRequestId");
    -[DEExecutor executionRequestId](self, "executionRequestId");
    v91 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v251, (char *)objc_msgSend(v91, "UTF8String"));
    siri::dialogengine::VariableObject::AddStringProperty(v90, &buf, (uint64_t)&v251, &v221);
    v4 = v222;
    if (v222)
    {
      v92 = (unint64_t *)&v222->__shared_owners_;
      do
        v93 = __ldaxr(v92);
      while (__stlxr(v93 - 1, v92));
      if (!v93)
      {
        ((void (*)(std::__shared_weak_count *))v4->__on_zero_shared)(v4);
        std::__shared_weak_count::__release_weak(v4);
      }
    }
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  -[DEExecutor patternId](self, "patternId");
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  if (v94)
  {
    v95 = v255;
    v96 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "patternId");
    -[DEExecutor patternId](self, "patternId");
    v4 = (std::__shared_weak_count *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v251, (char *)-[std::__shared_weak_count UTF8String](v4, "UTF8String"));
    siri::dialogengine::VariableString::VariableString(v96, &buf, (uint64_t)&v251);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableString,void>(&v219, v96);
    siri::dialogengine::VariableObject::AddProperty(v95, &v219);
    v97 = v220;
    if (v220)
    {
      v98 = (unint64_t *)&v220->__shared_owners_;
      do
        v99 = __ldaxr(v98);
      while (__stlxr(v99 - 1, v98));
      if (!v99)
      {
        ((void (*)(std::__shared_weak_count *))v97->__on_zero_shared)(v97);
        std::__shared_weak_count::__release_weak(v97);
      }
    }
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  -[DEExecutor responseMode](self, "responseMode");
  v100 = (void *)objc_claimAutoreleasedReturnValue();

  if (v100)
  {
    v101 = v255;
    v102 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "responseMode");
    -[DEExecutor responseMode](self, "responseMode");
    v4 = (std::__shared_weak_count *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v251, (char *)-[std::__shared_weak_count UTF8String](v4, "UTF8String"));
    siri::dialogengine::VariableString::VariableString(v102, &buf, (uint64_t)&v251);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableString,void>(&v217, v102);
    siri::dialogengine::VariableObject::AddProperty(v101, &v217);
    v103 = v218;
    if (v218)
    {
      v104 = (unint64_t *)&v218->__shared_owners_;
      do
        v105 = __ldaxr(v104);
      while (__stlxr(v105 - 1, v104));
      if (!v105)
      {
        ((void (*)(std::__shared_weak_count *))v103->__on_zero_shared)(v103);
        std::__shared_weak_count::__release_weak(v103);
      }
    }
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);

    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor randomSeed](self, "randomSeed"))
  {
    v4 = (std::__shared_weak_count *)v255;
    v106 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "randomSeed");
    siri::dialogengine::VariableNumber::VariableNumber(v106, &buf, (double)-[DEExecutor randomSeed](self, "randomSeed"));
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableNumber,void>(&v215, v106);
    siri::dialogengine::VariableObject::AddProperty((uint64_t)v4, &v215);
    v107 = v216;
    if (v216)
    {
      v108 = (unint64_t *)&v216->__shared_owners_;
      do
        v109 = __ldaxr(v108);
      while (__stlxr(v109 - 1, v108));
      if (!v109)
      {
        ((void (*)(std::__shared_weak_count *))v107->__on_zero_shared)(v107);
        std::__shared_weak_count::__release_weak(v107);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor currentTime](self, "currentTime"))
  {
    v4 = (std::__shared_weak_count *)v255;
    v110 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "currentTime");
    siri::dialogengine::VariableNumber::VariableNumber(v110, &buf, (double)-[DEExecutor currentTime](self, "currentTime"));
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableNumber,void>(&v213, v110);
    siri::dialogengine::VariableObject::AddProperty((uint64_t)v4, &v213);
    v111 = v214;
    if (v214)
    {
      v112 = (unint64_t *)&v214->__shared_owners_;
      do
        v113 = __ldaxr(v112);
      while (__stlxr(v113 - 1, v112));
      if (!v113)
      {
        ((void (*)(std::__shared_weak_count *))v111->__on_zero_shared)(v111);
        std::__shared_weak_count::__release_weak(v111);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor enableUpdates](self, "enableUpdates"))
  {
    if (-[DEExecutor test](self, "test"))
    {
      v115 = "enableUpdates requested, but turned off because test mode is on";
LABEL_198:
      siri::dialogengine::Log::Info((siri::dialogengine::Log *)v115, v114);
      goto LABEL_199;
    }
    -[DEExecutor templateDir](self, "templateDir");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    if (v116)
    {
      -[DEExecutor templateDir](self, "templateDir");
      v4 = (std::__shared_weak_count *)objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v117 = (char *)-[std::__shared_weak_count UTF8String](v4, "UTF8String");
    }
    else
    {
      v117 = "";
    }
    v118 = std::string::basic_string[abi:ne180100]<0>(&buf, v117);
    v119 = siri::dialogengine::PreferXMLFiles((uint64_t)v118);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    if (v116)

    if (v119)
    {
      v115 = "enableUpdates requested, but turned off because preferXML is on";
      goto LABEL_198;
    }
    v185 = v255;
    v186 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "enableUpdates");
    siri::dialogengine::VariableBoolean::VariableBoolean(v186, &buf, 1);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableBoolean,void>(&v211, v186);
    siri::dialogengine::VariableObject::AddProperty(v185, &v211);
    v187 = v212;
    if (v212)
    {
      v188 = (unint64_t *)&v212->__shared_owners_;
      do
        v189 = __ldaxr(v188);
      while (__stlxr(v189 - 1, v188));
      if (!v189)
      {
        ((void (*)(std::__shared_weak_count *))v187->__on_zero_shared)(v187);
        std::__shared_weak_count::__release_weak(v187);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
LABEL_199:
  if (-[DEExecutor isSpotlight](self, "isSpotlight"))
  {
    v120 = v255;
    v121 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "isSpotlight");
    siri::dialogengine::VariableBoolean::VariableBoolean(v121, &buf, 1);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableBoolean,void>(&v209, v121);
    siri::dialogengine::VariableObject::AddProperty(v120, &v209);
    v122 = v210;
    if (v210)
    {
      v123 = (unint64_t *)&v210->__shared_owners_;
      do
        v124 = __ldaxr(v123);
      while (__stlxr(v124 - 1, v123));
      if (!v124)
      {
        ((void (*)(std::__shared_weak_count *))v122->__on_zero_shared)(v122);
        std::__shared_weak_count::__release_weak(v122);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  -[DEExecutor customPronunciations](self, "customPronunciations");
  v125 = (void *)objc_claimAutoreleasedReturnValue();

  if (v125)
  {
    v126 = v255;
    -[DEExecutor customPronunciations](self, "customPronunciations");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&buf, "customPronunciations");
    v128 = NSDictToVariableObjectPtr(v127, &buf);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableObject,void>(&v207, v128);
    siri::dialogengine::VariableObject::AddProperty(v126, &v207);
    v129 = v208;
    if (v208)
    {
      v130 = (unint64_t *)&v208->__shared_owners_;
      do
        v131 = __ldaxr(v130);
      while (__stlxr(v131 - 1, v130));
      if (!v131)
      {
        ((void (*)(std::__shared_weak_count *))v129->__on_zero_shared)(v129);
        std::__shared_weak_count::__release_weak(v129);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);

  }
  if (-[DEExecutor createTrace](self, "createTrace"))
  {
    v132 = v255;
    v133 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "createTrace");
    siri::dialogengine::VariableBoolean::VariableBoolean(v133, &buf, 1);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableBoolean,void>(&v205, v133);
    siri::dialogengine::VariableObject::AddProperty(v132, &v205);
    v134 = v206;
    if (v206)
    {
      v135 = (unint64_t *)&v206->__shared_owners_;
      do
        v136 = __ldaxr(v135);
      while (__stlxr(v136 - 1, v135));
      if (!v136)
      {
        ((void (*)(std::__shared_weak_count *))v134->__on_zero_shared)(v134);
        std::__shared_weak_count::__release_weak(v134);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor switchFallthrough](self, "switchFallthrough"))
  {
    v137 = v255;
    v138 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "switchFallthrough");
    siri::dialogengine::VariableBoolean::VariableBoolean(v138, &buf, 1);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableBoolean,void>(&v203, v138);
    siri::dialogengine::VariableObject::AddProperty(v137, &v203);
    v139 = v204;
    if (v204)
    {
      v140 = (unint64_t *)&v204->__shared_owners_;
      do
        v141 = __ldaxr(v140);
      while (__stlxr(v141 - 1, v140));
      if (!v141)
      {
        ((void (*)(std::__shared_weak_count *))v139->__on_zero_shared)(v139);
        std::__shared_weak_count::__release_weak(v139);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor deterministic](self, "deterministic"))
  {
    v142 = v255;
    v143 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&buf, "deterministic");
    siri::dialogengine::VariableBoolean::VariableBoolean(v143, &buf, 1);
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::VariableBoolean,void>(&v201, v143);
    siri::dialogengine::VariableObject::AddProperty(v142, &v201);
    v144 = v202;
    if (v202)
    {
      v145 = (unint64_t *)&v202->__shared_owners_;
      do
        v146 = __ldaxr(v145);
      while (__stlxr(v146 - 1, v145));
      if (!v146)
      {
        ((void (*)(std::__shared_weak_count *))v144->__on_zero_shared)(v144);
        std::__shared_weak_count::__release_weak(v144);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor isLabelMode](self, "isLabelMode"))
  {
    v147 = v255;
    std::string::basic_string[abi:ne180100]<0>(&buf, "labelMode");
    siri::dialogengine::VariableObject::AddBooleanProperty(v147, &buf, 1, &v199);
    v148 = v200;
    if (v200)
    {
      v149 = (unint64_t *)&v200->__shared_owners_;
      do
        v150 = __ldaxr(v149);
      while (__stlxr(v150 - 1, v149));
      if (!v150)
      {
        ((void (*)(std::__shared_weak_count *))v148->__on_zero_shared)(v148);
        std::__shared_weak_count::__release_weak(v148);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  if (-[DEExecutor includeKeywords](self, "includeKeywords"))
  {
    v151 = v255;
    std::string::basic_string[abi:ne180100]<0>(&buf, "includeKeywords");
    siri::dialogengine::VariableObject::AddBooleanProperty(v151, &buf, 1, &v197);
    v152 = v198;
    if (v198)
    {
      v153 = (unint64_t *)&v198->__shared_owners_;
      do
        v154 = __ldaxr(v153);
      while (__stlxr(v154 - 1, v153));
      if (!v154)
      {
        ((void (*)(std::__shared_weak_count *))v152->__on_zero_shared)(v152);
        std::__shared_weak_count::__release_weak(v152);
      }
    }
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
  }
  v155 = (id)_log;
  v156 = v155;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v155))
  {
    LOWORD(buf.__r_.__value_.__l.__data_) = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v156, OS_SIGNPOST_INTERVAL_END, v8, "PrepareParameters", ", (uint8_t *)&buf, 2u);
  }

  *v7 = 0;
  v7[1] = 0;
  if (siri::dialogengine::TraceEnabled(v157))
  {
    -[DEExecutor getRequestJSON](self, "getRequestJSON");
    v158 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&buf, (char *)objc_msgSend(v158, "UTF8String"));
    std::string::basic_string[abi:ne180100]<0>(&v251, "");
    std::string::basic_string[abi:ne180100]<0>(&v195, "");
    std::string::basic_string[abi:ne180100]<0>(&__p, "");
    siri::dialogengine::ParseRequestFromJson((const char *)&buf, &v251, &v195, &__p, (siri::dialogengine::Context **)&v196);
    std::shared_ptr<siri::dialogengine::JSONValue>::operator=[abi:ne180100]((uint64_t)v7, &v196);
    v159 = (std::__shared_weak_count *)*((_QWORD *)&v196 + 1);
    if (*((_QWORD *)&v196 + 1))
    {
      v160 = (unint64_t *)(*((_QWORD *)&v196 + 1) + 8);
      do
        v161 = __ldaxr(v160);
      while (__stlxr(v161 - 1, v160));
      if (!v161)
      {
        ((void (*)(std::__shared_weak_count *))v159->__on_zero_shared)(v159);
        std::__shared_weak_count::__release_weak(v159);
      }
    }
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v195.__r_.__value_.__l.__data_);
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);

  }
  else
  {
    v192 = v255;
    v193 = v256;
    if (v256)
    {
      v162 = (unint64_t *)&v256->__shared_owners_;
      do
        v163 = __ldxr(v162);
      while (__stxr(v163 + 1, v162));
    }
    std::string::basic_string[abi:ne180100]<0>(&buf, "");
    std::string::basic_string[abi:ne180100]<0>(&v251, "");
    std::string::basic_string[abi:ne180100]<0>(&v195, "");
    siri::dialogengine::ParseRequestFromVariable(&v192, &buf, &v251, &v195, (siri::dialogengine::Context **)&__p);
    std::shared_ptr<siri::dialogengine::JSONValue>::operator=[abi:ne180100]((uint64_t)v7, (__int128 *)&__p);
    size = (std::__shared_weak_count *)__p.__r_.__value_.__l.__size_;
    if (__p.__r_.__value_.__l.__size_)
    {
      v165 = (unint64_t *)(__p.__r_.__value_.__l.__size_ + 8);
      do
        v166 = __ldaxr(v165);
      while (__stlxr(v166 - 1, v165));
      if (!v166)
      {
        ((void (*)(std::__shared_weak_count *))size->__on_zero_shared)(size);
        std::__shared_weak_count::__release_weak(size);
      }
    }
    if (SHIBYTE(v195.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v195.__r_.__value_.__l.__data_);
    if (SHIBYTE(v251.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v251.__r_.__value_.__l.__data_);
    if (SHIBYTE(buf.__r_.__value_.__r.__words[2]) < 0)
      operator delete(buf.__r_.__value_.__l.__data_);
    v167 = v193;
    if (v193)
    {
      v168 = (unint64_t *)&v193->__shared_owners_;
      do
        v169 = __ldaxr(v168);
      while (__stlxr(v169 - 1, v168));
      if (!v169)
      {
        ((void (*)(std::__shared_weak_count *))v167->__on_zero_shared)(v167);
        std::__shared_weak_count::__release_weak(v167);
      }
    }
  }
  v170 = *v7;
  -[DEExecutor patternContext](self, "patternContext");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v172 = v171;
  if (v171)
  {
    objc_msgSend(v171, "getSharedPtr");
    v173 = v190;
    v174 = (uint64_t)v191;
  }
  else
  {
    v174 = 0;
    v173 = 0;
    v191 = 0;
  }
  std::shared_ptr<siri::dialogengine::PatternSchemaUsage>::operator=[abi:ne180100]((_QWORD *)(v170 + 3464), v173, v174);
  if (v191)
  {
    v175 = (unint64_t *)&v191->__shared_owners_;
    do
      v176 = __ldaxr(v175);
    while (__stlxr(v176 - 1, v175));
    if (!v176)
    {
      ((void (*)(std::__shared_weak_count *))v191->__on_zero_shared)(v191);
      std::__shared_weak_count::__release_weak(v191);
    }
  }

  v179 = (_OWORD *)(*v7 + 744);
  v180 = *(_OWORD *)&a3->var2.var0.var1.var1;
  v181 = *(_OWORD *)&a3->var0;
  v179[1] = *(_OWORD *)&a3->var1.var1;
  v179[2] = v180;
  *v179 = v181;
  v182 = v256;
  if (v256)
  {
    v183 = (unint64_t *)&v256->__shared_owners_;
    do
      v184 = __ldaxr(v183);
    while (__stlxr(v184 - 1, v183));
    if (!v184)
    {
      ((void (*)(std::__shared_weak_count *))v182->__on_zero_shared)(v182);
      std::__shared_weak_count::__release_weak(v182);
    }
  }
  result.__cntrl_ = v178;
  result.__ptr_ = v177;
  return result;
}

- (void)updateContext:(void *)a3 paramsPath:()basic_string<char localePath:()std:(std::allocator<char>> *)a4 :char_traits<char> visualPath:
{
  const std::string *v4;
  const std::string *v5;
  const std::string *v6;
  const std::string *v7;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[16];
  uint8_t buf[80];
  std::string v17[7];
  std::string v18[5];
  std::string v19[4];

  v6 = v5;
  v7 = v4;
  v10 = os_signpost_id_generate((os_log_t)_log);
  v11 = (id)_log;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "UpdateContext", ", buf, 2u);
  }

  siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)buf, (const siri::dialogengine::RequestInfo *)((char *)a3 + 8));
  std::string::operator=(v17, (const std::string *)a4);
  std::string::operator=(v18, v7);
  std::string::operator=(v19, v6);
  siri::dialogengine::Context::SetRequestInfo((uint64_t)a3, (uint64_t)buf);
  v13 = (id)_log;
  v14 = v13;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)v15 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v14, OS_SIGNPOST_INTERVAL_END, v10, "UpdateContext", ", v15, 2u);
  }

  siri::dialogengine::RequestInfo::~RequestInfo((void **)buf);
}

- (basic_string<char,)consumeContextForJson:(std::allocator<char>> *__return_ptr)retstr
{
  void *v1;
  siri::dialogengine::Context **v2;
  siri::dialogengine::Context **v3;
  void *v4;
  os_signpost_id_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *result;
  basic_string<char, std::char_traits<char>, std::allocator<char>> *v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v3 = v2;
  v4 = v1;
  v29 = *MEMORY[0x1E0C80C00];
  v6 = os_signpost_id_generate((os_log_t)_log);
  objc_msgSend(v4, "callback");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[DEExecutor prepareCallback:forContext:](DEExecutor, "prepareCallback:forContext:", v7, *v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  *((_QWORD *)*v3 + 99) = v8;
  v9 = (id)_log;
  v10 = v9;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    objc_msgSend(v4, "catId");
    v24 = retstr;
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v12 = objc_msgSend(v11, "UTF8String");
    objc_msgSend(v4, "locale");
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315394;
    v26 = v12;
    v27 = 2080;
    v28 = objc_msgSend(v13, "UTF8String");
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v6, "LoadCATFile", "CAT_ID = %s LOCALE = %s", buf, 0x16u);

    retstr = v24;
  }

  siri::dialogengine::Context::Load(*v3);
  v14 = (id)_log;
  v15 = v14;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v15, OS_SIGNPOST_INTERVAL_END, v6, "LoadCATFile", ", buf, 2u);
  }

  v16 = os_signpost_id_generate((os_log_t)_log);
  v17 = (id)_log;
  v18 = v17;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    objc_msgSend(v4, "catId");
    v19 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v20 = objc_msgSend(v19, "UTF8String");
    *(_DWORD *)buf = 136315138;
    v26 = v20;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v16, "GenerateResponse", "CAT_ID = %s", buf, 0xCu);

  }
  siri::dialogengine::GenerateResponse((uint64_t *)&retstr->__r_.__value_.var0.var1, *v3);
  v21 = (id)_log;
  v22 = v21;
  if (v16 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v22, OS_SIGNPOST_INTERVAL_END, v16, "GenerateResponse", ", buf, 2u);
  }

  *((_QWORD *)*v3 + 99) = 0;
  return result;
}

- (id)consumeContext:(shared_ptr<siri:()basic_string<char :()std:(std::allocator<char>> *)a4 :char_traits<char> dialogengine::Context>)a3 paramsPath:localePath:visualPath:
{
  uint64_t v4;
  uint64_t v5;
  __shared_weak_count *cntrl;
  Context *ptr;
  os_signpost_id_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *p_shared_owners;
  unint64_t v14;
  std::__shared_weak_count *v15;
  unint64_t *v16;
  unint64_t v17;
  NSObject *v18;
  NSObject *v19;
  void *p_p;
  void *v21;
  id v22;
  NSObject *v23;
  NSObject *v24;
  __int16 v26;
  uint64_t v27;
  std::__shared_weak_count *v28;
  void *__p;
  char v30;
  std::string v31;
  std::string value;
  std::string v33;

  v5 = v4;
  cntrl = a3.__cntrl_;
  ptr = a3.__ptr_;
  v10 = os_signpost_id_generate((os_log_t)_log);
  v11 = *(_QWORD *)ptr;
  if (*((char *)cntrl + 23) < 0)
    std::string::__init_copy_ctor_external(&v33, *(const std::string::value_type **)cntrl, *((_QWORD *)cntrl + 1));
  else
    v33 = *(std::string *)cntrl;
  if (*((char *)&a4->__r_.__value_.var0.var1 + 23) < 0)
    std::string::__init_copy_ctor_external(&value, a4->__r_.__value_.var0.var1.__data_, a4->__r_.__value_.var0.var1.__size_);
  else
    value = (std::string)a4->__r_.__value_;
  if (*(char *)(v5 + 23) < 0)
    std::string::__init_copy_ctor_external(&v31, *(const std::string::value_type **)v5, *(_QWORD *)(v5 + 8));
  else
    v31 = *(std::string *)v5;
  -[DEExecutor updateContext:paramsPath:localePath:visualPath:](self, "updateContext:paramsPath:localePath:visualPath:", v11, &v33, &value, &v31);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  if (SHIBYTE(value.__r_.__value_.__r.__words[2]) < 0)
    operator delete(value.__r_.__value_.__l.__data_);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
  v12 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v27 = *(_QWORD *)ptr;
  v28 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v14 = __ldxr(p_shared_owners);
    while (__stxr(v14 + 1, p_shared_owners));
  }
  -[DEExecutor consumeContextForJson:](self, "consumeContextForJson:", &v27);
  v15 = v28;
  if (v28)
  {
    v16 = (unint64_t *)&v28->__shared_owners_;
    do
      v17 = __ldaxr(v16);
    while (__stlxr(v17 - 1, v16));
    if (!v17)
    {
      ((void (*)(std::__shared_weak_count *))v15->__on_zero_shared)(v15);
      std::__shared_weak_count::__release_weak(v15);
    }
  }
  v18 = (id)_log;
  v19 = v18;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v10, "FormatResponse", ", (uint8_t *)&v26, 2u);
  }

  if (v30 >= 0)
    p_p = &__p;
  else
    p_p = __p;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[DEResult initFromJson:]([DEResult alloc], "initFromJson:", v21);
  v23 = (id)_log;
  v24 = v23;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    v26 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v24, OS_SIGNPOST_INTERVAL_END, v10, "FormatResponse", ", (uint8_t *)&v26, 2u);
  }

  if (v30 < 0)
    operator delete(__p);
  return v22;
}

- (void)executeWithCompletionBlock:(id)a3
{
  id v4;
  char v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  char v10;

  v4 = a3;
  v5 = objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread");
  dispatch_get_global_queue(2, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__DEExecutor_executeWithCompletionBlock___block_invoke;
  block[3] = &unk_1E7934CB0;
  block[4] = self;
  v9 = v4;
  v10 = v5;
  v7 = v4;
  dispatch_async(v6, block);

}

- (id)execute
{
  void *v3;
  std::string::value_type *v4;
  std::string::size_type v5;
  char v6;
  std::string::size_type v7;
  char v8;
  std::string::value_type *v9;
  std::string::size_type v10;
  char v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::string::value_type *__s;
  std::string::value_type *__sa;
  std::string v23;
  std::string v24;
  std::string v25;
  uint64_t v26;
  std::__shared_weak_count *v27;
  std::string v28;
  std::string v29;
  __int128 *v30;
  uint64_t v31;
  uint64_t v32;
  std::string::value_type *v33;
  std::string::size_type v34;
  _BYTE v35[7];
  char v36;
  _DWORD v37[2];
  _DWORD v38[2];
  _DWORD v39[2];
  void *v40;
  uint64_t v41;
  uint64_t v42;
  std::string v43;
  __int128 *v44;
  __int128 *v45;
  _OWORD v46[3];
  uint64_t v47;
  std::__shared_weak_count *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  BYTE8(v51) = 0;
  *(_QWORD *)&v50 = 0;
  v49 = 0uLL;
  BYTE8(v50) = 0;
  siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)&v49);
  v46[0] = v49;
  v46[1] = v50;
  v46[2] = v51;
  -[DEExecutor getContext:](self, "getContext:", v46);
  if (v47)
  {
    siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v40, (const siri::dialogengine::RequestInfo *)(v47 + 8));
    -[DEExecutor LogCurareCATExecution:](self, "LogCurareCATExecution:", &v40);
    *(_DWORD *)((char *)v39 + 3) = 0;
    v39[0] = 0;
    *(_DWORD *)((char *)v38 + 3) = 0;
    v38[0] = 0;
    *(_DWORD *)((char *)v37 + 3) = 0;
    v37[0] = 0;
    if ((_DWORD)v40 == 1)
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v30, v41, v42, 0xAAAAAAAAAAAAAAABLL * ((v42 - v41) >> 5));
      if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v29, v43.__r_.__value_.__l.__data_, v43.__r_.__value_.__l.__size_);
      else
        v29 = v43;
      siri::dialogengine::FindVisualFile(&v30, (uint64_t)&v29, (uint64_t)&v33);
      v4 = v33;
      v5 = v34;
      v37[0] = *(_DWORD *)v35;
      *(_DWORD *)((char *)v37 + 3) = *(_DWORD *)&v35[3];
      v6 = v36;
      v36 = 0;
      LOBYTE(v33) = 0;
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v29.__r_.__value_.__l.__data_);
      v29.__r_.__value_.__r.__words[0] = (std::string::size_type)&v30;
      std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
      __s = 0;
      v7 = 0;
      v8 = 0;
      v9 = 0;
      v10 = 0;
      v11 = 0;
    }
    else
    {
      v30 = 0;
      v31 = 0;
      v32 = 0;
      std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v30, v41, v42, 0xAAAAAAAAAAAAAAABLL * ((v42 - v41) >> 5));
      if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v29, v43.__r_.__value_.__l.__data_, v43.__r_.__value_.__l.__size_);
      else
        v29 = v43;
      siri::dialogengine::FindParamsFile(&v30, (uint64_t)&v29, (uint64_t)&v33);
      v7 = v34;
      __s = v33;
      v39[0] = *(_DWORD *)v35;
      *(_DWORD *)((char *)v39 + 3) = *(_DWORD *)&v35[3];
      v8 = v36;
      v36 = 0;
      LOBYTE(v33) = 0;
      if (SHIBYTE(v29.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v29.__r_.__value_.__l.__data_);
      v29.__r_.__value_.__r.__words[0] = (std::string::size_type)&v30;
      std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
      v30 = 0;
      v31 = 0;
      v32 = 0;
      std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v30, v41, v42, 0xAAAAAAAAAAAAAAABLL * ((v42 - v41) >> 5));
      memset(&v29, 0, sizeof(v29));
      std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v29, v44, v45, 0xAAAAAAAAAAAAAAABLL * (((char *)v45 - (char *)v44) >> 3));
      if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v28, v43.__r_.__value_.__l.__data_, v43.__r_.__value_.__l.__size_);
      else
        v28 = v43;
      siri::dialogengine::FindLocaleFile(&v30, (__int128 **)&v29, (uint64_t)&v28, (uint64_t)&v33);
      v9 = v33;
      v10 = v34;
      v38[0] = *(_DWORD *)v35;
      *(_DWORD *)((char *)v38 + 3) = *(_DWORD *)&v35[3];
      v11 = v36;
      v36 = 0;
      LOBYTE(v33) = 0;
      if (SHIBYTE(v28.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v28.__r_.__value_.__l.__data_);
      v28.__r_.__value_.__r.__words[0] = (std::string::size_type)&v29;
      std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v28);
      v29.__r_.__value_.__r.__words[0] = (std::string::size_type)&v30;
      std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v29);
      v4 = 0;
      v5 = 0;
      v6 = 0;
    }
    v26 = v47;
    v27 = v48;
    if (v48)
    {
      p_shared_owners = (unint64_t *)&v48->__shared_owners_;
      do
        v13 = __ldxr(p_shared_owners);
      while (__stxr(v13 + 1, p_shared_owners));
    }
    if (v8 < 0)
    {
      std::string::__init_copy_ctor_external(&v25, __s, v7);
    }
    else
    {
      v25.__r_.__value_.__r.__words[0] = (std::string::size_type)__s;
      v25.__r_.__value_.__l.__size_ = v7;
      LODWORD(v25.__r_.__value_.__r.__words[2]) = v39[0];
      *(_DWORD *)((char *)&v25.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v39 + 3);
      *((_BYTE *)&v25.__r_.__value_.__s + 23) = v8;
    }
    if (v11 < 0)
    {
      std::string::__init_copy_ctor_external(&v24, v9, v10);
    }
    else
    {
      v24.__r_.__value_.__r.__words[0] = (std::string::size_type)v9;
      v24.__r_.__value_.__l.__size_ = v10;
      LODWORD(v24.__r_.__value_.__r.__words[2]) = v38[0];
      *(_DWORD *)((char *)&v24.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v38 + 3);
      *((_BYTE *)&v24.__r_.__value_.__s + 23) = v11;
    }
    if (v6 < 0)
    {
      std::string::__init_copy_ctor_external(&v23, v4, v5);
    }
    else
    {
      v23.__r_.__value_.__r.__words[0] = (std::string::size_type)v4;
      v23.__r_.__value_.__l.__size_ = v5;
      LODWORD(v23.__r_.__value_.__r.__words[2]) = v37[0];
      *(_DWORD *)((char *)&v23.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v37 + 3);
      *((_BYTE *)&v23.__r_.__value_.__s + 23) = v6;
    }
    -[DEExecutor consumeContext:paramsPath:localePath:visualPath:](self, "consumeContext:paramsPath:localePath:visualPath:", &v26, &v25, &v24, &v23, __s);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (SHIBYTE(v23.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v23.__r_.__value_.__l.__data_);
    if (SHIBYTE(v24.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v24.__r_.__value_.__l.__data_);
    if (SHIBYTE(v25.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v25.__r_.__value_.__l.__data_);
    v14 = v27;
    if (!v27)
      goto LABEL_43;
    v15 = (unint64_t *)&v27->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
      if ((v6 & 0x80) == 0)
      {
LABEL_44:
        if ((v11 & 0x80) == 0)
          goto LABEL_45;
        goto LABEL_55;
      }
    }
    else
    {
LABEL_43:
      if ((v6 & 0x80) == 0)
        goto LABEL_44;
    }
    operator delete(v4);
    if ((v11 & 0x80) == 0)
    {
LABEL_45:
      if ((v8 & 0x80) == 0)
      {
LABEL_46:
        siri::dialogengine::RequestInfo::~RequestInfo(&v40);
        goto LABEL_47;
      }
LABEL_56:
      operator delete(__sa);
      goto LABEL_46;
    }
LABEL_55:
    operator delete(v9);
    if ((v8 & 0x80) == 0)
      goto LABEL_46;
    goto LABEL_56;
  }
  v3 = 0;
LABEL_47:
  v17 = v48;
  if (v48)
  {
    v18 = (unint64_t *)&v48->__shared_owners_;
    do
      v19 = __ldaxr(v18);
    while (__stlxr(v19 - 1, v18));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
      std::__shared_weak_count::__release_weak(v17);
    }
  }
  return v3;
}

- (void)executeWithParams:(id)a3 locale:(id)a4 completionBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *);
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *))a5;
  if (v9)
  {
    -[DEExecutor executeWithParams:locale:](self, "executeWithParams:locale:", v11, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v9[2](v9, v10);

  }
}

- (id)executeWithParams:(id)a3 locale:(id)a4
{
  -[DEExecutor executeWithParams:locale:visual:](self, "executeWithParams:locale:visual:", a3, a4, &stru_1E793AF80);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)executeVisual:(id)a3
{
  -[DEExecutor executeWithParams:locale:visual:](self, "executeWithParams:locale:visual:", &stru_1E793AF80, &stru_1E793AF80, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)executeVisual:(id)a3 completionBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  id v8;

  v8 = a3;
  v6 = (void (**)(id, void *))a4;
  if (v6)
  {
    -[DEExecutor executeWithParams:locale:visual:](self, "executeWithParams:locale:visual:", &stru_1E793AF80, &stru_1E793AF80, v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6[2](v6, v7);

  }
}

- (id)executeWithParams:(id)a3 locale:(id)a4 visual:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  unint64_t *p_shared_owners;
  unint64_t v16;
  std::__shared_weak_count *v17;
  unint64_t *v18;
  unint64_t v19;
  std::string *v20;
  id v21;
  void *v22;
  std::__shared_weak_count *v23;
  unint64_t *v24;
  unint64_t v25;
  siri::dialogengine::Context *v27;
  std::__shared_weak_count *v28;
  void *__p[2];
  char v30;
  std::string v31;
  std::string v32;
  std::string v33;
  siri::dialogengine::Context *v34;
  std::__shared_weak_count *v35;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[DEExecutor getRequestJSON](self, "getRequestJSON");
  v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(v11, "UTF8String"));
  v12 = objc_retainAutorelease(v8);
  std::string::basic_string[abi:ne180100]<0>(&v33, (char *)objc_msgSend(v12, "UTF8String"));
  v13 = objc_retainAutorelease(v9);
  std::string::basic_string[abi:ne180100]<0>(&v32, (char *)objc_msgSend(v13, "UTF8String"));
  v14 = objc_retainAutorelease(v10);
  std::string::basic_string[abi:ne180100]<0>(&v31, (char *)objc_msgSend(v14, "UTF8String"));
  siri::dialogengine::PrepareRequestFromJson((const char *)__p, &v33, &v32, &v31, &v34);
  if (SHIBYTE(v31.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v31.__r_.__value_.__l.__data_);
  if (SHIBYTE(v32.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v32.__r_.__value_.__l.__data_);
  if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v33.__r_.__value_.__l.__data_);
  if (v30 < 0)
    operator delete(__p[0]);
  if (v34)
  {
    siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)__p, (siri::dialogengine::Context *)((char *)v34 + 8));
    -[DEExecutor LogCurareCATExecution:](self, "LogCurareCATExecution:", __p);
    v27 = v34;
    v28 = v35;
    if (v35)
    {
      p_shared_owners = (unint64_t *)&v35->__shared_owners_;
      do
        v16 = __ldxr(p_shared_owners);
      while (__stxr(v16 + 1, p_shared_owners));
    }
    -[DEExecutor consumeContextForJson:](self, "consumeContextForJson:", &v27);
    v17 = v28;
    if (v28)
    {
      v18 = (unint64_t *)&v28->__shared_owners_;
      do
        v19 = __ldaxr(v18);
      while (__stlxr(v19 - 1, v18));
      if (!v19)
      {
        ((void (*)(std::__shared_weak_count *))v17->__on_zero_shared)(v17);
        std::__shared_weak_count::__release_weak(v17);
      }
    }
    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
    {
      if (!v33.__r_.__value_.__l.__size_)
      {
        v21 = 0;
LABEL_28:
        operator delete(v33.__r_.__value_.__l.__data_);
        goto LABEL_29;
      }
      v20 = (std::string *)v33.__r_.__value_.__r.__words[0];
    }
    else
    {
      if (!*((_BYTE *)&v33.__r_.__value_.__s + 23))
      {
        v21 = 0;
        goto LABEL_29;
      }
      v20 = &v33;
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[DEResult initFromJson:]([DEResult alloc], "initFromJson:", v22);

    if (SHIBYTE(v33.__r_.__value_.__r.__words[2]) < 0)
      goto LABEL_28;
LABEL_29:
    siri::dialogengine::RequestInfo::~RequestInfo(__p);
    goto LABEL_30;
  }
  v21 = 0;
LABEL_30:
  v23 = v35;
  if (v35)
  {
    v24 = (unint64_t *)&v35->__shared_owners_;
    do
      v25 = __ldaxr(v24);
    while (__stlxr(v25 - 1, v24));
    if (!v25)
    {
      ((void (*)(std::__shared_weak_count *))v23->__on_zero_shared)(v23);
      std::__shared_weak_count::__release_weak(v23);
    }
  }

  return v21;
}

- (NSString)templateDir
{
  return self->_templateDir;
}

- (void)setTemplateDir:(id)a3
{
  objc_storeStrong((id *)&self->_templateDir, a3);
}

- (NSString)catId
{
  return self->_catId;
}

- (void)setCatId:(id)a3
{
  objc_storeStrong((id *)&self->_catId, a3);
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
  objc_storeStrong((id *)&self->_locale, a3);
}

- (NSDictionary)dialogMetadata
{
  return self->_dialogMetadata;
}

- (void)setDialogMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_dialogMetadata, a3);
}

- (NSString)interactionId
{
  return self->_interactionId;
}

- (void)setInteractionId:(id)a3
{
  objc_storeStrong((id *)&self->_interactionId, a3);
}

- (NSString)executionRequestId
{
  return self->_executionRequestId;
}

- (void)setExecutionRequestId:(id)a3
{
  objc_storeStrong((id *)&self->_executionRequestId, a3);
}

- (NSString)patternId
{
  return self->_patternId;
}

- (void)setPatternId:(id)a3
{
  objc_storeStrong((id *)&self->_patternId, a3);
}

- (NSString)responseMode
{
  return self->_responseMode;
}

- (void)setResponseMode:(id)a3
{
  objc_storeStrong((id *)&self->_responseMode, a3);
}

- (NSDictionary)parameters
{
  return self->_parameters;
}

- (void)setParameters:(id)a3
{
  objc_storeStrong((id *)&self->_parameters, a3);
}

- (NSDictionary)globalParameters
{
  return self->_globalParameters;
}

- (void)setGlobalParameters:(id)a3
{
  objc_storeStrong((id *)&self->_globalParameters, a3);
}

- (NSDictionary)userSettings
{
  return self->_userSettings;
}

- (void)setUserSettings:(id)a3
{
  objc_storeStrong((id *)&self->_userSettings, a3);
}

- (NSString)pluginName
{
  return self->_pluginName;
}

- (void)setPluginName:(id)a3
{
  objc_storeStrong((id *)&self->_pluginName, a3);
}

- (DEExecutionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (id)callback
{
  return self->_callback;
}

- (void)setCallback:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)visual
{
  return self->_visual;
}

- (void)setVisual:(BOOL)a3
{
  self->_visual = a3;
}

- (BOOL)debug
{
  return self->_debug;
}

- (void)setDebug:(BOOL)a3
{
  self->_debug = a3;
}

- (BOOL)test
{
  return self->_test;
}

- (void)setTest:(BOOL)a3
{
  self->_test = a3;
}

- (BOOL)resetState
{
  return self->_resetState;
}

- (void)setResetState:(BOOL)a3
{
  self->_resetState = a3;
}

- (BOOL)multiuser
{
  return self->_multiuser;
}

- (void)setMultiuser:(BOOL)a3
{
  self->_multiuser = a3;
}

- (BOOL)grounding
{
  return self->_grounding;
}

- (void)setGrounding:(BOOL)a3
{
  self->_grounding = a3;
}

- (BOOL)enableUpdates
{
  return self->_enableUpdates;
}

- (void)setEnableUpdates:(BOOL)a3
{
  self->_enableUpdates = a3;
}

- (BOOL)createTrace
{
  return self->_createTrace;
}

- (void)setCreateTrace:(BOOL)a3
{
  self->_createTrace = a3;
}

- (BOOL)switchFallthrough
{
  return self->_switchFallthrough;
}

- (void)setSwitchFallthrough:(BOOL)a3
{
  self->_switchFallthrough = a3;
}

- (BOOL)includeKeywords
{
  return self->_includeKeywords;
}

- (void)setIncludeKeywords:(BOOL)a3
{
  self->_includeKeywords = a3;
}

- (NSString)voiceGender
{
  return self->_voiceGender;
}

- (void)setVoiceGender:(id)a3
{
  objc_storeStrong((id *)&self->_voiceGender, a3);
}

- (unsigned)randomSeed
{
  return self->_randomSeed;
}

- (void)setRandomSeed:(unsigned int)a3
{
  self->_randomSeed = a3;
}

- (int64_t)currentTime
{
  return self->_currentTime;
}

- (void)setCurrentTime:(int64_t)a3
{
  self->_currentTime = a3;
}

- (DEDistribution)distribution
{
  return self->_distribution;
}

- (void)setDistribution:(id)a3
{
  objc_storeStrong((id *)&self->_distribution, a3);
}

- (NSDictionary)customPronunciations
{
  return self->_customPronunciations;
}

- (void)setCustomPronunciations:(id)a3
{
  objc_storeStrong((id *)&self->_customPronunciations, a3);
}

- (BOOL)deterministic
{
  return self->_deterministic;
}

- (void)setDeterministic:(BOOL)a3
{
  self->_deterministic = a3;
}

- (DEPatternContext)patternContext
{
  return self->_patternContext;
}

- (void)setPatternContext:(id)a3
{
  objc_storeStrong((id *)&self->_patternContext, a3);
}

- (BOOL)isSpotlight
{
  return self->_isSpotlight;
}

- (void)setIsSpotlight:(BOOL)a3
{
  self->_isSpotlight = a3;
}

- (BOOL)isLabelMode
{
  return self->_isLabelMode;
}

- (void)setIsLabelMode:(BOOL)a3
{
  self->_isLabelMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternContext, 0);
  objc_storeStrong((id *)&self->_customPronunciations, 0);
  objc_storeStrong((id *)&self->_distribution, 0);
  objc_storeStrong((id *)&self->_voiceGender, 0);
  objc_storeStrong(&self->_callback, 0);
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_pluginName, 0);
  objc_storeStrong((id *)&self->_userSettings, 0);
  objc_storeStrong((id *)&self->_globalParameters, 0);
  objc_storeStrong((id *)&self->_parameters, 0);
  objc_storeStrong((id *)&self->_responseMode, 0);
  objc_storeStrong((id *)&self->_patternId, 0);
  objc_storeStrong((id *)&self->_executionRequestId, 0);
  objc_storeStrong((id *)&self->_interactionId, 0);
  objc_storeStrong((id *)&self->_dialogMetadata, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_catId, 0);
  objc_storeStrong((id *)&self->_templateDir, 0);
}

void __41__DEExecutor_executeWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  void *v4;
  const std::string::value_type *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  std::string::value_type *v10;
  void *v11;
  char v12;
  std::string *v13;
  __int128 v14;
  std::string *v15;
  __int128 v16;
  void *v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  void *v20;
  std::__shared_weak_count *v21;
  unint64_t *v22;
  unint64_t v23;
  std::string *v24;
  __int128 v25;
  std::__shared_weak_count *v26;
  unint64_t *v27;
  unint64_t v28;
  std::string::value_type *__s;
  std::string::value_type *__sa;
  std::string::value_type *__sb;
  std::string::value_type *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t *v36;
  std::string v37;
  std::string v38;
  std::string v39;
  uint64_t v40;
  std::__shared_weak_count *v41;
  std::string v42;
  std::string v43;
  std::string v44;
  void *__p[2];
  std::string::size_type v46;
  _DWORD v47[2];
  _DWORD v48[2];
  _DWORD v49[2];
  void *v50;
  uint64_t v51;
  uint64_t v52;
  std::string v53;
  __int128 *v54;
  __int128 *v55;
  _QWORD v56[3];
  char v57;
  char v58;
  _QWORD block[4];
  id v60;
  _OWORD v61[3];
  uint64_t v62;
  std::__shared_weak_count *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  __n128 (*v67)(uint64_t, uint64_t);
  uint64_t (*v68)();
  const char *v69;
  _QWORD v70[3];
  char v71;
  char v72;

  v64 = 0;
  v65 = &v64;
  v66 = 0x6012000000;
  v67 = __Block_byref_object_copy__24702;
  v68 = __Block_byref_object_dispose__24703;
  v72 = 0;
  v69 = "";
  memset(v70, 0, sizeof(v70));
  v71 = 0;
  siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v70);
  v2 = *(void **)(a1 + 32);
  v3 = *((_OWORD *)v65 + 4);
  v61[0] = *((_OWORD *)v65 + 3);
  v61[1] = v3;
  v61[2] = *((_OWORD *)v65 + 5);
  if (v2)
  {
    objc_msgSend(v2, "getContext:", v61);
    if (v62)
    {
      v58 = 0;
      memset(v56, 0, sizeof(v56));
      v57 = 0;
      siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v56);
      siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&v50, (const siri::dialogengine::RequestInfo *)(v62 + 8));
      objc_msgSend(*(id *)(a1 + 32), "LogCurareCATExecution:", &v50);
      *(_DWORD *)((char *)v49 + 3) = 0;
      v49[0] = 0;
      *(_DWORD *)((char *)v48 + 3) = 0;
      v48[0] = 0;
      *(_DWORD *)((char *)v47 + 3) = 0;
      v47[0] = 0;
      if ((_DWORD)v50)
      {
        if ((_DWORD)v50 == 1)
        {
          memset(&v44, 0, sizeof(v44));
          std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v44, v51, v52, 0xAAAAAAAAAAAAAAABLL * ((v52 - v51) >> 5));
          if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
            std::string::__init_copy_ctor_external(&v43, v53.__r_.__value_.__l.__data_, v53.__r_.__value_.__l.__size_);
          else
            v43 = v53;
          siri::dialogengine::FindVisualFile((__int128 **)&v44, (uint64_t)&v43, (uint64_t)__p);
          v10 = (std::string::value_type *)__p[0];
          v11 = __p[1];
          v47[0] = v46;
          *(_DWORD *)((char *)v47 + 3) = *(_DWORD *)((char *)&v46 + 3);
          v12 = HIBYTE(v46);
          HIBYTE(v46) = 0;
          LOBYTE(__p[0]) = 0;
          if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v43.__r_.__value_.__l.__data_);
          v43.__r_.__value_.__r.__words[0] = (std::string::size_type)&v44;
          std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
          siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)v56, &v44);
          v13 = std::string::insert(&v44, 0, "Finding visual path took ");
          v14 = *(_OWORD *)&v13->__r_.__value_.__l.__data_;
          v46 = v13->__r_.__value_.__r.__words[2];
          *(_OWORD *)__p = v14;
          v13->__r_.__value_.__l.__size_ = 0;
          v13->__r_.__value_.__r.__words[2] = 0;
          v13->__r_.__value_.__r.__words[0] = 0;
          siri::dialogengine::Log::Debug((siri::dialogengine *)__p);
          if (SHIBYTE(v46) < 0)
            operator delete(__p[0]);
          if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
            operator delete(v44.__r_.__value_.__l.__data_);
          v5 = 0;
          v6 = 0;
          v7 = 0;
          v32 = 0;
          v8 = 0;
          v9 = 0;
        }
        else
        {
          v5 = 0;
          v6 = 0;
          v7 = 0;
          v32 = 0;
          v8 = 0;
          v9 = 0;
          v10 = 0;
          v11 = 0;
          v12 = 0;
        }
      }
      else
      {
        memset(&v44, 0, sizeof(v44));
        std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v44, v51, v52, 0xAAAAAAAAAAAAAAABLL * ((v52 - v51) >> 5));
        if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v43, v53.__r_.__value_.__l.__data_, v53.__r_.__value_.__l.__size_);
        else
          v43 = v53;
        siri::dialogengine::FindParamsFile((__int128 **)&v44, (uint64_t)&v43, (uint64_t)__p);
        v6 = __p[1];
        __s = (std::string::value_type *)__p[0];
        v49[0] = v46;
        *(_DWORD *)((char *)v49 + 3) = *(_DWORD *)((char *)&v46 + 3);
        v7 = HIBYTE(v46);
        HIBYTE(v46) = 0;
        LOBYTE(__p[0]) = 0;
        if (SHIBYTE(v43.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v43.__r_.__value_.__l.__data_);
        v43.__r_.__value_.__r.__words[0] = (std::string::size_type)&v44;
        std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
        memset(&v44, 0, sizeof(v44));
        std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v44, v51, v52, 0xAAAAAAAAAAAAAAABLL * ((v52 - v51) >> 5));
        memset(&v43, 0, sizeof(v43));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v43, v54, v55, 0xAAAAAAAAAAAAAAABLL * (((char *)v55 - (char *)v54) >> 3));
        if (SHIBYTE(v53.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v42, v53.__r_.__value_.__l.__data_, v53.__r_.__value_.__l.__size_);
        else
          v42 = v53;
        siri::dialogengine::FindLocaleFile((__int128 **)&v44, (__int128 **)&v43, (uint64_t)&v42, (uint64_t)__p);
        v8 = __p[1];
        v32 = (std::string::value_type *)__p[0];
        v48[0] = v46;
        *(_DWORD *)((char *)v48 + 3) = *(_DWORD *)((char *)&v46 + 3);
        v9 = HIBYTE(v46);
        HIBYTE(v46) = 0;
        LOBYTE(__p[0]) = 0;
        if (SHIBYTE(v42.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v42.__r_.__value_.__l.__data_);
        v42.__r_.__value_.__r.__words[0] = (std::string::size_type)&v43;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v42);
        v43.__r_.__value_.__r.__words[0] = (std::string::size_type)&v44;
        std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v43);
        siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)v56, &v44);
        v15 = std::string::insert(&v44, 0, "Finding locale path took ");
        v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
        v46 = v15->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v16;
        v15->__r_.__value_.__l.__size_ = 0;
        v15->__r_.__value_.__r.__words[2] = 0;
        v15->__r_.__value_.__r.__words[0] = 0;
        siri::dialogengine::Log::Debug((siri::dialogengine *)__p);
        if (SHIBYTE(v46) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v44.__r_.__value_.__l.__data_);
        v10 = 0;
        v11 = 0;
        v12 = 0;
        v5 = __s;
      }
      v17 = *(void **)(a1 + 32);
      v40 = v62;
      v41 = v63;
      if (v63)
      {
        p_shared_owners = (unint64_t *)&v63->__shared_owners_;
        do
          v19 = __ldxr(p_shared_owners);
        while (__stxr(v19 + 1, p_shared_owners));
      }
      __sa = (std::string::value_type *)v5;
      if (v7 < 0)
      {
        std::string::__init_copy_ctor_external(&v39, v5, (std::string::size_type)v6);
      }
      else
      {
        v39.__r_.__value_.__r.__words[0] = (std::string::size_type)v5;
        v39.__r_.__value_.__l.__size_ = (std::string::size_type)v6;
        LODWORD(v39.__r_.__value_.__r.__words[2]) = v49[0];
        *(_DWORD *)((char *)&v39.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v49 + 3);
        *((_BYTE *)&v39.__r_.__value_.__s + 23) = v7;
      }
      if (v9 < 0)
      {
        std::string::__init_copy_ctor_external(&v38, v32, (std::string::size_type)v8);
      }
      else
      {
        v38.__r_.__value_.__r.__words[0] = (std::string::size_type)v32;
        v38.__r_.__value_.__l.__size_ = (std::string::size_type)v8;
        LODWORD(v38.__r_.__value_.__r.__words[2]) = v48[0];
        *(_DWORD *)((char *)&v38.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v48 + 3);
        *((_BYTE *)&v38.__r_.__value_.__s + 23) = v9;
      }
      if (v12 < 0)
      {
        std::string::__init_copy_ctor_external(&v37, v10, (std::string::size_type)v11);
      }
      else
      {
        v37.__r_.__value_.__r.__words[0] = (std::string::size_type)v10;
        v37.__r_.__value_.__l.__size_ = (std::string::size_type)v11;
        LODWORD(v37.__r_.__value_.__r.__words[2]) = v47[0];
        *(_DWORD *)((char *)&v37.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v47 + 3);
        *((_BYTE *)&v37.__r_.__value_.__s + 23) = v12;
      }
      objc_msgSend(v17, "consumeContext:paramsPath:localePath:visualPath:", &v40, &v39, &v38, &v37, __sa);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (SHIBYTE(v37.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v37.__r_.__value_.__l.__data_);
      if (SHIBYTE(v38.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v38.__r_.__value_.__l.__data_);
      if (SHIBYTE(v39.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v39.__r_.__value_.__l.__data_);
      v21 = v41;
      if (v41)
      {
        v22 = (unint64_t *)&v41->__shared_owners_;
        do
          v23 = __ldaxr(v22);
        while (__stlxr(v23 - 1, v22));
        if (!v23)
        {
          ((void (*)(std::__shared_weak_count *))v21->__on_zero_shared)(v21);
          std::__shared_weak_count::__release_weak(v21);
        }
      }
      if (*(_QWORD *)(a1 + 40))
      {
        siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)(v65 + 6), &v44);
        v24 = std::string::insert(&v44, 0, "Time in executeWithCompletionBlock before switch to return queue is ");
        v25 = *(_OWORD *)&v24->__r_.__value_.__l.__data_;
        v46 = v24->__r_.__value_.__r.__words[2];
        *(_OWORD *)__p = v25;
        v24->__r_.__value_.__l.__size_ = 0;
        v24->__r_.__value_.__r.__words[2] = 0;
        v24->__r_.__value_.__r.__words[0] = 0;
        siri::dialogengine::Log::Debug((siri::dialogengine *)__p);
        if (SHIBYTE(v46) < 0)
          operator delete(__p[0]);
        if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v44.__r_.__value_.__l.__data_);
        if (*(_BYTE *)(a1 + 48))
        {
          v33[0] = MEMORY[0x1E0C809B0];
          v33[1] = 3221225472;
          v33[2] = __41__DEExecutor_executeWithCompletionBlock___block_invoke_2;
          v33[3] = &unk_1E7934C88;
          v36 = &v64;
          v35 = *(id *)(a1 + 40);
          v34 = v20;
          dispatch_async(MEMORY[0x1E0C80D38], v33);

        }
        else
        {
          (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
        }
      }

      if (v12 < 0)
      {
        operator delete(v10);
        if ((v9 & 0x80) == 0)
        {
LABEL_67:
          if ((v7 & 0x80) == 0)
          {
LABEL_68:
            siri::dialogengine::RequestInfo::~RequestInfo(&v50);
            goto LABEL_69;
          }
LABEL_77:
          operator delete(__sb);
          goto LABEL_68;
        }
      }
      else if ((v9 & 0x80) == 0)
      {
        goto LABEL_67;
      }
      operator delete(v32);
      if ((v7 & 0x80) == 0)
        goto LABEL_68;
      goto LABEL_77;
    }
  }
  else
  {
    v62 = 0;
    v63 = 0;
  }
  v4 = *(void **)(a1 + 40);
  if (v4)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__DEExecutor_executeWithCompletionBlock___block_invoke_290;
    block[3] = &unk_1E7934C60;
    v60 = v4;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
LABEL_69:
  v26 = v63;
  if (v63)
  {
    v27 = (unint64_t *)&v63->__shared_owners_;
    do
      v28 = __ldaxr(v27);
    while (__stlxr(v28 - 1, v27));
    if (!v28)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  _Block_object_dispose(&v64, 8);
}

uint64_t __41__DEExecutor_executeWithCompletionBlock___block_invoke_290(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __41__DEExecutor_executeWithCompletionBlock___block_invoke_2(uint64_t a1)
{
  std::string *v2;
  __int128 v3;
  std::string v5;
  void *__p[2];
  std::string::size_type v7;

  siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 48), &v5);
  v2 = std::string::insert(&v5, 0, "Total time in executeWithCompletionBlock is ");
  v3 = *(_OWORD *)&v2->__r_.__value_.__l.__data_;
  v7 = v2->__r_.__value_.__r.__words[2];
  *(_OWORD *)__p = v3;
  v2->__r_.__value_.__l.__size_ = 0;
  v2->__r_.__value_.__r.__words[2] = 0;
  v2->__r_.__value_.__r.__words[0] = 0;
  siri::dialogengine::Log::Debug((siri::dialogengine *)__p);
  if (SHIBYTE(v7) < 0)
    operator delete(__p[0]);
  if (SHIBYTE(v5.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v5.__r_.__value_.__l.__data_);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __36__DEExecutor_LogCurareCATExecution___block_invoke(uint64_t a1)
{
  return siri::dialogengine::LogCurareCATExecution((uint64_t *)(a1 + 32), (const std::string::value_type *)(a1 + 56), (uint64_t *)(a1 + 80), (uint64_t *)(a1 + 104));
}

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  v2 = os_log_create("com.apple.siri.DialogEngine", "DEExecutor");
  v3 = (void *)_log;
  _log = (uint64_t)v2;

}

+ (void)preload
{
  unsigned __int8 v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  siri::dialogengine *v7;
  id v8;
  const char *v9;
  std::string *p_p;
  void *v11;
  id v12;
  const char *v13;
  std::string *v14;
  std::string *v15;
  __int128 v16;
  siri::dialogengine *v17;
  NSObject *v18;
  NSObject *v19;
  std::string v20;
  std::string v21;
  std::string __p;
  siri::dialogengine *v23[3];
  char v24;
  char v25;
  uint8_t buf[8];
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;

  {
    __cxa_atexit((void (*)(void *))MEMORY[0x1E0DE4AB8], &+[DEExecutor preload]::sPreloadMutex, &dword_1BF794000);
  }
  std::mutex::lock(&+[DEExecutor preload]::sPreloadMutex);
  v3 = os_signpost_id_generate((os_log_t)_log);
  v4 = (id)_log;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "Preload", ", buf, 2u);
  }

  if ((+[DEExecutor preload]::sInitialized & 1) == 0)
  {
    v30 = 0;
    v27 = 0;
    v28 = 0;
    *(_QWORD *)buf = 0;
    v29 = 0;
    siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)buf);
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"PRELOAD: DialogEngine starting preload work", v6);
    v25 = 0;
    memset(v23, 0, sizeof(v23));
    v24 = 0;
    siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v23);
    siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v23);
    v8 = siri::dialogengine::GetUAFAssetSet(v7);
    siri::dialogengine::ElapsedTimer::Stop(v23);
    siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)v23, &__p);
    if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      p_p = &__p;
    else
      p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"PRELOAD: GetUAFAssetSet time: %s", v9, p_p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
    siri::dialogengine::ElapsedTimer::Reset((siri::dialogengine::ElapsedTimer *)v23);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localeIdentifier");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    std::string::basic_string[abi:ne180100]<0>(&v21, (char *)objc_msgSend(v12, "UTF8String"));
    siri::dialogengine::GetCanonicalLocale(&v21, 0, &__p);
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v21.__r_.__value_.__l.__data_);

    siri::dialogengine::PreloadMorphunData(&__p);
    siri::dialogengine::ElapsedTimer::Stop(v23);
    siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)v23, &v21);
    if ((v21.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
      v14 = &v21;
    else
      v14 = (std::string *)v21.__r_.__value_.__r.__words[0];
    siri::dialogengine::Log::Info((siri::dialogengine::Log *)"PRELOAD: PreloadMorphunData time: %s", v13, v14);
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v21.__r_.__value_.__l.__data_);
    siri::dialogengine::ElapsedTimer::Stop((siri::dialogengine **)buf);
    siri::dialogengine::ElapsedTimer::GetCombinedMSecsAsString((siri::dialogengine::ElapsedTimer *)buf, &v20);
    v15 = std::string::insert(&v20, 0, "PRELOAD: DialogEngine finished preload work in ");
    v16 = *(_OWORD *)&v15->__r_.__value_.__l.__data_;
    v21.__r_.__value_.__r.__words[2] = v15->__r_.__value_.__r.__words[2];
    *(_OWORD *)&v21.__r_.__value_.__l.__data_ = v16;
    v15->__r_.__value_.__l.__size_ = 0;
    v15->__r_.__value_.__r.__words[2] = 0;
    v15->__r_.__value_.__r.__words[0] = 0;
    siri::dialogengine::Log::LogWithLevel((uint64_t)&v21, 0);
    if (SHIBYTE(v21.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v21.__r_.__value_.__l.__data_);
    if (SHIBYTE(v20.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v20.__r_.__value_.__l.__data_);
    siri::dialogengine::ReportPreloadHasBeenCalled(v17);
    +[DEExecutor preload]::sInitialized = 1;
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  v18 = (id)_log;
  v19 = v18;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BF794000, v19, OS_SIGNPOST_INTERVAL_END, v3, "Preload", ", buf, 2u);
  }

  std::mutex::unlock(&+[DEExecutor preload]::sPreloadMutex);
}

+ (id)bundleTemplateDir:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  __CFString *v8;
  void **v9;
  void *__p[2];
  char v12;
  void *v13[2];
  char v14;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "resourcePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
      v7 = (char *)objc_msgSend(objc_retainAutorelease(v5), "UTF8String");
    else
      v7 = "";
    std::string::basic_string[abi:ne180100]<0>(__p, v7);
    siri::dialogengine::GetDomainTemplateDir((uint64_t)__p, (uint64_t)v13);
    if (v12 < 0)
      operator delete(__p[0]);
    if (v14 >= 0)
      v9 = v13;
    else
      v9 = (void **)v13[0];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v9);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (v14 < 0)
      operator delete(v13[0]);

  }
  else
  {
    v8 = &stru_1E793AF80;
  }

  return v8;
}

+ (id)prepareCallback:(id)a3 forContext:(void *)a4
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  void *v11;

  v5 = a3;
  v6 = v5;
  v7 = 0;
  if (v5 && a4)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __41__DEExecutor_prepareCallback_forContext___block_invoke;
    v9[3] = &unk_1E7934C08;
    v11 = a4;
    v10 = v5;
    v7 = (void *)MEMORY[0x1C3B8DDB8](v9);

  }
  return v7;
}

+ (void)executeWithJson:(id)a3 paramsString:(id)a4 localeString:(id)a5 callback:(id)a6 completionBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  unint64_t *p_shared_owners;
  unint64_t v20;
  uint64_t v21;
  void (**v22)(void);
  std::string::size_type size;
  std::string::size_type v24;
  __int128 v25;
  std::string::value_type *v26;
  std::string::size_type v27;
  char v28;
  std::string::value_type *v29;
  std::string::size_type v30;
  char v31;
  siri::dialogengine::Context *v32;
  std::__shared_weak_count *v33;
  unint64_t *v34;
  unint64_t v35;
  std::__shared_weak_count *v36;
  unint64_t *v37;
  unint64_t v38;
  id v39;
  id v40;
  id v41;
  id v42;
  int v43;
  std::string v44;
  std::string v45;
  std::string v46;
  std::string v47;
  std::string v48;
  __int128 *v49;
  uint64_t v50;
  uint64_t v51;
  _DWORD v52[2];
  _DWORD v53[2];
  _DWORD v54[2];
  void *__p;
  uint64_t v56;
  uint64_t v57;
  std::string v58;
  __int128 *v59;
  __int128 *v60;
  _QWORD v61[4];
  id v62;
  id v63;
  siri::dialogengine::Context *v64;
  std::__shared_weak_count *v65;
  _QWORD block[4];
  id v67;
  std::string v68;
  siri::dialogengine::Context *v69;
  std::__shared_weak_count *v70;
  std::string v71;
  std::string v72;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  std::string::basic_string[abi:ne180100]<0>(&v72, "");
  if (v12)
    MEMORY[0x1C3B8D53C](&v72, objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(&v71, "");
  if (v13)
    MEMORY[0x1C3B8D53C](&v71, objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  v16 = objc_retainAutorelease(v11);
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v16, "UTF8String"));
  std::string::basic_string[abi:ne180100]<0>(&v68, "");
  siri::dialogengine::ParseRequestFromJson((const char *)&__p, &v72, &v71, &v68, &v69);
  if (SHIBYTE(v68.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v68.__r_.__value_.__l.__data_);
  if (SHIBYTE(v57) < 0)
    operator delete(__p);
  if (v69)
  {
    v17 = (void *)objc_opt_new();
    objc_msgSend(v17, "setCallback:", v14);
    v61[0] = MEMORY[0x1E0C809B0];
    v61[1] = 3321888768;
    v61[2] = __81__DEExecutor_executeWithJson_paramsString_localeString_callback_completionBlock___block_invoke_2;
    v61[3] = &unk_1E7934D00;
    v18 = v17;
    v62 = v18;
    v64 = v69;
    v65 = v70;
    if (v70)
    {
      p_shared_owners = (unint64_t *)&v70->__shared_owners_;
      do
        v20 = __ldxr(p_shared_owners);
      while (__stxr(v20 + 1, p_shared_owners));
    }
    v63 = v15;
    v21 = MEMORY[0x1C3B8DDB8](v61);
    v22 = (void (**)(void))v21;
    size = HIBYTE(v72.__r_.__value_.__r.__words[2]);
    if ((v72.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      size = v72.__r_.__value_.__l.__size_;
    if (!size)
      goto LABEL_20;
    v24 = HIBYTE(v71.__r_.__value_.__r.__words[2]);
    if ((v71.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
      v24 = v71.__r_.__value_.__l.__size_;
    if (v24)
    {
      (*(void (**)(uint64_t))(v21 + 16))(v21);
    }
    else
    {
LABEL_20:
      v41 = v13;
      v42 = v12;
      v39 = v15;
      v40 = v14;
      siri::dialogengine::RequestInfo::RequestInfo((siri::dialogengine::RequestInfo *)&__p, (siri::dialogengine::Context *)((char *)v69 + 8));
      *(_DWORD *)((char *)v54 + 3) = 0;
      v54[0] = 0;
      *(_DWORD *)((char *)v53 + 3) = 0;
      v53[0] = 0;
      *(_DWORD *)((char *)v52 + 3) = 0;
      v52[0] = 0;
      v49 = 0;
      v50 = 0;
      v51 = 0;
      std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v49, v56, v57, 0xAAAAAAAAAAAAAAABLL * ((v57 - v56) >> 5));
      if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external(&v48, v58.__r_.__value_.__l.__data_, v58.__r_.__value_.__l.__size_);
      else
        v48 = v58;
      siri::dialogengine::FindParamsFile(&v49, (uint64_t)&v48, (uint64_t)&v68);
      v25 = *(_OWORD *)&v68.__r_.__value_.__l.__data_;
      v54[0] = v68.__r_.__value_.__r.__words[2];
      *(_DWORD *)((char *)v54 + 3) = *(_DWORD *)((char *)&v68.__r_.__value_.__r.__words[2] + 3);
      v43 = SHIBYTE(v68.__r_.__value_.__r.__words[2]);
      *((_BYTE *)&v68.__r_.__value_.__s + 23) = 0;
      v68.__r_.__value_.__s.__data_[0] = 0;
      if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v48.__r_.__value_.__l.__data_);
      v48.__r_.__value_.__r.__words[0] = (std::string::size_type)&v49;
      std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
      if ((_DWORD)__p == 1)
      {
        v49 = 0;
        v50 = 0;
        v51 = 0;
        std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v49, v56, v57, 0xAAAAAAAAAAAAAAABLL * ((v57 - v56) >> 5));
        if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v48, v58.__r_.__value_.__l.__data_, v58.__r_.__value_.__l.__size_);
        else
          v48 = v58;
        siri::dialogengine::FindVisualFile(&v49, (uint64_t)&v48, (uint64_t)&v68);
        v27 = v68.__r_.__value_.__l.__size_;
        v26 = (std::string::value_type *)v68.__r_.__value_.__r.__words[0];
        v52[0] = v68.__r_.__value_.__r.__words[2];
        *(_DWORD *)((char *)v52 + 3) = *(_DWORD *)((char *)&v68.__r_.__value_.__r.__words[2] + 3);
        v28 = HIBYTE(v68.__r_.__value_.__r.__words[2]);
        *((_BYTE *)&v68.__r_.__value_.__s + 23) = 0;
        v68.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(v48.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v48.__r_.__value_.__l.__data_);
        v48.__r_.__value_.__r.__words[0] = (std::string::size_type)&v49;
        std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
        v29 = 0;
        v30 = 0;
        v31 = 0;
      }
      else
      {
        v49 = 0;
        v50 = 0;
        v51 = 0;
        std::vector<siri::dialogengine::UpdatableDir>::__init_with_size[abi:ne180100]<siri::dialogengine::UpdatableDir*,siri::dialogengine::UpdatableDir*>(&v49, v56, v57, 0xAAAAAAAAAAAAAAABLL * ((v57 - v56) >> 5));
        memset(&v48, 0, sizeof(v48));
        std::vector<std::string>::__init_with_size[abi:ne180100]<std::string*,std::string*>(&v48, v59, v60, 0xAAAAAAAAAAAAAAABLL * (((char *)v60 - (char *)v59) >> 3));
        if (SHIBYTE(v58.__r_.__value_.__r.__words[2]) < 0)
          std::string::__init_copy_ctor_external(&v47, v58.__r_.__value_.__l.__data_, v58.__r_.__value_.__l.__size_);
        else
          v47 = v58;
        siri::dialogengine::FindLocaleFile(&v49, (__int128 **)&v48, (uint64_t)&v47, (uint64_t)&v68);
        v30 = v68.__r_.__value_.__l.__size_;
        v29 = (std::string::value_type *)v68.__r_.__value_.__r.__words[0];
        v53[0] = v68.__r_.__value_.__r.__words[2];
        *(_DWORD *)((char *)v53 + 3) = *(_DWORD *)((char *)&v68.__r_.__value_.__r.__words[2] + 3);
        v31 = HIBYTE(v68.__r_.__value_.__r.__words[2]);
        *((_BYTE *)&v68.__r_.__value_.__s + 23) = 0;
        v68.__r_.__value_.__s.__data_[0] = 0;
        if (SHIBYTE(v47.__r_.__value_.__r.__words[2]) < 0)
          operator delete(v47.__r_.__value_.__l.__data_);
        v47.__r_.__value_.__r.__words[0] = (std::string::size_type)&v48;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&v47);
        v48.__r_.__value_.__r.__words[0] = (std::string::size_type)&v49;
        std::vector<siri::dialogengine::UpdatableDir>::__destroy_vector::operator()[abi:ne180100]((void ***)&v48);
        v26 = 0;
        v27 = 0;
        v28 = 0;
      }
      v32 = v69;
      if (v43 < 0)
      {
        std::string::__init_copy_ctor_external(&v46, (const std::string::value_type *)v25, *((std::string::size_type *)&v25 + 1));
      }
      else
      {
        *(_OWORD *)&v46.__r_.__value_.__l.__data_ = v25;
        LODWORD(v46.__r_.__value_.__r.__words[2]) = v54[0];
        *(_DWORD *)((char *)&v46.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v54 + 3);
        *((_BYTE *)&v46.__r_.__value_.__s + 23) = v43;
      }
      if (v31 < 0)
      {
        std::string::__init_copy_ctor_external(&v45, v29, v30);
      }
      else
      {
        v45.__r_.__value_.__r.__words[0] = (std::string::size_type)v29;
        v45.__r_.__value_.__l.__size_ = v30;
        LODWORD(v45.__r_.__value_.__r.__words[2]) = v53[0];
        *(_DWORD *)((char *)&v45.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v53 + 3);
        *((_BYTE *)&v45.__r_.__value_.__s + 23) = v31;
      }
      if (v28 < 0)
      {
        std::string::__init_copy_ctor_external(&v44, v26, v27);
      }
      else
      {
        v44.__r_.__value_.__r.__words[0] = (std::string::size_type)v26;
        v44.__r_.__value_.__l.__size_ = v27;
        LODWORD(v44.__r_.__value_.__r.__words[2]) = v52[0];
        *(_DWORD *)((char *)&v44.__r_.__value_.__r.__words[2] + 3) = *(_DWORD *)((char *)v52 + 3);
        *((_BYTE *)&v44.__r_.__value_.__s + 23) = v28;
      }
      objc_msgSend(v18, "updateContext:paramsPath:localePath:visualPath:", v32, &v46, &v45, &v44);
      if (SHIBYTE(v44.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v44.__r_.__value_.__l.__data_);
      if (SHIBYTE(v45.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v45.__r_.__value_.__l.__data_);
      if (SHIBYTE(v46.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v46.__r_.__value_.__l.__data_);
      v22[2]();
      if (v28 < 0)
        operator delete(v26);
      if (v31 < 0)
        operator delete(v29);
      v13 = v41;
      v12 = v42;
      v14 = v40;
      if (v43 < 0)
        operator delete((void *)v25);
      siri::dialogengine::RequestInfo::~RequestInfo(&__p);
      v15 = v39;
    }

    v33 = v65;
    if (v65)
    {
      v34 = (unint64_t *)&v65->__shared_owners_;
      do
        v35 = __ldaxr(v34);
      while (__stlxr(v35 - 1, v34));
      if (!v35)
      {
        ((void (*)(std::__shared_weak_count *))v33->__on_zero_shared)(v33);
        std::__shared_weak_count::__release_weak(v33);
      }
    }

    goto LABEL_68;
  }
  if (v15)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__DEExecutor_executeWithJson_paramsString_localeString_callback_completionBlock___block_invoke;
    block[3] = &unk_1E7934C60;
    v67 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v18 = v67;
LABEL_68:

  }
  v36 = v70;
  if (v70)
  {
    v37 = (unint64_t *)&v70->__shared_owners_;
    do
      v38 = __ldaxr(v37);
    while (__stlxr(v38 - 1, v37));
    if (!v38)
    {
      ((void (*)(std::__shared_weak_count *))v36->__on_zero_shared)(v36);
      std::__shared_weak_count::__release_weak(v36);
    }
  }
  if (SHIBYTE(v71.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v71.__r_.__value_.__l.__data_);
  if (SHIBYTE(v72.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v72.__r_.__value_.__l.__data_);

}

+ (void)executeWithJson:(id)a3 callback:(id)a4 completionBlock:(id)a5
{
  +[DEExecutor executeWithJson:paramsString:localeString:callback:completionBlock:](DEExecutor, "executeWithJson:paramsString:localeString:callback:completionBlock:", a3, 0, 0, a4, a5);
}

+ (void)executeWithJson:(id)a3 completionBlock:(id)a4
{
  +[DEExecutor executeWithJson:callback:completionBlock:](DEExecutor, "executeWithJson:callback:completionBlock:", a3, 0, a4);
}

uint64_t __81__DEExecutor_executeWithJson_paramsString_localeString_callback_completionBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __81__DEExecutor_executeWithJson_paramsString_localeString_callback_completionBlock___block_invoke_2(_QWORD *a1)
{
  void *v2;
  std::__shared_weak_count *v3;
  unint64_t *p_shared_owners;
  unint64_t v5;
  unint64_t *v6;
  unint64_t v7;
  void **v8;
  void *v9;
  void *v10;
  _QWORD block[4];
  id v12;
  id v13;
  uint64_t v14;
  std::__shared_weak_count *v15;
  void *v16[2];
  uint64_t v17;

  v2 = (void *)a1[4];
  v3 = (std::__shared_weak_count *)a1[7];
  v14 = a1[6];
  v15 = v3;
  if (v3)
  {
    p_shared_owners = (unint64_t *)&v3->__shared_owners_;
    do
      v5 = __ldxr(p_shared_owners);
    while (__stxr(v5 + 1, p_shared_owners));
  }
  if (v2)
  {
    objc_msgSend(v2, "consumeContextForJson:", &v14);
    v3 = v15;
    if (!v15)
      goto LABEL_12;
  }
  else
  {
    v16[0] = 0;
    v16[1] = 0;
    v17 = 0;
    if (!v3)
      goto LABEL_12;
  }
  v6 = (unint64_t *)&v3->__shared_owners_;
  do
    v7 = __ldaxr(v6);
  while (__stlxr(v7 - 1, v6));
  if (!v7)
  {
    ((void (*)(std::__shared_weak_count *))v3->__on_zero_shared)(v3);
    std::__shared_weak_count::__release_weak(v3);
  }
LABEL_12:
  if (v17 >= 0)
    v8 = v16;
  else
    v8 = (void **)v16[0];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)a1[5];
  if (v10)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__DEExecutor_executeWithJson_paramsString_localeString_callback_completionBlock___block_invoke_3;
    block[3] = &unk_1E7934CD8;
    v13 = v10;
    v12 = v9;
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  if (SHIBYTE(v17) < 0)
    operator delete(v16[0]);
}

uint64_t __81__DEExecutor_executeWithJson_paramsString_localeString_callback_completionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __41__DEExecutor_prepareCallback_forContext___block_invoke(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char *a4@<X3>, _QWORD *a5@<X8>)
{
  void *v10;
  uint64_t v11;
  uint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *p_shared_owners;
  unint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  __int128 *v18;
  void *v19;
  std::string *p_p;
  void *v21;
  std::__shared_weak_count *v22;
  unint64_t *v23;
  unint64_t v24;
  __int128 *v25;
  __int128 *v26;
  BOOL v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  char *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  siri::dialogengine::VariableArray *v36;
  uint64_t v37;
  _QWORD *v38;
  std::string __p;
  void *v40;
  std::__shared_weak_count *v41;
  __int128 *v42;
  _QWORD *v43[2];

  v10 = (void *)objc_opt_new();
  v11 = *(_QWORD *)(a1 + 40);
  if (!v11)
    goto LABEL_27;
  v12 = *(_QWORD *)(v11 + 504);
  v13 = *(std::__shared_weak_count **)(v11 + 512);
  if (!v13)
    goto LABEL_8;
  p_shared_owners = (unint64_t *)&v13->__shared_owners_;
  do
    v15 = __ldxr(p_shared_owners);
  while (__stxr(v15 + 1, p_shared_owners));
  v16 = (unint64_t *)&v13->__shared_owners_;
  do
    v17 = __ldaxr(v16);
  while (__stlxr(v17 - 1, v16));
  if (!v17)
  {
    ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
    std::__shared_weak_count::__release_weak(v13);
    if (!v12)
      goto LABEL_27;
  }
  else
  {
LABEL_8:
    if (!v12)
      goto LABEL_27;
  }
  v37 = a1;
  v38 = a5;
  std::map<std::string,std::shared_ptr<siri::dialogengine::Variable>>::map[abi:ne180100]((uint64_t)&v42, (const void ***)(*(_QWORD *)(a1 + 40) + 520));
  v18 = v42;
  if (v42 != (__int128 *)v43)
  {
    do
    {
      std::pair<std::string const,std::shared_ptr<siri::dialogengine::JSONValue>>::pair[abi:ne180100](&__p, v18 + 2);
      DE_VariableToNSObject(v40, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if ((__p.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
        p_p = &__p;
      else
        p_p = (std::string *)__p.__r_.__value_.__r.__words[0];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", p_p, v37, v38);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v19, v21);

      v22 = v41;
      if (v41)
      {
        v23 = (unint64_t *)&v41->__shared_owners_;
        do
          v24 = __ldaxr(v23);
        while (__stlxr(v24 - 1, v23));
        if (!v24)
        {
          ((void (*)(std::__shared_weak_count *))v22->__on_zero_shared)(v22);
          std::__shared_weak_count::__release_weak(v22);
        }
      }
      if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
        operator delete(__p.__r_.__value_.__l.__data_);
      v25 = (__int128 *)*((_QWORD *)v18 + 1);
      if (v25)
      {
        do
        {
          v26 = v25;
          v25 = *(__int128 **)v25;
        }
        while (v25);
      }
      else
      {
        do
        {
          v26 = (__int128 *)*((_QWORD *)v18 + 2);
          v27 = *(_QWORD *)v26 == (_QWORD)v18;
          v18 = v26;
        }
        while (!v27);
      }
      v18 = v26;
    }
    while (v26 != (__int128 *)v43);
  }
  std::__tree<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::__map_value_compare<std::string,std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::shared_ptr<siri::dialogengine::JSONValue>>>>::destroy(v43[0]);
  a1 = v37;
  a5 = v38;
LABEL_27:
  if (*(char *)(a2 + 23) >= 0)
    v28 = a2;
  else
    v28 = *(_QWORD *)a2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v28, v37, v38);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(char *)(a3 + 23) >= 0)
    v30 = a3;
  else
    v30 = *(_QWORD *)a3;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4[23] >= 0)
    v32 = a4;
  else
    v32 = *(char **)a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = a1;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  if (v35 && (v36 = DE_NSObjectToVariable(*(const char **)(v34 + 40), v35, a3, (const void **)a4, a2, 0)) != 0)
  {
    std::shared_ptr<siri::dialogengine::Variable>::shared_ptr[abi:ne180100]<siri::dialogengine::Variable,void>(a5, (uint64_t)v36);
  }
  else
  {
    *a5 = 0;
    a5[1] = 0;
  }

}

@end
