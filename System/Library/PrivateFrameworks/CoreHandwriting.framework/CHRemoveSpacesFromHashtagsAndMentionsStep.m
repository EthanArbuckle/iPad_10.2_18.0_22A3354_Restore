@implementation CHRemoveSpacesFromHashtagsAndMentionsStep

- (id)process:(id)a3 options:(id)a4
{
  id *v5;
  NSObject *v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
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
  void *v53;
  const char *v54;
  uint64_t v55;
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
  __int128 v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
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
  uint64_t v84;
  id v85;
  id v86;
  const char *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  id v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  CHTokenizedTextResultToken *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  double v117;
  double v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  double v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  double v131;
  double v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  double v138;
  double v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  double v170;
  double v171;
  double v172;
  double v173;
  uint64_t v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
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
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  void *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  id v227;
  id *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  _QWORD v233[4];
  id v234;
  id v235;
  uint64_t *v236;
  uint64_t *v237;
  _QWORD *v238;
  uint8_t *v239;
  unint64_t v240;
  _QWORD v241[4];
  uint8_t buf[8];
  uint8_t *v243;
  uint64_t v244;
  __n128 (*v245)(uint64_t, uint64_t);
  uint64_t (*v246)();
  void *v247;
  __int128 v248;
  __int128 v249;
  uint64_t v250;
  uint64_t *v251;
  uint64_t v252;
  char v253;
  uint64_t v254;
  uint64_t *v255;
  uint64_t v256;
  uint64_t (*v257)(uint64_t, uint64_t);
  void (*v258)(uint64_t);
  id v259;

  v5 = (id *)a3;
  v227 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHRemoveSpacesFromHashtagsAndMentionsStep is running", buf, 2u);
  }

  v7 = 0x1E0C99000uLL;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v232 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16, v17);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  v228 = v5;
  while (1)
  {
    objc_msgSend_result(v5, v18, v19, v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v24, v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend_count(v30, v31, v32, v33, v34, v35);

    if (v23 >= v36)
      break;
    objc_msgSend_result(v5, v37, v38, v39, v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v42, v43, v44, v45, v46, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v48, v49, v23, v50, v51, v52);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(*(void **)(v7 + 3560), v54, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(*(void **)(v7 + 3560), v60, v61, v62, v63, v64);
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v254 = 0;
    v255 = &v254;
    v256 = 0x3032000000;
    v257 = sub_1BE8A7340;
    v258 = sub_1BE8A7350;
    v259 = 0;
    v250 = 0;
    v251 = &v250;
    v252 = 0x2020000000;
    v253 = 0;
    *(_QWORD *)buf = 0;
    v243 = buf;
    v244 = 0x5012000000;
    v245 = sub_1BE8B2614;
    v246 = nullsub_54;
    v247 = &unk_1BE94989A;
    v66 = *(_OWORD *)(MEMORY[0x1E0C9D628] + 16);
    v248 = *MEMORY[0x1E0C9D628];
    v249 = v66;
    v241[0] = 0;
    v241[1] = v241;
    v241[2] = 0x2020000000;
    v241[3] = 0x43E0000000000000;
    objc_msgSend_result(v5, v67, v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v5, v73, v74, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v84 = objc_msgSend_tokenColumnCount(v78, v79, v80, v81, v82, v83);
    v233[0] = MEMORY[0x1E0C809B0];
    v233[1] = 3221225472;
    v233[2] = sub_1BE8B2624;
    v233[3] = &unk_1E77F67F8;
    v85 = v65;
    v234 = v85;
    v240 = v23;
    v236 = &v254;
    v237 = &v250;
    v86 = v59;
    v235 = v86;
    v238 = v241;
    v239 = buf;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v72, v87, (uint64_t)v53, 0, v84, (uint64_t)v233);

    v93 = v255;
    v94 = (void *)v255[5];
    if (v94)
    {
      v230 = v53;
      v100 = v94;
      if (*((_BYTE *)v251 + 24))
      {
        objc_msgSend_string((void *)v93[5], v95, v96, v97, v98, v99);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v101, v102, (uint64_t)CFSTR(" "), (uint64_t)&stru_1E77F6F28, v103, v104);
        v229 = (void *)objc_claimAutoreleasedReturnValue();

        v105 = [CHTokenizedTextResultToken alloc];
        objc_msgSend_strokeIndexes((void *)v255[5], v106, v107, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_modelScore((void *)v255[5], v112, v113, v114, v115, v116);
        v118 = v117;
        objc_msgSend_recognitionScore((void *)v255[5], v119, v120, v121, v122, v123);
        v125 = v124;
        objc_msgSend_combinedScore((void *)v255[5], v126, v127, v128, v129, v130);
        v132 = v131;
        objc_msgSend_alignmentScore((void *)v255[5], v133, v134, v135, v136, v137);
        v139 = v138;
        v145 = objc_msgSend_properties((void *)v255[5], v140, v141, v142, v143, v144);
        objc_msgSend_recognizerSourceLocale((void *)v255[5], v146, v147, v148, v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        v157 = objc_msgSend_inputSources((void *)v255[5], v152, v153, v154, v155, v156);
        v163 = objc_msgSend_substrokeCount((void *)v255[5], v158, v159, v160, v161, v162);
        objc_msgSend_bounds((void *)v255[5], v164, v165, v166, v167, v168);
        v174 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v105, v169, (uint64_t)v229, (uint64_t)v111, 0, v145, v151, v157 | 0x200, v118, v125, v132, v139, v170, v171, v172, v173, v163);

        v100 = (id)v174;
      }
      objc_msgSend_addObject_(v86, v95, (uint64_t)v100, v97, v98, v99);

      v53 = v230;
    }
    v5 = v228;
    if (objc_msgSend_count(v86, v88, v89, v90, v91, v92))
    {
      if ((objc_msgSend_isEqual_(v86, v175, (uint64_t)v85, v176, v177, v178) & 1) == 0)
      {
        objc_msgSend_addObject_(v232, v175, (uint64_t)v86, v176, v177, v178);
        objc_msgSend_result(v228, v179, v180, v181, v182, v183);
        v184 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPathScores(v184, v185, v186, v187, v188, v189);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v190, v191, v23, v192, v193, v194);
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v231, v196, (uint64_t)v195, v197, v198, v199);

      }
    }
    objc_msgSend_addObject_(v232, v175, (uint64_t)v85, v176, v177, v178);
    objc_msgSend_result(v228, v200, v201, v202, v203, v204);
    v205 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPathScores(v205, v206, v207, v208, v209, v210);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v211, v212, v23, v213, v214, v215);
    v216 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v231, v217, (uint64_t)v216, v218, v219, v220);

    _Block_object_dispose(v241, 8);
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(&v250, 8);
    _Block_object_dispose(&v254, 8);

    ++v23;
    v7 = 0x1E0C99000;
  }
  objc_msgSend_result(v5, v37, v38, v39, v40, v41);
  v221 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v221, v222, (uint64_t)v232, (uint64_t)v231, v223, v224);
  v225 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_storeStrong(v5 + 3, v225);

  return v5;
}

@end
