@implementation CHPreserveOriginalRecognitionStep

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  NSObject *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int shouldAdjustColumnsFromPostprocessingStepOptions;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t i;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
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
  uint64_t v83;
  id v84;
  const char *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
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
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  void *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  unint64_t j;
  void *v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  unint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  void *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  CHMutableTokenizedTextResult *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
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
  const char *v237;
  uint64_t v238;
  uint64_t v239;
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
  uint64_t v254;
  const char *v255;
  void *v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  uint64_t v274;
  void *v275;
  id v276;
  void *v277;
  void *v278;
  id v279;
  _QWORD v280[4];
  id v281;
  _QWORD v282[4];
  id v283;
  unint64_t v284;
  uint8_t buf[16];

  v5 = (id *)a3;
  v276 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHPreserveOriginalRecognitionStep is running", buf, 2u);
  }

  v7 = (void *)objc_opt_class();
  shouldAdjustColumnsFromPostprocessingStepOptions = objc_msgSend_shouldAdjustColumnsFromPostprocessingStepOptions_(v7, v8, (uint64_t)v276, v9, v10, v11);
  v18 = (void *)MEMORY[0x1E0C99DE8];
  if (shouldAdjustColumnsFromPostprocessingStepOptions)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16, v17);
    v279 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v19, v20, v21, v22, v23);
    v277 = (void *)objc_claimAutoreleasedReturnValue();
    for (i = 0; ; ++i)
    {
      objc_msgSend_result(v5, v24, v25, v26, v27, v28);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v30, v31, v32, v33, v34, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = objc_msgSend_count(v36, v37, v38, v39, v40, v41);

      if (i >= v42)
        break;
      objc_msgSend_result(v5, v43, v44, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v48, v49, v50, v51, v52, v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v54, v55, i, v56, v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v60, v61, v62, v63, v64);
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v66, v67, v68, v69, v70);
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_result(v5, v72, v73, v74, v75, v76);
      v77 = (void *)objc_claimAutoreleasedReturnValue();
      v83 = objc_msgSend_tokenColumnCount(v77, v78, v79, v80, v81, v82);
      v282[0] = MEMORY[0x1E0C809B0];
      v282[1] = 3221225472;
      v282[2] = sub_1BE8A45E0;
      v282[3] = &unk_1E77F6690;
      v284 = i;
      v84 = v65;
      v283 = v84;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v71, v85, (uint64_t)v59, 0, v83, (uint64_t)v282);

      if (objc_msgSend_count(v84, v86, v87, v88, v89, v90))
      {
        objc_msgSend_addObject_(v279, v91, (uint64_t)v84, v92, v93, v94);
        objc_msgSend_result(v5, v95, v96, v97, v98, v99);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v100, v101, v102, v103, v104, v105);
        v106 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v106, v107, i, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v277, v112, (uint64_t)v111, v113, v114, v115);

      }
    }
    objc_msgSend_result(v5, v43, v44, v45, v46, v47);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v268, v269, (uint64_t)v279, (uint64_t)v277, v270, v271);
    v272 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_storeStrong(v5 + 3, v272);

    v267 = v277;
  }
  else
  {
    objc_msgSend_result(v5, v13, v14, v15, v16, v17);
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenColumns(v116, v117, v118, v119, v120, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v128 = objc_msgSend_count(v122, v123, v124, v125, v126, v127);
    objc_msgSend_arrayWithCapacity_(v18, v129, v128, v130, v131, v132);
    v133 = (void *)objc_claimAutoreleasedReturnValue();

    for (j = 0; ; ++j)
    {
      objc_msgSend_result(v5, v134, v135, v136, v137, v138);
      v140 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokenColumns(v140, v141, v142, v143, v144, v145);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      v152 = objc_msgSend_count(v146, v147, v148, v149, v150, v151);

      if (j >= v152)
        break;
      objc_msgSend_result(v5, v153, v154, v155, v156, v157);
      v158 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokenColumns(v158, v159, v160, v161, v162, v163);
      v164 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndexedSubscript_(v164, v165, j, v166, v167, v168);
      v169 = (void *)objc_claimAutoreleasedReturnValue();
      v175 = (void *)objc_msgSend_mutableCopy(v169, v170, v171, v172, v173, v174);
      objc_msgSend_addObject_(v133, v176, (uint64_t)v175, v177, v178, v179);

    }
    objc_msgSend_result(v5, v153, v154, v155, v156, v157);
    v180 = (void *)objc_claimAutoreleasedReturnValue();
    v280[0] = MEMORY[0x1E0C809B0];
    v280[1] = 3221225472;
    v280[2] = sub_1BE8A483C;
    v280[3] = &unk_1E77F4928;
    v279 = v133;
    v281 = v279;
    objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v180, v181, (uint64_t)v280, v182, v183, v184);

    objc_msgSend_result(v5, v185, v186, v187, v188, v189);
    v190 = (void *)objc_claimAutoreleasedReturnValue();
    v274 = objc_msgSend_baseWritingDirection(v190, v191, v192, v193, v194, v195);

    v196 = [CHMutableTokenizedTextResult alloc];
    objc_msgSend_result(v5, v197, v198, v199, v200, v201);
    v202 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v202, v203, v204, v205, v206, v207);
    v278 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v208, v209, v210, v211, v212);
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v275, v213, v214, v215, v216, v217);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v219, v220, v221, v222, v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_trailingSeparator(v224, v225, v226, v227, v228, v229);
    v230 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v231, v232, v233, v234, v235);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    v242 = objc_msgSend_recognizerGenerationIdentifier(v236, v237, v238, v239, v240, v241);
    objc_msgSend_result(v5, v243, v244, v245, v246, v247);
    v248 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = objc_msgSend_changeableTokenColumnCount(v248, v249, v250, v251, v252, v253);
    v256 = (void *)objc_msgSend_initWithTokenColumns_transcriptionPaths_scores_trailingSeparator_recognizerGenerationIdentifier_changeableColumnCount_(v196, v255, (uint64_t)v279, (uint64_t)v278, (uint64_t)v218, (uint64_t)v230, v242, v254);
    if (v5)
      objc_storeStrong(v5 + 3, v256);

    objc_msgSend_result(v5, v257, v258, v259, v260, v261);
    v262 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setBaseWritingDirection_(v262, v263, v274, v264, v265, v266);

    v267 = v281;
  }

  return v5;
}

@end
