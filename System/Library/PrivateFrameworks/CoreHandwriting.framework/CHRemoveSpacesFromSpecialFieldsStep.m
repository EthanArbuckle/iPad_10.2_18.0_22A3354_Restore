@implementation CHRemoveSpacesFromSpecialFieldsStep

- (CHRemoveSpacesFromSpecialFieldsStep)initWithPatternFst:(id)a3 patternType:(int64_t)a4 capitalizationToSplit:(BOOL)a5 convertToLowercase:(BOOL)a6
{
  id v11;
  CHRemoveSpacesFromSpecialFieldsStep *v12;
  CHRemoveSpacesFromSpecialFieldsStep *v13;
  objc_super v15;

  v11 = a3;
  v15.receiver = self;
  v15.super_class = (Class)CHRemoveSpacesFromSpecialFieldsStep;
  v12 = -[CHRemoveSpacesFromSpecialFieldsStep init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_patternFST, a3);
    v13->_patternType = a4;
    v13->_capitalizationToSplit = a5;
    v13->_convertToLowercase = a6;
  }

  return v13;
}

- (id)process:(id)a3 options:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
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
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  BOOL v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
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
  void *v137;
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
  void *v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  __objc2_class **v152;
  uint64_t v153;
  uint64_t v154;
  id v155;
  __objc2_class *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  void *v182;
  id v183;
  id v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  _BOOL4 v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  double v238;
  double v239;
  const char *v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  double v245;
  double v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  double v252;
  double v253;
  const char *v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  double v259;
  double v260;
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
  uint64_t v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  double v284;
  double v285;
  double v286;
  double v287;
  double v288;
  double v289;
  double v290;
  double v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  const char *v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  const char *v310;
  uint64_t v311;
  uint64_t v312;
  uint64_t v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  void *v324;
  const char *v325;
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
  void *v340;
  const char *v341;
  uint64_t v342;
  const char *v343;
  uint64_t v344;
  const char *v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  void *v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  const char *v371;
  uint64_t v372;
  uint64_t v373;
  uint64_t v374;
  const char *v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  const char *v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  void *v384;
  const char *v385;
  uint64_t v386;
  uint64_t v387;
  uint64_t v388;
  uint64_t v389;
  void *v390;
  const char *v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  void *v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  id *v400;
  id *v401;
  void *v403;
  const char *v404;
  uint64_t v405;
  uint64_t v406;
  void *v407;
  id *v408;
  void *v409;
  void *v410;
  id v411;
  void *v412;
  void *v413;
  __CFString *v414;
  unint64_t i;
  void *v416;
  unint64_t j;
  id obj;
  double v419;
  double v420;
  double v421;
  double v422;
  void *v423;
  void *v424;
  uint64_t v425;
  id *v426;
  uint64_t v427;
  void *v428;
  void *v430;
  _OWORD v431[8];
  __int128 v432;
  __int128 v433;
  __int128 v434;
  __int128 v435;
  uint8_t buf[16];
  _BYTE v437[128];
  uint64_t v438;

  v438 = *MEMORY[0x1E0C80C00];
  v426 = (id *)a3;
  v411 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEBUG, "CHRemoveSpacesFromSpecialFieldsStep is running", buf, 2u);
  }

  objc_msgSend_leftContext(v426, v6, v7, v8, v9, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16
    || (objc_msgSend_leftContext(v426, v11, v12, v13, v14, v15),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v23 = objc_msgSend_length(v17, v18, v19, v20, v21, v22) == 0,
        v17,
        v16,
        v23))
  {
    v414 = &stru_1E77F6F28;
  }
  else
  {
    objc_msgSend_leftContext(v426, v11, v24, v25, v26, v15);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v28, v29, v30, v31, v32);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_stringByTrimmingCharactersInSet_(v27, v34, (uint64_t)v33, v35, v36, v37);
    v414 = (__CFString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v38, v39, v40, v41, v42);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_componentsSeparatedByCharactersInSet_(v414, v44, (uint64_t)v43, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend_count(v48, v49, v50, v51, v52, v53) >= 2)
    {
      v401 = v426;
      v412 = v414;
      v414 = &stru_1E77F6F28;
      goto LABEL_44;
    }

  }
  objc_msgSend_rootCursorForPatternType_inNetwork_forFirstSegmentGroup_(CHPatternNetwork, v11, self->_patternType, (uint64_t)self->_patternFST, 0, v15);
  v412 = (void *)objc_claimAutoreleasedReturnValue();
  v413 = (void *)objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v54, (uint64_t)v414, (uint64_t)v412, (uint64_t)self->_patternFST, v55);
  if (v413)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v56, v57, v58, v59, v60);
    v409 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v61, v62, v63, v64, v65);
    v410 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; ++i)
    {
      objc_msgSend_result(v426, v66, v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v71, v72, v73, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = i < objc_msgSend_count(v77, v78, v79, v80, v81, v82);

      if (!v83)
        break;
      objc_msgSend_result(v426, v84, v85, v86, v87, v88);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v89, v90, v91, v92, v93, v94);
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v95, v96, i, v97, v98, v99);
      v416 = (void *)objc_claimAutoreleasedReturnValue();

      v100 = v413;
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v101, v102, v103, v104, v105);
      v423 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v106, v107, v108, v109, v110);
      v424 = (void *)objc_claimAutoreleasedReturnValue();
      for (j = 0; j < objc_msgSend_length(v416, v111, v112, v113, v114, v115); ++j)
      {
        v120 = objc_msgSend_indexAtPosition_(v416, v116, j, v117, v118, v119);
        objc_msgSend_result(v426, v121, v122, v123, v124, v125);
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_tokenColumns(v126, v127, v128, v129, v130, v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v132, v133, j, v134, v135, v136);
        v137 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_textTokenRows(v137, v138, v139, v140, v141, v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v143, v144, v120, v145, v146, v147);
        v148 = (void *)objc_claimAutoreleasedReturnValue();

        v434 = 0u;
        v435 = 0u;
        v432 = 0u;
        v433 = 0u;
        obj = v148;
        v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v149, (uint64_t)&v432, (uint64_t)v437, 16, v150);
        v152 = off_1E77EE000;
        if (v151)
        {
          v425 = *(_QWORD *)v433;
          do
          {
            v427 = v151;
            v153 = 0;
            v154 = (uint64_t)v100;
            do
            {
              v428 = (void *)v154;
              if (*(_QWORD *)v433 != v425)
                objc_enumerationMutation(obj);
              v155 = *(id *)(*((_QWORD *)&v432 + 1) + 8 * v153);
              v156 = v152[6];
              objc_msgSend_string(v155, v157, v158, v159, v160, v161);
              v162 = (void *)objc_claimAutoreleasedReturnValue();
              v430 = (void *)objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(v156, v163, (uint64_t)v162, v154, (uint64_t)self->_patternFST, v164);

              objc_msgSend_string(v155, v165, v166, v167, v168, v169);
              v170 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstComposedCharacter(v170, v171, v172, v173, v174, v175);
              v176 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_uppercaseLetterCharacterSet(MEMORY[0x1E0CB3500], v177, v178, v179, v180, v181);
              v182 = (void *)objc_claimAutoreleasedReturnValue();
              v183 = v176;
              v184 = v182;
              if (objc_msgSend_length(v183, v185, v186, v187, v188, v189))
              {
                objc_msgSend_stringByTrimmingCharactersInSet_(v183, v190, (uint64_t)v184, v191, v192, v193);
                v194 = (void *)objc_claimAutoreleasedReturnValue();
                v200 = objc_msgSend_length(v194, v195, v196, v197, v198, v199) == 0;

              }
              else
              {
                v200 = 0;
              }

              v206 = v155;
              if (v430)
              {
                if (!v200 || (v206 = v155, !self->_capitalizationToSplit))
                {
                  objc_msgSend_string(v155, v201, v202, v203, v204, v205);
                  v212 = (void *)objc_claimAutoreleasedReturnValue();
                  if (self->_convertToLowercase)
                  {
                    objc_msgSend_string(v155, v207, v208, v209, v210, v211);
                    v213 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_lowercaseString(v213, v214, v215, v216, v217, v218);
                    v219 = objc_claimAutoreleasedReturnValue();

                    v212 = (void *)v219;
                  }
                  v220 = objc_msgSend_properties(v155, v207, v208, v209, v210, v211);
                  objc_msgSend_strokeIndexes(v155, v221, v222, v223, v224, v225);
                  v226 = (void *)objc_claimAutoreleasedReturnValue();
                  v232 = objc_msgSend_wordID(v155, v227, v228, v229, v230, v231);
                  objc_msgSend_modelScore(v155, v233, v234, v235, v236, v237);
                  v239 = v238;
                  objc_msgSend_recognitionScore(v155, v240, v241, v242, v243, v244);
                  v246 = v245;
                  objc_msgSend_combinedScore(v155, v247, v248, v249, v250, v251);
                  v253 = v252;
                  objc_msgSend_alignmentScore(v155, v254, v255, v256, v257, v258);
                  v260 = v259;
                  objc_msgSend_recognizerSourceLocale(v155, v261, v262, v263, v264, v265);
                  v266 = (void *)objc_claimAutoreleasedReturnValue();
                  v419 = v260;
                  v420 = v253;
                  v421 = v246;
                  v422 = v239;
                  v272 = objc_msgSend_inputSources(v155, v267, v268, v269, v270, v271);
                  v278 = objc_msgSend_substrokeCount(v155, v273, v274, v275, v276, v277);
                  objc_msgSend_bounds(v155, v279, v280, v281, v282, v283);
                  v285 = v284;
                  v287 = v286;
                  v289 = v288;
                  v291 = v290;
                  objc_msgSend_originalBounds(v155, v292, v293, v294, v295, v296);
                  v303 = v302;
                  v305 = v304;
                  v307 = v306;
                  v309 = v308;
                  if (v155)
                    objc_msgSend_principalLines(v155, v297, v298, v299, v300, v301);
                  else
                    memset(v431, 0, sizeof(v431));
                  objc_msgSend_tokenWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_originalBounds_principalLines_(CHTokenizedTextResultToken, v297, (uint64_t)v212, (uint64_t)v226, v232, v220 & 0xFFFFFFFFFFFFFF9FLL | 0x40, v266, v272 | 0x200, v422, v421, v420, v419, v285, v287, v289, v291, v278, v303, v305,
                    v307,
                    v309,
                    v431);
                  v206 = (void *)objc_claimAutoreleasedReturnValue();

                }
              }
              if (objc_msgSend_isTopOriginal(v155, v201, v202, v203, v204, v205))
                objc_msgSend_addObject_(v423, v310, (uint64_t)v155, v311, v312, v313);
              else
                objc_msgSend_addObject_(v423, v310, (uint64_t)v206, v311, v312, v313);
              objc_msgSend_addObject_(v424, v314, (uint64_t)v206, v315, v316, v317);
              v318 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend_result(v426, v319, v320, v321, v322, v323);
              v324 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_precedingSeparatorForToken_(v324, v325, (uint64_t)v206, v326, v327, v328);
              v329 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_string(v206, v330, v331, v332, v333, v334);
              v335 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_stringWithFormat_(v318, v336, (uint64_t)CFSTR("%@%@"), v337, v338, v339, v329, v335);
              v340 = (void *)objc_claimAutoreleasedReturnValue();

              v100 = (id)objc_msgSend_newCursorByAdvancingWithString_fromCursor_inNetwork_(CHPatternNetwork, v341, (uint64_t)v340, (uint64_t)v428, (uint64_t)self->_patternFST, v342);
              ++v153;
              v154 = (uint64_t)v100;
              v152 = off_1E77EE000;
            }
            while (v427 != v153);
            v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v343, (uint64_t)&v432, (uint64_t)v437, 16, v344);
          }
          while (v151);
        }

      }
      objc_msgSend_addObject_(v409, v116, (uint64_t)v424, v117, v118, v119);
      objc_msgSend_result(v426, v345, v346, v347, v348, v349);
      v350 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v350, v351, v352, v353, v354, v355);
      v356 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v356, v357, i, v358, v359, v360);
      v361 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v410, v362, (uint64_t)v361, v363, v364, v365);

      if ((objc_msgSend_modifiesOriginalTokens(self, v366, v367, v368, v369, v370) & 1) == 0
        && (objc_msgSend_isEqualToArray_(v423, v371, (uint64_t)v424, v372, v373, v374) & 1) == 0)
      {
        objc_msgSend_addObject_(v409, v375, (uint64_t)v423, v376, v377, v378);
        objc_msgSend_result(v426, v379, v380, v381, v382, v383);
        v384 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v384, v385, v386, v387, v388, v389);
        v390 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v390, v391, i, v392, v393, v394);
        v395 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v410, v396, (uint64_t)v395, v397, v398, v399);

      }
    }
    objc_msgSend_result(v426, v84, v85, v86, v87, v88);
    v403 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v403, v404, (uint64_t)v409, (uint64_t)v410, v405, v406);
    v407 = (void *)objc_claimAutoreleasedReturnValue();
    if (v426)
      objc_storeStrong(v426 + 3, v407);

    v408 = v426;
    v48 = v413;
  }
  else
  {
    v400 = v426;
    v48 = 0;
  }
LABEL_44:

  return v426;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_patternFST, 0);
}

@end
