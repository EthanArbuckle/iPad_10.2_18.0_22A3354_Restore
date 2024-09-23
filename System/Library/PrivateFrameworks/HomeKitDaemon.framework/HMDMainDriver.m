@implementation HMDMainDriver

- (HMDMainDriver)init
{
  HMDMainDriver *v2;
  uint64_t v3;
  OS_os_log *logger;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *workQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)HMDMainDriver;
  v2 = -[HMDMainDriver init](&v9, sel_init);
  if (v2)
  {
    HMFGetOSLogHandle();
    v3 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.hmd.mdrv", v5);
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v6;

  }
  return v2;
}

- (void)localeChanged
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMainDriver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __30__HMDMainDriver_localeChanged__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)start
{
  void *v3;
  HMDMainDriver *v4;
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double v24;
  double v25;
  void *v26;
  id *v27;
  NSObject *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id *v36;
  NSObject *v37;
  id v38;
  void *v39;
  double v40;
  id v41;
  void *v42;
  id v43;
  void *v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  double v51;
  double v52;
  void *v53;
  id *v54;
  NSObject *v55;
  id v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  NSObject *v62;
  id v63;
  void *v64;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v66;
  id *v67;
  NSObject *v68;
  id v69;
  void *v70;
  double v71;
  id v72;
  void *v73;
  id v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  uint64_t v83;
  double v84;
  double v85;
  void *v86;
  id *v87;
  NSObject *v88;
  id v89;
  void *v90;
  id v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  id v96;
  void *v97;
  id *v98;
  NSObject *v99;
  id v100;
  void *v101;
  double v102;
  id v103;
  id v104;
  void *v105;
  id v106;
  void *v107;
  double v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  double v115;
  double v116;
  void *v117;
  id *v118;
  NSObject *v119;
  id v120;
  void *v121;
  id v122;
  void *v123;
  void *v124;
  void *v125;
  uint64_t v126;
  id v127;
  void *v128;
  id *v129;
  NSObject *v130;
  id v131;
  void *v132;
  double v133;
  id v134;
  void *v135;
  id v136;
  void *v137;
  double v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  double v144;
  double v145;
  void *v146;
  id *v147;
  NSObject *v148;
  id v149;
  void *v150;
  id v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  id *v157;
  NSObject *v158;
  id v159;
  void *v160;
  double v161;
  id v162;
  void *v163;
  void *v164;
  id v165;
  void *v166;
  double v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  uint64_t v174;
  double v175;
  double v176;
  void *v177;
  id *v178;
  NSObject *v179;
  id v180;
  void *v181;
  id v182;
  void *v183;
  void *v184;
  void *v185;
  HMDHH2Migrator *v186;
  void *v187;
  _QWORD *v188;
  NSObject *v189;
  id v190;
  void *v191;
  double v192;
  id v193;
  void *v194;
  void *v195;
  id v196;
  void *v197;
  double v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  uint64_t v204;
  double v205;
  double v206;
  void *v207;
  _QWORD *v208;
  NSObject *v209;
  id v210;
  void *v211;
  id v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  id v217;
  void *v218;
  _QWORD *v219;
  NSObject *v220;
  id v221;
  void *v222;
  double v223;
  id v224;
  void *v225;
  id v226;
  void *v227;
  double v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  _QWORD *v234;
  NSObject *v235;
  id v236;
  id v237;
  uint64_t v238;
  double v239;
  double v240;
  void *v241;
  _QWORD *v242;
  NSObject *v243;
  id v244;
  void *v245;
  id v246;
  void *v247;
  void *v248;
  void *v249;
  id v250;
  HMDMetricsManager *v251;
  void *v252;
  HMDMetricsManager *v253;
  void *v254;
  void *v255;
  void *v256;
  HMDHelper *v257;
  HMDHelperExternalProtocolImpl *v258;
  void *v259;
  _QWORD *v260;
  NSObject *v261;
  id v262;
  void *v263;
  double v264;
  id v265;
  void *v266;
  id v267;
  void *v268;
  double v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  id v277;
  NSObject *v278;
  id v279;
  uint64_t v280;
  objc_class *v281;
  void *v282;
  uint64_t v283;
  double v284;
  double v285;
  void *v286;
  id v287;
  NSObject *v288;
  id v289;
  void *v290;
  id v291;
  void *v292;
  void *v293;
  void *v294;
  uint64_t v295;
  int v296;
  void *v297;
  id *v298;
  NSObject *v299;
  void *v300;
  id v301;
  void *v302;
  id v303;
  NSObject *v304;
  id v305;
  void *v306;
  double v307;
  id v308;
  void *v309;
  void *v310;
  BOOL v311;
  void *v312;
  id v313;
  void *v314;
  double v315;
  void *v316;
  void *v317;
  void *v318;
  void *v319;
  void *v320;
  void *v321;
  char v322;
  void *v323;
  HMDDeviceSetupConfiguringController *v324;
  void *v325;
  HMDNetworkInfoController *v326;
  void *v327;
  HMDSymptomManager *v328;
  id v329;
  uint64_t v330;
  void *v331;
  id v332;
  NSObject *v333;
  id v334;
  void *v335;
  void *v336;
  id v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  NSObject *v342;
  void *v343;
  id v344;
  NSObject *v345;
  id v346;
  double v347;
  double v348;
  void *v349;
  void *v350;
  id v351;
  NSObject *v352;
  id v353;
  void *v354;
  double v355;
  id v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  id v361;
  void *v362;
  double v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  id v372;
  NSObject *v373;
  id v374;
  id v375;
  double v376;
  double v377;
  void *v378;
  void *v379;
  id v380;
  NSObject *v381;
  id v382;
  void *v383;
  double v384;
  id v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  id v390;
  void *v391;
  double v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  id v401;
  NSObject *v402;
  id v403;
  id v404;
  NSObject *v405;
  void *v406;
  void *v407;
  HMDDeviceAccountResolvedLogEvent *v408;
  HMDAccessoryBrowser *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  uint64_t v414;
  double v415;
  double v416;
  void *v417;
  id v418;
  NSObject *v419;
  id v420;
  void *v421;
  id v422;
  void *v423;
  void *v424;
  void *v425;
  HMDHomeManager *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  HMDHomeManager *v434;
  void *v435;
  id v436;
  NSObject *v437;
  id v438;
  void *v439;
  double v440;
  id v441;
  void *v442;
  id v443;
  void *v444;
  double v445;
  void *v446;
  void *v447;
  void *v448;
  void *v449;
  HMDIDSActivityMonitorHomeManagerDataSource *v450;
  void *v451;
  HMDIDSActivityMonitorHomeManagerDataSource *v452;
  int v453;
  int v454;
  void *v455;
  id v456;
  NSObject *v457;
  id v458;
  HMDRetailDemoModeRequestHandler *v459;
  void *v460;
  HMDRetailDemoModeRequestHandler *v461;
  void *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  void *v466;
  id v467;
  NSObject *v468;
  id v469;
  void *v470;
  id v471;
  void *v472;
  void *v473;
  void *v474;
  void *v475;
  id v476;
  id v477;
  id v478;
  id v479;
  HMDIDSActivityMonitorHomeManagerDataSource *v480;
  void *v481;
  void *v482;
  id v483;
  NSObject *v484;
  id v485;
  unsigned int v486;
  unsigned int v487;
  void *v488;
  void *v489;
  void *v490;
  void *v491;
  HMDHelper *v492;
  void *v493;
  void *v494;
  void *context;
  HMDDiscoveryController *contexta;
  HMDLaunchEvent *v497;
  void *v498;
  void *v499;
  void *v500;
  void *v501;
  id *v502;
  void *v503;
  void *v504;
  _QWORD v505[4];
  id v506;
  id v507;
  id v508;
  id v509;
  id v510;
  id v511;
  HMDIDSActivityMonitorHomeManagerDataSource *v512;
  uint64_t v513;
  int out_token[2];
  id v515;
  id v516;
  _QWORD handler[6];
  const __CFString *v518;
  const __CFString *v519;
  const __CFString *v520;
  const __CFString *v521;
  _BYTE buf[24];
  const __CFString *v523;
  _BYTE v524[10];
  __int16 v525;
  const __CFString *v526;
  __int16 v527;
  const __CFString *v528;
  __int16 v529;
  id v530;
  __int16 v531;
  const __CFString *v532;
  __int16 v533;
  id v534;
  __int16 v535;
  const __CFString *v536;
  __int16 v537;
  void *v538;
  __int16 v539;
  const __CFString *v540;
  __int16 v541;
  void *v542;
  const __CFString *v543;
  const __CFString *v544;
  const __CFString *v545;
  const __CFString *v546;
  const __CFString *v547;
  const __CFString *v548;
  const __CFString *v549;
  const __CFString *v550;
  const __CFString *v551;
  const __CFString *v552;
  const __CFString *v553;
  const __CFString *v554;
  const __CFString *v555;
  const __CFString *v556;
  const __CFString *v557;
  uint64_t v558;
  _BYTE v559[24];
  const __CFString *v560;
  const __CFString *v561;
  const __CFString *v562;
  _QWORD v563[4];

  v563[1] = *MEMORY[0x24BDAC8D0];
  v504 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE3F138]), "initWithName:parent:options:", CFSTR("HMDMainDriver.start"), 0, 1);
  if (isFirstLaunchAfterBoot_onceToken != -1)
    dispatch_once(&isFirstLaunchAfterBoot_onceToken, &__block_literal_global_779);
  v497 = -[HMDLaunchEvent initWithFirstLaunchAfterBoot:]([HMDLaunchEvent alloc], "initWithFirstLaunchAfterBoot:", isFirstLaunchAfterBoot_firstLaunchAfterBoot);
  v3 = (void *)MEMORY[0x227676638]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@homed launched with ROAR Enabled", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = (void *)MEMORY[0x227676638]();
  v502 = v4;
  HMFGetOSLogHandle();
  v8 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v9 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    *(_QWORD *)&buf[4] = v9;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
    *(_WORD *)&buf[22] = 2112;
    v523 = CFSTR("Starting homed");
    *(_WORD *)v524 = 2114;
    *(_QWORD *)&v524[2] = CFSTR("state");
    v525 = 2112;
    v526 = CFSTR("start");
    v527 = 2114;
    v528 = CFSTR("isHH2");
    v529 = 2112;
    v530 = v10;
    v531 = 2114;
    v532 = CFSTR("isFirstLaunchAfterBoot");
    v533 = 2112;
    v534 = v11;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x5Cu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_alloc(MEMORY[0x24BE4F1D0]);
  HMFBooleanToString();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HMDTaggedLoggingCreateDictionary();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v13, "initWithTag:data:", CFSTR("mainDriverStart"), v16, CFSTR("state"), CFSTR("start"), CFSTR("isHH2"), v14, CFSTR("isFirstLaunchAfterBoot"), v15);
  objc_msgSend(v504, "tagProcessorList");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "submitTaggedEvent:processorList:", v17, v18);

  v19 = v502[1];
  if (os_signpost_enabled(v19))
  {
    HMFBooleanToString();
    v20 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v20;
    _os_signpost_emit_with_name_impl(&dword_2218F0000, v19, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MainDriverStart", "isRoarEnabled=%{signpost.description:attribute}@ ", buf, 0xCu);

  }
  signal(15, 0);
  v21 = isInternalBuild();
  if ((_DWORD)v21)
    v21 = +[HMDMemoryDiagnostic configureMemoryDiagnostic](HMDMemoryDiagnostic, "configureMemoryDiagnostic");
  v22 = (void *)MEMORY[0x227676638](v21);
  v23 = HMFUptime();
  v25 = v24;
  v26 = (void *)MEMORY[0x227676638](v23);
  v27 = v502;
  HMFGetOSLogHandle();
  v28 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v29 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v29;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
    *(_WORD *)&buf[22] = 2112;
    v523 = CFSTR("Config cleanup start");
    *(_WORD *)v524 = 2114;
    *(_QWORD *)&v524[2] = CFSTR("state");
    v525 = 2112;
    v526 = CFSTR("mainDriverConfigCleanup");
    _os_log_impl(&dword_2218F0000, v28, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v26);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v562 = CFSTR("state");
  v563[0] = CFSTR("mainDriverConfigCleanup");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v563, &v562, 1);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = (void *)objc_msgSend(v31, "initWithTag:data:", CFSTR("mainDriverStart"), v32);
  objc_msgSend(v504, "tagProcessorList");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "submitTaggedEvent:processorList:", v33, v34);

  v35 = (void *)MEMORY[0x227676638](+[HMDResetConfigPostCleanup performAnyPostCleanupStepsIfNecessary](HMDResetConfigPostCleanup, "performAnyPostCleanupStepsIfNecessary"));
  v36 = v27;
  HMFGetOSLogHandle();
  v37 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v38 = (id)objc_claimAutoreleasedReturnValue();
    v39 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("%.3f"), v40 - v25);
    v41 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    *(_QWORD *)&buf[4] = v38;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
    *(_WORD *)&buf[22] = 2112;
    v523 = CFSTR("Config cleanup done");
    *(_WORD *)v524 = 2114;
    *(_QWORD *)&v524[2] = CFSTR("state");
    v525 = 2112;
    v526 = CFSTR("mainDriverConfigCleanupDone");
    v527 = 2114;
    v528 = CFSTR("duration");
    v529 = 2112;
    v530 = v41;
    _os_log_impl(&dword_2218F0000, v37, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v35);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v44 = (void *)MEMORY[0x24BDD17C8];
  HMFUptime();
  objc_msgSend(v44, "stringWithFormat:", CFSTR("%.3f"), v45 - v25);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  HMDTaggedLoggingCreateDictionary();
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = (void *)objc_msgSend(v43, "initWithTag:data:", CFSTR("mainDriverStart"), v47, CFSTR("state"), CFSTR("mainDriverConfigCleanupDone"), CFSTR("duration"), v46);
  objc_msgSend(v504, "tagProcessorList");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "submitTaggedEvent:processorList:", v48, v49);

  objc_autoreleasePoolPop(v22);
  v50 = HMFUptime();
  v52 = v51;
  v53 = (void *)MEMORY[0x227676638](v50);
  v54 = v36;
  HMFGetOSLogHandle();
  v55 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v56 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v56;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
    *(_WORD *)&buf[22] = 2112;
    v523 = CFSTR("Initialize paths and utilities");
    *(_WORD *)v524 = 2114;
    *(_QWORD *)&v524[2] = CFSTR("state");
    v525 = 2112;
    v526 = CFSTR("mainDriverSetupPaths");
    _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v53);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v560 = CFSTR("state");
  v561 = CFSTR("mainDriverSetupPaths");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v561, &v560, 1);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = (void *)objc_msgSend(v58, "initWithTag:data:", CFSTR("mainDriverStart"), v59);
  objc_msgSend(v504, "tagProcessorList");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "submitTaggedEvent:processorList:", v60, v61);

  v62 = MEMORY[0x24BDAC9B8];
  v63 = MEMORY[0x24BDAC9B8];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v62, &__block_literal_global_98);

  xpc_set_event_stream_handler("com.apple.rapport.matching", MEMORY[0x24BDAC9B8], &__block_literal_global_100_8753);
  xpc_set_event_stream_handler("com.apple.passd.matching", MEMORY[0x24BDAC9B8], &__block_literal_global_105);

  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "configure");

  if (MKBDeviceUnlockedSinceBoot())
  {
    objc_msgSend(MEMORY[0x24BE3F230], "setClassMappingForNSCoder");
    objc_msgSend(MEMORY[0x24BE3F248], "loadEnableMediaAccessoriesPreferences");
    if (+[HMDDeviceCapabilities supportsLocalization](HMDDeviceCapabilities, "supportsLocalization"))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__languageChanged, CFSTR("AppleLanguagePreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if (initializePaths_onceToken != -1)
      dispatch_once(&initializePaths_onceToken, &__block_literal_global_74065);
    +[HMDDatabase registerQueries](HMDDatabase, "registerQueries");
    v66 = (void *)MEMORY[0x227676638](+[HMDHomeData configureKeyedArchiverClassMappings](HMDHomeData, "configureKeyedArchiverClassMappings"));
    v67 = v54;
    HMFGetOSLogHandle();
    v68 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v69 = (id)objc_claimAutoreleasedReturnValue();
      v70 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v70, "stringWithFormat:", CFSTR("%.3f"), v71 - v52);
      v72 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v69;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Initialized paths and utilities");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverSetupPathsDone");
      v527 = 2114;
      v528 = CFSTR("duration");
      v529 = 2112;
      v530 = v72;
      _os_log_impl(&dword_2218F0000, v68, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v66);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v75 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v75, "stringWithFormat:", CFSTR("%.3f"), v76 - v52);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = (void *)objc_msgSend(v74, "initWithTag:data:", CFSTR("mainDriverStart"), v78, CFSTR("state"), CFSTR("mainDriverSetupPathsDone"), CFSTR("duration"), v77);
    objc_msgSend(v504, "tagProcessorList");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "submitTaggedEvent:processorList:", v79, v80);

    if (isInternalBuild())
    {
      objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
      v81 = (void *)objc_claimAutoreleasedReturnValue();
      v557 = CFSTR("com.apple.CoreData.ConcurrencyDebug");
      v558 = MEMORY[0x24BDBD1C8];
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v558, &v557, 1);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v81, "registerDefaults:", v82);

    }
    v83 = HMFUptime();
    v85 = v84;
    v86 = (void *)MEMORY[0x227676638](v83);
    v87 = v67;
    HMFGetOSLogHandle();
    v88 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v89 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v89;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Checked migration record");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverCheckMigrationRecord");
      _os_log_impl(&dword_2218F0000, v88, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v86);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v555 = CFSTR("state");
    v556 = CFSTR("mainDriverCheckMigrationRecord");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v556, &v555, 1);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = (void *)objc_msgSend(v91, "initWithTag:data:", CFSTR("mainDriverStart"), v92);
    objc_msgSend(v504, "tagProcessorList");
    v94 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v90, "submitTaggedEvent:processorList:", v93, v94);

    +[HMDHH2MigratorRecord singleRecord](HMDHH2MigratorRecord, "singleRecord");
    v500 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v500, "isMigrationInProgress")
      && ((objc_msgSend(v500, "dryRun") & 1) != 0 || objc_msgSend(v500, "migrateFromTestDirectory")))
    {
      +[HMDCoreData sharedInstanceWithoutLiveCloudKit](HMDCoreData, "sharedInstanceWithoutLiveCloudKit");
      v95 = objc_claimAutoreleasedReturnValue();
      v96 = v87[2];
      v87[2] = (id)v95;

    }
    v97 = (void *)MEMORY[0x227676638]();
    v98 = v87;
    HMFGetOSLogHandle();
    v99 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v100 = (id)objc_claimAutoreleasedReturnValue();
      v101 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v101, "stringWithFormat:", CFSTR("%.3f"), v102 - v85);
      v103 = (id)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v104 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      *(_QWORD *)&buf[4] = v100;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Checked migration record");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverCheckedMigrationRecord");
      v527 = 2114;
      v528 = CFSTR("duration");
      v529 = 2112;
      v530 = v103;
      v531 = 2114;
      v532 = CFSTR("migrationInProgress");
      v533 = 2112;
      v534 = v104;
      _os_log_impl(&dword_2218F0000, v99, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x5Cu);

    }
    objc_autoreleasePoolPop(v97);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    v106 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v107 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v107, "stringWithFormat:", CFSTR("%.3f"), v108 - v85);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = (void *)objc_msgSend(v106, "initWithTag:data:", CFSTR("mainDriverStart"), v111, CFSTR("state"), CFSTR("mainDriverCheckedMigrationRecord"), CFSTR("duration"), v109, CFSTR("migrationInProgress"), v110);
    objc_msgSend(v504, "tagProcessorList");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v105, "submitTaggedEvent:processorList:", v112, v113);

    if (!v98[2])
    {
      v114 = HMFUptime();
      v116 = v115;
      v117 = (void *)MEMORY[0x227676638](v114);
      v118 = v98;
      HMFGetOSLogHandle();
      v119 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
      {
        HMFGetLogIdentifier();
        v120 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544386;
        *(_QWORD *)&buf[4] = v120;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
        *(_WORD *)&buf[22] = 2112;
        v523 = CFSTR("Setup CoreData");
        *(_WORD *)v524 = 2114;
        *(_QWORD *)&v524[2] = CFSTR("state");
        v525 = 2112;
        v526 = CFSTR("mainDriverSetupCDDone");
        _os_log_impl(&dword_2218F0000, v119, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

      }
      objc_autoreleasePoolPop(v117);
      objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      v122 = objc_alloc(MEMORY[0x24BE4F1D0]);
      v553 = CFSTR("state");
      v554 = CFSTR("mainDriverSetupCDDone");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v554, &v553, 1);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = (void *)objc_msgSend(v122, "initWithTag:data:", CFSTR("mainDriverStart"), v123);
      objc_msgSend(v504, "tagProcessorList");
      v125 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v121, "submitTaggedEvent:processorList:", v124, v125);

      +[HMDCoreData sharedInstance](HMDCoreData, "sharedInstance");
      v126 = objc_claimAutoreleasedReturnValue();
      v127 = v98[2];
      v98[2] = (id)v126;

      v128 = (void *)MEMORY[0x227676638]();
      v129 = v118;
      HMFGetOSLogHandle();
      v130 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v131 = (id)objc_claimAutoreleasedReturnValue();
        v132 = (void *)MEMORY[0x24BDD17C8];
        HMFUptime();
        objc_msgSend(v132, "stringWithFormat:", CFSTR("%.3f"), v133 - v116);
        v134 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138544898;
        *(_QWORD *)&buf[4] = v131;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
        *(_WORD *)&buf[22] = 2112;
        v523 = CFSTR("Setup CoreData done");
        *(_WORD *)v524 = 2114;
        *(_QWORD *)&v524[2] = CFSTR("state");
        v525 = 2112;
        v526 = CFSTR("mainDriverSetupCDDone");
        v527 = 2114;
        v528 = CFSTR("duration");
        v529 = 2112;
        v530 = v134;
        _os_log_impl(&dword_2218F0000, v130, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

      }
      objc_autoreleasePoolPop(v128);
      objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = objc_alloc(MEMORY[0x24BE4F1D0]);
      v137 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v137, "stringWithFormat:", CFSTR("%.3f"), v138 - v116);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      HMDTaggedLoggingCreateDictionary();
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      v141 = (void *)objc_msgSend(v136, "initWithTag:data:", CFSTR("mainDriverStart"), v140, CFSTR("state"), CFSTR("mainDriverSetupCDDone"), CFSTR("duration"), v139);
      objc_msgSend(v504, "tagProcessorList");
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "submitTaggedEvent:processorList:", v141, v142);

    }
    v143 = HMFUptime();
    v145 = v144;
    v146 = (void *)MEMORY[0x227676638](v143);
    v147 = v98;
    HMFGetOSLogHandle();
    v148 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v149 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v149;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Check working store for Home Manager");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverCheckWorkingStore");
      _os_log_impl(&dword_2218F0000, v148, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v146);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v551 = CFSTR("state");
    v552 = CFSTR("mainDriverCheckWorkingStore");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v552, &v551, 1);
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = (void *)objc_msgSend(v151, "initWithTag:data:", CFSTR("mainDriverStart"), v152);
    objc_msgSend(v504, "tagProcessorList");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v150, "submitTaggedEvent:processorList:", v153, v154);

    +[HMDHomeManager makeSureHomeManagerExistInWorkingStore:](HMDHomeManager, "makeSureHomeManagerExistInWorkingStore:", v98[2]);
    +[HMDCoreDataCloudTransform sharedInstance](HMDCoreDataCloudTransform, "sharedInstance");
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    v156 = (void *)MEMORY[0x227676638](objc_msgSend(v155, "setDelegate:", v147));
    v157 = v147;
    HMFGetOSLogHandle();
    v158 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v158, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v159 = (id)objc_claimAutoreleasedReturnValue();
      v160 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v160, "stringWithFormat:", CFSTR("%.3f"), v161 - v145);
      v162 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v155 != 0);
      v163 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      *(_QWORD *)&buf[4] = v159;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Checked working store for Home Manager");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverCheckWorkingStoreDone");
      v527 = 2114;
      v528 = CFSTR("duration");
      v529 = 2112;
      v530 = v162;
      v531 = 2114;
      v532 = CFSTR("success");
      v533 = 2112;
      v534 = v163;
      _os_log_impl(&dword_2218F0000, v158, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x5Cu);

    }
    objc_autoreleasePoolPop(v156);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    v165 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v166 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v166, "stringWithFormat:", CFSTR("%.3f"), v167 - v145);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v155 != 0);
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = (void *)objc_msgSend(v165, "initWithTag:data:", CFSTR("mainDriverStart"), v170, CFSTR("state"), CFSTR("mainDriverCheckWorkingStoreDone"), CFSTR("duration"), v168, CFSTR("success"), v169);
    objc_msgSend(v504, "tagProcessorList");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "submitTaggedEvent:processorList:", v171, v172);

    objc_msgSend(v155, "applyInitialImportVoucherIfNeeded");
    v173 = (void *)MEMORY[0x227676638]();
    v174 = HMFUptime();
    v176 = v175;
    v177 = (void *)MEMORY[0x227676638](v174);
    v178 = v157;
    HMFGetOSLogHandle();
    v179 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v179, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v180 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v180;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Check for migration status");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverCheckMigrationStatus");
      _os_log_impl(&dword_2218F0000, v179, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v177);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    v182 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v549 = CFSTR("state");
    v550 = CFSTR("mainDriverCheckMigrationStatus");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v550, &v549, 1);
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = (void *)objc_msgSend(v182, "initWithTag:data:", CFSTR("mainDriverStart"), v183);
    objc_msgSend(v504, "tagProcessorList");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v181, "submitTaggedEvent:processorList:", v184, v185);

    v186 = objc_alloc_init(HMDHH2Migrator);
    if (!-[HMDHH2Migrator startMigrationIfNeeded](v186, "startMigrationIfNeeded"))
    {
      +[HMDHH2MigrationStateLogger recordMigrationEnd:](HMDHH2MigrationStateLogger, "recordMigrationEnd:", 0);
      +[HMDResetConfigPostCleanup writePostCleanupRecordToRemoveAllCoreDataFilesWithReason:](HMDResetConfigPostCleanup, "writePostCleanupRecordToRemoveAllCoreDataFilesWithReason:", 3);
      objc_msgSend(MEMORY[0x24BDD1540], "hmPrivateErrorWithCode:", 2711);
      v481 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDHH2MigratorRecord recordMigrationFailureWithError:](HMDHH2MigratorRecord, "recordMigrationFailureWithError:", v481);

      _Exit(2);
    }
    v187 = (void *)MEMORY[0x227676638]();
    v188 = v178;
    HMFGetOSLogHandle();
    v189 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v190 = (id)objc_claimAutoreleasedReturnValue();
      v191 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v191, "stringWithFormat:", CFSTR("%.3f"), v192 - v176);
      v193 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v194 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545410;
      *(_QWORD *)&buf[4] = v190;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Checked for migration status");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverCheckedMigrationStatus");
      v527 = 2114;
      v528 = CFSTR("duration");
      v529 = 2112;
      v530 = v193;
      v531 = 2114;
      v532 = CFSTR("success");
      v533 = 2112;
      v534 = v194;
      _os_log_impl(&dword_2218F0000, v189, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x5Cu);

    }
    objc_autoreleasePoolPop(v187);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v196 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v197 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v197, "stringWithFormat:", CFSTR("%.3f"), v198 - v176);
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v200 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v201 = (void *)objc_claimAutoreleasedReturnValue();
    v202 = (void *)objc_msgSend(v196, "initWithTag:data:", CFSTR("mainDriverStart"), v201, CFSTR("state"), CFSTR("mainDriverCheckedMigrationStatus"), CFSTR("duration"), v199, CFSTR("success"), v200);
    objc_msgSend(v504, "tagProcessorList");
    v203 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v195, "submitTaggedEvent:processorList:", v202, v203);

    objc_autoreleasePoolPop(v173);
    v204 = HMFUptime();
    v206 = v205;
    v207 = (void *)MEMORY[0x227676638](v204);
    v208 = v188;
    HMFGetOSLogHandle();
    v209 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v209, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v210 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v210;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Init capabilities");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverSetupCapabilities");
      _os_log_impl(&dword_2218F0000, v209, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v207);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    v212 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v547 = CFSTR("state");
    v548 = CFSTR("mainDriverSetupCapabilities");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v548, &v547, 1);
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    v214 = (void *)objc_msgSend(v212, "initWithTag:data:", CFSTR("mainDriverStart"), v213);
    objc_msgSend(v504, "tagProcessorList");
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v211, "submitTaggedEvent:processorList:", v214, v215);

    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __initializeCapabilitiesAndTimeouts_block_invoke;
    v523 = (const __CFString *)&unk_24E799CC8;
    *(_QWORD *)v524 = 0;
    if (initializeCapabilitiesAndTimeouts_onceToken == -1)
    {
      v216 = 0;
    }
    else
    {
      dispatch_once(&initializeCapabilitiesAndTimeouts_onceToken, buf);
      v216 = *(void **)v524;
    }

    initializeMappingsAndPaths();
    v217 = (id)HMCreateHomeKitCacheDirectory();
    v218 = (void *)MEMORY[0x227676638](v217);
    v219 = v208;
    HMFGetOSLogHandle();
    v220 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v221 = (id)objc_claimAutoreleasedReturnValue();
      v222 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v222, "stringWithFormat:", CFSTR("%.3f"), v223 - v206);
      v224 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v221;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Init capabilities done");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverSetupCapabilitiesDone");
      v527 = 2114;
      v528 = CFSTR("duration");
      v529 = 2112;
      v530 = v224;
      _os_log_impl(&dword_2218F0000, v220, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v218);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v226 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v227 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v227, "stringWithFormat:", CFSTR("%.3f"), v228 - v206);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    v231 = (void *)objc_msgSend(v226, "initWithTag:data:", CFSTR("mainDriverStart"), v230, CFSTR("state"), CFSTR("mainDriverSetupCapabilitiesDone"), CFSTR("duration"), v229);
    objc_msgSend(v504, "tagProcessorList");
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v225, "submitTaggedEvent:processorList:", v231, v232);

    v233 = (void *)MEMORY[0x227676638]();
    v234 = v219;
    HMFGetOSLogHandle();
    v235 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v235, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v236 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
      v237 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v236;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v237;
      _os_log_impl(&dword_2218F0000, v235, OS_LOG_TYPE_DEBUG, "%{public}@Preferences: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v233);
    v238 = HMFUptime();
    v240 = v239;
    v241 = (void *)MEMORY[0x227676638](v238);
    v242 = v234;
    HMFGetOSLogHandle();
    v243 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v243, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v244 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v244;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Init accounts and transports");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverSetupAccountManagers");
      _os_log_impl(&dword_2218F0000, v243, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v241);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    v246 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v545 = CFSTR("state");
    v546 = CFSTR("mainDriverSetupAccountManagers");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v546, &v545, 1);
    v247 = (void *)objc_claimAutoreleasedReturnValue();
    v248 = (void *)objc_msgSend(v246, "initWithTag:data:", CFSTR("mainDriverStart"), v247);
    objc_msgSend(v504, "tagProcessorList");
    v249 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v245, "submitTaggedEvent:processorList:", v248, v249);

    +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
    v490 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v499 = (void *)objc_claimAutoreleasedReturnValue();
    v250 = +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
    +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
    v494 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v504, "markWithReason:", CFSTR("Creating Message Transports"));
    +[HMDXPCMessageTransport defaultTransport](HMDXPCMessageTransport, "defaultTransport");
    v489 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDSecureRemoteMessageTransport defaultTransport](HMDSecureRemoteMessageTransport, "defaultTransport");
    v488 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMessageDispatcher defaultDispatcher](HMDMessageDispatcher, "defaultDispatcher");
    v501 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
    v493 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v504, "markWithReason:", CFSTR("Initialize Metrics Manager"));
    v251 = [HMDMetricsManager alloc];
    objc_msgSend(v493, "notificationCenterSettingsProvider");
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    v253 = -[HMDMetricsManager initWithMessageDispatcher:accountManager:notificationSettingsProvider:](v251, "initWithMessageDispatcher:accountManager:notificationSettingsProvider:", v501, v499, v252);
    objc_msgSend(v242, "setMetricsManager:", v253);

    objc_msgSend(v242, "metricsManager");
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v254, "startMetricsCollection");

    objc_msgSend(v242, "metricsManager");
    v255 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v255, "logEventSubmitter");
    v256 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v256, "submitLogEvent:", v497);

    v257 = [HMDHelper alloc];
    v258 = objc_alloc_init(HMDHelperExternalProtocolImpl);
    v492 = -[HMDHelper initWithExternalProtocol:](v257, "initWithExternalProtocol:", v258);

    v259 = (void *)MEMORY[0x227676638](+[HMDHelper setSharedHelper:](HMDHelper, "setSharedHelper:", v492));
    v260 = v242;
    HMFGetOSLogHandle();
    v261 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v261, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v262 = (id)objc_claimAutoreleasedReturnValue();
      v263 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v263, "stringWithFormat:", CFSTR("%.3f"), v264 - v240);
      v265 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v262;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Init accounts and transports done");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverSetupAccountManagersDone");
      v527 = 2114;
      v528 = CFSTR("duration");
      v529 = 2112;
      v530 = v265;
      _os_log_impl(&dword_2218F0000, v261, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v259);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    v267 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v268 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v268, "stringWithFormat:", CFSTR("%.3f"), v269 - v240);
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    v272 = (void *)objc_msgSend(v267, "initWithTag:data:", CFSTR("mainDriverStart"), v271, CFSTR("state"), CFSTR("mainDriverSetupAccountManagersDone"), CFSTR("duration"), v270);
    objc_msgSend(v504, "tagProcessorList");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v266, "submitTaggedEvent:processorList:", v272, v273);

    if (isInternalBuild())
      +[HMDThreadMonitor start](HMDThreadMonitor, "start");
    v274 = (void *)MEMORY[0x227676638](objc_msgSend(v504, "markWithReason:", CFSTR("Initiating Clips Quota Manager")));
    +[HMDCameraClipsQuotaManager defaultManager](HMDCameraClipsQuotaManager, "defaultManager");
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v275, "synchronize");

    objc_autoreleasePoolPop(v274);
    if (enableNetworkLogging)
    {
      v276 = (void *)MEMORY[0x227676638]();
      v277 = v260;
      HMFGetOSLogHandle();
      v278 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v278, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v279 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v279;
        _os_log_impl(&dword_2218F0000, v278, OS_LOG_TYPE_INFO, "%{public}@Enabling CFNetwork diagnostics", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v276);
      setenv("CFNETWORK_DIAGNOSTICS", "3", 1);
    }
    objc_msgSend(v504, "markWithReason:", CFSTR("Loading Persistent Store"));
    v280 = objc_opt_class();
    v281 = (objc_class *)objc_opt_class();
    NSStringFromClass(v281);
    v282 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreSingleton setClass:forClassName:](HMDBackingStoreSingleton, "setClass:forClassName:", v280, v282);

    v283 = HMFUptime();
    v285 = v284;
    v286 = (void *)MEMORY[0x227676638](v283);
    v287 = v260;
    HMFGetOSLogHandle();
    v288 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v288, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v289 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v289;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Load Persistent Store");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverLoadPersistentStore");
      _os_log_impl(&dword_2218F0000, v288, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v286);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    v291 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v543 = CFSTR("state");
    v544 = CFSTR("mainDriverLoadPersistentStore");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v544, &v543, 1);
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    v293 = (void *)objc_msgSend(v291, "initWithTag:data:", CFSTR("mainDriverStart"), v292);
    objc_msgSend(v504, "tagProcessorList");
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v290, "submitTaggedEvent:processorList:", v293, v294);

    context = (void *)MEMORY[0x227676638]();
    +[HMDPersistentStore removeTransactionJournal](HMDPersistentStore, "removeTransactionJournal");
    v295 = +[HMDHAPMetadata prepareMetadata](HMDHAPMetadata, "prepareMetadata");
    v296 = enableRetailDemoSetup;
    if (enableRetailDemoSetup && (v295 = objc_msgSend(0, "demoFinalized"), (v295 & 1) == 0))
    {
      v516 = 0;
      v301 = (id)objc_msgSend((id)objc_opt_class(), "loadHomeDataFromDemoModeStore:", &v516);
      v295 = (uint64_t)v516;
      v498 = (void *)v295;
    }
    else
    {
      v498 = 0;
    }
    v302 = (void *)MEMORY[0x227676638](v295);
    v303 = v287;
    HMFGetOSLogHandle();
    v304 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v304, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v305 = (id)objc_claimAutoreleasedReturnValue();
      v306 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v306, "stringWithFormat:", CFSTR("%.3f"), v307 - v285);
      v308 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(0, "domain");
      v309 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(0, "code"));
      v310 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545922;
      *(_QWORD *)&buf[4] = v305;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Loaded Persistent Store");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverLoadedPersistentStore");
      v527 = 2114;
      v528 = CFSTR("duration");
      v529 = 2112;
      v530 = v308;
      v531 = 2114;
      v532 = CFSTR("errorDomain");
      v533 = 2112;
      v534 = v309;
      v535 = 2114;
      v536 = CFSTR("errorCode");
      v537 = 2112;
      v538 = v310;
      _os_log_impl(&dword_2218F0000, v304, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x70u);

    }
    v311 = v296 != 0;

    objc_autoreleasePoolPop(v302);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v312 = (void *)objc_claimAutoreleasedReturnValue();
    v313 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v314 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v314, "stringWithFormat:", CFSTR("%.3f"), v315 - v285);
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(0, "domain");
    v317 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(0, "code"));
    v318 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    v320 = (void *)objc_msgSend(v313, "initWithTag:data:", CFSTR("mainDriverStart"), v319, CFSTR("state"), CFSTR("mainDriverLoadedPersistentStore"), CFSTR("duration"), v316, CFSTR("errorDomain"), v317, CFSTR("errorCode"), v318);
    objc_msgSend(v504, "tagProcessorList");
    v321 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v312, "submitTaggedEvent:processorList:", v320, v321);

    if (v498)
      v322 = v311;
    else
      v322 = 1;
    if ((v322 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
      v323 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v323, "ensureControllerKeyExistsForAllViews");

    }
    objc_autoreleasePoolPop(context);
    v324 = objc_alloc_init(HMDDeviceSetupConfiguringController);
    objc_msgSend(v303, "setConfiguringStateController:", v324);

    objc_msgSend(v303, "configuringStateController");
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v325, "setupRPClient");

    v326 = objc_alloc_init(HMDNetworkInfoController);
    objc_msgSend(v303, "setNetworkInfoController:", v326);

    objc_msgSend(v303, "networkInfoController");
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v327, "start");

    contexta = -[HMDDiscoveryController initWithDiscoveryNeedsAssertion:]([HMDDiscoveryController alloc], "initWithDiscoveryNeedsAssertion:", 1);
    objc_msgSend(v303, "setDiscoveryController:", contexta);
    -[HMDDiscoveryController start](contexta, "start");
    v328 = -[HMDSymptomManager initWithDataSource:]([HMDSymptomManager alloc], "initWithDataSource:", v303);
    objc_msgSend(v303, "setSymptomManager:", v328);

    objc_msgSend(v504, "markWithReason:", CFSTR("Loading Accounts"));
    v515 = 0;
    +[HMDBackingStore cdlsBackingStoreForHomeManagerWithError:](HMDBackingStore, "cdlsBackingStoreForHomeManagerWithError:", &v515);
    v491 = (void *)objc_claimAutoreleasedReturnValue();
    v329 = v515;
    *(_QWORD *)v559 = v329;
    if (!v491)
    {
      v482 = (void *)MEMORY[0x227676638]();
      v483 = v303;
      HMFGetOSLogHandle();
      v484 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v484, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v485 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v485;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v329;
        _os_log_impl(&dword_2218F0000, v484, OS_LOG_TYPE_ERROR, "%{public}@Unable to open Home Manager BackingStore zone. Unsurvivable: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v482);
      _Exit(1);
    }
    objc_msgSend(v499, "configureWithBackingStore:");
    objc_msgSend(v504, "markWithReason:", CFSTR("Start Account registry and managers"));
    objc_msgSend(v494, "start");
    v330 = objc_msgSend(v499, "isLoggedInToPrimaryAccount");
    v331 = (void *)MEMORY[0x227676638]();
    v332 = v303;
    HMFGetOSLogHandle();
    v333 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v333, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v334 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v330);
      v335 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v334;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Load accounts");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverLoadAccounts");
      v527 = 2114;
      v528 = CFSTR("status");
      v529 = 2112;
      v530 = v335;
      _os_log_impl(&dword_2218F0000, v333, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v331);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    v337 = objc_alloc(MEMORY[0x24BE4F1D0]);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v330);
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v339 = (void *)objc_claimAutoreleasedReturnValue();
    v340 = (void *)objc_msgSend(v337, "initWithTag:data:", CFSTR("mainDriverStart"), v339, CFSTR("state"), CFSTR("mainDriverLoadAccounts"), CFSTR("status"), v338);
    objc_msgSend(v504, "tagProcessorList");
    v341 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v336, "submitTaggedEvent:processorList:", v340, v341);

    if ((_DWORD)v330)
    {
      v342 = v502[1];
      if (os_signpost_enabled(v342))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = CFSTR("AccountDeviceSettled");
        _os_signpost_emit_with_name_impl(&dword_2218F0000, v342, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "AccountDeviceSettled", "reason=%{signpost.description:attribute}@ ", buf, 0xCu);
      }

      v343 = (void *)MEMORY[0x227676638](objc_msgSend(v504, "markWithReason:", CFSTR("Waiting for account to fully settle")));
      v344 = v332;
      HMFGetOSLogHandle();
      v345 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v345, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v346 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v346;
        _os_log_impl(&dword_2218F0000, v345, OS_LOG_TYPE_DEFAULT, "%{public}@Waiting for account to fully settle", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v343);
      *(_QWORD *)out_token = 0;
      HMFUptime();
      v348 = v347;
      objc_msgSend(v499, "deviceAccountSettled");
      v349 = (void *)objc_claimAutoreleasedReturnValue();
      v486 = objc_msgSend(v349, "waitForResult:orError:withTimeout:", out_token, v559, 1.79769313e308);

      v350 = (void *)MEMORY[0x227676638]();
      v351 = v344;
      HMFGetOSLogHandle();
      v352 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v352, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v353 = (id)objc_claimAutoreleasedReturnValue();
        v354 = (void *)MEMORY[0x24BDD17C8];
        HMFUptime();
        objc_msgSend(v354, "stringWithFormat:", CFSTR("%.3f"), v355 - v348);
        v356 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v486);
        v357 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)v559, "domain");
        v358 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)v559, "code"));
        v359 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138546434;
        *(_QWORD *)&buf[4] = v353;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
        *(_WORD *)&buf[22] = 2112;
        v523 = CFSTR("Settled account");
        *(_WORD *)v524 = 2114;
        *(_QWORD *)&v524[2] = CFSTR("state");
        v525 = 2112;
        v526 = CFSTR("mainDriverSettledAccount");
        v527 = 2114;
        v528 = CFSTR("duration");
        v529 = 2112;
        v530 = v356;
        v531 = 2114;
        v532 = CFSTR("success");
        v533 = 2112;
        v534 = v357;
        v535 = 2114;
        v536 = CFSTR("errorDomain");
        v537 = 2112;
        v538 = v358;
        v539 = 2114;
        v540 = CFSTR("errorCode");
        v541 = 2112;
        v542 = v359;
        _os_log_impl(&dword_2218F0000, v352, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x84u);

      }
      objc_autoreleasePoolPop(v350);
      objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
      v360 = (void *)objc_claimAutoreleasedReturnValue();
      v361 = objc_alloc(MEMORY[0x24BE4F1D0]);
      v362 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v362, "stringWithFormat:", CFSTR("%.3f"), v363 - v348);
      v364 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v486);
      v365 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)v559, "domain");
      v366 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)v559, "code"));
      v367 = (void *)objc_claimAutoreleasedReturnValue();
      HMDTaggedLoggingCreateDictionary();
      v368 = (void *)objc_claimAutoreleasedReturnValue();
      v369 = (void *)objc_msgSend(v361, "initWithTag:data:", CFSTR("mainDriverStart"), v368, CFSTR("state"), CFSTR("mainDriverSettledAccount"), CFSTR("duration"), v364, CFSTR("success"), v365, CFSTR("errorDomain"), v366, CFSTR("errorCode"), v367);
      objc_msgSend(v504, "tagProcessorList");
      v370 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v360, "submitTaggedEvent:processorList:", v369, v370);

      v371 = (void *)MEMORY[0x227676638]();
      v372 = v351;
      HMFGetOSLogHandle();
      v373 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v373, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v374 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v375 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v374;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v375;
        *(_WORD *)&buf[22] = 2112;
        v523 = *(const __CFString **)v559;
        _os_log_impl(&dword_2218F0000, v373, OS_LOG_TYPE_DEFAULT, "%{public}@Did account settle: %@ error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v371);
      HMFUptime();
      v377 = v376;
      objc_msgSend(v499, "currentDeviceSettled");
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      v487 = objc_msgSend(v378, "waitForResult:orError:withTimeout:", out_token, v559, 1.79769313e308);

      v379 = (void *)MEMORY[0x227676638]();
      v380 = v372;
      HMFGetOSLogHandle();
      v381 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v381, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v382 = (id)objc_claimAutoreleasedReturnValue();
        v383 = (void *)MEMORY[0x24BDD17C8];
        HMFUptime();
        objc_msgSend(v383, "stringWithFormat:", CFSTR("%.3f"), v384 - v377);
        v385 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v487);
        v386 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)v559, "domain");
        v387 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)v559, "code"));
        v388 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138546434;
        *(_QWORD *)&buf[4] = v382;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
        *(_WORD *)&buf[22] = 2112;
        v523 = CFSTR("Settled device");
        *(_WORD *)v524 = 2114;
        *(_QWORD *)&v524[2] = CFSTR("state");
        v525 = 2112;
        v526 = CFSTR("mainDriverSettledDevice");
        v527 = 2114;
        v528 = CFSTR("duration");
        v529 = 2112;
        v530 = v385;
        v531 = 2114;
        v532 = CFSTR("success");
        v533 = 2112;
        v534 = v386;
        v535 = 2114;
        v536 = CFSTR("errorDomain");
        v537 = 2112;
        v538 = v387;
        v539 = 2114;
        v540 = CFSTR("errorCode");
        v541 = 2112;
        v542 = v388;
        _os_log_impl(&dword_2218F0000, v381, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x84u);

      }
      objc_autoreleasePoolPop(v379);
      objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
      v389 = (void *)objc_claimAutoreleasedReturnValue();
      v390 = objc_alloc(MEMORY[0x24BE4F1D0]);
      v391 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v391, "stringWithFormat:", CFSTR("%.3f"), v392 - v377);
      v393 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v487);
      v394 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)v559, "domain");
      v395 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(*(id *)v559, "code"));
      v396 = (void *)objc_claimAutoreleasedReturnValue();
      HMDTaggedLoggingCreateDictionary();
      v397 = (void *)objc_claimAutoreleasedReturnValue();
      v398 = (void *)objc_msgSend(v390, "initWithTag:data:", CFSTR("mainDriverStart"), v397, CFSTR("state"), CFSTR("mainDriverSettledDevice"), CFSTR("duration"), v393, CFSTR("success"), v394, CFSTR("errorDomain"), v395, CFSTR("errorCode"), v396);
      objc_msgSend(v504, "tagProcessorList");
      v399 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v389, "submitTaggedEvent:processorList:", v398, v399);

      v400 = (void *)MEMORY[0x227676638]();
      v401 = v380;
      HMFGetOSLogHandle();
      v402 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v402, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v403 = (id)objc_claimAutoreleasedReturnValue();
        HMFBooleanToString();
        v404 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        *(_QWORD *)&buf[4] = v403;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v404;
        *(_WORD *)&buf[22] = 2112;
        v523 = *(const __CFString **)v559;
        _os_log_impl(&dword_2218F0000, v402, OS_LOG_TYPE_DEFAULT, "%{public}@Did current device settle: %@ error: %@", buf, 0x20u);

      }
      objc_autoreleasePoolPop(v400);
      v405 = v502[1];
      if (os_signpost_enabled(v405))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_2218F0000, v405, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "AccountDeviceSettled", ", buf, 2u);
      }

    }
    objc_msgSend(v332, "metricsManager");
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v406, "logEventSubmitter");
    v407 = (void *)objc_claimAutoreleasedReturnValue();
    v408 = objc_alloc_init(HMDDeviceAccountResolvedLogEvent);
    objc_msgSend(v407, "submitLogEvent:error:", v408, *(_QWORD *)v559);

    objc_msgSend(v504, "markWithReason:", CFSTR("Creating Accessory Browser"));
    v409 = -[HMDAccessoryBrowser initWithMessageDispatcher:]([HMDAccessoryBrowser alloc], "initWithMessageDispatcher:", v501);
    objc_msgSend(v332, "setAccessoryBrowser:", v409);

    objc_msgSend(v332, "metricsManager");
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE1BB38], "sharedInstance");
    v411 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v410, "configureHAPMetricsDispatcher:", v411);

    if (enableRetailDemoSetup || objc_msgSend(v498, "demoFinalized"))
    {
      objc_msgSend(v504, "markWithReason:", CFSTR("Loading Demo Mode"));
      objc_msgSend(v332, "accessoryBrowser");
      v412 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v498, "demoAccessories");
      v413 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v412, "configureDemoBrowserWithDemoAccessories:finalized:", v413, objc_msgSend(v498, "demoFinalized"));

    }
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v503 = (void *)objc_claimAutoreleasedReturnValue();
    v414 = HMFUptime();
    v416 = v415;
    v417 = (void *)MEMORY[0x227676638](v414);
    v418 = v332;
    HMFGetOSLogHandle();
    v419 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v419, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v420 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v420;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Initializing Home Manager");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverInitHomeManager");
      _os_log_impl(&dword_2218F0000, v419, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v417);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    v422 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v520 = CFSTR("state");
    v521 = CFSTR("mainDriverInitHomeManager");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v521, &v520, 1);
    v423 = (void *)objc_claimAutoreleasedReturnValue();
    v424 = (void *)objc_msgSend(v422, "initWithTag:data:", CFSTR("mainDriverStart"), v423);
    objc_msgSend(v504, "tagProcessorList");
    v425 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v421, "submitTaggedEvent:processorList:", v424, v425);

    v426 = [HMDHomeManager alloc];
    objc_msgSend(v418, "accessoryBrowser");
    v427 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v501, "messageFilterChain");
    v428 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
    v429 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v418, "metricsManager");
    v430 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v418, "configuringStateController");
    v431 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v418, "appleMediaAccessoryDiagnosticInfoController");
    v432 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v418, "currentAccessorySetupMetricDispatcher");
    v433 = (void *)objc_claimAutoreleasedReturnValue();
    v434 = -[HMDHomeManager initWithMessageDispatcher:accessoryBrowser:messageFilterChain:homeData:localDataDecryptionFailed:identityRegistry:accountRegistry:metricsManager:configuringStateController:diagnosticInfoController:currentAccessorySetupMetricDispatcher:uncommittedTransactions:](v426, "initWithMessageDispatcher:accessoryBrowser:messageFilterChain:homeData:localDataDecryptionFailed:identityRegistry:accountRegistry:metricsManager:configuringStateController:diagnosticInfoController:currentAccessorySetupMetricDispatcher:uncommittedTransactions:", v501, v427, v428, v498, 0, v429, v494, v430, v431, v432, v433, v503);
    objc_msgSend(v418, "setHomeManager:", v434);

    v435 = (void *)MEMORY[0x227676638]();
    v436 = v418;
    HMFGetOSLogHandle();
    v437 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v437, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v438 = (id)objc_claimAutoreleasedReturnValue();
      v439 = (void *)MEMORY[0x24BDD17C8];
      HMFUptime();
      objc_msgSend(v439, "stringWithFormat:", CFSTR("%.3f"), v440 - v416);
      v441 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v438;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Initialized Home Manager");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverInitializedHomeManager");
      v527 = 2114;
      v528 = CFSTR("duration");
      v529 = 2112;
      v530 = v441;
      _os_log_impl(&dword_2218F0000, v437, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v435);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v442 = (void *)objc_claimAutoreleasedReturnValue();
    v443 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v444 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v444, "stringWithFormat:", CFSTR("%.3f"), v445 - v416);
    v446 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v447 = (void *)objc_claimAutoreleasedReturnValue();
    v448 = (void *)objc_msgSend(v443, "initWithTag:data:", CFSTR("mainDriverStart"), v447, CFSTR("state"), CFSTR("mainDriverInitializedHomeManager"), CFSTR("duration"), v446);
    objc_msgSend(v504, "tagProcessorList");
    v449 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v442, "submitTaggedEvent:processorList:", v448, v449);

    objc_msgSend(v504, "markWithReason:", CFSTR("Initialize Presence Monitor"));
    v450 = [HMDIDSActivityMonitorHomeManagerDataSource alloc];
    objc_msgSend(v436, "homeManager");
    v451 = (void *)objc_claimAutoreleasedReturnValue();
    v452 = -[HMDIDSActivityMonitorHomeManagerDataSource initWithHomeManager:](v450, "initWithHomeManager:", v451);

    objc_msgSend(v490, "setActivityMonitorDataSource:", v452);
    v453 = isInternalBuild();
    if (enableRetailDemoSetup)
      v454 = v453;
    else
      v454 = 0;
    if (v454 == 1)
    {
      v455 = (void *)MEMORY[0x227676638](objc_msgSend(v504, "markWithReason:", CFSTR("Creating Retail Demo Mode Request Handler")));
      v456 = v436;
      HMFGetOSLogHandle();
      v457 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v457, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v458 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v458;
        _os_log_impl(&dword_2218F0000, v457, OS_LOG_TYPE_INFO, "%{public}@Creating Retail Demo Mode Request Handler", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v455);
      v459 = [HMDRetailDemoModeRequestHandler alloc];
      objc_msgSend(v456, "homeManager");
      v460 = (void *)objc_claimAutoreleasedReturnValue();
      v461 = -[HMDRetailDemoModeRequestHandler initWithHomeManager:messageDispatcher:relaunchHandler:](v459, "initWithHomeManager:messageDispatcher:relaunchHandler:", v460, v501, v456);
      objc_msgSend(v456, "setRetailDemoModeRequestHandler:", v461);

      objc_msgSend(v456, "retailDemoModeRequestHandler");
      v462 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v462, "configure");

    }
    v463 = HMFUptime();
    v465 = v464;
    v466 = (void *)MEMORY[0x227676638](v463);
    v467 = v436;
    HMFGetOSLogHandle();
    v468 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v468, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v469 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v469;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v523 = CFSTR("Starting Home Manager");
      *(_WORD *)v524 = 2114;
      *(_QWORD *)&v524[2] = CFSTR("state");
      v525 = 2112;
      v526 = CFSTR("mainDriverStartHomeManager");
      _os_log_impl(&dword_2218F0000, v468, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v466);
    objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
    v470 = (void *)objc_claimAutoreleasedReturnValue();
    v471 = objc_alloc(MEMORY[0x24BE4F1D0]);
    v518 = CFSTR("state");
    v519 = CFSTR("mainDriverStartHomeManager");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v519, &v518, 1);
    v472 = (void *)objc_claimAutoreleasedReturnValue();
    v473 = (void *)objc_msgSend(v471, "initWithTag:data:", CFSTR("mainDriverStart"), v472);
    objc_msgSend(v504, "tagProcessorList");
    v474 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v470, "submitTaggedEvent:processorList:", v473, v474);

    objc_msgSend(v467, "homeManager");
    v475 = (void *)objc_claimAutoreleasedReturnValue();
    v505[0] = MEMORY[0x24BDAC760];
    v505[1] = 3221225472;
    v505[2] = __22__HMDMainDriver_start__block_invoke_225;
    v505[3] = &unk_24E7771D8;
    v506 = v504;
    v507 = v467;
    v513 = v465;
    v476 = v501;
    v508 = v476;
    v477 = v488;
    v509 = v477;
    v478 = v493;
    v510 = v478;
    v479 = v489;
    v511 = v479;
    v480 = v452;
    v512 = v480;
    objc_msgSend(v475, "startWithCompletionHandler:", v505);

  }
  else
  {
    out_token[0] = 0;
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v523) = 0;
    v297 = (void *)MEMORY[0x227676638]();
    v298 = v54;
    HMFGetOSLogHandle();
    v299 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v299, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)v559 = 138543362;
      *(_QWORD *)&v559[4] = v300;
      _os_log_impl(&dword_2218F0000, v299, OS_LOG_TYPE_INFO, "%{public}@Can't load data until unlocked -- stopping", v559, 0xCu);

    }
    objc_autoreleasePoolPop(v297);
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = __22__HMDMainDriver_start__block_invoke_108;
    handler[3] = &unk_24E778020;
    handler[4] = v298;
    handler[5] = buf;
    notify_register_dispatch("com.apple.mobile.keybagd.lock_status", out_token, MEMORY[0x24BDAC9B8], handler);

    _Block_object_dispose(buf, 8);
  }

}

- (void)relaunchHomed
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDMainDriver *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  -[HMDMainDriver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[HMDLaunchHandler sharedHandler](HMDLaunchHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1880]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  objc_msgSend(v4, "registerRelaunchClientWithUUID:", v5);

  v6 = (void *)MEMORY[0x227676638]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Exiting...", (uint8_t *)&v10, 0xCu);

  }
  objc_autoreleasePoolPop(v6);
  _Exit(0);
}

- (void)relaunch
{
  NSObject *v3;
  _QWORD block[5];

  -[HMDMainDriver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __25__HMDMainDriver_relaunch__block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)relaunchAfterDelay:(double)a3
{
  dispatch_time_t v4;
  NSObject *v5;
  _QWORD block[5];

  v4 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  -[HMDMainDriver workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __36__HMDMainDriver_relaunchAfterDelay___block_invoke;
  block[3] = &unk_24E79C240;
  block[4] = self;
  dispatch_after(v4, v5, block);

}

- (BOOL)cloudTransform:(id)a3 isPermittedForHomeWithModelID:(id)a4 isImport:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  int v17;
  id v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  const char *v22;
  BOOL v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  void *v31;
  const char *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  _BOOL4 v39;
  void *context;
  void *v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v5 = a5;
  v46 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[HMDMainDriver homeManager](self, "homeManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    objc_msgSend(v10, "_homeWithUUID:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      v28 = (void *)MEMORY[0x227676638]();
      v29 = v8;
      HMFGetOSLogHandle();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v31;
        v44 = 2112;
        v45 = v9;
        v32 = "%{public}@Allowing cloud transform, no known home with modelID: %@";
LABEL_25:
        _os_log_impl(&dword_2218F0000, v30, OS_LOG_TYPE_INFO, v32, buf, 0x16u);

      }
LABEL_26:

      objc_autoreleasePoolPop(v28);
      v23 = 1;
      goto LABEL_27;
    }
    v39 = v5;
    v14 = v12;
    v15 = v8;
    objc_msgSend(v14, "residentDeviceManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "residentDevices");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v41, "count"))
    {
      v17 = objc_msgSend(v16, "isCurrentDeviceConfirmedPrimaryResident");
      context = (void *)MEMORY[0x227676638]();
      v18 = v15;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);
      if (v17)
      {
        if (!v20)
        {
          v23 = 1;
          goto LABEL_19;
        }
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v21;
        v44 = 2112;
        v45 = v14;
        v22 = "%{public}@Allowing cloud operations, current device is the primary resident for home: %@";
        v23 = 1;
        goto LABEL_14;
      }
      if (v20)
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v34;
        v44 = 2112;
        v45 = v14;
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, "%{public}@Denying cloud operations, current device is not the primary resident for home: %@", buf, 0x16u);

      }
      v23 = 0;
    }
    else
    {
      context = (void *)MEMORY[0x227676638]();
      v33 = v15;
      HMFGetOSLogHandle();
      v19 = objc_claimAutoreleasedReturnValue();
      v23 = 1;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v43 = v21;
        v44 = 2112;
        v45 = v14;
        v22 = "%{public}@Allowing cloud operations, no residents for home: %@";
LABEL_14:
        _os_log_impl(&dword_2218F0000, v19, OS_LOG_TYPE_INFO, v22, buf, 0x16u);

      }
    }
LABEL_19:

    objc_autoreleasePoolPop(context);
    if (v23 || !v39)
      goto LABEL_27;
    objc_msgSend(v14, "residentDeviceManager");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "primaryResidentDevice");
    v36 = (void *)objc_claimAutoreleasedReturnValue();

    if (v36)
    {
      v23 = 0;
LABEL_27:

      goto LABEL_28;
    }
    v28 = (void *)MEMORY[0x227676638]();
    v37 = v15;
    HMFGetOSLogHandle();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v43 = v31;
      v44 = 2112;
      v45 = v9;
      v32 = "%{public}@Actually allowing cloud transform for import because the primary resident is unknown for modelID: %@";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v24 = (void *)MEMORY[0x227676638]();
  v25 = v8;
  HMFGetOSLogHandle();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v43 = v27;
    _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_INFO, "%{public}@Allowing cloud transform, no home manager", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v24);
  v23 = 1;
LABEL_28:

  return v23;
}

- (void)removeCurrentAccessorySetupMetricDispatcherIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  HMDMainDriver *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  HMDMainDriver *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  -[HMDMainDriver homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAccessorySetupMetricDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing current accessory setup metric dispatcher from home manager", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v5);
    -[HMDMainDriver homeManager](v6, "homeManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setCurrentAccessorySetupMetricDispatcher:", 0);

  }
  -[HMDMainDriver currentAccessorySetupMetricDispatcher](self, "currentAccessorySetupMetricDispatcher");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing current accessory setup metric dispatcher from main driver", (uint8_t *)&v15, 0xCu);

    }
    objc_autoreleasePoolPop(v11);
    -[HMDMainDriver setCurrentAccessorySetupMetricDispatcher:](v12, "setCurrentAccessorySetupMetricDispatcher:", 0);
  }
}

- (id)currentWiFiNetworkInfo
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BE3F2B8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MACAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentNetworkSSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentNetworkAssociation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x24BE3F2C0]);
  objc_msgSend(v5, "BSSID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formattedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gatewayIPAddress");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "gatewayMACAddress");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "formattedString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v6, "initWithMACAddress:SSID:BSSID:gatewayIPAddress:gatewayMACAddress:", v3, v4, v8, v9, v11);

  return v12;
}

- (id)currentWiFiNetworkRSSI
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE3F2B8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentNetworkRSSI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)fetchNearbyAccessoriesNotOnCurrentNetworkWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  -[HMDMainDriver homeManager](self, "homeManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMainDriver currentWiFiNetworkInfo](self, "currentWiFiNetworkInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __80__HMDMainDriver_fetchNearbyAccessoriesNotOnCurrentNetworkWithCompletionHandler___block_invoke;
  v8[3] = &unk_24E793210;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "findAccessoriesNotOnWiFiWithCurrentWiFi:completionHandler:", v6, v8);

}

- (HMDCoreData)coreData
{
  return self->_coreData;
}

- (void)setCoreData:(id)a3
{
  objc_storeStrong((id *)&self->_coreData, a3);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (HMDAccessoryBrowser)accessoryBrowser
{
  return self->_accessoryBrowser;
}

- (void)setAccessoryBrowser:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryBrowser, a3);
}

- (HMDRetailDemoModeRequestHandler)retailDemoModeRequestHandler
{
  return self->_retailDemoModeRequestHandler;
}

- (void)setRetailDemoModeRequestHandler:(id)a3
{
  objc_storeStrong((id *)&self->_retailDemoModeRequestHandler, a3);
}

- (HMDMetricsManager)metricsManager
{
  return self->_metricsManager;
}

- (void)setMetricsManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricsManager, a3);
}

- (HMDAppleMediaAccessoryDiagnosticInfoController)appleMediaAccessoryDiagnosticInfoController
{
  return self->_appleMediaAccessoryDiagnosticInfoController;
}

- (void)setAppleMediaAccessoryDiagnosticInfoController:(id)a3
{
  objc_storeStrong((id *)&self->_appleMediaAccessoryDiagnosticInfoController, a3);
}

- (HMDHomeManager)homeManager
{
  return self->_homeManager;
}

- (void)setHomeManager:(id)a3
{
  objc_storeStrong((id *)&self->_homeManager, a3);
}

- (HMDDeviceSetupConfiguringController)configuringStateController
{
  return self->_configuringStateController;
}

- (void)setConfiguringStateController:(id)a3
{
  objc_storeStrong((id *)&self->_configuringStateController, a3);
}

- (HMDCurrentAccessorySetupMetricDispatcher)currentAccessorySetupMetricDispatcher
{
  return self->_currentAccessorySetupMetricDispatcher;
}

- (void)setCurrentAccessorySetupMetricDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_currentAccessorySetupMetricDispatcher, a3);
}

- (HMDSymptomManager)symptomManager
{
  return self->_symptomManager;
}

- (void)setSymptomManager:(id)a3
{
  objc_storeStrong((id *)&self->_symptomManager, a3);
}

- (HMDNetworkInfoController)networkInfoController
{
  return self->_networkInfoController;
}

- (void)setNetworkInfoController:(id)a3
{
  objc_storeStrong((id *)&self->_networkInfoController, a3);
}

- (id)discoveryController
{
  return self->_discoveryController;
}

- (void)setDiscoveryController:(id)a3
{
  objc_storeStrong(&self->_discoveryController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_discoveryController, 0);
  objc_storeStrong((id *)&self->_networkInfoController, 0);
  objc_storeStrong((id *)&self->_symptomManager, 0);
  objc_storeStrong((id *)&self->_currentAccessorySetupMetricDispatcher, 0);
  objc_storeStrong((id *)&self->_configuringStateController, 0);
  objc_storeStrong((id *)&self->_homeManager, 0);
  objc_storeStrong((id *)&self->_appleMediaAccessoryDiagnosticInfoController, 0);
  objc_storeStrong((id *)&self->_metricsManager, 0);
  objc_storeStrong((id *)&self->_retailDemoModeRequestHandler, 0);
  objc_storeStrong((id *)&self->_accessoryBrowser, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_coreData, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __80__HMDMainDriver_fetchNearbyAccessoriesNotOnCurrentNetworkWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x227676638]();
  v5 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v7;
    v10 = 2112;
    v11 = v3;
    _os_log_impl(&dword_2218F0000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@wifi mismatch accessories %@", (uint8_t *)&v8, 0x16u);

  }
  objc_autoreleasePoolPop(v4);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __36__HMDMainDriver_relaunchAfterDelay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relaunchHomed");
}

uint64_t __25__HMDMainDriver_relaunch__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "relaunchHomed");
}

uint64_t __22__HMDMainDriver_start__block_invoke_108(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  result = MKBDeviceUnlockedSinceBoot();
  if ((_DWORD)result)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_BYTE *)(v5 + 24))
    {
      *(_BYTE *)(v5 + 24) = 1;
      v6 = (void *)MEMORY[0x227676638]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_INFO, "%{public}@Notified that device has been unlocked for the first time", (uint8_t *)&v10, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(*(id *)(a1 + 32), "start");
      return notify_cancel(a2);
    }
  }
  return result;
}

void __22__HMDMainDriver_start__block_invoke_225(uint64_t a1)
{
  id v2;
  int8x16_t v3;
  _QWORD block[4];
  int8x16_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "markWithReason:", CFSTR("Started Home Manager"));
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __22__HMDMainDriver_start__block_invoke_2_228;
  block[3] = &unk_24E7771D8;
  v11 = *(_QWORD *)(a1 + 88);
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 80);
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __22__HMDMainDriver_start__block_invoke_2_228(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
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
  uint64_t v33;
  double v34;
  double v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  HMDXPCTransportStartedLogEvent *v63;
  void *v64;
  void *v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  id v71;
  NSObject *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  _QWORD v82[5];
  id v83;
  uint64_t v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  const __CFString *v88;
  uint8_t buf[4];
  void *v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  const __CFString *v94;
  __int16 v95;
  const __CFString *v96;
  __int16 v97;
  const __CFString *v98;
  __int16 v99;
  const __CFString *v100;
  __int16 v101;
  void *v102;
  uint64_t v103;

  v103 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 0x24BDD1000;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%.3f"), v8 - *(double *)(a1 + 88));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v90 = v6;
    v91 = 2114;
    v92 = CFSTR("mainDriverStart");
    v93 = 2112;
    v94 = CFSTR("Home manager started. Configuring ...");
    v95 = 2114;
    v96 = CFSTR("state");
    v97 = 2112;
    v98 = CFSTR("mainDriverStartedHomeManager");
    v99 = 2114;
    v100 = CFSTR("duration");
    v101 = 2112;
    v102 = v9;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    v5 = 0x24BDD1000uLL;
  }

  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v12 = *(void **)(v5 + 1992);
  HMFUptime();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%.3f"), v13 - *(double *)(a1 + 88));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HMDTaggedLoggingCreateDictionary();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithTag:data:", CFSTR("mainDriverStart"), v15, CFSTR("state"), CFSTR("mainDriverStartedHomeManager"), CFSTR("duration"), v14);
  objc_msgSend(*(id *)(a1 + 40), "tagProcessorList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitTaggedEvent:processorList:", v16, v17);

  v18 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "configureHomeManager:", v19);

  v20 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "cloudDataSyncStateFilter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "configureWithCloudDataSyncStateFilter:homeMembershipVerifier:", v22, v23);

  v24 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "userDeviceCapabilitiesRequestManager");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configureWithUserDeviceCapabilitiesRequestManager:deviceResidencyProvider:remoteMessageListener:", v26, v27, v28);

  objc_msgSend(*(id *)(a1 + 32), "accessoryBrowser");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "configureWithHomeManager:", v30);

  v31 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "configureWithHomeManager:", v32);

  objc_msgSend(*(id *)(a1 + 64), "refreshHomeBadgeNumber");
  v33 = HMFUptime();
  v35 = v34;
  v36 = (void *)MEMORY[0x227676638](v33);
  v37 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v38 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v90 = v39;
    v91 = 2114;
    v92 = CFSTR("mainDriverStart");
    v93 = 2112;
    v94 = CFSTR("Starting XPC message transport");
    v95 = 2114;
    v96 = CFSTR("state");
    v97 = 2112;
    v98 = CFSTR("mainDriverStartXPCTransport");
    _os_log_impl(&dword_2218F0000, v38, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v36);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v87 = CFSTR("state");
  v88 = CFSTR("mainDriverStartXPCTransport");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v88, &v87, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = (void *)objc_msgSend(v41, "initWithTag:data:", CFSTR("mainDriverStart"), v42);
  objc_msgSend(*(id *)(a1 + 40), "tagProcessorList");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "submitTaggedEvent:processorList:", v43, v44);

  objc_msgSend(*(id *)(a1 + 72), "start");
  +[HMDXPCMessageTransport accessorySetupTransport](HMDXPCMessageTransport, "accessorySetupTransport");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "start");

  v46 = (void *)MEMORY[0x227676638]();
  v47 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v48 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v50, "stringWithFormat:", CFSTR("%.3f"), v51 - v35);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v90 = v49;
    v91 = 2114;
    v92 = CFSTR("mainDriverStart");
    v93 = 2112;
    v94 = CFSTR("Started XPC message transport");
    v95 = 2114;
    v96 = CFSTR("state");
    v97 = 2112;
    v98 = CFSTR("mainDriverStartXPCTransportDone");
    v99 = 2114;
    v100 = CFSTR("duration");
    v101 = 2112;
    v102 = v52;
    _os_log_impl(&dword_2218F0000, v48, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v46);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v55 = (void *)MEMORY[0x24BDD17C8];
  HMFUptime();
  objc_msgSend(v55, "stringWithFormat:", CFSTR("%.3f"), v56 - v35);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  HMDTaggedLoggingCreateDictionary();
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = (void *)objc_msgSend(v54, "initWithTag:data:", CFSTR("mainDriverStart"), v58, CFSTR("state"), CFSTR("mainDriverStartXPCTransportDone"), CFSTR("duration"), v57);
  objc_msgSend(*(id *)(a1 + 40), "tagProcessorList");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "submitTaggedEvent:processorList:", v59, v60);

  objc_msgSend(*(id *)(a1 + 32), "metricsManager");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "logEventSubmitter");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = objc_alloc_init(HMDXPCTransportStartedLogEvent);
  objc_msgSend(v62, "submitLogEvent:", v63);

  objc_msgSend(MEMORY[0x24BE3F1A8], "memoryMonitor");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v64, "start");

  objc_msgSend(*(id *)(a1 + 80), "start");
  +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "configureWithHomeManager:", v66);

  v67 = HMFUptime();
  v69 = v68;
  v70 = (void *)MEMORY[0x227676638](v67);
  v71 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v72 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v90 = v73;
    v91 = 2114;
    v92 = CFSTR("mainDriverStart");
    v93 = 2112;
    v94 = CFSTR("Starting remote message transports");
    v95 = 2114;
    v96 = CFSTR("state");
    v97 = 2112;
    v98 = CFSTR("mainDriverStartRemoteTransports");
    _os_log_impl(&dword_2218F0000, v72, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v70);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v85 = CFSTR("state");
  v86 = CFSTR("mainDriverStartRemoteTransports");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v86, &v85, 1);
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  v77 = (void *)objc_msgSend(v75, "initWithTag:data:", CFSTR("mainDriverStart"), v76);
  objc_msgSend(*(id *)(a1 + 40), "tagProcessorList");
  v78 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v74, "submitTaggedEvent:processorList:", v77, v78);

  objc_msgSend(*(id *)(a1 + 56), "start");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  v82[0] = MEMORY[0x24BDAC760];
  v82[1] = 3221225472;
  v82[2] = __22__HMDMainDriver_start__block_invoke_239;
  v82[3] = &unk_24E7750A8;
  v80 = *(void **)(a1 + 40);
  v82[4] = *(_QWORD *)(a1 + 32);
  v84 = v69;
  v83 = v80;
  v81 = (id)objc_msgSend(v79, "then:", v82);

}

uint64_t __22__HMDMainDriver_start__block_invoke_239(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  const __CFString *v23;
  __int16 v24;
  const __CFString *v25;
  __int16 v26;
  const __CFString *v27;
  __int16 v28;
  const __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v19 = a2;
  v3 = (void *)MEMORY[0x227676638]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDD17C8];
    HMFUptime();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%.3f"), v8 - *(double *)(a1 + 48));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v21 = v6;
    v22 = 2114;
    v23 = CFSTR("mainDriverStarted");
    v24 = 2112;
    v25 = CFSTR("Started remote message transports. Started homed.");
    v26 = 2114;
    v27 = CFSTR("state");
    v28 = 2112;
    v29 = CFSTR("end");
    v30 = 2114;
    v31 = CFSTR("duration");
    v32 = 2112;
    v33 = v9;
    _os_log_impl(&dword_2218F0000, v5, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x24BE4F1C0], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x24BE4F1D0]);
  v12 = (void *)MEMORY[0x24BDD17C8];
  HMFUptime();
  objc_msgSend(v12, "stringWithFormat:", CFSTR("%.3f"), v13 - *(double *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  HMDTaggedLoggingCreateDictionary();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v11, "initWithTag:data:", CFSTR("mainDriverStarted"), v15, CFSTR("state"), CFSTR("end"), CFSTR("duration"), v14);
  objc_msgSend(*(id *)(a1 + 40), "tagProcessorList");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "submitTaggedEvent:processorList:", v16, v17);

  objc_msgSend(*(id *)(a1 + 40), "invalidate");
  return 1;
}

void __22__HMDMainDriver_start__block_invoke_2(uint64_t a1, void *a2)
{
  const char *string;
  void *v3;
  void *v4;
  _BOOL4 v5;
  xpc_object_t reply;
  xpc_object_t xdict;

  xdict = a2;
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF50]);
  v3 = xdict;
  if (string)
  {
    if (!strcmp(string, "com.apple.home.messaging"))
    {
      +[HMDRapportMessaging sharedInstance](HMDRapportMessaging, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configureDiscoveryClientWithCompletion:", 0);

    }
    v5 = xpc_dictionary_get_BOOL(xdict, "replyRequired");
    v3 = xdict;
    if (v5)
    {
      reply = xpc_dictionary_create_reply(xdict);
      if (reply)
        xpc_dictionary_send_reply();

      v3 = xdict;
    }
  }

}

void __30__HMDMainDriver_localeChanged__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)MEMORY[0x227676638]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_2218F0000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Locale changed - clearing followup items before restarting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  +[HMDDeviceSetupManager sharedManager](HMDDeviceSetupManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "followUpManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __30__HMDMainDriver_localeChanged__block_invoke_74;
  v8[3] = &unk_24E79B328;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v7, "removeAllFollowUpItemsWithCompletion:", v8);

}

void __30__HMDMainDriver_localeChanged__block_invoke_74(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Locale changed - restarting", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "relaunch");

}

+ (id)driver
{
  if (driver_onceToken != -1)
    dispatch_once(&driver_onceToken, &__block_literal_global_8873);
  return (id)driver_singletonDriver;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t50 != -1)
    dispatch_once(&logCategory__hmf_once_t50, &__block_literal_global_245);
  return (id)logCategory__hmf_once_v51;
}

void __28__HMDMainDriver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v51;
  logCategory__hmf_once_v51 = v0;

}

void __23__HMDMainDriver_driver__block_invoke()
{
  HMDMainDriver *v0;
  void *v1;

  v0 = objc_alloc_init(HMDMainDriver);
  v1 = (void *)driver_singletonDriver;
  driver_singletonDriver = (uint64_t)v0;

}

- (void)createCurrentAccessorySetupMetricDispatcherForSession:(id)a3
{
  id v4;
  void *v5;
  HMDMainDriver *v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = self;
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543618;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating current accessory setup metric dispatcher for session: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[HMDHomePodSetupLatencyLogEvent initLogEventWithInitialState:]([HMDHomePodSetupLatencyLogEvent alloc], "initLogEventWithInitialState:", 0);
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDMetricsManager sharedLogEventSubmitter](HMDMetricsManager, "sharedLogEventSubmitter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDMainDriver _createCurrentAccessorySetupMetricDispatcher:setupLogEvent:logEventSubmitter:](v6, "_createCurrentAccessorySetupMetricDispatcher:setupLogEvent:logEventSubmitter:", v10, v9, v11);

}

- (void)createCurrentAccessorySetupMetricDispatcherOnHomedBoot:(id)a3 logEventSubmitter:(id)a4
{
  -[HMDMainDriver createCurrentAccessorySetupMetricDispatcherOnHomedBoot:logEventSubmitter:setupLogEventFactory:](self, "createCurrentAccessorySetupMetricDispatcherOnHomedBoot:logEventSubmitter:setupLogEventFactory:", a3, a4, 0);
}

- (void)createCurrentAccessorySetupMetricDispatcherOnHomedBoot:(id)a3 logEventSubmitter:(id)a4 setupLogEventFactory:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  HMDMainDriver *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
    (*((void (**)(id))v10 + 2))(v10);
  else
    +[HMDCurrentAccessorySetupMetricDispatcher readSetupLogEventFromUserDefaults:](HMDCurrentAccessorySetupMetricDispatcher, "readSetupLogEventFromUserDefaults:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "coreAnalyticsEventDictionary");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v12, "savedEventState");
      v20 = CFSTR("HH1Initial");
      v21 = CFSTR("Submitted");
      v22 = CFSTR("Unknown");
      if (v19 != 0x10000)
        v22 = CFSTR("HH1Initial");
      if (v19 != 3)
        v21 = v22;
      if (v19 == 2)
        v20 = CFSTR("HH2Initial");
      if (v19 == 1)
        v20 = CFSTR("HH2SentinelFetched");
      if (v19 > 2)
        v20 = (__CFString *)v21;
      v23 = v20;
      v26 = 138543874;
      v27 = v17;
      v28 = 2112;
      v29 = v18;
      v30 = 2112;
      v31 = v23;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Loading saved log event: %@ with event state: %@", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    switch(objc_msgSend(v12, "savedEventState"))
    {
      case 0:
      case 2:
        objc_msgSend(v12, "setSavedEventState:", 3);
        +[HMDCurrentAccessorySetupMetricDispatcher saveSetupLogEventIntoUserDefaults:setupLogEvent:](HMDCurrentAccessorySetupMetricDispatcher, "saveSetupLogEventIntoUserDefaults:setupLogEvent:", v8, v12);
        objc_msgSend(MEMORY[0x24BDD1540], "hmInternalErrorWithCode:", 3400);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "submitLogEvent:error:", v12, v24);
        -[HMDMainDriver removeCurrentAccessorySetupMetricDispatcherIfNeeded](v14, "removeCurrentAccessorySetupMetricDispatcherIfNeeded");

        break;
      case 1:
        -[HMDMainDriver _createCurrentAccessorySetupMetricDispatcher:setupLogEvent:logEventSubmitter:](v14, "_createCurrentAccessorySetupMetricDispatcher:setupLogEvent:logEventSubmitter:", v8, v12, v9);
        break;
      case 3:
        +[HMDCurrentAccessorySetupMetricDispatcher removeLastAccessorySetupInfoFromUserDefaults:](HMDCurrentAccessorySetupMetricDispatcher, "removeLastAccessorySetupInfoFromUserDefaults:", v8);
        -[HMDMainDriver removeCurrentAccessorySetupMetricDispatcherIfNeeded](v14, "removeCurrentAccessorySetupMetricDispatcherIfNeeded");
        break;
      default:
        break;
    }
  }
  else
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138543362;
      v27 = v25;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@No saved log event saved before", (uint8_t *)&v26, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

- (void)_createCurrentAccessorySetupMetricDispatcher:(id)a3 setupLogEvent:(id)a4 logEventSubmitter:(id)a5
{
  id v8;
  id v9;
  id v10;
  HMDCurrentAccessorySetupMetricDispatcher *v11;
  void *v12;
  void *v13;
  HMDMainDriver *v14;
  NSObject *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HMDCurrentAccessorySetupMetricDispatcher initWithDataSource:setupLogEvent:logEventSubmitter:]([HMDCurrentAccessorySetupMetricDispatcher alloc], "initWithDataSource:setupLogEvent:logEventSubmitter:", self, v9, v10);
  -[HMDMainDriver setCurrentAccessorySetupMetricDispatcher:](self, "setCurrentAccessorySetupMetricDispatcher:", v11);

  -[HMDMainDriver homeManager](self, "homeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x227676638]();
  v14 = self;
  HMFGetOSLogHandle();
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
  if (v12)
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v17;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Setting current accessory metric dispatcher for home manager", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
    -[HMDMainDriver currentAccessorySetupMetricDispatcher](v14, "currentAccessorySetupMetricDispatcher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDMainDriver homeManager](v14, "homeManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setCurrentAccessorySetupMetricDispatcher:", v18);

  }
  else
  {
    if (v16)
    {
      HMFGetLogIdentifier();
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 138543362;
      v22 = v20;
      _os_log_impl(&dword_2218F0000, v15, OS_LOG_TYPE_INFO, "%{public}@Home manager is not created yet", (uint8_t *)&v21, 0xCu);

    }
    objc_autoreleasePoolPop(v13);
  }

}

+ (id)loadHomeDataFromLocalStore:(id *)a3 decryptionFailed:(BOOL *)a4
{
  return (id)objc_msgSend((id)objc_opt_class(), "loadHomeDataFromLocalStore:fromLocation:decryptionFailed:forHH2Migration:", a3, 0, a4, 0);
}

+ (id)loadHomeDataFromLocalStore:(id *)a3 fromLocation:(id)a4 decryptionFailed:(BOOL *)a5 forHH2Migration:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  id v23;
  id v25;
  id v26;
  BOOL v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v6 = a6;
  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a4;
  if (!a3)
    _HMFPreconditionFailure();
  v11 = v10;
  v27 = 0;
  if ((retailDemoDataEncoded & 1) != 0)
  {
    v12 = 0;
  }
  else
  {
    v26 = 0;
    objc_msgSend((id)objc_opt_class(), "loadSQLArchiveWithDecryptionFail:fromLocation:forHH2Migration:error:", &v27, v10, v6, &v26);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = v26;
    if (v13)
    {
      v14 = v13;
      v15 = (void *)MEMORY[0x227676638]();
      v16 = a1;
      HMFGetOSLogHandle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v29 = v18;
        v30 = 2112;
        v31 = v14;
        _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to load the home data from SQL : %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v15);
      goto LABEL_14;
    }
    if (v27)
    {
LABEL_13:
      v12 = objc_retainAutorelease(v12);
      v14 = 0;
      *a3 = v12;
      goto LABEL_14;
    }
  }
  if (v12)
    goto LABEL_13;
  v19 = (void *)MEMORY[0x227676638]();
  v20 = a1;
  HMFGetOSLogHandle();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v29 = v22;
    v30 = 2112;
    v31 = v11;
    _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_INFO, "%{public}@Since we could not load the keyed archive from SQL table we are going to load it from location: %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v19);
  v25 = 0;
  +[HMDPersistentStore unarchiveHomeData:decryptionFailed:fromLocation:successfulKeyUserName:forHH2Migration:](HMDPersistentStore, "unarchiveHomeData:decryptionFailed:fromLocation:successfulKeyUserName:forHH2Migration:", &v25, &v27, v11, 0, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v25;
  if (!v14)
    goto LABEL_13;
LABEL_14:
  if (a5)
    *a5 = v27;
  v23 = v14;

  return v23;
}

+ (id)loadHomeDataFromDemoModeStore:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  HMDMutableHomeData *v23;
  void *v24;
  id v25;
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  _QWORD v33[5];

  v33[4] = *MEMORY[0x24BDAC8D0];
  v5 = (void *)MEMORY[0x24BDBCE50];
  HMDHomeKitDaemonDemoModePersistencePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v5, "dataWithContentsOfURL:options:error:", v6, 0, &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;

  if (v8)
  {
    v9 = (void *)MEMORY[0x227676638]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v12;
      _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not read demo accessory data.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13 = v8;
  }
  else
  {
    v14 = (void *)MEMORY[0x24BDBCF20];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v33, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v16, v7, &v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;
    v18 = (void *)MEMORY[0x227676638]();
    v19 = a1;
    HMFGetOSLogHandle();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (v13 || !v17)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v24;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_ERROR, "%{public}@No demo accessory data.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v18);
      v25 = v13;
    }
    else
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v30 = v22;
        v31 = 2112;
        v32 = v17;
        _os_log_impl(&dword_2218F0000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Decoded demo accessories: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v18);
      v23 = objc_alloc_init(HMDMutableHomeData);
      -[HMDHomeData setDemoAccessories:](v23, "setDemoAccessories:", v17);
      *a3 = (id)-[HMDMutableHomeData copy](v23, "copy");

    }
  }

  return v13;
}

+ (id)loadSQLArchiveWithDecryptionFail:(BOOL *)a3 fromLocation:(id)a4 forHH2Migration:(BOOL)a5 error:(id *)a6
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  NSObject *v20;
  void *v21;
  int v22;
  unint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  _BOOL8 v31;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  void *v36;
  void *v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  int v42;
  id v43;
  void *v44;
  id v45;
  NSObject *v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  int v51;
  void *v52;
  id v53;
  NSObject *v54;
  void *v55;
  uint64_t v56;
  id v57;
  id v58;
  void *v60;
  id v63;
  id v64;
  id v65;
  id v66;
  uint8_t buf[4];
  void *v68;
  __int16 v69;
  id v70;
  uint64_t v71;

  v6 = a5;
  v71 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = a1;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v68 = v12;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@Loading Home data from table.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v9);
  objc_msgSend((id)objc_opt_class(), "getLocalStoreFrom:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0;
  v66 = 0;
  v64 = 0;
  v14 = objc_msgSend(v13, "_selectArchiveWithIdentifier:archive:controllerUserName:error:", CFSTR("homedata"), &v66, &v65, &v64);
  v15 = v66;
  v16 = v65;
  v17 = v64;

  v18 = (void *)MEMORY[0x227676638]();
  v19 = v10;
  HMFGetOSLogHandle();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v68 = v21;
    v69 = 2112;
    v70 = v16;
    _os_log_impl(&dword_2218F0000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@Controller user name : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v18);
  if (v15)
    v22 = v14;
  else
    v22 = 0;
  v23 = 0x24BE3F000;
  if (v22 == 1)
  {
    v60 = v15;
    v24 = (void *)MEMORY[0x227676638]();
    v25 = v19;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = v17;
      v29 = v16;
      v30 = v8;
      v31 = v6;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v60, "length"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v68 = v27;
      v69 = 2112;
      v70 = v32;
      _os_log_impl(&dword_2218F0000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded Home data from table size: %@", buf, 0x16u);

      v6 = v31;
      v8 = v30;
      v16 = v29;
      v17 = v28;

    }
    objc_autoreleasePoolPop(v24);
    v33 = (void *)MEMORY[0x227676638]();
    v34 = v25;
    HMFGetOSLogHandle();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v36;
      _os_log_impl(&dword_2218F0000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@Found controller key for loaded home data", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v33);
    objc_msgSend(MEMORY[0x24BE1BC08], "systemStore");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "updateActiveControllerPairingIdentifier:", v16);

    v63 = 0;
    v15 = v60;
    +[HMDPersistentStore deserializeHomeData:usingLocalStorage:fromData:forHH2Migration:](HMDPersistentStore, "deserializeHomeData:usingLocalStorage:fromData:forHH2Migration:", &v63, 1, v60, v6);
    v38 = v63;
    if (v38)
    {
      v39 = v38;
      objc_msgSend(MEMORY[0x24BE3F248], "sharedPreferences");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "preferenceForKey:", CFSTR("CreateArchiveShadowCopy"));
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend(v41, "BOOLValue");

      if (v42 && isInternalBuild())
        v43 = +[HMDPersistentStore archiveHomeDataLegacy:toLocation:](HMDPersistentStore, "archiveHomeDataLegacy:toLocation:", v39, CFSTR("/tmp/legacyhomedatashadow.data"));
    }
    else
    {
      v44 = (void *)MEMORY[0x227676638]();
      v45 = v34;
      HMFGetOSLogHandle();
      v46 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v68 = v47;
        _os_log_impl(&dword_2218F0000, v46, OS_LOG_TYPE_ERROR, "%{public}@Have home archive in table but could not decrypt. Home archive is corrupt.", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v44);
      objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
      v48 = objc_claimAutoreleasedReturnValue();

      v39 = 0;
      *a3 = 1;
      v17 = (id)v48;
    }
    v23 = 0x24BE3F000uLL;
  }
  else
  {
    v39 = 0;
  }
  objc_msgSend(*(id *)(v23 + 584), "sharedPreferences");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "preferenceForKey:", CFSTR("ForceDecryptionFailed"));
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = objc_msgSend(v50, "BOOLValue");

  if (v51 && isInternalBuild())
  {
    v52 = (void *)MEMORY[0x227676638]();
    v53 = v19;
    HMFGetOSLogHandle();
    v54 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v68 = v55;
      _os_log_impl(&dword_2218F0000, v54, OS_LOG_TYPE_ERROR, "%{public}@Forcing decryption failed state due to preference.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v52);

    objc_msgSend(MEMORY[0x24BDD1540], "hmErrorWithCode:", 2);
    v56 = objc_claimAutoreleasedReturnValue();

    v39 = 0;
    *a3 = 1;
    v17 = (id)v56;
  }
  v57 = objc_retainAutorelease(v17);
  *a6 = v57;
  v58 = v39;

  return v58;
}

+ (id)getLocalStoreFrom:(id)a3
{
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  HMDBackingStoreLocal *v14;
  void *v15;
  id v16;
  NSObject *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (!v4)
  {
    v5 = (void *)MEMORY[0x227676638]();
    v6 = a1;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (id)sqlitePath;
      v20 = 138543618;
      v21 = v8;
      v22 = 2112;
      v23 = v9;
      _os_log_impl(&dword_2218F0000, v7, OS_LOG_TYPE_INFO, "%{public}@Going to use default location : %@", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v5);
    v4 = (id)sqlitePath;
  }
  v10 = (void *)MEMORY[0x227676638]();
  v11 = a1;
  HMFGetOSLogHandle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 138543618;
    v21 = v13;
    v22 = 2112;
    v23 = v4;
    _os_log_impl(&dword_2218F0000, v12, OS_LOG_TYPE_INFO, "%{public}@Using archive from %@", (uint8_t *)&v20, 0x16u);

  }
  objc_autoreleasePoolPop(v10);
  v14 = -[HMDBackingStoreLocal initWithDatastore:]([HMDBackingStoreLocal alloc], "initWithDatastore:", v4);
  if (!v14)
  {
    v15 = (void *)MEMORY[0x227676638]();
    v16 = v11;
    HMFGetOSLogHandle();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543618;
      v21 = v18;
      v22 = 2112;
      v23 = v4;
      _os_log_impl(&dword_2218F0000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to create our local storage from path [%@]", (uint8_t *)&v20, 0x16u);

    }
    objc_autoreleasePoolPop(v15);
  }

  return v14;
}

@end
