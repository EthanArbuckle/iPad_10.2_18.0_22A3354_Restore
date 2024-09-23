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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __30__HMDMainDriver_localeChanged__block_invoke;
  block[3] = &unk_1E89C2730;
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
  id *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  id *v28;
  NSObject *v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id *v37;
  NSObject *v38;
  id v39;
  void *v40;
  double v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  double v52;
  double v53;
  void *v54;
  id *v55;
  NSObject *v56;
  id v57;
  void *v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  id v64;
  void *v65;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v67;
  id *v68;
  NSObject *v69;
  id v70;
  void *v71;
  double v72;
  id v73;
  void *v74;
  id v75;
  void *v76;
  double v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  double v83;
  double v84;
  void *v85;
  id *v86;
  NSObject *v87;
  id v88;
  void *v89;
  id v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  id v95;
  void *v96;
  id *v97;
  NSObject *v98;
  id v99;
  void *v100;
  double v101;
  id v102;
  void *v103;
  id v104;
  void *v105;
  double v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  id *v112;
  NSObject *v113;
  id v114;
  id v115;
  uint64_t v116;
  double v117;
  double v118;
  void *v119;
  id *v120;
  NSObject *v121;
  id v122;
  void *v123;
  id v124;
  void *v125;
  void *v126;
  void *v127;
  id v128;
  HMDMetricsManager *v129;
  void *v130;
  HMDMetricsManager *v131;
  void *v132;
  void *v133;
  void *v134;
  HMDHelper *v135;
  HMDHelperExternalProtocolImpl *v136;
  void *v137;
  id *v138;
  NSObject *v139;
  id v140;
  void *v141;
  double v142;
  id v143;
  void *v144;
  id v145;
  void *v146;
  double v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  id v155;
  NSObject *v156;
  id v157;
  uint64_t v158;
  objc_class *v159;
  void *v160;
  uint64_t v161;
  double v162;
  double v163;
  void *v164;
  id v165;
  NSObject *v166;
  id v167;
  void *v168;
  id v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  id *v174;
  void *v175;
  id *v176;
  NSObject *v177;
  void *v178;
  id v179;
  void *v180;
  id v181;
  NSObject *v182;
  id v183;
  void *v184;
  double v185;
  id v186;
  void *v187;
  void *v188;
  void *v189;
  id v190;
  void *v191;
  double v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  id v200;
  NSObject *v201;
  id v202;
  void *v203;
  HMDDeviceSetupConfiguringController *v204;
  void *v205;
  HMDNetworkInfoController *v206;
  void *v207;
  HMDSymptomManager *v208;
  void *v209;
  void *v210;
  int v211;
  void *v212;
  void *v213;
  uint64_t v214;
  void *v215;
  void *v216;
  void *v217;
  HMDDeviceAccountResolvedLogEvent *v218;
  void *v219;
  HMDUserManagementOperationManager *v220;
  void *v221;
  HMDUserManagementOperationManager *v222;
  HMDAccessoryBrowser *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  id v230;
  NSObject *v231;
  id v232;
  uint64_t v233;
  void *v234;
  id v235;
  NSObject *v236;
  id v237;
  id v238;
  uint64_t v239;
  void *v240;
  void *v241;
  int v242;
  void *v243;
  void *v244;
  id v245;
  NSObject *v246;
  id v247;
  char v248;
  void *v249;
  id v250;
  id v251;
  void *v252;
  void *v253;
  uint64_t v254;
  double v255;
  double v256;
  void *v257;
  id v258;
  NSObject *v259;
  id v260;
  void *v261;
  id v262;
  void *v263;
  void *v264;
  void *v265;
  HMDHomeManager *v266;
  void *v267;
  void *v268;
  _BOOL8 v269;
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  HMDHomeManager *v275;
  void *v276;
  id v277;
  NSObject *v278;
  id v279;
  void *v280;
  double v281;
  id v282;
  void *v283;
  id v284;
  void *v285;
  double v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  HMDIDSActivityMonitorHomeManagerDataSource *v291;
  void *v292;
  HMDIDSActivityMonitorHomeManagerDataSource *v293;
  int v294;
  int v295;
  void *v296;
  id v297;
  NSObject *v298;
  id v299;
  HMDRetailDemoModeRequestHandler *v300;
  void *v301;
  HMDRetailDemoModeRequestHandler *v302;
  void *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  id v308;
  NSObject *v309;
  id v310;
  void *v311;
  id v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  id v317;
  id v318;
  id v319;
  id v320;
  HMDIDSActivityMonitorHomeManagerDataSource *v321;
  void *v322;
  void *v323;
  void *v324;
  HMDTransactionArchiveReplayLogEvent *v325;
  void *v326;
  HMDHelper *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  int v332;
  HMDDiscoveryController *v333;
  HMDLaunchEvent *v334;
  void *context;
  void *contexta;
  void *v337;
  id v338;
  void *v339;
  _QWORD v340[4];
  id v341;
  id v342;
  id v343;
  id v344;
  id v345;
  id v346;
  HMDIDSActivityMonitorHomeManagerDataSource *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  _QWORD handler[6];
  int out_token;
  const __CFString *v353;
  const __CFString *v354;
  const __CFString *v355;
  const __CFString *v356;
  _BYTE buf[24];
  const __CFString *v358;
  _BYTE v359[10];
  __int16 v360;
  const __CFString *v361;
  __int16 v362;
  const __CFString *v363;
  __int16 v364;
  id v365;
  __int16 v366;
  const __CFString *v367;
  __int16 v368;
  id v369;
  __int16 v370;
  const __CFString *v371;
  __int16 v372;
  void *v373;
  const __CFString *v374;
  const __CFString *v375;
  const __CFString *v376;
  const __CFString *v377;
  const __CFString *v378;
  const __CFString *v379;
  uint8_t v380[4];
  void *v381;
  const __CFString *v382;
  const __CFString *v383;
  const __CFString *v384;
  _QWORD v385[4];

  v385[1] = *MEMORY[0x1E0C80C00];
  v339 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D28540]), "initWithName:parent:options:", CFSTR("HMDMainDriver.start"), 0, 1);
  if (isFirstLaunchAfterBoot_onceToken != -1)
    dispatch_once(&isFirstLaunchAfterBoot_onceToken, &__block_literal_global_709);
  v334 = -[HMDLaunchEvent initWithFirstLaunchAfterBoot:]([HMDLaunchEvent alloc], "initWithFirstLaunchAfterBoot:", isFirstLaunchAfterBoot_firstLaunchAfterBoot);
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = self;
  HMFGetOSLogHandle();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v6 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v6;
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@homed launched with ROAR Disabled", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v3);
  v7 = (void *)MEMORY[0x1D17BA0A0]();
  v8 = v4;
  HMFGetOSLogHandle();
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v11 = (id)objc_claimAutoreleasedReturnValue();
    HMFBooleanToString();
    v12 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138545410;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
    *(_WORD *)&buf[22] = 2112;
    v358 = CFSTR("Starting homed");
    *(_WORD *)v359 = 2114;
    *(_QWORD *)&v359[2] = CFSTR("state");
    v360 = 2112;
    v361 = CFSTR("start");
    v362 = 2114;
    v363 = CFSTR("isHH2");
    v364 = 2112;
    v365 = v11;
    v366 = 2114;
    v367 = CFSTR("isFirstLaunchAfterBoot");
    v368 = 2112;
    v369 = v12;
    _os_log_impl(&dword_1CD062000, v9, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x5Cu);

  }
  objc_autoreleasePoolPop(v7);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc(MEMORY[0x1E0D334C8]);
  HMFBooleanToString();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  HMFBooleanToString();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  HMDTaggedLoggingCreateDictionary();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v14, "initWithTag:data:", CFSTR("mainDriverStart"), v17, CFSTR("state"), CFSTR("start"), CFSTR("isHH2"), v15, CFSTR("isFirstLaunchAfterBoot"), v16);
  objc_msgSend(v339, "tagProcessorList");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "submitTaggedEvent:processorList:", v18, v19);

  v20 = v8[1];
  if (os_signpost_enabled(v20))
  {
    HMFBooleanToString();
    v21 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v21;
    _os_signpost_emit_with_name_impl(&dword_1CD062000, v20, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "MainDriverStart", "isRoarEnabled=%{signpost.description:attribute}@ ", buf, 0xCu);

  }
  signal(15, 0);
  v22 = isInternalBuild();
  if ((_DWORD)v22)
    v22 = +[HMDMemoryDiagnostic configureMemoryDiagnostic](HMDMemoryDiagnostic, "configureMemoryDiagnostic");
  v23 = (void *)MEMORY[0x1D17BA0A0](v22);
  v24 = HMFUptime();
  v26 = v25;
  v27 = (void *)MEMORY[0x1D17BA0A0](v24);
  v28 = v8;
  HMFGetOSLogHandle();
  v29 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v30 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v30;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
    *(_WORD *)&buf[22] = 2112;
    v358 = CFSTR("Config cleanup start");
    *(_WORD *)v359 = 2114;
    *(_QWORD *)&v359[2] = CFSTR("state");
    v360 = 2112;
    v361 = CFSTR("mainDriverConfigCleanup");
    _os_log_impl(&dword_1CD062000, v29, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v27);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_alloc(MEMORY[0x1E0D334C8]);
  v384 = CFSTR("state");
  v385[0] = CFSTR("mainDriverConfigCleanup");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v385, &v384, 1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = (void *)objc_msgSend(v32, "initWithTag:data:", CFSTR("mainDriverStart"), v33);
  objc_msgSend(v339, "tagProcessorList");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "submitTaggedEvent:processorList:", v34, v35);

  v36 = (void *)MEMORY[0x1D17BA0A0](+[HMDResetConfigPostCleanup performAnyPostCleanupStepsIfNecessary](HMDResetConfigPostCleanup, "performAnyPostCleanupStepsIfNecessary"));
  v37 = v28;
  HMFGetOSLogHandle();
  v38 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v40 = (void *)MEMORY[0x1E0CB3940];
    HMFUptime();
    objc_msgSend(v40, "stringWithFormat:", CFSTR("%.3f"), v41 - v26);
    v42 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    *(_QWORD *)&buf[4] = v39;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
    *(_WORD *)&buf[22] = 2112;
    v358 = CFSTR("Config cleanup done");
    *(_WORD *)v359 = 2114;
    *(_QWORD *)&v359[2] = CFSTR("state");
    v360 = 2112;
    v361 = CFSTR("mainDriverConfigCleanupDone");
    v362 = 2114;
    v363 = CFSTR("duration");
    v364 = 2112;
    v365 = v42;
    _os_log_impl(&dword_1CD062000, v38, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v36);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_alloc(MEMORY[0x1E0D334C8]);
  v45 = (void *)MEMORY[0x1E0CB3940];
  HMFUptime();
  objc_msgSend(v45, "stringWithFormat:", CFSTR("%.3f"), v46 - v26);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  HMDTaggedLoggingCreateDictionary();
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = (void *)objc_msgSend(v44, "initWithTag:data:", CFSTR("mainDriverStart"), v48, CFSTR("state"), CFSTR("mainDriverConfigCleanupDone"), CFSTR("duration"), v47);
  objc_msgSend(v339, "tagProcessorList");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "submitTaggedEvent:processorList:", v49, v50);

  objc_autoreleasePoolPop(v23);
  v51 = HMFUptime();
  v53 = v52;
  v54 = (void *)MEMORY[0x1D17BA0A0](v51);
  v55 = v37;
  HMFGetOSLogHandle();
  v56 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v57 = (id)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    *(_QWORD *)&buf[4] = v57;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
    *(_WORD *)&buf[22] = 2112;
    v358 = CFSTR("Initialize paths and utilities");
    *(_WORD *)v359 = 2114;
    *(_QWORD *)&v359[2] = CFSTR("state");
    v360 = 2112;
    v361 = CFSTR("mainDriverSetupPaths");
    _os_log_impl(&dword_1CD062000, v56, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v54);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_alloc(MEMORY[0x1E0D334C8]);
  v382 = CFSTR("state");
  v383 = CFSTR("mainDriverSetupPaths");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v383, &v382, 1);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v61 = (void *)objc_msgSend(v59, "initWithTag:data:", CFSTR("mainDriverStart"), v60);
  objc_msgSend(v339, "tagProcessorList");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "submitTaggedEvent:processorList:", v61, v62);

  v63 = MEMORY[0x1E0C80D38];
  v64 = MEMORY[0x1E0C80D38];
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v63, &__block_literal_global_98);

  xpc_set_event_stream_handler("com.apple.rapport.matching", MEMORY[0x1E0C80D38], &__block_literal_global_100);
  xpc_set_event_stream_handler("com.apple.passd.matching", MEMORY[0x1E0C80D38], &__block_literal_global_105);

  +[HMDBackgroundTaskManager sharedManager](HMDBackgroundTaskManager, "sharedManager");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "configure");

  if (MKBDeviceUnlockedSinceBoot())
  {
    objc_msgSend(MEMORY[0x1E0D28658], "setClassMappingForNSCoder");
    objc_msgSend(MEMORY[0x1E0D28678], "loadEnableMediaAccessoriesPreferences");
    if (+[HMDDeviceCapabilities supportsLocalization](HMDDeviceCapabilities, "supportsLocalization"))
    {
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)__languageChanged, CFSTR("AppleLanguagePreferencesChangedNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    if (initializePaths_onceToken != -1)
      dispatch_once(&initializePaths_onceToken, &__block_literal_global_49587);
    +[HMDDatabase registerQueries](HMDDatabase, "registerQueries");
    v67 = (void *)MEMORY[0x1D17BA0A0](+[HMDHomeData configureKeyedArchiverClassMappings](HMDHomeData, "configureKeyedArchiverClassMappings"));
    v68 = v55;
    HMFGetOSLogHandle();
    v69 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v70 = (id)objc_claimAutoreleasedReturnValue();
      v71 = (void *)MEMORY[0x1E0CB3940];
      HMFUptime();
      objc_msgSend(v71, "stringWithFormat:", CFSTR("%.3f"), v72 - v53);
      v73 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v70;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v358 = CFSTR("Initialized paths and utilities");
      *(_WORD *)v359 = 2114;
      *(_QWORD *)&v359[2] = CFSTR("state");
      v360 = 2112;
      v361 = CFSTR("mainDriverSetupPathsDone");
      v362 = 2114;
      v363 = CFSTR("duration");
      v364 = 2112;
      v365 = v73;
      _os_log_impl(&dword_1CD062000, v69, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v67);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = objc_alloc(MEMORY[0x1E0D334C8]);
    v76 = (void *)MEMORY[0x1E0CB3940];
    HMFUptime();
    objc_msgSend(v76, "stringWithFormat:", CFSTR("%.3f"), v77 - v53);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = (void *)objc_msgSend(v75, "initWithTag:data:", CFSTR("mainDriverStart"), v79, CFSTR("state"), CFSTR("mainDriverSetupPathsDone"), CFSTR("duration"), v78);
    objc_msgSend(v339, "tagProcessorList");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "submitTaggedEvent:processorList:", v80, v81);

    v82 = HMFUptime();
    v84 = v83;
    v85 = (void *)MEMORY[0x1D17BA0A0](v82);
    v86 = v68;
    HMFGetOSLogHandle();
    v87 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v88 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v88;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v358 = CFSTR("Init capabilities");
      *(_WORD *)v359 = 2114;
      *(_QWORD *)&v359[2] = CFSTR("state");
      v360 = 2112;
      v361 = CFSTR("mainDriverSetupCapabilities");
      _os_log_impl(&dword_1CD062000, v87, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v85);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v90 = objc_alloc(MEMORY[0x1E0D334C8]);
    v378 = CFSTR("state");
    v379 = CFSTR("mainDriverSetupCapabilities");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v379, &v378, 1);
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = (void *)objc_msgSend(v90, "initWithTag:data:", CFSTR("mainDriverStart"), v91);
    objc_msgSend(v339, "tagProcessorList");
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "submitTaggedEvent:processorList:", v92, v93);

    *(_QWORD *)buf = MEMORY[0x1E0C809B0];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __initializeCapabilitiesAndTimeouts_block_invoke;
    v358 = (const __CFString *)&unk_1E89C0870;
    *(_QWORD *)v359 = 0;
    if (initializeCapabilitiesAndTimeouts_onceToken == -1)
    {
      v94 = 0;
    }
    else
    {
      dispatch_once(&initializeCapabilitiesAndTimeouts_onceToken, buf);
      v94 = *(void **)v359;
    }

    initializeMappingsAndPaths();
    v95 = (id)HMCreateHomeKitCacheDirectory();
    v96 = (void *)MEMORY[0x1D17BA0A0](v95);
    v97 = v86;
    HMFGetOSLogHandle();
    v98 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v99 = (id)objc_claimAutoreleasedReturnValue();
      v100 = (void *)MEMORY[0x1E0CB3940];
      HMFUptime();
      objc_msgSend(v100, "stringWithFormat:", CFSTR("%.3f"), v101 - v84);
      v102 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v99;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v358 = CFSTR("Init capabilities done");
      *(_WORD *)v359 = 2114;
      *(_QWORD *)&v359[2] = CFSTR("state");
      v360 = 2112;
      v361 = CFSTR("mainDriverSetupCapabilitiesDone");
      v362 = 2114;
      v363 = CFSTR("duration");
      v364 = 2112;
      v365 = v102;
      _os_log_impl(&dword_1CD062000, v98, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v96);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    v104 = objc_alloc(MEMORY[0x1E0D334C8]);
    v105 = (void *)MEMORY[0x1E0CB3940];
    HMFUptime();
    objc_msgSend(v105, "stringWithFormat:", CFSTR("%.3f"), v106 - v84);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = (void *)objc_msgSend(v104, "initWithTag:data:", CFSTR("mainDriverStart"), v108, CFSTR("state"), CFSTR("mainDriverSetupCapabilitiesDone"), CFSTR("duration"), v107);
    objc_msgSend(v339, "tagProcessorList");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "submitTaggedEvent:processorList:", v109, v110);

    v111 = (void *)MEMORY[0x1D17BA0A0]();
    v112 = v97;
    HMFGetOSLogHandle();
    v113 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v114 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
      v115 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v114;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v115;
      _os_log_impl(&dword_1CD062000, v113, OS_LOG_TYPE_DEBUG, "%{public}@Preferences: %@", buf, 0x16u);

    }
    objc_autoreleasePoolPop(v111);
    v116 = HMFUptime();
    v118 = v117;
    v119 = (void *)MEMORY[0x1D17BA0A0](v116);
    v120 = v112;
    HMFGetOSLogHandle();
    v121 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v122 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v122;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v358 = CFSTR("Init accounts and transports");
      *(_WORD *)v359 = 2114;
      *(_QWORD *)&v359[2] = CFSTR("state");
      v360 = 2112;
      v361 = CFSTR("mainDriverSetupAccountManagers");
      _os_log_impl(&dword_1CD062000, v121, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v119);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_alloc(MEMORY[0x1E0D334C8]);
    v376 = CFSTR("state");
    v377 = CFSTR("mainDriverSetupAccountManagers");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v377, &v376, 1);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = (void *)objc_msgSend(v124, "initWithTag:data:", CFSTR("mainDriverStart"), v125);
    objc_msgSend(v339, "tagProcessorList");
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v123, "submitTaggedEvent:processorList:", v126, v127);

    +[HMDIDSServiceManager sharedManager](HMDIDSServiceManager, "sharedManager");
    v326 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAppleAccountManager sharedManager](HMDAppleAccountManager, "sharedManager");
    v329 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
    +[HMDAccountRegistry sharedRegistry](HMDAccountRegistry, "sharedRegistry");
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v339, "markWithReason:", CFSTR("Creating Message Transports"));
    +[HMDXPCMessageTransport defaultTransport](HMDXPCMessageTransport, "defaultTransport");
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDSecureRemoteMessageTransport defaultTransport](HMDSecureRemoteMessageTransport, "defaultTransport");
    v322 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDMessageDispatcher defaultDispatcher](HMDMessageDispatcher, "defaultDispatcher");
    v337 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBulletinBoard sharedBulletinBoard](HMDBulletinBoard, "sharedBulletinBoard");
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v339, "markWithReason:", CFSTR("Initialize Metrics Manager"));
    v129 = [HMDMetricsManager alloc];
    objc_msgSend(v328, "notificationCenterSettingsProvider");
    v130 = (void *)objc_claimAutoreleasedReturnValue();
    v131 = -[HMDMetricsManager initWithMessageDispatcher:accountManager:notificationSettingsProvider:](v129, "initWithMessageDispatcher:accountManager:notificationSettingsProvider:", v337, v329, v130);
    objc_msgSend(v120, "setMetricsManager:", v131);

    objc_msgSend(v120, "metricsManager");
    v132 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v132, "startMetricsCollection");

    objc_msgSend(v120, "metricsManager");
    v133 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v133, "logEventSubmitter");
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v134, "submitLogEvent:", v334);

    v135 = [HMDHelper alloc];
    v136 = objc_alloc_init(HMDHelperExternalProtocolImpl);
    v327 = -[HMDHelper initWithExternalProtocol:](v135, "initWithExternalProtocol:", v136);

    v137 = (void *)MEMORY[0x1D17BA0A0](+[HMDHelper setSharedHelper:](HMDHelper, "setSharedHelper:", v327));
    v138 = v120;
    HMFGetOSLogHandle();
    v139 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v140 = (id)objc_claimAutoreleasedReturnValue();
      v141 = (void *)MEMORY[0x1E0CB3940];
      HMFUptime();
      objc_msgSend(v141, "stringWithFormat:", CFSTR("%.3f"), v142 - v118);
      v143 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v140;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v358 = CFSTR("Init accounts and transports done");
      *(_WORD *)v359 = 2114;
      *(_QWORD *)&v359[2] = CFSTR("state");
      v360 = 2112;
      v361 = CFSTR("mainDriverSetupAccountManagersDone");
      v362 = 2114;
      v363 = CFSTR("duration");
      v364 = 2112;
      v365 = v143;
      _os_log_impl(&dword_1CD062000, v139, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v137);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v144 = (void *)objc_claimAutoreleasedReturnValue();
    v145 = objc_alloc(MEMORY[0x1E0D334C8]);
    v146 = (void *)MEMORY[0x1E0CB3940];
    HMFUptime();
    objc_msgSend(v146, "stringWithFormat:", CFSTR("%.3f"), v147 - v118);
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    v150 = (void *)objc_msgSend(v145, "initWithTag:data:", CFSTR("mainDriverStart"), v149, CFSTR("state"), CFSTR("mainDriverSetupAccountManagersDone"), CFSTR("duration"), v148);
    objc_msgSend(v339, "tagProcessorList");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v144, "submitTaggedEvent:processorList:", v150, v151);

    objc_msgSend(v339, "markWithReason:", CFSTR("Initiating Backing Store"));
    +[HMDBackingStore start](HMDBackingStore, "start");
    v152 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v339, "markWithReason:", CFSTR("Initiating Clips Quota Manager")));
    +[HMDCameraClipsQuotaManager defaultManager](HMDCameraClipsQuotaManager, "defaultManager");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v153, "synchronize");

    objc_autoreleasePoolPop(v152);
    if (enableNetworkLogging)
    {
      v154 = (void *)MEMORY[0x1D17BA0A0]();
      v155 = v138;
      HMFGetOSLogHandle();
      v156 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v157 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v157;
        _os_log_impl(&dword_1CD062000, v156, OS_LOG_TYPE_INFO, "%{public}@Enabling CFNetwork diagnostics", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v154);
      setenv("CFNETWORK_DIAGNOSTICS", "3", 1);
    }
    objc_msgSend(v339, "markWithReason:", CFSTR("Loading Persistent Store"));
    v158 = objc_opt_class();
    v159 = (objc_class *)objc_opt_class();
    NSStringFromClass(v159);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreSingleton setClass:forClassName:](HMDBackingStoreSingleton, "setClass:forClassName:", v158, v160);

    v380[0] = 0;
    v161 = HMFUptime();
    v163 = v162;
    v164 = (void *)MEMORY[0x1D17BA0A0](v161);
    v165 = v138;
    HMFGetOSLogHandle();
    v166 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v166, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v167 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v167;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v358 = CFSTR("Load Persistent Store");
      *(_WORD *)v359 = 2114;
      *(_QWORD *)&v359[2] = CFSTR("state");
      v360 = 2112;
      v361 = CFSTR("mainDriverLoadPersistentStore");
      _os_log_impl(&dword_1CD062000, v166, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v164);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = objc_alloc(MEMORY[0x1E0D334C8]);
    v374 = CFSTR("state");
    v375 = CFSTR("mainDriverLoadPersistentStore");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v375, &v374, 1);
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    v171 = (void *)objc_msgSend(v169, "initWithTag:data:", CFSTR("mainDriverStart"), v170);
    objc_msgSend(v339, "tagProcessorList");
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v168, "submitTaggedEvent:processorList:", v171, v172);

    context = (void *)MEMORY[0x1D17BA0A0]();
    +[HMDPersistentStore removeTransactionJournal](HMDPersistentStore, "removeTransactionJournal");
    +[HMDHAPMetadata prepareMetadata](HMDHAPMetadata, "prepareMetadata");
    v332 = enableRetailDemoSetup;
    if (enableRetailDemoSetup && (objc_msgSend(0, "demoFinalized") & 1) == 0)
    {
      v350 = 0;
      v179 = (id)objc_msgSend((id)objc_opt_class(), "loadHomeDataFromDemoModeStore:", &v350);
      v173 = 0;
      v174 = (id *)&v350;
    }
    else
    {
      v349 = 0;
      objc_msgSend((id)objc_opt_class(), "loadHomeDataFromLocalStore:decryptionFailed:", &v349, v380);
      v173 = (void *)objc_claimAutoreleasedReturnValue();
      v174 = (id *)&v349;
    }
    v338 = *v174;
    v180 = (void *)MEMORY[0x1D17BA0A0]();
    v181 = v165;
    HMFGetOSLogHandle();
    v182 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v183 = (id)objc_claimAutoreleasedReturnValue();
      v184 = (void *)MEMORY[0x1E0CB3940];
      HMFUptime();
      objc_msgSend(v184, "stringWithFormat:", CFSTR("%.3f"), v185 - v163);
      v186 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v173, "domain");
      v187 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v173, "code"));
      v188 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138545922;
      *(_QWORD *)&buf[4] = v183;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v358 = CFSTR("Loaded Persistent Store");
      *(_WORD *)v359 = 2114;
      *(_QWORD *)&v359[2] = CFSTR("state");
      v360 = 2112;
      v361 = CFSTR("mainDriverLoadedPersistentStore");
      v362 = 2114;
      v363 = CFSTR("duration");
      v364 = 2112;
      v365 = v186;
      v366 = 2114;
      v367 = CFSTR("errorDomain");
      v368 = 2112;
      v369 = v187;
      v370 = 2114;
      v371 = CFSTR("errorCode");
      v372 = 2112;
      v373 = v188;
      _os_log_impl(&dword_1CD062000, v182, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x70u);

    }
    objc_autoreleasePoolPop(v180);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    v190 = objc_alloc(MEMORY[0x1E0D334C8]);
    v191 = (void *)MEMORY[0x1E0CB3940];
    HMFUptime();
    objc_msgSend(v191, "stringWithFormat:", CFSTR("%.3f"), v192 - v163);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v173, "domain");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v173, "code"));
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    v197 = (void *)objc_msgSend(v190, "initWithTag:data:", CFSTR("mainDriverStart"), v196, CFSTR("state"), CFSTR("mainDriverLoadedPersistentStore"), CFSTR("duration"), v193, CFSTR("errorDomain"), v194, CFSTR("errorCode"), v195);
    objc_msgSend(v339, "tagProcessorList");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v189, "submitTaggedEvent:processorList:", v197, v198);

    if (v173)
    {
      v199 = (void *)MEMORY[0x1D17BA0A0]();
      v200 = v181;
      HMFGetOSLogHandle();
      v201 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v202 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = v202;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v173;
        _os_log_impl(&dword_1CD062000, v201, OS_LOG_TYPE_ERROR, "%{public}@Unable to load home data configuration: %@", buf, 0x16u);

      }
      objc_autoreleasePoolPop(v199);
    }
    else if (!(v332 | v380[0]) && v338)
    {
      objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
      v203 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v203, "ensureControllerKeyExistsForAllViews");

    }
    objc_autoreleasePoolPop(context);
    v204 = objc_alloc_init(HMDDeviceSetupConfiguringController);
    objc_msgSend(v181, "setConfiguringStateController:", v204);

    objc_msgSend(v181, "configuringStateController");
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v205, "setupRPClient");

    v206 = objc_alloc_init(HMDNetworkInfoController);
    objc_msgSend(v181, "setNetworkInfoController:", v206);

    objc_msgSend(v181, "networkInfoController");
    v207 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v207, "start");

    v333 = -[HMDDiscoveryController initWithDiscoveryNeedsAssertion:]([HMDDiscoveryController alloc], "initWithDiscoveryNeedsAssertion:", 1);
    objc_msgSend(v181, "setDiscoveryController:", v333);
    -[HMDDiscoveryController start](v333, "start");
    v208 = -[HMDSymptomManager initWithDataSource:]([HMDSymptomManager alloc], "initWithDataSource:", v181);
    objc_msgSend(v181, "setSymptomManager:", v208);

    objc_msgSend(v339, "markWithReason:", CFSTR("Loading Accounts"));
    objc_msgSend(v338, "account");
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    if (v209)
    {
      objc_msgSend(v338, "account");
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      v211 = objc_msgSend(v210, "isCurrentAccount");

      if (v211)
      {
        objc_msgSend(v338, "account");
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v329, "setAccount:", v212);

      }
    }
    +[HMDRemoteAccountManager sharedManager](HMDRemoteAccountManager, "sharedManager");
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v338, "remoteAccounts");
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    v214 = objc_msgSend(v213, "count");

    if (v214)
    {
      objc_msgSend(v338, "remoteAccounts");
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v324, "setAccounts:", v215);

    }
    objc_msgSend(v181, "metricsManager");
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v216, "logEventSubmitter");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    v218 = objc_alloc_init(HMDDeviceAccountResolvedLogEvent);
    objc_msgSend(v217, "submitLogEvent:error:", v218, 0);

    objc_msgSend(v338, "pendingUserManagementOperations");
    v219 = (void *)objc_claimAutoreleasedReturnValue();

    if (v219)
    {
      objc_msgSend(v339, "markWithReason:", CFSTR("Loading User Management Operations"));
      v220 = [HMDUserManagementOperationManager alloc];
      objc_msgSend(v338, "pendingUserManagementOperations");
      v221 = (void *)objc_claimAutoreleasedReturnValue();
      v222 = -[HMDUserManagementOperationManager initWithOperations:](v220, "initWithOperations:", v221);

      +[HMDUserManagementOperationManager setSharedManager:](HMDUserManagementOperationManager, "setSharedManager:", v222);
    }
    objc_msgSend(v339, "markWithReason:", CFSTR("Creating Accessory Browser"));
    v223 = -[HMDAccessoryBrowser initWithMessageDispatcher:]([HMDAccessoryBrowser alloc], "initWithMessageDispatcher:", v337);
    objc_msgSend(v181, "setAccessoryBrowser:", v223);

    objc_msgSend(v181, "metricsManager");
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D16538], "sharedInstance");
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v224, "configureHAPMetricsDispatcher:", v225);

    if (enableRetailDemoSetup || objc_msgSend(v338, "demoFinalized"))
    {
      objc_msgSend(v339, "markWithReason:", CFSTR("Loading Demo Mode"));
      objc_msgSend(v181, "accessoryBrowser");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v338, "demoAccessories");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v226, "configureDemoBrowserWithDemoAccessories:finalized:", v227, objc_msgSend(v338, "demoFinalized"));

    }
    objc_msgSend(MEMORY[0x1E0C99D20], "array");
    v330 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance");
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v228, "local");
    contexta = (void *)objc_claimAutoreleasedReturnValue();

    if (contexta)
    {
      v229 = (void *)MEMORY[0x1D17BA0A0]();
      v230 = v181;
      HMFGetOSLogHandle();
      v231 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v231, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v232 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v232;
        _os_log_impl(&dword_1CD062000, v231, OS_LOG_TYPE_DEFAULT, "%{public}@Checking backing store for uncommitted transactions...", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v229);
      v233 = objc_msgSend(contexta, "_numUncommittedTransactions");
      if (v233 >= 1)
      {
        v234 = (void *)MEMORY[0x1D17BA0A0]();
        v235 = v230;
        HMFGetOSLogHandle();
        v236 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v236, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v237 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          *(_QWORD *)&buf[4] = v237;
          _os_log_impl(&dword_1CD062000, v236, OS_LOG_TYPE_ERROR, "%{public}@Dropped transactions that were not pushed and not committed to disk.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v234);
        v238 = (id)objc_msgSend(contexta, "_dropUncommittedUnpushedTransactions");
        v239 = objc_msgSend(contexta, "_numUncommittedTransactions");
        if (v239 >= 1)
        {
          objc_msgSend(MEMORY[0x1E0D28678], "sharedPreferences");
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v240, "preferenceForKey:", CFSTR("shouldRunUncommittedTransactions"));
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          v242 = objc_msgSend(v241, "BOOLValue");

          if (v242)
          {
            objc_msgSend(contexta, "_fetchUncommittedAndPushedTransactions");
            v243 = (void *)objc_claimAutoreleasedReturnValue();

            v244 = (void *)MEMORY[0x1D17BA0A0]();
            v245 = v235;
            HMFGetOSLogHandle();
            v246 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v247 = (id)objc_claimAutoreleasedReturnValue();
              v248 = isInternalBuild();
              v249 = v243;
              if ((v248 & 1) == 0)
              {
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v243, "count"));
                v249 = (void *)objc_claimAutoreleasedReturnValue();
              }
              *(_DWORD *)buf = 138543618;
              *(_QWORD *)&buf[4] = v247;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v249;
              _os_log_impl(&dword_1CD062000, v246, OS_LOG_TYPE_ERROR, "%{public}@Have uncommitted transactions that were pushed %@.", buf, 0x16u);
              if ((v248 & 1) == 0)

            }
          }
          else
          {
            v244 = (void *)MEMORY[0x1D17BA0A0]();
            v250 = v235;
            HMFGetOSLogHandle();
            v246 = (id)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v246, OS_LOG_TYPE_ERROR))
            {
              HMFGetLogIdentifier();
              v251 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              *(_QWORD *)&buf[4] = v251;
              _os_log_impl(&dword_1CD062000, v246, OS_LOG_TYPE_ERROR, "%{public}@Ignoring uncommitted transactions, in data loss state", buf, 0xCu);

            }
            v243 = v330;
          }

          objc_autoreleasePoolPop(v244);
          v330 = v243;
        }
        goto LABEL_88;
      }
    }
    else
    {
      v233 = 0;
    }
    v239 = 0;
LABEL_88:
    v325 = -[HMDTransactionArchiveReplayLogEvent initWithNumUncommittedRecords:numUncommittedAndPushedRecords:]([HMDTransactionArchiveReplayLogEvent alloc], "initWithNumUncommittedRecords:numUncommittedAndPushedRecords:", v233, v239);
    objc_msgSend(v181, "metricsManager");
    v252 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v252, "logEventSubmitter");
    v253 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v253, "submitLogEvent:", v325);

    v254 = HMFUptime();
    v256 = v255;
    v257 = (void *)MEMORY[0x1D17BA0A0](v254);
    v258 = v181;
    HMFGetOSLogHandle();
    v259 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v259, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v260 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v260;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v358 = CFSTR("Initializing Home Manager");
      *(_WORD *)v359 = 2114;
      *(_QWORD *)&v359[2] = CFSTR("state");
      v360 = 2112;
      v361 = CFSTR("mainDriverInitHomeManager");
      _os_log_impl(&dword_1CD062000, v259, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v257);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v261 = (void *)objc_claimAutoreleasedReturnValue();
    v262 = objc_alloc(MEMORY[0x1E0D334C8]);
    v355 = CFSTR("state");
    v356 = CFSTR("mainDriverInitHomeManager");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v356, &v355, 1);
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    v264 = (void *)objc_msgSend(v262, "initWithTag:data:", CFSTR("mainDriverStart"), v263);
    objc_msgSend(v339, "tagProcessorList");
    v265 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v261, "submitTaggedEvent:processorList:", v264, v265);

    v266 = [HMDHomeManager alloc];
    objc_msgSend(v258, "accessoryBrowser");
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v337, "messageFilterChain");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    v269 = v380[0] != 0;
    +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
    v270 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v258, "metricsManager");
    v271 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v258, "configuringStateController");
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v258, "appleMediaAccessoryDiagnosticInfoController");
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v258, "currentAccessorySetupMetricDispatcher");
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    v275 = -[HMDHomeManager initWithMessageDispatcher:accessoryBrowser:messageFilterChain:homeData:localDataDecryptionFailed:identityRegistry:accountRegistry:metricsManager:configuringStateController:diagnosticInfoController:currentAccessorySetupMetricDispatcher:uncommittedTransactions:](v266, "initWithMessageDispatcher:accessoryBrowser:messageFilterChain:homeData:localDataDecryptionFailed:identityRegistry:accountRegistry:metricsManager:configuringStateController:diagnosticInfoController:currentAccessorySetupMetricDispatcher:uncommittedTransactions:", v337, v267, v268, v338, v269, v270, v331, v271, v272, v273, v274, v330);
    objc_msgSend(v258, "setHomeManager:", v275);

    v276 = (void *)MEMORY[0x1D17BA0A0]();
    v277 = v258;
    HMFGetOSLogHandle();
    v278 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v278, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v279 = (id)objc_claimAutoreleasedReturnValue();
      v280 = (void *)MEMORY[0x1E0CB3940];
      HMFUptime();
      objc_msgSend(v280, "stringWithFormat:", CFSTR("%.3f"), v281 - v256);
      v282 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544898;
      *(_QWORD *)&buf[4] = v279;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v358 = CFSTR("Initialized Home Manager");
      *(_WORD *)v359 = 2114;
      *(_QWORD *)&v359[2] = CFSTR("state");
      v360 = 2112;
      v361 = CFSTR("mainDriverInitializedHomeManager");
      v362 = 2114;
      v363 = CFSTR("duration");
      v364 = 2112;
      v365 = v282;
      _os_log_impl(&dword_1CD062000, v278, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    }
    objc_autoreleasePoolPop(v276);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v283 = (void *)objc_claimAutoreleasedReturnValue();
    v284 = objc_alloc(MEMORY[0x1E0D334C8]);
    v285 = (void *)MEMORY[0x1E0CB3940];
    HMFUptime();
    objc_msgSend(v285, "stringWithFormat:", CFSTR("%.3f"), v286 - v256);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    HMDTaggedLoggingCreateDictionary();
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = (void *)objc_msgSend(v284, "initWithTag:data:", CFSTR("mainDriverStart"), v288, CFSTR("state"), CFSTR("mainDriverInitializedHomeManager"), CFSTR("duration"), v287);
    objc_msgSend(v339, "tagProcessorList");
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v283, "submitTaggedEvent:processorList:", v289, v290);

    objc_msgSend(v339, "markWithReason:", CFSTR("Starting Account registry and managers"));
    objc_msgSend(v331, "start");
    objc_msgSend(v339, "markWithReason:", CFSTR("Initialize Presence Monitor"));
    v291 = [HMDIDSActivityMonitorHomeManagerDataSource alloc];
    objc_msgSend(v277, "homeManager");
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    v293 = -[HMDIDSActivityMonitorHomeManagerDataSource initWithHomeManager:](v291, "initWithHomeManager:", v292);

    objc_msgSend(v326, "setActivityMonitorDataSource:", v293);
    v294 = isInternalBuild();
    if (enableRetailDemoSetup)
      v295 = v294;
    else
      v295 = 0;
    if (v295 == 1)
    {
      v296 = (void *)MEMORY[0x1D17BA0A0](objc_msgSend(v339, "markWithReason:", CFSTR("Creating Retail Demo Mode Request Handler")));
      v297 = v277;
      HMFGetOSLogHandle();
      v298 = (id)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v298, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v299 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v299;
        _os_log_impl(&dword_1CD062000, v298, OS_LOG_TYPE_INFO, "%{public}@Creating Retail Demo Mode Request Handler", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v296);
      v300 = [HMDRetailDemoModeRequestHandler alloc];
      objc_msgSend(v297, "homeManager");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      v302 = -[HMDRetailDemoModeRequestHandler initWithHomeManager:messageDispatcher:relaunchHandler:](v300, "initWithHomeManager:messageDispatcher:relaunchHandler:", v301, v337, v297);
      objc_msgSend(v297, "setRetailDemoModeRequestHandler:", v302);

      objc_msgSend(v297, "retailDemoModeRequestHandler");
      v303 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v303, "configure");

    }
    v304 = HMFUptime();
    v306 = v305;
    v307 = (void *)MEMORY[0x1D17BA0A0](v304);
    v308 = v277;
    HMFGetOSLogHandle();
    v309 = (id)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v309, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v310 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      *(_QWORD *)&buf[4] = v310;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = CFSTR("mainDriverStart");
      *(_WORD *)&buf[22] = 2112;
      v358 = CFSTR("Starting Home Manager");
      *(_WORD *)v359 = 2114;
      *(_QWORD *)&v359[2] = CFSTR("state");
      v360 = 2112;
      v361 = CFSTR("mainDriverStartHomeManager");
      _os_log_impl(&dword_1CD062000, v309, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

    }
    objc_autoreleasePoolPop(v307);
    objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    v312 = objc_alloc(MEMORY[0x1E0D334C8]);
    v353 = CFSTR("state");
    v354 = CFSTR("mainDriverStartHomeManager");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v354, &v353, 1);
    v313 = (void *)objc_claimAutoreleasedReturnValue();
    v314 = (void *)objc_msgSend(v312, "initWithTag:data:", CFSTR("mainDriverStart"), v313);
    objc_msgSend(v339, "tagProcessorList");
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v311, "submitTaggedEvent:processorList:", v314, v315);

    objc_msgSend(v308, "homeManager");
    v316 = (void *)objc_claimAutoreleasedReturnValue();
    v340[0] = MEMORY[0x1E0C809B0];
    v340[1] = 3221225472;
    v340[2] = __22__HMDMainDriver_start__block_invoke_197;
    v340[3] = &unk_1E89A5588;
    v341 = v339;
    v342 = v308;
    v348 = v306;
    v317 = v337;
    v343 = v317;
    v318 = v322;
    v344 = v318;
    v319 = v328;
    v345 = v319;
    v320 = v323;
    v346 = v320;
    v321 = v293;
    v347 = v321;
    objc_msgSend(v316, "startWithCompletionHandler:", v340);

    goto LABEL_102;
  }
  out_token = 0;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LOBYTE(v358) = 0;
  v175 = (void *)MEMORY[0x1D17BA0A0]();
  v176 = v55;
  HMFGetOSLogHandle();
  v177 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v380 = 138543362;
    v381 = v178;
    _os_log_impl(&dword_1CD062000, v177, OS_LOG_TYPE_INFO, "%{public}@Can't load data until unlocked -- stopping", v380, 0xCu);

  }
  objc_autoreleasePoolPop(v175);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __22__HMDMainDriver_start__block_invoke_108;
  handler[3] = &unk_1E89A5A88;
  handler[4] = v176;
  handler[5] = buf;
  notify_register_dispatch("com.apple.mobile.keybagd.lock_status", &out_token, MEMORY[0x1E0C80D38], handler);

  _Block_object_dispose(buf, 8);
LABEL_102:

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

  v12 = *MEMORY[0x1E0C80C00];
  -[HMDMainDriver workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  +[HMDLaunchHandler sharedHandler](HMDLaunchHandler, "sharedHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3A28]), "initWithUUIDString:", CFSTR("1CAEDC10-E3E5-41A4-BB17-A9EEBA14A938"));
  objc_msgSend(v4, "registerRelaunchClientWithUUID:", v5);

  v6 = (void *)MEMORY[0x1D17BA0A0]();
  v7 = self;
  HMFGetOSLogHandle();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@Exiting...", (uint8_t *)&v10, 0xCu);

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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__HMDMainDriver_relaunch__block_invoke;
  block[3] = &unk_1E89C2730;
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __36__HMDMainDriver_relaunchAfterDelay___block_invoke;
  block[3] = &unk_1E89C2730;
  block[4] = self;
  dispatch_after(v4, v5, block);

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

  v17 = *MEMORY[0x1E0C80C00];
  -[HMDMainDriver homeManager](self, "homeManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentAccessorySetupMetricDispatcher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = (void *)MEMORY[0x1D17BA0A0]();
    v6 = self;
    HMFGetOSLogHandle();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Removing current accessory setup metric dispatcher from home manager", (uint8_t *)&v15, 0xCu);

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
    v11 = (void *)MEMORY[0x1D17BA0A0]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v14;
      _os_log_impl(&dword_1CD062000, v13, OS_LOG_TYPE_INFO, "%{public}@Removing current accessory setup metric dispatcher from main driver", (uint8_t *)&v15, 0xCu);

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

  objc_msgSend(MEMORY[0x1E0D286E8], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "MACAddress");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentNetworkSSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentNetworkAssociation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc(MEMORY[0x1E0D286F0]);
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

  objc_msgSend(MEMORY[0x1E0D286E8], "sharedManager");
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
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__HMDMainDriver_fetchNearbyAccessoriesNotOnCurrentNetworkWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E89BACD8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "findAccessoriesNotOnWiFiWithCurrentWiFi:completionHandler:", v6, v8);

}

- (HMDCoreData)coreData
{
  return self->_coreData;
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

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@wifi mismatch accessories %@", (uint8_t *)&v8, 0x16u);

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

  v12 = *MEMORY[0x1E0C80C00];
  result = MKBDeviceUnlockedSinceBoot();
  if ((_DWORD)result)
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (!*(_BYTE *)(v5 + 24))
    {
      *(_BYTE *)(v5 + 24) = 1;
      v6 = (void *)MEMORY[0x1D17BA0A0]();
      v7 = *(id *)(a1 + 32);
      HMFGetOSLogHandle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        HMFGetLogIdentifier();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v9;
        _os_log_impl(&dword_1CD062000, v8, OS_LOG_TYPE_INFO, "%{public}@Notified that device has been unlocked for the first time", (uint8_t *)&v10, 0xCu);

      }
      objc_autoreleasePoolPop(v6);
      objc_msgSend(*(id *)(a1 + 32), "start");
      return notify_cancel(a2);
    }
  }
  return result;
}

void __22__HMDMainDriver_start__block_invoke_197(uint64_t a1)
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
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __22__HMDMainDriver_start__block_invoke_2_200;
  block[3] = &unk_1E89A5588;
  v11 = *(_QWORD *)(a1 + 88);
  v3 = *(int8x16_t *)(a1 + 32);
  v2 = (id)v3.i64[0];
  v5 = vextq_s8(v3, v3, 8uLL);
  v6 = *(id *)(a1 + 48);
  v7 = *(id *)(a1 + 56);
  v8 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  v10 = *(id *)(a1 + 80);
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __22__HMDMainDriver_start__block_invoke_2_200(uint64_t a1)
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
  uint64_t v28;
  double v29;
  double v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  NSObject *v43;
  void *v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  HMDXPCTransportStartedLogEvent *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  id v66;
  NSObject *v67;
  void *v68;
  void *v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  id v76;
  _QWORD v77[5];
  id v78;
  uint64_t v79;
  const __CFString *v80;
  const __CFString *v81;
  const __CFString *v82;
  const __CFString *v83;
  uint8_t buf[4];
  void *v85;
  __int16 v86;
  const __CFString *v87;
  __int16 v88;
  const __CFString *v89;
  __int16 v90;
  const __CFString *v91;
  __int16 v92;
  const __CFString *v93;
  __int16 v94;
  const __CFString *v95;
  __int16 v96;
  void *v97;
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = 0x1E0CB3000;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
    HMFUptime();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%.3f"), v8 - *(double *)(a1 + 88));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v85 = v6;
    v86 = 2114;
    v87 = CFSTR("mainDriverStart");
    v88 = 2112;
    v89 = CFSTR("Home manager started. Configuring ...");
    v90 = 2114;
    v91 = CFSTR("state");
    v92 = 2112;
    v93 = CFSTR("mainDriverStartedHomeManager");
    v94 = 2114;
    v95 = CFSTR("duration");
    v96 = 2112;
    v97 = v9;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

    v5 = 0x1E0CB3000uLL;
  }

  objc_autoreleasePoolPop(v2);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D334C8]);
  v12 = *(void **)(v5 + 2368);
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

  objc_msgSend(*(id *)(a1 + 32), "accessoryBrowser");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "configureWithHomeManager:", v25);

  v26 = *(void **)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "configureWithHomeManager:", v27);

  objc_msgSend(*(id *)(a1 + 64), "refreshHomeBadgeNumber");
  v28 = HMFUptime();
  v30 = v29;
  v31 = (void *)MEMORY[0x1D17BA0A0](v28);
  v32 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    HMFGetLogIdentifier();
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v85 = v34;
    v86 = 2114;
    v87 = CFSTR("mainDriverStart");
    v88 = 2112;
    v89 = CFSTR("Starting XPC message transport");
    v90 = 2114;
    v91 = CFSTR("state");
    v92 = 2112;
    v93 = CFSTR("mainDriverStartXPCTransport");
    _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_DEBUG, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v31);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = objc_alloc(MEMORY[0x1E0D334C8]);
  v82 = CFSTR("state");
  v83 = CFSTR("mainDriverStartXPCTransport");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v83, &v82, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v36, "initWithTag:data:", CFSTR("mainDriverStart"), v37);
  objc_msgSend(*(id *)(a1 + 40), "tagProcessorList");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "submitTaggedEvent:processorList:", v38, v39);

  objc_msgSend(*(id *)(a1 + 72), "start");
  +[HMDXPCMessageTransport accessorySetupTransport](HMDXPCMessageTransport, "accessorySetupTransport");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "start");

  v41 = (void *)MEMORY[0x1D17BA0A0]();
  v42 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = (void *)MEMORY[0x1E0CB3940];
    HMFUptime();
    objc_msgSend(v45, "stringWithFormat:", CFSTR("%.3f"), v46 - v30);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544898;
    v85 = v44;
    v86 = 2114;
    v87 = CFSTR("mainDriverStart");
    v88 = 2112;
    v89 = CFSTR("Started XPC message transport");
    v90 = 2114;
    v91 = CFSTR("state");
    v92 = 2112;
    v93 = CFSTR("mainDriverStartXPCTransportDone");
    v94 = 2114;
    v95 = CFSTR("duration");
    v96 = 2112;
    v97 = v47;
    _os_log_impl(&dword_1CD062000, v43, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v41);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_alloc(MEMORY[0x1E0D334C8]);
  v50 = (void *)MEMORY[0x1E0CB3940];
  HMFUptime();
  objc_msgSend(v50, "stringWithFormat:", CFSTR("%.3f"), v51 - v30);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  HMDTaggedLoggingCreateDictionary();
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v49, "initWithTag:data:", CFSTR("mainDriverStart"), v53, CFSTR("state"), CFSTR("mainDriverStartXPCTransportDone"), CFSTR("duration"), v52);
  objc_msgSend(*(id *)(a1 + 40), "tagProcessorList");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "submitTaggedEvent:processorList:", v54, v55);

  objc_msgSend(*(id *)(a1 + 32), "metricsManager");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "logEventSubmitter");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_alloc_init(HMDXPCTransportStartedLogEvent);
  objc_msgSend(v57, "submitLogEvent:", v58);

  objc_msgSend(MEMORY[0x1E0D285C8], "memoryMonitor");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v59, "start");

  objc_msgSend(*(id *)(a1 + 80), "start");
  +[HMDIdentityRegistry sharedRegistry](HMDIdentityRegistry, "sharedRegistry");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "homeManager");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "configureWithHomeManager:", v61);

  v62 = HMFUptime();
  v64 = v63;
  v65 = (void *)MEMORY[0x1D17BA0A0](v62);
  v66 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v67 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v85 = v68;
    v86 = 2114;
    v87 = CFSTR("mainDriverStart");
    v88 = 2112;
    v89 = CFSTR("Starting remote message transports");
    v90 = 2114;
    v91 = CFSTR("state");
    v92 = 2112;
    v93 = CFSTR("mainDriverStartRemoteTransports");
    _os_log_impl(&dword_1CD062000, v67, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\", buf, 0x34u);

  }
  objc_autoreleasePoolPop(v65);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v70 = objc_alloc(MEMORY[0x1E0D334C8]);
  v80 = CFSTR("state");
  v81 = CFSTR("mainDriverStartRemoteTransports");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v81, &v80, 1);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v70, "initWithTag:data:", CFSTR("mainDriverStart"), v71);
  objc_msgSend(*(id *)(a1 + 40), "tagProcessorList");
  v73 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "submitTaggedEvent:processorList:", v72, v73);

  objc_msgSend(*(id *)(a1 + 56), "start");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v77[0] = MEMORY[0x1E0C809B0];
  v77[1] = 3221225472;
  v77[2] = __22__HMDMainDriver_start__block_invoke_211;
  v77[3] = &unk_1E89A3AE0;
  v75 = *(void **)(a1 + 40);
  v77[4] = *(_QWORD *)(a1 + 32);
  v79 = v64;
  v78 = v75;
  v76 = (id)objc_msgSend(v74, "then:", v77);

}

uint64_t __22__HMDMainDriver_start__block_invoke_211(uint64_t a1, void *a2)
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

  v34 = *MEMORY[0x1E0C80C00];
  v19 = a2;
  v3 = (void *)MEMORY[0x1D17BA0A0]();
  v4 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x1E0CB3940];
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
    _os_log_impl(&dword_1CD062000, v5, OS_LOG_TYPE_INFO, "%{public}@tag=\"%{public}@\" desc=\"%@\" %{public}@=\"%@\" %{public}@=\"%@\", buf, 0x48u);

  }
  objc_autoreleasePoolPop(v3);
  objc_msgSend(MEMORY[0x1E0D334B8], "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc(MEMORY[0x1E0D334C8]);
  v12 = (void *)MEMORY[0x1E0CB3940];
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
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x1E0C81298]);
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

  v11 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1D17BA0A0]();
  v3 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_1CD062000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@Locale changed - clearing followup items before restarting", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v2);
  +[HMDDeviceSetupManager sharedManager](HMDDeviceSetupManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "followUpManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__HMDMainDriver_localeChanged__block_invoke_74;
  v8[3] = &unk_1E89BDB38;
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

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
  v6 = *(id *)(a1 + 32);
  HMFGetOSLogHandle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@Locale changed - restarting", (uint8_t *)&v9, 0xCu);

  }
  objc_autoreleasePoolPop(v5);
  objc_msgSend(*(id *)(a1 + 32), "relaunch");

}

+ (id)driver
{
  if (driver_onceToken != -1)
    dispatch_once(&driver_onceToken, &__block_literal_global_6977);
  return (id)driver_singletonDriver;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t35 != -1)
    dispatch_once(&logCategory__hmf_once_t35, &__block_literal_global_217);
  return (id)logCategory__hmf_once_v36;
}

void __28__HMDMainDriver_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v36;
  logCategory__hmf_once_v36 = v0;

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

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v7, OS_LOG_TYPE_INFO, "%{public}@Creating current accessory setup metric dispatcher for session: %@", (uint8_t *)&v12, 0x16u);

  }
  objc_autoreleasePoolPop(v5);
  v9 = -[HMDHomePodSetupLatencyLogEvent initLogEventWithInitialState:]([HMDHomePodSetupLatencyLogEvent alloc], "initLogEventWithInitialState:", 0);
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
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

  v32 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = v10;
  if (v10)
    (*((void (**)(id))v10 + 2))(v10);
  else
    +[HMDCurrentAccessorySetupMetricDispatcher readSetupLogEventFromUserDefaults:](HMDCurrentAccessorySetupMetricDispatcher, "readSetupLogEventFromUserDefaults:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Loading saved log event: %@ with event state: %@", (uint8_t *)&v26, 0x20u);

    }
    objc_autoreleasePoolPop(v13);
    switch(objc_msgSend(v12, "savedEventState"))
    {
      case 0:
      case 2:
        objc_msgSend(v12, "setSavedEventState:", 3);
        +[HMDCurrentAccessorySetupMetricDispatcher saveSetupLogEventIntoUserDefaults:setupLogEvent:](HMDCurrentAccessorySetupMetricDispatcher, "saveSetupLogEventIntoUserDefaults:setupLogEvent:", v8, v12);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmInternalErrorWithCode:", 3400);
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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@No saved log event saved before", (uint8_t *)&v26, 0xCu);

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

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[HMDCurrentAccessorySetupMetricDispatcher initWithDataSource:setupLogEvent:logEventSubmitter:]([HMDCurrentAccessorySetupMetricDispatcher alloc], "initWithDataSource:setupLogEvent:logEventSubmitter:", self, v9, v10);
  -[HMDMainDriver setCurrentAccessorySetupMetricDispatcher:](self, "setCurrentAccessorySetupMetricDispatcher:", v11);

  -[HMDMainDriver homeManager](self, "homeManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x1D17BA0A0]();
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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Setting current accessory metric dispatcher for home manager", (uint8_t *)&v21, 0xCu);

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
      _os_log_impl(&dword_1CD062000, v15, OS_LOG_TYPE_INFO, "%{public}@Home manager is not created yet", (uint8_t *)&v21, 0xCu);

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
  v32 = *MEMORY[0x1E0C80C00];
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
      v15 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v17, OS_LOG_TYPE_ERROR, "%{public}@Unable to load the home data from SQL : %@", buf, 0x16u);

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
  v19 = (void *)MEMORY[0x1D17BA0A0]();
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
    _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_INFO, "%{public}@Since we could not load the keyed archive from SQL table we are going to load it from location: %@", buf, 0x16u);

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

  v33[4] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0C99D50];
  HMDHomeKitDaemonDemoModePersistencePath();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  objc_msgSend(v5, "dataWithContentsOfURL:options:error:", v6, 0, &v28);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v28;

  if (v8)
  {
    v9 = (void *)MEMORY[0x1D17BA0A0]();
    v10 = a1;
    HMFGetOSLogHandle();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v30 = v12;
      _os_log_impl(&dword_1CD062000, v11, OS_LOG_TYPE_ERROR, "%{public}@Could not read demo accessory data.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v9);
    v13 = v8;
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C99E60];
    v33[0] = objc_opt_class();
    v33[1] = objc_opt_class();
    v33[2] = objc_opt_class();
    v33[3] = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 4);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0;
    objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v16, v7, &v27);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v27;
    v18 = (void *)MEMORY[0x1D17BA0A0]();
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
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_ERROR, "%{public}@No demo accessory data.", buf, 0xCu);

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
        _os_log_impl(&dword_1CD062000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@Decoded demo accessories: %@", buf, 0x16u);

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
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  NSObject *v19;
  void *v20;
  void *v21;
  int v22;
  unint64_t v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  _BOOL4 v29;
  id v30;
  void *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  id v36;
  unint64_t v37;
  void *v38;
  void *v39;
  int v40;
  id *v41;
  id v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  void *v47;
  id v48;
  NSObject *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  void *v53;
  int v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  uint64_t v59;
  id v60;
  id v61;
  id v63;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  uint8_t buf[4];
  void *v72;
  __int16 v73;
  id v74;
  uint64_t v75;

  LODWORD(v63) = a5;
  v75 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = a1;
  HMFGetOSLogHandle();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v72 = v11;
    _os_log_impl(&dword_1CD062000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@Loading Home data from table.", buf, 0xCu);

  }
  objc_autoreleasePoolPop(v8);
  objc_msgSend((id)objc_opt_class(), "getLocalStoreFrom:", v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = 0;
  v70 = 0;
  v68 = 0;
  v13 = objc_msgSend(v12, "_selectArchiveWithIdentifier:archive:controllerUserName:error:", CFSTR("homedata"), &v70, &v69, &v68);
  v14 = v70;
  v15 = v69;
  v16 = v68;

  v17 = (void *)MEMORY[0x1D17BA0A0]();
  v18 = v9;
  HMFGetOSLogHandle();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    HMFGetLogIdentifier();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v72 = v20;
    v73 = 2112;
    v74 = v15;
    _os_log_impl(&dword_1CD062000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@Controller user name : %@", buf, 0x16u);

  }
  objc_autoreleasePoolPop(v17);
  v21 = 0;
  if (v14)
    v22 = v13;
  else
    v22 = 0;
  v23 = 0x1E0D28000;
  if (v22 == 1 && v15)
  {
    v24 = (void *)MEMORY[0x1D17BA0A0]();
    v25 = v18;
    HMFGetOSLogHandle();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      HMFGetLogIdentifier();
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "length"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v72 = v27;
      v73 = 2112;
      v74 = v28;
      _os_log_impl(&dword_1CD062000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@Loaded Home data from table size: %@", buf, 0x16u);

      v23 = 0x1E0D28000uLL;
    }

    objc_autoreleasePoolPop(v24);
    v67 = v16;
    v29 = +[HMDPersistentStore hasControllerKeyWithUsername:error:](HMDPersistentStore, "hasControllerKeyWithUsername:error:", v15, &v67);
    v30 = v67;

    if (v29)
    {
      v31 = (void *)MEMORY[0x1D17BA0A0]();
      v32 = v25;
      HMFGetOSLogHandle();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        HMFGetLogIdentifier();
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v72 = v34;
        _os_log_impl(&dword_1CD062000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@Found controller key for loaded home data", buf, 0xCu);

      }
      objc_autoreleasePoolPop(v31);
      objc_msgSend(MEMORY[0x1E0D165F0], "systemStore");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "updateActiveControllerPairingIdentifier:", v15);

      v66 = 0;
      +[HMDPersistentStore deserializeHomeData:usingLocalStorage:fromData:forHH2Migration:](HMDPersistentStore, "deserializeHomeData:usingLocalStorage:fromData:forHH2Migration:", &v66, 1, v14, v63);
      v36 = v66;
      if (v36)
      {
        v21 = v36;
        v63 = v7;
        v37 = v23;
        objc_msgSend(*(id *)(v23 + 1656), "sharedPreferences");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "preferenceForKey:", CFSTR("CreateArchiveShadowCopy"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "BOOLValue");

        v41 = a6;
        if (v40 && isInternalBuild())
          v42 = +[HMDPersistentStore archiveHomeDataLegacy:toLocation:](HMDPersistentStore, "archiveHomeDataLegacy:toLocation:", v21, CFSTR("/tmp/legacyhomedatashadow.data"));
        v23 = v37;
        v7 = v63;
      }
      else
      {
        v47 = (void *)MEMORY[0x1D17BA0A0]();
        v48 = v32;
        HMFGetOSLogHandle();
        v49 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v72 = v50;
          _os_log_impl(&dword_1CD062000, v49, OS_LOG_TYPE_ERROR, "%{public}@Have home archive in table but could not decrypt. Home archive is corrupt.", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v47);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v51 = objc_claimAutoreleasedReturnValue();

        v21 = 0;
        v41 = a6;
        *a3 = 1;
        v30 = (id)v51;
        v23 = 0x1E0D28000uLL;
      }
    }
    else
    {
      v41 = a6;
      if (!v30)
      {
        v43 = (void *)MEMORY[0x1D17BA0A0]();
        v44 = v25;
        HMFGetOSLogHandle();
        v45 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        {
          HMFGetLogIdentifier();
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v72 = v46;
          _os_log_impl(&dword_1CD062000, v45, OS_LOG_TYPE_ERROR, "%{public}@No error while finding controller key but couldn't find controller key", buf, 0xCu);

        }
        objc_autoreleasePoolPop(v43);
        objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
        v30 = (id)objc_claimAutoreleasedReturnValue();
        v23 = 0x1E0D28000;
      }
      v21 = 0;
      *a3 = 1;
    }
  }
  else
  {
    v30 = v16;
    v41 = a6;
  }
  objc_msgSend(*(id *)(v23 + 1656), "sharedPreferences", v63);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "preferenceForKey:", CFSTR("ForceDecryptionFailed"));
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "BOOLValue");

  if (v54 && isInternalBuild())
  {
    v55 = (void *)MEMORY[0x1D17BA0A0]();
    v56 = v18;
    HMFGetOSLogHandle();
    v57 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v72 = v58;
      _os_log_impl(&dword_1CD062000, v57, OS_LOG_TYPE_ERROR, "%{public}@Forcing decryption failed state due to preference.", buf, 0xCu);

    }
    objc_autoreleasePoolPop(v55);

    objc_msgSend(MEMORY[0x1E0CB35C8], "hmErrorWithCode:", 2);
    v59 = objc_claimAutoreleasedReturnValue();

    v21 = 0;
    *a3 = 1;
    v30 = (id)v59;
  }
  v60 = objc_retainAutorelease(v30);
  *v41 = v60;
  v61 = v21;

  return v61;
}

+ (id)getLocalStoreFrom:(id)a3
{
  void *v3;
  void *v4;

  +[HMDBackingStoreSingleton sharedInstance](HMDBackingStoreSingleton, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "local");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end
