@implementation FCCKTestOrderFeedQueryEndpoint

- (void)handleQueryOperation:(id)a3 withRecords:(id)a4 droppedFeeds:(id)a5
{
  void *v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  id v21;
  uint64_t v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  void *v30;
  int v31;
  uint64_t v32;
  void *v33;
  int v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t j;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t k;
  uint64_t v51;
  void *v52;
  id v53;
  uint64_t m;
  id v55;
  id v56;
  id v57;
  uint64_t v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t n;
  uint64_t v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  unint64_t v75;
  id v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  unint64_t v84;
  unint64_t v85;
  id v86;
  id v87;
  uint64_t v88;
  void *v89;
  uint64_t v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t ii;
  uint64_t v99;
  void *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  id v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t jj;
  void *v109;
  void *v110;
  void (**v111)(_QWORD, _QWORD);
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t kk;
  uint64_t v121;
  void *v122;
  void *v123;
  void *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t mm;
  uint64_t v129;
  void (**v130)(_QWORD, _QWORD);
  void *nn;
  uint64_t v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  _BOOL4 v138;
  _BOOL4 v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t i1;
  uint64_t v155;
  void (**v156)(_QWORD, _QWORD);
  void (**v157)(_QWORD, _QWORD, _QWORD);
  id v158;
  id v159;
  id v160;
  id v161;
  void *v162;
  void *v163;
  id v164;
  id v165;
  id v166;
  id v167;
  id v168;
  id v169;
  id v170;
  void *v171;
  void *v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  void *v181;
  id v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  id v189;
  id v190;
  id v191;
  void *v192;
  void *v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  void *v197;
  uint64_t v198;
  void *v199;
  id obj;
  id obja;
  id objb;
  id objc;
  id objd;
  uint64_t v205;
  void *v206;
  void *v207;
  void *v208;
  uint64_t v209;
  void *v210;
  uint64_t v211;
  unsigned int v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  _QWORD v241[4];
  id v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  _QWORD v259[4];
  id v260;
  id v261;
  _QWORD v262[4];
  id v263;
  id v264;
  _QWORD v265[4];
  id v266;
  id v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  _BYTE v280[128];
  _BYTE v281[128];
  _BYTE v282[128];
  _BYTE v283[128];
  _BYTE v284[128];
  _BYTE v285[128];
  _BYTE v286[128];
  _BYTE v287[128];
  _BYTE v288[128];
  _BYTE v289[128];
  _BYTE v290[128];
  _BYTE v291[128];
  _BYTE v292[128];
  uint8_t v293[128];
  uint8_t buf[4];
  const char *v295;
  __int16 v296;
  char *v297;
  __int16 v298;
  int v299;
  __int16 v300;
  id v301;
  uint64_t v302;

  v302 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v176 = a5;
  objc_msgSend(v8, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v163 = v10;
  objc_msgSend(v10, "predicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v12 = v11;
    else
      v12 = 0;
  }
  else
  {
    v12 = 0;
  }
  v13 = v12;

  v162 = v13;
  if (v13 && objc_msgSend(v13, "compoundPredicateType") == 1)
    goto LABEL_11;
  v14 = MEMORY[0x1E0C81028];
  v15 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v158 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unexpected feed query predicate type"));
    *(_DWORD *)buf = 136315906;
    v295 = "-[FCCKTestOrderFeedQueryEndpoint handleQueryOperation:withRecords:droppedFeeds:]";
    v296 = 2080;
    v297 = "FCCKTestContentDatabase.m";
    v298 = 1024;
    v299 = 910;
    v300 = 2114;
    v301 = v158;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (v13)
  {
LABEL_11:
    v279 = 0u;
    v278 = 0u;
    v277 = 0u;
    v276 = 0u;
    objc_msgSend(v13, "subpredicates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v276, v293, 16);
    if (!v17)
    {
      v192 = 0;
      v193 = 0;
      v185 = 0;
      v188 = 0;
      obj = 0;
      goto LABEL_39;
    }
    v18 = v17;
    v192 = 0;
    v193 = 0;
    v185 = 0;
    v188 = 0;
    obj = 0;
    v19 = *(_QWORD *)v277;
    v208 = v16;
    while (1)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v277 != v19)
          objc_enumerationMutation(v16);
        v5 = *(void **)(*((_QWORD *)&v276 + 1) + 8 * i);
        objc_opt_class();
        if (!v5 || (objc_opt_isKindOfClass() & 1) == 0)
        {
          v21 = 0;
          goto LABEL_35;
        }
        v21 = v5;
        v22 = objc_msgSend(v21, "predicateOperatorType");
        if (v22 != 99)
        {
          if (v22 != 4)
            goto LABEL_35;
          objc_msgSend(v21, "leftExpression");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "keyPath");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v5, "isEqualToString:", CFSTR("fetchFields"));

          if (!v24)
          {
LABEL_33:
            v16 = v208;
            goto LABEL_34;
          }
          objc_msgSend(v21, "rightExpression");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "constantValue");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v192;
          v192 = (void *)v25;
          goto LABEL_32;
        }
        objc_msgSend(v21, "rightExpression");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v23, "expressionType") == 3)
        {
          objc_msgSend(v23, "keyPath");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("tagID"));

          if (v28)
          {
            objc_msgSend(v21, "leftExpression");
            v5 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "constantValue");
            v29 = objc_claimAutoreleasedReturnValue();
            v26 = obj;
            obj = (id)v29;
          }
          else
          {
            objc_msgSend(v23, "keyPath");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("maxOrder"));

            if (v31)
            {
              objc_msgSend(v21, "leftExpression");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "constantValue");
              v32 = objc_claimAutoreleasedReturnValue();
              v26 = v193;
              v193 = (void *)v32;
            }
            else
            {
              objc_msgSend(v23, "keyPath");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v34 = objc_msgSend(v33, "isEqualToString:", CFSTR("minOrder"));

              if (v34)
              {
                objc_msgSend(v21, "leftExpression");
                v5 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "constantValue");
                v35 = objc_claimAutoreleasedReturnValue();
                v26 = v188;
                v188 = (void *)v35;
              }
              else
              {
                objc_msgSend(v23, "keyPath");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v5 = (void *)objc_msgSend(v36, "isEqualToString:", CFSTR("hardLimit"));

                if (!(_DWORD)v5)
                  goto LABEL_33;
                objc_msgSend(v21, "leftExpression");
                v5 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v5, "constantValue");
                v37 = objc_claimAutoreleasedReturnValue();
                v26 = v185;
                v185 = (void *)v37;
              }
            }
          }
LABEL_32:
          v16 = v208;

        }
LABEL_34:

LABEL_35:
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v276, v293, 16);
      if (!v18)
      {
LABEL_39:

        v38 = obj;
        goto LABEL_41;
      }
    }
  }
  v192 = 0;
  v193 = 0;
  v185 = 0;
  v188 = 0;
  v38 = 0;
LABEL_41:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v272 = 0u;
  v273 = 0u;
  v274 = 0u;
  v275 = 0u;
  v39 = v38;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v272, v292, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v273;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v273 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v272 + 1) + 8 * j);
        v45 = (void *)MEMORY[0x1E0C99DE8];
        FCSortedFeedItemRecordsForFeedID(v9, v44);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "arrayWithArray:", v5);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "setObject:forKeyedSubscript:", v46, v44);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v272, v292, 16);
    }
    while (v41);
  }

  v271 = 0u;
  v270 = 0u;
  v269 = 0u;
  v268 = 0u;
  v47 = v39;
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v268, v291, 16);
  if (v48)
  {
    v49 = v48;
    v5 = *(void **)v269;
    do
    {
      for (k = 0; k != v49; ++k)
      {
        if (*(void **)v269 != v5)
          objc_enumerationMutation(v47);
        v51 = *(_QWORD *)(*((_QWORD *)&v268 + 1) + 8 * k);
        objc_msgSend(v177, "objectForKeyedSubscript:", v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v176, "containsObject:", v51))
          v53 = (id)objc_msgSend(v52, "fc_popLastObject");

      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v268, v291, 16);
    }
    while (v49);
  }

  m = MEMORY[0x1E0C809B0];
  v265[0] = MEMORY[0x1E0C809B0];
  v265[1] = 3221225472;
  v265[2] = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke;
  v265[3] = &unk_1E4646DE0;
  v55 = v47;
  v266 = v55;
  v161 = v193;
  v267 = v161;
  __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke((uint64_t)v265);
  v171 = (void *)objc_claimAutoreleasedReturnValue();
  v262[0] = m;
  v262[1] = 3221225472;
  v262[2] = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2;
  v262[3] = &unk_1E4646DE0;
  v56 = v55;
  v263 = v56;
  v160 = v188;
  v264 = v160;
  __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2((uint64_t)v262);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v259[0] = m;
  v259[1] = 3221225472;
  v259[2] = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3;
  v259[3] = &unk_1E4646DE0;
  v57 = v56;
  v260 = v57;
  v159 = v185;
  v261 = v159;
  __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3((uint64_t)v259);
  v186 = (void *)objc_claimAutoreleasedReturnValue();
  v255 = 0u;
  v256 = 0u;
  v257 = 0u;
  v258 = 0u;
  obja = v57;
  v209 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v255, v290, 16);
  if (v209)
  {
    v205 = *(_QWORD *)v256;
    do
    {
      for (m = 0; m != v209; ++m)
      {
        if (*(_QWORD *)v256 != v205)
          objc_enumerationMutation(obja);
        v58 = *(_QWORD *)(*((_QWORD *)&v255 + 1) + 8 * m);
        objc_msgSend(v171, "objectForKeyedSubscript:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v177, "objectForKeyedSubscript:", v58);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = v60;
        while (objc_msgSend(v60, "count"))
        {
          objc_msgSend(v5, "firstObject");
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", CFSTR("order"));
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v62, "compare:", v59) == 1)
          {

          }
          else
          {
            objc_msgSend(v5, "firstObject");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "objectForKeyedSubscript:", CFSTR("subOrder"));
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = objc_msgSend(v64, "compare:", v59);

            if (v65 != 1)
              break;
          }
          objc_msgSend(v5, "fc_removeFirstObject");
          v60 = v5;
        }

      }
      v209 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v255, v290, 16);
    }
    while (v209);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  v251 = 0u;
  v252 = 0u;
  v253 = 0u;
  v254 = 0u;
  v165 = obja;
  v66 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v251, v289, 16);
  if (v66)
  {
    v67 = v66;
    v5 = *(void **)v252;
    do
    {
      for (n = 0; n != v67; ++n)
      {
        if (*(void **)v252 != v5)
          objc_enumerationMutation(v165);
        v69 = *(_QWORD *)(*((_QWORD *)&v251 + 1) + 8 * n);
        objc_msgSend(v177, "objectForKeyedSubscript:", v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v70, "firstObject");
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("order"));
        v72 = objc_claimAutoreleasedReturnValue();
        m = v72;
        if (v72)
          v73 = (void *)v72;
        else
          v73 = &unk_1E470AD60;
        objc_msgSend(v175, "setObject:forKeyedSubscript:", v73, v69);

      }
      v67 = objc_msgSend(v165, "countByEnumeratingWithState:objects:count:", &v251, v289, 16);
    }
    while (v67);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v168 = (id)*MEMORY[0x1E0C94988];
  v172 = v74;
  while (2)
  {
    v75 = objc_msgSend(v74, "count");
    if (v75 >= objc_msgSend(v8, "resultsLimit") && (id)objc_msgSend(v8, "resultsLimit") != v168)
      goto LABEL_115;
    v249 = 0u;
    v250 = 0u;
    v247 = 0u;
    v248 = 0u;
    v76 = v177;
    v194 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v247, v288, 16);
    if (!v194)
      goto LABEL_114;
    v179 = 0;
    v182 = v76;
    v197 = 0;
    v189 = *(id *)v248;
    do
    {
      v77 = 0;
      do
      {
        v206 = (void *)m;
        v210 = v5;
        if (*(id *)v248 != v189)
          objc_enumerationMutation(v76);
        v78 = *(void **)(*((_QWORD *)&v247 + 1) + 8 * v77);
        objc_msgSend(v76, "objectForKeyedSubscript:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "firstObject");
        v80 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v187, "objectForKeyedSubscript:", v78);
        v81 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v186, "objectForKeyedSubscript:", v78);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objb = (id)v81;
        if (!v80)
          goto LABEL_106;
        objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("order"));
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v83, "compare:", v81) == -1)
        {

          goto LABEL_95;
        }
        if (v197)
        {
          objc_msgSend(v80, "objectForKeyedSubscript:", CFSTR("order"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v197, "objectForKeyedSubscript:", CFSTR("order"));
          m = objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "compare:", m) != 1)
          {

            goto LABEL_101;
          }
          v206 = (void *)m;
          v210 = v5;
          if (!objc_msgSend(v82, "unsignedLongLongValue"))
          {

LABEL_102:
            goto LABEL_104;
          }
        }
        else if (!objc_msgSend(v82, "unsignedLongLongValue"))
        {
          goto LABEL_102;
        }
        v84 = objc_msgSend(v178, "countForObject:", v78);
        v85 = objc_msgSend(v82, "unsignedLongLongValue");
        if (v197)
        {

          v76 = v182;
          if (v84 >= v85)
            goto LABEL_106;
          goto LABEL_105;
        }

        if (v84 >= v85)
        {
          v197 = 0;
LABEL_95:
          m = (uint64_t)v206;
          v5 = v210;
LABEL_101:
          v76 = v182;
          goto LABEL_107;
        }
LABEL_104:
        v76 = v182;
LABEL_105:
        v86 = v80;

        v87 = v78;
        objc_msgSend(v178, "addObject:", v87);
        v179 = v87;
        v197 = v86;
LABEL_106:
        m = (uint64_t)v206;
        v5 = v210;
LABEL_107:

        ++v77;
      }
      while (v194 != v77);
      v88 = objc_msgSend(v76, "countByEnumeratingWithState:objects:count:", &v247, v288, 16);
      v194 = v88;
    }
    while (v88);

    if (v179)
    {
      v74 = v172;
      objc_msgSend(v172, "addObject:", v197);
      objc_msgSend(v76, "objectForKeyedSubscript:", v179);
      v89 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v89, "fc_removeFirstObject");

      continue;
    }
    break;
  }
  v76 = v197;
  v74 = v172;
LABEL_114:

LABEL_115:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v169 = (id)objc_claimAutoreleasedReturnValue();
  v243 = 0u;
  v244 = 0u;
  v245 = 0u;
  v246 = 0u;
  v164 = v74;
  v173 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v243, v287, 16);
  if (v173)
  {
    v166 = *(id *)v244;
    do
    {
      v90 = 0;
      do
      {
        if (*(id *)v244 != v166)
          objc_enumerationMutation(v164);
        v183 = v90;
        v91 = *(void **)(*((_QWORD *)&v243 + 1) + 8 * v90);
        objc_msgSend(v91, "objectForKeyedSubscript:", CFSTR("articleID"));
        v92 = (void *)objc_claimAutoreleasedReturnValue();
        v241[0] = MEMORY[0x1E0C809B0];
        v241[1] = 3221225472;
        v241[2] = __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_4;
        v241[3] = &unk_1E463BC28;
        v180 = v92;
        v242 = v180;
        objc_msgSend(v9, "fc_firstObjectPassingTest:", v241);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        objc = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("FeedItemAndArticle"));
        v237 = 0u;
        v238 = 0u;
        v239 = 0u;
        v240 = 0u;
        objc_msgSend(v91, "changedKeys");
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v95 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v237, v286, 16);
        if (v95)
        {
          v96 = v95;
          v97 = *(_QWORD *)v238;
          do
          {
            for (ii = 0; ii != v96; ++ii)
            {
              if (*(_QWORD *)v238 != v97)
                objc_enumerationMutation(v94);
              v99 = *(_QWORD *)(*((_QWORD *)&v237 + 1) + 8 * ii);
              objc_msgSend(v91, "objectForKeyedSubscript:", v99);
              v100 = (void *)objc_claimAutoreleasedReturnValue();
              if (v100)
                objc_msgSend(objc, "setObject:forKeyedSubscript:", v100, v99);

            }
            v96 = objc_msgSend(v94, "countByEnumeratingWithState:objects:count:", &v237, v286, 16);
          }
          while (v96);
        }

        v235 = 0u;
        v236 = 0u;
        v233 = 0u;
        v234 = 0u;
        objc_msgSend(v93, "changedKeys");
        v190 = (id)objc_claimAutoreleasedReturnValue();
        v198 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v233, v285, 16);
        if (v198)
        {
          v195 = *(_QWORD *)v234;
          do
          {
            v101 = 0;
            do
            {
              if (*(_QWORD *)v234 != v195)
                objc_enumerationMutation(v190);
              v211 = v101;
              v102 = *(_QWORD *)(*((_QWORD *)&v233 + 1) + 8 * v101);
              objc_msgSend(v93, "objectForKeyedSubscript:", v102);
              v103 = objc_claimAutoreleasedReturnValue();
              if (v103)
                objc_msgSend(objc, "setObject:forKeyedSubscript:", v103, v102);
              v207 = (void *)v103;
              v231 = 0u;
              v232 = 0u;
              v229 = 0u;
              v230 = 0u;
              v104 = v192;
              v105 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v229, v284, 16);
              if (v105)
              {
                v106 = v105;
                v107 = *(_QWORD *)v230;
                do
                {
                  for (jj = 0; jj != v106; ++jj)
                  {
                    if (*(_QWORD *)v230 != v107)
                      objc_enumerationMutation(v104);
                    objc_msgSend(v93, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v229 + 1) + 8 * jj));
                    v109 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v109)
                    {
                      FCLookupRecordByName(v9, v109);
                      v110 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v110)
                      {
                        objc_msgSend(v8, "recordFetchedBlock");
                        v111 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                        ((void (**)(_QWORD, void *))v111)[2](v111, v110);

                      }
                    }

                  }
                  v106 = objc_msgSend(v104, "countByEnumeratingWithState:objects:count:", &v229, v284, 16);
                }
                while (v106);
              }

              v101 = v211 + 1;
            }
            while (v211 + 1 != v198);
            v198 = objc_msgSend(v190, "countByEnumeratingWithState:objects:count:", &v233, v285, 16);
          }
          while (v198);
        }

        objc_msgSend(v8, "desiredKeys");
        v112 = (void *)objc_claimAutoreleasedReturnValue();

        if (v112)
        {
          v113 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v8, "desiredKeys");
          v114 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v113, "setWithArray:", v114);
          v115 = (void *)objc_claimAutoreleasedReturnValue();

          v227 = 0u;
          v228 = 0u;
          v225 = 0u;
          v226 = 0u;
          objc_msgSend(objc, "changedKeys");
          v116 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v225, v283, 16);
          if (v117)
          {
            v118 = v117;
            v119 = *(_QWORD *)v226;
            do
            {
              for (kk = 0; kk != v118; ++kk)
              {
                if (*(_QWORD *)v226 != v119)
                  objc_enumerationMutation(v116);
                v121 = *(_QWORD *)(*((_QWORD *)&v225 + 1) + 8 * kk);
                if ((objc_msgSend(v115, "containsObject:", v121) & 1) == 0)
                  objc_msgSend(objc, "setObject:forKeyedSubscript:", 0, v121);
              }
              v118 = objc_msgSend(v116, "countByEnumeratingWithState:objects:count:", &v225, v283, 16);
            }
            while (v118);
          }

        }
        objc_msgSend(objc, "setObject:forKeyedSubscript:", v180, CFSTR("articleID"));
        objc_msgSend(v93, "recordChangeTag");
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objc, "setObject:forKeyedSubscript:", v122, CFSTR("articleETag"));

        objc_msgSend(v93, "creationDate");
        v123 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objc, "setObject:forKeyedSubscript:", v123, CFSTR("articleCreationDate"));

        objc_msgSend(v93, "modificationDate");
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(objc, "setObject:forKeyedSubscript:", v124, CFSTR("articleModDate"));

        objc_msgSend(v169, "addObject:", objc);
        v90 = v183 + 1;
      }
      while (v183 + 1 != v173);
      v173 = objc_msgSend(v164, "countByEnumeratingWithState:objects:count:", &v243, v287, 16);
    }
    while (v173);
  }

  v223 = 0u;
  v224 = 0u;
  v221 = 0u;
  v222 = 0u;
  v170 = v169;
  v125 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v221, v282, 16);
  if (v125)
  {
    v126 = v125;
    v127 = *(_QWORD *)v222;
    do
    {
      for (mm = 0; mm != v126; ++mm)
      {
        if (*(_QWORD *)v222 != v127)
          objc_enumerationMutation(v170);
        v129 = *(_QWORD *)(*((_QWORD *)&v221 + 1) + 8 * mm);
        objc_msgSend(v8, "recordFetchedBlock");
        v130 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v130[2](v130, v129);

      }
      v126 = objc_msgSend(v170, "countByEnumeratingWithState:objects:count:", &v221, v282, 16);
    }
    while (v126);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v196 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v191 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v217 = 0u;
  v218 = 0u;
  v219 = 0u;
  v220 = 0u;
  v167 = v165;
  objd = (id)objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v217, v281, 16);
  if (objd)
  {
    v174 = *(_QWORD *)v218;
    do
    {
      for (nn = 0; nn != objd; nn = (char *)nn + 1)
      {
        if (*(_QWORD *)v218 != v174)
          objc_enumerationMutation(v167);
        v132 = *(_QWORD *)(*((_QWORD *)&v217 + 1) + 8 * (_QWORD)nn);
        objc_msgSend(v177, "objectForKeyedSubscript:", v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v175, "objectForKeyedSubscript:", v132);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v212 = objc_msgSend(v176, "containsObject:", v132);
        if (objc_msgSend(v133, "count"))
        {
          objc_msgSend(v187, "objectForKeyedSubscript:", v132);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v133, "firstObject");
          v136 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v136, "objectForKeyedSubscript:", CFSTR("order"));
          v137 = (void *)objc_claimAutoreleasedReturnValue();
          v138 = objc_msgSend(v137, "compare:", v135) == -1;

          v139 = objc_msgSend(v133, "count") == 0;
          objc_msgSend(v133, "firstObject");
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v140, "objectForKeyedSubscript:", CFSTR("order"));
          v141 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          v138 = 0;
          v139 = 1;
          v141 = &unk_1E470AD60;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v212 ^ 1) & v138);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "addObject:", v142);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", (v212 ^ 1) & v139);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v196, "addObject:", v143);

        objc_msgSend(v191, "addObject:", v134);
        objc_msgSend(v184, "addObject:", v141);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v212);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "addObject:", v144);

      }
      objd = (id)objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v217, v281, 16);
    }
    while (objd);
  }

  v145 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("Results"));
  objc_msgSend(v145, "setObject:forKeyedSubscript:", v199, CFSTR("reachedMinOrder"));
  objc_msgSend(v145, "setObject:forKeyedSubscript:", v196, CFSTR("reachedEnd"));
  objc_msgSend(v145, "setObject:forKeyedSubscript:", v191, CFSTR("topOrder"));
  objc_msgSend(v145, "setObject:forKeyedSubscript:", v184, CFSTR("bottomOrder"));
  objc_msgSend(v145, "setObject:forKeyedSubscript:", v181, CFSTR("feedDropped"));
  objc_msgSend(v8, "desiredKeys");
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  if (v146)
  {
    v147 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "desiredKeys");
    v148 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v147, "setWithArray:", v148);
    v149 = (void *)objc_claimAutoreleasedReturnValue();

    v215 = 0u;
    v216 = 0u;
    v213 = 0u;
    v214 = 0u;
    objc_msgSend(v145, "changedKeys");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v151 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v213, v280, 16);
    if (v151)
    {
      v152 = v151;
      v153 = *(_QWORD *)v214;
      do
      {
        for (i1 = 0; i1 != v152; ++i1)
        {
          if (*(_QWORD *)v214 != v153)
            objc_enumerationMutation(v150);
          v155 = *(_QWORD *)(*((_QWORD *)&v213 + 1) + 8 * i1);
          if ((objc_msgSend(v149, "containsObject:", v155) & 1) == 0)
            objc_msgSend(v145, "setObject:forKeyedSubscript:", 0, v155);
        }
        v152 = objc_msgSend(v150, "countByEnumeratingWithState:objects:count:", &v213, v280, 16);
      }
      while (v152);
    }

  }
  objc_msgSend(v8, "recordFetchedBlock");
  v156 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v156)[2](v156, v145);

  objc_msgSend(v8, "queryCompletionBlock");
  v157 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v157[2](v157, 0, 0);

}

id __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, v6);

    }
  }
  return v2;
}

id __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, v6);

    }
  }
  return v2;
}

id __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "count");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i != v4; ++i)
    {
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, v6);

    }
  }
  return v2;
}

uint64_t __80__FCCKTestOrderFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_msgSend(v3, "recordType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("Article")))
  {
    objc_msgSend(v3, "recordID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "recordName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

@end
