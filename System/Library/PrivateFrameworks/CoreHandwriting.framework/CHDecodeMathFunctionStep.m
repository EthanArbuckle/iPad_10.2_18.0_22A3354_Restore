@implementation CHDecodeMathFunctionStep

+ (id)definedMathFunctionNameMapping
{
  return &unk_1E7827178;
}

+ (id)definedMathFunctionNameSet
{
  void *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  objc_msgSend_definedMathFunctionNameMapping(v2, v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  objc_msgSend_allKeys(v8, v15, v16, v17, v18, v19, 0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v41, (uint64_t)v45, 16, v22);
  if (v26)
  {
    v27 = *(_QWORD *)v42;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v42 != v27)
          objc_enumerationMutation(v20);
        objc_msgSend_stringByReplacingOccurrencesOfString_withString_(*(void **)(*((_QWORD *)&v41 + 1) + 8 * v28), v23, (uint64_t)CFSTR(" "), (uint64_t)&stru_1E77F6F28, v24, v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v14, v30, (uint64_t)v29, v31, v32, v33);

        ++v28;
      }
      while (v26 != v28);
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v23, (uint64_t)&v41, (uint64_t)v45, 16, v25);
    }
    while (v26);
  }

  v39 = (void *)objc_msgSend_copy(v14, v34, v35, v36, v37, v38);
  return v39;
}

- (CHDecodeMathFunctionStep)init
{
  CHDecodeMathFunctionStep *v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSDictionary *mathFunctionNameMapping;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
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
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  unint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  BOOL v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  NSSet *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t j;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  NSSet *decoratedFunctions;
  id obj;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  id v94;
  CHDecodeMathFunctionStep *v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  objc_super v108;
  _BYTE v109[128];
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;

  v112 = *MEMORY[0x1E0C80C00];
  v108.receiver = self;
  v108.super_class = (Class)CHDecodeMathFunctionStep;
  v2 = -[CHDecodeMathFunctionStep init](&v108, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_class();
    objc_msgSend_definedMathFunctionNameMapping(v3, v4, v5, v6, v7, v8);
    v9 = objc_claimAutoreleasedReturnValue();
    mathFunctionNameMapping = v2->_mathFunctionNameMapping;
    v95 = v2;
    v2->_mathFunctionNameMapping = (NSDictionary *)v9;

    obj = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v106 = 0u;
    v107 = 0u;
    v104 = 0u;
    v105 = 0u;
    objc_msgSend_allKeys(v2->_mathFunctionNameMapping, v11, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v104, (uint64_t)v111, 16, v18);
    if (v19)
    {
      v90 = v16;
      v91 = *(_QWORD *)v105;
      do
      {
        v20 = 0;
        v92 = v19;
        do
        {
          if (*(_QWORD *)v105 != v91)
            objc_enumerationMutation(v16);
          v21 = *(void **)(*((_QWORD *)&v104 + 1) + 8 * v20);
          v94 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v102 = 0u;
          v103 = 0u;
          v100 = 0u;
          v101 = 0u;
          objc_msgSend_allKeys(v95->_mathFunctionNameMapping, v22, v23, v24, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = v20;
          v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v100, (uint64_t)v110, 16, v29);
          if (v35)
          {
            v36 = *(_QWORD *)v101;
            do
            {
              for (i = 0; i != v35; ++i)
              {
                if (*(_QWORD *)v101 != v36)
                  objc_enumerationMutation(v27);
                v38 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
                v39 = objc_msgSend_length(v38, v30, v31, v32, v33, v34);
                if (v39 > objc_msgSend_length(v21, v40, v41, v42, v43, v44)
                  && objc_msgSend_rangeOfString_(v38, v30, (uint64_t)v21, v32, v33, v34) != 0x7FFFFFFFFFFFFFFFLL)
                {
                  objc_msgSend_objectForKey_(v95->_mathFunctionNameMapping, v30, (uint64_t)v38, v32, v33, v34);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v50 = objc_msgSend_rangeOfString_(v45, v46, (uint64_t)CFSTR("\\mathrm"), v47, v48, v49) == 0x7FFFFFFFFFFFFFFFLL;

                  if (!v50)
                  {
                    objc_msgSend_objectForKey_(v95->_mathFunctionNameMapping, v30, (uint64_t)v38, v32, v33, v34);
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObject_(v94, v52, (uint64_t)v51, v53, v54, v55);

                  }
                }
              }
              v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v30, (uint64_t)&v100, (uint64_t)v110, 16, v34);
            }
            while (v35);
          }

          if (objc_msgSend_count(v94, v56, v57, v58, v59, v60))
            objc_msgSend_setValue_forKey_(obj, v61, (uint64_t)v94, (uint64_t)v21, v62, v63);

          v20 = v93 + 1;
          v16 = v90;
        }
        while (v93 + 1 != v92);
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v64, (uint64_t)&v104, (uint64_t)v111, 16, v65);
      }
      while (v19);
    }

    objc_storeStrong((id *)&v95->_stemFunctionMappings, obj);
    v66 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v98 = 0u;
    v99 = 0u;
    v96 = 0u;
    v97 = 0u;
    objc_msgSend_allKeys(v95->_stemFunctionMappings, v67, v68, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v96, (uint64_t)v109, 16, v74);
    if (v79)
    {
      v80 = *(_QWORD *)v97;
      do
      {
        for (j = 0; j != v79; ++j)
        {
          if (*(_QWORD *)v97 != v80)
            objc_enumerationMutation(v72);
          objc_msgSend_objectForKey_(v95->_stemFunctionMappings, v75, *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * j), v76, v77, v78);
          v82 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v66, v83, (uint64_t)v82, v84, v85, v86);

        }
        v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v75, (uint64_t)&v96, (uint64_t)v109, 16, v78);
      }
      while (v79);
    }

    decoratedFunctions = v95->_decoratedFunctions;
    v95->_decoratedFunctions = v66;

    return v95;
  }
  return v2;
}

- (id)_sortedFunctionNames:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_allKeys(a3, a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v6, v7, (uint64_t)&unk_1E77F1470, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)isFunctionInTranscriptionPathWrappedByAnyStringFromArray:(id)a3 functionName:(id)a4 pathTranscription:(id)a5 functionStartLocation:(int64_t)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  uint64_t v22;
  const char *v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
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
  char isEqualToString;
  BOOL v52;
  id obj;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _BYTE v60[128];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v55 = a5;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v9;
  v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v56, (uint64_t)v60, 16, v12);
  if (v18)
  {
    v19 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v57 != v19)
          objc_enumerationMutation(obj);
        v21 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v22 = objc_msgSend_length(v21, v13, v14, v15, v16, v17);
        v24 = objc_msgSend_rangeOfString_options_range_(v21, v23, (uint64_t)v10, 0, 0, v22);
        v25 = v24;
        if (v24 != 0x7FFFFFFFFFFFFFFFLL && a6 >= v24)
        {
          v27 = objc_msgSend_length(v21, v13, v14, v15, v16, v17);
          v33 = objc_msgSend_length(v55, v28, v29, v30, v31, v32);
          v14 = a6 - v25;
          if (v27 + a6 - v25 <= v33)
          {
            objc_msgSend_substringWithRange_(v55, v13, v14, v27, v16, v17);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lowercaseString(v34, v35, v36, v37, v38, v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lowercaseString(v21, v41, v42, v43, v44, v45);
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v40, v47, (uint64_t)v46, v48, v49, v50);

            if ((isEqualToString & 1) != 0)
            {
              v52 = 1;
              goto LABEL_17;
            }
          }
        }
      }
      v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v56, (uint64_t)v60, 16, v17);
    }
    while (v18);
  }
  v52 = 0;
LABEL_17:

  return v52;
}

- (id)process:(id)a3 options:(id)a4
{
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  BOOL v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  const char *v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t k;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  void *v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  int isEqualToString;
  void *v110;
  BOOL v111;
  void *v112;
  void *v113;
  const char *v114;
  char isFunctionInTranscriptionPathWrappedByAnyStringFromArray_functionName_pathTranscription_functionStartLocation;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char v139;
  char v140;
  char v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  char v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  int v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  void *v192;
  void *v193;
  CHTokenizedMathResultToken *v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  void *v200;
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
  double v212;
  double v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  double v219;
  double v220;
  double v221;
  double v222;
  double v223;
  double v224;
  double v225;
  double v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  const char *v238;
  double v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  CHTokenizedMathResultToken *v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  void *v253;
  CHTokenizedMathResultToken *v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  void *v263;
  CHTokenizedMathResultToken *v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  void *v273;
  const char *v274;
  uint64_t v275;
  uint64_t v276;
  const char *v277;
  uint64_t v278;
  uint64_t v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  BOOL v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  const char *v305;
  uint64_t v306;
  uint64_t v307;
  void *v308;
  const char *v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  const char *v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  CHTokenizedMathResult *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  id v346;
  void *v347;
  void *v348;
  void *v349;
  unint64_t i;
  id v351;
  id obj;
  uint64_t v353;
  uint64_t v354;
  uint64_t j;
  void *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v362;
  void *v363;
  uint64_t v364;
  char v365;
  void *v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  uint8_t buf[16];
  _BYTE v372[128];
  uint64_t v373;

  v373 = *MEMORY[0x1E0C80C00];
  v351 = a3;
  v346 = a4;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v5 = (id)qword_1EF568E20;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v5, OS_LOG_TYPE_DEBUG, "CHDecodeMathFunctionStep is running", buf, 2u);
  }

  objc_msgSend__sortedFunctionNames_(self, v6, (uint64_t)self->_mathFunctionNameMapping, v7, v8, v9);
  v348 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13, v14);
  v347 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_result(v351, v15, v16, v17, v18, v19, v346);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v20, v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = i < objc_msgSend_count(v26, v27, v28, v29, v30, v31);

    if (!v32)
      break;
    objc_msgSend_result(v351, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_transcriptionPaths(v38, v39, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v44, v45, i, v46, v47, v48);
    v349 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_result(v351, v49, v50, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_result(v351, v55, v56, v57, v58, v59);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend_tokenColumnCount(v60, v61, v62, v63, v64, v65);
    objc_msgSend_transcriptionWithPath_columnRange_(v54, v67, (uint64_t)v349, 0, v66, v68);
    v362 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_retrievePathTokens_atPathIndex_(self, v69, (uint64_t)v351, i, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v366 = (void *)objc_msgSend_mutableCopy(v72, v73, v74, v75, v76, v77);

    v369 = 0u;
    v370 = 0u;
    v367 = 0u;
    v368 = 0u;
    obj = v348;
    v354 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v78, (uint64_t)&v367, (uint64_t)v372, 16, v79);
    if (v354)
    {
      v353 = *(_QWORD *)v368;
      do
      {
        for (j = 0; j != v354; ++j)
        {
          if (*(_QWORD *)v368 != v353)
            objc_enumerationMutation(obj);
          v363 = *(void **)(*((_QWORD *)&v367 + 1) + 8 * j);
          objc_msgSend_objectForKeyedSubscript_(self->_mathFunctionNameMapping, v80, (uint64_t)v363, v81, v82, v83);
          v356 = (void *)objc_claimAutoreleasedReturnValue();
          v89 = 0;
LABEL_14:
          for (k = objc_msgSend_length(v362, v84, v85, v86, v87, v88);
                v89 <= k - objc_msgSend_length(v363, v91, v92, v93, v94, v95);
                k = objc_msgSend_length(v181, v326, v327, v328, v329, v330))
          {
            v101 = objc_msgSend_length(v362, v96, v97, v98, v99, v100);
            v103 = objc_msgSend_rangeOfString_options_range_(v362, v102, (uint64_t)v363, 1, v89, v101 - v89);
            v359 = (uint64_t)v84;
            v364 = v103;
            if (v103)
            {
              if (v103 == 0x7FFFFFFFFFFFFFFFLL)
                break;
              objc_msgSend_substringWithRange_(v362, v84, v103 - 1, 1, v87, v88);
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              isEqualToString = objc_msgSend_isEqualToString_(v104, v105, (uint64_t)CFSTR(" "), v106, v107, v108);

              if (!isEqualToString)
                goto LABEL_13;
            }
            objc_msgSend_objectForKey_(self->_stemFunctionMappings, v84, (uint64_t)v363, v86, v87, v88);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            v111 = v110 == 0;

            if (!v111)
            {
              objc_msgSend_objectForKeyedSubscript_(self->_stemFunctionMappings, v84, (uint64_t)v363, v86, v87, v88);
              v112 = (void *)objc_claimAutoreleasedReturnValue();
              v113 = (void *)objc_opt_class();
              isFunctionInTranscriptionPathWrappedByAnyStringFromArray_functionName_pathTranscription_functionStartLocation = objc_msgSend_isFunctionInTranscriptionPathWrappedByAnyStringFromArray_functionName_pathTranscription_functionStartLocation_(v113, v114, (uint64_t)v112, (uint64_t)v363, (uint64_t)v362, v364);

              if ((isFunctionInTranscriptionPathWrappedByAnyStringFromArray_functionName_pathTranscription_functionStartLocation & 1) != 0)
              {
LABEL_13:
                v89 = v364 + 1;
                goto LABEL_14;
              }
            }
            if (v364)
            {
              v116 = 0;
              v117 = 0;
              v118 = v366;
              do
              {
                objc_msgSend_objectAtIndexedSubscript_(v118, v84, v116, v86, v87, v88);
                v119 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_string(v119, v120, v121, v122, v123, v124);
                v125 = (void *)objc_claimAutoreleasedReturnValue();
                v131 = objc_msgSend_length(v125, v126, v127, v128, v129, v130);

                v117 += v131 + 1;
                ++v116;
                v118 = v366;
              }
              while (v117 != v364);
            }
            else
            {
              v116 = 0;
            }
            objc_msgSend_componentsSeparatedByString_(v363, v84, (uint64_t)CFSTR(" "), v86, v87, v88);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            v360 = objc_msgSend_count(v132, v133, v134, v135, v136, v137);
            v358 = v116;

            v138 = v360;
            v357 = v360 - 1;
            if (v360 < 1)
            {
              v365 = 0;
              v141 = 0;
              v140 = 0;
            }
            else
            {
              v139 = 0;
              v140 = 0;
              v141 = 0;
              v365 = 0;
              v142 = v358;
              do
              {
                objc_msgSend_objectAtIndexedSubscript_(v366, v84, v142, v86, v87, v88);
                v143 = (void *)objc_claimAutoreleasedReturnValue();
                v149 = objc_msgSend_properties(v143, v144, v145, v146, v147, v148);

                objc_msgSend_objectAtIndexedSubscript_(v366, v150, v142, v151, v152, v153);
                v154 = objc_claimAutoreleasedReturnValue();
                v160 = objc_msgSend_properties((void *)v154, v155, v156, v157, v158, v159);

                objc_msgSend_objectAtIndexedSubscript_(v366, v161, v142, v162, v163, v164);
                v165 = objc_claimAutoreleasedReturnValue();
                LOBYTE(v154) = objc_msgSend_properties((void *)v165, v166, v167, v168, v169, v170);

                objc_msgSend_objectAtIndexedSubscript_(v366, v171, v142, v172, v173, v174);
                v175 = (void *)objc_claimAutoreleasedReturnValue();
                LOBYTE(v165) = objc_msgSend_properties(v175, v176, v177, v178, v179, v180);

                v139 = v139 & 1 | ((v149 & 0x10) != 0);
                v140 = v140 & 1 | ((v160 & 0x80000) != 0);
                v141 = v141 & 1 | ((v154 & 0x40) != 0);
                v365 = v365 & 1 | ((v165 & 0x80) != 0);
                ++v142;
                --v138;
              }
              while (v138);
              if ((v139 & 1) != 0)
                goto LABEL_13;
            }
            if ((v140 & 1) != 0 || (v141 & 1) != 0 || (v365 & 1) != 0)
              goto LABEL_13;
            objc_msgSend_stringByReplacingCharactersInRange_withString_(v362, v84, v364, v359, (uint64_t)v356, v88);
            v181 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend_containsObject_(self->_decoratedFunctions, v182, (uint64_t)v356, v183, v184, v185))
            {
              v190 = v358;
              v191 = v360;
              v192 = v366;
              if (v360 >= 1)
              {
                do
                {
                  objc_msgSend_objectAtIndexedSubscript_(v192, v186, v190, v187, v188, v189);
                  v193 = (void *)objc_claimAutoreleasedReturnValue();
                  v194 = [CHTokenizedMathResultToken alloc];
                  objc_msgSend_string(v193, v195, v196, v197, v198, v199);
                  v200 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_strokeIndexes(v193, v201, v202, v203, v204, v205);
                  v206 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_score(v193, v207, v208, v209, v210, v211);
                  v213 = v212;
                  objc_msgSend_bounds(v193, v214, v215, v216, v217, v218);
                  v220 = v219;
                  v222 = v221;
                  v224 = v223;
                  v226 = v225;
                  objc_msgSend_maskedAlternative(v193, v227, v228, v229, v230, v231);
                  v232 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_maskedAlternativeScore(v193, v233, v234, v235, v236, v237);
                  v240 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_maskedAlternative_maskedAlternativeScore_(v194, v238, (uint64_t)v200, (uint64_t)v206, 256, (uint64_t)v232, v213, v220, v222, v224, v226, v239);

                  objc_msgSend_setObject_atIndexedSubscript_(v366, v241, (uint64_t)v240, v190, v242, v243);
                  ++v190;
                  --v191;
                  v192 = v366;
                }
                while (v191);
              }
              v244 = [CHTokenizedMathResultToken alloc];
              objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v245, v246, v247, v248, v249);
              v250 = (void *)objc_claimAutoreleasedReturnValue();
              v253 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v244, v251, (uint64_t)CFSTR("\\mathrm"), (uint64_t)v250, 1, v252, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

              v254 = [CHTokenizedMathResultToken alloc];
              objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v255, v256, v257, v258, v259);
              v260 = (void *)objc_claimAutoreleasedReturnValue();
              v263 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v254, v261, (uint64_t)CFSTR("{"), (uint64_t)v260, 1, v262, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

              v264 = [CHTokenizedMathResultToken alloc];
              objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v265, v266, v267, v268, v269);
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              v273 = (void *)objc_msgSend_initWithString_strokeIndexes_score_bounds_properties_(v264, v271, (uint64_t)CFSTR("}"), (uint64_t)v270, 1, v272, 1.0, *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));

              objc_msgSend_insertObject_atIndex_(v366, v274, (uint64_t)v273, v360 + v358, v275, v276);
              objc_msgSend_insertObject_atIndex_(v366, v277, (uint64_t)v263, v358, v278, v279);
              objc_msgSend_insertObject_atIndex_(v366, v280, (uint64_t)v253, v358, v281, v282);

            }
            else
            {
              objc_msgSend_objectAtIndexedSubscript_(v366, v186, v358, v187, v188, v189);
              v283 = (void *)objc_claimAutoreleasedReturnValue();
              v253 = (void *)objc_msgSend_mutableCopy(v283, v284, v285, v286, v287, v288);

              v293 = v360;
              if (v360 >= 2)
              {
                v294 = v358 + 1;
                do
                {
                  objc_msgSend_objectAtIndexedSubscript_(v366, v289, v294, v290, v291, v292);
                  v295 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_appendToken_(v253, v296, (uint64_t)v295, v297, v298, v299);

                  ++v294;
                  v300 = v357-- == 1;
                  v293 = v360;
                }
                while (!v300);
              }
              objc_msgSend_setString_(v253, v289, (uint64_t)v356, v290, v291, v292);
              objc_msgSend_setProperties_(v253, v301, 256, v302, v303, v304);
              objc_msgSend_indexSetWithIndexesInRange_(MEMORY[0x1E0CB36B8], v305, v358, v293, v306, v307);
              v308 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_removeObjectsAtIndexes_(v366, v309, (uint64_t)v308, v310, v311, v312);

              v263 = (void *)objc_msgSend_copy(v253, v313, v314, v315, v316, v317);
              objc_msgSend_insertObject_atIndex_(v366, v318, (uint64_t)v263, v358, v319, v320);
            }

            v89 = objc_msgSend_length(v356, v321, v322, v323, v324, v325) + v364;
            v362 = v181;
          }

        }
        v354 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v80, (uint64_t)&v367, (uint64_t)v372, 16, v83);
      }
      while (v354);
    }

    objc_msgSend_addObject_(v347, v331, (uint64_t)v366, v332, v333, v334);
  }
  v335 = [CHTokenizedMathResult alloc];
  v340 = (void *)objc_msgSend_initWithBestPathTokens_(v335, v336, (uint64_t)v347, v337, v338, v339);
  objc_msgSend_setResult_(v351, v341, (uint64_t)v340, v342, v343, v344);

  return v351;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoratedFunctions, 0);
  objc_storeStrong((id *)&self->_stemFunctionMappings, 0);
  objc_storeStrong((id *)&self->_mathFunctionNameMapping, 0);
}

@end
