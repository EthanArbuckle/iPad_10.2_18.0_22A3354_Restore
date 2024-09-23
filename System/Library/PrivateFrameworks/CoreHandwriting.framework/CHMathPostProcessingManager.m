@implementation CHMathPostProcessingManager

- (CHMathPostProcessingManager)init
{
  CHMathPostProcessingManager *v2;
  NSArray *v3;
  NSArray *sequence;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CHMathPostProcessingManager;
  v2 = -[CHMathPostProcessingManager init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    sequence = v2->_sequence;
    v2->_sequence = v3;

  }
  return v2;
}

- (CHMathPostProcessingManager)initWithStep:(id)a3
{
  id v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CHMathPostProcessingManager *v15;

  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99D20]);
  v10 = (void *)objc_msgSend_initWithObjects_(v5, v6, (uint64_t)v4, v7, v8, v9, 0);
  v15 = (CHMathPostProcessingManager *)objc_msgSend_initWithSequence_(self, v11, (uint64_t)v10, v12, v13, v14);

  return v15;
}

- (CHMathPostProcessingManager)initWithSequence:(id)a3
{
  id v5;
  CHMathPostProcessingManager *v6;
  CHMathPostProcessingManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHMathPostProcessingManager;
  v6 = -[CHMathPostProcessingManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_sequence, a3);

  return v7;
}

- (id)process:(id)a3 options:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t i;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
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
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = a3;
  v12 = a4;
  for (i = 0; ; ++i)
  {
    objc_msgSend_sequence(self, v7, v8, v9, v10, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend_count(v14, v15, v16, v17, v18, v19);

    if (i >= v20)
      break;
    objc_msgSend_sequence(self, v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndex_(v26, v27, i, v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_process_options_(v31, v32, (uint64_t)v6, (uint64_t)v12, v33, v34);
    v35 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v35;
  }

  return v6;
}

+ (id)tokenizedTextResultFromTokenizedMathResult:(id)a3 locale:(id)a4
{
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
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  __int128 v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  id v67;
  id v68;
  const char *v69;
  double *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  CHTokenizedTextResultToken *v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  double v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  id v120;
  id v121;
  const char *v122;
  uint64_t v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t k;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  NSObject *v141;
  const char *v142;
  uint64_t v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t j;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  CHTokenizedTextResult *v170;
  const char *v171;
  void *v172;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  id v181;
  unint64_t i;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _QWORD v191[4];
  id v192;
  id v193;
  id v194;
  id v195;
  uint64_t *v196;
  uint64_t *v197;
  uint64_t *v198;
  uint64_t *v199;
  uint64_t *v200;
  uint64_t *v201;
  uint64_t *v202;
  uint64_t v203;
  uint64_t *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  double *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  double *v220;
  uint64_t v221;
  __n128 (*v222)(uint64_t, uint64_t);
  uint64_t (*v223)();
  void *v224;
  __int128 v225;
  __int128 v226;
  uint64_t v227;
  uint64_t *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  double *v232;
  uint64_t v233;
  uint64_t v234;
  uint8_t buf[4];
  unint64_t v236;
  _BYTE v237[128];
  _BYTE v238[128];
  uint64_t v239;

  v239 = *MEMORY[0x1E0C80C00];
  v181 = a3;
  v176 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v5, v6, v7, v8, v9);
  v175 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13, v14);
  v174 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v15, v16, v17, v18, v19);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; ; ++i)
  {
    objc_msgSend_transcriptionPaths(v181, v20, v21, v22, v23, v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = i < objc_msgSend_count(v26, v27, v28, v29, v30, v31);

    if (!v32)
      break;
    objc_msgSend_transcriptionPaths(v181, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v38, v39, i, v40, v41, v42);
    v180 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_array(MEMORY[0x1E0C99DE8], v43, v44, v45, v46, v47);
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    v231 = 0;
    v232 = (double *)&v231;
    v233 = 0x2020000000;
    v234 = 0;
    v227 = 0;
    v228 = &v227;
    v229 = 0x2020000000;
    v230 = 0;
    objc_msgSend_string(MEMORY[0x1E0CB37A0], v48, v49, v50, v51, v52);
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v53, v54, v55, v56, v57);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v219 = 0;
    v220 = (double *)&v219;
    v221 = 0x5012000000;
    v222 = sub_1BE60E29C;
    v223 = nullsub_1;
    v224 = &unk_1BE94989A;
    v58 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
    v225 = *MEMORY[0x1E0C9D648];
    v226 = v58;
    v215 = 0;
    v216 = (double *)&v215;
    v217 = 0x2020000000;
    v218 = 0;
    v211 = 0;
    v212 = &v211;
    v213 = 0x2020000000;
    v214 = 0;
    v207 = 0;
    v208 = &v207;
    v209 = 0x2020000000;
    v210 = 8;
    v203 = 0;
    v204 = &v203;
    v205 = 0x2020000000;
    v206 = 4;
    v64 = objc_msgSend_tokenColumnCount(v181, v59, v60, v61, v62, v63);
    v191[0] = MEMORY[0x1E0C809B0];
    v191[1] = 3221225472;
    v191[2] = sub_1BE60E2AC;
    v191[3] = &unk_1E77F1EA0;
    v196 = &v231;
    v197 = &v227;
    v198 = &v211;
    v65 = v179;
    v192 = v65;
    v66 = v178;
    v193 = v66;
    v199 = &v215;
    v200 = &v207;
    v67 = v176;
    v194 = v67;
    v201 = &v203;
    v202 = &v219;
    v68 = v177;
    v195 = v68;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v181, v69, (uint64_t)v180, 0, v64, (uint64_t)v191);
    v70 = v232;
    v70[3] = exp(v232[3] / (double)v228[3]);
    if (objc_msgSend_length(v66, v71, v72, v73, v74, v75))
    {
      v81 = v216;
      v81[3] = exp(v216[3] / (double)v212[3]);
      objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v82, v83, v84, v85, v86);
      v87 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringByTrimmingCharactersInSet_(v66, v88, (uint64_t)v87, v89, v90, v91);
      v92 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v93, (uint64_t)v92, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();

      v98 = [CHTokenizedTextResultToken alloc];
      v104 = (void *)objc_msgSend_copy(v65, v99, v100, v101, v102, v103);
      v105 = v216[3];
      v106 = v208[3];
      v107 = v204[3];
      v113 = objc_msgSend_count(v65, v108, v109, v110, v111, v112);
      v115 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v98, v114, (uint64_t)v97, (uint64_t)v104, 0, v106, v67, v107, v105, v105, v105, 1.0, v220[6], v220[7], v220[8], v220[9], v113);

      objc_msgSend_addObject_(v68, v116, (uint64_t)v115, v117, v118, v119);
    }
    if (!i)
    {
      v189 = 0u;
      v190 = 0u;
      v187 = 0u;
      v188 = 0u;
      v120 = v68;
      v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v142, (uint64_t)&v187, (uint64_t)v238, 16, v143);
      if (v149)
      {
        v150 = *(_QWORD *)v188;
        do
        {
          for (j = 0; j != v149; ++j)
          {
            if (*(_QWORD *)v188 != v150)
              objc_enumerationMutation(v120);
            objc_msgSend_strokeIndexes(*(void **)(*((_QWORD *)&v187 + 1) + 8 * j), v144, v145, v146, v147, v148);
            v152 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addIndexes_(v25, v153, (uint64_t)v152, v154, v155, v156);

          }
          v149 = objc_msgSend_countByEnumeratingWithState_objects_count_(v120, v144, (uint64_t)&v187, (uint64_t)v238, 16, v148);
        }
        while (v149);
      }
LABEL_26:

      objc_msgSend_addObject_(v175, v157, (uint64_t)v68, v158, v159, v160);
      objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v161, v162, v163, v164, v165, v232[3]);
      v120 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v174, v166, (uint64_t)v120, v167, v168, v169);
      goto LABEL_27;
    }
    objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v76, v77, v78, v79, v80);
    v120 = (id)objc_claimAutoreleasedReturnValue();
    v185 = 0u;
    v186 = 0u;
    v183 = 0u;
    v184 = 0u;
    v121 = v68;
    v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v122, (uint64_t)&v183, (uint64_t)v237, 16, v123);
    if (v129)
    {
      v130 = *(_QWORD *)v184;
      do
      {
        for (k = 0; k != v129; ++k)
        {
          if (*(_QWORD *)v184 != v130)
            objc_enumerationMutation(v121);
          objc_msgSend_strokeIndexes(*(void **)(*((_QWORD *)&v183 + 1) + 8 * k), v124, v125, v126, v127, v128);
          v132 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addIndexes_(v120, v133, (uint64_t)v132, v134, v135, v136);

        }
        v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v124, (uint64_t)&v183, (uint64_t)v237, 16, v128);
      }
      while (v129);
    }

    if ((objc_msgSend_isEqualToIndexSet_(v120, v137, (uint64_t)v25, v138, v139, v140) & 1) != 0)
      goto LABEL_26;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v141 = (id)qword_1EF568E20;
    if (os_log_type_enabled(v141, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134217984;
      v236 = i;
      _os_log_impl(&dword_1BE607000, v141, OS_LOG_TYPE_ERROR, "Skipping invalid alternative math transcription path (%lu) during conversion to text result.", buf, 0xCu);
    }

LABEL_27:
    _Block_object_dispose(&v203, 8);
    _Block_object_dispose(&v207, 8);
    _Block_object_dispose(&v211, 8);
    _Block_object_dispose(&v215, 8);
    _Block_object_dispose(&v219, 8);

    _Block_object_dispose(&v227, 8);
    _Block_object_dispose(&v231, 8);

  }
  v170 = [CHTokenizedTextResult alloc];
  v172 = (void *)objc_msgSend_initWithBestPathTokens_pathProbabilities_trailingSeparator_recognizerGenerationIdentifier_(v170, v171, (uint64_t)v175, (uint64_t)v174, (uint64_t)&stru_1E77F6F28, 2);

  return v172;
}

- (NSArray)sequence
{
  return self->_sequence;
}

- (void)setSequence:(id)a3
{
  objc_storeStrong((id *)&self->_sequence, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sequence, 0);
}

@end
