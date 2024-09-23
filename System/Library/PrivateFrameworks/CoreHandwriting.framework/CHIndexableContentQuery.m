@implementation CHIndexableContentQuery

- (CHIndexableContentQuery)initWithRecognitionSession:(id)a3
{
  CHIndexableContentQuery *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHIndexableContentQuery *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CHIndexableContentQuery;
  v3 = -[CHQuery initWithRecognitionSession:](&v11, sel_initWithRecognitionSession_, a3);
  v9 = v3;
  if (v3)
    objc_msgSend_setPreferredUpdatesInterval_(v3, v4, v5, v6, v7, v8, 2.0);
  return v9;
}

- (void)q_updateQueryResult
{
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  unint64_t v6;
  NSObject *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
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
  void *v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
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
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t i;
  uint64_t v91;
  void *v92;
  const char *v93;
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
  uint64_t v112;
  uint64_t v113;
  uint64_t j;
  void *v115;
  uint64_t v116;
  const char *v117;
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  void *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  const char *v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  CHRecognitionSessionIndexableContent *v164;
  id v165;
  id v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  NSString *indexableTextRepresentation;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  NSString *presentableTextRepresentation;
  id *p_isa;
  NSObject *v183;
  const char *v184;
  uint64_t v185;
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
  uint64_t v201;
  CHRecognitionSessionIndexableContent *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  NSObject *v208;
  NSObject *v209;
  NSObject *v210;
  os_signpost_id_t spid;
  unint64_t v212;
  id obj;
  CHIndexableContentQuery *v214;
  void *v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  void *v219;
  uint64_t v220;
  id v221;
  uint64_t v222;
  void *v223;
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
  objc_super v236;
  _BYTE buf[22];
  __int16 v238;
  uint64_t v239;
  _BYTE v240[128];
  _BYTE v241[128];
  _BYTE v242[128];
  uint64_t v243;

  v243 = *MEMORY[0x1E0C80C00];
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v3 = (id)qword_1EF568E50;
  v4 = os_signpost_id_generate(v3);

  if (qword_1EF568E88 == -1)
  {
    v5 = (id)qword_1EF568E50;
    v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v5 = (id)qword_1EF568E50;
    v6 = v4 - 1;
    if (v4 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHIndexableContentQuery", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHIndexableContentQuery\", buf, 2u);
  }

  v236.receiver = self;
  v236.super_class = (Class)CHIndexableContentQuery;
  -[CHQuery q_updateQueryResult](&v236, sel_q_updateQueryResult);
  objc_msgSend_q_sessionResult(self, v8, v9, v10, v11, v12);
  v218 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  spid = v4;
  v212 = v6;
  v13 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_debugName(self, v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeProviderVersion(v218, v20, v21, v22, v23, v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v19;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v25;
    _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_DEBUG, "%@: beginning update for result version %@.", buf, 0x16u);

  }
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v32, v33, v34, v35, v36);
  v215 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v218, v37, v38, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v214 = self;
  objc_msgSend_recognitionSession(self, v43, v44, v45, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend_strokeGroupOrdering(v48, v49, v50, v51, v52, v53);
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v42, v55, v54, 1, v56, v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();

  v234 = 0u;
  v235 = 0u;
  v232 = 0u;
  v233 = 0u;
  obj = v58;
  v217 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v59, (uint64_t)&v232, (uint64_t)v242, 16, v60);
  if (v217)
  {
    v216 = *(_QWORD *)v233;
    do
    {
      v66 = 0;
      do
      {
        if (*(_QWORD *)v233 != v216)
          objc_enumerationMutation(obj);
        v219 = *(void **)(*((_QWORD *)&v232 + 1) + 8 * v66);
        v220 = v66;
        v71 = objc_msgSend_uniqueIdentifier(v219, v61, v62, v63, v64, v65);
        objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v218, v72, v71, v73, v74, v75);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        v228 = 0u;
        v229 = 0u;
        v230 = 0u;
        v231 = 0u;
        objc_msgSend_locales(v218, v76, v77, v78, v79, v80);
        v221 = (id)objc_claimAutoreleasedReturnValue();
        v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v81, (uint64_t)&v228, (uint64_t)v241, 16, v82);
        if (v83)
        {
          v89 = v83;
          v222 = *(_QWORD *)v229;
          do
          {
            for (i = 0; i != v89; ++i)
            {
              if (*(_QWORD *)v229 != v222)
                objc_enumerationMutation(v221);
              v91 = *(_QWORD *)(*((_QWORD *)&v228 + 1) + 8 * i);
              objc_msgSend_recognitionResultsByLocale(v223, v84, v85, v86, v87, v88);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKeyedSubscript_(v92, v93, v91, v94, v95, v96);
              v97 = (void *)objc_claimAutoreleasedReturnValue();

              v226 = 0u;
              v227 = 0u;
              v224 = 0u;
              v225 = 0u;
              objc_msgSend_transcriptionPaths(v97, v98, v99, v100, v101, v102);
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v106 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v104, (uint64_t)&v224, (uint64_t)v240, 16, v105);
              if (v106)
              {
                v112 = v106;
                v113 = *(_QWORD *)v225;
                do
                {
                  for (j = 0; j != v112; ++j)
                  {
                    if (*(_QWORD *)v225 != v113)
                      objc_enumerationMutation(v103);
                    v115 = *(void **)(*((_QWORD *)&v224 + 1) + 8 * j);
                    v116 = objc_msgSend_length(v115, v107, v108, v109, v110, v111);
                    objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_(v97, v117, (uint64_t)v115, 0, v116, 0);
                    v118 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_appendFormat_(v31, v119, (uint64_t)CFSTR("%@\n"), v120, v121, v122, v118, spid);

                  }
                  v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v103, v107, (uint64_t)&v224, (uint64_t)v240, 16, v111);
                }
                while (v112);
              }

            }
            v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v221, v84, (uint64_t)&v228, (uint64_t)v241, 16, v88);
          }
          while (v89);
        }

        objc_msgSend_mathResult(v223, v123, v124, v125, v126, v127);
        v128 = (void *)objc_claimAutoreleasedReturnValue();

        if (v128)
        {
          objc_msgSend_recognitionSession(v214, v67, v129, v130, v131, v132);
          v133 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_mathTranscriptionWithEvaluationResultForStrokeGroup_outStrokeIdentifiers_(v133, v134, (uint64_t)v219, 0, v135, v136);
          v137 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v138, (uint64_t)v137, v139, v140, v141);
          v142 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_simplifiedTextTranscriptionForLatex_(CHTokenizedMathResult, v143, (uint64_t)v137, v144, v145, v146);
          v147 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v31, v148, (uint64_t)CFSTR("%@\n"), v149, v150, v151, v137);
          objc_msgSend_appendFormat_(v31, v152, (uint64_t)CFSTR("%@\n"), v153, v154, v155, v142);
          if ((objc_msgSend_isEqualToString_(v147, v156, (uint64_t)v142, v157, v158, v159) & 1) == 0)
            objc_msgSend_appendFormat_(v31, v160, (uint64_t)CFSTR("%@\n"), v161, v162, v163, v147);

          if (v142)
            goto LABEL_20;
        }
        objc_msgSend_highConfidenceTextForSessionResult_averageTokenScore_rejectionRate_doesContainUnfilteredMultiLocaleResults_(v223, v67, (uint64_t)v218, 0, 0, 0);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        if (v142)
LABEL_20:
          objc_msgSend_appendFormat_(v215, v67, (uint64_t)CFSTR("%@\n"), v68, v69, v70, v142);

        v66 = v220 + 1;
      }
      while (v220 + 1 != v217);
      v217 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v61, (uint64_t)&v232, (uint64_t)v242, 16, v65);
    }
    while (v217);
  }

  v164 = [CHRecognitionSessionIndexableContent alloc];
  v165 = v31;
  v166 = v215;
  v167 = v166;
  if (!v164)
  {

    p_isa = (id *)&v214->super.super.isa;
    if (qword_1EF568E88 == -1)
      goto LABEL_47;
    goto LABEL_65;
  }
  *(_QWORD *)buf = v164;
  *(_QWORD *)&buf[8] = CHRecognitionSessionIndexableContent;
  v164 = (CHRecognitionSessionIndexableContent *)objc_msgSendSuper2((objc_super *)buf, sel_init);
  if (v164)
  {
    v173 = objc_msgSend_copy(v165, v168, v169, v170, v171, v172);
    indexableTextRepresentation = v164->_indexableTextRepresentation;
    v164->_indexableTextRepresentation = (NSString *)v173;

    v180 = objc_msgSend_copy(v167, v175, v176, v177, v178, v179);
    presentableTextRepresentation = v164->_presentableTextRepresentation;
    v164->_presentableTextRepresentation = (NSString *)v180;

  }
  p_isa = (id *)&v214->super.super.isa;
  if (qword_1EF568E88 != -1)
LABEL_65:
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
LABEL_47:
  v183 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v183, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_debugName(p_isa, v184, v185, v186, v187, v188);
    v189 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recognitionSession(p_isa, v190, v191, v192, v193, v194);
    v195 = (void *)objc_claimAutoreleasedReturnValue();
    v201 = objc_msgSend_length(v165, v196, v197, v198, v199, v200);
    *(_DWORD *)buf = 138412802;
    *(_QWORD *)&buf[4] = v189;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v195;
    v238 = 2048;
    v239 = v201;
    _os_log_impl(&dword_1BE607000, v183, OS_LOG_TYPE_DEFAULT, "%@: finished update for session %p. indexableContent length: %ld", buf, 0x20u);

  }
  v202 = v164;
  if (p_isa && p_isa[9] != v202)
  {
    objc_storeStrong(p_isa + 9, v164);
    objc_msgSend_q_queryResultDidChange(p_isa, v203, v204, v205, v206, v207);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v208 = (id)qword_1EF568E50;
  v209 = v208;
  if (v212 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v208))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v209, OS_SIGNPOST_INTERVAL_END, spid, "CHIndexableContentQuery", ", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v210 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v210, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v210, OS_LOG_TYPE_DEFAULT, "END \"CHIndexableContentQuery\", buf, 2u);
  }

}

- (CHRecognitionSessionIndexableContent)indexableContent
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  id v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1BE896970;
  v15 = sub_1BE896980;
  v16 = 0;
  objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE896988;
  v10[3] = &unk_1E77F2290;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (CHRecognitionSessionIndexableContent *)v8;
}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("IndexableContent Query %p"), v2, v3, v4, self);
}

- (BOOL)needsForegroundRecognition
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_indexableContent, 0);
}

@end
