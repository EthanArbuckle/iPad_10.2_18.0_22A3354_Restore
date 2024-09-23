@implementation LBFBitacoraStateInfo

- (LBFBitacoraStateInfo)initWithBitcoraState:(id)a3 bucketStartTime:(id)a4 bucketEndTime:(id)a5 observedTrialStatus:(id)a6 bitacoraStateTransitions:(id)a7 bitacoraEvents:(id)a8
{
  id v15;
  id v16;
  id v17;
  id v18;
  LBFBitacoraStateInfo *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSString *stateId;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSUUID *contextId;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  NSNumber *isActivated;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSNumber *isAllocated;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSObject *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v76;
  id v77;
  uint8_t buf[16];
  objc_super v79;

  v15 = a3;
  v77 = a4;
  v76 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v79.receiver = self;
  v79.super_class = (Class)LBFBitacoraStateInfo;
  v19 = -[LBFBitacoraStateInfo init](&v79, sel_init);
  if (v19)
  {
    LBFLoggingUtilsInit();
    objc_storeStrong((id *)&v19->_bitacoraStateTransitions, a7);
    objc_storeStrong((id *)&v19->_bitacoraEvents, a8);
    objc_msgSend_UUID(MEMORY[0x24BDD1880], v20, v21, v22, v23, v76, v77);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_UUIDString(v24, v25, v26, v27, v28);
    v29 = objc_claimAutoreleasedReturnValue();
    stateId = v19->_stateId;
    v19->_stateId = (NSString *)v29;

    objc_storeStrong((id *)&v19->_trialIdentifiers, a3);
    objc_msgSend_getContextId(LBFContextId, v31, v32, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();
    contextId = v19->_contextId;
    v19->_contextId = (NSUUID *)v35;

    objc_msgSend_isActivated(v16, v37, v38, v39, v40);
    v41 = objc_claimAutoreleasedReturnValue();
    isActivated = v19->_isActivated;
    v19->_isActivated = (NSNumber *)v41;

    objc_msgSend_isAllocated(v16, v43, v44, v45, v46);
    v47 = objc_claimAutoreleasedReturnValue();
    isAllocated = v19->_isAllocated;
    v19->_isAllocated = (NSNumber *)v47;

    v19->_isActivated_implicit = objc_msgSend_isActivated_implicit(v16, v49, v50, v51, v52);
    v19->_isAllocated_implicit = objc_msgSend_isAllocated_implicit(v16, v53, v54, v55, v56);
    objc_storeStrong((id *)&v19->_bucketStartTime, a4);
    objc_storeStrong((id *)&v19->_bucketEndTime, a5);
    if (objc_msgSend_count(v17, v57, v58, v59, v60))
    {
      objc_msgSend_lastObject(v17, v61, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      v19->_latestState = objc_msgSend_state(v65, v66, v67, v68, v69);

      if (v19->_latestState == 8)
      {
        v70 = LBFLogContextBitacoraStateInfo;
        if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2402DE000, v70, OS_LOG_TYPE_INFO, "LBFBitacoraState_Unexpected state", buf, 2u);
        }
      }
    }
    else
    {
      v19->_latestState = 0;
    }
    if (v15)
      objc_msgSend_IsEmptyTrialIdentifiers_(LBFUtils, v61, (uint64_t)v15, v63, v64);
    objc_msgSend_iterateEvents(v19, v61, v62, v63, v64);
    objc_msgSend_iterateTransitions(v19, v71, v72, v73, v74);
  }

  return v19;
}

- (LBFBitacoraStateInfo)initWithBitcoraStateMLHost:(id)a3 bucketStartTime:(id)a4 bucketEndTime:(id)a5 observedTrialStatus:(id)a6 bitacoraStateTransitions:(id)a7 bitacoraEvents:(id)a8
{
  uint64_t *started;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  LBFBitacoraStateInfo *v12;
  uint64_t v13;
  NSString *stateId;

  started = (uint64_t *)objc_msgSend_initWithBitcoraState_bucketStartTime_bucketEndTime_observedTrialStatus_bitacoraStateTransitions_bitacoraEvents_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, a6, a7, a8);
  v12 = (LBFBitacoraStateInfo *)started;
  if (started)
  {
    objc_msgSend_addMLHostMarkerToString_(started, v9, started[2], v10, v11);
    v13 = objc_claimAutoreleasedReturnValue();
    stateId = v12->_stateId;
    v12->_stateId = (NSString *)v13;

  }
  return v12;
}

- (void)iterateEvents
{
  NSArray *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  int v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  NSNumber *v44;
  NSNumber *count_TaskFetched_Succeeded;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSDate *v50;
  NSDate *timestamp_TaskFetched_Succeeded;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  int v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  int v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  NSNumber *v72;
  NSNumber *count_TaskCompleted_Succeeded;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  NSDate *v78;
  int v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  NSNumber *v83;
  NSNumber *count_TaskFetched_Failed;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  NSDate *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  int v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  NSNumber *v110;
  NSNumber *count_TaskScheduled_Succeeded;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  NSDate *v116;
  int v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  NSNumber *v121;
  NSNumber *count_TaskCompleted_Failed;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  NSDate *v127;
  void *v128;
  int v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  NSNumber *v133;
  NSNumber *count_TaskScheduled_Failed;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  NSDate *v139;
  id v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  int v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  int v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  NSNumber *v180;
  NSNumber *count_PerformTask_Succeeded;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  NSDate *v186;
  NSDate *timestamp_PerformTask_Succeeded;
  int v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  NSNumber *v192;
  NSNumber *count_PerformTask_Failed;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  NSDate *v198;
  id v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  int v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  int v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  int v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  NSNumber *v228;
  NSNumber *count_Activated_Succeeded;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  NSDate *v234;
  NSDate *timestamp_Allocated_Succeeded;
  int v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  int v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  NSNumber *v246;
  NSNumber *count_Deactivated_Succeeded;
  const char *v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  NSDate *v252;
  int v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  int v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  NSNumber *v263;
  NSNumber *count_Allocated_Succeeded;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  NSDate *v269;
  void *v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  void *v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  int v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  int v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  NSNumber *v291;
  NSNumber *count_Stop_Succeeded;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  NSDate *v297;
  int v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  NSNumber *v302;
  NSNumber *count_Deactivated_Failed;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  NSDate *v308;
  int v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  NSNumber *v313;
  NSNumber *count_Activated_Failed;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  NSDate *v319;
  int v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  NSNumber *v324;
  NSNumber *count_Allocated_Failed;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  NSDate *v330;
  const char *v331;
  id v332;
  const char *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  void *v337;
  const char *v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  int v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  int v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  int v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  NSNumber *v371;
  NSNumber *count_DprivacydDonationReceived_Succeeded;
  const char *v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  NSDate *v377;
  NSDate *timestamp_DprivacydDonationReceived_Succeeded;
  void *v379;
  void *v380;
  const char *v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  int v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  void *v390;
  int v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  NSNumber *v395;
  NSNumber *count_DprivacydRandomization_Succeeded;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  NSDate *v401;
  void *v402;
  const char *v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  int v407;
  const char *v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  void *v412;
  int v413;
  const char *v414;
  uint64_t v415;
  uint64_t v416;
  NSNumber *v417;
  NSNumber *count_DprivacydBudgetCheck_Succeeded;
  const char *v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  NSDate *v423;
  void *v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  int v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  void *v434;
  int v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  NSNumber *v439;
  NSNumber *count_DprivacydPayloadCreation_Succeeded;
  const char *v441;
  uint64_t v442;
  uint64_t v443;
  uint64_t v444;
  NSDate *v445;
  void *v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  int v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  void *v456;
  int v457;
  const char *v458;
  uint64_t v459;
  uint64_t v460;
  NSNumber *v461;
  NSNumber *count_DprivacydUpload_Succeeded;
  const char *v463;
  uint64_t v464;
  uint64_t v465;
  uint64_t v466;
  NSDate *v467;
  int v468;
  const char *v469;
  uint64_t v470;
  uint64_t v471;
  NSNumber *v472;
  NSNumber *count_DprivacydDonationReceived_Failed;
  const char *v474;
  uint64_t v475;
  uint64_t v476;
  uint64_t v477;
  NSDate *v478;
  int v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  NSNumber *v483;
  NSNumber *count_DprivacydRandomization_Failed;
  const char *v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  NSDate *v489;
  int v490;
  const char *v491;
  uint64_t v492;
  uint64_t v493;
  NSNumber *v494;
  NSNumber *count_DprivacydBudgetCheck_Failed;
  const char *v496;
  uint64_t v497;
  uint64_t v498;
  uint64_t v499;
  NSDate *v500;
  int v501;
  const char *v502;
  uint64_t v503;
  uint64_t v504;
  NSNumber *v505;
  NSNumber *count_DprivacydPayloadCreation_Failed;
  const char *v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  NSDate *v511;
  int v512;
  const char *v513;
  uint64_t v514;
  uint64_t v515;
  NSNumber *v516;
  NSNumber *count_DprivacydUpload_Failed;
  const char *v518;
  uint64_t v519;
  uint64_t v520;
  uint64_t v521;
  NSDate *v522;
  int v523;
  const char *v524;
  uint64_t v525;
  uint64_t v526;
  NSNumber *v527;
  NSNumber *count_Stop_Failed;
  const char *v529;
  uint64_t v530;
  uint64_t v531;
  uint64_t v532;
  NSDate *v533;
  uint64_t v534;
  _BYTE *v535;
  char v536;
  _BYTE v537[15];
  char v538;
  _BYTE v539[15];
  char v540;
  _BYTE v541[7];
  char v542;
  _BYTE v543[15];
  __int128 v544;
  __int128 v545;
  __int128 v546;
  __int128 v547;
  _BYTE v548[16];
  _BYTE v549[16];
  _BYTE v550[128];
  uint64_t v551;

  v551 = *MEMORY[0x24BDAC8D0];
  v544 = 0u;
  v545 = 0u;
  v546 = 0u;
  v547 = 0u;
  v3 = self->_bitacoraEvents;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v544, (uint64_t)v550, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v545;
    v535 = v541;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v545 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v544 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v10 = v9;
          objc_msgSend_timestamp(v10, v11, v12, v13, v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend_compare_(v15, v16, (uint64_t)self->_bucketStartTime, v17, v18);

          if (v19 == -1)
          {
            if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
              sub_240314738(&v542, v543);
            goto LABEL_82;
          }
          objc_msgSend_taskFetched(v10, v20, v21, v22, v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          if (v24)
          {
            objc_msgSend_taskFetched(v10, v25, v26, v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = objc_msgSend_succeeded(v29, v30, v31, v32, v33);

            v39 = (void *)MEMORY[0x24BDD16E0];
            if (v34)
            {
              v40 = objc_msgSend_intValue(self->_count_TaskFetched_Succeeded, v35, v36, v37, v38);
              objc_msgSend_numberWithInt_(v39, v41, (v40 + 1), v42, v43);
              v44 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskFetched_Succeeded = self->_count_TaskFetched_Succeeded;
              self->_count_TaskFetched_Succeeded = v44;

              objc_msgSend_timestamp(v10, v46, v47, v48, v49);
              v50 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskFetched_Succeeded;
              self->_timestamp_TaskFetched_Succeeded = v50;
            }
            else
            {
              v79 = objc_msgSend_intValue(self->_count_TaskFetched_Failed, v35, v36, v37, v38);
              objc_msgSend_numberWithInt_(v39, v80, (v79 + 1), v81, v82);
              v83 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskFetched_Failed = self->_count_TaskFetched_Failed;
              self->_count_TaskFetched_Failed = v83;

              objc_msgSend_timestamp(v10, v85, v86, v87, v88);
              v89 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskFetched_Failed;
              self->_timestamp_TaskFetched_Failed = v89;
            }
            goto LABEL_25;
          }
          objc_msgSend_taskCompleted(v10, v25, v26, v27, v28);
          v52 = (void *)objc_claimAutoreleasedReturnValue();

          if (v52)
          {
            objc_msgSend_taskCompleted(v10, v53, v54, v55, v56);
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            v62 = objc_msgSend_succeeded(v57, v58, v59, v60, v61);

            v67 = (void *)MEMORY[0x24BDD16E0];
            if (v62)
            {
              v68 = objc_msgSend_intValue(self->_count_TaskCompleted_Succeeded, v63, v64, v65, v66);
              objc_msgSend_numberWithInt_(v67, v69, (v68 + 1), v70, v71);
              v72 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskCompleted_Succeeded = self->_count_TaskCompleted_Succeeded;
              self->_count_TaskCompleted_Succeeded = v72;

              objc_msgSend_timestamp(v10, v74, v75, v76, v77);
              v78 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskCompleted_Succeeded;
              self->_timestamp_TaskCompleted_Succeeded = v78;
            }
            else
            {
              v117 = objc_msgSend_intValue(self->_count_TaskCompleted_Failed, v63, v64, v65, v66);
              objc_msgSend_numberWithInt_(v67, v118, (v117 + 1), v119, v120);
              v121 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskCompleted_Failed = self->_count_TaskCompleted_Failed;
              self->_count_TaskCompleted_Failed = v121;

              objc_msgSend_timestamp(v10, v123, v124, v125, v126);
              v127 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskCompleted_Failed;
              self->_timestamp_TaskCompleted_Failed = v127;
            }
            goto LABEL_25;
          }
          objc_msgSend_taskScheduled(v10, v53, v54, v55, v56);
          v90 = (void *)objc_claimAutoreleasedReturnValue();

          if (v90)
          {
            objc_msgSend_taskScheduled(v10, v91, v92, v93, v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_msgSend_succeeded(v95, v96, v97, v98, v99);

            v105 = (void *)MEMORY[0x24BDD16E0];
            if (v100)
            {
              v106 = objc_msgSend_intValue(self->_count_TaskScheduled_Succeeded, v101, v102, v103, v104);
              objc_msgSend_numberWithInt_(v105, v107, (v106 + 1), v108, v109);
              v110 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskScheduled_Succeeded = self->_count_TaskScheduled_Succeeded;
              self->_count_TaskScheduled_Succeeded = v110;

              objc_msgSend_timestamp(v10, v112, v113, v114, v115);
              v116 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskScheduled_Succeeded;
              self->_timestamp_TaskScheduled_Succeeded = v116;
            }
            else
            {
              v129 = objc_msgSend_intValue(self->_count_TaskScheduled_Failed, v101, v102, v103, v104);
              objc_msgSend_numberWithInt_(v105, v130, (v129 + 1), v131, v132);
              v133 = (NSNumber *)objc_claimAutoreleasedReturnValue();
              count_TaskScheduled_Failed = self->_count_TaskScheduled_Failed;
              self->_count_TaskScheduled_Failed = v133;

              objc_msgSend_timestamp(v10, v135, v136, v137, v138);
              v139 = (NSDate *)objc_claimAutoreleasedReturnValue();
              timestamp_TaskFetched_Succeeded = self->_timestamp_TaskScheduled_Failed;
              self->_timestamp_TaskScheduled_Failed = v139;
            }
LABEL_25:

          }
          else
          {
            objc_msgSend_activityScheduleStatus(v10, v91, v92, v93, v94);
            v128 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v128 && os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
              sub_240314860(&v540, v535);
          }

        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_40;
        v140 = v9;
        objc_msgSend_timestamp(v140, v141, v142, v143, v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        v149 = objc_msgSend_compare_(v145, v146, (uint64_t)self->_bucketStartTime, v147, v148);

        if (v149 == -1)
        {
          if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
            sub_240314760(&v538, v539);
          goto LABEL_82;
        }
        objc_msgSend_performTaskStatus(v140, v150, v151, v152, v153);
        v154 = (void *)objc_claimAutoreleasedReturnValue();

        if (v154)
        {
          objc_msgSend_performTaskStatus(v140, v155, v156, v157, v158);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          goto LABEL_35;
        }
        objc_msgSend_performTrialTaskStatus(v140, v155, v156, v157, v158);
        v164 = (void *)objc_claimAutoreleasedReturnValue();

        if (v164)
        {
          objc_msgSend_performTrialTaskStatus(v140, v165, v166, v167, v168);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_35:
          v169 = v159;
          v170 = objc_msgSend_succeeded(v159, v160, v161, v162, v163, v535);

          v175 = (void *)MEMORY[0x24BDD16E0];
          if (v170)
          {
            v176 = objc_msgSend_intValue(self->_count_PerformTask_Succeeded, v171, v172, v173, v174);
            objc_msgSend_numberWithInt_(v175, v177, (v176 + 1), v178, v179);
            v180 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            count_PerformTask_Succeeded = self->_count_PerformTask_Succeeded;
            self->_count_PerformTask_Succeeded = v180;

            objc_msgSend_timestamp(v140, v182, v183, v184, v185);
            v186 = (NSDate *)objc_claimAutoreleasedReturnValue();
            timestamp_PerformTask_Succeeded = self->_timestamp_PerformTask_Succeeded;
            self->_timestamp_PerformTask_Succeeded = v186;
          }
          else
          {
            v188 = objc_msgSend_intValue(self->_count_PerformTask_Failed, v171, v172, v173, v174);
            objc_msgSend_numberWithInt_(v175, v189, (v188 + 1), v190, v191);
            v192 = (NSNumber *)objc_claimAutoreleasedReturnValue();
            count_PerformTask_Failed = self->_count_PerformTask_Failed;
            self->_count_PerformTask_Failed = v192;

            objc_msgSend_timestamp(v140, v194, v195, v196, v197);
            v198 = (NSDate *)objc_claimAutoreleasedReturnValue();
            timestamp_PerformTask_Succeeded = self->_timestamp_PerformTask_Failed;
            self->_timestamp_PerformTask_Failed = v198;
          }
          goto LABEL_38;
        }
        objc_msgSend_stop(v140, v165, v166, v167, v168);
        v271 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v271)
        {
          if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
            sub_240314838(&v536, v537);
          goto LABEL_39;
        }
        objc_msgSend_stop(v140, v272, v273, v274, v275);
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        v281 = objc_msgSend_succeeded(v276, v277, v278, v279, v280);

        v286 = (void *)MEMORY[0x24BDD16E0];
        if (v281)
        {
          v287 = objc_msgSend_intValue(self->_count_Stop_Succeeded, v282, v283, v284, v285);
          objc_msgSend_numberWithInt_(v286, v288, (v287 + 1), v289, v290);
          v291 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          count_Stop_Succeeded = self->_count_Stop_Succeeded;
          self->_count_Stop_Succeeded = v291;

          objc_msgSend_timestamp(v140, v293, v294, v295, v296);
          v297 = (NSDate *)objc_claimAutoreleasedReturnValue();
          timestamp_PerformTask_Succeeded = self->_timestamp_Stop_Succeeded;
          self->_timestamp_Stop_Succeeded = v297;
        }
        else
        {
          v523 = objc_msgSend_intValue(self->_count_Stop_Failed, v282, v283, v284, v285);
          objc_msgSend_numberWithInt_(v286, v524, (v523 + 1), v525, v526);
          v527 = (NSNumber *)objc_claimAutoreleasedReturnValue();
          count_Stop_Failed = self->_count_Stop_Failed;
          self->_count_Stop_Failed = v527;

          objc_msgSend_timestamp(v140, v529, v530, v531, v532);
          v533 = (NSDate *)objc_claimAutoreleasedReturnValue();
          timestamp_PerformTask_Succeeded = self->_timestamp_Stop_Failed;
          self->_timestamp_Stop_Failed = v533;
        }
LABEL_38:

LABEL_39:
LABEL_40:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v199 = v9;
          objc_msgSend_timestamp(v199, v200, v201, v202, v203);
          v204 = (void *)objc_claimAutoreleasedReturnValue();
          v208 = objc_msgSend_compare_(v204, v205, (uint64_t)self->_bucketStartTime, v206, v207);

          if (v208 == -1)
            goto LABEL_82;
          v213 = objc_msgSend_eventType(v199, v209, v210, v211, v212);
          switch(v213)
          {
            case 1:
              v253 = objc_msgSend_eventSucceeded(v199, v214, v215, v216, v217);
              v258 = (void *)MEMORY[0x24BDD16E0];
              if (v253)
              {
                v259 = objc_msgSend_intValue(self->_count_Allocated_Succeeded, v254, v255, v256, v257);
                objc_msgSend_numberWithInt_(v258, v260, (v259 + 1), v261, v262);
                v263 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Allocated_Succeeded = self->_count_Allocated_Succeeded;
                self->_count_Allocated_Succeeded = v263;

                objc_msgSend_timestamp(v199, v265, v266, v267, v268);
                v269 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Allocated_Succeeded;
                self->_timestamp_Allocated_Succeeded = v269;
              }
              else
              {
                v320 = objc_msgSend_intValue(self->_count_Allocated_Failed, v254, v255, v256, v257);
                objc_msgSend_numberWithInt_(v258, v321, (v320 + 1), v322, v323);
                v324 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Allocated_Failed = self->_count_Allocated_Failed;
                self->_count_Allocated_Failed = v324;

                objc_msgSend_timestamp(v199, v326, v327, v328, v329);
                v330 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Allocated_Failed;
                self->_timestamp_Allocated_Failed = v330;
              }
              break;
            case 3:
              v236 = objc_msgSend_eventSucceeded(v199, v214, v215, v216, v217);
              v241 = (void *)MEMORY[0x24BDD16E0];
              if (v236)
              {
                v242 = objc_msgSend_intValue(self->_count_Deactivated_Succeeded, v237, v238, v239, v240);
                objc_msgSend_numberWithInt_(v241, v243, (v242 + 1), v244, v245);
                v246 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Deactivated_Succeeded = self->_count_Deactivated_Succeeded;
                self->_count_Deactivated_Succeeded = v246;

                objc_msgSend_timestamp(v199, v248, v249, v250, v251);
                v252 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Deactivated_Succeeded;
                self->_timestamp_Deactivated_Succeeded = v252;
              }
              else
              {
                v298 = objc_msgSend_intValue(self->_count_Deactivated_Failed, v237, v238, v239, v240);
                objc_msgSend_numberWithInt_(v241, v299, (v298 + 1), v300, v301);
                v302 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Deactivated_Failed = self->_count_Deactivated_Failed;
                self->_count_Deactivated_Failed = v302;

                objc_msgSend_timestamp(v199, v304, v305, v306, v307);
                v308 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Deactivated_Failed;
                self->_timestamp_Deactivated_Failed = v308;
              }
              break;
            case 2:
              v218 = objc_msgSend_eventSucceeded(v199, v214, v215, v216, v217);
              v223 = (void *)MEMORY[0x24BDD16E0];
              if (v218)
              {
                v224 = objc_msgSend_intValue(self->_count_Activated_Succeeded, v219, v220, v221, v222);
                objc_msgSend_numberWithInt_(v223, v225, (v224 + 1), v226, v227);
                v228 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Activated_Succeeded = self->_count_Activated_Succeeded;
                self->_count_Activated_Succeeded = v228;

                objc_msgSend_timestamp(v199, v230, v231, v232, v233);
                v234 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Activated_Succeeded;
                self->_timestamp_Activated_Succeeded = v234;
              }
              else
              {
                v309 = objc_msgSend_intValue(self->_count_Activated_Failed, v219, v220, v221, v222);
                objc_msgSend_numberWithInt_(v223, v310, (v309 + 1), v311, v312);
                v313 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_Activated_Failed = self->_count_Activated_Failed;
                self->_count_Activated_Failed = v313;

                objc_msgSend_timestamp(v199, v315, v316, v317, v318);
                v319 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_Allocated_Succeeded = self->_timestamp_Activated_Failed;
                self->_timestamp_Activated_Failed = v319;
              }
              break;
            default:
              v270 = (void *)LBFLogContextBitacoraStateInfo;
              if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
                sub_2403147E8((uint64_t)v549, v270);
LABEL_60:

              goto LABEL_61;
          }

          goto LABEL_60;
        }
LABEL_61:
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_83;
        v332 = v9;
        objc_msgSend_timestamp(v332, v333, v334, v335, v336);
        v337 = (void *)objc_claimAutoreleasedReturnValue();
        v341 = objc_msgSend_compare_(v337, v338, (uint64_t)self->_bucketStartTime, v339, v340);

        if (v341 != -1)
        {
          objc_msgSend_event(v332, v342, v343, v344, v345);
          v346 = (void *)objc_claimAutoreleasedReturnValue();
          v351 = objc_msgSend_phase(v346, v347, v348, v349, v350);

          switch(v351)
          {
            case 1:
              objc_msgSend_event(v332, v352, v353, v354, v355);
              v356 = (void *)objc_claimAutoreleasedReturnValue();
              v361 = objc_msgSend_succeeded(v356, v357, v358, v359, v360);

              v366 = (void *)MEMORY[0x24BDD16E0];
              if (v361)
              {
                v367 = objc_msgSend_intValue(self->_count_DprivacydDonationReceived_Succeeded, v362, v363, v364, v365);
                objc_msgSend_numberWithInt_(v366, v368, (v367 + 1), v369, v370);
                v371 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydDonationReceived_Succeeded = self->_count_DprivacydDonationReceived_Succeeded;
                self->_count_DprivacydDonationReceived_Succeeded = v371;

                objc_msgSend_timestamp(v332, v373, v374, v375, v376);
                v377 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydDonationReceived_Succeeded;
                self->_timestamp_DprivacydDonationReceived_Succeeded = v377;
              }
              else
              {
                v468 = objc_msgSend_intValue(self->_count_DprivacydDonationReceived_Failed, v362, v363, v364, v365);
                objc_msgSend_numberWithInt_(v366, v469, (v468 + 1), v470, v471);
                v472 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydDonationReceived_Failed = self->_count_DprivacydDonationReceived_Failed;
                self->_count_DprivacydDonationReceived_Failed = v472;

                objc_msgSend_timestamp(v332, v474, v475, v476, v477);
                v478 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydDonationReceived_Failed;
                self->_timestamp_DprivacydDonationReceived_Failed = v478;
              }
              goto LABEL_81;
            case 2:
              objc_msgSend_event(v332, v352, v353, v354, v355);
              v380 = (void *)objc_claimAutoreleasedReturnValue();
              v385 = objc_msgSend_succeeded(v380, v381, v382, v383, v384);

              v390 = (void *)MEMORY[0x24BDD16E0];
              if (v385)
              {
                v391 = objc_msgSend_intValue(self->_count_DprivacydRandomization_Succeeded, v386, v387, v388, v389);
                objc_msgSend_numberWithInt_(v390, v392, (v391 + 1), v393, v394);
                v395 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydRandomization_Succeeded = self->_count_DprivacydRandomization_Succeeded;
                self->_count_DprivacydRandomization_Succeeded = v395;

                objc_msgSend_timestamp(v332, v397, v398, v399, v400);
                v401 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydRandomization_Succeeded;
                self->_timestamp_DprivacydRandomization_Succeeded = v401;
              }
              else
              {
                v479 = objc_msgSend_intValue(self->_count_DprivacydRandomization_Failed, v386, v387, v388, v389);
                objc_msgSend_numberWithInt_(v390, v480, (v479 + 1), v481, v482);
                v483 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydRandomization_Failed = self->_count_DprivacydRandomization_Failed;
                self->_count_DprivacydRandomization_Failed = v483;

                objc_msgSend_timestamp(v332, v485, v486, v487, v488);
                v489 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydRandomization_Failed;
                self->_timestamp_DprivacydRandomization_Failed = v489;
              }
              goto LABEL_81;
            case 3:
              objc_msgSend_event(v332, v352, v353, v354, v355);
              v402 = (void *)objc_claimAutoreleasedReturnValue();
              v407 = objc_msgSend_succeeded(v402, v403, v404, v405, v406);

              v412 = (void *)MEMORY[0x24BDD16E0];
              if (v407)
              {
                v413 = objc_msgSend_intValue(self->_count_DprivacydBudgetCheck_Succeeded, v408, v409, v410, v411);
                objc_msgSend_numberWithInt_(v412, v414, (v413 + 1), v415, v416);
                v417 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydBudgetCheck_Succeeded = self->_count_DprivacydBudgetCheck_Succeeded;
                self->_count_DprivacydBudgetCheck_Succeeded = v417;

                objc_msgSend_timestamp(v332, v419, v420, v421, v422);
                v423 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydBudgetCheck_Succeeded;
                self->_timestamp_DprivacydBudgetCheck_Succeeded = v423;
              }
              else
              {
                v490 = objc_msgSend_intValue(self->_count_DprivacydBudgetCheck_Failed, v408, v409, v410, v411);
                objc_msgSend_numberWithInt_(v412, v491, (v490 + 1), v492, v493);
                v494 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydBudgetCheck_Failed = self->_count_DprivacydBudgetCheck_Failed;
                self->_count_DprivacydBudgetCheck_Failed = v494;

                objc_msgSend_timestamp(v332, v496, v497, v498, v499);
                v500 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydBudgetCheck_Failed;
                self->_timestamp_DprivacydBudgetCheck_Failed = v500;
              }
              goto LABEL_81;
            case 4:
              objc_msgSend_event(v332, v352, v353, v354, v355);
              v424 = (void *)objc_claimAutoreleasedReturnValue();
              v429 = objc_msgSend_succeeded(v424, v425, v426, v427, v428);

              v434 = (void *)MEMORY[0x24BDD16E0];
              if (v429)
              {
                v435 = objc_msgSend_intValue(self->_count_DprivacydPayloadCreation_Succeeded, v430, v431, v432, v433);
                objc_msgSend_numberWithInt_(v434, v436, (v435 + 1), v437, v438);
                v439 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydPayloadCreation_Succeeded = self->_count_DprivacydPayloadCreation_Succeeded;
                self->_count_DprivacydPayloadCreation_Succeeded = v439;

                objc_msgSend_timestamp(v332, v441, v442, v443, v444);
                v445 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydPayloadCreation_Succeeded;
                self->_timestamp_DprivacydPayloadCreation_Succeeded = v445;
              }
              else
              {
                v501 = objc_msgSend_intValue(self->_count_DprivacydPayloadCreation_Failed, v430, v431, v432, v433);
                objc_msgSend_numberWithInt_(v434, v502, (v501 + 1), v503, v504);
                v505 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydPayloadCreation_Failed = self->_count_DprivacydPayloadCreation_Failed;
                self->_count_DprivacydPayloadCreation_Failed = v505;

                objc_msgSend_timestamp(v332, v507, v508, v509, v510);
                v511 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydPayloadCreation_Failed;
                self->_timestamp_DprivacydPayloadCreation_Failed = v511;
              }
              goto LABEL_81;
            case 5:
              objc_msgSend_event(v332, v352, v353, v354, v355);
              v446 = (void *)objc_claimAutoreleasedReturnValue();
              v451 = objc_msgSend_succeeded(v446, v447, v448, v449, v450);

              v456 = (void *)MEMORY[0x24BDD16E0];
              if (v451)
              {
                v457 = objc_msgSend_intValue(self->_count_DprivacydUpload_Succeeded, v452, v453, v454, v455);
                objc_msgSend_numberWithInt_(v456, v458, (v457 + 1), v459, v460);
                v461 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydUpload_Succeeded = self->_count_DprivacydUpload_Succeeded;
                self->_count_DprivacydUpload_Succeeded = v461;

                objc_msgSend_timestamp(v332, v463, v464, v465, v466);
                v467 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydUpload_Succeeded;
                self->_timestamp_DprivacydUpload_Succeeded = v467;
              }
              else
              {
                v512 = objc_msgSend_intValue(self->_count_DprivacydUpload_Failed, v452, v453, v454, v455);
                objc_msgSend_numberWithInt_(v456, v513, (v512 + 1), v514, v515);
                v516 = (NSNumber *)objc_claimAutoreleasedReturnValue();
                count_DprivacydUpload_Failed = self->_count_DprivacydUpload_Failed;
                self->_count_DprivacydUpload_Failed = v516;

                objc_msgSend_timestamp(v332, v518, v519, v520, v521);
                v522 = (NSDate *)objc_claimAutoreleasedReturnValue();
                timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydUpload_Failed;
                self->_timestamp_DprivacydUpload_Failed = v522;
              }
LABEL_81:

              break;
            default:
              v379 = (void *)LBFLogContextBitacoraStateInfo;
              if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
                sub_240314788((uint64_t)v548, v379);
              break;
          }
        }
LABEL_82:

LABEL_83:
        ++v8;
      }
      while (v6 != v8);
      v534 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v331, (uint64_t)&v544, (uint64_t)v550, 16);
      v6 = v534;
    }
    while (v534);
  }

}

- (void)iterateTransitions
{
  NSArray *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableArray *timedeltas_To_State_Allocated;
  NSMutableArray *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  NSMutableArray *timedeltas_To_State_Deactivated;
  NSMutableArray *v19;
  NSMutableArray *timedeltas_To_State_TaskFetched;
  NSMutableArray *v21;
  NSMutableArray *timedeltas_To_State_TaskScheduled;
  NSMutableArray *v23;
  NSMutableArray *timedeltas_To_State_Unexpeted;
  NSMutableArray *v25;
  NSMutableArray *timedeltas_To_State_AllocatedFailed;
  NSMutableArray *v27;
  NSMutableArray *timedeltas_To_State_ActivatedFailed;
  NSMutableArray *v29;
  NSMutableArray *timedeltas_To_State_DeactivatedFailed;
  NSMutableArray *v31;
  NSMutableArray *timedeltas_To_State_TaskFetchedFailed;
  NSMutableArray *v33;
  NSMutableArray *timedeltas_To_State_TaskScheduledFailed;
  NSMutableArray *v35;
  NSMutableArray *timedeltas_To_State_PluginStop;
  NSMutableArray *v37;
  NSMutableArray *timedeltas_To_State_PluginStopFailed;
  void *v39;
  NSMutableArray *v40;
  NSMutableArray *timedeltas_To_State_DprivacydRandomization;
  NSMutableArray *v42;
  NSMutableArray *timedeltas_To_State_DprivacydBudgetCheck;
  NSMutableArray *v44;
  NSMutableArray *timedeltas_To_State_DprivacydPayloadCreation;
  NSMutableArray *v46;
  NSMutableArray *timedeltas_To_State_DprivacydUpload;
  NSMutableArray *v48;
  NSMutableArray *timedeltas_To_State_DprivacydDonationReceivedFailed;
  NSMutableArray *v50;
  NSMutableArray *timedeltas_To_State_DprivacydPayloadCreationFailed;
  NSMutableArray *v52;
  NSMutableArray *timedeltas_To_State_DprivacydUploadFailed;
  NSMutableArray *v54;
  NSMutableArray *timedeltas_To_State_Activated;
  NSMutableArray *v56;
  NSMutableArray *timedeltas_To_State_TaskCompleted;
  NSMutableArray *v58;
  NSMutableArray *timedeltas_To_State_PerformTask;
  NSMutableArray *v60;
  NSMutableArray *timedeltas_To_State_TaskCompletedFailed;
  NSMutableArray *v62;
  NSMutableArray *timedeltas_To_State_PerformTaskFailed;
  NSMutableArray *v64;
  NSMutableArray *timedeltas_To_State_DprivacydDonationReceived;
  NSMutableArray *v66;
  NSMutableArray *timedeltas_To_State_DprivacydRandomizationFailed;
  NSMutableArray *v68;
  NSMutableArray *timedeltas_To_State_DprivacydBudgetCheckFailed;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[16];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x24BDAC8D0];
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v3 = self->_bitacoraStateTransitions;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v79, (uint64_t)v84, 16);
  if (v5)
  {
    v10 = v5;
    v11 = *(_QWORD *)v80;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v80 != v11)
          objc_enumerationMutation(v3);
        v13 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * i);
        switch(objc_msgSend_state(v13, v6, v7, v8, v9))
        {
          case 0:
          case 18:
          case 19:
            continue;
          case 1:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_Allocated;
            if (!timedeltas_To_State_Allocated)
            {
              v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              v16 = self->_timedeltas_To_State_Allocated;
              self->_timedeltas_To_State_Allocated = v15;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_Allocated;
            }
            goto LABEL_63;
          case 2:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_Activated;
            if (!timedeltas_To_State_Allocated)
            {
              v54 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_Activated = self->_timedeltas_To_State_Activated;
              self->_timedeltas_To_State_Activated = v54;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_Activated;
            }
            goto LABEL_63;
          case 3:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_Deactivated;
            if (!timedeltas_To_State_Allocated)
            {
              v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_Deactivated = self->_timedeltas_To_State_Deactivated;
              self->_timedeltas_To_State_Deactivated = v17;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_Deactivated;
            }
            goto LABEL_63;
          case 4:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskFetched;
            if (!timedeltas_To_State_Allocated)
            {
              v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_TaskFetched = self->_timedeltas_To_State_TaskFetched;
              self->_timedeltas_To_State_TaskFetched = v19;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskFetched;
            }
            goto LABEL_63;
          case 5:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskScheduled;
            if (!timedeltas_To_State_Allocated)
            {
              v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_TaskScheduled = self->_timedeltas_To_State_TaskScheduled;
              self->_timedeltas_To_State_TaskScheduled = v21;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskScheduled;
            }
            goto LABEL_63;
          case 6:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskCompleted;
            if (!timedeltas_To_State_Allocated)
            {
              v56 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_TaskCompleted = self->_timedeltas_To_State_TaskCompleted;
              self->_timedeltas_To_State_TaskCompleted = v56;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskCompleted;
            }
            goto LABEL_63;
          case 7:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_PerformTask;
            if (!timedeltas_To_State_Allocated)
            {
              v58 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_PerformTask = self->_timedeltas_To_State_PerformTask;
              self->_timedeltas_To_State_PerformTask = v58;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_PerformTask;
            }
            goto LABEL_63;
          case 8:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_Unexpeted;
            if (!timedeltas_To_State_Allocated)
            {
              v23 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_Unexpeted = self->_timedeltas_To_State_Unexpeted;
              self->_timedeltas_To_State_Unexpeted = v23;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_Unexpeted;
            }
            goto LABEL_63;
          case 9:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_AllocatedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v25 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_AllocatedFailed = self->_timedeltas_To_State_AllocatedFailed;
              self->_timedeltas_To_State_AllocatedFailed = v25;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_AllocatedFailed;
            }
            goto LABEL_63;
          case 10:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_ActivatedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_ActivatedFailed = self->_timedeltas_To_State_ActivatedFailed;
              self->_timedeltas_To_State_ActivatedFailed = v27;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_ActivatedFailed;
            }
            goto LABEL_63;
          case 11:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DeactivatedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DeactivatedFailed = self->_timedeltas_To_State_DeactivatedFailed;
              self->_timedeltas_To_State_DeactivatedFailed = v29;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DeactivatedFailed;
            }
            goto LABEL_63;
          case 12:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskFetchedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v31 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_TaskFetchedFailed = self->_timedeltas_To_State_TaskFetchedFailed;
              self->_timedeltas_To_State_TaskFetchedFailed = v31;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskFetchedFailed;
            }
            goto LABEL_63;
          case 13:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskScheduledFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v33 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_TaskScheduledFailed = self->_timedeltas_To_State_TaskScheduledFailed;
              self->_timedeltas_To_State_TaskScheduledFailed = v33;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskScheduledFailed;
            }
            goto LABEL_63;
          case 14:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskCompletedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v60 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_TaskCompletedFailed = self->_timedeltas_To_State_TaskCompletedFailed;
              self->_timedeltas_To_State_TaskCompletedFailed = v60;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_TaskCompletedFailed;
            }
            goto LABEL_63;
          case 15:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_PerformTaskFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v62 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_PerformTaskFailed = self->_timedeltas_To_State_PerformTaskFailed;
              self->_timedeltas_To_State_PerformTaskFailed = v62;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_PerformTaskFailed;
            }
            goto LABEL_63;
          case 16:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_PluginStop;
            if (!timedeltas_To_State_Allocated)
            {
              v35 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_PluginStop = self->_timedeltas_To_State_PluginStop;
              self->_timedeltas_To_State_PluginStop = v35;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_PluginStop;
            }
            goto LABEL_63;
          case 17:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_PluginStopFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v37 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_PluginStopFailed = self->_timedeltas_To_State_PluginStopFailed;
              self->_timedeltas_To_State_PluginStopFailed = v37;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_PluginStopFailed;
            }
            goto LABEL_63;
          case 21:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydDonationReceived;
            if (!timedeltas_To_State_Allocated)
            {
              v64 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DprivacydDonationReceived = self->_timedeltas_To_State_DprivacydDonationReceived;
              self->_timedeltas_To_State_DprivacydDonationReceived = v64;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydDonationReceived;
            }
            goto LABEL_63;
          case 22:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydRandomization;
            if (!timedeltas_To_State_Allocated)
            {
              v40 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DprivacydRandomization = self->_timedeltas_To_State_DprivacydRandomization;
              self->_timedeltas_To_State_DprivacydRandomization = v40;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydRandomization;
            }
            goto LABEL_63;
          case 23:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydBudgetCheck;
            if (!timedeltas_To_State_Allocated)
            {
              v42 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DprivacydBudgetCheck = self->_timedeltas_To_State_DprivacydBudgetCheck;
              self->_timedeltas_To_State_DprivacydBudgetCheck = v42;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydBudgetCheck;
            }
            goto LABEL_63;
          case 24:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydPayloadCreation;
            if (!timedeltas_To_State_Allocated)
            {
              v44 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DprivacydPayloadCreation = self->_timedeltas_To_State_DprivacydPayloadCreation;
              self->_timedeltas_To_State_DprivacydPayloadCreation = v44;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydPayloadCreation;
            }
            goto LABEL_63;
          case 25:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydUpload;
            if (!timedeltas_To_State_Allocated)
            {
              v46 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DprivacydUpload = self->_timedeltas_To_State_DprivacydUpload;
              self->_timedeltas_To_State_DprivacydUpload = v46;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydUpload;
            }
            goto LABEL_63;
          case 26:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydDonationReceivedFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v48 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DprivacydDonationReceivedFailed = self->_timedeltas_To_State_DprivacydDonationReceivedFailed;
              self->_timedeltas_To_State_DprivacydDonationReceivedFailed = v48;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydDonationReceivedFailed;
            }
            goto LABEL_63;
          case 27:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydRandomizationFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v66 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DprivacydRandomizationFailed = self->_timedeltas_To_State_DprivacydRandomizationFailed;
              self->_timedeltas_To_State_DprivacydRandomizationFailed = v66;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydRandomizationFailed;
            }
            goto LABEL_63;
          case 28:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydBudgetCheckFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v68 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DprivacydBudgetCheckFailed = self->_timedeltas_To_State_DprivacydBudgetCheckFailed;
              self->_timedeltas_To_State_DprivacydBudgetCheckFailed = v68;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydBudgetCheckFailed;
            }
            goto LABEL_63;
          case 29:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydPayloadCreationFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v50 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DprivacydPayloadCreationFailed = self->_timedeltas_To_State_DprivacydPayloadCreationFailed;
              self->_timedeltas_To_State_DprivacydPayloadCreationFailed = v50;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydPayloadCreationFailed;
            }
            goto LABEL_63;
          case 30:
            timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydUploadFailed;
            if (!timedeltas_To_State_Allocated)
            {
              v52 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
              timedeltas_To_State_DprivacydUploadFailed = self->_timedeltas_To_State_DprivacydUploadFailed;
              self->_timedeltas_To_State_DprivacydUploadFailed = v52;

              timedeltas_To_State_Allocated = self->_timedeltas_To_State_DprivacydUploadFailed;
            }
LABEL_63:
            v70 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend_timedelta(v13, v6, v7, v8, v9);
            objc_msgSend_numberWithDouble_(v70, v71, v72, v73, v74);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(timedeltas_To_State_Allocated, v76, (uint64_t)v75, v77, v78);

            break;
          default:
            v39 = (void *)LBFLogContextBitacoraStateInfo;
            if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
              sub_240314888((uint64_t)v83, v39);
            break;
        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v79, (uint64_t)v84, 16);
    }
    while (v10);
  }

}

- (id)getDictionaryRepresentation
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t latestState;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSNumber *count_Activated_Succeeded;
  NSNumber *count_Allocated_Succeeded;
  NSNumber *isActivated;
  NSNumber *count_Deactivated_Succeeded;
  NSNumber *count_PerformTask_Failed;
  NSNumber *count_PerformTask_Succeeded;
  NSNumber *count_Stop_Failed;
  NSNumber *count_Stop_Succeeded;
  NSNumber *count_TaskCompleted_Failed;
  NSNumber *count_TaskCompleted_Succeeded;
  NSNumber *count_TaskFetched_Failed;
  NSNumber *count_TaskFetched_Succeeded;
  NSNumber *count_TaskScheduled_Failed;
  NSNumber *count_TaskScheduled_Succeeded;
  NSNumber *count_DprivacydDonationReceived_Failed;
  NSNumber *count_DprivacydDonationReceived_Succeeded;
  NSNumber *count_DprivacydRandomization_Failed;
  NSNumber *count_DprivacydRandomization_Succeeded;
  NSNumber *count_DprivacydBudgetCheck_Failed;
  NSNumber *count_DprivacydBudgetCheck_Succeeded;
  NSNumber *count_DprivacydPayloadCreation_Failed;
  NSNumber *count_DprivacydPayloadCreation_Succeeded;
  NSNumber *count_DprivacydUpload_Failed;
  NSNumber *count_DprivacydUpload_Succeeded;
  uint64_t v40;
  uint64_t isAllocated;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  NSString *stateId;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  NSDate *timestamp_Activated_Succeeded;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  NSDate *timestamp_Allocated_Succeeded;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  NSDate *timestamp_Deactivated_Succeeded;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  NSDate *timestamp_PerformTask_Failed;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  NSDate *timestamp_PerformTask_Succeeded;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  NSDate *timestamp_Stop_Failed;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  NSDate *timestamp_Stop_Succeeded;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  NSDate *timestamp_TaskCompleted_Failed;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  NSDate *timestamp_TaskCompleted_Succeeded;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  NSDate *timestamp_TaskFetched_Failed;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  NSDate *timestamp_TaskFetched_Succeeded;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  NSDate *timestamp_TaskScheduled_Failed;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  NSDate *timestamp_TaskScheduled_Succeeded;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  NSDate *timestamp_DprivacydDonationReceived_Failed;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  NSDate *timestamp_DprivacydDonationReceived_Succeeded;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  NSDate *timestamp_DprivacydRandomization_Failed;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  NSDate *timestamp_DprivacydRandomization_Succeeded;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  NSDate *timestamp_DprivacydBudgetCheck_Failed;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  NSDate *timestamp_DprivacydBudgetCheck_Succeeded;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  NSDate *timestamp_DprivacydPayloadCreation_Failed;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  NSDate *timestamp_DprivacydPayloadCreation_Succeeded;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  NSDate *timestamp_DprivacydUpload_Failed;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  NSDate *timestamp_DprivacydUpload_Succeeded;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  void *v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  void *v310;
  void *v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  const char *v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  void *v321;
  void *v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  void *v332;
  void *v333;
  void *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  void *v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  void *v346;
  void *v347;
  void *v348;
  id v349;
  void *v351;
  void *v352;
  void *v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  void *v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  id v391;
  void *v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  void *v403;
  void *v404;
  void *v405;
  void *v406;
  void *v407;
  void *v408;
  void *v409;
  void *v410;
  void *v411;
  void *v412;
  void *v413;
  void *v414;
  void *v415;
  void *v416;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  uint64_t v421;
  NSNumber *v422;
  void *v423;
  void *v424;
  void *v425;
  void *v426;
  void *v427;
  void *v428;
  void *v429;
  void *v430;
  void *v431;
  void *v432;
  void *v433;
  void *v434;
  void *v435;
  void *v436;
  void *v437;
  void *v438;
  void *v439;
  _QWORD v440[85];
  _QWORD v441[85];
  _QWORD v442[30];
  _QWORD v443[32];

  v443[30] = *MEMORY[0x24BDAC8D0];
  v442[0] = &unk_25109D678;
  v442[1] = &unk_25109D690;
  v443[0] = CFSTR("state_Unknown");
  v443[1] = CFSTR("state_Allocated");
  v442[2] = &unk_25109D6A8;
  v442[3] = &unk_25109D6C0;
  v443[2] = CFSTR("state_Activated");
  v443[3] = CFSTR("state_Deativated");
  v442[4] = &unk_25109D6D8;
  v442[5] = &unk_25109D6F0;
  v443[4] = CFSTR("state_TaskFetched");
  v443[5] = CFSTR("state_TaskScheduled");
  v442[6] = &unk_25109D708;
  v442[7] = &unk_25109D720;
  v443[6] = CFSTR("state_TaskCompleted");
  v443[7] = CFSTR("state_PerformTaskSucceeded");
  v442[8] = &unk_25109D738;
  v442[9] = &unk_25109D750;
  v443[8] = CFSTR("state_Unexpected");
  v443[9] = CFSTR("state_AllocateFailed");
  v442[10] = &unk_25109D768;
  v442[11] = &unk_25109D780;
  v443[10] = CFSTR("state_ActivateFailed");
  v443[11] = CFSTR("state_DeativateFailed");
  v442[12] = &unk_25109D798;
  v442[13] = &unk_25109D7B0;
  v443[12] = CFSTR("state_TaskFetcheFailed");
  v443[13] = CFSTR("state_TaskScheduleFailed");
  v442[14] = &unk_25109D7C8;
  v442[15] = &unk_25109D7E0;
  v443[14] = CFSTR("state_TaskCompleteFailed");
  v443[15] = CFSTR("state_PerformTaskFailed");
  v442[16] = &unk_25109D7F8;
  v442[17] = &unk_25109D810;
  v443[16] = CFSTR("state_PluginStop");
  v443[17] = CFSTR("state_PluginStopFailed");
  v442[18] = &unk_25109D828;
  v442[19] = &unk_25109D840;
  v443[18] = CFSTR("state_AllocatedIdle");
  v443[19] = CFSTR("state_ActivatedIdle");
  v442[20] = &unk_25109D858;
  v442[21] = &unk_25109D870;
  v443[20] = CFSTR("state_DonationReceived");
  v443[21] = CFSTR("state_Randomization");
  v442[22] = &unk_25109D888;
  v442[23] = &unk_25109D8A0;
  v443[22] = CFSTR("state_BudgetCheck");
  v443[23] = CFSTR("state_PayloadCreation");
  v442[24] = &unk_25109D8B8;
  v442[25] = &unk_25109D8D0;
  v443[24] = CFSTR("state_Upload");
  v443[25] = CFSTR("state_DonationReceivedFailed");
  v442[26] = &unk_25109D8E8;
  v442[27] = &unk_25109D900;
  v443[26] = CFSTR("state_RandomizationFailed");
  v443[27] = CFSTR("state_BudgetCheckFailed");
  v442[28] = &unk_25109D918;
  v442[29] = &unk_25109D930;
  v443[28] = CFSTR("state_PayloadCreationFailed");
  v443[29] = CFSTR("state_UploadFailed");
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], a2, (uint64_t)v443, (uint64_t)v442, 30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  latestState = self->_latestState;
  if (latestState >= 0x1F)
  {
    v10 = (id)LBFLogContextBitacoraStateInfo;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_2403148D8(&self->_latestState, v10);

    v9 = &unk_25109D738;
  }
  else
  {
    v9 = (void *)qword_2510951F0[latestState];
  }
  v440[0] = CFSTR("contextId");
  objc_msgSend_UUIDString(self->_contextId, v3, v4, v5, v6);
  v11 = objc_claimAutoreleasedReturnValue();
  count_Activated_Succeeded = self->_count_Activated_Succeeded;
  if (!count_Activated_Succeeded)
    count_Activated_Succeeded = (NSNumber *)&unk_25109D678;
  v423 = (void *)v11;
  v441[0] = v11;
  v441[1] = count_Activated_Succeeded;
  v440[1] = CFSTR("count_Activated");
  v440[2] = CFSTR("count_Allocated");
  isActivated = self->_isActivated;
  count_Allocated_Succeeded = self->_count_Allocated_Succeeded;
  if (!count_Allocated_Succeeded)
    count_Allocated_Succeeded = (NSNumber *)&unk_25109D678;
  count_Deactivated_Succeeded = self->_count_Deactivated_Succeeded;
  if (!count_Deactivated_Succeeded)
    count_Deactivated_Succeeded = (NSNumber *)&unk_25109D678;
  v441[2] = count_Allocated_Succeeded;
  v441[3] = count_Deactivated_Succeeded;
  v440[3] = CFSTR("count_Deactivated");
  v440[4] = CFSTR("count_PerformTask_Failed");
  count_PerformTask_Succeeded = self->_count_PerformTask_Succeeded;
  count_PerformTask_Failed = self->_count_PerformTask_Failed;
  if (!count_PerformTask_Failed)
    count_PerformTask_Failed = (NSNumber *)&unk_25109D678;
  if (!count_PerformTask_Succeeded)
    count_PerformTask_Succeeded = (NSNumber *)&unk_25109D678;
  v441[4] = count_PerformTask_Failed;
  v441[5] = count_PerformTask_Succeeded;
  v440[5] = CFSTR("count_PerformTask_Succeeded");
  v440[6] = CFSTR("count_Stop_Failed");
  count_Stop_Succeeded = self->_count_Stop_Succeeded;
  count_Stop_Failed = self->_count_Stop_Failed;
  if (!count_Stop_Failed)
    count_Stop_Failed = (NSNumber *)&unk_25109D678;
  if (!count_Stop_Succeeded)
    count_Stop_Succeeded = (NSNumber *)&unk_25109D678;
  v441[6] = count_Stop_Failed;
  v441[7] = count_Stop_Succeeded;
  v440[7] = CFSTR("count_Stop_Succeeded");
  v440[8] = CFSTR("count_TaskCompleted_Failed");
  count_TaskCompleted_Succeeded = self->_count_TaskCompleted_Succeeded;
  count_TaskCompleted_Failed = self->_count_TaskCompleted_Failed;
  if (!count_TaskCompleted_Failed)
    count_TaskCompleted_Failed = (NSNumber *)&unk_25109D678;
  if (!count_TaskCompleted_Succeeded)
    count_TaskCompleted_Succeeded = (NSNumber *)&unk_25109D678;
  v441[8] = count_TaskCompleted_Failed;
  v441[9] = count_TaskCompleted_Succeeded;
  v440[9] = CFSTR("count_TaskCompleted_Succeeded");
  v440[10] = CFSTR("count_TaskFetched_Failed");
  count_TaskFetched_Succeeded = self->_count_TaskFetched_Succeeded;
  count_TaskFetched_Failed = self->_count_TaskFetched_Failed;
  if (!count_TaskFetched_Failed)
    count_TaskFetched_Failed = (NSNumber *)&unk_25109D678;
  if (!count_TaskFetched_Succeeded)
    count_TaskFetched_Succeeded = (NSNumber *)&unk_25109D678;
  v441[10] = count_TaskFetched_Failed;
  v441[11] = count_TaskFetched_Succeeded;
  v440[11] = CFSTR("count_TaskFetched_Succeeded");
  v440[12] = CFSTR("count_TaskScheduled_Failed");
  count_TaskScheduled_Succeeded = self->_count_TaskScheduled_Succeeded;
  count_TaskScheduled_Failed = self->_count_TaskScheduled_Failed;
  if (!count_TaskScheduled_Failed)
    count_TaskScheduled_Failed = (NSNumber *)&unk_25109D678;
  if (!count_TaskScheduled_Succeeded)
    count_TaskScheduled_Succeeded = (NSNumber *)&unk_25109D678;
  v441[12] = count_TaskScheduled_Failed;
  v441[13] = count_TaskScheduled_Succeeded;
  v440[13] = CFSTR("count_TaskScheduled_Succeeded");
  v440[14] = CFSTR("count_DprivacydDonationReceived_Failed");
  count_DprivacydDonationReceived_Succeeded = self->_count_DprivacydDonationReceived_Succeeded;
  count_DprivacydDonationReceived_Failed = self->_count_DprivacydDonationReceived_Failed;
  if (!count_DprivacydDonationReceived_Failed)
    count_DprivacydDonationReceived_Failed = (NSNumber *)&unk_25109D678;
  if (!count_DprivacydDonationReceived_Succeeded)
    count_DprivacydDonationReceived_Succeeded = (NSNumber *)&unk_25109D678;
  v441[14] = count_DprivacydDonationReceived_Failed;
  v441[15] = count_DprivacydDonationReceived_Succeeded;
  v440[15] = CFSTR("count_DprivacydDonationReceived_Succeeded");
  v440[16] = CFSTR("count_DprivacydRandomization_Failed");
  count_DprivacydRandomization_Succeeded = self->_count_DprivacydRandomization_Succeeded;
  count_DprivacydRandomization_Failed = self->_count_DprivacydRandomization_Failed;
  if (!count_DprivacydRandomization_Failed)
    count_DprivacydRandomization_Failed = (NSNumber *)&unk_25109D678;
  if (!count_DprivacydRandomization_Succeeded)
    count_DprivacydRandomization_Succeeded = (NSNumber *)&unk_25109D678;
  v441[16] = count_DprivacydRandomization_Failed;
  v441[17] = count_DprivacydRandomization_Succeeded;
  v440[17] = CFSTR("count_DprivacydRandomization_Succeeded");
  v440[18] = CFSTR("count_DprivacydBudgetCheck_Failed");
  count_DprivacydBudgetCheck_Succeeded = self->_count_DprivacydBudgetCheck_Succeeded;
  count_DprivacydBudgetCheck_Failed = self->_count_DprivacydBudgetCheck_Failed;
  if (!count_DprivacydBudgetCheck_Failed)
    count_DprivacydBudgetCheck_Failed = (NSNumber *)&unk_25109D678;
  if (!count_DprivacydBudgetCheck_Succeeded)
    count_DprivacydBudgetCheck_Succeeded = (NSNumber *)&unk_25109D678;
  v441[18] = count_DprivacydBudgetCheck_Failed;
  v441[19] = count_DprivacydBudgetCheck_Succeeded;
  v440[19] = CFSTR("count_DprivacydBudgetCheck_Succeeded");
  v440[20] = CFSTR("count_DprivacydPayloadCreation_Failed");
  count_DprivacydPayloadCreation_Succeeded = self->_count_DprivacydPayloadCreation_Succeeded;
  count_DprivacydPayloadCreation_Failed = self->_count_DprivacydPayloadCreation_Failed;
  if (!count_DprivacydPayloadCreation_Failed)
    count_DprivacydPayloadCreation_Failed = (NSNumber *)&unk_25109D678;
  if (!count_DprivacydPayloadCreation_Succeeded)
    count_DprivacydPayloadCreation_Succeeded = (NSNumber *)&unk_25109D678;
  v441[20] = count_DprivacydPayloadCreation_Failed;
  v441[21] = count_DprivacydPayloadCreation_Succeeded;
  v440[21] = CFSTR("count_DprivacydPayloadCreation_Succeeded");
  v440[22] = CFSTR("count_DprivacydUpload_Failed");
  count_DprivacydUpload_Succeeded = self->_count_DprivacydUpload_Succeeded;
  count_DprivacydUpload_Failed = self->_count_DprivacydUpload_Failed;
  if (!count_DprivacydUpload_Failed)
    count_DprivacydUpload_Failed = (NSNumber *)&unk_25109D678;
  if (!count_DprivacydUpload_Succeeded)
    count_DprivacydUpload_Succeeded = (NSNumber *)&unk_25109D678;
  v441[22] = count_DprivacydUpload_Failed;
  v441[23] = count_DprivacydUpload_Succeeded;
  v440[23] = CFSTR("count_DprivacydUpload_Succeeded");
  v440[24] = CFSTR("isActivated");
  v40 = (uint64_t)isActivated;
  v422 = isActivated;
  if (!isActivated)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v13, v14, v15);
    v40 = objc_claimAutoreleasedReturnValue();
  }
  v379 = (void *)v40;
  v441[24] = v40;
  v440[25] = CFSTR("isAllocated");
  isAllocated = (uint64_t)self->_isAllocated;
  v421 = isAllocated;
  if (!isAllocated)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v12, v13, v14, v15);
    isAllocated = objc_claimAutoreleasedReturnValue();
  }
  v378 = (void *)isAllocated;
  v441[25] = isAllocated;
  v440[26] = CFSTR("isActivated_implicit");
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v12, self->_isActivated_implicit, v14, v15);
  v420 = (void *)objc_claimAutoreleasedReturnValue();
  v441[26] = v420;
  v440[27] = CFSTR("isAllocated_implicit");
  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v42, self->_isAllocated_implicit, v43, v44);
  v419 = (void *)objc_claimAutoreleasedReturnValue();
  v441[27] = v419;
  v440[28] = CFSTR("maxTimedelta_To_State_Activated");
  objc_msgSend_maxTimedelta_To_State_Activated(self, v45, v46, v47, v48);
  v49 = objc_claimAutoreleasedReturnValue();
  v54 = (void *)v49;
  if (!v49)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v50, v51, v52, v53);
    v49 = objc_claimAutoreleasedReturnValue();
  }
  v377 = (void *)v49;
  v441[28] = v49;
  v440[29] = CFSTR("maxTimedelta_To_State_ActivatedFailed");
  objc_msgSend_maxTimedelta_To_State_ActivatedFailed(self, v50, v51, v52, v53);
  v55 = objc_claimAutoreleasedReturnValue();
  v60 = (void *)v55;
  if (!v55)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v56, v57, v58, v59);
    v55 = objc_claimAutoreleasedReturnValue();
  }
  v376 = (void *)v55;
  v441[29] = v55;
  v440[30] = CFSTR("maxTimedelta_To_State_Allocated");
  objc_msgSend_maxTimedelta_To_State_Allocated(self, v56, v57, v58, v59);
  v65 = objc_claimAutoreleasedReturnValue();
  v416 = (void *)v65;
  if (!v65)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v61, v62, v63, v64);
    v65 = objc_claimAutoreleasedReturnValue();
  }
  v375 = (void *)v65;
  v441[30] = v65;
  v440[31] = CFSTR("maxTimedelta_To_State_AllocatedFailed");
  objc_msgSend_maxTimedelta_To_State_AllocatedFailed(self, v61, v62, v63, v64);
  v70 = objc_claimAutoreleasedReturnValue();
  v415 = (void *)v70;
  if (!v70)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v66, v67, v68, v69);
    v70 = objc_claimAutoreleasedReturnValue();
  }
  v374 = (void *)v70;
  v441[31] = v70;
  v440[32] = CFSTR("maxTimedelta_To_State_Deativated");
  objc_msgSend_maxTimedelta_To_State_Deativated(self, v66, v67, v68, v69);
  v71 = objc_claimAutoreleasedReturnValue();
  v76 = (void *)v71;
  if (!v71)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v72, v73, v74, v75);
    v71 = objc_claimAutoreleasedReturnValue();
  }
  v373 = (void *)v71;
  v441[32] = v71;
  v440[33] = CFSTR("maxTimedelta_To_State_DeativatedFailed");
  objc_msgSend_maxTimedelta_To_State_DeativatedFailed(self, v72, v73, v74, v75);
  v77 = objc_claimAutoreleasedReturnValue();
  v82 = (void *)v77;
  if (!v77)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v78, v79, v80, v81);
    v77 = objc_claimAutoreleasedReturnValue();
  }
  v372 = (void *)v77;
  v441[33] = v77;
  v440[34] = CFSTR("maxTimedelta_To_State_PerformTaskFailed");
  objc_msgSend_maxTimedelta_To_State_PerformTaskFailed(self, v78, v79, v80, v81);
  v83 = objc_claimAutoreleasedReturnValue();
  v88 = (void *)v83;
  if (!v83)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v84, v85, v86, v87);
    v83 = objc_claimAutoreleasedReturnValue();
  }
  v371 = (void *)v83;
  v441[34] = v83;
  v440[35] = CFSTR("maxTimedelta_To_State_PerformTaskSucceeded");
  objc_msgSend_maxTimedelta_To_State_PerformTask(self, v84, v85, v86, v87);
  v89 = objc_claimAutoreleasedReturnValue();
  v94 = (void *)v89;
  if (!v89)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v90, v91, v92, v93);
    v89 = objc_claimAutoreleasedReturnValue();
  }
  v370 = (void *)v89;
  v441[35] = v89;
  v440[36] = CFSTR("maxTimedelta_To_State_TaskCompleted");
  objc_msgSend_maxTimedelta_To_State_TaskCompleted(self, v90, v91, v92, v93);
  v95 = objc_claimAutoreleasedReturnValue();
  v100 = (void *)v95;
  if (!v95)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v96, v97, v98, v99);
    v95 = objc_claimAutoreleasedReturnValue();
  }
  v369 = (void *)v95;
  v441[36] = v95;
  v440[37] = CFSTR("maxTimedelta_To_State_TaskCompletedFailed");
  objc_msgSend_maxTimedelta_To_State_TaskCompletedFailed(self, v96, v97, v98, v99);
  v105 = objc_claimAutoreleasedReturnValue();
  v439 = (void *)v105;
  if (!v105)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v101, v102, v103, v104);
    v105 = objc_claimAutoreleasedReturnValue();
  }
  v368 = (void *)v105;
  v441[37] = v105;
  v440[38] = CFSTR("maxTimedelta_To_State_TaskFetched");
  objc_msgSend_maxTimedelta_To_State_TaskFetched(self, v101, v102, v103, v104);
  v110 = objc_claimAutoreleasedReturnValue();
  v438 = (void *)v110;
  if (!v110)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v106, v107, v108, v109);
    v110 = objc_claimAutoreleasedReturnValue();
  }
  v367 = (void *)v110;
  v441[38] = v110;
  v440[39] = CFSTR("maxTimedelta_To_State_TaskFetchedFailed");
  objc_msgSend_maxTimedelta_To_State_TaskFetchedFailed(self, v106, v107, v108, v109);
  v115 = objc_claimAutoreleasedReturnValue();
  v437 = (void *)v115;
  if (!v115)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v111, v112, v113, v114);
    v115 = objc_claimAutoreleasedReturnValue();
  }
  v366 = (void *)v115;
  v441[39] = v115;
  v440[40] = CFSTR("maxTimedelta_To_State_TaskScheduled");
  objc_msgSend_maxTimedelta_To_State_TaskScheduled(self, v111, v112, v113, v114);
  v120 = objc_claimAutoreleasedReturnValue();
  v436 = (void *)v120;
  if (!v120)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v116, v117, v118, v119);
    v120 = objc_claimAutoreleasedReturnValue();
  }
  v365 = (void *)v120;
  v441[40] = v120;
  v440[41] = CFSTR("maxTimedelta_To_State_TaskScheduledFailed");
  objc_msgSend_maxTimedelta_To_State_TaskScheduledFailed(self, v116, v117, v118, v119);
  v125 = objc_claimAutoreleasedReturnValue();
  v435 = (void *)v125;
  if (!v125)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v121, v122, v123, v124);
    v125 = objc_claimAutoreleasedReturnValue();
  }
  v364 = (void *)v125;
  v441[41] = v125;
  v440[42] = CFSTR("maxTimedelta_To_State_DprivacydDonationReceived");
  objc_msgSend_maxTimedelta_To_State_DprivacydDonationReceived(self, v121, v122, v123, v124);
  v130 = objc_claimAutoreleasedReturnValue();
  v434 = (void *)v130;
  if (!v130)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v126, v127, v128, v129);
    v130 = objc_claimAutoreleasedReturnValue();
  }
  v363 = (void *)v130;
  v441[42] = v130;
  v440[43] = CFSTR("maxTimedelta_To_State_DprivacydDonationReceivedFailed");
  objc_msgSend_maxTimedelta_To_State_DprivacydDonationReceivedFailed(self, v126, v127, v128, v129);
  v135 = objc_claimAutoreleasedReturnValue();
  v433 = (void *)v135;
  if (!v135)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v131, v132, v133, v134);
    v135 = objc_claimAutoreleasedReturnValue();
  }
  v362 = (void *)v135;
  v441[43] = v135;
  v440[44] = CFSTR("maxTimedelta_To_State_DprivacydRandomization");
  objc_msgSend_maxTimedelta_To_State_DprivacydRandomization(self, v131, v132, v133, v134);
  v140 = objc_claimAutoreleasedReturnValue();
  v432 = (void *)v140;
  if (!v140)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v136, v137, v138, v139);
    v140 = objc_claimAutoreleasedReturnValue();
  }
  v361 = (void *)v140;
  v441[44] = v140;
  v440[45] = CFSTR("maxTimedelta_To_State_DprivacydRandomizationFailed");
  objc_msgSend_maxTimedelta_To_State_DprivacydRandomizationFailed(self, v136, v137, v138, v139);
  v145 = objc_claimAutoreleasedReturnValue();
  v431 = (void *)v145;
  if (!v145)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v141, v142, v143, v144);
    v145 = objc_claimAutoreleasedReturnValue();
  }
  v360 = (void *)v145;
  v441[45] = v145;
  v440[46] = CFSTR("maxTimedelta_To_State_DprivacydBudgetCheck");
  objc_msgSend_maxTimedelta_To_State_DprivacydBudgetCheck(self, v141, v142, v143, v144);
  v150 = objc_claimAutoreleasedReturnValue();
  v430 = (void *)v150;
  if (!v150)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v146, v147, v148, v149);
    v150 = objc_claimAutoreleasedReturnValue();
  }
  v359 = (void *)v150;
  v441[46] = v150;
  v440[47] = CFSTR("maxTimedelta_To_State_DprivacydBudgetCheckFailed");
  objc_msgSend_maxTimedelta_To_State_DprivacydBudgetCheckFailed(self, v146, v147, v148, v149);
  v155 = objc_claimAutoreleasedReturnValue();
  v429 = (void *)v155;
  if (!v155)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v151, v152, v153, v154);
    v155 = objc_claimAutoreleasedReturnValue();
  }
  v358 = (void *)v155;
  v441[47] = v155;
  v440[48] = CFSTR("maxTimedelta_To_State_DprivacydPayloadCreation");
  objc_msgSend_maxTimedelta_To_State_DprivacydPayloadCreation(self, v151, v152, v153, v154);
  v160 = objc_claimAutoreleasedReturnValue();
  v428 = (void *)v160;
  if (!v160)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v156, v157, v158, v159);
    v160 = objc_claimAutoreleasedReturnValue();
  }
  v357 = (void *)v160;
  v441[48] = v160;
  v440[49] = CFSTR("maxTimedelta_To_State_DprivacydPayloadCreationFailed");
  objc_msgSend_maxTimedelta_To_State_DprivacydPayloadCreationFailed(self, v156, v157, v158, v159);
  v165 = objc_claimAutoreleasedReturnValue();
  v427 = (void *)v165;
  if (!v165)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v161, v162, v163, v164);
    v165 = objc_claimAutoreleasedReturnValue();
  }
  v356 = (void *)v165;
  v441[49] = v165;
  v440[50] = CFSTR("maxTimedelta_To_State_DprivacydUpload");
  objc_msgSend_maxTimedelta_To_State_DprivacydUpload(self, v161, v162, v163, v164);
  v170 = objc_claimAutoreleasedReturnValue();
  v426 = (void *)v170;
  if (!v170)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v166, v167, v168, v169);
    v170 = objc_claimAutoreleasedReturnValue();
  }
  v355 = (void *)v170;
  v441[50] = v170;
  v440[51] = CFSTR("maxTimedelta_To_State_DprivacydUploadFailed");
  objc_msgSend_maxTimedelta_To_State_DprivacydUploadFailed(self, v166, v167, v168, v169);
  v175 = objc_claimAutoreleasedReturnValue();
  v425 = (void *)v175;
  if (!v175)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v171, v172, v173, v174);
    v175 = objc_claimAutoreleasedReturnValue();
  }
  v418 = v54;
  v354 = (void *)v175;
  v441[51] = v175;
  v440[52] = CFSTR("maxTimedelta_To_State_Unexpeted");
  objc_msgSend_maxTimedelta_To_State_Unexpeted(self, v171, v172, v173, v174);
  v180 = objc_claimAutoreleasedReturnValue();
  v409 = (void *)v180;
  if (!v180)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v176, v177, v178, v179);
    v180 = objc_claimAutoreleasedReturnValue();
  }
  v353 = (void *)v180;
  v441[52] = v180;
  v441[53] = v9;
  v440[53] = CFSTR("state");
  v440[54] = CFSTR("stateString");
  objc_msgSend_objectForKey_(v7, v176, (uint64_t)v9, v178, v179);
  v181 = objc_claimAutoreleasedReturnValue();
  stateId = self->_stateId;
  v408 = (void *)v181;
  v441[54] = v181;
  v441[55] = stateId;
  v440[55] = CFSTR("stateID");
  v440[56] = CFSTR("timestamp");
  objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v183, (uint64_t)self->_bucketEndTime, v184, v185);
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  v441[56] = v407;
  v440[57] = CFSTR("timestamp_Activated");
  timestamp_Activated_Succeeded = self->_timestamp_Activated_Succeeded;
  if (timestamp_Activated_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v186, (uint64_t)timestamp_Activated_Succeeded, v187, v188);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v186, 0, v187, v188);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  v441[57] = v406;
  v440[58] = CFSTR("timestamp_Allocated");
  timestamp_Allocated_Succeeded = self->_timestamp_Allocated_Succeeded;
  if (timestamp_Allocated_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v190, (uint64_t)timestamp_Allocated_Succeeded, v191, v192);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v190, 0, v191, v192);
  v405 = (void *)objc_claimAutoreleasedReturnValue();
  v441[58] = v405;
  v440[59] = CFSTR("timestamp_Deactivated");
  timestamp_Deactivated_Succeeded = self->_timestamp_Deactivated_Succeeded;
  if (timestamp_Deactivated_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v194, (uint64_t)timestamp_Deactivated_Succeeded, v195, v196);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v194, 0, v195, v196);
  v404 = (void *)objc_claimAutoreleasedReturnValue();
  v441[59] = v404;
  v440[60] = CFSTR("timestamp_PerformTask_Failed");
  timestamp_PerformTask_Failed = self->_timestamp_PerformTask_Failed;
  if (timestamp_PerformTask_Failed)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v198, (uint64_t)timestamp_PerformTask_Failed, v199, v200);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v198, 0, v199, v200);
  v403 = (void *)objc_claimAutoreleasedReturnValue();
  v441[60] = v403;
  v440[61] = CFSTR("timestamp_PerformTask_Succeeded");
  timestamp_PerformTask_Succeeded = self->_timestamp_PerformTask_Succeeded;
  if (timestamp_PerformTask_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v202, (uint64_t)timestamp_PerformTask_Succeeded, v203, v204);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v202, 0, v203, v204);
  v402 = (void *)objc_claimAutoreleasedReturnValue();
  v441[61] = v402;
  v440[62] = CFSTR("timestamp_Stop_Failed");
  timestamp_Stop_Failed = self->_timestamp_Stop_Failed;
  if (timestamp_Stop_Failed)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v206, (uint64_t)timestamp_Stop_Failed, v207, v208);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v206, 0, v207, v208);
  v401 = (void *)objc_claimAutoreleasedReturnValue();
  v441[62] = v401;
  v440[63] = CFSTR("timestamp_Stop_Succeeded");
  timestamp_Stop_Succeeded = self->_timestamp_Stop_Succeeded;
  if (timestamp_Stop_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v210, (uint64_t)timestamp_Stop_Succeeded, v211, v212);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v210, 0, v211, v212);
  v400 = (void *)objc_claimAutoreleasedReturnValue();
  v441[63] = v400;
  v440[64] = CFSTR("timestamp_TaskCompleted_Failed");
  timestamp_TaskCompleted_Failed = self->_timestamp_TaskCompleted_Failed;
  if (timestamp_TaskCompleted_Failed)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v214, (uint64_t)timestamp_TaskCompleted_Failed, v215, v216);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v214, 0, v215, v216);
  v399 = (void *)objc_claimAutoreleasedReturnValue();
  v441[64] = v399;
  v440[65] = CFSTR("timestamp_TaskCompleted_Succeeded");
  timestamp_TaskCompleted_Succeeded = self->_timestamp_TaskCompleted_Succeeded;
  if (timestamp_TaskCompleted_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v218, (uint64_t)timestamp_TaskCompleted_Succeeded, v219, v220);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v218, 0, v219, v220);
  v398 = (void *)objc_claimAutoreleasedReturnValue();
  v441[65] = v398;
  v440[66] = CFSTR("timestamp_TaskFetched_Failed");
  timestamp_TaskFetched_Failed = self->_timestamp_TaskFetched_Failed;
  if (timestamp_TaskFetched_Failed)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v222, (uint64_t)timestamp_TaskFetched_Failed, v223, v224);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v222, 0, v223, v224);
  v397 = (void *)objc_claimAutoreleasedReturnValue();
  v441[66] = v397;
  v440[67] = CFSTR("timestamp_TaskFetched_Succeeded");
  timestamp_TaskFetched_Succeeded = self->_timestamp_TaskFetched_Succeeded;
  if (timestamp_TaskFetched_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v226, (uint64_t)timestamp_TaskFetched_Succeeded, v227, v228);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v226, 0, v227, v228);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  v441[67] = v396;
  v440[68] = CFSTR("timestamp_TaskScheduled_Failed");
  timestamp_TaskScheduled_Failed = self->_timestamp_TaskScheduled_Failed;
  if (timestamp_TaskScheduled_Failed)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v230, (uint64_t)timestamp_TaskScheduled_Failed, v231, v232);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v230, 0, v231, v232);
  v395 = (void *)objc_claimAutoreleasedReturnValue();
  v441[68] = v395;
  v440[69] = CFSTR("timestamp_TaskScheduled_Succeeded");
  timestamp_TaskScheduled_Succeeded = self->_timestamp_TaskScheduled_Succeeded;
  if (timestamp_TaskScheduled_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v234, (uint64_t)timestamp_TaskScheduled_Succeeded, v235, v236);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v234, 0, v235, v236);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  v441[69] = v394;
  v440[70] = CFSTR("timestamp_DprivacydDonationReceived_Failed");
  timestamp_DprivacydDonationReceived_Failed = self->_timestamp_DprivacydDonationReceived_Failed;
  if (timestamp_DprivacydDonationReceived_Failed)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v238, (uint64_t)timestamp_DprivacydDonationReceived_Failed, v239, v240);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v238, 0, v239, v240);
  v393 = (void *)objc_claimAutoreleasedReturnValue();
  v441[70] = v393;
  v440[71] = CFSTR("timestamp_DprivacydDonationReceived_Succeeded");
  timestamp_DprivacydDonationReceived_Succeeded = self->_timestamp_DprivacydDonationReceived_Succeeded;
  if (timestamp_DprivacydDonationReceived_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v242, (uint64_t)timestamp_DprivacydDonationReceived_Succeeded, v243, v244);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v242, 0, v243, v244);
  v392 = (void *)objc_claimAutoreleasedReturnValue();
  v441[71] = v392;
  v440[72] = CFSTR("timestamp_DprivacydRandomization_Failed");
  timestamp_DprivacydRandomization_Failed = self->_timestamp_DprivacydRandomization_Failed;
  if (timestamp_DprivacydRandomization_Failed)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v246, (uint64_t)timestamp_DprivacydRandomization_Failed, v247, v248);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v246, 0, v247, v248);
  v390 = (void *)objc_claimAutoreleasedReturnValue();
  v441[72] = v390;
  v440[73] = CFSTR("timestamp_DprivacydRandomization_Succeeded");
  timestamp_DprivacydRandomization_Succeeded = self->_timestamp_DprivacydRandomization_Succeeded;
  if (timestamp_DprivacydRandomization_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v250, (uint64_t)timestamp_DprivacydRandomization_Succeeded, v251, v252);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v250, 0, v251, v252);
  v389 = (void *)objc_claimAutoreleasedReturnValue();
  v441[73] = v389;
  v440[74] = CFSTR("timestamp_DprivacydBudgetCheck_Failed");
  timestamp_DprivacydBudgetCheck_Failed = self->_timestamp_DprivacydBudgetCheck_Failed;
  if (timestamp_DprivacydBudgetCheck_Failed)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v254, (uint64_t)timestamp_DprivacydBudgetCheck_Failed, v255, v256);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v254, 0, v255, v256);
  v388 = (void *)objc_claimAutoreleasedReturnValue();
  v441[74] = v388;
  v440[75] = CFSTR("timestamp_DprivacydBudgetCheck_Succeeded");
  timestamp_DprivacydBudgetCheck_Succeeded = self->_timestamp_DprivacydBudgetCheck_Succeeded;
  if (timestamp_DprivacydBudgetCheck_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v258, (uint64_t)timestamp_DprivacydBudgetCheck_Succeeded, v259, v260);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v258, 0, v259, v260);
  v387 = (void *)objc_claimAutoreleasedReturnValue();
  v441[75] = v387;
  v440[76] = CFSTR("timestamp_DprivacydPayloadCreation_Failed");
  timestamp_DprivacydPayloadCreation_Failed = self->_timestamp_DprivacydPayloadCreation_Failed;
  if (timestamp_DprivacydPayloadCreation_Failed)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v262, (uint64_t)timestamp_DprivacydPayloadCreation_Failed, v263, v264);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v262, 0, v263, v264);
  v386 = (void *)objc_claimAutoreleasedReturnValue();
  v441[76] = v386;
  v440[77] = CFSTR("timestamp_DprivacydPayloadCreation_Succeeded");
  timestamp_DprivacydPayloadCreation_Succeeded = self->_timestamp_DprivacydPayloadCreation_Succeeded;
  if (timestamp_DprivacydPayloadCreation_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v266, (uint64_t)timestamp_DprivacydPayloadCreation_Succeeded, v267, v268);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v266, 0, v267, v268);
  v385 = (void *)objc_claimAutoreleasedReturnValue();
  v441[77] = v385;
  v440[78] = CFSTR("timestamp_DprivacydUpload_Failed");
  timestamp_DprivacydUpload_Failed = self->_timestamp_DprivacydUpload_Failed;
  if (timestamp_DprivacydUpload_Failed)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v270, (uint64_t)timestamp_DprivacydUpload_Failed, v271, v272);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v270, 0, v271, v272);
  v384 = (void *)objc_claimAutoreleasedReturnValue();
  v441[78] = v384;
  v440[79] = CFSTR("timestamp_DprivacydUpload_Succeeded");
  timestamp_DprivacydUpload_Succeeded = self->_timestamp_DprivacydUpload_Succeeded;
  v413 = v82;
  if (timestamp_DprivacydUpload_Succeeded)
    objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v274, (uint64_t)timestamp_DprivacydUpload_Succeeded, v275, v276);
  else
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v274, 0, v275, v276);
  v412 = v88;
  v383 = (void *)objc_claimAutoreleasedReturnValue();
  v441[79] = v383;
  v440[80] = CFSTR("trialIdentifiers_BMLTIdentifiers_trialDeploymentID");
  objc_msgSend_bmltIdentifiers(self->_trialIdentifiers, v278, v279, v280, v281);
  v382 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialDeploymentID(v382, v282, v283, v284, v285);
  v286 = objc_claimAutoreleasedReturnValue();
  v291 = (void *)v286;
  if (!v286)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v287, v288, v289, v290);
    v286 = objc_claimAutoreleasedReturnValue();
  }
  v417 = v60;
  v352 = (void *)v286;
  v441[80] = v286;
  v440[81] = CFSTR("trialIdentifiers_BMLTIdentifiers_trialTaskID");
  objc_msgSend_bmltIdentifiers(self->_trialIdentifiers, v287, v288, v289, v290);
  v381 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialTaskID(v381, v292, v293, v294, v295);
  v296 = objc_claimAutoreleasedReturnValue();
  v301 = (void *)v296;
  if (!v296)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v297, v298, v299, v300);
    v296 = objc_claimAutoreleasedReturnValue();
  }
  v410 = v100;
  v414 = v76;
  v351 = (void *)v296;
  v441[81] = v296;
  v440[82] = CFSTR("trialIdentifiers_experimentIdentifiers_trialDeploymentID");
  objc_msgSend_experimentIdentifiers(self->_trialIdentifiers, v297, v298, v299, v300);
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialDeploymentID(v380, v302, v303, v304, v305);
  v310 = (void *)objc_claimAutoreleasedReturnValue();
  v311 = v310;
  if (!v310)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v306, v307, v308, v309);
    v311 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v411 = v94;
  v424 = v7;
  v441[82] = v311;
  v440[83] = CFSTR("trialIdentifiers_experimentIdentifiers_trialExperimentID");
  objc_msgSend_experimentIdentifiers(self->_trialIdentifiers, v306, v307, v308, v309);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialExperimentID(v312, v313, v314, v315, v316);
  v321 = (void *)objc_claimAutoreleasedReturnValue();
  v322 = v321;
  if (!v321)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v317, v318, v319, v320);
    v322 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v441[83] = v322;
  v440[84] = CFSTR("trialIdentifiers_experimentIdentifiers_trialTreatmentID");
  objc_msgSend_experimentIdentifiers(self->_trialIdentifiers, v317, v318, v319, v320);
  v323 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialTreatmentID(v323, v324, v325, v326, v327);
  v332 = (void *)objc_claimAutoreleasedReturnValue();
  v333 = v332;
  if (!v332)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v328, v329, v330, v331);
    v333 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v441[84] = v333;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v328, (uint64_t)v441, (uint64_t)v440, 85);
  v391 = (id)objc_claimAutoreleasedReturnValue();
  if (!v332)

  if (!v321)
  if (!v310)

  if (!v301)
  if (!v291)

  if (!v409)
  v334 = v425;
  if (!v425)
  {

    v334 = 0;
  }

  v335 = v426;
  if (!v426)
  {

    v335 = 0;
  }

  v336 = v427;
  if (!v427)
  {

    v336 = 0;
  }

  v337 = v428;
  if (!v428)
  {

    v337 = 0;
  }

  v338 = v429;
  if (!v429)
  {

    v338 = 0;
  }

  v339 = v430;
  if (!v430)
  {

    v339 = 0;
  }

  v340 = v431;
  if (!v431)
  {

    v340 = 0;
  }

  v341 = v432;
  if (!v432)
  {

    v341 = 0;
  }

  v342 = v433;
  if (!v433)
  {

    v342 = 0;
  }

  v343 = v434;
  if (!v434)
  {

    v343 = 0;
  }

  v344 = v435;
  if (!v435)
  {

    v344 = 0;
  }

  v345 = v436;
  if (!v436)
  {

    v345 = 0;
  }

  v346 = v437;
  if (!v437)
  {

    v346 = 0;
  }

  v347 = v438;
  if (!v438)
  {

    v347 = 0;
  }

  v348 = v439;
  if (!v439)
  {

    v348 = 0;
  }

  if (!v410)
  if (!v411)

  if (!v412)
  if (!v413)

  if (!v414)
  if (!v415)

  if (!v416)
  if (!v417)

  if (!v418)
  if (!v421)

  if (!v422)
  v349 = v391;

  return v349;
}

- (BOOL)uploadToCoreAnalytics
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  char v8;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getDictionaryRepresentation(self, a2, v2, v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = LBFLogContextBitacoraStateInfo;
  if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_2402DE000, v6, OS_LOG_TYPE_INFO, "Emit CA Message %@", buf, 0xCu);
  }
  v10 = v5;
  v7 = v5;
  v8 = AnalyticsSendEventLazy();

  return v8;
}

- (id)maxTimedelta_To_State_Activated
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_Activated;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_Activated = self->_timedeltas_To_State_Activated;
  if (timedeltas_To_State_Activated)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_Activated, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_ActivatedFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_ActivatedFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_ActivatedFailed = self->_timedeltas_To_State_ActivatedFailed;
  if (timedeltas_To_State_ActivatedFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_ActivatedFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_Allocated
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_Allocated;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_Allocated = self->_timedeltas_To_State_Allocated;
  if (timedeltas_To_State_Allocated)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_Allocated, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_AllocatedFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_AllocatedFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_AllocatedFailed = self->_timedeltas_To_State_AllocatedFailed;
  if (timedeltas_To_State_AllocatedFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_AllocatedFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_Deativated
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_Deactivated;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_Deactivated = self->_timedeltas_To_State_Deactivated;
  if (timedeltas_To_State_Deactivated)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_Deactivated, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DeativatedFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DeactivatedFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DeactivatedFailed = self->_timedeltas_To_State_DeactivatedFailed;
  if (timedeltas_To_State_DeactivatedFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DeactivatedFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_PerformTaskFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_PerformTaskFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_PerformTaskFailed = self->_timedeltas_To_State_PerformTaskFailed;
  if (timedeltas_To_State_PerformTaskFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_PerformTaskFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_PerformTask
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_PerformTask;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_PerformTask = self->_timedeltas_To_State_PerformTask;
  if (timedeltas_To_State_PerformTask)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_PerformTask, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskCompleted
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_TaskCompleted;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_TaskCompleted = self->_timedeltas_To_State_TaskCompleted;
  if (timedeltas_To_State_TaskCompleted)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskCompleted, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskCompletedFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_TaskCompletedFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_TaskCompletedFailed = self->_timedeltas_To_State_TaskCompletedFailed;
  if (timedeltas_To_State_TaskCompletedFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskCompletedFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskFetched
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_TaskFetched;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_TaskFetched = self->_timedeltas_To_State_TaskFetched;
  if (timedeltas_To_State_TaskFetched)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskFetched, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskFetchedFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_TaskFetchedFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_TaskFetchedFailed = self->_timedeltas_To_State_TaskFetchedFailed;
  if (timedeltas_To_State_TaskFetchedFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskFetchedFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskScheduled
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_TaskScheduled;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_TaskScheduled = self->_timedeltas_To_State_TaskScheduled;
  if (timedeltas_To_State_TaskScheduled)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskScheduled, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_TaskScheduledFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_TaskScheduledFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_TaskScheduledFailed = self->_timedeltas_To_State_TaskScheduledFailed;
  if (timedeltas_To_State_TaskScheduledFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_TaskScheduledFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_Unexpeted
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_Unexpeted;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_Unexpeted = self->_timedeltas_To_State_Unexpeted;
  if (timedeltas_To_State_Unexpeted)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_Unexpeted, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydDonationReceived
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DprivacydDonationReceived;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DprivacydDonationReceived = self->_timedeltas_To_State_DprivacydDonationReceived;
  if (timedeltas_To_State_DprivacydDonationReceived)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydDonationReceived, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydDonationReceivedFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DprivacydDonationReceivedFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DprivacydDonationReceivedFailed = self->_timedeltas_To_State_DprivacydDonationReceivedFailed;
  if (timedeltas_To_State_DprivacydDonationReceivedFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydDonationReceivedFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydRandomization
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DprivacydRandomization;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DprivacydRandomization = self->_timedeltas_To_State_DprivacydRandomization;
  if (timedeltas_To_State_DprivacydRandomization)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydRandomization, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydRandomizationFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DprivacydRandomizationFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DprivacydRandomizationFailed = self->_timedeltas_To_State_DprivacydRandomizationFailed;
  if (timedeltas_To_State_DprivacydRandomizationFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydRandomizationFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydBudgetCheck
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DprivacydBudgetCheck;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DprivacydBudgetCheck = self->_timedeltas_To_State_DprivacydBudgetCheck;
  if (timedeltas_To_State_DprivacydBudgetCheck)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydBudgetCheck, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydBudgetCheckFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DprivacydBudgetCheckFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DprivacydBudgetCheckFailed = self->_timedeltas_To_State_DprivacydBudgetCheckFailed;
  if (timedeltas_To_State_DprivacydBudgetCheckFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydBudgetCheckFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydPayloadCreation
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DprivacydPayloadCreation;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DprivacydPayloadCreation = self->_timedeltas_To_State_DprivacydPayloadCreation;
  if (timedeltas_To_State_DprivacydPayloadCreation)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydPayloadCreation, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydPayloadCreationFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DprivacydPayloadCreationFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DprivacydPayloadCreationFailed = self->_timedeltas_To_State_DprivacydPayloadCreationFailed;
  if (timedeltas_To_State_DprivacydPayloadCreationFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydPayloadCreationFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydUpload
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DprivacydUpload;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DprivacydUpload = self->_timedeltas_To_State_DprivacydUpload;
  if (timedeltas_To_State_DprivacydUpload)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydUpload, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)maxTimedelta_To_State_DprivacydUploadFailed
{
  uint64_t v2;
  uint64_t v3;
  NSMutableArray *timedeltas_To_State_DprivacydUploadFailed;
  void *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  timedeltas_To_State_DprivacydUploadFailed = self->_timedeltas_To_State_DprivacydUploadFailed;
  if (timedeltas_To_State_DprivacydUploadFailed)
  {
    v5 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_valueForKeyPath_(timedeltas_To_State_DprivacydUploadFailed, a2, (uint64_t)CFSTR("@max.self"), v2, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_doubleValue(v6, v7, v8, v9, v10);
    objc_msgSend_numberWithLong_(v5, v12, (uint64_t)(v11 * 1000.0), v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

- (id)getPETState
{
  LIGHTHOUSE_BITACORA_PROTOBitacoraState *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  NSArray *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t i;
  void *v55;
  id v56;
  NSObject *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  int v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  int v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  int v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  int v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  int v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  int v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  int v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  int v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  id v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  int v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  int v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  int v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  int v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  int v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  int v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  void *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  void *v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  int v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  int v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  int v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  int v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  int v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  int v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  id v231;
  NSObject *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  void *v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers *v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  void *v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  void *v310;
  const char *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  void *v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  void *v331;
  const char *v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  const char *v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  void *v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  void *v349;
  const char *v350;
  uint64_t v351;
  uint64_t v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  void *v357;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  void *v362;
  const char *v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  void *v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  void *v383;
  const char *v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  void *v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  void *v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  void *v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  const char *v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  void *v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  void *v435;
  const char *v436;
  uint64_t v437;
  uint64_t v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  uint64_t v445;
  void *v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  void *v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  const char *v455;
  uint64_t v456;
  uint64_t v457;
  uint64_t v458;
  void *v459;
  const char *v460;
  uint64_t v461;
  uint64_t v462;
  uint64_t v463;
  void *v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  LBFBitacoraStateInfo *v469;
  uint64_t v470;
  LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers *v471;
  uint8_t buf[16];
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  _BYTE v477[128];
  uint64_t v478;

  v478 = *MEMORY[0x24BDAC8D0];
  v471 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOLighthouseLedgerTrialIdentifiers);
  v3 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOBitacoraState);
  v4 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_timeIntervalSince1970(self->_bucketEndTime, v5, v6, v7, v8);
  objc_msgSend_numberWithDouble_(v4, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v470 = objc_msgSend_longValue(v13, v14, v15, v16, v17);

  objc_msgSend_setCountTaskFetchedFailed_(v3, v18, 0, v19, v20);
  objc_msgSend_setCountTaskFetchedSucceeded_(v3, v21, 0, v22, v23);
  objc_msgSend_setCountTaskScheduledFailed_(v3, v24, 0, v25, v26);
  objc_msgSend_setCountTaskScheduledSucceeded_(v3, v27, 0, v28, v29);
  objc_msgSend_setCountTaskCompletedFailed_(v3, v30, 0, v31, v32);
  objc_msgSend_setCountTaskCompletedSucceeded_(v3, v33, 0, v34, v35);
  objc_msgSend_setCountPerformTaskFailed_(v3, v36, 0, v37, v38);
  objc_msgSend_setCountPerformTaskSucceeded_(v3, v39, 0, v40, v41);
  objc_msgSend_setCountStopFailed_(v3, v42, 0, v43, v44);
  objc_msgSend_setCountStopSucceeded_(v3, v45, 0, v46, v47);
  v475 = 0u;
  v476 = 0u;
  v473 = 0u;
  v474 = 0u;
  v469 = self;
  v48 = self->_bitacoraEvents;
  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v473, (uint64_t)v477, 16);
  if (v50)
  {
    v51 = v50;
    v52 = 0;
    v53 = *(_QWORD *)v474;
    do
    {
      for (i = 0; i != v51; ++i)
      {
        if (*(_QWORD *)v474 != v53)
          objc_enumerationMutation(v48);
        v55 = *(void **)(*((_QWORD *)&v473 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v56 = v55;
          v57 = LBFLogContextEventsHolder;
          if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2402DE000, v57, OS_LOG_TYPE_INFO, "Lighthouse Plugin Event.", buf, 2u);
          }
          objc_msgSend_performTrialTaskStatus(v56, v58, v59, v60, v61);
          v62 = (void *)objc_claimAutoreleasedReturnValue();

          if (v62)
          {
            objc_msgSend_performTrialTaskStatus(v56, v63, v64, v65, v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v72 = objc_msgSend_succeeded(v67, v68, v69, v70, v71);

            if (v72)
            {
              v77 = objc_msgSend_countPerformTaskSucceeded(v3, v73, v74, v75, v76);
              objc_msgSend_setCountPerformTaskSucceeded_(v3, v78, (v77 + 1), v79, v80);
            }
            else
            {
              v81 = objc_msgSend_countPerformTaskFailed(v3, v73, v74, v75, v76);
              objc_msgSend_setCountPerformTaskFailed_(v3, v82, (v81 + 1), v83, v84);
            }
          }
          objc_msgSend_performTaskStatus(v56, v63, v64, v65, v66);
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          if (v85)
          {
            objc_msgSend_performTaskStatus(v56, v86, v87, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = objc_msgSend_succeeded(v90, v91, v92, v93, v94);

            if (v95)
            {
              v100 = objc_msgSend_countPerformTaskSucceeded(v3, v96, v97, v98, v99);
              objc_msgSend_setCountPerformTaskSucceeded_(v3, v101, (v100 + 1), v102, v103);
            }
            else
            {
              v104 = objc_msgSend_countPerformTaskFailed(v3, v96, v97, v98, v99);
              objc_msgSend_setCountPerformTaskFailed_(v3, v105, (v104 + 1), v106, v107);
            }
          }
          objc_msgSend_stop(v56, v86, v87, v88, v89);
          v108 = (void *)objc_claimAutoreleasedReturnValue();

          if (v108)
          {
            objc_msgSend_stop(v56, v109, v110, v111, v112);
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            v118 = objc_msgSend_succeeded(v113, v114, v115, v116, v117);

            if (v118)
            {
              v123 = objc_msgSend_countStopSucceeded(v3, v119, v120, v121, v122);
              objc_msgSend_setCountStopSucceeded_(v3, v124, (v123 + 1), v125, v126);
            }
            else
            {
              v127 = objc_msgSend_countStopFailed(v3, v119, v120, v121, v122);
              objc_msgSend_setCountStopFailed_(v3, v128, (v127 + 1), v129, v130);
            }
          }
          objc_msgSend_trialIdentifiers(v56, v109, v110, v111, v112);
          v131 = objc_claimAutoreleasedReturnValue();

          v52 = (void *)v131;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v132 = v55;
          objc_msgSend_taskFetched(v132, v133, v134, v135, v136);
          v137 = (void *)objc_claimAutoreleasedReturnValue();

          if (v137)
          {
            objc_msgSend_taskFetched(v132, v138, v139, v140, v141);
            v142 = (void *)objc_claimAutoreleasedReturnValue();
            v147 = objc_msgSend_succeeded(v142, v143, v144, v145, v146);

            if (v147)
            {
              v152 = objc_msgSend_countTaskFetchedSucceeded(v3, v148, v149, v150, v151);
              objc_msgSend_setCountTaskFetchedSucceeded_(v3, v153, (v152 + 1), v154, v155);
            }
            else
            {
              v156 = objc_msgSend_countTaskFetchedFailed(v3, v148, v149, v150, v151);
              objc_msgSend_setCountTaskFetchedFailed_(v3, v157, (v156 + 1), v158, v159);
            }
          }
          objc_msgSend_taskCompleted(v132, v138, v139, v140, v141);
          v160 = (void *)objc_claimAutoreleasedReturnValue();

          if (v160)
          {
            objc_msgSend_taskCompleted(v132, v161, v162, v163, v164);
            v165 = (void *)objc_claimAutoreleasedReturnValue();
            v170 = objc_msgSend_succeeded(v165, v166, v167, v168, v169);

            if (v170)
            {
              v175 = objc_msgSend_countTaskCompletedSucceeded(v3, v171, v172, v173, v174);
              objc_msgSend_setCountTaskCompletedSucceeded_(v3, v176, (v175 + 1), v177, v178);
            }
            else
            {
              v179 = objc_msgSend_countTaskCompletedFailed(v3, v171, v172, v173, v174);
              objc_msgSend_setCountTaskCompletedFailed_(v3, v180, (v179 + 1), v181, v182);
            }
          }
          objc_msgSend_taskScheduled(v132, v161, v162, v163, v164);
          v183 = (void *)objc_claimAutoreleasedReturnValue();

          if (v183)
          {
            objc_msgSend_taskScheduled(v132, v184, v185, v186, v187);
            v188 = (void *)objc_claimAutoreleasedReturnValue();
            v193 = objc_msgSend_succeeded(v188, v189, v190, v191, v192);

            if (v193)
            {
              v198 = objc_msgSend_countTaskScheduledSucceeded(v3, v194, v195, v196, v197);
              objc_msgSend_setCountTaskScheduledSucceeded_(v3, v199, (v198 + 1), v200, v201);
            }
            else
            {
              v202 = objc_msgSend_countTaskScheduledFailed(v3, v194, v195, v196, v197);
              objc_msgSend_setCountTaskScheduledFailed_(v3, v203, (v202 + 1), v204, v205);
            }
          }
          objc_msgSend_activityScheduleStatus(v132, v184, v185, v186, v187);
          v206 = (void *)objc_claimAutoreleasedReturnValue();

          if (v206)
          {
            objc_msgSend_activityScheduleStatus(v132, v207, v208, v209, v210);
            v211 = (void *)objc_claimAutoreleasedReturnValue();
            v216 = objc_msgSend_scheduled(v211, v212, v213, v214, v215);

            if (v216)
            {
              v221 = objc_msgSend_countTaskScheduledSucceeded(v3, v217, v218, v219, v220);
              objc_msgSend_setCountTaskScheduledSucceeded_(v3, v222, (v221 + 1), v223, v224);
            }
            else
            {
              v225 = objc_msgSend_countTaskScheduledFailed(v3, v217, v218, v219, v220);
              objc_msgSend_setCountTaskScheduledFailed_(v3, v226, (v225 + 1), v227, v228);
            }
          }
          objc_msgSend_trialIdentifiers(v132, v207, v208, v209, v210);
          v229 = objc_claimAutoreleasedReturnValue();

          v52 = (void *)v229;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v231 = v55;
          v232 = LBFLogContextEventsHolder;
          if (os_log_type_enabled((os_log_t)LBFLogContextEventsHolder, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_2402DE000, v232, OS_LOG_TYPE_INFO, "Triald Event.", buf, 2u);
          }
          if (objc_msgSend_eventType(v231, v233, v234, v235, v236))
          {
            if (objc_msgSend_eventType(v231, v237, v238, v239, v240) == 2)
              objc_msgSend_setIsActivated_(v3, v241, 1, v243, v244);
            if (objc_msgSend_eventType(v231, v241, v242, v243, v244) == 1)
              objc_msgSend_setIsAllocated_(v3, v245, 1, v247, v248);
            if (objc_msgSend_eventType(v231, v245, v246, v247, v248) == 3)
              objc_msgSend_setIsActivated_(v3, v237, 0, v239, v240);
          }
          if (!v52)
          {
            objc_msgSend_trialIdentifiers(v231, v237, v238, v239, v240);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
          }

        }
      }
      v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v230, (uint64_t)&v473, (uint64_t)v477, 16);
    }
    while (v51);
  }
  else
  {
    v52 = 0;
  }

  if ((objc_msgSend_isActivated(v3, v249, v250, v251, v252) & 1) == 0)
    objc_msgSend_setIsActivated_(v3, v253, v469->_isActivated_implicit, v255, v256);
  if ((objc_msgSend_isAllocated(v3, v253, v254, v255, v256) & 1) == 0)
    objc_msgSend_setIsAllocated_(v3, v257, v469->_isAllocated_implicit, v259, v260);
  objc_msgSend_experimentIdentifiers(v52, v257, v258, v259, v260);
  v261 = (void *)objc_claimAutoreleasedReturnValue();

  if (v261)
  {
    v266 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOExperimentIdentifiers);
    objc_msgSend_setExperimentIdentifiers_(v471, v267, (uint64_t)v266, v268, v269);

    objc_msgSend_experimentIdentifiers(v52, v270, v271, v272, v273);
    v274 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTreatmentID(v274, v275, v276, v277, v278);
    v279 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v471, v280, v281, v282, v283);
    v284 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialTreatmentID_(v284, v285, (uint64_t)v279, v286, v287);

    objc_msgSend_experimentIdentifiers(v52, v288, v289, v290, v291);
    v292 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v292, v293, v294, v295, v296);
    v297 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v471, v298, v299, v300, v301);
    v302 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialDeploymentID_(v302, v303, (uint64_t)v297, v304, v305);

    objc_msgSend_experimentIdentifiers(v52, v306, v307, v308, v309);
    v310 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialExperimentID(v310, v311, v312, v313, v314);
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v471, v316, v317, v318, v319);
    v320 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialExperimentID_(v320, v321, (uint64_t)v315, v322, v323);

    objc_msgSend_setTrialIdentifierType_(v3, v324, 1, v325, v326);
    objc_msgSend_experimentIdentifiers(v52, v327, v328, v329, v330);
    v331 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTreatmentID(v331, v332, v333, v334, v335);
    v336 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialTreatmentID_(v3, v337, (uint64_t)v336, v338, v339);

    objc_msgSend_experimentIdentifiers(v52, v340, v341, v342, v343);
    v344 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v344, v345, v346, v347, v348);
    v349 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialDeploymentID_(v3, v350, (uint64_t)v349, v351, v352);

    objc_msgSend_experimentIdentifiers(v52, v353, v354, v355, v356);
    v357 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialExperimentID(v357, v358, v359, v360, v361);
    v362 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialExperimentID_(v3, v363, (uint64_t)v362, v364, v365);

  }
  objc_msgSend_bmltIdentifiers(v52, v262, v263, v264, v265);
  v366 = (void *)objc_claimAutoreleasedReturnValue();

  if (v366)
  {
    v370 = objc_alloc_init(LIGHTHOUSE_BITACORA_PROTOBMLTIdentifiers);
    objc_msgSend_setBmltIdentifiers_(v471, v371, (uint64_t)v370, v372, v373);

    objc_msgSend_bmltIdentifiers(v52, v374, v375, v376, v377);
    v378 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v378, v379, v380, v381, v382);
    v383 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bmltIdentifiers(v471, v384, v385, v386, v387);
    v388 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialDeploymentID_(v388, v389, (uint64_t)v383, v390, v391);

    objc_msgSend_bmltIdentifiers(v52, v392, v393, v394, v395);
    v396 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTaskID(v396, v397, v398, v399, v400);
    v401 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bmltIdentifiers(v471, v402, v403, v404, v405);
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialTaskID_(v406, v407, (uint64_t)v401, v408, v409);

    objc_msgSend_setTrialIdentifierType_(v3, v410, 2, v411, v412);
    objc_msgSend_bmltIdentifiers(v52, v413, v414, v415, v416);
    v417 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v417, v418, v419, v420, v421);
    v422 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialDeploymentID_(v3, v423, (uint64_t)v422, v424, v425);

    objc_msgSend_bmltIdentifiers(v52, v426, v427, v428, v429);
    v430 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTaskID(v430, v431, v432, v433, v434);
    v435 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTrialTaskID_(v3, v436, (uint64_t)v435, v437, v438);

  }
  objc_msgSend_setTrialIdentifiers_(v3, v367, (uint64_t)v471, v368, v369);
  objc_msgSend_setTimestamp_(v3, v439, v470, v440, v441);
  objc_msgSend_UUID(MEMORY[0x24BDD1880], v442, v443, v444, v445);
  v446 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v446, v447, v448, v449, v450);
  v451 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTelemetryID_(v3, v452, (uint64_t)v451, v453, v454);

  objc_msgSend_getContextId(LBFContextId, v455, v456, v457, v458);
  v459 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v459, v460, v461, v462, v463);
  v464 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setContextID_(v3, v465, (uint64_t)v464, v466, v467);

  return v3;
}

+ (id)getCAEventDictionaryFromBiomeEvent:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  void *v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  id v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  void *v258;
  const char *v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  void *v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  void *v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  void *v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  void *v303;
  const char *v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  const char *v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  void *v334;
  const char *v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  void *v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  void *v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  char v358;
  void *v359;
  void *v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  void *v366;
  const char *v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  void *v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  void *v386;
  void *v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  const char *v394;
  uint64_t v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  void *v401;
  const char *v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  const char *v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  uint64_t v411;
  void *v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  void *v417;
  const char *v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  uint64_t v422;
  const char *v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  void *v427;
  const char *v428;
  uint64_t v429;
  uint64_t v430;
  uint64_t v431;
  void *v432;
  uint64_t v433;
  const char *v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  const char *v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  const char *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  void *v447;
  const char *v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  const char *v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  void *v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  void *v461;
  const char *v462;
  uint64_t v463;
  uint64_t v464;
  uint64_t v465;
  void *v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  const char *v472;
  uint64_t v473;
  uint64_t v474;
  id v475;
  const char *v476;
  uint64_t v477;
  uint64_t v478;
  uint64_t v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  void *v484;
  const char *v485;
  uint64_t v486;
  uint64_t v487;
  uint64_t v488;
  void *v489;
  const char *v490;
  uint64_t v491;
  uint64_t v492;
  uint64_t v493;
  uint64_t v494;
  const char *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  void *v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  void *v504;
  const char *v505;
  uint64_t v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  const char *v510;
  uint64_t v511;
  uint64_t v512;
  uint64_t v513;
  void *v514;
  const char *v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  void *v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  uint64_t v524;
  const char *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  void *v529;
  const char *v530;
  uint64_t v531;
  uint64_t v532;
  uint64_t v533;
  void *v534;
  void *v535;
  const char *v536;
  uint64_t v537;
  uint64_t v538;
  uint64_t v539;
  uint64_t v540;
  const char *v541;
  uint64_t v542;
  uint64_t v543;
  uint64_t v544;
  void *v545;
  const char *v546;
  uint64_t v547;
  uint64_t v548;
  uint64_t v549;
  void *v550;
  const char *v551;
  uint64_t v552;
  uint64_t v553;
  uint64_t v554;
  uint64_t v555;
  const char *v556;
  uint64_t v557;
  uint64_t v558;
  uint64_t v559;
  unsigned int v560;
  void *v561;
  char *v562;
  uint64_t v563;
  uint64_t v564;
  uint64_t v565;
  const char *v566;
  uint64_t v567;
  uint64_t v568;
  uint64_t v569;
  id v570;
  const char *v571;
  uint64_t v572;
  uint64_t v573;
  uint64_t v574;
  uint64_t v575;
  const char *v576;
  uint64_t v577;
  uint64_t v578;
  uint64_t v579;
  void *v580;
  const char *v581;
  uint64_t v582;
  uint64_t v583;
  uint64_t v584;
  void *v585;
  const char *v586;
  uint64_t v587;
  uint64_t v588;
  uint64_t v589;
  uint64_t v590;
  const char *v591;
  uint64_t v592;
  uint64_t v593;
  uint64_t v594;
  void *v595;
  const char *v596;
  uint64_t v597;
  uint64_t v598;
  uint64_t v599;
  void *v600;
  const char *v601;
  uint64_t v602;
  uint64_t v603;
  uint64_t v604;
  uint64_t v605;
  const char *v606;
  uint64_t v607;
  uint64_t v608;
  uint64_t v609;
  void *v610;
  const char *v611;
  uint64_t v612;
  uint64_t v613;
  uint64_t v614;
  void *v615;
  const char *v616;
  uint64_t v617;
  uint64_t v618;
  uint64_t v619;
  uint64_t v620;
  const char *v621;
  uint64_t v622;
  uint64_t v623;
  uint64_t v624;
  void *v625;
  const char *v626;
  uint64_t v627;
  uint64_t v628;
  uint64_t v629;
  void *v630;
  const char *v631;
  uint64_t v632;
  uint64_t v633;
  uint64_t v634;
  uint64_t v635;
  const char *v636;
  uint64_t v637;
  uint64_t v638;
  uint64_t v639;
  void *v640;
  const char *v641;
  uint64_t v642;
  uint64_t v643;
  uint64_t v644;
  void *v645;
  const char *v646;
  uint64_t v647;
  uint64_t v648;
  uint64_t v649;
  const char *v650;
  uint64_t v651;
  uint64_t v652;
  uint64_t v653;
  void *v654;
  const char *v655;
  uint64_t v656;
  uint64_t v657;
  uint64_t v658;
  const char *v659;
  uint64_t v660;
  uint64_t v661;
  uint64_t v662;
  void *v663;
  uint64_t v664;
  const char *v665;
  uint64_t v666;
  uint64_t v667;
  uint64_t v668;
  uint64_t v669;
  const char *v670;
  uint64_t v671;
  uint64_t v672;
  uint64_t v673;
  const char *v674;
  uint64_t v675;
  uint64_t v676;
  uint64_t v677;
  void *v678;
  const char *v679;
  uint64_t v680;
  uint64_t v681;
  uint64_t v682;
  const char *v683;
  uint64_t v684;
  uint64_t v685;
  uint64_t v686;
  void *v687;
  void *v688;
  void *v689;
  void *v690;
  void *v691;
  void *v692;
  NSObject *v693;
  uint64_t v694;
  uint64_t v695;
  uint64_t v696;
  void *v697;
  uint64_t v698;
  const char *v699;
  uint64_t v700;
  uint64_t v701;
  uint64_t v702;
  uint64_t v703;
  const char *v704;
  uint64_t v705;
  uint64_t v706;
  const char *v707;
  uint64_t v708;
  uint64_t v709;
  uint64_t v710;
  void *v711;
  const char *v712;
  uint64_t v713;
  uint64_t v714;
  uint64_t v715;
  const char *v716;
  uint64_t v717;
  uint64_t v718;
  uint64_t v719;
  void *v720;
  uint64_t v721;
  const char *v722;
  uint64_t v723;
  uint64_t v724;
  uint64_t v725;
  uint64_t v726;
  const char *v727;
  uint64_t v728;
  uint64_t v729;
  const char *v730;
  uint64_t v731;
  uint64_t v732;
  uint64_t v733;
  void *v734;
  const char *v735;
  uint64_t v736;
  uint64_t v737;
  uint64_t v738;
  const char *v739;
  uint64_t v740;
  uint64_t v741;
  uint64_t v742;
  void *v743;
  uint64_t v744;
  const char *v745;
  uint64_t v746;
  uint64_t v747;
  uint64_t v748;
  uint64_t v749;
  const char *v750;
  uint64_t v751;
  uint64_t v752;
  const char *v753;
  uint64_t v754;
  uint64_t v755;
  uint64_t v756;
  void *v757;
  const char *v758;
  uint64_t v759;
  uint64_t v760;
  uint64_t v761;
  const char *v762;
  uint64_t v763;
  uint64_t v764;
  uint64_t v765;
  void *v766;
  uint64_t v767;
  const char *v768;
  uint64_t v769;
  uint64_t v770;
  uint64_t v771;
  uint64_t v772;
  const char *v773;
  uint64_t v774;
  uint64_t v775;
  const char *v776;
  uint64_t v777;
  uint64_t v778;
  uint64_t v779;
  void *v780;
  const char *v781;
  uint64_t v782;
  uint64_t v783;
  uint64_t v784;
  const char *v785;
  uint64_t v786;
  uint64_t v787;
  uint64_t v788;
  void *v789;
  const char *v790;
  uint64_t v791;
  uint64_t v792;
  uint64_t v793;
  const char *v794;
  uint64_t v795;
  uint64_t v796;
  const char *v797;
  uint64_t v798;
  uint64_t v799;
  const char *v800;
  uint64_t v801;
  uint64_t v802;
  uint64_t v803;
  uint64_t v804;
  uint64_t v805;
  uint64_t v806;
  uint64_t v807;
  uint64_t v808;
  uint64_t v809;
  uint64_t v810;
  uint64_t v811;
  uint64_t v812;
  uint64_t v813;
  uint64_t v814;
  uint64_t v815;
  uint64_t v816;
  uint64_t v817;
  uint64_t v818;
  uint64_t v819;
  uint64_t v820;
  uint64_t v821;
  uint64_t v822;
  uint64_t v823;
  uint64_t v824;
  uint64_t v825;
  uint64_t v826;
  uint64_t v827;
  uint64_t v828;
  uint64_t v829;
  uint64_t v830;
  uint64_t v831;
  uint64_t v832;
  void *v833;
  void *v834;
  const char *v835;
  uint64_t v836;
  uint64_t v837;
  uint64_t v838;
  const char *v839;
  uint64_t v840;
  uint64_t v841;
  uint64_t v842;
  void *v843;
  void *v844;
  void *v845;
  void *v846;
  void *v847;
  void *v848;
  void *v849;
  id v850;
  void *v852;
  const char *v853;
  uint64_t v854;
  uint64_t v855;
  uint64_t v856;
  const char *v857;
  uint64_t v858;
  uint64_t v859;
  const char *v860;
  uint64_t v861;
  uint64_t v862;
  const char *v863;
  uint64_t v864;
  uint64_t v865;
  void *v866;
  const char *v867;
  uint64_t v868;
  uint64_t v869;
  uint64_t v870;
  const char *v871;
  uint64_t v872;
  uint64_t v873;
  const char *v874;
  uint64_t v875;
  uint64_t v876;
  const char *v877;
  uint64_t v878;
  uint64_t v879;
  void *v880;
  const char *v881;
  uint64_t v882;
  uint64_t v883;
  uint64_t v884;
  const char *v885;
  uint64_t v886;
  uint64_t v887;
  const char *v888;
  uint64_t v889;
  uint64_t v890;
  const char *v891;
  uint64_t v892;
  uint64_t v893;
  void *v894;
  const char *v895;
  uint64_t v896;
  uint64_t v897;
  uint64_t v898;
  void *v899;
  const char *v900;
  uint64_t v901;
  uint64_t v902;
  const char *v903;
  uint64_t v904;
  uint64_t v905;
  const char *v906;
  uint64_t v907;
  uint64_t v908;
  void *v909;
  void *v910;
  void *v911;
  void *v912;
  void *v913;
  void *v914;
  void *v915;
  void *v916;
  void *v917;
  void *v918;
  void *v919;
  void *v920;
  void *v921;
  void *v922;
  void *v923;
  void *v924;
  void *v925;
  void *v926;
  void *v927;
  void *v928;
  void *v929;
  void *v930;
  void *v931;
  void *v932;
  void *v933;
  void *v934;
  void *v935;
  void *v936;
  void *v937;
  void *v938;
  id v939;
  void *v940;
  void *v941;
  uint64_t v942;
  void *v943;
  void *v944;
  void *v945;
  void *v946;
  void *v947;
  void *v948;
  void *v949;
  void *v950;
  void *v951;
  void *v952;
  void *v953;
  void *v954;
  void *v955;
  void *v956;
  void *v957;
  void *v958;
  void *v959;
  void *v960;
  void *v961;
  void *v962;
  void *v963;
  void *v964;
  uint64_t v965;
  uint64_t v966;
  void *v967;
  void *v968;
  void *v969;
  void *v970;
  void *v971;
  void *v972;
  void *v973;
  void *v974;
  void *v975;
  void *v976;
  void *v977;
  void *v978;
  void *v979;
  void *v980;
  void *v981;
  void *v982;
  void *v983;
  void *v984;
  void *v985;
  _QWORD v986[42];
  _QWORD v987[44];

  v987[42] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend_getContextId(LBFContextId, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v8, v9, v10, v11, v12);
  v955 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_UUID(MEMORY[0x24BDD1880], v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v17, v18, v19, v20, v21);
  v954 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v977 = 0;
    v978 = 0;
    v979 = 0;
    v980 = 0;
    v972 = 0;
    v973 = 0;
    v974 = 0;
    v975 = 0;
    v42 = 0;
    v983 = 0;
    v984 = 0;
    v985 = 0;
    v99 = 0;
    v976 = 0;
    v971 = 0;
    v27 = 0;
    v128 = &unk_25109D678;
    goto LABEL_22;
  }
  v22 = v3;
  objc_msgSend_timestamp(v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialIdentifiers(v22, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bmltIdentifiers(v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialDeploymentID(v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_trialIdentifiers(v22, v43, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bmltIdentifiers(v47, v48, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialTaskID(v52, v53, v54, v55, v56);
  v983 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_trialIdentifiers(v22, v57, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_experimentIdentifiers(v61, v62, v63, v64, v65);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialDeploymentID(v66, v67, v68, v69, v70);
  v984 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_trialIdentifiers(v22, v71, v72, v73, v74);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_experimentIdentifiers(v75, v76, v77, v78, v79);
  v80 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialExperimentID(v80, v81, v82, v83, v84);
  v985 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_trialIdentifiers(v22, v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_experimentIdentifiers(v89, v90, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialTreatmentID(v94, v95, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_taskFetched(v22, v100, v101, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  if (v104)
  {
    v109 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_taskFetched(v22, v105, v106, v107, v108);
    v110 = objc_claimAutoreleasedReturnValue();
    v115 = objc_msgSend_succeeded((void *)v110, v111, v112, v113, v114);
    objc_msgSend_numberWithBool_(v109, v116, v115, v117, v118);
    v980 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_taskFetched(v22, v119, v120, v121, v122);
    v123 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v110) = objc_msgSend_succeeded(v123, v124, v125, v126, v127);

    if ((v110 & 1) != 0)
    {
      v978 = 0;
      v979 = 0;
    }
    else
    {
      objc_msgSend_taskFetched(v22, v105, v106, v107, v108);
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDomain(v129, v130, v131, v132, v133);
      v979 = (void *)objc_claimAutoreleasedReturnValue();

      v134 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_taskFetched(v22, v135, v136, v137, v138);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v144 = objc_msgSend_errorCode(v139, v140, v141, v142, v143);
      objc_msgSend_stringWithFormat_(v134, v145, (uint64_t)CFSTR("%d"), v146, v147, v144);
      v978 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v978 = 0;
    v979 = 0;
    v980 = 0;
  }
  objc_msgSend_taskCompleted(v22, v105, v106, v107, v108);
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v148)
  {
    v977 = 0;
    goto LABEL_12;
  }
  v153 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend_taskCompleted(v22, v149, v150, v151, v152);
  v154 = objc_claimAutoreleasedReturnValue();
  v159 = objc_msgSend_succeeded((void *)v154, v155, v156, v157, v158);
  objc_msgSend_numberWithBool_(v153, v160, v159, v161, v162);
  v977 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_taskCompleted(v22, v163, v164, v165, v166);
  v167 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v154) = objc_msgSend_succeeded(v167, v168, v169, v170, v171);

  if ((v154 & 1) != 0)
  {
LABEL_12:
    v975 = 0;
    v976 = 0;
    goto LABEL_13;
  }
  objc_msgSend_taskCompleted(v22, v149, v150, v151, v152);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_errorDomain(v172, v173, v174, v175, v176);
  v976 = (void *)objc_claimAutoreleasedReturnValue();

  v177 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend_taskCompleted(v22, v178, v179, v180, v181);
  v182 = (void *)objc_claimAutoreleasedReturnValue();
  v187 = objc_msgSend_errorCode(v182, v183, v184, v185, v186);
  objc_msgSend_stringWithFormat_(v177, v188, (uint64_t)CFSTR("%d"), v189, v190, v187);
  v975 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  objc_msgSend_taskScheduled(v22, v149, v150, v151, v152);
  v191 = (void *)objc_claimAutoreleasedReturnValue();

  if (v191)
  {
    v196 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_taskScheduled(v22, v192, v193, v194, v195);
    v197 = objc_claimAutoreleasedReturnValue();
    v202 = objc_msgSend_succeeded((void *)v197, v198, v199, v200, v201);
    objc_msgSend_numberWithBool_(v196, v203, v202, v204, v205);
    v974 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_taskScheduled(v22, v206, v207, v208, v209);
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v197) = objc_msgSend_succeeded(v210, v211, v212, v213, v214);

    if ((v197 & 1) != 0)
    {
      v972 = 0;
      v973 = 0;
    }
    else
    {
      objc_msgSend_taskScheduled(v22, v192, v193, v194, v195);
      v215 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDomain(v215, v216, v217, v218, v219);
      v973 = (void *)objc_claimAutoreleasedReturnValue();

      v220 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_taskScheduled(v22, v221, v222, v223, v224);
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      v230 = objc_msgSend_errorCode(v225, v226, v227, v228, v229);
      objc_msgSend_stringWithFormat_(v220, v231, (uint64_t)CFSTR("%d"), v232, v233, v230);
      v972 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v972 = 0;
    v973 = 0;
    v974 = 0;
  }
  objc_msgSend_activityScheduleStatus(v22, v192, v193, v194, v195);
  v234 = (void *)objc_claimAutoreleasedReturnValue();

  if (v234)
  {
    v239 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_activityScheduleStatus(v22, v235, v236, v237, v238);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    v245 = objc_msgSend_scheduled(v240, v241, v242, v243, v244);
    objc_msgSend_numberWithBool_(v239, v246, v245, v247, v248);
    v971 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v971 = 0;
  }

  v128 = &unk_25109D6A8;
LABEL_22:
  objc_opt_class();
  v956 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v249 = v3;
    objc_msgSend_timestamp(v249, v250, v251, v252, v253);
    v965 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v249, v254, v255, v256, v257);
    v258 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bmltIdentifiers(v258, v259, v260, v261, v262);
    v263 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v263, v264, v265, v266, v267);
    v268 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v249, v269, v270, v271, v272);
    v273 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bmltIdentifiers(v273, v274, v275, v276, v277);
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTaskID(v278, v279, v280, v281, v282);
    v283 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v249, v284, v285, v286, v287);
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v288, v289, v290, v291, v292);
    v293 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v293, v294, v295, v296, v297);
    v298 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v249, v299, v300, v301, v302);
    v303 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v303, v304, v305, v306, v307);
    v308 = v99;
    v309 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialExperimentID(v309, v310, v311, v312, v313);
    v314 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v249, v315, v316, v317, v318);
    v319 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v319, v320, v321, v322, v323);
    v324 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTreatmentID(v324, v325, v326, v327, v328);
    v329 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_performTaskStatus(v249, v330, v331, v332, v333);
    v334 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v334)
      goto LABEL_25;
    v339 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend_performTaskStatus(v249, v335, v336, v337, v338);
    v340 = (void *)objc_claimAutoreleasedReturnValue();
    v345 = objc_msgSend_succeeded(v340, v341, v342, v343, v344);
    objc_msgSend_numberWithBool_(v339, v346, v345, v347, v348);
    v334 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_performTaskStatus(v249, v349, v350, v351, v352);
    v353 = (void *)objc_claimAutoreleasedReturnValue();
    v358 = objc_msgSend_succeeded(v353, v354, v355, v356, v357);

    if ((v358 & 1) == 0)
    {
      objc_msgSend_performTaskStatus(v249, v335, v336, v337, v338);
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_errorDomain(v361, v362, v363, v364, v365);
      v981 = (void *)objc_claimAutoreleasedReturnValue();

      v366 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend_performTaskStatus(v249, v367, v368, v369, v370);
      v371 = (void *)objc_claimAutoreleasedReturnValue();
      v376 = objc_msgSend_errorCode(v371, v372, v373, v374, v375);
      objc_msgSend_stringWithFormat_(v366, v377, (uint64_t)CFSTR("%d"), v378, v379, v376);
      v380 = objc_claimAutoreleasedReturnValue();

      v359 = (void *)v380;
    }
    else
    {
LABEL_25:
      v359 = 0;
      v981 = 0;
    }
    objc_msgSend_performTrialTaskStatus(v249, v335, v336, v337, v338);
    v381 = (void *)objc_claimAutoreleasedReturnValue();

    if (v381)
    {
      v386 = v359;
      v387 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_performTrialTaskStatus(v249, v382, v383, v384, v385);
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      v393 = objc_msgSend_succeeded(v388, v389, v390, v391, v392);
      objc_msgSend_numberWithBool_(v387, v394, v393, v395, v396);
      v970 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_performTrialTaskStatus(v249, v397, v398, v399, v400);
      v401 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v387) = objc_msgSend_succeeded(v401, v402, v403, v404, v405);

      if ((v387 & 1) != 0)
      {
        v359 = v386;
      }
      else
      {
        objc_msgSend_performTrialTaskStatus(v249, v382, v383, v384, v385);
        v406 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDomain(v406, v407, v408, v409, v410);
        v411 = objc_claimAutoreleasedReturnValue();

        v412 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_performTrialTaskStatus(v249, v413, v414, v415, v416);
        v417 = (void *)objc_claimAutoreleasedReturnValue();
        v422 = objc_msgSend_errorCode(v417, v418, v419, v420, v421);
        objc_msgSend_stringWithFormat_(v412, v423, (uint64_t)CFSTR("%d"), v424, v425, v422);
        v426 = objc_claimAutoreleasedReturnValue();

        v359 = (void *)v426;
        v981 = (void *)v411;
      }
    }
    else
    {
      v970 = v334;
    }
    objc_msgSend_stop(v249, v382, v383, v384, v385);
    v427 = (void *)objc_claimAutoreleasedReturnValue();

    if (v427)
    {
      v432 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend_stop(v249, v428, v429, v430, v431);
      v433 = objc_claimAutoreleasedReturnValue();
      v438 = objc_msgSend_succeeded((void *)v433, v434, v435, v436, v437);
      objc_msgSend_numberWithBool_(v432, v439, v438, v440, v441);
      v442 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_stop(v249, v443, v444, v445, v446);
      v447 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v433) = objc_msgSend_succeeded(v447, v448, v449, v450, v451);

      if ((v433 & 1) != 0)
      {
        v968 = 0;
        v969 = 0;
      }
      else
      {
        objc_msgSend_stop(v249, v452, v453, v454, v455);
        v456 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorDomain(v456, v457, v458, v459, v460);
        v969 = (void *)objc_claimAutoreleasedReturnValue();

        v461 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend_stop(v249, v462, v463, v464, v465);
        v466 = (void *)objc_claimAutoreleasedReturnValue();
        v471 = objc_msgSend_errorCode(v466, v467, v468, v469, v470);
        objc_msgSend_stringWithFormat_(v461, v472, (uint64_t)CFSTR("%d"), v473, v474, v471);
        v968 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v360 = (void *)v442;
    }
    else
    {
      v968 = 0;
      v969 = 0;
      v360 = 0;
    }

    v982 = (void *)v268;
    v983 = (void *)v283;
    v984 = (void *)v298;
    v985 = (void *)v314;
    v99 = (void *)v329;
    v27 = (void *)v965;
    v128 = &unk_25109D6C0;
    v3 = v956;
  }
  else
  {
    v982 = v42;
    v359 = 0;
    v981 = 0;
    v969 = 0;
    v970 = 0;
    v968 = 0;
    v360 = 0;
  }
  objc_opt_class();
  v944 = v360;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v475 = v3;
    objc_msgSend_timestamp(v475, v476, v477, v478, v479);
    v966 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v475, v480, v481, v482, v483);
    v484 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bmltIdentifiers(v484, v485, v486, v487, v488);
    v489 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v489, v490, v491, v492, v493);
    v494 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v475, v495, v496, v497, v498);
    v499 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bmltIdentifiers(v499, v500, v501, v502, v503);
    v504 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTaskID(v504, v505, v506, v507, v508);
    v509 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v475, v510, v511, v512, v513);
    v514 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v514, v515, v516, v517, v518);
    v519 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v519, v520, v521, v522, v523);
    v524 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v475, v525, v526, v527, v528);
    v529 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v529, v530, v531, v532, v533);
    v534 = v99;
    v535 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialExperimentID(v535, v536, v537, v538, v539);
    v540 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v475, v541, v542, v543, v544);
    v545 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v545, v546, v547, v548, v549);
    v550 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTreatmentID(v550, v551, v552, v553, v554);
    v555 = objc_claimAutoreleasedReturnValue();

    v560 = objc_msgSend_eventType(v475, v556, v557, v558, v559) - 1;
    if (v560 >= 3)
    {
      v562 = (char *)(id)LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)v562, OS_LOG_TYPE_ERROR))
        sub_2403149D8(v475, v562, v563, v564, v565);

      v561 = &unk_25109D678;
    }
    else
    {
      v561 = (void *)qword_2510952E8[v560];
    }
    v953 = v561;
    v360 = v944;

    v982 = (void *)v494;
    v983 = (void *)v509;
    v984 = (void *)v524;
    v985 = (void *)v540;
    v99 = (void *)v555;
    v27 = (void *)v966;
    v128 = &unk_25109D690;
    v3 = v956;
  }
  else
  {
    v953 = 0;
  }
  objc_opt_class();
  v945 = v359;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v570 = v3;
    objc_msgSend_timestamp(v570, v571, v572, v573, v574);
    v575 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v570, v576, v577, v578, v579);
    v580 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bmltIdentifiers(v580, v581, v582, v583, v584);
    v585 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v585, v586, v587, v588, v589);
    v590 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v570, v591, v592, v593, v594);
    v595 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_bmltIdentifiers(v595, v596, v597, v598, v599);
    v600 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTaskID(v600, v601, v602, v603, v604);
    v605 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v570, v606, v607, v608, v609);
    v610 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v610, v611, v612, v613, v614);
    v615 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v615, v616, v617, v618, v619);
    v620 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v570, v621, v622, v623, v624);
    v625 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v625, v626, v627, v628, v629);
    v630 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialExperimentID(v630, v631, v632, v633, v634);
    v635 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(v570, v636, v637, v638, v639);
    v640 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v640, v641, v642, v643, v644);
    v645 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTreatmentID(v645, v646, v647, v648, v649);
    v942 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_event(v570, v650, v651, v652, v653);
    v654 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v645) = objc_msgSend_phase(v654, v655, v656, v657, v658);

    v949 = (void *)v620;
    v951 = (void *)v605;
    v947 = (void *)v635;
    switch((int)v645)
    {
      case 1:
        v27 = (void *)v575;
        v663 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_event(v570, v659, v660, v661, v662);
        v664 = objc_claimAutoreleasedReturnValue();
        v669 = objc_msgSend_succeeded((void *)v664, v665, v666, v667, v668);
        objc_msgSend_numberWithBool_(v663, v670, v669, v671, v672);
        v673 = objc_claimAutoreleasedReturnValue();

        objc_msgSend_event(v570, v674, v675, v676, v677);
        v678 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v664) = objc_msgSend_succeeded(v678, v679, v680, v681, v682);

        v687 = (void *)v590;
        if ((v664 & 1) != 0)
        {
          v688 = 0;
        }
        else
        {
          objc_msgSend_event(v570, v683, v684, v685, v686);
          v789 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_errorMessage(v789, v790, v791, v792, v793);
          v688 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend_localizedCaseInsensitiveContainsString_(v688, v794, (uint64_t)CFSTR(";"),
                               v795,
                               v796))
          {
            objc_msgSend_componentsSeparatedByString_(v688, v797, (uint64_t)CFSTR(";"), v798, v799);
            v693 = objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v693, v800, 0, v801, v802);
            v964 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_56;
          }
        }
        v964 = 0;
        v967 = 0;
        goto LABEL_72;
      case 2:
        v687 = (void *)v590;
        v697 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_event(v570, v659, v660, v661, v662);
        v698 = objc_claimAutoreleasedReturnValue();
        v703 = objc_msgSend_succeeded((void *)v698, v699, v700, v701, v702);
        objc_msgSend_numberWithBool_(v697, v704, v703, v705, v706);
        v967 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_event(v570, v707, v708, v709, v710);
        v711 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v698) = objc_msgSend_succeeded(v711, v712, v713, v714, v715);

        v27 = (void *)v575;
        if ((v698 & 1) != 0)
        {
          v673 = 0;
          v688 = 0;
          v964 = 0;
LABEL_72:
          v690 = 0;
          goto LABEL_73;
        }
        objc_msgSend_event(v570, v716, v717, v718, v719);
        v852 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorMessage(v852, v853, v854, v855, v856);
        v690 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend_localizedCaseInsensitiveContainsString_(v690, v857, (uint64_t)CFSTR(";"),
                              v858,
                              v859))
        {
          v673 = 0;
          v688 = 0;
          v964 = 0;
LABEL_73:
          v961 = 0;
          v963 = 0;
          goto LABEL_74;
        }
        objc_msgSend_componentsSeparatedByString_(v690, v860, (uint64_t)CFSTR(";"), v861, v862);
        v693 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v693, v863, 0, v864, v865);
        v961 = (void *)objc_claimAutoreleasedReturnValue();
        v673 = 0;
        v688 = 0;
        v964 = 0;
LABEL_57:
        v963 = 0;
        v691 = 0;
        v959 = 0;
        goto LABEL_58;
      case 3:
        v720 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_event(v570, v659, v660, v661, v662);
        v721 = objc_claimAutoreleasedReturnValue();
        v726 = objc_msgSend_succeeded((void *)v721, v722, v723, v724, v725);
        objc_msgSend_numberWithBool_(v720, v727, v726, v728, v729);
        v963 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_event(v570, v730, v731, v732, v733);
        v734 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v721) = objc_msgSend_succeeded(v734, v735, v736, v737, v738);

        v687 = (void *)v590;
        v27 = (void *)v575;
        if ((v721 & 1) != 0)
        {
          v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
LABEL_74:
          v691 = 0;
          goto LABEL_75;
        }
        objc_msgSend_event(v570, v739, v740, v741, v742);
        v866 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorMessage(v866, v867, v868, v869, v870);
        v691 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend_localizedCaseInsensitiveContainsString_(v691, v871, (uint64_t)CFSTR(";"),
                              v872,
                              v873))
        {
          v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
LABEL_75:
          v959 = 0;
          v962 = 0;
          goto LABEL_76;
        }
        objc_msgSend_componentsSeparatedByString_(v691, v874, (uint64_t)CFSTR(";"), v875, v876);
        v693 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v693, v877, 0, v878, v879);
        v959 = (void *)objc_claimAutoreleasedReturnValue();
        v673 = 0;
        v688 = 0;
        v964 = 0;
        v967 = 0;
        v690 = 0;
        v961 = 0;
LABEL_58:
        v962 = 0;
        v692 = 0;
        v958 = 0;
        goto LABEL_59;
      case 4:
        v743 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_event(v570, v659, v660, v661, v662);
        v744 = objc_claimAutoreleasedReturnValue();
        v749 = objc_msgSend_succeeded((void *)v744, v745, v746, v747, v748);
        objc_msgSend_numberWithBool_(v743, v750, v749, v751, v752);
        v962 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_event(v570, v753, v754, v755, v756);
        v757 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v744) = objc_msgSend_succeeded(v757, v758, v759, v760, v761);

        v687 = (void *)v590;
        v27 = (void *)v575;
        if ((v744 & 1) != 0)
        {
          v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
          v963 = 0;
          v691 = 0;
          v959 = 0;
LABEL_76:
          v692 = 0;
          goto LABEL_77;
        }
        objc_msgSend_event(v570, v762, v763, v764, v765);
        v880 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorMessage(v880, v881, v882, v883, v884);
        v692 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend_localizedCaseInsensitiveContainsString_(v692, v885, (uint64_t)CFSTR(";"),
                              v886,
                              v887))
        {
          v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
          v963 = 0;
          v691 = 0;
          v959 = 0;
LABEL_77:
          v958 = 0;
          v960 = 0;
          goto LABEL_78;
        }
        objc_msgSend_componentsSeparatedByString_(v692, v888, (uint64_t)CFSTR(";"), v889, v890);
        v693 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v693, v891, 0, v892, v893);
        v958 = (void *)objc_claimAutoreleasedReturnValue();
        v959 = 0;
        v673 = 0;
        v688 = 0;
        v964 = 0;
        v967 = 0;
        v690 = 0;
        v961 = 0;
        v963 = 0;
        v691 = 0;
LABEL_59:
        v960 = 0;
        v946 = 0;
        v957 = 0;
        goto LABEL_60;
      case 5:
        v766 = (void *)MEMORY[0x24BDD16E0];
        objc_msgSend_event(v570, v659, v660, v661, v662);
        v767 = objc_claimAutoreleasedReturnValue();
        v772 = objc_msgSend_succeeded((void *)v767, v768, v769, v770, v771);
        objc_msgSend_numberWithBool_(v766, v773, v772, v774, v775);
        v960 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_event(v570, v776, v777, v778, v779);
        v780 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v767) = objc_msgSend_succeeded(v780, v781, v782, v783, v784);

        v687 = (void *)v590;
        v27 = (void *)v575;
        if ((v767 & 1) != 0)
        {
          v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
          v962 = 0;
          v963 = 0;
          v691 = 0;
          v958 = 0;
          v959 = 0;
          v692 = 0;
LABEL_78:
          v946 = 0;
          goto LABEL_79;
        }
        objc_msgSend_event(v570, v785, v786, v787, v788);
        v894 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorMessage(v894, v895, v896, v897, v898);
        v899 = (void *)objc_claimAutoreleasedReturnValue();

        v946 = v899;
        if (!objc_msgSend_localizedCaseInsensitiveContainsString_(v899, v900, (uint64_t)CFSTR(";"),
                              v901,
                              v902))
        {
          v673 = 0;
          v688 = 0;
          v964 = 0;
          v967 = 0;
          v690 = 0;
          v961 = 0;
          v962 = 0;
          v963 = 0;
          v691 = 0;
          v958 = 0;
          v959 = 0;
          v692 = 0;
LABEL_79:
          v957 = 0;
          goto LABEL_80;
        }
        objc_msgSend_componentsSeparatedByString_(v899, v903, (uint64_t)CFSTR(";"), v904, v905);
        v693 = objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v693, v906, 0, v907, v908);
        v957 = (void *)objc_claimAutoreleasedReturnValue();
        v958 = 0;
        v673 = 0;
        v688 = 0;
        v964 = 0;
        v967 = 0;
        v690 = 0;
        v961 = 0;
        v962 = 0;
        v963 = 0;
        v691 = 0;
        v959 = 0;
        v692 = 0;
LABEL_60:

LABEL_80:
        v982 = v687;
        v983 = v951;
        v984 = v949;
        v985 = v947;
        v689 = (void *)v942;
        v128 = &unk_25109D6D8;
        v359 = v945;
        break;
      default:
        v687 = (void *)v590;
        v27 = (void *)v575;
        v693 = (id)LBFLogContextBitacoraStateInfo;
        if (os_log_type_enabled(v693, OS_LOG_TYPE_ERROR))
          sub_240314948(v570, (char *)v693, v694, v695, v696);
        v673 = 0;
        v688 = 0;
        v964 = 0;
LABEL_56:
        v967 = 0;
        v690 = 0;
        v961 = 0;
        goto LABEL_57;
    }
  }
  else
  {
    v689 = v99;
    v673 = 0;
    v688 = 0;
    v964 = 0;
    v967 = 0;
    v690 = 0;
    v961 = 0;
    v962 = 0;
    v963 = 0;
    v691 = 0;
    v958 = 0;
    v959 = 0;
    v692 = 0;
    v960 = 0;
    v946 = 0;
    v957 = 0;
  }
  v986[0] = CFSTR("contextId");
  v986[1] = CFSTR("event_donator");
  v987[0] = v955;
  v987[1] = v128;
  v987[2] = v954;
  v803 = (uint64_t)v359;
  v986[2] = CFSTR("eventId");
  v986[3] = CFSTR("lighthouseplugin_performTaskStatus_errorCode");
  if (!v359)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v803 = objc_claimAutoreleasedReturnValue();
  }
  v938 = (void *)v803;
  v987[3] = v803;
  v986[4] = CFSTR("lighthouseplugin_performTaskStatus_errorDomain");
  v804 = (uint64_t)v981;
  if (!v981)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v804 = objc_claimAutoreleasedReturnValue();
  }
  v937 = (void *)v804;
  v987[4] = v804;
  v986[5] = CFSTR("lighthouseplugin_performTaskStatus_succeeded");
  v805 = (uint64_t)v970;
  if (!v970)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v805 = objc_claimAutoreleasedReturnValue();
  }
  v936 = (void *)v805;
  v987[5] = v805;
  v986[6] = CFSTR("lighthouseplugin_stop_errorCode");
  v806 = (uint64_t)v968;
  if (!v968)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v806 = objc_claimAutoreleasedReturnValue();
  }
  v935 = (void *)v806;
  v987[6] = v806;
  v986[7] = CFSTR("lighthouseplugin_stop_errorDomain");
  v807 = (uint64_t)v969;
  if (!v969)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v807 = objc_claimAutoreleasedReturnValue();
  }
  v934 = (void *)v807;
  v987[7] = v807;
  v986[8] = CFSTR("lighthouseplugin_stop_succeeded");
  v808 = (uint64_t)v360;
  if (!v360)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v808 = objc_claimAutoreleasedReturnValue();
  }
  v933 = (void *)v808;
  v987[8] = v808;
  v986[9] = CFSTR("mlruntimed_activityScheduleStatus_scheduled");
  v809 = (uint64_t)v971;
  if (!v971)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v809 = objc_claimAutoreleasedReturnValue();
  }
  v932 = (void *)v809;
  v987[9] = v809;
  v986[10] = CFSTR("mlruntimed_taskCompleted_errorCode");
  v810 = (uint64_t)v975;
  if (!v975)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v810 = objc_claimAutoreleasedReturnValue();
  }
  v931 = (void *)v810;
  v987[10] = v810;
  v986[11] = CFSTR("mlruntimed_taskCompleted_errorDomain");
  v811 = (uint64_t)v976;
  if (!v976)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v811 = objc_claimAutoreleasedReturnValue();
  }
  v930 = (void *)v811;
  v987[11] = v811;
  v986[12] = CFSTR("mlruntimed_taskCompleted_succeeded");
  v812 = (uint64_t)v977;
  if (!v977)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v812 = objc_claimAutoreleasedReturnValue();
  }
  v929 = (void *)v812;
  v987[12] = v812;
  v986[13] = CFSTR("mlruntimed_taskFetched_errorCode");
  v813 = (uint64_t)v978;
  if (!v978)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v813 = objc_claimAutoreleasedReturnValue();
  }
  v928 = (void *)v813;
  v987[13] = v813;
  v986[14] = CFSTR("mlruntimed_taskFetched_errorDomain");
  v814 = (uint64_t)v979;
  if (!v979)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v814 = objc_claimAutoreleasedReturnValue();
  }
  v927 = (void *)v814;
  v987[14] = v814;
  v986[15] = CFSTR("mlruntimed_taskFetched_succeeded");
  v815 = (uint64_t)v980;
  if (!v980)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v815 = objc_claimAutoreleasedReturnValue();
  }
  v926 = (void *)v815;
  v987[15] = v815;
  v986[16] = CFSTR("mlruntimed_taskScheduled_errorCode");
  v816 = (uint64_t)v972;
  if (!v972)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v816 = objc_claimAutoreleasedReturnValue();
  }
  v925 = (void *)v816;
  v987[16] = v816;
  v986[17] = CFSTR("mlruntimed_taskScheduled_errorDomain");
  v817 = (uint64_t)v973;
  if (!v973)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v817 = objc_claimAutoreleasedReturnValue();
  }
  v924 = (void *)v817;
  v987[17] = v817;
  v986[18] = CFSTR("mlruntimed_taskScheduled_succeeded");
  v818 = (uint64_t)v974;
  if (!v974)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v818 = objc_claimAutoreleasedReturnValue();
  }
  v923 = (void *)v818;
  v987[18] = v818;
  v986[19] = CFSTR("dprivacyd_donationReceived_succeeded");
  v819 = v673;
  if (!v673)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v819 = objc_claimAutoreleasedReturnValue();
  }
  v922 = (void *)v819;
  v987[19] = v819;
  v986[20] = CFSTR("dprivacyd_donationReceived_errorMessage");
  v820 = (uint64_t)v688;
  if (!v688)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v820 = objc_claimAutoreleasedReturnValue();
  }
  v921 = (void *)v820;
  v987[20] = v820;
  v986[21] = CFSTR("dprivacyd_donationReceived_errorCode");
  v821 = (uint64_t)v964;
  if (!v964)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v821 = objc_claimAutoreleasedReturnValue();
  }
  v920 = (void *)v821;
  v987[21] = v821;
  v986[22] = CFSTR("dprivacyd_randomization_succeeded");
  v822 = (uint64_t)v967;
  if (!v967)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v822 = objc_claimAutoreleasedReturnValue();
  }
  v919 = (void *)v822;
  v987[22] = v822;
  v986[23] = CFSTR("dprivacyd_randomization_errorMessage");
  v823 = (uint64_t)v690;
  if (!v690)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v823 = objc_claimAutoreleasedReturnValue();
  }
  v918 = (void *)v823;
  v987[23] = v823;
  v986[24] = CFSTR("dprivacyd_randomization_errorCode");
  v824 = (uint64_t)v961;
  if (!v961)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v824 = objc_claimAutoreleasedReturnValue();
  }
  v917 = (void *)v824;
  v987[24] = v824;
  v986[25] = CFSTR("dprivacyd_budgetCheck_succeeded");
  v825 = (uint64_t)v963;
  if (!v963)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v825 = objc_claimAutoreleasedReturnValue();
  }
  v916 = (void *)v825;
  v987[25] = v825;
  v986[26] = CFSTR("dprivacyd_budgetCheck_errorMessage");
  v826 = (uint64_t)v691;
  if (!v691)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v826 = objc_claimAutoreleasedReturnValue();
  }
  v915 = (void *)v826;
  v987[26] = v826;
  v986[27] = CFSTR("dprivacyd_budgetCheck_errorCode");
  v827 = (uint64_t)v959;
  if (!v959)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v827 = objc_claimAutoreleasedReturnValue();
  }
  v914 = (void *)v827;
  v987[27] = v827;
  v986[28] = CFSTR("dprivacyd_payloadCreation_succeeded");
  v828 = (uint64_t)v962;
  if (!v962)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v828 = objc_claimAutoreleasedReturnValue();
  }
  v913 = (void *)v828;
  v987[28] = v828;
  v986[29] = CFSTR("dprivacyd_payloadCreation_errorMessage");
  v829 = (uint64_t)v692;
  if (!v692)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v829 = objc_claimAutoreleasedReturnValue();
  }
  v912 = (void *)v829;
  v987[29] = v829;
  v986[30] = CFSTR("dprivacyd_payloadCreation_errorCode");
  v830 = (uint64_t)v958;
  if (!v958)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v830 = objc_claimAutoreleasedReturnValue();
  }
  v911 = (void *)v830;
  v987[30] = v830;
  v986[31] = CFSTR("dprivacyd_upload_succeeded");
  v831 = (uint64_t)v960;
  if (!v960)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v831 = objc_claimAutoreleasedReturnValue();
  }
  v950 = v691;
  v940 = v688;
  v910 = (void *)v831;
  v987[31] = v831;
  v986[32] = CFSTR("dprivacyd_upload_errorMessage");
  v832 = (uint64_t)v946;
  if (!v946)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v832 = objc_claimAutoreleasedReturnValue();
  }
  v952 = v690;
  v941 = (void *)v673;
  v909 = (void *)v832;
  v987[32] = v832;
  v986[33] = CFSTR("dprivacyd_upload_errorCode");
  v833 = v957;
  if (!v957)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v566, v567, v568, v569);
    v833 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v987[33] = v833;
  v986[34] = CFSTR("timestamp");
  v943 = v27;
  objc_msgSend_dateToTimestampStringInMSec_(LBFUtils, v566, (uint64_t)v27, v568, v569);
  v834 = (void *)objc_claimAutoreleasedReturnValue();
  v987[34] = v834;
  v986[35] = CFSTR("triald_eventSucceeded");
  objc_msgSend_null(MEMORY[0x24BDBCEF8], v835, v836, v837, v838);
  v843 = (void *)objc_claimAutoreleasedReturnValue();
  v987[35] = v843;
  v986[36] = CFSTR("triald_eventType");
  v844 = v953;
  if (!v953)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v839, v840, v841, v842);
    v844 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v987[36] = v844;
  v986[37] = CFSTR("trialIdentifiers_BMLTIdentifiers_trialDeploymentID");
  v845 = v982;
  if (!v982)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v839, v840, v841, v842);
    v845 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v987[37] = v845;
  v986[38] = CFSTR("trialIdentifiers_BMLTIdentifiers_trialTaskID");
  v846 = v983;
  if (!v983)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v839, v840, v841, v842);
    v846 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v987[38] = v846;
  v986[39] = CFSTR("trialIdentifiers_experimentIdentifiers_trialDeploymentID");
  v847 = v984;
  if (!v984)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v839, v840, v841, v842);
    v847 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v948 = v692;
  v987[39] = v847;
  v986[40] = CFSTR("trialIdentifiers_experimentIdentifiers_trialExperimentID");
  v848 = v985;
  if (!v985)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v839, v840, v841, v842);
    v848 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v987[40] = v848;
  v986[41] = CFSTR("trialIdentifiers_experimentIdentifiers_trialTreatmentID");
  v849 = v689;
  if (!v689)
  {
    objc_msgSend_null(MEMORY[0x24BDBCEF8], v839, v840, v841, v842);
    v849 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v987[41] = v849;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x24BDBCE70], v839, (uint64_t)v987, (uint64_t)v986, 42);
  v939 = (id)objc_claimAutoreleasedReturnValue();
  if (!v689)

  if (!v985)
  if (!v984)

  if (!v983)
  if (!v982)

  if (!v953)
  if (!v957)

  if (!v946)
  if (!v960)

  if (!v958)
  if (!v948)

  if (!v962)
  if (!v959)

  if (!v950)
  if (!v963)

  if (!v961)
  if (!v952)

  if (!v967)
  if (v964)
  {
    if (v940)
      goto LABEL_193;
LABEL_224:

    if (v941)
      goto LABEL_194;
    goto LABEL_225;
  }

  if (!v940)
    goto LABEL_224;
LABEL_193:
  if (v941)
    goto LABEL_194;
LABEL_225:

LABEL_194:
  if (!v974)

  if (!v973)
  if (!v972)

  if (!v980)
  if (!v979)

  if (!v978)
  if (!v977)

  if (!v976)
  if (!v975)

  if (v971)
  {
    if (v944)
      goto LABEL_214;
  }
  else
  {

    if (v944)
      goto LABEL_214;
  }

LABEL_214:
  if (!v969)

  if (!v968)
  if (!v970)

  if (!v981)
  {

    if (v945)
      goto LABEL_222;
LABEL_229:

    goto LABEL_222;
  }
  if (!v945)
    goto LABEL_229;
LABEL_222:
  v850 = v939;

  return v850;
}

- (BOOL)uploadRawEventsToCoreAnalytics
{
  NSArray *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = self->_bitacoraEvents;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v4)
  {
    v8 = v4;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v2);
        objc_msgSend_getCAEventDictionaryFromBiomeEvent_(LBFBitacoraStateInfo, v5, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v6, v7);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v13;
        AnalyticsSendEventLazy();

      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v8);
  }

  return 1;
}

- (BOOL)uploadToDedisco
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  void *v74;
  id v75;
  const char *v76;
  NSObject *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  NSObject *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  id v96;
  NSObject *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  uint64_t v106;
  id v107;
  NSObject *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  BOOL v115;
  void *v116;
  NSObject *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v126;
  void *v127;
  id v128;
  id v129;
  id v130;
  uint64_t v131;
  uint64_t *v132;
  uint64_t v133;
  uint64_t v134;
  __int128 buf;
  Class (*v136)(uint64_t);
  void *v137;
  uint64_t *v138;
  uint64_t v139;

  v139 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_getDictionaryRepresentation(self, a2, v2, v3, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_trialIdentifiers(self, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_experimentIdentifiers(v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = LBFLogContextBitacoraStateInfo;
  if (v16)
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v6;
      _os_log_impl(&dword_2402DE000, v17, OS_LOG_TYPE_INFO, "Dedisco CA Input Dictionary: %@", (uint8_t *)&buf, 0xCu);
    }
    objc_msgSend_trialIdentifiers(self, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialExperimentID(v27, v28, v29, v30, v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(self, v33, v34, v35, v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialDeploymentID(v42, v43, v44, v45, v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_trialIdentifiers(self, v48, v49, v50, v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_experimentIdentifiers(v52, v53, v54, v55, v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trialTreatmentID(v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v63, (uint64_t)CFSTR("fedstats:com.apple.insights.telemetry:dprivacyd:%@:%@:%@"), v64, v65, v32, v47, v62);
    v127 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v66, (uint64_t)CFSTR("fedstats:com.apple.insights.telemetry:plugin_success:%@:%@:%@"), v67, v68, v32, v47, v62);
    v126 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringWithFormat_(MEMORY[0x24BDD17C8], v69, (uint64_t)CFSTR("fedstats:com.apple.insights.telemetry:plugin_success_time_deltas:%@:%@:%@"), v70, v71, v32, v47, v62);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = LBFLogContextBitacoraStateInfo;
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_2402DE000, v73, OS_LOG_TYPE_INFO, "Uploading to Fedstats.", (uint8_t *)&buf, 2u);
    }
    v131 = 0;
    v132 = &v131;
    v133 = 0x2050000000;
    v74 = (void *)qword_256FF5740;
    v134 = qword_256FF5740;
    if (!qword_256FF5740)
    {
      *(_QWORD *)&buf = MEMORY[0x24BDAC760];
      *((_QWORD *)&buf + 1) = 3221225472;
      v136 = sub_2402F0FD0;
      v137 = &unk_2510951B8;
      v138 = &v131;
      sub_2402F0FD0((uint64_t)&buf);
      v74 = (void *)v132[3];
    }
    v75 = objc_retainAutorelease(v74);
    _Block_object_dispose(&v131, 8);
    if (!v75)
    {
      v77 = LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_DEBUG))
        sub_240314DF4(v77, (uint64_t)v76, v78, v79, v80, v81, v82, v83);
    }
    v130 = 0;
    v84 = objc_msgSend_encodeDataAndRecord_dataTypeContent_baseKey_errorOut_(v75, v76, (uint64_t)v6, (uint64_t)&unk_25109E518, (uint64_t)v127, &v130);
    v85 = v130;
    v86 = LBFLogContextBitacoraStateInfo;
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_DEBUG))
      sub_240314D78(v84, v86, v88, v89, v90, v91, v92, v93);
    if (v85)
    {
      v94 = (void *)LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
        sub_240314CE4(v94, v85);
    }
    v129 = v85;
    v95 = objc_msgSend_encodeDataAndRecord_dataTypeContent_baseKey_errorOut_(v75, v87, (uint64_t)v6, (uint64_t)&unk_25109E6F8, (uint64_t)v126, &v129);
    v96 = v129;

    v97 = LBFLogContextBitacoraStateInfo;
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_DEBUG))
      sub_240314C68(v95, v97, v99, v100, v101, v102, v103, v104);
    if (v96)
    {
      v105 = (void *)LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
        sub_240314BD4(v105, v96);
    }
    v128 = v96;
    v106 = objc_msgSend_encodeDataAndRecord_dataTypeContent_baseKey_errorOut_(v75, v98, (uint64_t)v6, (uint64_t)&unk_25109E8D8, (uint64_t)v72, &v128);
    v107 = v128;

    v108 = LBFLogContextBitacoraStateInfo;
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_DEBUG))
      sub_240314B58(v106, v108, v109, v110, v111, v112, v113, v114);
    v115 = v107 == 0;
    if (v107)
    {
      v116 = (void *)LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
        sub_240314AC4(v116, v107);
      v117 = LBFLogContextBitacoraStateInfo;
      if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_DEBUG))
        sub_240314A94(v117, v118, v119, v120, v121, v122, v123, v124);
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)LBFLogContextBitacoraStateInfo, OS_LOG_TYPE_ERROR))
      sub_240314A58(v17);
    v115 = 0;
  }

  return v115;
}

- (id)addMLHostMarkerToString:(id)a3
{
  return (id)((uint64_t (*)(id, char *, const __CFString *))MEMORY[0x24BEDD108])(a3, sel_stringByAppendingString_, CFSTR("_MLHost"));
}

- (NSString)stateId
{
  return self->_stateId;
}

- (BMLighthouseLedgerTrialIdentifiers)trialIdentifiers
{
  return self->_trialIdentifiers;
}

- (NSUUID)contextId
{
  return self->_contextId;
}

- (NSDate)bucketStartTime
{
  return self->_bucketStartTime;
}

- (NSDate)bucketEndTime
{
  return self->_bucketEndTime;
}

- (int64_t)latestState
{
  return self->_latestState;
}

- (void)setLatestState:(int64_t)a3
{
  self->_latestState = a3;
}

- (NSMutableArray)timedeltas_To_State_Allocated
{
  return self->_timedeltas_To_State_Allocated;
}

- (NSMutableArray)timedeltas_To_State_Activated
{
  return self->_timedeltas_To_State_Activated;
}

- (NSMutableArray)timedeltas_To_State_Deactivated
{
  return self->_timedeltas_To_State_Deactivated;
}

- (NSMutableArray)timedeltas_To_State_TaskFetched
{
  return self->_timedeltas_To_State_TaskFetched;
}

- (NSMutableArray)timedeltas_To_State_TaskScheduled
{
  return self->_timedeltas_To_State_TaskScheduled;
}

- (NSMutableArray)timedeltas_To_State_TaskCompleted
{
  return self->_timedeltas_To_State_TaskCompleted;
}

- (NSMutableArray)timedeltas_To_State_PerformTask
{
  return self->_timedeltas_To_State_PerformTask;
}

- (NSMutableArray)timedeltas_To_State_PluginStop
{
  return self->_timedeltas_To_State_PluginStop;
}

- (NSMutableArray)timedeltas_To_State_Unexpeted
{
  return self->_timedeltas_To_State_Unexpeted;
}

- (NSMutableArray)timedeltas_To_State_DprivacydDonationReceived
{
  return self->_timedeltas_To_State_DprivacydDonationReceived;
}

- (NSMutableArray)timedeltas_To_State_DprivacydRandomization
{
  return self->_timedeltas_To_State_DprivacydRandomization;
}

- (NSMutableArray)timedeltas_To_State_DprivacydBudgetCheck
{
  return self->_timedeltas_To_State_DprivacydBudgetCheck;
}

- (NSMutableArray)timedeltas_To_State_DprivacydPayloadCreation
{
  return self->_timedeltas_To_State_DprivacydPayloadCreation;
}

- (NSMutableArray)timedeltas_To_State_DprivacydUpload
{
  return self->_timedeltas_To_State_DprivacydUpload;
}

- (NSMutableArray)timedeltas_To_State_AllocatedFailed
{
  return self->_timedeltas_To_State_AllocatedFailed;
}

- (NSMutableArray)timedeltas_To_State_ActivatedFailed
{
  return self->_timedeltas_To_State_ActivatedFailed;
}

- (NSMutableArray)timedeltas_To_State_DeactivatedFailed
{
  return self->_timedeltas_To_State_DeactivatedFailed;
}

- (NSMutableArray)timedeltas_To_State_TaskFetchedFailed
{
  return self->_timedeltas_To_State_TaskFetchedFailed;
}

- (NSMutableArray)timedeltas_To_State_TaskScheduledFailed
{
  return self->_timedeltas_To_State_TaskScheduledFailed;
}

- (NSMutableArray)timedeltas_To_State_TaskCompletedFailed
{
  return self->_timedeltas_To_State_TaskCompletedFailed;
}

- (NSMutableArray)timedeltas_To_State_PerformTaskFailed
{
  return self->_timedeltas_To_State_PerformTaskFailed;
}

- (NSMutableArray)timedeltas_To_State_PluginStopFailed
{
  return self->_timedeltas_To_State_PluginStopFailed;
}

- (NSMutableArray)timedeltas_To_State_DprivacydDonationReceivedFailed
{
  return self->_timedeltas_To_State_DprivacydDonationReceivedFailed;
}

- (NSMutableArray)timedeltas_To_State_DprivacydRandomizationFailed
{
  return self->_timedeltas_To_State_DprivacydRandomizationFailed;
}

- (NSMutableArray)timedeltas_To_State_DprivacydBudgetCheckFailed
{
  return self->_timedeltas_To_State_DprivacydBudgetCheckFailed;
}

- (NSMutableArray)timedeltas_To_State_DprivacydPayloadCreationFailed
{
  return self->_timedeltas_To_State_DprivacydPayloadCreationFailed;
}

- (NSMutableArray)timedeltas_To_State_DprivacydUploadFailed
{
  return self->_timedeltas_To_State_DprivacydUploadFailed;
}

- (NSNumber)isAllocated
{
  return self->_isAllocated;
}

- (NSNumber)isActivated
{
  return self->_isActivated;
}

- (BOOL)isAllocated_implicit
{
  return self->_isAllocated_implicit;
}

- (void)setIsAllocated_implicit:(BOOL)a3
{
  self->_isAllocated_implicit = a3;
}

- (BOOL)isActivated_implicit
{
  return self->_isActivated_implicit;
}

- (void)setIsActivated_implicit:(BOOL)a3
{
  self->_isActivated_implicit = a3;
}

- (NSNumber)count_Allocated_Succeeded
{
  return self->_count_Allocated_Succeeded;
}

- (NSNumber)count_Allocated_Failed
{
  return self->_count_Allocated_Failed;
}

- (NSNumber)count_Activated_Succeeded
{
  return self->_count_Activated_Succeeded;
}

- (NSNumber)count_Activated_Failed
{
  return self->_count_Activated_Failed;
}

- (NSNumber)count_Deactivated_Succeeded
{
  return self->_count_Deactivated_Succeeded;
}

- (NSNumber)count_Deactivated_Failed
{
  return self->_count_Deactivated_Failed;
}

- (NSNumber)count_TaskFetched_Succeeded
{
  return self->_count_TaskFetched_Succeeded;
}

- (NSNumber)count_TaskFetched_Failed
{
  return self->_count_TaskFetched_Failed;
}

- (NSNumber)count_TaskScheduled_Succeeded
{
  return self->_count_TaskScheduled_Succeeded;
}

- (NSNumber)count_TaskScheduled_Failed
{
  return self->_count_TaskScheduled_Failed;
}

- (NSNumber)count_TaskCompleted_Succeeded
{
  return self->_count_TaskCompleted_Succeeded;
}

- (NSNumber)count_TaskCompleted_Failed
{
  return self->_count_TaskCompleted_Failed;
}

- (NSNumber)count_PerformTask_Succeeded
{
  return self->_count_PerformTask_Succeeded;
}

- (NSNumber)count_PerformTask_Failed
{
  return self->_count_PerformTask_Failed;
}

- (NSNumber)count_Stop_Succeeded
{
  return self->_count_Stop_Succeeded;
}

- (NSNumber)count_Stop_Failed
{
  return self->_count_Stop_Failed;
}

- (NSNumber)count_DprivacydDonationReceived_Succeeded
{
  return self->_count_DprivacydDonationReceived_Succeeded;
}

- (NSNumber)count_DprivacydDonationReceived_Failed
{
  return self->_count_DprivacydDonationReceived_Failed;
}

- (NSNumber)count_DprivacydRandomization_Succeeded
{
  return self->_count_DprivacydRandomization_Succeeded;
}

- (NSNumber)count_DprivacydRandomization_Failed
{
  return self->_count_DprivacydRandomization_Failed;
}

- (NSNumber)count_DprivacydBudgetCheck_Succeeded
{
  return self->_count_DprivacydBudgetCheck_Succeeded;
}

- (NSNumber)count_DprivacydBudgetCheck_Failed
{
  return self->_count_DprivacydBudgetCheck_Failed;
}

- (NSNumber)count_DprivacydPayloadCreation_Succeeded
{
  return self->_count_DprivacydPayloadCreation_Succeeded;
}

- (NSNumber)count_DprivacydPayloadCreation_Failed
{
  return self->_count_DprivacydPayloadCreation_Failed;
}

- (NSNumber)count_DprivacydUpload_Succeeded
{
  return self->_count_DprivacydUpload_Succeeded;
}

- (NSNumber)count_DprivacydUpload_Failed
{
  return self->_count_DprivacydUpload_Failed;
}

- (NSDate)timestamp_Allocated_Succeeded
{
  return self->_timestamp_Allocated_Succeeded;
}

- (NSDate)timestamp_Allocated_Failed
{
  return self->_timestamp_Allocated_Failed;
}

- (NSDate)timestamp_Activated_Succeeded
{
  return self->_timestamp_Activated_Succeeded;
}

- (NSDate)timestamp_Activated_Failed
{
  return self->_timestamp_Activated_Failed;
}

- (NSDate)timestamp_Deactivated_Succeeded
{
  return self->_timestamp_Deactivated_Succeeded;
}

- (NSDate)timestamp_Deactivated_Failed
{
  return self->_timestamp_Deactivated_Failed;
}

- (NSDate)timestamp_TaskFetched_Succeeded
{
  return self->_timestamp_TaskFetched_Succeeded;
}

- (NSDate)timestamp_TaskFetched_Failed
{
  return self->_timestamp_TaskFetched_Failed;
}

- (NSDate)timestamp_TaskScheduled_Succeeded
{
  return self->_timestamp_TaskScheduled_Succeeded;
}

- (NSDate)timestamp_TaskScheduled_Failed
{
  return self->_timestamp_TaskScheduled_Failed;
}

- (NSDate)timestamp_TaskCompleted_Succeeded
{
  return self->_timestamp_TaskCompleted_Succeeded;
}

- (NSDate)timestamp_TaskCompleted_Failed
{
  return self->_timestamp_TaskCompleted_Failed;
}

- (NSDate)timestamp_PerformTask_Succeeded
{
  return self->_timestamp_PerformTask_Succeeded;
}

- (NSDate)timestamp_PerformTask_Failed
{
  return self->_timestamp_PerformTask_Failed;
}

- (NSDate)timestamp_Stop_Succeeded
{
  return self->_timestamp_Stop_Succeeded;
}

- (NSDate)timestamp_Stop_Failed
{
  return self->_timestamp_Stop_Failed;
}

- (NSDate)timestamp_DprivacydDonationReceived_Succeeded
{
  return self->_timestamp_DprivacydDonationReceived_Succeeded;
}

- (NSDate)timestamp_DprivacydDonationReceived_Failed
{
  return self->_timestamp_DprivacydDonationReceived_Failed;
}

- (NSDate)timestamp_DprivacydRandomization_Succeeded
{
  return self->_timestamp_DprivacydRandomization_Succeeded;
}

- (NSDate)timestamp_DprivacydRandomization_Failed
{
  return self->_timestamp_DprivacydRandomization_Failed;
}

- (NSDate)timestamp_DprivacydBudgetCheck_Succeeded
{
  return self->_timestamp_DprivacydBudgetCheck_Succeeded;
}

- (NSDate)timestamp_DprivacydBudgetCheck_Failed
{
  return self->_timestamp_DprivacydBudgetCheck_Failed;
}

- (NSDate)timestamp_DprivacydPayloadCreation_Succeeded
{
  return self->_timestamp_DprivacydPayloadCreation_Succeeded;
}

- (NSDate)timestamp_DprivacydPayloadCreation_Failed
{
  return self->_timestamp_DprivacydPayloadCreation_Failed;
}

- (NSDate)timestamp_DprivacydUpload_Succeeded
{
  return self->_timestamp_DprivacydUpload_Succeeded;
}

- (NSDate)timestamp_DprivacydUpload_Failed
{
  return self->_timestamp_DprivacydUpload_Failed;
}

- (NSArray)bitacoraStateTransitions
{
  return self->_bitacoraStateTransitions;
}

- (NSArray)bitacoraEvents
{
  return self->_bitacoraEvents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bitacoraEvents, 0);
  objc_storeStrong((id *)&self->_bitacoraStateTransitions, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydUpload_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydUpload_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydPayloadCreation_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydPayloadCreation_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydBudgetCheck_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydBudgetCheck_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydRandomization_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydRandomization_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydDonationReceived_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_DprivacydDonationReceived_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_Stop_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_Stop_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_PerformTask_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_PerformTask_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskCompleted_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskCompleted_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskScheduled_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskScheduled_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskFetched_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_TaskFetched_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_Deactivated_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_Deactivated_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_Activated_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_Activated_Succeeded, 0);
  objc_storeStrong((id *)&self->_timestamp_Allocated_Failed, 0);
  objc_storeStrong((id *)&self->_timestamp_Allocated_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_DprivacydUpload_Failed, 0);
  objc_storeStrong((id *)&self->_count_DprivacydUpload_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_DprivacydPayloadCreation_Failed, 0);
  objc_storeStrong((id *)&self->_count_DprivacydPayloadCreation_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_DprivacydBudgetCheck_Failed, 0);
  objc_storeStrong((id *)&self->_count_DprivacydBudgetCheck_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_DprivacydRandomization_Failed, 0);
  objc_storeStrong((id *)&self->_count_DprivacydRandomization_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_DprivacydDonationReceived_Failed, 0);
  objc_storeStrong((id *)&self->_count_DprivacydDonationReceived_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_Stop_Failed, 0);
  objc_storeStrong((id *)&self->_count_Stop_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_PerformTask_Failed, 0);
  objc_storeStrong((id *)&self->_count_PerformTask_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_TaskCompleted_Failed, 0);
  objc_storeStrong((id *)&self->_count_TaskCompleted_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_TaskScheduled_Failed, 0);
  objc_storeStrong((id *)&self->_count_TaskScheduled_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_TaskFetched_Failed, 0);
  objc_storeStrong((id *)&self->_count_TaskFetched_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_Deactivated_Failed, 0);
  objc_storeStrong((id *)&self->_count_Deactivated_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_Activated_Failed, 0);
  objc_storeStrong((id *)&self->_count_Activated_Succeeded, 0);
  objc_storeStrong((id *)&self->_count_Allocated_Failed, 0);
  objc_storeStrong((id *)&self->_count_Allocated_Succeeded, 0);
  objc_storeStrong((id *)&self->_isActivated, 0);
  objc_storeStrong((id *)&self->_isAllocated, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydUploadFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydPayloadCreationFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydBudgetCheckFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydRandomizationFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydDonationReceivedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_PluginStopFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_PerformTaskFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskCompletedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskScheduledFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskFetchedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DeactivatedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_ActivatedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_AllocatedFailed, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydUpload, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydPayloadCreation, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydBudgetCheck, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydRandomization, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_DprivacydDonationReceived, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_Unexpeted, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_PluginStop, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_PerformTask, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskCompleted, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskScheduled, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_TaskFetched, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_Deactivated, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_Activated, 0);
  objc_storeStrong((id *)&self->_timedeltas_To_State_Allocated, 0);
  objc_storeStrong((id *)&self->_bucketEndTime, 0);
  objc_storeStrong((id *)&self->_bucketStartTime, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
  objc_storeStrong((id *)&self->_trialIdentifiers, 0);
  objc_storeStrong((id *)&self->_stateId, 0);
}

@end
