@implementation CHGroupingPostProcessingManager

- (CHGroupingPostProcessingManager)init
{
  CHGroupingPostProcessingManager *v2;
  NSArray *v3;
  NSArray *sequence;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHGroupingPostProcessingManager;
  v2 = -[CHGroupingPostProcessingManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    sequence = v2->_sequence;
    v2->_sequence = v3;

  }
  return v2;
}

- (CHGroupingPostProcessingManager)initWithStep:(id)a3 groupingManager:(id)a4
{
  id v6;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  CHGroupingPostProcessingManager *v17;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc(MEMORY[0x1E0C99D20]);
  v13 = (void *)objc_msgSend_initWithObjects_(v8, v9, (uint64_t)v6, v10, v11, v12, 0);
  v17 = (CHGroupingPostProcessingManager *)objc_msgSend_initWithSequence_groupingManager_(self, v14, (uint64_t)v13, (uint64_t)v7, v15, v16);

  return v17;
}

- (CHGroupingPostProcessingManager)initWithSequence:(id)a3 groupingManager:(id)a4
{
  id v7;
  id v8;
  CHGroupingPostProcessingManager *v9;
  CHGroupingPostProcessingManager *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CHGroupingPostProcessingManager;
  v9 = -[CHGroupingPostProcessingManager init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_sequence, a3);
    objc_storeStrong((id *)&v10->_groupingManager, a4);
  }

  return v10;
}

- (id)process:(id)a3 options:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  const char *v19;
  uint64_t v20;
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
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  id *v54;
  id v55;
  void *v56;
  id v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  id *v112;
  const char *v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  int isEqualToSet;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  char isEqualToString;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  void *v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  int isSubsetOfSet;
  id v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  int v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  id *v209;
  id *v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  void *v227;
  void *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  void *v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  id *v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
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
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  void *StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  id *v282;
  id *v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  void *v301;
  const char *v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  void *v316;
  CHStrokeGroup *v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  double v347;
  double v348;
  double v349;
  double v350;
  double v351;
  double v352;
  double v353;
  double v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  double v366;
  double v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  void *v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  const char *v379;
  double v380;
  double v381;
  const char *v382;
  uint64_t v383;
  uint64_t v384;
  uint64_t v385;
  const char *v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  id *v390;
  id *v391;
  void *v392;
  const char *v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  uint64_t v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  void *v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  uint64_t v407;
  void *v408;
  void *v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  const char *v416;
  uint64_t v417;
  uint64_t v418;
  uint64_t v419;
  void *v420;
  const char *v421;
  uint64_t v422;
  uint64_t v423;
  const char *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  const char *v428;
  uint64_t v429;
  CHStrokeGroupingResult *v430;
  const char *v431;
  uint64_t v432;
  void *v433;
  id v435;
  void *v436;
  id v437;
  void *v438;
  id *obj;
  uint64_t v440;
  void *v441;
  void *v442;
  id v443;
  uint64_t v444;
  id *v445;
  uint64_t j;
  id v447;
  id v448;
  id v449;
  void *v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  __int128 v456;
  __int128 v457;
  __int128 v458;
  __int128 v459;
  __int128 v460;
  __int128 v461;
  __int128 v462;
  _BYTE v463[128];
  _BYTE v464[128];
  _BYTE v465[128];
  uint64_t v466;

  v466 = *MEMORY[0x1E0C80C00];
  v437 = a3;
  v435 = a4;
  for (i = 0; ; ++i)
  {
    objc_msgSend_sequence(self, v6, v7, v8, v9, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_count(v12, v13, v14, v15, v16, v17);

    if (i >= v18)
      break;
    objc_msgSend_sequence(self, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v24, v25, i, v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_groupingManager(self, v30, v31, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGroupingManager_(v29, v36, (uint64_t)v35, v37, v38, v39);

    v45 = objc_msgSend_saveInputDrawings(self, v40, v41, v42, v43, v44);
    objc_msgSend_setSaveInputDrawings_(v29, v46, v45, v47, v48, v49);
    objc_msgSend_process_options_(v29, v50, (uint64_t)v437, (uint64_t)v435, v51, v52);
    v53 = objc_claimAutoreleasedReturnValue();

    v437 = (id)v53;
  }
  v54 = (id *)v437;
  v445 = v54;
  if (self)
  {
    if (v54)
      v55 = v54[6];
    else
      v55 = 0;
    v56 = (void *)MEMORY[0x1E0C99E20];
    v57 = v55;
    v63 = objc_msgSend_count(v57, v58, v59, v60, v61, v62);
    objc_msgSend_setWithCapacity_(v56, v64, v63, v65, v66, v67);
    v442 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_set(MEMORY[0x1E0C99E20], v68, v69, v70, v71, v72);
    v438 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previousProcessedStrokeGroupingResult(v445, v73, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeGroups(v78, v79, v80, v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    v436 = (void *)objc_msgSend_mutableCopy(v84, v85, v86, v87, v88, v89);

    objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v90, v91, v92, v93, v94);
    v443 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_previousProcessedStrokeGroupingResult(v445, v95, v96, v97, v98, v99);
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeGroups(v100, v101, v102, v103, v104, v105);
    v106 = (void *)objc_claimAutoreleasedReturnValue();
    v441 = (void *)objc_msgSend_mutableCopy(v106, v107, v108, v109, v110, v111);

    v461 = 0u;
    v462 = 0u;
    v459 = 0u;
    v460 = 0u;
    v112 = v445;
    if (v445)
      v112 = (id *)v445[6];
    obj = v112;
    v444 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v113, (uint64_t)&v459, (uint64_t)v465, 16, v114);
    if (v444)
    {
      v440 = *(_QWORD *)v460;
      do
      {
        for (j = 0; j != v444; ++j)
        {
          if (*(_QWORD *)v460 != v440)
            objc_enumerationMutation(obj);
          v450 = *(void **)(*((_QWORD *)&v459 + 1) + 8 * j);
          v455 = 0u;
          v456 = 0u;
          v457 = 0u;
          v458 = 0u;
          v447 = v441;
          v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v447, v115, (uint64_t)&v455, (uint64_t)v464, 16, v116);
          if (v122)
          {
            v123 = *(_QWORD *)v456;
LABEL_16:
            v124 = 0;
            while (1)
            {
              if (*(_QWORD *)v456 != v123)
                objc_enumerationMutation(v447);
              v125 = *(void **)(*((_QWORD *)&v455 + 1) + 8 * v124);
              objc_msgSend_strokeIdentifiers(v450, v117, v118, v119, v120, v121);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIdentifiers(v125, v127, v128, v129, v130, v131);
              v132 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToSet = objc_msgSend_isEqualToSet_(v126, v133, (uint64_t)v132, v134, v135, v136);

              if (isEqualToSet)
                break;
              if (v122 == ++v124)
              {
                v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v447, v117, (uint64_t)&v455, (uint64_t)v464, 16, v121);
                if (!v122)
                  goto LABEL_22;
                goto LABEL_16;
              }
            }
            objc_msgSend_strokeGroupReplacements(v445, v117, v118, v119, v120, v121);
            v199 = (void *)objc_claimAutoreleasedReturnValue();
            v204 = objc_msgSend_containsObject_(v199, v200, (uint64_t)v450, v201, v202, v203);

            if (v204)
            {
              objc_msgSend_addObject_(v442, v205, (uint64_t)v450, v206, v207, v208);
              v209 = v445;
              if (v445)
                v209 = (id *)v445[7];
              v210 = v209;
              v211 = (void *)MEMORY[0x1E0CB37E8];
              v217 = objc_msgSend_uniqueIdentifier(v450, v212, v213, v214, v215, v216);
              objc_msgSend_numberWithInteger_(v211, v218, v217, v219, v220, v221);
              v222 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v210, v223, (uint64_t)v222, v224, v225, v226);
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              v228 = (void *)MEMORY[0x1E0CB37E8];
              v234 = objc_msgSend_uniqueIdentifier(v450, v229, v230, v231, v232, v233);
              objc_msgSend_numberWithInteger_(v228, v235, v234, v236, v237, v238);
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v443, v240, (uint64_t)v227, (uint64_t)v239, v241, v242);
            }
            else
            {
              objc_msgSend_addObject_(v442, v205, (uint64_t)v125, v206, v207, v208);
              objc_msgSend_removeObject_(v436, v243, (uint64_t)v125, v244, v245, v246);
              v247 = v445;
              if (v445)
                v247 = (id *)v445[7];
              v210 = v247;
              v248 = (void *)MEMORY[0x1E0CB37E8];
              v254 = objc_msgSend_uniqueIdentifier(v450, v249, v250, v251, v252, v253);
              objc_msgSend_numberWithInteger_(v248, v255, v254, v256, v257, v258);
              v222 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v210, v259, (uint64_t)v222, v260, v261, v262);
              v227 = (void *)objc_claimAutoreleasedReturnValue();
              v263 = (void *)MEMORY[0x1E0CB37E8];
              v269 = objc_msgSend_uniqueIdentifier(v125, v264, v265, v266, v267, v268);
              objc_msgSend_numberWithInteger_(v263, v270, v269, v271, v272, v273);
              v239 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setObject_forKeyedSubscript_(v443, v274, (uint64_t)v227, (uint64_t)v239, v275, v276);
            }

            v449 = v125;
            StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = v447;
LABEL_53:

            v316 = v449;
            if (v449)
              objc_msgSend_removeObject_(v447, v424, (uint64_t)v449, v425, v426, v427);
          }
          else
          {
LABEL_22:

            objc_msgSend_strategyIdentifier(v450, v138, v139, v140, v141, v142);
            v143 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v143, v144, (uint64_t)CFSTR("CHGroupingPostProcessingManager"), v145, v146, v147);

            if ((isEqualToString & 1) != 0)
            {
              v453 = 0u;
              v454 = 0u;
              v451 = 0u;
              v452 = 0u;
              v448 = v447;
              v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v448, v153, (uint64_t)&v451, (uint64_t)v463, 16, v154);
              if (!v160)
              {

                v449 = 0;
                goto LABEL_49;
              }
              v449 = 0;
              v161 = *(_QWORD *)v452;
              v162 = 0x7FFFFFFFFFFFFFFFLL;
              while (2)
              {
                v163 = 0;
LABEL_27:
                if (*(_QWORD *)v452 != v161)
                  objc_enumerationMutation(v448);
                v164 = *(void **)(*((_QWORD *)&v451 + 1) + 8 * v163);
                objc_msgSend_strokeIdentifiers(v164, v155, v156, v157, v158, v159);
                v165 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_strokeIdentifiers(v450, v166, v167, v168, v169, v170);
                v171 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend_isSubsetOfSet_(v165, v172, (uint64_t)v171, v173, v174, v175))
                {

LABEL_32:
                  if (objc_msgSend_ancestorIdentifier(v164, v155, v156, v157, v158, v159) < v162)
                  {
                    v162 = objc_msgSend_ancestorIdentifier(v164, v155, v156, v157, v158, v159);
                    v193 = v164;

                    v449 = v193;
                  }
                }
                else
                {
                  objc_msgSend_strokeIdentifiers(v450, v176, v177, v178, v179, v180);
                  v181 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_strokeIdentifiers(v164, v182, v183, v184, v185, v186);
                  v187 = (void *)objc_claimAutoreleasedReturnValue();
                  isSubsetOfSet = objc_msgSend_isSubsetOfSet_(v181, v188, (uint64_t)v187, v189, v190, v191);

                  if (isSubsetOfSet)
                    goto LABEL_32;
                }
                if (v160 == ++v163)
                {
                  v160 = objc_msgSend_countByEnumeratingWithState_objects_count_(v448, v155, (uint64_t)&v451, (uint64_t)v463, 16, v159);
                  if (!v160)
                  {

                    if (v162 != 0x7FFFFFFFFFFFFFFFLL)
                    {
LABEL_50:
                      v317 = [CHStrokeGroup alloc];
                      v323 = objc_msgSend_uniqueIdentifier(v450, v318, v319, v320, v321, v322);
                      objc_msgSend_strokeIdentifiers(v450, v324, v325, v326, v327, v328);
                      v329 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_firstStrokeIdentifier(v450, v330, v331, v332, v333, v334);
                      v335 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_lastStrokeIdentifier(v450, v336, v337, v338, v339, v340);
                      v341 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_bounds(v450, v342, v343, v344, v345, v346);
                      v348 = v347;
                      v350 = v349;
                      v352 = v351;
                      v354 = v353;
                      v360 = objc_msgSend_classification(v450, v355, v356, v357, v358, v359);
                      objc_msgSend_groupingConfidence(v450, v361, v362, v363, v364, v365);
                      v367 = v366;
                      objc_msgSend_strategyIdentifier(v450, v368, v369, v370, v371, v372);
                      v373 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_firstStrokeOrigin(v450, v374, v375, v376, v377, v378);
                      StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin = (void *)objc_msgSend_initWithUniqueIdentifier_ancestorIdentifier_strokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin_(v317, v379, v323, v162, (uint64_t)v329, (uint64_t)v335, v341, v360, v348, v350, v352, v354, v367, v380, v381, v373);

                      objc_msgSend_addObject_(v442, v382, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v383, v384, v385);
                      objc_msgSend_addObject_(v438, v386, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v387, v388, v389);
                      v390 = v445;
                      if (v445)
                        v390 = (id *)v445[7];
                      v391 = v390;
                      v392 = (void *)MEMORY[0x1E0CB37E8];
                      v398 = objc_msgSend_uniqueIdentifier(v450, v393, v394, v395, v396, v397);
                      objc_msgSend_numberWithInteger_(v392, v399, v398, v400, v401, v402);
                      v403 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_objectForKeyedSubscript_(v391, v404, (uint64_t)v403, v405, v406, v407);
                      v408 = (void *)objc_claimAutoreleasedReturnValue();
                      v409 = (void *)MEMORY[0x1E0CB37E8];
                      v415 = objc_msgSend_uniqueIdentifier(StrokeIdentifier_lastStrokeIdentifier_bounds_classification_groupingConfidence_strategyIdentifier_firstStrokeOrigin, v410, v411, v412, v413, v414);
                      objc_msgSend_numberWithInteger_(v409, v416, v415, v417, v418, v419);
                      v420 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_setObject_forKeyedSubscript_(v443, v421, (uint64_t)v408, (uint64_t)v420, v422, v423);

                      goto LABEL_53;
                    }
LABEL_49:
                    v162 = objc_msgSend_ancestorIdentifier(v450, v194, v195, v196, v197, v198);
                    goto LABEL_50;
                  }
                  continue;
                }
                goto LABEL_27;
              }
            }
            objc_msgSend_addObject_(v442, v149, (uint64_t)v450, v150, v151, v152);
            objc_msgSend_addObject_(v438, v278, (uint64_t)v450, v279, v280, v281);
            v282 = v445;
            if (v445)
              v282 = (id *)v445[7];
            v283 = v282;
            v284 = (void *)MEMORY[0x1E0CB37E8];
            v290 = objc_msgSend_uniqueIdentifier(v450, v285, v286, v287, v288, v289);
            objc_msgSend_numberWithInteger_(v284, v291, v290, v292, v293, v294);
            v295 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectForKeyedSubscript_(v283, v296, (uint64_t)v295, v297, v298, v299);
            v300 = (void *)objc_claimAutoreleasedReturnValue();
            v301 = (void *)MEMORY[0x1E0CB37E8];
            v307 = objc_msgSend_uniqueIdentifier(v450, v302, v303, v304, v305, v306);
            objc_msgSend_numberWithInteger_(v301, v308, v307, v309, v310, v311);
            v312 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_setObject_forKeyedSubscript_(v443, v313, (uint64_t)v300, (uint64_t)v312, v314, v315);

            v316 = 0;
          }

        }
        v444 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v428, (uint64_t)&v459, (uint64_t)v465, 16, v429);
      }
      while (v444);
    }

    v430 = [CHStrokeGroupingResult alloc];
    v433 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v430, v431, (uint64_t)v442, (uint64_t)v438, (uint64_t)v436, v432);
    if (v445)
    {
      objc_storeStrong(v445 + 1, v433);
      objc_storeStrong(v445 + 2, v443);
    }

    v54 = v445;
  }

  return v445;
}

- (BOOL)saveInputDrawings
{
  return self->_saveInputDrawings;
}

- (void)setSaveInputDrawings:(BOOL)a3
{
  self->_saveInputDrawings = a3;
}

- (NSArray)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
  objc_storeStrong((id *)&self->_sequence, a3);
}

- (CHStrokeGroupingManager)groupingManager
{
  return self->_groupingManager;
}

- (void)setGroupingManager:(id)a3
{
  objc_storeStrong((id *)&self->_groupingManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupingManager, 0);
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
