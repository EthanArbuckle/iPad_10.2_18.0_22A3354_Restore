@implementation CHTitleQuery

- (CHTitleQuery)initWithRecognitionSession:(id)a3
{
  CHTitleQuery *v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHTitleQuery *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CHTitleQuery;
  v3 = -[CHQuery initWithRecognitionSession:](&v11, sel_initWithRecognitionSession_, a3);
  v9 = v3;
  if (v3)
    objc_msgSend_setPreferredUpdatesInterval_(v3, v4, v5, v6, v7, v8, 0.5);
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
  void *v13;
  uint64_t *v14;
  NSObject *v15;
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
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *i;
  void *v61;
  uint64_t v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
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
  void *v83;
  id v84;
  const char *v85;
  uint64_t v86;
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
  double v97;
  double v98;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  void *v103;
  _BOOL4 v104;
  uint64_t *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  const char *v111;
  uint64_t v112;
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
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  NSObject *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  void *v156;
  NSString *v157;
  NSSet *v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  NSSet *v164;
  NSString *v165;
  NSString *transcribedTitle;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  NSSet *v172;
  NSSet *titleStrokeIdentifiers;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  NSObject *v179;
  NSObject *v180;
  NSObject *v181;
  uint64_t v182;
  void *v183;
  os_signpost_id_t spid;
  unint64_t v185;
  id obj;
  char v187;
  id v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  objc_super v193;
  _BYTE buf[12];
  __int16 v195;
  void *v196;
  __int16 v197;
  uint64_t v198;
  __int16 v199;
  const char *v200;
  _BYTE v201[128];
  uint64_t v202;

  v202 = *MEMORY[0x1E0C80C00];
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
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHTitleQuery", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTitleQuery\", buf, 2u);
  }

  v193.receiver = self;
  v193.super_class = (Class)CHTitleQuery;
  -[CHQuery q_updateQueryResult](&v193, sel_q_updateQueryResult);
  objc_msgSend_q_sessionResult(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  spid = v4;
  v185 = v6;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = &qword_1EF568000;
  v15 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_debugName(self, v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeProviderVersion(v13, v22, v23, v24, v25, v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v21;
    v195 = 2112;
    v196 = v27;
    _os_log_impl(&dword_1BE607000, v15, OS_LOG_TYPE_DEBUG, "%@: beginning update for result version %@.", buf, 0x16u);

  }
  objc_msgSend_strokeGroupingResult(v13, v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recognitionSession(self, v34, v35, v36, v37, v38);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45 = objc_msgSend_strokeGroupOrdering(v39, v40, v41, v42, v43, v44);
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v33, v46, v45, 1, v47, v48);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v191 = 0u;
  v192 = 0u;
  v189 = 0u;
  v190 = 0u;
  obj = v49;
  v57 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v50, (uint64_t)&v189, (uint64_t)v201, 16, v51);
  v58 = 0;
  if (v57)
  {
    v59 = *(_QWORD *)v190;
    while (2)
    {
      for (i = 0; i != v57; i = (char *)i + 1)
      {
        if (*(_QWORD *)v190 != v59)
          objc_enumerationMutation(obj);
        v61 = *(void **)(*((_QWORD *)&v189 + 1) + 8 * (_QWORD)i);
        v62 = objc_msgSend_uniqueIdentifier(v61, v52, v53, v54, v55, v56);
        objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v13, v63, v62, v64, v65, v66);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mathResult(v67, v68, v69, v70, v71, v72);
        v73 = (void *)objc_claimAutoreleasedReturnValue();

        if (v73)
        {
          objc_msgSend_recognitionSession(self, v74, v75, v76, v77, v78);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          v188 = v58;
          objc_msgSend_mathTranscriptionWithEvaluationResultForStrokeGroup_outStrokeIdentifiers_(v79, v80, (uint64_t)v61, (uint64_t)&v188, v81, v82);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          v84 = v188;

          if (v83)
          {
            objc_msgSend_mathResult(v67, v85, v86, v87, v88, v89);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_score(v91, v92, v93, v94, v95, v96);
            v98 = v97;

            v104 = v98 < 0.5;
            if (v98 < 0.5)
            {
              v57 = 0;
            }
            else
            {
              objc_msgSend_textTranscriptionForLatex_(CHTokenizedMathResult, v99, (uint64_t)v83, v100, v101, v102);
              v57 = (id)objc_claimAutoreleasedReturnValue();
            }
            v105 = &qword_1EF568000;
            v14 = &qword_1EF568000;

            goto LABEL_38;
          }
          v58 = v84;
        }
        else
        {
          *(_QWORD *)buf = 0;
          v187 = 0;
          objc_msgSend_highConfidenceTextForSessionResult_averageTokenScore_rejectionRate_doesContainUnfilteredMultiLocaleResults_(v67, v74, (uint64_t)v13, 0, (uint64_t)buf, (uint64_t)&v187);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          if (v90)
          {
            v103 = v90;
            v104 = *(double *)buf > 0.45;
            if (*(double *)buf > 0.45)
            {
              v57 = 0;
            }
            else
            {
              v57 = v90;
              objc_msgSend_strokeIdentifiers(v61, v106, v107, v108, v109, v110);
              v183 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_allObjects(v183, v111, v112, v113, v114, v115);
              v116 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_recognitionSession(self, v117, v118, v119, v120, v121);
              v122 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_latestStrokeProvider(v122, v123, v124, v125, v126, v127);
              v128 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v129, (uint64_t)v116, (uint64_t)v128, v130, v131);
              v182 = objc_claimAutoreleasedReturnValue();

              v58 = (void *)v182;
            }
            v105 = &qword_1EF568000;
            v14 = &qword_1EF568000;

            v84 = v58;
            goto LABEL_38;
          }
          if (v187)
          {
            v104 = 0;
            v57 = 0;
            v84 = v58;
            v105 = &qword_1EF568000;
            v14 = &qword_1EF568000;
LABEL_38:

            v58 = v84;
            goto LABEL_39;
          }
        }

      }
      v57 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v189, (uint64_t)v201, 16, v56);
      if (v57)
        continue;
      break;
    }
    v104 = 0;
    v105 = &qword_1EF568000;
    v14 = &qword_1EF568000;
  }
  else
  {
    v104 = 0;
    v105 = &qword_1EF568000;
  }
LABEL_39:

  if (v105[465] == -1)
  {
    v132 = (id)v14[453];
    if (!os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      goto LABEL_44;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v132 = (id)v14[453];
    if (!os_log_type_enabled(v132, OS_LOG_TYPE_DEFAULT))
      goto LABEL_44;
  }
  objc_msgSend_debugName(self, v133, v134, v135, v136, v137);
  v138 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_recognitionSession(self, v139, v140, v141, v142, v143);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  v150 = objc_msgSend_length(v57, v145, v146, v147, v148, v149);
  v151 = "";
  *(_DWORD *)buf = 138413058;
  *(_QWORD *)&buf[4] = v138;
  v195 = 2048;
  if (v104)
    v151 = " Low confidence, reporting nil.";
  v196 = v144;
  v197 = 2048;
  v198 = v150;
  v199 = 2080;
  v200 = v151;
  _os_log_impl(&dword_1BE607000, v132, OS_LOG_TYPE_DEFAULT, "%@: finished update for session %p. Length: %ld.%s", buf, 0x2Au);

LABEL_44:
  if (v57 && v58)
  {
    objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v152, (uint64_t)v58, v153, v154, v155);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    v157 = (NSString *)v57;
    v158 = v156;
    v164 = v158;
    if (self && (self->_transcribedTitle != v157 || self->_titleStrokeIdentifiers != v158))
    {
      v165 = (NSString *)objc_msgSend_copy(v157, v159, v160, v161, v162, v163);
      transcribedTitle = self->_transcribedTitle;
      self->_transcribedTitle = v165;

      v172 = (NSSet *)objc_msgSend_copy(v164, v167, v168, v169, v170, v171);
      titleStrokeIdentifiers = self->_titleStrokeIdentifiers;
      self->_titleStrokeIdentifiers = v172;

      objc_msgSend_q_queryResultDidChange(self, v174, v175, v176, v177, v178);
    }

  }
  if (v105[465] != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v179 = (id)qword_1EF568E50;
  v180 = v179;
  if (v185 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v179))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v180, OS_SIGNPOST_INTERVAL_END, spid, "CHTitleQuery", ", buf, 2u);
  }

  if (v105[465] != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v181 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v181, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v181, OS_LOG_TYPE_DEFAULT, "END \"CHTitleQuery\", buf, 2u);
  }

}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Title Query %p"), v2, v3, v4, self);
}

- (NSString)transcribedTitle
{
  return self->_transcribedTitle;
}

- (NSSet)titleStrokeIdentifiers
{
  return self->_titleStrokeIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_transcribedTitle, 0);
}

@end
