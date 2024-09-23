@implementation FCCKTestFeedQueryEndpoint

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
  uint64_t v47;
  id v48;
  id v49;
  id v50;
  __CFString *v51;
  id k;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t m;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  unint64_t v71;
  id v72;
  id v73;
  uint64_t v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  unint64_t v81;
  id v82;
  id v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t n;
  uint64_t v96;
  void *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  id v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t ii;
  void *v106;
  void *v107;
  void (**v108)(_QWORD, _QWORD);
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t jj;
  uint64_t v118;
  void *v119;
  void *v120;
  void *v121;
  id v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t kk;
  uint64_t v127;
  void (**v128)(_QWORD, _QWORD);
  void *v129;
  uint64_t mm;
  uint64_t v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  _BOOL8 v136;
  _BOOL8 v137;
  FCCKTestContentDatabaseFeedCursor *v138;
  void *v139;
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
  void *v151;
  void *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t nn;
  uint64_t v157;
  void (**v158)(_QWORD, _QWORD);
  void (**v159)(_QWORD, _QWORD, _QWORD);
  id v160;
  id v161;
  id v162;
  id v163;
  void *v164;
  void *v165;
  id v166;
  id v167;
  uint64_t v168;
  void *v169;
  id v170;
  id v171;
  void *v172;
  id v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  id v178;
  void *v179;
  void *v180;
  void *v181;
  unint64_t v182;
  uint64_t v183;
  void *v184;
  void *v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  id obj;
  id obja;
  id objb;
  id objc;
  void *v194;
  void *v195;
  uint64_t v196;
  id v197;
  uint64_t v198;
  void *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  void *v203;
  void *v204;
  void *v205;
  uint64_t v206;
  void *v207;
  uint64_t v208;
  id v209;
  id v210;
  id v211;
  unsigned int v212;
  void *v213;
  uint64_t v214;
  void *v215;
  uint64_t v216;
  void *v217;
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
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  _QWORD v246[4];
  id v247;
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
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  __int128 v263;
  _QWORD v264[4];
  id v265;
  id v266;
  _QWORD v267[4];
  id v268;
  id v269;
  _QWORD v270[4];
  id v271;
  id v272;
  __int128 v273;
  __int128 v274;
  __int128 v275;
  __int128 v276;
  __int128 v277;
  __int128 v278;
  __int128 v279;
  __int128 v280;
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
  v173 = a5;
  objc_msgSend(v8, "query");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v165 = v10;
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

  v164 = v13;
  if (v13 && objc_msgSend(v13, "compoundPredicateType") == 1)
    goto LABEL_11;
  v14 = MEMORY[0x1E0C81028];
  v15 = MEMORY[0x1E0C81028];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    v160 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("unexpected feed query predicate type"));
    *(_DWORD *)buf = 136315906;
    v295 = "-[FCCKTestFeedQueryEndpoint handleQueryOperation:withRecords:droppedFeeds:]";
    v296 = 2080;
    v297 = "FCCKTestContentDatabase.m";
    v298 = 1024;
    v299 = 587;
    v300 = 2114;
    v301 = v160;
    _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  if (v13)
  {
LABEL_11:
    v280 = 0u;
    v279 = 0u;
    v278 = 0u;
    v277 = 0u;
    objc_msgSend(v13, "subpredicates");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v277, v293, 16);
    if (!v17)
    {
      v194 = 0;
      v195 = 0;
      v186 = 0;
      v189 = 0;
      v204 = 0;
      goto LABEL_39;
    }
    v18 = v17;
    v194 = 0;
    v195 = 0;
    v186 = 0;
    v189 = 0;
    v204 = 0;
    v19 = *(_QWORD *)v278;
    v213 = v16;
    while (1)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v278 != v19)
          objc_enumerationMutation(v16);
        v5 = *(void **)(*((_QWORD *)&v277 + 1) + 8 * i);
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
          v24 = objc_msgSend(v5, "isEqualToString:", CFSTR("tagField"));

          if (!v24)
          {
LABEL_33:
            v16 = v213;
            goto LABEL_34;
          }
          objc_msgSend(v21, "rightExpression");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "constantValue");
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v194;
          v194 = (void *)v25;
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
            v26 = v204;
            v204 = (void *)v29;
          }
          else
          {
            objc_msgSend(v23, "keyPath");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("cursor"));

            if (v31)
            {
              objc_msgSend(v21, "leftExpression");
              v5 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v5, "constantValue");
              v32 = objc_claimAutoreleasedReturnValue();
              v26 = v195;
              v195 = (void *)v32;
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
                v26 = v189;
                v189 = (void *)v35;
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
                v26 = v186;
                v186 = (void *)v37;
              }
            }
          }
LABEL_32:
          v16 = v213;

        }
LABEL_34:

LABEL_35:
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v277, v293, 16);
      if (!v18)
      {
LABEL_39:

        v38 = v204;
        goto LABEL_41;
      }
    }
  }
  v194 = 0;
  v195 = 0;
  v186 = 0;
  v189 = 0;
  v38 = 0;
LABEL_41:
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v181 = (void *)objc_claimAutoreleasedReturnValue();
  v273 = 0u;
  v274 = 0u;
  v275 = 0u;
  v276 = 0u;
  v39 = v38;
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v273, v292, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v274;
    do
    {
      for (j = 0; j != v41; ++j)
      {
        if (*(_QWORD *)v274 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v273 + 1) + 8 * j);
        v45 = (void *)MEMORY[0x1E0C99DE8];
        FCSortedFeedItemRecordsForFeedID(v9, v44);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "arrayWithArray:", v5);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v181, "setObject:forKeyedSubscript:", v46, v44);

      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v273, v292, 16);
    }
    while (v41);
  }

  v47 = MEMORY[0x1E0C809B0];
  v270[0] = MEMORY[0x1E0C809B0];
  v270[1] = 3221225472;
  v270[2] = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke;
  v270[3] = &unk_1E4646DE0;
  v48 = v39;
  v271 = v48;
  v163 = v195;
  v272 = v163;
  __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke((uint64_t)v270);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v267[0] = v47;
  v267[1] = 3221225472;
  v267[2] = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2;
  v267[3] = &unk_1E4646DE0;
  v49 = v48;
  v268 = v49;
  v162 = v189;
  v269 = v162;
  __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2((uint64_t)v267);
  v188 = (void *)objc_claimAutoreleasedReturnValue();
  v264[0] = v47;
  v264[1] = 3221225472;
  v264[2] = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3;
  v264[3] = &unk_1E4646DE0;
  v50 = v49;
  v265 = v50;
  v161 = v186;
  v266 = v161;
  __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3((uint64_t)v264);
  v187 = (void *)objc_claimAutoreleasedReturnValue();
  v260 = 0u;
  v261 = 0u;
  v262 = 0u;
  v263 = 0u;
  obj = v50;
  v51 = CFSTR("order");
  v200 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v260, v291, 16);
  if (v200)
  {
    v196 = *(_QWORD *)v261;
    do
    {
      for (k = 0; k != (id)v200; k = (char *)k + 1)
      {
        if (*(_QWORD *)v261 != v196)
          objc_enumerationMutation(obj);
        v53 = *(_QWORD *)(*((_QWORD *)&v260 + 1) + 8 * (_QWORD)k);
        objc_msgSend(v172, "objectForKeyedSubscript:", v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v54, "length"))
        {
          v209 = k;
          objc_msgSend(v181, "objectForKeyedSubscript:", v53);
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          v205 = v54;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v54, 0);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          while (objc_msgSend(v5, "count"))
          {
            objc_msgSend(v5, "firstObject");
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v56, "objectForKeyedSubscript:", CFSTR("order"));
            v57 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "order");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v57, "compare:", v58) == 1)
            {

            }
            else
            {
              objc_msgSend(v5, "firstObject");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "objectForKeyedSubscript:", CFSTR("subOrder"));
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v55, "subOrder");
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              v214 = objc_msgSend(v60, "compare:", v61);

              v51 = CFSTR("order");
              if (v214 != 1)
                break;
            }
            objc_msgSend(v5, "fc_removeFirstObject");
          }

          v54 = v205;
          k = v209;
        }

      }
      v200 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v260, v291, 16);
    }
    while (v200);
  }

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v180 = (void *)objc_claimAutoreleasedReturnValue();
  v256 = 0u;
  v257 = 0u;
  v258 = 0u;
  v259 = 0u;
  v167 = obj;
  v62 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v256, v290, 16);
  if (v62)
  {
    v63 = v62;
    v5 = *(void **)v257;
    do
    {
      for (m = 0; m != v63; ++m)
      {
        if (*(void **)v257 != v5)
          objc_enumerationMutation(v167);
        v65 = *(_QWORD *)(*((_QWORD *)&v256 + 1) + 8 * m);
        objc_msgSend(v181, "objectForKeyedSubscript:", v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v66, "firstObject");
        v67 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v67, "objectForKeyedSubscript:", CFSTR("order"));
        v68 = objc_claimAutoreleasedReturnValue();
        v51 = (__CFString *)v68;
        if (v68)
          v69 = (void *)v68;
        else
          v69 = &unk_1E470AD60;
        objc_msgSend(v180, "setObject:forKeyedSubscript:", v69, v65);

      }
      v63 = objc_msgSend(v167, "countByEnumeratingWithState:objects:count:", &v256, v290, 16);
    }
    while (v63);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3550], "set");
  v185 = (void *)objc_claimAutoreleasedReturnValue();
  v174 = *MEMORY[0x1E0C94988];
  v177 = v70;
  while (2)
  {
    v71 = objc_msgSend(v70, "count");
    if (v71 >= objc_msgSend(v8, "resultsLimit") && objc_msgSend(v8, "resultsLimit") != v174)
      goto LABEL_108;
    v254 = 0u;
    v255 = 0u;
    v252 = 0u;
    v253 = 0u;
    v72 = v181;
    v206 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v252, v289, 16);
    if (!v206)
      goto LABEL_107;
    obja = 0;
    v73 = 0;
    v197 = v72;
    v201 = *(_QWORD *)v253;
    do
    {
      v74 = 0;
      do
      {
        v215 = v73;
        if (*(_QWORD *)v253 != v201)
          objc_enumerationMutation(v72);
        v75 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * v74);
        objc_msgSend(v72, "objectForKeyedSubscript:", v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v76, "firstObject");
        v77 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v188, "objectForKeyedSubscript:", v75);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v187, "objectForKeyedSubscript:", v75);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v77)
        {
          v73 = v215;
          goto LABEL_100;
        }
        v210 = v79;
        objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("order"));
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v80, "compare:", v78) == -1)
          goto LABEL_93;
        if (v215)
        {
          objc_msgSend(v77, "objectForKeyedSubscript:", CFSTR("order"));
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v215, "objectForKeyedSubscript:", CFSTR("order"));
          v51 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v5, "compare:", v51) != 1)
          {

LABEL_93:
            goto LABEL_94;
          }
          if (!objc_msgSend(v210, "unsignedLongLongValue"))
          {

LABEL_95:
            goto LABEL_97;
          }
        }
        else if (!objc_msgSend(v210, "unsignedLongLongValue"))
        {
          goto LABEL_95;
        }
        v81 = objc_msgSend(v185, "countForObject:", v75);
        v182 = objc_msgSend(v210, "unsignedLongLongValue");
        if (!v215)
        {

          if (v81 >= v182)
          {
            v73 = 0;
            goto LABEL_98;
          }
LABEL_97:
          v82 = v77;

          v83 = v75;
          objc_msgSend(v185, "addObject:", v83);
          obja = v83;
          v73 = v82;
LABEL_98:
          v72 = v197;
          goto LABEL_99;
        }

        if (v81 < v182)
          goto LABEL_97;
LABEL_94:
        v72 = v197;
        v73 = v215;
LABEL_99:
        v79 = v210;
LABEL_100:

        ++v74;
      }
      while (v206 != v74);
      v84 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v252, v289, 16);
      v206 = v84;
    }
    while (v84);

    if (obja)
    {
      v70 = v177;
      v85 = v73;
      objc_msgSend(v177, "addObject:", v73);
      objc_msgSend(v72, "objectForKeyedSubscript:", obja);
      v86 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v86, "fc_removeFirstObject");

      continue;
    }
    break;
  }
  v72 = v73;
  v70 = v177;
LABEL_107:

LABEL_108:
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v170 = (id)objc_claimAutoreleasedReturnValue();
  v248 = 0u;
  v249 = 0u;
  v250 = 0u;
  v251 = 0u;
  v166 = v70;
  v175 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v248, v288, 16);
  if (v175)
  {
    v168 = *(_QWORD *)v249;
    do
    {
      v87 = 0;
      do
      {
        if (*(_QWORD *)v249 != v168)
          objc_enumerationMutation(v166);
        v183 = v87;
        v88 = *(void **)(*((_QWORD *)&v248 + 1) + 8 * v87);
        objc_msgSend(v88, "objectForKeyedSubscript:", CFSTR("articleID"));
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        v246[0] = MEMORY[0x1E0C809B0];
        v246[1] = 3221225472;
        v246[2] = __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_156;
        v246[3] = &unk_1E463BC28;
        v178 = v89;
        v247 = v178;
        objc_msgSend(v9, "fc_firstObjectPassingTest:", v246);
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        v207 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("FeedItemAndArticle"));
        v242 = 0u;
        v243 = 0u;
        v244 = 0u;
        v245 = 0u;
        objc_msgSend(v88, "changedKeys");
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v242, v287, 16);
        if (v92)
        {
          v93 = v92;
          v94 = *(_QWORD *)v243;
          do
          {
            for (n = 0; n != v93; ++n)
            {
              if (*(_QWORD *)v243 != v94)
                objc_enumerationMutation(v91);
              v96 = *(_QWORD *)(*((_QWORD *)&v242 + 1) + 8 * n);
              objc_msgSend(v88, "objectForKeyedSubscript:", v96);
              v97 = (void *)objc_claimAutoreleasedReturnValue();
              if (v97)
                objc_msgSend(v207, "setObject:forKeyedSubscript:", v97, v96);

            }
            v93 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v242, v287, 16);
          }
          while (v93);
        }

        v240 = 0u;
        v241 = 0u;
        v238 = 0u;
        v239 = 0u;
        objc_msgSend(v90, "changedKeys");
        objb = (id)objc_claimAutoreleasedReturnValue();
        v202 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v238, v286, 16);
        if (v202)
        {
          v198 = *(_QWORD *)v239;
          do
          {
            v98 = 0;
            do
            {
              if (*(_QWORD *)v239 != v198)
                objc_enumerationMutation(objb);
              v216 = v98;
              v99 = *(_QWORD *)(*((_QWORD *)&v238 + 1) + 8 * v98);
              objc_msgSend(v90, "objectForKeyedSubscript:", v99);
              v100 = objc_claimAutoreleasedReturnValue();
              if (v100)
                objc_msgSend(v207, "setObject:forKeyedSubscript:", v100, v99);
              v211 = (id)v100;
              v236 = 0u;
              v237 = 0u;
              v234 = 0u;
              v235 = 0u;
              v101 = v194;
              v102 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v234, v285, 16);
              if (v102)
              {
                v103 = v102;
                v104 = *(_QWORD *)v235;
                do
                {
                  for (ii = 0; ii != v103; ++ii)
                  {
                    if (*(_QWORD *)v235 != v104)
                      objc_enumerationMutation(v101);
                    objc_msgSend(v90, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v234 + 1) + 8 * ii));
                    v106 = (void *)objc_claimAutoreleasedReturnValue();
                    if (v106)
                    {
                      FCLookupRecordByName(v9, v106);
                      v107 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v107)
                      {
                        objc_msgSend(v8, "recordFetchedBlock");
                        v108 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
                        ((void (**)(_QWORD, void *))v108)[2](v108, v107);

                      }
                    }

                  }
                  v103 = objc_msgSend(v101, "countByEnumeratingWithState:objects:count:", &v234, v285, 16);
                }
                while (v103);
              }

              v98 = v216 + 1;
            }
            while (v216 + 1 != v202);
            v202 = objc_msgSend(objb, "countByEnumeratingWithState:objects:count:", &v238, v286, 16);
          }
          while (v202);
        }

        objc_msgSend(v8, "desiredKeys");
        v109 = (void *)objc_claimAutoreleasedReturnValue();

        if (v109)
        {
          v110 = (void *)MEMORY[0x1E0C99E60];
          objc_msgSend(v8, "desiredKeys");
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v110, "setWithArray:", v111);
          v112 = (void *)objc_claimAutoreleasedReturnValue();

          v232 = 0u;
          v233 = 0u;
          v230 = 0u;
          v231 = 0u;
          objc_msgSend(v207, "changedKeys");
          v113 = (void *)objc_claimAutoreleasedReturnValue();
          v114 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v230, v284, 16);
          if (v114)
          {
            v115 = v114;
            v116 = *(_QWORD *)v231;
            do
            {
              for (jj = 0; jj != v115; ++jj)
              {
                if (*(_QWORD *)v231 != v116)
                  objc_enumerationMutation(v113);
                v118 = *(_QWORD *)(*((_QWORD *)&v230 + 1) + 8 * jj);
                if ((objc_msgSend(v112, "containsObject:", v118) & 1) == 0)
                  objc_msgSend(v207, "setObject:forKeyedSubscript:", 0, v118);
              }
              v115 = objc_msgSend(v113, "countByEnumeratingWithState:objects:count:", &v230, v284, 16);
            }
            while (v115);
          }

        }
        objc_msgSend(v207, "setObject:forKeyedSubscript:", v178, CFSTR("articleID"));
        objc_msgSend(v90, "recordChangeTag");
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "setObject:forKeyedSubscript:", v119, CFSTR("articleETag"));

        objc_msgSend(v90, "creationDate");
        v120 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "setObject:forKeyedSubscript:", v120, CFSTR("articleCreationDate"));

        objc_msgSend(v90, "modificationDate");
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v207, "setObject:forKeyedSubscript:", v121, CFSTR("articleModDate"));

        objc_msgSend(v170, "addObject:", v207);
        v87 = v183 + 1;
      }
      while (v183 + 1 != v175);
      v175 = objc_msgSend(v166, "countByEnumeratingWithState:objects:count:", &v248, v288, 16);
    }
    while (v175);
  }

  v228 = 0u;
  v229 = 0u;
  v226 = 0u;
  v227 = 0u;
  v122 = v170;
  v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v226, v283, 16);
  if (v123)
  {
    v124 = v123;
    v125 = *(_QWORD *)v227;
    do
    {
      for (kk = 0; kk != v124; ++kk)
      {
        if (*(_QWORD *)v227 != v125)
          objc_enumerationMutation(v122);
        v127 = *(_QWORD *)(*((_QWORD *)&v226 + 1) + 8 * kk);
        objc_msgSend(v8, "recordFetchedBlock");
        v128 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
        v128[2](v128, v127);

      }
      v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v226, v283, 16);
    }
    while (v124);
  }
  v169 = v122;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v203 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v199 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  objc = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v184 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v179 = (void *)objc_claimAutoreleasedReturnValue();
  v222 = 0u;
  v223 = 0u;
  v224 = 0u;
  v225 = 0u;
  v171 = v167;
  v129 = v188;
  v208 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v222, v282, 16);
  if (v208)
  {
    v176 = *(_QWORD *)v223;
    do
    {
      for (mm = 0; mm != v208; ++mm)
      {
        if (*(_QWORD *)v223 != v176)
          objc_enumerationMutation(v171);
        v131 = *(_QWORD *)(*((_QWORD *)&v222 + 1) + 8 * mm);
        objc_msgSend(v181, "objectForKeyedSubscript:", v131);
        v132 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v180, "objectForKeyedSubscript:", v131);
        v217 = (void *)objc_claimAutoreleasedReturnValue();
        v212 = objc_msgSend(v173, "containsObject:", v131);
        if (objc_msgSend(v132, "count"))
        {
          objc_msgSend(v129, "objectForKeyedSubscript:", v131);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v132, "firstObject");
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v134, "objectForKeyedSubscript:", CFSTR("order"));
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = objc_msgSend(v135, "compare:", v133) == -1;

          v137 = objc_msgSend(v132, "count") == 0;
          v138 = objc_alloc_init(FCCKTestContentDatabaseFeedCursor);
          objc_msgSend(v132, "firstObject");
          v139 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v139, "objectForKeyedSubscript:", CFSTR("order"));
          v140 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCKTestContentDatabaseFeedCursor setOrder:](v138, "setOrder:", v140);

          objc_msgSend(v132, "firstObject");
          v141 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v141, "objectForKeyedSubscript:", CFSTR("subOrder"));
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          -[FCCKTestContentDatabaseFeedCursor setSubOrder:](v138, "setSubOrder:", v142);

          v129 = v188;
          objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v138, 1, 0);
          v143 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "data");
          v143 = (void *)objc_claimAutoreleasedReturnValue();
          v136 = 0;
          v137 = 1;
        }
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v136);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v203, "addObject:", v144);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v137);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v199, "addObject:", v145);

        objc_msgSend(v184, "addObject:", v217);
        objc_msgSend(objc, "addObject:", v143);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v212);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v179, "addObject:", v146);

      }
      v208 = objc_msgSend(v171, "countByEnumeratingWithState:objects:count:", &v222, v282, 16);
    }
    while (v208);
  }

  v147 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C95048]), "initWithRecordType:", CFSTR("Results"));
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v203, CFSTR("reachedMinOrder"));
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v199, CFSTR("reachedEnd"));
  objc_msgSend(v147, "setObject:forKeyedSubscript:", objc, CFSTR("cursor"));
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v184, CFSTR("topOrder"));
  objc_msgSend(v147, "setObject:forKeyedSubscript:", v179, CFSTR("feedDropped"));
  objc_msgSend(v8, "desiredKeys");
  v148 = (void *)objc_claimAutoreleasedReturnValue();

  if (v148)
  {
    v149 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "desiredKeys");
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "setWithArray:", v150);
    v151 = (void *)objc_claimAutoreleasedReturnValue();

    v220 = 0u;
    v221 = 0u;
    v218 = 0u;
    v219 = 0u;
    objc_msgSend(v147, "changedKeys");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v218, v281, 16);
    if (v153)
    {
      v154 = v153;
      v155 = *(_QWORD *)v219;
      do
      {
        for (nn = 0; nn != v154; ++nn)
        {
          if (*(_QWORD *)v219 != v155)
            objc_enumerationMutation(v152);
          v157 = *(_QWORD *)(*((_QWORD *)&v218 + 1) + 8 * nn);
          if ((objc_msgSend(v151, "containsObject:", v157) & 1) == 0)
            objc_msgSend(v147, "setObject:forKeyedSubscript:", 0, v157);
        }
        v154 = objc_msgSend(v152, "countByEnumeratingWithState:objects:count:", &v218, v281, 16);
      }
      while (v154);
    }

    v129 = v188;
  }
  objc_msgSend(v8, "recordFetchedBlock");
  v158 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v158)[2](v158, v147);

  objc_msgSend(v8, "queryCompletionBlock");
  v159 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v159[2](v159, 0, 0);

}

id __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke(uint64_t a1)
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

id __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_2(uint64_t a1)
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

id __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_3(uint64_t a1)
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

uint64_t __75__FCCKTestFeedQueryEndpoint_handleQueryOperation_withRecords_droppedFeeds___block_invoke_156(uint64_t a1, void *a2)
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
