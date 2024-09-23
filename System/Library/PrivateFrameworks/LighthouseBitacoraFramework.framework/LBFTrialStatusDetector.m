@implementation LBFTrialStatusDetector

- (LBFTrialStatusDetector)init
{
  LBFTrialStatusDetector *v2;
  LBFTrialStatusDetector *v3;
  NSDictionary *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t i;
  void *v44;
  const char *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
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
  id v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
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
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  id v116;
  const char *v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  LBFObservedTrialStatus *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  int v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  char v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  NSObject *v213;
  const char *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  void *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  void *v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  void *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  id v288;
  const char *v289;
  uint64_t v290;
  void *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  id v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  void *v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  void *v317;
  id v318;
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
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  void *v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  void *v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  id v349;
  void *v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  void *v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  void *v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  id v367;
  const char *v368;
  uint64_t v369;
  void *v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  void *v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  LBFObservedTrialStatus *v378;
  const char *v379;
  uint64_t v380;
  void *v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  void *v385;
  const char *v386;
  uint64_t v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  void *v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  void *v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  char isAllocated_implicit;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  void *v413;
  const char *v414;
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
  void *v428;
  const char *v429;
  uint64_t v430;
  uint64_t v431;
  void *v432;
  const char *v433;
  uint64_t v434;
  uint64_t v435;
  void *v436;
  const char *v437;
  uint64_t v438;
  uint64_t v439;
  uint64_t v440;
  void *v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  NSObject *v445;
  const char *v446;
  uint64_t v447;
  uint64_t v448;
  void *v449;
  const char *v450;
  uint64_t v451;
  uint64_t v452;
  void *v453;
  const char *v454;
  uint64_t v455;
  uint64_t v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  void *v460;
  const char *v461;
  uint64_t v462;
  uint64_t v463;
  void *v464;
  const char *v465;
  uint64_t v466;
  uint64_t v467;
  NSDictionary *observedTrialStatusHolder;
  void *v470;
  LBFTrialStatusDetector *v471;
  void *v472;
  void *v473;
  void *v474;
  uint64_t v475;
  void *v476;
  id v477;
  uint64_t v478;
  uint64_t v479;
  id obj;
  NSDictionary *v481;
  uint64_t v482;
  void *v483;
  __int128 v484;
  __int128 v485;
  __int128 v486;
  __int128 v487;
  __int128 v488;
  __int128 v489;
  __int128 v490;
  __int128 v491;
  objc_super v492;
  _BYTE v493[128];
  uint8_t v494[4];
  int v495[3];
  uint8_t v496[128];
  uint8_t buf[4];
  uint64_t v498;
  __int16 v499;
  uint64_t v500;
  uint64_t v501;

  v501 = *MEMORY[0x24BDAC8D0];
  v492.receiver = self;
  v492.super_class = (Class)LBFTrialStatusDetector;
  v2 = -[LBFTrialStatusDetector init](&v492, sel_init);
  v3 = v2;
  if (v2)
  {
    v471 = v2;
    v4 = (NSDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend_sharedInstance(LBFEventManager, v5, v6, v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ensureBiomeManagerTrial(v9, v10, v11, v12, v13);
    v473 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_sharedInstance(LBFEventManager, v14, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ensureBiomeManagerMLRuntimed(v18, v19, v20, v21, v22);
    v472 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_dateWithTimeIntervalSinceNow_(MEMORY[0x24BDBCE60], v23, v24, v25, v26, -7776000.0);
    v27 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_now(MEMORY[0x24BDBCE60], v28, v29, v30, v31);
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = LBFLogContextTrialStatusDetector;
    if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v498 = v27;
      v499 = 2112;
      v500 = v32;
      _os_log_impl(&dword_2402DE000, v33, OS_LOG_TYPE_INFO, "Searching for events for Trial detection from %@ to %@.", buf, 0x16u);
    }
    objc_msgSend_readData_endDate_(v473, v34, v27, v32, v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v474 = (void *)v27;
    v470 = (void *)v32;
    objc_msgSend_readData_endDate_(v472, v37, v27, v32, v38);
    v476 = (void *)objc_claimAutoreleasedReturnValue();
    v488 = 0u;
    v489 = 0u;
    v490 = 0u;
    v491 = 0u;
    obj = v36;
    v40 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v39, (uint64_t)&v488, (uint64_t)v496, 16);
    v481 = v4;
    if (v40)
    {
      v41 = v40;
      v42 = *(_QWORD *)v489;
      v482 = *(_QWORD *)v489;
      do
      {
        for (i = 0; i != v41; ++i)
        {
          if (*(_QWORD *)v489 != v42)
            objc_enumerationMutation(obj);
          v44 = *(void **)(*((_QWORD *)&v488 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v46 = v44;
            objc_msgSend_trialIdentifiers(v46, v47, v48, v49, v50);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_bmltIdentifiers(v51, v52, v53, v54, v55);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_trialTaskID(v56, v57, v58, v59, v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            v66 = v61;
            if (v61)
            {
              v67 = v61;
            }
            else
            {
              objc_msgSend_trialIdentifiers(v46, v62, v63, v64, v65);
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_experimentIdentifiers(v68, v69, v70, v71, v72);
              v73 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_trialExperimentID(v73, v74, v75, v76, v77);
              v67 = (id)objc_claimAutoreleasedReturnValue();

            }
            objc_msgSend_trialIdentifiers(v46, v78, v79, v80, v81);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_bmltIdentifiers(v82, v83, v84, v85, v86);
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_trialDeploymentID(v87, v88, v89, v90, v91);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            v97 = v92;
            if (v92)
            {
              v98 = v92;
            }
            else
            {
              objc_msgSend_trialIdentifiers(v46, v93, v94, v95, v96);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_experimentIdentifiers(v99, v100, v101, v102, v103);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_trialDeploymentID(v104, v105, v106, v107, v108);
              v98 = (id)objc_claimAutoreleasedReturnValue();

              v4 = v481;
            }

            if (v67 && v98)
            {
              objc_msgSend_objectForKey_(v4, v109, (uint64_t)v67, v110, v111);
              v112 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v112)
              {
                v116 = objc_alloc_init(MEMORY[0x24BDBCED8]);
                objc_msgSend_setObject_forKeyedSubscript_(v4, v117, (uint64_t)v116, (uint64_t)v67, v118);

              }
              objc_msgSend_objectForKeyedSubscript_(v4, v113, (uint64_t)v67, v114, v115);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(v119, v120, (uint64_t)v98, v121, v122);
              v123 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v123)
              {
                v128 = [LBFObservedTrialStatus alloc];
                v131 = (void *)objc_msgSend_initWithObservedStatus_deploymentId_(v128, v129, (uint64_t)v67, (uint64_t)v98, v130);
                objc_msgSend_objectForKeyedSubscript_(v4, v132, (uint64_t)v67, v133, v134);
                v135 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_setObject_forKeyedSubscript_(v135, v136, (uint64_t)v131, (uint64_t)v98, v137);

              }
              objc_msgSend_timestamp(v46, v124, v125, v126, v127);
              v138 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v4, v139, (uint64_t)v67, v140, v141);
              v142 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v142, v143, (uint64_t)v98, v144, v145);
              v146 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setLastObservedTimestamp_(v146, v147, (uint64_t)v138, v148, v149);

              v154 = objc_msgSend_eventType(v46, v150, v151, v152, v153);
              switch(v154)
              {
                case 1:
                  if (objc_msgSend_eventSucceeded(v46, v155, v156, v157, v158))
                  {
                    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v215, 1, v216, v217);
                    v218 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v4, v219, (uint64_t)v67, v220, v221);
                    v222 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v222, v223, (uint64_t)v98, v224, v225);
                    v226 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setIsAllocated_(v226, v227, (uint64_t)v218, v228, v229);

                    objc_msgSend_objectForKeyedSubscript_(v4, v230, (uint64_t)v67, v231, v232);
                    v177 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v177, v233, (uint64_t)v98, v234, v235);
                    v181 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setIsAllocated_implicit_(v181, v236, 1, v237, v238);
LABEL_32:

                  }
                  else
                  {
                    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v215, 0, v216, v217);
                    v264 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v4, v265, (uint64_t)v67, v266, v267);
                    v268 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v268, v269, (uint64_t)v98, v270, v271);
                    v272 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setIsAllocated_(v272, v273, (uint64_t)v264, v274, v275);

                    objc_msgSend_objectForKeyedSubscript_(v4, v276, (uint64_t)v67, v277, v278);
                    v279 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v279, v280, (uint64_t)v98, v281, v282);
                    v283 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setIsAllocated_implicit_(v283, v284, 0, v285, v286);

                    v287 = LBFLogContextTrialStatusDetector;
                    if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      v498 = (uint64_t)v67;
                      v499 = 2112;
                      v500 = (uint64_t)v98;
                      v213 = v287;
                      v214 = "BMLighthouseLedgerTrialdEventEventTypeAllocation failed experimentOrTaskId:%@ deploymentId:%@";
LABEL_39:
                      _os_log_impl(&dword_2402DE000, v213, OS_LOG_TYPE_INFO, v214, buf, 0x16u);
                    }
                  }
                  break;
                case 3:
                  v185 = objc_msgSend_eventSucceeded(v46, v155, v156, v157, v158);
                  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v186, 0, v187, v188);
                  v189 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v4, v190, (uint64_t)v67, v191, v192);
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v193, v194, (uint64_t)v98, v195, v196);
                  v197 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setIsActivated_(v197, v198, (uint64_t)v189, v199, v200);

                  v4 = v481;
                  objc_msgSend_objectForKeyedSubscript_(v481, v201, (uint64_t)v67, v202, v203);
                  v204 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v204, v205, (uint64_t)v98, v206, v207);
                  v208 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setIsActivated_implicit_(v208, v209, 0, v210, v211);

                  if ((v185 & 1) == 0)
                  {
                    v212 = LBFLogContextTrialStatusDetector;
                    if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      v498 = (uint64_t)v67;
                      v499 = 2112;
                      v500 = (uint64_t)v98;
                      v213 = v212;
                      v214 = "BMLighthouseLedgerTrialdEventEventTypeDeactivation failed experimentOrTaskId:%@ deploymentId:%@";
                      goto LABEL_39;
                    }
                  }
                  break;
                case 2:
                  if (objc_msgSend_eventSucceeded(v46, v155, v156, v157, v158))
                  {
                    objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v159, 1, v160, v161);
                    v162 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v4, v163, (uint64_t)v67, v164, v165);
                    v166 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v166, v167, (uint64_t)v98, v168, v169);
                    v170 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setIsActivated_(v170, v171, (uint64_t)v162, v172, v173);

                    objc_msgSend_objectForKeyedSubscript_(v4, v174, (uint64_t)v67, v175, v176);
                    v177 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_objectForKeyedSubscript_(v177, v178, (uint64_t)v98, v179, v180);
                    v181 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_setIsActivated_implicit_(v181, v182, 1, v183, v184);
                    goto LABEL_32;
                  }
                  objc_msgSend_numberWithBool_(MEMORY[0x24BDD16E0], v159, 0, v160, v161);
                  v240 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v4, v241, (uint64_t)v67, v242, v243);
                  v244 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v244, v245, (uint64_t)v98, v246, v247);
                  v248 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setIsActivated_(v248, v249, (uint64_t)v240, v250, v251);

                  objc_msgSend_objectForKeyedSubscript_(v4, v252, (uint64_t)v67, v253, v254);
                  v255 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_objectForKeyedSubscript_(v255, v256, (uint64_t)v98, v257, v258);
                  v259 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_setIsActivated_implicit_(v259, v260, 0, v261, v262);

                  v263 = LBFLogContextTrialStatusDetector;
                  if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    v498 = (uint64_t)v67;
                    v499 = 2112;
                    v500 = (uint64_t)v98;
                    v213 = v263;
                    v214 = "BMLighthouseLedgerTrialdEventEventTypeActivation failed experimentOrTaskId:%@ deploymentId:%@";
                    goto LABEL_39;
                  }
                  break;
                default:
                  v239 = (void *)LBFLogContextTrialStatusDetector;
                  if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_ERROR))
                    sub_240315D04(v494, v239, v46, v495);
                  break;
              }
            }

            v42 = v482;
            continue;
          }
        }
        v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v488, (uint64_t)v496, 16);
      }
      while (v41);
    }

    v486 = 0u;
    v487 = 0u;
    v484 = 0u;
    v485 = 0u;
    v288 = v476;
    v290 = objc_msgSend_countByEnumeratingWithState_objects_count_(v288, v289, (uint64_t)&v484, (uint64_t)v493, 16);
    v291 = v474;
    if (!v290)
      goto LABEL_75;
    v292 = v290;
    v293 = *(_QWORD *)v485;
    v477 = v288;
    v478 = *(_QWORD *)v485;
LABEL_45:
    v294 = 0;
    v479 = v292;
    while (1)
    {
      if (*(_QWORD *)v485 != v293)
        objc_enumerationMutation(v288);
      v295 = *(void **)(*((_QWORD *)&v484 + 1) + 8 * v294);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_73;
      v297 = v295;
      objc_msgSend_trialIdentifiers(v297, v298, v299, v300, v301);
      v302 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bmltIdentifiers(v302, v303, v304, v305, v306);
      v307 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trialTaskID(v307, v308, v309, v310, v311);
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      v317 = v312;
      if (v312)
      {
        v318 = v312;
      }
      else
      {
        objc_msgSend_trialIdentifiers(v297, v313, v314, v315, v316);
        v319 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_experimentIdentifiers(v319, v320, v321, v322, v323);
        v324 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trialExperimentID(v324, v325, v326, v327, v328);
        v318 = (id)objc_claimAutoreleasedReturnValue();

        v4 = v481;
      }

      objc_msgSend_trialIdentifiers(v297, v329, v330, v331, v332);
      v333 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_bmltIdentifiers(v333, v334, v335, v336, v337);
      v338 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_trialDeploymentID(v338, v339, v340, v341, v342);
      v343 = (void *)objc_claimAutoreleasedReturnValue();
      v348 = v343;
      v483 = v297;
      if (v343)
      {
        v349 = v343;
      }
      else
      {
        objc_msgSend_trialIdentifiers(v297, v344, v345, v346, v347);
        v350 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_experimentIdentifiers(v350, v351, v352, v353, v354);
        v355 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_trialDeploymentID(v355, v356, v357, v358, v359);
        v349 = (id)objc_claimAutoreleasedReturnValue();

        v4 = v481;
      }

      if (v318 && v349)
      {
        objc_msgSend_objectForKey_(v4, v360, (uint64_t)v318, v361, v362);
        v363 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v363)
        {
          v367 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend_setObject_forKeyedSubscript_(v4, v368, (uint64_t)v367, (uint64_t)v318, v369);

        }
        objc_msgSend_objectForKeyedSubscript_(v4, v364, (uint64_t)v318, v365, v366);
        v370 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(v370, v371, (uint64_t)v349, v372, v373);
        v374 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v374)
        {
          v378 = [LBFObservedTrialStatus alloc];
          v381 = (void *)objc_msgSend_initWithObservedStatus_deploymentId_(v378, v379, (uint64_t)v318, (uint64_t)v349, v380);
          objc_msgSend_objectForKeyedSubscript_(v4, v382, (uint64_t)v318, v383, v384);
          v385 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v385, v386, (uint64_t)v381, (uint64_t)v349, v387);

        }
        objc_msgSend_objectForKeyedSubscript_(v4, v375, (uint64_t)v318, v376, v377);
        v388 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v388, v389, (uint64_t)v349, v390, v391);
        v392 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_isActivated_implicit(v392, v393, v394, v395, v396) & 1) != 0)
        {
          objc_msgSend_objectForKeyedSubscript_(v4, v397, (uint64_t)v318, v398, v399);
          v400 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v400, v401, (uint64_t)v349, v402, v403);
          v404 = (void *)objc_claimAutoreleasedReturnValue();
          isAllocated_implicit = objc_msgSend_isAllocated_implicit(v404, v405, v406, v407, v408);

          v4 = v481;
          if ((isAllocated_implicit & 1) != 0)
            goto LABEL_72;
        }
        else
        {

        }
        objc_msgSend_objectForKeyedSubscript_(v4, v410, (uint64_t)v318, v411, v412);
        v413 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v413, v414, (uint64_t)v349, v415, v416);
        v417 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObservedTimestamp(v417, v418, v419, v420, v421);
        v422 = objc_claimAutoreleasedReturnValue();
        if (!v422)
        {

LABEL_69:
          v445 = LBFLogContextTrialStatusDetector;
          if (os_log_type_enabled((os_log_t)LBFLogContextTrialStatusDetector, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v498 = (uint64_t)v318;
            v499 = 2112;
            v500 = (uint64_t)v349;
            _os_log_impl(&dword_2402DE000, v445, OS_LOG_TYPE_INFO, "set implicit trial status experimentOrTaskId:%@ deploymentId:%@", buf, 0x16u);
          }
          objc_msgSend_objectForKeyedSubscript_(v4, v446, (uint64_t)v318, v447, v448);
          v449 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v449, v450, (uint64_t)v349, v451, v452);
          v453 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setIsActivated_implicit_(v453, v454, 1, v455, v456);

          objc_msgSend_objectForKeyedSubscript_(v4, v457, (uint64_t)v318, v458, v459);
          v460 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v460, v461, (uint64_t)v349, v462, v463);
          v464 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setIsAllocated_implicit_(v464, v465, 1, v466, v467);

          v288 = v477;
          goto LABEL_72;
        }
        v427 = (void *)v422;
        objc_msgSend_timestamp(v483, v423, v424, v425, v426);
        v428 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v4, v429, (uint64_t)v318, v430, v431);
        v432 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v432, v433, (uint64_t)v349, v434, v435);
        v436 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_lastObservedTimestamp(v436, v437, v438, v439, v440);
        v441 = (void *)objc_claimAutoreleasedReturnValue();
        v475 = objc_msgSend_compare_(v428, v442, (uint64_t)v441, v443, v444);

        v288 = v477;
        v291 = v474;

        v4 = v481;
        if (v475 == 1)
          goto LABEL_69;
      }
LABEL_72:

      v293 = v478;
      v292 = v479;
LABEL_73:
      if (v292 == ++v294)
      {
        v292 = objc_msgSend_countByEnumeratingWithState_objects_count_(v288, v296, (uint64_t)&v484, (uint64_t)v493, 16);
        if (!v292)
        {
LABEL_75:

          v3 = v471;
          observedTrialStatusHolder = v471->_observedTrialStatusHolder;
          v471->_observedTrialStatusHolder = v4;

          return v3;
        }
        goto LABEL_45;
      }
    }
  }
  return v3;
}

- (id)getTrialStatus:(id)a3 deploymentId:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;

  v6 = a3;
  v7 = a4;
  objc_msgSend_objectForKey_(self->_observedTrialStatusHolder, v8, (uint64_t)v6, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (objc_msgSend_objectForKeyedSubscript_(self->_observedTrialStatusHolder, v12, (uint64_t)v6, v13, v14),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKey_(v15, v16, (uint64_t)v7, v17, v18),
        v19 = (void *)objc_claimAutoreleasedReturnValue(),
        v19,
        v15,
        v19))
  {
    objc_msgSend_objectForKeyedSubscript_(self->_observedTrialStatusHolder, v20, (uint64_t)v6, v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v23, v24, (uint64_t)v7, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

- (NSDictionary)observedTrialStatusHolder
{
  return self->_observedTrialStatusHolder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observedTrialStatusHolder, 0);
}

@end
