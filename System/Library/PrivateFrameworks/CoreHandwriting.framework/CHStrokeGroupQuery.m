@implementation CHStrokeGroupQuery

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
  NSObject *v14;
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
  void *v31;
  NSObject *v32;
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
  NSArray *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSArray *v57;
  os_signpost_id_t v58;
  NSArray *v59;
  NSArray *strokeGroupItems;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  NSArray *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t i;
  void *v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  NSDictionary *v95;
  NSDictionary *strokeGroupItemsByID;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  NSObject *v102;
  NSObject *v103;
  NSObject *v104;
  unint64_t v105;
  void *v106;
  objc_super v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  uint8_t buf[4];
  void *v113;
  __int16 v114;
  void *v115;
  __int16 v116;
  uint64_t v117;
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
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
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHStrokeGroupQuery", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStrokeGroupQuery\", buf, 2u);
  }

  v107.receiver = self;
  v107.super_class = (Class)CHStrokeGroupQuery;
  -[CHQuery q_updateQueryResult](&v107, sel_q_updateQueryResult);
  objc_msgSend_q_sessionResult(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_debugName(self, v15, v16, v17, v18, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeProviderVersion(v13, v21, v22, v23, v24, v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v113 = v20;
    v114 = 2112;
    v115 = v26;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEBUG, "%@: beginning update for result version %@.", buf, 0x16u);

  }
  objc_msgSend_q_strokeGroupItemsFromSessionResult_(self, v27, (uint64_t)v13, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = v6;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v106 = v13;
  v32 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend_debugName(self, v33, v34, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recognitionSession(self, v39, v40, v41, v42, v43);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend_count(v31, v45, v46, v47, v48, v49);
    *(_DWORD *)buf = 138412802;
    v113 = v38;
    v114 = 2048;
    v115 = v44;
    v116 = 2048;
    v117 = v50;
    _os_log_impl(&dword_1BE607000, v32, OS_LOG_TYPE_DEFAULT, "%@: finished update for session %p. %ld item(s) available.", buf, 0x20u);

  }
  v51 = v31;
  v57 = v51;
  if (self && self->_strokeGroupItems != v51)
  {
    v58 = v4;
    v59 = (NSArray *)objc_msgSend_copy(v51, v52, v53, v54, v55, v56);
    strokeGroupItems = self->_strokeGroupItems;
    self->_strokeGroupItems = v59;

    v61 = (void *)MEMORY[0x1E0C99E08];
    v67 = objc_msgSend_count(self->_strokeGroupItems, v62, v63, v64, v65, v66);
    objc_msgSend_dictionaryWithCapacity_(v61, v68, v67, v69, v70, v71);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v108 = 0u;
    v109 = 0u;
    v110 = 0u;
    v111 = 0u;
    v73 = self->_strokeGroupItems;
    v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v74, (uint64_t)&v108, (uint64_t)buf, 16, v75);
    if (v76)
    {
      v82 = v76;
      v83 = *(_QWORD *)v109;
      do
      {
        for (i = 0; i != v82; ++i)
        {
          if (*(_QWORD *)v109 != v83)
            objc_enumerationMutation(v73);
          v85 = *(void **)(*((_QWORD *)&v108 + 1) + 8 * i);
          objc_msgSend_strokeGroupIdentifier(v85, v77, v78, v79, v80, v81, v105, v106);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setObject_forKeyedSubscript_(v72, v87, (uint64_t)v85, (uint64_t)v86, v88, v89);

        }
        v82 = objc_msgSend_countByEnumeratingWithState_objects_count_(v73, v77, (uint64_t)&v108, (uint64_t)buf, 16, v81);
      }
      while (v82);
    }

    v95 = (NSDictionary *)objc_msgSend_copy(v72, v90, v91, v92, v93, v94);
    strokeGroupItemsByID = self->_strokeGroupItemsByID;
    self->_strokeGroupItemsByID = v95;

    objc_msgSend_q_queryResultDidChange(self, v97, v98, v99, v100, v101);
    v4 = v58;
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v102 = (id)qword_1EF568E50;
  v103 = v102;
  if (v105 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v102))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v103, OS_SIGNPOST_INTERVAL_END, v4, "CHStrokeGroupQuery", ", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v104 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
      goto LABEL_37;
    goto LABEL_36;
  }
  v104 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v104, OS_LOG_TYPE_DEFAULT))
  {
LABEL_36:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v104, OS_LOG_TYPE_DEFAULT, "END \"CHStrokeGroupQuery\", buf, 2u);
  }
LABEL_37:

}

- (id)q_strokeGroupItemsFromSessionResult:(id)a3
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
  uint64_t v15;
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
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
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
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  char isEqualToTokenizedMathResult;
  const char *v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  const char *v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
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
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  const char *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  const char *v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  void *v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  void *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  id v172;
  CHStrokeGroupQueryItem *v173;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  _QWORD *v180;
  void *v181;
  id v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  void *v199;
  const char *v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  const char *v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  void *v218;
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  void *v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  CHStrokeGroupQueryItem *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  CHStrokeGroupQueryItem *v235;
  _QWORD *v236;
  void *v238;
  _BOOL8 v239;
  void *v240;
  void *v241;
  id v242;
  uint64_t v243;
  void *v244;
  id obj;
  void *v246;
  void *v247;
  id v248;
  uint64_t v249;
  void *v250;
  CHStrokeGroupQuery *v251;
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  _BYTE v256[128];
  uint64_t v257;

  v257 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_strokeGroupingResult(v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_locales(v4, v11, v12, v13, v14, v15);
  v244 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend_strokeGroups(v10, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend_count(v22, v23, v24, v25, v26, v27);
  objc_msgSend_arrayWithCapacity_(v16, v29, v28, v30, v31, v32);
  v248 = (id)objc_claimAutoreleasedReturnValue();

  v254 = 0u;
  v255 = 0u;
  v252 = 0u;
  v253 = 0u;
  v251 = self;
  objc_msgSend_recognitionSession(self, v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = objc_msgSend_strokeGroupOrdering(v38, v39, v40, v41, v42, v43);
  v238 = v10;
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v10, v45, v44, 0, v46, v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v48;
  v249 = objc_msgSend_countByEnumeratingWithState_objects_count_(v48, v49, (uint64_t)&v252, (uint64_t)v256, 16, v50);
  if (v249)
  {
    v56 = *(_QWORD *)v253;
    v242 = v4;
    v243 = *(_QWORD *)v253;
    do
    {
      for (i = 0; i != v249; ++i)
      {
        if (*(_QWORD *)v253 != v56)
          objc_enumerationMutation(obj);
        v58 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * i);
        v59 = (void *)MEMORY[0x1E0CB37E8];
        v60 = objc_msgSend_uniqueIdentifier(v58, v51, v52, v53, v54, v55);
        objc_msgSend_numberWithInteger_(v59, v61, v60, v62, v63, v64);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v251->_strokeGroupItemsByID, v66, (uint64_t)v65, v67, v68, v69);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mathResult(v70, v71, v72, v73, v74, v75);
        v76 = (void *)objc_claimAutoreleasedReturnValue();
        v82 = objc_msgSend_uniqueIdentifier(v58, v77, v78, v79, v80, v81);
        objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v4, v83, v82, v84, v85, v86);
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mathResult(v87, v88, v89, v90, v91, v92);
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToTokenizedMathResult = objc_msgSend_isEqualToTokenizedMathResult_(v76, v94, (uint64_t)v93, v95, v96, v97);

        if (v70 && (isEqualToTokenizedMathResult & 1) != 0)
        {
LABEL_5:
          objc_msgSend_addObject_(v248, v99, (uint64_t)v70, v101, v102, v103);

          goto LABEL_6;
        }
        v104 = objc_msgSend_uniqueIdentifier(v58, v99, v100, v101, v102, v103);
        objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v4, v105, v104, v106, v107, v108);
        v109 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_inputStrokeIdentifiers(v109, v110, v111, v112, v113, v114);
        v115 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_recognitionResultsByLocale(v109, v116, v117, v118, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_errorsByLocale(v109, v122, v123, v124, v125, v126);
        v127 = (void *)objc_claimAutoreleasedReturnValue();
        v128 = (void *)MEMORY[0x1E0CB37E8];
        v134 = objc_msgSend_ancestorIdentifier(v58, v129, v130, v131, v132, v133);
        objc_msgSend_numberWithInteger_(v128, v135, v134, v136, v137, v138);
        v250 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_localesSortedByCombinedLanguageFitness_(v109, v139, (uint64_t)v244, v140, v141, v142);
        v143 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v143, v144, v145, v146, v147, v148);
        v149 = objc_claimAutoreleasedReturnValue();
        v155 = (void *)v149;
        if (v115)
        {
          v246 = (void *)v149;
          v247 = v127;
          objc_msgSend_mathResult(v109, v150, v151, v152, v153, v154);
          v156 = (void *)objc_claimAutoreleasedReturnValue();

          if (v156)
          {
            objc_msgSend_recognitionSession(v251, v157, v158, v159, v160, v161);
            v162 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_latestStrokeProvider(v162, v163, v164, v165, v166, v167);
            v168 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v169, (uint64_t)v115, (uint64_t)v168, v170, v171);
            v172 = (id)objc_claimAutoreleasedReturnValue();

            if (v172)
            {
              v173 = [CHStrokeGroupQueryItem alloc];
              objc_msgSend_mathResult(v109, v174, v175, v176, v177, v178);
              v179 = (void *)objc_claimAutoreleasedReturnValue();
              v180 = sub_1BE62CF74(v173, v65, v250, v172, 3, 1, 0, MEMORY[0x1E0C9AA70], v179, v247);
              goto LABEL_26;
            }
          }
          else
          {
            v155 = v246;
            if (!v246 || !v121)
            {
              v127 = v247;
              goto LABEL_29;
            }
            objc_msgSend_objectForKeyedSubscript_(v121, v157, (uint64_t)v246, v159, v160, v161);
            v181 = (void *)objc_claimAutoreleasedReturnValue();
            v182 = v58;
            v172 = v181;
            v240 = v121;
            v241 = v182;
            if ((unint64_t)(objc_msgSend_classification(v182, v183, v184, v185, v186, v187) - 1) > 3)
            {
              v239 = 0;
            }
            else
            {
              objc_msgSend_transcriptionPaths(v172, v188, v189, v190, v191, v192);
              v193 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstObject(v193, v194, v195, v196, v197, v198);
              v199 = (void *)objc_claimAutoreleasedReturnValue();

              if (v199)
              {
                v205 = objc_msgSend_length(v199, v200, v201, v202, v203, v204);
                objc_msgSend_transcriptionWithPath_columnRange_filterLowConfidence_excludeGibberish_rejectionRate_tokenProcessingBlock_(v172, v206, (uint64_t)v199, 0, v205, 0, 1, 0, 0);
                v207 = (void *)objc_claimAutoreleasedReturnValue();
                v239 = objc_msgSend_length(v207, v208, v209, v210, v211, v212) != 0;

              }
              else
              {
                v239 = 0;
              }

              v182 = v241;
            }

            objc_msgSend_recognitionSession(v251, v213, v214, v215, v216, v217);
            v218 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_latestStrokeProvider(v218, v219, v220, v221, v222, v223);
            v224 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v225, (uint64_t)v115, (uint64_t)v224, v226, v227);
            v179 = (void *)objc_claimAutoreleasedReturnValue();

            if (v179)
            {
              v228 = [CHStrokeGroupQueryItem alloc];
              v234 = objc_msgSend_classification(v241, v229, v230, v231, v232, v233);
              v235 = v228;
              v121 = v240;
              v180 = sub_1BE62CF74(v235, v65, v250, v179, v234, v239, v246, v240, 0, v247);
LABEL_26:
              v236 = v180;

              v70 = v236;
            }
            else
            {
              v121 = v240;
            }

          }
          v4 = v242;

          v155 = v246;
          v127 = v247;
        }
LABEL_29:

        v56 = v243;
        if (v70)
          goto LABEL_5;
LABEL_6:

      }
      v249 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v252, (uint64_t)v256, 16, v55);
    }
    while (v249);
  }

  return v248;
}

- (id)tokenizedStrokeResultForInitialStrokes:(id)a3 point:(CGPoint)a4 tokenizationLevel:(int64_t)a5
{
  double y;
  double x;
  id v9;
  dispatch_semaphore_t v10;
  NSObject *v11;
  const char *v12;
  id v13;
  id v14;
  _QWORD v16[4];
  NSObject *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_1BE62D224;
  v23 = sub_1BE62D234;
  v24 = 0;
  v10 = dispatch_semaphore_create(0);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = sub_1BE62D23C;
  v16[3] = &unk_1E77F2218;
  v18 = &v19;
  v11 = v10;
  v17 = v11;
  v13 = (id)objc_msgSend_tokenizedStrokeResultForInitialStrokes_point_tokenizationLevel_completion_shouldCancel_(self, v12, (uint64_t)v9, a5, (uint64_t)v16, 0, x, y);
  dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  v14 = (id)v20[5];

  _Block_object_dispose(&v19, 8);
  return v14;
}

- (id)tokenizedStrokeResultForInitialStrokes:(id)a3 point:(CGPoint)a4 tokenizationLevel:(int64_t)a5 completion:(id)a6 shouldCancel:(id)a7
{
  double y;
  double x;
  id v13;
  id v14;
  id v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
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
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  const char *v43;
  void *v44;
  _QWORD v46[4];
  id v47;
  os_signpost_id_t v48;
  uint8_t buf[16];

  y = a4.y;
  x = a4.x;
  v13 = a6;
  v14 = a7;
  v15 = a3;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v16 = (id)qword_1EF568E50;
  v17 = os_signpost_id_generate(v16);

  if (qword_1EF568E88 == -1)
  {
    v18 = (id)qword_1EF568E50;
    if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v18 = (id)qword_1EF568E50;
    if (v17 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v18, OS_SIGNPOST_INTERVAL_BEGIN, v17, "CHStrokeGroupQuery_resultsForInitialStrokes", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v19 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v19, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStrokeGroupQuery_resultsForInitialStrokes\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_latestStrokeProvider(v25, v26, v27, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodedStrokeIdentifiers_withStrokeProvider_(CHStrokeUtilities, v32, (uint64_t)v15, (uint64_t)v31, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_recognitionSession(self, v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = sub_1BE62D51C;
  v46[3] = &unk_1E77F2240;
  v47 = v13;
  v48 = v17;
  v42 = v13;
  objc_msgSend_tokenStrokeIdentifiersForContextStrokes_point_tokenizationLevel_completion_shouldCancel_(v41, v43, (uint64_t)v35, a5, (uint64_t)v46, (uint64_t)v14, x, y);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  return v44;
}

- (id)tokenStrokeIdentifiersWithCoveringStroke:(id)a3 completion:(id)a4 shouldCancel:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  os_signpost_id_t v28;
  uint8_t buf[16];

  v8 = a4;
  v9 = a5;
  v10 = a3;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v11 = (id)qword_1EF568E50;
  v12 = os_signpost_id_generate(v11);

  if (qword_1EF568E88 == -1)
  {
    v13 = (id)qword_1EF568E50;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v13 = (id)qword_1EF568E50;
    if (v12 - 1 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_7;
  }
  if (os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v12, "CHStrokeGroupQuery_strokesCoveredByStroke", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v14, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHStrokeGroupQuery_strokesCoveredByStroke\", buf, 2u);
  }

  objc_msgSend_recognitionSession(self, v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = sub_1BE62D888;
  v26[3] = &unk_1E77F2268;
  v27 = v8;
  v28 = v12;
  v21 = v8;
  objc_msgSend_tokenStrokeIdentifiersWithCoveringStroke_completion_shouldCancel_(v20, v22, (uint64_t)v10, (uint64_t)v26, (uint64_t)v9, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (NSArray)strokeGroupItems
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = sub_1BE62D224;
  v16 = sub_1BE62D234;
  v17 = 0;
  objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1BE62DADC;
  v11[3] = &unk_1E77F2290;
  v11[4] = self;
  v11[5] = &v12;
  dispatch_sync(v7, v11);

  v8 = (void *)v13[5];
  if (!v8)
  {
    v13[5] = MEMORY[0x1E0C9AA60];
    v8 = (void *)v13[5];
  }
  v9 = v8;
  _Block_object_dispose(&v12, 8);

  return (NSArray *)v9;
}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Stroke Group Query %p"), v2, v3, v4, self);
}

- (BOOL)needsForegroundRecognition
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strokeGroupItemsByID, 0);
  objc_storeStrong((id *)&self->_strokeGroupItems, 0);
}

@end
