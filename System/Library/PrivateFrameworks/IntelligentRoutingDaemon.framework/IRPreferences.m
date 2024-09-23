@implementation IRPreferences

- (NSNumber)bannersFromScreenUnlockToAppInFocusEnable
{
  return self->_bannersFromScreenUnlockToAppInFocusEnable;
}

+ (id)shared
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __23__IRPreferences_shared__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, block);
  return (id)shared_sharedInstance;
}

- (NSNumber)coreAnalyticsStatisticsCollectionPeriodInSeconds
{
  return self->_coreAnalyticsStatisticsCollectionPeriodInSeconds;
}

- (NSNumber)appInFocusWindowInSeconds
{
  return self->_appInFocusWindowInSeconds;
}

- (NSNumber)replayWriterEventsSizeToBuffer
{
  return self->_replayWriterEventsSizeToBuffer;
}

- (NSNumber)numberOfEventsToSaveInDisk
{
  return self->_numberOfEventsToSaveInDisk;
}

- (NSArray)loiSameSpaceOverrideBrokerForAVODIDArray
{
  return self->_loiSameSpaceOverrideBrokerForAVODIDArray;
}

- (NSNumber)nearbyDeviceMeasurmentExpityTimeSeconds
{
  return self->_nearbyDeviceMeasurmentExpityTimeSeconds;
}

void __23__IRPreferences_shared__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)shared_sharedInstance;
  shared_sharedInstance = (uint64_t)v1;

}

- (IRPreferences)init
{
  IRPreferences *v2;
  void *v3;
  id v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IRPreferences;
  v2 = -[IRPreferences init](&v6, sel_init);
  if (v2)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.intelligentroutingd"));
    -[IRPreferences setDefaults:](v2, "setDefaults:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    -[IRPreferences setMobileAssetSettings:](v2, "setMobileAssetSettings:", v4);

    -[IRPreferences _registerForUserDefaultsRefreshNotification](v2, "_registerForUserDefaultsRefreshNotification");
    -[IRPreferences refresh](v2, "refresh");
  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(-[IRPreferences userDefaultsRefreshToken](self, "userDefaultsRefreshToken"));
  v3.receiver = self;
  v3.super_class = (Class)IRPreferences;
  -[IRPreferences dealloc](&v3, sel_dealloc);
}

- (void)refresh
{
  NSObject *v3;
  uint8_t v4[16];

  v3 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_23FFBA000, v3, OS_LOG_TYPE_DEFAULT, "#preferences, Refreshed preferences from disk", v4, 2u);
  }
  -[IRPreferences _defaultsSet](self, "_defaultsSet");
}

- (void)updateAndNotifyKey:(id)a3 withObject:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[IRPreferences defaults](self, "defaults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("IR"), "stringByAppendingString:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setObject:forKey:", v6, v9);
  -[IRPreferences refresh](self, "refresh");
  notify_post("com.apple.intelligentroutingd.UserDefaultsRefresh");
}

- (void)deleteAndNotifyKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IRPreferences defaults](self, "defaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("IR"), "stringByAppendingString:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "removeObjectForKey:", v6);
  -[IRPreferences refresh](self, "refresh");
  notify_post("com.apple.intelligentroutingd.UserDefaultsRefresh");
}

- (id)_getDictItemsForLogging:(id)a3 withTitle:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v5, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x24BDAC760];
  v16 = 3221225472;
  v17 = __51__IRPreferences__getDictItemsForLogging_withTitle___block_invoke;
  v18 = &unk_251044EF8;
  v9 = v7;
  v19 = v9;
  v10 = v5;
  v20 = v10;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);

  if (objc_msgSend(v9, "count"))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v9, "componentsJoinedByString:", CFSTR("\n"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", CFSTR("\n%@\n%@"), v6, v12, v15, v16, v17, v18, v19);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v13 = &stru_251046168;
  }

  return v13;
}

void __51__IRPreferences__getDictItemsForLogging_withTitle___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  if (objc_msgSend(v7, "hasPrefix:", CFSTR("IR")))
  {
    v3 = (void *)MEMORY[0x24BDD17C8];
    v4 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringWithFormat:", CFSTR("   %@:%@"), v7, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v6);

  }
}

- (NSString)preferenceString
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

  -[IRPreferences defaults](self, "defaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dictionaryRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[IRPreferences _getDictItemsForLogging:withTitle:](self, "_getDictItemsForLogging:withTitle:", v4, CFSTR(" Defaults Overrides:"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPreferences mobileAssetSettings](self, "mobileAssetSettings");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[IRPreferences mobileAssetVersion](self, "mobileAssetVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR(" MobileAsset Overrides (%@):"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPreferences _getDictItemsForLogging:withTitle:](self, "_getDictItemsForLogging:withTitle:", v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("IRPreferences:%@%@"), v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v11;
}

- (void)_defaultsSet
{
  uint64_t v3;
  void *v4;
  char isKindOfClass;
  void *v6;
  char v7;
  void *v8;
  char v9;
  NSString *v10;
  NSString *testPreferenceString;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  char v16;
  void *v17;
  char v18;
  NSNumber *v19;
  NSNumber *testPreferenceInteger;
  uint64_t v21;
  void *v22;
  char v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  NSNumber *v28;
  NSNumber *testPreferenceDouble;
  uint64_t v30;
  void *v31;
  char v32;
  void *v33;
  char v34;
  void *v35;
  char v36;
  void *v37;
  NSArray *v38;
  NSArray *overrideIsAirplayForCandidateIDArray;
  uint64_t v40;
  void *v41;
  char v42;
  void *v43;
  char v44;
  void *v45;
  char v46;
  NSNumber *v47;
  NSNumber *testMobileAssetLoad;
  uint64_t v49;
  void *v50;
  char v51;
  void *v52;
  char v53;
  void *v54;
  char v55;
  NSNumber *v56;
  NSNumber *loadMobileAssetXPCActivityInterval;
  uint64_t v58;
  void *v59;
  char v60;
  void *v61;
  char v62;
  void *v63;
  char v64;
  NSNumber *v65;
  NSNumber *bleRssiProximityThreshold;
  uint64_t v67;
  void *v68;
  char v69;
  void *v70;
  char v71;
  void *v72;
  char v73;
  NSNumber *v74;
  NSNumber *deviceRangeProximityThreshold;
  uint64_t v76;
  void *v77;
  char v78;
  void *v79;
  char v80;
  void *v81;
  char v82;
  NSNumber *v83;
  NSNumber *miloLslIsSameMiloThreshold;
  uint64_t v85;
  void *v86;
  char v87;
  void *v88;
  char v89;
  void *v90;
  char v91;
  NSNumber *v92;
  NSNumber *pickerChoiceOverrideIntervalSeconds;
  uint64_t v94;
  void *v95;
  char v96;
  void *v97;
  char v98;
  void *v99;
  char v100;
  NSNumber *v101;
  NSNumber *mediaPlaybackEventsTimeIntervalThreshold;
  uint64_t v103;
  void *v104;
  char v105;
  void *v106;
  char v107;
  void *v108;
  char v109;
  NSNumber *v110;
  NSNumber *appleTvCtrlEventsTimeIntervalThreshold;
  uint64_t v112;
  void *v113;
  char v114;
  void *v115;
  char v116;
  void *v117;
  char v118;
  NSNumber *v119;
  NSNumber *mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds;
  uint64_t v121;
  void *v122;
  char v123;
  void *v124;
  char v125;
  void *v126;
  char v127;
  NSNumber *v128;
  NSNumber *mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds;
  uint64_t v130;
  void *v131;
  char v132;
  void *v133;
  char v134;
  void *v135;
  char v136;
  NSNumber *v137;
  NSNumber *cleanupXPCActivityInterval;
  uint64_t v139;
  void *v140;
  char v141;
  void *v142;
  char v143;
  void *v144;
  char v145;
  NSNumber *v146;
  NSNumber *dbCleanupXPCActivityDeleteServiceThreshold;
  uint64_t v148;
  void *v149;
  char v150;
  void *v151;
  char v152;
  void *v153;
  char v154;
  NSNumber *v155;
  NSNumber *dbCleanupXPCActivityDeleteHistoryEventsThreshold;
  uint64_t v157;
  void *v158;
  char v159;
  void *v160;
  char v161;
  void *v162;
  char v163;
  NSNumber *v164;
  NSNumber *dbCleanupXPCActivityDeleteReplayEventsThreshold;
  uint64_t v166;
  void *v167;
  char v168;
  void *v169;
  char v170;
  void *v171;
  char v172;
  NSNumber *v173;
  NSNumber *dbCleanupXPCActivityDeleteCandidatesThreshold;
  uint64_t v175;
  void *v176;
  char v177;
  void *v178;
  char v179;
  void *v180;
  char v181;
  NSNumber *v182;
  NSNumber *miloEnable;
  uint64_t v184;
  void *v185;
  char v186;
  void *v187;
  char v188;
  void *v189;
  char v190;
  NSNumber *v191;
  NSNumber *candidateLastUsedThrForMiLoLowLatancyPowerOpt;
  uint64_t v193;
  void *v194;
  char v195;
  void *v196;
  char v197;
  void *v198;
  char v199;
  NSNumber *v200;
  NSNumber *miloTimeoutForSetSpotOnRequestSeconds;
  uint64_t v202;
  void *v203;
  char v204;
  void *v205;
  char v206;
  void *v207;
  char v208;
  NSNumber *v209;
  NSNumber *miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts;
  uint64_t v211;
  void *v212;
  char v213;
  void *v214;
  char v215;
  void *v216;
  char v217;
  NSNumber *v218;
  NSNumber *ttrThrottleTimeSec;
  uint64_t v220;
  void *v221;
  char v222;
  void *v223;
  char v224;
  void *v225;
  char v226;
  NSNumber *v227;
  NSNumber *ttrPeriodicThrottleTimeSec;
  uint64_t v229;
  void *v230;
  char v231;
  void *v232;
  char v233;
  void *v234;
  char v235;
  NSNumber *v236;
  NSNumber *nearbyDeviceMeasurmentExpityTimeSeconds;
  uint64_t v238;
  void *v239;
  char v240;
  void *v241;
  char v242;
  void *v243;
  char v244;
  NSNumber *v245;
  NSNumber *proximitySessionRetryCountThreshold;
  uint64_t v247;
  void *v248;
  char v249;
  void *v250;
  char v251;
  void *v252;
  char v253;
  NSNumber *v254;
  NSNumber *nearbyDeviceRegionThreshold;
  uint64_t v256;
  void *v257;
  char v258;
  void *v259;
  char v260;
  void *v261;
  char v262;
  NSNumber *v263;
  NSNumber *uwbSuspendPedestrianFenceRadiusMeters;
  uint64_t v265;
  void *v266;
  char v267;
  void *v268;
  char v269;
  void *v270;
  char v271;
  NSNumber *v272;
  NSNumber *uwbSuspendPedestrianFenceEnable;
  uint64_t v274;
  void *v275;
  char v276;
  void *v277;
  char v278;
  void *v279;
  char v280;
  NSNumber *v281;
  NSNumber *replayWriterEventsSizeToBuffer;
  uint64_t v283;
  void *v284;
  char v285;
  void *v286;
  char v287;
  void *v288;
  char v289;
  NSNumber *v290;
  NSNumber *numberOfHistoryEventsInCache;
  uint64_t v292;
  void *v293;
  char v294;
  void *v295;
  char v296;
  void *v297;
  char v298;
  NSNumber *v299;
  NSNumber *numberOfEventsToSaveInDisk;
  uint64_t v301;
  void *v302;
  char v303;
  void *v304;
  char v305;
  void *v306;
  char v307;
  NSNumber *v308;
  NSNumber *coreAnalyticsEnable;
  uint64_t v310;
  void *v311;
  char v312;
  void *v313;
  char v314;
  void *v315;
  char v316;
  NSNumber *v317;
  NSNumber *coreAnalyticsXPCActivityInterval;
  uint64_t v319;
  void *v320;
  char v321;
  void *v322;
  char v323;
  void *v324;
  char v325;
  NSNumber *v326;
  NSNumber *coreAnalyticsXPCHistoryEventsValidThreshold;
  uint64_t v328;
  void *v329;
  char v330;
  void *v331;
  char v332;
  void *v333;
  char v334;
  NSNumber *v335;
  NSNumber *coreAnalyticsStatisticsCollectionPeriodInSeconds;
  uint64_t v337;
  void *v338;
  char v339;
  void *v340;
  char v341;
  void *v342;
  char v343;
  NSString *v344;
  NSString *coreAnalyticsWeeklyMobileAssetVersion;
  uint64_t v346;
  void *v347;
  char v348;
  void *v349;
  char v350;
  void *v351;
  char v352;
  NSNumber *v353;
  NSNumber *coreAnalyticsSessionEnable;
  uint64_t v355;
  void *v356;
  char v357;
  void *v358;
  char v359;
  void *v360;
  char v361;
  NSNumber *v362;
  NSNumber *coreAnalyticsSessionPeriodInSeconds;
  uint64_t v364;
  void *v365;
  char v366;
  void *v367;
  char v368;
  void *v369;
  char v370;
  NSNumber *v371;
  NSNumber *mediaRulesContinuityTimeIntervalInSeconds;
  uint64_t v373;
  void *v374;
  char v375;
  void *v376;
  char v377;
  void *v378;
  char v379;
  NSNumber *v380;
  NSNumber *mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds;
  uint64_t v382;
  void *v383;
  char v384;
  void *v385;
  char v386;
  void *v387;
  char v388;
  NSNumber *v389;
  NSNumber *mediaRulesPickerChoiceConsistencyEnable;
  uint64_t v391;
  void *v392;
  char v393;
  void *v394;
  char v395;
  void *v396;
  char v397;
  NSNumber *v398;
  NSNumber *mediaRulesUserRejectedInLastDayEnable;
  uint64_t v400;
  void *v401;
  char v402;
  void *v403;
  char v404;
  void *v405;
  char v406;
  NSNumber *v407;
  NSNumber *appleTvCtrlRulesContinuityTimeIntervalInSeconds;
  uint64_t v409;
  void *v410;
  char v411;
  void *v412;
  char v413;
  void *v414;
  char v415;
  NSNumber *v416;
  NSNumber *appInFocusWindowInSeconds;
  uint64_t v418;
  void *v419;
  char v420;
  void *v421;
  char v422;
  void *v423;
  char v424;
  NSNumber *v425;
  NSNumber *appInFocusWindowEnableOnServiceRun;
  uint64_t v427;
  void *v428;
  char v429;
  void *v430;
  char v431;
  void *v432;
  char v433;
  NSNumber *v434;
  NSNumber *bannersFromScreenUnlockToAppInFocusEnable;
  uint64_t v436;
  void *v437;
  char v438;
  void *v439;
  char v440;
  void *v441;
  char v442;
  NSNumber *v443;
  NSNumber *liveOnEnable;
  uint64_t v445;
  void *v446;
  char v447;
  void *v448;
  char v449;
  void *v450;
  char v451;
  NSNumber *v452;
  NSNumber *liveOnTtrDebugDataRequestsEnabled;
  uint64_t v454;
  void *v455;
  char v456;
  void *v457;
  char v458;
  void *v459;
  char v460;
  NSNumber *v461;
  NSNumber *liveOnTtrPeriodicDataRequestsEnabled;
  uint64_t v463;
  void *v464;
  char v465;
  void *v466;
  char v467;
  void *v468;
  char v469;
  NSNumber *v470;
  NSNumber *numberOfUsedCandidates;
  uint64_t v472;
  void *v473;
  char v474;
  void *v475;
  char v476;
  void *v477;
  char v478;
  NSNumber *v479;
  NSNumber *numberOfSeenCandidates;
  uint64_t v481;
  void *v482;
  char v483;
  void *v484;
  char v485;
  void *v486;
  char v487;
  NSNumber *v488;
  NSNumber *candidateUpdateTimeIntervalSeconds;
  uint64_t v490;
  void *v491;
  char v492;
  void *v493;
  char v494;
  void *v495;
  char v496;
  NSNumber *v497;
  NSNumber *uprankToAutorouteEligibilityThreshold3rdParty;
  uint64_t v499;
  void *v500;
  char v501;
  void *v502;
  char v503;
  void *v504;
  char v505;
  NSNumber *v506;
  NSNumber *uprankToOneTapEligibilityThreshold3rdParty;
  uint64_t v508;
  void *v509;
  char v510;
  void *v511;
  char v512;
  void *v513;
  char v514;
  NSNumber *v515;
  NSNumber *downrankToNoneEligibilityThreshold3rdParty;
  uint64_t v517;
  void *v518;
  char v519;
  void *v520;
  char v521;
  void *v522;
  char v523;
  NSNumber *v524;
  NSNumber *downrankToOneTapEligibilityThreshold3rdParty;
  uint64_t v526;
  void *v527;
  char v528;
  void *v529;
  char v530;
  void *v531;
  char v532;
  NSNumber *v533;
  NSNumber *eligibilityInitStateIsOneTap3rdParty;
  uint64_t v535;
  void *v536;
  char v537;
  void *v538;
  char v539;
  void *v540;
  char v541;
  NSNumber *v542;
  NSNumber *downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty;
  uint64_t v544;
  void *v545;
  char v546;
  void *v547;
  char v548;
  void *v549;
  char v550;
  NSNumber *v551;
  NSNumber *uprankToAutorouteEligibilityThreshold1stParty;
  uint64_t v553;
  void *v554;
  char v555;
  void *v556;
  char v557;
  void *v558;
  char v559;
  NSNumber *v560;
  NSNumber *uprankToOneTapEligibilityThreshold1stParty;
  uint64_t v562;
  void *v563;
  char v564;
  void *v565;
  char v566;
  void *v567;
  char v568;
  NSNumber *v569;
  NSNumber *downrankToNoneEligibilityThreshold1stParty;
  uint64_t v571;
  void *v572;
  char v573;
  void *v574;
  char v575;
  void *v576;
  char v577;
  NSNumber *v578;
  NSNumber *downrankToOneTapEligibilityThreshold1stParty;
  uint64_t v580;
  void *v581;
  char v582;
  void *v583;
  char v584;
  void *v585;
  char v586;
  NSNumber *v587;
  NSNumber *eligibilityInitStateIsOneTap1stParty;
  uint64_t v589;
  void *v590;
  char v591;
  void *v592;
  char v593;
  void *v594;
  char v595;
  NSNumber *v596;
  NSNumber *downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty;
  uint64_t v598;
  void *v599;
  char v600;
  void *v601;
  char v602;
  void *v603;
  char v604;
  NSNumber *v605;
  NSNumber *pickerAutoSelectToPicketChoiceMinInterval;
  uint64_t v607;
  void *v608;
  char v609;
  void *v610;
  char v611;
  void *v612;
  char v613;
  NSNumber *v614;
  NSNumber *brokeredUseScansForEligibilityOfMainDevice;
  uint64_t v616;
  void *v617;
  char v618;
  void *v619;
  char v620;
  void *v621;
  char v622;
  NSNumber *v623;
  NSNumber *brokeredUseScansForEligibilityOfSecondaryDevice;
  uint64_t v625;
  void *v626;
  char v627;
  void *v628;
  char v629;
  void *v630;
  char v631;
  NSNumber *v632;
  NSNumber *miloSameSpaceRatioThreshold;
  uint64_t v634;
  void *v635;
  char v636;
  void *v637;
  char v638;
  void *v639;
  char v640;
  NSNumber *v641;
  NSNumber *miloSameSpaceEventsTimeIntervalSeconds;
  uint64_t v643;
  void *v644;
  char v645;
  void *v646;
  char v647;
  void *v648;
  char v649;
  NSNumber *v650;
  NSNumber *miloSameSpaceEventsNumberOfEventsToWatch;
  uint64_t v652;
  void *v653;
  char v654;
  void *v655;
  char v656;
  void *v657;
  char v658;
  NSNumber *v659;
  NSNumber *loiSameSpaceEventsTimeIntervalSeconds;
  uint64_t v661;
  void *v662;
  char v663;
  void *v664;
  char v665;
  void *v666;
  char v667;
  NSNumber *v668;
  NSNumber *loiSameSpaceEventsNumberOfEventsToWatch;
  uint64_t v670;
  void *v671;
  char v672;
  void *v673;
  char v674;
  void *v675;
  char v676;
  void *v677;
  NSArray *v678;
  NSArray *loiSameSpaceOverrideBrokerForAVODIDArray;
  uint64_t v680;
  void *v681;
  char v682;
  void *v683;
  char v684;
  void *v685;
  char v686;
  void *v687;
  NSArray *v688;
  NSArray *loiSameSpaceOverrideBrokerForCandidateIDArray;
  uint64_t v690;
  void *v691;
  char v692;
  void *v693;
  char v694;
  void *v695;
  char v696;
  NSNumber *v697;
  NSNumber *candidateSelectorMostUsedSimilarAppTimeIntervalSeconds;
  uint64_t v699;
  void *v700;
  char v701;
  void *v702;
  char v703;
  void *v704;
  char v705;
  NSNumber *v706;
  NSNumber *candidateSelectorMostUsedAnyAppTimeIntervalSeconds;
  uint64_t v708;
  void *v709;
  char v710;
  void *v711;
  char v712;
  void *v713;
  char v714;
  NSNumber *v715;
  NSNumber *candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds;
  uint64_t v717;
  void *v718;
  char v719;
  void *v720;
  char v721;
  void *v722;
  char v723;
  NSNumber *v724;
  NSNumber *candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents;
  uint64_t v726;
  void *v727;
  char v728;
  void *v729;
  char v730;
  void *v731;
  char v732;
  NSNumber *v733;
  NSNumber *candidateSelectorMostUsedAnyAppMaximumNumberOfEvents;
  uint64_t v735;
  void *v736;
  char v737;
  void *v738;
  char v739;
  void *v740;
  char v741;
  NSNumber *v742;
  NSNumber *candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents;
  uint64_t v744;
  void *v745;
  char v746;
  void *v747;
  char v748;
  void *v749;
  char v750;
  NSNumber *v751;
  NSNumber *candidateSelectorIsContinuityEnabled;
  uint64_t v753;
  void *v754;
  char v755;
  void *v756;
  char v757;
  void *v758;
  char v759;
  NSNumber *v760;
  NSNumber *candidateSelectorIsMostUsedSimilarAppEnabled;
  uint64_t v762;
  void *v763;
  char v764;
  void *v765;
  char v766;
  void *v767;
  char v768;
  NSNumber *v769;
  NSNumber *candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled;
  uint64_t v771;
  void *v772;
  char v773;
  void *v774;
  char v775;
  void *v776;
  char v777;
  NSNumber *v778;
  NSNumber *candidateSelectorIsNearestRangeEnabled;
  uint64_t v780;
  void *v781;
  char v782;
  void *v783;
  char v784;
  void *v785;
  char v786;
  NSNumber *v787;
  NSNumber *candidateSelectorIsMostUsedAnyAppEnabled;
  uint64_t v789;
  void *v790;
  char v791;
  void *v792;
  char v793;
  void *v794;
  char v795;
  NSNumber *v796;
  NSNumber *candidateSelectorAllowSelectByUWB;
  uint64_t v798;
  void *v799;
  char v800;
  void *v801;
  char v802;
  void *v803;
  char v804;
  NSNumber *v805;
  NSNumber *candidateSelectorAllowSelectByMiLo;
  uint64_t v807;
  void *v808;
  char v809;
  void *v810;
  char v811;
  void *v812;
  char v813;
  NSNumber *v814;
  NSNumber *candidateSelectorAllowSelectByBLE;
  uint64_t v816;
  void *v817;
  char v818;
  void *v819;
  char v820;
  void *v821;
  char v822;
  NSNumber *v823;
  NSNumber *candidateSelectorAllowSelectByLOI;
  uint64_t v825;
  void *v826;
  char v827;
  void *v828;
  char v829;
  void *v830;
  char v831;
  NSNumber *v832;
  NSNumber *candidateSelectorAllowSelectByPDRFence;
  uint64_t v834;
  void *v835;
  char v836;
  void *v837;
  char v838;
  void *v839;
  char v840;
  NSNumber *v841;
  NSNumber *candidateSelectorCallToActionAppearThreshold;
  uint64_t v843;
  void *v844;
  char v845;
  void *v846;
  char v847;
  void *v848;
  char v849;
  NSNumber *v850;
  NSNumber *pdrFenceRadiusInMeters;
  uint64_t v852;
  void *v853;
  char v854;
  void *v855;
  char v856;
  void *v857;
  char v858;
  NSNumber *v859;
  NSNumber *pdrFenceRadiusTimeoutInSeconds;
  uint64_t v861;
  void *v862;
  char v863;
  void *v864;
  char v865;
  void *v866;
  char v867;
  NSNumber *v868;
  NSNumber *pdrFenceOtherThanRadiusTimeoutInSeconds;
  uint64_t v870;
  void *v871;
  char v872;
  void *v873;
  char v874;
  void *v875;
  char v876;
  NSNumber *v877;
  NSNumber *miloRoomDetectionInCustomLOIEnabled;
  uint64_t v879;
  void *v880;
  char v881;
  void *v882;
  char v883;
  void *v884;
  char v885;
  NSNumber *v886;
  NSNumber *timeInSecondsWithoutUsageToAggressiveFiltering;
  uint64_t v888;
  void *v889;
  char v890;
  void *v891;
  char v892;
  void *v893;
  char v894;
  NSNumber *v895;
  NSNumber *timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering;
  uint64_t v897;
  void *v898;
  char v899;
  void *v900;
  char v901;
  void *v902;
  char v903;
  NSDate *v904;
  NSDate *startDateForSignificantBundlesLookup;
  id v906;

  v3 = objc_opt_class();
  -[IRPreferences testPreferenceString](self, "testPreferenceString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    v3 = objc_opt_class();
  -[IRPreferences testPreferenceString](self, "testPreferenceString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = objc_opt_isKindOfClass();

  if ((v7 & 1) != 0)
    v3 = objc_opt_class();
  -[IRPreferences testPreferenceString](self, "testPreferenceString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v9 = objc_opt_isKindOfClass();

  if ((v9 & 1) != 0)
    v3 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRtestPreferenceString"), CFSTR("defaultValue"), v3);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  testPreferenceString = self->_testPreferenceString;
  self->_testPreferenceString = v10;

  v12 = objc_opt_class();
  -[IRPreferences testPreferenceInteger](self, "testPreferenceInteger");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v14 = objc_opt_isKindOfClass();

  if ((v14 & 1) != 0)
    v12 = objc_opt_class();
  -[IRPreferences testPreferenceInteger](self, "testPreferenceInteger");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v16 = objc_opt_isKindOfClass();

  if ((v16 & 1) != 0)
    v12 = objc_opt_class();
  -[IRPreferences testPreferenceInteger](self, "testPreferenceInteger");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v18 = objc_opt_isKindOfClass();

  if ((v18 & 1) != 0)
    v12 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRtestPreferenceInteger"), &unk_25105EC18, v12);
  v19 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  testPreferenceInteger = self->_testPreferenceInteger;
  self->_testPreferenceInteger = v19;

  v21 = objc_opt_class();
  -[IRPreferences testPreferenceDouble](self, "testPreferenceDouble");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v23 = objc_opt_isKindOfClass();

  if ((v23 & 1) != 0)
    v21 = objc_opt_class();
  -[IRPreferences testPreferenceDouble](self, "testPreferenceDouble");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v25 = objc_opt_isKindOfClass();

  if ((v25 & 1) != 0)
    v21 = objc_opt_class();
  -[IRPreferences testPreferenceDouble](self, "testPreferenceDouble");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v27 = objc_opt_isKindOfClass();

  if ((v27 & 1) != 0)
    v21 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRtestPreferenceDouble"), &unk_25105F018, v21);
  v28 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  testPreferenceDouble = self->_testPreferenceDouble;
  self->_testPreferenceDouble = v28;

  v30 = objc_opt_class();
  -[IRPreferences overrideIsAirplayForCandidateIDArray](self, "overrideIsAirplayForCandidateIDArray");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v32 = objc_opt_isKindOfClass();

  if ((v32 & 1) != 0)
    v30 = objc_opt_class();
  -[IRPreferences overrideIsAirplayForCandidateIDArray](self, "overrideIsAirplayForCandidateIDArray");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v34 = objc_opt_isKindOfClass();

  if ((v34 & 1) != 0)
    v30 = objc_opt_class();
  -[IRPreferences overrideIsAirplayForCandidateIDArray](self, "overrideIsAirplayForCandidateIDArray");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v36 = objc_opt_isKindOfClass();

  if ((v36 & 1) != 0)
    v30 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRoverrideIsAirplayForCandidateIDArray"), v37, v30);
  v38 = (NSArray *)objc_claimAutoreleasedReturnValue();
  overrideIsAirplayForCandidateIDArray = self->_overrideIsAirplayForCandidateIDArray;
  self->_overrideIsAirplayForCandidateIDArray = v38;

  v40 = objc_opt_class();
  -[IRPreferences testMobileAssetLoad](self, "testMobileAssetLoad");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v42 = objc_opt_isKindOfClass();

  if ((v42 & 1) != 0)
    v40 = objc_opt_class();
  -[IRPreferences testMobileAssetLoad](self, "testMobileAssetLoad");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v44 = objc_opt_isKindOfClass();

  if ((v44 & 1) != 0)
    v40 = objc_opt_class();
  -[IRPreferences testMobileAssetLoad](self, "testMobileAssetLoad");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v46 = objc_opt_isKindOfClass();

  if ((v46 & 1) != 0)
    v40 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRtestMobileAssetLoad"), &unk_25105EC30, v40);
  v47 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  testMobileAssetLoad = self->_testMobileAssetLoad;
  self->_testMobileAssetLoad = v47;

  v49 = objc_opt_class();
  -[IRPreferences loadMobileAssetXPCActivityInterval](self, "loadMobileAssetXPCActivityInterval");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v51 = objc_opt_isKindOfClass();

  if ((v51 & 1) != 0)
    v49 = objc_opt_class();
  -[IRPreferences loadMobileAssetXPCActivityInterval](self, "loadMobileAssetXPCActivityInterval");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v53 = objc_opt_isKindOfClass();

  if ((v53 & 1) != 0)
    v49 = objc_opt_class();
  -[IRPreferences loadMobileAssetXPCActivityInterval](self, "loadMobileAssetXPCActivityInterval");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v55 = objc_opt_isKindOfClass();

  if ((v55 & 1) != 0)
    v49 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRloadMobileAssetXPCActivityInterval"), &unk_25105EC48, v49);
  v56 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  loadMobileAssetXPCActivityInterval = self->_loadMobileAssetXPCActivityInterval;
  self->_loadMobileAssetXPCActivityInterval = v56;

  v58 = objc_opt_class();
  -[IRPreferences bleRssiProximityThreshold](self, "bleRssiProximityThreshold");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v60 = objc_opt_isKindOfClass();

  if ((v60 & 1) != 0)
    v58 = objc_opt_class();
  -[IRPreferences bleRssiProximityThreshold](self, "bleRssiProximityThreshold");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v62 = objc_opt_isKindOfClass();

  if ((v62 & 1) != 0)
    v58 = objc_opt_class();
  -[IRPreferences bleRssiProximityThreshold](self, "bleRssiProximityThreshold");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v64 = objc_opt_isKindOfClass();

  if ((v64 & 1) != 0)
    v58 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRbleRssiProximityThreshold"), &unk_25105F028, v58);
  v65 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  bleRssiProximityThreshold = self->_bleRssiProximityThreshold;
  self->_bleRssiProximityThreshold = v65;

  v67 = objc_opt_class();
  -[IRPreferences deviceRangeProximityThreshold](self, "deviceRangeProximityThreshold");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v69 = objc_opt_isKindOfClass();

  if ((v69 & 1) != 0)
    v67 = objc_opt_class();
  -[IRPreferences deviceRangeProximityThreshold](self, "deviceRangeProximityThreshold");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v71 = objc_opt_isKindOfClass();

  if ((v71 & 1) != 0)
    v67 = objc_opt_class();
  -[IRPreferences deviceRangeProximityThreshold](self, "deviceRangeProximityThreshold");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v73 = objc_opt_isKindOfClass();

  if ((v73 & 1) != 0)
    v67 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdeviceRangeProximityThreshold"), &unk_25105F038, v67);
  v74 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  deviceRangeProximityThreshold = self->_deviceRangeProximityThreshold;
  self->_deviceRangeProximityThreshold = v74;

  v76 = objc_opt_class();
  -[IRPreferences miloLslIsSameMiloThreshold](self, "miloLslIsSameMiloThreshold");
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v78 = objc_opt_isKindOfClass();

  if ((v78 & 1) != 0)
    v76 = objc_opt_class();
  -[IRPreferences miloLslIsSameMiloThreshold](self, "miloLslIsSameMiloThreshold");
  v79 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v80 = objc_opt_isKindOfClass();

  if ((v80 & 1) != 0)
    v76 = objc_opt_class();
  -[IRPreferences miloLslIsSameMiloThreshold](self, "miloLslIsSameMiloThreshold");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v82 = objc_opt_isKindOfClass();

  if ((v82 & 1) != 0)
    v76 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmiloLslIsSameMiloThreshold"), &unk_25105F048, v76);
  v83 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  miloLslIsSameMiloThreshold = self->_miloLslIsSameMiloThreshold;
  self->_miloLslIsSameMiloThreshold = v83;

  v85 = objc_opt_class();
  -[IRPreferences pickerChoiceOverrideIntervalSeconds](self, "pickerChoiceOverrideIntervalSeconds");
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v87 = objc_opt_isKindOfClass();

  if ((v87 & 1) != 0)
    v85 = objc_opt_class();
  -[IRPreferences pickerChoiceOverrideIntervalSeconds](self, "pickerChoiceOverrideIntervalSeconds");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v89 = objc_opt_isKindOfClass();

  if ((v89 & 1) != 0)
    v85 = objc_opt_class();
  -[IRPreferences pickerChoiceOverrideIntervalSeconds](self, "pickerChoiceOverrideIntervalSeconds");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v91 = objc_opt_isKindOfClass();

  if ((v91 & 1) != 0)
    v85 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRpickerChoiceOverrideIntervalSeconds"), &unk_25105EC60, v85);
  v92 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pickerChoiceOverrideIntervalSeconds = self->_pickerChoiceOverrideIntervalSeconds;
  self->_pickerChoiceOverrideIntervalSeconds = v92;

  v94 = objc_opt_class();
  -[IRPreferences mediaPlaybackEventsTimeIntervalThreshold](self, "mediaPlaybackEventsTimeIntervalThreshold");
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v96 = objc_opt_isKindOfClass();

  if ((v96 & 1) != 0)
    v94 = objc_opt_class();
  -[IRPreferences mediaPlaybackEventsTimeIntervalThreshold](self, "mediaPlaybackEventsTimeIntervalThreshold");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v98 = objc_opt_isKindOfClass();

  if ((v98 & 1) != 0)
    v94 = objc_opt_class();
  -[IRPreferences mediaPlaybackEventsTimeIntervalThreshold](self, "mediaPlaybackEventsTimeIntervalThreshold");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v100 = objc_opt_isKindOfClass();

  if ((v100 & 1) != 0)
    v94 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmediaPlaybackEventsTimeIntervalThreshold"), &unk_25105EC78, v94);
  v101 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  mediaPlaybackEventsTimeIntervalThreshold = self->_mediaPlaybackEventsTimeIntervalThreshold;
  self->_mediaPlaybackEventsTimeIntervalThreshold = v101;

  v103 = objc_opt_class();
  -[IRPreferences appleTvCtrlEventsTimeIntervalThreshold](self, "appleTvCtrlEventsTimeIntervalThreshold");
  v104 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v105 = objc_opt_isKindOfClass();

  if ((v105 & 1) != 0)
    v103 = objc_opt_class();
  -[IRPreferences appleTvCtrlEventsTimeIntervalThreshold](self, "appleTvCtrlEventsTimeIntervalThreshold");
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v107 = objc_opt_isKindOfClass();

  if ((v107 & 1) != 0)
    v103 = objc_opt_class();
  -[IRPreferences appleTvCtrlEventsTimeIntervalThreshold](self, "appleTvCtrlEventsTimeIntervalThreshold");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v109 = objc_opt_isKindOfClass();

  if ((v109 & 1) != 0)
    v103 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRappleTvCtrlEventsTimeIntervalThreshold"), &unk_25105EC60, v103);
  v110 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  appleTvCtrlEventsTimeIntervalThreshold = self->_appleTvCtrlEventsTimeIntervalThreshold;
  self->_appleTvCtrlEventsTimeIntervalThreshold = v110;

  v112 = objc_opt_class();
  -[IRPreferences mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds](self, "mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v114 = objc_opt_isKindOfClass();

  if ((v114 & 1) != 0)
    v112 = objc_opt_class();
  -[IRPreferences mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds](self, "mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v116 = objc_opt_isKindOfClass();

  if ((v116 & 1) != 0)
    v112 = objc_opt_class();
  -[IRPreferences mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds](self, "mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds");
  v117 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v118 = objc_opt_isKindOfClass();

  if ((v118 & 1) != 0)
    v112 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds"), &unk_25105EC78, v112);
  v119 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds = self->_mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds;
  self->_mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds = v119;

  v121 = objc_opt_class();
  -[IRPreferences mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds](self, "mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds");
  v122 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v123 = objc_opt_isKindOfClass();

  if ((v123 & 1) != 0)
    v121 = objc_opt_class();
  -[IRPreferences mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds](self, "mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds");
  v124 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v125 = objc_opt_isKindOfClass();

  if ((v125 & 1) != 0)
    v121 = objc_opt_class();
  -[IRPreferences mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds](self, "mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v127 = objc_opt_isKindOfClass();

  if ((v127 & 1) != 0)
    v121 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds"), &unk_25105EC78, v121);
  v128 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds = self->_mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds;
  self->_mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds = v128;

  v130 = objc_opt_class();
  -[IRPreferences cleanupXPCActivityInterval](self, "cleanupXPCActivityInterval");
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v132 = objc_opt_isKindOfClass();

  if ((v132 & 1) != 0)
    v130 = objc_opt_class();
  -[IRPreferences cleanupXPCActivityInterval](self, "cleanupXPCActivityInterval");
  v133 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v134 = objc_opt_isKindOfClass();

  if ((v134 & 1) != 0)
    v130 = objc_opt_class();
  -[IRPreferences cleanupXPCActivityInterval](self, "cleanupXPCActivityInterval");
  v135 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v136 = objc_opt_isKindOfClass();

  if ((v136 & 1) != 0)
    v130 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcleanupXPCActivityInterval"), &unk_25105EC48, v130);
  v137 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  cleanupXPCActivityInterval = self->_cleanupXPCActivityInterval;
  self->_cleanupXPCActivityInterval = v137;

  v139 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteServiceThreshold](self, "dbCleanupXPCActivityDeleteServiceThreshold");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v141 = objc_opt_isKindOfClass();

  if ((v141 & 1) != 0)
    v139 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteServiceThreshold](self, "dbCleanupXPCActivityDeleteServiceThreshold");
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v143 = objc_opt_isKindOfClass();

  if ((v143 & 1) != 0)
    v139 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteServiceThreshold](self, "dbCleanupXPCActivityDeleteServiceThreshold");
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v145 = objc_opt_isKindOfClass();

  if ((v145 & 1) != 0)
    v139 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdbCleanupXPCActivityDeleteServiceThreshold"), &unk_25105EC90, v139);
  v146 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  dbCleanupXPCActivityDeleteServiceThreshold = self->_dbCleanupXPCActivityDeleteServiceThreshold;
  self->_dbCleanupXPCActivityDeleteServiceThreshold = v146;

  v148 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteHistoryEventsThreshold](self, "dbCleanupXPCActivityDeleteHistoryEventsThreshold");
  v149 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v150 = objc_opt_isKindOfClass();

  if ((v150 & 1) != 0)
    v148 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteHistoryEventsThreshold](self, "dbCleanupXPCActivityDeleteHistoryEventsThreshold");
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v152 = objc_opt_isKindOfClass();

  if ((v152 & 1) != 0)
    v148 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteHistoryEventsThreshold](self, "dbCleanupXPCActivityDeleteHistoryEventsThreshold");
  v153 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v154 = objc_opt_isKindOfClass();

  if ((v154 & 1) != 0)
    v148 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdbCleanupXPCActivityDeleteHistoryEventsThreshold"), &unk_25105EC90, v148);
  v155 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  dbCleanupXPCActivityDeleteHistoryEventsThreshold = self->_dbCleanupXPCActivityDeleteHistoryEventsThreshold;
  self->_dbCleanupXPCActivityDeleteHistoryEventsThreshold = v155;

  v157 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteReplayEventsThreshold](self, "dbCleanupXPCActivityDeleteReplayEventsThreshold");
  v158 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v159 = objc_opt_isKindOfClass();

  if ((v159 & 1) != 0)
    v157 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteReplayEventsThreshold](self, "dbCleanupXPCActivityDeleteReplayEventsThreshold");
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v161 = objc_opt_isKindOfClass();

  if ((v161 & 1) != 0)
    v157 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteReplayEventsThreshold](self, "dbCleanupXPCActivityDeleteReplayEventsThreshold");
  v162 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v163 = objc_opt_isKindOfClass();

  if ((v163 & 1) != 0)
    v157 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdbCleanupXPCActivityDeleteReplayEventsThreshold"), &unk_25105EC90, v157);
  v164 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  dbCleanupXPCActivityDeleteReplayEventsThreshold = self->_dbCleanupXPCActivityDeleteReplayEventsThreshold;
  self->_dbCleanupXPCActivityDeleteReplayEventsThreshold = v164;

  v166 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteCandidatesThreshold](self, "dbCleanupXPCActivityDeleteCandidatesThreshold");
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v168 = objc_opt_isKindOfClass();

  if ((v168 & 1) != 0)
    v166 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteCandidatesThreshold](self, "dbCleanupXPCActivityDeleteCandidatesThreshold");
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v170 = objc_opt_isKindOfClass();

  if ((v170 & 1) != 0)
    v166 = objc_opt_class();
  -[IRPreferences dbCleanupXPCActivityDeleteCandidatesThreshold](self, "dbCleanupXPCActivityDeleteCandidatesThreshold");
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v172 = objc_opt_isKindOfClass();

  if ((v172 & 1) != 0)
    v166 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdbCleanupXPCActivityDeleteCandidatesThreshold"), &unk_25105EC90, v166);
  v173 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  dbCleanupXPCActivityDeleteCandidatesThreshold = self->_dbCleanupXPCActivityDeleteCandidatesThreshold;
  self->_dbCleanupXPCActivityDeleteCandidatesThreshold = v173;

  v175 = objc_opt_class();
  -[IRPreferences miloEnable](self, "miloEnable");
  v176 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v177 = objc_opt_isKindOfClass();

  if ((v177 & 1) != 0)
    v175 = objc_opt_class();
  -[IRPreferences miloEnable](self, "miloEnable");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v179 = objc_opt_isKindOfClass();

  if ((v179 & 1) != 0)
    v175 = objc_opt_class();
  -[IRPreferences miloEnable](self, "miloEnable");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v181 = objc_opt_isKindOfClass();

  if ((v181 & 1) != 0)
    v175 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmiloEnable"), MEMORY[0x24BDBD1C8], v175);
  v182 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  miloEnable = self->_miloEnable;
  self->_miloEnable = v182;

  v184 = objc_opt_class();
  -[IRPreferences candidateLastUsedThrForMiLoLowLatancyPowerOpt](self, "candidateLastUsedThrForMiLoLowLatancyPowerOpt");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v186 = objc_opt_isKindOfClass();

  if ((v186 & 1) != 0)
    v184 = objc_opt_class();
  -[IRPreferences candidateLastUsedThrForMiLoLowLatancyPowerOpt](self, "candidateLastUsedThrForMiLoLowLatancyPowerOpt");
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v188 = objc_opt_isKindOfClass();

  if ((v188 & 1) != 0)
    v184 = objc_opt_class();
  -[IRPreferences candidateLastUsedThrForMiLoLowLatancyPowerOpt](self, "candidateLastUsedThrForMiLoLowLatancyPowerOpt");
  v189 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v190 = objc_opt_isKindOfClass();

  if ((v190 & 1) != 0)
    v184 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateLastUsedThrForMiLoLowLatancyPowerOpt"), &unk_25105EC90, v184);
  v191 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateLastUsedThrForMiLoLowLatancyPowerOpt = self->_candidateLastUsedThrForMiLoLowLatancyPowerOpt;
  self->_candidateLastUsedThrForMiLoLowLatancyPowerOpt = v191;

  v193 = objc_opt_class();
  -[IRPreferences miloTimeoutForSetSpotOnRequestSeconds](self, "miloTimeoutForSetSpotOnRequestSeconds");
  v194 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v195 = objc_opt_isKindOfClass();

  if ((v195 & 1) != 0)
    v193 = objc_opt_class();
  -[IRPreferences miloTimeoutForSetSpotOnRequestSeconds](self, "miloTimeoutForSetSpotOnRequestSeconds");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v197 = objc_opt_isKindOfClass();

  if ((v197 & 1) != 0)
    v193 = objc_opt_class();
  -[IRPreferences miloTimeoutForSetSpotOnRequestSeconds](self, "miloTimeoutForSetSpotOnRequestSeconds");
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v199 = objc_opt_isKindOfClass();

  if ((v199 & 1) != 0)
    v193 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmiloTimeoutForSetSpotOnRequestSeconds"), &unk_25105EC78, v193);
  v200 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  miloTimeoutForSetSpotOnRequestSeconds = self->_miloTimeoutForSetSpotOnRequestSeconds;
  self->_miloTimeoutForSetSpotOnRequestSeconds = v200;

  v202 = objc_opt_class();
  -[IRPreferences miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts](self, "miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v204 = objc_opt_isKindOfClass();

  if ((v204 & 1) != 0)
    v202 = objc_opt_class();
  -[IRPreferences miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts](self, "miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts");
  v205 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v206 = objc_opt_isKindOfClass();

  if ((v206 & 1) != 0)
    v202 = objc_opt_class();
  -[IRPreferences miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts](self, "miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts");
  v207 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v208 = objc_opt_isKindOfClass();

  if ((v208 & 1) != 0)
    v202 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmiLoProviderMaxNumberOfConsecutiveMiLoFailAttempts"), &unk_25105ECA8, v202);
  v209 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts = self->_miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts;
  self->_miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts = v209;

  v211 = objc_opt_class();
  -[IRPreferences ttrThrottleTimeSec](self, "ttrThrottleTimeSec");
  v212 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v213 = objc_opt_isKindOfClass();

  if ((v213 & 1) != 0)
    v211 = objc_opt_class();
  -[IRPreferences ttrThrottleTimeSec](self, "ttrThrottleTimeSec");
  v214 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v215 = objc_opt_isKindOfClass();

  if ((v215 & 1) != 0)
    v211 = objc_opt_class();
  -[IRPreferences ttrThrottleTimeSec](self, "ttrThrottleTimeSec");
  v216 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v217 = objc_opt_isKindOfClass();

  if ((v217 & 1) != 0)
    v211 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRttrThrottleTimeSec"), &unk_25105EC48, v211);
  v218 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  ttrThrottleTimeSec = self->_ttrThrottleTimeSec;
  self->_ttrThrottleTimeSec = v218;

  v220 = objc_opt_class();
  -[IRPreferences ttrPeriodicThrottleTimeSec](self, "ttrPeriodicThrottleTimeSec");
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v222 = objc_opt_isKindOfClass();

  if ((v222 & 1) != 0)
    v220 = objc_opt_class();
  -[IRPreferences ttrPeriodicThrottleTimeSec](self, "ttrPeriodicThrottleTimeSec");
  v223 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v224 = objc_opt_isKindOfClass();

  if ((v224 & 1) != 0)
    v220 = objc_opt_class();
  -[IRPreferences ttrPeriodicThrottleTimeSec](self, "ttrPeriodicThrottleTimeSec");
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v226 = objc_opt_isKindOfClass();

  if ((v226 & 1) != 0)
    v220 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRttrPeriodicThrottleTimeSec"), &unk_25105ECC0, v220);
  v227 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  ttrPeriodicThrottleTimeSec = self->_ttrPeriodicThrottleTimeSec;
  self->_ttrPeriodicThrottleTimeSec = v227;

  v229 = objc_opt_class();
  -[IRPreferences nearbyDeviceMeasurmentExpityTimeSeconds](self, "nearbyDeviceMeasurmentExpityTimeSeconds");
  v230 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v231 = objc_opt_isKindOfClass();

  if ((v231 & 1) != 0)
    v229 = objc_opt_class();
  -[IRPreferences nearbyDeviceMeasurmentExpityTimeSeconds](self, "nearbyDeviceMeasurmentExpityTimeSeconds");
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v233 = objc_opt_isKindOfClass();

  if ((v233 & 1) != 0)
    v229 = objc_opt_class();
  -[IRPreferences nearbyDeviceMeasurmentExpityTimeSeconds](self, "nearbyDeviceMeasurmentExpityTimeSeconds");
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v235 = objc_opt_isKindOfClass();

  if ((v235 & 1) != 0)
    v229 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRnearbyDeviceMeasurmentExpityTimeSeconds"), &unk_25105ECD8, v229);
  v236 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  nearbyDeviceMeasurmentExpityTimeSeconds = self->_nearbyDeviceMeasurmentExpityTimeSeconds;
  self->_nearbyDeviceMeasurmentExpityTimeSeconds = v236;

  v238 = objc_opt_class();
  -[IRPreferences proximitySessionRetryCountThreshold](self, "proximitySessionRetryCountThreshold");
  v239 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v240 = objc_opt_isKindOfClass();

  if ((v240 & 1) != 0)
    v238 = objc_opt_class();
  -[IRPreferences proximitySessionRetryCountThreshold](self, "proximitySessionRetryCountThreshold");
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v242 = objc_opt_isKindOfClass();

  if ((v242 & 1) != 0)
    v238 = objc_opt_class();
  -[IRPreferences proximitySessionRetryCountThreshold](self, "proximitySessionRetryCountThreshold");
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v244 = objc_opt_isKindOfClass();

  if ((v244 & 1) != 0)
    v238 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRproximitySessionRetryCountThreshold"), &unk_25105ECF0, v238);
  v245 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  proximitySessionRetryCountThreshold = self->_proximitySessionRetryCountThreshold;
  self->_proximitySessionRetryCountThreshold = v245;

  v247 = objc_opt_class();
  -[IRPreferences nearbyDeviceRegionThreshold](self, "nearbyDeviceRegionThreshold");
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v249 = objc_opt_isKindOfClass();

  if ((v249 & 1) != 0)
    v247 = objc_opt_class();
  -[IRPreferences nearbyDeviceRegionThreshold](self, "nearbyDeviceRegionThreshold");
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v251 = objc_opt_isKindOfClass();

  if ((v251 & 1) != 0)
    v247 = objc_opt_class();
  -[IRPreferences nearbyDeviceRegionThreshold](self, "nearbyDeviceRegionThreshold");
  v252 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v253 = objc_opt_isKindOfClass();

  if ((v253 & 1) != 0)
    v247 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRnearbyDeviceRegionThreshold"), &unk_25105ED08, v247);
  v254 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  nearbyDeviceRegionThreshold = self->_nearbyDeviceRegionThreshold;
  self->_nearbyDeviceRegionThreshold = v254;

  v256 = objc_opt_class();
  -[IRPreferences uwbSuspendPedestrianFenceRadiusMeters](self, "uwbSuspendPedestrianFenceRadiusMeters");
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v258 = objc_opt_isKindOfClass();

  if ((v258 & 1) != 0)
    v256 = objc_opt_class();
  -[IRPreferences uwbSuspendPedestrianFenceRadiusMeters](self, "uwbSuspendPedestrianFenceRadiusMeters");
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v260 = objc_opt_isKindOfClass();

  if ((v260 & 1) != 0)
    v256 = objc_opt_class();
  -[IRPreferences uwbSuspendPedestrianFenceRadiusMeters](self, "uwbSuspendPedestrianFenceRadiusMeters");
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v262 = objc_opt_isKindOfClass();

  if ((v262 & 1) != 0)
    v256 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRuwbSuspendPedestrianFenceRadiusMeters"), &unk_25105F058, v256);
  v263 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  uwbSuspendPedestrianFenceRadiusMeters = self->_uwbSuspendPedestrianFenceRadiusMeters;
  self->_uwbSuspendPedestrianFenceRadiusMeters = v263;

  v265 = objc_opt_class();
  -[IRPreferences uwbSuspendPedestrianFenceEnable](self, "uwbSuspendPedestrianFenceEnable");
  v266 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v267 = objc_opt_isKindOfClass();

  if ((v267 & 1) != 0)
    v265 = objc_opt_class();
  -[IRPreferences uwbSuspendPedestrianFenceEnable](self, "uwbSuspendPedestrianFenceEnable");
  v268 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v269 = objc_opt_isKindOfClass();

  if ((v269 & 1) != 0)
    v265 = objc_opt_class();
  -[IRPreferences uwbSuspendPedestrianFenceEnable](self, "uwbSuspendPedestrianFenceEnable");
  v270 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v271 = objc_opt_isKindOfClass();

  if ((v271 & 1) != 0)
    v265 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRuwbSuspendPedestrianFenceEnable"), &unk_25105ED20, v265);
  v272 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  uwbSuspendPedestrianFenceEnable = self->_uwbSuspendPedestrianFenceEnable;
  self->_uwbSuspendPedestrianFenceEnable = v272;

  v274 = objc_opt_class();
  -[IRPreferences replayWriterEventsSizeToBuffer](self, "replayWriterEventsSizeToBuffer");
  v275 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v276 = objc_opt_isKindOfClass();

  if ((v276 & 1) != 0)
    v274 = objc_opt_class();
  -[IRPreferences replayWriterEventsSizeToBuffer](self, "replayWriterEventsSizeToBuffer");
  v277 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v278 = objc_opt_isKindOfClass();

  if ((v278 & 1) != 0)
    v274 = objc_opt_class();
  -[IRPreferences replayWriterEventsSizeToBuffer](self, "replayWriterEventsSizeToBuffer");
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v280 = objc_opt_isKindOfClass();

  if ((v280 & 1) != 0)
    v274 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRreplayWriterEventsSizeToBuffer"), &unk_25105ED38, v274);
  v281 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  replayWriterEventsSizeToBuffer = self->_replayWriterEventsSizeToBuffer;
  self->_replayWriterEventsSizeToBuffer = v281;

  v283 = objc_opt_class();
  -[IRPreferences numberOfHistoryEventsInCache](self, "numberOfHistoryEventsInCache");
  v284 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v285 = objc_opt_isKindOfClass();

  if ((v285 & 1) != 0)
    v283 = objc_opt_class();
  -[IRPreferences numberOfHistoryEventsInCache](self, "numberOfHistoryEventsInCache");
  v286 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v287 = objc_opt_isKindOfClass();

  if ((v287 & 1) != 0)
    v283 = objc_opt_class();
  -[IRPreferences numberOfHistoryEventsInCache](self, "numberOfHistoryEventsInCache");
  v288 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v289 = objc_opt_isKindOfClass();

  if ((v289 & 1) != 0)
    v283 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRnumberOfHistoryEventsInCache"), &unk_25105ED50, v283);
  v290 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  numberOfHistoryEventsInCache = self->_numberOfHistoryEventsInCache;
  self->_numberOfHistoryEventsInCache = v290;

  v292 = objc_opt_class();
  -[IRPreferences numberOfEventsToSaveInDisk](self, "numberOfEventsToSaveInDisk");
  v293 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v294 = objc_opt_isKindOfClass();

  if ((v294 & 1) != 0)
    v292 = objc_opt_class();
  -[IRPreferences numberOfEventsToSaveInDisk](self, "numberOfEventsToSaveInDisk");
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v296 = objc_opt_isKindOfClass();

  if ((v296 & 1) != 0)
    v292 = objc_opt_class();
  -[IRPreferences numberOfEventsToSaveInDisk](self, "numberOfEventsToSaveInDisk");
  v297 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v298 = objc_opt_isKindOfClass();

  if ((v298 & 1) != 0)
    v292 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRnumberOfEventsToSaveInDisk"), &unk_25105ED68, v292);
  v299 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  numberOfEventsToSaveInDisk = self->_numberOfEventsToSaveInDisk;
  self->_numberOfEventsToSaveInDisk = v299;

  v301 = objc_opt_class();
  -[IRPreferences coreAnalyticsEnable](self, "coreAnalyticsEnable");
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v303 = objc_opt_isKindOfClass();

  if ((v303 & 1) != 0)
    v301 = objc_opt_class();
  -[IRPreferences coreAnalyticsEnable](self, "coreAnalyticsEnable");
  v304 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v305 = objc_opt_isKindOfClass();

  if ((v305 & 1) != 0)
    v301 = objc_opt_class();
  -[IRPreferences coreAnalyticsEnable](self, "coreAnalyticsEnable");
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v307 = objc_opt_isKindOfClass();

  if ((v307 & 1) != 0)
    v301 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcoreAnalyticsEnable"), MEMORY[0x24BDBD1C8], v301);
  v308 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  coreAnalyticsEnable = self->_coreAnalyticsEnable;
  self->_coreAnalyticsEnable = v308;

  v310 = objc_opt_class();
  -[IRPreferences coreAnalyticsXPCActivityInterval](self, "coreAnalyticsXPCActivityInterval");
  v311 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v312 = objc_opt_isKindOfClass();

  if ((v312 & 1) != 0)
    v310 = objc_opt_class();
  -[IRPreferences coreAnalyticsXPCActivityInterval](self, "coreAnalyticsXPCActivityInterval");
  v313 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v314 = objc_opt_isKindOfClass();

  if ((v314 & 1) != 0)
    v310 = objc_opt_class();
  -[IRPreferences coreAnalyticsXPCActivityInterval](self, "coreAnalyticsXPCActivityInterval");
  v315 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v316 = objc_opt_isKindOfClass();

  if ((v316 & 1) != 0)
    v310 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcoreAnalyticsXPCActivityInterval"), &unk_25105ECC0, v310);
  v317 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  coreAnalyticsXPCActivityInterval = self->_coreAnalyticsXPCActivityInterval;
  self->_coreAnalyticsXPCActivityInterval = v317;

  v319 = objc_opt_class();
  -[IRPreferences coreAnalyticsXPCHistoryEventsValidThreshold](self, "coreAnalyticsXPCHistoryEventsValidThreshold");
  v320 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v321 = objc_opt_isKindOfClass();

  if ((v321 & 1) != 0)
    v319 = objc_opt_class();
  -[IRPreferences coreAnalyticsXPCHistoryEventsValidThreshold](self, "coreAnalyticsXPCHistoryEventsValidThreshold");
  v322 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v323 = objc_opt_isKindOfClass();

  if ((v323 & 1) != 0)
    v319 = objc_opt_class();
  -[IRPreferences coreAnalyticsXPCHistoryEventsValidThreshold](self, "coreAnalyticsXPCHistoryEventsValidThreshold");
  v324 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v325 = objc_opt_isKindOfClass();

  if ((v325 & 1) != 0)
    v319 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcoreAnalyticsXPCHistoryEventsValidThreshold"), &unk_25105ECC0, v319);
  v326 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  coreAnalyticsXPCHistoryEventsValidThreshold = self->_coreAnalyticsXPCHistoryEventsValidThreshold;
  self->_coreAnalyticsXPCHistoryEventsValidThreshold = v326;

  v328 = objc_opt_class();
  -[IRPreferences coreAnalyticsStatisticsCollectionPeriodInSeconds](self, "coreAnalyticsStatisticsCollectionPeriodInSeconds");
  v329 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v330 = objc_opt_isKindOfClass();

  if ((v330 & 1) != 0)
    v328 = objc_opt_class();
  -[IRPreferences coreAnalyticsStatisticsCollectionPeriodInSeconds](self, "coreAnalyticsStatisticsCollectionPeriodInSeconds");
  v331 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v332 = objc_opt_isKindOfClass();

  if ((v332 & 1) != 0)
    v328 = objc_opt_class();
  -[IRPreferences coreAnalyticsStatisticsCollectionPeriodInSeconds](self, "coreAnalyticsStatisticsCollectionPeriodInSeconds");
  v333 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v334 = objc_opt_isKindOfClass();

  if ((v334 & 1) != 0)
    v328 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcoreAnalyticsStatisticsCollectionPeriodInSeconds"), &unk_25105ECC0, v328);
  v335 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  coreAnalyticsStatisticsCollectionPeriodInSeconds = self->_coreAnalyticsStatisticsCollectionPeriodInSeconds;
  self->_coreAnalyticsStatisticsCollectionPeriodInSeconds = v335;

  v337 = objc_opt_class();
  -[IRPreferences coreAnalyticsWeeklyMobileAssetVersion](self, "coreAnalyticsWeeklyMobileAssetVersion");
  v338 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v339 = objc_opt_isKindOfClass();

  if ((v339 & 1) != 0)
    v337 = objc_opt_class();
  -[IRPreferences coreAnalyticsWeeklyMobileAssetVersion](self, "coreAnalyticsWeeklyMobileAssetVersion");
  v340 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v341 = objc_opt_isKindOfClass();

  if ((v341 & 1) != 0)
    v337 = objc_opt_class();
  -[IRPreferences coreAnalyticsWeeklyMobileAssetVersion](self, "coreAnalyticsWeeklyMobileAssetVersion");
  v342 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v343 = objc_opt_isKindOfClass();

  if ((v343 & 1) != 0)
    v337 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcoreAnalyticsWeeklyMobileAssetVersion"), 0, v337);
  v344 = (NSString *)objc_claimAutoreleasedReturnValue();
  coreAnalyticsWeeklyMobileAssetVersion = self->_coreAnalyticsWeeklyMobileAssetVersion;
  self->_coreAnalyticsWeeklyMobileAssetVersion = v344;

  v346 = objc_opt_class();
  -[IRPreferences coreAnalyticsSessionEnable](self, "coreAnalyticsSessionEnable");
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v348 = objc_opt_isKindOfClass();

  if ((v348 & 1) != 0)
    v346 = objc_opt_class();
  -[IRPreferences coreAnalyticsSessionEnable](self, "coreAnalyticsSessionEnable");
  v349 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v350 = objc_opt_isKindOfClass();

  if ((v350 & 1) != 0)
    v346 = objc_opt_class();
  -[IRPreferences coreAnalyticsSessionEnable](self, "coreAnalyticsSessionEnable");
  v351 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v352 = objc_opt_isKindOfClass();

  if ((v352 & 1) != 0)
    v346 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcoreAnalyticsSessionEnable"), MEMORY[0x24BDBD1C8], v346);
  v353 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  coreAnalyticsSessionEnable = self->_coreAnalyticsSessionEnable;
  self->_coreAnalyticsSessionEnable = v353;

  v355 = objc_opt_class();
  -[IRPreferences coreAnalyticsSessionPeriodInSeconds](self, "coreAnalyticsSessionPeriodInSeconds");
  v356 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v357 = objc_opt_isKindOfClass();

  if ((v357 & 1) != 0)
    v355 = objc_opt_class();
  -[IRPreferences coreAnalyticsSessionPeriodInSeconds](self, "coreAnalyticsSessionPeriodInSeconds");
  v358 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v359 = objc_opt_isKindOfClass();

  if ((v359 & 1) != 0)
    v355 = objc_opt_class();
  -[IRPreferences coreAnalyticsSessionPeriodInSeconds](self, "coreAnalyticsSessionPeriodInSeconds");
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v361 = objc_opt_isKindOfClass();

  if ((v361 & 1) != 0)
    v355 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcoreAnalyticsSessionPeriodInSeconds"), &unk_25105ED80, v355);
  v362 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  coreAnalyticsSessionPeriodInSeconds = self->_coreAnalyticsSessionPeriodInSeconds;
  self->_coreAnalyticsSessionPeriodInSeconds = v362;

  v364 = objc_opt_class();
  -[IRPreferences mediaRulesContinuityTimeIntervalInSeconds](self, "mediaRulesContinuityTimeIntervalInSeconds");
  v365 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v366 = objc_opt_isKindOfClass();

  if ((v366 & 1) != 0)
    v364 = objc_opt_class();
  -[IRPreferences mediaRulesContinuityTimeIntervalInSeconds](self, "mediaRulesContinuityTimeIntervalInSeconds");
  v367 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v368 = objc_opt_isKindOfClass();

  if ((v368 & 1) != 0)
    v364 = objc_opt_class();
  -[IRPreferences mediaRulesContinuityTimeIntervalInSeconds](self, "mediaRulesContinuityTimeIntervalInSeconds");
  v369 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v370 = objc_opt_isKindOfClass();

  if ((v370 & 1) != 0)
    v364 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmediaRulesContinuityTimeIntervalInSeconds"), &unk_25105ED98, v364);
  v371 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  mediaRulesContinuityTimeIntervalInSeconds = self->_mediaRulesContinuityTimeIntervalInSeconds;
  self->_mediaRulesContinuityTimeIntervalInSeconds = v371;

  v373 = objc_opt_class();
  -[IRPreferences mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds](self, "mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds");
  v374 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v375 = objc_opt_isKindOfClass();

  if ((v375 & 1) != 0)
    v373 = objc_opt_class();
  -[IRPreferences mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds](self, "mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds");
  v376 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v377 = objc_opt_isKindOfClass();

  if ((v377 & 1) != 0)
    v373 = objc_opt_class();
  -[IRPreferences mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds](self, "mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds");
  v378 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v379 = objc_opt_isKindOfClass();

  if ((v379 & 1) != 0)
    v373 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmediaRulesPickerChoiceConsistencyTimeIntervalInSeconds"), &unk_25105EDB0, v373);
  v380 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds = self->_mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds;
  self->_mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds = v380;

  v382 = objc_opt_class();
  -[IRPreferences mediaRulesPickerChoiceConsistencyEnable](self, "mediaRulesPickerChoiceConsistencyEnable");
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v384 = objc_opt_isKindOfClass();

  if ((v384 & 1) != 0)
    v382 = objc_opt_class();
  -[IRPreferences mediaRulesPickerChoiceConsistencyEnable](self, "mediaRulesPickerChoiceConsistencyEnable");
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v386 = objc_opt_isKindOfClass();

  if ((v386 & 1) != 0)
    v382 = objc_opt_class();
  -[IRPreferences mediaRulesPickerChoiceConsistencyEnable](self, "mediaRulesPickerChoiceConsistencyEnable");
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v388 = objc_opt_isKindOfClass();

  if ((v388 & 1) != 0)
    v382 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmediaRulesPickerChoiceConsistencyEnable"), MEMORY[0x24BDBD1C8], v382);
  v389 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  mediaRulesPickerChoiceConsistencyEnable = self->_mediaRulesPickerChoiceConsistencyEnable;
  self->_mediaRulesPickerChoiceConsistencyEnable = v389;

  v391 = objc_opt_class();
  -[IRPreferences mediaRulesUserRejectedInLastDayEnable](self, "mediaRulesUserRejectedInLastDayEnable");
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v393 = objc_opt_isKindOfClass();

  if ((v393 & 1) != 0)
    v391 = objc_opt_class();
  -[IRPreferences mediaRulesUserRejectedInLastDayEnable](self, "mediaRulesUserRejectedInLastDayEnable");
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v395 = objc_opt_isKindOfClass();

  if ((v395 & 1) != 0)
    v391 = objc_opt_class();
  -[IRPreferences mediaRulesUserRejectedInLastDayEnable](self, "mediaRulesUserRejectedInLastDayEnable");
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v397 = objc_opt_isKindOfClass();

  if ((v397 & 1) != 0)
    v391 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmediaRulesUserRejectedInLastDayEnable"), MEMORY[0x24BDBD1C8], v391);
  v398 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  mediaRulesUserRejectedInLastDayEnable = self->_mediaRulesUserRejectedInLastDayEnable;
  self->_mediaRulesUserRejectedInLastDayEnable = v398;

  v400 = objc_opt_class();
  -[IRPreferences appleTvCtrlRulesContinuityTimeIntervalInSeconds](self, "appleTvCtrlRulesContinuityTimeIntervalInSeconds");
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v402 = objc_opt_isKindOfClass();

  if ((v402 & 1) != 0)
    v400 = objc_opt_class();
  -[IRPreferences appleTvCtrlRulesContinuityTimeIntervalInSeconds](self, "appleTvCtrlRulesContinuityTimeIntervalInSeconds");
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v404 = objc_opt_isKindOfClass();

  if ((v404 & 1) != 0)
    v400 = objc_opt_class();
  -[IRPreferences appleTvCtrlRulesContinuityTimeIntervalInSeconds](self, "appleTvCtrlRulesContinuityTimeIntervalInSeconds");
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v406 = objc_opt_isKindOfClass();

  if ((v406 & 1) != 0)
    v400 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRappleTvCtrlRulesContinuityTimeIntervalInSeconds"), &unk_25105ED98, v400);
  v407 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  appleTvCtrlRulesContinuityTimeIntervalInSeconds = self->_appleTvCtrlRulesContinuityTimeIntervalInSeconds;
  self->_appleTvCtrlRulesContinuityTimeIntervalInSeconds = v407;

  v409 = objc_opt_class();
  -[IRPreferences appInFocusWindowInSeconds](self, "appInFocusWindowInSeconds");
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v411 = objc_opt_isKindOfClass();

  if ((v411 & 1) != 0)
    v409 = objc_opt_class();
  -[IRPreferences appInFocusWindowInSeconds](self, "appInFocusWindowInSeconds");
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v413 = objc_opt_isKindOfClass();

  if ((v413 & 1) != 0)
    v409 = objc_opt_class();
  -[IRPreferences appInFocusWindowInSeconds](self, "appInFocusWindowInSeconds");
  v414 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v415 = objc_opt_isKindOfClass();

  if ((v415 & 1) != 0)
    v409 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRappInFocusWindowInSeconds"), &unk_25105ED08, v409);
  v416 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  appInFocusWindowInSeconds = self->_appInFocusWindowInSeconds;
  self->_appInFocusWindowInSeconds = v416;

  v418 = objc_opt_class();
  -[IRPreferences appInFocusWindowEnableOnServiceRun](self, "appInFocusWindowEnableOnServiceRun");
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v420 = objc_opt_isKindOfClass();

  if ((v420 & 1) != 0)
    v418 = objc_opt_class();
  -[IRPreferences appInFocusWindowEnableOnServiceRun](self, "appInFocusWindowEnableOnServiceRun");
  v421 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v422 = objc_opt_isKindOfClass();

  if ((v422 & 1) != 0)
    v418 = objc_opt_class();
  -[IRPreferences appInFocusWindowEnableOnServiceRun](self, "appInFocusWindowEnableOnServiceRun");
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v424 = objc_opt_isKindOfClass();

  if ((v424 & 1) != 0)
    v418 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRappInFocusWindowEnableOnServiceRun"), MEMORY[0x24BDBD1C0], v418);
  v425 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  appInFocusWindowEnableOnServiceRun = self->_appInFocusWindowEnableOnServiceRun;
  self->_appInFocusWindowEnableOnServiceRun = v425;

  v427 = objc_opt_class();
  -[IRPreferences bannersFromScreenUnlockToAppInFocusEnable](self, "bannersFromScreenUnlockToAppInFocusEnable");
  v428 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v429 = objc_opt_isKindOfClass();

  if ((v429 & 1) != 0)
    v427 = objc_opt_class();
  -[IRPreferences bannersFromScreenUnlockToAppInFocusEnable](self, "bannersFromScreenUnlockToAppInFocusEnable");
  v430 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v431 = objc_opt_isKindOfClass();

  if ((v431 & 1) != 0)
    v427 = objc_opt_class();
  -[IRPreferences bannersFromScreenUnlockToAppInFocusEnable](self, "bannersFromScreenUnlockToAppInFocusEnable");
  v432 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v433 = objc_opt_isKindOfClass();

  if ((v433 & 1) != 0)
    v427 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRbannersFromScreenUnlockToAppInFocusEnable"), MEMORY[0x24BDBD1C8], v427);
  v434 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  bannersFromScreenUnlockToAppInFocusEnable = self->_bannersFromScreenUnlockToAppInFocusEnable;
  self->_bannersFromScreenUnlockToAppInFocusEnable = v434;

  v436 = objc_opt_class();
  -[IRPreferences liveOnEnable](self, "liveOnEnable");
  v437 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v438 = objc_opt_isKindOfClass();

  if ((v438 & 1) != 0)
    v436 = objc_opt_class();
  -[IRPreferences liveOnEnable](self, "liveOnEnable");
  v439 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v440 = objc_opt_isKindOfClass();

  if ((v440 & 1) != 0)
    v436 = objc_opt_class();
  -[IRPreferences liveOnEnable](self, "liveOnEnable");
  v441 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v442 = objc_opt_isKindOfClass();

  if ((v442 & 1) != 0)
    v436 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRliveOnEnable"), MEMORY[0x24BDBD1C0], v436);
  v443 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  liveOnEnable = self->_liveOnEnable;
  self->_liveOnEnable = v443;

  v445 = objc_opt_class();
  -[IRPreferences liveOnTtrDebugDataRequestsEnabled](self, "liveOnTtrDebugDataRequestsEnabled");
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v447 = objc_opt_isKindOfClass();

  if ((v447 & 1) != 0)
    v445 = objc_opt_class();
  -[IRPreferences liveOnTtrDebugDataRequestsEnabled](self, "liveOnTtrDebugDataRequestsEnabled");
  v448 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v449 = objc_opt_isKindOfClass();

  if ((v449 & 1) != 0)
    v445 = objc_opt_class();
  -[IRPreferences liveOnTtrDebugDataRequestsEnabled](self, "liveOnTtrDebugDataRequestsEnabled");
  v450 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v451 = objc_opt_isKindOfClass();

  if ((v451 & 1) != 0)
    v445 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRliveOnTtrDebugDataRequestsEnabled"), MEMORY[0x24BDBD1C8], v445);
  v452 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  liveOnTtrDebugDataRequestsEnabled = self->_liveOnTtrDebugDataRequestsEnabled;
  self->_liveOnTtrDebugDataRequestsEnabled = v452;

  v454 = objc_opt_class();
  -[IRPreferences liveOnTtrPeriodicDataRequestsEnabled](self, "liveOnTtrPeriodicDataRequestsEnabled");
  v455 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v456 = objc_opt_isKindOfClass();

  if ((v456 & 1) != 0)
    v454 = objc_opt_class();
  -[IRPreferences liveOnTtrPeriodicDataRequestsEnabled](self, "liveOnTtrPeriodicDataRequestsEnabled");
  v457 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v458 = objc_opt_isKindOfClass();

  if ((v458 & 1) != 0)
    v454 = objc_opt_class();
  -[IRPreferences liveOnTtrPeriodicDataRequestsEnabled](self, "liveOnTtrPeriodicDataRequestsEnabled");
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v460 = objc_opt_isKindOfClass();

  if ((v460 & 1) != 0)
    v454 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRliveOnTtrPeriodicDataRequestsEnabled"), MEMORY[0x24BDBD1C8], v454);
  v461 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  liveOnTtrPeriodicDataRequestsEnabled = self->_liveOnTtrPeriodicDataRequestsEnabled;
  self->_liveOnTtrPeriodicDataRequestsEnabled = v461;

  v463 = objc_opt_class();
  -[IRPreferences numberOfUsedCandidates](self, "numberOfUsedCandidates");
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v465 = objc_opt_isKindOfClass();

  if ((v465 & 1) != 0)
    v463 = objc_opt_class();
  -[IRPreferences numberOfUsedCandidates](self, "numberOfUsedCandidates");
  v466 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v467 = objc_opt_isKindOfClass();

  if ((v467 & 1) != 0)
    v463 = objc_opt_class();
  -[IRPreferences numberOfUsedCandidates](self, "numberOfUsedCandidates");
  v468 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v469 = objc_opt_isKindOfClass();

  if ((v469 & 1) != 0)
    v463 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRnumberOfUsedCandidates"), &unk_25105EC78, v463);
  v470 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  numberOfUsedCandidates = self->_numberOfUsedCandidates;
  self->_numberOfUsedCandidates = v470;

  v472 = objc_opt_class();
  -[IRPreferences numberOfSeenCandidates](self, "numberOfSeenCandidates");
  v473 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v474 = objc_opt_isKindOfClass();

  if ((v474 & 1) != 0)
    v472 = objc_opt_class();
  -[IRPreferences numberOfSeenCandidates](self, "numberOfSeenCandidates");
  v475 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v476 = objc_opt_isKindOfClass();

  if ((v476 & 1) != 0)
    v472 = objc_opt_class();
  -[IRPreferences numberOfSeenCandidates](self, "numberOfSeenCandidates");
  v477 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v478 = objc_opt_isKindOfClass();

  if ((v478 & 1) != 0)
    v472 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRnumberOfSeenCandidates"), &unk_25105EC78, v472);
  v479 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  numberOfSeenCandidates = self->_numberOfSeenCandidates;
  self->_numberOfSeenCandidates = v479;

  v481 = objc_opt_class();
  -[IRPreferences candidateUpdateTimeIntervalSeconds](self, "candidateUpdateTimeIntervalSeconds");
  v482 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v483 = objc_opt_isKindOfClass();

  if ((v483 & 1) != 0)
    v481 = objc_opt_class();
  -[IRPreferences candidateUpdateTimeIntervalSeconds](self, "candidateUpdateTimeIntervalSeconds");
  v484 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v485 = objc_opt_isKindOfClass();

  if ((v485 & 1) != 0)
    v481 = objc_opt_class();
  -[IRPreferences candidateUpdateTimeIntervalSeconds](self, "candidateUpdateTimeIntervalSeconds");
  v486 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v487 = objc_opt_isKindOfClass();

  if ((v487 & 1) != 0)
    v481 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateUpdateTimeIntervalSeconds"), &unk_25105EDC8, v481);
  v488 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateUpdateTimeIntervalSeconds = self->_candidateUpdateTimeIntervalSeconds;
  self->_candidateUpdateTimeIntervalSeconds = v488;

  v490 = objc_opt_class();
  -[IRPreferences uprankToAutorouteEligibilityThreshold3rdParty](self, "uprankToAutorouteEligibilityThreshold3rdParty");
  v491 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v492 = objc_opt_isKindOfClass();

  if ((v492 & 1) != 0)
    v490 = objc_opt_class();
  -[IRPreferences uprankToAutorouteEligibilityThreshold3rdParty](self, "uprankToAutorouteEligibilityThreshold3rdParty");
  v493 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v494 = objc_opt_isKindOfClass();

  if ((v494 & 1) != 0)
    v490 = objc_opt_class();
  -[IRPreferences uprankToAutorouteEligibilityThreshold3rdParty](self, "uprankToAutorouteEligibilityThreshold3rdParty");
  v495 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v496 = objc_opt_isKindOfClass();

  if ((v496 & 1) != 0)
    v490 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRuprankToAutorouteEligibilityThreshold3rdParty"), &unk_25105ED38, v490);
  v497 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  uprankToAutorouteEligibilityThreshold3rdParty = self->_uprankToAutorouteEligibilityThreshold3rdParty;
  self->_uprankToAutorouteEligibilityThreshold3rdParty = v497;

  v499 = objc_opt_class();
  -[IRPreferences uprankToOneTapEligibilityThreshold3rdParty](self, "uprankToOneTapEligibilityThreshold3rdParty");
  v500 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v501 = objc_opt_isKindOfClass();

  if ((v501 & 1) != 0)
    v499 = objc_opt_class();
  -[IRPreferences uprankToOneTapEligibilityThreshold3rdParty](self, "uprankToOneTapEligibilityThreshold3rdParty");
  v502 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v503 = objc_opt_isKindOfClass();

  if ((v503 & 1) != 0)
    v499 = objc_opt_class();
  -[IRPreferences uprankToOneTapEligibilityThreshold3rdParty](self, "uprankToOneTapEligibilityThreshold3rdParty");
  v504 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v505 = objc_opt_isKindOfClass();

  if ((v505 & 1) != 0)
    v499 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRuprankToOneTapEligibilityThreshold3rdParty"), &unk_25105ED20, v499);
  v506 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  uprankToOneTapEligibilityThreshold3rdParty = self->_uprankToOneTapEligibilityThreshold3rdParty;
  self->_uprankToOneTapEligibilityThreshold3rdParty = v506;

  v508 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityThreshold3rdParty](self, "downrankToNoneEligibilityThreshold3rdParty");
  v509 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v510 = objc_opt_isKindOfClass();

  if ((v510 & 1) != 0)
    v508 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityThreshold3rdParty](self, "downrankToNoneEligibilityThreshold3rdParty");
  v511 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v512 = objc_opt_isKindOfClass();

  if ((v512 & 1) != 0)
    v508 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityThreshold3rdParty](self, "downrankToNoneEligibilityThreshold3rdParty");
  v513 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v514 = objc_opt_isKindOfClass();

  if ((v514 & 1) != 0)
    v508 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdownrankToNoneEligibilityThreshold3rdParty"), &unk_25105ED38, v508);
  v515 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  downrankToNoneEligibilityThreshold3rdParty = self->_downrankToNoneEligibilityThreshold3rdParty;
  self->_downrankToNoneEligibilityThreshold3rdParty = v515;

  v517 = objc_opt_class();
  -[IRPreferences downrankToOneTapEligibilityThreshold3rdParty](self, "downrankToOneTapEligibilityThreshold3rdParty");
  v518 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v519 = objc_opt_isKindOfClass();

  if ((v519 & 1) != 0)
    v517 = objc_opt_class();
  -[IRPreferences downrankToOneTapEligibilityThreshold3rdParty](self, "downrankToOneTapEligibilityThreshold3rdParty");
  v520 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v521 = objc_opt_isKindOfClass();

  if ((v521 & 1) != 0)
    v517 = objc_opt_class();
  -[IRPreferences downrankToOneTapEligibilityThreshold3rdParty](self, "downrankToOneTapEligibilityThreshold3rdParty");
  v522 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v523 = objc_opt_isKindOfClass();

  if ((v523 & 1) != 0)
    v517 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdownrankToOneTapEligibilityThreshold3rdParty"), &unk_25105ED20, v517);
  v524 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  downrankToOneTapEligibilityThreshold3rdParty = self->_downrankToOneTapEligibilityThreshold3rdParty;
  self->_downrankToOneTapEligibilityThreshold3rdParty = v524;

  v526 = objc_opt_class();
  -[IRPreferences eligibilityInitStateIsOneTap3rdParty](self, "eligibilityInitStateIsOneTap3rdParty");
  v527 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v528 = objc_opt_isKindOfClass();

  if ((v528 & 1) != 0)
    v526 = objc_opt_class();
  -[IRPreferences eligibilityInitStateIsOneTap3rdParty](self, "eligibilityInitStateIsOneTap3rdParty");
  v529 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v530 = objc_opt_isKindOfClass();

  if ((v530 & 1) != 0)
    v526 = objc_opt_class();
  -[IRPreferences eligibilityInitStateIsOneTap3rdParty](self, "eligibilityInitStateIsOneTap3rdParty");
  v531 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v532 = objc_opt_isKindOfClass();

  if ((v532 & 1) != 0)
    v526 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IReligibilityInitStateIsOneTap3rdParty"), MEMORY[0x24BDBD1C0], v526);
  v533 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  eligibilityInitStateIsOneTap3rdParty = self->_eligibilityInitStateIsOneTap3rdParty;
  self->_eligibilityInitStateIsOneTap3rdParty = v533;

  v535 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty](self, "downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty");
  v536 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v537 = objc_opt_isKindOfClass();

  if ((v537 & 1) != 0)
    v535 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty](self, "downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty");
  v538 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v539 = objc_opt_isKindOfClass();

  if ((v539 & 1) != 0)
    v535 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty](self, "downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty");
  v540 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v541 = objc_opt_isKindOfClass();

  if ((v541 & 1) != 0)
    v535 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdownrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty"), &unk_25105ECF0, v535);
  v542 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty = self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty;
  self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty = v542;

  v544 = objc_opt_class();
  -[IRPreferences uprankToAutorouteEligibilityThreshold1stParty](self, "uprankToAutorouteEligibilityThreshold1stParty");
  v545 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v546 = objc_opt_isKindOfClass();

  if ((v546 & 1) != 0)
    v544 = objc_opt_class();
  -[IRPreferences uprankToAutorouteEligibilityThreshold1stParty](self, "uprankToAutorouteEligibilityThreshold1stParty");
  v547 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v548 = objc_opt_isKindOfClass();

  if ((v548 & 1) != 0)
    v544 = objc_opt_class();
  -[IRPreferences uprankToAutorouteEligibilityThreshold1stParty](self, "uprankToAutorouteEligibilityThreshold1stParty");
  v549 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v550 = objc_opt_isKindOfClass();

  if ((v550 & 1) != 0)
    v544 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRuprankToAutorouteEligibilityThreshold1stParty"), &unk_25105ED38, v544);
  v551 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  uprankToAutorouteEligibilityThreshold1stParty = self->_uprankToAutorouteEligibilityThreshold1stParty;
  self->_uprankToAutorouteEligibilityThreshold1stParty = v551;

  v553 = objc_opt_class();
  -[IRPreferences uprankToOneTapEligibilityThreshold1stParty](self, "uprankToOneTapEligibilityThreshold1stParty");
  v554 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v555 = objc_opt_isKindOfClass();

  if ((v555 & 1) != 0)
    v553 = objc_opt_class();
  -[IRPreferences uprankToOneTapEligibilityThreshold1stParty](self, "uprankToOneTapEligibilityThreshold1stParty");
  v556 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v557 = objc_opt_isKindOfClass();

  if ((v557 & 1) != 0)
    v553 = objc_opt_class();
  -[IRPreferences uprankToOneTapEligibilityThreshold1stParty](self, "uprankToOneTapEligibilityThreshold1stParty");
  v558 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v559 = objc_opt_isKindOfClass();

  if ((v559 & 1) != 0)
    v553 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRuprankToOneTapEligibilityThreshold1stParty"), &unk_25105ED20, v553);
  v560 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  uprankToOneTapEligibilityThreshold1stParty = self->_uprankToOneTapEligibilityThreshold1stParty;
  self->_uprankToOneTapEligibilityThreshold1stParty = v560;

  v562 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityThreshold1stParty](self, "downrankToNoneEligibilityThreshold1stParty");
  v563 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v564 = objc_opt_isKindOfClass();

  if ((v564 & 1) != 0)
    v562 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityThreshold1stParty](self, "downrankToNoneEligibilityThreshold1stParty");
  v565 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v566 = objc_opt_isKindOfClass();

  if ((v566 & 1) != 0)
    v562 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityThreshold1stParty](self, "downrankToNoneEligibilityThreshold1stParty");
  v567 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v568 = objc_opt_isKindOfClass();

  if ((v568 & 1) != 0)
    v562 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdownrankToNoneEligibilityThreshold1stParty"), &unk_25105ED38, v562);
  v569 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  downrankToNoneEligibilityThreshold1stParty = self->_downrankToNoneEligibilityThreshold1stParty;
  self->_downrankToNoneEligibilityThreshold1stParty = v569;

  v571 = objc_opt_class();
  -[IRPreferences downrankToOneTapEligibilityThreshold1stParty](self, "downrankToOneTapEligibilityThreshold1stParty");
  v572 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v573 = objc_opt_isKindOfClass();

  if ((v573 & 1) != 0)
    v571 = objc_opt_class();
  -[IRPreferences downrankToOneTapEligibilityThreshold1stParty](self, "downrankToOneTapEligibilityThreshold1stParty");
  v574 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v575 = objc_opt_isKindOfClass();

  if ((v575 & 1) != 0)
    v571 = objc_opt_class();
  -[IRPreferences downrankToOneTapEligibilityThreshold1stParty](self, "downrankToOneTapEligibilityThreshold1stParty");
  v576 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v577 = objc_opt_isKindOfClass();

  if ((v577 & 1) != 0)
    v571 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdownrankToOneTapEligibilityThreshold1stParty"), &unk_25105ED20, v571);
  v578 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  downrankToOneTapEligibilityThreshold1stParty = self->_downrankToOneTapEligibilityThreshold1stParty;
  self->_downrankToOneTapEligibilityThreshold1stParty = v578;

  v580 = objc_opt_class();
  -[IRPreferences eligibilityInitStateIsOneTap1stParty](self, "eligibilityInitStateIsOneTap1stParty");
  v581 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v582 = objc_opt_isKindOfClass();

  if ((v582 & 1) != 0)
    v580 = objc_opt_class();
  -[IRPreferences eligibilityInitStateIsOneTap1stParty](self, "eligibilityInitStateIsOneTap1stParty");
  v583 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v584 = objc_opt_isKindOfClass();

  if ((v584 & 1) != 0)
    v580 = objc_opt_class();
  -[IRPreferences eligibilityInitStateIsOneTap1stParty](self, "eligibilityInitStateIsOneTap1stParty");
  v585 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v586 = objc_opt_isKindOfClass();

  if ((v586 & 1) != 0)
    v580 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IReligibilityInitStateIsOneTap1stParty"), MEMORY[0x24BDBD1C0], v580);
  v587 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  eligibilityInitStateIsOneTap1stParty = self->_eligibilityInitStateIsOneTap1stParty;
  self->_eligibilityInitStateIsOneTap1stParty = v587;

  v589 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty](self, "downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty");
  v590 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v591 = objc_opt_isKindOfClass();

  if ((v591 & 1) != 0)
    v589 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty](self, "downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty");
  v592 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v593 = objc_opt_isKindOfClass();

  if ((v593 & 1) != 0)
    v589 = objc_opt_class();
  -[IRPreferences downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty](self, "downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty");
  v594 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v595 = objc_opt_isKindOfClass();

  if ((v595 & 1) != 0)
    v589 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRdownrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty"), &unk_25105ECF0, v589);
  v596 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty = self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty;
  self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty = v596;

  v598 = objc_opt_class();
  -[IRPreferences pickerAutoSelectToPicketChoiceMinInterval](self, "pickerAutoSelectToPicketChoiceMinInterval");
  v599 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v600 = objc_opt_isKindOfClass();

  if ((v600 & 1) != 0)
    v598 = objc_opt_class();
  -[IRPreferences pickerAutoSelectToPicketChoiceMinInterval](self, "pickerAutoSelectToPicketChoiceMinInterval");
  v601 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v602 = objc_opt_isKindOfClass();

  if ((v602 & 1) != 0)
    v598 = objc_opt_class();
  -[IRPreferences pickerAutoSelectToPicketChoiceMinInterval](self, "pickerAutoSelectToPicketChoiceMinInterval");
  v603 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v604 = objc_opt_isKindOfClass();

  if ((v604 & 1) != 0)
    v598 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRpickerAutoSelectToPicketChoiceMinInterval"), &unk_25105EC78, v598);
  v605 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pickerAutoSelectToPicketChoiceMinInterval = self->_pickerAutoSelectToPicketChoiceMinInterval;
  self->_pickerAutoSelectToPicketChoiceMinInterval = v605;

  v607 = objc_opt_class();
  -[IRPreferences brokeredUseScansForEligibilityOfMainDevice](self, "brokeredUseScansForEligibilityOfMainDevice");
  v608 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v609 = objc_opt_isKindOfClass();

  if ((v609 & 1) != 0)
    v607 = objc_opt_class();
  -[IRPreferences brokeredUseScansForEligibilityOfMainDevice](self, "brokeredUseScansForEligibilityOfMainDevice");
  v610 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v611 = objc_opt_isKindOfClass();

  if ((v611 & 1) != 0)
    v607 = objc_opt_class();
  -[IRPreferences brokeredUseScansForEligibilityOfMainDevice](self, "brokeredUseScansForEligibilityOfMainDevice");
  v612 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v613 = objc_opt_isKindOfClass();

  if ((v613 & 1) != 0)
    v607 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRbrokeredUseScansForEligibilityOfMainDevice"), MEMORY[0x24BDBD1C8], v607);
  v614 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  brokeredUseScansForEligibilityOfMainDevice = self->_brokeredUseScansForEligibilityOfMainDevice;
  self->_brokeredUseScansForEligibilityOfMainDevice = v614;

  v616 = objc_opt_class();
  -[IRPreferences brokeredUseScansForEligibilityOfSecondaryDevice](self, "brokeredUseScansForEligibilityOfSecondaryDevice");
  v617 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v618 = objc_opt_isKindOfClass();

  if ((v618 & 1) != 0)
    v616 = objc_opt_class();
  -[IRPreferences brokeredUseScansForEligibilityOfSecondaryDevice](self, "brokeredUseScansForEligibilityOfSecondaryDevice");
  v619 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v620 = objc_opt_isKindOfClass();

  if ((v620 & 1) != 0)
    v616 = objc_opt_class();
  -[IRPreferences brokeredUseScansForEligibilityOfSecondaryDevice](self, "brokeredUseScansForEligibilityOfSecondaryDevice");
  v621 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v622 = objc_opt_isKindOfClass();

  if ((v622 & 1) != 0)
    v616 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRbrokeredUseScansForEligibilityOfSecondaryDevice"), MEMORY[0x24BDBD1C8], v616);
  v623 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  brokeredUseScansForEligibilityOfSecondaryDevice = self->_brokeredUseScansForEligibilityOfSecondaryDevice;
  self->_brokeredUseScansForEligibilityOfSecondaryDevice = v623;

  v625 = objc_opt_class();
  -[IRPreferences miloSameSpaceRatioThreshold](self, "miloSameSpaceRatioThreshold");
  v626 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v627 = objc_opt_isKindOfClass();

  if ((v627 & 1) != 0)
    v625 = objc_opt_class();
  -[IRPreferences miloSameSpaceRatioThreshold](self, "miloSameSpaceRatioThreshold");
  v628 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v629 = objc_opt_isKindOfClass();

  if ((v629 & 1) != 0)
    v625 = objc_opt_class();
  -[IRPreferences miloSameSpaceRatioThreshold](self, "miloSameSpaceRatioThreshold");
  v630 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v631 = objc_opt_isKindOfClass();

  if ((v631 & 1) != 0)
    v625 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmiloSameSpaceRatioThreshold"), &unk_25105F068, v625);
  v632 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  miloSameSpaceRatioThreshold = self->_miloSameSpaceRatioThreshold;
  self->_miloSameSpaceRatioThreshold = v632;

  v634 = objc_opt_class();
  -[IRPreferences miloSameSpaceEventsTimeIntervalSeconds](self, "miloSameSpaceEventsTimeIntervalSeconds");
  v635 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v636 = objc_opt_isKindOfClass();

  if ((v636 & 1) != 0)
    v634 = objc_opt_class();
  -[IRPreferences miloSameSpaceEventsTimeIntervalSeconds](self, "miloSameSpaceEventsTimeIntervalSeconds");
  v637 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v638 = objc_opt_isKindOfClass();

  if ((v638 & 1) != 0)
    v634 = objc_opt_class();
  -[IRPreferences miloSameSpaceEventsTimeIntervalSeconds](self, "miloSameSpaceEventsTimeIntervalSeconds");
  v639 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v640 = objc_opt_isKindOfClass();

  if ((v640 & 1) != 0)
    v634 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmiloSameSpaceEventsTimeIntervalSeconds"), &unk_25105EC90, v634);
  v641 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  miloSameSpaceEventsTimeIntervalSeconds = self->_miloSameSpaceEventsTimeIntervalSeconds;
  self->_miloSameSpaceEventsTimeIntervalSeconds = v641;

  v643 = objc_opt_class();
  -[IRPreferences miloSameSpaceEventsNumberOfEventsToWatch](self, "miloSameSpaceEventsNumberOfEventsToWatch");
  v644 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v645 = objc_opt_isKindOfClass();

  if ((v645 & 1) != 0)
    v643 = objc_opt_class();
  -[IRPreferences miloSameSpaceEventsNumberOfEventsToWatch](self, "miloSameSpaceEventsNumberOfEventsToWatch");
  v646 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v647 = objc_opt_isKindOfClass();

  if ((v647 & 1) != 0)
    v643 = objc_opt_class();
  -[IRPreferences miloSameSpaceEventsNumberOfEventsToWatch](self, "miloSameSpaceEventsNumberOfEventsToWatch");
  v648 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v649 = objc_opt_isKindOfClass();

  if ((v649 & 1) != 0)
    v643 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmiloSameSpaceEventsNumberOfEventsToWatch"), &unk_25105ED50, v643);
  v650 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  miloSameSpaceEventsNumberOfEventsToWatch = self->_miloSameSpaceEventsNumberOfEventsToWatch;
  self->_miloSameSpaceEventsNumberOfEventsToWatch = v650;

  v652 = objc_opt_class();
  -[IRPreferences loiSameSpaceEventsTimeIntervalSeconds](self, "loiSameSpaceEventsTimeIntervalSeconds");
  v653 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v654 = objc_opt_isKindOfClass();

  if ((v654 & 1) != 0)
    v652 = objc_opt_class();
  -[IRPreferences loiSameSpaceEventsTimeIntervalSeconds](self, "loiSameSpaceEventsTimeIntervalSeconds");
  v655 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v656 = objc_opt_isKindOfClass();

  if ((v656 & 1) != 0)
    v652 = objc_opt_class();
  -[IRPreferences loiSameSpaceEventsTimeIntervalSeconds](self, "loiSameSpaceEventsTimeIntervalSeconds");
  v657 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v658 = objc_opt_isKindOfClass();

  if ((v658 & 1) != 0)
    v652 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRloiSameSpaceEventsTimeIntervalSeconds"), &unk_25105EC90, v652);
  v659 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  loiSameSpaceEventsTimeIntervalSeconds = self->_loiSameSpaceEventsTimeIntervalSeconds;
  self->_loiSameSpaceEventsTimeIntervalSeconds = v659;

  v661 = objc_opt_class();
  -[IRPreferences loiSameSpaceEventsNumberOfEventsToWatch](self, "loiSameSpaceEventsNumberOfEventsToWatch");
  v662 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v663 = objc_opt_isKindOfClass();

  if ((v663 & 1) != 0)
    v661 = objc_opt_class();
  -[IRPreferences loiSameSpaceEventsNumberOfEventsToWatch](self, "loiSameSpaceEventsNumberOfEventsToWatch");
  v664 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v665 = objc_opt_isKindOfClass();

  if ((v665 & 1) != 0)
    v661 = objc_opt_class();
  -[IRPreferences loiSameSpaceEventsNumberOfEventsToWatch](self, "loiSameSpaceEventsNumberOfEventsToWatch");
  v666 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v667 = objc_opt_isKindOfClass();

  if ((v667 & 1) != 0)
    v661 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRloiSameSpaceEventsNumberOfEventsToWatch"), &unk_25105EDE0, v661);
  v668 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  loiSameSpaceEventsNumberOfEventsToWatch = self->_loiSameSpaceEventsNumberOfEventsToWatch;
  self->_loiSameSpaceEventsNumberOfEventsToWatch = v668;

  v670 = objc_opt_class();
  -[IRPreferences loiSameSpaceOverrideBrokerForAVODIDArray](self, "loiSameSpaceOverrideBrokerForAVODIDArray");
  v671 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v672 = objc_opt_isKindOfClass();

  if ((v672 & 1) != 0)
    v670 = objc_opt_class();
  -[IRPreferences loiSameSpaceOverrideBrokerForAVODIDArray](self, "loiSameSpaceOverrideBrokerForAVODIDArray");
  v673 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v674 = objc_opt_isKindOfClass();

  if ((v674 & 1) != 0)
    v670 = objc_opt_class();
  -[IRPreferences loiSameSpaceOverrideBrokerForAVODIDArray](self, "loiSameSpaceOverrideBrokerForAVODIDArray");
  v675 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v676 = objc_opt_isKindOfClass();

  if ((v676 & 1) != 0)
    v670 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v677 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRloiSameSpaceOverrideBrokerForAVODIDArray"), v677, v670);
  v678 = (NSArray *)objc_claimAutoreleasedReturnValue();
  loiSameSpaceOverrideBrokerForAVODIDArray = self->_loiSameSpaceOverrideBrokerForAVODIDArray;
  self->_loiSameSpaceOverrideBrokerForAVODIDArray = v678;

  v680 = objc_opt_class();
  -[IRPreferences loiSameSpaceOverrideBrokerForCandidateIDArray](self, "loiSameSpaceOverrideBrokerForCandidateIDArray");
  v681 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v682 = objc_opt_isKindOfClass();

  if ((v682 & 1) != 0)
    v680 = objc_opt_class();
  -[IRPreferences loiSameSpaceOverrideBrokerForCandidateIDArray](self, "loiSameSpaceOverrideBrokerForCandidateIDArray");
  v683 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v684 = objc_opt_isKindOfClass();

  if ((v684 & 1) != 0)
    v680 = objc_opt_class();
  -[IRPreferences loiSameSpaceOverrideBrokerForCandidateIDArray](self, "loiSameSpaceOverrideBrokerForCandidateIDArray");
  v685 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v686 = objc_opt_isKindOfClass();

  if ((v686 & 1) != 0)
    v680 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v687 = (void *)objc_claimAutoreleasedReturnValue();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRloiSameSpaceOverrideBrokerForCandidateIDArray"), v687, v680);
  v688 = (NSArray *)objc_claimAutoreleasedReturnValue();
  loiSameSpaceOverrideBrokerForCandidateIDArray = self->_loiSameSpaceOverrideBrokerForCandidateIDArray;
  self->_loiSameSpaceOverrideBrokerForCandidateIDArray = v688;

  v690 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedSimilarAppTimeIntervalSeconds](self, "candidateSelectorMostUsedSimilarAppTimeIntervalSeconds");
  v691 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v692 = objc_opt_isKindOfClass();

  if ((v692 & 1) != 0)
    v690 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedSimilarAppTimeIntervalSeconds](self, "candidateSelectorMostUsedSimilarAppTimeIntervalSeconds");
  v693 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v694 = objc_opt_isKindOfClass();

  if ((v694 & 1) != 0)
    v690 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedSimilarAppTimeIntervalSeconds](self, "candidateSelectorMostUsedSimilarAppTimeIntervalSeconds");
  v695 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v696 = objc_opt_isKindOfClass();

  if ((v696 & 1) != 0)
    v690 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorMostUsedSimilarAppTimeIntervalSeconds"), &unk_25105EC90, v690);
  v697 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorMostUsedSimilarAppTimeIntervalSeconds = self->_candidateSelectorMostUsedSimilarAppTimeIntervalSeconds;
  self->_candidateSelectorMostUsedSimilarAppTimeIntervalSeconds = v697;

  v699 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedAnyAppTimeIntervalSeconds](self, "candidateSelectorMostUsedAnyAppTimeIntervalSeconds");
  v700 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v701 = objc_opt_isKindOfClass();

  if ((v701 & 1) != 0)
    v699 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedAnyAppTimeIntervalSeconds](self, "candidateSelectorMostUsedAnyAppTimeIntervalSeconds");
  v702 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v703 = objc_opt_isKindOfClass();

  if ((v703 & 1) != 0)
    v699 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedAnyAppTimeIntervalSeconds](self, "candidateSelectorMostUsedAnyAppTimeIntervalSeconds");
  v704 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v705 = objc_opt_isKindOfClass();

  if ((v705 & 1) != 0)
    v699 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorMostUsedAnyAppTimeIntervalSeconds"), &unk_25105EC90, v699);
  v706 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorMostUsedAnyAppTimeIntervalSeconds = self->_candidateSelectorMostUsedAnyAppTimeIntervalSeconds;
  self->_candidateSelectorMostUsedAnyAppTimeIntervalSeconds = v706;

  v708 = objc_opt_class();
  -[IRPreferences candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds](self, "candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds");
  v709 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v710 = objc_opt_isKindOfClass();

  if ((v710 & 1) != 0)
    v708 = objc_opt_class();
  -[IRPreferences candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds](self, "candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds");
  v711 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v712 = objc_opt_isKindOfClass();

  if ((v712 & 1) != 0)
    v708 = objc_opt_class();
  -[IRPreferences candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds](self, "candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds");
  v713 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v714 = objc_opt_isKindOfClass();

  if ((v714 & 1) != 0)
    v708 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds"), &unk_25105EC90, v708);
  v715 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds = self->_candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds;
  self->_candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds = v715;

  v717 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents](self, "candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents");
  v718 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v719 = objc_opt_isKindOfClass();

  if ((v719 & 1) != 0)
    v717 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents](self, "candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents");
  v720 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v721 = objc_opt_isKindOfClass();

  if ((v721 & 1) != 0)
    v717 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents](self, "candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents");
  v722 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v723 = objc_opt_isKindOfClass();

  if ((v723 & 1) != 0)
    v717 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorMostUsedSimilarAppMaximumNumberOfEvents"), &unk_25105ECD8, v717);
  v724 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents = self->_candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents;
  self->_candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents = v724;

  v726 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedAnyAppMaximumNumberOfEvents](self, "candidateSelectorMostUsedAnyAppMaximumNumberOfEvents");
  v727 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v728 = objc_opt_isKindOfClass();

  if ((v728 & 1) != 0)
    v726 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedAnyAppMaximumNumberOfEvents](self, "candidateSelectorMostUsedAnyAppMaximumNumberOfEvents");
  v729 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v730 = objc_opt_isKindOfClass();

  if ((v730 & 1) != 0)
    v726 = objc_opt_class();
  -[IRPreferences candidateSelectorMostUsedAnyAppMaximumNumberOfEvents](self, "candidateSelectorMostUsedAnyAppMaximumNumberOfEvents");
  v731 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v732 = objc_opt_isKindOfClass();

  if ((v732 & 1) != 0)
    v726 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorMostUsedAnyAppMaximumNumberOfEvents"), &unk_25105ECD8, v726);
  v733 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorMostUsedAnyAppMaximumNumberOfEvents = self->_candidateSelectorMostUsedAnyAppMaximumNumberOfEvents;
  self->_candidateSelectorMostUsedAnyAppMaximumNumberOfEvents = v733;

  v735 = objc_opt_class();
  -[IRPreferences candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents](self, "candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents");
  v736 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v737 = objc_opt_isKindOfClass();

  if ((v737 & 1) != 0)
    v735 = objc_opt_class();
  -[IRPreferences candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents](self, "candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents");
  v738 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v739 = objc_opt_isKindOfClass();

  if ((v739 & 1) != 0)
    v735 = objc_opt_class();
  -[IRPreferences candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents](self, "candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents");
  v740 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v741 = objc_opt_isKindOfClass();

  if ((v741 & 1) != 0)
    v735 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents"), &unk_25105ED20, v735);
  v742 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents = self->_candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents;
  self->_candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents = v742;

  v744 = objc_opt_class();
  -[IRPreferences candidateSelectorIsContinuityEnabled](self, "candidateSelectorIsContinuityEnabled");
  v745 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v746 = objc_opt_isKindOfClass();

  if ((v746 & 1) != 0)
    v744 = objc_opt_class();
  -[IRPreferences candidateSelectorIsContinuityEnabled](self, "candidateSelectorIsContinuityEnabled");
  v747 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v748 = objc_opt_isKindOfClass();

  if ((v748 & 1) != 0)
    v744 = objc_opt_class();
  -[IRPreferences candidateSelectorIsContinuityEnabled](self, "candidateSelectorIsContinuityEnabled");
  v749 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v750 = objc_opt_isKindOfClass();

  if ((v750 & 1) != 0)
    v744 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorIsContinuityEnabled"), MEMORY[0x24BDBD1C8], v744);
  v751 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorIsContinuityEnabled = self->_candidateSelectorIsContinuityEnabled;
  self->_candidateSelectorIsContinuityEnabled = v751;

  v753 = objc_opt_class();
  -[IRPreferences candidateSelectorIsMostUsedSimilarAppEnabled](self, "candidateSelectorIsMostUsedSimilarAppEnabled");
  v754 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v755 = objc_opt_isKindOfClass();

  if ((v755 & 1) != 0)
    v753 = objc_opt_class();
  -[IRPreferences candidateSelectorIsMostUsedSimilarAppEnabled](self, "candidateSelectorIsMostUsedSimilarAppEnabled");
  v756 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v757 = objc_opt_isKindOfClass();

  if ((v757 & 1) != 0)
    v753 = objc_opt_class();
  -[IRPreferences candidateSelectorIsMostUsedSimilarAppEnabled](self, "candidateSelectorIsMostUsedSimilarAppEnabled");
  v758 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v759 = objc_opt_isKindOfClass();

  if ((v759 & 1) != 0)
    v753 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorIsMostUsedSimilarAppEnabled"), MEMORY[0x24BDBD1C8], v753);
  v760 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorIsMostUsedSimilarAppEnabled = self->_candidateSelectorIsMostUsedSimilarAppEnabled;
  self->_candidateSelectorIsMostUsedSimilarAppEnabled = v760;

  v762 = objc_opt_class();
  -[IRPreferences candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled](self, "candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled");
  v763 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v764 = objc_opt_isKindOfClass();

  if ((v764 & 1) != 0)
    v762 = objc_opt_class();
  -[IRPreferences candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled](self, "candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled");
  v765 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v766 = objc_opt_isKindOfClass();

  if ((v766 & 1) != 0)
    v762 = objc_opt_class();
  -[IRPreferences candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled](self, "candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled");
  v767 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v768 = objc_opt_isKindOfClass();

  if ((v768 & 1) != 0)
    v762 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled"), MEMORY[0x24BDBD1C8], v762);
  v769 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled = self->_candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled;
  self->_candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled = v769;

  v771 = objc_opt_class();
  -[IRPreferences candidateSelectorIsNearestRangeEnabled](self, "candidateSelectorIsNearestRangeEnabled");
  v772 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v773 = objc_opt_isKindOfClass();

  if ((v773 & 1) != 0)
    v771 = objc_opt_class();
  -[IRPreferences candidateSelectorIsNearestRangeEnabled](self, "candidateSelectorIsNearestRangeEnabled");
  v774 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v775 = objc_opt_isKindOfClass();

  if ((v775 & 1) != 0)
    v771 = objc_opt_class();
  -[IRPreferences candidateSelectorIsNearestRangeEnabled](self, "candidateSelectorIsNearestRangeEnabled");
  v776 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v777 = objc_opt_isKindOfClass();

  if ((v777 & 1) != 0)
    v771 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorIsNearestRangeEnabled"), MEMORY[0x24BDBD1C8], v771);
  v778 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorIsNearestRangeEnabled = self->_candidateSelectorIsNearestRangeEnabled;
  self->_candidateSelectorIsNearestRangeEnabled = v778;

  v780 = objc_opt_class();
  -[IRPreferences candidateSelectorIsMostUsedAnyAppEnabled](self, "candidateSelectorIsMostUsedAnyAppEnabled");
  v781 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v782 = objc_opt_isKindOfClass();

  if ((v782 & 1) != 0)
    v780 = objc_opt_class();
  -[IRPreferences candidateSelectorIsMostUsedAnyAppEnabled](self, "candidateSelectorIsMostUsedAnyAppEnabled");
  v783 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v784 = objc_opt_isKindOfClass();

  if ((v784 & 1) != 0)
    v780 = objc_opt_class();
  -[IRPreferences candidateSelectorIsMostUsedAnyAppEnabled](self, "candidateSelectorIsMostUsedAnyAppEnabled");
  v785 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v786 = objc_opt_isKindOfClass();

  if ((v786 & 1) != 0)
    v780 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorIsMostUsedAnyAppEnabled"), MEMORY[0x24BDBD1C8], v780);
  v787 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorIsMostUsedAnyAppEnabled = self->_candidateSelectorIsMostUsedAnyAppEnabled;
  self->_candidateSelectorIsMostUsedAnyAppEnabled = v787;

  v789 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByUWB](self, "candidateSelectorAllowSelectByUWB");
  v790 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v791 = objc_opt_isKindOfClass();

  if ((v791 & 1) != 0)
    v789 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByUWB](self, "candidateSelectorAllowSelectByUWB");
  v792 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v793 = objc_opt_isKindOfClass();

  if ((v793 & 1) != 0)
    v789 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByUWB](self, "candidateSelectorAllowSelectByUWB");
  v794 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v795 = objc_opt_isKindOfClass();

  if ((v795 & 1) != 0)
    v789 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorAllowSelectByUWB"), MEMORY[0x24BDBD1C8], v789);
  v796 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorAllowSelectByUWB = self->_candidateSelectorAllowSelectByUWB;
  self->_candidateSelectorAllowSelectByUWB = v796;

  v798 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByMiLo](self, "candidateSelectorAllowSelectByMiLo");
  v799 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v800 = objc_opt_isKindOfClass();

  if ((v800 & 1) != 0)
    v798 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByMiLo](self, "candidateSelectorAllowSelectByMiLo");
  v801 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v802 = objc_opt_isKindOfClass();

  if ((v802 & 1) != 0)
    v798 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByMiLo](self, "candidateSelectorAllowSelectByMiLo");
  v803 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v804 = objc_opt_isKindOfClass();

  if ((v804 & 1) != 0)
    v798 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorAllowSelectByMiLo"), MEMORY[0x24BDBD1C8], v798);
  v805 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorAllowSelectByMiLo = self->_candidateSelectorAllowSelectByMiLo;
  self->_candidateSelectorAllowSelectByMiLo = v805;

  v807 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByBLE](self, "candidateSelectorAllowSelectByBLE");
  v808 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v809 = objc_opt_isKindOfClass();

  if ((v809 & 1) != 0)
    v807 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByBLE](self, "candidateSelectorAllowSelectByBLE");
  v810 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v811 = objc_opt_isKindOfClass();

  if ((v811 & 1) != 0)
    v807 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByBLE](self, "candidateSelectorAllowSelectByBLE");
  v812 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v813 = objc_opt_isKindOfClass();

  if ((v813 & 1) != 0)
    v807 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorAllowSelectByBLE"), MEMORY[0x24BDBD1C0], v807);
  v814 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorAllowSelectByBLE = self->_candidateSelectorAllowSelectByBLE;
  self->_candidateSelectorAllowSelectByBLE = v814;

  v816 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByLOI](self, "candidateSelectorAllowSelectByLOI");
  v817 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v818 = objc_opt_isKindOfClass();

  if ((v818 & 1) != 0)
    v816 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByLOI](self, "candidateSelectorAllowSelectByLOI");
  v819 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v820 = objc_opt_isKindOfClass();

  if ((v820 & 1) != 0)
    v816 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByLOI](self, "candidateSelectorAllowSelectByLOI");
  v821 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v822 = objc_opt_isKindOfClass();

  if ((v822 & 1) != 0)
    v816 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorAllowSelectByLOI"), MEMORY[0x24BDBD1C8], v816);
  v823 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorAllowSelectByLOI = self->_candidateSelectorAllowSelectByLOI;
  self->_candidateSelectorAllowSelectByLOI = v823;

  v825 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByPDRFence](self, "candidateSelectorAllowSelectByPDRFence");
  v826 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v827 = objc_opt_isKindOfClass();

  if ((v827 & 1) != 0)
    v825 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByPDRFence](self, "candidateSelectorAllowSelectByPDRFence");
  v828 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v829 = objc_opt_isKindOfClass();

  if ((v829 & 1) != 0)
    v825 = objc_opt_class();
  -[IRPreferences candidateSelectorAllowSelectByPDRFence](self, "candidateSelectorAllowSelectByPDRFence");
  v830 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v831 = objc_opt_isKindOfClass();

  if ((v831 & 1) != 0)
    v825 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorAllowSelectByPDRFence"), MEMORY[0x24BDBD1C8], v825);
  v832 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorAllowSelectByPDRFence = self->_candidateSelectorAllowSelectByPDRFence;
  self->_candidateSelectorAllowSelectByPDRFence = v832;

  v834 = objc_opt_class();
  -[IRPreferences candidateSelectorCallToActionAppearThreshold](self, "candidateSelectorCallToActionAppearThreshold");
  v835 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v836 = objc_opt_isKindOfClass();

  if ((v836 & 1) != 0)
    v834 = objc_opt_class();
  -[IRPreferences candidateSelectorCallToActionAppearThreshold](self, "candidateSelectorCallToActionAppearThreshold");
  v837 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v838 = objc_opt_isKindOfClass();

  if ((v838 & 1) != 0)
    v834 = objc_opt_class();
  -[IRPreferences candidateSelectorCallToActionAppearThreshold](self, "candidateSelectorCallToActionAppearThreshold");
  v839 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v840 = objc_opt_isKindOfClass();

  if ((v840 & 1) != 0)
    v834 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRcandidateSelectorCallToActionAppearThreshold"), &unk_25105ECF0, v834);
  v841 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  candidateSelectorCallToActionAppearThreshold = self->_candidateSelectorCallToActionAppearThreshold;
  self->_candidateSelectorCallToActionAppearThreshold = v841;

  v843 = objc_opt_class();
  -[IRPreferences pdrFenceRadiusInMeters](self, "pdrFenceRadiusInMeters");
  v844 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v845 = objc_opt_isKindOfClass();

  if ((v845 & 1) != 0)
    v843 = objc_opt_class();
  -[IRPreferences pdrFenceRadiusInMeters](self, "pdrFenceRadiusInMeters");
  v846 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v847 = objc_opt_isKindOfClass();

  if ((v847 & 1) != 0)
    v843 = objc_opt_class();
  -[IRPreferences pdrFenceRadiusInMeters](self, "pdrFenceRadiusInMeters");
  v848 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v849 = objc_opt_isKindOfClass();

  if ((v849 & 1) != 0)
    v843 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRpdrFenceRadiusInMeters"), &unk_25105EDF8, v843);
  v850 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pdrFenceRadiusInMeters = self->_pdrFenceRadiusInMeters;
  self->_pdrFenceRadiusInMeters = v850;

  v852 = objc_opt_class();
  -[IRPreferences pdrFenceRadiusTimeoutInSeconds](self, "pdrFenceRadiusTimeoutInSeconds");
  v853 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v854 = objc_opt_isKindOfClass();

  if ((v854 & 1) != 0)
    v852 = objc_opt_class();
  -[IRPreferences pdrFenceRadiusTimeoutInSeconds](self, "pdrFenceRadiusTimeoutInSeconds");
  v855 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v856 = objc_opt_isKindOfClass();

  if ((v856 & 1) != 0)
    v852 = objc_opt_class();
  -[IRPreferences pdrFenceRadiusTimeoutInSeconds](self, "pdrFenceRadiusTimeoutInSeconds");
  v857 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v858 = objc_opt_isKindOfClass();

  if ((v858 & 1) != 0)
    v852 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRpdrFenceRadiusTimeoutInSeconds"), &unk_25105EC48, v852);
  v859 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pdrFenceRadiusTimeoutInSeconds = self->_pdrFenceRadiusTimeoutInSeconds;
  self->_pdrFenceRadiusTimeoutInSeconds = v859;

  v861 = objc_opt_class();
  -[IRPreferences pdrFenceOtherThanRadiusTimeoutInSeconds](self, "pdrFenceOtherThanRadiusTimeoutInSeconds");
  v862 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v863 = objc_opt_isKindOfClass();

  if ((v863 & 1) != 0)
    v861 = objc_opt_class();
  -[IRPreferences pdrFenceOtherThanRadiusTimeoutInSeconds](self, "pdrFenceOtherThanRadiusTimeoutInSeconds");
  v864 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v865 = objc_opt_isKindOfClass();

  if ((v865 & 1) != 0)
    v861 = objc_opt_class();
  -[IRPreferences pdrFenceOtherThanRadiusTimeoutInSeconds](self, "pdrFenceOtherThanRadiusTimeoutInSeconds");
  v866 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v867 = objc_opt_isKindOfClass();

  if ((v867 & 1) != 0)
    v861 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRpdrFenceOtherThanRadiusTimeoutInSeconds"), &unk_25105EDB0, v861);
  v868 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  pdrFenceOtherThanRadiusTimeoutInSeconds = self->_pdrFenceOtherThanRadiusTimeoutInSeconds;
  self->_pdrFenceOtherThanRadiusTimeoutInSeconds = v868;

  v870 = objc_opt_class();
  -[IRPreferences miloRoomDetectionInCustomLOIEnabled](self, "miloRoomDetectionInCustomLOIEnabled");
  v871 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v872 = objc_opt_isKindOfClass();

  if ((v872 & 1) != 0)
    v870 = objc_opt_class();
  -[IRPreferences miloRoomDetectionInCustomLOIEnabled](self, "miloRoomDetectionInCustomLOIEnabled");
  v873 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v874 = objc_opt_isKindOfClass();

  if ((v874 & 1) != 0)
    v870 = objc_opt_class();
  -[IRPreferences miloRoomDetectionInCustomLOIEnabled](self, "miloRoomDetectionInCustomLOIEnabled");
  v875 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v876 = objc_opt_isKindOfClass();

  if ((v876 & 1) != 0)
    v870 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRmiloRoomDetectionInCustomLOIEnabled"), MEMORY[0x24BDBD1C8], v870);
  v877 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  miloRoomDetectionInCustomLOIEnabled = self->_miloRoomDetectionInCustomLOIEnabled;
  self->_miloRoomDetectionInCustomLOIEnabled = v877;

  v879 = objc_opt_class();
  -[IRPreferences timeInSecondsWithoutUsageToAggressiveFiltering](self, "timeInSecondsWithoutUsageToAggressiveFiltering");
  v880 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v881 = objc_opt_isKindOfClass();

  if ((v881 & 1) != 0)
    v879 = objc_opt_class();
  -[IRPreferences timeInSecondsWithoutUsageToAggressiveFiltering](self, "timeInSecondsWithoutUsageToAggressiveFiltering");
  v882 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v883 = objc_opt_isKindOfClass();

  if ((v883 & 1) != 0)
    v879 = objc_opt_class();
  -[IRPreferences timeInSecondsWithoutUsageToAggressiveFiltering](self, "timeInSecondsWithoutUsageToAggressiveFiltering");
  v884 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v885 = objc_opt_isKindOfClass();

  if ((v885 & 1) != 0)
    v879 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRtimeInSecondsWithoutUsageToAggressiveFiltering"), &unk_25105EC90, v879);
  v886 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  timeInSecondsWithoutUsageToAggressiveFiltering = self->_timeInSecondsWithoutUsageToAggressiveFiltering;
  self->_timeInSecondsWithoutUsageToAggressiveFiltering = v886;

  v888 = objc_opt_class();
  -[IRPreferences timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering](self, "timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering");
  v889 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v890 = objc_opt_isKindOfClass();

  if ((v890 & 1) != 0)
    v888 = objc_opt_class();
  -[IRPreferences timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering](self, "timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering");
  v891 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v892 = objc_opt_isKindOfClass();

  if ((v892 & 1) != 0)
    v888 = objc_opt_class();
  -[IRPreferences timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering](self, "timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering");
  v893 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v894 = objc_opt_isKindOfClass();

  if ((v894 & 1) != 0)
    v888 = objc_opt_class();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRtimeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering"), &unk_25105ECC0, v888);
  v895 = (NSNumber *)objc_claimAutoreleasedReturnValue();
  timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering = self->_timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering;
  self->_timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering = v895;

  v897 = objc_opt_class();
  -[IRPreferences startDateForSignificantBundlesLookup](self, "startDateForSignificantBundlesLookup");
  v898 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v899 = objc_opt_isKindOfClass();

  if ((v899 & 1) != 0)
    v897 = objc_opt_class();
  -[IRPreferences startDateForSignificantBundlesLookup](self, "startDateForSignificantBundlesLookup");
  v900 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v901 = objc_opt_isKindOfClass();

  if ((v901 & 1) != 0)
    v897 = objc_opt_class();
  -[IRPreferences startDateForSignificantBundlesLookup](self, "startDateForSignificantBundlesLookup");
  v902 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v903 = objc_opt_isKindOfClass();

  if ((v903 & 1) != 0)
    v897 = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v906 = (id)objc_claimAutoreleasedReturnValue();
  -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:](self, "_getKeyWithType:withDefaultValue:expectedType:", CFSTR("IRstartDateForSignificantBundlesLookup"), v906, v897);
  v904 = (NSDate *)objc_claimAutoreleasedReturnValue();
  startDateForSignificantBundlesLookup = self->_startDateForSignificantBundlesLookup;
  self->_startDateForSignificantBundlesLookup = v904;

}

- (id)_getKeyWithType:(id)a3 withDefaultValue:(id)a4 expectedType:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  os_log_t *v12;
  char isKindOfClass;
  NSObject *v14;
  id v15;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  _BOOL4 v20;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  _BYTE v30[24];
  Class v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  -[IRPreferences defaults](self, "defaults");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (os_log_t *)MEMORY[0x24BE5B270];
  if (!v11)
    goto LABEL_8;
  isKindOfClass = objc_opt_isKindOfClass();
  v14 = *v12;
  if ((isKindOfClass & 1) == 0)
  {
    if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
    {
      v25 = v14;
      *(_DWORD *)v30 = 138412802;
      *(_QWORD *)&v30[4] = v8;
      *(_WORD *)&v30[12] = 2112;
      *(_QWORD *)&v30[14] = objc_opt_class();
      *(_WORD *)&v30[22] = 2112;
      v31 = a5;
      v26 = *(id *)&v30[14];
      _os_log_debug_impl(&dword_23FFBA000, v25, OS_LOG_TYPE_DEBUG, "#preferences, Unexpected type stored in defaults for settings key %@ . Got %@ expecting %@. Ignoring override.", v30, 0x20u);

    }
LABEL_8:
    -[IRPreferences mobileAssetSettings](self, "mobileAssetSettings", *(_OWORD *)v30, *(_QWORD *)&v30[16], v31);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = objc_opt_isKindOfClass();
      v19 = *v12;
      if ((v18 & 1) != 0)
      {
        v20 = os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT);
        v21 = v17;
        if (v20)
        {
          *(_DWORD *)v30 = 138412546;
          *(_QWORD *)&v30[4] = v17;
          *(_WORD *)&v30[12] = 2112;
          *(_QWORD *)&v30[14] = v8;
          _os_log_impl(&dword_23FFBA000, v19, OS_LOG_TYPE_DEFAULT, "#preferences, Setting found in mobile asset storage. Setting value: %@ for key: %@", v30, 0x16u);
          v21 = v17;
        }
LABEL_16:
        v15 = v21;

        goto LABEL_17;
      }
      if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG))
      {
        v27 = v19;
        v28 = (void *)objc_opt_class();
        *(_DWORD *)v30 = 138412802;
        *(_QWORD *)&v30[4] = v8;
        *(_WORD *)&v30[12] = 2112;
        *(_QWORD *)&v30[14] = v28;
        *(_WORD *)&v30[22] = 2112;
        v31 = a5;
        v29 = v28;
        _os_log_debug_impl(&dword_23FFBA000, v27, OS_LOG_TYPE_DEBUG, "#preferences, Unexpected type stored in mobile asset for preference key %@ . Got %@ expecting %@. Ignoring mobile asset override.", v30, 0x20u);

      }
    }
    v22 = *v12;
    v23 = os_log_type_enabled(*v12, OS_LOG_TYPE_DEBUG);
    v21 = v9;
    if (v23)
    {
      -[IRPreferences _getKeyWithType:withDefaultValue:expectedType:].cold.1((uint64_t)v8, (uint64_t)v9, v22);
      v21 = v9;
    }
    goto LABEL_16;
  }
  if (os_log_type_enabled(*v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v30 = 138412546;
    *(_QWORD *)&v30[4] = v11;
    *(_WORD *)&v30[12] = 2112;
    *(_QWORD *)&v30[14] = v8;
    _os_log_impl(&dword_23FFBA000, v14, OS_LOG_TYPE_DEFAULT, "#preferences, Setting found in defaults storage. Setting value: %@ for key: %@", v30, 0x16u);
  }
  v15 = v11;
LABEL_17:

  return v15;
}

- (void)_registerForUserDefaultsRefreshNotification
{
  int *p_userDefaultsRefreshToken;
  NSObject *v3;
  NSObject *v4;

  p_userDefaultsRefreshToken = &self->_userDefaultsRefreshToken;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v4 = objc_claimAutoreleasedReturnValue();
  v3 = dispatch_queue_create("com.apple.intelligentroutingd.UserDefaultsRefresh", v4);
  notify_register_dispatch("com.apple.intelligentroutingd.UserDefaultsRefresh", p_userDefaultsRefreshToken, v3, &__block_literal_global_18);

}

void __60__IRPreferences__registerForUserDefaultsRefreshNotification__block_invoke()
{
  id v0;

  +[IRPreferences shared](IRPreferences, "shared");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "refresh");

}

- (void)setMobileAssetSettingsWithMobileAssetDict:(id)a3 assetVersion:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v6 = a3;
  v7 = (objc_class *)MEMORY[0x24BDBCED8];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  objc_msgSend(v6, "allKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __72__IRPreferences_setMobileAssetSettingsWithMobileAssetDict_assetVersion___block_invoke;
  v15[3] = &unk_251044EF8;
  v16 = v9;
  v17 = v6;
  v11 = v6;
  v14 = v9;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v15);

  +[IRPreferences shared](IRPreferences, "shared");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setMobileAssetSettings:", v14);

  -[IRPreferences setMobileAssetVersion:](self, "setMobileAssetVersion:", v8);
  +[IRPreferences shared](IRPreferences, "shared");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "refresh");

}

void __72__IRPreferences_setMobileAssetSettingsWithMobileAssetDict_assetVersion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (objc_msgSend(v3, "hasPrefix:", CFSTR("IR")))
  {
    objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, v3);

  }
  else
  {
    v5 = *MEMORY[0x24BE5B270];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
    {
      v6 = 138412546;
      v7 = v3;
      v8 = 2112;
      v9 = CFSTR("IR");
      _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_INFO, "#preferences, Ignoring mobile asset setting '%@' which does not have %@ prefix", (uint8_t *)&v6, 0x16u);
    }
  }

}

- (NSString)mobileAssetVersion
{
  return self->_mobileAssetVersion;
}

- (void)setMobileAssetVersion:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetVersion, a3);
}

- (NSString)testPreferenceString
{
  return self->_testPreferenceString;
}

- (NSNumber)testPreferenceInteger
{
  return self->_testPreferenceInteger;
}

- (NSNumber)testPreferenceDouble
{
  return self->_testPreferenceDouble;
}

- (NSArray)overrideIsAirplayForCandidateIDArray
{
  return self->_overrideIsAirplayForCandidateIDArray;
}

- (NSNumber)testMobileAssetLoad
{
  return self->_testMobileAssetLoad;
}

- (NSNumber)loadMobileAssetXPCActivityInterval
{
  return self->_loadMobileAssetXPCActivityInterval;
}

- (NSNumber)bleRssiProximityThreshold
{
  return self->_bleRssiProximityThreshold;
}

- (NSNumber)deviceRangeProximityThreshold
{
  return self->_deviceRangeProximityThreshold;
}

- (NSNumber)miloLslIsSameMiloThreshold
{
  return self->_miloLslIsSameMiloThreshold;
}

- (NSNumber)pickerChoiceOverrideIntervalSeconds
{
  return self->_pickerChoiceOverrideIntervalSeconds;
}

- (NSNumber)mediaPlaybackEventsTimeIntervalThreshold
{
  return self->_mediaPlaybackEventsTimeIntervalThreshold;
}

- (NSNumber)appleTvCtrlEventsTimeIntervalThreshold
{
  return self->_appleTvCtrlEventsTimeIntervalThreshold;
}

- (NSNumber)cleanupXPCActivityInterval
{
  return self->_cleanupXPCActivityInterval;
}

- (NSNumber)dbCleanupXPCActivityDeleteServiceThreshold
{
  return self->_dbCleanupXPCActivityDeleteServiceThreshold;
}

- (NSNumber)dbCleanupXPCActivityDeleteHistoryEventsThreshold
{
  return self->_dbCleanupXPCActivityDeleteHistoryEventsThreshold;
}

- (NSNumber)dbCleanupXPCActivityDeleteReplayEventsThreshold
{
  return self->_dbCleanupXPCActivityDeleteReplayEventsThreshold;
}

- (NSNumber)dbCleanupXPCActivityDeleteCandidatesThreshold
{
  return self->_dbCleanupXPCActivityDeleteCandidatesThreshold;
}

- (NSNumber)miloEnable
{
  return self->_miloEnable;
}

- (NSNumber)candidateLastUsedThrForMiLoLowLatancyPowerOpt
{
  return self->_candidateLastUsedThrForMiLoLowLatancyPowerOpt;
}

- (NSNumber)miloTimeoutForSetSpotOnRequestSeconds
{
  return self->_miloTimeoutForSetSpotOnRequestSeconds;
}

- (NSNumber)miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts
{
  return self->_miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts;
}

- (NSNumber)ttrThrottleTimeSec
{
  return self->_ttrThrottleTimeSec;
}

- (NSNumber)ttrPeriodicThrottleTimeSec
{
  return self->_ttrPeriodicThrottleTimeSec;
}

- (NSNumber)proximitySessionRetryCountThreshold
{
  return self->_proximitySessionRetryCountThreshold;
}

- (NSNumber)nearbyDeviceRegionThreshold
{
  return self->_nearbyDeviceRegionThreshold;
}

- (NSNumber)uwbSuspendPedestrianFenceRadiusMeters
{
  return self->_uwbSuspendPedestrianFenceRadiusMeters;
}

- (NSNumber)uwbSuspendPedestrianFenceEnable
{
  return self->_uwbSuspendPedestrianFenceEnable;
}

- (NSNumber)numberOfHistoryEventsInCache
{
  return self->_numberOfHistoryEventsInCache;
}

- (NSNumber)coreAnalyticsEnable
{
  return self->_coreAnalyticsEnable;
}

- (NSNumber)coreAnalyticsXPCActivityInterval
{
  return self->_coreAnalyticsXPCActivityInterval;
}

- (NSNumber)coreAnalyticsXPCHistoryEventsValidThreshold
{
  return self->_coreAnalyticsXPCHistoryEventsValidThreshold;
}

- (NSString)coreAnalyticsWeeklyMobileAssetVersion
{
  return self->_coreAnalyticsWeeklyMobileAssetVersion;
}

- (NSNumber)coreAnalyticsSessionEnable
{
  return self->_coreAnalyticsSessionEnable;
}

- (NSNumber)coreAnalyticsSessionPeriodInSeconds
{
  return self->_coreAnalyticsSessionPeriodInSeconds;
}

- (NSNumber)mediaRulesContinuityTimeIntervalInSeconds
{
  return self->_mediaRulesContinuityTimeIntervalInSeconds;
}

- (NSNumber)mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds
{
  return self->_mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds;
}

- (NSNumber)mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds
{
  return self->_mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds;
}

- (NSNumber)mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds
{
  return self->_mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds;
}

- (NSNumber)mediaRulesPickerChoiceConsistencyEnable
{
  return self->_mediaRulesPickerChoiceConsistencyEnable;
}

- (NSNumber)mediaRulesUserRejectedInLastDayEnable
{
  return self->_mediaRulesUserRejectedInLastDayEnable;
}

- (NSNumber)appleTvCtrlRulesContinuityTimeIntervalInSeconds
{
  return self->_appleTvCtrlRulesContinuityTimeIntervalInSeconds;
}

- (NSNumber)appInFocusWindowEnableOnServiceRun
{
  return self->_appInFocusWindowEnableOnServiceRun;
}

- (NSNumber)liveOnEnable
{
  return self->_liveOnEnable;
}

- (NSNumber)liveOnTtrDebugDataRequestsEnabled
{
  return self->_liveOnTtrDebugDataRequestsEnabled;
}

- (NSNumber)liveOnTtrPeriodicDataRequestsEnabled
{
  return self->_liveOnTtrPeriodicDataRequestsEnabled;
}

- (NSNumber)numberOfUsedCandidates
{
  return self->_numberOfUsedCandidates;
}

- (NSNumber)numberOfSeenCandidates
{
  return self->_numberOfSeenCandidates;
}

- (NSNumber)candidateUpdateTimeIntervalSeconds
{
  return self->_candidateUpdateTimeIntervalSeconds;
}

- (NSNumber)uprankToAutorouteEligibilityThreshold1stParty
{
  return self->_uprankToAutorouteEligibilityThreshold1stParty;
}

- (NSNumber)uprankToOneTapEligibilityThreshold1stParty
{
  return self->_uprankToOneTapEligibilityThreshold1stParty;
}

- (NSNumber)downrankToNoneEligibilityThreshold1stParty
{
  return self->_downrankToNoneEligibilityThreshold1stParty;
}

- (NSNumber)downrankToOneTapEligibilityThreshold1stParty
{
  return self->_downrankToOneTapEligibilityThreshold1stParty;
}

- (NSNumber)downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty
{
  return self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty;
}

- (NSNumber)eligibilityInitStateIsOneTap1stParty
{
  return self->_eligibilityInitStateIsOneTap1stParty;
}

- (NSNumber)uprankToAutorouteEligibilityThreshold3rdParty
{
  return self->_uprankToAutorouteEligibilityThreshold3rdParty;
}

- (NSNumber)uprankToOneTapEligibilityThreshold3rdParty
{
  return self->_uprankToOneTapEligibilityThreshold3rdParty;
}

- (NSNumber)downrankToNoneEligibilityThreshold3rdParty
{
  return self->_downrankToNoneEligibilityThreshold3rdParty;
}

- (NSNumber)downrankToOneTapEligibilityThreshold3rdParty
{
  return self->_downrankToOneTapEligibilityThreshold3rdParty;
}

- (NSNumber)downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty
{
  return self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty;
}

- (NSNumber)eligibilityInitStateIsOneTap3rdParty
{
  return self->_eligibilityInitStateIsOneTap3rdParty;
}

- (NSNumber)pickerAutoSelectToPicketChoiceMinInterval
{
  return self->_pickerAutoSelectToPicketChoiceMinInterval;
}

- (NSNumber)brokeredUseScansForEligibilityOfMainDevice
{
  return self->_brokeredUseScansForEligibilityOfMainDevice;
}

- (NSNumber)brokeredUseScansForEligibilityOfSecondaryDevice
{
  return self->_brokeredUseScansForEligibilityOfSecondaryDevice;
}

- (NSNumber)miloSameSpaceRatioThreshold
{
  return self->_miloSameSpaceRatioThreshold;
}

- (NSNumber)miloSameSpaceEventsTimeIntervalSeconds
{
  return self->_miloSameSpaceEventsTimeIntervalSeconds;
}

- (NSNumber)miloSameSpaceEventsNumberOfEventsToWatch
{
  return self->_miloSameSpaceEventsNumberOfEventsToWatch;
}

- (NSNumber)loiSameSpaceEventsTimeIntervalSeconds
{
  return self->_loiSameSpaceEventsTimeIntervalSeconds;
}

- (NSNumber)loiSameSpaceEventsNumberOfEventsToWatch
{
  return self->_loiSameSpaceEventsNumberOfEventsToWatch;
}

- (NSArray)loiSameSpaceOverrideBrokerForCandidateIDArray
{
  return self->_loiSameSpaceOverrideBrokerForCandidateIDArray;
}

- (NSNumber)candidateSelectorMostUsedSimilarAppTimeIntervalSeconds
{
  return self->_candidateSelectorMostUsedSimilarAppTimeIntervalSeconds;
}

- (NSNumber)candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents
{
  return self->_candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents;
}

- (NSNumber)candidateSelectorMostUsedAnyAppTimeIntervalSeconds
{
  return self->_candidateSelectorMostUsedAnyAppTimeIntervalSeconds;
}

- (NSNumber)candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds
{
  return self->_candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds;
}

- (NSNumber)candidateSelectorMostUsedAnyAppMaximumNumberOfEvents
{
  return self->_candidateSelectorMostUsedAnyAppMaximumNumberOfEvents;
}

- (NSNumber)candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents
{
  return self->_candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents;
}

- (NSNumber)candidateSelectorIsContinuityEnabled
{
  return self->_candidateSelectorIsContinuityEnabled;
}

- (NSNumber)candidateSelectorIsMostUsedSimilarAppEnabled
{
  return self->_candidateSelectorIsMostUsedSimilarAppEnabled;
}

- (NSNumber)candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled
{
  return self->_candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled;
}

- (NSNumber)candidateSelectorIsNearestRangeEnabled
{
  return self->_candidateSelectorIsNearestRangeEnabled;
}

- (NSNumber)candidateSelectorIsMostUsedAnyAppEnabled
{
  return self->_candidateSelectorIsMostUsedAnyAppEnabled;
}

- (NSNumber)candidateSelectorAllowSelectByUWB
{
  return self->_candidateSelectorAllowSelectByUWB;
}

- (NSNumber)candidateSelectorAllowSelectByMiLo
{
  return self->_candidateSelectorAllowSelectByMiLo;
}

- (NSNumber)candidateSelectorAllowSelectByBLE
{
  return self->_candidateSelectorAllowSelectByBLE;
}

- (NSNumber)candidateSelectorAllowSelectByLOI
{
  return self->_candidateSelectorAllowSelectByLOI;
}

- (NSNumber)candidateSelectorAllowSelectByPDRFence
{
  return self->_candidateSelectorAllowSelectByPDRFence;
}

- (NSNumber)candidateSelectorCallToActionAppearThreshold
{
  return self->_candidateSelectorCallToActionAppearThreshold;
}

- (NSNumber)pdrFenceRadiusInMeters
{
  return self->_pdrFenceRadiusInMeters;
}

- (NSNumber)pdrFenceRadiusTimeoutInSeconds
{
  return self->_pdrFenceRadiusTimeoutInSeconds;
}

- (NSNumber)pdrFenceOtherThanRadiusTimeoutInSeconds
{
  return self->_pdrFenceOtherThanRadiusTimeoutInSeconds;
}

- (NSNumber)miloRoomDetectionInCustomLOIEnabled
{
  return self->_miloRoomDetectionInCustomLOIEnabled;
}

- (NSNumber)timeInSecondsWithoutUsageToAggressiveFiltering
{
  return self->_timeInSecondsWithoutUsageToAggressiveFiltering;
}

- (NSNumber)timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering
{
  return self->_timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering;
}

- (NSDate)startDateForSignificantBundlesLookup
{
  return self->_startDateForSignificantBundlesLookup;
}

- (NSUserDefaults)defaults
{
  return self->_defaults;
}

- (void)setDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_defaults, a3);
}

- (int)userDefaultsRefreshToken
{
  return self->_userDefaultsRefreshToken;
}

- (void)setUserDefaultsRefreshToken:(int)a3
{
  self->_userDefaultsRefreshToken = a3;
}

- (NSMutableDictionary)mobileAssetSettings
{
  return self->_mobileAssetSettings;
}

- (void)setMobileAssetSettings:(id)a3
{
  objc_storeStrong((id *)&self->_mobileAssetSettings, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mobileAssetSettings, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_startDateForSignificantBundlesLookup, 0);
  objc_storeStrong((id *)&self->_timeInSecondsToBeClassifiedAsNewCandidateForAggressiveFiltering, 0);
  objc_storeStrong((id *)&self->_timeInSecondsWithoutUsageToAggressiveFiltering, 0);
  objc_storeStrong((id *)&self->_miloRoomDetectionInCustomLOIEnabled, 0);
  objc_storeStrong((id *)&self->_pdrFenceOtherThanRadiusTimeoutInSeconds, 0);
  objc_storeStrong((id *)&self->_pdrFenceRadiusTimeoutInSeconds, 0);
  objc_storeStrong((id *)&self->_pdrFenceRadiusInMeters, 0);
  objc_storeStrong((id *)&self->_candidateSelectorCallToActionAppearThreshold, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByPDRFence, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByLOI, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByBLE, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByMiLo, 0);
  objc_storeStrong((id *)&self->_candidateSelectorAllowSelectByUWB, 0);
  objc_storeStrong((id *)&self->_candidateSelectorIsMostUsedAnyAppEnabled, 0);
  objc_storeStrong((id *)&self->_candidateSelectorIsNearestRangeEnabled, 0);
  objc_storeStrong((id *)&self->_candidateSelectorIsNearestRangeWithHistoryOrSameICloudEnabled, 0);
  objc_storeStrong((id *)&self->_candidateSelectorIsMostUsedSimilarAppEnabled, 0);
  objc_storeStrong((id *)&self->_candidateSelectorIsContinuityEnabled, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostRecentBrokeredDeviceMaximumNumberOfEvents, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostUsedAnyAppMaximumNumberOfEvents, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostRecentBrokeredMainDeviceIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostUsedAnyAppTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostUsedSimilarAppMaximumNumberOfEvents, 0);
  objc_storeStrong((id *)&self->_candidateSelectorMostUsedSimilarAppTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_loiSameSpaceOverrideBrokerForCandidateIDArray, 0);
  objc_storeStrong((id *)&self->_loiSameSpaceOverrideBrokerForAVODIDArray, 0);
  objc_storeStrong((id *)&self->_loiSameSpaceEventsNumberOfEventsToWatch, 0);
  objc_storeStrong((id *)&self->_loiSameSpaceEventsTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_miloSameSpaceEventsNumberOfEventsToWatch, 0);
  objc_storeStrong((id *)&self->_miloSameSpaceEventsTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_miloSameSpaceRatioThreshold, 0);
  objc_storeStrong((id *)&self->_brokeredUseScansForEligibilityOfSecondaryDevice, 0);
  objc_storeStrong((id *)&self->_brokeredUseScansForEligibilityOfMainDevice, 0);
  objc_storeStrong((id *)&self->_pickerAutoSelectToPicketChoiceMinInterval, 0);
  objc_storeStrong((id *)&self->_eligibilityInitStateIsOneTap3rdParty, 0);
  objc_storeStrong((id *)&self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold3rdParty, 0);
  objc_storeStrong((id *)&self->_downrankToOneTapEligibilityThreshold3rdParty, 0);
  objc_storeStrong((id *)&self->_downrankToNoneEligibilityThreshold3rdParty, 0);
  objc_storeStrong((id *)&self->_uprankToOneTapEligibilityThreshold3rdParty, 0);
  objc_storeStrong((id *)&self->_uprankToAutorouteEligibilityThreshold3rdParty, 0);
  objc_storeStrong((id *)&self->_eligibilityInitStateIsOneTap1stParty, 0);
  objc_storeStrong((id *)&self->_downrankToNoneEligibilityBasedOnDismissAndRejectThreshold1stParty, 0);
  objc_storeStrong((id *)&self->_downrankToOneTapEligibilityThreshold1stParty, 0);
  objc_storeStrong((id *)&self->_downrankToNoneEligibilityThreshold1stParty, 0);
  objc_storeStrong((id *)&self->_uprankToOneTapEligibilityThreshold1stParty, 0);
  objc_storeStrong((id *)&self->_uprankToAutorouteEligibilityThreshold1stParty, 0);
  objc_storeStrong((id *)&self->_candidateUpdateTimeIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_numberOfSeenCandidates, 0);
  objc_storeStrong((id *)&self->_numberOfUsedCandidates, 0);
  objc_storeStrong((id *)&self->_liveOnTtrPeriodicDataRequestsEnabled, 0);
  objc_storeStrong((id *)&self->_liveOnTtrDebugDataRequestsEnabled, 0);
  objc_storeStrong((id *)&self->_liveOnEnable, 0);
  objc_storeStrong((id *)&self->_bannersFromScreenUnlockToAppInFocusEnable, 0);
  objc_storeStrong((id *)&self->_appInFocusWindowEnableOnServiceRun, 0);
  objc_storeStrong((id *)&self->_appInFocusWindowInSeconds, 0);
  objc_storeStrong((id *)&self->_appleTvCtrlRulesContinuityTimeIntervalInSeconds, 0);
  objc_storeStrong((id *)&self->_mediaRulesUserRejectedInLastDayEnable, 0);
  objc_storeStrong((id *)&self->_mediaRulesPickerChoiceConsistencyEnable, 0);
  objc_storeStrong((id *)&self->_mediaRulesFilterSimilarMultipleEventsTimeIntervalInSeconds, 0);
  objc_storeStrong((id *)&self->_mediaRulesFilterAnyMultipleEventsTimeIntervalInSeconds, 0);
  objc_storeStrong((id *)&self->_mediaRulesPickerChoiceConsistencyTimeIntervalInSeconds, 0);
  objc_storeStrong((id *)&self->_mediaRulesContinuityTimeIntervalInSeconds, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsSessionPeriodInSeconds, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsSessionEnable, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsWeeklyMobileAssetVersion, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsStatisticsCollectionPeriodInSeconds, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsXPCHistoryEventsValidThreshold, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsXPCActivityInterval, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsEnable, 0);
  objc_storeStrong((id *)&self->_numberOfEventsToSaveInDisk, 0);
  objc_storeStrong((id *)&self->_numberOfHistoryEventsInCache, 0);
  objc_storeStrong((id *)&self->_replayWriterEventsSizeToBuffer, 0);
  objc_storeStrong((id *)&self->_uwbSuspendPedestrianFenceEnable, 0);
  objc_storeStrong((id *)&self->_uwbSuspendPedestrianFenceRadiusMeters, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceRegionThreshold, 0);
  objc_storeStrong((id *)&self->_proximitySessionRetryCountThreshold, 0);
  objc_storeStrong((id *)&self->_nearbyDeviceMeasurmentExpityTimeSeconds, 0);
  objc_storeStrong((id *)&self->_ttrPeriodicThrottleTimeSec, 0);
  objc_storeStrong((id *)&self->_ttrThrottleTimeSec, 0);
  objc_storeStrong((id *)&self->_miLoProviderMaxNumberOfConsecutiveMiLoFailAttempts, 0);
  objc_storeStrong((id *)&self->_miloTimeoutForSetSpotOnRequestSeconds, 0);
  objc_storeStrong((id *)&self->_candidateLastUsedThrForMiLoLowLatancyPowerOpt, 0);
  objc_storeStrong((id *)&self->_miloEnable, 0);
  objc_storeStrong((id *)&self->_dbCleanupXPCActivityDeleteCandidatesThreshold, 0);
  objc_storeStrong((id *)&self->_dbCleanupXPCActivityDeleteReplayEventsThreshold, 0);
  objc_storeStrong((id *)&self->_dbCleanupXPCActivityDeleteHistoryEventsThreshold, 0);
  objc_storeStrong((id *)&self->_dbCleanupXPCActivityDeleteServiceThreshold, 0);
  objc_storeStrong((id *)&self->_cleanupXPCActivityInterval, 0);
  objc_storeStrong((id *)&self->_appleTvCtrlEventsTimeIntervalThreshold, 0);
  objc_storeStrong((id *)&self->_mediaPlaybackEventsTimeIntervalThreshold, 0);
  objc_storeStrong((id *)&self->_pickerChoiceOverrideIntervalSeconds, 0);
  objc_storeStrong((id *)&self->_miloLslIsSameMiloThreshold, 0);
  objc_storeStrong((id *)&self->_deviceRangeProximityThreshold, 0);
  objc_storeStrong((id *)&self->_bleRssiProximityThreshold, 0);
  objc_storeStrong((id *)&self->_loadMobileAssetXPCActivityInterval, 0);
  objc_storeStrong((id *)&self->_testMobileAssetLoad, 0);
  objc_storeStrong((id *)&self->_overrideIsAirplayForCandidateIDArray, 0);
  objc_storeStrong((id *)&self->_testPreferenceDouble, 0);
  objc_storeStrong((id *)&self->_testPreferenceInteger, 0);
  objc_storeStrong((id *)&self->_testPreferenceString, 0);
  objc_storeStrong((id *)&self->_mobileAssetVersion, 0);
}

- (void)_getKeyWithType:(uint64_t)a1 withDefaultValue:(uint64_t)a2 expectedType:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_debug_impl(&dword_23FFBA000, log, OS_LOG_TYPE_DEBUG, "#preferences, Returning default value for key %@ since no overwrite performed. Default value: %@", (uint8_t *)&v3, 0x16u);
}

@end
