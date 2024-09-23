@implementation CHPrefixQuery

+ (id)hashtagQueryForRecognitionSession:(id)a3
{
  id v3;
  CHPrefixQuery *v4;
  id *v5;

  v3 = a3;
  v4 = [CHPrefixQuery alloc];
  objc_opt_self();
  if (qword_1EF567EB0 != -1)
    dispatch_once(&qword_1EF567EB0, &unk_1E77F1970);
  v5 = sub_1BE7D680C((id *)&v4->super.super.isa, v3, CFSTR("#"), 0, (void *)qword_1EF567EB8);

  return v5;
}

+ (id)mentionQueryForRecognitionSession:(id)a3
{
  id v3;
  CHPrefixQuery *v4;
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
  id *v17;

  v3 = a3;
  v4 = [CHPrefixQuery alloc];
  objc_msgSend_set(MEMORY[0x1E0C99E60], v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = sub_1BE7D680C((id *)&v4->super.super.isa, v3, CFSTR("@"), v10, v16);

  return v17;
}

+ (id)prefixQueryWithPrefix:(id)a3 forRecognitionSession:(id)a4
{
  id v5;
  id v6;
  CHPrefixQuery *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id *v14;

  v5 = a3;
  v6 = a4;
  v7 = [CHPrefixQuery alloc];
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = sub_1BE7D680C((id *)&v7->super.super.isa, v6, v5, 0, v13);

  return v14;
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
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSArray *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSArray *v24;
  NSArray *v25;
  NSArray *foundItems;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  objc_super v34;
  uint8_t buf[16];

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
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v4, "CHPrefixQuery", ", buf, 2u);
  }
LABEL_7:

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v7 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v7, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHPrefixQuery\", buf, 2u);
  }

  v34.receiver = self;
  v34.super_class = (Class)CHPrefixQuery;
  -[CHQuery q_updateQueryResult](&v34, sel_q_updateQueryResult);
  objc_msgSend_q_sessionResult(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__prefixQueryResultsForSessionResult_(self, v14, (uint64_t)v13, v15, v16, v17);
  v18 = (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  v24 = v18;
  if (self && self->_foundItems != v18)
  {
    v25 = (NSArray *)objc_msgSend_copy(v18, v19, v20, v21, v22, v23);
    foundItems = self->_foundItems;
    self->_foundItems = v25;

    objc_msgSend_q_queryResultDidChange(self, v27, v28, v29, v30, v31);
  }

  if (qword_1EF568E88 == -1)
  {
    v32 = (id)qword_1EF568E50;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_18;
  }
  else
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v32 = (id)qword_1EF568E50;
    if (v6 > 0xFFFFFFFFFFFFFFFDLL)
      goto LABEL_18;
  }
  if (os_signpost_enabled(v32))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v32, OS_SIGNPOST_INTERVAL_END, v4, "CHPrefixQuery", ", buf, 2u);
  }
LABEL_18:

  if (qword_1EF568E88 != -1)
  {
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v33 = (id)qword_1EF568E18[0];
    if (!os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    goto LABEL_20;
  }
  v33 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
LABEL_20:
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v33, OS_LOG_TYPE_DEFAULT, "END \"CHPrefixQuery\", buf, 2u);
  }
LABEL_21:

}

- (BOOL)_isTokenStringMatchingQuery:(id)a3 allowPartialMatching:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSString *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
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
  uint64_t v58;
  NSSet *validSuffixes;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSSet *v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char v75;
  unint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  BOOL v82;
  _QWORD v84[4];
  id v85;
  id v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  char v91;

  v4 = a4;
  v6 = a3;
  v7 = self->_prefix;
  objc_msgSend_stringByFoldingWithOptions_locale_(v7, v8, 385, 0, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringByFoldingWithOptions_locale_(v6, v12, 385, 0, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByString_(v15, v16, (uint64_t)v11, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend_count(v20, v21, v22, v23, v24, v25) - 1;

  if (v26 <= 1)
  {
    v31 = 0;
    v88 = 0;
    v89 = &v88;
    v90 = 0x2020000000;
    v91 = 0;
    if (objc_msgSend_hasPrefix_(v15, v27, (uint64_t)v11, v28, v29, v30))
    {
      v37 = objc_msgSend_length(v11, v32, v33, v34, v35, v36);
      objc_msgSend_substringFromIndex_(v6, v38, v37, v39, v40, v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = objc_msgSend_rangeOfCharacterFromSet_(v42, v43, (uint64_t)self->_queryDelimiters, v44, v45, v46);

      if (v47 == 0x7FFFFFFFFFFFFFFFLL)
      {
        if (v4)
        {
          v53 = objc_msgSend_length(v15, v48, v49, v50, v51, v52);
          if (v53 == objc_msgSend_length(v11, v54, v55, v56, v57, v58) || (validSuffixes = self->_validSuffixes) == 0)
          {
            *((_BYTE *)v89 + 24) = 1;
          }
          else
          {
            v84[0] = MEMORY[0x1E0C809B0];
            v84[1] = 3221225472;
            v84[2] = sub_1BE7D72C8;
            v84[3] = &unk_1E77F5370;
            v85 = v15;
            v86 = v11;
            v87 = &v88;
            objc_msgSend_enumerateObjectsUsingBlock_(validSuffixes, v60, (uint64_t)v84, v61, v62, v63);

          }
        }
        else
        {
          v64 = self->_validSuffixes;
          if (v64)
          {
            v65 = objc_msgSend_length(v11, v48, v49, v50, v51, v52);
            objc_msgSend_substringFromIndex_(v15, v66, v65, v67, v68, v69);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v75 = objc_msgSend_containsObject_(v64, v71, (uint64_t)v70, v72, v73, v74);
            *((_BYTE *)v89 + 24) = v75;

          }
          else
          {
            v76 = objc_msgSend_length(v15, v48, v49, v50, v51, v52);
            v82 = v76 > objc_msgSend_length(v11, v77, v78, v79, v80, v81);
            *((_BYTE *)v89 + 24) = v82;
          }
        }
      }
      else
      {
        *((_BYTE *)v89 + 24) = 0;
      }
      v31 = *((_BYTE *)v89 + 24) != 0;
    }
    _Block_object_dispose(&v88, 8);
  }
  else
  {
    v31 = 0;
  }

  return v31;
}

- (id)_prefixQueryResultsForSessionResult:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSSet *validSuffixes;
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
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  const char *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
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
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  id v79;
  id v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  id v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  id v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  const char *v102;
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
  id obj;
  id v116;
  id v117;
  CHPrefixQuery *v118;
  uint64_t v119;
  uint64_t v120;
  id v121;
  void *v122;
  _QWORD v123[5];
  id v124;
  void *v125;
  id v126;
  _QWORD v127[4];
  id v128;
  CHPrefixQuery *v129;
  id v130;
  void *v131;
  id v132;
  uint64_t *v133;
  uint64_t v134;
  uint64_t *v135;
  uint64_t v136;
  char v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  _QWORD v142[4];
  id v143;
  _BYTE v144[128];
  uint64_t v145;

  v145 = *MEMORY[0x1E0C80C00];
  v121 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v4, v5, v6, v7, v8);
  v116 = (id)objc_claimAutoreleasedReturnValue();
  validSuffixes = self->_validSuffixes;
  if (!validSuffixes || objc_msgSend_count(validSuffixes, v9, v10, v11, v12, v13))
  {
    objc_msgSend_strokeGroupingResult(v121, v9, v10, v11, v12, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeGroups(v15, v16, v17, v18, v19, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v118 = self;

    v140 = 0u;
    v141 = 0u;
    v138 = 0u;
    v139 = 0u;
    obj = v21;
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v138, (uint64_t)v144, 16, v23);
    if (v24)
    {
      v119 = *(_QWORD *)v139;
      do
      {
        v120 = v24;
        for (i = 0; i != v120; ++i)
        {
          if (*(_QWORD *)v139 != v119)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * i);
          v32 = objc_msgSend_uniqueIdentifier(v31, v25, v26, v27, v28, v29);
          objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v121, v33, v32, v34, v35, v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_preferredLocale(v37, v38, v39, v40, v41, v42);
          v122 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = (void *)objc_opt_class();
          objc_msgSend_recognitionResultsByLocale(v37, v44, v45, v46, v47, v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_locales(v121, v50, v51, v52, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_languageFitnessByLocale(v37, v56, v57, v58, v59, v60);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_filteredResultsByLocale_orderedLocales_usingLanguageFitness_outSortedLocales_(v43, v62, (uint64_t)v49, (uint64_t)v55, (uint64_t)v61, 0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_objectForKeyedSubscript_(v63, v64, (uint64_t)v122, v65, v66, v67);
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          if (v72)
          {
            if (objc_msgSend_shouldRefinePrefixQueryMatchesForLocale_(CHRecognizerConfiguration, v68, (uint64_t)v122, v69, v70, v71))
            {
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v73, v74, v75, v76, v77);
              v78 = (void *)objc_claimAutoreleasedReturnValue();
              v134 = 0;
              v135 = &v134;
              v136 = 0x2020000000;
              v137 = 0;
              v127[0] = MEMORY[0x1E0C809B0];
              v127[1] = 3221225472;
              v127[2] = sub_1BE7D838C;
              v127[3] = &unk_1E77F5410;
              v117 = v78;
              v128 = v117;
              v129 = v118;
              v133 = &v134;
              v79 = v37;
              v130 = v79;
              v131 = v31;
              v80 = v116;
              v132 = v80;
              objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v72, v81, (uint64_t)v127, v82, v83, v84);
              if (*((_BYTE *)v135 + 24))
              {
                v85 = v117;
                objc_msgSend_string(MEMORY[0x1E0CB37A0], v86, v87, v88, v89, v90);
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                v142[0] = MEMORY[0x1E0C809B0];
                v142[1] = 3221225472;
                v142[2] = sub_1BE7D7D68;
                v142[3] = &unk_1E77F53E8;
                v92 = v91;
                v143 = v92;
                objc_msgSend_enumerateObjectsUsingBlock_(v85, v93, (uint64_t)v142, v94, v95, v96);
                objc_msgSend_stringWithString_(MEMORY[0x1E0CB3940], v97, (uint64_t)v92, v98, v99, v100);
                v101 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend__isTokenStringMatchingQuery_allowPartialMatching_(v118, v102, (uint64_t)v101, 0, v103, v104))
                {
                  sub_1BE7D7378((void **)&v118->super.super.isa, v85, v79, v31);
                  v109 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v109)
                    objc_msgSend_addObject_(v80, v105, (uint64_t)v109, v106, v107, v108);

                }
              }

              _Block_object_dispose(&v134, 8);
            }
            else
            {
              v123[0] = MEMORY[0x1E0C809B0];
              v123[1] = 3221225472;
              v123[2] = sub_1BE7D856C;
              v123[3] = &unk_1E77F4FA0;
              v123[4] = v118;
              v124 = v37;
              v125 = v31;
              v126 = v116;
              objc_msgSend_enumerateTokensInTopTranscriptionPathWithBlock_(v72, v110, (uint64_t)v123, v111, v112, v113);

            }
          }

        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v138, (uint64_t)v144, 16, v29);
      }
      while (v24);
    }

  }
  return v116;
}

- (NSArray)foundItems
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
  v14 = sub_1BE7D8778;
  v15 = sub_1BE7D8788;
  v16 = 0;
  objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE7D8790;
  v10[3] = &unk_1E77F23B0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v8;
}

- (NSSet)validSuffixes
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
  v14 = sub_1BE7D8778;
  v15 = sub_1BE7D8788;
  v16 = 0;
  objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE7D8894;
  v10[3] = &unk_1E77F23B0;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSSet *)v8;
}

- (void)setValidSuffixes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  id v11;
  _QWORD block[5];
  id v13;

  v4 = a3;
  objc_msgSend_processingQueue(self, v5, v6, v7, v8, v9);
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1BE7D8958;
  block[3] = &unk_1E77F2428;
  block[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_sync(v10, block);

}

- (BOOL)q_resultWantedForCompleteness:(int64_t)a3
{
  return a3 == 2;
}

- (BOOL)q_doesQueryResultDependOnDeclaredVariables
{
  return 0;
}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_prefix(self, a2, v2, v3, v4, v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(v7, v9, (uint64_t)CFSTR("Prefix data Query %p for prefix %@"), v10, v11, v12, self, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)prefix
{
  return self->_prefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefix, 0);
  objc_storeStrong((id *)&self->_queryDelimiters, 0);
  objc_storeStrong((id *)&self->_validSuffixes, 0);
  objc_storeStrong((id *)&self->_foundItems, 0);
}

@end
