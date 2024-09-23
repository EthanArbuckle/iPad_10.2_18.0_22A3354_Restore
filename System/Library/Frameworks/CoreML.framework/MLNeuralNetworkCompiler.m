@implementation MLNeuralNetworkCompiler

+ (void)collectEspressoModelDetails:(void *)a3 modelPath:(const void *)a4
{
  void *v5;
  const void *v6;
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
  int v19;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  _OWORD *v23;
  uint64_t v24;
  __CFString *v25;
  __CFString *v26;
  uint64_t v27;
  _OWORD *v28;
  uint64_t v29;
  __CFString *v30;
  __CFString *v31;
  uint64_t v32;
  _OWORD *v33;
  void *__p[2];
  char v35;
  void **v36;

  v5 = (void *)MEMORY[0x1E0C99E98];
  if (*((char *)a4 + 23) >= 0)
    v6 = a4;
  else
    v6 = *(const void **)a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fileURLWithPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "model.espresso.net");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "model.espresso.shape");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "model.espresso.weights");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "fileExistsAtPath:", v16) & 1) == 0)
    goto LABEL_23;
  objc_msgSend(v12, "path");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v15, "fileExistsAtPath:", v17) & 1) == 0)
  {

LABEL_23:
    goto LABEL_24;
  }
  objc_msgSend(v14, "path");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v15, "fileExistsAtPath:", v18);

  if (v19)
  {
    +[MLReporterUtils hashFileAt:error:](MLReporterUtils, "hashFileAt:error:", v10, 0);
    v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
    if (!v20)
      v20 = CFSTR("FailedToComputeHash");
    v21 = objc_retainAutorelease(v20);
    v22 = -[__CFString UTF8String](v21, "UTF8String");
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("nnModelNetHash"), "UTF8String"));
    v36 = __p;
    v23 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)&v36);
    MEMORY[0x1A1AD5EAC]((char *)v23 + 56, v22);
    if (v35 < 0)
      operator delete(__p[0]);
    +[MLReporterUtils hashFileAt:error:](MLReporterUtils, "hashFileAt:error:", v12, 0);
    v24 = objc_claimAutoreleasedReturnValue();

    if (v24)
      v25 = (__CFString *)v24;
    else
      v25 = CFSTR("FailedToComputeHash");
    v26 = objc_retainAutorelease(v25);
    v27 = -[__CFString UTF8String](v26, "UTF8String");
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("nnModelShapeHash"), "UTF8String"));
    v36 = __p;
    v28 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)&v36);
    MEMORY[0x1A1AD5EAC]((char *)v28 + 56, v27);
    if (v35 < 0)
      operator delete(__p[0]);
    +[MLReporterUtils hashFileAt:error:](MLReporterUtils, "hashFileAt:error:", v14, 0);
    v29 = objc_claimAutoreleasedReturnValue();

    if (v29)
      v30 = (__CFString *)v29;
    else
      v30 = CFSTR("FailedToComputeHash");
    v31 = objc_retainAutorelease(v30);
    v32 = -[__CFString UTF8String](v31, "UTF8String");
    std::string::basic_string[abi:ne180100]<0>(__p, (char *)objc_msgSend(CFSTR("nnModelWeightsHash"), "UTF8String"));
    v36 = __p;
    v33 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>((uint64_t **)a3, __p, (_OWORD **)&v36);
    MEMORY[0x1A1AD5EAC]((char *)v33 + 56, v32);
    if (v35 < 0)
      operator delete(__p[0]);

  }
LABEL_24:

}

+ (BOOL)collectNNModelDetailsFromArchive:(void *)a3 spec:(void *)a4 error:(id *)a5
{
  int v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  _OWORD *v14;
  void *v15;
  id v16;
  uint64_t v17;
  _OWORD *v18;
  uint64_t v19;
  BOOL v20;
  std::string __p;
  uint64_t *v23;
  _QWORD *v24[2];
  std::string *p_p;

  v24[0] = 0;
  v24[1] = 0;
  v23 = (uint64_t *)v24;
  v9 = *(_DWORD *)(*(_QWORD *)a4 + 44);
  if (v9 == 303 || v9 == 403 || (v10 = 0, v9 == 500))
    v10 = *(int *)(*(_QWORD *)(*(_QWORD *)a4 + 32) + 24);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringValue");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = objc_msgSend(v12, "UTF8String");
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(CFSTR("modelDimension"), "UTF8String"));
  p_p = &__p;
  v14 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v23, &__p, (_OWORD **)&p_p);
  MEMORY[0x1A1AD5EAC]((char *)v14 + 56, v13);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", CoreML::hasCustomLayer(*(CoreML **)(*(_QWORD *)a4 + 32), (const CoreML::Specification::Model *)*(unsigned int *)(*(_QWORD *)a4 + 44)));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringValue");
  v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v17 = objc_msgSend(v16, "UTF8String");
  std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(CFSTR("containsCustomLayer"), "UTF8String"));
  p_p = &__p;
  v18 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string&&>,std::tuple<>>(&v23, &__p, (_OWORD **)&p_p);
  MEMORY[0x1A1AD5EAC]((char *)v18 + 56, v17);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);

  if ((*(unsigned int (**)(_QWORD))(**((_QWORD **)a3 + 1) + 48))(*((_QWORD *)a3 + 1)) != 1)
  {
    v19 = *((_QWORD *)a3 + 1);
    if (*(char *)(v19 + 55) < 0)
      std::string::__init_copy_ctor_external(&__p, *(const std::string::value_type **)(v19 + 32), *(_QWORD *)(v19 + 40));
    else
      __p = *(std::string *)(v19 + 32);
    objc_msgSend(a1, "collectEspressoModelDetails:modelPath:", &v23, &__p);
    if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__p.__r_.__value_.__l.__data_);
  }
  std::string::basic_string[abi:ne180100]<0>(&__p, "NeuralNetworkModelDetails");
  v20 = +[MLReporterUtils archiveModelDetails:withName:toArchive:error:](MLReporterUtils, "archiveModelDetails:withName:toArchive:error:", &v23, &__p, a3, a5);
  if (SHIBYTE(__p.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__p.__r_.__value_.__l.__data_);
  std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy(v24[0]);
  return v20;
}

+ (id)_compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  unint64_t v7;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  std::__shared_weak_count *v21;
  const CoreML::Specification::Model *v22;
  unint64_t *v23;
  unint64_t v24;
  void *v25;
  const CoreML::Specification::Model *v26;
  NSObject *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  size_t v35;
  size_t v36;
  const void *v37;
  uint64_t v38;
  int v39;
  size_t v40;
  const void *v41;
  size_t v42;
  BOOL v43;
  const void *v44;
  uint64_t v45;
  int v46;
  size_t v47;
  const void *v48;
  size_t v49;
  uint64_t v51;
  void *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  id v61;
  std::__shared_weak_count *v62;
  std::__shared_weak_count_vtbl *v63;
  uint64_t v64;
  unint64_t v65;
  id v66;
  uint64_t v67;
  uint64_t i;
  void *v69;
  id v70;
  id v71;
  std::string *v72;
  uint64_t v73;
  id v74;
  unint64_t v75;
  unint64_t v76;
  unint64_t v77;
  uint8x8_t v78;
  unint64_t v79;
  void **v80;
  char *v81;
  unint64_t v82;
  std::string *v83;
  float v84;
  _BOOL8 v85;
  unint64_t v86;
  unint64_t v87;
  size_t v88;
  uint64_t v89;
  _QWORD *v90;
  unint64_t v91;
  std::string::size_type v92;
  _QWORD *v93;
  std::string::size_type v94;
  std::__shared_weak_count *v95;
  unint64_t *p_shared_owners;
  unint64_t v97;
  std::string::size_type v98;
  std::__shared_weak_count *v99;
  unint64_t *v100;
  unint64_t v101;
  uint64_t v102;
  void *v103;
  BOOL v104;
  _QWORD *v105;
  uint64_t v106;
  id v107;
  _QWORD *v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  uint64_t v112;
  _QWORD *v113;
  void *v114;
  void *v115;
  _QWORD *v116;
  _QWORD *v117;
  const IRProgram *v118;
  const IRProgram *v119;
  void *v120;
  id v121;
  char *v122;
  void *v123;
  void *v124;
  void *v125;
  char *v126;
  uint64_t v127;
  uint64_t *v128;
  uint64_t v129;
  uint64_t *v130;
  uint64_t v131;
  uint64_t v132;
  unsigned __int8 **v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  unsigned __int8 **v137;
  uint64_t v138;
  uint64_t v139;
  unsigned __int8 *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t *v143;
  uint64_t v144;
  uint64_t v145;
  int v146;
  uint64_t v147;
  uint64_t v148;
  const void *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  __int128 **v153;
  unint64_t v154;
  uint64_t v155;
  std::string *v156;
  __int128 *v157;
  __int128 v158;
  MIL::Attributes::BuildInfo *v159;
  MIL::Attributes::BuildInfo *v160;
  unint64_t v161;
  const IRProgram *v162;
  uint64_t v163;
  uint64_t v164;
  __int128 v165;
  uint64_t v166;
  MIL::Attributes::BuildInfo *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  _BYTE *v171;
  int v175;
  int v176;
  uint64_t v178;
  _QWORD *v179;
  uint64_t v180;
  uint64_t v181;
  __n128 v183;
  void *v184;
  uint64_t v185;
  uint64_t *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t j;
  uint64_t v191;
  uint64_t *v192;
  uint64_t v193;
  CoreML::Specification::protobuf_FeatureTypes_2eproto *v194;
  uint64_t *v195;
  uint64_t *v196;
  int v197;
  float v198;
  float v199;
  uint64_t **v200;
  uint64_t **v201;
  char *v202;
  std::string *v203;
  __int128 v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  __int128 *v208;
  __int128 v209;
  CoreML::Specification::protobuf_NeuralNetwork_2eproto *v210;
  uint64_t *v211;
  float v212;
  float v213;
  float v214;
  float v215;
  float v216;
  std::string::size_type size;
  __int128 *v218;
  uint64_t *v219;
  uint64_t v220;
  _DWORD *v221;
  char HasLayerOfType;
  _DWORD *v223;
  char v224;
  _DWORD *v225;
  char v226;
  _DWORD *v227;
  char v228;
  int v229;
  int v230;
  int v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t *v234;
  uint64_t v235;
  uint64_t v236;
  int isIOS12NeuralNetworkLayer;
  char v238;
  int v239;
  uint64_t *v240;
  NSObject *v241;
  void *v242;
  void *v243;
  id v244;
  NSObject *v245;
  uint64_t *v246;
  std::__shared_weak_count *v247;
  unint64_t *v248;
  unint64_t v249;
  _QWORD *v250;
  _QWORD *v251;
  uint64_t v252;
  _QWORD *v253;
  uint64_t v254;
  _QWORD *v255;
  std::__shared_weak_count *v256;
  unint64_t *v257;
  unint64_t v258;
  void *v259;
  void *v260;
  id v261;
  NSObject *v262;
  unint64_t v263;
  _QWORD *v264;
  CoreML::NNCompiler::MLClassifierInfo *v265;
  MIL::Attributes::BuildInfo *v266;
  CoreML::NNCompiler::NeuralNetwork::ImagePreprocessingParameters *v267;
  _QWORD *v268;
  unint64_t *v269;
  unint64_t v270;
  _QWORD *v271;
  uint64_t v272;
  __n128 v273;
  std::__shared_weak_count *v274;
  unint64_t *v275;
  unint64_t v276;
  std::__shared_weak_count *v277;
  unint64_t *v278;
  unint64_t v279;
  std::__shared_weak_count *v280;
  unint64_t *v281;
  unint64_t v282;
  uint64_t *v283;
  int v284;
  int v285;
  uint64_t v286;
  std::__shared_weak_count *v287;
  unint64_t *v288;
  unint64_t v289;
  std::__shared_weak_count *v290;
  unint64_t *v291;
  unint64_t v292;
  _QWORD *v293;
  _QWORD *v294;
  std::__shared_weak_count *v295;
  unint64_t *v296;
  unint64_t v297;
  _QWORD *v298;
  unint64_t *v299;
  _QWORD *v300;
  unint64_t *v301;
  std::__shared_weak_count *v302;
  unint64_t *v303;
  unint64_t v304;
  unint64_t *v305;
  unint64_t v306;
  uint64_t v307;
  _QWORD *v309;
  int v310;
  int v311;
  int v312;
  std::logic_error *v313;
  const std::string::value_type *v314;
  NSError *v315;
  CoreML::MLModelException *v316;
  CoreML::MLModelException *v317;
  NSError *v318;
  void *exception;
  std::logic_error *v320;
  uint64_t v321;
  id v322;
  id v323;
  id v324;
  void *v325;
  id v326;
  id v327;
  _QWORD **v328;
  id *v329;
  const CoreML::Specification::Model *v331;
  uint64_t v332;
  _QWORD *v333;
  uint64_t v334;
  id v335;
  char v336;
  uint64_t *v337;
  id v338;
  id v339;
  id v340;
  _QWORD *v341;
  char v342;
  uint64_t v343;
  _QWORD *v344;
  char v345;
  uint64_t v346;
  std::__shared_weak_count *v347;
  id v348;
  CoreML::Specification::Model *v349;
  std::__shared_weak_count *v350;
  void *v351[2];
  uint64_t v352;
  void *v353[2];
  uint64_t v354;
  __int128 v355;
  __int128 v356;
  MIL::Attributes::BuildInfo *v357[2];
  id v358;
  CoreML::Specification::Model *v359;
  std::__shared_weak_count *v360;
  __int128 v361;
  std::string v362;
  CoreML::NNCompiler::NeuralNetwork::ImagePreprocessingParameters *v363;
  CoreML::NNCompiler::MLClassifierInfo *v364;
  __int128 v365;
  __int128 v366;
  float v367;
  uint64_t v368;
  __int128 __p;
  uint64_t v370;
  id v371;
  std::string v372;
  uint64_t v373;
  void *v374;
  std::string __s;
  std::string *p_s;
  _BYTE v377[32];
  __int128 v378;
  __int128 v379;
  _BYTE v380[48];
  _QWORD *v381;
  _QWORD v382[3];
  _QWORD v383[3];
  _QWORD v384[3];
  _QWORD v385[3];
  _QWORD v386[2];
  __int128 v387;
  std::vector<std::string> v388;
  __int128 v389;
  uint64_t v390;
  __int128 v391;
  std::string v392;
  __int128 v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  char v397;
  char v398;
  char v399;
  char v400;
  char v401;
  BOOL v402;
  uint64_t v403;

  v403 = *MEMORY[0x1E0C80C00];
  v339 = a4;
  v337 = (uint64_t *)a3;
  v338 = a6;
  if (!+[MLModelIOUtils serializeMetadataAndInterfaceFromSpecification:archive:error:](MLModelIOUtils, "serializeMetadataAndInterfaceFromSpecification:archive:error:", a3, a5, a7))goto LABEL_15;
  v12 = *(_DWORD *)(*(_QWORD *)a3 + 44);
  v329 = a7;
  if (v12 > 499)
  {
    if (v12 == 500)
      goto LABEL_10;
    if (v12 != 502)
      goto LABEL_67;
    v322 = v339;
    v324 = v338;
    CoreML::MIL::CoreMLUtil::MakeContext((CoreML::MIL::CoreMLUtil *)&v355);
    v353[0] = 0;
    v353[1] = 0;
    v354 = 0;
    if ((*(unsigned int (**)(_QWORD))(**((_QWORD **)a5 + 1) + 48))(*((_QWORD *)a5 + 1)) == 1)
    {
      MEMORY[0x1A1AD5EAC](v353, &unk_19CB39696);
    }
    else
    {
      objc_msgSend(v324, "specURL");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v60 = a5;
      objc_msgSend(v59, "URLByDeletingLastPathComponent");
      v61 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      MEMORY[0x1A1AD5EAC](v353, objc_msgSend(v61, "fileSystemRepresentation"));

      a5 = v60;
    }
    v359 = (CoreML::Specification::Model *)v355;
    if ((_QWORD)v355)
    {
      v62 = (std::__shared_weak_count *)operator new();
      v63 = (std::__shared_weak_count_vtbl *)v355;
      v62->__vftable = (std::__shared_weak_count_vtbl *)&off_1E3D5C410;
      v62->__shared_owners_ = 0;
      v62->__shared_weak_owners_ = 0;
      v62[1].__vftable = v63;
    }
    else
    {
      v62 = 0;
    }
    v360 = v62;
    *(_QWORD *)&v355 = 0;
    v334 = *(_QWORD *)a3;
    v327 = v322;
    v64 = objc_msgSend(v327, "count");
    v365 = 0u;
    v366 = 0u;
    v367 = 1.0;
    v328 = (_QWORD **)a5;
    if (v64)
    {
      v65 = objc_msgSend(v327, "count");
      std::__hash_table<std::shared_ptr<MIL::Builder::OperationBuilder>,std::hash<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::equal_to<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::allocator<std::shared_ptr<MIL::Builder::OperationBuilder>>>::__rehash<true>((uint64_t)&v365, vcvtps_u32_f32((float)v65 / v367));
      v378 = 0u;
      v379 = 0u;
      memset(v377, 0, sizeof(v377));
      v66 = v327;
      v340 = v66;
      v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", v377, v380, 16);
      if (!v67)
        goto LABEL_152;
      v343 = **(_QWORD **)&v377[16];
      while (1)
      {
        for (i = 0; i != v67; ++i)
        {
          if (**(_QWORD **)&v377[16] != v343)
            objc_enumerationMutation(v66);
          v69 = *(void **)(*(_QWORD *)&v377[8] + 8 * i);
          objc_msgSend(v66, "objectForKeyedSubscript:", v69);
          v70 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          objc_msgSend(v70, "bytes");
          objc_msgSend(v70, "length");
          v71 = v70;
          __s.__r_.__value_.__r.__words[0] = (std::string::size_type)&off_1E3D5B7D8;
          __s.__r_.__value_.__l.__size_ = (std::string::size_type)v71;
          p_s = &__s;
          MIL::Blob::StorageData::Make();
          v72 = p_s;
          if (p_s == &__s)
          {
            v72 = &__s;
            v73 = 4;
            goto LABEL_95;
          }
          if (p_s)
          {
            v73 = 5;
LABEL_95:
            (*(void (**)(void))(v72->__r_.__value_.__r.__words[0] + 8 * v73))();
          }
          objc_msgSend(v69, "relativePath");
          v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          std::string::basic_string[abi:ne180100]<0>(&__p, (char *)objc_msgSend(v74, "UTF8String"));

          v75 = std::__string_hash<char>::operator()[abi:ne180100]((uint64_t)&__p);
          v76 = v75;
          v77 = *((_QWORD *)&v365 + 1);
          if (*((_QWORD *)&v365 + 1))
          {
            v78 = (uint8x8_t)vcnt_s8(*(int8x8_t *)((char *)&v365 + 8));
            v78.i16[0] = vaddlv_u8(v78);
            v79 = v78.u32[0];
            if (v78.u32[0] > 1uLL)
            {
              v7 = v75;
              if (v75 >= *((_QWORD *)&v365 + 1))
                v7 = v75 % *((_QWORD *)&v365 + 1);
            }
            else
            {
              v7 = (*((_QWORD *)&v365 + 1) - 1) & v75;
            }
            v80 = *(void ***)(v365 + 8 * v7);
            if (v80)
            {
              v81 = (char *)*v80;
              if (*v80)
              {
                while (1)
                {
                  v82 = *((_QWORD *)v81 + 1);
                  if (v82 == v76)
                  {
                    if (std::equal_to<std::string>::operator()[abi:ne180100]((unsigned __int8 *)v81 + 16, (unsigned __int8 *)&__p))
                    {
                      v66 = v340;
                      goto LABEL_138;
                    }
                  }
                  else
                  {
                    if (v79 > 1)
                    {
                      if (v82 >= v77)
                        v82 %= v77;
                    }
                    else
                    {
                      v82 &= v77 - 1;
                    }
                    if (v82 != v7)
                    {
LABEL_112:
                      v66 = v340;
                      break;
                    }
                  }
                  v81 = *(char **)v81;
                  if (!v81)
                    goto LABEL_112;
                }
              }
            }
          }
          v81 = (char *)operator new(0x38uLL);
          v372.__r_.__value_.__r.__words[0] = (std::string::size_type)v81;
          v372.__r_.__value_.__l.__size_ = (std::string::size_type)&v366;
          v372.__r_.__value_.__s.__data_[16] = 0;
          *(_QWORD *)v81 = 0;
          *((_QWORD *)v81 + 1) = v76;
          v83 = (std::string *)(v81 + 16);
          if (SHIBYTE(v370) < 0)
          {
            std::string::__init_copy_ctor_external(v83, (const std::string::value_type *)__p, *((std::string::size_type *)&__p + 1));
          }
          else
          {
            *(_OWORD *)&v83->__r_.__value_.__l.__data_ = __p;
            *((_QWORD *)v81 + 4) = v370;
          }
          *((_QWORD *)v81 + 5) = 0;
          *((_QWORD *)v81 + 6) = 0;
          v372.__r_.__value_.__s.__data_[16] = 1;
          v84 = (float)(unint64_t)(*((_QWORD *)&v366 + 1) + 1);
          if (!v77 || (float)(v367 * (float)v77) < v84)
          {
            v85 = (v77 & (v77 - 1)) != 0;
            if (v77 < 3)
              v85 = 1;
            v86 = v85 | (2 * v77);
            v87 = vcvtps_u32_f32(v84 / v367);
            if (v86 <= v87)
              v88 = v87;
            else
              v88 = v86;
            std::__hash_table<std::shared_ptr<MIL::Builder::OperationBuilder>,std::hash<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::equal_to<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::allocator<std::shared_ptr<MIL::Builder::OperationBuilder>>>::__rehash<true>((uint64_t)&v365, v88);
            v77 = *((_QWORD *)&v365 + 1);
            if ((*((_QWORD *)&v365 + 1) & (*((_QWORD *)&v365 + 1) - 1)) != 0)
            {
              if (v76 >= *((_QWORD *)&v365 + 1))
                v7 = v76 % *((_QWORD *)&v365 + 1);
              else
                v7 = v76;
            }
            else
            {
              v7 = (*((_QWORD *)&v365 + 1) - 1) & v76;
            }
          }
          v89 = v365;
          v90 = *(_QWORD **)(v365 + 8 * v7);
          if (v90)
          {
            *(_QWORD *)v81 = *v90;
LABEL_136:
            *v90 = v81;
            goto LABEL_137;
          }
          *(_QWORD *)v81 = v366;
          *(_QWORD *)&v366 = v81;
          *(_QWORD *)(v89 + 8 * v7) = &v366;
          if (*(_QWORD *)v81)
          {
            v91 = *(_QWORD *)(*(_QWORD *)v81 + 8);
            if ((v77 & (v77 - 1)) != 0)
            {
              if (v91 >= v77)
                v91 %= v77;
            }
            else
            {
              v91 &= v77 - 1;
            }
            v90 = (_QWORD *)(v365 + 8 * v91);
            goto LABEL_136;
          }
LABEL_137:
          v372.__r_.__value_.__r.__words[0] = 0;
          ++*((_QWORD *)&v366 + 1);
          std::unique_ptr<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,void *>>>>::reset[abi:ne180100]((uint64_t)&v372);
LABEL_138:
          v92 = v362.__r_.__value_.__r.__words[0];
          if (v362.__r_.__value_.__r.__words[0])
          {
            v93 = (_QWORD *)operator new();
            v94 = v362.__r_.__value_.__r.__words[0];
            *v93 = &off_1E3D5C330;
            v93[1] = 0;
            v93[2] = 0;
            v93[3] = v94;
          }
          else
          {
            v93 = 0;
          }
          v362.__r_.__value_.__r.__words[0] = 0;
          v95 = (std::__shared_weak_count *)*((_QWORD *)v81 + 6);
          *((_QWORD *)v81 + 5) = v92;
          *((_QWORD *)v81 + 6) = v93;
          if (v95)
          {
            p_shared_owners = (unint64_t *)&v95->__shared_owners_;
            do
              v97 = __ldaxr(p_shared_owners);
            while (__stlxr(v97 - 1, p_shared_owners));
            if (!v97)
            {
              ((void (*)(std::__shared_weak_count *))v95->__on_zero_shared)(v95);
              std::__shared_weak_count::__release_weak(v95);
            }
          }
          if (SHIBYTE(v370) < 0)
            operator delete((void *)__p);
          v98 = v362.__r_.__value_.__r.__words[0];
          v362.__r_.__value_.__r.__words[0] = 0;
          if (v98)
            (*(void (**)(std::string::size_type))(*(_QWORD *)v98 + 8))(v98);

        }
        v67 = objc_msgSend(v66, "countByEnumeratingWithState:objects:count:", v377, v380, 16);
        if (!v67)
        {
LABEL_152:

          break;
        }
      }
    }

    *(_OWORD *)v351 = *(_OWORD *)v353;
    v352 = v354;
    v353[0] = 0;
    v353[1] = 0;
    v354 = 0;
    CoreML::NNCompiler::Frontend::MIL::Parse((MIL::IRProgramValidator **)&v361, (std::string::size_type *)&v359, v334, &v365, (uint64_t)v351);
    if (SHIBYTE(v352) < 0)
      operator delete(v351[0]);
    std::__hash_table<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::shared_ptr<MIL::Blob::StorageData const>>>>::~__hash_table((uint64_t)&v365);
    v99 = v360;
    if (v360)
    {
      v100 = (unint64_t *)&v360->__shared_owners_;
      do
        v101 = __ldaxr(v100);
      while (__stlxr(v101 - 1, v100));
      if (!v101)
      {
        ((void (*)(std::__shared_weak_count *))v99->__on_zero_shared)(v99);
        std::__shared_weak_count::__release_weak(v99);
      }
    }
    v102 = *((_QWORD *)&v361 + 1);
    v335 = v324;
    objc_msgSend(v335, "warnings");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = v103 == 0;

    if (!v104)
    {
      v105 = *(_QWORD **)(v102 + 8);
      v333 = *(_QWORD **)(v102 + 16);
      if (v105 != v333)
      {
        v332 = v102 + 80;
        do
        {
          v341 = v105;
          v106 = std::map<std::string,std::string>::at(v332, v105);
          v107 = v335;
          v108 = *(_QWORD **)(v106 + 72);
          v344 = (_QWORD *)(v106 + 80);
          if (v108 != (_QWORD *)(v106 + 80))
          {
            do
            {
              v110 = v108[10];
              v109 = v108[11];
              if (v109 != v110)
              {
                v111 = 0;
                v112 = 8;
                do
                {
                  if ((*(_QWORD *)(v110 + v112) & 0x8000000000000000) != 0)
                  {
                    v113 = v108 + 4;
                    if (*((char *)v108 + 55) < 0)
                      v113 = (_QWORD *)v108[4];
                    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Input: %s %@ %zu%@"), v113, CFSTR("has unbounded upper range at index:"), v111, CFSTR(". Please consider converting the model with coremltools 7 to add an upper bound for this input for possible performance improvement."));
                    v114 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v107, "warnings");
                    v115 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v115, "addObject:", v114);

                    v110 = v108[10];
                    v109 = v108[11];
                  }
                  ++v111;
                  v112 += 16;
                }
                while (v111 < (v109 - v110) >> 4);
              }
              v116 = (_QWORD *)v108[1];
              if (v116)
              {
                do
                {
                  v117 = v116;
                  v116 = (_QWORD *)*v116;
                }
                while (v116);
              }
              else
              {
                do
                {
                  v117 = (_QWORD *)v108[2];
                  v43 = *v117 == (_QWORD)v108;
                  v108 = v117;
                }
                while (!v43);
              }
              v108 = v117;
            }
            while (v117 != v344);
          }

          v105 = v341 + 3;
        }
        while (v341 + 3 != v333);
      }
    }

    v118 = (const IRProgram *)v361;
    MIL::Attributes::BuildInfo::Make((MIL::Attributes::BuildInfo *)v361, v119);
    std::string::basic_string[abi:ne180100]<0>(&__s, "coremlc");
    +[MLCompiler versionInfo](MLCompiler, "versionInfo");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "versionString");
    v121 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v122 = (char *)objc_msgSend(v121, "UTF8String");

    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v372, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
    else
      v372 = __s;
    std::string::basic_string[abi:ne180100]<0>(&__p, v122);
    MIL::Attributes::BuildInfo::SetVersion();
    if (SHIBYTE(v370) < 0)
      operator delete((void *)__p);
    if (SHIBYTE(v372.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v372.__r_.__value_.__l.__data_);
    v377[0] = 0;
    v377[24] = 0;
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.MIL"));
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    std::string::basic_string[abi:ne180100]<0>(&v365, "MIL");
    if (v123)
    {
      objc_msgSend(v123, "infoDictionary");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v124, "valueForKey:", CFSTR("CFBundleVersion"));
      v125 = (void *)objc_claimAutoreleasedReturnValue();

      if (v125)
      {
        v126 = (char *)objc_msgSend(objc_retainAutorelease(v125), "UTF8String");
        if (v377[24])
        {
          MEMORY[0x1A1AD5EAC](v377, v126);
        }
        else
        {
          std::string::basic_string[abi:ne180100]<0>(v377, v126);
          v377[24] = 1;
        }
      }

    }
    if (SBYTE7(v366) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)v380, (const std::string::value_type *)v365, *((std::string::size_type *)&v365 + 1));
    }
    else
    {
      *(_OWORD *)v380 = v365;
      *(_QWORD *)&v380[16] = v366;
    }
    v380[24] = 0;
    LOBYTE(v381) = 0;
    if (v377[24])
    {
      if ((v377[23] & 0x80000000) != 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&v380[24], *(const std::string::value_type **)v377, *(std::string::size_type *)&v377[8]);
      }
      else
      {
        *(_OWORD *)&v380[24] = *(_OWORD *)v377;
        *(_QWORD *)&v380[40] = *(_QWORD *)&v377[16];
      }
      LOBYTE(v381) = 1;
    }
    if (SBYTE7(v366) < 0)
      operator delete((void *)v365);

    if (v377[24] && (v377[23] & 0x80000000) != 0)
      operator delete(*(void **)v377);
    if ((_BYTE)v381)
    {
      if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
        std::string::__init_copy_ctor_external((std::string *)v377, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
      else
        *(std::string *)v377 = __s;
      if ((v380[23] & 0x80000000) != 0)
      {
        std::string::__init_copy_ctor_external((std::string *)&v365, *(const std::string::value_type **)v380, *(std::string::size_type *)&v380[8]);
      }
      else
      {
        v365 = *(_OWORD *)v380;
        *(_QWORD *)&v366 = *(_QWORD *)&v380[16];
      }
      if (!(_BYTE)v381)
        std::__throw_bad_optional_access[abi:ne180100]();
      if ((v380[47] & 0x80000000) != 0)
        std::string::__init_copy_ctor_external(&v362, *(const std::string::value_type **)&v380[24], *(std::string::size_type *)&v380[32]);
      else
        v362 = *(std::string *)&v380[24];
      MIL::Attributes::BuildInfo::SetComponentVersion();
      if (SHIBYTE(v362.__r_.__value_.__r.__words[2]) < 0)
        operator delete(v362.__r_.__value_.__l.__data_);
      if (SBYTE7(v366) < 0)
        operator delete((void *)v365);
      if ((v377[23] & 0x80000000) != 0)
        operator delete(*(void **)v377);
    }
    MIL::Attributes::BuildInfo::Rewrite(v357[0], v118);
    v159 = (MIL::Attributes::BuildInfo *)v356;
    if ((_BYTE)v381 && (v380[47] & 0x80000000) != 0)
      operator delete(*(void **)&v380[24]);
    if ((v380[23] & 0x80000000) != 0)
      operator delete(*(void **)v380);
    if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__s.__r_.__value_.__l.__data_);
    v160 = v357[0];
    v357[0] = 0;
    if (v160)
    {
      MIL::Attributes::BuildInfo::~BuildInfo(v160);
      MEMORY[0x1A1AD6260]();
    }
    *(_QWORD *)&v361 = v159;
    (*(void (**)(const IRProgram *))(*(_QWORD *)v118 + 8))(v118);
    v161 = *((_QWORD *)&v361 + 1);
    MIL::Attributes::BuildInfo::Make(v159, v162);
    std::string::basic_string[abi:ne180100]<0>(v380, "mldb_token");
    v163 = std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::__count_unique<std::string>(*(_QWORD **)(v161 + 136), v380);
    if ((v380[23] & 0x80000000) != 0)
      operator delete(*(void **)v380);
    if (v163)
    {
      std::string::basic_string[abi:ne180100]<0>(v377, "mldb_token");
      v164 = std::map<std::string,std::string>::at(v161 + 128, v377);
      if (*(char *)(v164 + 23) < 0)
      {
        std::string::__init_copy_ctor_external((std::string *)v380, *(const std::string::value_type **)v164, *(_QWORD *)(v164 + 8));
      }
      else
      {
        v165 = *(_OWORD *)v164;
        *(_QWORD *)&v380[16] = *(_QWORD *)(v164 + 16);
        *(_OWORD *)v380 = v165;
      }
      MIL::Attributes::BuildInfo::SetField();
      if ((v380[23] & 0x80000000) != 0)
        operator delete(*(void **)v380);
      if ((v377[23] & 0x80000000) != 0)
        operator delete(*(void **)v377);
    }
    MIL::Attributes::BuildInfo::Rewrite((MIL::Attributes::BuildInfo *)v365, (const IRProgram *)v159);
    v166 = *(_QWORD *)v377;
    v167 = (MIL::Attributes::BuildInfo *)v365;
    *(_QWORD *)&v365 = 0;
    if (v167)
    {
      MIL::Attributes::BuildInfo::~BuildInfo(v167);
      MEMORY[0x1A1AD6260]();
    }
    *(_QWORD *)&v361 = v166;
    (*(void (**)(MIL::Attributes::BuildInfo *))(*(_QWORD *)v159 + 8))(v159);
    if ((*(unsigned int (**)(_QWORD *))(*v328[1] + 48))(v328[1]) == 1)
    {
      MEMORY[0x1A1AD5798](v380, v166);
      MIL::Passes::AddOperationIdAttributes();
      MIL::Transform::ProgramTransformer::GetProgram((MIL::Transform::ProgramTransformer *)v380);
      v168 = *(_QWORD *)v377;
      MIL::Transform::ProgramTransformer::~ProgramTransformer((MIL::Transform::ProgramTransformer *)v380);
      *(_QWORD *)&v361 = v168;
      (*(void (**)(uint64_t))(*(_QWORD *)v166 + 8))(v166);
      v166 = v168;
    }
    v169 = std::map<std::string,std::string>::at(v161 + 80, (_QWORD *)(v161 + 32));
    if (*(char *)(v169 + 311) < 0)
    {
      std::string::__init_copy_ctor_external((std::string *)v380, *(const std::string::value_type **)(v169 + 288), *(_QWORD *)(v169 + 296));
    }
    else
    {
      *(_OWORD *)v380 = *(_OWORD *)(v169 + 288);
      *(_QWORD *)&v380[16] = *(_QWORD *)(v169 + 304);
    }
    v170 = v380[23];
    v171 = v380;
    if (v380[23] < 0)
    {
      v170 = *(_QWORD *)&v380[8];
      v171 = *(_BYTE **)v380;
    }
    if (v170 == 13)
    {
      v180 = *(_QWORD *)v171;
      v181 = *(_QWORD *)(v171 + 5);
      if (v180 != 0x5F364C4D65726F43 || v181 != 0x6E696172745F364CLL)
      {
LABEL_532:
        exception = __cxa_allocate_exception(0x10uLL);
        MEMORY[0x1A1AD5E28](exception, "Program main function does not have an opset specialization with an associated backend.");
        __cxa_throw(exception, MEMORY[0x1E0DE4E80], (void (*)(void *))MEMORY[0x1E0DE4338]);
      }
      v183 = std::make_unique[abi:ne180100]<CoreML::NNCompiler::Backend::MIL::Ios16Train::Ios16TrainBackend,std::unique_ptr<MIL::IRProgram const>,std::unique_ptr<CoreML::NNCompiler::MLModelInfo const>>((uint64_t *)v377, &v361, (unint64_t *)&v361 + 1);
    }
    else
    {
      if (v170 != 7)
        goto LABEL_532;
      if (*(_DWORD *)v171 == 1701998403 && *(_DWORD *)(v171 + 3) == 894192997)
      {
        v183 = std::make_unique[abi:ne180100]<CoreML::NNCompiler::Backend::MIL::Ios15::Ios15Backend,std::unique_ptr<MIL::IRProgram const>,std::unique_ptr<CoreML::NNCompiler::MLModelInfo const>>((uint64_t *)v377, &v361, (unint64_t *)&v361 + 1);
      }
      else if (*(_DWORD *)v171 == 1701998403 && *(_DWORD *)(v171 + 3) == 910970213)
      {
        v183 = std::make_unique[abi:ne180100]<CoreML::NNCompiler::Backend::MIL::Ios16::Ios16Backend,std::unique_ptr<MIL::IRProgram const>,std::unique_ptr<CoreML::NNCompiler::MLModelInfo const>>((uint64_t *)v377, &v361, (unint64_t *)&v361 + 1);
      }
      else
      {
        if (*(_DWORD *)v171 != 1701998403 || *(_DWORD *)(v171 + 3) != 927747429)
        {
          v175 = *(_DWORD *)v171;
          v176 = *(_DWORD *)(v171 + 3);
          if (v175 != 1701998403 || v176 != 944524645)
            goto LABEL_532;
          v178 = operator new();
          *(_QWORD *)v377 = v166;
          if (v166)
          {
            v179 = (_QWORD *)operator new();
            *v179 = &off_1E3D5C368;
            v179[1] = 0;
            v179[2] = 0;
            v179[3] = v166;
          }
          else
          {
            v179 = 0;
          }
          *(_QWORD *)&v377[8] = v179;
          *(_QWORD *)&v361 = 0;
          v309 = (_QWORD *)operator new();
          v183.n128_u64[0] = v161;
          *v309 = &off_1E3D5C3A0;
          v309[1] = 0;
          v309[2] = 0;
          v309[3] = v161;
          v183.n128_u64[1] = (unint64_t)v309;
          *((_QWORD *)&v361 + 1) = 0;
          *(_QWORD *)v178 = &off_1E3D4CB60;
          *(_OWORD *)(v178 + 8) = *(_OWORD *)v377;
          *(__n128 *)(v178 + 24) = v183;
LABEL_506:
          (*(void (**)(uint64_t, _QWORD **, __n128))(*(_QWORD *)v178 + 16))(v178, v328, v183);
          +[MLCompilerResult resultWithArchive:](MLCompilerResult, "resultWithArchive:", v328);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          if ((v380[23] & 0x80000000) != 0)
            operator delete(*(void **)v380);
          (*(void (**)(uint64_t))(*(_QWORD *)v178 + 8))(v178);
          if (*((_QWORD *)&v361 + 1))
            std::default_delete<CoreML::NNCompiler::MLModelInfo const>::operator()[abi:ne180100](*((uint64_t *)&v361 + 1));
          if ((_QWORD)v361)
            (*(void (**)(_QWORD))(*(_QWORD *)v361 + 8))(v361);
          if (SHIBYTE(v354) < 0)
            operator delete(v353[0]);
          v307 = v355;
          *(_QWORD *)&v355 = 0;
          if (v307)
            (*(void (**)(uint64_t))(*(_QWORD *)v307 + 8))(v307);

          goto LABEL_517;
        }
        v183 = std::make_unique[abi:ne180100]<CoreML::NNCompiler::Backend::MIL::Ios17::Ios17Backend,std::unique_ptr<MIL::IRProgram const>,std::unique_ptr<CoreML::NNCompiler::MLModelInfo const>>((uint64_t *)v377, &v361, (unint64_t *)&v361 + 1);
      }
    }
    v178 = *(_QWORD *)v377;
    goto LABEL_506;
  }
  if (v12 != 303 && v12 != 403)
  {
LABEL_67:
    if (a7)
    {
      +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Attempted to compile a non-neural-network model as a neural network."));
      v52 = 0;
      *a7 = (id)objc_claimAutoreleasedReturnValue();
LABEL_521:
      v16 = v52;
      v19 = v16;
      goto LABEL_522;
    }
LABEL_520:
    v52 = 0;
    goto LABEL_521;
  }
LABEL_10:
  if (!v339)
  {
    v20 = v338;
    v22 = *(const CoreML::Specification::Model **)a3;
    v21 = (std::__shared_weak_count *)v337[1];
    v346 = *v337;
    v347 = v21;
    if (v21)
    {
      v23 = (unint64_t *)&v21->__shared_owners_;
      do
        v24 = __ldxr(v23);
      while (__stxr(v24 + 1, v23));
    }
    v326 = v20;
    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v349, v22);
    +[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v331 = v22;
    v328 = (_QWORD **)a5;
    v348 = 0;
    +[MLNeuralNetworkCompiler compiledVersionForSpecification:options:error:](MLNeuralNetworkCompiler, "compiledVersionForSpecification:options:error:", &v349, v25, &v348);
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    v323 = v348;

    v26 = v22;
    if (!v325)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v310 = *((_DWORD *)v22 + 6);
        *(_DWORD *)v380 = 67109378;
        *(_DWORD *)&v380[4] = v310;
        *(_WORD *)&v380[8] = 2112;
        *(_QWORD *)&v380[10] = v323;
        _os_log_error_impl(&dword_19C486000, v27, OS_LOG_TYPE_ERROR, "Compiler version info is nil for specification version: %d, error: %@", v380, 0x12u);
      }

      v26 = v22;
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Compiler version info is nil for specification version: %d, error: %@"), *((unsigned int *)v22 + 6), v323);
    }
    CoreML::NNCompiler::NeuralNetwork::NeuralNetworkSpecProxy::Make((CoreML::NNCompiler::NeuralNetwork::NeuralNetworkSpecProxy *)&v368, *((const CoreML::Specification::Model **)v26 + 4), *((_DWORD *)v26 + 11));
    if (*((_DWORD *)v26 + 11) == 403)
    {
      if (*((_QWORD *)v26 + 2))
        v28 = (uint64_t *)*((_QWORD *)v26 + 2);
      else
        v28 = &CoreML::Specification::_ModelDescription_default_instance_;
      v29 = *((_QWORD *)v26 + 4);
      v365 = 0u;
      v366 = 0u;
      v367 = 1.0;
      v30 = v28[7];
      if (v30)
        v31 = v30 + 8;
      else
        v31 = 0;
      v32 = *((int *)v28 + 12);
      if ((_DWORD)v32)
      {
        v33 = 8 * v32;
        do
        {
          v34 = *(_QWORD *)(*(_QWORD *)v31 + 16);
          v35 = *(unsigned __int8 *)(v34 + 23);
          v36 = v35;
          v37 = (const void *)v34;
          if (*(char *)(v34 + 23) < 0)
          {
            v37 = *(const void **)v34;
            v36 = *(_QWORD *)(v34 + 8);
          }
          v38 = v28[17];
          v39 = *(char *)(v38 + 23);
          if (v39 >= 0)
            v40 = *(unsigned __int8 *)(v38 + 23);
          else
            v40 = *(_QWORD *)(v38 + 8);
          if (v39 >= 0)
            v41 = (const void *)v28[17];
          else
            v41 = *(const void **)v38;
          if (v40 >= v36)
            v42 = v36;
          else
            v42 = v40;
          v43 = !memcmp(v37, v41, v42) && v40 == v36;
          if (!v43)
          {
            v44 = (const void *)v34;
            if ((v35 & 0x80) != 0)
            {
              v44 = *(const void **)v34;
              v35 = *(_QWORD *)(v34 + 8);
            }
            v45 = v28[18];
            v46 = *(char *)(v45 + 23);
            if (v46 >= 0)
              v47 = *(unsigned __int8 *)(v45 + 23);
            else
              v47 = *(_QWORD *)(v45 + 8);
            if (v46 >= 0)
              v48 = (const void *)v28[18];
            else
              v48 = *(const void **)v45;
            if (v47 >= v35)
              v49 = v35;
            else
              v49 = v47;
            if (memcmp(v44, v48, v49) || v47 != v35)
              std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)&v365, (unsigned __int8 *)v34, v34);
          }
          v31 += 8;
          v33 -= 8;
        }
        while (v33);
      }
      v51 = *(_QWORD *)(v29 + 64);
      if (*(char *)(v51 + 23) < 0)
      {
        if (*(_QWORD *)(v51 + 8))
          goto LABEL_66;
      }
      else if (*(_BYTE *)(v51 + 23))
      {
LABEL_66:
        std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)&v365, (unsigned __int8 *)v51, *(_QWORD *)(v29 + 64));
        goto LABEL_213;
      }
      memset(v380, 0, 32);
      *(_DWORD *)&v380[32] = 1065353216;
      memset(v377, 0, sizeof(v377));
      LODWORD(v378) = 1065353216;
      v127 = *(_QWORD *)(v29 + 32);
      if (v127)
        v128 = (uint64_t *)(v127 + 8);
      else
        v128 = 0;
      v129 = *(int *)(v29 + 24);
      if ((_DWORD)v129)
      {
        v130 = &v128[v129];
        do
        {
          v131 = *v128;
          v132 = *(_QWORD *)(*v128 + 32);
          if (v132)
            v133 = (unsigned __int8 **)(v132 + 8);
          else
            v133 = 0;
          v134 = *(int *)(v131 + 24);
          if ((_DWORD)v134)
          {
            v135 = 8 * v134;
            do
            {
              std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v377, *v133, (uint64_t)*v133);
              ++v133;
              v135 -= 8;
            }
            while (v135);
          }
          v136 = *(_QWORD *)(v131 + 56);
          if (v136)
            v137 = (unsigned __int8 **)(v136 + 8);
          else
            v137 = 0;
          v138 = *(int *)(v131 + 48);
          if ((_DWORD)v138)
          {
            v139 = 8 * v138;
            do
            {
              std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v380, *v137, (uint64_t)*v137);
              ++v137;
              v139 -= 8;
            }
            while (v139);
          }
          ++v128;
        }
        while (v128 != v130);
        v140 = *(unsigned __int8 **)&v380[16];
        if (*(_QWORD *)&v380[16])
        {
          do
          {
            if (!std::__hash_table<std::__hash_value_type<std::string,std::unique_ptr<MIL::Blob::StorageReader>>,std::__unordered_map_hasher<std::string,std::__hash_value_type<std::string,std::unique_ptr<MIL::Blob::StorageReader>>,std::hash<std::string>,std::equal_to<std::string>,true>,std::__unordered_map_equal<std::string,std::__hash_value_type<std::string,std::unique_ptr<MIL::Blob::StorageReader>>,std::equal_to<std::string>,std::hash<std::string>,true>,std::allocator<std::__hash_value_type<std::string,std::unique_ptr<MIL::Blob::StorageReader>>>>::find<std::string>(v377, v140 + 16))std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)&v365, v140 + 16, (uint64_t)(v140 + 16));
            v140 = *(unsigned __int8 **)v140;
          }
          while (v140);
        }
      }
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v377);
      std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v380);
    }
    else
    {
      v365 = 0u;
      v366 = 0u;
      v367 = 1.0;
      v53 = (uint64_t *)*((_QWORD *)v26 + 2);
      if (!v53)
        v53 = &CoreML::Specification::_ModelDescription_default_instance_;
      std::__hash_table<std::shared_ptr<MIL::Builder::OperationBuilder>,std::hash<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::equal_to<std::shared_ptr<MIL::Builder::OperationBuilder>>,std::allocator<std::shared_ptr<MIL::Builder::OperationBuilder>>>::__rehash<true>((uint64_t)&v365, (unint64_t)(float)(unint64_t)*((int *)v53 + 12));
      v54 = (uint64_t *)*((_QWORD *)v26 + 2);
      if (!v54)
        v54 = &CoreML::Specification::_ModelDescription_default_instance_;
      v55 = v54[7];
      if (v55)
        v56 = v55 + 8;
      else
        v56 = 0;
      v57 = *((int *)v54 + 12);
      if ((_DWORD)v57)
      {
        v58 = 8 * v57;
        do
        {
          if (!std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)&v365, *(unsigned __int8 **)(*(_QWORD *)v56 + 16), *(_QWORD *)(*(_QWORD *)v56 + 16)))
          {
            v313 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
            std::logic_error::logic_error(v313, "Model output names must not be duplicated.");
            v313->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5038] + 16);
            __cxa_throw(v313, (struct type_info *)off_1E3D427E8, MEMORY[0x1E0DE4360]);
          }
          v56 += 8;
          v58 -= 8;
        }
        while (v58);
      }
    }
LABEL_213:
    if (*((_DWORD *)v26 + 11) == 403)
    {
      v141 = *((_QWORD *)v26 + 4);
      v142 = *(_QWORD *)(v141 + 64);
      v143 = (uint64_t *)*((_QWORD *)v26 + 2);
      if (!v143)
        v143 = &CoreML::Specification::_ModelDescription_default_instance_;
      v144 = v143[17];
      v145 = v143[18];
      v146 = *(_DWORD *)(v141 + 100);
      if (v146 == 100)
      {
        v151 = *(_QWORD *)(v141 + 88);
        v152 = *(_QWORD *)(v151 + 32);
        if (v152)
          v153 = (__int128 **)(v152 + 8);
        else
          v153 = 0;
        v154 = *(int *)(v151 + 24);
        memset(v377, 0, 24);
        __s.__r_.__value_.__r.__words[0] = (std::string::size_type)v377;
        __s.__r_.__value_.__s.__data_[8] = 0;
        if ((_DWORD)v154)
        {
          std::vector<std::string>::__vallocate[abi:ne180100](v377, v154);
          v372.__r_.__value_.__r.__words[0] = *(_QWORD *)&v377[8];
          *(_QWORD *)&__p = *(_QWORD *)&v377[8];
          *(_QWORD *)v380 = &v377[16];
          *(_QWORD *)&v380[8] = &__p;
          *(_QWORD *)&v380[16] = &v372;
          v380[24] = 0;
          v155 = 8 * v154;
          v156 = *(std::string **)&v377[8];
          do
          {
            v157 = *v153;
            if (*((char *)*v153 + 23) < 0)
            {
              std::string::__init_copy_ctor_external(v156, *(const std::string::value_type **)v157, *((_QWORD *)v157 + 1));
              v156 = (std::string *)v372.__r_.__value_.__r.__words[0];
            }
            else
            {
              v158 = *v157;
              v156->__r_.__value_.__r.__words[2] = *((_QWORD *)v157 + 2);
              *(_OWORD *)&v156->__r_.__value_.__l.__data_ = v158;
            }
            ++v153;
            v372.__r_.__value_.__r.__words[0] = (std::string::size_type)++v156;
            v155 -= 8;
          }
          while (v155);
          v380[24] = 1;
          std::__exception_guard_exceptions<std::_AllocatorDestroyRangeReverse<std::allocator<std::string>,std::string*>>::~__exception_guard_exceptions[abi:ne180100]((uint64_t)v380);
          *(_QWORD *)&v377[8] = v156;
        }
        std::make_unique[abi:ne180100]<CoreML::NNCompiler::MLClassifierInfo,std::string const&,std::string const&,std::string const&,std::vector<std::string>>((uint64_t *)&v364, v142, v144, v145, (__n128 *)v377);
        *(_QWORD *)v380 = v377;
        std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v380);
      }
      else
      {
        if (v146 != 101)
        {
          v320 = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
          std::logic_error::logic_error(v320, "Unknown class label type.");
          __cxa_throw(v320, MEMORY[0x1E0DE4E70], MEMORY[0x1E0DE42A0]);
        }
        v147 = *(_QWORD *)(v141 + 88);
        v148 = *(_QWORD *)(v147 + 24);
        if (v148)
          v149 = (const void *)(v148 + 8);
        else
          v149 = 0;
        if (v148)
          v150 = v148 + 8 + 8 * *(int *)(v147 + 16);
        else
          v150 = 0;
        memset(v380, 0, 24);
        std::vector<long long>::__init_with_size[abi:ne180100]<long long const*,long long const*>(v380, v149, v150, (v150 - (uint64_t)v149) >> 3);
        std::make_unique[abi:ne180100]<CoreML::NNCompiler::MLClassifierInfo,std::string const&,std::string const&,std::string const&,std::vector<long long>>((uint64_t *)&v364, v142, v144, v145, (uint64_t)v380);
        if (*(_QWORD *)v380)
          operator delete(*(void **)v380);
      }
    }
    else
    {
      v364 = 0;
    }
    v321 = v368;
    memset(v380, 0, 32);
    *(_DWORD *)&v380[32] = 1065353216;
    v185 = operator new();
    *(_QWORD *)(v185 + 8) = 0;
    *(_QWORD *)(v185 + 16) = 0;
    *(_QWORD *)v185 = v185 + 8;
    *(_QWORD *)(v185 + 32) = 0;
    *(_QWORD *)(v185 + 24) = v185 + 32;
    *(_QWORD *)(v185 + 40) = 0;
    *(_QWORD *)(v185 + 56) = 0;
    *(_QWORD *)(v185 + 48) = v185 + 56;
    *(_QWORD *)(v185 + 80) = 0;
    *(_QWORD *)(v185 + 64) = 0;
    *(_QWORD *)(v185 + 72) = v185 + 80;
    *(_QWORD *)(v185 + 88) = 0;
    *(_QWORD *)(v185 + 104) = 0;
    *(_QWORD *)(v185 + 96) = v185 + 104;
    *(_QWORD *)(v185 + 112) = 0;
    *(_QWORD *)(v185 + 128) = 0;
    *(_QWORD *)(v185 + 120) = v185 + 128;
    *(_QWORD *)(v185 + 152) = 0;
    *(_QWORD *)(v185 + 144) = v185 + 152;
    *(_QWORD *)(v185 + 136) = 0;
    *(_QWORD *)(v185 + 160) = 0;
    *(_QWORD *)(v185 + 176) = 0;
    *(_QWORD *)(v185 + 168) = v185 + 176;
    *(_QWORD *)(v185 + 184) = 0;
    v363 = (CoreML::NNCompiler::NeuralNetwork::ImagePreprocessingParameters *)v185;
    v186 = (uint64_t *)*((_QWORD *)v26 + 2);
    if (!v186)
      v186 = &CoreML::Specification::_ModelDescription_default_instance_;
    v187 = v186[4];
    if (v187)
      v188 = v187 + 8;
    else
      v188 = 0;
    v189 = *((int *)v186 + 6);
    if ((_DWORD)v189)
    {
      for (j = 8 * v189; j; j -= 8)
      {
        v191 = *(_QWORD *)v188;
        v192 = *(uint64_t **)(*(_QWORD *)v188 + 32);
        if (!v192)
          v192 = &CoreML::Specification::_FeatureType_default_instance_;
        if (*((_DWORD *)v192 + 9) != 4)
          goto LABEL_357;
        v193 = *(_QWORD *)(v191 + 16);
        v194 = (CoreML::Specification::protobuf_FeatureTypes_2eproto *)std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::__emplace_unique_key_args<std::string,std::string const&>((uint64_t)v380, (unsigned __int8 *)v193, v193);
        v195 = *(uint64_t **)(v191 + 32);
        if (!v195)
          v195 = &CoreML::Specification::_FeatureType_default_instance_;
        if (*((_DWORD *)v195 + 9) == 4)
        {
          v196 = (uint64_t *)v195[3];
        }
        else
        {
          CoreML::Specification::protobuf_FeatureTypes_2eproto::InitDefaults(v194);
          v196 = &CoreML::Specification::_ImageFeatureType_default_instance_;
        }
        v197 = *((_DWORD *)v196 + 8);
        v198 = 0.0;
        if (v197 <= 29)
        {
          if (v197 != 10)
          {
            if (v197 == 0x80000000 || (v199 = 0.0, !v197))
            {
LABEL_531:
              v317 = (CoreML::MLModelException *)__cxa_allocate_exception(0x28uLL);
              +[MLModelErrorUtils errorWithCode:format:](MLModelErrorUtils, "errorWithCode:format:", 1, CFSTR("Input image has invalid colorspace."));
              v318 = (NSError *)objc_claimAutoreleasedReturnValue();
              CoreML::MLModelException::MLModelException(v317, v318);
            }
            goto LABEL_352;
          }
        }
        else
        {
          if (v197 == 30)
          {
            v199 = 1.0;
            goto LABEL_352;
          }
          if (v197 != 40)
          {
            v199 = 0.0;
            if (v197 == 0x7FFFFFFF)
              goto LABEL_531;
            goto LABEL_352;
          }
        }
        v198 = 1.0;
        v199 = 0.0;
LABEL_352:
        v200 = (uint64_t **)std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::__find_equal<std::string>(v185, v377, (_QWORD *)v193);
        if (*v200)
        {
          if (*(char *)(v193 + 23) >= 0)
            v314 = (const std::string::value_type *)v193;
          else
            v314 = *(const std::string::value_type **)v193;
          +[MLModelErrorUtils genericErrorWithFormat:](MLModelErrorUtils, "genericErrorWithFormat:", CFSTR("Duplicate image preprocessing directive for feature '%s'."), v314);
          v315 = (NSError *)objc_claimAutoreleasedReturnValue();
          v316 = (CoreML::MLModelException *)__cxa_allocate_exception(0x28uLL);
          CoreML::MLModelException::MLModelException(v316, v315);
        }
        v201 = v200;
        v202 = (char *)operator new(0x40uLL);
        v203 = (std::string *)(v202 + 32);
        if (*(char *)(v193 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(v203, *(const std::string::value_type **)v193, *(_QWORD *)(v193 + 8));
        }
        else
        {
          v204 = *(_OWORD *)v193;
          *((_QWORD *)v202 + 6) = *(_QWORD *)(v193 + 16);
          *(_OWORD *)&v203->__r_.__value_.__l.__data_ = v204;
        }
        *((_DWORD *)v202 + 14) = 1065353216;
        std::__tree<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::__map_value_compare<std::string,std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>,std::less<void>,true>,std::allocator<std::__value_type<std::string,nlohmann::basic_json<std::map,std::vector,std::string,BOOL,long long,unsigned long long,double,std::allocator,nlohmann::adl_serializer,std::vector<unsigned char>>>>>::__insert_node_at((uint64_t **)v185, *(uint64_t *)v377, v201, (uint64_t *)v202);
        *(_QWORD *)v377 = v193;
        *((float *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(v185 + 24), (_QWORD *)v193, (__int128 **)v377)+ 14) = v199;
        *(_QWORD *)v377 = v193;
        *((float *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(v185 + 48), (_QWORD *)v193, (__int128 **)v377)+ 14) = v198;
        *(_QWORD *)v377 = v193;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(v185 + 168), (_QWORD *)v193, (__int128 **)v377)+ 14) = 1065353216;
        *(_QWORD *)v377 = v193;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(v185 + 72), (_QWORD *)v193, (__int128 **)v377)+ 14) = 0;
        *(_QWORD *)v377 = v193;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(v185 + 96), (_QWORD *)v193, (__int128 **)v377)+ 14) = 0;
        *(_QWORD *)v377 = v193;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(v185 + 120), (_QWORD *)v193, (__int128 **)v377)+ 14) = 0;
        *(_QWORD *)v377 = v193;
        *((_DWORD *)std::__tree<std::__value_type<std::string,float>,std::__map_value_compare<std::string,std::__value_type<std::string,float>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,float>>>::__emplace_unique_key_args<std::string,std::piecewise_construct_t const&,std::tuple<std::string const&>,std::tuple<>>((uint64_t **)(v185 + 144), (_QWORD *)v193, (__int128 **)v377)+ 14) = 0;
LABEL_357:
        v188 += 8;
      }
    }
    if (*(_QWORD *)&v380[24])
    {
      (*(void (**)(_BYTE *__return_ptr))(*(_QWORD *)v321 + 48))(v377);
      if (*(_QWORD *)&v377[16])
        v205 = *(_QWORD *)&v377[16] + 8;
      else
        v205 = 0;
      if (*(_DWORD *)&v377[8])
      {
        v206 = v205 + 8 * *(int *)&v377[8];
        while (1)
        {
          v207 = *(_QWORD *)v205;
          if (*(_DWORD *)(*(_QWORD *)v205 + 36) == 10)
            break;
LABEL_377:
          v205 += 8;
          if (v205 == v206)
            goto LABEL_380;
        }
        v208 = *(__int128 **)(v207 + 16);
        if (*((char *)v208 + 23) < 0)
        {
          std::string::__init_copy_ctor_external(&__s, *(const std::string::value_type **)v208, *((_QWORD *)v208 + 1));
          if (*(_DWORD *)(v207 + 36) != 10)
          {
            CoreML::Specification::protobuf_NeuralNetwork_2eproto::InitDefaults(v210);
            v211 = &CoreML::Specification::_NeuralNetworkImageScaler_default_instance_;
            goto LABEL_369;
          }
        }
        else
        {
          v209 = *v208;
          __s.__r_.__value_.__r.__words[2] = *((_QWORD *)v208 + 2);
          *(_OWORD *)&__s.__r_.__value_.__l.__data_ = v209;
        }
        v211 = *(uint64_t **)(v207 + 24);
LABEL_369:
        v212 = *((float *)v211 + 6);
        v213 = *((float *)v211 + 7);
        v214 = *((float *)v211 + 8);
        v215 = *((float *)v211 + 4);
        v216 = *((float *)v211 + 5);
        size = HIBYTE(__s.__r_.__value_.__r.__words[2]);
        if ((__s.__r_.__value_.__r.__words[2] & 0x8000000000000000) != 0)
          size = __s.__r_.__value_.__l.__size_;
        if (size)
        {
          CoreML::NNCompiler::NeuralNetwork::ImagePreprocessingParameters::SetScaleBiasParams(v185, (__int128 *)&__s, v216, v212, v213, v214, v215);
        }
        else
        {
          v218 = *(__int128 **)&v380[16];
          if (*(_QWORD *)&v380[16])
          {
            do
            {
              CoreML::NNCompiler::NeuralNetwork::ImagePreprocessingParameters::SetScaleBiasParams(v185, v218 + 1, v216, v212, v213, v214, v215);
              v218 = *(__int128 **)v218;
            }
            while (v218);
          }
        }
        if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
          operator delete(__s.__r_.__value_.__l.__data_);
        goto LABEL_377;
      }
LABEL_380:
      google::protobuf::internal::RepeatedPtrFieldBase::Destroy<google::protobuf::RepeatedPtrField<CoreML::Specification::NeuralNetworkPreprocessing>::TypeHandler>(v377);
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)v380);
    v219 = (uint64_t *)*((_QWORD *)v331 + 2);
    if (!v219)
      v219 = &CoreML::Specification::_ModelDescription_default_instance_;
    CoreML::NNCompiler::Frontend::ParseOptionalInputDefaults((uint64_t **)&v362, (const CoreML::Specification::ModelDescription *)*((unsigned int *)v219 + 6), v219[4]);
    v220 = v368;
    v221 = operator new(4uLL);
    *v221 = 430;
    *(_QWORD *)&v380[16] = v221 + 1;
    *(_QWORD *)v380 = v221;
    *(_QWORD *)&v380[8] = v221 + 1;
    HasLayerOfType = CoreML::NNCompiler::NeuralNetwork::NeuralNetworkSpecProxy::HasLayerOfType(v220, v380);
    operator delete(v221);
    v223 = operator new(0x14uLL);
    *(_QWORD *)&v380[16] = v223 + 5;
    v223[4] = 625;
    *(_OWORD *)v223 = xmmword_19CB30560;
    *(_QWORD *)v380 = v223;
    *(_QWORD *)&v380[8] = v223 + 5;
    v224 = CoreML::NNCompiler::NeuralNetwork::NeuralNetworkSpecProxy::HasLayerOfType(v220, v380);
    operator delete(v223);
    v225 = operator new(4uLL);
    *v225 = 500;
    *(_QWORD *)&v380[16] = v225 + 1;
    *(_QWORD *)v380 = v225;
    *(_QWORD *)&v380[8] = v225 + 1;
    v226 = CoreML::NNCompiler::NeuralNetwork::NeuralNetworkSpecProxy::HasLayerOfType(v220, v380);
    operator delete(v225);
    v227 = operator new(0x34uLL);
    *(_QWORD *)&v380[16] = v227 + 13;
    v227[12] = 1313;
    *(_OWORD *)v227 = xmmword_19CB30574;
    *((_OWORD *)v227 + 1) = unk_19CB30584;
    *((_OWORD *)v227 + 2) = xmmword_19CB30594;
    *(_QWORD *)v380 = v227;
    *(_QWORD *)&v380[8] = v227 + 13;
    v228 = CoreML::NNCompiler::NeuralNetwork::NeuralNetworkSpecProxy::HasLayerOfType(v220, v380);
    operator delete(v227);
    v229 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v220 + 32))(v220);
    v230 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v220 + 24))(v220);
    v231 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v220 + 32))(v220);
    v232 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)v220 + 40))(v220);
    v233 = *(_QWORD *)(v232 + 16);
    if (v233)
      v234 = (uint64_t *)(v233 + 8);
    else
      v234 = 0;
    v235 = *(int *)(v232 + 8);
    v345 = v224;
    v342 = v226;
    v336 = v228;
    if ((_DWORD)v235)
    {
      v236 = 8 * v235 - 8;
      do
      {
        isIOS12NeuralNetworkLayer = CoreML::isIOS12NeuralNetworkLayer(*v234++);
        if (v236)
          v238 = isIOS12NeuralNetworkLayer;
        else
          v238 = 0;
        v236 -= 8;
      }
      while ((v238 & 1) != 0);
      LODWORD(v235) = isIOS12NeuralNetworkLayer ^ 1;
    }
    if (v230)
      LODWORD(v235) = 1;
    if (v231)
      v239 = 1;
    else
      v239 = v235;
    v361 = 0uLL;
    if (*((_QWORD *)v331 + 2))
      v240 = (uint64_t *)*((_QWORD *)v331 + 2);
    else
      v240 = &CoreML::Specification::_ModelDescription_default_instance_;
    if (*((_DWORD *)v240 + 24))
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v241 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v241, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v377 = 0;
        _os_log_error_impl(&dword_19C486000, v241, OS_LOG_TYPE_ERROR, "MLNeuralNetworkUtilities::getEspressoConfigurationsFromSpec shall not be used for multi-function models.", v377, 2u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("MLNeuralNetworkUtilities::getEspressoConfigurationsFromSpec shall not be used for multi-function models."));
    }
    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>((CoreML::Specification::Model **)v351, v331);
    +[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    v371 = 0;
    +[MLNeuralNetworkCompiler compiledVersionForSpecification:options:error:](MLNeuralNetworkCompiler, "compiledVersionForSpecification:options:error:", v351, v242, &v371);
    v243 = (void *)objc_claimAutoreleasedReturnValue();
    v244 = v371;

    if (!v243)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v245 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR))
      {
        v311 = *((_DWORD *)v331 + 6);
        *(_DWORD *)v377 = 67109378;
        *(_DWORD *)&v377[4] = v311;
        *(_WORD *)&v377[8] = 2112;
        *(_QWORD *)&v377[10] = v244;
        _os_log_error_impl(&dword_19C486000, v245, OS_LOG_TYPE_ERROR, "Compiler version info is nil for specification version: %d, error: %@", v377, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Compiler version info is nil for specification version: %d, error: %@"), *((unsigned int *)v331 + 6), v244);
    }
    CoreML::MLNeuralNetworkUtilities::getInputShapeInfosFromSpec((uint64_t **)v377, (const CoreML::Specification::ModelDescription *)*((unsigned int *)v240 + 6), v240[4]);
    CoreML::MLNeuralNetworkUtilities::getStateShapeInfosFromSpec((uint64_t **)&__s, (const CoreML::Specification::ModelDescription *)*((unsigned int *)v240 + 18), v240[10]);
    v246 = (uint64_t *)*((_QWORD *)v331 + 2);
    if (!v246)
      v246 = &CoreML::Specification::_ModelDescription_default_instance_;
    CoreML::MLNeuralNetworkUtilities::getOutputNamesFromSpec((CoreML::MLNeuralNetworkUtilities *)&v372, (const CoreML::Specification::ModelDescription *)*((unsigned int *)v246 + 12), v246[7]);
    CoreML::MLNeuralNetworkUtilities::getEspressoConfigurationsFromShapeInfos((uint64_t)v380, v377, &__s, (uint64_t)&v372, v239, v229 == 0, v243);
    *(_QWORD *)&__p = &v372;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)&__p);
    std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::destroy((_QWORD *)__s.__r_.__value_.__l.__size_);
    std::__tree<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::__map_value_compare<std::string,std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,CoreML::NNCompiler::MLShapeInfo>>>::destroy(*(_QWORD **)&v377[8]);

    v247 = (std::__shared_weak_count *)v351[1];
    if (v351[1])
    {
      v248 = (unint64_t *)((char *)v351[1] + 8);
      do
        v249 = __ldaxr(v248);
      while (__stlxr(v249 - 1, v248));
      if (!v249)
      {
        ((void (*)(std::__shared_weak_count *))v247->__on_zero_shared)(v247);
        std::__shared_weak_count::__release_weak(v247);
      }
    }
    v250 = (_QWORD *)operator new();
    v251 = v250;
    v252 = *(_QWORD *)&v380[8];
    *v250 = *(_QWORD *)v380;
    v250[1] = v252;
    v253 = v250 + 1;
    v254 = *(_QWORD *)&v380[16];
    v250[2] = *(_QWORD *)&v380[16];
    if (v254)
    {
      *(_QWORD *)(v252 + 16) = v253;
      *(_QWORD *)v380 = &v380[8];
      *(_OWORD *)&v380[8] = 0uLL;
    }
    else
    {
      *v250 = v253;
    }
    v353[0] = v250;
    v255 = (_QWORD *)operator new();
    *v255 = &off_1E3D5C720;
    v255[1] = 0;
    v255[2] = 0;
    v255[3] = v251;
    v353[0] = 0;
    v256 = (std::__shared_weak_count *)*((_QWORD *)&v361 + 1);
    *(_QWORD *)&v361 = v251;
    *((_QWORD *)&v361 + 1) = v255;
    if (v256)
    {
      v257 = (unint64_t *)&v256->__shared_owners_;
      do
        v258 = __ldaxr(v257);
      while (__stlxr(v258 - 1, v257));
      if (!v258)
      {
        ((void (*)(std::__shared_weak_count *))v256->__on_zero_shared)(v256);
        std::__shared_weak_count::__release_weak(v256);
      }
    }
    std::unique_ptr<std::map<std::string,Espresso::net_configuration>>::reset[abi:ne180100]((uint64_t *)v353);
    std::__tree<std::__value_type<std::string,Espresso::net_configuration>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::net_configuration>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::net_configuration>>>::destroy(*(_QWORD **)&v380[8]);
    std::allocate_shared[abi:ne180100]<CoreML::Specification::Model,std::allocator<CoreML::Specification::Model>,CoreML::Specification::Model const&,void>(&v359, v331);
    +[MLCompilerOptions defaultOptions](MLCompilerOptions, "defaultOptions");
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    v358 = 0;
    +[MLNeuralNetworkCompiler compiledVersionForSpecification:options:error:](MLNeuralNetworkCompiler, "compiledVersionForSpecification:options:error:", &v359, v259, &v358);
    v260 = (void *)objc_claimAutoreleasedReturnValue();
    v261 = v358;

    if (!v260)
    {
      +[MLLogging coreChannel](MLLogging, "coreChannel");
      v262 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v262, OS_LOG_TYPE_ERROR))
      {
        v312 = *((_DWORD *)v331 + 6);
        *(_DWORD *)v380 = 67109378;
        *(_DWORD *)&v380[4] = v312;
        *(_WORD *)&v380[8] = 2112;
        *(_QWORD *)&v380[10] = v261;
        _os_log_error_impl(&dword_19C486000, v262, OS_LOG_TYPE_ERROR, "Compiler version info is nil for specification version: %d, error: %@", v380, 0x12u);
      }

      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Compiler version info is nil for specification version: %d, error: %@"), *((unsigned int *)v331 + 6), v261);
    }
    v370 = 0;
    __p = 0uLL;
    v263 = 0;
    if ((_QWORD)v366)
    {
      v264 = (_QWORD *)v366;
      do
      {
        ++v263;
        v264 = (_QWORD *)*v264;
      }
      while (v264);
    }
    std::vector<std::string>::__init_with_size[abi:ne180100]<std::__hash_const_iterator<std::__hash_node<std::string,void *> *>,std::__hash_const_iterator<std::__hash_node<std::string,void *> *>>(&__p, (uint64_t *)v366, v263);
    v265 = v364;
    v357[0] = v364;
    if (v364)
    {
      v266 = (MIL::Attributes::BuildInfo *)operator new();
      *(_QWORD *)v266 = &off_1E3D5C598;
      *((_QWORD *)v266 + 1) = 0;
      *((_QWORD *)v266 + 2) = 0;
      *((_QWORD *)v266 + 3) = v265;
    }
    else
    {
      v266 = 0;
    }
    v357[1] = v266;
    v364 = 0;
    v267 = v363;
    *(_QWORD *)&v356 = v363;
    if (v363)
    {
      v268 = (_QWORD *)operator new();
      *v268 = &off_1E3D5C560;
      v268[1] = 0;
      v268[2] = 0;
      v268[3] = v267;
    }
    else
    {
      v268 = 0;
    }
    *((_QWORD *)&v356 + 1) = v268;
    v363 = 0;
    v355 = v361;
    if (*((_QWORD *)&v361 + 1))
    {
      v269 = (unint64_t *)(*((_QWORD *)&v361 + 1) + 8);
      do
        v270 = __ldxr(v269);
      while (__stxr(v270 + 1, v269));
    }
    memset(v380, 0, 24);
    *(_QWORD *)&v380[40] = 0;
    *(_QWORD *)&v380[32] = 0;
    *(_QWORD *)&v380[24] = &v380[32];
    v382[0] = 0;
    v381 = v382;
    v383[1] = 0;
    v383[0] = 0;
    v382[1] = 0;
    v382[2] = v383;
    v384[0] = 0;
    v383[2] = v384;
    v385[0] = 0;
    v385[1] = 0;
    v384[1] = 0;
    v384[2] = v385;
    v386[1] = 0;
    v386[0] = 0;
    v385[2] = v386;
    v387 = v355;
    v271 = (_QWORD *)v355;
    v355 = 0uLL;
    v389 = __p;
    v272 = v370;
    v370 = 0;
    __p = 0uLL;
    v391 = v356;
    v356 = 0uLL;
    v390 = v272;
    v392 = v362;
    if (v362.__r_.__value_.__r.__words[2])
    {
      *(_QWORD *)(v362.__r_.__value_.__l.__size_ + 16) = &v392.__r_.__value_.__l.__size_;
      v362.__r_.__value_.__r.__words[0] = (std::string::size_type)&v362.__r_.__value_.__l.__size_;
      *(_OWORD *)&v362.__r_.__value_.__r.__words[1] = 0uLL;
    }
    else
    {
      v392.__r_.__value_.__r.__words[0] = (std::string::size_type)&v392.__r_.__value_.__l.__size_;
    }
    v273 = *(__n128 *)v357;
    v393 = *(_OWORD *)v357;
    v357[0] = 0;
    v357[1] = 0;
    v396 = 0;
    v394 = 0;
    v395 = 0;
    v397 = v239;
    v398 = HasLayerOfType;
    v399 = v345;
    v400 = v342;
    v401 = v336;
    v402 = v229 == 0;
    v274 = (std::__shared_weak_count *)*((_QWORD *)&v355 + 1);
    if (*((_QWORD *)&v355 + 1))
    {
      v275 = (unint64_t *)(*((_QWORD *)&v355 + 1) + 8);
      do
        v276 = __ldaxr(v275);
      while (__stlxr(v276 - 1, v275));
      if (!v276)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v274->__on_zero_shared)(v274, v273);
        std::__shared_weak_count::__release_weak(v274);
      }
    }
    v277 = (std::__shared_weak_count *)*((_QWORD *)&v356 + 1);
    if (*((_QWORD *)&v356 + 1))
    {
      v278 = (unint64_t *)(*((_QWORD *)&v356 + 1) + 8);
      do
        v279 = __ldaxr(v278);
      while (__stlxr(v279 - 1, v278));
      if (!v279)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v277->__on_zero_shared)(v277, v273);
        std::__shared_weak_count::__release_weak(v277);
      }
    }
    v280 = (std::__shared_weak_count *)v357[1];
    if (v357[1])
    {
      v281 = (unint64_t *)((char *)v357[1] + 8);
      do
        v282 = __ldaxr(v281);
      while (__stlxr(v282 - 1, v281));
      if (!v282)
      {
        ((void (*)(std::__shared_weak_count *, __n128))v280->__on_zero_shared)(v280, v273);
        std::__shared_weak_count::__release_weak(v280);
      }
    }
    v353[0] = &__p;
    std::vector<std::string>::__destroy_vector::operator()[abi:ne180100]((void ***)v353);
    v283 = (uint64_t *)*((_QWORD *)v331 + 2);
    if (!v283)
      v283 = &CoreML::Specification::_ModelDescription_default_instance_;
    CoreML::NNCompiler::Frontend::ParseModelOSSizeTrackingInfo((CoreML::NNCompiler::Frontend *)v353, (const CoreML::Specification::ModelDescription *)v283[20]);
    v284 = *((_DWORD *)v331 + 11);
    v285 = *((_DWORD *)v331 + 6);
    v286 = operator new();
    std::string::basic_string[abi:ne180100]<0>(&__p, (char *)&unk_19CB39696);
    CoreML::NNCompiler::MLModelInfo::MLModelInfo(v286, v284, &__p, (uint64_t)v380, v260, v285, v353);
    if (SHIBYTE(v370) < 0)
      operator delete((void *)__p);
    std::__tree<std::__value_type<std::string,std::string>,std::__map_value_compare<std::string,std::__value_type<std::string,std::string>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,std::string>>>::destroy((_QWORD *)v353[1]);
    CoreML::NNCompiler::MLFunctionInfo::~MLFunctionInfo((CoreML::NNCompiler::MLFunctionInfo *)v380);

    v287 = v360;
    if (v360)
    {
      v288 = (unint64_t *)&v360->__shared_owners_;
      do
        v289 = __ldaxr(v288);
      while (__stlxr(v289 - 1, v288));
      if (!v289)
      {
        ((void (*)(std::__shared_weak_count *))v287->__on_zero_shared)(v287);
        std::__shared_weak_count::__release_weak(v287);
      }
    }
    v290 = (std::__shared_weak_count *)*((_QWORD *)&v361 + 1);
    if (*((_QWORD *)&v361 + 1))
    {
      v291 = (unint64_t *)(*((_QWORD *)&v361 + 1) + 8);
      do
        v292 = __ldaxr(v291);
      while (__stlxr(v292 - 1, v291));
      if (!v292)
      {
        ((void (*)(std::__shared_weak_count *))v290->__on_zero_shared)(v290);
        std::__shared_weak_count::__release_weak(v290);
      }
    }
    std::__tree<std::__value_type<std::string,Espresso::vimage2espresso_param>,std::__map_value_compare<std::string,std::__value_type<std::string,Espresso::vimage2espresso_param>,std::less<std::string>,true>,std::allocator<std::__value_type<std::string,Espresso::vimage2espresso_param>>>::destroy((char *)v362.__r_.__value_.__l.__size_);
    if (v363)
    {
      CoreML::NNCompiler::NeuralNetwork::ImagePreprocessingParameters::~ImagePreprocessingParameters((char **)v363);
      MEMORY[0x1A1AD6260]();
    }
    if (v364)
    {
      CoreML::NNCompiler::MLClassifierInfo::~MLClassifierInfo(v364);
      MEMORY[0x1A1AD6260]();
    }
    std::__hash_table<std::string,std::hash<std::string>,std::equal_to<std::string>,std::allocator<std::string>>::~__hash_table((uint64_t)&v365);
    if (v368)
      (*(void (**)(uint64_t))(*(_QWORD *)v368 + 8))(v368);
    if (*(_BYTE *)(v346 + 28))
    {
      if (objc_msgSend(v326, "trainWithMLCompute"))
      {
        v293 = (_QWORD *)operator new();
        *(_QWORD *)v380 = v286;
        v294 = (_QWORD *)operator new();
        *v294 = &off_1E3D5C3A0;
        v294[1] = 0;
        v294[2] = 0;
        v294[3] = v286;
        *(_QWORD *)&v380[8] = v294;
        CoreML::NNCompiler::Backend::NeuralNetwork::NeuralNetworkEspressoNetBackend::NeuralNetworkEspressoNetBackend(v293, v346, (uint64_t)v347, v380);
        *v293 = &off_1E3D4C9B0;
        v295 = *(std::__shared_weak_count **)&v380[8];
        if (*(_QWORD *)&v380[8])
        {
          v296 = (unint64_t *)(*(_QWORD *)&v380[8] + 8);
          do
            v297 = __ldaxr(v296);
          while (__stlxr(v297 - 1, v296));
          goto LABEL_491;
        }
LABEL_493:

        v302 = v350;
        if (v350)
        {
          v303 = (unint64_t *)&v350->__shared_owners_;
          do
            v304 = __ldaxr(v303);
          while (__stlxr(v304 - 1, v303));
          if (!v304)
          {
            ((void (*)(std::__shared_weak_count *))v302->__on_zero_shared)(v302);
            std::__shared_weak_count::__release_weak(v302);
          }
        }

        (*(void (**)(_QWORD *, _QWORD **))(*v293 + 16))(v293, v328);
        (*(void (**)(_QWORD *))(*v293 + 8))(v293);
        if (v347)
        {
          v305 = (unint64_t *)&v347->__shared_owners_;
          do
            v306 = __ldaxr(v305);
          while (__stlxr(v306 - 1, v305));
          if (!v306)
          {
            ((void (*)(std::__shared_weak_count *))v347->__on_zero_shared)(v347);
            std::__shared_weak_count::__release_weak(v347);
          }
        }
        +[MLCompilerResult resultWithArchive:](MLCompilerResult, "resultWithArchive:", v328);
        v52 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_517:
        if (!v52 || (objc_msgSend(a1, "collectNNModelDetailsFromArchive:spec:error:", v328, v337, v329) & 1) != 0)
          goto LABEL_521;

        goto LABEL_520;
      }
      v293 = (_QWORD *)operator new();
      *(_QWORD *)v380 = v286;
      v300 = (_QWORD *)operator new();
      *v300 = &off_1E3D5C3A0;
      v300[1] = 0;
      v300[2] = 0;
      v300[3] = v286;
      *(_QWORD *)&v380[8] = v300;
      CoreML::NNCompiler::Backend::NeuralNetwork::NeuralNetworkEspressoNetBackend::NeuralNetworkEspressoNetBackend(v293, v346, (uint64_t)v347, v380);
      *v293 = &off_1E3D4C9E8;
      v295 = *(std::__shared_weak_count **)&v380[8];
      if (!*(_QWORD *)&v380[8])
        goto LABEL_493;
      v301 = (unint64_t *)(*(_QWORD *)&v380[8] + 8);
      do
        v297 = __ldaxr(v301);
      while (__stlxr(v297 - 1, v301));
    }
    else
    {
      v293 = (_QWORD *)operator new();
      *(_QWORD *)v380 = v286;
      v298 = (_QWORD *)operator new();
      *v298 = &off_1E3D5C3A0;
      v298[1] = 0;
      v298[2] = 0;
      v298[3] = v286;
      *(_QWORD *)&v380[8] = v298;
      CoreML::NNCompiler::Backend::NeuralNetwork::NeuralNetworkEspressoNetBackend::NeuralNetworkEspressoNetBackend(v293, v346, (uint64_t)v347, v380);
      v295 = *(std::__shared_weak_count **)&v380[8];
      if (!*(_QWORD *)&v380[8])
        goto LABEL_493;
      v299 = (unint64_t *)(*(_QWORD *)&v380[8] + 8);
      do
        v297 = __ldaxr(v299);
      while (__stlxr(v297 - 1, v299));
    }
LABEL_491:
    if (!v297)
    {
      ((void (*)(std::__shared_weak_count *))v295->__on_zero_shared)(v295);
      std::__shared_weak_count::__release_weak(v295);
    }
    goto LABEL_493;
  }
  +[MLLogging coreChannel](MLLogging, "coreChannel");
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MLModelType_Name(v12));
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v380 = 138412290;
    *(_QWORD *)&v380[4] = v184;
    _os_log_error_impl(&dword_19C486000, v13, OS_LOG_TYPE_ERROR, "The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification.", v380, 0xCu);

  }
  if (v329)
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v373 = *MEMORY[0x1E0CB2D50];
    v15 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", MLModelType_Name(v12));
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringWithFormat:", CFSTR("The 'BlobMapping' parameter is not empty. However, the model type %@ doesn't support 'BlobFileValue' syntax in the specification."), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v374 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v374, &v373, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.CoreML"), 0, v18);
    *v329 = (id)objc_claimAutoreleasedReturnValue();

    v19 = 0;
LABEL_522:

    goto LABEL_523;
  }
LABEL_15:
  v19 = 0;
LABEL_523:

  return v19;
}

+ (id)compileSpecification:(void *)a3 blobMapping:(id)a4 toArchive:(void *)a5 options:(id)a6 error:(id *)a7
{
  objc_msgSend(a1, "_compileSpecification:blobMapping:toArchive:options:error:", a3, a4, a5, a6, a7);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compileSpecification:(void *)a3 toArchive:(void *)a4 options:(id)a5 error:(id *)a6
{
  objc_msgSend(a1, "_compileSpecification:blobMapping:toArchive:options:error:", a3, 0, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)compiledVersionForSpecification:(void *)a3 options:(id)a4 error:(id *)a5
{
  id v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  CoreML *v12;
  unsigned int v13;
  _BOOL4 hasWeightOfType;
  void *v15;

  v6 = a4;
  v7 = *(_QWORD *)a3;
  v8 = *(_DWORD *)(*(_QWORD *)a3 + 24);
  if (v8 <= 8)
  {
    if (v8 == 8)
    {
      v9 = 0;
      v10 = 0;
      v11 = 8;
    }
    else if (v8 <= 5)
    {
      if (v8 == 5)
      {
        v9 = 0;
        v10 = 0;
        v11 = 4;
      }
      else if (v8 <= 3)
      {
        if (v8 == 3)
        {
          v10 = 0;
          v9 = 1;
          v11 = 2;
        }
        else
        {
          v12 = *(CoreML **)(v7 + 32);
          v13 = *(_DWORD *)(v7 + 44);
          if (CoreML::hasCustomLayer(v12, (const CoreML::Specification::Model *)v13))
          {
            v10 = 0;
            v9 = 3;
            v11 = 1;
          }
          else
          {
            v11 = 1;
            hasWeightOfType = CoreML::hasWeightOfType((uint64_t)v12, v13, 1);
            if (hasWeightOfType)
              v9 = 3;
            else
              v9 = 2;
            v10 = !hasWeightOfType;
          }
        }
      }
      else
      {
        v9 = 0;
        v10 = 0;
        v11 = 3;
      }
    }
    else
    {
      v9 = 0;
      v10 = 0;
      v11 = 5;
    }
  }
  else
  {
    v9 = 0;
    v10 = 0;
    v11 = 9;
  }
  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", v11, v9, v10, CFSTR("generic"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)iOS18CompilerVersionInfo
{
  if (+[MLNeuralNetworkCompiler iOS18CompilerVersionInfo]::onceToken != -1)
    dispatch_once(&+[MLNeuralNetworkCompiler iOS18CompilerVersionInfo]::onceToken, &__block_literal_global_2739);
  return (id)+[MLNeuralNetworkCompiler iOS18CompilerVersionInfo]::versionInfo;
}

+ (id)iOS17CompilerVersionInfo
{
  if (+[MLNeuralNetworkCompiler iOS17CompilerVersionInfo]::onceToken != -1)
    dispatch_once(&+[MLNeuralNetworkCompiler iOS17CompilerVersionInfo]::onceToken, &__block_literal_global_24);
  return (id)+[MLNeuralNetworkCompiler iOS17CompilerVersionInfo]::versionInfo;
}

void __51__MLNeuralNetworkCompiler_iOS17CompilerVersionInfo__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 8, 0, 0, &stru_1E3D68DC8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[MLNeuralNetworkCompiler iOS17CompilerVersionInfo]::versionInfo;
  +[MLNeuralNetworkCompiler iOS17CompilerVersionInfo]::versionInfo = v0;

}

void __51__MLNeuralNetworkCompiler_iOS18CompilerVersionInfo__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[MLVersionInfo versionInfoWithMajor:minor:patch:variant:](MLVersionInfo, "versionInfoWithMajor:minor:patch:variant:", 9, 0, 0, &stru_1E3D68DC8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)+[MLNeuralNetworkCompiler iOS18CompilerVersionInfo]::versionInfo;
  +[MLNeuralNetworkCompiler iOS18CompilerVersionInfo]::versionInfo = v0;

}

@end
