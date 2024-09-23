@implementation _ATXAppLaunchHistogram

- (void)encodeWithCoder:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __42___ATXAppLaunchHistogram_encodeWithCoder___block_invoke;
  v7[3] = &unk_1E82E1718;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);
  objc_msgSend(v6, "encodeInt32:forKey:", self->_timeBase, CFSTR("timeBase"));

}

- (_ATXAppLaunchHistogram)initWithHistogram:(id)a3 bucketCount:(unsigned __int16)a4 filter:(BOOL)a5 timeBase:(int)a6
{
  _BOOL8 v7;
  uint64_t v8;
  id v11;
  _ATXAppLaunchHistogram *v12;
  ATXGuardedHistData *v13;
  uint64_t v14;
  _PASLock *lock;
  uint64_t v16;
  _ATXInternalUninstallNotification *uninstallNotificationListener;
  _ATXInternalUninstallNotification *v18;
  uint64_t v19;
  _QWORD v21[4];
  _ATXAppLaunchHistogram *v22;
  SEL v23;
  _QWORD v24[4];
  id v25;
  id location;
  objc_super v27;

  v7 = a5;
  v8 = a4;
  v11 = a3;
  v27.receiver = self;
  v27.super_class = (Class)_ATXAppLaunchHistogram;
  v12 = -[_ATXAppLaunchHistogram init](&v27, sel_init);
  if (v12)
  {
    v13 = -[ATXGuardedHistData initWithHistogramData:bucketCount:filter:]([ATXGuardedHistData alloc], "initWithHistogramData:bucketCount:filter:", v11, v8, v7);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815F0]), "initWithGuardedData:", v13);
    lock = v12->_lock;
    v12->_lock = (_PASLock *)v14;

    v12->_timeBase = a6;
    v12->_secondsPerLocaltimeInterval = a6 / (int)v8;
    pthread_mutex_init(&v12->_prevLocaltimeLock, 0);
    objc_initWeak(&location, v12);
    v16 = objc_opt_new();
    uninstallNotificationListener = v12->_uninstallNotificationListener;
    v12->_uninstallNotificationListener = (_ATXInternalUninstallNotification *)v16;

    v18 = v12->_uninstallNotificationListener;
    v19 = MEMORY[0x1E0C809B0];
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __72___ATXAppLaunchHistogram_initWithHistogram_bucketCount_filter_timeBase___block_invoke;
    v24[3] = &unk_1E82DAE98;
    objc_copyWeak(&v25, &location);
    -[_ATXInternalUninstallNotification registerForNotificationsWithUninstallBlock:](v18, "registerForNotificationsWithUninstallBlock:", v24);
    v21[0] = v19;
    v21[1] = 3221225472;
    v21[2] = __72___ATXAppLaunchHistogram_initWithHistogram_bucketCount_filter_timeBase___block_invoke_2;
    v21[3] = &unk_1E82DC688;
    v23 = a2;
    v22 = v12;
    if (initWithHistogram_bucketCount_filter_timeBase__onceToken != -1)
      dispatch_once(&initWithHistogram_bucketCount_filter_timeBase__onceToken, v21);

    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);

  }
  return v12;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_prevLocaltimeLock);
  v3.receiver = self;
  v3.super_class = (Class)_ATXAppLaunchHistogram;
  -[_ATXAppLaunchHistogram dealloc](&v3, sel_dealloc);
}

- (_ATXAppLaunchHistogram)initWithType:(int64_t)a3
{
  _ATXAppLaunchHistogram *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _ATXAppLaunchHistogram *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  const __CFString *v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  const __CFString *v36;
  NSObject *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSObject *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  const __CFString *v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  NSObject *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  NSObject *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  NSObject *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  NSObject *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  NSObject *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  NSObject *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  NSObject *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  NSObject *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSObject *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  NSObject *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  NSObject *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  NSObject *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  NSObject *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  NSObject *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  NSObject *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  NSObject *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  NSObject *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  NSObject *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  NSObject *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  NSObject *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  NSObject *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  NSObject *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  NSObject *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  NSObject *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  NSObject *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  NSObject *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  NSObject *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  NSObject *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  NSObject *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  NSObject *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  NSObject *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  NSObject *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  NSObject *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  NSObject *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  NSObject *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  NSObject *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  NSObject *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  NSObject *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  NSObject *v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  NSObject *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  NSObject *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  NSObject *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  NSObject *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  NSObject *v440;
  uint64_t v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  NSObject *v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  NSObject *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  NSObject *v464;
  uint64_t v465;
  uint64_t v466;
  uint64_t v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  NSObject *v472;
  uint64_t v473;
  uint64_t v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  NSObject *v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  uint64_t v485;
  uint64_t v486;
  uint64_t v487;
  NSObject *v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  uint64_t v495;
  NSObject *v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  uint64_t v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  NSObject *v504;
  uint64_t v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  uint64_t v511;
  NSObject *v512;
  uint64_t v513;
  uint64_t v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  NSObject *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  uint64_t v525;
  uint64_t v526;
  uint64_t v527;
  NSObject *v528;
  uint64_t v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  uint64_t v534;
  uint64_t v535;
  NSObject *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  uint64_t v541;
  uint64_t v542;
  uint64_t v543;
  NSObject *v544;
  uint64_t v545;
  uint64_t v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  uint64_t v550;
  uint64_t v551;
  NSObject *v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  uint64_t v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  NSObject *v560;
  uint64_t v561;
  uint64_t v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  uint64_t v566;
  uint64_t v567;
  NSObject *v568;
  uint64_t v569;
  uint64_t v570;
  uint64_t v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  NSObject *v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  uint64_t v580;
  uint64_t v581;
  uint64_t v582;
  uint64_t v583;
  NSObject *v584;
  uint64_t v585;
  uint64_t v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  uint64_t v591;
  NSObject *v592;
  uint64_t v593;
  uint64_t v594;
  uint64_t v595;
  uint64_t v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  NSObject *v600;
  uint64_t v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  uint64_t v606;
  uint64_t v607;
  NSObject *v608;
  uint64_t v609;
  uint64_t v610;
  uint64_t v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  uint64_t v615;
  NSObject *v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  uint64_t v621;
  uint64_t v622;
  uint64_t v623;
  NSObject *v624;
  uint64_t v625;
  uint64_t v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  uint64_t v630;
  uint64_t v631;
  const __CFString *v633;

  v3 = self;
  v4 = 0;
  v5 = 1;
  v6 = 86400;
  switch(a3)
  {
    case 0:
    case 1:
      v5 = 200;
      goto LABEL_6;
    case 2:
    case 17:
    case 19:
      v4 = 0;
      v6 = 604800;
      v5 = 7;
      goto LABEL_7;
    case 4:
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.14(v8, v9, v10, v11, v12, v13, v14, v15);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeWifiAppLaunch");
      goto LABEL_243;
    case 6:
      __atxlog_handle_default();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.20(v19, v20, v21, v22, v23, v24, v25, v26);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_APRHistogramTypeAppIntentExplicitConfirms");
      goto LABEL_243;
    case 7:
      __atxlog_handle_default();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.21(v27, v28, v29, v30, v31, v32, v33, v34);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_APRHistogramTypeAppIntentExplicitRejects");
      goto LABEL_243;
    case 8:
      __atxlog_handle_default();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.24();

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v36 = CFSTR("_APRHistogramTypeAppIntentDonation is deprecated.");
      goto LABEL_244;
    case 9:
      __atxlog_handle_default();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.22(v37, v38, v39, v40, v41, v42, v43, v44);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_APRHistogramTypeAppIntentImplicitConfirms");
      goto LABEL_243;
    case 10:
      __atxlog_handle_default();
      v45 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.23(v45, v46, v47, v48, v49, v50, v51, v52);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_APRHistogramTypeAppIntentImplicitRejects");
      goto LABEL_243;
    case 11:
    case 23:
    case 25:
      v6 = 7200;
      v5 = 240;
      goto LABEL_6;
    case 12:
      __atxlog_handle_default();
      v53 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.25(v53, v54, v55, v56, v57, v58, v59, v60);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_APRHistogramTypeAppIntentSiriKitDonation");
      goto LABEL_243;
    case 13:
      __atxlog_handle_default();
      v61 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.26(v61, v62, v63, v64, v65, v66, v67, v68);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_APRHistogramTypeAppIntentNonSiriKitDonation");
      goto LABEL_243;
    case 14:
    case 16:
      v5 = 100;
LABEL_6:
      v4 = 1;
      goto LABEL_7;
    case 15:
      __atxlog_handle_default();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.6(v69, v70, v71, v72, v73, v74, v75, v76);

      v77 = (void *)MEMORY[0x1E0C99DA0];
      v78 = *MEMORY[0x1E0C99768];
      v79 = CFSTR("_ATXHistogramTypeIntentForAllAppsLaunch");
      goto LABEL_53;
    case 18:
      __atxlog_handle_default();
      v80 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.5(v80, v81, v82, v83, v84, v85, v86, v87);

      v77 = (void *)MEMORY[0x1E0C99DA0];
      v78 = *MEMORY[0x1E0C99768];
      v79 = CFSTR("_ATXHistogramTypeIntentForAllAppsDayOfWeek");
      goto LABEL_53;
    case 21:
      __atxlog_handle_default();
      v88 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.4(v88, v89, v90, v91, v92, v93, v94, v95);

      v77 = (void *)MEMORY[0x1E0C99DA0];
      v78 = *MEMORY[0x1E0C99768];
      v79 = CFSTR("_ATXHistogramTypeIntentForAllAppsTrendingLaunch");
      goto LABEL_53;
    case 24:
      __atxlog_handle_default();
      v96 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.3(v96, v97, v98, v99, v100, v101, v102, v103);

      v77 = (void *)MEMORY[0x1E0C99DA0];
      v78 = *MEMORY[0x1E0C99768];
      v79 = CFSTR("_ATXHistogramTypeIntentForAllAppsUnlockTime");
      goto LABEL_53;
    case 27:
      __atxlog_handle_default();
      v104 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.2(v104, v105, v106, v107, v108, v109, v110, v111);

      v77 = (void *)MEMORY[0x1E0C99DA0];
      v78 = *MEMORY[0x1E0C99768];
      v79 = CFSTR("_ATXHistogramTypeIntentForAllAppsAirplaneModeLaunch");
      goto LABEL_53;
    case 29:
      __atxlog_handle_default();
      v112 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v112, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.15(v112, v113, v114, v115, v116, v117, v118, v119);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppIntentWifiLaunch");
      goto LABEL_243;
    case 30:
      __atxlog_handle_default();
      v120 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.1(v120, v121, v122, v123, v124, v125, v126, v127);

      v77 = (void *)MEMORY[0x1E0C99DA0];
      v78 = *MEMORY[0x1E0C99768];
      v79 = CFSTR("_ATXHistogramTypeIntentForAllAppsWifiLaunch");
LABEL_53:
      objc_msgSend(v77, "raise:format:", v78, CFSTR("%@ is deprecated."), v79);
      goto LABEL_245;
    case 31:
      __atxlog_handle_default();
      v128 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v128, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.16(v128, v129, v130, v131, v132, v133, v134, v135);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppForAllIntentsWifiLaunch");
      goto LABEL_243;
    case 32:
      __atxlog_handle_default();
      v136 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v136, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.13(v136, v137, v138, v139, v140, v141, v142, v143);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeNotifications");
      goto LABEL_243;
    case 33:
      __atxlog_handle_default();
      v144 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v144, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.27(v144, v145, v146, v147, v148, v149, v150, v151);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeActionsConfirms");
      goto LABEL_243;
    case 34:
      __atxlog_handle_default();
      v152 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v152, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.28(v152, v153, v154, v155, v156, v157, v158, v159);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeActionsRejects");
      goto LABEL_243;
    case 37:
      __atxlog_handle_default();
      v160 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v160, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.17(v160, v161, v162, v163, v164, v165, v166, v167);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeCoreMotionLaunch");
      goto LABEL_243;
    case 38:
      __atxlog_handle_default();
      v168 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.18(v168, v169, v170, v171, v172, v173, v174, v175);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppIntentCoreMotionLaunch");
      goto LABEL_243;
    case 39:
      __atxlog_handle_default();
      v176 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v176, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.19(v176, v177, v178, v179, v180, v181, v182, v183);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppForAllIntentsCoreMotionLaunch");
      goto LABEL_243;
    case 40:
      __atxlog_handle_default();
      v184 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v184, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.29(v184, v185, v186, v187, v188, v189, v190, v191);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypePartOfWeek");
      goto LABEL_243;
    case 41:
      __atxlog_handle_default();
      v192 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v192, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.30(v192, v193, v194, v195, v196, v197, v198, v199);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAmbientLight");
      goto LABEL_243;
    case 42:
      __atxlog_handle_default();
      v200 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v200, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.31(v200, v201, v202, v203, v204, v205, v206, v207);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeTimeOfDayAndDayOfWeek");
      goto LABEL_243;
    case 43:
      __atxlog_handle_default();
      v208 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v208, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.32(v208, v209, v210, v211, v212, v213, v214, v215);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppCoarseTimePOWLocationLaunches");
      goto LABEL_243;
    case 44:
      __atxlog_handle_default();
      v216 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v216, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.33(v216, v217, v218, v219, v220, v221, v222, v223);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppSpecificTimeDOWLocationLaunches");
      goto LABEL_243;
    case 45:
      __atxlog_handle_default();
      v224 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v224, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.34(v224, v225, v226, v227, v228, v229, v230, v231);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppCoarseTimePOWLocationConfirms");
      goto LABEL_243;
    case 46:
      __atxlog_handle_default();
      v232 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v232, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.35(v232, v233, v234, v235, v236, v237, v238, v239);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppSpecificTimeDOWLocationConfirms");
      goto LABEL_243;
    case 47:
      __atxlog_handle_default();
      v240 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v240, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.36(v240, v241, v242, v243, v244, v245, v246, v247);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppCoarseTimePOWLocationRejects");
      goto LABEL_243;
    case 48:
      __atxlog_handle_default();
      v248 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v248, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.37(v248, v249, v250, v251, v252, v253, v254, v255);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppSpecificTimeDOWLocationRejects");
      goto LABEL_243;
    case 49:
      __atxlog_handle_default();
      v256 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.38(v256, v257, v258, v259, v260, v261, v262, v263);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppClipsAndHeroApp");
      goto LABEL_243;
    case 50:
      __atxlog_handle_default();
      v264 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v264, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.40(v264, v265, v266, v267, v268, v269, v270, v271);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppSpecificLocation");
      goto LABEL_243;
    case 51:
      __atxlog_handle_default();
      v272 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v272, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.41(v272, v273, v274, v275, v276, v277, v278, v279);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppCoarseLocation");
      goto LABEL_243;
    case 52:
      __atxlog_handle_default();
      v280 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v280, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.43(v280, v281, v282, v283, v284, v285, v286, v287);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppLaunchesTwoHourTimeInterval");
      goto LABEL_243;
    case 53:
      __atxlog_handle_default();
      v288 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v288, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.44(v288, v289, v290, v291, v292, v293, v294, v295);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppConfirmsTwoHourTimeInterval");
      goto LABEL_243;
    case 54:
      __atxlog_handle_default();
      v296 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v296, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.45(v296, v297, v298, v299, v300, v301, v302, v303);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppRejectsTwoHourTimeInterval");
      goto LABEL_243;
    case 55:
      __atxlog_handle_default();
      v304 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v304, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.46(v304, v305, v306, v307, v308, v309, v310, v311);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppConfirmsDayOfWeek");
      goto LABEL_243;
    case 56:
      __atxlog_handle_default();
      v312 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v312, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.47(v312, v313, v314, v315, v316, v317, v318, v319);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppRejectsDayOfWeek");
      goto LABEL_243;
    case 57:
      __atxlog_handle_default();
      v320 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v320, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.48(v320, v321, v322, v323, v324, v325, v326, v327);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppConfirmsCoarseGeoHash");
      goto LABEL_243;
    case 58:
      __atxlog_handle_default();
      v328 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v328, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.49(v328, v329, v330, v331, v332, v333, v334, v335);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppRejectsCoarseGeoHash");
      goto LABEL_243;
    case 59:
      __atxlog_handle_default();
      v336 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v336, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.50(v336, v337, v338, v339, v340, v341, v342, v343);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppConfirmsSpecificGeoHash");
      goto LABEL_243;
    case 60:
      __atxlog_handle_default();
      v344 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v344, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.51(v344, v345, v346, v347, v348, v349, v350, v351);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppRejectsSpecificGeoHash");
      goto LABEL_243;
    case 61:
      __atxlog_handle_default();
      v352 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v352, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.42(v352, v353, v354, v355, v356, v357, v358, v359);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppZoom7GeoHash");
      goto LABEL_243;
    case 62:
      __atxlog_handle_default();
      v360 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v360, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.53(v360, v361, v362, v363, v364, v365, v366, v367);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenWidgetInteractions");
      goto LABEL_243;
    case 63:
      __atxlog_handle_default();
      v368 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v368, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.54(v368, v369, v370, v371, v372, v373, v374, v375);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppConfirmsCoarseTimePOWLocation");
      goto LABEL_243;
    case 64:
      __atxlog_handle_default();
      v376 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v376, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.55(v376, v377, v378, v379, v380, v381, v382, v383);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppConfirmsSpecificTimeDOWLocation");
      goto LABEL_243;
    case 65:
      __atxlog_handle_default();
      v384 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v384, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.56(v384, v385, v386, v387, v388, v389, v390, v391);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppConfirmsTwoHourTimeInterval");
      goto LABEL_243;
    case 66:
      __atxlog_handle_default();
      v392 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v392, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.57(v392, v393, v394, v395, v396, v397, v398, v399);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppConfirmsDayOfWeek");
      goto LABEL_243;
    case 67:
      __atxlog_handle_default();
      v400 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v400, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.58(v400, v401, v402, v403, v404, v405, v406, v407);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppConfirmsCoarseGeohash");
      goto LABEL_243;
    case 68:
      __atxlog_handle_default();
      v408 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v408, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.59(v408, v409, v410, v411, v412, v413, v414, v415);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppConfirmsSpecificGeohash");
      goto LABEL_243;
    case 69:
      __atxlog_handle_default();
      v416 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v416, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.60(v416, v417, v418, v419, v420, v421, v422, v423);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppRejectsCoarseTimePOWLocation");
      goto LABEL_243;
    case 70:
      __atxlog_handle_default();
      v424 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v424, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.61(v424, v425, v426, v427, v428, v429, v430, v431);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppRejectsSpecificTimeDOWLocation");
      goto LABEL_243;
    case 71:
      __atxlog_handle_default();
      v432 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v432, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.62(v432, v433, v434, v435, v436, v437, v438, v439);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppRejectsTwoHourTimeInterval");
      goto LABEL_243;
    case 72:
      __atxlog_handle_default();
      v440 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v440, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.63(v440, v441, v442, v443, v444, v445, v446, v447);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppRejectsDayOfWeek");
      goto LABEL_243;
    case 73:
      __atxlog_handle_default();
      v448 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v448, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.64(v448, v449, v450, v451, v452, v453, v454, v455);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppRejectsCoarseGeohash");
      goto LABEL_243;
    case 74:
      __atxlog_handle_default();
      v456 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v456, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.65(v456, v457, v458, v459, v460, v461, v462, v463);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppRejectsSpecificGeohash");
      goto LABEL_243;
    case 75:
      __atxlog_handle_default();
      v464 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v464, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.67(v464, v465, v466, v467, v468, v469, v470, v471);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryConfirmsCoarseTimePOWLocation");
      goto LABEL_243;
    case 76:
      __atxlog_handle_default();
      v472 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v472, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.68(v472, v473, v474, v475, v476, v477, v478, v479);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryConfirmsSpecificTimeDOWLocation");
      goto LABEL_243;
    case 77:
      __atxlog_handle_default();
      v480 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v480, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.69(v480, v481, v482, v483, v484, v485, v486, v487);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryConfirmsTwoHourTimeInterval");
      goto LABEL_243;
    case 78:
      __atxlog_handle_default();
      v488 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v488, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.70(v488, v489, v490, v491, v492, v493, v494, v495);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryConfirmsDayOfWeek");
      goto LABEL_243;
    case 79:
      __atxlog_handle_default();
      v496 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v496, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.71(v496, v497, v498, v499, v500, v501, v502, v503);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryConfirmsCoarseGeohash");
      goto LABEL_243;
    case 80:
      __atxlog_handle_default();
      v504 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v504, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.72(v504, v505, v506, v507, v508, v509, v510, v511);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryConfirmsSpecificGeohash");
      goto LABEL_243;
    case 81:
      __atxlog_handle_default();
      v512 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v512, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.73(v512, v513, v514, v515, v516, v517, v518, v519);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryRejectsCoarseTimePOWLocation");
      goto LABEL_243;
    case 82:
      __atxlog_handle_default();
      v520 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v520, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.74(v520, v521, v522, v523, v524, v525, v526, v527);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryRejectsSpecificTimeDOWLocation");
      goto LABEL_243;
    case 83:
      __atxlog_handle_default();
      v528 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v528, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.75(v528, v529, v530, v531, v532, v533, v534, v535);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryRejectsTwoHourTimeInterval");
      goto LABEL_243;
    case 84:
      __atxlog_handle_default();
      v536 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v536, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.76(v536, v537, v538, v539, v540, v541, v542, v543);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryRejectsDayOfWeek");
      goto LABEL_243;
    case 85:
      __atxlog_handle_default();
      v544 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v544, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.77(v544, v545, v546, v547, v548, v549, v550, v551);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryRejectsCoarseGeohash");
      goto LABEL_243;
    case 86:
      __atxlog_handle_default();
      v552 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v552, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.78(v552, v553, v554, v555, v556, v557, v558, v559);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryRejectsSpecificGeohash");
      goto LABEL_243;
    case 87:
      __atxlog_handle_default();
      v560 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v560, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.52(v560, v561, v562, v563, v564, v565, v566, v567);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppExplicitRejectsCoarseTimePOWLocation");
      goto LABEL_243;
    case 88:
      __atxlog_handle_default();
      v568 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v568, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.66(v568, v569, v570, v571, v572, v573, v574, v575);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeHomeScreenAppExplicitRejectsCoarseTimePOWLocation");
      goto LABEL_243;
    case 89:
      __atxlog_handle_default();
      v576 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v576, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.12(v576, v577, v578, v579, v580, v581, v582, v583);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppDirectoryExplicitRejectsCoarseTimePOWLocation");
      goto LABEL_243;
    case 94:
      __atxlog_handle_default();
      v584 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v584, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.39(v584, v585, v586, v587, v588, v589, v590, v591);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeAppClipsAndHeroAppNoDecay");
      goto LABEL_243;
    case 95:
      __atxlog_handle_default();
      v592 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v592, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.11(v592, v593, v594, v595, v596, v597, v598, v599);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypePOICategory");
      goto LABEL_243;
    case 96:
      __atxlog_handle_default();
      v600 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v600, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.10(v600, v601, v602, v603, v604, v605, v606, v607);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeActivitySuggestionsFeedback");
      goto LABEL_243;
    case 97:
      __atxlog_handle_default();
      v608 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v608, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.9(v608, v609, v610, v611, v612, v613, v614, v615);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeNotificationDigestAppEngagement");
      goto LABEL_243;
    case 98:
      __atxlog_handle_default();
      v616 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v616, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.8(v616, v617, v618, v619, v620, v621, v622, v623);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeNotificationDigestAlltimeMarqueeAppearances");
      goto LABEL_243;
    case 99:
      __atxlog_handle_default();
      v624 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v624, OS_LOG_TYPE_ERROR))
        -[_ATXAppLaunchHistogram initWithType:].cold.7(v624, v625, v626, v627, v628, v629, v630, v631);

      v16 = (void *)MEMORY[0x1E0C99DA0];
      v17 = *MEMORY[0x1E0C99768];
      v18 = CFSTR("_ATXHistogramTypeMax");
LABEL_243:
      v633 = v18;
      v36 = CFSTR("%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.");
LABEL_244:
      objc_msgSend(v16, "raise:format:", v17, v36, v633);
LABEL_245:
      v7 = 0;
      break;
    default:
LABEL_7:
      v3 = -[_ATXAppLaunchHistogram initWithHistogram:bucketCount:filter:timeBase:](self, "initWithHistogram:bucketCount:filter:timeBase:", 0, v5, v4, v6);
      v7 = v3;
      break;
  }

  return v7;
}

- (unsigned)_localTimeWithDate:(id)a3 timeZone:(id)a4
{
  NSDate *v7;
  NSTimeZone *v8;
  NSDate *prevDate;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v7 = (NSDate *)a3;
  v8 = (NSTimeZone *)a4;
  pthread_mutex_lock(&self->_prevLocaltimeLock);
  prevDate = self->_prevDate;
  if (prevDate
    && (prevDate == v7 || -[NSDate isEqualToDate:](v7, "isEqualToDate:"))
    && (self->_prevTimeZone == v8 || -[NSTimeZone isEqualToTimeZone:](v8, "isEqualToTimeZone:")))
  {
    LOWORD(v10) = self->_prevLocaltime;
    pthread_mutex_unlock(&self->_prevLocaltimeLock);
  }
  else
  {
    pthread_mutex_unlock(&self->_prevLocaltimeLock);
    v16 = 0;
    v17 = 0;
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v8)
      objc_msgSend(v11, "setTimeZone:", v8);
    v13 = objc_msgSend(v12, "component:fromDate:", 512, v7);
    objc_msgSend(v12, "getHour:minute:second:nanosecond:fromDate:", &v17, &v16, &v15, 0, v7);
    v10 = (3600 * v17 + 86400 * v13 + 60 * v16 + v15 - 86400) % self->_timeBase / self->_secondsPerLocaltimeInterval;
    pthread_mutex_lock(&self->_prevLocaltimeLock);
    self->_prevLocaltime = v10;
    objc_storeStrong((id *)&self->_prevDate, a3);
    objc_storeStrong((id *)&self->_prevTimeZone, a4);
    pthread_mutex_unlock(&self->_prevLocaltimeLock);

  }
  return v10;
}

- (unsigned)_localTimeWithDate:(id)a3
{
  return -[_ATXAppLaunchHistogram _localTimeWithDate:timeZone:](self, "_localTimeWithDate:timeZone:", a3, 0);
}

- (unsigned)_eventIdforBundleId:(id)a3
{
  id v3;
  void *v4;
  unsigned __int16 v5;

  v3 = a3;
  +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "intern:", v3);

  return v5;
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5
{
  double v5;

  LODWORD(v5) = 1.0;
  -[_ATXAppLaunchHistogram addLaunchWithBundleId:date:timeZone:weight:](self, "addLaunchWithBundleId:date:timeZone:weight:", a3, a4, a5, v5);
}

- (void)_addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 arbitraryWeight:(float)a6
{
  id v11;
  id v12;
  unsigned __int16 v13;
  unsigned __int16 v14;
  _PASLock *lock;
  NSObject *v16;
  _QWORD v17[4];
  float v18;
  unsigned __int16 v19;
  unsigned __int16 v20;

  v11 = a4;
  v12 = a5;
  if (a3)
  {
    v13 = -[_ATXAppLaunchHistogram _eventIdforBundleId:](self, "_eventIdforBundleId:", a3);
    v14 = -[_ATXAppLaunchHistogram _localTimeWithDate:timeZone:](self, "_localTimeWithDate:timeZone:", v11, v12);
    lock = self->_lock;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __79___ATXAppLaunchHistogram__addLaunchWithBundleId_date_timeZone_arbitraryWeight___block_invoke;
    v17[3] = &__block_descriptor_40_e28_v16__0__ATXGuardedHistData_8l;
    v18 = a6;
    v19 = v13;
    v20 = v14;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v17);
  }
  else
  {
    __atxlog_handle_default();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);

  }
}

- (void)addLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;

  if (a6 >= 0.0 && a6 <= 1.0)
  {
    -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](self, "_addLaunchWithBundleId:date:timeZone:arbitraryWeight:", a3, a4, a5, *(double *)&a6);
  }
  else
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram addLaunchWithBundleId:date:timeZone:weight:].cold.1(v8, a6, v9, v10);

  }
}

- (void)removeLaunchWithBundleId:(id)a3 date:(id)a4 timeZone:(id)a5 weight:(float)a6
{
  double v6;

  *(float *)&v6 = -a6;
  -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:](self, "_addLaunchWithBundleId:date:timeZone:arbitraryWeight:", a3, a4, a5, v6);
}

- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4
{
  double v4;

  LODWORD(v4) = 1.0;
  -[_ATXAppLaunchHistogram addLaunchWithBundleId:elapsedTime:weight:](self, "addLaunchWithBundleId:elapsedTime:weight:", a3, a4, v4);
}

- (void)addLaunchWithBundleId:(id)a3 elapsedTime:(double)a4 weight:(float)a5
{
  id v9;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  unsigned __int16 v14;
  uint64_t v15;
  int64_t secondsPerLocaltimeInterval;
  _PASLock *lock;
  _QWORD v18[4];
  float v19;
  unsigned __int16 v20;
  __int16 v21;

  v9 = a3;
  if (v9)
  {
    if (a5 >= 0.0 && a5 <= 1.0)
    {
      v14 = -[_ATXAppLaunchHistogram _eventIdforBundleId:](self, "_eventIdforBundleId:", v9);
      v15 = (int)a4 % self->_timeBase;
      secondsPerLocaltimeInterval = self->_secondsPerLocaltimeInterval;
      lock = self->_lock;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __67___ATXAppLaunchHistogram_addLaunchWithBundleId_elapsedTime_weight___block_invoke;
      v18[3] = &__block_descriptor_40_e28_v16__0__ATXGuardedHistData_8l;
      v19 = a5;
      v20 = v14;
      v21 = v15 / secondsPerLocaltimeInterval;
      -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v18);
      goto LABEL_12;
    }
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram addLaunchWithBundleId:date:timeZone:weight:].cold.1(v11, a5, v12, v13);
  }
  else
  {
    __atxlog_handle_default();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);
  }

LABEL_12:
}

- (void)resetHistogram:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __41___ATXAppLaunchHistogram_resetHistogram___block_invoke;
  v7[3] = &unk_1E82E1718;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v7);

}

- (BOOL)removeHistoryForBundleId:(id)a3
{
  id v5;
  void *v6;
  _PASLock *lock;
  BOOL v8;
  NSObject *v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x2020000000;
    v17 = 1;
    lock = self->_lock;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __51___ATXAppLaunchHistogram_removeHistoryForBundleId___block_invoke;
    v11[3] = &unk_1E82E1740;
    v12 = v5;
    v13 = &v14;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);
    v8 = *((_BYTE *)v15 + 24) != 0;

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);

    v8 = 0;
  }

  return v8;
}

- (int)removeHistoryForBundleIds:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  int v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52___ATXAppLaunchHistogram_removeHistoryForBundleIds___block_invoke;
  v8[3] = &unk_1E82E1740;
  v6 = v4;
  v9 = v6;
  v10 = &v11;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v8);
  LODWORD(lock) = *((_DWORD *)v12 + 6);

  _Block_object_dispose(&v11, 8);
  return (int)lock;
}

- (double)ratio:(double)a3 over:(double)a4
{
  return a3 * a4 / ((*(double *)&kLaunchThreshold + a4) * (*(double *)&kLaunchThreshold + a4));
}

- (double)launchPopularityWithBundleId:(id)a3 date:(id)a4
{
  id v6;
  id v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  _PASLock *lock;
  double v11;
  NSObject *v12;
  _QWORD v14[6];
  unsigned __int16 v15;
  unsigned __int16 v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v8 = -[_ATXAppLaunchHistogram _localTimeWithDate:](self, "_localTimeWithDate:", v7);
    v9 = -[_ATXAppLaunchHistogram _eventIdforBundleId:](self, "_eventIdforBundleId:", v6);
    v17 = 0;
    v18 = (double *)&v17;
    v19 = 0x2020000000;
    v20 = 0;
    lock = self->_lock;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __60___ATXAppLaunchHistogram_launchPopularityWithBundleId_date___block_invoke;
    v14[3] = &unk_1E82E1768;
    v14[4] = self;
    v14[5] = &v17;
    v15 = v9;
    v16 = v8;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v14);
    v11 = v18[3];
    _Block_object_dispose(&v17, 8);
  }
  else
  {
    __atxlog_handle_default();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram launchPopularityWithBundleId:date:].cold.1();

    v11 = 0.0;
  }

  return v11;
}

- (double)relativeLaunchPopularityWithBundleId:(id)a3 date:(id)a4
{
  double v4;
  double result;

  LODWORD(v4) = 1.0;
  -[_ATXAppLaunchHistogram relativeLaunchPopularityWithBundleId:date:distanceScale:](self, "relativeLaunchPopularityWithBundleId:date:distanceScale:", a3, a4, v4);
  return result;
}

- (double)relativeLaunchPopularityWithBundleId:(id)a3 date:(id)a4 distanceScale:(float)a5
{
  id v8;
  id v9;
  unsigned __int16 v10;
  unsigned __int16 v11;
  _PASLock *lock;
  double v13;
  NSObject *v14;
  _QWORD v16[6];
  float v17;
  unsigned __int16 v18;
  unsigned __int16 v19;
  uint64_t v20;
  double *v21;
  uint64_t v22;
  uint64_t v23;

  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = -[_ATXAppLaunchHistogram _localTimeWithDate:](self, "_localTimeWithDate:", v9);
    v11 = -[_ATXAppLaunchHistogram _eventIdforBundleId:](self, "_eventIdforBundleId:", v8);
    v20 = 0;
    v21 = (double *)&v20;
    v22 = 0x2020000000;
    v23 = 0;
    lock = self->_lock;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __82___ATXAppLaunchHistogram_relativeLaunchPopularityWithBundleId_date_distanceScale___block_invoke;
    v16[3] = &unk_1E82E1790;
    v16[4] = self;
    v16[5] = &v20;
    v18 = v11;
    v19 = v10;
    v17 = a5;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v16);
    v13 = v21[3];
    _Block_object_dispose(&v20, 8);
  }
  else
  {
    __atxlog_handle_default();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram relativeLaunchPopularityWithBundleId:date:distanceScale:].cold.1();

    v13 = 0.0;
  }

  return v13;
}

- (double)relativeLaunchPopularityWithBundleId:(id)a3 elapsedTime:(double)a4 distanceScale:(float)a5
{
  id v8;
  int64_t v9;
  unsigned __int16 v10;
  _PASLock *lock;
  double v12;
  NSObject *v13;
  _QWORD v15[6];
  float v16;
  unsigned __int16 v17;
  __int16 v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v8 = a3;
  if (v8)
  {
    v9 = (int)a4 % self->_timeBase / self->_secondsPerLocaltimeInterval;
    v10 = -[_ATXAppLaunchHistogram _eventIdforBundleId:](self, "_eventIdforBundleId:", v8);
    v19 = 0;
    v20 = (double *)&v19;
    v21 = 0x2020000000;
    v22 = 0;
    lock = self->_lock;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __89___ATXAppLaunchHistogram_relativeLaunchPopularityWithBundleId_elapsedTime_distanceScale___block_invoke;
    v15[3] = &unk_1E82E1790;
    v15[4] = self;
    v15[5] = &v19;
    v17 = v10;
    v18 = v9;
    v16 = a5;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);
    v12 = v20[3];
    _Block_object_dispose(&v19, 8);
  }
  else
  {
    __atxlog_handle_default();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram relativeLaunchPopularityWithBundleId:elapsedTime:distanceScale:].cold.1();

    v12 = 0.0;
  }

  return v12;
}

- (double)totalTimeOfDayLaunchesForDate:(id)a3 distanceScale:(float)a4
{
  id v6;
  unsigned __int16 v7;
  _PASLock *lock;
  double v9;
  _QWORD v11[5];
  float v12;
  unsigned __int16 v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;

  v6 = a3;
  v7 = -[_ATXAppLaunchHistogram _localTimeWithDate:](self, "_localTimeWithDate:", v6);
  v14 = 0;
  v15 = (double *)&v14;
  v16 = 0x2020000000;
  v17 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70___ATXAppLaunchHistogram_totalTimeOfDayLaunchesForDate_distanceScale___block_invoke;
  v11[3] = &unk_1E82E17B8;
  v11[4] = &v14;
  v13 = v7;
  v12 = a4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);
  v9 = v15[3];
  _Block_object_dispose(&v14, 8);

  return v9;
}

- (double)totalTimeOfDayLaunchesForDate:(id)a3
{
  double v3;
  double result;

  LODWORD(v3) = 1.0;
  -[_ATXAppLaunchHistogram totalTimeOfDayLaunchesForDate:distanceScale:](self, "totalTimeOfDayLaunchesForDate:distanceScale:", a3, v3);
  return result;
}

- (double)totalTimeOfDayLaunchesForElapsedTime:(double)a3 distanceScale:(float)a4
{
  uint64_t v4;
  int64_t secondsPerLocaltimeInterval;
  _PASLock *lock;
  double v7;
  _QWORD v9[5];
  float v10;
  __int16 v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v4 = (int)a3 % self->_timeBase;
  secondsPerLocaltimeInterval = self->_secondsPerLocaltimeInterval;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __77___ATXAppLaunchHistogram_totalTimeOfDayLaunchesForElapsedTime_distanceScale___block_invoke;
  v9[3] = &unk_1E82E17B8;
  v9[4] = &v12;
  v11 = v4 / secondsPerLocaltimeInterval;
  v10 = a4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (double)totalTimeOfDayLaunchesForElapsedTime:(double)a3
{
  double v3;
  double result;

  LODWORD(v3) = 1.0;
  -[_ATXAppLaunchHistogram totalTimeOfDayLaunchesForElapsedTime:distanceScale:](self, "totalTimeOfDayLaunchesForElapsedTime:distanceScale:", a3, v3);
  return result;
}

- (double)overallLaunchPopularityForBundleId:(id)a3
{
  id v4;
  unsigned __int16 v5;
  _PASLock *lock;
  double v7;
  NSObject *v8;
  _QWORD v10[6];
  unsigned __int16 v11;
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  if (v4)
  {
    v5 = -[_ATXAppLaunchHistogram _eventIdforBundleId:](self, "_eventIdforBundleId:", v4);
    v12 = 0;
    v13 = (double *)&v12;
    v14 = 0x2020000000;
    v15 = 0;
    lock = self->_lock;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61___ATXAppLaunchHistogram_overallLaunchPopularityForBundleId___block_invoke;
    v10[3] = &unk_1E82E17E0;
    v10[4] = self;
    v10[5] = &v12;
    v11 = v5;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v10);
    v7 = v13[3];
    _Block_object_dispose(&v12, 8);
  }
  else
  {
    __atxlog_handle_default();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram overallLaunchPopularityForBundleId:].cold.1();

    v7 = 0.0;
  }

  return v7;
}

- (double)totalLaunches
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __39___ATXAppLaunchHistogram_totalLaunches__block_invoke;
  v5[3] = &unk_1E82E1808;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (double)averageLaunchesPerBundleId:(id)a3
{
  id v4;
  double v5;
  double v6;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    -[_ATXAppLaunchHistogram totalLaunchesForBundleIds:](self, "totalLaunchesForBundleIds:", v4);
    v6 = v5 / (double)(unint64_t)objc_msgSend(v4, "count");
  }
  else
  {
    v6 = 0.0;
  }

  return v6;
}

- (double)totalLaunchesForBundleIds:(id)a3
{
  id v4;
  _PASLock *lock;
  id v6;
  double v7;
  _QWORD v9[4];
  id v10;
  _ATXAppLaunchHistogram *v11;
  uint64_t *v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x2020000000;
  v16 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __52___ATXAppLaunchHistogram_totalLaunchesForBundleIds___block_invoke;
  v9[3] = &unk_1E82E1830;
  v6 = v4;
  v10 = v6;
  v11 = self;
  v12 = &v13;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = v14[3];

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (double)totalLaunchesForBundleIds:(id)a3 forDate:(id)a4 distanceScale:(float)a5
{
  id v8;
  id v9;
  unsigned __int16 v10;
  _PASLock *lock;
  id v12;
  double v13;
  _QWORD v15[4];
  id v16;
  _ATXAppLaunchHistogram *v17;
  uint64_t *v18;
  float v19;
  unsigned __int16 v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;

  v8 = a3;
  v9 = a4;
  v10 = -[_ATXAppLaunchHistogram _localTimeWithDate:](self, "_localTimeWithDate:", v9);
  v21 = 0;
  v22 = (double *)&v21;
  v23 = 0x2020000000;
  v24 = 0;
  lock = self->_lock;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74___ATXAppLaunchHistogram_totalLaunchesForBundleIds_forDate_distanceScale___block_invoke;
  v15[3] = &unk_1E82E1858;
  v12 = v8;
  v16 = v12;
  v17 = self;
  v18 = &v21;
  v20 = v10;
  v19 = a5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v15);
  v13 = v22[3];

  _Block_object_dispose(&v21, 8);
  return v13;
}

- (double)unsmoothedLaunchesForBundleIds:(id)a3 forLocalTime:(unsigned __int16)a4
{
  id v6;
  _PASLock *lock;
  id v8;
  double v9;
  _QWORD v11[4];
  id v12;
  _ATXAppLaunchHistogram *v13;
  uint64_t *v14;
  unsigned __int16 v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v6 = a3;
  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  lock = self->_lock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __70___ATXAppLaunchHistogram_unsmoothedLaunchesForBundleIds_forLocalTime___block_invoke;
  v11[3] = &unk_1E82E1880;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = a4;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);
  v9 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v9;
}

- (BOOL)bundleHasBeenLaunched:(id)a3
{
  id v5;
  unsigned __int16 v6;
  _PASLock *lock;
  BOOL v8;
  NSObject *v9;
  _QWORD v11[5];
  unsigned __int16 v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;

  v5 = a3;
  if (v5)
  {
    v6 = -[_ATXAppLaunchHistogram _eventIdforBundleId:](self, "_eventIdforBundleId:", v5);
    v13 = 0;
    v14 = (double *)&v13;
    v15 = 0x2020000000;
    v16 = 0;
    lock = self->_lock;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __48___ATXAppLaunchHistogram_bundleHasBeenLaunched___block_invoke;
    v11[3] = &unk_1E82E18A8;
    v11[4] = &v13;
    v12 = v6;
    -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v11);
    v8 = v14[3] > 0.0;
    _Block_object_dispose(&v13, 8);
  }
  else
  {
    __atxlog_handle_default();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[_ATXAppLaunchHistogram _addLaunchWithBundleId:date:timeZone:arbitraryWeight:].cold.1(a2);

    v8 = 0;
  }

  return v8;
}

- (void)decayByFactor:(double)a3
{
  _PASLock *lock;
  _QWORD v4[5];

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __40___ATXAppLaunchHistogram_decayByFactor___block_invoke;
  v4[3] = &__block_descriptor_40_e28_v16__0__ATXGuardedHistData_8l;
  *(double *)&v4[4] = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v4);
}

- (void)decayWithHalfLifeInDays:(double)a3
{
  _PASLock *lock;
  _QWORD v4[5];

  lock = self->_lock;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50___ATXAppLaunchHistogram_decayWithHalfLifeInDays___block_invoke;
  v4[3] = &__block_descriptor_40_e28_v16__0__ATXGuardedHistData_8l;
  *(double *)&v4[4] = a3;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v4);
}

- (void)resetData
{
  -[_PASLock runWithLockAcquired:](self->_lock, "runWithLockAcquired:", &__block_literal_global_86);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (_ATXAppLaunchHistogram)initWithCoder:(id)a3
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  _ATXAppLaunchHistogram *v11;
  ATXHistogramData *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned __int16 v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v27;
  void *v28;

  v4 = 86400;
  v5 = a3;
  if (objc_msgSend(v5, "containsValueForKey:", CFSTR("timeBase")))
  {
    v6 = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("timeBase"));
    v7 = v6;
    if ((int)v6 <= 0)
    {
      __atxlog_handle_default();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        -[_ATXAppLaunchHistogram initWithCoder:].cold.6(v7, v8);

    }
    else
    {
      v4 = v6;
    }
  }
  objc_msgSend(v5, "error");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogram"));
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v12 = -[ATXHistogramData initWithTimeHistogram:]([ATXHistogramData alloc], "initWithTimeHistogram:", v10);
      v13 = (void *)MEMORY[0x1CAA48B6C]();
      v14 = objc_alloc(MEMORY[0x1E0C99E60]);
      v15 = objc_opt_class();
      v16 = objc_opt_class();
      v17 = (void *)objc_msgSend(v14, "initWithObjects:", v15, v16, objc_opt_class(), 0);
      objc_autoreleasePoolPop(v13);
      objc_msgSend(v5, "decodeObjectOfClasses:forKey:", v17, CFSTR("bundleIdToEventId"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        +[ATXHistogramBundleIdTable sharedInstance](ATXHistogramBundleIdTable, "sharedInstance");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "permutationFrom:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXHistogramData applyPermutationToA:](v12, "applyPermutationToA:", v20);

        self = -[_ATXAppLaunchHistogram initWithHistogram:bucketCount:filter:timeBase:](self, "initWithHistogram:bucketCount:filter:timeBase:", v12, -[NSObject pointsPerTimeInterval](v10, "pointsPerTimeInterval"), -[NSObject applyFilter](v10, "applyFilter"), v4);
        v11 = self;
      }
      else
      {
        __atxlog_handle_default();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
          -[_ATXAppLaunchHistogram initWithCoder:].cold.4(v5);

        v11 = 0;
      }

      goto LABEL_26;
    }
    objc_msgSend(v5, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("histogramData"));
    v12 = (ATXHistogramData *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "error");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21 || !v12)
    {
      __atxlog_handle_default();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        -[_ATXAppLaunchHistogram initWithCoder:].cold.1(v5);
    }
    else
    {
      v22 = objc_msgSend(v5, "decodeInt32ForKey:", CFSTR("bucketCount"));
      objc_msgSend(v5, "error");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
      {
        __atxlog_handle_default();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          -[_ATXAppLaunchHistogram initWithCoder:].cold.3(v5);
      }
      else
      {
        v27 = objc_msgSend(v5, "decodeBoolForKey:", CFSTR("filter"));
        objc_msgSend(v5, "error");
        v28 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v28)
        {
          self = -[_ATXAppLaunchHistogram initWithHistogram:bucketCount:filter:timeBase:](self, "initWithHistogram:bucketCount:filter:timeBase:", v12, v22, v27, v4);
          v11 = self;
          goto LABEL_26;
        }
        __atxlog_handle_default();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
          -[_ATXAppLaunchHistogram initWithCoder:].cold.2(v5);
      }
    }

    v11 = 0;
LABEL_26:

    goto LABEL_27;
  }
  __atxlog_handle_default();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    -[_ATXAppLaunchHistogram initWithCoder:].cold.5(v5);
  v11 = 0;
LABEL_27:

  return v11;
}

- (NSString)description
{
  _PASLock *lock;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__39;
  v10 = __Block_byref_object_dispose__39;
  v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37___ATXAppLaunchHistogram_description__block_invoke;
  v5[3] = &unk_1E82E1808;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSString *)v3;
}

- (double)entropyForBundleId:(id)a3
{
  id v4;
  unsigned __int16 v5;
  _PASLock *lock;
  double v7;
  _QWORD v9[5];
  unsigned __int16 v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = -[_ATXAppLaunchHistogram _eventIdforBundleId:](self, "_eventIdforBundleId:", v4);
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __45___ATXAppLaunchHistogram_entropyForBundleId___block_invoke;
  v9[3] = &unk_1E82E18A8;
  v9[4] = &v11;
  v10 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (double)entropyForDate:(id)a3
{
  id v4;
  unsigned __int16 v5;
  _PASLock *lock;
  double v7;
  _QWORD v9[5];
  unsigned __int16 v10;
  uint64_t v11;
  double *v12;
  uint64_t v13;
  uint64_t v14;

  v4 = a3;
  v5 = -[_ATXAppLaunchHistogram _localTimeWithDate:](self, "_localTimeWithDate:", v4);
  v11 = 0;
  v12 = (double *)&v11;
  v13 = 0x2020000000;
  v14 = 0;
  lock = self->_lock;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __41___ATXAppLaunchHistogram_entropyForDate___block_invoke;
  v9[3] = &unk_1E82E18A8;
  v9[4] = &v11;
  v10 = v5;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v9);
  v7 = v12[3];
  _Block_object_dispose(&v11, 8);

  return v7;
}

- (double)entropy
{
  _PASLock *lock;
  double v3;
  _QWORD v5[5];
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __33___ATXAppLaunchHistogram_entropy__block_invoke;
  v5[3] = &unk_1E82E1808;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (unsigned)bucketCount
{
  _PASLock *lock;
  unsigned __int16 v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  __int16 v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __37___ATXAppLaunchHistogram_bucketCount__block_invoke;
  v5[3] = &unk_1E82E1808;
  v5[4] = &v6;
  -[_PASLock runWithLockAcquired:](lock, "runWithLockAcquired:", v5);
  v3 = *((_WORD *)v7 + 12);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prevTimeZone, 0);
  objc_storeStrong((id *)&self->_prevDate, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_uninstallNotificationListener, 0);
}

- (void)initWithType:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.5(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.6(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is deprecated.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.7(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.9(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.10(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.11(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.12(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.13(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.15(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.16(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.17(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.19(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.20(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.21(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.22(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.23(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:.cold.24()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_7();
  _os_log_error_impl(&dword_1C9A3B000, v0, OS_LOG_TYPE_ERROR, "_APRHistogramTypeAppIntentDonation is deprecated.", v1, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)initWithType:(uint64_t)a3 .cold.25(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.26(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.27(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.28(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.29(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.30(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.31(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.32(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.33(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.35(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.36(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.37(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.39(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.40(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.41(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.42(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.43(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.45(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.46(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.47(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.48(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.49(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.50(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.51(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.52(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.53(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.55(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.56(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.57(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.58(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.59(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.61(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.62(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.63(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.65(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.66(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.67(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.68(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.69(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.71(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.72(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.73(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.74(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.75(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.76(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.77(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithType:(uint64_t)a3 .cold.78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a1, a3, "%@ is not a valid type for _ATXAppLaunchHistogram.  Use _ATXCategoricalAppLaunchHistogram.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_addLaunchWithBundleId:(const char *)a1 date:timeZone:arbitraryWeight:.cold.1(const char *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_9_2(a1);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6_0(&dword_1C9A3B000, v1, v2, "Bundle id can not be nil in %s", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_1();
}

- (void)addLaunchWithBundleId:(NSObject *)a1 date:(float)a2 timeZone:(uint64_t)a3 weight:(uint64_t)a4 .cold.1(NSObject *a1, float a2, uint64_t a3, uint64_t a4)
{
  int v4;
  double v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 134217984;
  v5 = a2;
  OUTLINED_FUNCTION_1_4(&dword_1C9A3B000, a1, a4, "Attempt to update histogram with unexpected weight %f", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)launchPopularityWithBundleId:date:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "launchPopularityWithBundleId:date: called with nil bundle identifier. Returning 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)relativeLaunchPopularityWithBundleId:date:distanceScale:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "relativeLaunchPopularityWithBundleId:date:distanceScale: called with nil bundle identifier. Returning 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)relativeLaunchPopularityWithBundleId:elapsedTime:distanceScale:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "relativeLaunchPopularityWithBundleId:elapsedTime:distanceScale: called with nil bundle identifier. Returning 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)overallLaunchPopularityForBundleId:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_2_3(&dword_1C9A3B000, v0, v1, "overallLaunchPopularityForBundleId: called with nil bundle identifier. Returning 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

- (void)initWithCoder:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "Could not decode histogram from NSCoder, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "Could not decode filter from NSCoder, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(void *)a1 .cold.3(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "Could not decode bucketCount from NSCoder, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(void *)a1 .cold.4(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "Could not decode bundleIdToEventId from NSCoder, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(void *)a1 .cold.5(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "error");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1C9A3B000, v2, v3, "Could not decode timeBase from NSCoder, error: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1();
}

- (void)initWithCoder:(int)a1 .cold.6(int a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109376;
  v2[1] = a1;
  v3 = 1024;
  v4 = 86400;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "timeBase is an invalid value: %d. Falling back to the default histogram time base of %d.", (uint8_t *)v2, 0xEu);
  OUTLINED_FUNCTION_1_0();
}

@end
