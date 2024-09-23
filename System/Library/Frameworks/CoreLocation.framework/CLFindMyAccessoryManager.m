@implementation CLFindMyAccessoryManager

- (void)scanForNearbyOwner
{
  NSObject *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint8_t buf[8];
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = MEMORY[0x1E0C9AA70];
  sub_18F5D5B50(off_1E29919E0, buf, &v11);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v2 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v14 = 2082;
    v15 = "";
    _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian Client requested scan for nearby owner\"}", buf, 0x12u);
  }
  v10 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v10)
  {
    v5 = (unint64_t *)&v10->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v7 = v12;
  if (v12)
  {
    v8 = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (CLFindMyAccessoryManager)init
{
  uint64_t v2;

  objc_msgSend_doesNotRecognizeSelector_(self, a2, (uint64_t)a2, v2);
  return 0;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CLFindMyAccessoryManager;
  -[CLFindMyAccessoryManager dealloc](&v3, sel_dealloc);
}

- (void)initAccumulator
{
  CLFindMyAccessoryFragmentAccumulator *v3;
  const char *v4;
  uint64_t v5;

  if (!self->_accumulator)
  {
    v3 = [CLFindMyAccessoryFragmentAccumulator alloc];
    self->_accumulator = (CLFindMyAccessoryFragmentAccumulator *)objc_msgSend_initWithMaxBytesPerUUID_(v3, v4, 100000, v5);
  }
}

- (CLFindMyAccessoryManager)initWithDelegate:(id)a3 delegateQueue:(id)a4
{
  CLFindMyAccessoryManager *v6;
  CLFindMyAccessoryManager *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13[5];
  id v14;
  objc_super v15;
  id location[2];
  char v17;

  v15.receiver = self;
  v15.super_class = (Class)CLFindMyAccessoryManager;
  v6 = -[CLFindMyAccessoryManager init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_delegate, a3);
    if (a4)
    {
      v7->_delegateQueue = (OS_dispatch_queue *)a4;
      dispatch_retain((dispatch_object_t)a4);
    }
    else
    {
      v7->_delegateQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.DurianManagement.privateQueue", 0);
    }
    objc_msgSend_initAccumulator(v7, v8, v9, v10);
    v11 = operator new();
    sub_18F5D5990(location, "com.apple.locationd.registration");
    MEMORY[0x194002B20](v11, location, v7->_delegateQueue);
    if (v17 < 0)
      operator delete(location[0]);
    sub_18F61BBC8((uint64_t *)&v7->_connection, v11);
    objc_initWeak(location, v7);
    v13[1] = (id)MEMORY[0x1E0C809B0];
    v13[2] = (id)3221225472;
    v13[3] = sub_18F63738C;
    v13[4] = &unk_1E2991720;
    objc_copyWeak(&v14, location);
    CLConnectionClient::setDefaultMessageHandler();
    objc_copyWeak(v13, location);
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(v7->_connection.__ptr_.__value_);
    objc_destroyWeak(v13);
    objc_destroyWeak(&v14);
    objc_destroyWeak(location);
  }
  return v7;
}

+ (id)errorFromFragmentationStatus:(unint64_t)a3
{
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return 0;
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = objc_msgSend_convertDataStatusToString_(CLFindMyAccessoryFragmentAccumulator, a2, a3, v3);
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v6, (uint64_t)v10, (uint64_t)&v9, 1);
  return (id)objc_msgSend_errorWithDomain_code_userInfo_(v5, v8, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 26, v7);
}

+ (id)checkAvailabilityForPairedOwnerInformationControlPointMessages:(id)a3 messageName:()basic_string<char
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  const char *v20;
  id result;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  const __CFString *v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
    return 0;
  if (!std::string::compare((const std::string *)a4, "DurianManagement/DidFetchHawkeyeSerialNumber"))
  {
    if (objc_msgSend_length(a3, v6, v7, v8) == 141 || objc_msgSend_length(a3, v15, v16, v17) == 145)
      goto LABEL_11;
LABEL_9:
    v18 = (void *)MEMORY[0x1E0CB35C8];
    v38 = *MEMORY[0x1E0CB2D50];
    v39[0] = CFSTR("Invalid response length");
    v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v15, (uint64_t)v39, (uint64_t)&v38, 1);
    return (id)objc_msgSend_errorWithDomain_code_userInfo_(v18, v20, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 21, v19);
  }
  if (!std::string::compare((const std::string *)a4, "DurianManagement/DidFetchHawkeyeCurrentPrimaryKey"))
  {
    if (objc_msgSend_length(a3, v9, v10, v11) == 28)
      goto LABEL_11;
    goto LABEL_9;
  }
  if (std::string::compare((const std::string *)a4, "DurianManagement/DidFetchHawkeyeiCloudIdentifier"))
    return 0;
  if (objc_msgSend_length(a3, v12, v13, v14) != 60)
    goto LABEL_9;
LABEL_11:
  result = (id)objc_msgSend_length(a3, v15, v16, v17);
  if (!result)
    return result;
  v25 = (void *)MEMORY[0x1E0C99DF0];
  v26 = objc_msgSend_length(a3, v22, v23, v24);
  v29 = objc_msgSend_dataWithLength_(v25, v27, v26, v28);
  if (objc_msgSend_isEqual_(a3, v30, v29, v31))
  {
    v33 = (void *)MEMORY[0x1E0CB35C8];
    v36 = *MEMORY[0x1E0CB2D50];
    v37 = CFSTR("Response unavailable");
    v34 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v32, (uint64_t)&v37, (uint64_t)&v36, 1);
    return (id)objc_msgSend_errorWithDomain_code_userInfo_(v33, v35, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 22, v34);
  }
  return 0;
}

- (void)handleMessage:(shared_ptr<CLConnectionMessage>)a3
{
  CLConnectionMessage **var0;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  NSSet *v16;
  void *DictionaryOfClasses;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  const std::string *v27;
  const char *v28;
  uint64_t v29;
  const std::string *v30;
  const std::string *v31;
  const std::string *v32;
  const std::string *v33;
  const std::string *v34;
  const std::string *v35;
  const std::string *v36;
  const char *v37;
  uint64_t v38;
  const std::string *v39;
  const char *v40;
  uint64_t v41;
  const std::string *v42;
  const char *v43;
  uint64_t v44;
  const std::string *v45;
  const std::string *v46;
  const std::string *v47;
  const char *v48;
  uint64_t v49;
  const std::string *v50;
  const char *v51;
  uint64_t v52;
  const std::string *v53;
  const char *v54;
  uint64_t v55;
  const std::string *v56;
  const std::string *v57;
  const std::string *v58;
  const std::string *v59;
  const std::string *v60;
  const std::string *v61;
  const std::string *v62;
  const std::string *v63;
  const std::string *v64;
  const char *v65;
  uint64_t v66;
  const std::string *v67;
  const std::string *v68;
  const char *v69;
  uint64_t v70;
  const std::string *v71;
  const std::string *v72;
  const std::string *v73;
  const std::string *v74;
  const std::string *v75;
  const std::string *v76;
  const std::string *v77;
  const std::string *v78;
  const std::string *v79;
  const std::string *v80;
  const std::string *v81;
  const std::string *v82;
  const char *v83;
  uint64_t v84;
  const std::string *v85;
  const std::string *v86;
  const char *v87;
  uint64_t v88;
  const std::string *v89;
  const char *v90;
  uint64_t v91;
  const std::string *v92;
  const std::string *v93;
  const std::string *v94;
  const std::string *v95;
  const std::string *v96;
  const std::string *v97;
  const std::string *v98;
  const char *v99;
  uint64_t v100;
  const std::string *v101;
  const char *v102;
  uint64_t v103;
  const std::string *v104;
  const char *v105;
  uint64_t v106;
  const std::string *v107;
  const char *v108;
  uint64_t v109;
  const std::string *v110;
  const char *v111;
  uint64_t v112;
  const std::string *v113;
  const char *v114;
  uint64_t v115;
  const std::string *v116;
  const char *v117;
  uint64_t v118;
  const std::string *v119;
  const char *v120;
  uint64_t v121;
  const std::string *v122;
  const char *v123;
  uint64_t v124;
  const std::string *v125;
  const char *v126;
  uint64_t v127;
  const std::string *v128;
  const char *v129;
  uint64_t v130;
  const std::string *v131;
  const char *v132;
  uint64_t v133;
  const std::string *v134;
  const char *v135;
  uint64_t v136;
  const std::string *v137;
  const char *v138;
  uint64_t v139;
  const std::string *v140;
  const char *v141;
  uint64_t v142;
  const std::string *v143;
  const char *v144;
  uint64_t v145;
  const std::string *v146;
  const char *v147;
  uint64_t v148;
  const std::string *v149;
  const char *v150;
  uint64_t v151;
  const std::string *v152;
  const char *v153;
  uint64_t v154;
  const std::string *v155;
  const char *v156;
  uint64_t v157;
  const std::string *v158;
  const char *v159;
  uint64_t v160;
  const std::string *v161;
  const char *v162;
  uint64_t v163;
  const std::string *v164;
  const char *v165;
  uint64_t v166;
  const std::string *v167;
  const char *v168;
  uint64_t v169;
  NSObject *v170;
  char *v171;
  uint64_t v172;
  const char *v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  unsigned __int16 v179;
  NSObject *v180;
  const char *v181;
  NSObject *v182;
  NSObject *v183;
  char v184;
  id Weak;
  const char *v186;
  id v187;
  const char *v188;
  id v189;
  const char *v190;
  const char *v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  id v198;
  const char *v199;
  id v200;
  const char *v201;
  id v202;
  const char *v203;
  id v204;
  const char *v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  id v211;
  const char *v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  id v218;
  const char *v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  id v225;
  const char *v226;
  id v227;
  const char *v228;
  id v229;
  const char *v230;
  void *v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  unsigned __int8 v242;
  id v243;
  const char *v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  id v250;
  const char *v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  const char *v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  id v278;
  const char *v279;
  id v280;
  const char *v281;
  id v282;
  const char *v283;
  char v284;
  id v285;
  const char *v286;
  id v287;
  const char *v288;
  id v289;
  const char *v290;
  id v291;
  const char *v292;
  const char *v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  id v300;
  const char *v301;
  const char *v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  id v309;
  const char *v310;
  const char *v311;
  uint64_t v312;
  void *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  unsigned __int8 v317;
  const char *v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  unsigned __int8 v324;
  id v325;
  const char *v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  char v332;
  id v333;
  const char *v334;
  id v335;
  const char *v336;
  id v337;
  const char *v338;
  void *v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  const char *v350;
  const char *v351;
  uint64_t v352;
  uint64_t DataStatusForUUID;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  id v357;
  const char *v358;
  id v359;
  const char *v360;
  id v361;
  const char *v362;
  id v363;
  const char *v364;
  id v365;
  const char *v366;
  id v367;
  const char *v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  id v372;
  const char *v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  id v377;
  const char *v378;
  id v379;
  const char *v380;
  id v381;
  const char *v382;
  CLFindMyAccessoryManagerDelegate **p_delegate;
  id v384;
  const char *v385;
  void *v386;
  const char *v387;
  uint64_t v388;
  uint64_t v389;
  unsigned __int8 v390;
  id v391;
  const char *v392;
  id v393;
  const char *v394;
  uint64_t v395;
  id v396;
  const char *v397;
  void *v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  unsigned __int16 v402;
  id v403;
  const char *v404;
  id v405;
  const char *v406;
  id v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  const char *v411;
  id v412;
  const char *v413;
  id v414;
  const char *v415;
  id v416;
  const char *v417;
  id v418;
  const char *v419;
  uint64_t v420;
  id v421;
  const char *v422;
  uint64_t v423;
  id v424;
  const char *v425;
  uint64_t v426;
  id v427;
  const char *v428;
  uint64_t v429;
  id v430;
  const char *v431;
  uint64_t v432;
  id v433;
  const char *v434;
  uint64_t v435;
  id v436;
  const char *v437;
  void *v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  id v443;
  const char *v444;
  uint64_t v445;
  id v446;
  const char *v447;
  uint64_t v448;
  const char *v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  const char *v453;
  uint64_t v454;
  uint64_t v455;
  uint64_t v456;
  id v457;
  const char *v458;
  uint64_t v459;
  id v460;
  const char *v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  const char *v465;
  __int128 v466;
  uint64_t v467;
  id v468;
  const char *v469;
  void *v470;
  const char *v471;
  uint64_t v472;
  uint64_t v473;
  uint64_t v474;
  id v475;
  const char *v476;
  void *v477;
  const char *v478;
  uint64_t v479;
  uint64_t v480;
  unsigned __int8 v481;
  id v482;
  const char *v483;
  uint64_t v484;
  id v485;
  const char *v486;
  id v487;
  const char *v488;
  NSObject *v489;
  const char *v490;
  uint64_t v491;
  void *v492;
  const char *v493;
  uint64_t v494;
  uint64_t v495;
  unsigned __int8 v496;
  id v497;
  const char *v498;
  uint64_t v499;
  id v500;
  const char *v501;
  void *v502;
  const char *v503;
  uint64_t v504;
  uint64_t v505;
  unsigned __int8 v506;
  id v507;
  const char *v508;
  void *v509;
  const char *v510;
  uint64_t v511;
  uint64_t v512;
  unsigned __int8 v513;
  id v514;
  const char *v515;
  uint64_t v516;
  id v517;
  const char *v518;
  uint64_t v519;
  const char *v520;
  const char *v521;
  uint64_t v522;
  uint64_t v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  const char *v528;
  const char *v529;
  uint64_t v530;
  uint64_t v531;
  const char *v532;
  uint64_t v533;
  uint64_t v534;
  const char *v535;
  uint64_t v536;
  const char *v537;
  uint64_t v538;
  const char *v539;
  uint64_t v540;
  uint64_t v541;
  const char *v542;
  uint64_t v543;
  void *v544;
  const char *v545;
  uint64_t v546;
  uint64_t v547;
  unsigned __int8 v548;
  const char *v549;
  uint64_t v550;
  void *v551;
  const char *v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  const char *v556;
  uint64_t v557;
  void *v558;
  const char *v559;
  uint64_t v560;
  uint64_t v561;
  uint64_t v562;
  const char *v563;
  uint64_t v564;
  void *v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  NSObject *v570;
  id v571;
  const char *v572;
  const char *v573;
  uint64_t v574;
  uint64_t v575;
  const char *v576;
  __int128 v577;
  uint64_t v578;
  NSObject *v579;
  id v580;
  const char *v581;
  const char *v582;
  uint64_t v583;
  uint64_t v584;
  const char *v585;
  __int128 v586;
  id v587;
  const char *v588;
  id v589;
  const char *v590;
  uint64_t v591;
  uint64_t v592;
  uint64_t v593;
  void *v595[2];
  uint64_t v596;
  void *__dst[2];
  uint64_t v598;
  void *__p[2];
  uint64_t v600;
  uint8_t buf[4];
  int v602;
  __int16 v603;
  const char *v604;
  __int16 v605;
  _BYTE v606[18];
  __int16 v607;
  uint64_t v608;
  __int16 v609;
  uint64_t v610;
  __int16 v611;
  int v612;
  __int16 v613;
  uint64_t v614;
  __int16 v615;
  uint64_t v616;
  uint64_t v617;

  var0 = (CLConnectionMessage **)a3.var0;
  v617 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  v16 = (NSSet *)objc_msgSend_setWithObjects_(v4, v14, v5, v15, v6, v7, v8, v9, v10, v11, v12, v13, 0);
  DictionaryOfClasses = (void *)CLConnectionMessage::getDictionaryOfClasses(*var0, v16);
  v20 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v18, 0x1E2998148, v19);
  v23 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v21, 0x1E29981A8, v22);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v24 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    v25 = CLConnectionMessage::name(*var0);
    if (*(char *)(v25 + 23) >= 0)
      v26 = v25;
    else
      v26 = *(_QWORD *)v25;
    *(_DWORD *)buf = 68289795;
    v602 = 0;
    v603 = 2082;
    v604 = "";
    v605 = 2082;
    *(_QWORD *)v606 = v26;
    *(_WORD *)&v606[8] = 2113;
    *(_QWORD *)&v606[10] = v20;
    v607 = 2113;
    v608 = v23;
    _os_log_impl(&dword_18F5B3000, v24, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian handling message to client\", \"message\":%{public, location:escape_only}s, \"beaconUUID\":%{private, location:escape_only}@, \"error\":%{private, location:escape_only}@}", buf, 0x30u);
  }
  v27 = (const std::string *)CLConnectionMessage::name(*var0);
  if (std::string::compare(v27, "DurianManagement/DidReceiveDataFragment"))
  {
    v30 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v30, "DurianManagement/DidConnect"))
    {
      objc_loadWeak((id *)&self->_delegate);
      v184 = objc_opt_respondsToSelector();
      Weak = objc_loadWeak((id *)&self->_delegate);
      if ((v184 & 1) != 0)
      {
        objc_msgSend_findMyAccessoryManager_didConnectDevice_error_(Weak, v186, (uint64_t)self, v20, v23);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v189 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didConnectDevice_(v189, v190, (uint64_t)self, v20);
      }
      goto LABEL_240;
    }
    v31 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v31, "DurianManagement/DidDisconnect"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v187 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didDisconnectDevice_(v187, v188, (uint64_t)self, v20);
      }
      goto LABEL_240;
    }
    v32 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v32, "DurianManagement/DidFetchConnectionState"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v193 = (void *)objc_msgSend_objectForKey_(DictionaryOfClasses, v191, 0x1E2998188, v192);
        v197 = objc_msgSend_unsignedIntegerValue(v193, v194, v195, v196);
        v198 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didFetchConnectionState_forDevice_(v198, v199, (uint64_t)self, v197, v20);
      }
      goto LABEL_240;
    }
    v33 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v33, "DurianManagement/DidStartPlayingSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v200 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didStartPlayingSoundOnDevice_withError_(v200, v201, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v34 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v34, "DurianManagement/DidCompletePlayingSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v202 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didCompletePlayingSoundOnDevice_withError_(v202, v203, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v35 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v35, "DurianManagement/DidStopPlayingSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v204 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didStopPlayingSoundOnDevice_withError_(v204, v205, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v36 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v36, "DurianManagement/DidInitRanging"))
    {
      v206 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v37, 0x1E2998568, v38);
      v210 = objc_msgSend_unsignedIntValue(v206, v207, v208, v209);
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v211 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didInitRangingOnDevice_withStatus_error_(v211, v212, (uint64_t)self, v20, v210, v23);
      }
      goto LABEL_240;
    }
    v39 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v39, "DurianManagement/DidDeinitRanging"))
    {
      v213 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v40, 0x1E2998568, v41);
      v217 = objc_msgSend_unsignedIntValue(v213, v214, v215, v216);
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v218 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didDeinitRangingOnDevice_withStatus_error_(v218, v219, (uint64_t)self, v20, v217, v23);
      }
      goto LABEL_240;
    }
    v42 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v42, "DurianManagement/DidConfigureRanging"))
    {
      v220 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v43, 0x1E2998568, v44);
      v224 = objc_msgSend_unsignedIntValue(v220, v221, v222, v223);
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v225 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didConfigureRangingOnDevice_withStatus_error_(v225, v226, (uint64_t)self, v20, v224, v23);
      }
      goto LABEL_240;
    }
    v45 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v45, "DurianManagement/DidPrepareRanging"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v227 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didPrepareRangingOnDevice_error_(v227, v228, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v46 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v46, "DurianManagement/DidStartRanging"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v229 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didStartRangingOnDevice_error_(v229, v230, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v47 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v47, "DurianManagement/DidCompleteRanging"))
    {
      v231 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v48, 0x1E2998568, v49);
      v235 = objc_msgSend_unsignedIntValue(v231, v232, v233, v234);
      v238 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v236, 0x1E2998588, v237);
      v242 = objc_msgSend_unsignedShortValue(v238, v239, v240, v241);
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v243 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didCompleteRangingOnDevice_withStatus_endReason_error_(v243, v244, (uint64_t)self, v20, v235, v242, v23);
      }
      goto LABEL_240;
    }
    v50 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v50, "DurianManagement/DidReceiveRangingError"))
    {
      v245 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v51, 0x1E2998568, v52);
      v249 = objc_msgSend_unsignedIntValue(v245, v246, v247, v248);
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v250 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didReceiveRangingErrorFromDevice_withStatus_(v250, v251, (uint64_t)self, v20, v249);
      }
      goto LABEL_240;
    }
    v53 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v53, "DurianManagement/DidReceiveRangingTimestamps"))
    {
      v252 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v54, 0x1E29985A8, v55);
      v256 = objc_msgSend_unsignedShortValue(v252, v253, v254, v255);
      v259 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v257, 0x1E29985C8, v258);
      v263 = objc_msgSend_unsignedLongLongValue(v259, v260, v261, v262);
      v266 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v264, 0x1E29985E8, v265);
      v270 = objc_msgSend_unsignedLongLongValue(v266, v267, v268, v269);
      v273 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v271, 0x1E2998608, v272);
      v277 = objc_msgSend_unsignedShortValue(v273, v274, v275, v276);
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v278 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didReceiveRangingTimestampFromDevice_status_rtt_tat_cycleIndex_(v278, v279, (uint64_t)self, v20, v256, v263, v270, v277);
      }
      goto LABEL_240;
    }
    v56 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v56, "DurianManagement/DidHaveRangingMovement"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v280 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didHaveRangingMovementOnDevice_(v280, v281, (uint64_t)self, v20);
      }
      goto LABEL_240;
    }
    v57 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v57, "DurianManagement/DidFailRangingEventCounterAction"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v282 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didFailWithError_forDevice_(v282, v283, (uint64_t)self, v23, v20);
      }
      goto LABEL_240;
    }
    v58 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v58, "DurianManagement/DidStartPlayingUnauthorizedSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      v284 = objc_opt_respondsToSelector();
      v285 = objc_loadWeak((id *)&self->_delegate);
      if ((v284 & 1) != 0)
      {
        objc_msgSend_findMyAccessoryManager_didStartPlayingUnauthorizedSoundOnDevice_withError_(v285, v286, (uint64_t)self, v20, v23);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v289 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didPlayUnauthorizedSoundOnDevice_withError_(v289, v290, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v59 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v59, "DurianManagement/DidCompletePlayingUnauthorizedSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v287 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didCompletePlayingUnauthorizedSoundOnDevice_withError_(v287, v288, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v60 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v60, "DurianManagement/DidStopPlayingUnauthorizedSound"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v291 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didStopPlayingUnauthorizedSoundOnDevice_withError_(v291, v292, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v61 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v61, "DurianManagement/DidReceiveKeyRollIndex"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v295 = (void *)objc_msgSend_objectForKey_(DictionaryOfClasses, v293, 0x1E2998448, v294);
        v299 = objc_msgSend_unsignedIntegerValue(v295, v296, v297, v298);
        v300 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didReceiveKeyRollIndex_fromDevice_withError_(v300, v301, (uint64_t)self, v299, v20, 0);
      }
      goto LABEL_240;
    }
    v62 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v62, "DurianManagement/DidGetMultiStatus"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v304 = (void *)objc_msgSend_objectForKey_(DictionaryOfClasses, v302, 0x1E2998328, v303);
        v308 = objc_msgSend_unsignedIntegerValue(v304, v305, v306, v307);
        v309 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didGetMultiStatus_fromDevice_withError_(v309, v310, (uint64_t)self, v308, v20, v23);
      }
      goto LABEL_240;
    }
    v63 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v63, "DurianManagement/DidReceiveGroupStatus"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v313 = (void *)objc_msgSend_objectForKey_(DictionaryOfClasses, v311, 0x1E2998348, v312);
        v317 = objc_msgSend_unsignedIntegerValue(v313, v314, v315, v316);
        v320 = (void *)objc_msgSend_objectForKey_(DictionaryOfClasses, v318, 0x1E2998368, v319);
        v324 = objc_msgSend_unsignedIntegerValue(v320, v321, v322, v323);
        v325 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didReceiveGroupRelationStatus_maintenanceStatus_fromDevice_withError_(v325, v326, (uint64_t)self, v317, v324, v20, 0);
      }
      goto LABEL_240;
    }
    v64 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v64, "DurianManagement/DidFetchBatteryStatus"))
    {
      v327 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v65, 0x1E2998228, v66);
      v331 = objc_msgSend_unsignedLongValue(v327, v328, v329, v330);
      objc_loadWeak((id *)&self->_delegate);
      v332 = objc_opt_respondsToSelector();
      v333 = objc_loadWeak((id *)&self->_delegate);
      if ((v332 & 1) != 0)
      {
        objc_msgSend_findMyAccessoryManager_didFetchBatteryStatus_forDevice_withError_(v333, v334, (uint64_t)self, v331, v20, v23);
      }
      else if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v337 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didFetchBatteryStatus_forDevice_(v337, v338, (uint64_t)self, v331, v20);
      }
      goto LABEL_240;
    }
    v67 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v67, "DurianManagement/DidDetectCrash"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v335 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didDetectCrashOnDevice_(v335, v336, (uint64_t)self, v20);
      }
      goto LABEL_240;
    }
    v68 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v68, "DurianManagement/DidDumpLogs"))
    {
      v339 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v69, 0x1E29981E8, v70);
      v343 = objc_msgSend_unsignedLongValue(v339, v340, v341, v342);
      v346 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v344, 0x1E29981C8, v345);
      if (v343 == 4)
      {
        v349 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v347, 0x1E29981C8, v348);
        objc_msgSend_appendData_forUUID_(self->_accumulator, v350, v349, v20);
        DataStatusForUUID = objc_msgSend_getDataStatusForUUID_(self->_accumulator, v351, v20, v352);
        if (!v23)
          v23 = objc_msgSend_errorFromFragmentationStatus_(CLFindMyAccessoryManager, v354, DataStatusForUUID, v355);
        v346 = objc_msgSend_dataForUUID_(self->_accumulator, v354, v20, v355);
      }
      v356 = v346;
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v357 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didDumpLogData_ofType_fromDevice_withError_(v357, v358, (uint64_t)self, v356, v343, v20, v23);
      }
      goto LABEL_240;
    }
    v71 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v71, "DurianManagement/DidUnpair"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v359 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didUnpairFromDevice_withError_(v359, v360, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v72 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v72, "DurianManagement/DidSetTagType"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v361 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didSetDeviceTypeOnDevice_withError_(v361, v362, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v73 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v73, "DurianManagement/DidSetObfuscatedIdentifier"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v363 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didSetObfuscatedIdentifierOnDevice_withError_(v363, v364, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v74 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v74, "DurianManagement/DidSetNearOwnerTimeout"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v365 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didSetNearOwnerTimeoutOnDevice_withError_(v365, v366, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v75 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v75, "DurianManagement/DidSetWildConfiguration"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v367 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didSetWildConfigurationOnDevice_withError_(v367, v368, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v76 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v76, "DurianManagement/DidFetchUserStats_Deprecated"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v371 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v369, 0x1E2998388, v370);
        v372 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didFetchUserStats_fromDevice_withError_(v372, v373, (uint64_t)self, v371, v20, v23);
      }
      goto LABEL_240;
    }
    v77 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v77, "DurianManagement/DidFetchUserStats"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v376 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v374, 0x1E2998388, v375);
        v377 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didFetchUserStats_forDevice_withError_(v377, v378, (uint64_t)self, v376, v20, v23);
      }
      goto LABEL_240;
    }
    v78 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v78, "DurianManagement/DidRollWildKey"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v379 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didRollWildKeyOnDevice_withError_(v379, v380, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v79 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v79, "DurianManagement/DidSetAccelerometerSlopeMode"))
    {
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v381 = objc_loadWeak((id *)&self->_delegate);
        objc_msgSend_findMyAccessoryManager_didSetAccelerometerSlopeModeConfigurationForDevice_withError_(v381, v382, (uint64_t)self, v20, v23);
      }
      goto LABEL_240;
    }
    v80 = (const std::string *)CLConnectionMessage::name(*var0);
    if (!std::string::compare(v80, "DurianManagement/DidSetAccelerometerOrientationMode"))
    {
      p_delegate = &self->_delegate;
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
LABEL_179:
        v384 = objc_loadWeak((id *)p_delegate);
        objc_msgSend_findMyAccessoryManager_didSetAccelerometerOrientationModeConfigurationForDevice_withError_(v384, v385, (uint64_t)self, v20, v23);
      }
    }
    else
    {
      v81 = (const std::string *)CLConnectionMessage::name(*var0);
      if (std::string::compare(v81, "DurianManagement/DidGetAccelerometerSlopeModeConfiguration"))
      {
        v82 = (const std::string *)CLConnectionMessage::name(*var0);
        if (!std::string::compare(v82, "DurianManagement/DidGetAccelerometerMode"))
        {
          v386 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v83, 0x1E2998408, v84);
          v390 = objc_msgSend_unsignedIntValue(v386, v387, v388, v389);
          objc_loadWeak((id *)&self->_delegate);
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            v391 = objc_loadWeak((id *)&self->_delegate);
            objc_msgSend_findMyAccessoryManager_didFetchAccelerometerMode_forDevice_withError_(v391, v392, (uint64_t)self, v390, v20, v23);
          }
        }
        else
        {
          v85 = (const std::string *)CLConnectionMessage::name(*var0);
          if (!std::string::compare(v85, "DurianManagement/DidSetUnauthorizedPlaySoundRateLimit"))
          {
            objc_loadWeak((id *)&self->_delegate);
            if ((objc_opt_respondsToSelector() & 1) != 0)
            {
              v393 = objc_loadWeak((id *)&self->_delegate);
              objc_msgSend_findMyAccessoryManager_didSetUnauthorizedPlaySoundRateLimitFromDevice_withError_(v393, v394, (uint64_t)self, v20, v23);
            }
          }
          else
          {
            v86 = (const std::string *)CLConnectionMessage::name(*var0);
            if (!std::string::compare(v86, "DurianManagement/DidFetchFirmwareVersion"))
            {
              v395 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v87, 0x1E2998208, v88);
              objc_loadWeak((id *)&self->_delegate);
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v396 = objc_loadWeak((id *)&self->_delegate);
                objc_msgSend_findMyAccessoryManager_didFetchFirmwareVersion_fromDevice_withError_(v396, v397, (uint64_t)self, v395, v20, v23);
              }
            }
            else
            {
              v89 = (const std::string *)CLConnectionMessage::name(*var0);
              if (!std::string::compare(v89, "DurianManagement/DidCompleteHawkeyeTask"))
              {
                v398 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v90, 0x1E2998628, v91);
                v402 = objc_msgSend_intValue(v398, v399, v400, v401);
                objc_loadWeak((id *)&self->_delegate);
                if ((objc_opt_respondsToSelector() & 1) != 0)
                {
                  v403 = objc_loadWeak((id *)&self->_delegate);
                  objc_msgSend_findMyAccessoryManager_didCompleteHawkeyeTaskWithOpcode_fromDevice_withError_(v403, v404, (uint64_t)self, v402, v20, v23);
                }
              }
              else
              {
                v92 = (const std::string *)CLConnectionMessage::name(*var0);
                if (!std::string::compare(v92, "DurianManagement/DidSetHawkeyeUTMotionConfig"))
                {
                  objc_loadWeak((id *)&self->_delegate);
                  if ((objc_opt_respondsToSelector() & 1) != 0)
                  {
                    v405 = objc_loadWeak((id *)&self->_delegate);
                    objc_msgSend_findMyAccessoryManager_didSetHawkeyeUTMotionConfigForDevice_withError_(v405, v406, (uint64_t)self, v20, v23);
                  }
                }
                else
                {
                  v93 = (const std::string *)CLConnectionMessage::name(*var0);
                  if (!std::string::compare(v93, "DurianManagement/DidFetchTxPower"))
                  {
                    objc_loadWeak((id *)&self->_delegate);
                    if ((objc_opt_respondsToSelector() & 1) != 0)
                    {
                      v407 = objc_loadWeak((id *)&self->_delegate);
                      v410 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v408, 0x1E29986A8, v409);
                      objc_msgSend_findMyAccessoryManager_didFetchTxPower_fromDevice_withError_(v407, v411, (uint64_t)self, v410, v20, v23);
                    }
                  }
                  else
                  {
                    v94 = (const std::string *)CLConnectionMessage::name(*var0);
                    if (!std::string::compare(v94, "DurianManagement/DidStartAggressiveAdvertising"))
                    {
                      objc_loadWeak((id *)&self->_delegate);
                      if ((objc_opt_respondsToSelector() & 1) != 0)
                      {
                        v412 = objc_loadWeak((id *)&self->_delegate);
                        objc_msgSend_findMyAccessoryManager_didStartAggressiveAdvertisingOnDevice_withError_(v412, v413, (uint64_t)self, v20, v23);
                      }
                    }
                    else
                    {
                      v95 = (const std::string *)CLConnectionMessage::name(*var0);
                      if (!std::string::compare(v95, "DurianManagement/DidStopAggressiveAdvertising"))
                      {
                        objc_loadWeak((id *)&self->_delegate);
                        if ((objc_opt_respondsToSelector() & 1) != 0)
                        {
                          v414 = objc_loadWeak((id *)&self->_delegate);
                          objc_msgSend_findMyAccessoryManager_didStopAggressiveAdvertisingOnDevice_withError_(v414, v415, (uint64_t)self, v20, v23);
                        }
                      }
                      else
                      {
                        v96 = (const std::string *)CLConnectionMessage::name(*var0);
                        if (!std::string::compare(v96, "DurianManagement/DidCompleteAggressiveAdvertising"))
                        {
                          objc_loadWeak((id *)&self->_delegate);
                          if ((objc_opt_respondsToSelector() & 1) != 0)
                          {
                            v416 = objc_loadWeak((id *)&self->_delegate);
                            objc_msgSend_findMyAccessoryManager_didCompleteAggressiveAdvertisingOnDevice_withError_(v416, v417, (uint64_t)self, v20, v23);
                          }
                        }
                        else
                        {
                          v97 = (const std::string *)CLConnectionMessage::name(*var0);
                          if (!std::string::compare(v97, "DurianManagement/DidStartUnauthorizedAggressiveAdvertising"))
                          {
                            objc_loadWeak((id *)&self->_delegate);
                            if ((objc_opt_respondsToSelector() & 1) != 0)
                            {
                              v418 = objc_loadWeak((id *)&self->_delegate);
                              objc_msgSend_findMyAccessoryManager_didStartUnauthorizedAggressiveAdvertisingOnDevice_withError_(v418, v419, (uint64_t)self, v20, v23);
                            }
                          }
                          else
                          {
                            v98 = (const std::string *)CLConnectionMessage::name(*var0);
                            if (!std::string::compare(v98, "DurianManagement/DidFetchHawkeyeAISProductData"))
                            {
                              v420 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v99, 0x1E29986C8, v100);
                              objc_loadWeak((id *)&self->_delegate);
                              if ((objc_opt_respondsToSelector() & 1) != 0)
                              {
                                v421 = objc_loadWeak((id *)&self->_delegate);
                                objc_msgSend_findMyAccessoryManager_didFetchHawkeyeAISProductData_fromDevice_withError_(v421, v422, (uint64_t)self, v420, v20, v23);
                              }
                            }
                            else
                            {
                              v101 = (const std::string *)CLConnectionMessage::name(*var0);
                              if (!std::string::compare(v101, "DurianManagement/DidFetchHawkeyeAISManufacturerName"))
                              {
                                v423 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v102, 0x1E29986E8, v103);
                                objc_loadWeak((id *)&self->_delegate);
                                if ((objc_opt_respondsToSelector() & 1) != 0)
                                {
                                  v424 = objc_loadWeak((id *)&self->_delegate);
                                  objc_msgSend_findMyAccessoryManager_didFetchHawkeyeAISManufacturerName_fromDevice_withError_(v424, v425, (uint64_t)self, v423, v20, v23);
                                }
                              }
                              else
                              {
                                v104 = (const std::string *)CLConnectionMessage::name(*var0);
                                if (!std::string::compare(v104, "DurianManagement/DidFetchHawkeyeAISModelName"))
                                {
                                  v426 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v105, 0x1E2998708, v106);
                                  objc_loadWeak((id *)&self->_delegate);
                                  if ((objc_opt_respondsToSelector() & 1) != 0)
                                  {
                                    v427 = objc_loadWeak((id *)&self->_delegate);
                                    objc_msgSend_findMyAccessoryManager_didFetchHawkeyeAISModelName_fromDevice_withError_(v427, v428, (uint64_t)self, v426, v20, v23);
                                  }
                                }
                                else
                                {
                                  v107 = (const std::string *)CLConnectionMessage::name(*var0);
                                  if (!std::string::compare(v107, "DurianManagement/DidFetchHawkeyeAISModelColorCode"))
                                  {
                                    v429 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v108, 0x1E2998728, v109);
                                    objc_loadWeak((id *)&self->_delegate);
                                    if ((objc_opt_respondsToSelector() & 1) != 0)
                                    {
                                      v430 = objc_loadWeak((id *)&self->_delegate);
                                      objc_msgSend_findMyAccessoryManager_didFetchHawkeyeAISModelColorCode_fromDevice_withError_(v430, v431, (uint64_t)self, v429, v20, v23);
                                    }
                                  }
                                  else
                                  {
                                    v110 = (const std::string *)CLConnectionMessage::name(*var0);
                                    if (!std::string::compare(v110, "DurianManagement/DidFetchHawkeyeAISAccessoryCategory"))
                                    {
                                      v432 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v111, 0x1E2998748, v112);
                                      objc_loadWeak((id *)&self->_delegate);
                                      if ((objc_opt_respondsToSelector() & 1) != 0)
                                      {
                                        v433 = objc_loadWeak((id *)&self->_delegate);
                                        objc_msgSend_findMyAccessoryManager_didFetchHawkeyeAISAccessoryCategory_fromDevice_withError_(v433, v434, (uint64_t)self, v432, v20, v23);
                                      }
                                    }
                                    else
                                    {
                                      v113 = (const std::string *)CLConnectionMessage::name(*var0);
                                      if (!std::string::compare(v113, "DurianManagement/DidFetchHawkeyeAISAccessoryCapabilities"))
                                      {
                                        v435 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v114, 0x1E2998768, v115);
                                        objc_loadWeak((id *)&self->_delegate);
                                        if ((objc_opt_respondsToSelector() & 1) != 0)
                                        {
                                          v436 = objc_loadWeak((id *)&self->_delegate);
                                          objc_msgSend_findMyAccessoryManager_didFetchHawkeyeAISAccessoryCapabilities_fromDevice_withError_(v436, v437, (uint64_t)self, v435, v20, v23);
                                        }
                                      }
                                      else
                                      {
                                        v116 = (const std::string *)CLConnectionMessage::name(*var0);
                                        if (!std::string::compare(v116, "DurianManagement/DidFetchHawkeyeAISFindMyVersion"))
                                        {
                                          v438 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v117, 0x1E2998788, v118);
                                          v442 = objc_msgSend_unsignedIntegerValue(v438, v439, v440, v441);
                                          objc_loadWeak((id *)&self->_delegate);
                                          if ((objc_opt_respondsToSelector() & 1) != 0)
                                          {
                                            v443 = objc_loadWeak((id *)&self->_delegate);
                                            objc_msgSend_findMyAccessoryManager_didFetchHawkeyeAISFindMyVersion_fromDevice_withError_(v443, v444, (uint64_t)self, v442, v20, v23);
                                          }
                                        }
                                        else
                                        {
                                          v119 = (const std::string *)CLConnectionMessage::name(*var0);
                                          if (!std::string::compare(v119, "DurianManagement/DidFetchHawkeyeAISBatteryType"))
                                          {
                                            v445 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v120, 0x1E29987A8, v121);
                                            objc_loadWeak((id *)&self->_delegate);
                                            if ((objc_opt_respondsToSelector() & 1) != 0)
                                            {
                                              v446 = objc_loadWeak((id *)&self->_delegate);
                                              objc_msgSend_findMyAccessoryManager_didFetchHawkeyeAISBatteryType_fromDevice_withError_(v446, v447, (uint64_t)self, v445, v20, v23);
                                            }
                                          }
                                          else
                                          {
                                            v122 = (const std::string *)CLConnectionMessage::name(*var0);
                                            if (!std::string::compare(v122, "DurianManagement/DidFetchHawkeyeSerialNumber"))
                                            {
                                              v448 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v123, 0x1E29987C8, v124);
                                              objc_msgSend_appendData_forUUID_(self->_accumulator, v449, v448, v20);
                                              v452 = objc_msgSend_getDataStatusForUUID_(self->_accumulator, v450, v20, v451);
                                              if (v23)
                                              {
                                                v455 = objc_msgSend_dataForUUID_(self->_accumulator, v453, v20, v454);
                                              }
                                              else
                                              {
                                                v23 = objc_msgSend_errorFromFragmentationStatus_(CLFindMyAccessoryManager, v453, v452, v454);
                                                v455 = objc_msgSend_dataForUUID_(self->_accumulator, v462, v20, v463);
                                                if (!v23)
                                                {
                                                  v464 = CLConnectionMessage::name(*var0);
                                                  if (*(char *)(v464 + 23) < 0)
                                                  {
                                                    sub_18F5C6990(__p, *(void **)v464, *(_QWORD *)(v464 + 8));
                                                  }
                                                  else
                                                  {
                                                    v466 = *(_OWORD *)v464;
                                                    v600 = *(_QWORD *)(v464 + 16);
                                                    *(_OWORD *)__p = v466;
                                                  }
                                                  v23 = objc_msgSend_checkAvailabilityForPairedOwnerInformationControlPointMessages_messageName_(CLFindMyAccessoryManager, v465, v455, (uint64_t)__p);
                                                  if (SHIBYTE(v600) < 0)
                                                    operator delete(__p[0]);
                                                }
                                              }
                                              objc_loadWeak((id *)&self->_delegate);
                                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                              {
                                                v487 = objc_loadWeak((id *)&self->_delegate);
                                                objc_msgSend_findMyAccessoryManager_didFetchHawkeyeSerialNumber_fromDevice_withError_(v487, v488, (uint64_t)self, v455, v20, v23);
                                              }
                                            }
                                            else
                                            {
                                              v125 = (const std::string *)CLConnectionMessage::name(*var0);
                                              if (!std::string::compare(v125, "DurianManagement/DidFetchAISProductData"))
                                              {
                                                v456 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v126, 0x1E2998A68, v127);
                                                objc_loadWeak((id *)&self->_delegate);
                                                if ((objc_opt_respondsToSelector() & 1) != 0)
                                                {
                                                  v457 = objc_loadWeak((id *)&self->_delegate);
                                                  objc_msgSend_findMyAccessoryManager_didFetchAISProductData_fromDevice_error_(v457, v458, (uint64_t)self, v456, v20, v23);
                                                }
                                              }
                                              else
                                              {
                                                v128 = (const std::string *)CLConnectionMessage::name(*var0);
                                                if (!std::string::compare(v128, "DurianManagement/DidFetchAISManufacturerName"))
                                                {
                                                  v459 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v129, 0x1E2998A88, v130);
                                                  objc_loadWeak((id *)&self->_delegate);
                                                  if ((objc_opt_respondsToSelector() & 1) != 0)
                                                  {
                                                    v460 = objc_loadWeak((id *)&self->_delegate);
                                                    objc_msgSend_findMyAccessoryManager_didFetchAISManufacturerName_fromDevice_error_(v460, v461, (uint64_t)self, v459, v20, v23);
                                                  }
                                                }
                                                else
                                                {
                                                  v131 = (const std::string *)CLConnectionMessage::name(*var0);
                                                  if (!std::string::compare(v131, "DurianManagement/DidFetchAISModelName"))
                                                  {
                                                    v467 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v132, 0x1E2998AA8, v133);
                                                    objc_loadWeak((id *)&self->_delegate);
                                                    if ((objc_opt_respondsToSelector() & 1) != 0)
                                                    {
                                                      v468 = objc_loadWeak((id *)&self->_delegate);
                                                      objc_msgSend_findMyAccessoryManager_didFetchAISModelName_fromDevice_error_(v468, v469, (uint64_t)self, v467, v20, v23);
                                                    }
                                                  }
                                                  else
                                                  {
                                                    v134 = (const std::string *)CLConnectionMessage::name(*var0);
                                                    if (!std::string::compare(v134, "DurianManagement/DidFetchAISProtocolImplementation"))
                                                    {
                                                      v470 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v135, 0x1E2998AE8, v136);
                                                      v474 = objc_msgSend_unsignedIntValue(v470, v471, v472, v473);
                                                      objc_loadWeak((id *)&self->_delegate);
                                                      if ((objc_opt_respondsToSelector() & 1) != 0)
                                                      {
                                                        v475 = objc_loadWeak((id *)&self->_delegate);
                                                        objc_msgSend_findMyAccessoryManager_didFetchAISProtocolImplementation_fromDevice_error_(v475, v476, (uint64_t)self, v474, v20, v23);
                                                      }
                                                    }
                                                    else
                                                    {
                                                      v137 = (const std::string *)CLConnectionMessage::name(*var0);
                                                      if (!std::string::compare(v137, "DurianManagement/DidFetchAISAccessoryCategory"))
                                                      {
                                                        v477 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v138, 0x1E2998AC8, v139);
                                                        v481 = objc_msgSend_unsignedShortValue(v477, v478, v479, v480);
                                                        objc_loadWeak((id *)&self->_delegate);
                                                        if ((objc_opt_respondsToSelector() & 1) != 0)
                                                        {
                                                          v482 = objc_loadWeak((id *)&self->_delegate);
                                                          objc_msgSend_findMyAccessoryManager_didFetchAISAccessoryCategory_fromDevice_error_(v482, v483, (uint64_t)self, v481, v20, v23);
                                                        }
                                                      }
                                                      else
                                                      {
                                                        v140 = (const std::string *)CLConnectionMessage::name(*var0);
                                                        if (!std::string::compare(v140, "DurianManagement/DidFetchAISAccessoryCapabilities"))
                                                        {
                                                          v484 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v141, 0x1E2998B08, v142);
                                                          objc_loadWeak((id *)&self->_delegate);
                                                          if ((objc_opt_respondsToSelector() & 1) != 0)
                                                          {
                                                            v485 = objc_loadWeak((id *)&self->_delegate);
                                                            objc_msgSend_findMyAccessoryManager_didFetchAISAccessoryCapabilities_fromDevice_error_(v485, v486, (uint64_t)self, v484, v20, v23);
                                                          }
                                                        }
                                                        else
                                                        {
                                                          v143 = (const std::string *)CLConnectionMessage::name(*var0);
                                                          if (!std::string::compare(v143, "DurianManagement/DidFetchAISNetworkID"))
                                                          {
                                                            v492 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v144, 0x1E2998B28, v145);
                                                            v496 = objc_msgSend_unsignedShortValue(v492, v493, v494, v495);
                                                            objc_loadWeak((id *)&self->_delegate);
                                                            if ((objc_opt_respondsToSelector() & 1) != 0)
                                                            {
                                                              v497 = objc_loadWeak((id *)&self->_delegate);
                                                              objc_msgSend_findMyAccessoryManager_didFetchAISNetworkID_fromDevice_error_(v497, v498, (uint64_t)self, v496, v20, v23);
                                                            }
                                                          }
                                                          else
                                                          {
                                                            v146 = (const std::string *)CLConnectionMessage::name(*var0);
                                                            if (!std::string::compare(v146, "DurianManagement/DidFetchAISFirmwareVersion"))
                                                            {
                                                              v499 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v147, 0x1E2998B48, v148);
                                                              objc_loadWeak((id *)&self->_delegate);
                                                              if ((objc_opt_respondsToSelector() & 1) != 0)
                                                              {
                                                                v500 = objc_loadWeak((id *)&self->_delegate);
                                                                objc_msgSend_findMyAccessoryManager_didFetchAISFirmwareVersion_fromDevice_error_(v500, v501, (uint64_t)self, v499, v20, v23);
                                                              }
                                                            }
                                                            else
                                                            {
                                                              v149 = (const std::string *)CLConnectionMessage::name(*var0);
                                                              if (!std::string::compare(v149, "DurianManagement/DidFetchAISBatteryType"))
                                                              {
                                                                v502 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v150, 0x1E2998B68, v151);
                                                                v506 = objc_msgSend_unsignedShortValue(v502, v503, v504, v505);
                                                                objc_loadWeak((id *)&self->_delegate);
                                                                if ((objc_opt_respondsToSelector() & 1) != 0)
                                                                {
                                                                  v507 = objc_loadWeak((id *)&self->_delegate);
                                                                  objc_msgSend_findMyAccessoryManager_didFetchAISBatteryType_fromDevice_error_(v507, v508, (uint64_t)self, v506, v20, v23);
                                                                }
                                                              }
                                                              else
                                                              {
                                                                v152 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                if (!std::string::compare(v152, "DurianManagement/DidFetchAISBatteryLevel"))
                                                                {
                                                                  v509 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v153, 0x1E2998B88, v154);
                                                                  v513 = objc_msgSend_unsignedShortValue(v509, v510, v511, v512);
                                                                  objc_loadWeak((id *)&self->_delegate);
                                                                  if ((objc_opt_respondsToSelector() & 1) != 0)
                                                                  {
                                                                    v514 = objc_loadWeak((id *)&self->_delegate);
                                                                    objc_msgSend_findMyAccessoryManager_didFetchAISBatteryLevel_fromDevice_error_(v514, v515, (uint64_t)self, v513, v20, v23);
                                                                  }
                                                                }
                                                                else
                                                                {
                                                                  v155 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                  if (!std::string::compare(v155, "DurianManagement/DidFetchAISSerialNumber"))
                                                                  {
                                                                    v516 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v156, 0x1E2998BA8, v157);
                                                                    objc_loadWeak((id *)&self->_delegate);
                                                                    if ((objc_opt_respondsToSelector() & 1) != 0)
                                                                    {
                                                                      v517 = objc_loadWeak((id *)&self->_delegate);
                                                                      objc_msgSend_findMyAccessoryManager_didFetchAISSerialNumber_fromDevice_error_(v517, v518, (uint64_t)self, v516, v20, v23);
                                                                    }
                                                                  }
                                                                  else
                                                                  {
                                                                    v158 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                    if (!std::string::compare(v158, "DurianManagement/DidFetchHawkeyeCurrentPrimaryKey"))
                                                                    {
                                                                      v519 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v159, 0x1E29987E8, v160);
                                                                      objc_msgSend_appendData_forUUID_(self->_accumulator, v520, v519, v20);
                                                                      v523 = objc_msgSend_getDataStatusForUUID_(self->_accumulator, v521, v20, v522);
                                                                      if (v23)
                                                                      {
                                                                        v526 = objc_msgSend_dataForUUID_(self->_accumulator, v524, v20, v525);
                                                                      }
                                                                      else
                                                                      {
                                                                        v23 = objc_msgSend_errorFromFragmentationStatus_(CLFindMyAccessoryManager, v524, v523, v525);
                                                                        v526 = objc_msgSend_dataForUUID_(self->_accumulator, v573, v20, v574);
                                                                        if (!v23)
                                                                        {
                                                                          v575 = CLConnectionMessage::name(*var0);
                                                                          if (*(char *)(v575 + 23) < 0)
                                                                          {
                                                                            sub_18F5C6990(__dst, *(void **)v575, *(_QWORD *)(v575 + 8));
                                                                          }
                                                                          else
                                                                          {
                                                                            v577 = *(_OWORD *)v575;
                                                                            v598 = *(_QWORD *)(v575 + 16);
                                                                            *(_OWORD *)__dst = v577;
                                                                          }
                                                                          v23 = objc_msgSend_checkAvailabilityForPairedOwnerInformationControlPointMessages_messageName_(CLFindMyAccessoryManager, v576, v526, (uint64_t)__dst);
                                                                          if (SHIBYTE(v598) < 0)
                                                                            operator delete(__dst[0]);
                                                                        }
                                                                      }
                                                                      objc_loadWeak((id *)&self->_delegate);
                                                                      if ((objc_opt_respondsToSelector() & 1) != 0)
                                                                      {
                                                                        v587 = objc_loadWeak((id *)&self->_delegate);
                                                                        objc_msgSend_findMyAccessoryManager_didFetchHawkeyeCurrentPrimaryKey_fromDevice_withError_(v587, v588, (uint64_t)self, v526, v20, v23);
                                                                      }
                                                                    }
                                                                    else
                                                                    {
                                                                      v161 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                      if (!std::string::compare(v161, "DurianManagement/DidFetchHawkeyeiCloudIdentifier"))
                                                                      {
                                                                        v527 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v162, 0x1E2998808, v163);
                                                                        objc_msgSend_appendData_forUUID_(self->_accumulator, v528, v527, v20);
                                                                        v531 = objc_msgSend_getDataStatusForUUID_(self->_accumulator, v529, v20, v530);
                                                                        if (v23)
                                                                        {
                                                                          v534 = objc_msgSend_dataForUUID_(self->_accumulator, v532, v20, v533);
                                                                        }
                                                                        else
                                                                        {
                                                                          v23 = objc_msgSend_errorFromFragmentationStatus_(CLFindMyAccessoryManager, v532, v531, v533);
                                                                          v534 = objc_msgSend_dataForUUID_(self->_accumulator, v582, v20, v583);
                                                                          if (!v23)
                                                                          {
                                                                            v584 = CLConnectionMessage::name(*var0);
                                                                            if (*(char *)(v584 + 23) < 0)
                                                                            {
                                                                              sub_18F5C6990(v595, *(void **)v584, *(_QWORD *)(v584 + 8));
                                                                            }
                                                                            else
                                                                            {
                                                                              v586 = *(_OWORD *)v584;
                                                                              v596 = *(_QWORD *)(v584 + 16);
                                                                              *(_OWORD *)v595 = v586;
                                                                            }
                                                                            v23 = objc_msgSend_checkAvailabilityForPairedOwnerInformationControlPointMessages_messageName_(CLFindMyAccessoryManager, v585, v534, (uint64_t)v595);
                                                                            if (SHIBYTE(v596) < 0)
                                                                              operator delete(v595[0]);
                                                                          }
                                                                        }
                                                                        objc_loadWeak((id *)&self->_delegate);
                                                                        if ((objc_opt_respondsToSelector() & 1) != 0)
                                                                        {
                                                                          v589 = objc_loadWeak((id *)&self->_delegate);
                                                                          objc_msgSend_findMyAccessoryManager_didFetchHawkeyeiCloudIdentifier_fromDevice_withError_(v589, v590, (uint64_t)self, v534, v20, v23);
                                                                        }
                                                                      }
                                                                      else
                                                                      {
                                                                        v164 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                        if (!std::string::compare(v164, "DurianManagement/DidObserveAdvertisement"))
                                                                        {
                                                                          v593 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v165, 0x1E2998928, v166);
                                                                          v592 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v535, 0x1E2998948, v536);
                                                                          v591 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v537, 0x1E2998968, v538);
                                                                          v541 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v539, 0x1E29989C8, v540);
                                                                          v544 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v542, 0x1E2998988, v543);
                                                                          v548 = objc_msgSend_unsignedIntegerValue(v544, v545, v546, v547);
                                                                          v551 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v549, 0x1E29989A8, v550);
                                                                          v555 = objc_msgSend_integerValue(v551, v552, v553, v554);
                                                                          v558 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v556, 0x1E2998A08, v557);
                                                                          v562 = objc_msgSend_unsignedIntegerValue(v558, v559, v560, v561);
                                                                          v565 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v563, 0x1E29989E8, v564);
                                                                          v569 = objc_msgSend_unsignedIntegerValue(v565, v566, v567, v568);
                                                                          if (qword_1EE172118 != -1)
                                                                            dispatch_once(&qword_1EE172118, &unk_1E29903D0);
                                                                          v570 = qword_1EE172120;
                                                                          if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEBUG))
                                                                          {
                                                                            *(_DWORD *)buf = 68290819;
                                                                            v602 = 0;
                                                                            v603 = 2082;
                                                                            v604 = "";
                                                                            v605 = 2113;
                                                                            *(_QWORD *)v606 = v20;
                                                                            *(_WORD *)&v606[8] = 2113;
                                                                            *(_QWORD *)&v606[10] = v592;
                                                                            v607 = 2113;
                                                                            v608 = v591;
                                                                            v609 = 2113;
                                                                            v610 = v593;
                                                                            v611 = 1025;
                                                                            v612 = v548;
                                                                            v613 = 2049;
                                                                            v614 = v555;
                                                                            v615 = 2113;
                                                                            v616 = v541;
                                                                            _os_log_impl(&dword_18F5B3000, v570, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #client client received advertisement\", \"uuid\":%{private, location:escape_only}@, \"address\":%{private, location:escape_only}@, \"advertisementData\":%{private, location:escape_only}@, \"scanDate\":%{private, location:escape_only}@, \"status\":%{private}u, \"rssi\":%{private}ld, \"reserved\":%{private, location:escape_only}@}", buf, 0x54u);
                                                                          }
                                                                          objc_loadWeak((id *)&self->_delegate);
                                                                          if ((objc_opt_respondsToSelector() & 1) != 0)
                                                                          {
                                                                            v571 = objc_loadWeak((id *)&self->_delegate);
                                                                            objc_msgSend_findMyAccessoryManager_didObserveAdvertisementWithDate_address_advertisementData_status_rssi_reserved_uuid_ownershipType_channel_(v571, v572, (uint64_t)self, v593, v592, v591, v548, v555, v541, v20, v569, v562);
                                                                          }
                                                                        }
                                                                        else
                                                                        {
                                                                          v167 = (const std::string *)CLConnectionMessage::name(*var0);
                                                                          if (!std::string::compare(v167, "DurianManagement/DidFetchStatusOfUTEnablementRequirements"))
                                                                          {
                                                                            v578 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v168, 0x1E2998A48, v169);
                                                                            if (qword_1EE172118 != -1)
                                                                              dispatch_once(&qword_1EE172118, &unk_1E29903D0);
                                                                            v579 = qword_1EE172120;
                                                                            if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEBUG))
                                                                            {
                                                                              *(_DWORD *)buf = 68289026;
                                                                              v602 = 0;
                                                                              v603 = 2082;
                                                                              v604 = "";
                                                                              _os_log_impl(&dword_18F5B3000, v579, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"didFetchStatusOfUTEnablementRequirements\"}", buf, 0x12u);
                                                                            }
                                                                            objc_loadWeak((id *)&self->_delegate);
                                                                            if ((objc_opt_respondsToSelector() & 1) != 0)
                                                                            {
                                                                              v580 = objc_loadWeak((id *)&self->_delegate);
                                                                              objc_msgSend_findMyAccessoryManager_didFetchStatusOfUTEnablementRequirementsWithStatus_withError_(v580, v581, (uint64_t)self, v578, v23);
                                                                            }
                                                                          }
                                                                          else
                                                                          {
                                                                            if (qword_1EE172118 != -1)
                                                                              dispatch_once(&qword_1EE172118, &unk_1E29903D0);
                                                                            v170 = qword_1EE172120;
                                                                            if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_ERROR))
                                                                            {
                                                                              *(_WORD *)buf = 0;
                                                                              _os_log_impl(&dword_18F5B3000, v170, OS_LOG_TYPE_ERROR, "#durian Got a message we do not understand... dropping!", buf, 2u);
                                                                            }
                                                                            if (sub_18F5C4AE0(115, 0))
                                                                            {
                                                                              bzero(buf, 0x65CuLL);
                                                                              if (qword_1EE172118 != -1)
                                                                                dispatch_once(&qword_1EE172118, &unk_1E29903D0);
                                                                              v171 = (char *)_os_log_send_and_compose_impl();
                                                                              sub_18F5F2740("Generic", 1, 0, 0, "-[CLFindMyAccessoryManager handleMessage:]", "CoreLocation: %s\n", v171);
                                                                              if (v171 != (char *)buf)
                                                                                free(v171);
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        goto LABEL_240;
      }
      p_delegate = &self->_delegate;
      objc_loadWeak((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        goto LABEL_179;
    }
LABEL_240:
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v489 = qword_1EE172120;
    if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289283;
      v602 = 0;
      v603 = 2082;
      v604 = "";
      v605 = 2113;
      *(_QWORD *)v606 = v20;
      _os_log_impl(&dword_18F5B3000, v489, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#durian #hawkeye clearing fragments from accumulator\", \"uuid\":%{private, location:escape_only}@}", buf, 0x1Cu);
    }
    objc_msgSend_clearForUUID_(self->_accumulator, v490, v20, v491);
    return;
  }
  v172 = objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v28, 0x1E2998828, v29);
  v175 = (void *)objc_msgSend_objectForKeyedSubscript_(DictionaryOfClasses, v173, 0x1E2998628, v174);
  v179 = objc_msgSend_unsignedIntValue(v175, v176, v177, v178);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v180 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289539;
    v602 = 0;
    v603 = 2082;
    v604 = "";
    v605 = 1025;
    *(_DWORD *)v606 = v179;
    *(_WORD *)&v606[4] = 2113;
    *(_QWORD *)&v606[6] = v172;
    _os_log_impl(&dword_18F5B3000, v180, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian #hawkeye got fragment\", \"opcode\":%{private}u, \"dataFragment\":%{private, location:escape_only}@}", buf, 0x22u);
  }
  if ((objc_msgSend_appendData_forUUID_(self->_accumulator, v181, v172, v20) & 1) == 0)
  {
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v182 = qword_1EE172120;
    if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289539;
      v602 = 0;
      v603 = 2082;
      v604 = "";
      v605 = 1025;
      *(_DWORD *)v606 = v179;
      *(_WORD *)&v606[4] = 2113;
      *(_QWORD *)&v606[6] = v172;
      _os_log_impl(&dword_18F5B3000, v182, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#durian #hawkeye error appending fragment\", \"opcode\":%{private}u, \"dataFragment\":%{private, location:escape_only}@}", buf, 0x22u);
      if (qword_1EE172118 != -1)
        dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    }
    v183 = qword_1EE172120;
    if (os_signpost_enabled((os_log_t)qword_1EE172120))
    {
      *(_DWORD *)buf = 68289539;
      v602 = 0;
      v603 = 2082;
      v604 = "";
      v605 = 1025;
      *(_DWORD *)v606 = v179;
      *(_WORD *)&v606[4] = 2113;
      *(_QWORD *)&v606[6] = v172;
      _os_signpost_emit_with_name_impl(&dword_18F5B3000, v183, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#durian #hawkeye error appending fragment", "{\"msg%{public}.0s\":\"#durian #hawkeye error appending fragment\", \"opcode\":%{private}u, \"dataFragment\":%{private, location:escape_only}@}", buf, 0x22u);
    }
  }
}

- (void)handleInterruption
{
  NSObject *v3;
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  id Weak;
  const char *v10;
  CLFindMyAccessoryFragmentAccumulator *v11;
  const char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  const __CFString *v16;
  uint8_t buf[1640];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v3 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18F5B3000, v3, OS_LOG_TYPE_ERROR, "Connection to locationd interrupted!!", buf, 2u);
  }
  if (sub_18F5C4AE0(115, 0))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v14 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 0, "-[CLFindMyAccessoryManager handleInterruption]", "CoreLocation: %s\n", v14);
    if (v14 != (char *)buf)
      free(v14);
  }
  v4 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v15 = *MEMORY[0x1E0CB2D50];
  v16 = CFSTR("Connection to locationd interrupted!");
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v5, (uint64_t)&v16, (uint64_t)&v15, 1);
  v8 = (void *)objc_msgSend_initWithDomain_code_userInfo_(v4, v7, (uint64_t)CFSTR("kCLErrorDomainPrivate"), 8, v6);
  Weak = objc_loadWeak((id *)&self->_delegate);
  objc_msgSend_findMyAccessoryManager_didFailWithError_forDevice_(Weak, v10, (uint64_t)self, (uint64_t)v8, 0);

  v11 = [CLFindMyAccessoryFragmentAccumulator alloc];
  self->_accumulator = (CLFindMyAccessoryFragmentAccumulator *)objc_msgSend_initWithMaxBytesPerUUID_(v11, v12, 100000, v13);
}

- (void)sendMessage:(const char *)a3 withPayload:(id)a4
{
  void *v7;
  NSObject *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t *v16;
  unint64_t v17;
  unint64_t *p_shared_owners;
  unint64_t v19;
  std::__shared_weak_count *v20;
  unint64_t *v21;
  unint64_t v22;
  void *v24;
  const char *v25;
  std::__shared_weak_count *v26;
  id v27;
  char *v28;
  uint8_t buf[8];
  _BYTE v30[10];
  __int16 v31;
  const char *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v27 = a4;
  v28 = (char *)a3;
  if (!a3)
  {
    v24 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v24, v25, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 776, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageName"));
  }
  v7 = (void *)objc_msgSend_objectForKey_(a4, a2, 0x1E2998148, (uint64_t)a4);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v8 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_msgSend_UUIDString(v7, v9, v10, v11);
    *(_DWORD *)buf = 68289538;
    *(_DWORD *)&buf[4] = 0;
    *(_WORD *)v30 = 2082;
    *(_QWORD *)&v30[2] = "";
    v31 = 2082;
    v32 = a3;
    v33 = 2082;
    v34 = objc_msgSend_UTF8String(v12, v13, v14, v15);
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian client sending message\", \"messageName\":%{public, location:escape_only}s, \"beaconUUID\":%{public, location:escape_only}s}", buf, 0x26u);
  }
  sub_18F5F3D54(&v28, &v27, buf);
  v26 = *(std::__shared_weak_count **)v30;
  if (*(_QWORD *)v30)
  {
    v16 = (unint64_t *)(*(_QWORD *)v30 + 8);
    do
      v17 = __ldxr(v16);
    while (__stxr(v17 + 1, v16));
  }
  CLConnectionClient::sendMessage();
  if (v26)
  {
    p_shared_owners = (unint64_t *)&v26->__shared_owners_;
    do
      v19 = __ldaxr(p_shared_owners);
    while (__stlxr(v19 - 1, p_shared_owners));
    if (!v19)
    {
      ((void (*)(std::__shared_weak_count *))v26->__on_zero_shared)(v26);
      std::__shared_weak_count::__release_weak(v26);
    }
  }
  v20 = *(std::__shared_weak_count **)v30;
  if (*(_QWORD *)v30)
  {
    v21 = (unint64_t *)(*(_QWORD *)v30 + 8);
    do
      v22 = __ldaxr(v21);
    while (__stlxr(v22 - 1, v21));
    if (!v22)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
}

- (void)sendMessage:(const char *)a3
{
  uint64_t v3;
  NSObject *v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  uint8_t buf[8];
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 789, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("messageName"));
  }
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68289282;
    *(_DWORD *)&buf[4] = 0;
    v18 = 2082;
    v19 = "";
    v20 = 2082;
    v21 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"#durian client sending message\", \"messageName\":%{public, location:escape_only}s}", buf, 0x1Cu);
  }
  v7 = (std::__shared_weak_count *)operator new(0x70uLL);
  v7->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v7->__shared_owners_;
  v7->__shared_weak_owners_ = 0;
  v7->__vftable = (std::__shared_weak_count_vtbl *)&off_1E298FE10;
  sub_18F5D5990(buf, (char *)a3);
  MEMORY[0x194002B38](&v7[1], buf);
  if (SBYTE3(v21) < 0)
    operator delete(*(void **)buf);
  do
    v9 = __ldxr(p_shared_owners);
  while (__stxr(v9 + 1, p_shared_owners));
  CLConnectionClient::sendMessage();
  if (v7)
  {
    v10 = (unint64_t *)&v7->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
  if (v7)
  {
    v12 = (unint64_t *)&v7->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (void)connectDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 802, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/Connect", v6);
}

- (void)disconnectDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 810, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/Disconnect", v6);
}

- (void)fetchConnectionStateForDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 818, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchConnectionState", v6);
}

- (void)startPlayingSoundSequence:(id)a3 onDevice:(id)a4
{
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 827, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sequence"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 828, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v14[0] = 0x1E2998148;
  v14[1] = 0x1E29982A8;
  v15[0] = a4;
  v15[1] = a3;
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v15, (uint64_t)v14, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/StartSoundSequence", v8);
}

- (void)startPlayingUnauthorizedSoundOnDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 837, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/StartUnauthorizedSound", v6);
}

- (void)startPlayingUnauthorizedSoundSequence:(id)a3 onDevice:(id)a4
{
  uint64_t v7;
  const char *v8;
  void *v10;
  const char *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 845, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v12[0] = 0x1E2998148;
  v12[1] = 0x1E29982A8;
  v13[0] = a4;
  v13[1] = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v13, (uint64_t)v12, 2);
  objc_msgSend_sendMessage_withPayload_(self, v8, (uint64_t)"DurianManagement/StartUnauthorizedSound", v7);
}

- (void)stopPlayingSoundOnDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 854, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/StopSound", v6);
}

- (void)stopPlayingUnauthorizedSoundOnDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 862, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/StopUnauthorizedSound", v6);
}

- (void)getMultiStatusFromDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 870, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/GetMultiStatus", v6);
}

- (void)getMultiPartStatusFromDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 878, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/GetMultiPartStatus", v6);
}

- (void)dumpLogDataOfType:(unint64_t)a3 fromDevice:(id)a4
{
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 886, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v13[0] = 0x1E2998148;
  v13[1] = 0x1E29981E8;
  v14[0] = a4;
  v14[1] = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, (uint64_t)a4);
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v14, (uint64_t)v13, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/DumpLogs", v8);
}

- (void)induceCrashOnDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 895, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/InduceCrash", v6);
}

- (void)unpairFromDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 903, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/Unpair", v6);
}

- (void)unpairFromDeviceWithAddress:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 911, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("address"));
  }
  v11 = CFSTR("CLDurianMacAddress");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/Unpair", v6);
}

- (void)setNearOwnerTimeout:(unsigned __int16)a3 onDevice:(id)a4
{
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v5 = a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 919, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v13[0] = 0x1E2998148;
  v13[1] = 0x1E2998288;
  v14[0] = a4;
  v14[1] = objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], a2, v5, (uint64_t)a4);
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v14, (uint64_t)v13, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/SetNearOwnerTimeout", v8);
}

- (void)setDeviceType:(unsigned __int8)a3 onDevice:(id)a4
{
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v5 = a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 928, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v13[0] = 0x1E2998148;
  v13[1] = 0x1E2998248;
  v14[0] = a4;
  v14[1] = objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], a2, v5, (uint64_t)a4);
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v14, (uint64_t)v13, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/SetTagType", v8);
}

- (void)setObfuscatedIdentifier:(id)a3 onDevice:(id)a4
{
  uint64_t v7;
  const char *v8;
  void *v10;
  const char *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 937, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v12[0] = 0x1E2998148;
  v12[1] = 0x1E2998268;
  v13[0] = a4;
  v13[1] = a3;
  v7 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v13, (uint64_t)v12, 2);
  objc_msgSend_sendMessage_withPayload_(self, v8, (uint64_t)"DurianManagement/SetObfuscatedIdentifier", v7);
}

- (void)setWildConfiguration:(id)a3 onDevice:(id)a4
{
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 946, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 947, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v14[0] = 0x1E2998148;
  v14[1] = 0x1E2998308;
  v15[0] = a4;
  v15[1] = a3;
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v15, (uint64_t)v14, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/SetWildConfiguration", v8);
}

- (void)rollWildKeyOnDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 956, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/RollWildKey", v6);
}

- (void)setKeyRollInterval:(unsigned int)a3 onDevice:(id)a4
{
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v5 = *(_QWORD *)&a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, *(uint64_t *)&a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 964, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v13[0] = 0x1E2998468;
  v13[1] = 0x1E2998148;
  v14[0] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, v5, (uint64_t)a4);
  v14[1] = a4;
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v14, (uint64_t)v13, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/SetKeyRollInterval", v8);
}

- (void)setBatteryStatus:(unint64_t)a3 forDevice:(id)a4
{
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 973, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v13[0] = 0x1E2998148;
  v13[1] = 0x1E2998228;
  v14[0] = a4;
  v14[1] = objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], a2, a3, (uint64_t)a4);
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v14, (uint64_t)v13, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/SetBatteryStatus", v8);
}

- (void)fetchBatteryStatusForDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 982, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchBatteryStatus", v6);
}

- (void)fetchUserStatsWithPersistence:(BOOL)a3 fromDevice:(id)a4
{
  _BOOL8 v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v5 = a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 990, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v13[0] = 0x1E2998148;
  v13[1] = 0x1E29983A8;
  v14[0] = a4;
  v14[1] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, v5, (uint64_t)a4);
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v14, (uint64_t)v13, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/FetchUserStats", v8);
}

- (void)scanForHELE
{
  NSObject *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint8_t buf[8];
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = MEMORY[0x1E0C9AA70];
  sub_18F5D5B50(off_1E29919E8, buf, &v11);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v2 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v14 = 2082;
    v15 = "";
    _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian Client requested scan for HELE\"}", buf, 0x12u);
  }
  v10 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v10)
  {
    v5 = (unint64_t *)&v10->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v7 = v12;
  if (v12)
  {
    v8 = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (void)scanForNearbyDevicesLong
{
  NSObject *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint8_t buf[8];
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = MEMORY[0x1E0C9AA70];
  sub_18F5D5B50(off_1E29919F0, buf, &v11);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v2 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v14 = 2082;
    v15 = "";
    _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian Client requested scan for nearby devices long\"}", buf, 0x12u);
  }
  v10 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v10)
  {
    v5 = (unint64_t *)&v10->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v7 = v12;
  if (v12)
  {
    v8 = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (void)stopScanForNearbyDevicesLong
{
  NSObject *v2;
  unint64_t *p_shared_owners;
  unint64_t v4;
  unint64_t *v5;
  unint64_t v6;
  std::__shared_weak_count *v7;
  unint64_t *v8;
  unint64_t v9;
  std::__shared_weak_count *v10;
  uint64_t v11;
  std::__shared_weak_count *v12;
  uint8_t buf[8];
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)buf = MEMORY[0x1E0C9AA70];
  sub_18F5D5B50(off_1E29919F8, buf, &v11);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v2 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 68289026;
    *(_DWORD *)&buf[4] = 0;
    v14 = 2082;
    v15 = "";
    _os_log_impl(&dword_18F5B3000, v2, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#durian Client requested stop to scan for nearby devices long\"}", buf, 0x12u);
  }
  v10 = v12;
  if (v12)
  {
    p_shared_owners = (unint64_t *)&v12->__shared_owners_;
    do
      v4 = __ldxr(p_shared_owners);
    while (__stxr(v4 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v10)
  {
    v5 = (unint64_t *)&v10->__shared_owners_;
    do
      v6 = __ldaxr(v5);
    while (__stlxr(v6 - 1, v5));
    if (!v6)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  v7 = v12;
  if (v12)
  {
    v8 = (unint64_t *)&v12->__shared_owners_;
    do
      v9 = __ldaxr(v8);
    while (__stlxr(v9 - 1, v8));
    if (!v9)
    {
      ((void (*)(std::__shared_weak_count *))v7->__on_zero_shared)(v7);
      std::__shared_weak_count::__release_weak(v7);
    }
  }
}

- (void)setAccelerometerSlopeModeConfiguration:(id)a3 forDevice:(id)a4
{
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1038, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1039, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v14[0] = 0x1E2998148;
  v14[1] = 0x1E29983C8;
  v15[0] = a4;
  v15[1] = a3;
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v15, (uint64_t)v14, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/SetAccelerometerSlopeMode", v8);
}

- (void)fetchAccelerometerSlopeModeConfigurationForDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1048, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/GetAccelerometerSlopeModeConfiguration", v6);
}

- (void)setAccelerometerOrientationModeConfiguration:(id)a3 forDevice:(id)a4
{
  uint64_t v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v10 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v10, v11, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1056, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configuration"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1057, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v14[0] = 0x1E2998148;
  v14[1] = 0x1E29983E8;
  v15[0] = a4;
  v15[1] = a3;
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v15, (uint64_t)v14, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/SetAccelerometerOrientationMode", v8);
}

- (void)fetchAccelerometerOrientationModeConfigurationForDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1066, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/GetAccelerometerOrientationModeConfiguration", v6);
}

- (void)setUnauthorizedPlaySoundRateLimit:(BOOL)a3 forDevice:(id)a4
{
  _BOOL8 v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v5 = a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1074, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v13[0] = 0x1E2998148;
  v13[1] = 0x1E2998428;
  v14[0] = a4;
  v14[1] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, v5, (uint64_t)a4);
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v14, (uint64_t)v13, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/SetUnauthorizedPlaySoundRateLimit", v8);
}

- (void)fetchFirmwareVersionFromDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1083, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchFirmwareVersion", v6);
}

- (void)fetchTxPower:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1092, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchTxPower", v6);
}

- (void)fetchTxPowerFromDevice:(id)a3 asOwner:(BOOL)a4
{
  _BOOL8 v4;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v4 = a4;
  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1099, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v13[0] = 0x1E2998148;
  v13[1] = 0x1E2998908;
  v14[0] = a3;
  v14[1] = objc_msgSend_numberWithBool_(MEMORY[0x1E0CB37E8], a2, v4, a4);
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v14, (uint64_t)v13, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/FetchTxPower", v8);
}

- (void)startAggressiveAdvertisingOnDevice:(id)a3 withTimeout:(unsigned int)a4
{
  uint64_t v4;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v4 = *(_QWORD *)&a4;
  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, *(uint64_t *)&a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1108, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v13[0] = 0x1E2998148;
  v13[1] = 0x1E29988E8;
  v14[0] = a3;
  v14[1] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, v4, *(uint64_t *)&a4);
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v14, (uint64_t)v13, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/StartAggressiveAdvertising", v8);
}

- (void)stopAggressiveAdvertisingOnDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1117, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/StopAggressiveAdvertising", v6);
}

- (void)startUnauthorizedAggressiveAdvertisingOnDevice:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/StartUnauthorizedAggressiveAdvertising", v6);
}

- (void)setHawkeyeTestMode:(int)a3 forDevice:(id)a4
{
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  const char *v9;
  void *v11;
  const char *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v5 = *(_QWORD *)&a3;
  v14[2] = *MEMORY[0x1E0C80C00];
  if (!a4)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, *(uint64_t *)&a3, 0);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1133, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v13[0] = 0x1E2998148;
  v13[1] = 0x1E2998648;
  v14[0] = a4;
  v14[1] = objc_msgSend_numberWithInt_(MEMORY[0x1E0CB37E8], a2, v5, (uint64_t)a4);
  v8 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v14, (uint64_t)v13, 2);
  objc_msgSend_sendMessage_withPayload_(self, v9, (uint64_t)"DurianManagement/SetHawkeyeTestMode", v8);
}

- (void)setHawkeyeUTMotionConfigWithSeparatedUTTimeoutSeconds:(unsigned int)a3 separatedUTBackoffTimeoutSeconds:(unsigned int)a4 forDevice:(id)a5
{
  uint64_t v6;
  uint64_t v7;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  void *v15;
  const char *v16;
  _QWORD v17[3];
  _QWORD v18[4];

  v6 = *(_QWORD *)&a4;
  v7 = *(_QWORD *)&a3;
  v18[3] = *MEMORY[0x1E0C80C00];
  if (!a5)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, *(uint64_t *)&a3, *(uint64_t *)&a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v18[0] = a5;
  v17[0] = 0x1E2998148;
  v17[1] = 0x1E2998668;
  v18[1] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], a2, v7, *(uint64_t *)&a4);
  v17[2] = 0x1E2998688;
  v18[2] = objc_msgSend_numberWithUnsignedInt_(MEMORY[0x1E0CB37E8], v9, v6, v10);
  v12 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v11, (uint64_t)v18, (uint64_t)v17, 3);
  objc_msgSend_sendMessage_withPayload_(self, v13, (uint64_t)"DurianManagement/SetHawkeyeUTMotionConfig", v12);
}

- (void)fetchHawkeyeAISProductData:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeAISProductData", v6);
}

- (void)fetchHawkeyeAISManufacturerName:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1162, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeAISManufacturerName", v6);
}

- (void)fetchHawkeyeAISModelName:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1170, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeAISModelName", v6);
}

- (void)fetchHawkeyeAISModelColorCode:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1178, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeAISModelColorCode", v6);
}

- (void)fetchHawkeyeAISAccessoryCategory:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1187, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeAISAccessoryCategory", v6);
}

- (void)fetchHawkeyeAISAccessoryCapabilities:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeAISAccessoryCapabilities", v6);
}

- (void)fetchHawkeyeAISFindMyVersion:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1203, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeAISFindMyVersion", v6);
}

- (void)fetchHawkeyeAISBatteryType:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1211, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeAISBatteryType", v6);
}

- (void)fetchHawkeyeSerialNumber:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeSerialNumber", v6);
}

- (void)fetchHawkeyeCurrentPrimaryKey:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1227, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeCurrentPrimaryKey", v6);
}

- (void)fetchHawkeyeiCloudIdentifier:(id)a3
{
  uint64_t v3;
  uint64_t v6;
  const char *v7;
  void *v9;
  const char *v10;
  __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v9 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v9, v10, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v11 = CFSTR("CLDurianIdentifier");
  v12[0] = a3;
  v6 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v12, (uint64_t)&v11, 1);
  objc_msgSend_sendMessage_withPayload_(self, v7, (uint64_t)"DurianManagement/FetchHawkeyeiCloudIdentifier", v6);
}

- (void)startMonitoringForAvengerAdvertisementsForBTFinding
{
  ((void (*)(CLFindMyAccessoryManager *, char *, const char *))MEMORY[0x1E0DE7D20])(self, sel_sendMessage_, "DurianManagement/StartMonitoringForAvengerAdvertisementsForBTFinding");
}

- (void)stopMonitoringForAvengerAdvertisementsForBTFinding
{
  ((void (*)(CLFindMyAccessoryManager *, char *, const char *))MEMORY[0x1E0DE7D20])(self, sel_sendMessage_, "DurianManagement/StopMonitoringForAvengerAdvertisementsForBTFinding");
}

- (void)performAggressiveScanForSeparationAlerts
{
  ((void (*)(CLFindMyAccessoryManager *, char *, const char *))MEMORY[0x1E0DE7D20])(self, sel_sendMessage_, "DurianManagement/PerformAggressiveScanForSeparationAlerts");
}

- (void)performLongAggressiveScanForSeparationAlerts
{
  ((void (*)(CLFindMyAccessoryManager *, char *, const char *))MEMORY[0x1E0DE7D20])(self, sel_sendMessage_, "DurianManagement/PerformLongAggressiveScanForSeparationAlerts");
}

- (void)stopLongAggressiveScanForSeparationAlerts
{
  ((void (*)(CLFindMyAccessoryManager *, char *, const char *))MEMORY[0x1E0DE7D20])(self, sel_sendMessage_, "DurianManagement/StopLongAggressiveScanForSeparationAlerts");
}

- (void)performAggressiveScanForTrackingAvoidance
{
  ((void (*)(CLFindMyAccessoryManager *, char *, const char *))MEMORY[0x1E0DE7D20])(self, sel_sendMessage_, "DurianManagement/PerformAggressiveScanForTrackingAvoidance");
}

- (void)performHELEScanForTrackingAvoidance
{
  ((void (*)(CLFindMyAccessoryManager *, char *, const char *))MEMORY[0x1E0DE7D20])(self, sel_sendMessage_, "DurianManagement/PerformHELEScanForTrackingAvoidance");
}

- (void)performAggressiveScanForDurianService
{
  ((void (*)(CLFindMyAccessoryManager *, char *, const char *))MEMORY[0x1E0DE7D20])(self, sel_sendMessage_, "DurianManagement/PerformAggressiveScanForDurianService");
}

- (void)fetchStatusOfUTEnablementRequirements
{
  ((void (*)(CLFindMyAccessoryManager *, char *, const char *))MEMORY[0x1E0DE7D20])(self, sel_sendMessage_, "DurianManagement/FetchStatusOfUTEnablementRequirements");
}

- (void)fetchAISForTAUnknownBeacon:(id)a3 macAddress:(id)a4 deviceType:(id)a5
{
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1288, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
    if (a4)
      goto LABEL_3;
LABEL_5:
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1289, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("macAddress"));
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v16[0] = 0x1E2998148;
  v16[1] = 0x1E2998168;
  v17[0] = a3;
  v17[1] = a4;
  v16[2] = 0x1E2998248;
  v17[2] = a5;
  v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v17, (uint64_t)v16, 3);
  objc_msgSend_sendMessage_withPayload_(self, v11, (uint64_t)"DurianManagement/FetchAISForTAUnknownBeacon", v10);
}

- (void)stageTADetection:(id)a3 deviceType:(id)a4 detailsBitmask:(id)a5
{
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1302, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));
    if (a5)
      goto LABEL_4;
LABEL_7:
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1303, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("detailsBitmask"));
    goto LABEL_4;
  }
  v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1301, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("macAddress"));
  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!a5)
    goto LABEL_7;
LABEL_4:
  v18[0] = 0x1E2998168;
  v18[1] = 0x1E2998248;
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = 0x1E2998A28;
  v19[2] = a5;
  v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v19, (uint64_t)v18, 3);
  objc_msgSend_sendMessage_withPayload_(self, v11, (uint64_t)"DurianManagement/StageTADetection", v10);
}

- (void)forceSurfaceStagedDetections:(id)a3 deviceType:(id)a4 detailsBitmask:(id)a5
{
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  _QWORD v18[3];
  _QWORD v19[4];

  v19[3] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    if (a4)
      goto LABEL_3;
LABEL_6:
    v14 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v14, v15, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1316, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));
    if (a5)
      goto LABEL_4;
LABEL_7:
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)a3, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1317, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("detailsBitmask"));
    goto LABEL_4;
  }
  v12 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v12, v13, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1315, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("macAddress"));
  if (!a4)
    goto LABEL_6;
LABEL_3:
  if (!a5)
    goto LABEL_7;
LABEL_4:
  v18[0] = 0x1E2998168;
  v18[1] = 0x1E2998248;
  v19[0] = a3;
  v19[1] = a4;
  v18[2] = 0x1E2998A28;
  v19[2] = a5;
  v10 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v19, (uint64_t)v18, 3);
  objc_msgSend_sendMessage_withPayload_(self, v11, (uint64_t)"DurianManagement/ForceSurfaceStagedDetections", v10);
}

- (void)initRangingOnDevice:(id)a3 macAddress:(id)a4
{
  NSObject *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  unint64_t *v10;
  unint64_t v11;
  std::__shared_weak_count *v12;
  unint64_t *v13;
  unint64_t v14;
  void *v16;
  const char *v17;
  char *v18;
  std::__shared_weak_count *v19;
  uint64_t v20;
  std::__shared_weak_count *v21;
  uint64_t v22;
  int v23;
  id v24;
  uint8_t buf[4];
  id v26;
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v16 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v16, v17, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1328, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v27[0] = 0x1E2998148;
  v27[1] = 0x1E2998488;
  v28[0] = a3;
  v28[1] = a4;
  v22 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v28, (uint64_t)v27, 2);
  sub_18F5D5ED4(off_1E2991A00, &v22, &v20);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v7 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v26 = a3;
    _os_log_impl(&dword_18F5B3000, v7, OS_LOG_TYPE_INFO, "Init Ranging on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v23 = 138412290;
    v24 = a3;
    v18 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager initRangingOnDevice:macAddress:]", "CoreLocation: %s\n", v18);
    if (v18 != (char *)buf)
      free(v18);
  }
  v19 = v21;
  if (v21)
  {
    p_shared_owners = (unint64_t *)&v21->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v19)
  {
    v10 = (unint64_t *)&v19->__shared_owners_;
    do
      v11 = __ldaxr(v10);
    while (__stlxr(v11 - 1, v10));
    if (!v11)
    {
      ((void (*)(std::__shared_weak_count *))v19->__on_zero_shared)(v19);
      std::__shared_weak_count::__release_weak(v19);
    }
  }
  v12 = v21;
  if (v21)
  {
    v13 = (unint64_t *)&v21->__shared_owners_;
    do
      v14 = __ldaxr(v13);
    while (__stlxr(v14 - 1, v13));
    if (!v14)
    {
      ((void (*)(std::__shared_weak_count *))v12->__on_zero_shared)(v12);
      std::__shared_weak_count::__release_weak(v12);
    }
  }
}

- (void)deinitRangingOnDevice:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1342, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A08, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "Deinit Ranging on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager deinitRangingOnDevice:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)configureRangingOnDevice:(id)a3 macAddress:(id)a4 countryCode:(unsigned __int8)a5 uwbChannel:(unsigned __int8)a6 acqPreamble:(unsigned __int8)a7 trackingPreamble:(unsigned __int8)a8 interval:(unsigned __int16)a9
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  NSObject *v25;
  unint64_t *p_shared_owners;
  unint64_t v27;
  unint64_t *v28;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  void *v34;
  const char *v35;
  char *v36;
  std::__shared_weak_count *v37;
  uint64_t v38;
  std::__shared_weak_count *v39;
  uint64_t v40;
  int v41;
  id v42;
  uint8_t buf[4];
  id v44;
  _QWORD v45[7];
  _QWORD v46[8];

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v46[7] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v34 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v34, v35, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1355, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v45[0] = 0x1E2998148;
  v45[1] = 0x1E2998488;
  v46[0] = a3;
  v46[1] = a4;
  v45[2] = 0x1E29984A8;
  v46[2] = objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], a2, v12, (uint64_t)a4);
  v45[3] = 0x1E29984C8;
  v46[3] = objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v16, v11, v17);
  v45[4] = 0x1E29984E8;
  v46[4] = objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v18, v10, v19);
  v45[5] = 0x1E2998508;
  v46[5] = objc_msgSend_numberWithUnsignedChar_(MEMORY[0x1E0CB37E8], v20, v9, v21);
  v45[6] = 0x1E2998528;
  v46[6] = objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], v22, a9, v23);
  v40 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v24, (uint64_t)v46, (uint64_t)v45, 7);
  sub_18F5D5ED4(off_1E2991A10, &v40, &v38);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v25 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v44 = a3;
    _os_log_impl(&dword_18F5B3000, v25, OS_LOG_TYPE_INFO, "Configure Ranging on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v41 = 138412290;
    v42 = a3;
    v36 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager configureRangingOnDevice:macAddress:countryCode:uwbChannel:acqPreamble:trackingPreamble:interval:]", "CoreLocation: %s\n", v36);
    if (v36 != (char *)buf)
      free(v36);
  }
  v37 = v39;
  if (v39)
  {
    p_shared_owners = (unint64_t *)&v39->__shared_owners_;
    do
      v27 = __ldxr(p_shared_owners);
    while (__stxr(v27 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v37)
  {
    v28 = (unint64_t *)&v37->__shared_owners_;
    do
      v29 = __ldaxr(v28);
    while (__stlxr(v29 - 1, v28));
    if (!v29)
    {
      ((void (*)(std::__shared_weak_count *))v37->__on_zero_shared)(v37);
      std::__shared_weak_count::__release_weak(v37);
    }
  }
  v30 = v39;
  if (v39)
  {
    v31 = (unint64_t *)&v39->__shared_owners_;
    do
      v32 = __ldaxr(v31);
    while (__stlxr(v32 - 1, v31));
    if (!v32)
    {
      ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
      std::__shared_weak_count::__release_weak(v30);
    }
  }
}

- (void)prepareRangingOnDevice:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1374, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A18, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "Prepare Ranging on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager prepareRangingOnDevice:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)startRangingOnDevice:(id)a3 targetEventCounter:(unsigned __int16)a4
{
  uint64_t v4;
  const char *v7;
  NSObject *v8;
  unint64_t *p_shared_owners;
  unint64_t v10;
  unint64_t *v11;
  unint64_t v12;
  std::__shared_weak_count *v13;
  unint64_t *v14;
  unint64_t v15;
  void *v17;
  const char *v18;
  char *v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  std::__shared_weak_count *v22;
  uint64_t v23;
  int v24;
  id v25;
  uint8_t buf[4];
  id v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v4 = a4;
  v29[2] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, a4);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1387, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v28[0] = 0x1E2998148;
  v28[1] = 0x1E2998548;
  v29[0] = a3;
  v29[1] = objc_msgSend_numberWithUnsignedShort_(MEMORY[0x1E0CB37E8], a2, v4, a4);
  v23 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v7, (uint64_t)v29, (uint64_t)v28, 2);
  sub_18F5D5ED4(off_1E2991A20, &v23, &v21);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v8 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = a3;
    _os_log_impl(&dword_18F5B3000, v8, OS_LOG_TYPE_INFO, "Start Ranging on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v24 = 138412290;
    v25 = a3;
    v19 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager startRangingOnDevice:targetEventCounter:]", "CoreLocation: %s\n", v19);
    if (v19 != (char *)buf)
      free(v19);
  }
  v20 = v22;
  if (v22)
  {
    p_shared_owners = (unint64_t *)&v22->__shared_owners_;
    do
      v10 = __ldxr(p_shared_owners);
    while (__stxr(v10 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v20)
  {
    v11 = (unint64_t *)&v20->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v20->__on_zero_shared)(v20);
      std::__shared_weak_count::__release_weak(v20);
    }
  }
  v13 = v22;
  if (v22)
  {
    v14 = (unint64_t *)&v22->__shared_owners_;
    do
      v15 = __ldaxr(v14);
    while (__stlxr(v15 - 1, v14));
    if (!v15)
    {
      ((void (*)(std::__shared_weak_count *))v13->__on_zero_shared)(v13);
      std::__shared_weak_count::__release_weak(v13);
    }
  }
}

- (void)stopRangingOnDevice:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1401, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A28, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "Stop Ranging on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager stopRangingOnDevice:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)startEventCounterForDevice:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1414, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A30, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "Start EventCounter on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager startEventCounterForDevice:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)stopEventCounterForDevice:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1427, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A38, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "Stop EventCounter on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager stopEventCounterForDevice:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISProductData:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1441, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A40, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISProductData on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISProductData:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISManufacturerName:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1455, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A48, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISManufacturerName on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISManufacturerName:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISModelName:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1469, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A50, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISModelName on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISModelName:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISProtocolImplementation:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A58, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISProtocolImplementation on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISProtocolImplementation:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISAccessoryCategory:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1497, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A60, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISAccessoryCategory on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISAccessoryCategory:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISAccessoryCapabilities:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1511, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A68, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISAccessoryCapabilities on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISAccessoryCapabilities:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISNetworkID:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1525, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A70, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISNetworkID on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISNetworkID:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISFirmwareVersion:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1539, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A78, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISFirmwareVersion on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISFirmwareVersion:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISBatteryType:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1553, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A80, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISBatteryType on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISBatteryType:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISBatteryLevel:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1567, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(off_1E2991A88, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISBatteryLevel on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISBatteryLevel:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (void)fetchAISSerialNumber:(id)a3
{
  uint64_t v3;
  NSObject *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  void *v15;
  const char *v16;
  char *v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;
  uint64_t v21;
  int v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  if (!a3)
  {
    v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, v3);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, CFSTR("CLFindMyAccessoryManager.mm"), 1581, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("device"));
  }
  v26 = CFSTR("CLDurianIdentifier");
  v27[0] = a3;
  v21 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], a2, (uint64_t)v27, (uint64_t)&v26, 1);
  sub_18F5D5ED4(&off_1E2991A90, &v21, &v19);
  if (qword_1EE172118 != -1)
    dispatch_once(&qword_1EE172118, &unk_1E29903D0);
  v6 = qword_1EE172120;
  if (os_log_type_enabled((os_log_t)qword_1EE172120, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v25 = a3;
    _os_log_impl(&dword_18F5B3000, v6, OS_LOG_TYPE_INFO, "#posh #fma #durian FetchAISSerialNumber on device: %@", buf, 0xCu);
  }
  if (sub_18F5C4AE0(115, 2))
  {
    bzero(buf, 0x65CuLL);
    if (qword_1EE172118 != -1)
      dispatch_once(&qword_1EE172118, &unk_1E29903D0);
    v22 = 138412290;
    v23 = a3;
    v17 = (char *)_os_log_send_and_compose_impl();
    sub_18F5F2740("Generic", 1, 0, 2, "-[CLFindMyAccessoryManager fetchAISSerialNumber:]", "CoreLocation: %s\n", v17);
    if (v17 != (char *)buf)
      free(v17);
  }
  v18 = v20;
  if (v20)
  {
    p_shared_owners = (unint64_t *)&v20->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  CLConnectionClient::sendMessage();
  if (v18)
  {
    v9 = (unint64_t *)&v18->__shared_owners_;
    do
      v10 = __ldaxr(v9);
    while (__stlxr(v10 - 1, v9));
    if (!v10)
    {
      ((void (*)(std::__shared_weak_count *))v18->__on_zero_shared)(v18);
      std::__shared_weak_count::__release_weak(v18);
    }
  }
  v11 = v20;
  if (v20)
  {
    v12 = (unint64_t *)&v20->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
}

- (CLFindMyAccessoryManagerDelegate)delegate
{
  return (CLFindMyAccessoryManagerDelegate *)objc_loadWeak((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  sub_18F61BBC8((uint64_t *)&self->_connection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 3) = 0;
  return self;
}

@end
