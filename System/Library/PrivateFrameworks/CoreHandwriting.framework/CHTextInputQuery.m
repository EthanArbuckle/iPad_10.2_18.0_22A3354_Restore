@implementation CHTextInputQuery

- (CHTextInputQuery)initWithRecognitionSession:(id)a3
{
  CHTextInputQuery *v3;
  NSArray *v4;
  NSArray *availableItems;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)CHTextInputQuery;
  v3 = -[CHQuery initWithRecognitionSession:](&v22, sel_initWithRecognitionSession_, a3);
  if (v3)
  {
    v4 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99D20]);
    availableItems = v3->_availableItems;
    v3->_availableItems = v4;

    objc_msgSend_setPreferredUpdatesInterval_(v3, v6, v7, v8, v9, v10, 0.3);
    objc_msgSend_recognitionSession(v3, v11, v12, v13, v14, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActiveTextInputQuery_(v16, v17, (uint64_t)v3, v18, v19, v20);

  }
  return v3;
}

- (void)dealloc
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
  uint64_t v12;
  CHTextInputQuery *v13;
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
  objc_super v24;

  objc_msgSend_recognitionSession(self, a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_activeTextInputQuery(v7, v8, v9, v10, v11, v12);
  v13 = (CHTextInputQuery *)objc_claimAutoreleasedReturnValue();

  if (v13 == self)
  {
    objc_msgSend_recognitionSession(self, v14, v15, v16, v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setActiveTextInputQuery_(v19, v20, 0, v21, v22, v23);

  }
  v24.receiver = self;
  v24.super_class = (Class)CHTextInputQuery;
  -[CHQuery dealloc](&v24, sel_dealloc);
}

- (void)q_updateQueryResult
{
  CHTextInputQuery *v2;
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSArray *v15;
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
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
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
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
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
  uint64_t v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  CHTextInputQueryItem *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  id v119;
  id v120;
  id v121;
  id v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  NSNumber *itemIdentifier;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  NSNumber *itemStableIdentifier;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  NSArray *strokeIdentifiers;
  NSObject *v144;
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
  uint64_t v155;
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
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  NSArray *availableItems;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  void *v181;
  void *v182;
  id obj;
  NSArray *v184;
  void *v185;
  CHTextInputQuery *v186;
  uint64_t v187;
  uint64_t v188;
  void *v189;
  void *v190;
  __int128 v191;
  objc_super v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  objc_super v197;
  uint8_t buf[4];
  void *v199;
  __int16 v200;
  void *v201;
  __int16 v202;
  void *v203;
  __int16 v204;
  uint64_t v205;
  _QWORD v206[4];

  v2 = self;
  v206[1] = *MEMORY[0x1E0C80C00];
  v192.receiver = self;
  v192.super_class = (Class)CHTextInputQuery;
  -[CHQuery q_updateQueryResult](&v192, sel_q_updateQueryResult);
  objc_msgSend_q_sessionResult(v2, v3, v4, v5, v6, v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v14 = v8;
  if (!v2)
  {
    v15 = 0;

    if (qword_1EF568E88 == -1)
      goto LABEL_18;
    goto LABEL_28;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12, v13);
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(v14, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroups(v21, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = (void *)MEMORY[0x1E0CB3928];
  NSStringFromSelector(sel_ancestorIdentifier);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortDescriptorWithKey_ascending_(v28, v30, (uint64_t)v29, 1, v31, v32);
  v33 = objc_claimAutoreleasedReturnValue();

  v181 = (void *)v33;
  v206[0] = v33;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v34, (uint64_t)v206, 1, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v182 = v27;
  objc_msgSend_sortedArrayUsingDescriptors_(v27, v38, (uint64_t)v37, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  v195 = 0u;
  v196 = 0u;
  v193 = 0u;
  v194 = 0u;
  obj = v42;
  v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v43, (uint64_t)&v193, (uint64_t)buf, 16, v44);
  if (v188)
  {
    v187 = *(_QWORD *)v194;
    v185 = v14;
    v186 = v2;
    v184 = v15;
    do
    {
      for (i = 0; i != v188; ++i)
      {
        if (*(_QWORD *)v194 != v187)
          objc_enumerationMutation(obj);
        v55 = *(void **)(*((_QWORD *)&v193 + 1) + 8 * i);
        v56 = (void *)MEMORY[0x1E0CB37E8];
        v57 = objc_msgSend_uniqueIdentifier(v55, v45, v46, v47, v48, v49);
        objc_msgSend_numberWithInteger_(v56, v58, v57, v59, v60, v61);
        v190 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = (void *)objc_opt_class();
        objc_msgSend_queryItemStableIdentifierForStrokeGroup_(v62, v63, (uint64_t)v55, v64, v65, v66);
        v189 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = objc_msgSend_uniqueIdentifier(v55, v67, v68, v69, v70, v71);
        objc_msgSend_textCorrectionResultForStrokeGroupIdentifier_(v14, v73, v72, v74, v75, v76);
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        v83 = v77;
        if (v77)
        {
          objc_msgSend_inputStrokeIdentifiers(v77, v78, v79, v80, v81, v82);
          v89 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          objc_msgSend_strokeIdentifiers(v55, v78, v79, v80, v81, v82);
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_allObjects(v90, v91, v92, v93, v94, v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_sortedArrayUsingComparator_(v96, v97, (uint64_t)&unk_1E77F18D0, v98, v99, v100);
          v89 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend_recognitionSession(v2, v84, v85, v86, v87, v88);
        v101 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_latestStrokeProvider(v101, v102, v103, v104, v105, v106);
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeIdentifiersForData_withStrokeProvider_(CHStrokeUtilities, v108, (uint64_t)v89, (uint64_t)v107, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();

        if (v111)
        {
          v112 = [CHTextInputQueryItem alloc];
          objc_msgSend_textCorrectionResult(v83, v113, v114, v115, v116, v117);
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = v190;
          v120 = v189;
          v121 = v111;
          v122 = v118;
          if (v112)
          {
            v197.receiver = v112;
            v197.super_class = (Class)CHTextInputQueryItem;
            v112 = -[CHQuery init](&v197, sel_init);
            if (v112)
            {
              v128 = objc_msgSend_copy(v119, v123, v124, v125, v126, v127);
              itemIdentifier = v112->_itemIdentifier;
              v112->_itemIdentifier = (NSNumber *)v128;

              v135 = objc_msgSend_copy(v120, v130, v131, v132, v133, v134);
              itemStableIdentifier = v112->_itemStableIdentifier;
              v112->_itemStableIdentifier = (NSNumber *)v135;

              v142 = objc_msgSend_copy(v121, v137, v138, v139, v140, v141);
              strokeIdentifiers = v112->_strokeIdentifiers;
              v112->_strokeIdentifiers = (NSArray *)v142;

              objc_storeStrong((id *)&v112->_correctionResult, v118);
            }
          }

          v15 = v184;
          objc_msgSend_addObject_(v184, v51, (uint64_t)v112, v52, v53, v54);

          v14 = v185;
          v2 = v186;
        }

      }
      v188 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v45, (uint64_t)&v193, (uint64_t)buf, 16, v49);
    }
    while (v188);
  }

  if (qword_1EF568E88 != -1)
LABEL_28:
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
LABEL_18:
  v144 = (id)qword_1EF568E28;
  if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend_debugName(v2, v145, v146, v147, v148, v149);
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_recognitionSession(v2, v151, v152, v153, v154, v155);
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeProviderVersion(v14, v157, v158, v159, v160, v161);
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    v168 = objc_msgSend_count(v15, v163, v164, v165, v166, v167);
    *(_DWORD *)buf = 138413058;
    v199 = v150;
    v200 = 2048;
    v201 = v156;
    v202 = 2112;
    v203 = v162;
    v204 = 2048;
    v205 = v168;
    _os_log_impl(&dword_1BE607000, v144, OS_LOG_TYPE_DEBUG, "%@: finished update for session %p, version %@. %ld item(s) available.", buf, 0x2Au);

  }
  if (v14)
  {
    objc_msgSend_generationDuration(v14, v169, v170, v171, v172, v173);
    if (!v2)
      goto LABEL_26;
  }
  else
  {
    v191 = 0u;
    if (!v2)
      goto LABEL_26;
  }
  v2->_totalDuration = *((double *)&v191 + 1);
  if (v2->_availableItems != v15)
  {
    v174 = objc_msgSend_copy(v15, v169, v170, v171, v172, v173);
    availableItems = v2->_availableItems;
    v2->_availableItems = (NSArray *)v174;

    objc_msgSend_q_queryResultDidChange(v2, v176, v177, v178, v179, v180);
  }
LABEL_26:

}

- (NSArray)availableItems
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
  v14 = sub_1BE7B85B0;
  v15 = sub_1BE7B85C0;
  v16 = 0;
  objc_msgSend_processingQueue(self, a2, v2, v3, v4, v5);
  v7 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1BE7B85C8;
  v10[3] = &unk_1E77F2290;
  v10[4] = self;
  v10[5] = &v11;
  dispatch_sync(v7, v10);

  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return (NSArray *)v8;
}

- (id)debugName
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  return (id)objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], a2, (uint64_t)CFSTR("Text Input Query %p"), v2, v3, v4, self);
}

- (CHTextInputQueryTargetDataSource)textInputTargetsDataSource
{
  return (CHTextInputQueryTargetDataSource *)objc_loadWeakRetained((id *)&self->_textInputTargetsDataSource);
}

- (void)setTextInputTargetsDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_textInputTargetsDataSource, a3);
}

- (double)totalDuration
{
  return self->_totalDuration;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_textInputTargetsDataSource);
  objc_storeStrong((id *)&self->_availableItems, 0);
}

+ (id)queryItemStableIdentifierForStrokeGroup:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = objc_msgSend_ancestorIdentifier(a3, a2, (uint64_t)a3, v3, v4, v5);
  return (id)objc_msgSend_numberWithInteger_(v6, v8, v7, v9, v10, v11);
}

@end
