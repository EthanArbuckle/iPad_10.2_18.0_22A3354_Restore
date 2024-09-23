@implementation CHPromoteInLexiconCandidatesStep

- (CHPromoteInLexiconCandidatesStep)initWithStaticLexicon:(_LXLexicon *)a3 customLexicon:(_LXLexicon *)a4
{
  CHPromoteInLexiconCandidatesStep *result;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CHPromoteInLexiconCandidatesStep;
  result = -[CHPromoteInLexiconCandidatesStep init](&v7, sel_init);
  if (result)
  {
    result->_staticLexicon = a3;
    result->_customLexicon = a4;
  }
  return result;
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
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
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
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
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
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  unint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  char HasMatchingString;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  double v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  _BOOL4 v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  int v153;
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
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
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
  uint64_t v182;
  double v183;
  double v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
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
  double v200;
  double v201;
  double v202;
  int v203;
  NSObject *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
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
  void *v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  const char *v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  void *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  unint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  BOOL v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  void *v289;
  const char *v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  void *v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  void *v306;
  const char *v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  void *v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  void *v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  id v325;
  const char *v326;
  const char *v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
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
  void *v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  void *v347;
  const char *v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  NSObject *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  id v358;
  char v359;
  void *v360;
  void *v361;
  uint64_t v362;
  void *v363;
  void *v364;
  uint64_t v366;
  id *v367;
  _QWORD v368[4];
  id v369;
  uint8_t buf[4];
  void *v371;
  __int16 v372;
  void *v373;
  uint64_t v374;

  v374 = *MEMORY[0x1E0C80C00];
  v367 = (id *)a3;
  v358 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEBUG, "CHPromoteInLexiconCandidatesStep is running", buf, 2u);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9, v10);
  v361 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13, v14, v15);
  v360 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_result(v367, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transcriptionPaths(v21, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v27, v28, v29, v30, v31, v32);
  v363 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v33, v34, v35, v36, v37);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v359 = 0;
  while (1)
  {
    objc_msgSend_result(v367, v38, v39, v40, v41, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v366 = v43;
    v50 = v43 < objc_msgSend_tokenColumnCount(v44, v45, v46, v47, v48, v49);

    if (!v50)
      break;
    v55 = objc_msgSend_indexAtPosition_(v363, v51, v366, v52, v53, v54);
    objc_msgSend_result(v367, v56, v57, v58, v59, v60);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenRowsAtColumnIndex_(v61, v62, v366, v63, v64, v65);
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectAtIndexedSubscript_(v66, v67, v55, v68, v69, v70);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = objc_msgSend_count(v71, v72, v73, v74, v75, v76);

    v83 = objc_msgSend_count(v66, v78, v79, v80, v81, v82);
    if (v77 != 1 || v83 < 2)
      goto LABEL_38;
    objc_msgSend_objectAtIndexedSubscript_(v66, v84, v55, v85, v86, v87);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v88, v89, 0, v90, v91, v92);
    v93 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(v93, v94, v95, v96, v97, v98);
    v99 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v100, (uint64_t)v99, (uint64_t)self->_staticLexicon, 0, v101) & 1) != 0)HasMatchingString = 1;
    else
      HasMatchingString = objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v102, (uint64_t)v99, (uint64_t)self->_customLexicon, 0, v105);
    objc_msgSend_objectAtIndexedSubscript_(v66, v102, v55, v103, v104, v105);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v107, v108, 0, v109, v110, v111);
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = objc_msgSend_inputSources(v112, v113, v114, v115, v116, v117);

    if ((HasMatchingString & 1) != 0 || (unint64_t)objc_msgSend_length(v99, v119, v120, v121, v122, v123) < 3)
    {

LABEL_38:
      v237 = v55;
      goto LABEL_39;
    }

    if ((v118 & 0x10) != 0)
      goto LABEL_38;
    v125 = 0;
    v126 = 0.25;
    v362 = 0x7FFFFFFFFFFFFFFFLL;
    while (v125 < objc_msgSend_count(v66, v84, v124, v85, v86, v87))
    {
      objc_msgSend_objectAtIndexedSubscript_(v66, v84, v125, v85, v86, v87);
      v127 = (void *)objc_claimAutoreleasedReturnValue();
      v134 = objc_msgSend_count(v127, v128, v129, v130, v131, v132) == 1 && v55 != v125;

      if (v134)
      {
        objc_msgSend_objectAtIndexedSubscript_(v66, v84, v125, v85, v86, v87);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v135, v136, 0, v137, v138, v139);
        v140 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_string(v140, v141, v142, v143, v144, v145);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v147, (uint64_t)v146, (uint64_t)self->_staticLexicon, 0, v148) & 1) != 0)
        {
          v153 = 1;
        }
        else
        {
          objc_msgSend_objectAtIndexedSubscript_(v66, v149, v125, v150, v151, v152);
          v154 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectAtIndexedSubscript_(v154, v155, 0, v156, v157, v158);
          v159 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_string(v159, v160, v161, v162, v163, v164);
          v165 = (void *)objc_claimAutoreleasedReturnValue();
          v153 = objc_msgSend_lexiconHasEntryForString_withLexicon_outHasMatchingString_(CHLanguageUtilities, v166, (uint64_t)v165, (uint64_t)self->_customLexicon, 0, v167);

        }
        objc_msgSend_objectAtIndexedSubscript_(v66, v168, v55, v169, v170, v171);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v172, v173, 0, v174, v175, v176);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recognitionScore(v177, v178, v179, v180, v181, v182);
        v184 = v183;
        objc_msgSend_objectAtIndexedSubscript_(v66, v185, v125, v186, v187, v188);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v189, v190, 0, v191, v192, v193);
        v194 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recognitionScore(v194, v195, v196, v197, v198, v199);
        v201 = v200;

        v202 = v184 - v201;
        v203 = v202 < v126 ? v153 : 0;
        if (v203 == 1)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v204 = (id)qword_1EF568E20;
          if (os_log_type_enabled(v204, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend_objectAtIndexedSubscript_(v66, v205, v125, v206, v207, v208);
            v209 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v209, v210, 0, v211, v212, v213);
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_string(v214, v215, v216, v217, v218, v219);
            v220 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v66, v221, v55, v222, v223, v224);
            v225 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v225, v226, 0, v227, v228, v229);
            v230 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_string(v230, v231, v232, v233, v234, v235);
            v236 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v371 = v220;
            v372 = 2112;
            v373 = v236;
            _os_log_impl(&dword_1BE607000, v204, OS_LOG_TYPE_DEBUG, "CHPromoteInLexiconCandidatesStep promoting %@ over %@", buf, 0x16u);

          }
          v359 = 1;
          v362 = v125;
          v126 = v202;
        }
      }
      ++v125;
    }
    v237 = v362;
    if (v362 == 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_38;
LABEL_39:
    objc_msgSend_objectAtIndexedSubscript_(v66, v84, v237, v85, v86, v87);
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v364, v239, (uint64_t)v238, v240, v241, v242);

    v43 = v366 + 1;
  }
  if ((v359 & 1) != 0)
  {
    objc_msgSend_addObject_(v361, v51, (uint64_t)v364, v52, v53, v54);
    objc_msgSend_result(v367, v243, v244, v245, v246, v247);
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v248, v249, v250, v251, v252, v253);
    v254 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v254, v255, 0, v256, v257, v258);
    v259 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v360, v260, (uint64_t)v259, v261, v262, v263);

    v269 = 0;
    v270 = MEMORY[0x1E0C809B0];
    while (1)
    {
      objc_msgSend_result(v367, v264, v265, v266, v267, v268);
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v271, v272, v273, v274, v275, v276);
      v277 = (void *)objc_claimAutoreleasedReturnValue();
      v283 = v269 < objc_msgSend_count(v277, v278, v279, v280, v281, v282);

      if (!v283)
        break;
      objc_msgSend_result(v367, v284, v285, v286, v287, v288);
      v289 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v289, v290, v291, v292, v293, v294);
      v295 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v295, v296, v269, v297, v298, v299);
      v300 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v301, v302, v303, v304, v305);
      v306 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v367, v307, v308, v309, v310, v311);
      v312 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v367, v313, v314, v315, v316, v317);
      v318 = (void *)objc_claimAutoreleasedReturnValue();
      v324 = objc_msgSend_tokenColumnCount(v318, v319, v320, v321, v322, v323);
      v368[0] = v270;
      v368[1] = 3221225472;
      v368[2] = sub_1BE8AA330;
      v368[3] = &unk_1E77F4928;
      v325 = v306;
      v369 = v325;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v312, v326, (uint64_t)v300, 0, v324, (uint64_t)v368);

      objc_msgSend_addObject_(v361, v327, (uint64_t)v325, v328, v329, v330);
      objc_msgSend_result(v367, v331, v332, v333, v334, v335);
      v336 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPathScores(v336, v337, v338, v339, v340, v341);
      v342 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v342, v343, v269, v344, v345, v346);
      v347 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v360, v348, (uint64_t)v347, v349, v350, v351);

      ++v269;
    }
    objc_msgSend_result(v367, v284, v285, v286, v287, v288);
    v352 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v352, v353, (uint64_t)v361, (uint64_t)v360, v354, v355);
    v356 = (void *)objc_claimAutoreleasedReturnValue();
    if (v367)
      objc_storeStrong(v367 + 3, v356);

  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v352 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v352, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v352, OS_LOG_TYPE_DEBUG, "CHPromoteInLexiconCandidatesStep did not find any suitable tokens for promotion", buf, 2u);
    }
  }

  return v367;
}

@end
