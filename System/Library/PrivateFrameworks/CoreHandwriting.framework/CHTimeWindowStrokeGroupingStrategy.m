@implementation CHTimeWindowStrokeGroupingStrategy

- (id)updatedGroupingResult:(id)a3 byAddingStrokes:(id)a4 removingStrokeIdentifiers:(id)a5 stableStrokeIdentifiers:(id)a6 allSubstrokesByStrokeIdentifier:(id)a7 withCancellationBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  NSObject *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  id v76;
  const char *v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t i;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  NSObject *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  id v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp;
  uint64_t v136;
  uint64_t j;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  double v144;
  double v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  double v151;
  id v152;
  id v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  void *v166;
  CHTimeWindowStrokeGroup *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  double v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  double v191;
  double v192;
  const char *v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  double v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  double v206;
  double v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  double v213;
  double v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  double v220;
  double v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  double v242;
  double v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  double v249;
  double v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  double v261;
  double v262;
  double v263;
  double v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  double v270;
  double v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  double v277;
  double v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  double v284;
  double v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  void *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  double v306;
  CGFloat v307;
  double v308;
  CGFloat v309;
  double v310;
  CGFloat v311;
  double v312;
  CGFloat v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  CGFloat v319;
  CGFloat v320;
  CGFloat v321;
  CGFloat v322;
  double x;
  double y;
  double width;
  double height;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  double v332;
  double v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  double v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  double v350;
  double v351;
  double v352;
  double v353;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  const char *v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  double v364;
  const char *v365;
  double v366;
  double v367;
  id v368;
  const char *v369;
  const char *v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  const char *v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  CHStrokeGroupingResult *v378;
  const char *v379;
  uint64_t v380;
  void *v381;
  void *v383;
  id v384;
  id v385;
  id v386;
  void *v387;
  void *v388;
  void *v389;
  uint64_t v390;
  id v391;
  CHTimeWindowStrokeGroupingStrategy *v392;
  uint64_t v393;
  void *v394;
  uint64_t v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  id v400;
  id v401;
  __int128 v402;
  __int128 v403;
  __int128 v404;
  __int128 v405;
  __int128 v406;
  __int128 v407;
  __int128 v408;
  __int128 v409;
  _QWORD v410[4];
  id v411;
  __int128 v412;
  __int128 v413;
  __int128 v414;
  __int128 v415;
  __int128 v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  _BYTE v420[128];
  _BYTE v421[128];
  _BYTE v422[128];
  uint8_t v423[128];
  uint8_t buf[4];
  uint64_t v425;
  __int16 v426;
  uint64_t v427;
  __int16 v428;
  uint64_t v429;
  uint64_t v430;
  CGRect v431;
  CGRect v432;
  CGRect v433;

  v430 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v386 = a6;
  v385 = a7;
  v384 = a8;
  v388 = v14;
  objc_msgSend_strokeGroups(v14, v17, v18, v19, v20, v21);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    objc_msgSend_strokeProvider(self, v22, v23, v24, v25, v26);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = &qword_1EF568000;
    if (v33)
      goto LABEL_10;
  }
  else
  {
    objc_msgSend_set(MEMORY[0x1E0C99E60], v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeProvider(self, v35, v36, v37, v38, v39);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = &qword_1EF568000;
    if (v33)
      goto LABEL_10;
  }
  if (v34[465] != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v40 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v40, OS_LOG_TYPE_FAULT, "strokeProvider cannot be nil.", buf, 2u);
  }

LABEL_10:
  v383 = (void *)objc_msgSend_mutableCopy(v27, v28, v29, v30, v31, v32);
  objc_msgSend_set(MEMORY[0x1E0C99E20], v41, v42, v43, v44, v45);
  v396 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v46, v47, v48, v49, v50);
  v394 = (void *)objc_claimAutoreleasedReturnValue();
  v399 = (void *)objc_msgSend_mutableCopy(v15, v51, v52, v53, v54, v55);
  if (v34[465] != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v389 = v27;
  v387 = v15;
  v56 = (id)qword_1EF568E30;
  v398 = (void *)v33;
  if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
  {
    v57 = (void *)objc_opt_class();
    v58 = v57;
    v64 = objc_msgSend_count(v399, v59, v60, v61, v62, v63);
    v70 = objc_msgSend_count(v16, v65, v66, v67, v68, v69);
    *(_DWORD *)buf = 138412802;
    v425 = (uint64_t)v57;
    v426 = 2048;
    v427 = v64;
    v428 = 2048;
    v429 = v70;
    _os_log_impl(&dword_1BE607000, v56, OS_LOG_TYPE_DEBUG, "Stroke Grouping with strategy %@. Added strokes: %ld, removed strokes: %ld", buf, 0x20u);

  }
  v392 = self;
  if (objc_msgSend_count(v16, v71, v72, v73, v74, v75))
  {
    v418 = 0u;
    v419 = 0u;
    v416 = 0u;
    v417 = 0u;
    v76 = v389;
    v393 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v77, (uint64_t)&v416, (uint64_t)v423, 16, v78);
    if (!v393)
    {
LABEL_45:

      goto LABEL_46;
    }
    v84 = 0;
    v85 = *(_QWORD *)v417;
    v390 = *(_QWORD *)v417;
    v391 = v76;
    do
    {
      v86 = 0;
      do
      {
        while (1)
        {
          if (*(_QWORD *)v417 != v85)
            objc_enumerationMutation(v76);
          v395 = v86;
          v88 = *(void **)(*((_QWORD *)&v416 + 1) + 8 * v86);
          objc_msgSend_strokeIdentifiers(v88, v79, v80, v81, v82, v83);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
          v94 = objc_msgSend_intersectsSet_(v89, v90, (uint64_t)v16, v91, v92, v93);

          if (v94)
            break;
          v87 = v398;
          v86 = v395 + 1;
          if (v395 + 1 == v393)
            goto LABEL_17;
        }
        objc_msgSend_addObject_(v394, v79, (uint64_t)v88, v81, v82, v83);
        v414 = 0u;
        v415 = 0u;
        v412 = 0u;
        v413 = 0u;
        objc_msgSend_strokeIdentifiers(v88, v95, v96, v97, v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        v103 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v101, (uint64_t)&v412, (uint64_t)v422, 16, v102);
        if (v103)
        {
          v108 = v103;
          v109 = *(_QWORD *)v413;
          v87 = v398;
          while (1)
          {
            for (i = 0; i != v108; ++i)
            {
              if (*(_QWORD *)v413 == v109)
              {
                v111 = *(_QWORD *)(*((_QWORD *)&v412 + 1) + 8 * i);
                if ((objc_msgSend_containsObject_(v16, v104, v111, v105, v106, v107) & 1) != 0)
                  continue;
              }
              else
              {
                objc_enumerationMutation(v100);
                v111 = *(_QWORD *)(*((_QWORD *)&v412 + 1) + 8 * i);
                if ((objc_msgSend_containsObject_(v16, v112, v111, v113, v114, v115) & 1) != 0)
                  continue;
              }
              v116 = (void *)objc_opt_class();
              objc_msgSend_strokeForIdentifier_inStrokeProvider_(v116, v117, v111, (uint64_t)v87, v118, v119);
              v124 = (void *)objc_claimAutoreleasedReturnValue();
              if (v124)
              {
                objc_msgSend_addObject_(v399, v120, (uint64_t)v124, v121, v122, v123);
                v84 = 1;
              }
              else
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v125 = (id)qword_1EF568E30;
                if (os_log_type_enabled(v125, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  v425 = v111;
                  _os_log_impl(&dword_1BE607000, v125, OS_LOG_TYPE_ERROR, "Could not find stroke for id: %@", buf, 0xCu);
                }

                v87 = v398;
              }

            }
            v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v100, v104, (uint64_t)&v412, (uint64_t)v422, 16, v107);
            if (!v108)
              goto LABEL_41;
          }
        }
        v87 = v398;
LABEL_41:

        v85 = v390;
        v76 = v391;
        v86 = v395 + 1;
      }
      while (v395 + 1 != v393);
LABEL_17:
      v393 = objc_msgSend_countByEnumeratingWithState_objects_count_(v76, v79, (uint64_t)&v416, (uint64_t)v423, 16, v83);
    }
    while (v393);

    if ((v84 & 1) != 0)
    {
      v410[0] = MEMORY[0x1E0C809B0];
      v410[1] = 3221225472;
      v410[2] = sub_1BE78A774;
      v410[3] = &unk_1E77F29C8;
      v411 = v87;
      objc_msgSend_sortUsingComparator_(v399, v126, (uint64_t)v410, v127, v128, v129);
      v76 = v411;
      goto LABEL_45;
    }
  }
LABEL_46:
  v408 = 0u;
  v409 = 0u;
  v406 = 0u;
  v407 = 0u;
  v130 = v389;
  v133 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v131, (uint64_t)&v406, (uint64_t)v421, 16, v132);
  if (v133)
  {
    v134 = v133;
    StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp = 0;
    v136 = *(_QWORD *)v407;
    do
    {
      for (j = 0; j != v134; ++j)
      {
        if (*(_QWORD *)v407 != v136)
          objc_enumerationMutation(v130);
        v138 = *(void **)(*((_QWORD *)&v406 + 1) + 8 * j);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp
            || (objc_msgSend_endTimestamp(v138, v139, v140, v141, v142, v143),
                v145 = v144,
                objc_msgSend_endTimestamp(StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp, v146, v147, v148, v149, v150), v145 > v151))
          {
            if ((objc_msgSend_containsObject_(v394, v139, (uint64_t)v138, v141, v142, v143) & 1) == 0)
            {
              v152 = v138;

              StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp = v152;
            }
          }
        }
      }
      v134 = objc_msgSend_countByEnumeratingWithState_objects_count_(v130, v139, (uint64_t)&v406, (uint64_t)v421, 16, v143);
    }
    while (v134);
  }
  else
  {
    StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp = 0;
  }
  v397 = v130;

  v404 = 0u;
  v405 = 0u;
  v402 = 0u;
  v403 = 0u;
  v153 = v399;
  v156 = objc_msgSend_countByEnumeratingWithState_objects_count_(v153, v154, (uint64_t)&v402, (uint64_t)v420, 16, v155);
  if (v156)
  {
    v162 = v156;
    v163 = *(_QWORD *)v403;
    do
    {
      v164 = 0;
      v165 = StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp;
      do
      {
        if (*(_QWORD *)v403 != v163)
          objc_enumerationMutation(v153);
        v205 = *(void **)(*((_QWORD *)&v402 + 1) + 8 * v164);
        objc_msgSend_startTimestamp(v205, v157, v158, v159, v160, v161);
        v207 = v206;
        objc_msgSend_endTimestamp(v165, v208, v209, v210, v211, v212);
        v214 = v207 - v213;
        objc_msgSend_startTimestamp(v205, v215, v216, v217, v218, v219);
        v221 = v220;
        objc_msgSend_endTimestamp(v165, v222, v223, v224, v225, v226);
        v233 = v221 - v232;
        if (v214 >= 0.0)
          v234 = v233;
        else
          v234 = -v233;
        objc_msgSend_endTimestamp(v205, v227, v228, v229, v230, v231);
        v236 = v235;
        objc_msgSend_startTimestamp(v165, v237, v238, v239, v240, v241);
        v243 = v236 - v242;
        objc_msgSend_endTimestamp(v205, v244, v245, v246, v247, v248);
        v250 = v249;
        objc_msgSend_startTimestamp(v165, v251, v252, v253, v254, v255);
        v262 = v250 - v261;
        if (v243 < 0.0)
          v262 = -v262;
        if (v234 >= v262)
        {
          objc_msgSend_endTimestamp(v205, v256, v257, v258, v259, v260);
          v264 = v263;
          objc_msgSend_startTimestamp(v165, v265, v266, v267, v268, v269);
          v271 = v264 - v270;
          objc_msgSend_endTimestamp(v205, v272, v273, v274, v275, v276);
          v278 = v277;
          objc_msgSend_startTimestamp(v165, v279, v280, v281, v282, v283);
          v285 = v278 - v284;
          if (v271 < 0.0)
            v234 = -v285;
          else
            v234 = v285;
        }
        if (v165 && v234 < 1.0)
        {
          if ((objc_msgSend_containsObject_(v396, v256, (uint64_t)v165, v258, v259, v260) & 1) == 0)
            objc_msgSend_addObject_(v394, v286, (uint64_t)v165, v287, v288, v289);
          objc_msgSend_removeObject_(v396, v286, (uint64_t)v165, v287, v288, v289);
          v290 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend_encodedStrokeIdentifier(v205, v291, v292, v293, v294, v295);
          v296 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setWithObject_(v290, v297, (uint64_t)v296, v298, v299, v300);
          v166 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_bounds(v165, v301, v302, v303, v304, v305);
          v307 = v306;
          v309 = v308;
          v311 = v310;
          v313 = v312;
          objc_msgSend_bounds(v205, v314, v315, v316, v317, v318);
          v433.origin.x = v319;
          v433.origin.y = v320;
          v433.size.width = v321;
          v433.size.height = v322;
          v431.origin.x = v307;
          v431.origin.y = v309;
          v431.size.width = v311;
          v431.size.height = v313;
          v432 = CGRectUnion(v431, v433);
          x = v432.origin.x;
          y = v432.origin.y;
          width = v432.size.width;
          height = v432.size.height;
          objc_msgSend_startTimestamp(v165, v327, v328, v329, v330, v331);
          v333 = v332;
          objc_msgSend_startTimestamp(v205, v334, v335, v336, v337, v338);
          if (v333 >= v344)
            objc_msgSend_startTimestamp(v205, v339, v340, v341, v342, v343);
          else
            objc_msgSend_startTimestamp(v165, v339, v340, v341, v342, v343);
          v351 = v350;
          objc_msgSend_endTimestamp(v165, v345, v346, v347, v348, v349);
          v353 = v352;
          objc_msgSend_endTimestamp(v205, v354, v355, v356, v357, v358);
          if (v353 <= v364)
            objc_msgSend_endTimestamp(v205, v359, v360, v361, v362, v363);
          else
            objc_msgSend_endTimestamp(v165, v359, v360, v361, v362, v363);
          v367 = v366;
          v400 = 0;
          v401 = 0;
          objc_msgSend_firstStrokeIdentifier_lastStrokeIdentifier_inGroup_addingStrokeIdentifiers_removingStrokeIdentifiers_(v392, v365, (uint64_t)&v401, (uint64_t)&v400, (uint64_t)v165, (uint64_t)v166, 0);
          v368 = v401;
          v172 = v400;
          objc_msgSend_groupByAddingStrokeIdentifiers_removingStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp_(v165, v369, (uint64_t)v166, 0, (uint64_t)v368, (uint64_t)v172, x, y, width, height, v351, v367);
          StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp = (void *)objc_claimAutoreleasedReturnValue();

          v165 = v368;
        }
        else
        {
          objc_msgSend_encodedStrokeIdentifier(v205, v256, v257, v258, v259, v260);
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          v167 = [CHTimeWindowStrokeGroup alloc];
          objc_msgSend_setWithObject_(MEMORY[0x1E0C99E60], v168, (uint64_t)v166, v169, v170, v171);
          v172 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend_bounds(v205, v173, v174, v175, v176, v177);
          v179 = v178;
          v181 = v180;
          v183 = v182;
          v185 = v184;
          objc_msgSend_startTimestamp(v205, v186, v187, v188, v189, v190);
          v192 = v191;
          objc_msgSend_endTimestamp(v205, v193, v194, v195, v196, v197);
          StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp = (void *)objc_msgSend_initWithStrokeIdentifiers_firstStrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp_(v167, v198, (uint64_t)v172, (uint64_t)v166, (uint64_t)v166, v199, v179, v181, v183, v185, v192, v200);
        }

        objc_msgSend_addObject_(v396, v201, (uint64_t)StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp, v202, v203, v204);
        ++v164;
        v165 = StrokeIdentifier_lastStrokeIdentifier_bounds_startTimestamp_endTimestamp;
      }
      while (v162 != v164);
      v162 = objc_msgSend_countByEnumeratingWithState_objects_count_(v153, v157, (uint64_t)&v402, (uint64_t)v420, 16, v161);
    }
    while (v162);
  }

  objc_msgSend_unionSet_(v383, v370, (uint64_t)v396, v371, v372, v373);
  objc_msgSend_minusSet_(v383, v374, (uint64_t)v394, v375, v376, v377);
  v378 = [CHStrokeGroupingResult alloc];
  v381 = (void *)objc_msgSend_initWithStrokeGroups_createdStrokeGroups_deletedStrokeGroups_(v378, v379, (uint64_t)v383, (uint64_t)v396, (uint64_t)v394, v380);

  return v381;
}

- (id)recognizableDrawingForStrokeGroup:(id)a3 translationVector:(CGVector)a4 originalDrawing:(id *)a5 orderedStrokesIDs:(id *)a6 rescalingFactor:(double *)a7 replacementStrokeGroup:(id *)a8
{
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CHDrawing *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t i;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  CHDrawing *v69;
  CHDrawing *v70;
  const char *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  id *v83;
  void *v86;
  id obj;
  CHDrawing *v88;
  _QWORD v89[4];
  CHDrawing *v90;
  CHDrawing *v91;
  uint64_t v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v88 = objc_alloc_init(CHDrawing);
  v83 = a5;
  if (a5)
  {
    v16 = objc_alloc_init(CHDrawing);
    objc_msgSend_strokeIdentifiers(v10, v17, v18, v19, v20, v21);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
    {
LABEL_3:
      objc_msgSend_allObjects(v27, v22, v23, v24, v25, v26, a5);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_strokesForIdentifiers_(self, v29, (uint64_t)v28, v30, v31, v32);
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_sortedArrayUsingComparator_(v33, v34, (uint64_t)&unk_1E77F1850, v35, v36, v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_4;
    }
  }
  else
  {
    v16 = 0;
    objc_msgSend_strokeIdentifiers(v10, v11, v12, v13, v14, v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (self)
      goto LABEL_3;
  }
  v38 = 0;
LABEL_4:

  v86 = v10;
  objc_msgSend_bounds(v10, v39, v40, v41, v42, v43);
  v45 = v44;
  v47 = v46;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v48, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  obj = v38;
  v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v94, (uint64_t)v98, 16, v55);
  if (v56)
  {
    v57 = v56;
    v58 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v57; ++i)
      {
        if (*(_QWORD *)v95 != v58)
          objc_enumerationMutation(obj);
        v67 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        v68 = (void *)objc_opt_class();
        v89[0] = MEMORY[0x1E0C809B0];
        v89[1] = 3221225472;
        v89[2] = sub_1BE78AAD8;
        v89[3] = &unk_1E77F4C50;
        v69 = v16;
        v90 = v69;
        v92 = v45;
        v93 = v47;
        v70 = v88;
        v91 = v70;
        objc_msgSend_enumeratePointsForStroke_interpolationType_resolution_usingBlock_(v68, v71, (uint64_t)v67, 0, 1, (uint64_t)v89);
        objc_msgSend_endStroke(v70, v72, v73, v74, v75, v76);
        if (v16)
          objc_msgSend_endStroke(v69, v77, v78, v79, v80, v81);
        objc_msgSend_encodedStrokeIdentifier(v67, v77, v78, v79, v80, v81, v83);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v53, v61, (uint64_t)v60, v62, v63, v64);

      }
      v57 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v65, (uint64_t)&v94, (uint64_t)v98, 16, v66);
    }
    while (v57);
  }

  if (v83)
    *v83 = objc_retainAutorelease(v16);
  if (a6)
    *a6 = objc_retainAutorelease(v53);
  if (a8)
    *a8 = 0;

  return v88;
}

@end
