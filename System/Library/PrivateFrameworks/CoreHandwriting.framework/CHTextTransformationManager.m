@implementation CHTextTransformationManager

- (CHTextTransformationManager)initWithContextStrokes:(id)a3 relatedNonTextStrokes:(id)a4 contextResults:(id)a5 strokeGroupingResult:(id)a6 strokeClassificationResult:(id)a7 strokeProvider:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  CHTransformationParameters *v20;
  const char *v21;
  CHTextTransformationManager *v22;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = objc_alloc_init(CHTransformationParameters);
  v22 = (CHTextTransformationManager *)objc_msgSend_initWithContextStrokes_relatedNonTextStrokes_parameters_contextResults_strokeGroupingResult_strokeClassificationResult_strokeProvider_excludedStrokeTypes_(self, v21, (uint64_t)v14, (uint64_t)v15, (uint64_t)v20, (uint64_t)v16, v17, v18, v19, 0);

  return v22;
}

- (CHTextTransformationManager)initWithContextStrokes:(id)a3 relatedNonTextStrokes:(id)a4 parameters:(id)a5 contextResults:(id)a6 strokeGroupingResult:(id)a7 strokeClassificationResult:(id)a8 strokeProvider:(id)a9
{
  return (CHTextTransformationManager *)objc_msgSend_initWithContextStrokes_relatedNonTextStrokes_parameters_contextResults_strokeGroupingResult_strokeClassificationResult_strokeProvider_excludedStrokeTypes_(self, a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (uint64_t)a6, a7, a8, a9, 0);
}

- (CHTextTransformationManager)initWithContextStrokes:(id)a3 relatedNonTextStrokes:(id)a4 parameters:(id)a5 contextResults:(id)a6 strokeGroupingResult:(id)a7 strokeClassificationResult:(id)a8 strokeProvider:(id)a9 excludedStrokeTypes:(id)a10
{
  CHTextTransformationManager *v17;
  CHTextTransformationManager *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *correctionAngles;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  objc_super v35;

  v34 = a3;
  v33 = a4;
  v32 = a5;
  v31 = a6;
  v30 = a7;
  v29 = a8;
  v28 = a9;
  v27 = a10;
  v35.receiver = self;
  v35.super_class = (Class)CHTextTransformationManager;
  v17 = -[CHTextTransformationManager init](&v35, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_contextStrokes, a3);
    objc_storeStrong((id *)&v18->_transformationParameters, a5);
    objc_storeStrong((id *)&v18->_contextResults, a6);
    objc_storeStrong((id *)&v18->_strokeProvider, a9);
    objc_storeStrong((id *)&v18->_strokeGroupingResult, a7);
    objc_storeStrong((id *)&v18->_strokeClassificationResult, a8);
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v19, v20, v21, v22, v23);
    v24 = objc_claimAutoreleasedReturnValue();
    correctionAngles = v18->_correctionAngles;
    v18->_correctionAngles = (NSMutableArray *)v24;

    v18->_usingInsertionPoint = 0;
    objc_storeStrong((id *)&v18->_relatedNonTextStrokes, a4);
    objc_storeStrong((id *)&v18->_excludedStrokeTypes, a10);
  }

  return v18;
}

- (id)majorityScriptId
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
  void *v12;
  unint64_t i;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  _QWORD v42[6];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  __CFString *v48;
  _QWORD v49[4];

  objc_msgSend_string(MEMORY[0x1E0CB37A0], a2, v2, v3, v4, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i < objc_msgSend_count(self->_contextResults, v7, v8, v9, v10, v11); ++i)
  {
    objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v14, i, v15, v16, v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textResult(v18, v19, v20, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_topTranscription(v24, v25, v26, v27, v28, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_appendString_(v12, v31, (uint64_t)v30, v32, v33, v34);

  }
  objc_msgSend_scriptHistogramForString_(CHTextInputScriptSpec, v14, (uint64_t)v12, v15, v16, v17);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x2020000000;
  v49[3] = 0;
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = sub_1BE79BEDC;
  v47 = sub_1BE79BEEC;
  v48 = CFSTR("Zund");
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = sub_1BE79BEF4;
  v42[3] = &unk_1E77F4EC0;
  v42[4] = v49;
  v42[5] = &v43;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v35, v36, (uint64_t)v42, v37, v38, v39);
  v40 = (id)v44[5];
  _Block_object_dispose(&v43, 8);

  _Block_object_dispose(v49, 8);
  return v40;
}

- (id)numCharacters
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
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
  uint64_t v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  if (objc_msgSend_count(self->_contextResults, a2, v2, v3, v4, v5))
  {
    v11 = 0;
    v12 = 0;
    do
    {
      objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v7, v11, v8, v9, v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_textResult(v13, v14, v15, v16, v17, v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_topTranscription(v19, v20, v21, v22, v23, v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v12 += objc_msgSend_countSubstringsWithOptions_(v25, v26, 2, v27, v28, v29);

      ++v11;
    }
    while (v11 < objc_msgSend_count(self->_contextResults, v30, v31, v32, v33, v34));
  }
  else
  {
    v12 = 0;
  }
  return (id)objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v7, v12, v8, v9, v10);
}

- (id)meanRotationCorrectionAngle
{
  NSMutableArray *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t i;
  float v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v3 = self->_correctionAngles;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v28, (uint64_t)v32, 16, v5);
  if (v11)
  {
    v12 = *(_QWORD *)v29;
    v13 = 0.0;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v3);
        objc_msgSend_floatValue(*(void **)(*((_QWORD *)&v28 + 1) + 8 * i), v6, v7, v8, v9, v10, (_QWORD)v28);
        v13 = v13 + v15;
      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v28, (uint64_t)v32, 16, v10);
    }
    while (v11);
  }
  else
  {
    v13 = 0.0;
  }

  if (objc_msgSend_count(self->_correctionAngles, v16, v17, v18, v19, v20))
  {
    v26 = v13 / (double)(unint64_t)objc_msgSend_count(self->_correctionAngles, v21, v22, v23, v24, v25);
    *(float *)&v26 = v26;
  }
  else
  {
    LODWORD(v26) = 0;
  }
  objc_msgSend_numberWithFloat_(MEMORY[0x1E0CB37E8], v21, v22, v23, v24, v25, v26, (_QWORD)v28);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)createTelemetryDictionary:(double)a3 nonTextRatio:(double)a4
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
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
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  _QWORD v70[7];
  _QWORD v71[8];

  v71[7] = *MEMORY[0x1E0C80C00];
  v70[0] = CFSTR("num_characters");
  objc_msgSend_numCharacters(self, a2, v4, v5, v6, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v71[0] = v11;
  v70[1] = CFSTR("num_strokes");
  v12 = (void *)MEMORY[0x1E0CB37E8];
  v18 = objc_msgSend_count(self->_contextStrokes, v13, v14, v15, v16, v17);
  objc_msgSend_numberWithUnsignedInteger_(v12, v19, v18, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v23;
  v70[2] = CFSTR("num_groups");
  v24 = (void *)MEMORY[0x1E0CB37E8];
  v30 = objc_msgSend_count(self->_contextResults, v25, v26, v27, v28, v29);
  objc_msgSend_numberWithUnsignedInteger_(v24, v31, v30, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v71[2] = v35;
  v70[3] = CFSTR("majority_script");
  objc_msgSend_majorityScriptId(self, v36, v37, v38, v39, v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v71[3] = v41;
  v70[4] = CFSTR("nontext_ratio");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v42, v43, v44, v45, v46, a4);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v71[4] = v47;
  v70[5] = CFSTR("rotation_angle");
  objc_msgSend_meanRotationCorrectionAngle(self, v48, v49, v50, v51, v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v71[5] = v53;
  v70[6] = CFSTR("time_for_straightening_ms");
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v54, v55, v56, v57, v58, a3);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v71[6] = v59;
  objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E0C99D80], v60, (uint64_t)v71, (uint64_t)v70, 7, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v68 = (void *)objc_msgSend_mutableCopy(v62, v63, v64, v65, v66, v67);

  return v68;
}

- (id)reflowableTextLinesWithProgress:(id)a3 mergeUnacceptableLines:(BOOL)a4 shouldCancel:(id)a5
{
  _BOOL8 v6;
  id v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  NSObject *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSArray *contextResults;
  uint64_t v20;
  NSArray *relatedNonTextStrokes;
  uint64_t v22;
  id v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  uint64_t v56;

  v6 = a4;
  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v41 = a5;
  v43 = v8;
  objc_msgSend__transformedTextLinesWithCancel_skipLineOrientationEstimate_useCache_progress_(self, v9, (uint64_t)v41, 0, 1, (uint64_t)v8);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  objc_msgSend_reflowableTextLinesFromTransformedTextLines_mergeUnacceptableLines_progress_(v10, v11, (uint64_t)v44, v6, (uint64_t)v8, v12);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v13 = (id)qword_1EF568E68;
  if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    goto LABEL_10;
  contextResults = self->_contextResults;
  if (!contextResults)
  {
    v20 = 0;
    relatedNonTextStrokes = self->_relatedNonTextStrokes;
    if (relatedNonTextStrokes)
      goto LABEL_6;
LABEL_8:
    v22 = 0;
    goto LABEL_9;
  }
  v20 = objc_msgSend_count(contextResults, v14, v15, v16, v17, v18);
  relatedNonTextStrokes = self->_relatedNonTextStrokes;
  if (!relatedNonTextStrokes)
    goto LABEL_8;
LABEL_6:
  v22 = objc_msgSend_count(relatedNonTextStrokes, v14, v15, v16, v17, v18);
LABEL_9:
  *(_DWORD *)buf = 134218496;
  v51 = v20;
  v52 = 2048;
  v53 = v22;
  v54 = 2048;
  v55 = objc_msgSend_count(v42, v14, v15, v16, v17, v18);
  _os_log_impl(&dword_1BE607000, v13, OS_LOG_TYPE_DEBUG, "Computed reflowable results from %ld context results, and %ld related non-text strokes: created %ld reflowable lines", buf, 0x20u);
LABEL_10:

  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v23 = v42;
  v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v24, (uint64_t)&v45, (uint64_t)v49, 16, v25);
  if (!v26)
    goto LABEL_23;
  v27 = *(_QWORD *)v46;
  do
  {
    v28 = 0;
    do
    {
      if (*(_QWORD *)v46 != v27)
        objc_enumerationMutation(v23);
      v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * v28);
      if (qword_1EF568E88 == -1)
      {
        v30 = (id)qword_1EF568E68;
        if (!os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          goto LABEL_18;
LABEL_17:
        objc_msgSend_description(v29, v31, v32, v33, v34, v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v51 = (uint64_t)v36;
        _os_log_impl(&dword_1BE607000, v30, OS_LOG_TYPE_DEBUG, "%@\n", buf, 0xCu);

        goto LABEL_18;
      }
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v30 = (id)qword_1EF568E68;
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
        goto LABEL_17;
LABEL_18:

      ++v28;
    }
    while (v26 != v28);
    v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v23, v37, (uint64_t)&v45, (uint64_t)v49, 16, v38);
    v26 = v39;
  }
  while (v39);
LABEL_23:

  return v23;
}

- (CHTextTransformationResult)transformWithProgress:(SEL)a3 shouldCancel:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  const char *v21;
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
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
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
  uint64_t v82;
  void *v83;
  const char *v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t j;
  void *v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const char *v99;
  uint64_t v100;
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
  uint64_t v112;
  uint64_t v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t k;
  void *v125;
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  void *v150;
  const char *v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  const char *v155;
  uint64_t v156;
  uint64_t m;
  void *v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  void *v174;
  const char *v175;
  uint64_t v176;
  uint64_t v177;
  void *v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  const char *v185;
  uint64_t v186;
  NSObject *v187;
  NSObject *v188;
  NSObject *v189;
  const char *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  double v195;
  double v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  const char *v208;
  uint64_t v209;
  uint64_t v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  const char *v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  CHTextTransformationResult *result;
  uint64_t v224;
  uint64_t v225;
  void *v226;
  os_signpost_id_t spid;
  id obj;
  id v229;
  CHTextTransformationResult *v230;
  void *v231;
  uint64_t i;
  void *v233;
  void *v234;
  id v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  unint64_t v239;
  uint64_t v240;
  _OWORD v242[3];
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  _OWORD v251[3];
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  uint8_t buf[8];
  void *v261;
  _BYTE v262[128];
  _BYTE v263[128];
  _BYTE v264[128];
  _BYTE v265[128];
  uint64_t v266;

  v266 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v229 = a5;
  v234 = v7;
  objc_msgSend_now(MEMORY[0x1E0C99D68], v8, v9, v10, v11, v12);
  v226 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_becomeCurrentWithPendingUnitCount_(v7, v13, 100, v14, v15, v16);
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v17 = (id)qword_1EF568E50;
  spid = os_signpost_id_generate(v17);

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v230 = retstr;
  v18 = (id)qword_1EF568E50;
  v19 = v18;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v19, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHTextTransform", ", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v20 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v20, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHTextTransform\", buf, 2u);
  }

  objc_msgSend__transformedTextLinesWithCancel_skipLineOrientationEstimate_useCache_progress_(self, v21, (uint64_t)v229, 0, 0, (uint64_t)v7);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v233 = (void *)objc_msgSend_mutableCopy(v22, v23, v24, v25, v26, v27);

  v28 = (void *)objc_opt_class();
  objc_msgSend_transformTextLines_withParameters_(v28, v29, (uint64_t)v233, (uint64_t)self->_transformationParameters, v30, v31);
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v32, v33, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v230->var0 = v37;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v38, v39, v40, v41, v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v230->var1 = v43;
  objc_msgSend_dictionary(MEMORY[0x1E0C99E08], v44, v45, v46, v47, v48);
  v231 = (void *)objc_claimAutoreleasedReturnValue();
  v230->var2 = v231;
  v256 = 0u;
  v257 = 0u;
  v258 = 0u;
  v259 = 0u;
  obj = v233;
  v224 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v49, (uint64_t)&v256, (uint64_t)v265, 16, v50);
  if (v224)
  {
    v239 = 0;
    v225 = *(_QWORD *)v257;
    do
    {
      for (i = 0; i != v224; ++i)
      {
        if (*(_QWORD *)v257 != v225)
          objc_enumerationMutation(obj);
        v56 = *(void **)(*((_QWORD *)&v256 + 1) + 8 * i);
        v252 = 0u;
        v253 = 0u;
        v254 = 0u;
        v255 = 0u;
        objc_msgSend_textSegments(v56, v51, v52, v53, v54, v55);
        v235 = (id)objc_claimAutoreleasedReturnValue();
        v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v57, (uint64_t)&v252, (uint64_t)v264, 16, v58);
        if (v59)
        {
          v236 = *(_QWORD *)v253;
          do
          {
            v240 = 0;
            v237 = v59;
            do
            {
              if (*(_QWORD *)v253 != v236)
                objc_enumerationMutation(v235);
              v60 = *(void **)(*((_QWORD *)&v252 + 1) + 8 * v240);
              v66 = (void *)objc_opt_class();
              if (v60)
                objc_msgSend_transform(v60, v61, v62, v63, v64, v65);
              else
                memset(v251, 0, sizeof(v251));
              objc_msgSend_textStrokePointTransformationFromAffineTransformation_(v66, v61, (uint64_t)v251, v63, v64, v65);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v43, v68, (uint64_t)v67, v69, v70, v71);

              objc_msgSend_array(MEMORY[0x1E0C99DE8], v72, v73, v74, v75, v76);
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v249 = 0u;
              v250 = 0u;
              v247 = 0u;
              v248 = 0u;
              objc_msgSend_textStrokes(v60, v78, v79, v80, v81, v82);
              v83 = (void *)objc_claimAutoreleasedReturnValue();
              v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v84, (uint64_t)&v247, (uint64_t)v263, 16, v85);
              if (v91)
              {
                v92 = *(_QWORD *)v248;
                do
                {
                  for (j = 0; j != v91; ++j)
                  {
                    if (*(_QWORD *)v248 != v92)
                      objc_enumerationMutation(v83);
                    objc_msgSend_strokeIdentifier(*(void **)(*((_QWORD *)&v247 + 1) + 8 * j), v86, v87, v88, v89, v90);
                    v94 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObject_(v77, v95, (uint64_t)v94, v96, v97, v98);

                  }
                  v91 = objc_msgSend_countByEnumeratingWithState_objects_count_(v83, v86, (uint64_t)&v247, (uint64_t)v263, 16, v90);
                }
                while (v91);
              }

              objc_msgSend_addObject_(v37, v99, (uint64_t)v77, v100, v101, v102);
              objc_msgSend_supportStrokes(v60, v103, v104, v105, v106, v107);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              v238 = objc_msgSend_count(v108, v109, v110, v111, v112, v113);

              v245 = 0u;
              v246 = 0u;
              v243 = 0u;
              v244 = 0u;
              objc_msgSend_supportStrokes(v60, v114, v115, v116, v117, v118);
              v119 = (void *)objc_claimAutoreleasedReturnValue();
              v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v243, (uint64_t)v262, 16, v121);
              if (v122)
              {
                v123 = *(_QWORD *)v244;
                if (v60)
                {
                  do
                  {
                    for (k = 0; k != v122; ++k)
                    {
                      if (*(_QWORD *)v244 != v123)
                        objc_enumerationMutation(v119);
                      v125 = *(void **)(*((_QWORD *)&v243 + 1) + 8 * k);
                      v126 = (void *)objc_opt_class();
                      objc_msgSend_transform(v60, v127, v128, v129, v130, v131);
                      objc_msgSend_textStrokePointTransformationFromAffineTransformation_(v126, v132, (uint64_t)v242, v133, v134, v135);
                      v136 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObject_(v43, v137, (uint64_t)v136, v138, v139, v140);

                      objc_msgSend_strokeIdentifier(v125, v141, v142, v143, v144, v145);
                      v146 = (void *)objc_claimAutoreleasedReturnValue();
                      v261 = v146;
                      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v147, (uint64_t)&v261, 1, v148, v149);
                      v150 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObject_(v37, v151, (uint64_t)v150, v152, v153, v154);

                    }
                    v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v155, (uint64_t)&v243, (uint64_t)v262, 16, v156);
                  }
                  while (v122);
                }
                else
                {
                  do
                  {
                    for (m = 0; m != v122; ++m)
                    {
                      if (*(_QWORD *)v244 != v123)
                        objc_enumerationMutation(v119);
                      v158 = *(void **)(*((_QWORD *)&v243 + 1) + 8 * m);
                      v159 = (void *)objc_opt_class();
                      memset(v242, 0, sizeof(v242));
                      objc_msgSend_textStrokePointTransformationFromAffineTransformation_(v159, v160, (uint64_t)v242, v161, v162, v163);
                      v164 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObject_(v43, v165, (uint64_t)v164, v166, v167, v168);

                      objc_msgSend_strokeIdentifier(v158, v169, v170, v171, v172, v173);
                      v174 = (void *)objc_claimAutoreleasedReturnValue();
                      v261 = v174;
                      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v175, (uint64_t)&v261, 1, v176, v177);
                      v178 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObject_(v37, v179, (uint64_t)v178, v180, v181, v182);

                    }
                    v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v183, (uint64_t)&v243, (uint64_t)v262, 16, v184);
                  }
                  while (v122);
                }
              }

              v239 += v238;
              ++v240;
            }
            while (v240 != v237);
            v59 = objc_msgSend_countByEnumeratingWithState_objects_count_(v235, v185, (uint64_t)&v252, (uint64_t)v264, 16, v186);
          }
          while (v59);
        }

      }
      v224 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v256, (uint64_t)v265, 16, v55);
    }
    while (v224);
  }
  else
  {
    v239 = 0;
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v187 = (id)qword_1EF568E50;
  v188 = v187;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v187))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v188, OS_SIGNPOST_INTERVAL_END, spid, "CHTextTransform", ", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v189 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v189, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v189, OS_LOG_TYPE_DEFAULT, "END \"CHTextTransform\", buf, 2u);
  }

  objc_msgSend_timeIntervalSinceNow(v226, v190, v191, v192, v193, v194);
  v196 = v195;
  v202 = objc_msgSend_count(self->_contextStrokes, v197, v198, v199, v200, v201);
  objc_msgSend_createTelemetryDictionary_nonTextRatio_(self, v203, v204, v205, v206, v207, v196 * -1000.0, (double)v239 / (double)(unint64_t)v202);
  v230->var2 = (id)objc_claimAutoreleasedReturnValue();

  v213 = objc_msgSend_totalUnitCount(v234, v208, v209, v210, v211, v212);
  objc_msgSend_setCompletedUnitCount_(v234, v214, v213, v215, v216, v217);
  objc_msgSend_resignCurrent(v234, v218, v219, v220, v221, v222);

  return result;
}

- (id)reflowableTokensSkipLineOrientationEstimate:(BOOL)a3 useCache:(BOOL)a4 preserveTokenOrder:(BOOL)a5 shouldCancel:(id)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  NSArray *v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  NSArray *contextResults;
  uint64_t v51;
  NSArray *relatedNonTextStrokes;
  uint64_t v53;
  uint64_t v54;
  id v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  NSObject *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  id v73;
  void *v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  uint8_t v83[128];
  uint8_t buf[4];
  uint64_t v85;
  __int16 v86;
  uint64_t v87;
  __int16 v88;
  uint64_t v89;
  _BYTE v90[128];
  uint64_t v91;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v91 = *MEMORY[0x1E0C80C00];
  v73 = a6;
  objc_msgSend__transformedTextLinesWithCancel_skipLineOrientationEstimate_useCache_progress_(self, v10, (uint64_t)v73, v8, v7, 0);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  objc_msgSend_reflowableTextTokensFromTransformedTextLines_(v11, v12, (uint64_t)v74, v13, v14, v15);
  v16 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v16;
  if (v6)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v17, v18, v19, v20, v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    v24 = self->_contextResults;
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v79, (uint64_t)v90, 16, v26);
    if (v32)
    {
      v33 = *(_QWORD *)v80;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v80 != v33)
            objc_enumerationMutation(v24);
          objc_msgSend_textResult(*(void **)(*((_QWORD *)&v79 + 1) + 8 * i), v27, v28, v29, v30, v31);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_revertTokenOrder_textResult_(self, v36, (uint64_t)v22, (uint64_t)v35, v37, v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObjectsFromArray_(v23, v40, (uint64_t)v39, v41, v42, v43);

        }
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v79, (uint64_t)v90, 16, v31);
      }
      while (v32);
    }

  }
  else
  {
    v23 = (void *)v16;
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v44 = (id)qword_1EF568E68;
  if (!os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
    goto LABEL_20;
  contextResults = self->_contextResults;
  if (!contextResults)
  {
    v51 = 0;
    relatedNonTextStrokes = self->_relatedNonTextStrokes;
    if (relatedNonTextStrokes)
      goto LABEL_16;
LABEL_18:
    v53 = 0;
    goto LABEL_19;
  }
  v51 = objc_msgSend_count(contextResults, v45, v46, v47, v48, v49);
  relatedNonTextStrokes = self->_relatedNonTextStrokes;
  if (!relatedNonTextStrokes)
    goto LABEL_18;
LABEL_16:
  v53 = objc_msgSend_count(relatedNonTextStrokes, v45, v46, v47, v48, v49);
LABEL_19:
  v54 = objc_msgSend_count(v23, v45, v46, v47, v48, v49);
  *(_DWORD *)buf = 134218496;
  v85 = v51;
  v86 = 2048;
  v87 = v53;
  v88 = 2048;
  v89 = v54;
  _os_log_impl(&dword_1BE607000, v44, OS_LOG_TYPE_DEBUG, "Computed reflowable results from %ld context results, and %ld related non-text strokes: created %ld reflowable tokens", buf, 0x20u);
LABEL_20:

  v77 = 0u;
  v78 = 0u;
  v75 = 0u;
  v76 = 0u;
  v55 = v23;
  v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v75, (uint64_t)v83, 16, v57);
  if (!v58)
    goto LABEL_33;
  v59 = *(_QWORD *)v76;
  do
  {
    v60 = 0;
    do
    {
      if (*(_QWORD *)v76 != v59)
        objc_enumerationMutation(v55);
      v61 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v60);
      if (qword_1EF568E88 == -1)
      {
        v62 = (id)qword_1EF568E68;
        if (!os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
          goto LABEL_28;
LABEL_27:
        objc_msgSend_description(v61, v63, v64, v65, v66, v67);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v85 = (uint64_t)v68;
        _os_log_impl(&dword_1BE607000, v62, OS_LOG_TYPE_DEBUG, "%@\n", buf, 0xCu);

        goto LABEL_28;
      }
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v62 = (id)qword_1EF568E68;
      if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
        goto LABEL_27;
LABEL_28:

      ++v60;
    }
    while (v58 != v60);
    v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v69, (uint64_t)&v75, (uint64_t)v83, 16, v70);
    v58 = v71;
  }
  while (v71);
LABEL_33:

  return v55;
}

- (id)tokenSupportRangesForNonTextStrokes
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSArray *relatedNonTextStrokes;
  void *v8;
  uint64_t v9;
  const char *v10;
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
  uint64_t v22;
  unint64_t v23;
  void *v24;
  double v25;
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
  double v54;
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
  uint64_t v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  void *v89;
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
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
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
  void *v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  id v125;
  const char *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  void *v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  NSArray *obj;
  uint64_t v152;
  id v153;
  uint64_t v154;
  _QWORD v155[4];
  id v156;
  CHTextTransformationManager *v157;
  uint64_t *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t *v164;
  uint64_t v165;
  __n128 (*v166)(__n128 *, __n128 *);
  uint64_t (*v167)();
  void *v168;
  __int128 v169;
  __int128 v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  _QWORD v174[3];
  _BYTE v175[128];
  uint64_t v176;

  v176 = *MEMORY[0x1E0C80C00];
  relatedNonTextStrokes = self->_relatedNonTextStrokes;
  if (relatedNonTextStrokes)
  {
    v8 = (void *)MEMORY[0x1E0C99DE8];
    v9 = objc_msgSend_count(relatedNonTextStrokes, a2, v2, v3, v4, v5);
    objc_msgSend_arrayWithCapacity_(v8, v10, v9, v11, v12, v13);
    v153 = (id)objc_claimAutoreleasedReturnValue();
    v172 = 0u;
    v173 = 0u;
    v170 = 0u;
    v171 = 0u;
    obj = self->_relatedNonTextStrokes;
    v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v170, (uint64_t)v175, 16, v15);
    if (v16)
    {
      v152 = *(_QWORD *)v171;
      do
      {
        v22 = 0;
        v154 = v16;
        do
        {
          if (*(_QWORD *)v171 != v152)
            objc_enumerationMutation(obj);
          v23 = 0;
          v24 = *(void **)(*((_QWORD *)&v170 + 1) + 8 * v22);
          v25 = -1.0;
          v26 = 0x7FFFFFFFFFFFFFFFLL;
          while (v23 < objc_msgSend_count(self->_contextResults, v17, v18, v19, v20, v21))
          {
            objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v27, v23, v28, v29, v30);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeGroup(v31, v32, v33, v34, v35, v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeIdentifiers(v37, v38, v39, v40, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_allObjects(v43, v44, v45, v46, v47, v48);
            v49 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_supportFromStrokes_(v24, v50, (uint64_t)v49, v51, v52, v53);
            if (v54 > v25)
            {
              v26 = v23;
              v25 = v54;
            }

            ++v23;
          }
          v163 = 0;
          v164 = &v163;
          v165 = 0x4012000000;
          v166 = sub_1BE79DB78;
          v167 = nullsub_33;
          v168 = &unk_1BE94989A;
          v169 = xmmword_1BE8D6920;
          if (v25 <= 0.0)
          {
            objc_msgSend_addObject_(v153, v27, (uint64_t)&unk_1E7827F08, v28, v29, v30);
          }
          else
          {
            v55 = (void *)objc_opt_class();
            objc_msgSend_strokeIdentifier(v24, v56, v57, v58, v59, v60);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeProvider(self, v62, v63, v64, v65, v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokeForIdentifier_inStrokeProvider_(v55, v68, (uint64_t)v61, (uint64_t)v67, v69, v70);
            v71 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_bounds(v71, v72, v73, v74, v75, v76);
            v78 = v77;
            v80 = v79;
            v82 = v81;
            v84 = v83;

            objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v85, v26, v86, v87, v88);
            v89 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_textResult(v89, v90, v91, v92, v93, v94);
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_inputStrokeIdentifiers(v95, v96, v97, v98, v99, v100);
            v101 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v102, v26, v103, v104, v105);
            v106 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_textResult(v106, v107, v108, v109, v110, v111);
            v112 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_topModelTranscriptionPath(v112, v113, v114, v115, v116, v117);
            v118 = (void *)objc_claimAutoreleasedReturnValue();
            v124 = objc_msgSend_tokenColumnCount(v112, v119, v120, v121, v122, v123);
            v155[0] = MEMORY[0x1E0C809B0];
            v155[1] = 3221225472;
            v155[2] = sub_1BE79DB88;
            v155[3] = &unk_1E77F4EE8;
            v125 = v101;
            v156 = v125;
            v157 = self;
            v159 = v78;
            v160 = v80;
            v161 = v82;
            v162 = v84;
            v158 = &v163;
            objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v112, v126, (uint64_t)v118, 0, v124, (uint64_t)v155);
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v127, v26, v128, v129, v130);
            v131 = (void *)objc_claimAutoreleasedReturnValue();
            v174[0] = v131;
            objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v132, v164[6], v133, v134, v135);
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            v174[1] = v136;
            objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v137, v164[7], v138, v139, v140);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            v174[2] = v141;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v142, (uint64_t)v174, 3, v143, v144);
            v145 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObject_(v153, v146, (uint64_t)v145, v147, v148, v149);

          }
          _Block_object_dispose(&v163, 8);
          ++v22;
        }
        while (v22 != v154);
        v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v170, (uint64_t)v175, 16, v21);
      }
      while (v16);
    }

  }
  else
  {
    v153 = (id)MEMORY[0x1E0C9AA60];
  }
  return v153;
}

- (id)_transformedTextLinesWithCancel:(id)a3 skipLineOrientationEstimate:(BOOL)a4 useCache:(BOOL)a5 progress:(id)a6
{
  _BOOL4 v7;
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
  id v19;
  void *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t i;
  const char *v38;
  uint64_t v39;
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
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  NSSet *excludedStrokeTypes;
  void *v71;
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
  const char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  _BOOL4 v87;
  double v88;
  id v89;
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
  double v106;
  long double v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  long double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  void *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  const char *v164;
  NSObject *v165;
  NSObject *v166;
  const char *v167;
  NSObject *v168;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
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
  void *v187;
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
  NSObject *v207;
  NSObject *v208;
  const char *v209;
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
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  const char *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  unint64_t v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  const char *v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  _BOOL4 v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  void *v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  void *v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  const char *v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  void *v274;
  const char *v275;
  uint64_t v276;
  uint64_t v277;
  uint64_t v278;
  uint64_t v279;
  int v280;
  const char *v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  void *v285;
  const char *v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  int v291;
  const char *v292;
  uint64_t v293;
  const char *v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  NSObject *v303;
  const char *v304;
  uint64_t v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t j;
  const char *v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  const char *v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  NSObject *v323;
  const char *v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  void *v329;
  _BOOL4 v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  id v341;
  const char *v342;
  uint64_t v343;
  const char *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t k;
  long double v352;
  NSMutableArray *correctionAngles;
  const char *v354;
  uint64_t v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v365;
  uint64_t v366;
  _BOOL4 v367;
  void *v368;
  uint64_t v370;
  id v371;
  void *v372;
  uint64_t v373;
  void *v374;
  void *v375;
  void *v376;
  id v377;
  void *v378;
  uint64_t (**v379)(void);
  void *v380;
  void *v381;
  void *v382;
  void *v383;
  void *v384;
  _BYTE *v385;
  uint64_t v386;
  void *v387;
  void *v388;
  void *v389;
  void *v390;
  void *__p;
  void *v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  __int128 v399;
  __int128 v400;
  _QWORD v401[4];
  id v402;
  void **v403;
  uint64_t *v404;
  uint64_t v405;
  uint64_t *v406;
  uint64_t v407;
  char v408;
  _BYTE v409[128];
  uint8_t v410[128];
  uint8_t buf[4];
  uint64_t v412;
  __int16 v413;
  uint64_t v414;
  uint64_t v415;

  v7 = a5;
  v415 = *MEMORY[0x1E0C80C00];
  v379 = (uint64_t (**)(void))a3;
  v371 = a6;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v9, v10, v11, v12, v13);
  v375 = (void *)objc_claimAutoreleasedReturnValue();
  if (!self->_contextResults || !self->_strokeProvider || v379 && (v379[2]() & 1) != 0)
  {
    v19 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_115;
  }
  if (v371)
  {
    v20 = (void *)MEMORY[0x1E0CB38A8];
    v21 = objc_msgSend_count(self->_contextResults, v14, v15, v16, v17, v18);
    objc_msgSend_progressWithTotalUnitCount_parent_pendingUnitCount_(v20, v22, v21, (uint64_t)v371, 50, v23);
    v368 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v368 = 0;
  }
  objc_msgSend_tokenSupportRangesForNonTextStrokes(self, v14, v15, v16, v17, v18);
  v380 = (void *)objc_claimAutoreleasedReturnValue();
  v367 = v7;
  v24 = objc_alloc(MEMORY[0x1E0C99E20]);
  v29 = (void *)objc_msgSend_initWithArray_(v24, v25, (uint64_t)self->_contextStrokes, v26, v27, v28);
  v30 = 0;
  for (i = objc_msgSend_count(self->_contextResults, v31, v32, v33, v34, v35, 138412290, v36);
        v30 < i;
        i = objc_msgSend_count(self->_contextResults, v38, v39, v40, v41, v42, v365, v366))
  {
    if (v379 && v379[2]())
    {
      objc_msgSend_removeAllObjects(v375, v38, v43, v40, v41, v42);
      goto LABEL_93;
    }
    objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v38, v30, v40, v41, v42);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_strokeGroup(v44, v45, v46, v47, v48, v49);
    v383 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_objectAtIndexedSubscript_(self->_contextResults, v50, v30, v51, v52, v53);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_textResult(v54, v55, v56, v57, v58, v59);
    v381 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend_inputStrokeIdentifiers(v381, v60, v61, v62, v63, v64);
    v382 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v381
      || !v382
      || !v383
      || (excludedStrokeTypes = self->_excludedStrokeTypes,
          v71 = (void *)MEMORY[0x1E0CB37E8],
          v72 = objc_msgSend_classification(v383, v65, v66, v67, v68, v69),
          objc_msgSend_numberWithInteger_(v71, v73, v72, v74, v75, v76),
          v77 = (void *)objc_claimAutoreleasedReturnValue(),
          LOBYTE(excludedStrokeTypes) = objc_msgSend_containsObject_(excludedStrokeTypes, v78, (uint64_t)v77, v79, v80, v81), v77, (excludedStrokeTypes & 1) != 0))
    {

      goto LABEL_10;
    }
    if (a4)
    {
      v87 = 0;
      v88 = 1.79769313e308;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v89 = v383;
        objc_msgSend_writingDirectionSortedSubstrokes(v89, v90, v91, v92, v93, v94);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = (unint64_t)objc_msgSend_count(v95, v96, v97, v98, v99, v100) > 6;

        v88 = 0.0;
        if (v87)
        {
          objc_msgSend_averageWritingOrientation(v89, v101, v102, v103, v104, v105);
          v107 = v106;
          objc_msgSend_averageWritingOrientation(v89, v108, v109, v110, v111, v112);
          v88 = -atan2(v107, v113);
        }

      }
      else
      {
        v87 = 0;
        v88 = 0.0;
      }
    }
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v82, v83, v84, v85, v86);
    v376 = (void *)objc_claimAutoreleasedReturnValue();
    v384 = 0;
    v385 = &v384;
    v386 = 0x2020000000;
    LOBYTE(v387) = 1;
    v405 = 0;
    v406 = &v405;
    v407 = 0x2020000000;
    v408 = 0;
    objc_msgSend_topModelTranscriptionPath(v381, v114, v115, v116, v117, v118);
    v374 = (void *)objc_claimAutoreleasedReturnValue();
    v124 = objc_msgSend_tokenColumnCount(v381, v119, v120, v121, v122, v123);
    v401[0] = MEMORY[0x1E0C809B0];
    v401[1] = 3221225472;
    v401[2] = sub_1BE79EE58;
    v401[3] = &unk_1E77F4F10;
    v377 = v376;
    v402 = v377;
    v403 = &v384;
    v404 = &v405;
    objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v381, v125, (uint64_t)v374, 0, v124, (uint64_t)v401);
    if (*((_BYTE *)v406 + 24))
    {
      v129 = (void *)objc_opt_class();
      objc_msgSend_changeTokensToVisualOrder_(v129, v130, (uint64_t)v377, v131, v132, v133);
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      v140 = objc_msgSend_mutableCopy(v134, v135, v136, v137, v138, v139);

      v377 = (id)v140;
    }
    objc_msgSend_strokesForIdentifiers_inStrokeProvider_(CHStrokeUtilities, v126, (uint64_t)v382, (uint64_t)self->_strokeProvider, v127, v128);
    v372 = (void *)objc_claimAutoreleasedReturnValue();
    v373 = objc_msgSend_count(v372, v141, v142, v143, v144, v145);
    v370 = objc_msgSend_count(v382, v146, v147, v148, v149, v150);
    if (v373 == v370)
    {
      if (v385[24])
      {
        v151 = (void *)objc_opt_class();
        objc_msgSend_locale(v381, v152, v153, v154, v155, v156);
        v157 = (void *)objc_claimAutoreleasedReturnValue();
        v163 = objc_msgSend_classification(v383, v158, v159, v160, v161, v162);
        objc_msgSend_textLineForTokensWithPrincipalLines_strokes_locale_strokeClassification_(v151, v164, (uint64_t)v377, (uint64_t)v372, (uint64_t)v157, v163);
        v378 = (void *)objc_claimAutoreleasedReturnValue();

        if (v378)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v165 = (id)qword_1EF568E68;
          if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v166 = v165;
            v167 = "Succesfully loaded principal lines from recognition result tokens.";
            goto LABEL_61;
          }
          goto LABEL_62;
        }
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v207 = (id)qword_1EF568E68;
        if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v208 = v207;
          v209 = "Failed to load principal lines from recognition result tokens.";
          goto LABEL_54;
        }
        goto LABEL_55;
      }
      if (v367 && v87)
      {
        v187 = (void *)objc_opt_class();
        objc_msgSend_strokeProvider(self, v188, v189, v190, v191, v192);
        v193 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_locale(v381, v194, v195, v196, v197, v198);
        v199 = (void *)objc_claimAutoreleasedReturnValue();
        v205 = objc_msgSend_classification(v383, v200, v201, v202, v203, v204);
        objc_msgSend_textLineFromCachedResults_tokens_strokes_estimatedOrientation_locale_strokeClassification_(v187, v206, (uint64_t)v193, (uint64_t)v377, (uint64_t)v372, (uint64_t)v199, v205, v88);
        v378 = (void *)objc_claimAutoreleasedReturnValue();

        if (v378)
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v165 = (id)qword_1EF568E68;
          if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            v166 = v165;
            v167 = "Succesfully loaded principal lines from cached results.";
            goto LABEL_61;
          }
LABEL_62:

          v229 = 0;
          while (2)
          {
            if (v229 >= objc_msgSend_count(self->_relatedNonTextStrokes, v224, v225, v226, v227, v228))
            {
              objc_msgSend_addObject_(v375, v230, (uint64_t)v378, v231, v232, v233);
              v399 = 0u;
              v400 = 0u;
              v397 = 0u;
              v398 = 0u;
              v303 = v382;
              v310 = objc_msgSend_countByEnumeratingWithState_objects_count_(v303, v304, (uint64_t)&v397, (uint64_t)v410, 16, v305);
              if (v310)
              {
                v311 = *(_QWORD *)v398;
                do
                {
                  for (j = 0; j != v310; ++j)
                  {
                    if (*(_QWORD *)v398 != v311)
                      objc_enumerationMutation(v303);
                    objc_msgSend_removeObject_(v29, v306, *(_QWORD *)(*((_QWORD *)&v397 + 1) + 8 * j), v307, v308, v309);
                  }
                  v310 = objc_msgSend_countByEnumeratingWithState_objects_count_(v303, v306, (uint64_t)&v397, (uint64_t)v410, 16, v309);
                }
                while (v310);
              }
              goto LABEL_82;
            }
            objc_msgSend_objectAtIndexedSubscript_(v380, v230, v229, v231, v232, v233);
            v234 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_firstObject(v234, v235, v236, v237, v238, v239);
            v240 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_numberWithInteger_(MEMORY[0x1E0CB37E8], v241, v30, v242, v243, v244);
            v245 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend_isEqualToNumber_(v240, v246, (uint64_t)v245, v247, v248, v249))
            {
              v255 = objc_msgSend_count(v234, v250, v251, v252, v253, v254) == 3;

              if (v255)
              {
                objc_msgSend_objectAtIndexedSubscript_(self->_relatedNonTextStrokes, v256, v229, v257, v258, v259);
                v260 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_strokeIdentifier(v260, v261, v262, v263, v264, v265);
                v266 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_strokeForIdentifier_inStrokeProvider_(CHStrokeUtilities, v267, (uint64_t)v266, (uint64_t)self->_strokeProvider, v268, v269);
                v240 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend_objectAtIndexedSubscript_(v234, v270, 1, v271, v272, v273);
                v274 = (void *)objc_claimAutoreleasedReturnValue();
                v280 = objc_msgSend_intValue(v274, v275, v276, v277, v278, v279);
                objc_msgSend_objectAtIndexedSubscript_(v234, v281, 2, v282, v283, v284);
                v285 = (void *)objc_claimAutoreleasedReturnValue();
                v291 = objc_msgSend_intValue(v285, v286, v287, v288, v289, v290);
                objc_msgSend_addSupportStroke_tokenRange_(v378, v292, (uint64_t)v240, v280, v291, v293);

                objc_msgSend_strokeIdentifier(v240, v294, v295, v296, v297, v298);
                v245 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_removeObject_(v29, v299, (uint64_t)v245, v300, v301, v302);
                goto LABEL_67;
              }
            }
            else
            {
LABEL_67:

            }
            ++v229;
            continue;
          }
        }
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v207 = (id)qword_1EF568E68;
        if (os_log_type_enabled(v207, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v208 = v207;
          v209 = "Failed to load principal lines from cached results.";
LABEL_54:
          _os_log_impl(&dword_1BE607000, v208, OS_LOG_TYPE_DEFAULT, v209, buf, 2u);
        }
LABEL_55:

      }
      v210 = (void *)objc_opt_class();
      objc_msgSend_locale(v381, v211, v212, v213, v214, v215);
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      v222 = objc_msgSend_classification(v383, v217, v218, v219, v220, v221);
      objc_msgSend_textLineForStrokes_tokens_locale_strokeClassification_initialOrientationEstimate_shouldCancel_(v210, v223, (uint64_t)v372, (uint64_t)v377, (uint64_t)v216, v222, v379, v88);
      v378 = (void *)objc_claimAutoreleasedReturnValue();

      if (v378)
      {
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v165 = (id)qword_1EF568E68;
        if (os_log_type_enabled(v165, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v166 = v165;
          v167 = "Succesfully found principal lines from alpha shape matching.";
LABEL_61:
          _os_log_impl(&dword_1BE607000, v166, OS_LOG_TYPE_DEFAULT, v167, buf, 2u);
        }
        goto LABEL_62;
      }
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v303 = (id)qword_1EF568E68;
      if (os_log_type_enabled(v303, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BE607000, v303, OS_LOG_TYPE_DEFAULT, "Failed to find principal lines from alpha shape matching.", buf, 2u);
      }
      v378 = 0;
LABEL_82:

      if (v371)
      {
        v318 = objc_msgSend_completedUnitCount(v368, v313, v314, v315, v316, v317);
        objc_msgSend_setCompletedUnitCount_(v368, v319, v318 + 1, v320, v321, v322);
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v323 = (id)qword_1EF568E68;
        if (os_log_type_enabled(v323, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend_localizedDescription(v368, v324, v325, v326, v327, v328);
          v329 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = v365;
          v412 = (uint64_t)v329;
          _os_log_impl(&dword_1BE607000, v323, OS_LOG_TYPE_DEBUG, "Reflow Task Progress (transform): %@", buf, 0xCu);

        }
      }

      v186 = v370;
      goto LABEL_89;
    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v168 = (id)qword_1EF568E68;
    if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
    {
      v174 = objc_msgSend_count(v382, v169, v170, v171, v172, v173);
      v180 = objc_msgSend_count(v372, v175, v176, v177, v178, v179);
      *(_DWORD *)buf = 134218240;
      v412 = v174;
      v413 = 2048;
      v414 = v180;
      _os_log_impl(&dword_1BE607000, v168, OS_LOG_TYPE_ERROR, "Incorrect number of strokes in text line: %ld strokes expected, %ld strokes retrieved from the provider.", buf, 0x16u);
    }

    objc_msgSend_removeAllObjects(v375, v181, v182, v183, v184, v185);
    v186 = v370;
LABEL_89:
    v330 = v373 == v186;

    _Block_object_dispose(&v405, 8);
    _Block_object_dispose(&v384, 8);

    if (!v330)
      break;
LABEL_10:
    ++v30;
  }
  if (v379)
  {
LABEL_93:
    if (v379[2]())
      objc_msgSend_removeAllObjects(v375, v38, v39, v40, v41, v42);
  }
  if (objc_msgSend_count(v375, v38, v39, v40, v41, v42))
    objc_msgSend_assignRemainingStrokes_toTextLines_(self, v331, (uint64_t)v29, (uint64_t)v375, v334, v335);
  if (v368)
  {
    v336 = objc_msgSend_totalUnitCount(v368, v331, v332, v333, v334, v335);
    objc_msgSend_setCompletedUnitCount_(v368, v337, v336, v338, v339, v340);
  }
  v395 = 0u;
  v396 = 0u;
  v393 = 0u;
  v394 = 0u;
  v341 = v375;
  v349 = objc_msgSend_countByEnumeratingWithState_objects_count_(v341, v342, (uint64_t)&v393, (uint64_t)v409, 16, v343);
  if (v349)
  {
    v350 = *(_QWORD *)v394;
    do
    {
      for (k = 0; k != v349; ++k)
      {
        if (*(_QWORD *)v394 != v350)
          objc_enumerationMutation(v341);
        objc_msgSend_principalLines(*(void **)(*((_QWORD *)&v393 + 1) + 8 * k), v344, v345, v346, v347, v348);
        v352 = atan2(*((double *)v387 + 3) - *((double *)v387 + 1), *((double *)v387 + 2) - *(double *)v387);
        correctionAngles = self->_correctionAngles;
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v354, v355, v356, v357, v358, (double)(v352 * 57.2957795));
        v359 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(correctionAngles, v360, (uint64_t)v359, v361, v362, v363);

        if (__p)
        {
          v392 = __p;
          operator delete(__p);
        }
        if (v389)
        {
          v390 = v389;
          operator delete(v389);
        }
        if (v387)
        {
          v388 = v387;
          operator delete(v387);
        }
        if (v384)
        {
          v385 = v384;
          operator delete(v384);
        }
      }
      v349 = objc_msgSend_countByEnumeratingWithState_objects_count_(v341, v344, (uint64_t)&v393, (uint64_t)v409, 16, v348);
    }
    while (v349);
  }

  v19 = v341;
LABEL_115:

  return v19;
}

+ (void)transformTextLines:(id)a3 withParameters:(id)a4
{
  id v5;
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  const char *v29;
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
  uint64_t v42;
  uint64_t v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
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
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  double v62;
  id v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  double v80;
  const char *v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
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
  uint64_t v101;
  double v102;
  double v103;
  double v104;
  double v105;
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
  double v116;
  double v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
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
  uint64_t v138;
  uint64_t v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
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
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  const char *v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  const char *v194;
  uint64_t v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  double v206;
  double v207;
  _BOOL8 v208;
  void *v209;
  const char *v210;
  uint64_t v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  const char *v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  void *v240;
  const char *v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  _OWORD v254[3];
  _OWORD v255[3];
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  __int128 v261;
  __int128 v262;
  _BYTE v263[128];
  uint64_t v264;

  v264 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend_orientationBehavior(v6, v7, v8, v9, v10, v11))
  {
    v17 = (void *)objc_opt_class();
    v23 = objc_msgSend_orientationBehavior(v6, v18, v19, v20, v21, v22);
    objc_msgSend_orientationTarget(v6, v24, v25, v26, v27, v28);
    objc_msgSend_applyOrientationToTextLines_orientationBehavior_orientationTarget_(v17, v29, (uint64_t)v5, v23, v30, v31);
  }
  if (objc_msgSend_resizeBehavior(v6, v12, v13, v14, v15, v16))
  {
    v37 = (void *)objc_opt_class();
    v43 = objc_msgSend_resizeBehavior(v6, v38, v39, v40, v41, v42);
    v49 = objc_msgSend_textSizeTarget(v6, v44, v45, v46, v47, v48);
    objc_msgSend_textSizeModifier(v6, v50, v51, v52, v53, v54);
    objc_msgSend_applyResizeToTextLines_resizeBehavior_resizeTarget_resizeModifier_(v37, v55, (uint64_t)v5, v43, v49, v56);
  }
  objc_msgSend_italicsModifier(v6, v32, v33, v34, v35, v36);
  if (v62 > 0.0)
  {
    v261 = 0u;
    v262 = 0u;
    v259 = 0u;
    v260 = 0u;
    v63 = v5;
    v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v64, (uint64_t)&v259, (uint64_t)v263, 16, v65);
    if (v66)
    {
      v67 = *(_QWORD *)v260;
      do
      {
        v68 = 0;
        do
        {
          if (*(_QWORD *)v260 != v67)
            objc_enumerationMutation(v63);
          v69 = *(void **)(*((_QWORD *)&v259 + 1) + 8 * v68);
          v257 = 0u;
          v258 = 0u;
          v256 = 0u;
          v70 = (void *)objc_opt_class();
          objc_msgSend_italicsModifier(v6, v71, v72, v73, v74, v75);
          if (v70)
          {
            objc_msgSend_getItalicsTransformForTextLine_skew_(v70, v76, (uint64_t)v69, v77, v78, v79, -v80);
          }
          else
          {
            v257 = 0u;
            v258 = 0u;
            v256 = 0u;
          }
          v255[0] = v256;
          v255[1] = v257;
          v255[2] = v258;
          objc_msgSend_addTransform_(v69, v76, (uint64_t)v255, v77, v78, v79);
          ++v68;
        }
        while (v66 != v68);
        v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(v63, v81, (uint64_t)&v259, (uint64_t)v263, 16, v82);
      }
      while (v66);
    }

  }
  objc_msgSend_insertionPoint(v6, v57, v58, v59, v60, v61);
  if (v88 != -1.0)
  {
    objc_msgSend_insertionPoint(v6, v83, v84, v85, v86, v87);
    if (v89 != -1.0)
    {
      v257 = 0u;
      v258 = 0u;
      v256 = 0u;
      v90 = (void *)objc_opt_class();
      objc_msgSend_firstObject(v5, v91, v92, v93, v94, v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_anchorPoint(v96, v97, v98, v99, v100, v101);
      v103 = v102;
      v105 = v104;
      objc_msgSend_insertionPoint(v6, v106, v107, v108, v109, v110);
      if (v90)
      {
        objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v90, v111, v112, v113, v114, v115, v103, v105, v116, v117);
      }
      else
      {
        v257 = 0u;
        v258 = 0u;
        v256 = 0u;
      }

      objc_msgSend_firstObject(v5, v118, v119, v120, v121, v122);
      v123 = (void *)objc_claimAutoreleasedReturnValue();
      v254[0] = v256;
      v254[1] = v257;
      v254[2] = v258;
      objc_msgSend_addTransform_(v123, v124, (uint64_t)v254, v125, v126, v127);

    }
  }
  if (objc_msgSend_wrapLines(v6, v83, v84, v85, v86, v87))
  {
    v133 = (void *)objc_opt_class();
    v139 = objc_msgSend_lineSpaceBehavior(v6, v134, v135, v136, v137, v138);
    v145 = objc_msgSend_alignmentBehavior(v6, v140, v141, v142, v143, v144);
    v151 = objc_msgSend_leftMargin(v6, v146, v147, v148, v149, v150);
    v157 = objc_msgSend_rightMargin(v6, v152, v153, v154, v155, v156);
    objc_msgSend_insertionPoint(v6, v158, v159, v160, v161, v162);
    objc_msgSend_applyWrapToTextLines_lineSpaceBehavior_alignmentBehavior_leftMargin_rightMargin_insertionPoint_(v133, v163, (uint64_t)v5, v139, v145, v151, v157);
    v164 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v164;
  }
  if ((unint64_t)objc_msgSend_count(v5, v128, v129, v130, v131, v132) >= 2
    && objc_msgSend_mergeLines(v6, v165, v166, v167, v168, v169))
  {
    v170 = (void *)objc_opt_class();
    v176 = objc_msgSend_alignmentBehavior(v6, v171, v172, v173, v174, v175);
    v182 = objc_msgSend_leftMargin(v6, v177, v178, v179, v180, v181);
    v188 = objc_msgSend_rightMargin(v6, v183, v184, v185, v186, v187);
    objc_msgSend_insertionPoint(v6, v189, v190, v191, v192, v193);
    objc_msgSend_applyMergeToTextLines_alignmentBehavior_leftMargin_rightMargin_insertionPoint_(v170, v194, (uint64_t)v5, v176, v182, v188);
    v195 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v195;
  }
  if (objc_msgSend_alignmentBehavior(v6, v165, v166, v167, v168, v169))
  {
    objc_msgSend_insertionPoint(v6, v196, v197, v198, v199, v200);
    if (v206 == -1.0)
    {
      v208 = 1;
    }
    else
    {
      objc_msgSend_insertionPoint(v6, v201, v202, v203, v204, v205);
      v208 = v207 == -1.0;
    }
    v209 = (void *)objc_opt_class();
    v215 = objc_msgSend_alignmentBehavior(v6, v210, v211, v212, v213, v214);
    v221 = objc_msgSend_leftMargin(v6, v216, v217, v218, v219, v220);
    v227 = objc_msgSend_rightMargin(v6, v222, v223, v224, v225, v226);
    objc_msgSend_applyAlignmentToTextLines_alignmentBehavior_leftMargin_rightMargin_alignFirstLine_(v209, v228, (uint64_t)v5, v215, v221, v227, v208);
  }
  if ((unint64_t)objc_msgSend_count(v5, v196, v197, v198, v199, v200) >= 2
    && objc_msgSend_lineSpaceBehavior(v6, v229, v230, v231, v232, v233))
  {
    v239 = objc_msgSend_orientationBehavior(v6, v234, v235, v236, v237, v238);
    v240 = (void *)objc_opt_class();
    v246 = objc_msgSend_lineSpaceBehavior(v6, v241, v242, v243, v244, v245);
    v252 = objc_msgSend_lineSpaceTarget(v6, v247, v248, v249, v250, v251);
    objc_msgSend_applyLineSpacingToTextLines_lineSpaceBehavior_lineSpaceTarget_linesAreParallel_(v240, v253, (uint64_t)v5, v246, v252, v239 != 0);
  }

}

+ (void)applyOrientationToTextLines:(id)a3 orientationBehavior:(unint64_t)a4 orientationTarget:(double)a5
{
  id v7;
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
  double v19;
  id v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  _OWORD v34[3];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v12 = v7;
  if (a4)
  {
    if (a4 != 3)
    {
      if (a4 == 1)
      {
        objc_msgSend_objectAtIndexedSubscript_(v7, v8, 0, v9, v10, v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_orientation(v13, v14, v15, v16, v17, v18);
        a5 = v19;

      }
      else
      {
        a5 = 0.0;
      }
    }
    v40 = 0u;
    v41 = 0u;
    v38 = 0u;
    v39 = 0u;
    v20 = v12;
    v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v38, (uint64_t)v42, 16, v22);
    if (v23)
    {
      v24 = *(_QWORD *)v39;
      do
      {
        v25 = 0;
        do
        {
          if (*(_QWORD *)v39 != v24)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * v25);
          v36 = 0u;
          v37 = 0u;
          v35 = 0u;
          v27 = (void *)objc_opt_class();
          if (v27)
          {
            objc_msgSend_rotationTransformForTextLine_targetAngle_(v27, v28, (uint64_t)v26, v29, v30, v31, a5);
          }
          else
          {
            v36 = 0u;
            v37 = 0u;
            v35 = 0u;
          }
          v34[0] = v35;
          v34[1] = v36;
          v34[2] = v37;
          objc_msgSend_addTransform_(v26, v28, (uint64_t)v34, v29, v30, v31);
          ++v25;
        }
        while (v23 != v25);
        v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v32, (uint64_t)&v38, (uint64_t)v42, 16, v33);
      }
      while (v23);
    }

  }
}

+ (void)applyResizeToTextLines:(id)a3 resizeBehavior:(unint64_t)a4 resizeTarget:(unint64_t)a5 resizeModifier:(double)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  double v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  id v24;
  const char *v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  uint64_t i;
  double v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  double v54;
  double v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t k;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  _BYTE v85[128];
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v15 = v9;
  if (a4 == 4)
  {
    v82 = 0u;
    v83 = 0u;
    v80 = 0u;
    v81 = 0u;
    v24 = v9;
    v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v80, (uint64_t)v85, 16, v26);
    if (v32)
    {
      v33 = *(_QWORD *)v81;
      v34 = 0.0;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v81 != v33)
            objc_enumerationMutation(v24);
          objc_msgSend_lineHeight(*(void **)(*((_QWORD *)&v80 + 1) + 8 * i), v27, v28, v29, v30, v31);
          v34 = v34 + v36;
        }
        v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v27, (uint64_t)&v80, (uint64_t)v85, 16, v31);
      }
      while (v32);
    }
    else
    {
      v34 = 0.0;
    }

    v16 = v34 / (double)(unint64_t)objc_msgSend_count(v24, v37, v38, v39, v40, v41);
    goto LABEL_16;
  }
  if (a4 == 3)
  {
    v16 = (double)a5;
    goto LABEL_17;
  }
  v16 = 18.0;
  if (a4 != 1)
  {
LABEL_16:
    if (!a4)
      goto LABEL_37;
    goto LABEL_17;
  }
  objc_msgSend_firstObject(v9, v10, v11, v12, v13, v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_lineHeight(v17, v18, v19, v20, v21, v22);
  v16 = v23;

LABEL_17:
  v78 = 0u;
  v79 = 0u;
  v76 = 0u;
  v77 = 0u;
  v42 = v15;
  v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v76, (uint64_t)v84, 16, v44);
  if (v50)
  {
    v51 = *(_QWORD *)v77;
    if (a4 == 2)
    {
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v77 != v51)
            objc_enumerationMutation(v42);
          v53 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * j);
          objc_msgSend_lineHeight(v53, v45, v46, v47, v48, v49);
          v55 = v54;
          v74 = 0u;
          v75 = 0u;
          v73 = 0u;
          v56 = (void *)objc_opt_class();
          if (v56)
          {
            objc_msgSend_getResizeTransformForTextLine_targetSize_(v56, v57, (uint64_t)v53, v58, v59, v60, v55 * a6);
          }
          else
          {
            v74 = 0u;
            v75 = 0u;
            v73 = 0u;
          }
          v70 = v73;
          v71 = v74;
          v72 = v75;
          objc_msgSend_addTransform_(v53, v57, (uint64_t)&v70, v58, v59, v60);
        }
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v45, (uint64_t)&v76, (uint64_t)v84, 16, v49);
      }
      while (v50);
    }
    else
    {
      do
      {
        for (k = 0; k != v50; ++k)
        {
          if (*(_QWORD *)v77 != v51)
            objc_enumerationMutation(v42);
          v62 = *(void **)(*((_QWORD *)&v76 + 1) + 8 * k);
          v74 = 0u;
          v75 = 0u;
          v73 = 0u;
          v63 = (void *)objc_opt_class();
          if (v63)
          {
            objc_msgSend_getResizeTransformForTextLine_targetSize_(v63, v64, (uint64_t)v62, v65, v66, v67, v16);
          }
          else
          {
            v74 = 0u;
            v75 = 0u;
            v73 = 0u;
          }
          v70 = v73;
          v71 = v74;
          v72 = v75;
          objc_msgSend_addTransform_(v62, v64, (uint64_t)&v70, v65, v66, v67);
        }
        v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v68, (uint64_t)&v76, (uint64_t)v84, 16, v69);
      }
      while (v50);
    }
  }

LABEL_37:
}

+ (id)applyWrapToTextLines:(id)a3 lineSpaceBehavior:(unint64_t)a4 alignmentBehavior:(unint64_t)a5 leftMargin:(unint64_t)a6 rightMargin:(unint64_t)a7 insertionPoint:(CGPoint)a8
{
  double y;
  double x;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
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
  uint64_t v43;
  double v44;
  BOOL v45;
  id v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  BOOL v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  void *v80;
  const char *v81;
  void *v82;
  const char *v83;
  const char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t i;
  void *v89;
  void *v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  _BOOL4 v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void *v112;
  void *v113;
  const char *v114;
  void *v115;
  const char *v116;
  id v118;
  unint64_t v119;
  unint64_t v120;
  id v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  uint64_t v127;

  y = a8.y;
  x = a8.x;
  v127 = *MEMORY[0x1E0C80C00];
  v118 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v14, v15, v16, v17, v18);
  v121 = (id)objc_claimAutoreleasedReturnValue();
  v23 = (double)a6;
  v24 = (double)a7;
  v25 = (double)a7;
  v26 = (double)a6;
  if (a5 == 1)
  {
    objc_msgSend_objectAtIndexedSubscript_(v118, v19, 0, v20, v21, v22);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend_strokeClassification(v27, v28, v29, v30, v31, v32);

    objc_msgSend_objectAtIndexedSubscript_(v118, v34, 0, v35, v36, v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_anchorPoint(v38, v39, v40, v41, v42, v43);
    if (v33 == 2)
    {
      v25 = v44;
      v26 = (double)a6;
    }
    else
    {
      v26 = v44;
      v25 = (double)a7;
    }

  }
  v119 = a6;
  v120 = a7;
  v124 = 0u;
  v125 = 0u;
  v45 = y != -1.0 && x != -1.0;
  v122 = 0uLL;
  v123 = 0uLL;
  v46 = v118;
  v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v122, (uint64_t)v126, 16, v48);
  if (v54)
  {
    v55 = *(_QWORD *)v123;
    do
    {
      if (*(_QWORD *)v123 != v55)
        objc_enumerationMutation(v46);
      v56 = (void *)**((_QWORD **)&v122 + 1);
      if (a5)
      {
        if (v45)
        {
          if (objc_msgSend_strokeClassification(**((void ***)&v122 + 1), v49, v50, v51, v52, v53) == 2)
            v25 = x;
          else
            v26 = x;
        }
      }
      else
      {
        objc_msgSend_objectAtIndexedSubscript_(v46, v49, 0, v51, v52, v53);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        v63 = objc_msgSend_strokeClassification(v57, v58, v59, v60, v61, v62) == 2;

        objc_msgSend_anchorPoint(v56, v64, v65, v66, v67, v68);
        if (v63)
        {
          v25 = v69;
          v26 = v23;
        }
        else
        {
          v26 = v69;
          v25 = v24;
        }
      }
      v70 = (void *)objc_opt_class();
      objc_msgSend_splitTextLine_maxLength_(v70, v71, (uint64_t)v56, v72, v73, v74, v25 - v26);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      if (!a5)
      {
        v80 = (void *)objc_opt_class();
        objc_msgSend_applyAlignmentToTextLines_alignmentBehavior_leftMargin_rightMargin_alignFirstLine_(v80, v81, (uint64_t)v79, 1, v119, v120, !v45);
      }
      if (!a4)
      {
        v82 = (void *)objc_opt_class();
        objc_msgSend_applyLineSpacingToTextLines_lineSpaceBehavior_lineSpaceTarget_linesAreParallel_(v82, v83, (uint64_t)v79, 1, 0, 1);
      }
      objc_msgSend_addObjectsFromArray_(v121, v75, (uint64_t)v79, v76, v77, v78);

      if (v54 >= 2)
      {
        for (i = 1; i != v54; ++i)
        {
          if (*(_QWORD *)v123 != v55)
            objc_enumerationMutation(v46);
          v89 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * i);
          if (!a5)
          {
            objc_msgSend_objectAtIndexedSubscript_(v46, v84, 0, v85, v86, v87);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            v96 = objc_msgSend_strokeClassification(v90, v91, v92, v93, v94, v95) == 2;

            objc_msgSend_anchorPoint(v89, v97, v98, v99, v100, v101);
            if (v96)
            {
              v25 = v102;
              v26 = v23;
            }
            else
            {
              v26 = v102;
              v25 = v24;
            }
          }
          v103 = (void *)objc_opt_class();
          objc_msgSend_splitTextLine_maxLength_(v103, v104, (uint64_t)v89, v105, v106, v107, v25 - v26);
          v112 = (void *)objc_claimAutoreleasedReturnValue();
          if (!a5)
          {
            v113 = (void *)objc_opt_class();
            objc_msgSend_applyAlignmentToTextLines_alignmentBehavior_leftMargin_rightMargin_alignFirstLine_(v113, v114, (uint64_t)v112, 1, v119, v120, 1);
          }
          if (!a4)
          {
            v115 = (void *)objc_opt_class();
            objc_msgSend_applyLineSpacingToTextLines_lineSpaceBehavior_lineSpaceTarget_linesAreParallel_(v115, v116, (uint64_t)v112, 1, 0, 1);
          }
          objc_msgSend_addObjectsFromArray_(v121, v108, (uint64_t)v112, v109, v110, v111);

        }
      }
      v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v84, (uint64_t)&v122, (uint64_t)v126, 16, v87);
      v45 = 0;
    }
    while (v54);
  }

  return v121;
}

+ (id)applyMergeToTextLines:(id)a3 alignmentBehavior:(unint64_t)a4 leftMargin:(unint64_t)a5 rightMargin:(unint64_t)a6 insertionPoint:(CGPoint)a7
{
  double y;
  double x;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
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
  double v27;
  double v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  void *v48;
  const char *v49;
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
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  const char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t i;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
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
  _BOOL4 v103;
  const char *v104;
  uint64_t v105;
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
  void *v126;
  const char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  int isEqualToString;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  double v143;
  double v144;
  double v145;
  double v146;
  double v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  double v158;
  double v159;
  void *v160;
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
  unint64_t k;
  id v172;
  unint64_t j;
  const char *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  const char *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  const char *v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  double v193;
  double v194;
  const char *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  const char *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
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
  void *v219;
  const char *v220;
  uint64_t v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  _BOOL4 v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  double v231;
  void *v232;
  const char *v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  double v238;
  double v239;
  double v240;
  double v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  double v248;
  double v249;
  void *v250;
  const char *v251;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  const char *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  const char *v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  double v265;
  const char *v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  id v271;
  double v272;
  double v273;
  id v275;
  id obj;
  uint64_t v277;
  uint64_t v278;
  void *v279;
  double v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  _BYTE v291[128];
  uint64_t v292;

  y = a7.y;
  x = a7.x;
  v292 = *MEMORY[0x1E0C80C00];
  v271 = a3;
  if ((unint64_t)objc_msgSend_count(v271, v11, v12, v13, v14, v15) > 1)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v16, v17, v18, v19, v20);
    v275 = (id)objc_claimAutoreleasedReturnValue();
    v27 = (double)a5;
    v28 = (double)a6;
    v272 = (double)a6;
    v273 = (double)a5;
    if (a4 <= 1)
    {
      objc_msgSend_objectAtIndexedSubscript_(v271, v22, 0, v24, v25, v26);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend_strokeClassification(v29, v30, v31, v32, v33, v34);

      objc_msgSend_objectAtIndexedSubscript_(v271, v36, 0, v37, v38, v39);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_anchorPoint(v40, v41, v42, v43, v44, v45);
      if (v35 == 2)
      {
        v28 = v46;
        v27 = v273;
      }
      else
      {
        v27 = v46;
        v28 = v272;
      }

    }
    v47 = v28 - v27;
    if (x != -1.0)
    {
      v47 = v28 - v27;
      if (y != -1.0)
      {
        objc_msgSend_firstObject(v271, v22, v23, v24, v25, v26);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v54 = objc_msgSend_strokeClassification(v48, v49, v50, v51, v52, v53);

        v47 = x - v27;
        if (v54 != 2)
          v47 = v28 - x;
      }
    }
    v280 = v47;
    objc_msgSend_objectAtIndexedSubscript_(v271, v22, 0, v24, v25, v26);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v289 = 0u;
    v290 = 0u;
    v287 = 0u;
    v288 = 0u;
    v61 = objc_msgSend_count(v271, v56, v57, v58, v59, v60);
    objc_msgSend_subarrayWithRange_(v271, v62, 1, v61 - 1, v63, v64);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v65, (uint64_t)&v287, (uint64_t)v291, 16, v66);
    if (v67)
    {
      v277 = *(_QWORD *)v288;
      v73 = MEMORY[0x1E0C9BAA8];
      do
      {
        v278 = v67;
        for (i = 0; i != v278; ++i)
        {
          if (*(_QWORD *)v288 != v277)
            objc_enumerationMutation(obj);
          v279 = *(void **)(*((_QWORD *)&v287 + 1) + 8 * i);
          objc_msgSend_splitIntoTokens(v279, v68, v69, v70, v71, v72);
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend_count(v75, v76, v77, v78, v79, v80))
          {
            objc_msgSend_objectAtIndexedSubscript_(v75, v81, 0, v82, v83, v84);
            v85 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_tokens(v85, v86, v87, v88, v89, v90);
            v91 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastObject(v91, v92, v93, v94, v95, v96);
            v97 = (void *)objc_claimAutoreleasedReturnValue();
            v103 = (objc_msgSend_properties(v97, v98, v99, v100, v101, v102) & 0x20) == 0;

            if (!v103)
              goto LABEL_20;
            objc_msgSend_textSegments(v55, v104, v105, v106, v107, v108);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_lastObject(v109, v110, v111, v112, v113, v114);
            v115 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_locale(v115, v116, v117, v118, v119, v120);
            v121 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_defaultWordTerminationCharacterForLocale_(CHContextualTextResult, v122, (uint64_t)v121, v123, v124, v125);
            v126 = (void *)objc_claimAutoreleasedReturnValue();
            isEqualToString = objc_msgSend_isEqualToString_(v126, v127, (uint64_t)CFSTR(" "), v128, v129, v130);

            if (!isEqualToString)
            {
              v143 = *(double *)(v73 + 40);
            }
            else
            {
LABEL_20:
              v137 = (void *)objc_opt_class();
              objc_msgSend_lineHeight(v55, v138, v139, v140, v141, v142);
              if (v137)
              {
                objc_msgSend_getInsertSpaceTransform_spaceSize_(v137, v132, (uint64_t)v55, v134, v135, v136);
                v143 = *((double *)&v286 + 1);
              }
              else
              {
                v143 = 0.0;
              }
            }
            objc_msgSend_boundingBox(v55, v132, v133, v134, v135, v136);
            v145 = v144;
            v147 = v146;
            objc_msgSend_boundingBox(v85, v148, v149, v150, v151, v152);
            if (v143 + v147 - v145 + v159 - v158 >= v280)
            {
              k = 0;
LABEL_28:
              objc_msgSend_addObject_(v275, v153, (uint64_t)v55, v155, v156, v157);
              v172 = v85;
              for (j = k + 1; ; ++j)
              {

                if (j >= objc_msgSend_count(v75, v174, v175, v176, v177, v178))
                  break;
                objc_msgSend_objectAtIndexedSubscript_(v75, v179, j, v181, v182, v183);
                v55 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_mergeTransformedText_(v172, v184, (uint64_t)v55, v185, v186, v187);
              }
              v280 = v28 - v27;
              if (!a4)
              {
                if (objc_msgSend_strokeClassification(v279, v179, v180, v181, v182, v183) == 2)
                {
                  objc_msgSend_anchorPoint(v279, v188, v189, v190, v191, v192);
                  v194 = v193 - v273;
                }
                else
                {
                  objc_msgSend_anchorPoint(v172, v188, v189, v190, v191, v192);
                  v194 = v272 - v265;
                }
                v280 = v194;
              }

              v55 = v172;
            }
            else
            {
              objc_msgSend_insertionPoint(v55, v153, v154, v155, v156, v157);
              v285 = 0u;
              v286 = 0u;
              v284 = 0u;
              v160 = (void *)objc_opt_class();
              objc_msgSend_anchorPoint(v85, v161, v162, v163, v164, v165);
              if (v160)
              {
                objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v160, v166, v167, v168, v169, v170);
              }
              else
              {
                v285 = 0u;
                v286 = 0u;
                v284 = 0u;
              }
              v281 = v284;
              v282 = v285;
              v283 = v286;
              objc_msgSend_addTransform_(v85, v166, (uint64_t)&v281, v168, v169, v170);
              objc_msgSend_mergeTransformedText_(v55, v195, (uint64_t)v85, v196, v197, v198);

              for (k = 1; k < objc_msgSend_count(v75, v199, v200, v201, v202, v203); ++k)
              {
                objc_msgSend_objectAtIndexedSubscript_(v75, v204, k, v205, v206, v207);
                v85 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_tokens(v85, v208, v209, v210, v211, v212);
                v213 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_lastObject(v213, v214, v215, v216, v217, v218);
                v219 = (void *)objc_claimAutoreleasedReturnValue();
                v225 = (objc_msgSend_properties(v219, v220, v221, v222, v223, v224) & 0x20) == 0;

                if (v225)
                {
                  v231 = *(double *)(v73 + 40);
                }
                else
                {
                  v232 = (void *)objc_opt_class();
                  objc_msgSend_lineHeight(v55, v233, v234, v235, v236, v237);
                  if (v232)
                  {
                    objc_msgSend_getInsertSpaceTransform_spaceSize_(v232, v226, (uint64_t)v55, v228, v229, v230);
                    v231 = *((double *)&v286 + 1);
                  }
                  else
                  {
                    v231 = 0.0;
                  }
                }
                objc_msgSend_boundingBox(v55, v226, v227, v228, v229, v230);
                v239 = v238;
                v241 = v240;
                objc_msgSend_boundingBox(v85, v242, v243, v244, v245, v246);
                if (v231 + v241 - v239 + v249 - v248 >= v280)
                  goto LABEL_28;
                objc_msgSend_insertionPoint(v55, v153, v247, v155, v156, v157);
                v285 = 0u;
                v286 = 0u;
                v284 = 0u;
                v250 = (void *)objc_opt_class();
                objc_msgSend_anchorPoint(v85, v251, v252, v253, v254, v255);
                if (v250)
                {
                  objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v250, v256, v257, v258, v259, v260);
                }
                else
                {
                  v285 = 0u;
                  v286 = 0u;
                  v284 = 0u;
                }
                v281 = v284;
                v282 = v285;
                v283 = v286;
                objc_msgSend_addTransform_(v85, v256, (uint64_t)&v281, v258, v259, v260);
                objc_msgSend_mergeTransformedText_(v55, v261, (uint64_t)v85, v262, v263, v264);

              }
            }
          }

        }
        v67 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v68, (uint64_t)&v287, (uint64_t)v291, 16, v72);
      }
      while (v67);
    }

    objc_msgSend_addObject_(v275, v266, (uint64_t)v55, v267, v268, v269);
    v21 = v271;
  }
  else
  {
    v21 = v271;
    v275 = v271;
  }

  return v275;
}

+ (void)applyAlignmentToTextLines:(id)a3 alignmentBehavior:(unint64_t)a4 leftMargin:(unint64_t)a5 rightMargin:(unint64_t)a6 alignFirstLine:(BOOL)a7
{
  double v7;
  double v8;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  BOOL v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  double *v53;
  void *v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  void *v61;
  double *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  _BOOL4 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  void *v74[2];
  __int128 v75;
  __int128 v76;
  void *v77[2];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v69 = a3;
  if (objc_msgSend_count(v69, v13, v14, v15, v16, v17))
  {
    switch(a4)
    {
      case 0uLL:
        break;
      case 1uLL:
        objc_msgSend_objectAtIndexedSubscript_(v69, v18, 0, v19, v20, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_anchorPoint(v22, v23, v24, v25, v26, v27);
        v29 = v28;

        objc_msgSend_objectAtIndexedSubscript_(v69, v30, 0, v31, v32, v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = objc_msgSend_strokeClassification(v34, v35, v36, v37, v38, v39) == 2;

        goto LABEL_8;
      case 2uLL:
        v70 = 0;
        v29 = (double)a5;
        goto LABEL_8;
      case 3uLL:
        v70 = 0;
        v29 = (double)((a6 + a5) >> 1);
        goto LABEL_8;
      case 4uLL:
        v70 = 0;
        v29 = (double)a6;
        goto LABEL_8;
      default:
        v70 = 0;
        v29 = 0.0;
LABEL_8:
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v40 = v69;
        v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v80, (uint64_t)v84, 16, v42);
        if (v48)
        {
          v49 = !a7;
          v50 = *(_QWORD *)v81;
          v51 = a4 - 1;
          while (2)
          {
            if (*(_QWORD *)v81 != v50)
              objc_enumerationMutation(v40);
            v52 = (void *)**((_QWORD **)&v80 + 1);
            if (**((_QWORD **)&v80 + 1))
            {
              objc_msgSend_principalLines(**((void ***)&v80 + 1), v43, v44, v45, v46, v47);
              v53 = (double *)*((_QWORD *)&v75 + 1);
              v76 = 0uLL;
              *((_QWORD *)&v75 + 1) = 0;
              if (*((_QWORD *)&v78 + 1))
              {
                *(_QWORD *)&v79 = *((_QWORD *)&v78 + 1);
                operator delete(*((void **)&v78 + 1));
              }
              if (v77[0])
              {
                v77[1] = v77[0];
                operator delete(v77[0]);
              }
            }
            else
            {
              v53 = 0;
              v78 = 0u;
              v79 = 0u;
              v76 = 0u;
              *(_OWORD *)v77 = 0u;
              *(_OWORD *)v74 = 0u;
              v75 = 0u;
            }
            if (*((_QWORD *)&v75 + 1))
            {
              *(_QWORD *)&v76 = *((_QWORD *)&v75 + 1);
              operator delete(*((void **)&v75 + 1));
            }
            if (v74[0])
            {
              v74[1] = v74[0];
              operator delete(v74[0]);
            }
            switch(v51)
            {
              case 0uLL:
                if (!v70)
                  goto LABEL_26;
                goto LABEL_23;
              case 1uLL:
LABEL_26:
                v7 = *v53;
                v8 = v53[1];
                goto LABEL_27;
              case 2uLL:
                v7 = (*v53 + v53[2]) * 0.5;
                v8 = (v53[1] + v53[3]) * 0.5;
                if (v49)
                  goto LABEL_34;
                goto LABEL_28;
              case 3uLL:
LABEL_23:
                v7 = v53[2];
                v8 = v53[3];
                if (v49)
                  goto LABEL_34;
                goto LABEL_28;
              default:
LABEL_27:
                if (!v49)
                {
LABEL_28:
                  v75 = 0u;
                  v76 = 0u;
                  *(_OWORD *)v74 = 0u;
                  v54 = (void *)objc_opt_class();
                  if (v54)
                  {
                    objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v54, v55, v56, v57, v58, v59, v7, v8, v29, v8);
                  }
                  else
                  {
                    v75 = 0u;
                    v76 = 0u;
                    *(_OWORD *)v74 = 0u;
                  }
                  v71 = *(_OWORD *)v74;
                  v72 = v75;
                  v73 = v76;
                  objc_msgSend_addTransform_(v52, v55, (uint64_t)&v71, v57, v58, v59);
                }
LABEL_34:
                if (v53)
                  operator delete(v53);
                if (v48 >= 2)
                {
                  for (i = 1; i != v48; ++i)
                  {
                    if (*(_QWORD *)v81 != v50)
                      objc_enumerationMutation(v40);
                    v61 = *(void **)(*((_QWORD *)&v80 + 1) + 8 * i);
                    if (v61)
                    {
                      objc_msgSend_principalLines(*(void **)(*((_QWORD *)&v80 + 1) + 8 * i), v43, v44, v45, v46, v47);
                      v62 = (double *)*((_QWORD *)&v75 + 1);
                      v76 = 0uLL;
                      *((_QWORD *)&v75 + 1) = 0;
                      if (*((_QWORD *)&v78 + 1))
                      {
                        *(_QWORD *)&v79 = *((_QWORD *)&v78 + 1);
                        operator delete(*((void **)&v78 + 1));
                      }
                      if (v77[0])
                      {
                        v77[1] = v77[0];
                        operator delete(v77[0]);
                      }
                    }
                    else
                    {
                      v62 = 0;
                      v78 = 0u;
                      v79 = 0u;
                      v76 = 0u;
                      *(_OWORD *)v77 = 0u;
                      *(_OWORD *)v74 = 0u;
                      v75 = 0u;
                    }
                    if (*((_QWORD *)&v75 + 1))
                    {
                      *(_QWORD *)&v76 = *((_QWORD *)&v75 + 1);
                      operator delete(*((void **)&v75 + 1));
                    }
                    if (v74[0])
                    {
                      v74[1] = v74[0];
                      operator delete(v74[0]);
                    }
                    switch(v51)
                    {
                      case 0uLL:
                        if (!v70)
                          goto LABEL_56;
                        goto LABEL_54;
                      case 1uLL:
LABEL_56:
                        v7 = *v62;
                        v8 = v62[1];
                        break;
                      case 2uLL:
                        v7 = (*v62 + v62[2]) * 0.5;
                        v8 = (v62[1] + v62[3]) * 0.5;
                        break;
                      case 3uLL:
LABEL_54:
                        v7 = v62[2];
                        v8 = v62[3];
                        break;
                      default:
                        break;
                    }
                    v75 = 0u;
                    v76 = 0u;
                    *(_OWORD *)v74 = 0u;
                    v63 = (void *)objc_opt_class();
                    if (v63)
                    {
                      objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v63, v64, v65, v66, v67, v68, v7, v8, v29, v8);
                    }
                    else
                    {
                      v75 = 0u;
                      v76 = 0u;
                      *(_OWORD *)v74 = 0u;
                    }
                    v71 = *(_OWORD *)v74;
                    v72 = v75;
                    v73 = v76;
                    objc_msgSend_addTransform_(v61, v64, (uint64_t)&v71, v66, v67, v68);
                    if (v62)
                      operator delete(v62);
                  }
                }
                v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v80, (uint64_t)v84, 16, v47);
                v49 = 0;
                if (!v48)
                  break;
                continue;
            }
            break;
          }
        }

        break;
    }
  }

}

+ (void)applyLineSpacingToTextLines:(id)a3 lineSpaceBehavior:(unint64_t)a4 lineSpaceTarget:(unint64_t)a5 linesAreParallel:(BOOL)a6
{
  id v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  uint64_t i;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  id v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  double v45;
  double v46;
  uint64_t j;
  double v48;
  void *v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  _BYTE v66[128];
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v15 = objc_msgSend_count(v9, v10, v11, v12, v13, v14);
  if (a4 && v15 >= 2)
  {
    v63 = 0u;
    v64 = 0u;
    v61 = 0u;
    v62 = 0u;
    v16 = v9;
    v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v61, (uint64_t)v66, 16, v18);
    if (v24)
    {
      v25 = *(_QWORD *)v62;
      v26 = 0.0;
      do
      {
        for (i = 0; i != v24; ++i)
        {
          if (*(_QWORD *)v62 != v25)
            objc_enumerationMutation(v16);
          objc_msgSend_lineHeight(*(void **)(*((_QWORD *)&v61 + 1) + 8 * i), v19, v20, v21, v22, v23);
          v26 = v26 + v28;
        }
        v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v61, (uint64_t)v66, 16, v23);
      }
      while (v24);
    }
    else
    {
      v26 = 0.0;
    }

    v34 = v26 / (double)(unint64_t)objc_msgSend_count(v16, v29, v30, v31, v32, v33);
    if (a4 == 2)
    {
      a5 = (unint64_t)(v34 * 1.5);
      if (!a6)
        goto LABEL_21;
    }
    else
    {
      if (a4 != 3)
      {
        if (a4 != 4)
          a5 = 0;
        if (a6)
          goto LABEL_35;
LABEL_21:
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v35 = v16;
        v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v57, (uint64_t)v65, 16, v37);
        if (v43)
        {
          v44 = *(_QWORD *)v58;
          v45 = -1.79769313e308;
          v46 = 1.79769313e308;
          do
          {
            for (j = 0; j != v43; ++j)
            {
              if (*(_QWORD *)v58 != v44)
                objc_enumerationMutation(v35);
              objc_msgSend_orientation(*(void **)(*((_QWORD *)&v57 + 1) + 8 * j), v38, v39, v40, v41, v42, (_QWORD)v57);
              if (v48 < v46)
                v46 = v48;
              if (v48 > v45)
                v45 = v48;
            }
            v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v57, (uint64_t)v65, 16, v42);
          }
          while (v43);
        }
        else
        {
          v45 = -1.79769313e308;
          v46 = 1.79769313e308;
        }

        if (v45 - v46 >= 0.05)
        {
          v53 = (void *)objc_opt_class();
          objc_msgSend_adjustLineSpacingWithBounds_lineSpace_(v53, v54, (uint64_t)v35, a5, v55, v56);
          goto LABEL_37;
        }
        goto LABEL_35;
      }
      a5 = (unint64_t)(v34 * 2.5);
      if (!a6)
        goto LABEL_21;
    }
LABEL_35:
    v49 = (void *)objc_opt_class();
    objc_msgSend_adjustLineSpacingWithBaselines_lineSpace_(v49, v50, (uint64_t)v16, a5, v51, v52);
  }
LABEL_37:

}

+ (void)adjustLineSpacingWithBaselines:(id)a3 lineSpace:(unint64_t)a4
{
  id v5;
  double v6;
  unint64_t v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t i;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  long double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _OWORD v49[3];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  void *v53[2];
  void *v54[2];
  __int128 v55;
  void *v56[2];
  void *__p[2];
  __int128 v58;
  void *v59[2];
  void *v60[2];
  __int128 v61;
  void *v62[2];
  void *v63[2];
  __int128 v64;

  v5 = a3;
  v6 = (double)a4;
  v7 = 1;
  for (i = objc_msgSend_count(v5, v8, v9, v10, v11, v12); v7 < i; i = objc_msgSend_count(v5, v18, v19, v20, v21, v22))
  {
    v23 = v7 - 1;
    objc_msgSend_objectAtIndexedSubscript_(v5, v14, v7 - 1, v15, v16, v17);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v23 + 1;
    objc_msgSend_objectAtIndexedSubscript_(v5, v26, v23 + 1, v27, v28, v29);
    v30 = objc_claimAutoreleasedReturnValue();
    v36 = (void *)v30;
    if (v24)
    {
      objc_msgSend_principalLines(v24, v31, v32, v33, v34, v35);
      if (v36)
        goto LABEL_6;
    }
    else
    {
      *(_OWORD *)v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      *(_OWORD *)v62 = 0u;
      *(_OWORD *)v59 = 0u;
      *(_OWORD *)v60 = 0u;
      if (v30)
      {
LABEL_6:
        objc_msgSend_principalLines(v36, v31, v32, v33, v34, v35);
        goto LABEL_9;
      }
    }
    *(_OWORD *)__p = 0u;
    v58 = 0u;
    v55 = 0u;
    *(_OWORD *)v56 = 0u;
    *(_OWORD *)v53 = 0u;
    *(_OWORD *)v54 = 0u;
LABEL_9:
    objc_msgSend_orientation(v24, v31, v32, v33, v34, v35);
    v38 = tan(v37);
    v40 = *(double *)v59[0];
    v39 = *((double *)v59[0] + 1);
    v41 = *(double *)__p[1];
    v42 = *((double *)__p[1] + 1);
    v51 = 0u;
    v52 = 0u;
    v50 = 0u;
    v43 = (void *)objc_opt_class();
    if (v43)
    {
      objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v43, v44, v45, v46, v47, v48, v41, v42, v41, v39 + v40 * v38 - v41 * v38 + v6);
    }
    else
    {
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
    }
    v49[0] = v50;
    v49[1] = v51;
    v49[2] = v52;
    objc_msgSend_addTransform_(v36, v44, (uint64_t)v49, v46, v47, v48);
    if (__p[1])
    {
      *(void **)&v58 = __p[1];
      operator delete(__p[1]);
    }
    if (v56[0])
    {
      v56[1] = v56[0];
      operator delete(v56[0]);
    }
    if (v54[1])
    {
      *(void **)&v55 = v54[1];
      operator delete(v54[1]);
    }
    if (v53[0])
    {
      v53[1] = v53[0];
      operator delete(v53[0]);
    }
    if (v63[1])
    {
      *(void **)&v64 = v63[1];
      operator delete(v63[1]);
    }
    if (v62[0])
    {
      v62[1] = v62[0];
      operator delete(v62[0]);
    }
    if (v60[1])
    {
      *(void **)&v61 = v60[1];
      operator delete(v60[1]);
    }
    if (v59[0])
    {
      v59[1] = v59[0];
      operator delete(v59[0]);
    }

    v7 = v25 + 1;
  }

}

+ (void)adjustLineSpacingWithBounds:(id)a3 lineSpace:(unint64_t)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  double v11;
  unint64_t i;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  void *v18;
  unint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  double v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  double v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  double v51;
  double v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  _OWORD v59[3];
  __int128 v60;
  __int128 v61;
  __int128 v62;

  v10 = a3;
  v11 = (double)a4;
  for (i = 1; i < objc_msgSend_count(v10, v5, v6, v7, v8, v9); i = v19 + 1)
  {
    v17 = i - 1;
    objc_msgSend_objectAtIndexedSubscript_(v10, v13, i - 1, v14, v15, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v17 + 1;
    objc_msgSend_objectAtIndexedSubscript_(v10, v20, v17 + 1, v21, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_boundingBox(v24, v25, v26, v27, v28, v29);
    v31 = v30;
    objc_msgSend_boundingBox(v18, v32, v33, v34, v35, v36);
    v38 = v37;
    objc_msgSend_boundingBox(v24, v39, v40, v41, v42, v43);
    v45 = v44;
    objc_msgSend_boundingBox(v24, v46, v47, v48, v49, v50);
    v52 = v51;
    v61 = 0u;
    v62 = 0u;
    v60 = 0u;
    v53 = (void *)objc_opt_class();
    if (v53)
    {
      objc_msgSend_getTranslateTransformForAnchorPoint_targetPoint_(v53, v54, v55, v56, v57, v58, v45, v52, v31, v38 + v11);
    }
    else
    {
      v61 = 0u;
      v62 = 0u;
      v60 = 0u;
    }
    v59[0] = v60;
    v59[1] = v61;
    v59[2] = v62;
    objc_msgSend_addTransform_(v24, v54, (uint64_t)v59, v56, v57, v58);

  }
}

+ (id)splitTextLine:(id)a3 maxLength:(double)a4
{
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
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
  id v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  double v43;
  double v44;
  id v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_splitIntoTokens(v5, v12, v13, v14, v15, v16);
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v51, (uint64_t)v55, 16, v19);
  if (v25)
  {
    v26 = 0;
    v27 = *(_QWORD *)v52;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v52 != v27)
          objc_enumerationMutation(v17);
        v29 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        if (v26)
        {
          objc_msgSend_boundingBox(v26, v20, v21, v22, v23, v24, (_QWORD)v51);
          v31 = v30;
          v33 = v32;
          objc_msgSend_boundingBox(v29, v34, v35, v36, v37, v38);
          if (v31 <= v43)
            v43 = v31;
          if (v33 >= v44)
            v44 = v33;
          if (v44 - v43 >= a4)
          {
            objc_msgSend_addObject_(v11, v39, (uint64_t)v26, v40, v41, v42);
            v45 = v29;

            v26 = v45;
          }
          else
          {
            objc_msgSend_mergeTransformedText_(v26, v39, (uint64_t)v29, v40, v41, v42);
          }
        }
        else
        {
          v26 = v29;
        }
      }
      v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v51, (uint64_t)v55, 16, v24);
    }
    while (v25);

    if (v26)
      objc_msgSend_addObject_(v11, v46, (uint64_t)v26, v47, v48, v49);
  }
  else
  {

    v26 = 0;
  }

  return v11;
}

+ (CGAffineTransform)rotationTransformForTextLine:(SEL)a3 targetAngle:(id)a4
{
  CoreHandwriting *v7;
  uint64_t v8;
  __int128 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  void *v28;
  CGAffineTransform *result;
  _OWORD v30[3];
  CGAffineTransform t2;
  CGAffineTransform t1;
  void *v33[2];
  void *v34[2];
  __int128 v35;
  void *v36[2];
  void *__p[2];
  __int128 v38;
  CGAffineTransform v39;
  double *v40[3];
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;

  v7 = (CoreHandwriting *)a4;
  v8 = MEMORY[0x1E0C9BAA8];
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  CoreHandwriting::getDesiredPrincipalLines(v7, a5, (uint64_t)v40);
  memset(&v39, 0, sizeof(v39));
  if (v7)
  {
    objc_msgSend_principalLines(v7, v10, v11, v12, v13, v14);
  }
  else
  {
    *(_OWORD *)__p = 0uLL;
    v38 = 0uLL;
    v35 = 0uLL;
    *(_OWORD *)v36 = 0uLL;
    *(_OWORD *)v33 = 0uLL;
    *(_OWORD *)v34 = 0uLL;
  }
  CoreHandwriting::getAffineTransformation((double **)v33, v40, (uint64_t)&v39);
  if (__p[1])
  {
    *(void **)&v38 = __p[1];
    operator delete(__p[1]);
  }
  if (v36[0])
  {
    v36[1] = v36[0];
    operator delete(v36[0]);
  }
  if (v34[1])
  {
    *(void **)&v35 = v34[1];
    operator delete(v34[1]);
  }
  if (v33[0])
  {
    v33[1] = v33[0];
    operator delete(v33[0]);
  }
  v15 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&t1.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&t1.c = v15;
  *(_OWORD *)&t1.tx = *(_OWORD *)&retstr->tx;
  t2 = v39;
  CGAffineTransformConcat(retstr, &t1, &t2);
  v16 = (void *)objc_opt_class();
  objc_msgSend_anchorPoint(v7, v17, v18, v19, v20, v21);
  v26 = *(_OWORD *)&retstr->c;
  v30[0] = *(_OWORD *)&retstr->a;
  v30[1] = v26;
  v30[2] = *(_OWORD *)&retstr->tx;
  if (v16)
  {
    objc_msgSend_adjustTransformForAnchorPoint_transform_(v16, v22, (uint64_t)v30, v23, v24, v25);
    v27 = *(_OWORD *)v34;
    *(_OWORD *)&retstr->a = *(_OWORD *)v33;
    *(_OWORD *)&retstr->c = v27;
    *(_OWORD *)&retstr->tx = v35;
    v28 = v45;
    if (!v45)
      goto LABEL_15;
    goto LABEL_14;
  }
  *(_OWORD *)v34 = 0u;
  v35 = 0u;
  *(_OWORD *)v33 = 0u;
  *(_OWORD *)&retstr->a = 0u;
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = v35;
  v28 = v45;
  if (v45)
  {
LABEL_14:
    v46 = v28;
    operator delete(v28);
  }
LABEL_15:
  if (v43)
  {
    v44 = v43;
    operator delete(v43);
  }
  if (v41)
  {
    v42 = v41;
    operator delete(v41);
  }
  if (v40[0])
  {
    v40[1] = v40[0];
    operator delete(v40[0]);
  }

  return result;
}

+ (CGAffineTransform)getResizeTransformForTextLine:(SEL)a3 targetSize:(id)a4
{
  id v7;
  uint64_t v8;
  __int128 v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  __int128 v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;
  CGAffineTransform *result;
  _OWORD v30[3];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGAffineTransform v34;

  v7 = a4;
  v8 = MEMORY[0x1E0C9BAA8];
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  objc_msgSend_lineHeight(v7, v10, v11, v12, v13, v14);
  v16 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v34.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v34.c = v16;
  *(_OWORD *)&v34.tx = *(_OWORD *)&retstr->tx;
  CGAffineTransformScale(retstr, &v34, a5 / (v15 + 1.0e-10), a5 / (v15 + 1.0e-10));
  v17 = (void *)objc_opt_class();
  objc_msgSend_anchorPoint(v7, v18, v19, v20, v21, v22);
  v27 = *(_OWORD *)&retstr->c;
  v30[0] = *(_OWORD *)&retstr->a;
  v30[1] = v27;
  v30[2] = *(_OWORD *)&retstr->tx;
  if (v17)
  {
    objc_msgSend_adjustTransformForAnchorPoint_transform_(v17, v23, (uint64_t)v30, v24, v25, v26);
  }
  else
  {
    v32 = 0u;
    v33 = 0u;
    v31 = 0u;
  }
  v28 = v32;
  *(_OWORD *)&retstr->a = v31;
  *(_OWORD *)&retstr->c = v28;
  *(_OWORD *)&retstr->tx = v33;

  return result;
}

+ (CGAffineTransform)getItalicsTransformForTextLine:(SEL)a3 skew:(id)a4
{
  id v7;
  uint64_t v8;
  __int128 v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  CGAffineTransform *result;
  _OWORD v23[3];
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v7 = a4;
  v8 = MEMORY[0x1E0C9BAA8];
  v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v9;
  *(_OWORD *)&retstr->tx = *(_OWORD *)(v8 + 32);
  retstr->c = a5;
  v10 = (void *)objc_opt_class();
  objc_msgSend_anchorPoint(v7, v11, v12, v13, v14, v15);
  v20 = *(_OWORD *)&retstr->c;
  v23[0] = *(_OWORD *)&retstr->a;
  v23[1] = v20;
  v23[2] = *(_OWORD *)&retstr->tx;
  if (v10)
  {
    objc_msgSend_adjustTransformForAnchorPoint_transform_(v10, v16, (uint64_t)v23, v17, v18, v19);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
  }
  v21 = v25;
  *(_OWORD *)&retstr->a = v24;
  *(_OWORD *)&retstr->c = v21;
  *(_OWORD *)&retstr->tx = v26;

  return result;
}

+ (CGAffineTransform)getTranslateTransformForAnchorPoint:(SEL)a3 targetPoint:(CGPoint)a4
{
  __int128 v5;

  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v5;
  retstr->tx = a5.x - a4.x;
  retstr->ty = a5.y - a4.y;
  return result;
}

+ (CGAffineTransform)adjustTransformForAnchorPoint:(SEL)a3 transform:(CGPoint)a4
{
  __int128 v5;
  float64x2_t v6;
  CGFloat y;
  float64x2_t v8;
  CGAffineTransform v10;
  CGAffineTransform t1;

  v5 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v10.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v10.c = v5;
  v6 = *(float64x2_t *)&a5->c;
  y = a4.y;
  v8 = vsubq_f64((float64x2_t)a4, vaddq_f64(*(float64x2_t *)&a5->tx, vmlaq_n_f64(vmulq_n_f64(v6, a4.y), *(float64x2_t *)&a5->a, a4.x)));
  *(_OWORD *)&t1.a = *(_OWORD *)&a5->a;
  *(float64x2_t *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&a5->tx;
  *(float64x2_t *)&v10.tx = v8;
  return CGAffineTransformConcat(retstr, &t1, &v10);
}

+ (CGAffineTransform)getInsertSpaceTransform:(SEL)a3 spaceSize:(id)a4
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  __double2 v21;
  __int128 v22;
  CGAffineTransform *result;
  id v24;

  v24 = a4;
  objc_msgSend_orientation(v24, v7, v8, v9, v10, v11);
  v13 = v12;
  v19 = objc_msgSend_strokeClassification(v24, v14, v15, v16, v17, v18);
  v20 = -v13;
  if (v19 != 2)
    v20 = v13;
  v21 = __sincos_stret(v20);
  v22 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v22;
  retstr->tx = v21.__cosval * a5;
  retstr->ty = -(v21.__sinval * a5);

  return result;
}

+ (BOOL)shouldDeformAscendersDescenders:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  objc_msgSend_languageCode(a3, a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_containsObject_(&unk_1E7827F20, v7, (uint64_t)v6, v8, v9, v10);

  return v11;
}

+ (BOOL)shouldAdjustRenderString:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  objc_msgSend_languageCode(a3, a2, (uint64_t)a3, v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_containsObject_(&unk_1E7827F38, v7, (uint64_t)v6, v8, v9, v10);

  return v11;
}

+ (double)blindAscenderDeformValue:(id)a3
{
  return 1.0;
}

+ (double)blindDescenderDeformValue:(id)a3
{
  return 1.5;
}

+ (id)charactersForRendering
{
  if (qword_1EF568240 != -1)
    dispatch_once(&qword_1EF568240, &unk_1E77F1890);
  return (id)qword_1EF568248;
}

+ (id)alternativeCharacterForms
{
  if (qword_1EF568250 != -1)
    dispatch_once(&qword_1EF568250, &unk_1E77F1BB0);
  return (id)qword_1EF568258;
}

+ (id)stringForRendering:(id)a3 useAltChars:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  uint64_t v28;
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
  id v40;
  const char *v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
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
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _BYTE v71[128];
  _BYTE v72[128];
  uint64_t v73;

  v4 = a4;
  v73 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_class();
  objc_msgSend_charactersForRendering(v6, v7, v8, v9, v10, v11);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v67, (uint64_t)v72, 16, v14);
  v20 = v5;
  if (v19)
  {
    v21 = *(_QWORD *)v68;
    v20 = v5;
    do
    {
      v22 = 0;
      v23 = v20;
      do
      {
        if (*(_QWORD *)v68 != v21)
          objc_enumerationMutation(v12);
        v24 = *(_QWORD *)(*((_QWORD *)&v67 + 1) + 8 * v22);
        objc_msgSend_objectForKeyedSubscript_(v12, v15, v24, v16, v17, v18);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v23, v26, v24, (uint64_t)v25, v27, v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        ++v22;
        v23 = v20;
      }
      while (v19 != v22);
      v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v67, (uint64_t)v72, 16, v18);
    }
    while (v19);
  }

  if (v4)
  {
    v34 = (void *)objc_opt_class();
    objc_msgSend_alternativeCharacterForms(v34, v35, v36, v37, v38, v39);
    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v40 = (id)objc_claimAutoreleasedReturnValue();
    v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v63, (uint64_t)v71, 16, v42);
    if (v47)
    {
      v48 = *(_QWORD *)v64;
      do
      {
        v49 = 0;
        v50 = v20;
        do
        {
          if (*(_QWORD *)v64 != v48)
            objc_enumerationMutation(v40);
          v51 = *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * v49);
          objc_msgSend_objectForKeyedSubscript_(v40, v43, v51, v44, v45, v46, (_QWORD)v63);
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v50, v53, v51, (uint64_t)v52, v54, v55);
          v20 = (void *)objc_claimAutoreleasedReturnValue();

          ++v49;
          v50 = v20;
        }
        while (v47 != v49);
        v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v43, (uint64_t)&v63, (uint64_t)v71, 16, v46);
      }
      while (v47);
    }

  }
  objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v29, v30, v31, v32, v33, (_QWORD)v63);
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByTrimmingCharactersInSet_(v20, v57, (uint64_t)v56, v58, v59, v60);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  return v61;
}

+ (CGSize)estimatedRenderedTextSize:(id)a3 fullDeformValue:(double)a4 ascenderDeformValue:(double)a5 descenderDeformValue:(double)a6
{
  CoreHandwriting *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int hasDescender;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int hasAscender;
  double RenderedTextSizeForString;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGSize result;

  v9 = (CoreHandwriting *)a3;
  v10 = (void *)objc_opt_class();
  hasDescender = objc_msgSend_hasDescender_(v10, v11, (uint64_t)v9, v12, v13, v14);
  v16 = (void *)objc_opt_class();
  hasAscender = objc_msgSend_hasAscender_(v16, v17, (uint64_t)v9, v18, v19, v20);
  RenderedTextSizeForString = CoreHandwriting::getRenderedTextSizeForString(v9, (NSString *)0x64);
  v23 = a4 * 18.5 * a5 + a4 * 18.5;
  if (!hasAscender)
    v23 = -0.0;
  v24 = a4 * 52.5 + v23;
  v25 = a4 * 17.0 * a6 + a4 * 17.0;
  if (!hasDescender)
    v25 = -0.0;
  v26 = v25 + v24;
  v27 = RenderedTextSizeForString + -15.0;

  v28 = v27;
  v29 = v26;
  result.height = v29;
  result.width = v28;
  return result;
}

+ (BOOL)hasAmbiguousCharacter:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  BOOL v8;

  v7 = a3;
  if (qword_1EF568268 != -1)
    dispatch_once(&qword_1EF568268, &unk_1E77F4F30);
  v8 = objc_msgSend_rangeOfCharacterFromSet_(v7, v3, qword_1EF568260, v4, v5, v6) != 0x7FFFFFFFFFFFFFFFLL;

  return v8;
}

+ (BOOL)hasDescender:(id)a3
{
  id v3;
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
  BOOL v14;
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
  uint64_t v38;
  uint64_t v39;
  id v40;
  const char *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  _QWORD v51[4];
  id v52;
  uint64_t *v53;
  _QWORD v54[4];
  id v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  BOOL v60;

  v3 = a3;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 0;
  objc_msgSend_ch_descenderCharacterSet(MEMORY[0x1E0CB3500], v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_rangeOfCharacterFromSet_(v3, v10, (uint64_t)v9, v11, v12, v13) != 0x7FFFFFFFFFFFFFFFLL;

  v60 = v14;
  v15 = (void *)objc_opt_class();
  objc_msgSend_alternativeCharacterForms(v15, v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_allValues(v21, v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsJoinedByString_(v27, v28, (uint64_t)&stru_1E77F6F28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  v38 = objc_msgSend_length(v32, v33, v34, v35, v36, v37);
  v39 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = sub_1BE7A2344;
  v54[3] = &unk_1E77F21A8;
  v56 = &v57;
  v40 = v3;
  v55 = v40;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v32, v41, 0, v38, 2, (uint64_t)v54);
  v47 = objc_msgSend_length(v40, v42, v43, v44, v45, v46);
  v51[0] = v39;
  v51[1] = 3221225472;
  v51[2] = sub_1BE7A23DC;
  v51[3] = &unk_1E77F4F58;
  v52 = &unk_1E7827F50;
  v53 = &v57;
  objc_msgSend_enumerateCodepointsInRange_usingBlock_(v40, v48, 0, v47, (uint64_t)v51, v49);
  LOBYTE(v3) = *((_BYTE *)v58 + 24);

  _Block_object_dispose(&v57, 8);
  return (char)v3;
}

+ (BOOL)hasAscender:(id)a3
{
  id v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  v9 = objc_msgSend_ascendersCount_(v4, v5, (uint64_t)v3, v6, v7, v8) != 0;

  return v9;
}

+ (unint64_t)ascendersCount:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  unint64_t v11;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v3 = a3;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  v9 = objc_msgSend_length(v3, v4, v5, v6, v7, v8);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1BE7A25C4;
  v13[3] = &unk_1E77F4530;
  v14 = &unk_1E7827F68;
  v15 = &v16;
  objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(v3, v10, 0, v9, 2, (uint64_t)v13);
  v11 = v17[3];

  _Block_object_dispose(&v16, 8);
  return v11;
}

+ ($6DEFAE59D8B0B490C28D581BBA01C329)convertToCHPrincipalLines:(SEL)a3
{
  CGPoint *v4;
  CGPoint *v5;
  CGPoint *v6;
  CGPoint v7;
  CGPoint v8;
  CGPoint v9;
  CGPoint v10;

  v4 = (CGPoint *)*((_QWORD *)a4 + 9);
  v5 = (CGPoint *)*((_QWORD *)a4 + 3);
  v6 = (CGPoint *)*((_QWORD *)a4 + 6);
  v7 = *(CGPoint *)(*(_QWORD *)a4 + 16);
  retstr->var0.var0 = *(CGPoint *)*(_QWORD *)a4;
  retstr->var0.var1 = v7;
  v8 = v5[1];
  retstr->var1.var0 = *v5;
  retstr->var1.var1 = v8;
  v9 = v6[1];
  retstr->var2.var0 = *v6;
  retstr->var2.var1 = v9;
  v10 = v4[1];
  retstr->var3.var0 = *v4;
  retstr->var3.var1 = v10;
  return result;
}

+ (PrincipalLines)convertFromCHPrincipalLines:(SEL)a3
{
  CGPoint *v6;
  CGPoint *v7;
  CGPoint *v8;
  PrincipalLines *result;
  CGPoint var0;
  $D9ACD5A945031E604089763E4FBE0988 v11;
  $D9ACD5A945031E604089763E4FBE0988 var2;
  $D9ACD5A945031E604089763E4FBE0988 var3;
  CGPoint var1;

  *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->top.__end_ = 0u;
  *(_OWORD *)&retstr->base.__end_ = 0u;
  *(_OWORD *)&retstr->median.__begin_ = 0u;
  *(_OWORD *)&retstr->descender.__begin_ = 0u;
  *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
  var0 = a4->var0.var0;
  var1 = a4->var0.var1;
  v6 = (CGPoint *)operator new(0x20uLL);
  *v6 = var0;
  v6[1] = var1;
  retstr->descender.__begin_ = v6;
  retstr->descender.__end_ = v6 + 2;
  retstr->descender.__end_cap_.__value_ = v6 + 2;
  v11 = a4->var1;
  v7 = (CGPoint *)operator new(0x20uLL);
  *($D9ACD5A945031E604089763E4FBE0988 *)&v7->x = v11;
  retstr->base.__begin_ = v7;
  retstr->base.__end_ = v7 + 2;
  retstr->base.__end_cap_.__value_ = v7 + 2;
  var2 = a4->var2;
  v8 = (CGPoint *)operator new(0x20uLL);
  *($D9ACD5A945031E604089763E4FBE0988 *)&v8->x = var2;
  retstr->median.__begin_ = v8;
  retstr->median.__end_ = v8 + 2;
  retstr->median.__end_cap_.__value_ = v8 + 2;
  var3 = a4->var3;
  result = (PrincipalLines *)operator new(0x20uLL);
  *($D9ACD5A945031E604089763E4FBE0988 *)&result->descender.__begin_ = var3;
  retstr->top.__begin_ = (CGPoint *)result;
  retstr->top.__end_ = (CGPoint *)&result->base.__end_;
  retstr->top.__end_cap_.__value_ = (CGPoint *)&result->base.__end_;
  return result;
}

+ (id)changeTokensToVisualOrder:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  objc_msgSend_sortedArrayUsingComparator_(a3, a2, (uint64_t)&unk_1E77F1BF0, v3, v4, v5);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)revertTokenOrder:(id)a3 textResult:(id)a4
{
  id v6;
  id v7;
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
  uint64_t v31;
  id v32;
  id v33;
  id v34;
  const char *v35;
  void *v36;
  id v37;
  _QWORD v39[4];
  id v40;
  id v41;
  CHTextTransformationManager *v42;
  id v43;

  v6 = a3;
  v7 = a4;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_inputStrokeIdentifiers(v7, v14, v15, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_topModelTranscriptionPath(v7, v20, v21, v22, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend_tokenColumnCount(v7, v26, v27, v28, v29, v30);
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = sub_1BE7A2B24;
  v39[3] = &unk_1E77F4FA0;
  v32 = v19;
  v40 = v32;
  v33 = v6;
  v41 = v33;
  v42 = self;
  v34 = v13;
  v43 = v34;
  objc_msgSend_enumerateTokensInTranscriptionPath_columnRange_tokenProcessingBlock_(v7, v35, (uint64_t)v25, 0, v31, (uint64_t)v39);
  v36 = v43;
  v37 = v34;

  return v37;
}

+ (double)estimatedLeadingForTextLine:(id)a3
{
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int hasDescender;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int hasAscender;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  double *v32;
  double *v33;
  double *v34;
  double *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double *v41;
  double *v42;
  double *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  double *v49;
  double *v50;
  double *v51;
  double *v52;
  double *v53;
  double *v54;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  double *v69;
  double *v70;
  double *v71;
  double *v72;
  double *v73;
  double *v74;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double *v83;
  double *v84;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double *v95;
  double *v96;
  double v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  void *v106;
  void *v107[2];
  double *v108;
  double *v109;
  __int128 v110;
  double *v111;
  double *v112;
  double *v113;
  __int128 v114;
  double *v115;
  void *v116;
  void *v117[2];

  v3 = a3;
  objc_msgSend_string(v3, v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_opt_class();
  hasDescender = objc_msgSend_hasDescender_(v10, v11, (uint64_t)v9, v12, v13, v14);
  v16 = (void *)objc_opt_class();
  hasAscender = objc_msgSend_hasAscender_(v16, v17, (uint64_t)v9, v18, v19, v20);
  if ((hasDescender & hasAscender) != 1)
  {
    if (hasAscender)
    {
      if (v3)
      {
        objc_msgSend_principalLines(v3, v22, v23, v24, v25, v26);
        objc_msgSend_principalLines(v3, v36, v37, v38, v39, v40);
        v41 = (double *)*((_QWORD *)&v114 + 1);
        v42 = v115;
        v34 = (double *)*((_QWORD *)&v110 + 1);
        v43 = v111;
        if ((char *)v115 - *((_QWORD *)&v114 + 1) != (char *)v111 - *((_QWORD *)&v110 + 1))
          goto LABEL_47;
      }
      else
      {
        v43 = 0;
        v34 = 0;
        v42 = 0;
        v41 = 0;
        *(_OWORD *)v117 = 0u;
        v116 = 0;
        v112 = 0;
        v114 = 0u;
        v108 = 0;
        v106 = 0;
        *(_OWORD *)v107 = 0u;
      }
      v73 = v34;
      v74 = v41;
      if (v41 == v42 || (v73 = v34, v74 = v41, v34 == v43))
      {
LABEL_43:
        if (v74 == v42 && v73 == v43)
          goto LABEL_45;
      }
      else
      {
        v74 = v41;
        v73 = v34;
        while (*v74 == *v73 && v74[1] == v73[1])
        {
          v74 += 2;
          v73 += 2;
          if (v74 == v42 || v73 == v43)
            goto LABEL_43;
        }
      }
LABEL_47:
      v77 = *v41;
      v76 = v41[1];
      v78 = (v41[3] - v76) / (v41[2] - *v41);
      v79 = v34[1];
      v80 = (v34[3] - v79) / (v34[2] - *v34);
      v81 = v79 - v80 * *v34;
      v82 = *v41;
      if (v78 != 0.0)
        v82 = (v76 - -1.0 / v78 * v77 - v81) / (v80 - -1.0 / v78);
      v63 = sqrt((v76 - (v81 + v80 * v82)) * (v76 - (v81 + v80 * v82)) + (v77 - v82) * (v77 - v82)) * 1.5;
      goto LABEL_84;
    }
    if (hasDescender)
    {
      if (v3)
      {
        objc_msgSend_principalLines(v3, v22, v23, v24, v25, v26);
        objc_msgSend_principalLines(v3, v44, v45, v46, v47, v48);
        v49 = v112;
        v50 = v113;
        v51 = v108;
        v52 = v109;
        if ((char *)v113 - (char *)v112 != (char *)v109 - (char *)v108)
          goto LABEL_63;
      }
      else
      {
        v52 = 0;
        v51 = 0;
        v50 = 0;
        v49 = 0;
        *(_OWORD *)v117 = 0u;
        v116 = 0;
        v112 = 0;
        v114 = 0u;
        v110 = 0u;
        v108 = 0;
        v106 = 0;
        *(_OWORD *)v107 = 0u;
      }
      v83 = v51;
      v84 = v49;
      if (v49 != v50)
      {
        v83 = v51;
        v84 = v49;
        if (v51 != v52)
        {
          v84 = v49;
          v83 = v51;
          while (*v84 == *v83 && v84[1] == v83[1])
          {
            v84 += 2;
            v83 += 2;
            if (v84 == v50 || v83 == v52)
              goto LABEL_61;
          }
          goto LABEL_63;
        }
      }
LABEL_61:
      if (v84 != v50 || (v63 = 0.0, v83 != v52))
      {
LABEL_63:
        v87 = *v49;
        v86 = v49[1];
        v88 = (v49[3] - v86) / (v49[2] - *v49);
        v89 = v51[1];
        v90 = (v51[3] - v89) / (v51[2] - *v51);
        v91 = v89 - v90 * *v51;
        v92 = *v49;
        if (v88 != 0.0)
          v92 = (v86 - -1.0 / v88 * v87 - v91) / (v90 - -1.0 / v88);
        v93 = sqrt((v86 - (v91 + v90 * v92)) * (v86 - (v91 + v90 * v92)) + (v87 - v92) * (v87 - v92));
        v94 = 1.5;
LABEL_82:
        v63 = v93 * v94;
      }
LABEL_83:
      v34 = (double *)*((_QWORD *)&v110 + 1);
      if (!*((_QWORD *)&v110 + 1))
        goto LABEL_85;
      goto LABEL_84;
    }
    if (v3)
    {
      objc_msgSend_principalLines(v3, v22, v23, v24, v25, v26);
      objc_msgSend_principalLines(v3, v64, v65, v66, v67, v68);
      v69 = (double *)*((_QWORD *)&v114 + 1);
      v70 = v115;
      v71 = v108;
      v72 = v109;
      if ((double *)((char *)v115 - *((_QWORD *)&v114 + 1)) != (double *)((char *)v109 - (char *)v108))
        goto LABEL_79;
    }
    else
    {
      v72 = 0;
      v71 = 0;
      v70 = 0;
      v69 = 0;
      *(_OWORD *)v117 = 0u;
      v116 = 0;
      v112 = 0;
      v114 = 0u;
      v110 = 0u;
      v108 = 0;
      v106 = 0;
      *(_OWORD *)v107 = 0u;
    }
    v95 = v71;
    v96 = v69;
    if (v69 == v70 || (v95 = v71, v96 = v69, v71 == v72))
    {
LABEL_77:
      if (v96 == v70)
      {
        v63 = 0.0;
        if (v95 == v72)
          goto LABEL_83;
      }
    }
    else
    {
      v96 = v69;
      v95 = v71;
      while (*v96 == *v95 && v96[1] == v95[1])
      {
        v96 += 2;
        v95 += 2;
        if (v96 == v70 || v95 == v72)
          goto LABEL_77;
      }
    }
LABEL_79:
    v99 = *v69;
    v98 = v69[1];
    v100 = (v69[3] - v98) / (v69[2] - *v69);
    v101 = v71[1];
    v102 = (v71[3] - v101) / (v71[2] - *v71);
    v103 = v101 - v102 * *v71;
    v104 = *v69;
    if (v100 != 0.0)
      v104 = (v98 - -1.0 / v100 * v99 - v103) / (v102 - -1.0 / v100);
    v93 = sqrt((v98 - (v103 + v102 * v104)) * (v98 - (v103 + v102 * v104)) + (v99 - v104) * (v99 - v104));
    v94 = 3.0;
    goto LABEL_82;
  }
  if (v3)
  {
    objc_msgSend_principalLines(v3, v22, v23, v24, v25, v26);
    objc_msgSend_principalLines(v3, v27, v28, v29, v30, v31);
    v32 = v112;
    v33 = v113;
    v34 = (double *)*((_QWORD *)&v110 + 1);
    v35 = v111;
    if ((double *)((char *)v113 - (char *)v112) != (double *)((char *)v111 - *((_QWORD *)&v110 + 1)))
      goto LABEL_26;
  }
  else
  {
    v35 = 0;
    v34 = 0;
    v33 = 0;
    v32 = 0;
    *(_OWORD *)v117 = 0u;
    v116 = 0;
    v112 = 0;
    v114 = 0u;
    v108 = 0;
    v106 = 0;
    *(_OWORD *)v107 = 0u;
  }
  v53 = v34;
  v54 = v32;
  if (v32 != v33)
  {
    v53 = v34;
    v54 = v32;
    if (v34 != v35)
    {
      v54 = v32;
      v53 = v34;
      while (*v54 == *v53 && v54[1] == v53[1])
      {
        v54 += 2;
        v53 += 2;
        if (v54 == v33 || v53 == v35)
          goto LABEL_24;
      }
      goto LABEL_26;
    }
  }
LABEL_24:
  if (v54 != v33 || v53 != v35)
  {
LABEL_26:
    v57 = *v32;
    v56 = v32[1];
    v58 = (v32[3] - v56) / (v32[2] - *v32);
    v59 = v34[1];
    v60 = (v34[3] - v59) / (v34[2] - *v34);
    v61 = v59 - v60 * *v34;
    v62 = *v32;
    if (v58 != 0.0)
      v62 = (v56 - -1.0 / v58 * v57 - v61) / (v60 - -1.0 / v58);
    v63 = sqrt((v56 - (v61 + v60 * v62)) * (v56 - (v61 + v60 * v62)) + (v57 - v62) * (v57 - v62));
    goto LABEL_84;
  }
LABEL_45:
  v63 = 0.0;
  if (v34)
LABEL_84:
    operator delete(v34);
LABEL_85:
  if (v108)
    operator delete(v108);
  if (v107[1])
    operator delete(v107[1]);
  if (v106)
    operator delete(v106);
  if (v117[1])
    operator delete(v117[1]);
  if (v116)
    operator delete(v116);
  if (*((_QWORD *)&v114 + 1))
    operator delete(*((void **)&v114 + 1));
  if (v112)
    operator delete(v112);

  return v63 * 1.25;
}

+ (id)textLineForStrokes:(id)a3 tokens:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6 initialOrientationEstimate:(double)a7 shouldCancel:(id)a8
{
  id v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __CFString *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  __CFString *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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
  id v58;
  unint64_t v59;
  const char *v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  __int128 *v69;
  uint64_t v70;
  char *v71;
  int64_t v72;
  char *v73;
  uint64_t v74;
  unint64_t v75;
  uint64_t v76;
  uint64_t v77;
  unint64_t v78;
  char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  char *v86;
  char *v87;
  __int128 v88;
  char *v89;
  char *v90;
  uint64_t v91;
  char *v92;
  char *v93;
  __int128 v94;
  char *v95;
  char *v96;
  void *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  double v104;
  const char *v105;
  uint64_t v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  unint64_t v111;
  void *v112;
  void *v113;
  _OWORD *v114;
  _OWORD *v115;
  char *v116;
  char *v117;
  char *v118;
  char *v119;
  uint64_t v120;
  unint64_t v121;
  uint64_t v122;
  unint64_t v123;
  char *v124;
  char *v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  char *v130;
  uint64_t v131;
  unint64_t v132;
  uint64_t v133;
  unint64_t v134;
  char *v135;
  char *v136;
  char *v137;
  char *v138;
  char *v139;
  char *v140;
  void *v141;
  int64_t v142;
  char *v143;
  char *v144;
  char *v145;
  id v146;
  NSObject *v147;
  double *v148;
  double v149;
  double v150;
  double v151;
  double v152;
  double v153;
  double v154;
  char *v155;
  char *v156;
  void *v157;
  char *v158;
  void *v159;
  void *v160;
  void *v162;
  const char *v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  void *v175;
  const char *v176;
  uint64_t v177;
  uint64_t v178;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  void *v184;
  const char *v185;
  void *v186;
  double v187;
  double v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  double v194;
  double v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  double v201;
  _BOOL4 v202;
  id v203;
  NSObject *v204;
  NSObject *v205;
  NSObject *v206;
  uint64_t v207;
  uint64_t v209;
  os_signpost_id_t spid;
  id v211;
  id v212;
  uint64_t (**v213)(void);
  id v214;
  id obj;
  uint64_t v216;
  uint64_t v217;
  id v218;
  id v219;
  uint64_t v220;
  __CFString *v221;
  uint8_t v222[8];
  double v223;
  void *v224[2];
  void *v225;
  char *v226;
  unint64_t v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  void *v232[4];
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  void *__p;
  char *v238;
  char *v239;
  void *v240;
  char *v241;
  unint64_t v242;
  void *v243;
  char *v244;
  unint64_t v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  _BYTE buf[32];
  uint64_t v251;
  _BYTE v252[128];
  uint64_t v253;
  _BYTE v254[128];
  _BYTE v255[128];
  uint64_t v256;

  v256 = *MEMORY[0x1E0C80C00];
  v212 = a3;
  v12 = a4;
  v211 = a5;
  v213 = (uint64_t (**)(void))a8;
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v13 = (id)qword_1EF568E50;
  spid = os_signpost_id_generate(v13);

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v14 = (id)qword_1EF568E50;
  v15 = v14;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v15, OS_SIGNPOST_INTERVAL_BEGIN, spid, "CHPrincipalLines", ", buf, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v16 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE607000, v16, OS_LOG_TYPE_DEFAULT, "BEGIN \"CHPrincipalLines\", buf, 2u);
  }

  v248 = 0u;
  v249 = 0u;
  v246 = 0u;
  v247 = 0u;
  obj = v12;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v246, (uint64_t)v255, 16, v18);
  if (v24)
  {
    v25 = *(_QWORD *)v247;
    v26 = &stru_1E77F6F28;
    do
    {
      v27 = 0;
      v28 = v26;
      do
      {
        if (*(_QWORD *)v247 != v25)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v246 + 1) + 8 * v27);
        if ((objc_msgSend_properties(v29, v19, v20, v21, v22, v23) & 0x20) != 0)
        {
          objc_msgSend_stringByAppendingString_(v28, v30, (uint64_t)CFSTR(" "), v32, v33, v34);
          v35 = objc_claimAutoreleasedReturnValue();

          v28 = (void *)v35;
        }
        objc_msgSend_string(v29, v30, v31, v32, v33, v34);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByAppendingString_(v28, v37, (uint64_t)v36, v38, v39, v40);
        v220 = objc_claimAutoreleasedReturnValue();

        ++v27;
        v26 = (__CFString *)v220;
        v28 = (void *)v220;
      }
      while (v24 != v27);
      v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v246, (uint64_t)v255, 16, v23);
    }
    while (v24);
  }
  else
  {
    v26 = &stru_1E77F6F28;
  }

  v41 = v26;
  v221 = v41;
  v42 = (void *)objc_opt_class();
  v52 = v41;
  if (objc_msgSend_shouldAdjustRenderString_(v42, v43, (uint64_t)v211, v44, v45, v46))
  {
    v53 = (void *)objc_opt_class();
    objc_msgSend_stringForRendering_useAltChars_(v53, v54, (uint64_t)v41, 0, v55, v56);
    v57 = objc_claimAutoreleasedReturnValue();

    v52 = (void *)v57;
  }
  if (v213 && (v213[2]() & 1) != 0)
  {
    v58 = 0;
    goto LABEL_164;
  }
  v243 = 0;
  v244 = 0;
  v245 = 0;
  v240 = 0;
  v241 = 0;
  v242 = 0;
  v59 = objc_msgSend_count(v212, v47, v48, v49, v50, v51);
  sub_1BE7A45C8((uint64_t)&v240, v59);
  v209 = (uint64_t)v52;
  __p = 0;
  v238 = 0;
  v239 = 0;
  v233 = 0u;
  v234 = 0u;
  v235 = 0u;
  v236 = 0u;
  v218 = v212;
  v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v218, v60, (uint64_t)&v233, (uint64_t)v254, 16, v61);
  if (v65)
  {
    v66 = *(_QWORD *)v234;
    do
    {
      v67 = 0;
      v216 = v65;
      do
      {
        if (*(_QWORD *)v234 != v66)
          objc_enumerationMutation(v218);
        v253 = *(_QWORD *)(*((_QWORD *)&v233 + 1) + 8 * v67);
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v62, (uint64_t)&v253, 1, v63, v64);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        CoreHandwriting::getPointSet(v68, buf);

        v69 = *(__int128 **)buf;
        if ((uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >= 1)
        {
          v70 = (uint64_t)(*(_QWORD *)&buf[8] - *(_QWORD *)buf) >> 4;
          v71 = v238;
          v72 = v238 - (_BYTE *)__p;
          v73 = (char *)__p + ((v238 - (_BYTE *)__p) & 0xFFFFFFFFFFFFFFF0);
          if (v70 > (v239 - v238) >> 4)
          {
            v74 = v72 >> 4;
            v75 = (v72 >> 4) + v70;
            if (v75 >> 60)
              sub_1BE61F930();
            v76 = v66;
            v77 = v239 - (_BYTE *)__p;
            if ((v239 - (_BYTE *)__p) >> 3 > v75)
              v75 = v77 >> 3;
            if ((unint64_t)v77 >= 0x7FFFFFFFFFFFFFF0)
              v78 = 0xFFFFFFFFFFFFFFFLL;
            else
              v78 = v75;
            if (v78)
            {
              if (v78 >> 60)
                sub_1BE61F100();
              v79 = (char *)operator new(16 * v78);
            }
            else
            {
              v79 = 0;
            }
            v90 = &v79[16 * v74];
            v91 = 16 * v70;
            v92 = &v90[16 * v70];
            v93 = v90;
            do
            {
              v94 = *v69++;
              *(_OWORD *)v93 = v94;
              v93 += 16;
              v91 -= 16;
            }
            while (v91);
            v95 = (char *)__p;
            if (__p != v73)
            {
              v96 = v73;
              do
              {
                *((_OWORD *)v90 - 1) = *((_OWORD *)v96 - 1);
                v90 -= 16;
                v96 -= 16;
              }
              while (v96 != v95);
              v71 = v238;
            }
            if (v71 != v73)
              memmove(v92, v73, v71 - v73);
            v97 = __p;
            __p = v90;
            v238 = &v92[v71 - v73];
            v239 = &v79[16 * v78];
            v66 = v76;
            v65 = v216;
            if (v97)
              operator delete(v97);
            goto LABEL_68;
          }
          v80 = v238 - v73;
          v81 = (v238 - v73) >> 4;
          if (v81 >= v70)
          {
            v82 = *(_QWORD *)buf + 16 * v70;
            v84 = v238;
            v85 = 16 * v70;
            v86 = &v238[-16 * v70];
            v87 = v238;
            if (v86 >= v238)
              goto LABEL_51;
            goto LABEL_50;
          }
          v82 = *(_QWORD *)buf + 16 * v81;
          v83 = *(_QWORD *)&buf[8] - v82;
          if (*(_QWORD *)&buf[8] != v82)
            memmove(v238, (const void *)(*(_QWORD *)buf + 16 * v81), *(_QWORD *)&buf[8] - v82);
          v84 = &v71[v83];
          v238 = &v71[v83];
          if (v80 >= 1)
          {
            v85 = 16 * v70;
            v86 = &v84[-16 * v70];
            v87 = &v71[v83];
            if (v86 >= v71)
            {
LABEL_51:
              v89 = &v73[v85];
              v238 = v87;
              if (v84 != v89)
                memmove(&v84[-16 * ((v84 - v89) >> 4)], v73, v84 - v89);
              if ((__int128 *)v82 != v69)
                memmove(v73, v69, v82 - (_QWORD)v69);
              goto LABEL_68;
            }
            do
            {
LABEL_50:
              v88 = *(_OWORD *)v86;
              v86 += 16;
              *(_OWORD *)v87 = v88;
              v87 += 16;
            }
            while (v86 < v71);
            goto LABEL_51;
          }
        }
LABEL_68:
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
        ++v67;
      }
      while (v67 != v65);
      v65 = objc_msgSend_countByEnumeratingWithState_objects_count_(v218, v62, (uint64_t)&v233, (uint64_t)v254, 16, v64);
    }
    while (v65);
  }

  v232[3] = 0;
  objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v98, (uint64_t)v218, v99, v100, v101);
  v104 = -a7;
  if (a7 == 1.79769313e308)
    v104 = 1.79769313e308;
  sub_1BE7F5CD4((uint64_t *)&__p, v221, v232, v102, v103, v104);
  v230 = 0u;
  v231 = 0u;
  v228 = 0u;
  v229 = 0u;
  v214 = v218;
  v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v214, v105, (uint64_t)&v228, (uint64_t)v252, 16, v106);
  if (v110)
  {
    v111 = 0;
    v217 = *(_QWORD *)v229;
    do
    {
      v112 = 0;
      v219 = (id)v110;
      do
      {
        if (*(_QWORD *)v229 != v217)
          objc_enumerationMutation(v214);
        v251 = *(_QWORD *)(*((_QWORD *)&v228 + 1) + 8 * (_QWORD)v112);
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v107, (uint64_t)&v251, 1, v108, v109);
        v113 = (void *)objc_claimAutoreleasedReturnValue();
        CoreHandwriting::getPointSet(v113, buf);

        v225 = 0;
        v226 = 0;
        v227 = 0;
        v114 = *(_OWORD **)buf;
        v115 = *(_OWORD **)&buf[8];
        while (v114 != v115)
        {
          *(_OWORD *)v224 = *v114;
          if (((*(_QWORD *)((char *)v232[0] + ((v111 >> 3) & 0x1FFFFFFFFFFFFFF8)) >> v111) & 1) != 0)
          {
            v117 = v226;
            if ((unint64_t)v226 < v227)
            {
              *(_OWORD *)v226 = *v114;
              v118 = v117 + 16;
              goto LABEL_103;
            }
            v119 = (char *)v225;
            v120 = (v226 - (_BYTE *)v225) >> 4;
            v121 = v120 + 1;
            if ((unint64_t)(v120 + 1) >> 60)
              goto LABEL_190;
            v122 = v227 - (_QWORD)v225;
            if ((uint64_t)(v227 - (_QWORD)v225) >> 3 > v121)
              v121 = v122 >> 3;
            if ((unint64_t)v122 >= 0x7FFFFFFFFFFFFFF0)
              v123 = 0xFFFFFFFFFFFFFFFLL;
            else
              v123 = v121;
            if (v123)
            {
              if (v123 >> 60)
                goto LABEL_189;
              v124 = (char *)operator new(16 * v123);
              v125 = &v124[16 * v120];
              *(_OWORD *)v125 = *(_OWORD *)v224;
              v126 = v125;
              if (v117 == v119)
              {
LABEL_101:
                v128 = &v124[16 * v123];
                v118 = v125 + 16;
                v225 = v126;
                v226 = v125 + 16;
                v227 = (unint64_t)v128;
                if (v117)
                  goto LABEL_102;
                goto LABEL_103;
              }
            }
            else
            {
              v124 = 0;
              v125 = (char *)(16 * v120);
              *(_OWORD *)(16 * v120) = *(_OWORD *)v224;
              v126 = (char *)(16 * v120);
              if (v117 == v119)
                goto LABEL_101;
            }
            do
            {
              *((_OWORD *)v126 - 1) = *((_OWORD *)v117 - 1);
              v126 -= 16;
              v117 -= 16;
            }
            while (v117 != v119);
            v117 = (char *)v225;
            v127 = &v124[16 * v123];
            v118 = v125 + 16;
            v225 = v126;
            v226 = v125 + 16;
            v227 = (unint64_t)v127;
            if (v117)
LABEL_102:
              operator delete(v117);
LABEL_103:
            v226 = v118;
            v129 = v244;
            if ((unint64_t)v244 < v245)
            {
              *(_OWORD *)v244 = *(_OWORD *)v224;
              v116 = v129 + 16;
              goto LABEL_81;
            }
            v130 = (char *)v243;
            v131 = (v244 - (_BYTE *)v243) >> 4;
            v132 = v131 + 1;
            if ((unint64_t)(v131 + 1) >> 60)
LABEL_190:
              sub_1BE61F930();
            v133 = v245 - (_QWORD)v243;
            if ((uint64_t)(v245 - (_QWORD)v243) >> 3 > v132)
              v132 = v133 >> 3;
            if ((unint64_t)v133 >= 0x7FFFFFFFFFFFFFF0)
              v134 = 0xFFFFFFFFFFFFFFFLL;
            else
              v134 = v132;
            if (v134)
            {
              if (v134 >> 60)
LABEL_189:
                sub_1BE61F100();
              v135 = (char *)operator new(16 * v134);
              v136 = &v135[16 * v131];
              *(_OWORD *)v136 = *(_OWORD *)v224;
              v137 = v136;
              if (v129 == v130)
              {
LABEL_118:
                v139 = &v135[16 * v134];
                v116 = v136 + 16;
                v243 = v137;
                v244 = v136 + 16;
                v245 = (unint64_t)v139;
                if (v129)
                  goto LABEL_119;
                goto LABEL_81;
              }
            }
            else
            {
              v135 = 0;
              v136 = (char *)(16 * v131);
              *(_OWORD *)(16 * v131) = *(_OWORD *)v224;
              v137 = (char *)(16 * v131);
              if (v129 == v130)
                goto LABEL_118;
            }
            do
            {
              *((_OWORD *)v137 - 1) = *((_OWORD *)v129 - 1);
              v137 -= 16;
              v129 -= 16;
            }
            while (v129 != v130);
            v129 = (char *)v243;
            v138 = &v135[16 * v134];
            v116 = v136 + 16;
            v243 = v137;
            v244 = v136 + 16;
            v245 = (unint64_t)v138;
            if (v129)
LABEL_119:
              operator delete(v129);
LABEL_81:
            v244 = v116;
          }
          ++v111;
          ++v114;
        }
        v140 = v241;
        if ((unint64_t)v241 >= v242)
        {
          v145 = sub_1BE761A3C((char **)&v240, (uint64_t)&v225);
          v146 = v219;
        }
        else
        {
          *(_QWORD *)v241 = 0;
          *((_QWORD *)v140 + 1) = 0;
          *((_QWORD *)v140 + 2) = 0;
          v141 = v225;
          v142 = v226 - (_BYTE *)v225;
          if (v226 != v225)
          {
            if (v142 < 0)
              sub_1BE61F930();
            v143 = (char *)operator new(v226 - (_BYTE *)v225);
            *(_QWORD *)v140 = v143;
            *((_QWORD *)v140 + 1) = v143;
            v144 = &v143[16 * (v142 >> 4)];
            *((_QWORD *)v140 + 2) = v144;
            memcpy(v143, v141, v142);
            *((_QWORD *)v140 + 1) = v144;
          }
          v145 = v140 + 24;
          v146 = v219;
        }
        v241 = v145;
        if (v225)
        {
          v226 = (char *)v225;
          operator delete(v225);
        }
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
        v112 = (char *)v112 + 1;
      }
      while (v112 != v146);
      v110 = objc_msgSend_countByEnumeratingWithState_objects_count_(v214, v107, (uint64_t)&v228, (uint64_t)v252, 16, v109);
    }
    while (v110);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v147 = (id)qword_1EF568E68;
  if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    *(void **)&buf[4] = v232[1];
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = (v244 - (_BYTE *)v243) >> 4;
    _os_log_impl(&dword_1BE607000, v147, OS_LOG_TYPE_DEFAULT, "Clipping: initial point count = %ld, final count = %ld", buf, 0x16u);
  }

  *(_OWORD *)buf = xmmword_1BE8D68A0;
  *(_OWORD *)&buf[16] = xmmword_1BE8D68A0;
  v148 = (double *)v243;
  if (v243 == v244)
  {
LABEL_148:
    v58 = 0;
    goto LABEL_149;
  }
  v149 = 1.79769313e308;
  v150 = -1.79769313e308;
  v151 = -1.79769313e308;
  v152 = 1.79769313e308;
  do
  {
    v153 = *v148;
    if (v152 <= *v148)
    {
      if (v151 >= v153)
      {
LABEL_140:
        v154 = v148[1];
        if (v149 <= v154)
          goto LABEL_145;
        goto LABEL_141;
      }
    }
    else
    {
      *(double *)buf = *v148;
      v152 = v153;
      if (v151 >= v153)
        goto LABEL_140;
    }
    *(double *)&buf[8] = v153;
    v151 = v153;
    v154 = v148[1];
    if (v149 <= v154)
    {
LABEL_145:
      if (v150 >= v154)
        goto LABEL_137;
      goto LABEL_146;
    }
LABEL_141:
    *(double *)&buf[16] = v154;
    v149 = v154;
    if (v150 >= v154)
      goto LABEL_137;
LABEL_146:
    *(double *)&buf[24] = v154;
    v150 = v154;
LABEL_137:
    v148 += 2;
  }
  while (v148 != (double *)v244);
  if (v150 - v149 == 0.0)
    goto LABEL_148;
  sub_1BE7FDB94((double **)&v243, (double *)buf, (double **)&v225);
  sub_1BE7F67A0((uint64_t)&v225, (char **)v224, 4.0);
  v223 = 0.0;
  v162 = (void *)objc_opt_class();
  objc_msgSend_textLineCandidate_tokens_locale_strokeClassification_string_points_strokePoints_alphaShape_initialOrientationEstimate_useAltString_outFitScore_shouldCancel_(v162, v163, (uint64_t)v214, (uint64_t)obj, (uint64_t)v211, a6, v209, &v243, a7, &v240, v224, 0, &v223, v213);
  v164 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend_count(obj, v165, v166, v167, v168, v169) <= 4)
  {
    v170 = (void *)objc_opt_class();
    if (objc_msgSend_shouldAdjustRenderString_(v170, v171, (uint64_t)v211, v172, v173, v174))
    {
      v175 = (void *)objc_opt_class();
      objc_msgSend_stringForRendering_useAltChars_(v175, v176, (uint64_t)v221, 1, v177, v178);
      v179 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend_isEqualToString_(v179, v180, v209, v181, v182, v183) & 1) == 0)
      {
        *(double *)v222 = 0.0;
        v184 = (void *)objc_opt_class();
        LOBYTE(v207) = 1;
        objc_msgSend_textLineCandidate_tokens_locale_strokeClassification_string_points_strokePoints_alphaShape_initialOrientationEstimate_useAltString_outFitScore_shouldCancel_(v184, v185, (uint64_t)v214, (uint64_t)obj, (uint64_t)v211, a6, v179, &v243, a7, &v240, v224, v207, v222, v213);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        v187 = *(double *)v222;
        v188 = v223;
        objc_msgSend_orientation(v186, v189, v190, v191, v192, v193);
        v195 = v194;
        objc_msgSend_orientation(v164, v196, v197, v198, v199, v200);
        if (!v164)
          goto LABEL_173;
        v202 = vabdd_f64(v223, *(double *)v222) > 4.0;
        if (fabs(v195) < fabs(v201))
          v202 = 1;
        if (v187 < v188 && v202)
        {
LABEL_173:
          v203 = v186;

          v223 = *(double *)v222;
          v164 = v203;
        }

      }
    }
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v204 = (id)qword_1EF568E50;
  v205 = v204;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v204))
  {
    *(_WORD *)v222 = 0;
    _os_signpost_emit_with_name_impl(&dword_1BE607000, v205, OS_SIGNPOST_INTERVAL_END, spid, "CHPrincipalLines", ", v222, 2u);
  }

  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v206 = (id)qword_1EF568E18[0];
  if (os_log_type_enabled(v206, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v222 = 0;
    _os_log_impl(&dword_1BE607000, v206, OS_LOG_TYPE_DEFAULT, "END \"CHPrincipalLines\", v222, 2u);
  }

  v58 = v164;
  if (v224[0])
  {
    v224[1] = v224[0];
    operator delete(v224[0]);
  }
  if (v225)
  {
    v226 = (char *)v225;
    operator delete(v225);
  }
LABEL_149:
  if (v232[0])
    operator delete(v232[0]);
  if (__p)
  {
    v238 = (char *)__p;
    operator delete(__p);
  }
  v155 = (char *)v240;
  if (v240)
  {
    v156 = v241;
    v157 = v240;
    if (v241 != v240)
    {
      v158 = v241;
      do
      {
        v160 = (void *)*((_QWORD *)v158 - 3);
        v158 -= 24;
        v159 = v160;
        if (v160)
        {
          *((_QWORD *)v156 - 2) = v159;
          operator delete(v159);
        }
        v156 = v158;
      }
      while (v158 != v155);
      v157 = v240;
    }
    v241 = v155;
    operator delete(v157);
  }
  if (v243)
  {
    v244 = (char *)v243;
    operator delete(v243);
  }

  v52 = (void *)v209;
LABEL_164:

  return v58;
}

+ (PrincipalLines)principalLinesFromToken:(SEL)a3 strokes:(id)a4
{
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
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  double v46;
  double v47;
  PrincipalLines *result;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61[16];
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;

  v7 = a4;
  v8 = a5;
  objc_msgSend_strokeIndexes(v7, v9, v10, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectsAtIndexes_(v8, v15, (uint64_t)v14, v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_boundsForStrokes_(CHStrokeUtilities, v20, (uint64_t)v19, v21, v22, v23);
  v30 = v29;
  v32 = v31;
  v34 = v33;
  v36 = v35;
  if (v7)
  {
    objc_msgSend_principalLines(v7, v24, v25, v26, v27, v28);
    v58 = *((double *)&v62 + 1);
    v59 = *(double *)&v62;
    v56 = *((double *)&v63 + 1);
    v57 = *(double *)&v63;
    v54 = *((double *)&v64 + 1);
    v55 = *(double *)&v64;
    v52 = *((double *)&v65 + 1);
    v53 = *(double *)&v65;
    v50 = *((double *)&v66 + 1);
    v51 = *(double *)&v66;
    v37 = *((double *)&v67 + 1);
    v49 = *(double *)&v67;
    v39 = *((double *)&v68 + 1);
    v38 = *(double *)&v68;
    v40 = *((double *)&v69 + 1);
    v60 = *(double *)&v69;
  }
  else
  {
    v40 = 0.0;
    v68 = 0u;
    v69 = 0u;
    v39 = 0.0;
    v38 = 0.0;
    v37 = 0.0;
    v66 = 0u;
    v67 = 0u;
    v49 = 0.0;
    v50 = 0.0;
    v51 = 0.0;
    v52 = 0.0;
    v64 = 0u;
    v65 = 0u;
    v53 = 0.0;
    v54 = 0.0;
    v62 = 0u;
    v63 = 0u;
    v55 = 0.0;
    v56 = 0.0;
    v57 = 0.0;
    v58 = 0.0;
    v59 = 0.0;
    v60 = 0.0;
  }
  v41 = (void *)objc_opt_class();
  v46 = 1.0;
  if (v36 == 0.0)
    v47 = 1.0;
  else
    v47 = v36;
  if (v34 != 0.0)
    v46 = v34;
  v61[0] = v30 + v59 * v46;
  v61[1] = v32 + v58 * v47;
  v61[2] = v30 + v57 * v46;
  v61[3] = v32 + v56 * v47;
  v61[4] = v30 + v55 * v46;
  v61[5] = v32 + v54 * v47;
  v61[6] = v30 + v53 * v46;
  v61[7] = v32 + v52 * v47;
  v61[8] = v30 + v51 * v46;
  v61[9] = v32 + v50 * v47;
  v61[10] = v30 + v49 * v46;
  v61[11] = v32 + v37 * v47;
  v61[12] = v30 + v38 * v46;
  v61[13] = v32 + v39 * v47;
  v61[14] = v30 + v60 * v46;
  v61[15] = v32 + v40 * v47;
  if (v41)
  {
    objc_msgSend_convertFromCHPrincipalLines_(v41, v42, (uint64_t)v61, v43, v44, v45);
  }
  else
  {
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
  }

  return result;
}

+ (id)textLineFromCachedResults:(id)a3 tokens:(id)a4 strokes:(id)a5 estimatedOrientation:(double)a6 locale:(id)a7 strokeClassification:(int64_t)a8
{
  id v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
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
  void *v45;
  id v46;
  const char *v47;
  uint64_t v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t i;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  void *v66;
  const char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  void *v71;
  id v72;
  const char *v73;
  uint64_t v74;
  uint64_t v75;
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
  uint64_t v87;
  void *v88;
  void *v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  int v98;
  void *v99;
  void *v100;
  void *v101;
  const char *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  const char *v108;
  uint64_t v109;
  uint64_t v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  CHTransformedTextSegment *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  void *v120;
  __int128 v121;
  const char *v122;
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  CHTransformedTextLine *v133;
  const char *v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  id v141;
  void *v142;
  id obj;
  uint64_t v144;
  uint64_t v145;
  id v146;
  id v147;
  _OWORD v148[3];
  void *v149[3];
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156[3];
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *__p;
  void *v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  __int128 v169;
  __int128 v170;
  void *v171;
  _BYTE v172[128];
  _BYTE v173[128];
  uint64_t v174;

  v174 = *MEMORY[0x1E0C80C00];
  v146 = a3;
  v12 = a4;
  v147 = a5;
  v141 = a7;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16, v17);
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  v169 = 0u;
  v170 = 0u;
  v167 = 0u;
  v168 = 0u;
  obj = v12;
  v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v167, (uint64_t)v173, 16, v19);
  if (v20)
  {
    v145 = *(_QWORD *)v168;
    do
    {
      v26 = 0;
      v144 = v20;
      do
      {
        if (*(_QWORD *)v168 != v145)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v167 + 1) + 8 * v26);
        objc_msgSend_strokeIndexes(v27, v21, v22, v23, v24, v25);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectsAtIndexes_(v147, v29, (uint64_t)v28, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = (void *)MEMORY[0x1E0C99DE8];
        v40 = objc_msgSend_count(v33, v35, v36, v37, v38, v39);
        objc_msgSend_arrayWithCapacity_(v34, v41, v40, v42, v43, v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v165 = 0u;
        v166 = 0u;
        v163 = 0u;
        v164 = 0u;
        v46 = v33;
        v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v163, (uint64_t)v172, 16, v48);
        if (v54)
        {
          v55 = *(_QWORD *)v164;
          do
          {
            for (i = 0; i != v54; ++i)
            {
              if (*(_QWORD *)v164 != v55)
                objc_enumerationMutation(v46);
              objc_msgSend_strokeIdentifier(*(void **)(*((_QWORD *)&v163 + 1) + 8 * i), v49, v50, v51, v52, v53);
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v45, v58, (uint64_t)v57, v59, v60, v61);

            }
            v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v49, (uint64_t)&v163, (uint64_t)v172, 16, v53);
          }
          while (v54);
        }

        objc_msgSend_setWithArray_(MEMORY[0x1E0C99E60], v62, (uint64_t)v45, v63, v64, v65);
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_cachedTranscriptionForStrokeGroup_(v146, v67, (uint64_t)v66, v68, v69, v70);
        v71 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v71)
          goto LABEL_26;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_26;
        v72 = v71;
        objc_msgSend_topModelTranscriptionPath(v72, v73, v74, v75, v76, v77);
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_tokensInTranscriptionPath_atColumnIndex_(v72, v79, (uint64_t)v78, 0, v80, v81);
        v82 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_firstObject(v82, v83, v84, v85, v86, v87);
        v88 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v88)
        {
LABEL_26:
          v98 = 1;
          goto LABEL_27;
        }
        v89 = (void *)objc_opt_class();
        objc_msgSend_principalLinesFromToken_strokes_(v89, v90, (uint64_t)v88, (uint64_t)v147, v91, v92);
        if (vabdd_f64(-atan2(*((double *)v157 + 3) - *((double *)v157 + 1), *((double *)v157 + 2) - *(double *)v157), a6) <= 0.04)
        {
          v100 = (void *)objc_msgSend_mutableCopy(v27, v93, v94, v95, v96, v97);
          v101 = (void *)MEMORY[0x1E0CB36B8];
          v107 = objc_msgSend_count(v46, v102, v103, v104, v105, v106);
          objc_msgSend_indexSetWithIndexesInRange_(v101, v108, 0, v107, v109, v110);
          v111 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setStrokeIndexes_(v100, v112, (uint64_t)v111, v113, v114, v115);

          v116 = [CHTransformedTextSegment alloc];
          v171 = v100;
          objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v117, (uint64_t)&v171, 1, v118, v119);
          v120 = (void *)objc_claimAutoreleasedReturnValue();
          sub_1BE76136C(v149, (uint64_t)v156);
          v121 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
          v148[0] = *MEMORY[0x1E0C9BAA8];
          v148[1] = v121;
          v148[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
          v123 = (void *)objc_msgSend_initWithStrokes_tokens_locale_strokeClassification_principalLines_transform_(v116, v122, (uint64_t)v46, (uint64_t)v120, (uint64_t)v141, a8, v149, v148);
          if (v154)
          {
            v155 = v154;
            operator delete(v154);
          }
          if (v152)
          {
            v153 = v152;
            operator delete(v152);
          }
          if (v150)
          {
            v151 = v150;
            operator delete(v150);
          }
          if (v149[0])
          {
            v149[1] = v149[0];
            operator delete(v149[0]);
          }

          objc_msgSend_addObject_(v142, v124, (uint64_t)v123, v125, v126, v127);
          v98 = 0;
          v99 = __p;
          if (!__p)
            goto LABEL_19;
LABEL_18:
          v162 = v99;
          operator delete(v99);
          goto LABEL_19;
        }
        v98 = 1;
        v99 = __p;
        if (__p)
          goto LABEL_18;
LABEL_19:
        if (v159)
        {
          v160 = v159;
          operator delete(v159);
        }
        if (v157)
        {
          v158 = v157;
          operator delete(v157);
        }
        if (v156[0])
        {
          v156[1] = v156[0];
          operator delete(v156[0]);
        }

LABEL_27:
        if (v98)
        {

          goto LABEL_44;
        }
        ++v26;
      }
      while (v26 != v144);
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v21, (uint64_t)&v167, (uint64_t)v173, 16, v25);
    }
    while (v20);
  }

  if (objc_msgSend_count(v142, v128, v129, v130, v131, v132))
  {
    v133 = [CHTransformedTextLine alloc];
    v138 = (void *)objc_msgSend_initWithSegments_(v133, v134, (uint64_t)v142, v135, v136, v137);
  }
  else
  {
LABEL_44:
    v138 = 0;
  }

  return v138;
}

+ (id)textLineForTokensWithPrincipalLines:(id)a3 strokes:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6
{
  id v9;
  id v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _OWORD *v25;
  uint64_t i;
  void *v27;
  void *v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  const char *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  CHTransformedTextSegment *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
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
  uint64_t v72;
  CHTransformedTextLine *v73;
  const char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  id obj;
  id v85;
  void *v86;
  _OWORD v87[3];
  void *v88[3];
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *__p;
  void *v94;
  void *v95[2];
  void *v96[2];
  __int128 v97;
  void *v98[2];
  void *v99[2];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  void *v105;
  _BYTE v106[128];
  uint64_t v107;

  v107 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v85 = a5;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13, v14, v15, v9);
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = 0u;
  v104 = 0u;
  v101 = 0u;
  v102 = 0u;
  obj = v9;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v101, (uint64_t)v106, 16, v17);
  if (v23)
  {
    v24 = *(_QWORD *)v102;
    v25 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    do
    {
      for (i = 0; i != v23; ++i)
      {
        if (*(_QWORD *)v102 != v24)
          objc_enumerationMutation(obj);
        v27 = *(void **)(*((_QWORD *)&v101 + 1) + 8 * i);
        objc_msgSend_strokeIndexes(v27, v18, v19, v20, v21, v22);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectsAtIndexes_(v10, v29, (uint64_t)v28, v30, v31, v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        v34 = (void *)objc_opt_class();
        if (v34)
        {
          objc_msgSend_principalLinesFromToken_strokes_(v34, v35, (uint64_t)v27, (uint64_t)v10, v38, v39);
        }
        else
        {
          *(_OWORD *)v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          *(_OWORD *)v98 = 0u;
          *(_OWORD *)v95 = 0u;
          *(_OWORD *)v96 = 0u;
        }
        v40 = (void *)objc_msgSend_mutableCopy(v27, v35, v36, v37, v38, v39);
        v41 = (void *)MEMORY[0x1E0CB36B8];
        v47 = objc_msgSend_count(v33, v42, v43, v44, v45, v46);
        objc_msgSend_indexSetWithIndexesInRange_(v41, v48, 0, v47, v49, v50);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_setStrokeIndexes_(v40, v52, (uint64_t)v51, v53, v54, v55);

        v56 = [CHTransformedTextSegment alloc];
        v105 = v40;
        objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v57, (uint64_t)&v105, 1, v58, v59);
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        sub_1BE76136C(v88, (uint64_t)v95);
        v61 = v25[1];
        v87[0] = *v25;
        v87[1] = v61;
        v87[2] = v25[2];
        v63 = (void *)objc_msgSend_initWithStrokes_tokens_locale_strokeClassification_principalLines_transform_(v56, v62, (uint64_t)v33, (uint64_t)v60, (uint64_t)v85, a6, v88, v87);
        if (__p)
        {
          v94 = __p;
          operator delete(__p);
        }
        if (v91)
        {
          v92 = v91;
          operator delete(v91);
        }
        if (v89)
        {
          v90 = v89;
          operator delete(v89);
        }
        if (v88[0])
        {
          v88[1] = v88[0];
          operator delete(v88[0]);
        }

        objc_msgSend_addObject_(v86, v64, (uint64_t)v63, v65, v66, v67);
        if (v99[1])
        {
          *(void **)&v100 = v99[1];
          operator delete(v99[1]);
        }
        if (v98[0])
        {
          v98[1] = v98[0];
          operator delete(v98[0]);
        }
        if (v96[1])
        {
          *(void **)&v97 = v96[1];
          operator delete(v96[1]);
        }
        if (v95[0])
        {
          v95[1] = v95[0];
          operator delete(v95[0]);
        }

      }
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v101, (uint64_t)v106, 16, v22);
    }
    while (v23);
  }

  if (objc_msgSend_count(v86, v68, v69, v70, v71, v72))
  {
    v73 = [CHTransformedTextLine alloc];
    v78 = (void *)objc_msgSend_initWithSegments_(v73, v74, (uint64_t)v86, v75, v76, v77);
    objc_msgSend_setFromCachedTokens_(v78, v79, 1, v80, v81, v82);
  }
  else
  {
    v78 = 0;
  }

  return v78;
}

+ (id)textLineForDrawing:(id)a3 transcriptions:(id)a4 strokeIndexes:(id)a5 fullText:(id)a6 locale:(id)a7 strokeClassification:(int64_t)a8 shouldCancel:(id)a9
{
  id v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
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
  unint64_t v66;
  uint64_t v67;
  double *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
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
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  const char *v88;
  const char *v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  NSString *v98;
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
  uint64_t v109;
  NSCharacterSet *v110;
  _BOOL4 v111;
  CHTokenizedTextResultToken *v112;
  const char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  const char *v119;
  NSObject *v120;
  const char *v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  NSObject *v135;
  void *v136;
  const char *v137;
  void *v138;
  NSObject *v139;
  const char *v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  NSObject *v146;
  id v149;
  os_log_t log;
  id v151;
  void *v152;
  id v153;
  id v154;
  id v155;
  void *v156;
  uint8_t buf[4];
  uint64_t v158;
  __int16 v159;
  uint64_t v160;
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v151 = a3;
  v13 = a4;
  v155 = a5;
  v154 = a6;
  v153 = a7;
  v149 = a9;
  v156 = v13;
  v19 = objc_msgSend_count(v13, v14, v15, v16, v17, v18);
  if (v19 == objc_msgSend_count(v155, v20, v21, v22, v23, v24))
  {
    v30 = objc_msgSend_count(v13, v25, v26, v27, v28, v29);
    if (v30 != objc_msgSend_count(v155, v31, v32, v33, v34, v35))
    {
      if (qword_1EF568E88 != -1)
        dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
      v36 = (id)qword_1EF568E18[0];
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218240;
        v158 = objc_msgSend_count(v13, v37, v38, v39, v40, v41);
        v159 = 2048;
        v160 = objc_msgSend_count(v155, v42, v43, v44, v45, v46);
        _os_log_impl(&dword_1BE607000, v36, OS_LOG_TYPE_FAULT, "The number of transcriptions (%lu) does not equal the number of index sets (%lu)", buf, 0x16u);
      }

    }
    v47 = (void *)objc_opt_class();
    objc_msgSend_strokesFromDrawing_classification_(v47, v48, (uint64_t)v151, a8, v49, v50);
    log = (os_log_t)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_count(log, v51, v52, v53, v54, v55))
    {
      objc_msgSend_array(MEMORY[0x1E0C99DE8], v56, v57, v58, v59, v60);
      v152 = (void *)objc_claimAutoreleasedReturnValue();
      v66 = 0;
      v67 = 0;
      v68 = (double *)MEMORY[0x1E0C9D648];
      while (1)
      {
        if (v66 >= objc_msgSend_count(v156, v61, v62, v63, v64, v65))
        {
          if (objc_msgSend_count(v152, v69, v70, v71, v72, v73))
          {
            v136 = (void *)objc_opt_class();
            objc_msgSend_textLineForStrokes_tokens_locale_strokeClassification_initialOrientationEstimate_shouldCancel_(v136, v137, (uint64_t)log, (uint64_t)v152, (uint64_t)v153, a8, v149, 1.79769313e308);
            v138 = (void *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v146 = (id)qword_1EF568E68;
            if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1BE607000, v146, OS_LOG_TYPE_ERROR, "There are no valid tokens from the drawing to create a transformed text line.", buf, 2u);
            }

            v138 = 0;
          }
          v139 = v138;

          v135 = v139;
          goto LABEL_47;
        }
        objc_msgSend_objectAtIndexedSubscript_(v156, v69, v66, v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectAtIndexedSubscript_(v155, v75, v66, v76, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        v85 = objc_msgSend_length(v154, v80, v81, v82, v83, v84);
        v87 = objc_msgSend_rangeOfString_options_range_(v154, v86, (uint64_t)v74, 0, v67, v85 - v67);
        v89 = v88;
        if (objc_msgSend_hasPrefix_(v74, v88, (uint64_t)CFSTR(" "), v90, v91, v92))
        {
          objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v93, v94, v95, v96, v97);
          v98 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByTrimmingCharactersInSet_(v74, v99, (uint64_t)v98, v100, v101, v102);
          v103 = objc_claimAutoreleasedReturnValue();

          v74 = (void *)v103;
          v104 = 33;
        }
        else
        {
          if (!v87 || v87 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v104 = 1;
            goto LABEL_20;
          }
          objc_msgSend_composedCharacterAtIndex_(v154, v93, v87 - 1, v95, v96, v97);
          v98 = (NSString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v105, v106, v107, v108, v109);
          v110 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
          v111 = isStringEntirelyFromSet(v98, v110);

          if (v111)
            v104 = 33;
          else
            v104 = 1;
        }

LABEL_20:
        if (objc_msgSend_count(v79, v93, v94, v95, v96, v97))
        {
          v112 = [CHTokenizedTextResultToken alloc];
          v118 = objc_msgSend_count(v79, v113, v114, v115, v116, v117);
          v120 = objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v112, v119, (uint64_t)v74, (uint64_t)v79, 0, v104, v153, 1, 1.0, 1.0, 1.0, 1.0, *v68, v68[1], v68[2], v68[3], v118);
          objc_msgSend_addObject_(v152, v121, (uint64_t)v120, v122, v123, v124);
        }
        else
        {
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v120 = (id)qword_1EF568E68;
          if (os_log_type_enabled(v120, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1BE607000, v120, OS_LOG_TYPE_ERROR, "Empty stroke indexes for segment of drawing.", buf, 2u);
          }
        }

        if (v87 != 0x7FFFFFFFFFFFFFFFLL)
          v67 = (uint64_t)&v89[v87];

        ++v66;
      }
    }
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v139 = (id)qword_1EF568E68;
    if (os_log_type_enabled(v139, OS_LOG_TYPE_ERROR))
    {
      v145 = objc_msgSend_strokeCount(v151, v140, v141, v142, v143, v144);
      *(_DWORD *)buf = 134217984;
      v158 = v145;
      _os_log_impl(&dword_1BE607000, v139, OS_LOG_TYPE_ERROR, "Unable to create reflowable text line from drawing, drawing has %ld strokes, no extracted strokes.", buf, 0xCu);
    }
    v135 = 0;
LABEL_47:

  }
  else
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    log = (os_log_t)(id)qword_1EF568E68;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218240;
      v158 = objc_msgSend_count(v13, v125, v126, v127, v128, v129);
      v159 = 2048;
      v160 = objc_msgSend_count(v155, v130, v131, v132, v133, v134);
      _os_log_impl(&dword_1BE607000, log, OS_LOG_TYPE_ERROR, "Unable to build textLineForDrawing because the number of transcriptions (%lu) does not equal the number of index sets (%lu)", buf, 0x16u);
    }
    v135 = 0;
  }

  return v135;
}

+ (id)drawingForTransformedTextLines:(id)a3
{
  CHDrawing *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  id v53;
  id obj;
  uint64_t v55;
  uint64_t v56;
  uint64_t i;
  id v58;
  _OWORD v59[3];
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v53 = a3;
  v3 = objc_alloc_init(CHDrawing);
  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  obj = v53;
  v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v4, (uint64_t)&v64, (uint64_t)v69, 16, v5, v53);
  if (v56)
  {
    v55 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        if (*(_QWORD *)v65 != v55)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * i);
        v60 = 0u;
        v61 = 0u;
        v62 = 0u;
        v63 = 0u;
        objc_msgSend_textSegments(v11, v6, v7, v8, v9, v10);
        v58 = (id)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v12, (uint64_t)&v60, (uint64_t)v68, 16, v13);
        if (v19)
        {
          v20 = *(_QWORD *)v61;
          do
          {
            for (j = 0; j != v19; ++j)
            {
              if (*(_QWORD *)v61 != v20)
                objc_enumerationMutation(v58);
              v22 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * j);
              objc_msgSend_textStrokes(v22, v14, v15, v16, v17, v18);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_supportStrokes(v22, v24, v25, v26, v27, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_arrayByAddingObjectsFromArray_(v23, v30, (uint64_t)v29, v31, v32, v33);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              CoreHandwriting::getUnprocessedDrawing(v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              v41 = (void *)objc_opt_class();
              if (v22)
                objc_msgSend_transform(v22, v36, v37, v38, v39, v40);
              else
                memset(v59, 0, sizeof(v59));
              objc_msgSend_textStrokePointTransformationFromAffineTransformation_(v41, v36, (uint64_t)v59, v38, v39, v40);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v47 = (void *)objc_msgSend_newDrawingWithTransform_(v35, v43, (uint64_t)v42, v44, v45, v46);

              objc_msgSend_appendDrawing_(v3, v48, (uint64_t)v47, v49, v50, v51);
            }
            v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v14, (uint64_t)&v60, (uint64_t)v68, 16, v18);
          }
          while (v19);
        }

      }
      v56 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v64, (uint64_t)v69, 16, v10);
    }
    while (v56);
  }

  return v3;
}

+ (id)reflowableTokensFromSynthesisResult:(id)a3 shouldCancel:(id)a4
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  void *v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t i;
  void *v66;
  double v67;
  double v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  double v74;
  double v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  double v81;
  double v82;
  double v83;
  double v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  double v90;
  double v91;
  double v92;
  double v93;
  const char *v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  void *v121;
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
  uint64_t v132;
  uint64_t v133;
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
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
  uint64_t v155;
  uint64_t v156;
  unint64_t v157;
  CHReflowableSynthesisResultToken *v158;
  const char *v159;
  void *hasPrecedingSpace;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  void *v166;
  void *v167;
  id v168;
  void *v169;
  id obj;
  _OWORD v171[8];
  void *v172[2];
  void *v173[2];
  __int128 v174;
  void *v175[2];
  void *__p[2];
  __int128 v177;
  __int128 v178;
  __int128 v179;
  void *v180[3];
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  void *v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _BYTE v191[128];
  uint64_t v192;

  v192 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v168 = a4;
  v166 = v6;
  objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v7, (uint64_t)CFSTR("en_US"), v8, v9, v10);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_opt_class();
  objc_msgSend_drawing(v6, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_segmentContents(v6, v18, v19, v20, v21, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_segmentStrokeIndexes(v6, v24, v25, v26, v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_content(v6, v30, v31, v32, v33, v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_textLineForDrawing_transcriptions_strokeIndexes_fullText_locale_strokeClassification_shouldCancel_(v11, v36, (uint64_t)v17, (uint64_t)v23, (uint64_t)v29, (uint64_t)v35, v169, 1, v168);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  v167 = v37;
  if (!v37)
    goto LABEL_36;
  objc_msgSend_principalLines(v37, v38, v39, v40, v41, v42);
  v48 = v174;
  if (__p[1])
  {
    *(void **)&v177 = __p[1];
    operator delete(__p[1]);
  }
  if (v175[0])
  {
    v175[1] = v175[0];
    operator delete(v175[0]);
  }
  if (v173[1])
  {
    *(void **)&v174 = v173[1];
    operator delete(v173[1]);
  }
  v49 = v48 - (unint64_t)v173[1];
  if (v172[0])
  {
    v172[1] = v172[0];
    operator delete(v172[0]);
  }
  if (v49 == 32)
  {
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v43, v44, v45, v46, v47);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = 0u;
    v190 = 0u;
    v187 = 0u;
    v188 = 0u;
    objc_msgSend_splitIntoTokens(v167, v51, v52, v53, v54, v55);
    obj = (id)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v56, (uint64_t)&v187, (uint64_t)v191, 16, v57);
    if (v63)
    {
      v64 = *(_QWORD *)v188;
      do
      {
        for (i = 0; i != v63; ++i)
        {
          if (*(_QWORD *)v188 != v64)
            objc_enumerationMutation(obj);
          v66 = *(void **)(*((_QWORD *)&v187 + 1) + 8 * i);
          objc_msgSend_boundingBox(v66, v58, v59, v60, v61, v62);
          v68 = v67;
          objc_msgSend_boundingBox(v66, v69, v70, v71, v72, v73);
          v75 = v74;
          objc_msgSend_boundingBox(v66, v76, v77, v78, v79, v80);
          v82 = v81;
          v84 = v83;
          objc_msgSend_boundingBox(v66, v85, v86, v87, v88, v89);
          v91 = v90;
          v93 = v92;
          objc_msgSend_fixPrincipalLinesPosition_useAltString_skipAmbiguousCharacters_(a1, v94, (uint64_t)v66, 0, 1, v95);
          v178 = 0u;
          v179 = 0u;
          *(_OWORD *)__p = 0u;
          v177 = 0u;
          v174 = 0u;
          *(_OWORD *)v175 = 0u;
          *(_OWORD *)v172 = 0u;
          *(_OWORD *)v173 = 0u;
          v96 = (void *)objc_opt_class();
          if (v96)
          {
            objc_msgSend_convertToCHPrincipalLines_(v96, v97, (uint64_t)v180, v99, v100, v101);
            v103 = *(double *)v172;
            v102 = *(double *)&v172[1];
            v105 = *(double *)v173;
            v104 = *(double *)&v173[1];
            v106 = *((double *)&v174 + 1);
            v107 = *(double *)&v174;
            v109 = *(double *)v175;
            v108 = *(double *)&v175[1];
            v111 = *(double *)__p;
            v110 = *(double *)&__p[1];
            v112 = *((double *)&v177 + 1);
            v113 = *(double *)&v177;
            v114 = *((double *)&v178 + 1);
            v115 = *(double *)&v178;
            v116 = *((double *)&v179 + 1);
            v117 = *(double *)&v179;
          }
          else
          {
            v116 = 0.0;
            v117 = 0.0;
            v114 = 0.0;
            v115 = 0.0;
            v112 = 0.0;
            v113 = 0.0;
            v110 = 0.0;
            v111 = 0.0;
            v108 = 0.0;
            v109 = 0.0;
            v106 = 0.0;
            v107 = 0.0;
            v104 = 0.0;
            v105 = 0.0;
            v102 = 0.0;
            v103 = 0.0;
          }
          v118 = v84 - v82;
          if (v118 == 0.0)
            v119 = 1.0;
          else
            v119 = v118;
          if (v93 - v91 == 0.0)
            v120 = 1.0;
          else
            v120 = v93 - v91;
          *(double *)v172 = (v103 - v68) / v119;
          *(double *)&v172[1] = (v102 - v75) / v120;
          *(double *)v173 = (v105 - v68) / v119;
          *(double *)&v173[1] = (v104 - v75) / v120;
          *(double *)&v174 = (v107 - v68) / v119;
          *((double *)&v174 + 1) = (v106 - v75) / v120;
          *(double *)v175 = (v109 - v68) / v119;
          *(double *)&v175[1] = (v108 - v75) / v120;
          *(double *)__p = (v111 - v68) / v119;
          *(double *)&__p[1] = (v110 - v75) / v120;
          *(double *)&v177 = (v113 - v68) / v119;
          *((double *)&v177 + 1) = (v112 - v75) / v120;
          *(double *)&v178 = (v115 - v68) / v119;
          *((double *)&v178 + 1) = (v114 - v75) / v120;
          *(double *)&v179 = (v117 - v68) / v119;
          *((double *)&v179 + 1) = (v116 - v75) / v120;
          objc_msgSend_textStrokes(v66, v97, v98, v99, v100, v101);
          v121 = (void *)objc_claimAutoreleasedReturnValue();
          CoreHandwriting::getUnprocessedDrawing(v121);
          v122 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_string(v66, v123, v124, v125, v126, v127);
          v128 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v129, v130, v131, v132, v133);
          v134 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_stringByTrimmingCharactersInSet_(v128, v135, (uint64_t)v134, v136, v137, v138);
          v139 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend_tokens(v66, v140, v141, v142, v143, v144);
          v145 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v145, v146, v147, v148, v149, v150);
          v151 = (void *)objc_claimAutoreleasedReturnValue();
          v157 = objc_msgSend_properties(v151, v152, v153, v154, v155, v156);

          v158 = [CHReflowableSynthesisResultToken alloc];
          v171[4] = *(_OWORD *)__p;
          v171[5] = v177;
          v171[6] = v178;
          v171[7] = v179;
          v171[0] = *(_OWORD *)v172;
          v171[1] = *(_OWORD *)v173;
          v171[2] = v174;
          v171[3] = *(_OWORD *)v175;
          hasPrecedingSpace = (void *)objc_msgSend_initWithDrawing_string_principalLines_bounds_hasPrecedingSpace_(v158, v159, (uint64_t)v122, (uint64_t)v139, (uint64_t)v171, (v157 >> 5) & 1, v68, v75, v118, v93 - v91);
          objc_msgSend_addObject_(v50, v161, (uint64_t)hasPrecedingSpace, v162, v163, v164);

          if (v185)
          {
            v186 = v185;
            operator delete(v185);
          }
          if (v183)
          {
            v184 = v183;
            operator delete(v183);
          }
          if (v181)
          {
            v182 = v181;
            operator delete(v181);
          }
          if (v180[0])
          {
            v180[1] = v180[0];
            operator delete(v180[0]);
          }
        }
        v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v58, (uint64_t)&v187, (uint64_t)v191, 16, v62);
      }
      while (v63);
    }

  }
  else
  {
LABEL_36:
    v50 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v50;
}

+ (id)textLineCandidate:(id)a3 tokens:(id)a4 locale:(id)a5 strokeClassification:(int64_t)a6 string:(id)a7 points:(const void *)a8 strokePoints:(const void *)a9 alphaShape:(const void *)a10 initialOrientationEstimate:(double)a11 useAltString:(BOOL)a12 outFitScore:(double *)a13 shouldCancel:(id)a14
{
  id v20;
  CoreHandwriting *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  _BOOL8 v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
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
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  const char *v55;
  const void *v56;
  int64_t v57;
  char *v58;
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
  double v69;
  double v70;
  void *v71;
  const char *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  double v76;
  void *v77;
  const char *v78;
  void *v79;
  char v80;
  void *v81;
  void *v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  double v87;
  void *v88;
  const void *v89;
  int64_t v90;
  const char *v91;
  void *v92;
  void *v93;
  const char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  char *v100;
  void *v101;
  const char *v102;
  char *v103;
  char *v104;
  CHTransformedTextLine *v105;
  _OWORD *v106;
  __int128 v107;
  const char *v108;
  void *v109;
  void *v110;
  const char *v111;
  uint64_t v112;
  CHTransformedTextLine *v113;
  __int128 v114;
  const char *v115;
  NSObject *v116;
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  CHTransformedTextLine *v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  void *v146;
  const char *v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  void *v152;
  const char *v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  _OWORD *v159;
  __int128 v160;
  const char *v161;
  void *v162;
  uint64_t v163;
  uint64_t v164;
  void *v165;
  uint64_t v166;
  void *v167;
  void *v168;
  void *v169;
  const char *v170;
  uint64_t v171;
  CHTransformedTextLine *v172;
  __int128 v173;
  const char *v174;
  void *v175;
  NSObject *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  char v189;
  void *v190;
  id v191;
  CHTransformedTextLine *v192;
  __int128 v193;
  const char *v194;
  NSObject *v195;
  const char *v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  void *v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  double v206;
  double v207;
  id v208;
  void *v209;
  const void *v211;
  unint64_t v212;
  void *v213;
  CoreHandwriting *v214;
  id v215;
  void *v216;
  uint64_t (**v217)(void);
  id v218;
  _OWORD v219[3];
  void *v220[3];
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  _OWORD v227[3];
  void *v228[3];
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235[3];
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  char *v244;
  void *v245[3];
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  _OWORD v252[3];
  void *v253[3];
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  _OWORD v260[3];
  void *v261[3];
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  _OWORD v268[3];
  void *v269[3];
  void *v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276[3];
  void *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  void *v283[2];
  void *__src[2];
  int v285[4];
  void *v286[2];
  __int128 v287;
  int v288[4];
  void *v289;
  int v290[2];
  void *__p[2];
  void *v292[2];
  __int128 v293;
  void *v294[2];
  void *v295[2];
  __int128 v296;
  void *v297[2];
  uint64_t v298;
  uint8_t v299[4];
  uint64_t v300;
  __int16 v301;
  uint64_t v302;
  uint8_t v303[32];
  int v304[4];
  void *v305[2];
  void *v306[2];
  int v307[4];
  uint8_t buf[32];
  __int128 v309;
  __int128 v310;
  __int128 v311;
  __int128 v312;
  char *v313;
  char *v314;
  uint64_t v315;

  v315 = *MEMORY[0x1E0C80C00];
  v215 = a3;
  v20 = a4;
  v218 = a5;
  v21 = (CoreHandwriting *)a7;
  v216 = v20;
  v217 = (uint64_t (**)(void))a14;
  v214 = v21;
  v212 = objc_msgSend_count(v20, v22, v23, v24, v25, v26);
  v211 = a8;
  if (a11 == 1.79769313e308)
  {
    v298 = 0;
    *(_OWORD *)v297 = 0u;
    v296 = 0u;
    *(_OWORD *)v295 = 0u;
    *(_OWORD *)v294 = 0u;
    v293 = 0u;
    v213 = &unk_1E7827F80;
    *(_OWORD *)v292 = 0u;
    *(_OWORD *)__p = 0u;
    v28 = a12;
    goto LABEL_10;
  }
  v27 = (void *)objc_opt_class();
  v28 = a12;
  objc_msgSend_checkAvailableInterceptsForString_skipAmbiguousCharacters_(v27, v29, (uint64_t)v21, v212 > 4, v30, v31);
  v32 = (id)objc_claimAutoreleasedReturnValue();

  v298 = 0;
  *(_OWORD *)v297 = 0u;
  v296 = 0u;
  *(_OWORD *)v295 = 0u;
  *(_OWORD *)v294 = 0u;
  v293 = 0u;
  *(_OWORD *)v292 = 0u;
  *(_OWORD *)__p = 0u;
  v213 = v32;
  objc_msgSend_objectAtIndexedSubscript_(v32, v33, 1, v34, v35, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend_unsignedIntegerValue(v37, v38, v39, v40, v41, v42))
  {

    goto LABEL_9;
  }
  objc_msgSend_objectAtIndexedSubscript_(v213, v43, 2, v44, v45, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend_unsignedIntegerValue(v47, v48, v49, v50, v51, v52);

  if (!v53)
  {
LABEL_9:
    v21 = v214;
LABEL_10:
    CoreHandwriting::getPointsAndPrincipalLinesForText(v21, (NSString *)0x64, (uint64_t)v283);
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    *(_OWORD *)__p = *(_OWORD *)v283;
    v292[0] = __src[0];
    __src[0] = 0;
    v283[1] = 0;
    v283[0] = 0;
    sub_1BE6F5A88(&v292[1], (char *)__src[1], *(char **)v285, (uint64_t)(*(_QWORD *)v285 - (unint64_t)__src[1]) >> 4);
    sub_1BE6F5A88(v294, (char *)v286[0], (char *)v286[1], ((char *)v286[1] - (char *)v286[0]) >> 4);
    sub_1BE6F5A88(&v295[1], *((char **)&v287 + 1), *(char **)v288, (uint64_t)(*(_QWORD *)v288 - *((_QWORD *)&v287 + 1)) >> 4);
    sub_1BE6F5A88(v297, (char *)v289, *(char **)v290, (uint64_t)(*(_QWORD *)v290 - (_QWORD)v289) >> 4);
    if (v289)
    {
      *(_QWORD *)v290 = v289;
      operator delete(v289);
    }
    if (*((_QWORD *)&v287 + 1))
    {
      *(_QWORD *)v288 = *((_QWORD *)&v287 + 1);
      operator delete(*((void **)&v287 + 1));
    }
    if (v286[0])
    {
      v286[1] = v286[0];
      operator delete(v286[0]);
    }
    if (__src[1])
    {
      *(void **)v285 = __src[1];
      operator delete(__src[1]);
    }
    if (v283[0])
    {
      v283[1] = v283[0];
      operator delete(v283[0]);
    }
    v283[1] = 0;
    v283[0] = 0;
    __src[0] = 0;
    v56 = __p[0];
    v57 = (char *)__p[1] - (char *)__p[0];
    if (__p[1] != __p[0])
    {
      if (v57 < 0)
        sub_1BE61F930();
      v283[0] = operator new((char *)__p[1] - (char *)__p[0]);
      v283[1] = v283[0];
      v58 = (char *)v283[0] + 16 * (v57 >> 4);
      __src[0] = v58;
      memcpy(v283[0], v56, v57);
      v283[1] = v58;
    }
    sub_1BE76136C(&__src[1], (uint64_t)&v292[1]);
    v59 = (void *)objc_opt_class();
    if (objc_msgSend_shouldDeformAscendersDescenders_(v59, v60, (uint64_t)v218, v61, v62, v63))
    {
      v64 = (void *)objc_opt_class();
      objc_msgSend_blindAscenderDeformValue_(v64, v65, (uint64_t)v218, v66, v67, v68);
      v70 = v69;
      v71 = (void *)objc_opt_class();
      objc_msgSend_blindDescenderDeformValue_(v71, v72, (uint64_t)v218, v73, v74, v75);
      CoreHandwriting::deformImagePointsAndLines((CoreHandwriting *)v283, 1.0, v70, v76, (uint64_t)buf);
      if (v283[0])
      {
        v283[1] = v283[0];
        operator delete(v283[0]);
      }
      *(_OWORD *)v283 = *(_OWORD *)buf;
      __src[0] = *(void **)&buf[16];
      memset(buf, 0, 24);
      sub_1BE6F5A88(&__src[1], *(char **)&buf[24], (char *)v309, (uint64_t)(v309 - *(_QWORD *)&buf[24]) >> 4);
      sub_1BE6F5A88(v286, (char *)v310, *((char **)&v310 + 1), (uint64_t)(*((_QWORD *)&v310 + 1) - v310) >> 4);
      sub_1BE6F5A88((_QWORD *)&v287 + 1, *((char **)&v311 + 1), (char *)v312, (uint64_t)(v312 - *((_QWORD *)&v311 + 1)) >> 4);
      sub_1BE6F5A88(&v289, v313, v314, (v314 - v313) >> 4);
      if (v313)
      {
        v314 = v313;
        operator delete(v313);
      }
      if (*((_QWORD *)&v311 + 1))
      {
        *(_QWORD *)&v312 = *((_QWORD *)&v311 + 1);
        operator delete(*((void **)&v311 + 1));
      }
      if ((_QWORD)v310)
      {
        *((_QWORD *)&v310 + 1) = v310;
        operator delete((void *)v310);
      }
      if (*(_QWORD *)&buf[24])
      {
        *(_QWORD *)&v309 = *(_QWORD *)&buf[24];
        operator delete(*(void **)&buf[24]);
      }
      if (*(_QWORD *)buf)
      {
        *(_QWORD *)&buf[8] = *(_QWORD *)buf;
        operator delete(*(void **)buf);
      }
    }
    v77 = (void *)objc_opt_class();
    if (v77)
    {
      objc_msgSend_principalLinesForPoints_writtenAlphaShape_imgPointsAndPrincipalLines_shouldCancel_(v77, v78, (uint64_t)a8, (uint64_t)a10, (uint64_t)v283, (uint64_t)v217);
      if ((_QWORD)v309 - *(_QWORD *)&buf[24] == 32 && (!v217 || (v217[2]() & 1) == 0))
      {
        v101 = (void *)objc_opt_class();
        sub_1BE76136C(v276, (uint64_t)buf);
        if (v101)
        {
          objc_msgSend_flipPrincipalLine_points_string_outWasFlipped_(v101, v102, (uint64_t)v276, (uint64_t)a8, (uint64_t)v214, 0);
          v103 = *(char **)v303;
          v104 = *(char **)&v303[8];
        }
        else
        {
          v104 = 0;
          v103 = 0;
          *(_OWORD *)v307 = 0u;
          *(_OWORD *)v306 = 0u;
          *(_OWORD *)v305 = 0u;
          *(_OWORD *)v304 = 0u;
          memset(v303, 0, sizeof(v303));
        }
        sub_1BE6F5A88(buf, v103, v104, (v104 - v103) >> 4);
        sub_1BE6F5A88(&buf[24], *(char **)&v303[24], *(char **)v304, (uint64_t)(*(_QWORD *)v304 - *(_QWORD *)&v303[24]) >> 4);
        sub_1BE6F5A88(&v310, (char *)v305[0], (char *)v305[1], ((char *)v305[1] - (char *)v305[0]) >> 4);
        sub_1BE6F5A88((_QWORD *)&v311 + 1, (char *)v306[1], *(char **)v307, (uint64_t)(*(_QWORD *)v307 - (unint64_t)v306[1]) >> 4);
        if (v306[1])
        {
          *(void **)v307 = v306[1];
          operator delete(v306[1]);
        }
        if (v305[0])
        {
          v305[1] = v305[0];
          operator delete(v305[0]);
        }
        if (*(_QWORD *)&v303[24])
        {
          *(_QWORD *)v304 = *(_QWORD *)&v303[24];
          operator delete(*(void **)&v303[24]);
        }
        if (*(_QWORD *)v303)
        {
          *(_QWORD *)&v303[8] = *(_QWORD *)v303;
          operator delete(*(void **)v303);
        }
        if (v281)
        {
          v282 = v281;
          operator delete(v281);
        }
        if (v279)
        {
          v280 = v279;
          operator delete(v279);
        }
        if (v277)
        {
          v278 = v277;
          operator delete(v277);
        }
        if (v276[0])
        {
          v276[1] = v276[0];
          operator delete(v276[0]);
        }
        v105 = [CHTransformedTextLine alloc];
        sub_1BE76136C(v269, (uint64_t)buf);
        v106 = (_OWORD *)MEMORY[0x1E0C9BAA8];
        v107 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v268[0] = *MEMORY[0x1E0C9BAA8];
        v268[1] = v107;
        v268[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v109 = (void *)objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v105, v108, (uint64_t)v215, (uint64_t)v216, (uint64_t)a8, (uint64_t)a9, v218, a6, v269, v268);
        if (v274)
        {
          v275 = v274;
          operator delete(v274);
        }
        if (v272)
        {
          v273 = v272;
          operator delete(v272);
        }
        if (v270)
        {
          v271 = v270;
          operator delete(v270);
        }
        if (v269[0])
        {
          v269[1] = v269[0];
          operator delete(v269[0]);
        }
        v110 = (void *)objc_opt_class();
        if (v110)
        {
          objc_msgSend_fixPrincipalLinesOrientation_useAltString_skipAmbiguousCharacters_(v110, v111, (uint64_t)v109, v28, v212 > 4, v112);
        }
        else
        {
          *(_OWORD *)v307 = 0u;
          *(_OWORD *)v306 = 0u;
          *(_OWORD *)v305 = 0u;
          *(_OWORD *)v304 = 0u;
          memset(v303, 0, sizeof(v303));
        }
        v113 = [CHTransformedTextLine alloc];
        sub_1BE76136C(v261, (uint64_t)v303);
        v114 = v106[1];
        v260[0] = *v106;
        v260[1] = v114;
        v260[2] = v106[2];
        v79 = (void *)objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v113, v115, (uint64_t)v215, (uint64_t)v216, (uint64_t)a8, (uint64_t)a9, v218, a6, v261, v260);

        if (v266)
        {
          v267 = v266;
          operator delete(v266);
        }
        if (v264)
        {
          v265 = v264;
          operator delete(v264);
        }
        if (v262)
        {
          v263 = v262;
          operator delete(v262);
        }
        if (v261[0])
        {
          v261[1] = v261[0];
          operator delete(v261[0]);
        }
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v116 = (id)qword_1EF568E68;
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEBUG))
        {
          v127 = objc_msgSend_length(v214, v117, v118, v119, v120, v121);
          if (v79)
            objc_msgSend_orientation(v79, v122, v123, v124, v125, v126);
          else
            v128 = 0x7FEFFFFFFFFFFFFFLL;
          *(_DWORD *)v299 = 134218240;
          v300 = v127;
          v301 = 2048;
          v302 = v128;
          _os_log_impl(&dword_1BE607000, v116, OS_LOG_TYPE_DEBUG, "Created initial transformed text line of length %lu and orientation %4.2f using alpha shape matching.", v299, 0x16u);
        }

        if (v306[1])
        {
          *(void **)v307 = v306[1];
          operator delete(v306[1]);
        }
        if (v305[0])
        {
          v305[1] = v305[0];
          operator delete(v305[0]);
        }
        if (*(_QWORD *)&v303[24])
        {
          *(_QWORD *)v304 = *(_QWORD *)&v303[24];
          operator delete(*(void **)&v303[24]);
        }
        if (*(_QWORD *)v303)
        {
          *(_QWORD *)&v303[8] = *(_QWORD *)v303;
          operator delete(*(void **)v303);
        }
        v80 = 1;
        v81 = (void *)*((_QWORD *)&v311 + 1);
        if (!*((_QWORD *)&v311 + 1))
        {
LABEL_46:
          if ((_QWORD)v310)
          {
            *((_QWORD *)&v310 + 1) = v310;
            operator delete((void *)v310);
          }
          if (*(_QWORD *)&buf[24])
          {
            *(_QWORD *)&v309 = *(_QWORD *)&buf[24];
            operator delete(*(void **)&buf[24]);
          }
          if (*(_QWORD *)buf)
          {
            *(_QWORD *)&buf[8] = *(_QWORD *)buf;
            operator delete(*(void **)buf);
          }
          if (v289)
          {
            *(_QWORD *)v290 = v289;
            operator delete(v289);
          }
          if (*((_QWORD *)&v287 + 1))
          {
            *(_QWORD *)v288 = *((_QWORD *)&v287 + 1);
            operator delete(*((void **)&v287 + 1));
          }
          if (v286[0])
          {
            v286[1] = v286[0];
            operator delete(v286[0]);
          }
          if (__src[1])
          {
            *(void **)v285 = __src[1];
            operator delete(__src[1]);
          }
          if (v283[0])
          {
            v283[1] = v283[0];
            operator delete(v283[0]);
          }
          if ((v80 & 1) == 0)
            goto LABEL_195;
          goto LABEL_63;
        }
LABEL_45:
        *(_QWORD *)&v312 = v81;
        operator delete(v81);
        goto LABEL_46;
      }
    }
    else
    {
      v311 = 0u;
      v312 = 0u;
      v309 = 0u;
      v310 = 0u;
      memset(buf, 0, sizeof(buf));
    }
    v79 = 0;
    v80 = 0;
    v81 = (void *)*((_QWORD *)&v311 + 1);
    if (!*((_QWORD *)&v311 + 1))
      goto LABEL_46;
    goto LABEL_45;
  }
  v54 = (void *)objc_opt_class();
  if (!v54)
  {
    *(_OWORD *)v288 = 0u;
    v287 = 0u;
    *(_OWORD *)v286 = 0u;
    *(_OWORD *)v285 = 0u;
    *(_OWORD *)__src = 0u;
    *(_OWORD *)v283 = 0u;
    goto LABEL_186;
  }
  objc_msgSend_principalLinesFromTokens_strokes_strokePoints_orientation_useAltString_(v54, v55, (uint64_t)v20, (uint64_t)v215, (uint64_t)a9, a12, a11);
  if (*(_QWORD *)v285 - (unint64_t)__src[1] != 32
    || v217 && (((uint64_t (*)(double))v217[2])(*(double *)__src[1]) & 1) != 0)
  {
LABEL_186:
    v79 = 0;
    v189 = 0;
    v190 = (void *)*((_QWORD *)&v287 + 1);
    if (!*((_QWORD *)&v287 + 1))
      goto LABEL_188;
    goto LABEL_187;
  }
  v192 = [CHTransformedTextLine alloc];
  sub_1BE76136C(v253, (uint64_t)v283);
  v193 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v252[0] = *MEMORY[0x1E0C9BAA8];
  v252[1] = v193;
  v252[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v79 = (void *)objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v192, v194, (uint64_t)v215, (uint64_t)v20, (uint64_t)a8, (uint64_t)a9, v218, a6, v253, v252);
  if (v258)
  {
    v259 = v258;
    operator delete(v258);
  }
  if (v256)
  {
    v257 = v256;
    operator delete(v256);
  }
  if (v254)
  {
    v255 = v254;
    operator delete(v254);
  }
  if (v253[0])
  {
    v253[1] = v253[0];
    operator delete(v253[0]);
  }
  if (qword_1EF568E88 != -1)
    dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
  v195 = (id)qword_1EF568E68;
  if (os_log_type_enabled(v195, OS_LOG_TYPE_DEBUG))
  {
    v201 = objc_msgSend_length(v214, v196, v197, v198, v199, v200);
    *(_DWORD *)buf = 134218240;
    *(_QWORD *)&buf[4] = v201;
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = a11;
    _os_log_impl(&dword_1BE607000, v195, OS_LOG_TYPE_DEBUG, "Created initial transformed text line of length %lu and orientation %4.2f using initial orientation estimate.", buf, 0x16u);
  }

  v189 = 1;
  v190 = (void *)*((_QWORD *)&v287 + 1);
  if (*((_QWORD *)&v287 + 1))
  {
LABEL_187:
    *(_QWORD *)v288 = v190;
    operator delete(v190);
  }
LABEL_188:
  if (v286[0])
  {
    v286[1] = v286[0];
    operator delete(v286[0]);
  }
  if (__src[1])
  {
    *(void **)v285 = __src[1];
    operator delete(__src[1]);
  }
  if (v283[0])
  {
    v283[1] = v283[0];
    operator delete(v283[0]);
  }
  if ((v189 & 1) == 0)
  {
LABEL_195:
    v191 = 0;
    goto LABEL_246;
  }
LABEL_63:
  v82 = (void *)objc_opt_class();
  objc_msgSend_textLineFitScore_useAltString_(v82, v83, (uint64_t)v79, v28, v84, v85);
  v87 = v86;
  v88 = (void *)objc_opt_class();
  v242 = 0;
  v243 = 0;
  v244 = 0;
  v89 = __p[0];
  v90 = (char *)__p[1] - (char *)__p[0];
  if (__p[1] != __p[0])
  {
    if (v90 < 0)
      sub_1BE61F930();
    v242 = operator new((char *)__p[1] - (char *)__p[0]);
    v244 = (char *)v242 + 16 * (v90 >> 4);
    memcpy(v242, v89, v90);
    v243 = v244;
  }
  sub_1BE76136C(v245, (uint64_t)&v292[1]);
  if (v88)
  {
    objc_msgSend_refinedPrincipalLinesForTextLine_points_alphaShape_renderedTextPointsAndLines_useAltString_shouldCancel_(v88, v91, (uint64_t)v79, (uint64_t)v211, (uint64_t)a10, (uint64_t)&v242, v28, v217);
    v92 = v250;
    if (!v250)
      goto LABEL_69;
    goto LABEL_68;
  }
  *(_OWORD *)v288 = 0u;
  v287 = 0u;
  *(_OWORD *)v286 = 0u;
  *(_OWORD *)v285 = 0u;
  *(_OWORD *)__src = 0u;
  *(_OWORD *)v283 = 0u;
  v92 = v250;
  if (v250)
  {
LABEL_68:
    v251 = v92;
    operator delete(v92);
  }
LABEL_69:
  if (v248)
  {
    v249 = v248;
    operator delete(v248);
  }
  if (v246)
  {
    v247 = v246;
    operator delete(v246);
  }
  if (v245[0])
  {
    v245[1] = v245[0];
    operator delete(v245[0]);
  }
  if (v242)
  {
    v243 = v242;
    operator delete(v242);
  }
  if (*(_QWORD *)v285 - (unint64_t)__src[1] == 32)
  {
    v93 = (void *)objc_opt_class();
    sub_1BE76136C(v235, (uint64_t)v283);
    if (v79)
    {
      objc_msgSend_points(v79, v94, v95, v96, v97, v98);
      if (v93)
      {
LABEL_80:
        objc_msgSend_flipPrincipalLine_points_string_outWasFlipped_(v93, v94, (uint64_t)v235, (uint64_t)v303, (uint64_t)v214, 0);
        v99 = *(char **)buf;
        v100 = *(char **)&buf[8];
LABEL_128:
        sub_1BE6F5A88(v283, v99, v100, (v100 - v99) >> 4);
        sub_1BE6F5A88(&__src[1], *(char **)&buf[24], (char *)v309, (uint64_t)(v309 - *(_QWORD *)&buf[24]) >> 4);
        sub_1BE6F5A88(v286, (char *)v310, *((char **)&v310 + 1), (uint64_t)(*((_QWORD *)&v310 + 1) - v310) >> 4);
        sub_1BE6F5A88((_QWORD *)&v287 + 1, *((char **)&v311 + 1), (char *)v312, (uint64_t)(v312 - *((_QWORD *)&v311 + 1)) >> 4);
        if (*((_QWORD *)&v311 + 1))
        {
          *(_QWORD *)&v312 = *((_QWORD *)&v311 + 1);
          operator delete(*((void **)&v311 + 1));
        }
        if ((_QWORD)v310)
        {
          *((_QWORD *)&v310 + 1) = v310;
          operator delete((void *)v310);
        }
        if (*(_QWORD *)&buf[24])
        {
          *(_QWORD *)&v309 = *(_QWORD *)&buf[24];
          operator delete(*(void **)&buf[24]);
        }
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }
        if (*(_QWORD *)v303)
        {
          *(_QWORD *)&v303[8] = *(_QWORD *)v303;
          operator delete(*(void **)v303);
        }
        if (v240)
        {
          v241 = v240;
          operator delete(v240);
        }
        if (v238)
        {
          v239 = v238;
          operator delete(v238);
        }
        if (v236)
        {
          v237 = v236;
          operator delete(v236);
        }
        if (v235[0])
        {
          v235[1] = v235[0];
          operator delete(v235[0]);
        }
        v129 = [CHTransformedTextLine alloc];
        objc_msgSend_textStrokes(v79, v130, v131, v132, v133, v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_tokens(v79, v136, v137, v138, v139, v140);
        v146 = (void *)objc_claimAutoreleasedReturnValue();
        if (v79)
        {
          objc_msgSend_points(v79, v141, v142, v143, v144, v145);
          objc_msgSend_strokePoints(v79, v147, v148, v149, v150, v151);
        }
        else
        {
          memset(buf, 0, 24);
          memset(v303, 0, 24);
        }
        objc_msgSend_locale(v79, v141, v142, v143, v144, v145);
        v152 = (void *)objc_claimAutoreleasedReturnValue();
        v158 = objc_msgSend_strokeClassification(v79, v153, v154, v155, v156, v157);
        sub_1BE76136C(v228, (uint64_t)v283);
        v159 = (_OWORD *)MEMORY[0x1E0C9BAA8];
        v160 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
        v227[0] = *MEMORY[0x1E0C9BAA8];
        v227[1] = v160;
        v227[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
        v162 = (void *)objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v129, v161, (uint64_t)v135, (uint64_t)v146, (uint64_t)buf, (uint64_t)v303, v152, v158, v228, v227);
        if (v233)
        {
          v234 = v233;
          operator delete(v233);
        }
        if (v231)
        {
          v232 = v231;
          operator delete(v231);
        }
        if (v229)
        {
          v230 = v229;
          operator delete(v229);
        }
        if (v228[0])
        {
          v228[1] = v228[0];
          operator delete(v228[0]);
        }

        v163 = *(_QWORD *)v303;
        if (*(_QWORD *)v303)
        {
          v164 = *(_QWORD *)&v303[8];
          v165 = *(void **)v303;
          if (*(_QWORD *)&v303[8] != *(_QWORD *)v303)
          {
            v166 = *(_QWORD *)&v303[8];
            do
            {
              v168 = *(void **)(v166 - 24);
              v166 -= 24;
              v167 = v168;
              if (v168)
              {
                *(_QWORD *)(v164 - 16) = v167;
                operator delete(v167);
              }
              v164 = v166;
            }
            while (v166 != v163);
            v165 = *(void **)v303;
          }
          *(_QWORD *)&v303[8] = v163;
          operator delete(v165);
        }
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }

        v169 = (void *)objc_opt_class();
        if (v169)
        {
          objc_msgSend_fixPrincipalLinesOrientation_useAltString_skipAmbiguousCharacters_(v169, v170, (uint64_t)v162, a12, v212 > 4, v171);
        }
        else
        {
          v311 = 0u;
          v312 = 0u;
          v309 = 0u;
          v310 = 0u;
          memset(buf, 0, sizeof(buf));
        }
        v172 = [CHTransformedTextLine alloc];
        sub_1BE76136C(v220, (uint64_t)buf);
        v173 = v159[1];
        v219[0] = *v159;
        v219[1] = v173;
        v219[2] = v159[2];
        v175 = (void *)objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v172, v174, (uint64_t)v215, (uint64_t)v216, (uint64_t)v211, (uint64_t)a9, v218, a6, v220, v219);

        if (v225)
        {
          v226 = v225;
          operator delete(v225);
        }
        if (v223)
        {
          v224 = v223;
          operator delete(v223);
        }
        if (v221)
        {
          v222 = v221;
          operator delete(v221);
        }
        if (v220[0])
        {
          v220[1] = v220[0];
          operator delete(v220[0]);
        }
        if (qword_1EF568E88 != -1)
          dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
        v176 = (id)qword_1EF568E68;
        if (os_log_type_enabled(v176, OS_LOG_TYPE_DEBUG))
        {
          v187 = objc_msgSend_length(v214, v177, v178, v179, v180, v181);
          if (v79)
            objc_msgSend_orientation(v79, v182, v183, v184, v185, v186);
          else
            v188 = 0x7FEFFFFFFFFFFFFFLL;
          *(_DWORD *)v303 = 134218240;
          *(_QWORD *)&v303[4] = v187;
          *(_WORD *)&v303[12] = 2048;
          *(_QWORD *)&v303[14] = v188;
          _os_log_impl(&dword_1BE607000, v176, OS_LOG_TYPE_DEBUG, "Created refined transformed text line of length %lu and orientation %4.2f.", v303, 0x16u);
        }

        v202 = (void *)objc_opt_class();
        objc_msgSend_textLineFitScore_useAltString_(v202, v203, (uint64_t)v175, a12, v204, v205);
        v207 = v206;
        if (v206 < v87)
        {
          v208 = v175;

          v79 = v208;
          v87 = v207;
        }
        if (*((_QWORD *)&v311 + 1))
        {
          *(_QWORD *)&v312 = *((_QWORD *)&v311 + 1);
          operator delete(*((void **)&v311 + 1));
        }
        if ((_QWORD)v310)
        {
          *((_QWORD *)&v310 + 1) = v310;
          operator delete((void *)v310);
        }
        if (*(_QWORD *)&buf[24])
        {
          *(_QWORD *)&v309 = *(_QWORD *)&buf[24];
          operator delete(*(void **)&buf[24]);
        }
        if (*(_QWORD *)buf)
        {
          *(_QWORD *)&buf[8] = *(_QWORD *)buf;
          operator delete(*(void **)buf);
        }

        goto LABEL_235;
      }
    }
    else
    {
      memset(v303, 0, 24);
      if (v93)
        goto LABEL_80;
    }
    v100 = 0;
    v99 = 0;
    v311 = 0u;
    v312 = 0u;
    v309 = 0u;
    v310 = 0u;
    memset(buf, 0, sizeof(buf));
    goto LABEL_128;
  }
LABEL_235:
  if (v79 && (!v217 || (v217[2]() & 1) == 0))
  {
    if (a13)
      *a13 = v87;
    v191 = v79;
    v209 = (void *)*((_QWORD *)&v287 + 1);
    if (!*((_QWORD *)&v287 + 1))
      goto LABEL_240;
    goto LABEL_239;
  }
  v191 = 0;
  v209 = (void *)*((_QWORD *)&v287 + 1);
  if (*((_QWORD *)&v287 + 1))
  {
LABEL_239:
    *(_QWORD *)v288 = v209;
    operator delete(v209);
  }
LABEL_240:
  if (v286[0])
  {
    v286[1] = v286[0];
    operator delete(v286[0]);
  }
  if (__src[1])
  {
    *(void **)v285 = __src[1];
    operator delete(__src[1]);
  }
  if (v283[0])
  {
    v283[1] = v283[0];
    operator delete(v283[0]);
  }
LABEL_246:
  if (v297[0])
  {
    v297[1] = v297[0];
    operator delete(v297[0]);
  }
  if (v295[1])
  {
    *(void **)&v296 = v295[1];
    operator delete(v295[1]);
  }
  if (v294[0])
  {
    v294[1] = v294[0];
    operator delete(v294[0]);
  }
  if (v292[1])
  {
    *(void **)&v293 = v292[1];
    operator delete(v292[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  return v191;
}

+ (PrincipalLines)refinedPrincipalLinesForTextLine:(SEL)a3 points:(id)a4 alphaShape:(const void *)a5 renderedTextPointsAndLines:(const void *)a6 useAltString:(PointsAndPrincipalLines *)a7 shouldCancel:(BOOL)a8
{
  id v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  const char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  const char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  long double v48;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  int64_t v55;
  uint64_t v56;
  double *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  id v62;
  const char *v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  double v71;
  uint64_t v72;
  uint64_t i;
  float v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  void *v79;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  const char *v84;
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
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  unint64_t v103;
  uint64_t j;
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
  void *v116;
  void *v117;
  const char *v118;
  uint64_t v119;
  uint64_t v120;
  void *v121;
  const char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  const char *v142;
  uint64_t v143;
  void *v144;
  const char *v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  void *v154;
  const char *v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  CGPoint *begin;
  void *v160;
  const char *v161;
  char *v162;
  PrincipalLines *result;
  const void *v164;
  const void *v165;
  void *v167;
  id v168;
  void *v169;
  CoreHandwriting *v171;
  void *v172;
  id obj;
  uint64_t v174;
  _BOOL4 v175;
  CoreHandwriting *v176;
  void *v177;
  void *v178[2];
  CGPoint *v179;
  void *v180;
  char *v181;
  void *v182;
  char *v183;
  void *v184;
  char *v185;
  void *__p;
  char *v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  __int128 v191;
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  double v196;
  double v197;
  double v198;
  _BYTE v199[128];
  _BYTE v200[128];
  uint64_t v201;

  v175 = a8;
  v164 = a5;
  v165 = a6;
  v201 = *MEMORY[0x1E0C80C00];
  v10 = a4;
  v168 = a9;
  v172 = v10;
  v11 = (void *)objc_opt_class();
  objc_msgSend_string(v10, v12, v13, v14, v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForRendering_useAltChars_(v11, v18, (uint64_t)v17, v175, v19, v20);
  v167 = (void *)objc_claimAutoreleasedReturnValue();

  v197 = 0.0;
  v198 = 0.0;
  v196 = 0.0;
  v21 = (void *)objc_opt_class();
  objc_msgSend_getDeformValuesForTextLine_useAltString_outfullDeform_outAscenderDeform_outDescenderDeform_(v21, v22, (uint64_t)v172, v175, (uint64_t)&v198, (uint64_t)&v197, &v196);
  objc_msgSend_tokenDistanceSizes_(v172, v23, 0, v24, v25, v26);
  v169 = (void *)objc_claimAutoreleasedReturnValue();
  v171 = v167;
  v176 = v171;
  if (!objc_msgSend_count(v169, v27, v28, v29, v30, v31))
    goto LABEL_37;
  v36 = (void *)objc_opt_class();
  objc_msgSend_estimatedRenderedTextSize_fullDeformValue_ascenderDeformValue_descenderDeformValue_(v36, v37, (uint64_t)v171, v38, v39, v40, v198, v197, v196);
  v42 = v41;
  objc_msgSend_orientation(v172, v43, v44, v45, v46, v47);
  v54 = tan(v48);
  if (!v172)
    goto LABEL_16;
  objc_msgSend_points(v172, v49, v50, v51, v52, v53);
  v55 = (char *)v178[1] - (char *)v178[0];
  if (v178[1] != v178[0])
  {
    v56 = v55 >> 4;
    if ((unint64_t)(v55 >> 4) <= 1)
      v56 = 1;
    v57 = (double *)((char *)v178[0] + 8);
    v58 = 1.79769313e308;
    v59 = -1.79769313e308;
    do
    {
      v60 = *v57 + *(v57 - 1) * v54;
      if (v60 <= v58)
        v58 = *v57 + *(v57 - 1) * v54;
      if (v60 >= v59)
        v59 = *v57 + *(v57 - 1) * v54;
      v57 += 2;
      --v56;
    }
    while (v56);
    goto LABEL_15;
  }
  if (!v178[1])
  {
LABEL_16:
    v61 = -INFINITY;
    goto LABEL_17;
  }
  v58 = 1.79769313e308;
  v59 = -1.79769313e308;
LABEL_15:
  v178[1] = v178[0];
  operator delete(v178[0]);
  v61 = v59 - v58;
LABEL_17:
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v49, v50, v51, v52, v53, v164, v165);
  v177 = (void *)objc_claimAutoreleasedReturnValue();
  v194 = 0u;
  v195 = 0u;
  v192 = 0u;
  v193 = 0u;
  v62 = v169;
  v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v63, (uint64_t)&v192, (uint64_t)v200, 16, v64);
  if (v70)
  {
    v71 = fabs(v61) / sqrt(v54 * v54 + 1.0) + 1.0e-10;
    v72 = *(_QWORD *)v193;
    do
    {
      for (i = 0; i != v70; ++i)
      {
        if (*(_QWORD *)v193 != v72)
          objc_enumerationMutation(v62);
        objc_msgSend_floatValue(*(void **)(*((_QWORD *)&v192 + 1) + 8 * i), v65, v66, v67, v68, v69);
        objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v75, (unint64_t)fmax(fmin(round(v42 * (v74 / v71) / 10.0), 24.0), 0.0), v76, v77, v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v177, v80, (uint64_t)v79, v81, v82, v83);

      }
      v70 = objc_msgSend_countByEnumeratingWithState_objects_count_(v62, v65, (uint64_t)&v192, (uint64_t)v200, 16, v69);
    }
    while (v70);
  }

  objc_msgSend_string(MEMORY[0x1E0CB37A0], v84, v85, v86, v87, v88);
  v176 = (CoreHandwriting *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_splitIntoTokens(v172, v89, v90, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v190 = 0u;
  v191 = 0u;
  v188 = 0u;
  v189 = 0u;
  obj = v94;
  v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v95, (uint64_t)&v188, (uint64_t)v199, 16, v96);
  if (v102)
  {
    v103 = 0;
    v174 = *(_QWORD *)v189;
    do
    {
      for (j = 0; j != v102; ++j)
      {
        if (*(_QWORD *)v189 != v174)
          objc_enumerationMutation(obj);
        objc_msgSend_string(*(void **)(*((_QWORD *)&v188 + 1) + 8 * j), v97, v98, v99, v100, v101);
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_whitespaceCharacterSet(MEMORY[0x1E0CB3500], v106, v107, v108, v109, v110);
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringByTrimmingCharactersInSet_(v105, v112, (uint64_t)v111, v113, v114, v115);
        v116 = (void *)objc_claimAutoreleasedReturnValue();

        v117 = (void *)objc_opt_class();
        objc_msgSend_stringForRendering_useAltChars_(v117, v118, (uint64_t)v116, v175, v119, v120);
        v121 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_appendString_(v176, v122, (uint64_t)v121, v123, v124, v125);
        if (v103 < objc_msgSend_count(v177, v126, v127, v128, v129, v130))
        {
          objc_msgSend_objectAtIndexedSubscript_(v177, v131, v103, v132, v133, v134);
          v135 = (void *)objc_claimAutoreleasedReturnValue();
          v141 = objc_msgSend_unsignedIntegerValue(v135, v136, v137, v138, v139, v140);

          objc_msgSend_stringByPaddingToLength_withString_startingAtIndex_(&stru_1E77F6F28, v142, v141, (uint64_t)CFSTR(" "), 0, v143);
          v144 = (void *)objc_claimAutoreleasedReturnValue();
          v150 = objc_msgSend_rangeOfString_(v144, v145, (uint64_t)CFSTR("    "), v146, v147, v148);
          while (v150 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend_stringByReplacingCharactersInRange_withString_(v144, v149, v150, (uint64_t)v149, (uint64_t)CFSTR(" : "), v153);
            v154 = (void *)objc_claimAutoreleasedReturnValue();

            v150 = objc_msgSend_rangeOfString_(v154, v155, (uint64_t)CFSTR("    "), v156, v157, v158);
            v144 = v154;
          }
          objc_msgSend_appendString_(v176, v149, (uint64_t)v144, v151, v152, v153);

        }
        ++v103;
      }
      v102 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v97, (uint64_t)&v188, (uint64_t)v199, 16, v101);
    }
    while (v102);
  }

LABEL_37:
  if (a7->var0.__end_ == a7->var0.__begin_
    || (objc_msgSend_isEqualToString_(v176, v32, (uint64_t)v171, v33, v34, v35) & 1) == 0)
  {
    CoreHandwriting::getPointsAndPrincipalLinesForText(v176, (NSString *)0x64, (uint64_t)v178);
    begin = a7->var0.__begin_;
    if (a7->var0.__begin_)
    {
      a7->var0.__end_ = begin;
      operator delete(begin);
      a7->var0.__begin_ = 0;
      a7->var0.__end_ = 0;
      a7->var0.__end_cap_.__value_ = 0;
    }
    *(_OWORD *)&a7->var0.__begin_ = *(_OWORD *)v178;
    a7->var0.__end_cap_.__value_ = v179;
    v178[1] = 0;
    v179 = 0;
    v178[0] = 0;
    if (v178 != (void **)a7)
    {
      sub_1BE6F5A88(&a7->var1.descender.__begin_, (char *)v180, v181, (v181 - (_BYTE *)v180) >> 4);
      sub_1BE6F5A88(&a7->var1.base.__begin_, (char *)v182, v183, (v183 - (_BYTE *)v182) >> 4);
      sub_1BE6F5A88(&a7->var1.median.__begin_, (char *)v184, v185, (v185 - (_BYTE *)v184) >> 4);
      sub_1BE6F5A88(&a7->var1.top.__begin_, (char *)__p, v187, (v187 - (_BYTE *)__p) >> 4);
    }
    if (__p)
    {
      v187 = (char *)__p;
      operator delete(__p);
    }
    if (v184)
    {
      v185 = (char *)v184;
      operator delete(v184);
    }
    if (v182)
    {
      v183 = (char *)v182;
      operator delete(v182);
    }
    if (v180)
    {
      v181 = (char *)v180;
      operator delete(v180);
    }
    if (v178[0])
    {
      v178[1] = v178[0];
      operator delete(v178[0]);
    }
  }
  CoreHandwriting::deformImagePointsAndLines((CoreHandwriting *)a7, v198, v197, v196, (uint64_t)v178);
  v160 = (void *)objc_opt_class();
  if (v160)
  {
    objc_msgSend_principalLinesForPoints_writtenAlphaShape_imgPointsAndPrincipalLines_shouldCancel_(v160, v161, (uint64_t)v164, (uint64_t)v165, (uint64_t)v178, (uint64_t)v168);
    v162 = (char *)__p;
    if (!__p)
      goto LABEL_56;
    goto LABEL_55;
  }
  *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->top.__end_ = 0u;
  *(_OWORD *)&retstr->base.__end_ = 0u;
  *(_OWORD *)&retstr->median.__begin_ = 0u;
  *(_OWORD *)&retstr->descender.__begin_ = 0u;
  *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
  v162 = (char *)__p;
  if (__p)
  {
LABEL_55:
    v187 = v162;
    operator delete(v162);
  }
LABEL_56:
  if (v184)
  {
    v185 = (char *)v184;
    operator delete(v184);
  }
  if (v182)
  {
    v183 = (char *)v182;
    operator delete(v182);
  }
  if (v180)
  {
    v181 = (char *)v180;
    operator delete(v180);
  }
  if (v178[0])
  {
    v178[1] = v178[0];
    operator delete(v178[0]);
  }

  return result;
}

+ (void)getDeformValuesForTextLine:(id)a3 useAltString:(BOOL)a4 outfullDeform:(double *)a5 outAscenderDeform:(double *)a6 outDescenderDeform:(double *)a7
{
  _BOOL8 v7;
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
  void *v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  const char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  int v67;
  void *v68;
  const char *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  int shouldDeformAscendersDescenders;
  const char *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t i;
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
  BOOL v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  const char *v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  unint64_t v135;
  long double v136;
  double v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  unint64_t v148;
  uint64_t v149;
  double *v150;
  double v151;
  double v152;
  double v153;
  double v154;
  double v155;
  uint64_t v156;
  const char *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  double v162;
  double v163;
  const char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  double *v169;
  double *v170;
  uint64_t v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  double v182;
  double *v183;
  char *v184;
  uint64_t v185;
  unint64_t v186;
  uint64_t v187;
  unint64_t v188;
  double *v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  double v197;
  const char *v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  double *v203;
  double *v204;
  uint64_t v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  double v216;
  double *v217;
  double *v218;
  uint64_t v219;
  unint64_t v220;
  uint64_t v221;
  unint64_t v222;
  double *v223;
  uint64_t v224;
  double *v225;
  double *v226;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  double v241;
  double v242;
  double v243;
  double v244;
  void *v245;
  const char *v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  int hasDescender;
  void *v251;
  const char *v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t v255;
  int hasAscender;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  double v267;
  double v268;
  double v269;
  void *v270;
  const char *v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  double v275;
  double v276;
  void *v277;
  const char *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  const char *v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  const char *v287;
  uint64_t v288;
  uint64_t v289;
  uint64_t v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  const char *v295;
  uint64_t v296;
  uint64_t v297;
  uint64_t v298;
  const char *v299;
  uint64_t v300;
  const char *v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
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
  float v317;
  float v318;
  double v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  void *v325;
  const char *v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  uint64_t v330;
  float v331;
  float v332;
  double v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  void *v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  float v344;
  float v345;
  double v346;
  double *v347;
  id v351;
  void *v352;
  void *v353;
  void *v354;
  int v355;
  id obj;
  double *v357;
  double *v358;
  double *v359;
  double *v360;
  void *v361;
  double *v362;
  double *v363;
  double *v364;
  double *v365;
  void *v366;
  uint64_t *v367;
  double *__p;
  double *v369;
  double *v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  _BYTE v375[128];
  uint64_t v376;

  v7 = a4;
  v376 = *MEMORY[0x1E0C80C00];
  v351 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v8, v9, v10, v11, v12);
  v353 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16, v17);
  v352 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19, v20, v21, v22);
  v354 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v351, v23, v24, v25, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_string(v351, v29, v30, v31, v32, v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uppercaseString(v34, v35, v36, v37, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isEqualToString_(v28, v41, (uint64_t)v40, v42, v43, v44))
  {
    objc_msgSend_string(v351, v45, v46, v47, v48, v49);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_string(v351, v51, v52, v53, v54, v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_lowercaseString(v56, v57, v58, v59, v60, v61);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v67 = objc_msgSend_isEqualToString_(v50, v63, (uint64_t)v62, v64, v65, v66) ^ 1;

  }
  else
  {
    v67 = 0;
  }

  v68 = (void *)objc_opt_class();
  objc_msgSend_locale(v351, v69, v70, v71, v72, v73);
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  shouldDeformAscendersDescenders = objc_msgSend_shouldDeformAscendersDescenders_(v68, v75, (uint64_t)v74, v76, v77, v78);

  objc_msgSend_splitIntoTokens(v351, v80, v81, v82, v83, v84);
  v373 = 0u;
  v374 = 0u;
  v371 = 0u;
  v372 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v85, (uint64_t)&v371, (uint64_t)v375, 16, v86);
  if (!v87)
    goto LABEL_176;
  v355 = shouldDeformAscendersDescenders ^ 1 | v67;
  v88 = *(_QWORD *)v372;
  do
  {
    for (i = 0; i != v87; ++i)
    {
      if (*(_QWORD *)v372 != v88)
        objc_enumerationMutation(obj);
      v90 = *(void **)(*((_QWORD *)&v371 + 1) + 8 * i);
      v91 = (void *)objc_opt_class();
      objc_msgSend_string(v90, v92, v93, v94, v95, v96);
      v97 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForRendering_useAltChars_(v91, v98, (uint64_t)v97, v7, v99, v100);
      v101 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E0CB3500], v102, v103, v104, v105, v106);
      v107 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_indexesOfCharacters_(v101, v108, (uint64_t)v107, v109, v110, v111);
      v112 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend_count(v112, v113, v114, v115, v116, v117);
      v124 = v118 == objc_msgSend_length(v101, v119, v120, v121, v122, v123);

      if (!v124 && v90)
      {
        objc_msgSend_points(v90, v125, v126, v127, v128, v129);
        v135 = (char *)v364 - (char *)v363;
        if (v363)
        {
          v364 = v363;
          operator delete(v363);
        }
        if (v135 >= 0x20)
        {
          objc_msgSend_orientation(v90, v130, v131, v132, v133, v134);
          v137 = tan(v136);
          objc_msgSend_points(v90, v138, v139, v140, v141, v142);
          v148 = ((char *)v364 - (char *)v363) >> 4;
          if (v364 == v363)
          {
            v155 = 0.0 / (double)v148;
            v152 = 1.79769313e308;
            v153 = -1.79769313e308;
            if (v364)
              goto LABEL_26;
          }
          else
          {
            if (v148 <= 1)
              v149 = 1;
            else
              v149 = ((char *)v364 - (char *)v363) >> 4;
            v150 = v363 + 1;
            v151 = 0.0;
            v152 = 1.79769313e308;
            v153 = -1.79769313e308;
            do
            {
              v154 = *v150 + *(v150 - 1) * v137;
              if (v154 <= v152)
                v152 = *v150 + *(v150 - 1) * v137;
              if (v154 >= v153)
                v153 = *v150 + *(v150 - 1) * v137;
              v151 = v151 + v154;
              v150 += 2;
              --v149;
            }
            while (v149);
            v155 = v151 / (double)v148;
LABEL_26:
            v364 = v363;
            operator delete(v363);
          }
          objc_msgSend_principalLines(v90, v143, v144, v145, v146, v147);
          v156 = *v367;
          objc_msgSend_principalLines(v90, v157, v158, v159, v160, v161);
          v162 = -v137;
          v163 = v152 + *v362 * v162;
          v169 = (double *)operator new(0x10uLL);
          *(_QWORD *)v169 = v156;
          v169[1] = v163;
          v170 = v169 + 2;
          __p = v169;
          v370 = v169 + 2;
          if (v362)
            operator delete(v362);
          if (v361)
            operator delete(v361);
          if (v360)
            operator delete(v360);
          if (v359)
            operator delete(v359);
          if (v367)
            operator delete(v367);
          if (v366)
            operator delete(v366);
          if (v365)
            operator delete(v365);
          if (v363)
          {
            v364 = v363;
            operator delete(v363);
          }
          objc_msgSend_principalLines(v90, v164, v165, v166, v167, v168);
          v171 = v367[2];
          objc_msgSend_principalLines(v90, v172, v173, v174, v175, v176);
          v182 = v152 + v362[2] * v162;
          v183 = v170;
          if (v170 < v370)
          {
            *(_QWORD *)v170 = v171;
            v170[1] = v182;
            v184 = (char *)(v170 + 2);
            goto LABEL_61;
          }
          v185 = ((char *)v170 - (char *)__p) >> 4;
          v186 = v185 + 1;
          if ((unint64_t)(v185 + 1) >> 60)
            sub_1BE61F930();
          v187 = (char *)v370 - (char *)__p;
          if (v370 - __p > v186)
            v186 = v187 >> 3;
          if ((unint64_t)v187 >= 0x7FFFFFFFFFFFFFF0)
            v188 = 0xFFFFFFFFFFFFFFFLL;
          else
            v188 = v186;
          if (v188)
          {
            if (v188 >> 60)
              sub_1BE61F100();
            v189 = (double *)((char *)operator new(16 * v188) + 16 * v185);
            *(_QWORD *)v189 = v171;
            v189[1] = v182;
            v190 = (uint64_t)v189;
            if (v170 == __p)
            {
LABEL_59:
              v184 = (char *)(v189 + 2);
              __p = (double *)v190;
              if (v183)
                goto LABEL_60;
              goto LABEL_61;
            }
          }
          else
          {
            v189 = (double *)(16 * v185);
            *(_QWORD *)v189 = v171;
            v189[1] = v182;
            v190 = 16 * v185;
            if (v170 == __p)
              goto LABEL_59;
          }
          do
          {
            *(_OWORD *)(v190 - 16) = *((_OWORD *)v183 - 1);
            v190 -= 16;
            v183 -= 2;
          }
          while (v183 != __p);
          v183 = __p;
          v184 = (char *)(v189 + 2);
          __p = (double *)v190;
          if (v183)
LABEL_60:
            operator delete(v183);
LABEL_61:
          v369 = (double *)v184;
          if (v362)
            operator delete(v362);
          if (v361)
            operator delete(v361);
          if (v360)
            operator delete(v360);
          if (v359)
            operator delete(v359);
          if (v367)
            operator delete(v367);
          if (v366)
            operator delete(v366);
          if (v365)
            operator delete(v365);
          if (v363)
          {
            v364 = v363;
            operator delete(v363);
          }
          objc_msgSend_principalLines(v90, v177, v178, v179, v180, v181);
          v191 = *(_QWORD *)v363;
          objc_msgSend_principalLines(v90, v192, v193, v194, v195, v196);
          v197 = v153 + *v359 * v162;
          v203 = (double *)operator new(0x10uLL);
          *(_QWORD *)v203 = v191;
          v203[1] = v197;
          v204 = v203 + 2;
          v357 = v203;
          v358 = v203 + 2;
          if (v362)
            operator delete(v362);
          if (v361)
            operator delete(v361);
          if (v360)
            operator delete(v360);
          if (v359)
            operator delete(v359);
          if (v367)
            operator delete(v367);
          if (v366)
            operator delete(v366);
          if (v365)
            operator delete(v365);
          if (v363)
          {
            v364 = v363;
            operator delete(v363);
          }
          objc_msgSend_principalLines(v90, v198, v199, v200, v201, v202);
          v205 = *((_QWORD *)v363 + 2);
          objc_msgSend_principalLines(v90, v206, v207, v208, v209, v210);
          v216 = v153 + v359[2] * v162;
          v217 = v204;
          if (v204 < v358)
          {
            *(_QWORD *)v204 = v205;
            v204[1] = v216;
            v218 = v204 + 2;
            goto LABEL_111;
          }
          v219 = ((char *)v204 - (char *)v357) >> 4;
          v220 = v219 + 1;
          if ((unint64_t)(v219 + 1) >> 60)
            sub_1BE61F930();
          v221 = (char *)v358 - (char *)v357;
          if (v358 - v357 > v220)
            v220 = v221 >> 3;
          if ((unint64_t)v221 >= 0x7FFFFFFFFFFFFFF0)
            v222 = 0xFFFFFFFFFFFFFFFLL;
          else
            v222 = v220;
          if (v222)
          {
            if (v222 >> 60)
              sub_1BE61F100();
            v223 = (double *)((char *)operator new(16 * v222) + 16 * v219);
            *(_QWORD *)v223 = v205;
            v223[1] = v216;
            v224 = (uint64_t)v223;
            if (v204 == v357)
            {
LABEL_109:
              v218 = v223 + 2;
              v357 = (double *)v224;
              if (v217)
                goto LABEL_110;
              goto LABEL_111;
            }
          }
          else
          {
            v223 = (double *)(16 * v219);
            *(_QWORD *)v223 = v205;
            v223[1] = v216;
            v224 = 16 * v219;
            if (v204 == v357)
              goto LABEL_109;
          }
          do
          {
            *(_OWORD *)(v224 - 16) = *((_OWORD *)v217 - 1);
            v224 -= 16;
            v217 -= 2;
          }
          while (v217 != v357);
          v217 = v357;
          v218 = v223 + 2;
          v357 = (double *)v224;
          if (v217)
LABEL_110:
            operator delete(v217);
LABEL_111:
          if (v362)
            operator delete(v362);
          if (v361)
            operator delete(v361);
          if (v360)
            operator delete(v360);
          if (v359)
            operator delete(v359);
          if (v367)
            operator delete(v367);
          if (v366)
            operator delete(v366);
          if (v365)
            operator delete(v365);
          if (v363)
          {
            v364 = v363;
            operator delete(v363);
          }
          if ((char *)v369 - (char *)__p == (char *)v218 - (char *)v357)
          {
            v225 = v357;
            v226 = __p;
            if (__p != v369)
            {
              v225 = v357;
              v226 = __p;
              if (v357 != v218)
              {
                v226 = __p;
                v225 = v357;
                while (*v226 == *v225 && v226[1] == v225[1])
                {
                  v226 += 2;
                  v225 += 2;
                  if (v226 == v369 || v225 == v218)
                    goto LABEL_138;
                }
                goto LABEL_140;
              }
            }
LABEL_138:
            if (v226 != v369)
              goto LABEL_140;
            v228 = 0.0;
            if (v225 != v218)
              goto LABEL_140;
          }
          else
          {
LABEL_140:
            v230 = *__p;
            v229 = __p[1];
            v231 = (__p[3] - v229) / (__p[2] - *__p);
            v232 = v357[1];
            v233 = (v357[3] - v232) / (v357[2] - *v357);
            v234 = v232 - v233 * *v357;
            v235 = *__p;
            if (v231 != 0.0)
              v235 = (v229 - -1.0 / v231 * v230 - v234) / (v233 - -1.0 / v231);
            v228 = sqrt((v229 - (v234 + v233 * v235)) * (v229 - (v234 + v233 * v235)) + (v230 - v235) * (v230 - v235));
          }
          objc_msgSend_principalLines(v90, v211, v212, v213, v214, v215);
          objc_msgSend_principalLines(v90, v236, v237, v238, v239, v240);
          v241 = v360[2];
          v242 = v360[3];
          v243 = *v365;
          v244 = v365[1];
          if (v362)
            operator delete(v362);
          if (v361)
            operator delete(v361);
          if (v360)
            operator delete(v360);
          if (v359)
            operator delete(v359);
          if (v367)
            operator delete(v367);
          if (v366)
            operator delete(v366);
          if (v365)
            operator delete(v365);
          if (v363)
          {
            v364 = v363;
            operator delete(v363);
          }
          v245 = (void *)objc_opt_class();
          hasDescender = objc_msgSend_hasDescender_(v245, v246, (uint64_t)v101, v247, v248, v249);
          v251 = (void *)objc_opt_class();
          hasAscender = objc_msgSend_hasAscender_(v251, v252, (uint64_t)v101, v253, v254, v255);
          v257 = (void *)objc_opt_class();
          objc_msgSend_estimatedRenderedTextSize_fullDeformValue_ascenderDeformValue_descenderDeformValue_(v257, v258, (uint64_t)v101, v259, v260, v261, 1.0, 0.0, 0.0);
          if (v268 >= 12.0 && v267 >= 12.0)
          {
            v269 = v267
                 / v268
                 / (sqrt((v244 - v242) * (v244 - v242) + (v243 - v241) * (v243 - v241)) / (v228 + 1.0e-10) + 1.0e-10);
            if (v355)
            {
              objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v262, v263, v264, v265, v266, v269);
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v354, v271, (uint64_t)v270, v272, v273, v274);
              goto LABEL_169;
            }
            if ((hasAscender & hasDescender) == 1)
            {
              v275 = v268 * v269 + -52.5;
              v276 = v153 - v155 + v155 - v152;
              objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v262, v263, v264, v265, v266, (v155 - v152) / v276 * v275 / 18.5 + -1.0);
              v277 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v353, v278, (uint64_t)v277, v279, v280, v281);

              objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v282, v283, v284, v285, v286, (v153 - v155) / v276 * v275 / 17.0 + -1.0);
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v352, v287, (uint64_t)v270, v288, v289, v290);
              goto LABEL_169;
            }
            if (hasAscender)
            {
              objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v262, v263, v264, v265, v266, -(v268 + -18.5 - v268 * v269) / 18.5 + -1.0);
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v353, v291, (uint64_t)v270, v292, v293, v294);
              goto LABEL_169;
            }
            if (hasDescender)
            {
              objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v262, v263, v264, v265, v266, -(v268 + -17.0 - v268 * v269) / 17.0 + -1.0);
              v270 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addObject_(v352, v295, (uint64_t)v270, v296, v297, v298);
LABEL_169:

            }
          }
          if (v357)
            operator delete(v357);
          if (__p)
            operator delete(__p);
        }
      }

    }
    v87 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v299, (uint64_t)&v371, (uint64_t)v375, 16, v300);
  }
  while (v87);
LABEL_176:

  if (objc_msgSend_count(v353, v301, v302, v303, v304, v305))
  {
    objc_msgSend_valueForKeyPath_(v353, v306, (uint64_t)CFSTR("@avg.floatValue"), v308, v309, v310);
    v311 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v311, v312, v313, v314, v315, v316);
    v318 = v317;

    v319 = v318;
  }
  else
  {
    v319 = 0.0;
  }
  if (objc_msgSend_count(v352, v306, v307, v308, v309, v310))
  {
    objc_msgSend_valueForKeyPath_(v352, v320, (uint64_t)CFSTR("@avg.floatValue"), v322, v323, v324);
    v325 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v325, v326, v327, v328, v329, v330);
    v332 = v331;

    v333 = v332;
  }
  else
  {
    v333 = 0.0;
  }
  if (objc_msgSend_count(v354, v320, v321, v322, v323, v324))
  {
    objc_msgSend_valueForKeyPath_(v354, v334, (uint64_t)CFSTR("@avg.floatValue"), v335, v336, v337);
    v338 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v338, v339, v340, v341, v342, v343);
    v345 = v344;

    v346 = v345;
    v347 = a5;
    if (a5)
      goto LABEL_184;
  }
  else
  {
    v346 = 1.0;
    v347 = a5;
    if (a5)
LABEL_184:
      *v347 = v346;
  }
  if (a6)
    *a6 = fmax(v319, -0.5);
  if (a7)
    *a7 = fmax(v333, -0.5);

}

- (void)assignRemainingStrokes:(id)a3 toTextLines:(id)a4
{
  id v6;
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  const char *v25;
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
  void *v38;
  const char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int isEqualToNumber;
  const char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unsigned int v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  unsigned int v60;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  double v66;
  double v67;
  double v68;
  CGFloat v69;
  double v70;
  CGFloat v71;
  unint64_t v72;
  double v73;
  double v74;
  uint64_t v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  double v86;
  CGFloat v87;
  const char *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  double v93;
  CGFloat v94;
  const char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  double v100;
  double v101;
  double v102;
  double v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  double v109;
  double v110;
  void *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  double v116;
  id obj;
  uint64_t v118;
  uint64_t v119;
  CGFloat v120;
  CGFloat v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  _BYTE v126[128];
  uint64_t v127;
  CGRect v128;
  CGRect v129;
  CGRect v130;

  v127 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v122 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0u;
  obj = v6;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v122, (uint64_t)v126, 16, v9);
  if (v10)
  {
    v118 = *(_QWORD *)v123;
    v116 = 1.0e-10;
    do
    {
      v119 = v10;
      for (i = 0; i != v119; ++i)
      {
        if (*(_QWORD *)v123 != v118)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v122 + 1) + 8 * i);
        objc_msgSend_strokeClassificationResult(self, v11, v12, v13, v14, v15, *(_QWORD *)&v116);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_strokeClassificationsByStrokeIdentifier(v18, v19, v20, v21, v22, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectForKeyedSubscript_(v24, v25, v17, v26, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend_containsObject_(&unk_1E7827F98, v30, (uint64_t)v29, v31, v32, v33))
        {
          objc_msgSend_strokeIdentifierFromData_(self->_strokeProvider, v34, v17, v35, v36, v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_strokeForIdentifier_(self->_strokeProvider, v39, (uint64_t)v38, v40, v41, v42);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          isEqualToNumber = objc_msgSend_isEqualToNumber_(v29, v44, (uint64_t)&unk_1E7829210, v45, v46, v47);
          v54 = objc_msgSend_strokeAttributes(v43, v49, v50, v51, v52, v53);
          v60 = v54;
          if (!isEqualToNumber || (v54 & 2) != 0)
          {
            objc_msgSend_bounds(v43, v55, v56, v57, v58, v59);
            v120 = v67;
            v121 = v66;
            v69 = v68;
            v71 = v70;
            v72 = 0;
            v73 = v116 + v68 * v70;
            v74 = 0.0;
            v75 = -1;
            while (v72 < objc_msgSend_count(v7, v61, v62, v63, v64, v65))
            {
              objc_msgSend_objectAtIndexedSubscript_(v7, v76, v72, v77, v78, v79);
              v80 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_boundingBox(v80, v81, v82, v83, v84, v85);
              v87 = v86;
              objc_msgSend_boundingBox(v80, v88, v89, v90, v91, v92);
              v94 = v93;
              objc_msgSend_boundingBox(v80, v95, v96, v97, v98, v99);
              v101 = v100;
              v103 = v102;
              objc_msgSend_boundingBox(v80, v104, v105, v106, v107, v108);
              v128.size.height = v110 - v109;
              v128.origin.x = v87;
              v128.origin.y = v94;
              v128.size.width = v103 - v101;
              v130.origin.y = v120;
              v130.origin.x = v121;
              v130.size.width = v69;
              v130.size.height = v71;
              v129 = CGRectIntersection(v128, v130);
              if (v129.size.width * v129.size.height / v73 > v74)
              {
                v75 = v72;
                v74 = v129.size.width * v129.size.height / v73;
              }

              ++v72;
            }
            if (v75 != -1 && ((v74 < 0.5) & (v60 >> 1)) == 0)
            {
              objc_msgSend_objectAtIndexedSubscript_(v7, v76, v75, v77, v78, v79);
              v111 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_addSupportStroke_(v111, v112, (uint64_t)v43, v113, v114, v115);

            }
          }

        }
      }
      v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v122, (uint64_t)v126, 16, v15);
    }
    while (v10);
  }

}

+ (id)checkAvailableInterceptsForString:(id)a3 skipAmbiguousCharacters:(BOOL)a4
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
  uint64_t v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unsigned int hasAscender;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char hasDescender;
  void *v41;
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  int hasAmbiguousCharacter;
  uint64_t v47;
  double v48;
  uint64_t v49;
  void *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  int v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  int v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  void *v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  void *v90;
  const char *v91;
  uint64_t v92;
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
  id v106;
  uint64_t v107;
  uint64_t v108;
  id obj;
  uint64_t v110;
  uint64_t v111;
  unint64_t v112;
  _BOOL4 v113;
  void *v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  _QWORD v120[4];
  _BYTE v121[128];
  uint64_t v122;

  v113 = a4;
  v122 = *MEMORY[0x1E0C80C00];
  v106 = a3;
  objc_msgSend_whitespaceAndNewlineCharacterSet(MEMORY[0x1E0CB3500], v4, v5, v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_componentsSeparatedByCharactersInSet_(v106, v10, (uint64_t)v9, v11, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v118 = 0u;
  v119 = 0u;
  v116 = 0u;
  v117 = 0u;
  obj = v14;
  v17 = 0;
  v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v116, (uint64_t)v121, 16, v16);
  if (v23)
  {
    v115 = 0;
    v24 = 0;
    v25 = 0;
    v26 = *(_QWORD *)v117;
    v107 = *(_QWORD *)v117;
    while (1)
    {
      v27 = 0;
      v108 = v23;
      do
      {
        if (*(_QWORD *)v117 != v26)
          objc_enumerationMutation(obj);
        v114 = *(void **)(*((_QWORD *)&v116 + 1) + 8 * v27);
        v28 = objc_msgSend_countCharacters(v114, v18, v19, v20, v21, v22);
        v29 = (void *)objc_opt_class();
        hasAscender = objc_msgSend_hasAscender_(v29, v30, (uint64_t)v114, v31, v32, v33);
        v35 = (void *)objc_opt_class();
        hasDescender = objc_msgSend_hasDescender_(v35, v36, (uint64_t)v114, v37, v38, v39);
        if (v113)
        {
          v41 = (void *)objc_opt_class();
          hasAmbiguousCharacter = objc_msgSend_hasAmbiguousCharacter_(v41, v42, (uint64_t)v114, v43, v44, v45);
          v24 += (v28 < 3) & ~hasAscender;
          v25 += hasAscender;
          if ((hasDescender & 1) != 0)
            goto LABEL_10;
        }
        else
        {
          hasAmbiguousCharacter = 0;
          v24 += (v28 < 3) & ~hasAscender;
          v25 += hasAscender;
          if ((hasDescender & 1) != 0)
          {
LABEL_10:
            ++v17;
            if (v28 < 3)
              goto LABEL_5;
            goto LABEL_14;
          }
        }
        if (v28 <= 2)
        {
          v115 += hasAmbiguousCharacter ^ 1u;
          goto LABEL_5;
        }
LABEL_14:
        v110 = v27;
        v111 = v17;
        v47 = 0;
        v112 = v28 - 1;
        v48 = (double)(uint64_t)(v28 - 1);
        v49 = 1;
        do
        {
          objc_msgSend_substringWithComposedCharacterRange_(v114, v18, v47 - (v47 != 0), (unint64_t)fmin(v48, (double)(unint64_t)(v47 + 2)) + (v47 != 0) + v49, v21, v22);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend_countCharacters(v50, v51, v52, v53, v54, v55);
          v57 = (void *)objc_opt_class();
          v62 = objc_msgSend_ascendersCount_(v57, v58, (uint64_t)v50, v59, v60, v61);
          v63 = (void *)objc_opt_class();
          v68 = objc_msgSend_hasAscender_(v63, v64, (uint64_t)v50, v65, v66, v67);
          v69 = (void *)objc_opt_class();
          v74 = objc_msgSend_hasDescender_(v69, v70, (uint64_t)v50, v71, v72, v73);
          if (v113)
          {
            v75 = (void *)objc_opt_class();
            v80 = objc_msgSend_hasAmbiguousCharacter_(v75, v76, (uint64_t)v50, v77, v78, v79);
          }
          else
          {
            v80 = 0;
          }
          if ((double)(unint64_t)v62 / (double)(unint64_t)v56 >= 0.75)
            ++v25;

          v24 += v68 ^ 1u;
          v115 += (v74 | v80) ^ 1u;
          ++v47;
          --v49;
        }
        while (v112 != v47);
        v27 = v110;
        v17 = v111;
        v26 = v107;
        v23 = v108;
LABEL_5:
        ++v27;
      }
      while (v27 != v23);
      v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v116, (uint64_t)v121, 16, v22);
      if (!v23)
        goto LABEL_25;
    }
  }
  v115 = 0;
  v24 = 0;
  v25 = 0;
LABEL_25:

  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v81, v25, v82, v83, v84);
  v85 = (void *)objc_claimAutoreleasedReturnValue();
  v120[0] = v85;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v86, v24, v87, v88, v89);
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v120[1] = v90;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v91, v115, v92, v93, v94);
  v95 = (void *)objc_claimAutoreleasedReturnValue();
  v120[2] = v95;
  objc_msgSend_numberWithUnsignedInteger_(MEMORY[0x1E0CB37E8], v96, v17, v97, v98, v99);
  v100 = (void *)objc_claimAutoreleasedReturnValue();
  v120[3] = v100;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v101, (uint64_t)v120, 4, v102, v103);
  v104 = (void *)objc_claimAutoreleasedReturnValue();

  return v104;
}

+ (id)principalLinePointsForString:(id)a3 skipAmbiguousCharacters:(BOOL)a4 strokes:(id)a5 strokePoints:(const void *)a6 orientation:(double)a7 medianFallbackThreshold:(double)a8
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
  uint64_t v32;
  void *v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double *v60;
  double v61;
  double v62;
  unint64_t v63;
  double *v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  char *v74;
  uint64_t v75;
  unint64_t v76;
  double *v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  int hasAscender;
  void *v92;
  const char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int hasDescender;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  void *v103;
  const char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char hasAmbiguousCharacter;
  double v109;
  double v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  double v114;
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
  const char *v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
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
  char v146;
  uint64_t v147;
  unint64_t v148;
  double v149;
  double v150;
  double v151;
  const char *v152;
  uint64_t v153;
  uint64_t v154;
  void *v155;
  uint64_t v156;
  void *v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  void *v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  char v175;
  void *v176;
  const char *v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  int v181;
  void *v182;
  const char *v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  int v187;
  double v188;
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  void *v194;
  unint64_t v195;
  double *v196;
  double v197;
  double v198;
  double v199;
  double v200;
  double v201;
  double v202;
  double v203;
  double v204;
  void *v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  double v216;
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
  uint64_t v228;
  const char *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t v232;
  double v233;
  void *v235;
  const char *v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  void *v241;
  const char *v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  void *v246;
  const char *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  void *v252;
  const char *v253;
  uint64_t v254;
  uint64_t v255;
  uint64_t v256;
  void *v257;
  const char *v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  _BOOL4 v263;
  const char *v264;
  uint64_t v265;
  uint64_t v266;
  uint64_t v267;
  void *v268;
  const char *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  id v273;
  double v275;
  double v276;
  double v277;
  double v278;
  void *v279;
  uint64_t v281;
  uint64_t v282;
  double v283;
  void *v284;
  double v285;
  double v286;
  _BOOL4 v287;
  id v288;
  id v290;
  void *__p;
  void *v292;
  void *v293;
  _BYTE *v294;
  void *v295;
  int v296[2];
  uint64_t v297;
  _QWORD v298[6];
  CGPoint v299;
  CGPoint v300;
  CGPoint v301;
  CGPoint v302;
  CGPoint v303;
  CGPoint v304;
  CGPoint v305;
  CGPoint v306;

  v287 = a4;
  v298[4] = *MEMORY[0x1E0C80C00];
  v290 = a3;
  v288 = a5;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v10, v11, v12, v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v298[0] = v15;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v16, v17, v18, v19, v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v298[1] = v21;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v22, v23, v24, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v298[2] = v27;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v28, v29, v30, v31, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v298[3] = v33;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v34, (uint64_t)v298, 4, v35, v36);
  v284 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v37, v38, v39, v40, v41);
  v279 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = tan(a7);
  v48 = objc_msgSend_countCharacters(v290, v43, v44, v45, v46, v47);
  v295 = 0;
  *(_QWORD *)v296 = 0;
  v297 = 0;
  v49 = *(_QWORD *)a6;
  if (*((_QWORD *)a6 + 1) == *(_QWORD *)a6)
  {
    v54 = 1.79769313e308;
    v55 = -1.79769313e308;
    v52 = -1.79769313e308;
    v53 = 1.79769313e308;
    v56 = -1.79769313e308;
    v57 = 1.79769313e308;
  }
  else
  {
    v50 = 0;
    v51 = 0;
    do
    {
      sub_1BE7B2240((uint64_t)&v295, *(uint64_t *)v296, *(char **)(v49 + v50), *(char **)(v49 + v50 + 8), (uint64_t)(*(_QWORD *)(v49 + v50 + 8) - *(_QWORD *)(v49 + v50)) >> 4);
      ++v51;
      v49 = *(_QWORD *)a6;
      v50 += 24;
    }
    while (v51 < 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(*((_QWORD *)a6 + 1) - *(_QWORD *)a6) >> 3));
    v52 = -1.79769313e308;
    v53 = 1.79769313e308;
    v54 = 1.79769313e308;
    v55 = -1.79769313e308;
    v56 = -1.79769313e308;
    v57 = 1.79769313e308;
    if (v295 != *(void **)v296)
    {
      v58 = -1.79769313e308;
      v59 = 1.79769313e308;
      v60 = (double *)v295;
      do
      {
        v61 = *v60;
        v62 = v60[1];
        v60 += 2;
        if (v59 > v61)
        {
          v53 = v61;
          v59 = v61;
        }
        if (v58 < v61)
        {
          v52 = v61;
          v58 = v61;
        }
        if (v57 > v62)
        {
          v54 = v62;
          v57 = v62;
        }
        if (v56 < v62)
        {
          v55 = v62;
          v56 = v62;
        }
      }
      while (v60 != *(double **)v296);
    }
    if (v42 != 0.0)
    {
      if (v295 == *(void **)v296)
      {
        v57 = 1.79769313e308;
        v56 = -1.79769313e308;
      }
      else
      {
        v63 = (uint64_t)(*(_QWORD *)v296 - (_QWORD)v295) >> 4;
        if (v63 <= 1)
          v63 = 1;
        v64 = (double *)((char *)v295 + 8);
        v57 = 1.79769313e308;
        v56 = -1.79769313e308;
        v65 = 1.0 / v42;
        do
        {
          v66 = *v64 - *(v64 - 1) * v65;
          if (v66 <= v57)
            v57 = *v64 - *(v64 - 1) * v65;
          if (v66 >= v56)
            v56 = *v64 - *(v64 - 1) * v65;
          v64 += 2;
          --v63;
        }
        while (v63);
      }
    }
  }
  v286 = -v42;
  v67 = v52;
  v68 = v55;
  v69 = v54;
  if (v42 != 0.0)
  {
    v70 = 1.0 / v42;
    v71 = v42 + 1.0 / v42;
    if (v57 * v286 >= v56 * v286)
    {
      v69 = v56 + v53 * v70;
      v73 = v69 + v42 * v53;
      v67 = (v73 - v57) / v71;
      v68 = v73 + v67 * v286;
    }
    else
    {
      v69 = v57 + v53 * v70;
      v72 = v69 + v42 * v53;
      v67 = (v72 - v56) / v71;
      v68 = v72 + v67 * v286;
    }
  }
  v285 = fmin(v52 - v53, v55 - v54) / 5.0;
  sub_1BE7F459C(v288, a6, (uint64_t *)&v293, a7, v285, v285, v53, v69, v67, v68);
  v74 = (char *)v293;
  if (v294 == v293)
  {
    sub_1BE6F5A88(&v293, (char *)v295, *(char **)v296, (uint64_t)(*(_QWORD *)v296 - (_QWORD)v295) >> 4);
    v74 = (char *)v293;
    v75 = v294 - (_BYTE *)v293;
    if (v294 != v293)
      goto LABEL_34;
LABEL_44:
    v83 = 0.0;
    v82 = 0.0;
    v81 = 0.0;
    v78 = 0.0;
    goto LABEL_45;
  }
  v75 = v294 - (_BYTE *)v293;
  if (v294 == v293)
    goto LABEL_44;
LABEL_34:
  v76 = v75 >> 4;
  if (v76 <= 1)
    v76 = 1;
  v77 = (double *)(v74 + 8);
  v78 = 0.0;
  v79 = -1.79769313e308;
  v80 = 1.79769313e308;
  v81 = 0.0;
  v82 = 0.0;
  v83 = 0.0;
  do
  {
    v84 = *(v77 - 1);
    v85 = *v77 + v84 * v42;
    if (v85 <= v80)
    {
      v83 = *(v77 - 1);
      v82 = *v77;
      v80 = *v77 + v84 * v42;
    }
    if (v85 >= v79)
    {
      v79 = *v77 + v84 * v42;
      v81 = *v77;
      v78 = *(v77 - 1);
    }
    v77 += 2;
    --v76;
  }
  while (v76);
LABEL_45:
  v86 = (void *)objc_opt_class();
  hasAscender = objc_msgSend_hasAscender_(v86, v87, (uint64_t)v290, v88, v89, v90);
  v92 = (void *)objc_opt_class();
  hasDescender = objc_msgSend_hasDescender_(v92, v93, (uint64_t)v290, v94, v95, v96);
  v102 = hasDescender;
  if (v287)
  {
    v103 = (void *)objc_opt_class();
    hasAmbiguousCharacter = objc_msgSend_hasAmbiguousCharacter_(v103, v104, (uint64_t)v290, v105, v106, v107);
    v109 = v81 + v78 * v42;
    v110 = v82 + v83 * v42;
    if ((v102 & hasAscender) != 1)
      goto LABEL_47;
  }
  else
  {
    hasAmbiguousCharacter = 0;
    v109 = v81 + v78 * v42;
    v110 = v82 + v83 * v42;
    if ((hasDescender & hasAscender) != 1)
    {
LABEL_47:
      if (v102)
      {
        v111 = 0;
        v282 = 0;
        v112 = (uint64_t)(v109 - ceil((v109 - v110) * 0.25));
        v113 = (uint64_t)(v109 + 1.0);
        if (!hasAscender)
          goto LABEL_49;
      }
      else
      {
        v112 = 0;
        v113 = 0;
        if (!hasAscender)
        {
          v282 = 0;
          v111 = 0;
          if (v48 > 2)
            goto LABEL_60;
          goto LABEL_58;
        }
        v282 = (uint64_t)v110;
        v111 = (uint64_t)(v110 + ceil((v109 - v110) * 0.25) + 1.0);
      }
LABEL_56:
      objc_msgSend_objectAtIndexedSubscript_(v284, v98, 0, v99, v100, v101);
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v299.x = v83;
      v299.y = v82;
      pointToString(v299, (uint64_t)v115, v116, v117, v118, v119, v120);
      v121 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v115, v122, (uint64_t)v121, v123, v124, v125);
LABEL_59:

      goto LABEL_60;
    }
  }
  v282 = (uint64_t)v110;
  v114 = ceil((v109 - v110) * 0.125);
  v111 = (uint64_t)(v110 + v114 + 1.0);
  v112 = (uint64_t)(v109 - v114);
  v113 = (uint64_t)(v109 + 1.0);
  if (hasAscender)
    goto LABEL_56;
LABEL_49:
  if (v48 <= 2)
  {
LABEL_58:
    objc_msgSend_objectAtIndexedSubscript_(v284, v98, 1, v99, v100, v101);
    v115 = (void *)objc_claimAutoreleasedReturnValue();
    v300.x = v83;
    v300.y = v82;
    pointToString(v300, (uint64_t)v115, v126, v127, v128, v129, v130);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v115, v131, (uint64_t)v121, v132, v133, v134);
    goto LABEL_59;
  }
LABEL_60:
  if (v102)
  {
    objc_msgSend_objectAtIndexedSubscript_(v284, v98, 3, v99, v100, v101);
    v135 = (void *)objc_claimAutoreleasedReturnValue();
    v301.x = v78;
    v301.y = v81;
    pointToString(v301, (uint64_t)v135, v136, v137, v138, v139, v140);
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v135, v142, (uint64_t)v141, v143, v144, v145);

  }
  else
  {
    if (v48 > 2)
      v146 = 1;
    else
      v146 = hasAmbiguousCharacter;
    if ((v146 & 1) == 0)
    {
      objc_msgSend_objectAtIndexedSubscript_(v284, v98, 2, v99, v100, v101);
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      v306.x = v78;
      v306.y = v81;
      pointToString(v306, (uint64_t)v246, v247, v248, v249, v250, v251);
      v252 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_addObject_(v246, v253, (uint64_t)v252, v254, v255, v256);

      goto LABEL_109;
    }
  }
  if (v48 >= 3)
  {
    v147 = v48;
    v148 = 0;
    v149 = (double)v282;
    v150 = v69 + v53 * v42;
    v281 = v147 - 1;
    v283 = (double)(v147 - 1);
    v277 = (double)v111;
    v278 = v149;
    v275 = (double)v113;
    v276 = (double)v112;
    v151 = (v67 - v53) / (double)v147;
    while (1)
    {
      v155 = (void *)MEMORY[0x1C3B818B0]();
      if (v148)
        v156 = v148 - 1;
      else
        v156 = 0;
      objc_msgSend_substringWithComposedCharacterRange_(v290, v152, v156, (unint64_t)fmin(v283, (double)(v148 + 2)) - v156 + 1, v153, v154);
      v157 = (void *)objc_claimAutoreleasedReturnValue();
      v163 = objc_msgSend_countCharacters(v157, v158, v159, v160, v161, v162);
      v164 = (void *)objc_opt_class();
      v169 = objc_msgSend_ascendersCount_(v164, v165, (uint64_t)v157, v166, v167, v168);
      v170 = (void *)objc_opt_class();
      v175 = objc_msgSend_hasAscender_(v170, v171, (uint64_t)v157, v172, v173, v174);
      v176 = (void *)objc_opt_class();
      v181 = objc_msgSend_hasDescender_(v176, v177, (uint64_t)v157, v178, v179, v180);
      if (v287)
      {
        v182 = (void *)objc_opt_class();
        v187 = objc_msgSend_hasAmbiguousCharacter_(v182, v183, (uint64_t)v157, v184, v185, v186);
      }
      else
      {
        v187 = 0;
      }
      v188 = (double)v148 + 0.05;
      if (!v148)
        v188 = 0.0;
      sub_1BE7F459C(v288, a6, (uint64_t *)&__p, a7, v285, v285, v53 + v188 * v151, v150 + (v53 + v188 * v151) * v286, v53 + v188 * v151 + v151 * 1.9, v150 + (v53 + v188 * v151 + v151 * 1.9) * v286);
      v194 = v292;
      if (v292 == __p)
        goto LABEL_104;
      v195 = ((_BYTE *)v292 - (_BYTE *)__p) >> 4;
      if (v195 <= 1)
        v195 = 1;
      v196 = (double *)((char *)__p + 8);
      v197 = 0.0;
      v198 = -1.79769313e308;
      v199 = 1.79769313e308;
      v200 = 0.0;
      v201 = 0.0;
      v202 = 0.0;
      do
      {
        v203 = *(v196 - 1);
        v204 = *v196 + v203 * v42;
        if (v204 <= v199)
        {
          v202 = *(v196 - 1);
          v201 = *v196;
          v199 = *v196 + v203 * v42;
        }
        if (v204 >= v198)
        {
          v198 = *v196 + v203 * v42;
          v200 = *v196;
          v197 = *(v196 - 1);
        }
        v196 += 2;
        --v195;
      }
      while (v195);
      if ((double)(unint64_t)v169 / (double)(unint64_t)v163 >= 0.75)
      {
        objc_msgSend_objectAtIndexedSubscript_(v284, v189, 0, v191, v192, v193);
        v205 = (void *)objc_claimAutoreleasedReturnValue();
        v302.x = v202;
        v302.y = v201;
        pointToString(v302, (uint64_t)v205, v206, v207, v208, v209, v210);
        v211 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v205, v212, (uint64_t)v211, v213, v214, v215);

      }
      v216 = v201 + v202 * v42;
      if ((v175 & 1) == 0 && (v216 < v278 || v216 >= v277))
        break;
      if (a8 != 0.0 && v216 > a8)
      {
        v304.x = v202;
        v304.y = v201;
        pointToString(v304, (uint64_t)v194, v189, v190, v191, v192, v193);
        v218 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v279, v229, (uint64_t)v218, v230, v231, v232);
        goto LABEL_96;
      }
LABEL_97:
      if (((v181 | v187) & 1) == 0)
      {
        v233 = v200 + v197 * v42;
        if (v233 < v276 || v233 >= v275)
        {
          objc_msgSend_objectAtIndexedSubscript_(v284, v189, 2, v191, v192, v193);
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          v305.x = v197;
          v305.y = v200;
          pointToString(v305, (uint64_t)v235, v236, v237, v238, v239, v240);
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v235, v242, (uint64_t)v241, v243, v244, v245);

        }
      }
      v194 = __p;
LABEL_104:
      if (v194)
      {
        v292 = v194;
        operator delete(v194);
      }

      objc_autoreleasePoolPop(v155);
      if (++v148 == v281)
        goto LABEL_109;
    }
    objc_msgSend_objectAtIndexedSubscript_(v284, v189, 1, v191, v192, v193);
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v303.x = v202;
    v303.y = v201;
    pointToString(v303, (uint64_t)v218, v219, v220, v221, v222, v223);
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v218, v225, (uint64_t)v224, v226, v227, v228);

LABEL_96:
    goto LABEL_97;
  }
LABEL_109:
  objc_msgSend_objectAtIndexedSubscript_(v284, v98, 1, v99, v100, v101);
  v257 = (void *)objc_claimAutoreleasedReturnValue();
  v263 = objc_msgSend_count(v257, v258, v259, v260, v261, v262) == 0;

  if (v263)
  {
    objc_msgSend_objectAtIndexedSubscript_(v284, v264, 1, v265, v266, v267);
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObjectsFromArray_(v268, v269, (uint64_t)v279, v270, v271, v272);

  }
  v273 = v284;
  if (v293)
  {
    v294 = v293;
    operator delete(v293);
  }
  if (v295)
  {
    *(_QWORD *)v296 = v295;
    operator delete(v295);
  }

  return v273;
}

+ (id)principalLineInterceptsForString:(id)a3 skipAmbiguousCharacters:(BOOL)a4 strokes:(id)a5 strokePoints:(const void *)a6 orientation:(double)a7 medianFallbackThreshold:(double)a8
{
  _BOOL8 v12;
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
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  const char *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  double v41;
  void *v42;
  const char *v43;
  const char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  double *v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  const char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t i;
  const char *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double v65;
  double v66;
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
  const char *v78;
  uint64_t v79;
  id v81;
  id v82;
  void *v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  float *v88;
  float *v89;
  _BYTE v90[128];
  _QWORD v91[6];

  v12 = a4;
  v91[4] = *MEMORY[0x1E0C80C00];
  v81 = a3;
  v82 = a5;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v13, v14, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v91[0] = v18;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v19, v20, v21, v22, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v24;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v25, v26, v27, v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v91[2] = v30;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v31, v32, v33, v34, v35);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v91[3] = v36;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v37, (uint64_t)v91, 4, v38, v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = tan(a7);
  v42 = (void *)objc_opt_class();
  objc_msgSend_principalLinePointsForString_skipAmbiguousCharacters_strokes_strokePoints_orientation_medianFallbackThreshold_(v42, v43, (uint64_t)v81, v12, (uint64_t)v82, (uint64_t)a6, a7, a8);
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  v50 = (double *)MEMORY[0x1E0C9D538];
LABEL_2:
  if (v49 < objc_msgSend_count(v83, v44, v45, v46, v47, v48))
  {
    v86 = 0u;
    v87 = 0u;
    v84 = 0u;
    v85 = 0u;
    objc_msgSend_objectAtIndexedSubscript_(v83, v51, v49, v52, v53, v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v56, (uint64_t)&v84, (uint64_t)v90, 16, v57);
    if (!v58)
      goto LABEL_14;
    v59 = *(_QWORD *)v85;
    while (1)
    {
      for (i = 0; i != v58; ++i)
      {
        if (*(_QWORD *)v85 != v59)
          objc_enumerationMutation(v55);
        parseFloatsFromString(*(NSString **)(*((_QWORD *)&v84 + 1) + 8 * i), (char **)&v88);
        if ((char *)v89 - (char *)v88 == 8)
        {
          v65 = *v88;
          v66 = v88[1];
        }
        else
        {
          v65 = *v50;
          v66 = v50[1];
          if (!v88)
            goto LABEL_12;
        }
        v89 = v88;
        operator delete(v88);
LABEL_12:
        objc_msgSend_objectAtIndexedSubscript_(v40, v61, v49, v62, v63, v64);
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v68, v69, v70, v71, v72, v66 + v65 * v41);
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v67, v74, (uint64_t)v73, v75, v76, v77);

      }
      v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v78, (uint64_t)&v84, (uint64_t)v90, 16, v79);
      if (!v58)
      {
LABEL_14:

        ++v49;
        goto LABEL_2;
      }
    }
  }

  return v40;
}

+ (PrincipalLines)fixPrincipalLinesPosition:(SEL)a3 useAltString:(id)a4 skipAmbiguousCharacters:(BOOL)a5
{
  _BOOL8 v6;
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
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSCharacterSet *v22;
  const char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  long double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  double *v42;
  double v43;
  double v44;
  double v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
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
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  const char *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
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
  const char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  void *v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t i;
  void *v112;
  void *v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  void *v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  void *v123;
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
  void *v134;
  const char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  const char *v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  const char *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  char *v151;
  char *v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  void *v159;
  const char *v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  double v170;
  double v171;
  const char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  float v183;
  const char *v184;
  void *v185;
  char *v186;
  char *v187;
  void *v188;
  char *v189;
  void *v190;
  void *v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  const char *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  void *v205;
  const char *v206;
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
  const char *v219;
  uint64_t v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  const char *v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  const char *v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  void *v232;
  id v233;
  const char *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  void *v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  void *v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  void *v248;
  const char *v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  const char *v253;
  uint64_t v254;
  const char *v255;
  uint64_t v256;
  uint64_t v257;
  uint64_t v258;
  void *v259;
  const char *v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  float v265;
  float v266;
  const char *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  void *v271;
  const char *v272;
  uint64_t v273;
  uint64_t v274;
  uint64_t v275;
  uint64_t v276;
  float v277;
  float v278;
  const char *v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  void *v283;
  const char *v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  float v289;
  float v290;
  const char *v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  void *v295;
  const char *v296;
  uint64_t v297;
  uint64_t v298;
  uint64_t v299;
  uint64_t v300;
  float v301;
  float v302;
  const char *v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  const char *v308;
  uint64_t v309;
  uint64_t v310;
  uint64_t v311;
  uint64_t v312;
  double v313;
  double v314;
  void *v315;
  const char *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  float v321;
  float v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  void *v328;
  const char *v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  uint64_t v333;
  float v334;
  float v335;
  const char *v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  double v341;
  double v342;
  const char *v343;
  uint64_t v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  void *v348;
  const char *v349;
  uint64_t v350;
  uint64_t v351;
  uint64_t v352;
  uint64_t v353;
  float v354;
  float v355;
  const char *v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  void *v361;
  const char *v362;
  uint64_t v363;
  uint64_t v364;
  uint64_t v365;
  uint64_t v366;
  float v367;
  float v368;
  double v369;
  double v370;
  double v371;
  double v372;
  double v373;
  double v374;
  double *v375;
  double v376;
  double *v377;
  double v378;
  double v379;
  void *v380;
  double *v381;
  double v382;
  double *v383;
  double v384;
  void *v385;
  double *v386;
  double v387;
  double *v388;
  double v389;
  void *v390;
  double *v391;
  double v392;
  double *v393;
  double v394;
  void *v395;
  const char *v396;
  uint64_t v397;
  uint64_t v398;
  uint64_t v399;
  uint64_t v400;
  PrincipalLines *result;
  NSString *v402;
  id v403;
  _BOOL4 v405;
  void *v406;
  void *v407;
  void *v408;
  id obj;
  void *v410;
  void *v411;
  void *v412;
  uint64_t v413;
  void *__p;
  char *v415;
  void *v416;
  char *v417;
  void *v418;
  char *v419;
  void *v420;
  char *v421;
  _QWORD v422[4];
  id v423;
  __int128 v424;
  __int128 v425;
  __int128 v426;
  __int128 v427;
  void *v428[2];
  void *v429[2];
  __int128 v430;
  void *v431[2];
  void *v432[2];
  __int128 v433;
  _BYTE v434[128];
  uint64_t v435;

  v405 = a6;
  v6 = a5;
  v435 = *MEMORY[0x1E0C80C00];
  v403 = a4;
  v7 = (void *)objc_opt_class();
  objc_msgSend_string(v403, v8, v9, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForRendering_useAltChars_(v7, v14, (uint64_t)v13, v6, v15, v16);
  v402 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E0CB3500], v17, v18, v19, v20, v21);
  v22 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = isStringEntirelyFromSet(v402, v22);

  if ((_DWORD)v7)
  {
    if (v403)
    {
      objc_msgSend_principalLines(v403, v23, v24, v25, v26, v27);
    }
    else
    {
      *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
      *(_OWORD *)&retstr->top.__end_ = 0u;
      *(_OWORD *)&retstr->base.__end_ = 0u;
      *(_OWORD *)&retstr->median.__begin_ = 0u;
      *(_OWORD *)&retstr->descender.__begin_ = 0u;
      *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    }
    goto LABEL_79;
  }
  objc_msgSend_orientation(v403, v23, v24, v25, v26, v27);
  v34 = tan(v28);
  if (v403)
  {
    objc_msgSend_principalLines(v403, v29, v30, v31, v32, v33);
    objc_msgSend_points(v403, v35, v36, v37, v38, v39);
    v40 = v415 - (_BYTE *)__p;
    if (v415 != __p)
    {
      v41 = v40 >> 4;
      if ((unint64_t)(v40 >> 4) <= 1)
        v41 = 1;
      v42 = (double *)((char *)__p + 8);
      v43 = 1.79769313e308;
      v44 = -1.79769313e308;
      do
      {
        v45 = *v42 + *(v42 - 1) * v34;
        if (v45 <= v43)
          v43 = *v42 + *(v42 - 1) * v34;
        if (v45 >= v44)
          v44 = *v42 + *(v42 - 1) * v34;
        v42 += 2;
        --v41;
      }
      while (v41);
      goto LABEL_18;
    }
    v43 = 1.79769313e308;
    v44 = -1.79769313e308;
    if (v415)
    {
LABEL_18:
      v415 = (char *)__p;
      operator delete(__p);
    }
  }
  else
  {
    *(_OWORD *)v432 = 0u;
    v433 = 0u;
    v430 = 0u;
    *(_OWORD *)v431 = 0u;
    *(_OWORD *)v428 = 0u;
    *(_OWORD *)v429 = 0u;
    v43 = 1.79769313e308;
    v44 = -1.79769313e308;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v29, v30, v31, v32, v33);
  v408 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v46, v47, v48, v49, v50);
  v410 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v51, v52, v53, v54, v55);
  v406 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v56, v57, v58, v59, v60);
  v407 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v61, v62, v63, v64, v65, *((double *)v432[1] + 1) + *(double *)v432[1] * v34);
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v408, v67, (uint64_t)v66, v68, v69, v70);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v71, v72, v73, v74, v75, fmax(v43, *((double *)v431[0] + 1) + *(double *)v431[0] * v34));
  v76 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v410, v77, (uint64_t)v76, v78, v79, v80);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v81, v82, v83, v84, v85, fmin(v44, *((double *)v429[1] + 1) + *(double *)v429[1] * v34));
  v86 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v406, v87, (uint64_t)v86, v88, v89, v90);

  objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v91, v92, v93, v94, v95, *((double *)v428[0] + 1) + *(double *)v428[0] * v34);
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addObject_(v407, v97, (uint64_t)v96, v98, v99, v100);

  objc_msgSend_splitIntoTokens(v403, v101, v102, v103, v104, v105);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  v426 = 0u;
  v427 = 0u;
  v424 = 0u;
  v425 = 0u;
  obj = v106;
  v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v107, (uint64_t)&v424, (uint64_t)v434, 16, v108);
  if (v109)
  {
    v110 = *(_QWORD *)v425;
    do
    {
      for (i = 0; i != v109; ++i)
      {
        if (*(_QWORD *)v425 != v110)
          objc_enumerationMutation(obj);
        v112 = *(void **)(*((_QWORD *)&v424 + 1) + 8 * i);
        v113 = (void *)objc_opt_class();
        objc_msgSend_string(v112, v114, v115, v116, v117, v118);
        v119 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringForRendering_useAltChars_(v113, v120, (uint64_t)v119, v6, v121, v122);
        v123 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E0CB3500], v124, v125, v126, v127, v128);
        v129 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_indexesOfCharacters_(v123, v130, (uint64_t)v129, v131, v132, v133);
        v134 = (void *)objc_claimAutoreleasedReturnValue();
        v140 = objc_msgSend_count(v134, v135, v136, v137, v138, v139);
        LOBYTE(v140) = v140 == objc_msgSend_length(v123, v141, v142, v143, v144, v145);

        if ((v140 & 1) == 0 && v112)
        {
          objc_msgSend_points(v112, v146, v147, v148, v149, v150);
          v151 = (char *)__p;
          v152 = v415;
          if (__p)
          {
            v415 = (char *)__p;
            operator delete(__p);
          }
          if (v152 != v151)
          {
            v153 = (void *)objc_opt_class();
            objc_msgSend_textStrokes(v112, v154, v155, v156, v157, v158);
            v159 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_strokePoints(v112, v160, v161, v162, v163, v164);
            objc_msgSend_orientation(v112, v165, v166, v167, v168, v169);
            v171 = v170;
            objc_msgSend_firstObject(v410, v172, v173, v174, v175, v176);
            v177 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_floatValue(v177, v178, v179, v180, v181, v182);
            objc_msgSend_principalLineInterceptsForString_skipAmbiguousCharacters_strokes_strokePoints_orientation_medianFallbackThreshold_(v153, v184, (uint64_t)v123, v405, (uint64_t)v159, (uint64_t)&__p, v171, v183);
            v185 = (void *)objc_claimAutoreleasedReturnValue();

            v186 = (char *)__p;
            if (__p)
            {
              v187 = v415;
              v188 = __p;
              if (v415 != __p)
              {
                v189 = v415;
                do
                {
                  v191 = (void *)*((_QWORD *)v189 - 3);
                  v189 -= 24;
                  v190 = v191;
                  if (v191)
                  {
                    *((_QWORD *)v187 - 2) = v190;
                    operator delete(v190);
                  }
                  v187 = v189;
                }
                while (v189 != v186);
                v188 = __p;
              }
              v415 = v186;
              operator delete(v188);
            }

            objc_msgSend_objectAtIndexedSubscript_(v185, v192, 0, v193, v194, v195);
            v196 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v408, v197, (uint64_t)v196, v198, v199, v200);

            objc_msgSend_objectAtIndexedSubscript_(v185, v201, 1, v202, v203, v204);
            v205 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v410, v206, (uint64_t)v205, v207, v208, v209);

            objc_msgSend_objectAtIndexedSubscript_(v185, v210, 2, v211, v212, v213);
            v214 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v406, v215, (uint64_t)v214, v216, v217, v218);

            objc_msgSend_objectAtIndexedSubscript_(v185, v219, 3, v220, v221, v222);
            v223 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v407, v224, (uint64_t)v223, v225, v226, v227);

            objc_msgSend_objectAtIndexedSubscript_(v185, v228, 0, v229, v230, v231);
            v232 = (void *)objc_claimAutoreleasedReturnValue();
            v422[0] = MEMORY[0x1E0C809B0];
            v422[1] = 3221225472;
            v422[2] = sub_1BE7ABA90;
            v422[3] = &unk_1E77F4FC8;
            v233 = v410;
            v423 = v233;
            objc_msgSend_indexesOfObjectsPassingTest_(v232, v234, (uint64_t)v422, v235, v236, v237);
            v238 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend_objectAtIndexedSubscript_(v185, v239, 0, v240, v241, v242);
            v243 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectsAtIndexes_(v243, v244, (uint64_t)v238, v245, v246, v247);
            v248 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v233, v249, (uint64_t)v248, v250, v251, v252);

          }
        }

      }
      v109 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v253, (uint64_t)&v424, (uint64_t)v434, 16, v254);
    }
    while (v109);
  }

  objc_msgSend_valueForKeyPath_(v408, v255, (uint64_t)CFSTR("@avg.floatValue"), v256, v257, v258);
  v259 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v259, v260, v261, v262, v263, v264);
  v266 = v265;

  objc_msgSend_valueForKeyPath_(v410, v267, (uint64_t)CFSTR("@avg.floatValue"), v268, v269, v270);
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v271, v272, v273, v274, v275, v276);
  v278 = v277;

  objc_msgSend_valueForKeyPath_(v406, v279, (uint64_t)CFSTR("@avg.floatValue"), v280, v281, v282);
  v283 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v283, v284, v285, v286, v287, v288);
  v290 = v289;

  objc_msgSend_valueForKeyPath_(v407, v291, (uint64_t)CFSTR("@avg.floatValue"), v292, v293, v294);
  v295 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v295, v296, v297, v298, v299, v300);
  v302 = v301;

  v313 = v266;
  v314 = v278;
  if (objc_msgSend_count(v408, v303, v304, v305, v306, v307) == 1
    && (unint64_t)objc_msgSend_count(v410, v308, v309, v310, v311, v312) >= 2)
  {
    objc_msgSend_firstObject(v410, v308, v309, v310, v311, v312);
    v315 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v315, v316, v317, v318, v319, v320);
    v322 = v321;
    objc_msgSend_firstObject(v408, v323, v324, v325, v326, v327);
    v328 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v328, v329, v330, v331, v332, v333);
    v335 = v334;

    v313 = v314 - (float)(v322 - v335);
  }
  v341 = v290;
  v342 = v302;
  if (objc_msgSend_count(v407, v308, v309, v310, v311, v312) == 1
    && (unint64_t)objc_msgSend_count(v406, v336, v337, v338, v339, v340) >= 2)
  {
    objc_msgSend_firstObject(v407, v343, v344, v345, v346, v347);
    v348 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v348, v349, v350, v351, v352, v353);
    v355 = v354;
    objc_msgSend_firstObject(v406, v356, v357, v358, v359, v360);
    v361 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_floatValue(v361, v362, v363, v364, v365, v366);
    v368 = v367;

    v342 = v341 + (float)(v355 - v368);
  }
  v369 = (v341 - v314) * 0.5;
  if (v313 <= v314)
    v370 = v313;
  else
    v370 = v314 - v369;
  v371 = v369 + v341;
  if (v342 < v341)
    v342 = v371;
  v372 = vabdd_f64(v342, v370);
  v373 = vabdd_f64(v341, v314);
  if (v373 / v372 < 0.15)
  {
    v374 = -(v373 - v372 * 0.15) * 0.5;
    if (v290 > v278 || v34 == 0.0)
    {
      v341 = v374 + v341;
      v314 = v314 - v374;
    }
    else
    {
      v341 = v341 - v374;
      v314 = v374 + v314;
    }
  }
  *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->top.__end_ = 0u;
  *(_OWORD *)&retstr->base.__end_ = 0u;
  *(_OWORD *)&retstr->median.__begin_ = 0u;
  *(_OWORD *)&retstr->descender.__begin_ = 0u;
  *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
  v375 = (double *)v432[1];
  v376 = *(double *)v432[1];
  v377 = (double *)operator new(0x10uLL);
  v378 = -v34;
  *v377 = v376;
  v377[1] = v370 + v376 * v378;
  v379 = v375[2];
  v380 = operator new(0x20uLL);
  *((double *)v380 + 2) = v379;
  *((double *)v380 + 3) = v370 + v379 * v378;
  *(_OWORD *)v380 = *(_OWORD *)v377;
  operator delete(v377);
  sub_1BE6F5A88(&retstr->top.__begin_, (char *)v380, (char *)v380 + 32, 2uLL);
  v381 = (double *)v431[0];
  v382 = *(double *)v431[0];
  v383 = (double *)operator new(0x10uLL);
  *v383 = v382;
  v383[1] = v314 + v382 * v378;
  v384 = v381[2];
  v385 = operator new(0x20uLL);
  *((double *)v385 + 2) = v384;
  *((double *)v385 + 3) = v314 + v384 * v378;
  *(_OWORD *)v385 = *(_OWORD *)v383;
  operator delete(v383);
  sub_1BE6F5A88(&retstr->median.__begin_, (char *)v385, (char *)v385 + 32, 2uLL);
  v386 = (double *)v429[1];
  v387 = *(double *)v429[1];
  v388 = (double *)operator new(0x10uLL);
  *v388 = v387;
  v388[1] = v341 + v387 * v378;
  v389 = v386[2];
  v390 = operator new(0x20uLL);
  *((double *)v390 + 2) = v389;
  *((double *)v390 + 3) = v341 + v389 * v378;
  *(_OWORD *)v390 = *(_OWORD *)v388;
  operator delete(v388);
  sub_1BE6F5A88(&retstr->base.__begin_, (char *)v390, (char *)v390 + 32, 2uLL);
  v391 = (double *)v428[0];
  v392 = *(double *)v428[0];
  v393 = (double *)operator new(0x10uLL);
  *v393 = v392;
  v393[1] = v342 + v392 * v378;
  v394 = v391[2];
  v395 = operator new(0x20uLL);
  *((double *)v395 + 2) = v394;
  *((double *)v395 + 3) = v342 + v394 * v378;
  *(_OWORD *)v395 = *(_OWORD *)v393;
  operator delete(v393);
  sub_1BE6F5A88(retstr, (char *)v395, (char *)v395 + 32, 2uLL);
  if (v403)
  {
    objc_msgSend_points(v403, v396, v397, v398, v399, v400);
  }
  else
  {
    v411 = 0;
    v412 = 0;
    v413 = 0;
  }
  sub_1BE7FE3E0((double **)retstr, (double **)&v411, (uint64_t)&__p);
  if (&__p != (void **)retstr)
  {
    sub_1BE6F5A88(retstr, (char *)__p, v415, (v415 - (_BYTE *)__p) >> 4);
    sub_1BE6F5A88(&retstr->base.__begin_, (char *)v416, v417, (v417 - (_BYTE *)v416) >> 4);
    sub_1BE6F5A88(&retstr->median.__begin_, (char *)v418, v419, (v419 - (_BYTE *)v418) >> 4);
    sub_1BE6F5A88(&retstr->top.__begin_, (char *)v420, v421, (v421 - (_BYTE *)v420) >> 4);
  }
  if (v420)
  {
    v421 = (char *)v420;
    operator delete(v420);
  }
  if (v418)
  {
    v419 = (char *)v418;
    operator delete(v418);
  }
  if (v416)
  {
    v417 = (char *)v416;
    operator delete(v416);
  }
  if (__p)
  {
    v415 = (char *)__p;
    operator delete(__p);
  }
  if (v411)
  {
    v412 = v411;
    operator delete(v411);
  }
  operator delete(v395);
  operator delete(v390);
  operator delete(v385);
  operator delete(v380);

  if (v432[1])
  {
    *(void **)&v433 = v432[1];
    operator delete(v432[1]);
  }
  if (v431[0])
  {
    v431[1] = v431[0];
    operator delete(v431[0]);
  }
  if (v429[1])
  {
    *(void **)&v430 = v429[1];
    operator delete(v429[1]);
  }
  if (v428[0])
  {
    v428[1] = v428[0];
    operator delete(v428[0]);
  }
LABEL_79:

  return result;
}

+ (PrincipalLines)fixPrincipalLinesOrientation:(SEL)a3 useAltString:(id)a4 skipAmbiguousCharacters:(BOOL)a5
{
  void *v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSCharacterSet *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double v27;
  double v28;
  const char *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  long double v34;
  const char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  int64_t v56;
  uint64_t v57;
  double *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  CGPoint *begin;
  double y;
  double x;
  void *v67;
  const char *v68;
  uint64_t v69;
  unint64_t v70;
  unint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  uint64_t v75;
  uint64_t i;
  void *v77;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  void *v84;
  const char *v85;
  uint64_t v86;
  uint64_t v87;
  void *v88;
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
  void *v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
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
  const char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  void *v124;
  char *v125;
  _QWORD *v126;
  void *v127;
  char *v128;
  void *v129;
  void *v130;
  const char *v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  void *v135;
  const char *v136;
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
  const char *v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  const char *v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  void *v162;
  const char *v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  void *v167;
  const char *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  const char *v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  void *v177;
  const char *v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  const char *v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  void *v186;
  const char *v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  const char *v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  void *v196;
  const char *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  const char *v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  const char *v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t v210;
  BOOL v211;
  void *v212;
  const char *v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  _BOOL4 v218;
  const char *v219;
  uint64_t v220;
  const char *v221;
  uint64_t v222;
  uint64_t v223;
  uint64_t v224;
  uint64_t v225;
  const char *v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const char *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  int64_t v236;
  uint64_t v237;
  unint64_t v238;
  unint64_t v239;
  float64x2_t v240;
  float64x2_t *v241;
  uint64_t v242;
  float64x2_t *v243;
  uint64_t v244;
  float64x2_t v245;
  float64x2_t v246;
  float64x2_t v247;
  float64x2_t *v248;
  unint64_t v249;
  float64x2_t *v250;
  uint64_t v251;
  float64x2_t v252;
  float64x2_t v253;
  float64x2_t v254;
  float64x2_t v255;
  uint64_t v256;
  const char *v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  const char *v262;
  uint64_t v263;
  uint64_t v264;
  uint64_t v265;
  uint64_t v266;
  unint64_t v267;
  long double v268;
  int64_t v269;
  uint64_t v270;
  unint64_t v271;
  unint64_t v272;
  float64x2_t v273;
  float64x2_t *v274;
  uint64_t v275;
  float64x2_t *v276;
  uint64_t v277;
  float64x2_t v278;
  float64x2_t v279;
  float64x2_t v280;
  float64x2_t *v281;
  unint64_t v282;
  float64x2_t *v283;
  uint64_t v284;
  float64x2_t v285;
  float64x2_t v286;
  float64x2_t v287;
  float64x2_t v288;
  uint64_t v289;
  double v290;
  double v291;
  const char *v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  const char *v298;
  uint64_t v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  void *v304;
  const char *v305;
  uint64_t v306;
  PrincipalLines *v307;
  double v308;
  CGPoint *v309;
  vector<CGPoint, std::allocator<CGPoint>> *p_base;
  double v311;
  double v312;
  CHTransformedTextLine *v313;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  void *v319;
  const char *v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  const char *v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  void *v330;
  const char *v331;
  uint64_t v332;
  uint64_t v333;
  uint64_t v334;
  uint64_t v335;
  void *v336;
  const char *v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  __int128 v343;
  const char *v344;
  void *v345;
  char *v346;
  char *v347;
  void *v348;
  char *v349;
  void *v350;
  void *v351;
  void *v352;
  const char *v353;
  uint64_t v354;
  PrincipalLines *result;
  double __x;
  vector<CGPoint, std::allocator<CGPoint>> *p_median;
  double v358;
  NSString *v359;
  id v361;
  void *v362;
  _BOOL4 v363;
  void *v364;
  id obj;
  void *v366;
  _BOOL4 v367;
  _OWORD v368[3];
  void *v369[3];
  void *v370;
  void *v371;
  void *v372;
  void *v373;
  void *v374;
  void *v375;
  void *v376;
  char *v377;
  uint64_t v378;
  CGAffineTransform v379;
  void *__p[2];
  void *v381[2];
  __int128 v382;
  void *v383[2];
  void *v384[2];
  __int128 v385;
  CGAffineTransform v386;
  _QWORD v387[6];
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  _BYTE v392[128];
  uint64_t v393;

  v363 = a6;
  v367 = a5;
  v393 = *MEMORY[0x1E0C80C00];
  v361 = a4;
  v6 = (void *)objc_opt_class();
  objc_msgSend_string(v361, v7, v8, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringForRendering_useAltChars_(v6, v13, (uint64_t)v12, v367, v14, v15);
  v359 = (NSString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E0CB3500], v16, v17, v18, v19, v20);
  v21 = (NSCharacterSet *)objc_claimAutoreleasedReturnValue();
  LODWORD(v6) = isStringEntirelyFromSet(v359, v21);

  if ((_DWORD)v6)
  {
    if (v361)
    {
      objc_msgSend_principalLines(v361, v22, v23, v24, v25, v26);
    }
    else
    {
      *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
      *(_OWORD *)&retstr->top.__end_ = 0u;
      *(_OWORD *)&retstr->base.__end_ = 0u;
      *(_OWORD *)&retstr->median.__begin_ = 0u;
      *(_OWORD *)&retstr->descender.__begin_ = 0u;
      *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    }
    goto LABEL_169;
  }
  objc_msgSend_orientation(v361, v22, v23, v24, v25, v26);
  v28 = v27;
  objc_msgSend_orientation(v361, v29, v30, v31, v32, v33);
  v40 = tan(v34);
  if (v361)
  {
    objc_msgSend_principalLines(v361, v35, v36, v37, v38, v39);
  }
  else
  {
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v35, v36, v37, v38, v39);
  v362 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v41, v42, v43, v44, v45);
  v366 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v46, v47, v48, v49, v50);
  v364 = (void *)objc_claimAutoreleasedReturnValue();
  if (v361)
  {
    objc_msgSend_points(v361, v51, v52, v53, v54, v55);
    v56 = (char *)__p[1] - (char *)__p[0];
    if (__p[1] != __p[0])
    {
      v57 = v56 >> 4;
      if ((unint64_t)(v56 >> 4) <= 1)
        v57 = 1;
      v58 = (double *)((char *)__p[0] + 8);
      v59 = 0.0;
      v60 = 1.79769313e308;
      v61 = 0.0;
      do
      {
        v62 = *(v58 - 1);
        if (*v58 + v62 * v40 <= v60)
        {
          v61 = *(v58 - 1);
          v59 = *v58;
          v60 = *v58 + v62 * v40;
        }
        v58 += 2;
        --v57;
      }
      while (v57);
      goto LABEL_19;
    }
    v59 = 0.0;
    v61 = 0.0;
    v63 = 0.0;
    if (__p[1])
    {
LABEL_19:
      __p[1] = __p[0];
      operator delete(__p[0]);
      v63 = v61;
    }
  }
  else
  {
    v59 = 0.0;
    v63 = 0.0;
  }
  begin = retstr->median.__begin_;
  p_median = &retstr->median;
  x = begin->x;
  y = begin->y;
  objc_msgSend_splitIntoTokens(v361, v51, v52, v53, v54, v55);
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  v390 = 0u;
  v391 = 0u;
  v388 = 0u;
  v389 = 0u;
  obj = v67;
  v70 = 0;
  v71 = 0;
  v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v68, (uint64_t)&v388, (uint64_t)v392, 16, v69);
  if (!v72)
    goto LABEL_44;
  v73 = -v40;
  v74 = fmax(v59 + v63 * v40, y + x * v40);
  v75 = *(_QWORD *)v389;
  do
  {
    for (i = 0; i != v72; ++i)
    {
      if (*(_QWORD *)v389 != v75)
        objc_enumerationMutation(obj);
      v77 = *(void **)(*((_QWORD *)&v388 + 1) + 8 * i);
      v78 = (void *)objc_opt_class();
      objc_msgSend_string(v77, v79, v80, v81, v82, v83);
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_stringForRendering_useAltChars_(v78, v85, (uint64_t)v84, v367, v86, v87);
      v88 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E0CB3500], v89, v90, v91, v92, v93);
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_indexesOfCharacters_(v88, v95, (uint64_t)v94, v96, v97, v98);
      v99 = (void *)objc_claimAutoreleasedReturnValue();
      v105 = objc_msgSend_count(v99, v100, v101, v102, v103, v104);
      LOBYTE(v105) = v105 == objc_msgSend_length(v88, v106, v107, v108, v109, v110);

      if ((v105 & 1) == 0)
      {
        v111 = (void *)objc_opt_class();
        objc_msgSend_textStrokes(v77, v112, v113, v114, v115, v116);
        v122 = (void *)objc_claimAutoreleasedReturnValue();
        if (v77)
        {
          objc_msgSend_strokePoints(v77, v117, v118, v119, v120, v121);
        }
        else
        {
          __p[0] = 0;
          __p[1] = 0;
          v381[0] = 0;
        }
        objc_msgSend_orientation(v77, v117, v118, v119, v120, v121);
        objc_msgSend_principalLinePointsForString_skipAmbiguousCharacters_strokes_strokePoints_orientation_medianFallbackThreshold_(v111, v123, (uint64_t)v88, v363, (uint64_t)v122, (uint64_t)__p);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        v125 = (char *)__p[0];
        if (__p[0])
        {
          v126 = __p[1];
          v127 = __p[0];
          if (__p[1] != __p[0])
          {
            v128 = (char *)__p[1];
            do
            {
              v130 = (void *)*((_QWORD *)v128 - 3);
              v128 -= 24;
              v129 = v130;
              if (v130)
              {
                *(v126 - 2) = v129;
                operator delete(v129);
              }
              v126 = v128;
            }
            while (v128 != v125);
            v127 = __p[0];
          }
          __p[1] = v125;
          operator delete(v127);
        }

        objc_msgSend_objectAtIndexedSubscript_(v124, v131, 0, v132, v133, v134);
        v135 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v362, v136, (uint64_t)v135, v137, v138, v139);

        objc_msgSend_objectAtIndexedSubscript_(v124, v140, 1, v141, v142, v143);
        v144 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v366, v145, (uint64_t)v144, v146, v147, v148);

        objc_msgSend_objectAtIndexedSubscript_(v124, v149, 2, v150, v151, v152);
        v153 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v364, v154, (uint64_t)v153, v155, v156, v157);

        objc_msgSend_objectAtIndexedSubscript_(v124, v158, 0, v159, v160, v161);
        v162 = (void *)objc_claimAutoreleasedReturnValue();
        v387[0] = MEMORY[0x1E0C809B0];
        v387[1] = 3221225472;
        v387[2] = sub_1BE7ACC7C;
        v387[3] = &unk_1E77F4FE8;
        *(double *)&v387[4] = v73;
        *(double *)&v387[5] = v74;
        objc_msgSend_indexesOfObjectsPassingTest_(v162, v163, (uint64_t)v387, v164, v165, v166);
        v167 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_objectAtIndexedSubscript_(v124, v168, 0, v169, v170, v171);
        v172 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_objectsAtIndexes_(v172, v173, (uint64_t)v167, v174, v175, v176);
        v177 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObjectsFromArray_(v366, v178, (uint64_t)v177, v179, v180, v181);

        objc_msgSend_objectAtIndexedSubscript_(v124, v182, 0, v183, v184, v185);
        v186 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_count(v186, v187, v188, v189, v190, v191);

        objc_msgSend_objectAtIndexedSubscript_(v124, v192, 1, v193, v194, v195);
        v196 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend_count(v196, v197, v198, v199, v200, v201))
        {

          goto LABEL_40;
        }
        v211 = objc_msgSend_count(v167, v202, v203, v204, v205, v206) == 0;

        if (!v211)
LABEL_40:
          ++v71;
        objc_msgSend_objectAtIndexedSubscript_(v124, v207, 2, v208, v209, v210);
        v212 = (void *)objc_claimAutoreleasedReturnValue();
        v218 = objc_msgSend_count(v212, v213, v214, v215, v216, v217) != 0;

        v70 += v218;
      }

    }
    v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v219, (uint64_t)&v388, (uint64_t)v392, 16, v220);
  }
  while (v72);
LABEL_44:

  if (objc_msgSend_count(obj, v221, v222, v223, v224, v225) == 1
    && (unint64_t)objc_msgSend_count(v364, v226, v227, v228, v229, v230) > 2
    || (unint64_t)objc_msgSend_count(obj, v226, v227, v228, v229, v230) >= 2
    && (float)((float)v70 / (float)(unint64_t)objc_msgSend_count(obj, v231, v232, v233, v234, v235)) >= 0.75)
  {
    CoreHandwriting::getPointSetFromStrings(v364, __p);
    v236 = (char *)__p[1] - (char *)__p[0];
    v358 = 0.0;
    if ((void *)((char *)__p[1] - (char *)__p[0]) >= (void *)0x20)
    {
      if (__p[0] == __p[1])
      {
        *(double *)&v256 = NAN;
      }
      else
      {
        v237 = v236 >> 4;
        v238 = v236 - 16;
        v239 = (unint64_t)(v236 - 16) >> 4;
        v240 = 0uLL;
        v241 = (float64x2_t *)__p[0];
        if (v238 < 0x10)
          goto LABEL_172;
        v242 = (v239 + 1) & 0x1FFFFFFFFFFFFFFELL;
        v241 = (float64x2_t *)((char *)__p[0] + 16 * v242);
        v243 = (float64x2_t *)((char *)__p[0] + 16);
        v244 = v242;
        do
        {
          v240 = vaddq_f64(vaddq_f64(v240, v243[-1]), *v243);
          v243 += 2;
          v244 -= 2;
        }
        while (v244);
        if (v239 + 1 != v242)
        {
LABEL_172:
          do
          {
            v245 = *v241++;
            v240 = vaddq_f64(v240, v245);
          }
          while (v241 != __p[1]);
        }
        v246 = vdivq_f64(v240, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(unint64_t)v237), 0));
        v247 = 0uLL;
        v248 = (float64x2_t *)__p[0];
        if (v238 < 0x10)
          goto LABEL_173;
        v249 = v239 + 1;
        v248 = (float64x2_t *)((char *)__p[0] + 16 * (v249 & 0x1FFFFFFFFFFFFFFELL));
        v250 = (float64x2_t *)((char *)__p[0] + 16);
        v251 = v249 & 0x1FFFFFFFFFFFFFFELL;
        do
        {
          v252 = vsubq_f64(v250[-1], v246);
          v253 = vsubq_f64(*v250, v246);
          v247 = vaddq_f64(vaddq_f64(v247, vmulq_n_f64(v252, v252.f64[0])), vmulq_n_f64(v253, v253.f64[0]));
          v250 += 2;
          v251 -= 2;
        }
        while (v251);
        if (v249 != (v249 & 0x1FFFFFFFFFFFFFFELL))
        {
LABEL_173:
          do
          {
            v254 = *v248++;
            v255 = vsubq_f64(v254, v246);
            v247 = vmlaq_n_f64(v247, v255, v255.f64[0]);
          }
          while (v248 != __p[1]);
        }
        v256 = *(_OWORD *)&vdivq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v247, 1), v247);
      }
      v358 = *(double *)&v256;
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
  }
  else
  {
    v358 = 1.79769313e308;
  }
  if (objc_msgSend_count(obj, v231, v232, v233, v234, v235) == 1
    && (unint64_t)objc_msgSend_count(v366, v257, v258, v259, v260, v261) > 2
    || (unint64_t)objc_msgSend_count(obj, v257, v258, v259, v260, v261) >= 2
    && (float)((float)v71 / (float)(unint64_t)objc_msgSend_count(obj, v262, v263, v264, v265, v266)) >= 0.75)
  {
    CoreHandwriting::getPointSetFromStrings(v366, __p);
    v269 = (char *)__p[1] - (char *)__p[0];
    __x = 0.0;
    if ((void *)((char *)__p[1] - (char *)__p[0]) >= (void *)0x20)
    {
      if (__p[0] == __p[1])
      {
        *(double *)&v289 = NAN;
      }
      else
      {
        v270 = v269 >> 4;
        v271 = v269 - 16;
        v272 = (unint64_t)(v269 - 16) >> 4;
        v273 = 0uLL;
        v274 = (float64x2_t *)__p[0];
        if (v271 < 0x10)
          goto LABEL_174;
        v275 = (v272 + 1) & 0x1FFFFFFFFFFFFFFELL;
        v274 = (float64x2_t *)((char *)__p[0] + 16 * v275);
        v276 = (float64x2_t *)((char *)__p[0] + 16);
        v277 = v275;
        do
        {
          v273 = vaddq_f64(vaddq_f64(v273, v276[-1]), *v276);
          v276 += 2;
          v277 -= 2;
        }
        while (v277);
        if (v272 + 1 != v275)
        {
LABEL_174:
          do
          {
            v278 = *v274++;
            v273 = vaddq_f64(v273, v278);
          }
          while (v274 != __p[1]);
        }
        v279 = vdivq_f64(v273, (float64x2_t)vdupq_lane_s64(COERCE__INT64((double)(unint64_t)v270), 0));
        v280 = 0uLL;
        v281 = (float64x2_t *)__p[0];
        if (v271 < 0x10)
          goto LABEL_175;
        v282 = v272 + 1;
        v281 = (float64x2_t *)((char *)__p[0] + 16 * (v282 & 0x1FFFFFFFFFFFFFFELL));
        v283 = (float64x2_t *)((char *)__p[0] + 16);
        v284 = v282 & 0x1FFFFFFFFFFFFFFELL;
        do
        {
          v285 = vsubq_f64(v283[-1], v279);
          v286 = vsubq_f64(*v283, v279);
          v280 = vaddq_f64(vaddq_f64(v280, vmulq_n_f64(v285, v285.f64[0])), vmulq_n_f64(v286, v286.f64[0]));
          v283 += 2;
          v284 -= 2;
        }
        while (v284);
        if (v282 != (v282 & 0x1FFFFFFFFFFFFFFELL))
        {
LABEL_175:
          do
          {
            v287 = *v281++;
            v288 = vsubq_f64(v287, v279);
            v280 = vmlaq_n_f64(v280, v288, v288.f64[0]);
          }
          while (v281 != __p[1]);
        }
        v289 = *(_OWORD *)&vdivq_f64((float64x2_t)vdupq_laneq_s64((int64x2_t)v280, 1), v280);
      }
      __x = *(double *)&v289;
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v358 == 1.79769313e308 || __x == 1.79769313e308)
    {
      if (__x == 1.79769313e308)
        goto LABEL_70;
      v267 = objc_msgSend_count(v366, v262, v263, v264, v265, v266, 1.79769313e308, __x);
      v268 = __x;
LABEL_97:
      v290 = -atan(v268);
      if (vabdd_f64(v290, v28) <= 0.1)
        goto LABEL_100;
    }
    else
    {
      v291 = atan((v358 + __x) * 0.5);
      v297 = objc_msgSend_count(v364, v292, v293, v294, v295, v296);
      v303 = objc_msgSend_count(v366, v298, v299, v300, v301, v302);
      v290 = -v291;
      v267 = (unint64_t)fmax((double)(unint64_t)v297, (double)(unint64_t)v303);
      if (vabdd_f64(-v291, v28) <= 0.1)
        goto LABEL_100;
    }
  }
  else
  {
LABEL_70:
    if (v358 != 1.79769313e308)
    {
      v267 = objc_msgSend_count(v364, v262, v263, v264, v265, v266, 1.79769313e308, v358);
      v268 = v358;
      goto LABEL_97;
    }
    v267 = 0;
    v290 = v28;
    if (vabdd_f64(v28, v28) <= 0.1)
    {
LABEL_100:
      v304 = (void *)objc_opt_class();
      if (v304)
      {
        objc_msgSend_fixPrincipalLinesPosition_useAltString_skipAmbiguousCharacters_(v304, v305, (uint64_t)v361, v367, v363, v306);
        v307 = retstr;
        if (__p == (void **)retstr)
        {
LABEL_105:
          if (v384[1])
          {
            *(void **)&v385 = v384[1];
            operator delete(v384[1]);
          }
          if (v383[0])
          {
            v383[1] = v383[0];
            operator delete(v383[0]);
          }
          if (v381[1])
          {
            *(void **)&v382 = v381[1];
            operator delete(v381[1]);
          }
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          goto LABEL_168;
        }
      }
      else
      {
        *(_OWORD *)v384 = 0u;
        v385 = 0u;
        v382 = 0u;
        *(_OWORD *)v383 = 0u;
        *(_OWORD *)__p = 0u;
        *(_OWORD *)v381 = 0u;
        v307 = retstr;
        if (__p == (void **)retstr)
          goto LABEL_105;
      }
      sub_1BE6F5A88(v307, (char *)__p[0], (char *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
      sub_1BE6F5A88(&v307->base.__begin_, (char *)v381[1], (char *)v382, (uint64_t)(v382 - (unint64_t)v381[1]) >> 4);
      sub_1BE6F5A88(p_median, (char *)v383[0], (char *)v383[1], ((char *)v383[1] - (char *)v383[0]) >> 4);
      sub_1BE6F5A88(&v307->top.__begin_, (char *)v384[1], (char *)v385, (uint64_t)(v385 - (unint64_t)v384[1]) >> 4);
      goto LABEL_105;
    }
  }
  if (fabs(v290) >= fabs(v28) && v267 < 4)
    goto LABEL_100;
  v308 = v290 - v28;
  p_base = &retstr->base;
  v309 = retstr->base.__begin_;
  v311 = v309->x;
  v312 = v309->y;
  memset(&v386, 0, sizeof(v386));
  CGAffineTransformMakeRotation(&v386, -v308);
  CoreHandwriting::transformPrincipalLines((double **)retstr, (float64x2_t *)&v386, (uint64_t)__p);
  if (__p != (void **)retstr)
  {
    sub_1BE6F5A88(retstr, (char *)__p[0], (char *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
    sub_1BE6F5A88(p_base, (char *)v381[1], (char *)v382, (uint64_t)(v382 - (unint64_t)v381[1]) >> 4);
    sub_1BE6F5A88(p_median, (char *)v383[0], (char *)v383[1], ((char *)v383[1] - (char *)v383[0]) >> 4);
    sub_1BE6F5A88(&retstr->top.__begin_, (char *)v384[1], (char *)v385, (uint64_t)(v385 - (unint64_t)v384[1]) >> 4);
  }
  if (v384[1])
  {
    *(void **)&v385 = v384[1];
    operator delete(v384[1]);
  }
  if (v383[0])
  {
    v383[1] = v383[0];
    operator delete(v383[0]);
  }
  if (v381[1])
  {
    *(void **)&v382 = v381[1];
    operator delete(v381[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  memset(&v379, 0, sizeof(v379));
  CGAffineTransformMakeTranslation(&v379, v311 - retstr->base.__begin_->x, v312 - retstr->base.__begin_->y);
  CoreHandwriting::transformPrincipalLines((double **)retstr, (float64x2_t *)&v379, (uint64_t)__p);
  if (__p != (void **)retstr)
  {
    sub_1BE6F5A88(retstr, (char *)__p[0], (char *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
    sub_1BE6F5A88(p_base, (char *)v381[1], (char *)v382, (uint64_t)(v382 - (unint64_t)v381[1]) >> 4);
    sub_1BE6F5A88(p_median, (char *)v383[0], (char *)v383[1], ((char *)v383[1] - (char *)v383[0]) >> 4);
    sub_1BE6F5A88(&retstr->top.__begin_, (char *)v384[1], (char *)v385, (uint64_t)(v385 - (unint64_t)v384[1]) >> 4);
  }
  if (v384[1])
  {
    *(void **)&v385 = v384[1];
    operator delete(v384[1]);
  }
  if (v383[0])
  {
    v383[1] = v383[0];
    operator delete(v383[0]);
  }
  if (v381[1])
  {
    *(void **)&v382 = v381[1];
    operator delete(v381[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }
  v313 = [CHTransformedTextLine alloc];
  objc_msgSend_textStrokes(v361, v314, v315, v316, v317, v318);
  v319 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_tokens(v361, v320, v321, v322, v323, v324);
  v330 = (void *)objc_claimAutoreleasedReturnValue();
  if (v361)
  {
    objc_msgSend_points(v361, v325, v326, v327, v328, v329);
    objc_msgSend_strokePoints(v361, v331, v332, v333, v334, v335);
  }
  else
  {
    __p[0] = 0;
    __p[1] = 0;
    v381[0] = 0;
    v376 = 0;
    v377 = 0;
    v378 = 0;
  }
  objc_msgSend_locale(v361, v325, v326, v327, v328, v329);
  v336 = (void *)objc_claimAutoreleasedReturnValue();
  v342 = objc_msgSend_strokeClassification(v361, v337, v338, v339, v340, v341);
  sub_1BE76136C(v369, (uint64_t)retstr);
  v343 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v368[0] = *MEMORY[0x1E0C9BAA8];
  v368[1] = v343;
  v368[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v345 = (void *)objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v313, v344, (uint64_t)v319, (uint64_t)v330, (uint64_t)__p, (uint64_t)&v376, v336, v342, v369, v368);
  if (v374)
  {
    v375 = v374;
    operator delete(v374);
  }
  if (v372)
  {
    v373 = v372;
    operator delete(v372);
  }
  if (v370)
  {
    v371 = v370;
    operator delete(v370);
  }
  if (v369[0])
  {
    v369[1] = v369[0];
    operator delete(v369[0]);
  }

  v346 = (char *)v376;
  if (v376)
  {
    v347 = v377;
    v348 = v376;
    if (v377 != v376)
    {
      v349 = v377;
      do
      {
        v351 = (void *)*((_QWORD *)v349 - 3);
        v349 -= 24;
        v350 = v351;
        if (v351)
        {
          *((_QWORD *)v347 - 2) = v350;
          operator delete(v350);
        }
        v347 = v349;
      }
      while (v349 != v346);
      v348 = v376;
    }
    v377 = v346;
    operator delete(v348);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

  v352 = (void *)objc_opt_class();
  if (v352)
  {
    objc_msgSend_fixPrincipalLinesPosition_useAltString_skipAmbiguousCharacters_(v352, v353, (uint64_t)v345, v367, v363, v354);
    if (__p == (void **)retstr)
      goto LABEL_159;
LABEL_158:
    sub_1BE6F5A88(retstr, (char *)__p[0], (char *)__p[1], ((char *)__p[1] - (char *)__p[0]) >> 4);
    sub_1BE6F5A88(p_base, (char *)v381[1], (char *)v382, (uint64_t)(v382 - (unint64_t)v381[1]) >> 4);
    sub_1BE6F5A88(p_median, (char *)v383[0], (char *)v383[1], ((char *)v383[1] - (char *)v383[0]) >> 4);
    sub_1BE6F5A88(&retstr->top.__begin_, (char *)v384[1], (char *)v385, (uint64_t)(v385 - (unint64_t)v384[1]) >> 4);
  }
  else
  {
    *(_OWORD *)v384 = 0u;
    v385 = 0u;
    v382 = 0u;
    *(_OWORD *)v383 = 0u;
    *(_OWORD *)__p = 0u;
    *(_OWORD *)v381 = 0u;
    if (__p != (void **)retstr)
      goto LABEL_158;
  }
LABEL_159:
  if (v384[1])
  {
    *(void **)&v385 = v384[1];
    operator delete(v384[1]);
  }
  if (v383[0])
  {
    v383[1] = v383[0];
    operator delete(v383[0]);
  }
  if (v381[1])
  {
    *(void **)&v382 = v381[1];
    operator delete(v381[1]);
  }
  if (__p[0])
  {
    __p[1] = __p[0];
    operator delete(__p[0]);
  }

LABEL_168:
LABEL_169:

  return result;
}

+ (PrincipalLines)principalLinesFromTokens:(SEL)a3 strokes:(id)a4 strokePoints:(id)a5 orientation:(const void *)a6 useAltString:(double)a7
{
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double *v24;
  double v25;
  double v26;
  unint64_t v27;
  double *v28;
  double v29;
  double v30;
  double v31;
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
  const char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t i;
  void *v52;
  void *v53;
  const char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  const char *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  const char *v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  void *v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  const char *v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  void *v107;
  const char *v108;
  void *v109;
  const char *v110;
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
  void *v123;
  const char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  const char *v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  void *v132;
  const char *v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  void *v141;
  const char *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char *v146;
  char *v147;
  void *v148;
  char *v149;
  void *v150;
  void *v151;
  const char *v152;
  uint64_t v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  const char *v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  void *v164;
  const char *v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
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
  const char *v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  void *v193;
  const char *v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  void *v198;
  const char *v199;
  uint64_t v200;
  uint64_t v201;
  uint64_t v202;
  uint64_t v203;
  float v204;
  float v205;
  const char *v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  void *v210;
  const char *v211;
  uint64_t v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  float v216;
  float v217;
  const char *v218;
  uint64_t v219;
  uint64_t v220;
  uint64_t v221;
  void *v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  float v228;
  float v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  void *v234;
  const char *v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  float v240;
  float v241;
  double v242;
  double v243;
  double *v244;
  double *v245;
  double v246;
  double v247;
  double v248;
  void *v249;
  double *v250;
  void *v251;
  double *v252;
  void *v253;
  double *v254;
  void *v255;
  PrincipalLines *result;
  double v257;
  id v258;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  id v264;
  uint64_t *v265;
  id obj;
  _BOOL4 v267;
  void *v268;
  char *v269;
  uint64_t v270;
  void *v271;
  char *v272;
  void *v273;
  void *__p;
  char *v275;
  uint64_t v276;
  void *v277;
  char *v278;
  _QWORD v279[7];
  uint64_t v280;
  uint64_t *v281;
  uint64_t v282;
  uint64_t v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  __int128 v287;
  void *v288;
  int v289[2];
  uint64_t v290;
  _BYTE v291[128];
  uint64_t v292;

  v267 = a8;
  v292 = *MEMORY[0x1E0C80C00];
  v258 = a4;
  v264 = a5;
  v16 = tan(a7);
  v288 = 0;
  *(_QWORD *)v289 = 0;
  v290 = 0;
  v17 = *(_QWORD *)a6;
  v265 = (uint64_t *)a6;
  if (*((_QWORD *)a6 + 1) == *(_QWORD *)a6)
    goto LABEL_21;
  v18 = 0;
  v19 = 0;
  do
  {
    sub_1BE7B2240((uint64_t)&v288, *(uint64_t *)v289, *(char **)(v17 + v18), *(char **)(v17 + v18 + 8), (uint64_t)(*(_QWORD *)(v17 + v18 + 8) - *(_QWORD *)(v17 + v18)) >> 4);
    ++v19;
    v17 = *v265;
    v18 += 24;
  }
  while (v19 < 0xAAAAAAAAAAAAAAABLL * ((v265[1] - *v265) >> 3));
  if (v288 == *(void **)v289)
  {
LABEL_21:
    v21 = -1.79769313e308;
    v20 = 1.79769313e308;
    v29 = 1.79769313e308;
    v30 = -1.79769313e308;
  }
  else
  {
    v20 = 1.79769313e308;
    v21 = -1.79769313e308;
    v22 = -1.79769313e308;
    v23 = 1.79769313e308;
    v24 = (double *)v288;
    do
    {
      v25 = *v24;
      v24 += 2;
      v26 = v25;
      if (v23 > v25)
      {
        v20 = v26;
        v23 = v26;
      }
      if (v22 < v26)
      {
        v21 = v26;
        v22 = v26;
      }
    }
    while (v24 != *(double **)v289);
    if (v288 == *(void **)v289)
    {
      v30 = -1.79769313e308;
      v29 = 1.79769313e308;
    }
    else
    {
      v27 = (uint64_t)(*(_QWORD *)v289 - (_QWORD)v288) >> 4;
      if (v27 <= 1)
        v27 = 1;
      v28 = (double *)((char *)v288 + 8);
      v29 = 1.79769313e308;
      v30 = -1.79769313e308;
      do
      {
        v31 = *v28 + *(v28 - 1) * v16;
        if (v31 <= v29)
          v29 = *v28 + *(v28 - 1) * v16;
        if (v31 >= v30)
          v30 = *v28 + *(v28 - 1) * v16;
        v28 += 2;
        --v27;
      }
      while (v27);
    }
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v11, v12, v13, v14, v15);
  v263 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v32, v33, v34, v35, v36);
  v261 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v37, v38, v39, v40, v41);
  v260 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v42, v43, v44, v45, v46);
  v262 = (void *)objc_claimAutoreleasedReturnValue();
  v286 = 0u;
  v287 = 0u;
  v284 = 0u;
  v285 = 0u;
  obj = v258;
  v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v47, (uint64_t)&v284, (uint64_t)v291, 16, v48);
  if (v49)
  {
    v50 = *(_QWORD *)v285;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v285 != v50)
          objc_enumerationMutation(obj);
        v52 = *(void **)(*((_QWORD *)&v284 + 1) + 8 * i);
        v53 = (void *)objc_opt_class();
        objc_msgSend_string(v52, v54, v55, v56, v57, v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringForRendering_useAltChars_(v53, v60, (uint64_t)v59, v267, v61, v62);
        v63 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E0CB3500], v64, v65, v66, v67, v68);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_indexesOfCharacters_(v63, v70, (uint64_t)v69, v71, v72, v73);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        v80 = objc_msgSend_count(v74, v75, v76, v77, v78, v79);
        LOBYTE(v80) = v80 == objc_msgSend_length(v63, v81, v82, v83, v84, v85);

        if ((v80 & 1) == 0)
        {
          objc_msgSend_strokeIndexes(v52, v86, v87, v88, v89, v90);
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_objectsAtIndexes_(v264, v92, (uint64_t)v91, v93, v94, v95);
          v96 = (void *)objc_claimAutoreleasedReturnValue();

          v268 = 0;
          v269 = (char *)&v268;
          v270 = 0x4812000000;
          v271 = sub_1BE7AD8E4;
          v272 = (char *)sub_1BE7AD908;
          v273 = &unk_1BE94989A;
          v275 = 0;
          v276 = 0;
          __p = 0;
          v280 = 0;
          v281 = &v280;
          v282 = 0x2020000000;
          v283 = 0;
          objc_msgSend_strokeIndexes(v52, v97, v98, v99, v100, v101);
          v102 = (void *)objc_claimAutoreleasedReturnValue();
          v279[0] = MEMORY[0x1E0C809B0];
          v279[1] = 3221225472;
          v279[2] = sub_1BE7AD984;
          v279[3] = &unk_1E77F5010;
          v279[5] = &v280;
          v279[6] = v265;
          v279[4] = &v268;
          objc_msgSend_enumerateIndexesUsingBlock_(v102, v103, (uint64_t)v279, v104, v105, v106);

          if (v281[3])
          {
            v107 = (void *)objc_opt_class();
            objc_msgSend_principalLineInterceptsForString_skipAmbiguousCharacters_strokes_strokePoints_orientation_medianFallbackThreshold_(v107, v108, (uint64_t)v63, 1, (uint64_t)v96, (uint64_t)(v269 + 48), a7, 0.0);
            v109 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_objectAtIndexedSubscript_(v109, v110, 0, v111, v112, v113);
            v114 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v263, v115, (uint64_t)v114, v116, v117, v118);

            objc_msgSend_objectAtIndexedSubscript_(v109, v119, 1, v120, v121, v122);
            v123 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v261, v124, (uint64_t)v123, v125, v126, v127);

            objc_msgSend_objectAtIndexedSubscript_(v109, v128, 2, v129, v130, v131);
            v132 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v260, v133, (uint64_t)v132, v134, v135, v136);

            objc_msgSend_objectAtIndexedSubscript_(v109, v137, 3, v138, v139, v140);
            v141 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_addObjectsFromArray_(v262, v142, (uint64_t)v141, v143, v144, v145);

          }
          _Block_object_dispose(&v280, 8);
          _Block_object_dispose(&v268, 8);
          v146 = (char *)__p;
          if (__p)
          {
            v147 = v275;
            v148 = __p;
            if (v275 != __p)
            {
              v149 = v275;
              do
              {
                v151 = (void *)*((_QWORD *)v149 - 3);
                v149 -= 24;
                v150 = v151;
                if (v151)
                {
                  *((_QWORD *)v147 - 2) = v150;
                  operator delete(v150);
                }
                v147 = v149;
              }
              while (v149 != v146);
              v148 = __p;
            }
            v275 = v146;
            operator delete(v148);
          }

        }
      }
      v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v152, (uint64_t)&v284, (uint64_t)v291, 16, v153);
    }
    while (v49);
  }

  if (!objc_msgSend_count(v263, v154, v155, v156, v157, v158))
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v159, v160, v161, v162, v163, v29);
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v263, v165, (uint64_t)v164, v166, v167, v168);

  }
  if (!objc_msgSend_count(v261, v159, v160, v161, v162, v163, *(_QWORD *)&v16))
  {
    objc_msgSend_valueForKeyPath_(v263, v169, (uint64_t)CFSTR("@max.floatValue"), v171, v172, v173);
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v261, v175, (uint64_t)v174, v176, v177, v178);

  }
  if (!objc_msgSend_count(v262, v169, v170, v171, v172, v173))
  {
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v179, v180, v181, v182, v183, v30);
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v262, v185, (uint64_t)v184, v186, v187, v188);

  }
  if (!objc_msgSend_count(v260, v179, v180, v181, v182, v183))
  {
    objc_msgSend_valueForKeyPath_(v262, v189, (uint64_t)CFSTR("@min.floatValue"), v190, v191, v192);
    v193 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v260, v194, (uint64_t)v193, v195, v196, v197);

  }
  objc_msgSend_valueForKeyPath_(v263, v189, (uint64_t)CFSTR("@avg.floatValue"), v190, v191, v192);
  v198 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v198, v199, v200, v201, v202, v203);
  v205 = v204;

  objc_msgSend_valueForKeyPath_(v261, v206, (uint64_t)CFSTR("@avg.floatValue"), v207, v208, v209);
  v210 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v210, v211, v212, v213, v214, v215);
  v217 = v216;

  objc_msgSend_valueForKeyPath_(v260, v218, (uint64_t)CFSTR("@avg.floatValue"), v219, v220, v221);
  v222 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v222, v223, v224, v225, v226, v227);
  v229 = v228;

  objc_msgSend_valueForKeyPath_(v262, v230, (uint64_t)CFSTR("@avg.floatValue"), v231, v232, v233);
  v234 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_floatValue(v234, v235, v236, v237, v238, v239);
  v241 = v240;

  v242 = v229;
  *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
  *(_OWORD *)&retstr->top.__end_ = 0u;
  if (v241 >= v229)
    v243 = v241;
  else
    v243 = v229;
  *(_OWORD *)&retstr->base.__end_ = 0uLL;
  *(_OWORD *)&retstr->median.__begin_ = 0uLL;
  *(_OWORD *)&retstr->descender.__begin_ = 0uLL;
  *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0uLL;
  v244 = (double *)operator new(0x10uLL);
  v245 = v244;
  v246 = -v257;
  v247 = v217;
  if (v205 <= v217)
    v248 = v205;
  else
    v248 = v217;
  *v244 = v20;
  v244[1] = v248 + v20 * v246;
  v249 = operator new(0x20uLL);
  *((double *)v249 + 2) = v21;
  *((double *)v249 + 3) = v248 + v21 * v246;
  *(_OWORD *)v249 = *(_OWORD *)v245;
  operator delete(v245);
  sub_1BE6F5A88(&retstr->top.__begin_, (char *)v249, (char *)v249 + 32, 2uLL);
  v250 = (double *)operator new(0x10uLL);
  *v250 = v20;
  v250[1] = v247 + v20 * v246;
  v251 = operator new(0x20uLL);
  *((double *)v251 + 2) = v21;
  *((double *)v251 + 3) = v247 + v21 * v246;
  *(_OWORD *)v251 = *(_OWORD *)v250;
  operator delete(v250);
  sub_1BE6F5A88(&retstr->median.__begin_, (char *)v251, (char *)v251 + 32, 2uLL);
  v252 = (double *)operator new(0x10uLL);
  *v252 = v20;
  v252[1] = v242 + v20 * v246;
  v253 = operator new(0x20uLL);
  *((double *)v253 + 2) = v21;
  *((double *)v253 + 3) = v242 + v21 * v246;
  *(_OWORD *)v253 = *(_OWORD *)v252;
  operator delete(v252);
  sub_1BE6F5A88(&retstr->base.__begin_, (char *)v253, (char *)v253 + 32, 2uLL);
  v254 = (double *)operator new(0x10uLL);
  *v254 = v20;
  v254[1] = v243 + v20 * v246;
  v255 = operator new(0x20uLL);
  *((double *)v255 + 2) = v21;
  *((double *)v255 + 3) = v243 + v21 * v246;
  *(_OWORD *)v255 = *(_OWORD *)v254;
  operator delete(v254);
  sub_1BE6F5A88(retstr, (char *)v255, (char *)v255 + 32, 2uLL);
  sub_1BE7FE3E0((double **)retstr, (double **)&v288, (uint64_t)&v268);
  if (&v268 != (void **)retstr)
  {
    sub_1BE6F5A88(retstr, (char *)v268, v269, (v269 - (_BYTE *)v268) >> 4);
    sub_1BE6F5A88(&retstr->base.__begin_, (char *)v271, v272, (v272 - (_BYTE *)v271) >> 4);
    sub_1BE6F5A88(&retstr->median.__begin_, (char *)__p, v275, (v275 - (_BYTE *)__p) >> 4);
    sub_1BE6F5A88(&retstr->top.__begin_, (char *)v277, v278, (v278 - (_BYTE *)v277) >> 4);
  }
  if (v277)
  {
    v278 = (char *)v277;
    operator delete(v277);
  }
  if (__p)
  {
    v275 = (char *)__p;
    operator delete(__p);
  }
  if (v271)
  {
    v272 = (char *)v271;
    operator delete(v271);
  }
  if (v268)
  {
    v269 = (char *)v268;
    operator delete(v268);
  }
  operator delete(v255);
  operator delete(v253);
  operator delete(v251);
  operator delete(v249);

  if (v288)
  {
    *(_QWORD *)v289 = v288;
    operator delete(v288);
  }

  return result;
}

+ (PrincipalLines)flipPrincipalLine:(SEL)a3 points:(PrincipalLines *)a4 string:(const void *)a5 outWasFlipped:(id)a6
{
  id v11;
  CGPoint *begin;
  double y;
  double v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int hasAscender;
  void *v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  int hasDescender;
  double v27;
  double v28;
  double *v29;
  double *v30;
  unint64_t v31;
  double *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double *v51;
  double *v52;
  double v53;
  double v54;
  void *v55;
  double *v56;
  double v57;
  void *v58;
  double *v59;
  void *v60;
  double *v61;
  double v62;
  void *v63;
  BOOL v64;
  PrincipalLines *result;
  PrincipalLines *v66;
  double **v67;
  double v68;
  double v69;
  void *v70;
  char *v71;
  void *v72;
  char *v73;
  void *v74;
  char *v75;
  void *__p;
  char *v77;
  void *v78[2];
  void *v79[2];
  __int128 v80;
  void *v81[2];
  void *v82[2];
  __int128 v83;

  v11 = a6;
  begin = a4->base.__begin_;
  y = begin->y;
  v14 = atan2(begin[1].y - y, begin[1].x - begin->x);
  if (v14 <= 2.2 && y >= a4->median.__begin_->y)
  {
    v64 = 0;
    if (!a7)
      goto LABEL_58;
    goto LABEL_57;
  }
  v15 = (void *)objc_opt_class();
  hasAscender = objc_msgSend_hasAscender_(v15, v16, (uint64_t)v11, v17, v18, v19);
  v21 = (void *)objc_opt_class();
  hasDescender = objc_msgSend_hasDescender_(v21, v22, (uint64_t)v11, v23, v24, v25);
  v27 = v14 + -3.1415;
  if (v14 <= 2.2)
    v27 = v14;
  v28 = tan(v27);
  v30 = *(double **)a5;
  v29 = (double *)*((_QWORD *)a5 + 1);
  v67 = (double **)a5;
  if (v29 == *(double **)a5)
  {
    v34 = -1.79769313e308;
    v33 = 1.79769313e308;
  }
  else
  {
    v31 = ((uint64_t)v29 - *(_QWORD *)a5) >> 4;
    if (v31 <= 1)
      v31 = 1;
    v32 = v30 + 1;
    v33 = 1.79769313e308;
    v34 = -1.79769313e308;
    do
    {
      v35 = *v32 - *(v32 - 1) * v28;
      if (v35 <= v33)
        v33 = *v32 - *(v32 - 1) * v28;
      if (v35 >= v34)
        v34 = *v32 - *(v32 - 1) * v28;
      v32 += 2;
      --v31;
    }
    while (v31);
  }
  v36 = a4->top.__begin_->y - a4->top.__begin_->x * v28;
  v37 = a4->median.__begin_->y - a4->median.__begin_->x * v28;
  v38 = a4->base.__begin_->y - a4->base.__begin_->x * v28;
  v39 = a4->descender.__begin_->y - a4->descender.__begin_->x * v28;
  if (v29 == v30)
  {
    v40 = 1.79769313e308;
    v41 = -1.79769313e308;
  }
  else
  {
    v40 = 1.79769313e308;
    v41 = -1.79769313e308;
    v42 = -1.79769313e308;
    v43 = 1.79769313e308;
    do
    {
      v44 = *v30;
      v30 += 2;
      v45 = v44;
      if (v43 > v44)
      {
        v40 = v45;
        v43 = v45;
      }
      if (v42 < v45)
      {
        v41 = v45;
        v42 = v45;
      }
    }
    while (v30 != v29);
  }
  *(_OWORD *)v82 = 0u;
  v83 = 0u;
  v80 = 0u;
  *(_OWORD *)v81 = 0u;
  *(_OWORD *)v78 = 0u;
  *(_OWORD *)v79 = 0u;
  v46 = vabdd_f64(v36, v37);
  v47 = -0.0;
  if (hasAscender)
    v48 = v46;
  else
    v48 = -0.0;
  v49 = vabdd_f64(v39, v38);
  if (hasDescender)
    v50 = v49;
  else
    v50 = 0.0;
  if (!hasDescender)
    v47 = v49;
  v68 = v47;
  v69 = v50;
  v51 = (double *)operator new(0x10uLL);
  v52 = v51;
  if (hasAscender)
    v53 = 0.0;
  else
    v53 = v46;
  v54 = v33 - v53;
  *v51 = v40;
  v51[1] = v33 - v53 + v40 * v28;
  v55 = operator new(0x20uLL);
  *((double *)v55 + 2) = v41;
  *((double *)v55 + 3) = v54 + v41 * v28;
  *(_OWORD *)v55 = *(_OWORD *)v52;
  operator delete(v52);
  sub_1BE6F5A88(&v82[1], (char *)v55, (char *)v55 + 32, 2uLL);
  v66 = retstr;
  v56 = (double *)operator new(0x10uLL);
  v57 = v33 + v48;
  *v56 = v40;
  v56[1] = v57 + v40 * v28;
  v58 = operator new(0x20uLL);
  *((double *)v58 + 2) = v41;
  *((double *)v58 + 3) = v57 + v41 * v28;
  *(_OWORD *)v58 = *(_OWORD *)v56;
  operator delete(v56);
  sub_1BE6F5A88(v81, (char *)v58, (char *)v58 + 32, 2uLL);
  v59 = (double *)operator new(0x10uLL);
  *v59 = v40;
  v59[1] = v34 - v69 + v40 * v28;
  v60 = operator new(0x20uLL);
  *((double *)v60 + 2) = v41;
  *((double *)v60 + 3) = v34 - v69 + v41 * v28;
  *(_OWORD *)v60 = *(_OWORD *)v59;
  operator delete(v59);
  sub_1BE6F5A88(&v79[1], (char *)v60, (char *)v60 + 32, 2uLL);
  v61 = (double *)operator new(0x10uLL);
  v62 = v34 + v68;
  *v61 = v40;
  v61[1] = v62 + v40 * v28;
  v63 = operator new(0x20uLL);
  *((double *)v63 + 2) = v41;
  *((double *)v63 + 3) = v62 + v41 * v28;
  *(_OWORD *)v63 = *(_OWORD *)v61;
  operator delete(v61);
  sub_1BE6F5A88(v78, (char *)v63, (char *)v63 + 32, 2uLL);
  if (v78 != (void **)a4)
  {
    sub_1BE6F5A88(a4, (char *)v78[0], (char *)v78[1], ((char *)v78[1] - (char *)v78[0]) >> 4);
    sub_1BE6F5A88(&a4->base.__begin_, (char *)v79[1], (char *)v80, (uint64_t)(v80 - (unint64_t)v79[1]) >> 4);
    sub_1BE6F5A88(&a4->median.__begin_, (char *)v81[0], (char *)v81[1], ((char *)v81[1] - (char *)v81[0]) >> 4);
    sub_1BE6F5A88(&a4->top.__begin_, (char *)v82[1], (char *)v83, (uint64_t)(v83 - (unint64_t)v82[1]) >> 4);
  }
  sub_1BE7FE3E0((double **)a4, v67, (uint64_t)&v70);
  if (&v70 != (void **)a4)
  {
    sub_1BE6F5A88(a4, (char *)v70, v71, (v71 - (_BYTE *)v70) >> 4);
    sub_1BE6F5A88(&a4->base.__begin_, (char *)v72, v73, (v73 - (_BYTE *)v72) >> 4);
    sub_1BE6F5A88(&a4->median.__begin_, (char *)v74, v75, (v75 - (_BYTE *)v74) >> 4);
    sub_1BE6F5A88(&a4->top.__begin_, (char *)__p, v77, (v77 - (_BYTE *)__p) >> 4);
  }
  if (__p)
  {
    v77 = (char *)__p;
    operator delete(__p);
  }
  if (v74)
  {
    v75 = (char *)v74;
    operator delete(v74);
  }
  if (v72)
  {
    v73 = (char *)v72;
    operator delete(v72);
  }
  if (v70)
  {
    v71 = (char *)v70;
    operator delete(v70);
  }
  operator delete(v63);
  operator delete(v60);
  operator delete(v58);
  operator delete(v55);
  if (v82[1])
  {
    *(void **)&v83 = v82[1];
    operator delete(v82[1]);
  }
  retstr = v66;
  if (v81[0])
  {
    v81[1] = v81[0];
    operator delete(v81[0]);
  }
  if (v79[1])
  {
    *(void **)&v80 = v79[1];
    operator delete(v79[1]);
  }
  if (v78[0])
  {
    v78[1] = v78[0];
    operator delete(v78[0]);
  }
  v64 = 1;
  if (a7)
LABEL_57:
    *a7 = v64;
LABEL_58:
  sub_1BE76136C(retstr, (uint64_t)a4);

  return result;
}

+ (double)textLineFitScore:(id)a3 useAltString:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  uint64_t i;
  void *v18;
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
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  const char *v43;
  uint64_t v44;
  const char *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  double v50;
  double v51;
  void *__p;
  void *v54;
  uint64_t v55;
  void *v56[2];
  void *v57[2];
  __int128 v58;
  void *v59[2];
  void *v60[2];
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v4 = a4;
  v67 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend_splitIntoTokens(v5, v6, v7, v8, v9, v10);
  v64 = 0u;
  v65 = 0u;
  v63 = 0u;
  v62 = 0u;
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v62, (uint64_t)v66, 16, v13);
  if (v14)
  {
    v15 = *(_QWORD *)v63;
    v16 = 0.0;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v63 != v15)
          objc_enumerationMutation(v11);
        v18 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
        v19 = (void *)objc_opt_class();
        objc_msgSend_string(v18, v20, v21, v22, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_stringForRendering_useAltChars_(v19, v26, (uint64_t)v25, v4, v27, v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v35 = (void *)objc_opt_class();
        if (v18)
        {
          objc_msgSend_principalLines(v18, v30, v31, v32, v33, v34);
          objc_msgSend_points(v18, v36, v37, v38, v39, v40);
        }
        else
        {
          *(_OWORD *)v60 = 0u;
          v61 = 0u;
          v58 = 0u;
          *(_OWORD *)v59 = 0u;
          *(_OWORD *)v56 = 0u;
          *(_OWORD *)v57 = 0u;
          __p = 0;
          v54 = 0;
          v55 = 0;
        }
        objc_msgSend_principalLinesFitScore_points_transcription_(v35, v30, (uint64_t)v56, (uint64_t)&__p, (uint64_t)v29, v34);
        v42 = v41;
        if (__p)
        {
          v54 = __p;
          operator delete(__p);
        }
        if (v60[1])
        {
          *(void **)&v61 = v60[1];
          operator delete(v60[1]);
        }
        if (v59[0])
        {
          v59[1] = v59[0];
          operator delete(v59[0]);
        }
        if (v57[1])
        {
          *(void **)&v58 = v57[1];
          operator delete(v57[1]);
        }
        if (v56[0])
        {
          v56[1] = v56[0];
          operator delete(v56[0]);
        }

        v16 = v16 + v42;
      }
      v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v43, (uint64_t)&v62, (uint64_t)v66, 16, v44);
    }
    while (v14);
  }
  else
  {
    v16 = 0.0;
  }

  objc_msgSend_lineHeight(v5, v45, v46, v47, v48, v49);
  v51 = v50;

  return v16 / v51;
}

+ (double)principalLinesFitScore:(const void *)a3 points:(const void *)a4 transcription:(id)a5
{
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  _BYTE *v32;
  _BYTE *v33;
  int64_t v34;
  char *v35;
  char *v36;
  _BYTE *v37;
  _BYTE *v38;
  int64_t v39;
  char *v40;
  char *v41;
  void *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  const char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  long double v53;
  double v54;
  const char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  unint64_t v62;
  double v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  void *v70;
  const char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char hasAscender;
  void *v76;
  const char *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char hasDescender;
  uint64_t v82;
  unint64_t v83;
  double *v84;
  double v85;
  double v86;
  double v87;
  char *v88;
  double v90;
  double v91;
  void *__p;
  void *v93;
  void *v94;
  char *v95;
  char *v96;
  void *v97;
  void *v98;
  char *v99;

  v12 = a5;
  if (*((_QWORD *)a3 + 4) - *((_QWORD *)a3 + 3) != 32)
  {
    v31 = 1.79769313e308;
    goto LABEL_36;
  }
  objc_msgSend_ch_smallCharacterSet(MEMORY[0x1E0CB3500], v7, v8, v9, v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexesOfCharacters_(v12, v14, (uint64_t)v13, v15, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend_count(v18, v19, v20, v21, v22, v23);
  v30 = objc_msgSend_length(v12, v25, v26, v27, v28, v29);

  v31 = 0.0;
  if (v24 != v30)
  {
    v97 = 0;
    v98 = 0;
    v99 = 0;
    v33 = (_BYTE *)*((_QWORD *)a3 + 6);
    v32 = (_BYTE *)*((_QWORD *)a3 + 7);
    v34 = v32 - v33;
    if (v32 != v33)
    {
      if (v34 < 0)
        sub_1BE61F930();
      v35 = (char *)operator new(v32 - v33);
      v36 = &v35[16 * (v34 >> 4)];
      v97 = v35;
      v99 = v36;
      memcpy(v35, v33, v34);
      v98 = v36;
    }
    v94 = 0;
    v95 = 0;
    v96 = 0;
    v38 = (_BYTE *)*((_QWORD *)a3 + 3);
    v37 = (_BYTE *)*((_QWORD *)a3 + 4);
    v39 = v37 - v38;
    if (v37 != v38)
    {
      if (v39 < 0)
        sub_1BE61F930();
      v40 = (char *)operator new(v37 - v38);
      v41 = &v40[16 * (v39 >> 4)];
      v94 = v40;
      v96 = v41;
      memcpy(v40, v38, v39);
      v95 = v41;
    }
    v42 = (void *)objc_opt_class();
    v47 = objc_msgSend_ascendersCount_(v42, v43, (uint64_t)v12, v44, v45, v46);
    if (objc_msgSend_countCharacters(v12, v48, v49, v50, v51, v52) <= v47 && &v97 != (void **)((char *)a3 + 72))
      sub_1BE6F5A88(&v97, *((char **)a3 + 9), *((char **)a3 + 10), (uint64_t)(*((_QWORD *)a3 + 10) - *((_QWORD *)a3 + 9)) >> 4);
    v53 = atan2(*(double *)(*((_QWORD *)a3 + 3) + 24) - *(double *)(*((_QWORD *)a3 + 3) + 8), *(double *)(*((_QWORD *)a3 + 3) + 16) - **((double **)a3 + 3));
    v54 = tan(v53);
    v60 = objc_msgSend_countCharacters(v12, v55, v56, v57, v58, v59);
    v61 = v60;
    if (v60)
    {
      v62 = 0;
      v63 = *((double *)v94 + 1) - *(double *)v94 * v54;
      v64 = (*((double *)v94 + 2) - *(double *)v94) / (double)(unint64_t)v60;
      while (1)
      {
        v65 = *(double *)v94 + (double)v62++ * v64;
        sub_1BE7F4A5C((double **)a4, (uint64_t *)&__p, v54, v65, v63 + v65 * v54, *(double *)v94 + (double)v62 * v64, v63 + (*(double *)v94 + (double)v62 * v64) * v54);
        v66 = v93;
        if (v93 != __p)
          break;
        v69 = sub_1BE7F5930((double **)a3, (double **)a3 + 9);
        v31 = v31 + v69 * v69 * 2.0;
        if (v66)
          goto LABEL_19;
LABEL_14:
        if (v61 == v62)
          goto LABEL_21;
      }
      v67 = sub_1BE7F5A14(&__p, (double **)&v97);
      v68 = sub_1BE7F5A14(&__p, (double **)&v94);
      v31 = v31 + v67 * v67 + v68 * v68;
      v66 = __p;
      if (!__p)
        goto LABEL_14;
LABEL_19:
      v93 = v66;
      operator delete(v66);
      goto LABEL_14;
    }
LABEL_21:
    v70 = (void *)objc_opt_class();
    hasAscender = objc_msgSend_hasAscender_(v70, v71, (uint64_t)v12, v72, v73, v74);
    v76 = (void *)objc_opt_class();
    hasDescender = objc_msgSend_hasDescender_(v76, v77, (uint64_t)v12, v78, v79, v80);
    v82 = *((_QWORD *)a4 + 1) - *(_QWORD *)a4;
    if (v82)
    {
      v83 = v82 >> 4;
      if (v83 <= 1)
        v83 = 1;
      v84 = (double *)(*(_QWORD *)a4 + 8);
      v85 = 1.79769313e308;
      v86 = -1.79769313e308;
      do
      {
        v87 = *v84 - *(v84 - 1) * v54;
        if (v87 <= v85)
          v85 = *v84 - *(v84 - 1) * v54;
        if (v87 >= v86)
          v86 = *v84 - *(v84 - 1) * v54;
        v84 += 2;
        --v83;
      }
      while (v83);
      if ((hasAscender & 1) != 0)
      {
LABEL_31:
        if ((hasDescender & 1) != 0)
          goto LABEL_32;
        goto LABEL_39;
      }
    }
    else
    {
      v86 = -1.79769313e308;
      v85 = 1.79769313e308;
      if ((hasAscender & 1) != 0)
        goto LABEL_31;
    }
    v90 = *(double *)(*((_QWORD *)a3 + 6) + 8) - **((double **)a3 + 6) * v54 - v85;
    v31 = v31 + v90 * v90;
    if ((hasDescender & 1) != 0)
    {
LABEL_32:
      v88 = (char *)v94;
      if (!v94)
        goto LABEL_34;
      goto LABEL_33;
    }
LABEL_39:
    v91 = *(double *)(*((_QWORD *)a3 + 3) + 8) - **((double **)a3 + 3) * v54 - v86;
    v31 = v31 + v91 * v91;
    v88 = (char *)v94;
    if (!v94)
    {
LABEL_34:
      if (v97)
      {
        v98 = v97;
        operator delete(v97);
      }
      goto LABEL_36;
    }
LABEL_33:
    v95 = v88;
    operator delete(v88);
    goto LABEL_34;
  }
LABEL_36:

  return v31;
}

+ (PrincipalLines)principalLinesForPoints:(SEL)a3 writtenAlphaShape:(const void *)a4 imgPointsAndPrincipalLines:(const void *)a5 shouldCancel:(const void *)a6
{
  unsigned int (**v11)(_QWORD);
  uint64_t v12;
  const void *v13;
  int64_t v14;
  double *v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  uint64_t v24;
  const void *v25;
  int64_t v26;
  char *v27;
  double *v28;
  double *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  NSObject *v36;
  void *v37;
  double v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  PrincipalLines *result;
  char *v43[12];
  double *v44[3];
  uint8_t v45[96];
  float64x2_t v46[3];
  void *__p;
  void *v48;
  void *v49[3];
  __int128 v50;
  __int128 v51;
  char *v52;
  char *v53;
  char *v54;
  void *v55[3];
  __int128 v56;
  __int128 v57;
  double *v58;
  double *v59;
  double *v60;
  __int128 buf;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v11 = (unsigned int (**)(_QWORD))a7;
  v58 = 0;
  v59 = 0;
  v60 = 0;
  v13 = *(const void **)a4;
  v12 = *((_QWORD *)a4 + 1);
  v14 = v12 - *(_QWORD *)a4;
  if (v12 == *(_QWORD *)a4)
  {
    v56 = xmmword_1BE8D68A0;
    v57 = xmmword_1BE8D68A0;
    goto LABEL_21;
  }
  if (v14 < 0)
    sub_1BE61F930();
  v15 = (double *)operator new(v12 - *(_QWORD *)a4);
  v16 = &v15[2 * (v14 >> 4)];
  v58 = v15;
  v60 = v16;
  memcpy(v15, v13, v14);
  v59 = v16;
  v56 = xmmword_1BE8D68A0;
  v57 = xmmword_1BE8D68A0;
  v17 = 1.79769313e308;
  v18 = -1.79769313e308;
  v19 = -1.79769313e308;
  v20 = 1.79769313e308;
  do
  {
    v21 = *v15;
    if (v20 > *v15)
    {
      *(double *)&v56 = *v15;
      v20 = v21;
      if (v19 >= v21)
      {
LABEL_7:
        v22 = v15[1];
        if (v17 > v22)
          goto LABEL_12;
        goto LABEL_8;
      }
    }
    else if (v19 >= v21)
    {
      goto LABEL_7;
    }
    *((double *)&v56 + 1) = v21;
    v19 = v21;
    v22 = v15[1];
    if (v17 > v22)
    {
LABEL_12:
      *(double *)&v57 = v22;
      v17 = v22;
      if (v18 >= v22)
        goto LABEL_4;
      goto LABEL_13;
    }
LABEL_8:
    if (v18 >= v22)
      goto LABEL_4;
LABEL_13:
    *((double *)&v57 + 1) = v22;
    v18 = v22;
LABEL_4:
    v15 += 2;
  }
  while (v15 != v16);
  if (v18 - v17 == 0.0)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v23 = (id)qword_1EF568E68;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = v14 >> 4;
      _os_log_impl(&dword_1BE607000, v23, OS_LOG_TYPE_ERROR, "Degenerate set of %lu points with zero height", (uint8_t *)&buf, 0xCu);
    }

    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    goto LABEL_75;
  }
LABEL_21:
  sub_1BE7FDB94(&v58, (double *)&v56, (double **)v55);
  v52 = 0;
  v53 = 0;
  v54 = 0;
  v25 = *(const void **)a5;
  v24 = *((_QWORD *)a5 + 1);
  v26 = v24 - *(_QWORD *)a5;
  if (v24 == *(_QWORD *)a5)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v36 = (id)qword_1EF568E68;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 134217984;
      *(_QWORD *)((char *)&buf + 4) = ((char *)v59 - (char *)v58) >> 4;
      _os_log_impl(&dword_1BE607000, v36, OS_LOG_TYPE_ERROR, "Empty alphashape from ink with %lu points.", (uint8_t *)&buf, 0xCu);
    }

    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    v37 = v55[0];
    if (v55[0])
      goto LABEL_74;
    goto LABEL_75;
  }
  if (v26 < 0)
    sub_1BE61F930();
  v27 = (char *)operator new(v24 - *(_QWORD *)a5);
  v52 = v27;
  v54 = &v27[16 * (v26 >> 4)];
  memcpy(v27, v25, v26);
  v53 = v54;
  if (v11 && v11[2](v11))
  {
LABEL_57:
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    goto LABEL_73;
  }
  v29 = *(double **)a6;
  v28 = (double *)*((_QWORD *)a6 + 1);
  if (v28 == *(double **)a6)
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v39 = (id)qword_1EF568E68;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1BE607000, v39, OS_LOG_TYPE_ERROR, "Empty img points. TextLineStraightening not possible.", (uint8_t *)&buf, 2u);
    }

    goto LABEL_57;
  }
  v50 = xmmword_1BE8D68A0;
  v51 = xmmword_1BE8D68A0;
  v30 = 1.79769313e308;
  v31 = -1.79769313e308;
  v32 = -1.79769313e308;
  v33 = 1.79769313e308;
  do
  {
    v34 = *v29;
    if (v33 > *v29)
    {
      *(double *)&v50 = *v29;
      v33 = v34;
      if (v32 >= v34)
      {
LABEL_30:
        v35 = v29[1];
        if (v30 > v35)
          goto LABEL_35;
        goto LABEL_31;
      }
    }
    else if (v32 >= v34)
    {
      goto LABEL_30;
    }
    *((double *)&v50 + 1) = v34;
    v32 = v34;
    v35 = v29[1];
    if (v30 > v35)
    {
LABEL_35:
      *(double *)&v51 = v35;
      v30 = v35;
      if (v31 >= v35)
        goto LABEL_27;
      goto LABEL_36;
    }
LABEL_31:
    if (v31 >= v35)
      goto LABEL_27;
LABEL_36:
    *((double *)&v51 + 1) = v35;
    v31 = v35;
LABEL_27:
    v29 += 2;
  }
  while (v29 != v28);
  sub_1BE7FDB94((double **)a6, (double *)&v50, (double **)v49);
  v38 = CoreHandwriting::adjust_for_scaling((double **)a6 + 3, (uint64_t)&buf, *(double *)&v50, *((double *)&v50 + 1), *(double *)&v51, *((double *)&v51 + 1));
  if (v11 && ((unsigned int (*)(unsigned int (**)(_QWORD), double))v11[2])(v11, v38))
  {
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    goto LABEL_63;
  }
  sub_1BE7F67A0((uint64_t)v49, (char **)&__p, 4.0);
  if (__p == v48)
  {
    CHOSLogForCategory(10);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_1BE607000, v40, OS_LOG_TYPE_ERROR, "Empty alphashape from img.", v45, 2u);
    }

LABEL_61:
    *(_OWORD *)&retstr->median.__end_cap_.__value_ = 0u;
    *(_OWORD *)&retstr->top.__end_ = 0u;
    *(_OWORD *)&retstr->base.__end_ = 0u;
    *(_OWORD *)&retstr->median.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__begin_ = 0u;
    *(_OWORD *)&retstr->descender.__end_cap_.__value_ = 0u;
    v41 = __p;
    if (!__p)
      goto LABEL_63;
    goto LABEL_62;
  }
  if (v11 && v11[2](v11))
    goto LABEL_61;
  memset(v46, 0, sizeof(v46));
  sub_1BE7F8B1C((unint64_t *)&v52, (unint64_t *)&__p, v46);
  if (v11)
  {
    if (v11[2](v11))
      goto LABEL_61;
  }
  CoreHandwriting::transformPrincipalLines((double **)&buf, v46, (uint64_t)v45);
  CoreHandwriting::adjust_back_for_scaling((double **)v45, (uint64_t)v44, *(double *)&v56, *((double *)&v56 + 1), *(double *)&v57, *((double *)&v57 + 1));
  sub_1BE7FE3E0(v44, &v58, (uint64_t)v43);
  sub_1BE7A7A24((char **)v44, v43);
  sub_1BE6F2154((uint64_t)v43);
  sub_1BE76136C(retstr, (uint64_t)v44);
  sub_1BE6F2154((uint64_t)v44);
  sub_1BE6F2154((uint64_t)v45);
  v41 = __p;
  if (__p)
  {
LABEL_62:
    v48 = v41;
    operator delete(v41);
  }
LABEL_63:
  if (v66)
  {
    v67 = v66;
    operator delete(v66);
  }
  if (v64)
  {
    v65 = v64;
    operator delete(v64);
  }
  if (v62)
  {
    v63 = v62;
    operator delete(v62);
  }
  if ((_QWORD)buf)
  {
    *((_QWORD *)&buf + 1) = buf;
    operator delete((void *)buf);
  }
  if (v49[0])
  {
    v49[1] = v49[0];
    operator delete(v49[0]);
  }
LABEL_73:
  operator delete(v27);
  v37 = v55[0];
  if (v55[0])
  {
LABEL_74:
    v55[1] = v37;
    operator delete(v37);
  }
LABEL_75:
  if (v58)
  {
    v59 = v58;
    operator delete(v58);
  }

  return result;
}

+ (id)textStrokePointTransformationFromAffineTransformation:(CGAffineTransform *)a3
{
  __int128 v3;
  void *v4;
  void *v5;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  __int128 v10;

  v3 = *(_OWORD *)&a3->c;
  v8 = *(_OWORD *)&a3->a;
  v9 = v3;
  v10 = *(_OWORD *)&a3->tx;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = sub_1BE7AF1E0;
  v7[3] = &unk_1E77F5030;
  v4 = (void *)MEMORY[0x1C3B81A84](v7, a2);
  v5 = (void *)MEMORY[0x1C3B81A84]();

  return v5;
}

+ (id)reflowableTextLinesFromTransformedTextLines:(id)a3 mergeUnacceptableLines:(BOOL)a4 progress:(id)a5
{
  id v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  const char *v16;
  uint64_t v17;
  id v18;
  const char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  _BOOL4 v31;
  double v32;
  double v33;
  const char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  double v40;
  const char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  long double v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  double v52;
  uint64_t v53;
  int64_t v54;
  uint64_t v55;
  double *v56;
  double v57;
  double v58;
  double v59;
  const char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  double *v65;
  double *v66;
  char *v67;
  char *v68;
  char *v69;
  double v70;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  char *v75;
  char *v76;
  char *v77;
  char *v78;
  double v79;
  void *v80;
  const char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  const char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  const char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  const char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  const char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  double v105;
  double v106;
  const char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  double v112;
  double v113;
  const char *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
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
  void *v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  _BOOL4 v136;
  const char *v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const char *v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  const char *v149;
  uint64_t v150;
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
  void *v168;
  const char *v169;
  uint64_t v170;
  const char *v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t j;
  void *v179;
  const char *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  const char *v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  const char *v189;
  uint64_t v190;
  const char *v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t k;
  void *v199;
  void *v200;
  const char *v201;
  uint64_t v202;
  const char *v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  uint64_t v209;
  uint64_t m;
  void *v211;
  const char *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  const char *v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  uint64_t v220;
  double v221;
  double v222;
  const char *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  double v228;
  double v229;
  const char *v230;
  uint64_t v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  double v235;
  double v236;
  double v237;
  double v238;
  const char *v239;
  uint64_t v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  const char *v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  double v249;
  double v250;
  double v251;
  double v252;
  const char *v253;
  uint64_t v254;
  char *v255;
  char *v256;
  size_t v257;
  unint64_t v258;
  uint64_t v259;
  char *v260;
  uint64_t v261;
  unint64_t v262;
  char *v263;
  unint64_t v264;
  char *v265;
  void *v266;
  void *v267;
  const char *v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  double v278;
  double v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  double v288;
  double v289;
  double v290;
  double v291;
  void *v292;
  const char *v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  uint64_t v297;
  void *v298;
  const char *v299;
  uint64_t v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  unint64_t v304;
  CHReflowableTextResultToken *v305;
  const char *v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  void *v311;
  const char *v312;
  void *hasPrecedingSpace;
  const char *v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  const char *v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  const char *v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  void *v327;
  const char *v328;
  uint64_t v329;
  uint64_t v330;
  uint64_t v331;
  uint64_t v332;
  double v333;
  const char *v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  const char *v339;
  uint64_t v340;
  uint64_t v341;
  uint64_t v342;
  uint64_t v343;
  double v344;
  double v345;
  const char *v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  const char *v351;
  uint64_t v352;
  uint64_t v353;
  uint64_t v354;
  uint64_t v355;
  double v356;
  double v357;
  double v358;
  void *v359;
  const char *v360;
  uint64_t v361;
  uint64_t v362;
  uint64_t v363;
  uint64_t v364;
  void *v365;
  const char *v366;
  uint64_t v367;
  uint64_t v368;
  void *v369;
  const char *v370;
  uint64_t v371;
  const char *v372;
  uint64_t v373;
  uint64_t v374;
  uint64_t v375;
  uint64_t v376;
  uint64_t v377;
  uint64_t v378;
  double v379;
  uint64_t v380;
  double v381;
  void *v382;
  const char *v383;
  uint64_t v384;
  uint64_t v385;
  uint64_t v386;
  uint64_t v387;
  const char *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  float v393;
  double v394;
  double v395;
  double v396;
  void *v397;
  const char *v398;
  uint64_t v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  float v403;
  double v404;
  double v405;
  double v406;
  void *v407;
  double v408;
  double v409;
  double v410;
  double v411;
  void *v412;
  const char *v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  const char *v417;
  uint64_t v418;
  uint64_t v419;
  uint64_t v420;
  uint64_t v421;
  double v422;
  void *v423;
  const char *v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  double v428;
  double v429;
  double v430;
  const char *v431;
  uint64_t v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  double v436;
  double v437;
  const char *v438;
  uint64_t v439;
  uint64_t v440;
  uint64_t v441;
  uint64_t v442;
  double v443;
  double v444;
  double v445;
  double v446;
  const char *v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  uint64_t v451;
  double v452;
  double v453;
  double v454;
  double v455;
  const char *v456;
  uint64_t v457;
  uint64_t v458;
  uint64_t v459;
  uint64_t v460;
  void *v461;
  void *v462;
  double v463;
  double v464;
  double v465;
  double v466;
  const char *v467;
  uint64_t v468;
  uint64_t v469;
  uint64_t v470;
  uint64_t v471;
  uint64_t v472;
  uint64_t v473;
  void *v474;
  const char *v475;
  uint64_t v476;
  uint64_t v477;
  uint64_t v478;
  NSObject *v479;
  const char *v480;
  uint64_t v481;
  uint64_t v482;
  uint64_t v483;
  uint64_t v484;
  void *v485;
  CHReflowableTextLine *v486;
  const char *v487;
  uint64_t v488;
  uint64_t v489;
  uint64_t v490;
  uint64_t v491;
  void *v492;
  const char *v493;
  void *hasEndingLineBreak_alignmentType_writingDirection_locale;
  const char *v495;
  uint64_t v496;
  uint64_t v497;
  uint64_t v498;
  NSObject *v499;
  const char *v500;
  uint64_t v501;
  uint64_t v502;
  uint64_t v503;
  uint64_t v504;
  void *v505;
  const char *v506;
  uint64_t v507;
  uint64_t v508;
  uint64_t v509;
  uint64_t v510;
  void *v511;
  const char *v512;
  __CFString *v513;
  const char *v514;
  uint64_t v515;
  uint64_t v516;
  uint64_t v517;
  uint64_t v518;
  uint64_t v519;
  const char *v520;
  uint64_t v521;
  uint64_t v522;
  uint64_t v523;
  NSObject *v524;
  const char *v525;
  uint64_t v526;
  uint64_t v527;
  uint64_t v528;
  uint64_t v529;
  id v530;
  void *v532;
  id v534;
  void *v535;
  double v536;
  id v537;
  void *v538;
  _BOOL4 v539;
  uint64_t v540;
  unsigned int v541;
  uint64_t v542;
  __CFString *v543;
  int v544;
  id v545;
  void *v546;
  unint64_t v547;
  uint64_t i;
  void *v549;
  uint64_t v550;
  void *v551;
  id v552;
  id v553;
  id obj;
  void *v555;
  _OWORD v556[8];
  __int128 v557;
  __int128 v558;
  __int128 v559;
  __int128 v560;
  _OWORD v561[8];
  void *__src[2];
  void *v563[2];
  int v564[4];
  void *v565[2];
  void *v566[2];
  int v567[4];
  __int128 v568;
  __int128 v569;
  __int128 v570;
  __int128 v571;
  __int128 v572;
  __int128 v573;
  __int128 v574;
  __int128 v575;
  __int128 v576;
  __int128 v577;
  __int128 v578;
  __int128 v579;
  __int128 v580;
  __int128 v581;
  __int128 v582;
  __int128 v583;
  __int128 v584;
  __int128 v585;
  __int128 v586;
  __int128 v587;
  __int128 v588;
  __int128 v589;
  _QWORD v590[2];
  _BYTE v591[128];
  _BYTE v592[128];
  _BYTE v593[128];
  _BYTE v594[128];
  _BYTE v595[128];
  void *v596;
  void *__p[4];
  _OWORD v598[2];
  void *v599[2];
  __int128 v600;
  _BYTE v601[128];
  uint64_t v602;

  v539 = a4;
  v602 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v537 = a5;
  if (v537)
  {
    v12 = (void *)MEMORY[0x1E0CB38A8];
    v13 = objc_msgSend_count(v6, v7, v8, v9, v10, v11);
    objc_msgSend_progressWithTotalUnitCount_parent_pendingUnitCount_(v12, v14, v13, (uint64_t)v537, 50, v15);
    v535 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v535 = 0;
  }
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v7, v8, v9, v10, v11);
  v555 = (void *)objc_claimAutoreleasedReturnValue();
  v588 = 0u;
  v589 = 0u;
  v586 = 0u;
  v587 = 0u;
  obj = v6;
  v18 = 0;
  v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v586, (uint64_t)v601, 16, v17);
  if (v24)
  {
    v25 = *(_QWORD *)v587;
    v550 = *(_QWORD *)v587;
    do
    {
      v26 = 0;
      v27 = v18;
      v552 = (id)v24;
      do
      {
        if (*(_QWORD *)v587 != v25)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v586 + 1) + 8 * v26);
        if (!v27)
          goto LABEL_85;
        objc_msgSend_points(v27, v19, v20, v21, v22, v23);
        v30 = __src[1];
        if (__src[1] == __src[0])
        {
          v31 = 0;
          if (!__src[1])
            goto LABEL_16;
          goto LABEL_15;
        }
        if (!v28)
        {
          v31 = 0;
          v30 = __src[0];
          if (!__src[0])
            goto LABEL_16;
LABEL_15:
          __src[1] = v30;
          operator delete(v30);
          goto LABEL_16;
        }
        objc_msgSend_points(v28, v19, v29, v21, v22, v23);
        v31 = __p[1] != __p[0];
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        v30 = __src[0];
        if (__src[0])
          goto LABEL_15;
LABEL_16:
        if (!v31)
          goto LABEL_85;
        objc_msgSend_boundingBox(v28, v19, v29, v21, v22, v23);
        v33 = v32;
        objc_msgSend_boundingBox(v27, v34, v35, v36, v37, v38);
        if (v33 <= v40)
          goto LABEL_85;
        objc_msgSend_principalLines(v27, v19, v39, v21, v22, v23);
        objc_msgSend_principalLines(v27, v41, v42, v43, v44, v45);
        v46 = atan2(*((double *)__p[3] + 3) - *((double *)v563[1] + 1), *((double *)__p[3] + 2) - *(double *)v563[1]);
        v52 = tan(v46);
        if (v599[1])
        {
          *(void **)&v600 = v599[1];
          operator delete(v599[1]);
        }
        if (*(_QWORD *)&v598[1])
        {
          *((_QWORD *)&v598[1] + 1) = *(_QWORD *)&v598[1];
          operator delete(*(void **)&v598[1]);
        }
        if (__p[3])
        {
          *(void **)&v598[0] = __p[3];
          operator delete(__p[3]);
        }
        if (__p[0])
        {
          __p[1] = __p[0];
          operator delete(__p[0]);
        }
        if (v566[1])
        {
          *(void **)v567 = v566[1];
          operator delete(v566[1]);
        }
        if (v565[0])
        {
          v565[1] = v565[0];
          operator delete(v565[0]);
        }
        if (v563[1])
        {
          *(void **)v564 = v563[1];
          operator delete(v563[1]);
        }
        if (__src[0])
        {
          __src[1] = __src[0];
          operator delete(__src[0]);
        }
        objc_msgSend_points(v27, v47, v48, v49, v50, v51);
        v54 = (char *)__src[1] - (char *)__src[0];
        if (__src[1] == __src[0])
        {
          v57 = 1.79769313e308;
          v58 = -1.79769313e308;
          if (!__src[1])
            goto LABEL_50;
        }
        else
        {
          v55 = v54 >> 4;
          if ((unint64_t)(v54 >> 4) <= 1)
            v55 = 1;
          v56 = (double *)((char *)__src[0] + 8);
          v57 = 1.79769313e308;
          v58 = -1.79769313e308;
          do
          {
            v59 = *v56 - *(v56 - 1) * v52;
            if (v59 <= v57)
              v57 = *v56 - *(v56 - 1) * v52;
            if (v59 >= v58)
              v58 = *v56 - *(v56 - 1) * v52;
            v56 += 2;
            --v55;
          }
          while (v55);
        }
        __src[1] = __src[0];
        operator delete(__src[0]);
LABEL_50:
        if (v28)
        {
          objc_msgSend_points(v28, v19, v53, v21, v22, v23);
          v65 = (double *)__p[0];
          v66 = (double *)__p[1];
          v563[0] = 0;
          __src[0] = 0;
          __src[1] = 0;
          if (__p[0] != __p[1])
          {
            v67 = 0;
            v68 = 0;
            v69 = 0;
            while (1)
            {
              v70 = v65[1] - *v65 * v52;
              if (v70 < v57 || v70 > v58)
                goto LABEL_54;
              if (v67 >= v69)
                break;
              *(_OWORD *)v67 = *(_OWORD *)v65;
              v67 += 16;
LABEL_54:
              v65 += 2;
              if (v65 == v66)
              {
                v563[0] = v69;
                __src[0] = v68;
                __src[1] = v67;
                v66 = (double *)__p[0];
                v25 = v550;
                v24 = (uint64_t)v552;
                if (__p[0])
                  goto LABEL_78;
                goto LABEL_79;
              }
            }
            v72 = (v67 - v68) >> 4;
            v73 = v72 + 1;
            if ((unint64_t)(v72 + 1) >> 60)
            {
              v563[0] = v69;
              __src[0] = v68;
              __src[1] = v67;
              sub_1BE61F930();
            }
            if ((v69 - v68) >> 3 > v73)
              v73 = (v69 - v68) >> 3;
            if ((unint64_t)(v69 - v68) >= 0x7FFFFFFFFFFFFFF0)
              v74 = 0xFFFFFFFFFFFFFFFLL;
            else
              v74 = v73;
            if (v74)
            {
              if (v74 >> 60)
              {
                v563[0] = v69;
                __src[0] = v68;
                __src[1] = v67;
                sub_1BE61F100();
              }
              v75 = (char *)operator new(16 * v74);
              v76 = &v75[16 * v72];
              *(_OWORD *)v76 = *(_OWORD *)v65;
              if (v67 != v68)
              {
LABEL_69:
                v77 = v76;
                do
                {
                  v78 = v77 - 16;
                  *((_OWORD *)v77 - 1) = *((_OWORD *)v67 - 1);
                  v67 -= 16;
                  v77 -= 16;
                }
                while (v67 != v68);
                v69 = &v75[16 * v74];
                v67 = v76 + 16;
                if (v68)
LABEL_72:
                  operator delete(v68);
LABEL_73:
                v68 = v78;
                goto LABEL_54;
              }
            }
            else
            {
              v75 = 0;
              v76 = (char *)(16 * v72);
              *(_OWORD *)(16 * v72) = *(_OWORD *)v65;
              if (v67 != v68)
                goto LABEL_69;
            }
            v78 = v76;
            v69 = &v75[16 * v74];
            v67 = v76 + 16;
            if (v68)
              goto LABEL_72;
            goto LABEL_73;
          }
          v68 = 0;
          v67 = 0;
          if (__p[1])
          {
LABEL_78:
            __p[1] = v66;
            operator delete(v66);
            v67 = (char *)__src[1];
            v68 = (char *)__src[0];
          }
LABEL_79:
          objc_msgSend_points(v28, v60, v61, v62, v63, v64);
          v79 = (double)(unint64_t)((v67 - v68) >> 4)
              / (double)(unint64_t)(((char *)__p[1] - (char *)__p[0]) >> 4);
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          if (v68)
          {
            __src[1] = v68;
            operator delete(v68);
          }
        }
        else
        {
          __src[1] = 0;
          __src[0] = 0;
          v563[0] = 0;
          v79 = NAN;
        }
        if (v79 > 0.45)
        {
          objc_msgSend_lastObject(v555, v19, v53, v21, v22, v23);
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_mergeTransformedText_(v80, v81, (uint64_t)v28, v82, v83, v84);

          goto LABEL_86;
        }
LABEL_85:
        objc_msgSend_addObject_(v555, v19, (uint64_t)v28, v21, v22, v23);
LABEL_86:
        v18 = v28;

        ++v26;
        v27 = v18;
      }
      while (v26 != v24);
      v85 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v19, (uint64_t)&v586, (uint64_t)v601, 16, v23);
      v24 = v85;
    }
    while (v85);
  }
  v532 = v18;

  objc_msgSend_array(MEMORY[0x1E0C99DE8], v86, v87, v88, v89, v90);
  v534 = (id)objc_claimAutoreleasedReturnValue();
  v547 = 0;
  v543 = &stru_1E77F6F28;
  v536 = 1.0;
LABEL_93:
  if (v547 < objc_msgSend_count(v555, v91, v92, v93, v94, v95))
  {
    objc_msgSend_objectAtIndexedSubscript_(v555, v96, v547, v97, v98, v99);
    v551 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_orientation(v551, v100, v101, v102, v103, v104);
    v106 = v105;
    objc_msgSend_lineHeight(v551, v107, v108, v109, v110, v111);
    v113 = v112;
    objc_msgSend_locale(v551, v114, v115, v116, v117, v118);
    v119 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_languageCode(v119, v120, v121, v122, v123, v124);
    v538 = (void *)objc_claimAutoreleasedReturnValue();

    v125 = (void *)objc_opt_class();
    objc_msgSend_locale(v551, v126, v127, v128, v129, v130);
    v131 = (void *)objc_claimAutoreleasedReturnValue();
    v544 = objc_msgSend_supportsReflowForLocale_(v125, v132, (uint64_t)v131, v133, v134, v135);
    v136 = fabs(v106) > 0.2;

    v541 = v544 ^ 1;
    if (v539 && v136 | v544 ^ 1)
    {
      v596 = v551;
      objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v137, (uint64_t)&v596, 1, v140, v141);
      v142 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend_splitIntoTokens(v551, v137, v138, v139, v140, v141);
      v142 = objc_claimAutoreleasedReturnValue();
    }
    v148 = (void *)v142;
    objc_msgSend_array(MEMORY[0x1E0C99DE8], v143, v144, v145, v146, v147);
    v546 = (void *)objc_claimAutoreleasedReturnValue();
    v584 = 0u;
    v585 = 0u;
    v582 = 0u;
    v583 = 0u;
    v545 = v148;
    v540 = objc_msgSend_countByEnumeratingWithState_objects_count_(v545, v149, (uint64_t)&v582, (uint64_t)v595, 16, v150);
    if (v540)
    {
      v542 = *(_QWORD *)v583;
      do
      {
        for (i = 0; i != v540; ++i)
        {
          if (*(_QWORD *)v583 != v542)
            objc_enumerationMutation(v545);
          v549 = *(void **)(*((_QWORD *)&v582 + 1) + 8 * i);
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v151, v152, v153, v154, v155);
          v156 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_array(MEMORY[0x1E0C99DE8], v157, v158, v159, v160, v161);
          v162 = (void *)objc_claimAutoreleasedReturnValue();
          v580 = 0u;
          v581 = 0u;
          v578 = 0u;
          v579 = 0u;
          objc_msgSend_textStrokes(v549, v163, v164, v165, v166, v167);
          v168 = (void *)objc_claimAutoreleasedReturnValue();
          v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v169, (uint64_t)&v578, (uint64_t)v594, 16, v170);
          if (v176)
          {
            v177 = *(_QWORD *)v579;
            do
            {
              for (j = 0; j != v176; ++j)
              {
                if (*(_QWORD *)v579 != v177)
                  objc_enumerationMutation(v168);
                objc_msgSend_strokeIdentifier(*(void **)(*((_QWORD *)&v578 + 1) + 8 * j), v171, v172, v173, v174, v175);
                v179 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend_addObject_(v156, v180, (uint64_t)v179, v181, v182, v183);

              }
              v176 = objc_msgSend_countByEnumeratingWithState_objects_count_(v168, v171, (uint64_t)&v578, (uint64_t)v594, 16, v175);
            }
            while (v176);
          }

          v576 = 0u;
          v577 = 0u;
          v574 = 0u;
          v575 = 0u;
          objc_msgSend_textSegments(v549, v184, v185, v186, v187, v188);
          v553 = (id)objc_claimAutoreleasedReturnValue();
          v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v553, v189, (uint64_t)&v574, (uint64_t)v593, 16, v190);
          if (v196)
          {
            v197 = *(_QWORD *)v575;
            do
            {
              for (k = 0; k != v196; ++k)
              {
                if (*(_QWORD *)v575 != v197)
                  objc_enumerationMutation(v553);
                v199 = *(void **)(*((_QWORD *)&v574 + 1) + 8 * k);
                v570 = 0u;
                v571 = 0u;
                v572 = 0u;
                v573 = 0u;
                objc_msgSend_supportStrokes(v199, v191, v192, v193, v194, v195);
                v200 = (void *)objc_claimAutoreleasedReturnValue();
                v208 = objc_msgSend_countByEnumeratingWithState_objects_count_(v200, v201, (uint64_t)&v570, (uint64_t)v592, 16, v202);
                if (v208)
                {
                  v209 = *(_QWORD *)v571;
                  do
                  {
                    for (m = 0; m != v208; ++m)
                    {
                      if (*(_QWORD *)v571 != v209)
                        objc_enumerationMutation(v200);
                      objc_msgSend_strokeIdentifier(*(void **)(*((_QWORD *)&v570 + 1) + 8 * m), v203, v204, v205, v206, v207);
                      v211 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend_addObject_(v162, v212, (uint64_t)v211, v213, v214, v215);

                    }
                    v208 = objc_msgSend_countByEnumeratingWithState_objects_count_(v200, v203, (uint64_t)&v570, (uint64_t)v592, 16, v207);
                  }
                  while (v208);
                }

              }
              v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v553, v191, (uint64_t)&v574, (uint64_t)v593, 16, v195);
            }
            while (v196);
          }

          objc_msgSend_boundingBox(v549, v216, v217, v218, v219, v220);
          v222 = v221;
          objc_msgSend_boundingBox(v549, v223, v224, v225, v226, v227);
          v229 = v228;
          objc_msgSend_boundingBox(v549, v230, v231, v232, v233, v234);
          v236 = v235;
          v238 = v237;
          objc_msgSend_boundingBox(v549, v239, v240, v241, v242, v243);
          v250 = v249;
          v252 = v251;
          if (v549)
          {
            objc_msgSend_principalLines(v549, v244, v245, v246, v247, v248);
          }
          else
          {
            v600 = 0u;
            *(_OWORD *)v599 = 0u;
            memset(v598, 0, sizeof(v598));
            memset(__p, 0, sizeof(__p));
          }
          if ((objc_msgSend_fromCachedTokens(v551, v244, v245, v246, v247, v248) & 1) == 0)
          {
            objc_msgSend_fixPrincipalLinesPosition_useAltString_skipAmbiguousCharacters_(a1, v253, (uint64_t)v549, 0, 1, v254);
            v255 = (char *)__src[0];
            v256 = (char *)__src[1];
            v257 = (char *)__src[1] - (char *)__src[0];
            v258 = ((char *)__src[1] - (char *)__src[0]) >> 4;
            v259 = (uint64_t)__p[2];
            v260 = (char *)__p[0];
            if (v258 > ((char *)__p[2] - (char *)__p[0]) >> 4)
            {
              if (__p[0])
              {
                __p[1] = __p[0];
                operator delete(__p[0]);
                v259 = 0;
                memset(__p, 0, 24);
              }
              if ((v257 & 0x8000000000000000) != 0)
                goto LABEL_291;
              v261 = v259 >> 3;
              if (v259 >> 3 <= v258)
                v261 = v258;
              v262 = (unint64_t)v259 >= 0x7FFFFFFFFFFFFFF0 ? 0xFFFFFFFFFFFFFFFLL : v261;
              if (v262 >> 60)
LABEL_291:
                sub_1BE61F930();
              v263 = (char *)operator new(16 * v262);
              v260 = v263;
              __p[0] = v263;
              __p[1] = v263;
              __p[2] = &v263[16 * v262];
              if (v256 != v255)
                memcpy(v263, v255, v257);
              goto LABEL_148;
            }
            v264 = ((char *)__p[1] - (char *)__p[0]) >> 4;
            if (v264 >= v258)
            {
              if (__src[1] != __src[0])
              {
                v266 = __p[0];
                v265 = (char *)__src[0];
                goto LABEL_147;
              }
            }
            else
            {
              if (__p[1] != __p[0])
              {
                memmove(__p[0], __src[0], (char *)__p[1] - (char *)__p[0]);
                v260 = (char *)__p[1];
              }
              v265 = &v255[16 * v264];
              v257 = v256 - v265;
              if (v256 == v265)
                goto LABEL_148;
              v266 = v260;
LABEL_147:
              memmove(v266, v265, v257);
            }
LABEL_148:
            __p[1] = &v260[v257];
            sub_1BE6F5A88(&__p[3], (char *)v563[1], *(char **)v564, (uint64_t)(*(_QWORD *)v564 - (unint64_t)v563[1]) >> 4);
            sub_1BE6F5A88(&v598[1], (char *)v565[0], (char *)v565[1], ((char *)v565[1] - (char *)v565[0]) >> 4);
            sub_1BE6F5A88(&v599[1], (char *)v566[1], *(char **)v567, (uint64_t)(*(_QWORD *)v567 - (unint64_t)v566[1]) >> 4);
            if (v566[1])
            {
              *(void **)v567 = v566[1];
              operator delete(v566[1]);
            }
            if (v565[0])
            {
              v565[1] = v565[0];
              operator delete(v565[0]);
            }
            if (v563[1])
            {
              *(void **)v564 = v563[1];
              operator delete(v563[1]);
            }
            if (__src[0])
            {
              __src[1] = __src[0];
              operator delete(__src[0]);
            }
          }
          v568 = 0u;
          v569 = 0u;
          *(_OWORD *)v566 = 0u;
          *(_OWORD *)v567 = 0u;
          *(_OWORD *)v564 = 0u;
          *(_OWORD *)v565 = 0u;
          *(_OWORD *)__src = 0u;
          *(_OWORD *)v563 = 0u;
          v267 = (void *)objc_opt_class();
          if (v267)
          {
            objc_msgSend_convertToCHPrincipalLines_(v267, v268, (uint64_t)__p, v270, v271, v272);
            v273 = *(double *)__src;
            v274 = *(double *)&__src[1];
            v275 = *(double *)v563;
            v276 = *(double *)&v563[1];
            v277 = *(double *)v564;
            v278 = *(double *)&v564[2];
            v279 = *(double *)v565;
            v280 = *(double *)&v565[1];
            v281 = *(double *)v566;
            v282 = *(double *)&v566[1];
            v283 = *(double *)v567;
            v284 = *(double *)&v567[2];
            v285 = *((double *)&v568 + 1);
            v286 = *(double *)&v568;
            v287 = *((double *)&v569 + 1);
            v288 = *(double *)&v569;
          }
          else
          {
            v287 = 0.0;
            v288 = 0.0;
            v285 = 0.0;
            v286 = 0.0;
            v284 = 0.0;
            v283 = 0.0;
            v282 = 0.0;
            v281 = 0.0;
            v280 = 0.0;
            v279 = 0.0;
            v278 = 0.0;
            v277 = 0.0;
            v276 = 0.0;
            v275 = 0.0;
            v274 = 0.0;
            v273 = 0.0;
          }
          v289 = v238 - v236;
          v290 = 1.0;
          if (v289 == 0.0)
            v291 = 1.0;
          else
            v291 = v289;
          if (v252 - v250 != 0.0)
            v290 = v252 - v250;
          *(double *)__src = (v273 - v222) / v291;
          *(double *)&__src[1] = (v274 - v229) / v290;
          *(double *)v563 = (v275 - v222) / v291;
          *(double *)&v563[1] = (v276 - v229) / v290;
          *(double *)v564 = (v277 - v222) / v291;
          *(double *)&v564[2] = (v278 - v229) / v290;
          *(double *)v565 = (v279 - v222) / v291;
          *(double *)&v565[1] = (v280 - v229) / v290;
          *(double *)v566 = (v281 - v222) / v291;
          *(double *)&v566[1] = (v282 - v229) / v290;
          *(double *)v567 = (v283 - v222) / v291;
          *(double *)&v567[2] = (v284 - v229) / v290;
          *(double *)&v568 = (v286 - v222) / v291;
          *((double *)&v568 + 1) = (v285 - v229) / v290;
          *(double *)&v569 = (v288 - v222) / v291;
          *((double *)&v569 + 1) = (v287 - v229) / v290;
          objc_msgSend_tokens(v549, v268, v269, v270, v271, v272);
          v292 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_firstObject(v292, v293, v294, v295, v296, v297);
          v298 = (void *)objc_claimAutoreleasedReturnValue();
          v304 = objc_msgSend_properties(v298, v299, v300, v301, v302, v303);

          v305 = [CHReflowableTextResultToken alloc];
          objc_msgSend_string(v549, v306, v307, v308, v309, v310);
          v311 = (void *)objc_claimAutoreleasedReturnValue();
          v561[4] = *(_OWORD *)v566;
          v561[5] = *(_OWORD *)v567;
          v561[6] = v568;
          v561[7] = v569;
          v561[0] = *(_OWORD *)__src;
          v561[1] = *(_OWORD *)v563;
          v561[2] = *(_OWORD *)v564;
          v561[3] = *(_OWORD *)v565;
          hasPrecedingSpace = (void *)objc_msgSend_initWithString_strokeIdentifiers_nonTextStrokeIdentifiers_principalLines_bounds_hasPrecedingSpace_(v305, v312, (uint64_t)v311, (uint64_t)v156, (uint64_t)v162, (uint64_t)v561, (v304 >> 5) & 1, v222, v229, v289, v252 - v250);

          objc_msgSend_addObject_(v546, v314, (uint64_t)hasPrecedingSpace, v315, v316, v317);
          if (v599[1])
          {
            *(void **)&v600 = v599[1];
            operator delete(v599[1]);
          }
          if (*(_QWORD *)&v598[1])
          {
            *((_QWORD *)&v598[1] + 1) = *(_QWORD *)&v598[1];
            operator delete(*(void **)&v598[1]);
          }
          if (__p[3])
          {
            *(void **)&v598[0] = __p[3];
            operator delete(__p[3]);
          }
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }

        }
        v540 = objc_msgSend_countByEnumeratingWithState_objects_count_(v545, v151, (uint64_t)&v582, (uint64_t)v595, 16, v155);
      }
      while (v540);
    }

    if (v547 + 1 >= objc_msgSend_count(v555, v318, v319, v320, v321, v322))
    {
      v412 = (void *)objc_opt_class();
      objc_msgSend_estimatedLeadingForTextLine_(v412, v413, (uint64_t)v551, v414, v415, v416);
      v379 = v422;
      goto LABEL_245;
    }
    objc_msgSend_objectAtIndexedSubscript_(v555, v323, v547 + 1, v324, v325, v326);
    v327 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_principalLines(v551, v328, v329, v330, v331, v332);
    v333 = *(double *)v563[1];
    objc_msgSend_principalLines(v327, v334, v335, v336, v337, v338);
    v344 = *(double *)__p[3];
    if (v599[1])
    {
      *(void **)&v600 = v599[1];
      operator delete(v599[1]);
    }
    if (*(_QWORD *)&v598[1])
    {
      *((_QWORD *)&v598[1] + 1) = *(_QWORD *)&v598[1];
      operator delete(*(void **)&v598[1]);
    }
    if (__p[3])
    {
      *(void **)&v598[0] = __p[3];
      operator delete(__p[3]);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v566[1])
    {
      *(void **)v567 = v566[1];
      operator delete(v566[1]);
    }
    if (v565[0])
    {
      v565[1] = v565[0];
      operator delete(v565[0]);
    }
    if (v563[1])
    {
      *(void **)v564 = v563[1];
      operator delete(v563[1]);
    }
    if (__src[0])
    {
      __src[1] = __src[0];
      operator delete(__src[0]);
    }
    objc_msgSend_principalLines(v551, v339, v340, v341, v342, v343);
    v345 = *((double *)v563[1] + 2);
    objc_msgSend_principalLines(v327, v346, v347, v348, v349, v350);
    v356 = *((double *)__p[3] + 2);
    if (v599[1])
    {
      *(void **)&v600 = v599[1];
      operator delete(v599[1]);
    }
    if (*(_QWORD *)&v598[1])
    {
      *((_QWORD *)&v598[1] + 1) = *(_QWORD *)&v598[1];
      operator delete(*(void **)&v598[1]);
    }
    if (__p[3])
    {
      *(void **)&v598[0] = __p[3];
      operator delete(__p[3]);
    }
    if (__p[0])
    {
      __p[1] = __p[0];
      operator delete(__p[0]);
    }
    if (v566[1])
    {
      *(void **)v567 = v566[1];
      operator delete(v566[1]);
    }
    if (v565[0])
    {
      v565[1] = v565[0];
      operator delete(v565[0]);
    }
    if (v563[1])
    {
      *(void **)v564 = v563[1];
      operator delete(v563[1]);
    }
    if (__src[0])
    {
      __src[1] = __src[0];
      operator delete(__src[0]);
    }
    v357 = fmax(v333, v344);
    v358 = fmax(v345, v356);
    if (v357 >= v358)
    {
      v423 = (void *)objc_opt_class();
      objc_msgSend_estimatedLeadingForTextLine_(v423, v424, (uint64_t)v551, v425, v426, v427);
      v379 = v428;
      goto LABEL_244;
    }
    v559 = 0u;
    v560 = 0u;
    v557 = 0u;
    v558 = 0u;
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v351, v352, v353, v354, v355);
    v359 = (void *)objc_claimAutoreleasedReturnValue();
    v590[0] = v359;
    objc_msgSend_numberWithDouble_(MEMORY[0x1E0CB37E8], v360, v361, v362, v363, v364, v358);
    v365 = (void *)objc_claimAutoreleasedReturnValue();
    v590[1] = v365;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v366, (uint64_t)v590, 2, v367, v368);
    v369 = (void *)objc_claimAutoreleasedReturnValue();

    v377 = objc_msgSend_countByEnumeratingWithState_objects_count_(v369, v370, (uint64_t)&v557, (uint64_t)v591, 16, v371);
    if (!v377)
    {
      v379 = 0.0;
      goto LABEL_243;
    }
    v378 = *(_QWORD *)v558;
    v379 = 0.0;
LABEL_210:
    v380 = 0;
    while (1)
    {
      if (*(_QWORD *)v558 != v378)
        objc_enumerationMutation(v369);
      v382 = *(void **)(*((_QWORD *)&v557 + 1) + 8 * v380);
      objc_msgSend_principalLines(v551, v372, v373, v374, v375, v376);
      objc_msgSend_floatValue(v382, v383, v384, v385, v386, v387);
      v394 = *(double *)v563[1];
      v395 = *((double *)v563[1] + 2);
      if (*(double *)v563[1] == v395)
        break;
      v408 = *((double *)v563[1] + 1);
      v409 = (*((double *)v563[1] + 3) - v408) / (v395 - v394);
      v396 = v408 - v394 * v409 + v409 * v393;
      v397 = v566[1];
      if (v566[1])
        goto LABEL_218;
LABEL_219:
      if (v565[0])
      {
        v565[1] = v565[0];
        operator delete(v565[0]);
      }
      if (v563[1])
      {
        *(void **)v564 = v563[1];
        operator delete(v563[1]);
      }
      if (__src[0])
      {
        __src[1] = __src[0];
        operator delete(__src[0]);
      }
      objc_msgSend_principalLines(v327, v388, v389, v390, v391, v392);
      objc_msgSend_floatValue(v382, v398, v399, v400, v401, v402);
      v404 = *(double *)v563[1];
      v405 = *((double *)v563[1] + 2);
      if (*(double *)v563[1] != v405)
      {
        v410 = *((double *)v563[1] + 1);
        v411 = (*((double *)v563[1] + 3) - v410) / (v405 - v404);
        v406 = v410 - v404 * v411 + v411 * v403;
        v407 = v566[1];
        if (!v566[1])
          goto LABEL_228;
LABEL_227:
        *(_QWORD *)v567 = v407;
        operator delete(v407);
        goto LABEL_228;
      }
      v406 = *((double *)v563[1] + 1);
      v407 = v566[1];
      if (v566[1])
        goto LABEL_227;
LABEL_228:
      if (v565[0])
      {
        v565[1] = v565[0];
        operator delete(v565[0]);
      }
      if (v563[1])
      {
        *(void **)v564 = v563[1];
        operator delete(v563[1]);
      }
      if (__src[0])
      {
        __src[1] = __src[0];
        operator delete(__src[0]);
      }
      v381 = vabdd_f64(v396, v406);
      if (v381 > v379)
        v379 = v381;
      if (v377 == ++v380)
      {
        v377 = objc_msgSend_countByEnumeratingWithState_objects_count_(v369, v372, (uint64_t)&v557, (uint64_t)v591, 16, v376);
        if (!v377)
        {
LABEL_243:

LABEL_244:
LABEL_245:
          objc_msgSend_boundingBox(v551, v417, v418, v419, v420, v421);
          v430 = v429;
          objc_msgSend_boundingBox(v551, v431, v432, v433, v434, v435);
          v437 = v436;
          objc_msgSend_boundingBox(v551, v438, v439, v440, v441, v442);
          v444 = v443;
          v446 = v445;
          objc_msgSend_boundingBox(v551, v447, v448, v449, v450, v451);
          v453 = v452;
          v455 = v454;
          v568 = 0u;
          v569 = 0u;
          *(_OWORD *)v566 = 0u;
          *(_OWORD *)v567 = 0u;
          *(_OWORD *)v564 = 0u;
          *(_OWORD *)v565 = 0u;
          *(_OWORD *)__src = 0u;
          *(_OWORD *)v563 = 0u;
          v461 = (void *)objc_opt_class();
          if (v551)
          {
            objc_msgSend_principalLines(v551, v456, v457, v458, v459, v460);
            if (v461)
              goto LABEL_247;
LABEL_286:
            v568 = 0u;
            v569 = 0u;
            *(_OWORD *)v566 = 0u;
            *(_OWORD *)v567 = 0u;
            *(_OWORD *)v564 = 0u;
            *(_OWORD *)v565 = 0u;
            *(_OWORD *)__src = 0u;
            *(_OWORD *)v563 = 0u;
            v462 = v599[1];
            if (!v599[1])
              goto LABEL_249;
LABEL_248:
            *(_QWORD *)&v600 = v462;
            operator delete(v462);
            goto LABEL_249;
          }
          v600 = 0u;
          *(_OWORD *)v599 = 0u;
          memset(v598, 0, sizeof(v598));
          memset(__p, 0, sizeof(__p));
          if (!v461)
            goto LABEL_286;
LABEL_247:
          objc_msgSend_convertToCHPrincipalLines_(v461, v456, (uint64_t)__p, v458, v459, v460);
          v462 = v599[1];
          if (v599[1])
            goto LABEL_248;
LABEL_249:
          if (*(_QWORD *)&v598[1])
          {
            *((_QWORD *)&v598[1] + 1) = *(_QWORD *)&v598[1];
            operator delete(*(void **)&v598[1]);
          }
          if (__p[3])
          {
            *(void **)&v598[0] = __p[3];
            operator delete(__p[3]);
          }
          if (__p[0])
          {
            __p[1] = __p[0];
            operator delete(__p[0]);
          }
          v463 = v446 - v444;
          v464 = v455 - v453;
          v465 = 1.0;
          if (v463 == 0.0)
            v466 = 1.0;
          else
            v466 = v463;
          if (v464 != 0.0)
            v465 = v455 - v453;
          *(double *)__src = (*(double *)__src - v430) / v466;
          *(double *)&__src[1] = (*(double *)&__src[1] - v437) / v465;
          *(double *)v563 = (*(double *)v563 - v430) / v466;
          *(double *)&v563[1] = (*(double *)&v563[1] - v437) / v465;
          *(double *)v564 = (*(double *)v564 - v430) / v466;
          *(double *)&v564[2] = (*(double *)&v564[2] - v437) / v465;
          *(double *)v565 = (*(double *)v565 - v430) / v466;
          *(double *)&v565[1] = (*(double *)&v565[1] - v437) / v465;
          *(double *)v566 = (*(double *)v566 - v430) / v466;
          *(double *)&v566[1] = (*(double *)&v566[1] - v437) / v465;
          *(double *)v567 = (*(double *)v567 - v430) / v466;
          *(double *)&v567[2] = (*(double *)&v567[2] - v437) / v465;
          *(double *)&v568 = (*(double *)&v568 - v430) / v466;
          *((double *)&v568 + 1) = (*((double *)&v568 + 1) - v437) / v465;
          *(double *)&v569 = (*(double *)&v569 - v430) / v466;
          *((double *)&v569 + 1) = (*((double *)&v569 + 1) - v437) / v465;
          if (objc_msgSend_strokeClassification(v551, v456, v457, v458, v459, v460) == 2)
            v472 = 2;
          else
            v472 = 1;
          v473 = v541;
          if (v547)
          {
            if (v113 / v536 > 2.0
              || v113 / v536 < 0.5
              || (v473 = v541, (objc_msgSend_isEqualToString_(v538, v467, (uint64_t)v543, v469, v470, v471) & 1) == 0))
            {
              objc_msgSend_lastObject(v534, v467, v468, v469, v470, v471);
              v474 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_setHasEndingLineBreak_(v474, v475, 1, v476, v477, v478);

              if (qword_1EF568E88 != -1)
                dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
              v479 = (id)qword_1EF568E68;
              if (os_log_type_enabled(v479, OS_LOG_TYPE_DEBUG))
              {
                v485 = (void *)objc_msgSend_count(v555, v480, v481, v482, v483, v484);
                LODWORD(__p[0]) = 134219778;
                *(void **)((char *)__p + 4) = (void *)(v547 + 1);
                WORD2(__p[1]) = 2048;
                *(void **)((char *)&__p[1] + 6) = v485;
                HIWORD(__p[2]) = 2048;
                *(double *)&__p[3] = v113 / v536;
                LOWORD(v598[0]) = 2048;
                *(double *)((char *)v598 + 2) = v113;
                WORD5(v598[0]) = 2048;
                *(double *)((char *)v598 + 12) = v536;
                WORD2(v598[1]) = 2112;
                *(_QWORD *)((char *)&v598[1] + 6) = v538;
                HIWORD(v598[1]) = 2112;
                v599[0] = v543;
                LOWORD(v599[1]) = 1024;
                *(_DWORD *)((char *)&v599[1] + 2) = v544;
                _os_log_impl(&dword_1BE607000, v479, OS_LOG_TYPE_DEBUG, "Line breaking detected at the beginning of line %lu/%lu (heightDifference:%lf=%lf/%lf lang:%@=>%@ acceptableLang:%d)", (uint8_t *)__p, 0x4Eu);
              }

              v473 = 1;
            }
          }
          v486 = [CHReflowableTextLine alloc];
          v556[4] = *(_OWORD *)v566;
          v556[5] = *(_OWORD *)v567;
          v556[6] = v568;
          v556[7] = v569;
          v556[0] = *(_OWORD *)__src;
          v556[1] = *(_OWORD *)v563;
          v556[2] = *(_OWORD *)v564;
          v556[3] = *(_OWORD *)v565;
          objc_msgSend_locale(v551, v487, v488, v489, v490, v491);
          v492 = (void *)objc_claimAutoreleasedReturnValue();
          hasEndingLineBreak_alignmentType_writingDirection_locale = (void *)objc_msgSend_initWithTokens_principalLines_bounds_headIndent_leading_hasStartingLineBreak_hasEndingLineBreak_alignmentType_writingDirection_locale_(v486, v493, (uint64_t)v546, (uint64_t)v556, v473, v541, 1, v472, v430, v437, v463, v464, 0.0, v379, v492, v532);

          objc_msgSend_addObject_(v534, v495, (uint64_t)hasEndingLineBreak_alignmentType_writingDirection_locale, v496, v497, v498);
          if (qword_1EF568E88 != -1)
            dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
          v499 = (id)qword_1EF568E68;
          if (os_log_type_enabled(v499, OS_LOG_TYPE_DEBUG))
          {
            v505 = (void *)objc_msgSend_count(v546, v500, v501, v502, v503, v504);
            objc_msgSend_orientation(v551, v506, v507, v508, v509, v510);
            v512 = "YES";
            if (v544)
              v512 = "NO";
            LODWORD(__p[0]) = 134218498;
            *(void **)((char *)__p + 4) = v505;
            WORD2(__p[1]) = 2048;
            *(void **)((char *)&__p[1] + 6) = v511;
            HIWORD(__p[2]) = 2080;
            __p[3] = (void *)v512;
            _os_log_impl(&dword_1BE607000, v499, OS_LOG_TYPE_DEBUG, "Adding CHReflowableTextLine with %ld tokens, lineOrientation = %.2f, hasEndingLineBreak = %s", (uint8_t *)__p, 0x20u);
          }

          v513 = v538;
          if (v537)
          {
            v519 = objc_msgSend_completedUnitCount(v535, v514, v515, v516, v517, v518);
            objc_msgSend_setCompletedUnitCount_(v535, v520, v519 + 1, v521, v522, v523);
            if (qword_1EF568E88 != -1)
              dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
            v524 = (id)qword_1EF568E68;
            if (os_log_type_enabled(v524, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend_localizedDescription(v535, v525, v526, v527, v528, v529);
              v530 = (id)objc_claimAutoreleasedReturnValue();
              LODWORD(__p[0]) = 138412290;
              *(void **)((char *)__p + 4) = v530;
              _os_log_impl(&dword_1BE607000, v524, OS_LOG_TYPE_DEBUG, "Reflow Task Progress (token): %@", (uint8_t *)__p, 0xCu);

            }
          }

          v536 = fmax(v113, 1.0);
          ++v547;
          v543 = v513;
          goto LABEL_93;
        }
        goto LABEL_210;
      }
    }
    v396 = *((double *)v563[1] + 1);
    v397 = v566[1];
    if (!v566[1])
      goto LABEL_219;
LABEL_218:
    *(_QWORD *)v567 = v397;
    operator delete(v397);
    goto LABEL_219;
  }

  return v534;
}

+ (id)reflowableTextTokensFromTransformedTextLines:(id)a3
{
  const char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  const char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  const char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t k;
  void *v46;
  const char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  const char *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  const char *v56;
  uint64_t v57;
  const char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t m;
  void *v66;
  void *v67;
  const char *v68;
  uint64_t v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t n;
  void *v78;
  const char *v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  const char *v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double v88;
  double v89;
  const char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  double v95;
  double v96;
  const char *v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  double v102;
  double v103;
  double v104;
  double v105;
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
  double v116;
  double v117;
  double v118;
  double v119;
  const char *v120;
  uint64_t v121;
  void *v122;
  const char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  double v128;
  double v129;
  double v130;
  double v131;
  double v132;
  double v133;
  double v134;
  double v135;
  double v136;
  double v137;
  double v138;
  double v139;
  double v140;
  double v141;
  double v142;
  double v143;
  double v144;
  double v145;
  double v146;
  void *v147;
  const char *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  void *v153;
  const char *v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  unint64_t v159;
  CHReflowableTextResultToken *v160;
  const char *v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  void *v166;
  const char *v167;
  void *hasPrecedingSpace;
  const char *v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  id v174;
  uint64_t v175;
  uint64_t v177;
  void *v178;
  uint64_t v179;
  uint64_t v180;
  id v181;
  id obj;
  uint64_t i;
  id v184;
  uint64_t j;
  void *v186;
  id v187;
  _OWORD v188[8];
  void *v189[2];
  void *v190[2];
  __int128 v191;
  void *v192[2];
  void *__p[2];
  __int128 v194;
  __int128 v195;
  __int128 v196;
  void *v197[2];
  void *v198[2];
  __int128 v199;
  void *v200[2];
  void *v201[2];
  __int128 v202;
  __int128 v203;
  __int128 v204;
  __int128 v205;
  __int128 v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  _BYTE v223[128];
  _BYTE v224[128];
  _BYTE v225[128];
  _BYTE v226[128];
  _BYTE v227[128];
  uint64_t v228;

  v228 = *MEMORY[0x1E0C80C00];
  v174 = a3;
  objc_msgSend_array(MEMORY[0x1E0C99DE8], v3, v4, v5, v6, v7);
  v181 = (id)objc_claimAutoreleasedReturnValue();
  v221 = 0u;
  v222 = 0u;
  v219 = 0u;
  v220 = 0u;
  obj = v174;
  v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v219, (uint64_t)v227, 16, v9);
  if (v175)
  {
    v177 = *(_QWORD *)v220;
    do
    {
      for (i = 0; i != v175; ++i)
      {
        if (*(_QWORD *)v220 != v177)
          objc_enumerationMutation(obj);
        v178 = *(void **)(*((_QWORD *)&v219 + 1) + 8 * i);
        objc_msgSend_splitIntoTokens(v178, v10, v11, v12, v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v217 = 0u;
        v218 = 0u;
        v215 = 0u;
        v216 = 0u;
        v184 = v15;
        v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v184, v16, (uint64_t)&v215, (uint64_t)v226, 16, v17);
        if (v179)
        {
          v180 = *(_QWORD *)v216;
          do
          {
            for (j = 0; j != v179; ++j)
            {
              if (*(_QWORD *)v216 != v180)
                objc_enumerationMutation(v184);
              v186 = *(void **)(*((_QWORD *)&v215 + 1) + 8 * j);
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v18, v19, v20, v21, v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_array(MEMORY[0x1E0C99DE8], v24, v25, v26, v27, v28);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v213 = 0u;
              v214 = 0u;
              v211 = 0u;
              v212 = 0u;
              objc_msgSend_textStrokes(v186, v30, v31, v32, v33, v34);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v36, (uint64_t)&v211, (uint64_t)v225, 16, v37);
              if (v43)
              {
                v44 = *(_QWORD *)v212;
                do
                {
                  for (k = 0; k != v43; ++k)
                  {
                    if (*(_QWORD *)v212 != v44)
                      objc_enumerationMutation(v35);
                    objc_msgSend_strokeIdentifier(*(void **)(*((_QWORD *)&v211 + 1) + 8 * k), v38, v39, v40, v41, v42);
                    v46 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend_addObject_(v23, v47, (uint64_t)v46, v48, v49, v50);

                  }
                  v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v35, v38, (uint64_t)&v211, (uint64_t)v225, 16, v42);
                }
                while (v43);
              }

              v209 = 0u;
              v210 = 0u;
              v207 = 0u;
              v208 = 0u;
              objc_msgSend_textSegments(v186, v51, v52, v53, v54, v55);
              v187 = (id)objc_claimAutoreleasedReturnValue();
              v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v187, v56, (uint64_t)&v207, (uint64_t)v224, 16, v57);
              if (v63)
              {
                v64 = *(_QWORD *)v208;
                do
                {
                  for (m = 0; m != v63; ++m)
                  {
                    if (*(_QWORD *)v208 != v64)
                      objc_enumerationMutation(v187);
                    v66 = *(void **)(*((_QWORD *)&v207 + 1) + 8 * m);
                    v203 = 0u;
                    v204 = 0u;
                    v205 = 0u;
                    v206 = 0u;
                    objc_msgSend_supportStrokes(v66, v58, v59, v60, v61, v62);
                    v67 = (void *)objc_claimAutoreleasedReturnValue();
                    v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v203, (uint64_t)v223, 16, v69);
                    if (v75)
                    {
                      v76 = *(_QWORD *)v204;
                      do
                      {
                        for (n = 0; n != v75; ++n)
                        {
                          if (*(_QWORD *)v204 != v76)
                            objc_enumerationMutation(v67);
                          objc_msgSend_strokeIdentifier(*(void **)(*((_QWORD *)&v203 + 1) + 8 * n), v70, v71, v72, v73, v74);
                          v78 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend_addObject_(v29, v79, (uint64_t)v78, v80, v81, v82);

                        }
                        v75 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v70, (uint64_t)&v203, (uint64_t)v223, 16, v74);
                      }
                      while (v75);
                    }

                  }
                  v63 = objc_msgSend_countByEnumeratingWithState_objects_count_(v187, v58, (uint64_t)&v207, (uint64_t)v224, 16, v62);
                }
                while (v63);
              }

              objc_msgSend_boundingBox(v186, v83, v84, v85, v86, v87);
              v89 = v88;
              objc_msgSend_boundingBox(v186, v90, v91, v92, v93, v94);
              v96 = v95;
              objc_msgSend_boundingBox(v186, v97, v98, v99, v100, v101);
              v103 = v102;
              v105 = v104;
              objc_msgSend_boundingBox(v186, v106, v107, v108, v109, v110);
              v117 = v116;
              v119 = v118;
              if (v186)
              {
                objc_msgSend_principalLines(v186, v111, v112, v113, v114, v115);
              }
              else
              {
                *(_OWORD *)v201 = 0u;
                v202 = 0u;
                v199 = 0u;
                *(_OWORD *)v200 = 0u;
                *(_OWORD *)v197 = 0u;
                *(_OWORD *)v198 = 0u;
              }
              if ((objc_msgSend_fromCachedTokens(v178, v111, v112, v113, v114, v115) & 1) == 0)
              {
                objc_msgSend_fixPrincipalLinesPosition_useAltString_skipAmbiguousCharacters_(a1, v120, (uint64_t)v186, 0, 1, v121);
                sub_1BE6F5A88(v197, (char *)v189[0], (char *)v189[1], ((char *)v189[1] - (char *)v189[0]) >> 4);
                sub_1BE6F5A88(&v198[1], (char *)v190[1], (char *)v191, (uint64_t)(v191 - (unint64_t)v190[1]) >> 4);
                sub_1BE6F5A88(v200, (char *)v192[0], (char *)v192[1], ((char *)v192[1] - (char *)v192[0]) >> 4);
                sub_1BE6F5A88(&v201[1], (char *)__p[1], (char *)v194, (uint64_t)(v194 - (unint64_t)__p[1]) >> 4);
                if (__p[1])
                {
                  *(void **)&v194 = __p[1];
                  operator delete(__p[1]);
                }
                if (v192[0])
                {
                  v192[1] = v192[0];
                  operator delete(v192[0]);
                }
                if (v190[1])
                {
                  *(void **)&v191 = v190[1];
                  operator delete(v190[1]);
                }
                if (v189[0])
                {
                  v189[1] = v189[0];
                  operator delete(v189[0]);
                }
              }
              v195 = 0u;
              v196 = 0u;
              *(_OWORD *)__p = 0u;
              v194 = 0u;
              v191 = 0u;
              *(_OWORD *)v192 = 0u;
              *(_OWORD *)v189 = 0u;
              *(_OWORD *)v190 = 0u;
              v122 = (void *)objc_opt_class();
              if (v122)
              {
                objc_msgSend_convertToCHPrincipalLines_(v122, v123, (uint64_t)v197, v125, v126, v127);
                v129 = *(double *)v189;
                v128 = *(double *)&v189[1];
                v131 = *(double *)v190;
                v130 = *(double *)&v190[1];
                v132 = *((double *)&v191 + 1);
                v133 = *(double *)&v191;
                v135 = *(double *)v192;
                v134 = *(double *)&v192[1];
                v137 = *(double *)__p;
                v136 = *(double *)&__p[1];
                v138 = *((double *)&v194 + 1);
                v139 = *(double *)&v194;
                v140 = *((double *)&v195 + 1);
                v141 = *(double *)&v195;
                v142 = *((double *)&v196 + 1);
                v143 = *(double *)&v196;
              }
              else
              {
                v142 = 0.0;
                v143 = 0.0;
                v140 = 0.0;
                v141 = 0.0;
                v138 = 0.0;
                v139 = 0.0;
                v136 = 0.0;
                v137 = 0.0;
                v134 = 0.0;
                v135 = 0.0;
                v132 = 0.0;
                v133 = 0.0;
                v130 = 0.0;
                v131 = 0.0;
                v128 = 0.0;
                v129 = 0.0;
              }
              v144 = v105 - v103;
              if (v144 == 0.0)
                v145 = 1.0;
              else
                v145 = v144;
              if (v119 - v117 == 0.0)
                v146 = 1.0;
              else
                v146 = v119 - v117;
              *(double *)v189 = (v129 - v89) / v145;
              *(double *)&v189[1] = (v128 - v96) / v146;
              *(double *)v190 = (v131 - v89) / v145;
              *(double *)&v190[1] = (v130 - v96) / v146;
              *(double *)&v191 = (v133 - v89) / v145;
              *((double *)&v191 + 1) = (v132 - v96) / v146;
              *(double *)v192 = (v135 - v89) / v145;
              *(double *)&v192[1] = (v134 - v96) / v146;
              *(double *)__p = (v137 - v89) / v145;
              *(double *)&__p[1] = (v136 - v96) / v146;
              *(double *)&v194 = (v139 - v89) / v145;
              *((double *)&v194 + 1) = (v138 - v96) / v146;
              *(double *)&v195 = (v141 - v89) / v145;
              *((double *)&v195 + 1) = (v140 - v96) / v146;
              *(double *)&v196 = (v143 - v89) / v145;
              *((double *)&v196 + 1) = (v142 - v96) / v146;
              objc_msgSend_tokens(v186, v123, v124, v125, v126, v127);
              v147 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend_firstObject(v147, v148, v149, v150, v151, v152);
              v153 = (void *)objc_claimAutoreleasedReturnValue();
              v159 = objc_msgSend_properties(v153, v154, v155, v156, v157, v158);

              v160 = [CHReflowableTextResultToken alloc];
              objc_msgSend_string(v186, v161, v162, v163, v164, v165);
              v166 = (void *)objc_claimAutoreleasedReturnValue();
              v188[4] = *(_OWORD *)__p;
              v188[5] = v194;
              v188[6] = v195;
              v188[7] = v196;
              v188[0] = *(_OWORD *)v189;
              v188[1] = *(_OWORD *)v190;
              v188[2] = v191;
              v188[3] = *(_OWORD *)v192;
              hasPrecedingSpace = (void *)objc_msgSend_initWithString_strokeIdentifiers_nonTextStrokeIdentifiers_principalLines_bounds_hasPrecedingSpace_(v160, v167, (uint64_t)v166, (uint64_t)v23, (uint64_t)v29, (uint64_t)v188, (v159 >> 5) & 1, v89, v96, v144, v119 - v117);

              objc_msgSend_addObject_(v181, v169, (uint64_t)hasPrecedingSpace, v170, v171, v172);
              if (v201[1])
              {
                *(void **)&v202 = v201[1];
                operator delete(v201[1]);
              }
              if (v200[0])
              {
                v200[1] = v200[0];
                operator delete(v200[0]);
              }
              if (v198[1])
              {
                *(void **)&v199 = v198[1];
                operator delete(v198[1]);
              }
              if (v197[0])
              {
                v197[1] = v197[0];
                operator delete(v197[0]);
              }

            }
            v179 = objc_msgSend_countByEnumeratingWithState_objects_count_(v184, v18, (uint64_t)&v215, (uint64_t)v226, 16, v22);
          }
          while (v179);
        }

      }
      v175 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v219, (uint64_t)v227, 16, v14);
    }
    while (v175);
  }

  return v181;
}

+ (CGAffineTransform)transformForInsertingToken:(SEL)a3 inLineWithTokens:(id)a4
{
  id v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  CHTokenizedTextResultToken *v26;
  const char *v27;
  uint64_t v28;
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
  double *v39;
  const char *v40;
  void *v41;
  CHTransformedTextLine *v42;
  const char *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  _OWORD *v47;
  __int128 v48;
  const char *v49;
  void *v50;
  char *v51;
  char *v52;
  void *v53;
  char *v54;
  void *v55;
  void *v56;
  const char *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  const char *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  const char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  CHTokenizedTextResultToken *v82;
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
  uint64_t v93;
  void *v94;
  const char *v95;
  void *v96;
  CHTransformedTextLine *v97;
  const char *v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  __int128 v102;
  const char *v103;
  void *v104;
  char *v105;
  char *v106;
  void *v107;
  char *v108;
  void *v109;
  void *v110;
  CHTransformationParameters *v111;
  const char *v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  const char *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  const char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  void *v124;
  const char *v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  const char *v129;
  uint64_t v130;
  uint64_t v131;
  const char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  void *v137;
  const char *v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  void *v143;
  const char *v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  void *v149;
  NSObject *v150;
  CGAffineTransform *v151;
  __int128 v152;
  CGAffineTransform *result;
  void *v154;
  id v155;
  CGAffineTransform t2;
  CGAffineTransform t1;
  _OWORD v158[3];
  void *v159[3];
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  _OWORD v166[8];
  _OWORD v167[3];
  void *v168[3];
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *__p;
  void *v174;
  void *v175;
  char *v176;
  uint64_t v177;
  uint8_t buf[8];
  void *v179;
  uint64_t v180;
  _OWORD v181[8];
  CGAffineTransform v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  _QWORD v186[2];
  void *v187;
  _QWORD v188[3];

  v188[1] = *MEMORY[0x1E0C80C00];
  v155 = a4;
  v7 = a5;
  if (!objc_msgSend_count(v7, v8, v9, v10, v11, v12))
  {
    v23 = MEMORY[0x1E0C9BAA8];
    v24 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&retstr->c = v24;
    *(_OWORD *)&retstr->tx = *(_OWORD *)(v23 + 32);
    goto LABEL_82;
  }
  objc_msgSend_localeWithLocaleIdentifier_(MEMORY[0x1E0C99DC8], v13, (uint64_t)CFSTR("en_US"), v14, v15, v16);
  v154 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = (void *)objc_opt_class();
  if (v155)
  {
    objc_msgSend_principalLines(v155, v17, v18, v19, v20, v21);
    if (v22)
    {
LABEL_4:
      objc_msgSend_convertFromCHPrincipalLines_(v22, v17, (uint64_t)v181, v19, v20, v21);
      goto LABEL_8;
    }
  }
  else
  {
    memset(v181, 0, sizeof(v181));
    if (v22)
      goto LABEL_4;
  }
  v184 = 0u;
  v185 = 0u;
  v183 = 0u;
  memset(&v182, 0, sizeof(v182));
LABEL_8:
  if (objc_msgSend_hasPrecedingSpace(v155, v17, v18, v19, v20, v21))
    v25 = 32;
  else
    v25 = 0;
  v26 = [CHTokenizedTextResultToken alloc];
  objc_msgSend_string(v155, v27, v28, v29, v30, v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v33, v34, v35, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (double *)MEMORY[0x1E0C9D648];
  v41 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v26, v40, (uint64_t)v32, (uint64_t)v38, 0, v25, v154, 1, 1.0, 1.0, 1.0, 1.0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24), 0);

  v42 = [CHTransformedTextLine alloc];
  v188[0] = v41;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v43, (uint64_t)v188, 1, v44, v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = 0;
  *(_QWORD *)buf = 0;
  v180 = 0;
  v176 = 0;
  v175 = 0;
  v177 = 0;
  sub_1BE76136C(v168, (uint64_t)&v182);
  v47 = (_OWORD *)MEMORY[0x1E0C9BAA8];
  v48 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v167[0] = *MEMORY[0x1E0C9BAA8];
  v167[1] = v48;
  v167[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v50 = (void *)objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v42, v49, MEMORY[0x1E0C9AA60], (uint64_t)v46, (uint64_t)buf, (uint64_t)&v175, v154, 1, v168, v167);
  if (__p)
  {
    v174 = __p;
    operator delete(__p);
  }
  if (v171)
  {
    v172 = v171;
    operator delete(v171);
  }
  if (v169)
  {
    v170 = v169;
    operator delete(v169);
  }
  if (v168[0])
  {
    v168[1] = v168[0];
    operator delete(v168[0]);
  }
  v51 = (char *)v175;
  if (v175)
  {
    v52 = v176;
    v53 = v175;
    if (v176 != v175)
    {
      v54 = v176;
      do
      {
        v56 = (void *)*((_QWORD *)v54 - 3);
        v54 -= 24;
        v55 = v56;
        if (v56)
        {
          *((_QWORD *)v52 - 2) = v55;
          operator delete(v55);
        }
        v52 = v54;
      }
      while (v54 != v51);
      v53 = v175;
      v47 = (_OWORD *)MEMORY[0x1E0C9BAA8];
    }
    v176 = v51;
    operator delete(v53);
  }
  if (*(_QWORD *)buf)
  {
    v179 = *(void **)buf;
    operator delete(*(void **)buf);
  }

  if (*((_QWORD *)&v184 + 1))
  {
    *(_QWORD *)&v185 = *((_QWORD *)&v184 + 1);
    operator delete(*((void **)&v184 + 1));
  }
  if ((_QWORD)v183)
  {
    *((_QWORD *)&v183 + 1) = v183;
    operator delete((void *)v183);
  }
  if (*(_QWORD *)&v182.d)
  {
    v182.tx = v182.d;
    operator delete(*(void **)&v182.d);
  }
  if (*(_QWORD *)&v182.a)
  {
    v182.b = v182.a;
    operator delete(*(void **)&v182.a);
  }
  objc_msgSend_lastObject(v7, v57, v58, v59, v60, v61);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = (void *)objc_opt_class();
  objc_msgSend_lastObject(v7, v64, v65, v66, v67, v68);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = v69;
  if (!v69)
  {
    memset(v166, 0, sizeof(v166));
    if (v63)
      goto LABEL_39;
LABEL_41:
    v184 = 0u;
    v185 = 0u;
    v183 = 0u;
    memset(&v182, 0, sizeof(v182));
    goto LABEL_42;
  }
  objc_msgSend_principalLines(v69, v70, v71, v72, v73, v74);
  if (!v63)
    goto LABEL_41;
LABEL_39:
  objc_msgSend_convertFromCHPrincipalLines_(v63, v70, (uint64_t)v166, v72, v73, v74);
LABEL_42:

  if (objc_msgSend_hasPrecedingSpace(v62, v76, v77, v78, v79, v80))
    v81 = 32;
  else
    v81 = 0;
  v82 = [CHTokenizedTextResultToken alloc];
  objc_msgSend_string(v62, v83, v84, v85, v86, v87);
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_indexSet(MEMORY[0x1E0CB36B8], v89, v90, v91, v92, v93);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  v96 = (void *)objc_msgSend_initWithString_strokeIndexes_wordID_modelScore_recognitionScore_combinedScore_alignmentScore_properties_recognizerSourceLocale_inputSources_substrokeCount_bounds_(v82, v95, (uint64_t)v88, (uint64_t)v94, 0, v81, v154, 1, 1.0, 1.0, 1.0, 1.0, *v39, v39[1], v39[2], v39[3], 0);

  v97 = [CHTransformedTextLine alloc];
  v187 = v96;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v98, (uint64_t)&v187, 1, v99, v100);
  v101 = (void *)objc_claimAutoreleasedReturnValue();
  v179 = 0;
  *(_QWORD *)buf = 0;
  v180 = 0;
  v176 = 0;
  v175 = 0;
  v177 = 0;
  sub_1BE76136C(v159, (uint64_t)&v182);
  v102 = v47[1];
  v158[0] = *v47;
  v158[1] = v102;
  v158[2] = v47[2];
  v104 = (void *)objc_msgSend_initWithStrokes_tokens_points_strokePoints_locale_strokeClassification_principalLines_transform_(v97, v103, MEMORY[0x1E0C9AA60], (uint64_t)v101, (uint64_t)buf, (uint64_t)&v175, v154, 1, v159, v158);
  if (v164)
  {
    v165 = v164;
    operator delete(v164);
  }
  if (v162)
  {
    v163 = v162;
    operator delete(v162);
  }
  if (v160)
  {
    v161 = v160;
    operator delete(v160);
  }
  if (v159[0])
  {
    v159[1] = v159[0];
    operator delete(v159[0]);
  }
  v105 = (char *)v175;
  if (v175)
  {
    v106 = v176;
    v107 = v175;
    if (v176 != v175)
    {
      v108 = v176;
      do
      {
        v110 = (void *)*((_QWORD *)v108 - 3);
        v108 -= 24;
        v109 = v110;
        if (v110)
        {
          *((_QWORD *)v106 - 2) = v109;
          operator delete(v109);
        }
        v106 = v108;
      }
      while (v108 != v105);
      v107 = v175;
    }
    v176 = v105;
    operator delete(v107);
  }
  if (*(_QWORD *)buf)
  {
    v179 = *(void **)buf;
    operator delete(*(void **)buf);
  }

  if (*((_QWORD *)&v184 + 1))
  {
    *(_QWORD *)&v185 = *((_QWORD *)&v184 + 1);
    operator delete(*((void **)&v184 + 1));
  }
  if ((_QWORD)v183)
  {
    *((_QWORD *)&v183 + 1) = v183;
    operator delete((void *)v183);
  }
  if (*(_QWORD *)&v182.d)
  {
    v182.tx = v182.d;
    operator delete(*(void **)&v182.d);
  }
  if (*(_QWORD *)&v182.a)
  {
    v182.b = v182.a;
    operator delete(*(void **)&v182.a);
  }

  v111 = objc_alloc_init(CHTransformationParameters);
  objc_msgSend_setOrientationBehavior_(v111, v112, 1, v113, v114, v115);
  objc_msgSend_setResizeBehavior_(v111, v116, 1, v117, v118, v119);
  objc_msgSend_setMergeLines_(v111, v120, 1, v121, v122, v123);
  v124 = (void *)objc_opt_class();
  v186[0] = v104;
  v186[1] = v50;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E0C99D20], v125, (uint64_t)v186, 2, v126, v127);
  v128 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_transformTextLines_withParameters_(v124, v129, (uint64_t)v128, (uint64_t)v111, v130, v131);

  memset(&v182, 0, sizeof(v182));
  objc_msgSend_textSegments(v50, v132, v133, v134, v135, v136);
  v137 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_firstObject(v137, v138, v139, v140, v141, v142);
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  v149 = v143;
  if (v143)
    objc_msgSend_transform(v143, v144, v145, v146, v147, v148);
  else
    memset(&v182, 0, sizeof(v182));

  t1 = v182;
  memset(&t2, 0, sizeof(t2));
  if (CGAffineTransformEqualToTransform(&t1, &t2))
  {
    if (qword_1EF568E88 != -1)
      dispatch_once(&qword_1EF568E88, &unk_1E77F1630);
    v150 = (id)qword_1EF568E68;
    if (os_log_type_enabled(v150, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE607000, v150, OS_LOG_TYPE_ERROR, "transformForInsertingToken resulted in an invalid transform, retuning identity transform instead.", buf, 2u);
    }

    v151 = (CGAffineTransform *)MEMORY[0x1E0C9BAA8];
  }
  else
  {
    v151 = &v182;
  }
  v152 = *(_OWORD *)&v151->c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v151->a;
  *(_OWORD *)&retstr->c = v152;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v151->tx;

LABEL_82:
  return result;
}

- (NSArray)contextStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setContextStrokes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (CHTransformationParameters)transformationParameters
{
  return (CHTransformationParameters *)objc_getProperty(self, a2, 72, 1);
}

- (void)setTransformationParameters:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSArray)contextResults
{
  return (NSArray *)objc_getProperty(self, a2, 80, 1);
}

- (void)setContextResults:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSSet)excludedStrokeTypes
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExcludedStrokeTypes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (CHStrokeProvider)strokeProvider
{
  return (CHStrokeProvider *)objc_getProperty(self, a2, 96, 1);
}

- (void)setStrokeProvider:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (CHStrokeGroupingResult)strokeGroupingResult
{
  return (CHStrokeGroupingResult *)objc_getProperty(self, a2, 104, 1);
}

- (void)setStrokeGroupingResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (CHStrokeClassificationResult)strokeClassificationResult
{
  return (CHStrokeClassificationResult *)objc_getProperty(self, a2, 112, 1);
}

- (void)setStrokeClassificationResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableArray)correctionAngles
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setCorrectionAngles:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (NSArray)relatedNonTextStrokes
{
  return (NSArray *)objc_getProperty(self, a2, 128, 1);
}

- (void)setRelatedNonTextStrokes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (BOOL)usingInsertionPoint
{
  return self->_usingInsertionPoint;
}

- (void)setUsingInsertionPoint:(BOOL)a3
{
  self->_usingInsertionPoint = a3;
}

- (void).cxx_destruct
{
  BoundingBox *begin;
  BoundingBox *v4;

  objc_storeStrong((id *)&self->_relatedNonTextStrokes, 0);
  objc_storeStrong((id *)&self->_correctionAngles, 0);
  objc_storeStrong((id *)&self->_strokeClassificationResult, 0);
  objc_storeStrong((id *)&self->_strokeGroupingResult, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_excludedStrokeTypes, 0);
  objc_storeStrong((id *)&self->_contextResults, 0);
  objc_storeStrong((id *)&self->_transformationParameters, 0);
  objc_storeStrong((id *)&self->_contextStrokes, 0);
  begin = self->_transformedBoundingBoxes.__begin_;
  if (begin)
  {
    self->_transformedBoundingBoxes.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_originalBoundingBoxes.__begin_;
  if (v4)
  {
    self->_originalBoundingBoxes.__end_ = v4;
    operator delete(v4);
  }
}

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

@end
