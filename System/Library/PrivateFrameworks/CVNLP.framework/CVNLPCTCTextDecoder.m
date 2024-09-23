@implementation CVNLPCTCTextDecoder

- (CVNLPCTCTextDecoder)initWithLanguageResourceBundle:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CVNLPCTCTextDecoder;
  return -[CVNLPTextDecoder initWithLanguageResourceBundle:](&v4, sel_initWithLanguageResourceBundle_, a3);
}

- (id)decodingResultForKBestPaths:(unint64_t)a3 withBeamWidth:(unint64_t)a4
{
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  CVNLPTextDecodingBeamSearchConfiguration *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;

  objc_msgSend_defaultWhitespaceCommitActionBehavior(CVNLPTextDecodingConfiguration, a2, a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_languageResourceBundle(self, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_(CVNLPTextDecodingPath, v12, (uint64_t)v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = [CVNLPTextDecodingBeamSearchConfiguration alloc];
  v17 = (void *)objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_(v15, v16, (uint64_t)v7, (uint64_t)v14, a4, a3);
  objc_msgSend_decodingResultWithConfiguration_withContext_(self, v18, (uint64_t)v17, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)decodingResultForKBestPaths:(unint64_t)a3 withBeamWidth:(unint64_t)a4 context:(id)a5
{
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  CVNLPTextDecodingBeamSearchConfiguration *v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;

  v8 = a5;
  objc_msgSend_defaultWhitespaceCommitActionBehavior(CVNLPTextDecodingConfiguration, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_languageResourceBundle(self, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_(CVNLPTextDecodingPath, v17, (uint64_t)v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = [CVNLPTextDecodingBeamSearchConfiguration alloc];
  v22 = (void *)objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_(v20, v21, (uint64_t)v12, (uint64_t)v19, a4, a3);
  objc_msgSend_decodingResultWithConfiguration_withContext_(self, v23, (uint64_t)v22, (uint64_t)v8);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)decodingResultForKBestPaths:(unint64_t)a3 withBeamWidth:(unint64_t)a4 context:(id)a5 optimizeAlignment:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  CVNLPTextDecodingBeamSearchConfiguration *v22;
  const char *v23;
  void *shouldOptimizeAlignment;
  const char *v25;
  void *v26;

  v6 = a6;
  v10 = a5;
  objc_msgSend_defaultWhitespaceCommitActionBehavior(CVNLPTextDecodingConfiguration, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_languageResourceBundle(self, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_(CVNLPTextDecodingPath, v19, (uint64_t)v18, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = [CVNLPTextDecodingBeamSearchConfiguration alloc];
  shouldOptimizeAlignment = (void *)objc_msgSend_initWithCommitActionBehavior_scoringFunction_beamWidth_pathCount_shouldOptimizeAlignment_(v22, v23, (uint64_t)v14, (uint64_t)v21, a4, a3, v6);
  objc_msgSend_decodingResultWithConfiguration_withContext_(self, v25, (uint64_t)shouldOptimizeAlignment, (uint64_t)v10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (id)decodingResultWithConfiguration:(id)a3 withContext:(id)a4
{
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  const char *v10;
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
  const char *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  const void *v43;
  const void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  char *v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  BOOL v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  void *v87;
  char *v88;
  uint64_t shouldOptimizeAlignment;
  BOOL v90;
  CVNLPCTCTextDecodingPath *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  const char *v95;
  void *v96;
  int64_t v97;
  int64_t v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  CVNLPCTCBeamState *v125;
  const char *v126;
  uint64_t v127;
  double v128;
  double v129;
  CVNLPActivationMatrix *activationMatrix;
  const char *v131;
  float v132;
  CVNLPCTCBeamState *v133;
  id v134;
  CVNLPCTCBeamState *v135;
  CVNLPCTCBeamState *v136;
  const char *v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  char *v147;
  char *v148;
  void *v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  id v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  void *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  void *v168;
  id v169;
  const char *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t i;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  void *v182;
  CVNLPTextDecodingResultCandidate *v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  double v187;
  long double v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  double v192;
  long double v193;
  double v194;
  long double v195;
  const char *v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  unint64_t v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  const char *v212;
  id v213;
  void *v214;
  CVNLPTextDecodingResult *v215;
  const char *v216;
  uint64_t v217;
  void *v218;
  void *v220;
  char *v221;
  char *__src;
  void *hasContext;
  id v224;
  id v225;
  CVNLPCTCBeamState *v226;
  CVNLPCTCBeamState *v227;
  CVNLPCTCTextDecoder *v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  id v233;
  CVNLPCTCBeamState *v234;
  CVNLPCTCBeamState *v235;
  _QWORD v236[5];
  CVNLPCTCBeamState *v237;
  id v238;
  CVNLPCTCBeamState *v239;
  CVNLPCTCBeamState *v240;
  void **v241;
  uint64_t v242;
  float v243;
  _QWORD v244[5];
  BOOL v245;
  char *v246;
  void **v247;
  uint64_t v248;
  __n128 (*v249)(__n128 *, __n128 *);
  void (*v250)(uint64_t);
  void *v251;
  void *v252;
  char *v253;
  uint64_t v254;
  void *__p;
  void *v256;
  char *v257;
  void *v258;
  void *v259;
  char *v260;
  _BYTE v261[128];
  uint64_t v262;

  v262 = *MEMORY[0x1E0C80C00];
  v225 = a3;
  v224 = a4;
  v228 = self;
  v9 = objc_msgSend_domainType(self->_activationMatrix, v6, v7, v8) == 0;
  v227 = objc_alloc_init(CVNLPCTCBeamState);
  v226 = objc_alloc_init(CVNLPCTCBeamState);
  objc_msgSend_scoringFunction(v225, v10, v11, v12);
  v16 = objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend_languageResourceBundle(self, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend_pruneProblematicMixedScriptWordPaths(v225, v18, v19, v20);
    objc_msgSend_defaultPathScoringFunctionForLanguageResourceBundle_pruneProblematicMixedScriptWordPaths_(CVNLPTextDecodingPath, v22, (uint64_t)v17, v21);
    v16 = objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend_languageResourceBundle(self, v13, v14, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v220 = (void *)v16;
  objc_msgSend_characterLanguageModel(v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_lmSPIType(v27, v28, v29, v30);

  if (v31 == 2)
  {
    objc_msgSend_languageResourceBundle(v228, v32, v33, v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_characterLanguageModel(v35, v36, v37, v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = (const void *)objc_msgSend_languageModel(v39, v40, v41, v42);
    v44 = (const void *)CVNLPLanguageModelWithStateCreate(v43);

    if (v224)
    {
      objc_msgSend_history(v224, v45, v46, v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      CVNLPLanguageModelWithStateUpdateWithContext((uint64_t)v44, v48);

    }
    __src = 0;
    v49 = 0;
  }
  else
  {
    objc_msgSend_languageResourceBundle(v228, v32, v33, v34);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_characterLanguageModel(v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_history(v224, v55, v56, v57);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    if (v54)
    {
      objc_msgSend_characterTokenIDsForString_(v54, v58, (uint64_t)v60, v59);
      v49 = (char *)v247;
      __src = v246;
    }
    else
    {
      v49 = 0;
      __src = 0;
    }
    v246 = 0;
    v247 = 0;
    v248 = 0;

    v44 = 0;
  }
  objc_msgSend_languageResourceBundle(v228, v45, v46, v47);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_wordLanguageModel(v61, v62, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v65;
  if (v224 && v65)
  {
    objc_msgSend_history(v224, v66, v67, v68);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v74 = objc_msgSend_length(v70, v71, v72, v73) == 0;

    if (v74)
    {
      v221 = 0;
      v88 = 0;
      goto LABEL_21;
    }
    objc_msgSend_inactiveSubstring(v224, v75, v76, v77);
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_languageResourceBundle(v228, v78, v79, v80);
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_wordLanguageModel(v81, v82, v83, v84);
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = v85;
    if (v85)
    {
      objc_msgSend_wordTokenIDsForString_outTokenRanges_(v85, v86, (uint64_t)v61, 0);
      v88 = (char *)v247;
      v221 = v246;
    }
    else
    {
      v88 = 0;
      v221 = 0;
    }
    v246 = 0;
    v247 = 0;
    v248 = 0;

  }
  else
  {

    v221 = 0;
    v88 = 0;
  }

LABEL_21:
  shouldOptimizeAlignment = objc_msgSend_shouldOptimizeAlignment(v225, v75, v76, v77);
  v90 = v9;
  v91 = [CVNLPCTCTextDecodingPath alloc];
  objc_msgSend_languageResourceBundle(v228, v92, v93, v94);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v258 = 0;
  v259 = 0;
  v260 = 0;
  v97 = v49 - __src;
  if (v49 != __src)
  {
    if (v97 < 0)
      sub_1B02D7758();
    v258 = operator new(v49 - __src);
    v260 = (char *)v258 + 4 * (v97 >> 2);
    memcpy(v258, __src, v97);
    v259 = v260;
  }
  __p = 0;
  v256 = 0;
  v257 = 0;
  v98 = v88 - v221;
  if (v88 != v221)
  {
    if (v98 < 0)
      sub_1B02D7758();
    __p = operator new(v88 - v221);
    v257 = (char *)__p + 4 * (v98 >> 2);
    memcpy(__p, v221, v98);
    v256 = v257;
  }
  hasContext = (void *)objc_msgSend_initWithLanguageResourceBundle_scoringFunction_initialCharacterLMState_characterTokenIDs_wordTokenIDs_optimizingAlignment_hasContext_(v91, v95, (uint64_t)v96, (uint64_t)v220, v44, &v258, &__p, shouldOptimizeAlignment, v224 != 0);
  if (__p)
  {
    v256 = __p;
    operator delete(__p);
  }
  if (v258)
  {
    v259 = v258;
    operator delete(v258);
  }

  if (v44)
    CFRelease(v44);
  objc_msgSend_setBlankLogProbability_(hasContext, v99, v100, v101, 0.0);
  objc_msgSend_setNonBlankLogProbability_(hasContext, v102, v103, v104, -1022.0);
  objc_msgSend_languageResourceBundle(v228, v105, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_packagedLexiconCursorsUsingContext_(v108, v109, (uint64_t)v224, v110);
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setCursors_(hasContext, v112, (uint64_t)v111, v113);

  objc_msgSend_addPath_(v227, v114, (uint64_t)hasContext, v115);
  v119 = 0;
  v120 = MEMORY[0x1E0C809B0];
  while (v119 < objc_msgSend_timestepCount(v228->_activationMatrix, v116, v117, v118))
  {
    v124 = (void *)MEMORY[0x1B5E08128]();
    v125 = objc_alloc_init(CVNLPCTCBeamState);
    objc_msgSend_logProbabilityForBlankAtTimestep_(v228->_activationMatrix, v126, v119, v127);
    v129 = v128;
    v246 = 0;
    v247 = (void **)&v246;
    v248 = 0x4812000000;
    v249 = sub_1B03901D8;
    v250 = sub_1B03901FC;
    v251 = &unk_1B03B5E12;
    v253 = 0;
    v254 = 0;
    v252 = 0;
    activationMatrix = v228->_activationMatrix;
    v244[0] = v120;
    v244[1] = 3221225472;
    v244[2] = sub_1B03902BC;
    v244[3] = &unk_1E60CE450;
    v245 = v90;
    v244[4] = &v246;
    objc_msgSend_enumerateNonBlankCandidatesInTimestep_block_(activationMatrix, v131, v119, (uint64_t)v244);
    v132 = v129;
    v236[0] = v120;
    v236[1] = 3221225472;
    v236[2] = sub_1B0390504;
    v236[3] = &unk_1E60CE478;
    v242 = v119;
    v236[4] = v228;
    v243 = v132;
    v133 = v125;
    v237 = v133;
    v241 = (void **)&v246;
    v134 = v225;
    v238 = v134;
    v135 = v227;
    v239 = v135;
    v136 = v226;
    v240 = v136;
    objc_msgSend_enumeratePathsWithBlock_(v135, v137, (uint64_t)v236, v138);
    if (objc_msgSend_shouldApplyWordLMToLastWord(v134, v139, v140, v141)
      && v119 == objc_msgSend_timestepCount(v228->_activationMatrix, v142, v143, v144) - 1)
    {
      objc_msgSend_applyWordLanguageModelProbabilityToPaths(v133, v142, v143, v144);
    }
    v234 = v136;
    v235 = v135;
    v145 = objc_msgSend_beamWidth(v134, v142, v143, v144);
    objc_msgSend_kBest_discarded_k_shouldUpdateLMState_(v133, v146, (uint64_t)&v235, (uint64_t)&v234, v145, 1);
    v227 = v235;

    v226 = v234;
    _Block_object_dispose(&v246, 8);
    v147 = (char *)v252;
    if (v252)
    {
      v148 = v253;
      v149 = v252;
      if (v253 != v252)
      {
        do
        {
          v150 = (void *)*((_QWORD *)v148 - 2);
          v148 -= 16;

        }
        while (v148 != v147);
        v149 = v252;
      }
      v253 = v147;
      operator delete(v149);
    }

    objc_autoreleasePoolPop(v124);
    ++v119;
  }
  objc_msgSend_mergePathsWithTrailingWhitespaces(v227, v121, v122, v123);
  v233 = 0;
  v154 = objc_msgSend_pathCount(v225, v151, v152, v153);
  objc_msgSend_kBest_discarded_k_shouldUpdateLMState_(v227, v155, (uint64_t)&v233, 0, v154, 0);
  v156 = v233;
  objc_msgSend_sortedKeys(v156, v157, v158, v159);
  v160 = (void *)objc_claimAutoreleasedReturnValue();
  v161 = (void *)MEMORY[0x1E0C99DE8];
  v165 = objc_msgSend_count(v160, v162, v163, v164);
  objc_msgSend_arrayWithCapacity_(v161, v166, v165, v167);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v231 = 0u;
  v232 = 0u;
  v229 = 0u;
  v230 = 0u;
  v169 = v160;
  v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v170, (uint64_t)&v229, (uint64_t)v261, 16);
  if (v173)
  {
    v174 = *(_QWORD *)v230;
    do
    {
      for (i = 0; i != v173; ++i)
      {
        if (*(_QWORD *)v230 != v174)
          objc_enumerationMutation(v169);
        objc_msgSend_pathForString_(v156, v171, *(_QWORD *)(*((_QWORD *)&v229 + 1) + 8 * i), v172);
        v176 = (void *)objc_claimAutoreleasedReturnValue();
        v180 = objc_msgSend_timestepCount(v228->_activationMatrix, v177, v178, v179);
        objc_msgSend_tokensWithTimestep_isFinalTimestep_(v176, v181, v180 - 1, 1);
        v182 = (void *)objc_claimAutoreleasedReturnValue();
        v183 = [CVNLPTextDecodingResultCandidate alloc];
        objc_msgSend_normalizedTotalLogProbability(v176, v184, v185, v186);
        v188 = v187;
        objc_msgSend_normalizedActivationLogProbability(v176, v189, v190, v191);
        v193 = v192;
        v194 = exp(v188);
        v195 = exp(v193);
        v198 = (void *)objc_msgSend_initWithTokens_score_activationScore_(v183, v196, (uint64_t)v182, v197, v194, (double)v195);
        objc_msgSend_addObject_(v168, v199, (uint64_t)v198, v200);

      }
      v173 = objc_msgSend_countByEnumeratingWithState_objects_count_(v169, v171, (uint64_t)&v229, (uint64_t)v261, 16);
    }
    while (v173);
  }

  v204 = objc_msgSend_count(v168, v201, v202, v203);
  if (v204 <= objc_msgSend_pathCount(v225, v205, v206, v207))
  {
    v213 = v168;
  }
  else
  {
    v211 = objc_msgSend_pathCount(v225, v208, v209, v210);
    objc_msgSend_subarrayWithRange_(v168, v212, 0, v211);
    v213 = (id)objc_claimAutoreleasedReturnValue();
  }
  v214 = v213;
  v215 = [CVNLPTextDecodingResult alloc];
  v218 = (void *)objc_msgSend_initWithCandidates_(v215, v216, (uint64_t)v214, v217);

  if (v221)
    operator delete(v221);
  if (__src)
    operator delete(__src);

  return v218;
}

- (id)greedyDecodingResult
{
  return (id)((uint64_t (*)(CVNLPCTCTextDecoder *, char *, _QWORD))MEMORY[0x1E0DE7D20])(self, sel_greedyDecodingResultWithConfiguration_, 0);
}

- (id)greedyDecodingResultWithConfiguration:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  double v31;
  double v32;
  const char *v33;
  void *v34;
  double v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  char isEqualToString;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  BOOL v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t (**v49)(_QWORD, _QWORD, _QWORD);
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  CVNLPTextDecodingToken *v56;
  long double v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  id v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  void *v73;
  double v74;
  const char *v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  double v79;
  char v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  CVNLPTextDecodingToken *v87;
  long double v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  const char *v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  CVNLPTextDecodingToken *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  void *v113;
  const char *v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  CVNLPTextDecodingResultCandidate *v121;
  long double v122;
  const char *v123;
  uint64_t v124;
  void *v125;
  CVNLPTextDecodingResult *v126;
  const char *v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  void *v131;
  uint64_t v133;
  void *v134;
  char v135;
  id v136;
  id v137;
  void *v138;
  void *v139;
  double v140;
  _QWORD v141[2];

  v141[1] = *MEMORY[0x1E0C80C00];
  v137 = a3;
  objc_msgSend_characterObservations(self->_activationMatrix, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_blankIndex(self->_activationMatrix, v8, v9, v10);
  objc_msgSend_objectAtIndexedSubscript_(v7, v12, v11, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v139 = (void *)objc_msgSend_initWithString_(v15, v16, (uint64_t)&stru_1E60CE768, v17);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v134 = v21;
  if (objc_msgSend_timestepCount(self->_activationMatrix, v22, v23, v24) < 1)
  {
    v138 = 0;
    v70 = 0;
    v31 = 0.0;
    v32 = 0.0;
  }
  else
  {
    if (v137)
    {
      v28 = 0;
      v29 = 0;
      v138 = 0;
      v30 = 0;
      v133 = 0;
      v31 = 0.0;
      v135 = 1;
      v32 = 0.0;
      while (v28 < objc_msgSend_timestepCount(self->_activationMatrix, v25, v26, v27))
      {
        v140 = 0.0;
        objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self->_activationMatrix, v33, v28, (uint64_t)&v140, 0);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v140;
        if (objc_msgSend_isEqualToString_(v34, v36, (uint64_t)v14, v37))
        {
          ++v30;
          v32 = v140 + v32;
        }
        else
        {
          isEqualToString = objc_msgSend_isEqualToString_(v34, v38, (uint64_t)v29, v39);
          ++v30;
          v32 = v140 + v32;
          if ((isEqualToString & 1) == 0)
          {
            objc_msgSend_commitActionBlock(v137, v41, v42, v43);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            v45 = v44 == 0;

            if (!v45
              && (objc_msgSend_commitActionBlock(v137, v46, v47, v48),
                  v49 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
                  objc_msgSend_string(v138, v50, v51, v52),
                  v53 = (void *)objc_claimAutoreleasedReturnValue(),
                  v54 = ((uint64_t (**)(_QWORD, void *, void *))v49)[2](v49, v53, v34),
                  v53,
                  v49,
                  v54)
              && objc_msgSend_length(v139, v46, v55, v48))
            {
              if ((v135 & 1) != 0)
              {
                v135 = 1;
              }
              else
              {
                if (v54 == 2)
                {
                  v136 = v34;
                }
                else
                {
                  objc_msgSend_appendString_(v139, v46, (uint64_t)v34, v48);
                  v136 = 0;
                }
                v56 = [CVNLPTextDecodingToken alloc];
                v57 = exp(v32);
                objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v58, v59, v60, (double)v57);
                v61 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(v56, v62, (uint64_t)v139, (uint64_t)v61, &unk_1E60D49B8, v133, v30, v136);

                objc_msgSend_addObject_(v134, v64, v63, v65);
                v66 = objc_alloc(MEMORY[0x1E0CB37A0]);
                v69 = objc_msgSend_initWithString_(v66, v67, (uint64_t)&stru_1E60CE768, v68);

                v135 = 0;
                v133 += v30;
                v32 = 0.0;
                v138 = (void *)v63;
                v139 = (void *)v69;
                v30 = 0;
              }
            }
            else
            {
              objc_msgSend_appendString_(v139, v46, (uint64_t)v34, v48);
              v135 = 0;
            }
          }
        }

        v31 = v35 + v31;
        ++v28;
        v29 = v34;
      }
    }
    else
    {
      v71 = 0;
      v29 = 0;
      v31 = 0.0;
      v32 = 0.0;
      while (v71 < objc_msgSend_timestepCount(self->_activationMatrix, v25, v26, v27))
      {
        v140 = 0.0;
        objc_msgSend_topCandidateForTimestep_outputLogProbability_outputIndex_(self->_activationMatrix, v72, v71, (uint64_t)&v140, 0);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        v74 = v140;
        if ((objc_msgSend_isEqualToString_(v73, v75, (uint64_t)v14, v76) & 1) != 0)
        {
          v79 = v140;
        }
        else
        {
          v80 = objc_msgSend_isEqualToString_(v73, v77, (uint64_t)v29, v78);
          v79 = v140;
          if ((v80 & 1) == 0)
            objc_msgSend_appendString_(v139, v81, (uint64_t)v73, v82);
        }

        v31 = v74 + v31;
        v32 = v79 + v32;
        ++v71;
        v29 = v73;
      }
      v138 = 0;
      v133 = 0;
    }

    v70 = v133;
    v21 = v134;
  }
  if (objc_msgSend_length(v139, v25, v26, v27))
  {
    v86 = objc_msgSend_timestepCount(self->_activationMatrix, v83, v84, v85);
    v87 = [CVNLPTextDecodingToken alloc];
    v88 = exp(v32);
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v89, v90, v91, (double)v88);
    v92 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(v87, v93, (uint64_t)v139, (uint64_t)v92, &unk_1E60D49B8, v70, v86 - v70, 0);

    v138 = (void *)v94;
    v21 = v134;
    objc_msgSend_addObject_(v134, v95, v94, v96);
  }
  else if (objc_msgSend_count(v21, v83, v84, v85) && v138)
  {
    v100 = objc_msgSend_activationRange(v138, v97, v98, v99);
    v104 = objc_msgSend_timestepCount(self->_activationMatrix, v101, v102, v103);
    v105 = [CVNLPTextDecodingToken alloc];
    objc_msgSend_string(v138, v106, v107, v108);
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_score(v138, v110, v111, v112);
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    v115 = (void *)objc_msgSend_initWithString_score_alignmentScore_activationRange_terminatingCharacter_(v105, v114, (uint64_t)v109, (uint64_t)v113, &unk_1E60D49B8, v100, v104 - v100, 0);

    objc_msgSend_removeLastObject(v134, v116, v117, v118);
    objc_msgSend_addObject_(v134, v119, (uint64_t)v115, v120);

    v21 = v134;
  }
  v121 = [CVNLPTextDecodingResultCandidate alloc];
  v122 = exp(v31);
  v125 = (void *)objc_msgSend_initWithTokens_score_activationScore_(v121, v123, (uint64_t)v21, v124, (double)v122, (double)v122);
  v126 = [CVNLPTextDecodingResult alloc];
  v141[0] = v125;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v127, (uint64_t)v141, 1);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  v131 = (void *)objc_msgSend_initWithCandidates_(v126, v129, (uint64_t)v128, v130);

  return v131;
}

- (CVNLPActivationMatrix)activationMatrix
{
  return self->_activationMatrix;
}

- (void)setActivationMatrix:(id)a3
{
  objc_storeStrong((id *)&self->_activationMatrix, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activationMatrix, 0);
}

@end
