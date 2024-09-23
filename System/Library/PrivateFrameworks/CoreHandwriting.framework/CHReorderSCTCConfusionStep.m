@implementation CHReorderSCTCConfusionStep

- (CHReorderSCTCConfusionStep)initWithMaxResultCount:(int64_t)a3
{
  CHReorderSCTCConfusionStep *v4;
  CHReorderSCTCConfusionStep *v5;
  objc_super v7;
  __int128 v8;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CHReorderSCTCConfusionStep;
  v4 = -[CHReorderSCTCConfusionStep init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_maxResultCount = a3;
    v8 = *(_OWORD *)"T";
    v9[0] = *(_OWORD *)L"nal-Simplified";
    *(_OWORD *)((char *)v9 + 14) = *(_OWORD *)L"plified";
    v4->_icuTransliterator = (void **)utrans_openU();
  }
  return v5;
}

- (id)process:(id)a3 options:(id)a4
{
  NSObject *v6;
  int64_t maxResultCount;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
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
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  id v95;
  id v96;
  const char *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  const char *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  id v129;
  const char *v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t i;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  id v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t j;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  id v173;
  const char *v174;
  uint64_t v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t k;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  int isEqual;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  void *v228;
  uint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  void *v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  void *v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  void *v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  BOOL v308;
  void *v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  id v343;
  const char *v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  void *v354;
  const char *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  void *v360;
  const char *v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  void *v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  id v375;
  void *v376;
  void *v377;
  void *v378;
  void *v379;
  int64_t v380;
  void *v381;
  id *v382;
  unint64_t v383;
  _QWORD v384[4];
  id v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  _QWORD v398[4];
  id v399;
  _QWORD v400[4];
  id v401;
  CHReorderSCTCConfusionStep *v402;
  id v403;
  uint8_t buf[8];
  _BYTE v405[128];
  _BYTE v406[128];
  _BYTE v407[128];
  uint64_t v408;

  v408 = *MEMORY[0x1E0C80C00];
  v382 = (id *)a3;
  v375 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHReorderSCTCConfusionStep is running", buf, 2u);
  }

  maxResultCount = self->_maxResultCount;
  objc_msgSend_result(v382, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v13, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v380 = maxResultCount;
  LOBYTE(maxResultCount) = (unint64_t)objc_msgSend_count(v19, v20, v21, v22, v23, v24) < 2;

  if ((maxResultCount & 1) == 0)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29);
    v377 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v30, v31, v32, v33, v34);
    v376 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v382, v35, v36, v37, v38, v39);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v40, v41, v42, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v46, v47, 0, v48, v49, v50);
    v374 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_result(v382, v51, v52, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v56, v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v62, v63, 1, v64, v65, v66);
    v373 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v67, v68, v69, v70, v71);
    v370 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v72, v73, v74, v75, v76);
    v371 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v382, v77, v78, v79, v80, v81);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v382, v83, v84, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_tokenColumnCount(v88, v89, v90, v91, v92, v93);
    v400[0] = MEMORY[0x1E0C809B0];
    v400[1] = 3221225472;
    v400[2] = sub_1BE8BBAC4;
    v400[3] = &unk_1E77F69C8;
    v95 = v370;
    v401 = v95;
    v402 = self;
    v96 = v371;
    v403 = v96;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v82, v97, (uint64_t)v374, 0, v94, (uint64_t)v400);

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v98, v99, v100, v101, v102);
    v372 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v382, v103, v104, v105, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v382, v109, v110, v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = objc_msgSend_tokenColumnCount(v114, v115, v116, v117, v118, v119);
    v398[0] = MEMORY[0x1E0C809B0];
    v398[1] = 3221225472;
    v398[2] = sub_1BE8BBD70;
    v398[3] = &unk_1E77F4928;
    v121 = v372;
    v399 = v121;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v108, v122, (uint64_t)v373, 0, v120, (uint64_t)v398);

    objc_msgSend_string(MEMORY[0x1E0CB37A0], v123, v124, v125, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    v396 = 0u;
    v397 = 0u;
    v394 = 0u;
    v395 = 0u;
    v129 = v96;
    v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v130, (uint64_t)&v394, (uint64_t)v407, 16, v131);
    if (v137)
    {
      v138 = *(_QWORD *)v395;
      do
      {
        for (i = 0; i != v137; ++i)
        {
          if (*(_QWORD *)v395 != v138)
            objc_enumerationMutation(v129);
          objc_msgSend_string(*(void **)(*((_QWORD *)&v394 + 1) + 8 * i), v132, v133, v134, v135, v136);
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v128, v141, (uint64_t)v140, v142, v143, v144);

        }
        v137 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v132, (uint64_t)&v394, (uint64_t)v407, 16, v136);
      }
      while (v137);
    }

    objc_msgSend_string(MEMORY[0x1E0CB37A0], v145, v146, v147, v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v392 = 0u;
    v393 = 0u;
    v390 = 0u;
    v391 = 0u;
    v151 = v95;
    v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v151, v152, (uint64_t)&v390, (uint64_t)v406, 16, v153);
    if (v159)
    {
      v160 = *(_QWORD *)v391;
      do
      {
        for (j = 0; j != v159; ++j)
        {
          if (*(_QWORD *)v391 != v160)
            objc_enumerationMutation(v151);
          objc_msgSend_string(*(void **)(*((_QWORD *)&v390 + 1) + 8 * j), v154, v155, v156, v157, v158);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v150, v163, (uint64_t)v162, v164, v165, v166);

        }
        v159 = objc_msgSend_countByEnumeratingWithState_objects_count_(v151, v154, (uint64_t)&v390, (uint64_t)v406, 16, v158);
      }
      while (v159);
    }

    objc_msgSend_string(MEMORY[0x1E0CB37A0], v167, v168, v169, v170, v171);
    v172 = (void *)objc_claimAutoreleasedReturnValue();
    v388 = 0u;
    v389 = 0u;
    v386 = 0u;
    v387 = 0u;
    v173 = v121;
    v181 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v174, (uint64_t)&v386, (uint64_t)v405, 16, v175);
    if (v181)
    {
      v182 = *(_QWORD *)v387;
      do
      {
        for (k = 0; k != v181; ++k)
        {
          if (*(_QWORD *)v387 != v182)
            objc_enumerationMutation(v173);
          objc_msgSend_string(*(void **)(*((_QWORD *)&v386 + 1) + 8 * k), v176, v177, v178, v179, v180);
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendString_(v172, v185, (uint64_t)v184, v186, v187, v188);

        }
        v181 = objc_msgSend_countByEnumeratingWithState_objects_count_(v173, v176, (uint64_t)&v386, (uint64_t)v405, 16, v180);
      }
      while (v181);
    }

    isEqual = objc_msgSend_isEqual_(v150, v189, (uint64_t)v172, v190, v191, v192);
    if (((objc_msgSend_isEqual_(v128, v194, (uint64_t)v172, v195, v196, v197) ^ 1 | isEqual) & 1) != 0)
    {
      objc_msgSend_addObject_(v377, v198, (uint64_t)v151, v199, v200, v201);
      objc_msgSend_result(v382, v202, v203, v204, v205, v206);
      v207 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v207, v208, v209, v210, v211, v212);
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v378, v213, 0, v214, v215, v216);
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      v223 = (void *)objc_msgSend_copy(v217, v218, v219, v220, v221, v222);
      objc_msgSend_addObject_(v376, v224, (uint64_t)v223, v225, v226, v227);
      v228 = v207;
      v229 = 1;
    }
    else
    {
      objc_msgSend_addObject_(v377, v198, (uint64_t)v173, v199, v200, v201);
      objc_msgSend_result(v382, v230, v231, v232, v233, v234);
      v235 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v235, v236, v237, v238, v239, v240);
      v241 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v241, v242, 1, v243, v244, v245);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      v252 = (void *)objc_msgSend_copy(v246, v247, v248, v249, v250, v251);
      objc_msgSend_addObject_(v376, v253, (uint64_t)v252, v254, v255, v256);

      objc_msgSend_addObject_(v377, v257, (uint64_t)v151, v258, v259, v260);
      objc_msgSend_result(v382, v261, v262, v263, v264, v265);
      v266 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v266, v267, v268, v269, v270, v271);
      v378 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v378, v272, 0, v273, v274, v275);
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      v223 = (void *)objc_msgSend_copy(v217, v276, v277, v278, v279, v280);
      objc_msgSend_addObject_(v376, v281, (uint64_t)v223, v282, v283, v284);
      v228 = v266;
      v229 = 2;
    }
    v383 = v229;

    if (v380 != 1)
    {
      while (1)
      {
        objc_msgSend_result(v382, v285, v286, v287, v288, v289);
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(v296, v297, v298, v299, v300, v301);
        v302 = (void *)objc_claimAutoreleasedReturnValue();
        v308 = v383 < objc_msgSend_count(v302, v303, v304, v305, v306, v307);

        if (!v308)
          break;
        objc_msgSend_result(v382, v285, v286, v287, v288, v289);
        v309 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(v309, v310, v311, v312, v313, v314);
        v315 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v315, v316, v383, v317, v318, v319);
        v381 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_array(MEMORY[0x1E0C99DE8], v320, v321, v322, v323, v324);
        v379 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v382, v325, v326, v327, v328, v329);
        v330 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_result(v382, v331, v332, v333, v334, v335);
        v336 = (void *)objc_claimAutoreleasedReturnValue();
        v342 = objc_msgSend_tokenColumnCount(v336, v337, v338, v339, v340, v341);
        v384[0] = MEMORY[0x1E0C809B0];
        v384[1] = 3221225472;
        v384[2] = sub_1BE8BBD7C;
        v384[3] = &unk_1E77F4928;
        v343 = v379;
        v385 = v343;
        objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v330, v344, (uint64_t)v381, 0, v342, (uint64_t)v384);

        objc_msgSend_addObject_(v377, v345, (uint64_t)v343, v346, v347, v348);
        objc_msgSend_result(v382, v349, v350, v351, v352, v353);
        v354 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v354, v355, v356, v357, v358, v359);
        v360 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v360, v361, v383, v362, v363, v364);
        v365 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v376, v366, (uint64_t)v365, v367, v368, v369);

        ++v383;
      }
    }
    objc_msgSend_result(v382, v285, v286, v287, v288, v289);
    v290 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v290, v291, (uint64_t)v377, (uint64_t)v376, v292, v293);
    v294 = (void *)objc_claimAutoreleasedReturnValue();
    if (v382)
      objc_storeStrong(v382 + 3, v294);

  }
  return v382;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_icuTransliterator)
  {
    utrans_close();
    self->_icuTransliterator = 0;
  }
  v3.receiver = self;
  v3.super_class = (Class)CHReorderSCTCConfusionStep;
  -[CHReorderSCTCConfusionStep dealloc](&v3, sel_dealloc);
}

@end
