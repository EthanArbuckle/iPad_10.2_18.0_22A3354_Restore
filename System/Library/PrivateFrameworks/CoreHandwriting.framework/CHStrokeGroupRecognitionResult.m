@implementation CHStrokeGroupRecognitionResult

- (CHStrokeGroupRecognitionResult)init
{
  NSObject *v3;
  uint8_t v5[16];

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1BE607000, v3, OS_LOG_TYPE_FAULT, "Use the designated initializer instead", v5, 2u);
  }

  return 0;
}

- (CHStrokeGroupRecognitionResult)initWithOrderedLocales:(id)a3 resultsByLocale:(id)a4 errorsByLocale:(id)a5 languageFitnessByLocale:(id)a6 mathResult:(id)a7 inputStrokeIdentifiers:(id)a8
{
  return (CHStrokeGroupRecognitionResult *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_inputDrawing_inputDrawingCutPoints_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8, 0, 0);
}

- (id)description
{
  void *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CHStrokeGroupRecognitionResult;
  -[CHStrokeGroupRecognitionResult description](&v16, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recognitionResultsByLocale(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v3, v10, (uint64_t)CFSTR(" %@"), v11, v12, v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)localesSortedByRawLanguageFitness:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend_languageFitnessByLocale(self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedLocales_usingLanguageFitness_useCombinedScore_(v5, v12, (uint64_t)v4, (uint64_t)v11, 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)localesSortedByCombinedLanguageFitness:(id)a3
{
  id v4;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  objc_msgSend_languageFitnessByLocale(self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedLocales_usingLanguageFitness_useCombinedScore_(v5, v12, (uint64_t)v4, (uint64_t)v11, 1, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)highConfidenceTextForSessionResult:(id)a3 averageTokenScore:(double *)a4 rejectionRate:(double *)a5 doesContainUnfilteredMultiLocaleResults:(BOOL *)a6
{
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
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
  void *v32;
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
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t j;
  void *v81;
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
  BOOL v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  NSArray *orderedLocales;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  void *v110;
  id v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t k;
  void *v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  BOOL v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  int v155;
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
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v192;
  uint64_t v193;
  uint64_t i;
  id obj;
  uint64_t v196;
  double *v197;
  BOOL *v198;
  double *v199;
  id v200;
  __int128 v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  id v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  _BYTE v214[128];
  _BYTE v215[128];
  _BYTE v216[128];
  uint64_t v217;

  v217 = *MEMORY[0x1E0C80C00];
  v200 = a3;
  objc_msgSend_mathResult(self, v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v197 = a5;
    v198 = a6;
    v199 = a4;
    if (!v200)
      goto LABEL_43;
    v56 = v200;
    objc_sync_enter(v56);
    if (!v56[4])
    {
      v212 = 0u;
      v213 = 0u;
      v210 = 0u;
      v211 = 0u;
      objc_msgSend_preferredLocales(v56, v57, v58, v59, v60, v61);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v62, (uint64_t)&v210, (uint64_t)v216, 16, v63);
      if (v192)
      {
        v193 = *(_QWORD *)v211;
        v196 = 2;
        do
        {
          for (i = 0; i != v192; ++i)
          {
            if (*(_QWORD *)v211 != v193)
              objc_enumerationMutation(obj);
            v69 = *(void **)(*((_QWORD *)&v210 + 1) + 8 * i);
            v206 = 0u;
            v207 = 0u;
            v208 = 0u;
            v209 = 0u;
            objc_msgSend_locales(v56, v64, v65, v66, v67, v68);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v71, (uint64_t)&v206, (uint64_t)v215, 16, v72);
            if (v78)
            {
              v79 = *(_QWORD *)v207;
              while (2)
              {
                for (j = 0; j != v78; ++j)
                {
                  if (*(_QWORD *)v207 != v79)
                    objc_enumerationMutation(v70);
                  v81 = *(void **)(*((_QWORD *)&v206 + 1) + 8 * j);
                  objc_msgSend_languageCode(v69, v73, v74, v75, v76, v77);
                  v82 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend_languageCode(v81, v83, v84, v85, v86, v87);
                  v88 = (void *)objc_claimAutoreleasedReturnValue();
                  v93 = objc_msgSend_caseInsensitiveCompare_(v82, v89, (uint64_t)v88, v90, v91, v92) == 0;

                  if (v93)
                  {

                    v94 = 1;
                    goto LABEL_28;
                  }
                }
                v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v70, v73, (uint64_t)&v206, (uint64_t)v215, 16, v77);
                if (v78)
                  continue;
                break;
              }
            }

          }
          v192 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v64, (uint64_t)&v210, (uint64_t)v216, 16, v68);
        }
        while (v192);
      }
      else
      {
        v94 = 2;
LABEL_28:
        v196 = v94;
      }

      v56[4] = v196;
    }
    objc_sync_exit(v56);

    if (v56[4] != 1)
    {
LABEL_43:
      v32 = 0;
      goto LABEL_55;
    }
    v95 = (void *)objc_opt_class();
    objc_msgSend_recognitionResultsByLocale(self, v96, v97, v98, v99, v100);
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    orderedLocales = self->_orderedLocales;
    objc_msgSend_languageFitnessByLocale(self, v103, v104, v105, v106, v107);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = 0;
    objc_msgSend_filteredResultsByLocale_orderedLocales_usingLanguageFitness_outSortedLocales_(v95, v109, (uint64_t)v101, (uint64_t)orderedLocales, (uint64_t)v108, (uint64_t)&v205);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    v111 = v205;

    v203 = 0u;
    v204 = 0u;
    v201 = 0u;
    v202 = 0u;
    objc_msgSend_allValues(v110, v112, v113, v114, v115, v116);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    v120 = 0;
    v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v118, (uint64_t)&v201, (uint64_t)v214, 16, v119);
    if (v126)
    {
      v127 = *(_QWORD *)v202;
      do
      {
        for (k = 0; k != v126; ++k)
        {
          if (*(_QWORD *)v202 != v127)
            objc_enumerationMutation(v117);
          v129 = *(void **)(*((_QWORD *)&v201 + 1) + 8 * k);
          if (v120)
          {
            objc_msgSend_topTranscription(v129, v121, v122, v123, v124, v125);
            v130 = (void *)objc_claimAutoreleasedReturnValue();
            v134 = objc_msgSend_compare_options_(v120, v131, (uint64_t)v130, 1, v132, v133) == 0;

            if (!v134)
            {
              v144 = 0;
              goto LABEL_44;
            }
          }
          else
          {
            objc_msgSend_topTranscription(v129, v121, v122, v123, v124, v125);
            v120 = (void *)objc_claimAutoreleasedReturnValue();
          }
        }
        v126 = objc_msgSend_countByEnumeratingWithState_objects_count_(v117, v121, (uint64_t)&v201, (uint64_t)v214, 16, v125);
      }
      while (v126);
    }

    objc_msgSend_firstObject(v111, v135, v136, v137, v138, v139);
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v110, v140, (uint64_t)v117, v141, v142, v143);
    v144 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_44:

    objc_msgSend_standardUserDefaults(MEMORY[0x1E0C99EA0], v145, v146, v147, v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    v155 = objc_msgSend_BOOLForKey_(v150, v151, (uint64_t)CFSTR("CHSkipConfidenceFiltering"), v152, v153, v154);

    objc_msgSend_transcriptionPaths(v144, v156, v157, v158, v159, v160);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v161, v162, v163, v164, v165, v166);
    v167 = (void *)objc_claimAutoreleasedReturnValue();

    if (v167)
    {
      v173 = objc_msgSend_length(v167, v168, v169, v170, v171, v172);
      objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_rejectionRate_tokenProcessingBlock_(v144, v174, (uint64_t)v167, 0, v173, v155 ^ 1u, v155 ^ 1u, v197, 0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v180 = objc_msgSend_length(v32, v175, v176, v177, v178, v179);
    }
    else
    {
      v32 = 0;
      v180 = objc_msgSend_length(0, v168, v169, v170, v171, v172);
    }
    if (v180)
    {
      if (v199)
        goto LABEL_49;
    }
    else
    {

      v32 = 0;
      if (v199)
      {
LABEL_49:
        v186 = objc_msgSend_length(v167, v181, v182, v183, v184, v185);
        objc_msgSend_averageTokenRecognitionScoreForColumnRange_(v144, v187, 0, v186, v188, v189);
        *(_QWORD *)v199 = v190;
        if (!v198)
          goto LABEL_54;
        goto LABEL_53;
      }
    }
    if (!v198)
    {
LABEL_54:

      goto LABEL_55;
    }
LABEL_53:
    *v198 = (unint64_t)objc_msgSend_count(v110, v181, v182, v183, v184, v185) > 1;
    goto LABEL_54;
  }
  objc_msgSend_mathResult(self, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_preferredTranscription(v21, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v28, (uint64_t)v27, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_mathResult(self, v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mathResult(self, v39, v40, v41, v42, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend_tokenColumnCount(v44, v45, v46, v47, v48, v49);
  objc_msgSend_averageTokenScoreForColumnRange_(v38, v51, 0, v50, v52, v53);
  v55 = v54;

  if (a4)
    *(_QWORD *)a4 = v55;
  if (a5)
    *a5 = 0.0;
  if (a6)
    *a6 = 0;
LABEL_55:

  return v32;
}

- (BOOL)isCandidateMathGroup
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
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
  NSString *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  NSCharacterSet *v29;

  if (self->_mathResult)
    return 1;
  objc_msgSend_preferredLocale(self, a2, v2, v3, v4, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend_objectForKeyedSubscript_(self->_recognitionResultsByLocale, v8, (uint64_t)v12, v9, v10, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topTranscription(v13, v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v19, v20, (uint64_t)CFSTR(" "), (uint64_t)&stru_1E77F6F28, v21, v22);
    v23 = (NSString *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_ch_mathCharSet(MEMORY[0x1E0CB3500], v24, v25, v26, v27, v28);
    v29 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v19) = isStringEntirelyFromSet(v23, v29);

    return (char)v19;
  }
  else
  {

    return 0;
  }
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)languageFitnessForLocale:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  int64x2_t v22;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v4 = a3;
  v22 = vdupq_n_s64(0xC7EFFFFFE0000000);
  objc_msgSend_languageFitnessByLocale(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v10, v11, (uint64_t)v4, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    objc_msgSend_getValue_(v15, v16, (uint64_t)&v22, v17, v18, v19);

  v21 = *(double *)&v22.i64[1];
  v20 = *(double *)v22.i64;
  result.var1 = v21;
  result.var0 = v20;
  return result;
}

- (id)preferredLocale
{
  void *v3;
  NSDictionary *recognitionResultsByLocale;
  NSArray *orderedLocales;
  NSDictionary *languageFitnessByLocale;
  const char *v7;
  void *v8;
  id v9;
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
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  NSArray *v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  NSObject *v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  id v81;
  uint8_t buf[4];
  id v83;
  __int16 v84;
  void *v85;
  __int16 v86;
  void *v87;
  _BYTE v88[128];
  uint64_t v89;

  v89 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_class();
  recognitionResultsByLocale = self->_recognitionResultsByLocale;
  languageFitnessByLocale = self->_languageFitnessByLocale;
  orderedLocales = self->_orderedLocales;
  v81 = 0;
  objc_msgSend_filteredResultsByLocale_orderedLocales_usingLanguageFitness_outSortedLocales_(v3, v7, (uint64_t)recognitionResultsByLocale, (uint64_t)orderedLocales, (uint64_t)languageFitnessByLocale, (uint64_t)&v81);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v81;
  if (!objc_msgSend_count(v8, v10, v11, v12, v13, v14))
  {
    objc_msgSend_allKeys(self->_recognitionResultsByLocale, v15, v16, v17, v18, v19);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localesSortedByRawLanguageFitness_(self, v33, (uint64_t)v32, v34, v35, v36);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_firstObject(v25, v37, v38, v39, v40, v41);
    v31 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  if (objc_msgSend_count(v8, v15, v16, v17, v18, v19) == 1)
  {
    objc_msgSend_allKeys(v8, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v25, v26, v27, v28, v29, v30);
    v31 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v42 = (id)v31;
    goto LABEL_6;
  }
  objc_msgSend_allKeys(v8, v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v45 = self->_orderedLocales;
  v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v46, (uint64_t)&v77, (uint64_t)v88, 16, v47);
  if (v52)
  {
    v53 = *(_QWORD *)v78;
LABEL_9:
    v54 = 0;
    while (1)
    {
      if (*(_QWORD *)v78 != v53)
        objc_enumerationMutation(v45);
      v55 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * v54);
      if ((objc_msgSend_containsObject_(v25, v48, (uint64_t)v55, v49, v50, v51, (_QWORD)v77) & 1) != 0)
        break;
      if (v52 == ++v54)
      {
        v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(v45, v48, (uint64_t)&v77, (uint64_t)v88, 16, v51);
        if (v52)
          goto LABEL_9;
        goto LABEL_15;
      }
    }
    v42 = v55;

    if (v42)
      goto LABEL_6;
  }
  else
  {
LABEL_15:

  }
  objc_msgSend_firstObject(v9, v56, v57, v58, v59, v60, (_QWORD)v77);
  v42 = (id)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v61 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_ch_descriptionWithSeparator_filterBlock_(v25, v62, (uint64_t)CFSTR(", "), (uint64_t)&unk_1E77F3430, v63, v64);
    v65 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_ch_descriptionWithSeparator_filterBlock_(self->_orderedLocales, v66, (uint64_t)CFSTR(", "), (uint64_t)&unk_1E77F3450, v67, v68);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localeIdentifier(v42, v70, v71, v72, v73, v74);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v83 = v65;
    v84 = 2112;
    v85 = v69;
    v86 = 2112;
    v87 = v75;
    _os_log_impl(&dword_1BE607000, v61, OS_LOG_TYPE_ERROR, "Error: unexpected missing preferredLocale with competing locales %@, ordered locales %@, falling back on %@", buf, 0x20u);

  }
  if (!v42)
  {
    if (qword_1EF568E88 == -1)
    {
      v76 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
      {
LABEL_25:

        v42 = 0;
        goto LABEL_6;
      }
    }
    else
    {
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v76 = (id)qword_1EF568E18[0];
      if (!os_log_type_enabled(v76, OS_LOG_TYPE_FAULT))
        goto LABEL_25;
    }
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v76, OS_LOG_TYPE_FAULT, "There must be a preferred locale for the filtered results if there exists at least one result.", buf, 2u);
    goto LABEL_25;
  }
LABEL_6:

  v43 = v42;
  return v43;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  NSDictionary *languageFitnessByLocale;
  id v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _QWORD v41[4];
  id v42;

  v40 = a3;
  objc_msgSend_encodeObject_forKey_(v40, v4, (uint64_t)self->_orderedLocales, (uint64_t)CFSTR("orderedLocales"), v5, v6);
  objc_msgSend_encodeObject_forKey_(v40, v7, (uint64_t)self->_recognitionResultsByLocale, (uint64_t)CFSTR("recognitionResultsByLocale"), v8, v9);
  objc_msgSend_encodeObject_forKey_(v40, v10, (uint64_t)self->_mathResult, (uint64_t)CFSTR("mathResult"), v11, v12);
  objc_msgSend_encodeObject_forKey_(v40, v13, (uint64_t)self->_errorsByLocale, (uint64_t)CFSTR("errorsByLocale"), v14, v15);
  objc_msgSend_encodeObject_forKey_(v40, v16, (uint64_t)self->_inputStrokeIdentifiers, (uint64_t)CFSTR("inputStrokeIdentifiers"), v17, v18);
  v19 = (void *)MEMORY[0x1E0C99E08];
  v25 = objc_msgSend_count(self->_languageFitnessByLocale, v20, v21, v22, v23, v24);
  objc_msgSend_dictionaryWithCapacity_(v19, v26, v25, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  languageFitnessByLocale = self->_languageFitnessByLocale;
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = sub_1BE6C4AF0;
  v41[3] = &unk_1E77F3478;
  v32 = v30;
  v42 = v32;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(languageFitnessByLocale, v33, (uint64_t)v41, v34, v35, v36);
  objc_msgSend_encodeObject_forKey_(v40, v37, (uint64_t)v32, (uint64_t)CFSTR("languageFitnessDictByLocale"), v38, v39);

}

- (CHStrokeGroupRecognitionResult)initWithCoder:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  int v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  _QWORD *v96;
  id v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  CHStrokeGroupRecognitionResult *v131;
  _QWORD v134[5];
  _QWORD v135[5];
  _QWORD v136[3];
  _QWORD v137[4];
  _QWORD v138[2];
  _QWORD v139[3];
  _QWORD v140[2];
  _QWORD v141[5];

  v141[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E60];
  v141[0] = objc_opt_class();
  v141[1] = objc_opt_class();
  v141[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v5, (uint64_t)v141, 3, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v4, v9, (uint64_t)v8, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v14, (uint64_t)v13, (uint64_t)CFSTR("recognitionResultsByLocale"), v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v19, v18, (uint64_t)CFSTR("mathResult"), v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0C99E60];
  v140[0] = objc_opt_class();
  v140[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v24, (uint64_t)v140, 2, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v23, v28, (uint64_t)v27, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v33, (uint64_t)v32, (uint64_t)CFSTR("orderedLocales"), v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = (void *)MEMORY[0x1E0C99E60];
  v139[0] = objc_opt_class();
  v139[1] = objc_opt_class();
  v139[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v38, (uint64_t)v139, 3, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v37, v42, (uint64_t)v41, v43, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v47, (uint64_t)v46, (uint64_t)CFSTR("errorsByLocale"), v48, v49);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  v51 = (void *)MEMORY[0x1E0C99E60];
  v138[0] = objc_opt_class();
  v138[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v52, (uint64_t)v138, 2, v53, v54);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v51, v56, (uint64_t)v55, v57, v58, v59);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v61, (uint64_t)v60, (uint64_t)CFSTR("inputStrokeIdentifiers"), v62, v63);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v69 = objc_msgSend_containsValueForKey_(v3, v65, (uint64_t)CFSTR("languageFitnessDictByLocale"), v66, v67, v68);
  v70 = (void *)MEMORY[0x1E0C99E60];
  if (v69)
  {
    v137[0] = objc_opt_class();
    v137[1] = objc_opt_class();
    v137[2] = objc_opt_class();
    v137[3] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v71, (uint64_t)v137, 4, v72, v73);
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v70, v75, (uint64_t)v74, v76, v77, v78);
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v3, v80, (uint64_t)v79, (uint64_t)CFSTR("languageFitnessDictByLocale"), v81, v82);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v84 = (void *)MEMORY[0x1E0C99E08];
    v90 = objc_msgSend_count(v83, v85, v86, v87, v88, v89);
    objc_msgSend_dictionaryWithCapacity_(v84, v91, v90, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    v135[0] = MEMORY[0x1E0C809B0];
    v135[1] = 3221225472;
    v135[2] = sub_1BE6C525C;
    v135[3] = &unk_1E77F34A0;
    v96 = v135;
    v97 = v95;
    v135[4] = v97;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v83, v98, (uint64_t)v135, v99, v100, v101);
  }
  else
  {
    v136[0] = objc_opt_class();
    v136[1] = objc_opt_class();
    v136[2] = objc_opt_class();
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v102, (uint64_t)v136, 3, v103, v104);
    v105 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setWithArray_(v70, v106, (uint64_t)v105, v107, v108, v109);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_decodeObjectOfClasses_forKey_(v3, v111, (uint64_t)v110, (uint64_t)CFSTR("languageFitnessByLocale"), v112, v113);
    v83 = (void *)objc_claimAutoreleasedReturnValue();

    v114 = (void *)MEMORY[0x1E0C99E08];
    v120 = objc_msgSend_count(v83, v115, v116, v117, v118, v119);
    objc_msgSend_dictionaryWithCapacity_(v114, v121, v120, v122, v123, v124);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v134[0] = MEMORY[0x1E0C809B0];
    v134[1] = 3221225472;
    v134[2] = sub_1BE6C5388;
    v134[3] = &unk_1E77F34C8;
    v96 = v134;
    v97 = v125;
    v134[4] = v97;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v83, v126, (uint64_t)v134, v127, v128, v129);
  }

  v131 = (CHStrokeGroupRecognitionResult *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_(self, v130, (uint64_t)v36, (uint64_t)v17, (uint64_t)v50, (uint64_t)v97, v22, v64, 0);
  return v131;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CHStrokeGroupRecognitionResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CHStrokeGroupRecognitionResult *v11;
  NSDictionary *recognitionResultsByLocale;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSDictionary *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int isEqual;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSDictionary *errorsByLocale;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  NSDictionary *languageFitnessByLocale;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  NSDictionary *v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  NSArray *inputStrokeIdentifiers;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  NSArray *v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  int v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  CHTokenizedMathResult *mathResult;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (CHStrokeGroupRecognitionResult *)v4;
    v11 = v5;
    if (self)
    {
      if (self != v5)
      {
        recognitionResultsByLocale = self->_recognitionResultsByLocale;
        objc_msgSend_recognitionResultsByLocale(v5, v6, v7, v8, v9, v10);
        v18 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        if (recognitionResultsByLocale == v18)
        {

        }
        else
        {
          objc_msgSend_recognitionResultsByLocale(v11, v13, v14, v15, v16, v17);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          isEqual = objc_msgSend_isEqual_(v19, v20, (uint64_t)self->_recognitionResultsByLocale, v21, v22, v23);

          if (!isEqual)
            goto LABEL_22;
        }
        errorsByLocale = self->_errorsByLocale;
        objc_msgSend_errorsByLocale(v11, v25, v26, v27, v28, v29);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        if (errorsByLocale == v36)
        {

        }
        else
        {
          if (!self->_errorsByLocale)
          {
            LOBYTE(self) = 0;
            goto LABEL_27;
          }
          objc_msgSend_errorsByLocale(v11, v31, v32, v33, v34, v35);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = objc_msgSend_isEqual_(v37, v38, (uint64_t)self->_errorsByLocale, v39, v40, v41);

          if (!v42)
            goto LABEL_22;
        }
        languageFitnessByLocale = self->_languageFitnessByLocale;
        objc_msgSend_languageFitnessByLocale(v11, v43, v44, v45, v46, v47);
        v54 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        if (languageFitnessByLocale == v54)
        {

LABEL_20:
          inputStrokeIdentifiers = self->_inputStrokeIdentifiers;
          objc_msgSend_inputStrokeIdentifiers(v11, v61, v62, v63, v64, v65);
          v72 = (NSArray *)objc_claimAutoreleasedReturnValue();
          if (inputStrokeIdentifiers == v72)
          {

          }
          else
          {
            objc_msgSend_inputStrokeIdentifiers(v11, v67, v68, v69, v70, v71);
            v73 = (void *)objc_claimAutoreleasedReturnValue();
            v78 = objc_msgSend_isEqual_(v73, v74, (uint64_t)self->_inputStrokeIdentifiers, v75, v76, v77);

            if (!v78)
              goto LABEL_22;
          }
          mathResult = self->_mathResult;
          objc_msgSend_mathResult(v11, v79, v80, v81, v82, v83);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          if (mathResult == v36)
          {
            LOBYTE(self) = 1;
            v36 = mathResult;
          }
          else
          {
            objc_msgSend_mathResult(v11, v85, v86, v87, v88, v89);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(self) = objc_msgSend_isEqual_(v90, v91, (uint64_t)self->_mathResult, v92, v93, v94);

          }
LABEL_27:

          goto LABEL_28;
        }
        objc_msgSend_languageFitnessByLocale(v11, v49, v50, v51, v52, v53);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend_isEqual_(v55, v56, (uint64_t)self->_languageFitnessByLocale, v57, v58, v59);

        if (v60)
          goto LABEL_20;
LABEL_22:
        LOBYTE(self) = 0;
        goto LABEL_28;
      }
      LOBYTE(self) = 1;
    }
LABEL_28:

    goto LABEL_29;
  }
  LOBYTE(self) = 0;
LABEL_29:

  return (char)self;
}

- (NSArray)inputStrokeIdentifiers
{
  return self->_inputStrokeIdentifiers;
}

- (NSDictionary)recognitionResultsByLocale
{
  return self->_recognitionResultsByLocale;
}

- (NSDictionary)errorsByLocale
{
  return self->_errorsByLocale;
}

- (CHTokenizedMathResult)mathResult
{
  return self->_mathResult;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mathResult, 0);
  objc_storeStrong((id *)&self->_errorsByLocale, 0);
  objc_storeStrong((id *)&self->_recognitionResultsByLocale, 0);
  objc_storeStrong((id *)&self->_inputStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_orderedLocales, 0);
  objc_storeStrong((id *)&self->_languageFitnessByLocale, 0);
  objc_storeStrong((id *)&self->_inputDrawingCutPoints, 0);
  objc_storeStrong((id *)&self->_inputDrawing, 0);
}

- (CHStrokeGroupRecognitionResult)initWithOrderedLocales:(id)a3 resultsByLocale:(id)a4 errorsByLocale:(id)a5 languageFitnessByLocale:(id)a6 mathResult:(id)a7 inputStrokeIdentifiers:(id)a8 inputDrawing:(id)a9 inputDrawingCutPoints:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  CHStrokeGroupRecognitionResult *v28;
  uint64_t v29;
  NSArray *orderedLocales;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  NSDictionary *recognitionResultsByLocale;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSDictionary *languageFitnessByLocale;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSArray *inputStrokeIdentifiers;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  NSArray *inputDrawingCutPoints;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  NSDictionary *errorsByLocale;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  CHTokenizedMathResult *mathResult;
  id v74;
  objc_super v75;

  v74 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  v75.receiver = self;
  v75.super_class = (Class)CHStrokeGroupRecognitionResult;
  v28 = -[CHStrokeGroupRecognitionResult init](&v75, sel_init);
  if (v28)
  {
    v29 = objc_msgSend_copy(v74, v23, v24, v25, v26, v27);
    orderedLocales = v28->_orderedLocales;
    v28->_orderedLocales = (NSArray *)v29;

    v36 = objc_msgSend_copy(v16, v31, v32, v33, v34, v35);
    recognitionResultsByLocale = v28->_recognitionResultsByLocale;
    v28->_recognitionResultsByLocale = (NSDictionary *)v36;

    v43 = objc_msgSend_copy(v18, v38, v39, v40, v41, v42);
    languageFitnessByLocale = v28->_languageFitnessByLocale;
    v28->_languageFitnessByLocale = (NSDictionary *)v43;

    v50 = objc_msgSend_copy(v20, v45, v46, v47, v48, v49);
    inputStrokeIdentifiers = v28->_inputStrokeIdentifiers;
    v28->_inputStrokeIdentifiers = (NSArray *)v50;

    objc_storeStrong((id *)&v28->_inputDrawing, a9);
    v57 = objc_msgSend_copy(v22, v52, v53, v54, v55, v56);
    inputDrawingCutPoints = v28->_inputDrawingCutPoints;
    v28->_inputDrawingCutPoints = (NSArray *)v57;

    v64 = objc_msgSend_copy(v17, v59, v60, v61, v62, v63);
    errorsByLocale = v28->_errorsByLocale;
    v28->_errorsByLocale = (NSDictionary *)v64;

    v71 = objc_msgSend_copy(v19, v66, v67, v68, v69, v70);
    mathResult = v28->_mathResult;
    v28->_mathResult = (CHTokenizedMathResult *)v71;

  }
  return v28;
}

- (NSArray)orderedLocales
{
  return self->_orderedLocales;
}

- (CHDrawing)inputDrawing
{
  return self->_inputDrawing;
}

- (NSArray)inputDrawingCutPoints
{
  return self->_inputDrawingCutPoints;
}

- (NSDictionary)languageFitnessByLocale
{
  return self->_languageFitnessByLocale;
}

+ (id)sortedLanguageGroups:(id)a3 usingLanguageFitness:(id)a4
{
  id v5;
  id v6;
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
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  BOOL v35;
  id v36;
  id v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v42[4];
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  objc_msgSend_allKeys(v5, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v45, (uint64_t)v49, 16, v20);
  if (v25)
  {
    v26 = *(_QWORD *)v46;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v46 != v26)
          objc_enumerationMutation(v18);
        v28 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * i);
        objc_msgSend_objectForKeyedSubscript_(v5, v21, v28, v22, v23, v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend_count(v29, v30, v31, v32, v33, v34) == 0;

        if (!v35)
          objc_msgSend_addObject_(v12, v21, v28, v22, v23, v24);
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v45, (uint64_t)v49, 16, v24);
    }
    while (v25);
  }

  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1BE6C5BE4;
  v42[3] = &unk_1E77F34F0;
  v36 = v6;
  v43 = v36;
  v37 = v5;
  v44 = v37;
  objc_msgSend_sortWithOptions_usingComparator_(v12, v38, 16, (uint64_t)v42, v39, v40);

  return v12;
}

+ (id)sortedLocales:(id)a3 usingLanguageFitness:(id)a4 useCombinedScore:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  const char *v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v48;
  void *v49;
  _QWORD v50[4];
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _QWORD v56[4];
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v5 = a5;
  v59 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = sub_1BE6C6088;
  v56[3] = &unk_1E77F3518;
  v8 = v7;
  v57 = v8;
  objc_msgSend_sortedArrayWithOptions_usingComparator_(a3, v9, 16, (uint64_t)v56, v10, v11);
  v12 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v48 = (void *)v12;
    objc_msgSend_localesByLanguageGroup_(CHRecognizerConfiguration, v13, v12, v14, v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_opt_class();
    objc_msgSend_sortedLanguageGroups_usingLanguageFitness_(v18, v19, (uint64_t)v17, (uint64_t)v8, v20, v21);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    v28 = v49;
    v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v52, (uint64_t)v58, 16, v30);
    if (v35)
    {
      v36 = *(_QWORD *)v53;
      do
      {
        for (i = 0; i != v35; ++i)
        {
          if (*(_QWORD *)v53 != v36)
            objc_enumerationMutation(v28);
          objc_msgSend_objectForKeyedSubscript_(v17, v31, *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * i), v32, v33, v34);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v50[0] = MEMORY[0x1E0C809B0];
          v50[1] = 3221225472;
          v50[2] = sub_1BE6C618C;
          v50[3] = &unk_1E77F3518;
          v51 = v8;
          objc_msgSend_sortedArrayWithOptions_usingComparator_(v38, v39, 16, (uint64_t)v50, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_addObjectsFromArray_(v27, v43, (uint64_t)v42, v44, v45, v46);
        }
        v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v52, (uint64_t)v58, 16, v34);
      }
      while (v35);
    }

  }
  else
  {
    v27 = (void *)v12;
  }

  return v27;
}

+ (id)filteredResultsByLocale:(id)a3 orderedLocales:(id)a4 usingLanguageFitness:(id)a5 outSortedLocales:(id *)a6
{
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
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
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t i;
  uint64_t v69;
  void *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  __CFString *v76;
  uint64_t v77;
  uint64_t v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  _BOOL4 v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  const char *v115;
  uint64_t v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  double v122;
  uint64_t v123;
  double v124;
  uint64_t j;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  double v143;
  const char *v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  double v165;
  uint64_t m;
  double v167;
  void *v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  NSObject *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  id v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  id v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  id v196;
  const char *v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  double v205;
  uint64_t v206;
  void *v207;
  void *v208;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  void *v220;
  NSObject *v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  id v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v239;
  void *v241;
  void *v242;
  id v243;
  id v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t k;
  void *v248;
  id obj;
  void *v250;
  id v251;
  id v252;
  void *v253;
  id v254;
  id v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  _QWORD v260[4];
  id v261;
  double v262;
  double v263;
  __int128 v264;
  __int128 v265;
  __int128 v266;
  __int128 v267;
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
  _QWORD v280[4];
  id v281;
  _BYTE v282[128];
  _BYTE buf[12];
  __int16 v284;
  double v285;
  __int16 v286;
  double v287;
  __int16 v288;
  uint64_t v289;
  _BYTE v290[128];
  _BYTE v291[128];
  _BYTE v292[128];
  _BYTE v293[128];
  uint64_t v294;

  v294 = *MEMORY[0x1E0C80C00];
  v254 = a3;
  v243 = a4;
  v255 = a5;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v9, v10, v11, v12, v13);
  v251 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v14, v15, v16, v17, v18);
  v252 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v254, v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedLocales_usingLanguageFitness_useCombinedScore_(a1, v25, (uint64_t)v24, (uint64_t)v255, 0, v26);
  v27 = objc_claimAutoreleasedReturnValue();

  v239 = (void *)v27;
  objc_msgSend_localesByLanguageGroup_(CHRecognizerConfiguration, v28, v27, v29, v30, v31);
  v250 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_modelNameLatin(CHRecognizerConfiguration, v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v250, v38, (uint64_t)v37, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend_count(v42, v43, v44, v45, v46, v47);

  objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v49, (uint64_t)&unk_1E7827CE0, v50, v51, v52);
  v242 = (void *)objc_claimAutoreleasedReturnValue();
  if (v48)
  {
    v280[0] = MEMORY[0x1E0C809B0];
    v280[1] = 3221225472;
    v280[2] = sub_1BE6C7068;
    v280[3] = &unk_1E77F3568;
    v281 = v242;
    v53 = (void *)MEMORY[0x1C3B81A84](v280);
    v278 = 0u;
    v279 = 0u;
    v276 = 0u;
    v277 = 0u;
    objc_msgSend_allNonLatinModelNames(CHRecognizerConfiguration, v54, v55, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v276, (uint64_t)v293, 16, v61);
    if (v66)
    {
      v67 = *(_QWORD *)v277;
      do
      {
        for (i = 0; i != v66; ++i)
        {
          if (*(_QWORD *)v277 != v67)
            objc_enumerationMutation(v59);
          v69 = *(_QWORD *)(*((_QWORD *)&v276 + 1) + 8 * i);
          objc_msgSend_objectForKeyedSubscript_(v250, v62, v69, v63, v64, v65);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1BE6C70D4((uint64_t)CHStrokeGroupRecognitionResult, v70, v254, v53);
          v71 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_setObject_forKeyedSubscript_(v250, v72, (uint64_t)v71, v69, v73, v74);
        }
        v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v62, (uint64_t)&v276, (uint64_t)v293, 16, v65);
      }
      while (v66);
    }

  }
  v75 = sub_1BE6C62C0((uint64_t)CHStrokeGroupRecognitionResult, CFSTR("zh"), v243);
  if (v75 >= sub_1BE6C62C0((uint64_t)CHStrokeGroupRecognitionResult, CFSTR("yue"), v243))
    v76 = CFSTR("yue");
  else
    v76 = CFSTR("zh");
  v77 = sub_1BE6C62C0((uint64_t)CHStrokeGroupRecognitionResult, v76, v243);
  v78 = sub_1BE6C62C0((uint64_t)CHStrokeGroupRecognitionResult, CFSTR("ja"), v243);
  if (v77 != 0x7FFFFFFFFFFFFFFFLL && v78 != 0x7FFFFFFFFFFFFFFFLL && v77 < v78)
  {
    objc_msgSend_modelNameJapanese(CHRecognizerConfiguration, v79, v80, v81, v82, v83);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKeyedSubscript_(v250, v85, (uint64_t)v84, v86, v87, v88);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    sub_1BE6C70D4((uint64_t)CHStrokeGroupRecognitionResult, v89, v254, &unk_1E77F35A8);
    v90 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_modelNameJapanese(CHRecognizerConfiguration, v91, v92, v93, v94, v95);
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKeyedSubscript_(v250, v97, (uint64_t)v90, (uint64_t)v96, v98, v99);

  }
  v100 = (void *)objc_opt_class();
  objc_msgSend_sortedLanguageGroups_usingLanguageFitness_(v100, v101, (uint64_t)v250, (uint64_t)v255, v102, v103);
  v241 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = (unint64_t)objc_msgSend_count(v254, v104, v105, v106, v107, v108) > 1;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v110, v111, v112, v113, v114);
  v248 = (void *)objc_claimAutoreleasedReturnValue();
  v274 = 0u;
  v275 = 0u;
  v272 = 0u;
  v273 = 0u;
  obj = v241;
  v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v115, (uint64_t)&v272, (uint64_t)v292, 16, v116);
  v122 = dbl_1BE8D5E70[v109];
  if (v121)
  {
    v123 = *(_QWORD *)v273;
    v124 = 0.0;
    do
    {
      for (j = 0; j != v121; ++j)
      {
        if (*(_QWORD *)v273 != v123)
          objc_enumerationMutation(obj);
        v126 = *(_QWORD *)(*((_QWORD *)&v272 + 1) + 8 * j);
        objc_msgSend_objectForKeyedSubscript_(v250, v117, v126, v118, v119, v120);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v127, v128, v129, v130, v131, v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v255, v134, (uint64_t)v133, v135, v136, v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_getValue_(v138, v139, (uint64_t)buf, v140, v141, v142);

        v143 = *(double *)buf;
        if (*(double *)buf >= v122 && v124 <= 0.9)
        {
          v143 = v124 - *(double *)buf;
          if (v124 - *(double *)buf <= 0.01)
          {
            objc_msgSend_addObject_(v248, v117, v126, v118, v119, v120, v143);
            v143 = *(double *)buf;
            if (*(double *)buf > v124)
              v124 = *(double *)buf;
          }
        }
      }
      v121 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v117, (uint64_t)&v272, (uint64_t)v292, 16, v120, v143);
    }
    while (v121);
  }

  v270 = 0u;
  v271 = 0u;
  v268 = 0u;
  v269 = 0u;
  v244 = v248;
  v246 = objc_msgSend_countByEnumeratingWithState_objects_count_(v244, v144, (uint64_t)&v268, (uint64_t)v291, 16, v145);
  if (v246)
  {
    v245 = *(_QWORD *)v269;
    do
    {
      for (k = 0; k != v246; ++k)
      {
        if (*(_QWORD *)v269 != v245)
          objc_enumerationMutation(v244);
        v151 = *(_QWORD *)(*((_QWORD *)&v268 + 1) + 8 * k);
        objc_msgSend_array(MEMORY[0x1E0C99DE8], v146, v147, v148, v149, v150);
        v253 = (void *)objc_claimAutoreleasedReturnValue();
        v266 = 0u;
        v267 = 0u;
        v264 = 0u;
        v265 = 0u;
        objc_msgSend_objectForKeyedSubscript_(v250, v152, v151, v153, v154, v155);
        v156 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v156, v157, (uint64_t)&v264, (uint64_t)v290, 16, v158);
        if (v163)
        {
          v164 = *(_QWORD *)v265;
          v165 = 0.0;
          do
          {
            for (m = 0; m != v163; ++m)
            {
              if (*(_QWORD *)v265 != v164)
                objc_enumerationMutation(v156);
              v168 = *(void **)(*((_QWORD *)&v264 + 1) + 8 * m);
              objc_msgSend_objectForKeyedSubscript_(v255, v159, (uint64_t)v168, v160, v161, v162);
              v169 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_getValue_(v169, v170, (uint64_t)&v262, v171, v172, v173);

              if (v262 < v122 || v165 - v262 > 0.1)
              {
                if (qword_1EF568E88 != -1)
                  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                v178 = (id)qword_1EF568E28;
                if (os_log_type_enabled(v178, OS_LOG_TYPE_DEBUG))
                {
                  objc_msgSend_localeIdentifier(v168, v179, v180, v181, v182, v183);
                  v184 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v190 = objc_msgSend_UTF8String(v184, v185, v186, v187, v188, v189);
                  *(_DWORD *)buf = 136315906;
                  *(_QWORD *)&buf[4] = v190;
                  v284 = 2048;
                  v285 = v262;
                  v286 = 2048;
                  v287 = v165;
                  v288 = 2048;
                  v289 = *(_QWORD *)&v122;
                  _os_log_impl(&dword_1BE607000, v178, OS_LOG_TYPE_DEBUG, "Filtering results for locale %s based on raw fitness score %.3f. (best score: %.3f, threshold: %.3f)\n", buf, 0x2Au);

                }
              }
              else
              {
                objc_msgSend_addObject_(v253, v174, (uint64_t)v168, v175, v176, v177, v165 - v262);
                v167 = v262;
                if (v262 > v165)
                  v165 = v262;
              }
            }
            v163 = objc_msgSend_countByEnumeratingWithState_objects_count_(v156, v159, (uint64_t)&v264, (uint64_t)v290, 16, v162, v167);
          }
          while (v163);
        }

        v260[0] = MEMORY[0x1E0C809B0];
        v260[1] = 3221225472;
        v260[2] = sub_1BE6C73C4;
        v260[3] = &unk_1E77F3518;
        v191 = v255;
        v261 = v191;
        objc_msgSend_sortUsingComparator_(v253, v192, (uint64_t)v260, v193, v194, v195);
        v258 = 0u;
        v259 = 0u;
        v256 = 0u;
        v257 = 0u;
        v196 = v253;
        v203 = objc_msgSend_countByEnumeratingWithState_objects_count_(v196, v197, (uint64_t)&v256, (uint64_t)v282, 16, v198);
        if (v203)
        {
          v204 = *(_QWORD *)v257;
          v205 = 0.0;
          do
          {
            v206 = 0;
            do
            {
              if (*(_QWORD *)v257 != v204)
                objc_enumerationMutation(v196);
              v207 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * v206);
              objc_msgSend_objectForKeyedSubscript_(v191, v199, (uint64_t)v207, v200, v201, v202);
              v208 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_getValue_(v208, v209, (uint64_t)&v262, v210, v211, v212);

              objc_msgSend_objectForKey_(v254, v213, (uint64_t)v207, v214, v215, v216);
              v220 = (void *)objc_claimAutoreleasedReturnValue();
              if (v220)
              {
                if (v205 - v263 <= 0.01)
                {
                  objc_msgSend_setObject_forKey_(v251, v217, (uint64_t)v220, (uint64_t)v207, v218, v219, v205 - v263);
                  objc_msgSend_addObject_(v252, v234, (uint64_t)v207, v235, v236, v237);
                  if (v263 > v205)
                    v205 = v263;
                }
                else
                {
                  if (qword_1EF568E88 != -1)
                    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
                  v221 = (id)qword_1EF568E28;
                  if (os_log_type_enabled(v221, OS_LOG_TYPE_DEBUG))
                  {
                    objc_msgSend_localeIdentifier(v207, v222, v223, v224, v225, v226);
                    v227 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    v233 = objc_msgSend_UTF8String(v227, v228, v229, v230, v231, v232);
                    *(_DWORD *)buf = 136315906;
                    *(_QWORD *)&buf[4] = v233;
                    v284 = 2048;
                    v285 = v263;
                    v286 = 2048;
                    v287 = v205;
                    v288 = 2048;
                    v289 = 0x3F847AE147AE147BLL;
                    _os_log_impl(&dword_1BE607000, v221, OS_LOG_TYPE_DEBUG, "Filtering results for locale %s based on combined fitness score %.3f. (best score: %.3f, gap threshold: %.3f)\n", buf, 0x2Au);

                  }
                }
              }

              ++v206;
            }
            while (v203 != v206);
            v203 = objc_msgSend_countByEnumeratingWithState_objects_count_(v196, v199, (uint64_t)&v256, (uint64_t)v282, 16, v202);
          }
          while (v203);
        }

      }
      v246 = objc_msgSend_countByEnumeratingWithState_objects_count_(v244, v146, (uint64_t)&v268, (uint64_t)v291, 16, v150);
    }
    while (v246);
  }

  if (a6)
    *a6 = objc_retainAutorelease(v252);

  return v251;
}

- (BOOL)hasPrincipalLines
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  const char *v8;
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
  uint64_t v21;
  uint64_t v22;
  char hasValidPrincipalLinesForPath;

  objc_msgSend_preferredLocale(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(self->_recognitionResultsByLocale, v8, (uint64_t)v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topModelTranscriptionPath(v12, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  hasValidPrincipalLinesForPath = objc_msgSend_hasValidPrincipalLinesForPath_(v12, v19, (uint64_t)v18, v20, v21, v22);

  return hasValidPrincipalLinesForPath;
}

- (id)textStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
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
  void *v23;
  void *v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
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
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  void *v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  const char *v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  const char *v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  void *v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  void *v204;
  const char *v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  void *v216;
  const char *v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  NSObject *v225;
  void *v226;
  const char *v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  const char *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t i;
  uint64_t v261;
  void *v262;
  const char *v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  void *v272;
  const char *v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  uint64_t v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  void *v284;
  const char *v285;
  uint64_t v286;
  uint64_t v287;
  const char *v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  void *v294;
  const char *v295;
  uint64_t v296;
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
  char isEqualToArray;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t k;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  void *v340;
  const char *v341;
  uint64_t v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  void *v346;
  const char *v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  void *v351;
  const char *v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  void *v356;
  const char *v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  const char *v365;
  uint64_t v366;
  uint64_t v367;
  void *v368;
  const char *v369;
  uint64_t v370;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  const char *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  void *v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  void *v388;
  const char *v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  const char *v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  const char *v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  void *v406;
  uint64_t v407;
  const char *v408;
  uint64_t v409;
  const char *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t j;
  uint64_t v418;
  void *v419;
  const char *v420;
  uint64_t v421;
  uint64_t v422;
  uint64_t v423;
  void *v424;
  const char *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  void *v429;
  const char *v430;
  uint64_t v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  const char *v435;
  uint64_t v436;
  uint64_t v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  void *v441;
  const char *v442;
  uint64_t v443;
  uint64_t v444;
  const char *v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  void *v450;
  const char *v451;
  uint64_t v452;
  uint64_t v453;
  uint64_t v454;
  uint64_t v455;
  void *v456;
  const char *v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  void *v461;
  CHStrokeGroupRecognitionResult *v462;
  const char *v463;
  void *v464;
  id obj;
  id obja;
  id v469;
  void *v470;
  void *v471;
  __int128 v472;
  __int128 v473;
  __int128 v474;
  __int128 v475;
  __int128 v476;
  __int128 v477;
  __int128 v478;
  __int128 v479;
  __int128 v480;
  __int128 v481;
  __int128 v482;
  __int128 v483;
  uint8_t buf[8];
  uint64_t v485;
  _BYTE v486[128];
  _BYTE v487[128];
  _BYTE v488[128];
  uint64_t v489;

  v489 = *MEMORY[0x1E0C80C00];
  v469 = a3;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v3, v4, v5, v6, v7);
  v471 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v8, v9, v10, v11, v12);
  v470 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_mathResult(self, v13, v14, v15, v16, v17);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23)
  {
    objc_msgSend_mathResult(v469, v18, v19, v20, v21, v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend_preferredLocale(self, v18, v19, v20, v21, v22);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      if (v25)
      {
        objc_msgSend_recognitionResultsByLocale(self, v26, v27, v28, v29, v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_preferredLocale(self, v32, v33, v34, v35, v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v31, v38, (uint64_t)v37, v39, v40, v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend_mathResult(self, v26, v27, v28, v29, v30);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedLocales(self, v92, v93, v94, v95, v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v97, v98, v99, v100, v101, v102);
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v104, (uint64_t)v91, (uint64_t)v103, v105, v106);
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_inputStrokeIdentifiers(self, v107, v108, v109, v110, v111);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInputStrokeIdentifiers_(v42, v112, (uint64_t)v31, v113, v114, v115);
      }

      objc_msgSend_preferredLocale(v469, v116, v117, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();

      if (v121)
      {
        objc_msgSend_recognitionResultsByLocale(v469, v122, v123, v124, v125, v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_preferredLocale(v469, v128, v129, v130, v131, v132);
        v133 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v127, v134, (uint64_t)v133, v135, v136, v137);
        v138 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend_mathResult(v469, v122, v123, v124, v125, v126);
        v139 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orderedLocales(self, v140, v141, v142, v143, v144);
        v145 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v145, v146, v147, v148, v149, v150);
        v151 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v152, (uint64_t)v139, (uint64_t)v151, v153, v154);
        v138 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_inputStrokeIdentifiers(v469, v155, v156, v157, v158, v159);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setInputStrokeIdentifiers_(v138, v160, (uint64_t)v127, v161, v162, v163);
      }

      objc_msgSend_tokenizedTextResultByAppendingTokenizedTextResult_(v42, v164, (uint64_t)v138, v165, v166, v167);
      v168 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_orderedLocales(self, v169, v170, v171, v172, v173);
      v174 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v174, v175, v176, v177, v178, v179);
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_languageFitnessForLocale_recognitionMode_(v168, v181, (uint64_t)v180, 6, v182, v183);
      *(_QWORD *)buf = v184;
      v485 = v185;

      objc_msgSend_orderedLocales(self, v186, v187, v188, v189, v190);
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v191, v192, v193, v194, v195, v196);
      v197 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v471, v198, (uint64_t)v168, (uint64_t)v197, v199, v200);

      objc_msgSend_value_withObjCType_(MEMORY[0x1E0CB3B18], v201, (uint64_t)buf, (uint64_t)"{?=dd}", v202, v203);
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_orderedLocales(self, v205, v206, v207, v208, v209);
      v210 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v210, v211, v212, v213, v214, v215);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(v470, v217, (uint64_t)v204, (uint64_t)v216, v218, v219);

      objc_msgSend_orderedLocales(self, v220, v221, v222, v223, v224);
      v225 = objc_claimAutoreleasedReturnValue();

      goto LABEL_44;
    }
  }
  objc_msgSend_mathResult(self, v18, v19, v20, v21, v22);
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  if (v43)
  {
    objc_msgSend_preferredLocale(self, v44, v45, v46, v47, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    if (v49)
    {
      objc_msgSend_recognitionResultsByLocale(self, v50, v51, v52, v53, v54);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_preferredLocale(self, v56, v57, v58, v59, v60);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v55, v62, (uint64_t)v61, v63, v64, v65);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_mathResult(self, v50, v51, v52, v53, v54);
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_preferredLocale(v469, v227, v228, v229, v230, v231);
      v232 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v233, (uint64_t)v226, (uint64_t)v232, v234, v235);
      v66 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_inputStrokeIdentifiers(self, v236, v237, v238, v239, v240);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInputStrokeIdentifiers_(v66, v241, (uint64_t)v55, v242, v243, v244);
    }

    v482 = 0u;
    v483 = 0u;
    v480 = 0u;
    v481 = 0u;
    objc_msgSend_recognitionResultsByLocale(v469, v245, v246, v247, v248, v249);
    v250 = v66;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v258 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v251, (uint64_t)&v480, (uint64_t)v488, 16, v252);
    if (v258)
    {
      v259 = *(_QWORD *)v481;
      do
      {
        for (i = 0; i != v258; ++i)
        {
          if (*(_QWORD *)v481 != v259)
            objc_enumerationMutation(obj);
          v261 = *(_QWORD *)(*((_QWORD *)&v480 + 1) + 8 * i);
          objc_msgSend_recognitionResultsByLocale(v469, v253, v254, v255, v256, v257);
          v262 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v262, v263, v261, v264, v265, v266);
          v267 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_tokenizedTextResultByAppendingTokenizedTextResult_(v250, v268, (uint64_t)v267, v269, v270, v271);
          v272 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          v485 = 0;
          objc_msgSend_languageFitnessForLocale_recognitionMode_(v272, v273, v261, 6, v274, v275);
          *(_QWORD *)buf = v276;
          v485 = v277;
          objc_msgSend_setObject_forKeyedSubscript_(v471, v278, (uint64_t)v272, v261, v279, v280);
          objc_msgSend_value_withObjCType_(MEMORY[0x1E0CB3B18], v281, (uint64_t)buf, (uint64_t)"{?=dd}", v282, v283);
          v284 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v470, v285, (uint64_t)v284, v261, v286, v287);

        }
        v258 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v253, (uint64_t)&v480, (uint64_t)v488, 16, v257);
      }
      while (v258);
    }

    v42 = v250;
    objc_msgSend_orderedLocales(v469, v288, v289, v290, v291, v292);
    v293 = objc_claimAutoreleasedReturnValue();
LABEL_43:
    v225 = v293;
LABEL_44:

LABEL_45:
    objc_msgSend_inputStrokeIdentifiers(self, v377, v378, v379, v380, v381);
    v450 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputStrokeIdentifiers(v469, v451, v452, v453, v454, v455);
    v456 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObjectsFromArray_(v450, v457, (uint64_t)v456, v458, v459, v460);
    v461 = (void *)objc_claimAutoreleasedReturnValue();

    v462 = [CHStrokeGroupRecognitionResult alloc];
    v464 = (void *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_(v462, v463, (uint64_t)v225, (uint64_t)v471, MEMORY[0x1E0C9AA70], (uint64_t)v470, 0, v461);

    goto LABEL_46;
  }
  objc_msgSend_mathResult(v469, v44, v45, v46, v47, v48);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  if (v67)
  {
    objc_msgSend_preferredLocale(v469, v68, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();

    if (v73)
    {
      objc_msgSend_recognitionResultsByLocale(v469, v74, v75, v76, v77, v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_preferredLocale(v469, v80, v81, v82, v83, v84);
      v85 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v79, v86, (uint64_t)v85, v87, v88, v89);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      objc_msgSend_mathResult(v469, v74, v75, v76, v77, v78);
      v382 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_preferredLocale(self, v383, v384, v385, v386, v387);
      v388 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v389, (uint64_t)v382, (uint64_t)v388, v390, v391);
      v90 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_inputStrokeIdentifiers(v469, v392, v393, v394, v395, v396);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInputStrokeIdentifiers_(v90, v397, (uint64_t)v79, v398, v399, v400);
    }

    v478 = 0u;
    v479 = 0u;
    v476 = 0u;
    v477 = 0u;
    objc_msgSend_recognitionResultsByLocale(self, v401, v402, v403, v404, v405);
    v406 = (void *)objc_claimAutoreleasedReturnValue();
    v407 = (uint64_t)v90;
    obja = v406;
    v415 = objc_msgSend_countByEnumeratingWithState_objects_count_(v406, v408, (uint64_t)&v476, (uint64_t)v487, 16, v409);
    if (v415)
    {
      v416 = *(_QWORD *)v477;
      do
      {
        for (j = 0; j != v415; ++j)
        {
          if (*(_QWORD *)v477 != v416)
            objc_enumerationMutation(obja);
          v418 = *(_QWORD *)(*((_QWORD *)&v476 + 1) + 8 * j);
          objc_msgSend_recognitionResultsByLocale(self, v410, v411, v412, v413, v414);
          v419 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v419, v420, v418, v421, v422, v423);
          v424 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_tokenizedTextResultByAppendingTokenizedTextResult_(v424, v425, v407, v426, v427, v428);
          v429 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          v485 = 0;
          objc_msgSend_languageFitnessForLocale_recognitionMode_(v429, v430, v418, 6, v431, v432);
          *(_QWORD *)buf = v433;
          v485 = v434;
          objc_msgSend_setObject_forKeyedSubscript_(v471, v435, (uint64_t)v429, v418, v436, v437);
          objc_msgSend_value_withObjCType_(MEMORY[0x1E0CB3B18], v438, (uint64_t)buf, (uint64_t)"{?=dd}", v439, v440);
          v441 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v470, v442, (uint64_t)v441, v418, v443, v444);

        }
        v406 = obja;
        v415 = objc_msgSend_countByEnumeratingWithState_objects_count_(obja, v410, (uint64_t)&v476, (uint64_t)v487, 16, v414);
      }
      while (v415);
    }

    v42 = (void *)v407;
    objc_msgSend_orderedLocales(self, v445, v446, v447, v448, v449);
    v293 = objc_claimAutoreleasedReturnValue();
    goto LABEL_43;
  }
  objc_msgSend_recognitionResultsByLocale(self, v68, v69, v70, v71, v72);
  v294 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v294, v295, v296, v297, v298, v299);
  v300 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recognitionResultsByLocale(v469, v301, v302, v303, v304, v305);
  v306 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allKeys(v306, v307, v308, v309, v310, v311);
  v312 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToArray = objc_msgSend_isEqualToArray_(v300, v313, (uint64_t)v312, v314, v315, v316);

  if ((isEqualToArray & 1) != 0)
  {
    v474 = 0u;
    v475 = 0u;
    v472 = 0u;
    v473 = 0u;
    objc_msgSend_recognitionResultsByLocale(self, v318, v319, v320, v321, v322);
    v323 = (void *)objc_claimAutoreleasedReturnValue();
    v331 = objc_msgSend_countByEnumeratingWithState_objects_count_(v323, v324, (uint64_t)&v472, (uint64_t)v486, 16, v325);
    if (v331)
    {
      v332 = *(_QWORD *)v473;
      do
      {
        for (k = 0; k != v331; ++k)
        {
          if (*(_QWORD *)v473 != v332)
            objc_enumerationMutation(v323);
          v334 = *(_QWORD *)(*((_QWORD *)&v472 + 1) + 8 * k);
          objc_msgSend_recognitionResultsByLocale(self, v326, v327, v328, v329, v330);
          v335 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v335, v336, v334, v337, v338, v339);
          v340 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_recognitionResultsByLocale(v469, v341, v342, v343, v344, v345);
          v346 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v346, v347, v334, v348, v349, v350);
          v351 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_tokenizedTextResultByAppendingTokenizedTextResult_(v340, v352, (uint64_t)v351, v353, v354, v355);
          v356 = (void *)objc_claimAutoreleasedReturnValue();
          *(_QWORD *)buf = 0;
          v485 = 0;
          objc_msgSend_languageFitnessForLocale_recognitionMode_(v356, v357, v334, 6, v358, v359);
          *(_QWORD *)buf = v360;
          v485 = v361;
          objc_msgSend_setObject_forKeyedSubscript_(v471, v362, (uint64_t)v356, v334, v363, v364);
          objc_msgSend_value_withObjCType_(MEMORY[0x1E0CB3B18], v365, (uint64_t)buf, (uint64_t)"{?=dd}", v366, v367);
          v368 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v470, v369, (uint64_t)v368, v334, v370, v371);

        }
        v331 = objc_msgSend_countByEnumeratingWithState_objects_count_(v323, v326, (uint64_t)&v472, (uint64_t)v486, 16, v330);
      }
      while (v331);
    }

    objc_msgSend_orderedLocales(self, v372, v373, v374, v375, v376);
    v225 = objc_claimAutoreleasedReturnValue();
    goto LABEL_45;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v225 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v225, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v225, OS_LOG_TYPE_ERROR, "Can't append recognitionResults of CHStrokeGroupRecognitionResult with different locales.", buf, 2u);
  }
  v464 = 0;
LABEL_46:

  return v464;
}

- (id)mathStrokeGroupRecognitionResultByAppendingStrokeGroupRecognitionResult:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  void *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  CHStrokeGroupRecognitionResult *v79;
  const char *v80;
  uint8_t v82[16];

  v4 = a3;
  objc_msgSend_mathResult(self, v5, v6, v7, v8, v9);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    && (objc_msgSend_mathResult(v4, v10, v11, v12, v13, v14),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v16,
        v15,
        v16))
  {
    objc_msgSend_mathResult(self, v17, v18, v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_mathResult(v4, v23, v24, v25, v26, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topTranscription(v22, v29, v30, v31, v32, v33);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_length(v34, v35, v36, v37, v38, v39);

    v46 = v28;
    if (v40
      && (objc_msgSend_topTranscription(v28, v41, v42, v43, v44, v45),
          v47 = (void *)objc_claimAutoreleasedReturnValue(),
          v53 = objc_msgSend_length(v47, v48, v49, v50, v51, v52),
          v47,
          v46 = v22,
          v53))
    {
      objc_msgSend_tokenizedMathResultByAppendingTokenizedMathResult_(v22, v54, (uint64_t)v28, v55, v56, v57);
      v58 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v58 = v46;
    }
    v66 = v58;
    objc_msgSend_inputStrokeIdentifiers(self, v59, v60, v61, v62, v63);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputStrokeIdentifiers(v4, v68, v69, v70, v71, v72);
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_arrayByAddingObjectsFromArray_(v67, v74, (uint64_t)v73, v75, v76, v77);
    v78 = (void *)objc_claimAutoreleasedReturnValue();

    v79 = [CHStrokeGroupRecognitionResult alloc];
    v65 = (void *)objc_msgSend_initWithOrderedLocales_resultsByLocale_errorsByLocale_languageFitnessByLocale_mathResult_inputStrokeIdentifiers_(v79, v80, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], MEMORY[0x1E0C9AA70], v66, v78);

  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v64 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v64, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v82 = 0;
      _os_log_impl(&dword_1BE607000, v64, OS_LOG_TYPE_ERROR, "Can't append two text CHStrokeGroupRecognitionResult with into math StrokeGroupRecognitionResult.", v82, 2u);
    }

    v65 = 0;
  }

  return v65;
}

@end
