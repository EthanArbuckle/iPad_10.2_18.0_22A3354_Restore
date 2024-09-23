@implementation CHSemanticTokenizerStep

- (CHSemanticTokenizerStep)initWithWordLanguageModel:(void *)a3 ovsStringChecker:(id)a4
{
  id v6;
  CHSemanticTokenizerStep *v7;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)CHSemanticTokenizerStep;
  v7 = -[CHSemanticTokenizerStep init](&v9, sel_init);
  if (v7)
  {
    v7->_wordLanguageModel = (void *)LMLanguageModelRetain();
    objc_storeStrong((id *)&v7->_ovsStringChecker, a4);
  }

  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  NSObject *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  id v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
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
  NSObject *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t i;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
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
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  unint64_t j;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  BOOL v178;
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
  void *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  id v208;
  const char *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  void *v233;
  id *v234;
  void *v236;
  id v237;
  id v238;
  id *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  _QWORD v245[4];
  id v246;
  id v247;
  _QWORD v248[4];
  id v249;
  id v250;
  CHSemanticTokenizerStep *v251;
  id v252;
  _QWORD *v253;
  _BYTE *v254;
  uint64_t *v255;
  uint64_t *v256;
  _QWORD *v257;
  _QWORD *v258;
  uint64_t v259;
  uint64_t *v260;
  uint64_t v261;
  uint64_t (*v262)(uint64_t, uint64_t);
  void (*v263)(uint64_t);
  id v264;
  _QWORD v265[6];
  __int128 v266;
  _QWORD v267[5];
  id v268;
  uint64_t v269;
  uint64_t *v270;
  uint64_t v271;
  uint64_t v272;
  _QWORD v273[4];
  id v274;
  _BYTE buf[24];
  __n128 (*v276)(__n128 *, __n128 *);
  uint64_t (*v277)();
  void *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;

  v281 = *MEMORY[0x1E0C80C00];
  v239 = (id *)a3;
  v237 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v6 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v6, OS_LOG_TYPE_DEBUG, "CHSemanticTokenizerStep is running", buf, 2u);
  }

  objc_msgSend_result(v239, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topTranscription(v12, v13, v14, v15, v16, v17);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_opt_class();
  v274 = 0;
  objc_msgSend_tokensRangesForString_outTokenIDs_wordLanguageModel_(v18, v19, (uint64_t)v242, (uint64_t)&v274, (uint64_t)self->_wordLanguageModel, v20);
  v243 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v274;
  v27 = objc_msgSend_count(v21, v22, v23, v24, v25, v26);
  if (v27 != objc_msgSend_count(v243, v28, v29, v30, v31, v32))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v38 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT))
    {
      v44 = objc_msgSend_count(v21, v39, v40, v41, v42, v43);
      v50 = objc_msgSend_count(v243, v45, v46, v47, v48, v49);
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v44;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v50;
      _os_log_impl(&dword_1BE607000, v38, OS_LOG_TYPE_FAULT, "wordID count %lu should match wordRangesInString count %lu", buf, 0x16u);
    }

  }
  v51 = (void *)MEMORY[0x1E0C99E08];
  v52 = objc_msgSend_count(v21, v33, v34, v35, v36, v37);
  objc_msgSend_dictionaryWithCapacity_(v51, v53, v52, v54, v55, v56);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_count(v21, v57, v58, v59, v60, v61); ++i)
  {
    objc_msgSend_objectAtIndex_(v243, v63, i, v65, v66, v67);
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend_rangeValue(v68, v69, v70, v71, v72, v73);
    objc_msgSend_substringWithRange_(v242, v75, v74, (uint64_t)v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectAtIndex_(v21, v79, i, v80, v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forKey_(v244, v84, (uint64_t)v83, (uint64_t)v78, v85, v86);

  }
  if (objc_msgSend_count(v243, v63, v64, v65, v66, v67))
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v87, v88, v89, v90, v91);
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v92, v93, v94, v95, v96);
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v97, v98, v99, v100, v101);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    v273[0] = 0;
    v273[1] = v273;
    v273[2] = 0x2020000000;
    v273[3] = 0;
    v269 = 0;
    v270 = &v269;
    v271 = 0x2020000000;
    v272 = 0;
    v267[0] = 0;
    v267[1] = v267;
    v267[2] = 0x3032000000;
    v267[3] = sub_1BE8A7340;
    v267[4] = sub_1BE8A7350;
    objc_msgSend_objectAtIndex_(v21, v102, 0, v103, v104, v105);
    v268 = (id)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x4012000000;
    v276 = sub_1BE8ADE34;
    v277 = nullsub_53;
    v279 = 0;
    v280 = 0;
    v278 = &unk_1BE94989A;
    objc_msgSend_objectAtIndex_(v243, v106, v270[3], v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v279 = objc_msgSend_rangeValue(v110, v111, v112, v113, v114, v115);
    v280 = v116;

    v265[0] = 0;
    v265[1] = v265;
    v265[2] = 0x4012000000;
    v265[3] = sub_1BE8ADE34;
    v265[4] = nullsub_53;
    v265[5] = &unk_1BE94989A;
    v266 = xmmword_1BE8D6920;
    v259 = 0;
    v260 = &v259;
    v261 = 0x3032000000;
    v262 = sub_1BE8A7340;
    v263 = sub_1BE8A7350;
    v264 = 0;
    objc_msgSend_transcriptionPaths(v12, v117, v118, v119, v120, v121);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v122, v123, v124, v125, v126, v127);
    v128 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenColumns(v12, v129, v130, v131, v132, v133);
    v134 = (void *)objc_claimAutoreleasedReturnValue();
    v140 = objc_msgSend_count(v134, v135, v136, v137, v138, v139);
    v248[0] = MEMORY[0x1E0C809B0];
    v248[1] = 3221225472;
    v248[2] = sub_1BE8ADE44;
    v248[3] = &unk_1E77F6780;
    v253 = v273;
    v254 = buf;
    v255 = &v269;
    v249 = v243;
    v256 = &v259;
    v257 = v267;
    v250 = v21;
    v251 = self;
    v238 = v236;
    v252 = v238;
    v258 = v265;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v12, v141, (uint64_t)v128, 0, v140, (uint64_t)v248);

    sub_1BE8AD3A8((uint64_t)self, (void *)v260[5]);
    objc_msgSend_addObject_(v238, v142, v260[5], v143, v144, v145);
    objc_msgSend_addObject_(v241, v146, (uint64_t)v238, v147, v148, v149);
    objc_msgSend_transcriptionPathScores(v12, v150, v151, v152, v153, v154);
    v155 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v155, v156, v157, v158, v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v240, v162, (uint64_t)v161, v163, v164, v165);

    for (j = 1; ; ++j)
    {
      objc_msgSend_transcriptionPaths(v12, v166, v167, v168, v169, v170);
      v172 = (void *)objc_claimAutoreleasedReturnValue();
      v178 = j < objc_msgSend_count(v172, v173, v174, v175, v176, v177);

      if (!v178)
        break;
      objc_msgSend_transcriptionPaths(v12, v179, v180, v181, v182, v183);
      v184 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v184, v185, j, v186, v187, v188);
      v189 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_array(MEMORY[0x1E0C99DE8], v190, v191, v192, v193, v194);
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokenColumns(v12, v196, v197, v198, v199, v200);
      v201 = (void *)objc_claimAutoreleasedReturnValue();
      v207 = objc_msgSend_count(v201, v202, v203, v204, v205, v206);
      v245[0] = MEMORY[0x1E0C809B0];
      v245[1] = 3221225472;
      v245[2] = sub_1BE8AE128;
      v245[3] = &unk_1E77F3218;
      v246 = v244;
      v208 = v195;
      v247 = v208;
      objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v12, v209, (uint64_t)v189, 0, v207, (uint64_t)v245);

      objc_msgSend_addObject_(v241, v210, (uint64_t)v208, v211, v212, v213);
      objc_msgSend_transcriptionPathScores(v12, v214, v215, v216, v217, v218);
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectAtIndex_(v219, v220, j, v221, v222, v223);
      v224 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v240, v225, (uint64_t)v224, v226, v227, v228);

    }
    objc_msgSend_result(v239, v179, v180, v181, v182, v183);
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_modifiedResultWithBestPathTokens_pathProbabilities_(v229, v230, (uint64_t)v241, (uint64_t)v240, v231, v232);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    if (v239)
      objc_storeStrong(v239 + 3, v233);

    _Block_object_dispose(&v259, 8);
    _Block_object_dispose(v265, 8);
    _Block_object_dispose(buf, 8);
    _Block_object_dispose(v267, 8);

    _Block_object_dispose(&v269, 8);
    _Block_object_dispose(v273, 8);

  }
  v234 = v239;

  return v234;
}

- (void)dealloc
{
  objc_super v3;

  if (self->_wordLanguageModel)
    LMLanguageModelRelease();
  v3.receiver = self;
  v3.super_class = (Class)CHSemanticTokenizerStep;
  -[CHSemanticTokenizerStep dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_ovsStringChecker, 0);
}

@end
