@implementation CHRecognitionSessionResult

- (CHRecognitionSessionResult)init
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

- (CHRecognitionSessionResult)initWithStrokeProviderVersion:(id)a3 encodedStrokeProviderVersion:(id)a4 orderedStrokeIdentifiers:(id)a5 sessionMode:(int64_t)a6 locales:(id)a7 preferredLocales:(id)a8 declaredVariables:(id)a9 clutterFilter:(id)a10 strokeClassificationResult:(id)a11 strokeGroupingResult:(id)a12 rawStrokeGroupingResult:(id)a13 recognitionResults:(id)a14 rawRecognitionResults:(id)a15 inlineContinuousModeResults:(id)a16 autoRefineResult:(id)a17 generationDuration:(id *)a18 recognitionEnvironment:(int64_t)a19
{
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  CHRecognitionSessionResult *v28;
  CHRecognitionSessionResult *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSArray *locales;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  NSArray *preferredLocales;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSSet *declaredVariables;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  NSDictionary *recognitionResultsByGroupID;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSDictionary *rawRecognitionResultsByGroupID;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  NSDictionary *textCorrectionResultsByGroupID;
  __int128 v72;
  __int128 v73;
  id v76;
  id v77;
  id v80;
  id v81;
  id v82;
  id v83;
  id v84;
  id v85;
  id v86;
  id v87;
  id v88;
  objc_super v89;

  v86 = a3;
  v76 = a4;
  v85 = a4;
  v77 = a5;
  v84 = a5;
  v88 = a7;
  v23 = a8;
  v24 = a9;
  v83 = a10;
  v82 = a11;
  v81 = a12;
  v25 = a13;
  v87 = a14;
  v26 = a15;
  v27 = a16;
  v80 = a17;
  v89.receiver = self;
  v89.super_class = (Class)CHRecognitionSessionResult;
  v28 = -[CHRecognitionSessionResult init](&v89, sel_init);
  v29 = v28;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_strokeProviderVersion, a3);
    objc_storeStrong((id *)&v29->_encodedStrokeProviderVersion, v76);
    objc_storeStrong((id *)&v29->_orderedStrokeIdentifiers, v77);
    v29->_sessionMode = a6;
    v35 = objc_msgSend_copy(v88, v30, v31, v32, v33, v34);
    locales = v29->_locales;
    v29->_locales = (NSArray *)v35;

    v42 = objc_msgSend_copy(v23, v37, v38, v39, v40, v41);
    preferredLocales = v29->_preferredLocales;
    v29->_preferredLocales = (NSArray *)v42;

    v49 = objc_msgSend_copy(v24, v44, v45, v46, v47, v48);
    declaredVariables = v29->_declaredVariables;
    v29->_declaredVariables = (NSSet *)v49;

    objc_storeStrong((id *)&v29->_strokeClassificationResult, a11);
    objc_storeStrong((id *)&v29->_strokeGroupingResult, a12);
    objc_storeStrong((id *)&v29->_rawStrokeGroupingResult, a13);
    v56 = objc_msgSend_copy(v87, v51, v52, v53, v54, v55);
    recognitionResultsByGroupID = v29->_recognitionResultsByGroupID;
    v29->_recognitionResultsByGroupID = (NSDictionary *)v56;

    v63 = objc_msgSend_copy(v26, v58, v59, v60, v61, v62);
    rawRecognitionResultsByGroupID = v29->_rawRecognitionResultsByGroupID;
    v29->_rawRecognitionResultsByGroupID = (NSDictionary *)v63;

    v70 = objc_msgSend_copy(v27, v65, v66, v67, v68, v69);
    textCorrectionResultsByGroupID = v29->_textCorrectionResultsByGroupID;
    v29->_textCorrectionResultsByGroupID = (NSDictionary *)v70;

    objc_storeStrong((id *)&v29->_autoRefineResult, a17);
    v72 = *(_OWORD *)&a18->var0;
    v73 = *(_OWORD *)&a18->var4;
    *(_OWORD *)&v29->_generationDuration.groupingDuration = *(_OWORD *)&a18->var2;
    *(_OWORD *)&v29->_generationDuration.principalLinesDuration = v73;
    *(_OWORD *)&v29->_generationDuration.strokeClutterFilteringDuration = v72;
    v29->_recognitionEnvironment = a19;
    objc_storeStrong((id *)&v29->_clutterFilter, a10);
    v29->__shouldUseCachedCompleteness = 0;
    v29->_completeness = 0;
  }

  return v29;
}

- (CHRecognitionSessionResult)initWithResult:(id)a3 validStrokes:(id)a4
{

  return 0;
}

- (id)description
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
  void *v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
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
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  objc_super v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend_locales(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v65, (uint64_t)v69, 16, v15);
  if (v21)
  {
    v22 = *(_QWORD *)v66;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v66 != v22)
          objc_enumerationMutation(v13);
        objc_msgSend_localeIdentifier(*(void **)(*((_QWORD *)&v65 + 1) + 8 * v23), v16, v17, v18, v19, v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v7, v25, (uint64_t)v24, v26, v27, v28);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v65, (uint64_t)v69, 16, v20);
    }
    while (v21);
  }

  objc_msgSend_componentsJoinedByString_(v7, v29, (uint64_t)CFSTR("\", \"), v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v34, (uint64_t)CFSTR("\"%@\"), v35, v36, v37, v33);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v64.receiver = self;
  v64.super_class = (Class)CHRecognitionSessionResult;
  -[CHRecognitionSessionResult description](&v64, sel_description);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeProviderVersion(self, v40, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeClassificationResult(self, v46, v47, v48, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupingResult(self, v52, v53, v54, v55, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v39, v58, (uint64_t)CFSTR(" strokeProviderVersion: %@, locales: %@, strokeClassificationResult: %@, strokeGroupingResult: %@"), v59, v60, v61, v45, v38, v51, v57);
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  return v62;
}

- (id)debugDescription
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
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
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
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
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  id obj;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  _BYTE v101[128];
  uint64_t v102;

  v102 = *MEMORY[0x1E0C80C00];
  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v99 = 0u;
  v100 = 0u;
  v97 = 0u;
  v98 = 0u;
  objc_msgSend_strokeGroupingResult(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v13, v14, 0, 0, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v17;
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v97, (uint64_t)v101, 16, v19);
  if (v25)
  {
    v26 = *(_QWORD *)v98;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v98 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v97 + 1) + 8 * v27);
        objc_msgSend_recognitionResultsByGroupID(self, v20, v21, v22, v23, v24);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = (void *)MEMORY[0x1E0CB37E8];
        v36 = objc_msgSend_uniqueIdentifier(v28, v31, v32, v33, v34, v35);
        objc_msgSend_numberWithInteger_(v30, v37, v36, v38, v39, v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v29, v42, (uint64_t)v41, v43, v44, v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_textCorrectionResultsByGroupID(self, v47, v48, v49, v50, v51);
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = (void *)MEMORY[0x1E0CB37E8];
        v59 = objc_msgSend_uniqueIdentifier(v28, v54, v55, v56, v57, v58);
        objc_msgSend_numberWithInteger_(v53, v60, v59, v61, v62, v63);
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v52, v65, (uint64_t)v64, v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();

        v75 = objc_msgSend_uniqueIdentifier(v28, v70, v71, v72, v73, v74);
        objc_msgSend_appendFormat_(v7, v76, (uint64_t)CFSTR("  Group %ld: "), v77, v78, v79, v75);
        if (v46)
        {
          objc_msgSend_appendFormat_(v7, v80, (uint64_t)CFSTR("recognition: %@"), v81, v82, v83, v46);
          if (!v69)
            goto LABEL_11;
          objc_msgSend_appendString_(v7, v80, (uint64_t)CFSTR(" "), v81, v82, v83);
        }
        else if (!v69)
        {
          goto LABEL_11;
        }
        objc_msgSend_appendFormat_(v7, v80, (uint64_t)CFSTR("textCorrection: %@"), v81, v82, v83, v69);
LABEL_11:
        objc_msgSend_appendString_(v7, v80, (uint64_t)CFSTR("\n"), v81, v82, v83);

        ++v27;
      }
      while (v25 != v27);
      v17 = obj;
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v20, (uint64_t)&v97, (uint64_t)v101, 16, v24);
    }
    while (v25);
  }

  objc_msgSend_description(self, v84, v85, v86, v87, v88);
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByAppendingFormat_(v89, v90, (uint64_t)CFSTR("Group Results: \n%@"), v91, v92, v93, v7);
  v94 = (void *)objc_claimAutoreleasedReturnValue();

  return v94;
}

- (NSString)highConfidenceDebugDescription
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
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  objc_msgSend_strokeGroupingResult(self, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v13, v14, 0, 1, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v46, (uint64_t)v50, 16, v19);
  if (v25)
  {
    v26 = *(_QWORD *)v47;
    do
    {
      v27 = 0;
      do
      {
        if (*(_QWORD *)v47 != v26)
          objc_enumerationMutation(v17);
        v28 = objc_msgSend_uniqueIdentifier(*(void **)(*((_QWORD *)&v46 + 1) + 8 * v27), v20, v21, v22, v23, v24);
        objc_msgSend_recognitionResultForStrokeGroupIdentifier_(self, v29, v28, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_highConfidenceTextForSessionResult_averageTokenScore_rejectionRate_doesContainUnfilteredMultiLocaleResults_(v33, v34, (uint64_t)self, 0, 0, 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_length(v35, v36, v37, v38, v39, v40))
          objc_msgSend_appendFormat_(v7, v41, (uint64_t)CFSTR("%@\n"), v42, v43, v44, v35);

        ++v27;
      }
      while (v25 != v27);
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v46, (uint64_t)v50, 16, v24);
    }
    while (v25);
  }

  return (NSString *)v7;
}

- (NSString)allResultsDebugDescription
{
  return (NSString *)sub_1BE6B9B28(self, 0, 0);
}

- (NSArray)allResultsDebugDescriptionByGroup
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v7;
  id v8;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], a2, v2, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = sub_1BE6B9B28(self, v7, &unk_1E77F1610);
  return (NSArray *)v7;
}

- (id)allResultsDebugDescriptionWithGroupHeaderBlock:(id)a3
{
  sub_1BE6B9B28(self, 0, a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)allMathResultsDebugDescriptionWithGroupHeaderBlock:(id)a3
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
  void *v14;
  const char *v15;
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
  const char *v27;
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
  uint64_t v43;
  void *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  BOOL v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  const char *v118;
  uint64_t v119;
  void *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const __CFString *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  BOOL v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  void *v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
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
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  void *v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  BOOL v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  void *v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  id v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  void *v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  void *v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  char isEqualToIndexSet;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  const __CFString *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  __CFString *v256;
  id obj;
  uint64_t v259;
  uint64_t v260;
  CHRecognitionSessionResult *v261;
  void *v262;
  uint64_t v263;
  void (**v264)(id, void *);
  void *v265;
  uint64_t i;
  void *v267;
  _QWORD v268[4];
  id v269;
  uint64_t *v270;
  uint64_t *v271;
  uint64_t v272;
  uint64_t *v273;
  uint64_t v274;
  char v275;
  uint64_t v276;
  uint64_t *v277;
  uint64_t v278;
  char v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  _BYTE v288[128];
  _BYTE v289[128];
  uint64_t v290;

  v290 = *MEMORY[0x1E0C80C00];
  v264 = (void (**)(id, void *))a3;
  objc_msgSend_string(MEMORY[0x1E0CB37A0], v4, v5, v6, v7, v8);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v286 = 0u;
  v287 = 0u;
  v284 = 0u;
  v285 = 0u;
  v261 = self;
  objc_msgSend_strokeGroupingResult(self, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(v14, v15, 0, 1, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  obj = v18;
  v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v284, (uint64_t)v289, 16, v20);
  if (!v263)
  {

LABEL_36:
    v256 = &stru_1E77F6F28;
    goto LABEL_37;
  }
  v259 = 0;
  v260 = *(_QWORD *)v285;
  do
  {
    for (i = 0; i != v263; ++i)
    {
      if (*(_QWORD *)v285 != v260)
        objc_enumerationMutation(obj);
      v267 = *(void **)(*((_QWORD *)&v284 + 1) + 8 * i);
      v26 = objc_msgSend_uniqueIdentifier(v267, v21, v22, v23, v24, v25);
      objc_msgSend_recognitionResultForStrokeGroupIdentifier_(v261, v27, v26, v28, v29, v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_string(MEMORY[0x1E0CB37A0], v32, v33, v34, v35, v36);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v264 || (v264[2](v264, v267), (v43 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        v44 = (void *)MEMORY[0x1E0CB3940];
        v45 = objc_msgSend_uniqueIdentifier(v267, v37, v38, v39, v40, v41);
        objc_msgSend_stringWithFormat_(v44, v46, (uint64_t)CFSTR("GroupID %ld"), v47, v48, v49, v45);
        v43 = objc_claimAutoreleasedReturnValue();
      }
      objc_msgSend_appendFormat_(v42, v37, (uint64_t)CFSTR("%@: {\n  "), v39, v40, v41, v43);
      v265 = (void *)v43;
      objc_msgSend_mathResult(v31, v50, v51, v52, v53, v54);
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v60)
        goto LABEL_21;
      objc_msgSend_mathResult(v31, v55, v56, v57, v58, v59);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_transcriptionPaths(v61, v62, v63, v64, v65, v66);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v73 = objc_msgSend_count(v67, v68, v69, v70, v71, v72) == 0;

      if (v73)
      {
LABEL_21:
        objc_msgSend_appendFormat_(v42, v55, (uint64_t)CFSTR("%@"), v57, v58, v59, CFSTR("<NO RESULT>\n"));
      }
      else
      {
        v282 = 0u;
        v283 = 0u;
        v281 = 0u;
        v280 = 0u;
        objc_msgSend_mathResult(v31, v55, v74, v57, v58, v59);
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_transcriptionPaths(v75, v76, v77, v78, v79, v80);
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v82, (uint64_t)&v280, (uint64_t)v288, 16, v83);
        if (v89)
        {
          v90 = *(_QWORD *)v281;
          do
          {
            for (j = 0; j != v89; ++j)
            {
              if (*(_QWORD *)v281 != v90)
                objc_enumerationMutation(v81);
              v92 = *(void **)(*((_QWORD *)&v280 + 1) + 8 * j);
              objc_msgSend_mathResult(v31, v84, v85, v86, v87, v88);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_transcriptionPaths(v93, v94, v95, v96, v97, v98);
              v99 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_lastObject(v99, v100, v101, v102, v103, v104);
              v105 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend_mathResult(v31, v106, v107, v108, v109, v110);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              v117 = objc_msgSend_length(v92, v112, v113, v114, v115, v116);
              objc_msgSend_transcriptionWithPath_columnRange_(v111, v118, (uint64_t)v92, 0, v117, v119);
              v120 = (void *)objc_claimAutoreleasedReturnValue();

              v125 = CFSTR("\n");
              if (v92 != v105)
                v125 = CFSTR(", ");
              objc_msgSend_appendFormat_(v42, v121, (uint64_t)CFSTR("\"%@\"%@"), v122, v123, v124, v120, v125);

            }
            v89 = objc_msgSend_countByEnumeratingWithState_objects_count_(v81, v84, (uint64_t)&v280, (uint64_t)v288, 16, v88);
          }
          while (v89);
        }

        ++v259;
      }
      objc_msgSend_appendFormat_(v42, v126, (uint64_t)CFSTR("},\n"), v127, v128, v129);
      objc_msgSend_mathResult(v31, v130, v131, v132, v133, v134);
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = v135 == 0;

      if (!v136)
      {
        objc_msgSend_mathResult(v31, v137, v138, v139, v140, v141);
        v142 = (void *)objc_claimAutoreleasedReturnValue();
        v143 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend_absoluteProbability(v142, v144, v145, v146, v147, v148);
        v150 = v149;
        objc_msgSend_score(v142, v151, v152, v153, v154, v155);
        objc_msgSend_stringWithFormat_(v143, v156, (uint64_t)CFSTR("(%.3f, %.3f)"), v157, v158, v159, v150, v160);
        v161 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendFormat_(v42, v162, (uint64_t)CFSTR("Result score: %@\n"), v163, v164, v165, v161);
        objc_msgSend_mathResult(v31, v166, v167, v168, v169, v170);
        v171 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_selectedTranscriptionPathIndex(v171, v172, v173, v174, v175, v176);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        v178 = v177 == 0;

        if (!v178)
        {
          objc_msgSend_mathResult(v31, v179, v180, v181, v182, v183);
          v184 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_selectedTranscriptionPathIndex(v184, v185, v186, v187, v188, v189);
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v42, v191, (uint64_t)CFSTR("Selected transcription index: %@\n"), v192, v193, v194, v190);

        }
        v276 = 0;
        v277 = &v276;
        v278 = 0x2020000000;
        v279 = 0;
        v272 = 0;
        v273 = &v272;
        v274 = 0x2020000000;
        v275 = 0;
        objc_msgSend_indexSet(MEMORY[0x1E0CB3788], v179, v180, v181, v182, v183);
        v195 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_mathResult(v31, v196, v197, v198, v199, v200);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        v268[0] = MEMORY[0x1E0C809B0];
        v268[1] = 3221225472;
        v268[2] = sub_1BE6BAD24;
        v268[3] = &unk_1E77F3288;
        v202 = v195;
        v269 = v202;
        v270 = &v276;
        v271 = &v272;
        objc_msgSend_enumerateTokensInPreferredTranscriptionPathWithBlock_(v201, v203, (uint64_t)v268, v204, v205, v206);

        v207 = (void *)MEMORY[0x1E0CB36B8];
        objc_msgSend_strokeIdentifiers(v267, v208, v209, v210, v211, v212);
        v213 = (void *)objc_claimAutoreleasedReturnValue();
        v219 = objc_msgSend_count(v213, v214, v215, v216, v217, v218);
        objc_msgSend_indexSetWithIndexesInRange_(v207, v220, 0, v219, v221, v222);
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        isEqualToIndexSet = objc_msgSend_isEqualToIndexSet_(v202, v224, (uint64_t)v223, v225, v226, v227);

        if ((isEqualToIndexSet & 1) == 0)
        {
          objc_msgSend_strokeIdentifiers(v267, v229, v230, v231, v232, v233);
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          v240 = objc_msgSend_count(v234, v235, v236, v237, v238, v239);
          objc_msgSend_description(v202, v241, v242, v243, v244, v245);
          v246 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_appendFormat_(v42, v247, (uint64_t)CFSTR("ERROR: Not all %lu strokes covered in the result. Coverage: %@\n"), v248, v249, v250, v240, v246);

        }
        v251 = CFSTR("ERROR: Evaluation trigger ('=' or '\\hline') has no strokes assigned.\n");
        if (*((_BYTE *)v277 + 24)
          || (v251 = CFSTR("WARNING: Some ink elements have no strokes assigned.\n"), *((_BYTE *)v273 + 24)))
        {
          objc_msgSend_appendString_(v42, v229, (uint64_t)v251, v231, v232, v233);
        }

        _Block_object_dispose(&v272, 8);
        _Block_object_dispose(&v276, 8);

      }
      objc_msgSend_appendString_(v42, v137, (uint64_t)CFSTR("\n"), v139, v140, v141);
      objc_msgSend_appendString_(v262, v252, (uint64_t)v42, v253, v254, v255);

    }
    v263 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v284, (uint64_t)v289, 16, v25);
  }
  while (v263);

  if (!v259)
    goto LABEL_36;
  v256 = v262;
LABEL_37:

  return v256;
}

- (id)recognitionResultForStrokeGroupIdentifier:(int64_t)a3
{
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
  void *v17;

  objc_msgSend_recognitionResultsByGroupID(self, a2, a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, a3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v13, (uint64_t)v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)rawRecognitionResultForStrokeGroupIdentifier:(int64_t)a3
{
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
  void *v17;

  objc_msgSend_rawRecognitionResultsByGroupID(self, a2, a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, a3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v13, (uint64_t)v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)textCorrectionResultForStrokeGroupIdentifier:(int64_t)a3
{
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
  void *v17;

  objc_msgSend_textCorrectionResultsByGroupID(self, a2, a3, v3, v4, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v8, a3, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v7, v13, (uint64_t)v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)isValidForStrokes:(id)a3
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
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  id v33;
  const char *v34;
  uint64_t v35;
  BOOL v36;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend_strokeGroupingResult(self, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroups(v10, v11, v12, v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allObjects(v16, v17, v18, v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v23 = v4;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v39, (uint64_t)v43, 16, v25);
  if (v26)
  {
    v27 = *(_QWORD *)v40;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v40 != v27)
          objc_enumerationMutation(v23);
        v29 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
        v38 = 0x7FFFFFFFFFFFFFFFLL;
        v30 = (void *)objc_opt_class();
        v33 = (id)objc_msgSend_strokeGroupContainingStrokeIdentifier_strokeGroups_foundStrokeGroupIndex_(v30, v31, v29, (uint64_t)v22, (uint64_t)&v38, v32);
        if (v38 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v36 = 0;
          goto LABEL_11;
        }
      }
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v34, (uint64_t)&v39, (uint64_t)v43, 16, v35);
      if (v26)
        continue;
      break;
    }
  }
  v36 = 1;
LABEL_11:

  return v36;
}

- (id)fullyCoveredStrokeGroupsForContextStrokes:(id)a3 partiallyCoveredStrokeGroups:(id *)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  const char *v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  const char *v34;
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
  void *v53;
  const char *v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t j;
  void *v64;
  void *v65;
  id v66;
  const char *v67;
  uint64_t v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char v90;
  id v93;
  id obj;
  id v95;
  void *v96;
  void *v97;
  void *v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _BYTE v111[128];
  _BYTE v112[128];
  _BYTE v113[128];
  uint64_t v114;

  v114 = *MEMORY[0x1E0C80C00];
  v93 = a3;
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(self->_strokeGroupingResult, v5, 0, 0, v6, v7);
  v98 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  objc_msgSend_strokeIdentifierToGroupIndexMappingForStrokeIdentifiers_orderedStrokeGroups_(v8, v9, (uint64_t)v93, (uint64_t)v98, v10, v11);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_set(MEMORY[0x1E0C99E20], v12, v13, v14, v15, v16);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v109 = 0u;
  v110 = 0u;
  v107 = 0u;
  v108 = 0u;
  v17 = v93;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v107, (uint64_t)v113, 16, v19);
  if (v24)
  {
    v25 = *(_QWORD *)v108;
    do
    {
      for (i = 0; i != v24; ++i)
      {
        if (*(_QWORD *)v108 != v25)
          objc_enumerationMutation(v17);
        objc_msgSend_objectForKey_(v96, v20, *(_QWORD *)(*((_QWORD *)&v107 + 1) + 8 * i), v21, v22, v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend_integerValue(v27, v28, v29, v30, v31, v32);

        objc_msgSend_objectAtIndexedSubscript_(v98, v34, v33, v35, v36, v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v97, v39, (uint64_t)v38, v40, v41, v42);

      }
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v107, (uint64_t)v113, 16, v23);
    }
    while (v24);
  }

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v43, v44, v45, v46, v47);
  v95 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v48, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v105 = 0u;
  v106 = 0u;
  v103 = 0u;
  v104 = 0u;
  obj = v97;
  v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v54, (uint64_t)&v103, (uint64_t)v112, 16, v55);
  if (v61)
  {
    v62 = *(_QWORD *)v104;
    do
    {
      for (j = 0; j != v61; ++j)
      {
        if (*(_QWORD *)v104 != v62)
          objc_enumerationMutation(obj);
        v64 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * j);
        objc_msgSend_strokeIdentifiers(v64, v56, v57, v58, v59, v60);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v101 = 0u;
        v102 = 0u;
        v99 = 0u;
        v100 = 0u;
        v66 = v65;
        v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v67, (uint64_t)&v99, (uint64_t)v111, 16, v68);
        if (v73)
        {
          v74 = *(_QWORD *)v100;
LABEL_15:
          v75 = 0;
          while (1)
          {
            if (*(_QWORD *)v100 != v74)
              objc_enumerationMutation(v66);
            if ((objc_msgSend_containsObject_(v17, v69, *(_QWORD *)(*((_QWORD *)&v99 + 1) + 8 * v75), v70, v71, v72) & 1) == 0)
              break;
            if (v73 == ++v75)
            {
              v73 = objc_msgSend_countByEnumeratingWithState_objects_count_(v66, v69, (uint64_t)&v99, (uint64_t)v111, 16, v72);
              if (v73)
                goto LABEL_15;
              goto LABEL_21;
            }
          }

          v90 = objc_msgSend_containsObject_(v53, v86, (uint64_t)v64, v87, v88, v89);
          v85 = v53;
          if ((v90 & 1) != 0)
            goto LABEL_25;
LABEL_24:
          objc_msgSend_addObject_(v85, v80, (uint64_t)v64, v81, v82, v83);
          goto LABEL_25;
        }
LABEL_21:

        v84 = objc_msgSend_containsObject_(v95, v76, (uint64_t)v64, v77, v78, v79);
        v85 = v95;
        if ((v84 & 1) == 0)
          goto LABEL_24;
LABEL_25:

      }
      v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v103, (uint64_t)v112, 16, v60);
    }
    while (v61);
  }

  if (a4)
    *a4 = objc_retainAutorelease(v53);

  return v95;
}

- (id)forcedCachedContextualResultCoveringStrokes:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
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
  BOOL v43;
  NSDictionary *recognitionResultsByGroupID;
  void *v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  BOOL v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  NSObject *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  unint64_t v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  _BOOL4 v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  NSObject *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  const char *v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  unint64_t v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  _BOOL4 v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  void *v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  void *v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  id v222;
  const char *v223;
  uint64_t v224;
  const char *v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t i;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  void *v236;
  const char *v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t Index;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t j;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  void *v275;
  const char *v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  void *v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  void *v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  CHContextualTextResult *v293;
  const char *v294;
  uint64_t v295;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  __int128 v310;
  uint8_t v311[128];
  uint8_t buf[4];
  uint64_t v313;
  __int16 v314;
  uint64_t v315;
  _BYTE v316[128];
  uint64_t v317;

  v317 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v300 = v4;
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(self->_strokeGroupingResult, v5, 0, 0, v6, v7);
  v302 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_class();
  objc_msgSend_strokeIdentifierToGroupIndexMappingForStrokeIdentifiers_orderedStrokeGroups_(v8, v9, (uint64_t)v4, (uint64_t)v302, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v12, v13, v14, v15, v16, v17))
  {
    v236 = 0;
    goto LABEL_58;
  }
  v309 = 0u;
  v310 = 0u;
  v307 = 0u;
  v308 = 0u;
  v18 = v4;
  v21 = 0;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v307, (uint64_t)v316, 16, v20);
  if (v26)
  {
    v27 = *(_QWORD *)v308;
    do
    {
      v28 = 0;
      v29 = v21;
      do
      {
        if (*(_QWORD *)v308 != v27)
          objc_enumerationMutation(v18);
        v30 = v12;
        objc_msgSend_objectForKey_(v12, v22, *(_QWORD *)(*((_QWORD *)&v307 + 1) + 8 * v28), v23, v24, v25);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = objc_msgSend_integerValue(v31, v32, v33, v34, v35, v36);

        if (v29)
        {
          objc_msgSend_objectAtIndexedSubscript_(v302, v38, v37, v39, v40, v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = v29 == v42;

          if (!v43)
          {
            v236 = 0;
            goto LABEL_57;
          }
        }
        objc_msgSend_objectAtIndexedSubscript_(v302, v38, v37, v39, v40, v41);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        ++v28;
        v29 = v21;
        v12 = v30;
      }
      while (v26 != v28);
      v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v22, (uint64_t)&v307, (uint64_t)v316, 16, v25);
    }
    while (v26);
  }
  v30 = v12;

  recognitionResultsByGroupID = self->_recognitionResultsByGroupID;
  v45 = (void *)MEMORY[0x1E0CB37E8];
  v51 = objc_msgSend_uniqueIdentifier(v21, v46, v47, v48, v49, v50);
  objc_msgSend_numberWithInteger_(v45, v52, v51, v53, v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(recognitionResultsByGroupID, v57, (uint64_t)v56, v58, v59, v60);
  v298 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_preferredLocale(v298, v61, v62, v63, v64, v65);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v71)
  {
    v236 = 0;
    goto LABEL_56;
  }
  v297 = v71;
  objc_msgSend_recognitionResultsByLocale(v298, v66, v67, v68, v69, v70);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKeyedSubscript_(v72, v73, (uint64_t)v71, v74, v75, v76);
  v301 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_inputStrokeIdentifiers(v301, v77, v78, v79, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = objc_msgSend_count(v82, v83, v84, v85, v86, v87);
  objc_msgSend_strokeIndexes(v301, v89, v90, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v88 == objc_msgSend_count(v94, v95, v96, v97, v98, v99);

  if (!v100)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v106 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_strokeIndexes(v301, v107, v108, v109, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend_count(v112, v113, v114, v115, v116, v117);
      objc_msgSend_inputStrokeIdentifiers(v298, v119, v120, v121, v122, v123);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v130 = objc_msgSend_count(v124, v125, v126, v127, v128, v129);
      *(_DWORD *)buf = 134218240;
      v313 = v118;
      v314 = 2048;
      v315 = v130;
      _os_log_impl(&dword_1BE607000, v106, OS_LOG_TYPE_FAULT, "Mismatch between the strokes covered by a text result (%ld) vs its stroke group (%ld).", buf, 0x16u);

    }
  }
  objc_msgSend_inputStrokeIdentifiers(v298, v101, v102, v103, v104, v105);
  v131 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setInputStrokeIdentifiers_(v301, v132, (uint64_t)v131, v133, v134, v135);

  objc_msgSend_inputStrokeIdentifiers(v301, v136, v137, v138, v139, v140);
  v141 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = objc_msgSend_count(v141, v142, v143, v144, v145, v146);
  v153 = v147 < objc_msgSend_count(v18, v148, v149, v150, v151, v152);

  if (v153)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v159 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v159, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend_inputStrokeIdentifiers(v301, v160, v161, v162, v163, v164);
      v165 = (void *)objc_claimAutoreleasedReturnValue();
      v171 = objc_msgSend_count(v165, v166, v167, v168, v169, v170);
      v177 = objc_msgSend_count(v18, v172, v173, v174, v175, v176);
      *(_DWORD *)buf = 134218240;
      v313 = v171;
      v314 = 2048;
      v315 = v177;
      _os_log_impl(&dword_1BE607000, v159, OS_LOG_TYPE_FAULT, "The group has %ld strokes, but should contain at least as many strokes as the %ld strokes to cover", buf, 0x16u);

    }
  }
  objc_msgSend_inputStrokeIdentifiers(v301, v154, v155, v156, v157, v158);
  v178 = (void *)objc_claimAutoreleasedReturnValue();
  v184 = objc_msgSend_count(v178, v179, v180, v181, v182, v183);
  v190 = v184 > objc_msgSend_count(v18, v185, v186, v187, v188, v189);

  if (!v190)
    goto LABEL_55;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v191, v192, v193, v194, v195);
  v299 = (void *)objc_claimAutoreleasedReturnValue();
  v201 = 0;
  v202 = 0x7FFFFFFFFFFFFFFFLL;
  while (1)
  {
    if (v201 >= objc_msgSend_tokenColumnCount(v301, v196, v197, v198, v199, v200))
      goto LABEL_44;
    objc_msgSend_strokeIndexesForColumnsInRange_(v301, v203, v201, 1, v204, v205);
    v206 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_inputStrokeIdentifiers(v301, v207, v208, v209, v210, v211);
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectsAtIndexes_(v212, v213, (uint64_t)v206, v214, v215, v216);
    v217 = (void *)objc_claimAutoreleasedReturnValue();

    if (v202 != 0x7FFFFFFFFFFFFFFFLL)
      break;
    v305 = 0u;
    v306 = 0u;
    v303 = 0u;
    v304 = 0u;
    v222 = v217;
    v229 = objc_msgSend_countByEnumeratingWithState_objects_count_(v222, v223, (uint64_t)&v303, (uint64_t)v311, 16, v224);
    if (v229)
    {
      v230 = *(_QWORD *)v304;
      while (2)
      {
        for (i = 0; i != v229; ++i)
        {
          if (*(_QWORD *)v304 != v230)
            objc_enumerationMutation(v222);
          if ((objc_msgSend_containsObject_(v18, v225, *(_QWORD *)(*((_QWORD *)&v303 + 1) + 8 * i), v226, v227, v228) & 1) != 0)
          {

            v71 = v297;
            v202 = v201;
            goto LABEL_38;
          }
        }
        v229 = objc_msgSend_countByEnumeratingWithState_objects_count_(v222, v225, (uint64_t)&v303, (uint64_t)v311, 16, v228);
        if (v229)
          continue;
        break;
      }
    }

    v71 = v297;
    v202 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_39:

    ++v201;
  }
LABEL_38:
  objc_msgSend_addObjectsFromArray_(v299, v218, (uint64_t)v217, v219, v220, v221);
  if ((objc_msgSend_isEqualToArray_(v299, v232, (uint64_t)v18, v233, v234, v235) & 1) == 0)
    goto LABEL_39;

  if (v201 + 1 == v202)
  {
LABEL_44:
    v240 = v301;
    goto LABEL_54;
  }
  objc_msgSend_subResultWithColumnRange_(v301, v237, v202, v201 + 1 - v202, v238, v239);
  v240 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokenColumns(v240, v241, v242, v243, v244, v245);
  v246 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectAtIndexedSubscript_(v246, v247, 0, v248, v249, v250);
  v251 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeIndexes(v251, v252, v253, v254, v255, v256);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  Index = objc_msgSend_firstIndex(v257, v258, v259, v260, v261, v262);

  for (j = 1; j < objc_msgSend_tokenColumnCount(v240, v264, v265, v266, v267, v268) && Index > 0; ++j)
  {
    objc_msgSend_tokenColumns(v240, v270, v271, v272, v273, v274);
    v275 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectAtIndexedSubscript_(v275, v276, j, v277, v278, v279);
    v280 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeIndexes(v280, v281, v282, v283, v284, v285);
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    v292 = objc_msgSend_firstIndex(v286, v287, v288, v289, v290, v291);

    if (v292 < Index)
      Index = v292;
  }
  if (Index > 0)
    objc_msgSend_offsetAllStrokeIndexesBy_(v240, v270, -Index, v272, v273, v274);
  objc_msgSend_setInputStrokeIdentifiers_(v240, v270, (uint64_t)v299, v272, v273, v274);

LABEL_54:
  v301 = v240;
LABEL_55:
  v293 = [CHContextualTextResult alloc];
  v236 = (void *)objc_msgSend_initWithTextResult_terminatingSpecialCharacter_strokeGroup_(v293, v294, (uint64_t)v301, 0, (uint64_t)v21, v295);

LABEL_56:
  v18 = v298;
  v29 = v21;
LABEL_57:

  v12 = v30;
LABEL_58:

  return v236;
}

- (id)contextualResultsWithFullyCoveredStrokeGroups:(id)a3 partiallyCoveredStrokeGroups:(id)a4 drawingCanvasSize:(CGSize)a5
{
  double height;
  double width;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  unint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  NSDictionary *v47;
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
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  void *v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
  _BOOL4 v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  NSObject *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  NSDictionary *v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  void *v168;
  BOOL v169;
  const char *v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  NSObject *v182;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  BOOL v189;
  int v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  void *v201;
  NSDictionary *recognitionResultsByGroupID;
  void *v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  void *v214;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  void *v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  const char *v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  const char *v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  void *v242;
  void *v243;
  void *v244;
  BOOL v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  const char *v265;
  uint64_t v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  int v279;
  const char *v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  void *v288;
  const char *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  void *v299;
  const char *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  void *v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  const char *v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  BOOL v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  void *v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  const char *v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  void *v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  void *v341;
  const char *v342;
  uint64_t v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  BOOL v347;
  __CFString *v348;
  BOOL v349;
  double v350;
  __CFString *v351;
  __CFString *v352;
  const char *v353;
  uint64_t v354;
  uint64_t v355;
  uint64_t v356;
  char isEqualToString;
  const char *v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  __CFString *v363;
  const char *v364;
  uint64_t v365;
  uint64_t v366;
  uint64_t v367;
  const char *v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  CHContextualTextResult *v372;
  const char *v373;
  uint64_t v374;
  void *v375;
  const char *v376;
  uint64_t v377;
  uint64_t v378;
  uint64_t v379;
  id v380;
  id v381;
  unint64_t i;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  void *v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  const char *v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  uint64_t v396;
  uint64_t v397;
  NSObject *v398;
  const char *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  void *v404;
  const char *v405;
  uint64_t v406;
  uint64_t v407;
  uint64_t v408;
  uint64_t v409;
  uint64_t v410;
  void *v411;
  uint64_t v412;
  uint64_t v413;
  int v414;
  id v415;
  uint64_t v416;
  id v417;
  id v418;
  void *v419;
  CHRecognitionSessionResult *v420;
  void *v421;
  void *v422;
  void *v423;
  _QWORD v424[4];
  id v425;
  uint8_t buf[4];
  uint64_t v427;
  uint64_t v428;

  height = a5.height;
  width = a5.width;
  v428 = *MEMORY[0x1E0C80C00];
  v418 = a3;
  v417 = a4;
  objc_msgSend_textStrokeGroupClusters(self->_strokeGroupingResult, v9, v10, v11, v12, v13);
  v423 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_strokeGroupsSortedBy_textGroupsOnly_(self->_strokeGroupingResult, v14, 0, 1, v15, v16);
  v422 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_count(v422, v17, v18, v19, v20, v21))
  {
    v415 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_31;
  }
  v420 = self;
  v27 = objc_msgSend_count(v418, v22, v23, v24, v25, v26);
  v421 = 0;
  v33 = 0;
  v34 = 0;
  v35 = 0;
  v36 = 0;
  v412 = objc_msgSend_count(v417, v28, v29, v30, v31, v32) + v27;
  while (1)
  {
    if (v33)
    {
      if (!v421)
      {
        v421 = 0;
        if (qword_1EF568E88 != -1)
          goto LABEL_90;
        goto LABEL_27;
      }
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v37, v38, v39, v40, v41);
      v415 = (id)objc_claimAutoreleasedReturnValue();
      v416 = 0;
      if (v418)
        v189 = v417 == 0;
      else
        v189 = 1;
      v190 = !v189;
      v414 = v190;
      while (1)
      {
        if (v36 >= objc_msgSend_count(v422, v184, v185, v186, v187, v188))
          goto LABEL_30;
        if (v36 >= objc_msgSend_count(v422, v191, v192, v193, v194, v195) - 1)
        {
          v242 = 0;
          v419 = 0;
          goto LABEL_48;
        }
        objc_msgSend_objectAtIndexedSubscript_(v422, v196, v36 + 1, v198, v199, v200);
        v201 = (void *)objc_claimAutoreleasedReturnValue();
        recognitionResultsByGroupID = v420->_recognitionResultsByGroupID;
        v203 = (void *)MEMORY[0x1E0CB37E8];
        v419 = v201;
        v209 = objc_msgSend_uniqueIdentifier(v201, v204, v205, v206, v207, v208);
        objc_msgSend_numberWithInteger_(v203, v210, v209, v211, v212, v213);
        v214 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKey_(recognitionResultsByGroupID, v215, (uint64_t)v214, v216, v217, v218);
        v219 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_preferredLocale(v219, v220, v221, v222, v223, v224);
        v225 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(recognitionResultsByGroupID) = v225 == 0;

        if ((recognitionResultsByGroupID & 1) == 0)
        {
          objc_msgSend_preferredLocale(v219, v226, v227, v228, v229, v230);
          v231 = objc_claimAutoreleasedReturnValue();
          objc_msgSend_recognitionResultsByLocale(v219, v232, v233, v234, v235, v236);
          v237 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKeyedSubscript_(v237, v238, v231, v239, v240, v241);
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          v243 = (void *)v231;
          goto LABEL_47;
        }
        objc_msgSend_mathResult(v219, v226, v227, v228, v229, v230);
        v244 = (void *)objc_claimAutoreleasedReturnValue();
        v245 = v244 == 0;

        if (!v245)
          break;
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v398 = (id)qword_1EF568E18[0];
        if (os_log_type_enabled(v398, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend_inputStrokeIdentifiers(v219, v399, v400, v401, v402, v403);
          v404 = (void *)objc_claimAutoreleasedReturnValue();
          v410 = objc_msgSend_count(v404, v405, v406, v407, v408, v409);
          *(_DWORD *)buf = 134217984;
          v427 = v410;
          _os_log_impl(&dword_1BE607000, v398, OS_LOG_TYPE_ERROR, "Unexpected group recognition result (%ld strokes) found with no math result and no preferred locale. Skipping.", buf, 0xCu);

        }
        v380 = 0;
        ++v36;
        v381 = v419;
LABEL_77:

      }
      objc_msgSend_orderedLocales(v219, v246, v247, v248, v249, v250);
      v251 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_firstObject(v251, v252, v253, v254, v255, v256);
      v243 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_mathResult(v219, v257, v258, v259, v260, v261);
      v237 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v262, (uint64_t)v237, (uint64_t)v421, v263, v264);
      v242 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_47:

      objc_msgSend_inputStrokeIdentifiers(v219, v265, v266, v267, v268, v269);
      v270 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setInputStrokeIdentifiers_(v242, v271, (uint64_t)v270, v272, v273, v274);

      objc_msgSend_setLocale_(v242, v275, (uint64_t)v243, v276, v277, v278);
LABEL_48:
      if (v414
        && (v279 = objc_msgSend_containsObject_(v418, v196, (uint64_t)v35, v198, v199, v200),
            !(v279 | objc_msgSend_containsObject_(v417, v280, (uint64_t)v35, v281, v282, v283)))
        || !v33)
      {
LABEL_76:
        v380 = v242;

        v381 = v419;
        ++v36;
        v33 = v380;
        v35 = v381;
        goto LABEL_77;
      }
      if (v418)
      {
        v424[0] = MEMORY[0x1E0C809B0];
        v424[1] = 3221225472;
        v424[2] = sub_1BE6BCDF0;
        v424[3] = &unk_1E77F32B0;
        v425 = v35;
        v413 = objc_msgSend_indexOfObjectPassingTest_(v418, v284, (uint64_t)v424, v285, v286, v287);

        ++v416;
        if (!v242)
          goto LABEL_60;
      }
      else
      {
        v413 = 0x7FFFFFFFFFFFFFFFLL;
        ++v416;
        if (!v242)
          goto LABEL_60;
      }
      objc_msgSend_tokenColumns(v242, v196, v197, v198, v199, v200);
      v288 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend_count(v288, v289, v290, v291, v292, v293))
      {
        objc_msgSend_tokenColumns(v242, v294, v295, v296, v297, v298);
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v299, v300, v301, v302, v303, v304);
        v305 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_textTokenRows(v305, v306, v307, v308, v309, v310);
        v311 = (void *)objc_claimAutoreleasedReturnValue();
        v317 = objc_msgSend_count(v311, v312, v313, v314, v315, v316) == 0;

        if (!v317)
        {
          objc_msgSend_tokenColumns(v242, v196, v197, v198, v199, v200);
          v411 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v411, v318, v319, v320, v321, v322);
          v323 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_textTokenRows(v323, v324, v325, v326, v327, v328);
          v329 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v329, v330, v331, v332, v333, v334);
          v335 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v335, v336, v337, v338, v339, v340);
          v341 = (void *)objc_claimAutoreleasedReturnValue();
          v347 = (objc_msgSend_properties(v341, v342, v343, v344, v345, v346) & 0x80) == 0;

          v348 = CFSTR("\n");
          if (!v347)
          {
LABEL_75:
            v372 = [CHContextualTextResult alloc];
            v375 = (void *)objc_msgSend_initWithTextResult_terminatingSpecialCharacter_strokeGroup_(v372, v373, (uint64_t)v33, (uint64_t)v348, (uint64_t)v35, v374);
            objc_msgSend_addObject_(v415, v376, (uint64_t)v375, v377, v378, v379);

            goto LABEL_76;
          }
        }
      }
      else
      {

      }
LABEL_60:
      v349 = width == *MEMORY[0x1E0C9D820] && height == *(double *)(MEMORY[0x1E0C9D820] + 8);
      if (v349
        || (objc_msgSend_bounds(v35, v196, v197, v198, v199, v200), v350 / width >= 0.5)
        || ((v348 = CFSTR("\n"), v416 != v412) ? (v351 = CFSTR("\n")) : (v351 = 0),
            v352 = v351,
            v416 == v412))
      {
        if (v36 == objc_msgSend_count(v422, v196, v197, v198, v199, v200) - 1)
        {
          v348 = 0;
          isEqualToString = objc_msgSend_isEqualToString_(0, v353, (uint64_t)CFSTR("\n"), v354, v355, v356);
        }
        else
        {
          objc_msgSend_defaultWordTerminationCharacterForLocale_(CHContextualTextResult, v353, (uint64_t)v421, v354, v355, v356);
          v363 = (__CFString *)objc_claimAutoreleasedReturnValue();
          if (v413 == 0x7FFFFFFFFFFFFFFFLL)
          {

            v348 = CFSTR("\n");
            isEqualToString = objc_msgSend_isEqualToString_(CFSTR("\n"), v368, (uint64_t)CFSTR("\n"), v369, v370, v371);
          }
          else
          {
            v348 = v363;
            isEqualToString = objc_msgSend_isEqualToString_(v363, v364, (uint64_t)CFSTR("\n"), v365, v366, v367);
          }
        }
        if ((isEqualToString & 1) == 0)
        {
          for (i = 0; i < objc_msgSend_count(v423, v358, v359, v360, v361, v362) - 1; ++i)
          {
            objc_msgSend_objectAtIndexedSubscript_(v423, v383, i, v384, v385, v386);
            v387 = (void *)objc_claimAutoreleasedReturnValue();
            v397 = objc_msgSend_indexOfObject_(v387, v388, (uint64_t)v35, v389, v390, v391);
            if (v397 != 0x7FFFFFFFFFFFFFFFLL && v397 == objc_msgSend_count(v387, v392, v393, v394, v395, v396) - 1)
            {

              v348 = CFSTR("\n");
            }

          }
        }
      }
      goto LABEL_75;
    }
    if (v36 >= objc_msgSend_count(v422, v37, v38, v39, v40, v41))
    {
      v33 = 0;
      if (qword_1EF568E88 != -1)
        goto LABEL_90;
      goto LABEL_27;
    }
    objc_msgSend_objectAtIndexedSubscript_(v422, v42, v36, v43, v44, v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v420->_recognitionResultsByGroupID;
    v48 = (void *)MEMORY[0x1E0CB37E8];
    v54 = objc_msgSend_uniqueIdentifier(v46, v49, v50, v51, v52, v53);
    objc_msgSend_numberWithInteger_(v48, v55, v54, v56, v57, v58);
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v47, v60, (uint64_t)v59, v61, v62, v63);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_preferredLocale(v64, v65, v66, v67, v68, v69);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v47) = v70 == 0;

    if (!(_DWORD)v47)
    {
      v34 = v64;
      v35 = v46;
LABEL_7:
      objc_msgSend_preferredLocale(v34, v71, v72, v73, v74, v75);
      v76 = objc_claimAutoreleasedReturnValue();

      objc_msgSend_recognitionResultsByLocale(v34, v77, v78, v79, v80, v81);
      v82 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_objectForKeyedSubscript_(v82, v83, v76, v84, v85, v86);
      v87 = objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    objc_msgSend_mathResult(v64, v71, v72, v73, v74, v75);
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = v88 == 0;

    if (v89)
      break;
    v34 = v64;
    v35 = v46;
LABEL_10:
    objc_msgSend_orderedLocales(v34, v90, v91, v92, v93, v94);
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_firstObject(v95, v96, v97, v98, v99, v100);
    v76 = objc_claimAutoreleasedReturnValue();

    objc_msgSend_mathResult(v34, v101, v102, v103, v104, v105);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_tokenizedTextResultFromTokenizedMathResult_locale_(CHMathPostProcessingManager, v106, (uint64_t)v82, v76, v107, v108);
    v87 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v33 = (void *)v87;
    v421 = (void *)v76;

    objc_msgSend_inputStrokeIdentifiers(v34, v109, v110, v111, v112, v113);
    v114 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setInputStrokeIdentifiers_(v33, v115, (uint64_t)v114, v116, v117, v118);

    objc_msgSend_setLocale_(v33, v119, v76, v120, v121, v122);
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v123 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend_inputStrokeIdentifiers(v64, v124, v125, v126, v127, v128);
    v129 = (void *)objc_claimAutoreleasedReturnValue();
    v135 = objc_msgSend_count(v129, v130, v131, v132, v133, v134);
    *(_DWORD *)buf = 134217984;
    v427 = v135;
    _os_log_impl(&dword_1BE607000, v123, OS_LOG_TYPE_ERROR, "Unexpected group recognition result (%ld strokes) found with no math result and no preferred locale. Skipping.", buf, 0xCu);

  }
  ++v36;
  while (1)
  {

    if (v36 >= objc_msgSend_count(v422, v136, v137, v138, v139, v140))
      break;
    objc_msgSend_objectAtIndexedSubscript_(v422, v141, v36, v142, v143, v144);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v145 = v420->_recognitionResultsByGroupID;
    v146 = (void *)MEMORY[0x1E0CB37E8];
    v152 = objc_msgSend_uniqueIdentifier(v35, v147, v148, v149, v150, v151);
    objc_msgSend_numberWithInteger_(v146, v153, v152, v154, v155, v156);
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_objectForKey_(v145, v158, (uint64_t)v157, v159, v160, v161);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_preferredLocale(v34, v162, v163, v164, v165, v166);
    v167 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v145) = v167 == 0;

    if ((v145 & 1) == 0)
      goto LABEL_7;
    objc_msgSend_mathResult(v34, v71, v72, v73, v74, v75);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    v169 = v168 == 0;

    if (!v169)
      goto LABEL_10;
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v123 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v123, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend_inputStrokeIdentifiers(v34, v170, v171, v172, v173, v174);
      v175 = (void *)objc_claimAutoreleasedReturnValue();
      v181 = objc_msgSend_count(v175, v176, v177, v178, v179, v180);
      *(_DWORD *)buf = 134217984;
      v427 = v181;
      _os_log_impl(&dword_1BE607000, v123, OS_LOG_TYPE_ERROR, "Unexpected group recognition result (%ld strokes) found with no math result and no preferred locale. Skipping.", buf, 0xCu);

    }
    ++v36;
    v46 = v35;
    v64 = v34;
  }
  v33 = 0;
  v34 = v64;
  v35 = v46;
  if (qword_1EF568E88 == -1)
    goto LABEL_27;
LABEL_90:
  dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
LABEL_27:
  v182 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v182, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v182, OS_LOG_TYPE_ERROR, "Found no valid group recognition results found with math result or preferred locale. Skipping.", buf, 2u);
  }

  v415 = (id)MEMORY[0x1E0C9AA60];
LABEL_30:

LABEL_31:
  return v415;
}

- (id)encodedStrokeProviderVersion
{
  return self->_encodedStrokeProviderVersion;
}

- (id)declaredVariables
{
  return self->_declaredVariables;
}

- (id)recognitionResultsByGroupID
{
  return self->_recognitionResultsByGroupID;
}

- (id)rawRecognitionResultsByGroupID
{
  return self->_rawRecognitionResultsByGroupID;
}

- (id)textCorrectionResultsByGroupID
{
  return self->_textCorrectionResultsByGroupID;
}

- (id)writeToFile
{
  void *v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  const char *v11;
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
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;

  v3 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_fileURLWithPath_(v3, v5, (uint64_t)v4, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend_setDateFormat_(v10, v11, (uint64_t)CFSTR("dd-MM-yyyy-HH-mm-ss-SSS"), v12, v13, v14);
  objc_msgSend_UUID(MEMORY[0x1E0CB3A28], v15, v16, v17, v18, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v20, v21, v22, v23, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_substringToIndex_(v26, v27, 4, v28, v29, v30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_now(MEMORY[0x1E0C99D68], v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringFromDate_(v10, v38, (uint64_t)v37, v39, v40, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stringWithFormat_(MEMORY[0x1E0CB3940], v43, (uint64_t)CFSTR("/session_result_%@-%@.dat"), v44, v45, v46, v42, v31);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_writeToFileInFolder_basename_(self, v48, (uint64_t)v9, (uint64_t)v47, v49, v50);
  v51 = (void *)objc_claimAutoreleasedReturnValue();

  return v51;
}

- (id)writeToFileInFolder:(id)a3 basename:(id)a4
{
  id v6;
  id v7;
  id v8;
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
  char v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char DirectoryAtURL_withIntermediateDirectories_attributes_error;
  id v26;
  id v27;
  NSObject *v28;
  const char *v29;
  uint64_t v30;
  void *v31;
  const char *v32;
  uint64_t v33;
  NSObject *v34;
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
  uint64_t v51;
  void *v52;
  id v54;
  id v55;
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend_absoluteString(v6, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_fileExistsAtPath_(v8, v15, (uint64_t)v14, v16, v17, v18);

  if ((v19 & 1) != 0)
  {
    v24 = 0;
LABEL_5:
    objc_msgSend_URLByAppendingPathComponent_(v6, v20, (uint64_t)v7, v21, v22, v23);
    v28 = objc_claimAutoreleasedReturnValue();
    objc_msgSend_archivedDataWithRootObject_requiringSecureCoding_error_(MEMORY[0x1E0CB36F8], v29, (uint64_t)self, 1, 0, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = v24;
    objc_msgSend_writeToURL_options_error_(v31, v32, (uint64_t)v28, 1, (uint64_t)&v54, v33);
    v27 = v54;

    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v34 = (id)qword_1EF568E18[0];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend_absoluteString(v28, v35, v36, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_description(v27, v41, v42, v43, v44, v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v57 = v40;
      v58 = 2112;
      v59 = v46;
      _os_log_impl(&dword_1BE607000, v34, OS_LOG_TYPE_DEFAULT, "SessionResult writeToFile saving result at URL %@, error = %@", buf, 0x16u);

    }
    if (v27)
    {
      v52 = 0;
    }
    else
    {
      objc_msgSend_absoluteString(v28, v47, v48, v49, v50, v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
    }

    goto LABEL_18;
  }
  v55 = 0;
  DirectoryAtURL_withIntermediateDirectories_attributes_error = objc_msgSend_createDirectoryAtURL_withIntermediateDirectories_attributes_error_(v8, v20, (uint64_t)v6, 1, 0, (uint64_t)&v55);
  v26 = v55;
  v27 = v26;
  if ((DirectoryAtURL_withIntermediateDirectories_attributes_error & 1) != 0)
  {
    v24 = v26;
    goto LABEL_5;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v28 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v57 = v6;
    v58 = 2112;
    v59 = v27;
    _os_log_impl(&dword_1BE607000, v28, OS_LOG_TYPE_ERROR, "Session result unable to create folder at URL %@: Error %@", buf, 0x16u);
  }
  v52 = 0;
LABEL_18:

  return v52;
}

+ (id)loadFromFile:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend_dataWithContentsOfFile_(MEMORY[0x1E0C99D50], a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3710];
  v8 = objc_opt_class();
  objc_msgSend_unarchivedObjectOfClass_fromData_error_(v7, v9, v8, (uint64_t)v6, 0, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  const char *v46;
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
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void *v81;
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  void *v108;
  const char *v109;
  uint64_t v110;
  uint64_t v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  id v128;

  v128 = a3;
  objc_msgSend_encodedStrokeProviderVersion(self, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v10, (uint64_t)v9, (uint64_t)CFSTR("strokeProviderVersion"), v11, v12);

  objc_msgSend_orderedStrokeIdentifiers(self, v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v19, (uint64_t)v18, (uint64_t)CFSTR("orderedStrokeIdentifiers"), v20, v21);

  v27 = objc_msgSend_sessionMode(self, v22, v23, v24, v25, v26);
  objc_msgSend_encodeInteger_forKey_(v128, v28, v27, (uint64_t)CFSTR("sessionMode"), v29, v30);
  objc_msgSend_locales(self, v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v37, (uint64_t)v36, (uint64_t)CFSTR("locales"), v38, v39);

  objc_msgSend_preferredLocales(self, v40, v41, v42, v43, v44);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v46, (uint64_t)v45, (uint64_t)CFSTR("preferredLocales"), v47, v48);

  objc_msgSend_declaredVariables(self, v49, v50, v51, v52, v53);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v55, (uint64_t)v54, (uint64_t)CFSTR("declaredVariables"), v56, v57);

  objc_msgSend_strokeClassificationResult(self, v58, v59, v60, v61, v62);
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v64, (uint64_t)v63, (uint64_t)CFSTR("strokeClassificationResult"), v65, v66);

  objc_msgSend_strokeGroupingResult(self, v67, v68, v69, v70, v71);
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v73, (uint64_t)v72, (uint64_t)CFSTR("strokeGroupingResult"), v74, v75);

  objc_msgSend_rawStrokeGroupingResult(self, v76, v77, v78, v79, v80);
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v82, (uint64_t)v81, (uint64_t)CFSTR("rawStrokeGroupingResult"), v83, v84);

  objc_msgSend_recognitionResultsByGroupID(self, v85, v86, v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v91, (uint64_t)v90, (uint64_t)CFSTR("recognitionResults"), v92, v93);

  objc_msgSend_rawRecognitionResultsByGroupID(self, v94, v95, v96, v97, v98);
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v100, (uint64_t)v99, (uint64_t)CFSTR("rawRecognitionResults"), v101, v102);

  objc_msgSend_textCorrectionResultsByGroupID(self, v103, v104, v105, v106, v107);
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v109, (uint64_t)v108, (uint64_t)CFSTR("inlineContinuousModeResults"), v110, v111);

  objc_msgSend_dataWithBytes_length_(MEMORY[0x1E0C99D50], v112, (uint64_t)&self->_generationDuration, 48, v113, v114);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_encodeObject_forKey_(v128, v116, (uint64_t)v115, (uint64_t)CFSTR("generationDuration"), v117, v118);
  v124 = objc_msgSend_recognitionEnvironment(self, v119, v120, v121, v122, v123);
  objc_msgSend_encodeInteger_forKey_(v128, v125, v124, (uint64_t)CFSTR("recognitionEnvironment"), v126, v127);

}

- (CHRecognitionSessionResult)initWithCoder:(id)a3
{
  id v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  const char *v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  const char *v62;
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
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  void *v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  void *v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  void *v100;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  void *v104;
  void *v105;
  const char *v106;
  uint64_t v107;
  uint64_t v108;
  void *v109;
  const char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  void *v114;
  const char *v115;
  uint64_t v116;
  uint64_t v117;
  void *v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
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
  void *v146;
  uint64_t v147;
  const char *v148;
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
  CHRecognitionSessionResult *v161;
  uint64_t v163;
  void *v165;
  void *v166;
  CHStrokeClutterFilter *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  _OWORD v173[3];
  _OWORD v174[3];
  _QWORD v175[3];
  _QWORD v176[3];
  _QWORD v177[3];
  _QWORD v178[3];
  _QWORD v179[3];
  _QWORD v180[2];
  _QWORD v181[2];
  _QWORD v182[2];
  _QWORD v183[4];

  v183[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v5, v4, (uint64_t)CFSTR("strokeProviderVersion"), v6, v7);
  v172 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99E60];
  v183[0] = objc_opt_class();
  v183[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v9, (uint64_t)v183, 2, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v8, v13, (uint64_t)v12, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v18, (uint64_t)v17, (uint64_t)CFSTR("orderedStrokeIdentifiers"), v19, v20);
  v171 = (void *)objc_claimAutoreleasedReturnValue();

  v163 = objc_msgSend_decodeIntegerForKey_(v3, v21, (uint64_t)CFSTR("sessionMode"), v22, v23, v24);
  v25 = (void *)MEMORY[0x1E0C99E60];
  v182[0] = objc_opt_class();
  v182[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v26, (uint64_t)v182, 2, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v25, v30, (uint64_t)v29, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v35, (uint64_t)v34, (uint64_t)CFSTR("locales"), v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_effectiveLocalesFromLocales_(CHRecognitionSession, v39, (uint64_t)v38, v40, v41, v42);
  v170 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = (void *)MEMORY[0x1E0C99E60];
  v181[0] = objc_opt_class();
  v181[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v44, (uint64_t)v181, 2, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v43, v48, (uint64_t)v47, v49, v50, v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v53, (uint64_t)v52, (uint64_t)CFSTR("preferredLocales"), v54, v55);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_effectiveLocalesFromLocales_(CHRecognitionSession, v57, (uint64_t)v56, v58, v59, v60);
  v169 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = (void *)MEMORY[0x1E0C99E60];
  v180[0] = objc_opt_class();
  v180[1] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v62, (uint64_t)v180, 2, v63, v64);
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v61, v66, (uint64_t)v65, v67, v68, v69);
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v71, (uint64_t)v70, (uint64_t)CFSTR("declaredVariables"), v72, v73);
  v166 = (void *)objc_claimAutoreleasedReturnValue();

  v167 = objc_alloc_init(CHStrokeClutterFilter);
  v74 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v75, v74, (uint64_t)CFSTR("strokeClassificationResult"), v76, v77);
  v168 = (void *)objc_claimAutoreleasedReturnValue();
  v78 = (void *)MEMORY[0x1E0C99E60];
  v179[0] = objc_opt_class();
  v179[1] = objc_opt_class();
  v179[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v79, (uint64_t)v179, 3, v80, v81);
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v78, v83, (uint64_t)v82, v84, v85, v86);
  v87 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v88, (uint64_t)v87, (uint64_t)CFSTR("strokeGroupingResult"), v89, v90);
  v165 = (void *)objc_claimAutoreleasedReturnValue();

  v91 = (void *)MEMORY[0x1E0C99E60];
  v178[0] = objc_opt_class();
  v178[1] = objc_opt_class();
  v178[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v92, (uint64_t)v178, 3, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v91, v96, (uint64_t)v95, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v101, (uint64_t)v100, (uint64_t)CFSTR("rawStrokeGroupingResult"), v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  v105 = (void *)MEMORY[0x1E0C99E60];
  v177[0] = objc_opt_class();
  v177[1] = objc_opt_class();
  v177[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v106, (uint64_t)v177, 3, v107, v108);
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v105, v110, (uint64_t)v109, v111, v112, v113);
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v115, (uint64_t)v114, (uint64_t)CFSTR("recognitionResults"), v116, v117);
  v118 = (void *)objc_claimAutoreleasedReturnValue();

  v119 = (void *)MEMORY[0x1E0C99E60];
  v176[0] = objc_opt_class();
  v176[1] = objc_opt_class();
  v176[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v120, (uint64_t)v176, 3, v121, v122);
  v123 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v119, v124, (uint64_t)v123, v125, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v129, (uint64_t)v128, (uint64_t)CFSTR("rawRecognitionResults"), v130, v131);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v133 = (void *)MEMORY[0x1E0C99E60];
  v175[0] = objc_opt_class();
  v175[1] = objc_opt_class();
  v175[2] = objc_opt_class();
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v134, (uint64_t)v175, 3, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setWithArray_(v133, v138, (uint64_t)v137, v139, v140, v141);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_decodeObjectOfClasses_forKey_(v3, v143, (uint64_t)v142, (uint64_t)CFSTR("inlineContinuousModeResults"), v144, v145);
  v146 = (void *)objc_claimAutoreleasedReturnValue();

  v147 = objc_opt_class();
  objc_msgSend_decodeObjectOfClass_forKey_(v3, v148, v147, (uint64_t)CFSTR("generationDuration"), v149, v150);
  v151 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_getBytes_length_(v151, v152, (uint64_t)v174, 48, v153, v154);
  v159 = objc_msgSend_decodeIntegerForKey_(v3, v155, (uint64_t)CFSTR("recognitionEnvironment"), v156, v157, v158);
  v173[0] = v174[0];
  v173[1] = v174[1];
  v173[2] = v174[2];
  v161 = (CHRecognitionSessionResult *)objc_msgSend_initWithStrokeProviderVersion_encodedStrokeProviderVersion_orderedStrokeIdentifiers_sessionMode_locales_preferredLocales_declaredVariables_clutterFilter_strokeClassificationResult_strokeGroupingResult_rawStrokeGroupingResult_recognitionResults_rawRecognitionResults_inlineContinuousModeResults_autoRefineResult_generationDuration_recognitionEnvironment_(self, v160, 0, (uint64_t)v172, (uint64_t)v171, v163, v170, v169, v166, v167, v168, v165, v104, v118, v132, v146, 0, v173, v159);

  return v161;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isEqualToSerializableRecognitionSessionResult:(id)a3
{
  id v4;
  NSData *encodedStrokeProviderVersion;
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
  NSData *v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int isEqual;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSArray *orderedStrokeIdentifiers;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSArray *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  NSArray *locales;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSArray *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  int v58;
  const char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  NSArray *preferredLocales;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSArray *v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  CHStrokeClassificationResult *strokeClassificationResult;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  CHStrokeClassificationResult *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  int v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  CHStrokeGroupingResult *strokeGroupingResult;
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  CHStrokeGroupingResult *v106;
  void *v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  int v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  CHStrokeGroupingResult *rawStrokeGroupingResult;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  CHStrokeGroupingResult *v124;
  void *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  int v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  NSDictionary *recognitionResultsByGroupID;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  NSDictionary *v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  NSDictionary *rawRecognitionResultsByGroupID;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  NSDictionary *v160;
  void *v161;
  const char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  int v166;
  const char *v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  NSDictionary *textCorrectionResultsByGroupID;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  NSDictionary *v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  int v184;
  const char *v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  double groupingDuration;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  double recognitionDuration;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  double strokeClassificationDuration;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  double strokeClutterFilteringDuration;
  const char *v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  double totalDuration;
  const char *v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  double principalLinesDuration;
  double v221;
  int64_t recognitionEnvironment;
  BOOL v223;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;

  v4 = a3;
  encodedStrokeProviderVersion = self->_encodedStrokeProviderVersion;
  objc_msgSend_encodedStrokeProviderVersion(v4, v6, v7, v8, v9, v10);
  v16 = (NSData *)objc_claimAutoreleasedReturnValue();
  if (encodedStrokeProviderVersion == v16)
  {

  }
  else
  {
    objc_msgSend_encodedStrokeProviderVersion(v4, v11, v12, v13, v14, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    isEqual = objc_msgSend_isEqual_(v17, v18, (uint64_t)self->_encodedStrokeProviderVersion, v19, v20, v21);

    if (!isEqual)
      goto LABEL_56;
  }
  orderedStrokeIdentifiers = self->_orderedStrokeIdentifiers;
  objc_msgSend_orderedStrokeIdentifiers(v4, v23, v24, v25, v26, v27);
  v34 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (orderedStrokeIdentifiers == v34)
  {

  }
  else
  {
    objc_msgSend_orderedStrokeIdentifiers(v4, v29, v30, v31, v32, v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend_isEqual_(v35, v36, (uint64_t)self->_orderedStrokeIdentifiers, v37, v38, v39);

    if (!v40)
      goto LABEL_56;
  }
  locales = self->_locales;
  objc_msgSend_locales(v4, v41, v42, v43, v44, v45);
  v52 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (locales == v52)
  {

  }
  else
  {
    objc_msgSend_locales(v4, v47, v48, v49, v50, v51);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_isEqual_(v53, v54, (uint64_t)self->_locales, v55, v56, v57);

    if (!v58)
      goto LABEL_56;
  }
  preferredLocales = self->_preferredLocales;
  objc_msgSend_preferredLocales(v4, v59, v60, v61, v62, v63);
  v70 = (NSArray *)objc_claimAutoreleasedReturnValue();
  if (preferredLocales == v70)
  {

  }
  else
  {
    objc_msgSend_preferredLocales(v4, v65, v66, v67, v68, v69);
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = objc_msgSend_isEqual_(v71, v72, (uint64_t)self->_preferredLocales, v73, v74, v75);

    if (!v76)
      goto LABEL_56;
  }
  strokeClassificationResult = self->_strokeClassificationResult;
  objc_msgSend_strokeClassificationResult(v4, v77, v78, v79, v80, v81);
  v88 = (CHStrokeClassificationResult *)objc_claimAutoreleasedReturnValue();
  if (strokeClassificationResult == v88)
  {

  }
  else
  {
    objc_msgSend_strokeClassificationResult(v4, v83, v84, v85, v86, v87);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = objc_msgSend_isEqual_(v89, v90, (uint64_t)self->_strokeClassificationResult, v91, v92, v93);

    if (!v94)
      goto LABEL_56;
  }
  strokeGroupingResult = self->_strokeGroupingResult;
  objc_msgSend_strokeGroupingResult(v4, v95, v96, v97, v98, v99);
  v106 = (CHStrokeGroupingResult *)objc_claimAutoreleasedReturnValue();
  if (strokeGroupingResult == v106)
  {

  }
  else
  {
    objc_msgSend_strokeGroupingResult(v4, v101, v102, v103, v104, v105);
    v107 = (void *)objc_claimAutoreleasedReturnValue();
    v112 = objc_msgSend_isEqual_(v107, v108, (uint64_t)self->_strokeGroupingResult, v109, v110, v111);

    if (!v112)
      goto LABEL_56;
  }
  rawStrokeGroupingResult = self->_rawStrokeGroupingResult;
  objc_msgSend_rawStrokeGroupingResult(v4, v113, v114, v115, v116, v117);
  v124 = (CHStrokeGroupingResult *)objc_claimAutoreleasedReturnValue();
  if (rawStrokeGroupingResult == v124)
  {

  }
  else
  {
    objc_msgSend_rawStrokeGroupingResult(v4, v119, v120, v121, v122, v123);
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = objc_msgSend_isEqual_(v125, v126, (uint64_t)self->_rawStrokeGroupingResult, v127, v128, v129);

    if (!v130)
      goto LABEL_56;
  }
  recognitionResultsByGroupID = self->_recognitionResultsByGroupID;
  objc_msgSend_recognitionResultsByGroupID(v4, v131, v132, v133, v134, v135);
  v142 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (recognitionResultsByGroupID == v142)
  {

  }
  else
  {
    objc_msgSend_recognitionResultsByGroupID(v4, v137, v138, v139, v140, v141);
    v143 = (void *)objc_claimAutoreleasedReturnValue();
    v148 = objc_msgSend_isEqual_(v143, v144, (uint64_t)self->_recognitionResultsByGroupID, v145, v146, v147);

    if (!v148)
      goto LABEL_56;
  }
  rawRecognitionResultsByGroupID = self->_rawRecognitionResultsByGroupID;
  objc_msgSend_rawRecognitionResultsByGroupID(v4, v149, v150, v151, v152, v153);
  v160 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (rawRecognitionResultsByGroupID == v160)
  {

  }
  else
  {
    objc_msgSend_rawRecognitionResultsByGroupID(v4, v155, v156, v157, v158, v159);
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    v166 = objc_msgSend_isEqual_(v161, v162, (uint64_t)self->_rawRecognitionResultsByGroupID, v163, v164, v165);

    if (!v166)
      goto LABEL_56;
  }
  textCorrectionResultsByGroupID = self->_textCorrectionResultsByGroupID;
  objc_msgSend_textCorrectionResultsByGroupID(v4, v167, v168, v169, v170, v171);
  v178 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  if (textCorrectionResultsByGroupID == v178)
  {

  }
  else
  {
    objc_msgSend_textCorrectionResultsByGroupID(v4, v173, v174, v175, v176, v177);
    v179 = (void *)objc_claimAutoreleasedReturnValue();
    v184 = objc_msgSend_isEqual_(v179, v180, (uint64_t)self->_textCorrectionResultsByGroupID, v181, v182, v183);

    if (!v184)
      goto LABEL_56;
  }
  groupingDuration = self->_generationDuration.groupingDuration;
  if (v4)
  {
    objc_msgSend_generationDuration(v4, v185, v186, v187, v188, v189);
    if (groupingDuration != v230)
      goto LABEL_56;
    recognitionDuration = self->_generationDuration.recognitionDuration;
    objc_msgSend_generationDuration(v4, v191, v192, v193, v194, v195);
    if (recognitionDuration != v229)
      goto LABEL_56;
    strokeClassificationDuration = self->_generationDuration.strokeClassificationDuration;
    objc_msgSend_generationDuration(v4, v197, v198, v199, v200, v201);
    if (strokeClassificationDuration != v228)
      goto LABEL_56;
    strokeClutterFilteringDuration = self->_generationDuration.strokeClutterFilteringDuration;
    objc_msgSend_generationDuration(v4, v203, v204, v205, v206, v207);
    if (strokeClutterFilteringDuration != v227)
      goto LABEL_56;
    totalDuration = self->_generationDuration.totalDuration;
    objc_msgSend_generationDuration(v4, v209, v210, v211, v212, v213);
    if (totalDuration != v226)
      goto LABEL_56;
    principalLinesDuration = self->_generationDuration.principalLinesDuration;
    objc_msgSend_generationDuration(v4, v215, v216, v217, v218, v219);
    v221 = v225;
  }
  else
  {
    if (groupingDuration != 0.0
      || self->_generationDuration.recognitionDuration != 0.0
      || self->_generationDuration.strokeClassificationDuration != 0.0
      || self->_generationDuration.strokeClutterFilteringDuration != 0.0
      || self->_generationDuration.totalDuration != 0.0)
    {
      goto LABEL_56;
    }
    principalLinesDuration = self->_generationDuration.principalLinesDuration;
    v221 = 0.0;
  }
  if (principalLinesDuration != v221)
  {
LABEL_56:
    v223 = 0;
    goto LABEL_57;
  }
  recognitionEnvironment = self->_recognitionEnvironment;
  v223 = recognitionEnvironment == objc_msgSend_recognitionEnvironment(v4, v185, v186, v187, v188, v189);
LABEL_57:

  return v223;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  CHRecognitionSessionResult *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CHRecognitionSessionResult *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CHStrokeClutterFilter *clutterFilter;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  CHStrokeClutterFilter *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (CHRecognitionSessionResult *)v4;
    v10 = v5;
    if (self)
    {
      if (self == v5)
      {
        LOBYTE(self) = 1;
      }
      else if (objc_msgSend_isEqualToSerializableRecognitionSessionResult_(self, v6, (uint64_t)v5, v7, v8, v9))
      {
        clutterFilter = self->_clutterFilter;
        objc_msgSend_clutterFilter(v10, v11, v12, v13, v14, v15);
        v22 = (CHStrokeClutterFilter *)objc_claimAutoreleasedReturnValue();
        if (clutterFilter == v22)
        {
          LOBYTE(self) = 1;
        }
        else if (self->_clutterFilter)
        {
          objc_msgSend_clutterFilter(v10, v17, v18, v19, v20, v21);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(self) = objc_msgSend_isEqual_(v23, v24, (uint64_t)self->_clutterFilter, v25, v26, v27);

        }
        else
        {
          LOBYTE(self) = 0;
        }

      }
      else
      {
        LOBYTE(self) = 0;
      }
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (int64_t)completeness
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
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
  void *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
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
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  const char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  char hasValidPrincipalLinesForPath;
  void *v83;
  _BOOL4 v84;
  int64_t v85;
  char v87;
  id obj;
  void *v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  _BYTE v94[128];
  uint64_t v95;

  v95 = *MEMORY[0x1E0C80C00];
  if (!self->__shouldUseCachedCompleteness)
  {
    objc_msgSend_strokeClassificationsByStrokeIdentifier(self->_strokeClassificationResult, a2, v2, v3, v4, v5);
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = 0u;
    v93 = 0u;
    v90 = 0u;
    v91 = 0u;
    objc_msgSend_allKeys(self->_recognitionResultsByGroupID, v7, v8, v9, v10, v11);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v90, (uint64_t)v94, 16, v13);
    if (v18)
    {
      v19 = *(_QWORD *)v91;
      v87 = 1;
      while (2)
      {
        for (i = 0; i != v18; ++i)
        {
          if (*(_QWORD *)v91 != v19)
            objc_enumerationMutation(obj);
          objc_msgSend_objectForKey_(self->_recognitionResultsByGroupID, v14, *(_QWORD *)(*((_QWORD *)&v90 + 1) + 8 * i), v15, v16, v17);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_preferredLocale(v21, v22, v23, v24, v25, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_inputStrokeIdentifiers(v21, v28, v29, v30, v31, v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v33, v34, v35, v36, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectForKey_(v89, v40, (uint64_t)v39, v41, v42, v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend_integerValue(v44, v45, v46, v47, v48, v49);

          v51 = (void *)objc_opt_class();
          if (objc_msgSend_isStrokeClassificationTextOrMath_(v51, v52, v50, v53, v54, v55)
            && objc_msgSend_count(self->_locales, v56, v57, v58, v59, v60))
          {
            if (v21 && v27)
            {
              objc_msgSend_recognitionResultsByLocale(v21, v61, v62, v63, v64, v65);
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_objectForKey_(v66, v67, (uint64_t)v27, v68, v69, v70);
              v71 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v71)
                goto LABEL_18;
              objc_msgSend_topModelTranscriptionPath(v71, v72, v73, v74, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              hasValidPrincipalLinesForPath = objc_msgSend_hasValidPrincipalLinesForPath_(v71, v78, (uint64_t)v77, v79, v80, v81);

              v87 &= hasValidPrincipalLinesForPath;
            }
            else
            {
              objc_msgSend_mathResult(v21, v61, v62, v63, v64, v65);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v84 = v83 == 0;

              if (v84)
              {
LABEL_18:

                goto LABEL_22;
              }
            }
          }

        }
        v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v90, (uint64_t)v94, 16, v17);
        if (v18)
          continue;
        break;
      }

      if ((v87 & 1) == 0)
      {
        v85 = 1;
        goto LABEL_21;
      }
    }
    else
    {

    }
    v85 = 2;
LABEL_21:
    self->_completeness = v85;
LABEL_22:
    self->__shouldUseCachedCompleteness = 1;

  }
  return self->_completeness;
}

- (CHStrokeProviderVersion)strokeProviderVersion
{
  return self->_strokeProviderVersion;
}

- (NSArray)orderedStrokeIdentifiers
{
  return self->_orderedStrokeIdentifiers;
}

- (int64_t)sessionMode
{
  return self->_sessionMode;
}

- (NSArray)locales
{
  return self->_locales;
}

- (NSArray)preferredLocales
{
  return self->_preferredLocales;
}

- (CHStrokeClutterFilter)clutterFilter
{
  return self->_clutterFilter;
}

- (int64_t)recognitionEnvironment
{
  return self->_recognitionEnvironment;
}

- (CHStrokeClassificationResult)strokeClassificationResult
{
  return self->_strokeClassificationResult;
}

- (CHStrokeGroupingResult)strokeGroupingResult
{
  return self->_strokeGroupingResult;
}

- (CHStrokeGroupingResult)rawStrokeGroupingResult
{
  return self->_rawStrokeGroupingResult;
}

- (CHRecognitionSessionAutoRefineResult)autoRefineResult
{
  return self->_autoRefineResult;
}

- ($54B668FA3CFF7C50914A1C899F2834C0)generationDuration
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var4;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var2;
  *(_OWORD *)&retstr->var2 = v3;
  *(_OWORD *)&retstr->var4 = *(_OWORD *)&self[4].var0;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoRefineResult, 0);
  objc_storeStrong((id *)&self->_rawStrokeGroupingResult, 0);
  objc_storeStrong((id *)&self->_strokeGroupingResult, 0);
  objc_storeStrong((id *)&self->_strokeClassificationResult, 0);
  objc_storeStrong((id *)&self->_clutterFilter, 0);
  objc_storeStrong((id *)&self->_preferredLocales, 0);
  objc_storeStrong((id *)&self->_locales, 0);
  objc_storeStrong((id *)&self->_orderedStrokeIdentifiers, 0);
  objc_storeStrong((id *)&self->_strokeProviderVersion, 0);
  objc_storeStrong((id *)&self->_declaredVariables, 0);
  objc_storeStrong((id *)&self->_encodedStrokeProviderVersion, 0);
  objc_storeStrong((id *)&self->_textCorrectionResultsByGroupID, 0);
  objc_storeStrong((id *)&self->_rawRecognitionResultsByGroupID, 0);
  objc_storeStrong((id *)&self->_recognitionResultsByGroupID, 0);
}

@end
