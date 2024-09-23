@implementation IPFeatureMailScanner

- (void)resetScanState
{
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[IPFeatureMailScanner setSubjectContainsDate:](self, "setSubjectContainsDate:", 0);
  v3 = MEMORY[0x24BDBD1A8];
  -[IPFeatureMailScanner setSubjectDataDetectorsFeatures:](self, "setSubjectDataDetectorsFeatures:", MEMORY[0x24BDBD1A8]);
  -[IPFeatureMailScanner setDateInSubjectFeatureData:](self, "setDateInSubjectFeatureData:", 0);
  -[IPFeatureMailScanner setSubjectSentenceFeatures:](self, "setSubjectSentenceFeatures:", v3);
  v4 = (void *)objc_opt_new();
  -[IPFeatureMailScanner setSubjectKeywordFeatures:](self, "setSubjectKeywordFeatures:", v4);

  v5 = (void *)objc_opt_new();
  -[IPFeatureMailScanner setSubjectAndBodyDataDetectorsFeatures:](self, "setSubjectAndBodyDataDetectorsFeatures:", v5);

  v6.receiver = self;
  v6.super_class = (Class)IPFeatureMailScanner;
  -[IPFeatureScanner resetScanState](&v6, sel_resetScanState);
}

- (void)setSubjectContainsDate:(BOOL)a3
{
  self->_subjectContainsDate = a3;
}

- (void)scanEventsInMessageUnits:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  IPFeatureMailScanner *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;
  uint64_t v25;

  v6 = a4;
  v25 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[IPFeatureMailScanner resetScanState](v10, "resetScanState");
  objc_sync_exit(v10);

  -[IPFeatureScanner setBodyMessageUnits:](v10, "setBodyMessageUnits:", v8);
  if (IPDebuggingModeEnabled_once != -1)
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v11 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v11 = _IPLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_219581000, v11, OS_LOG_TYPE_INFO, "Start with message units: %@ #FeatureManager", (uint8_t *)&buf, 0xCu);
    }
  }
  if (objc_msgSend(v8, "count"))
  {
    if ((objc_msgSend((id)objc_opt_class(), "isNaturalLanguageEventDetectionEnabled") & 1) != 0)
    {
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v21 = 0x3032000000;
      v22 = __Block_byref_object_copy_;
      v23 = __Block_byref_object_dispose_;
      objc_msgSend(v8, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "originalMessage");
      v24 = (id)objc_claimAutoreleasedReturnValue();

      v17[0] = MEMORY[0x24BDAC760];
      v17[1] = 3221225472;
      v17[2] = __81__IPFeatureMailScanner_scanEventsInMessageUnits_synchronously_completionHandler___block_invoke;
      v17[3] = &unk_24DAA5090;
      v17[4] = v10;
      v18 = v9;
      p_buf = &buf;
      v13 = MEMORY[0x219A2F888](v17);
      v14 = (void *)v13;
      if (v6)
      {
        (*(void (**)(uint64_t))(v13 + 16))(v13);
      }
      else
      {
        dispatch_get_global_queue(17, 0);
        v16 = objc_claimAutoreleasedReturnValue();
        dispatch_async(v16, v14);

      }
      _Block_object_dispose(&buf, 8);

    }
    else
    {
      -[IPFeatureScanner setResultType:](v10, "setResultType:", -1);
      (*((void (**)(id, _QWORD, int64_t))v9 + 2))(v9, 0, -[IPFeatureScanner resultType](v10, "resultType"));
    }
  }
  else
  {
    -[IPFeatureScanner setResultType:](v10, "setResultType:", 0);
    v15 = -[IPFeatureScanner resultType](v10, "resultType");
    (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, MEMORY[0x24BDBD1A8], v15);
  }

}

- (id)featuresForTextString:(id)a3 inMessageUnit:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  void *v63;
  _BYTE v64[128];
  void *v65;
  void *v66;
  _QWORD v67[2];
  _QWORD v68[2];
  void *v69;
  _BYTE v70[128];
  void *v71;
  const __CFString *v72;
  void *v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(v5, "originalMessage");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "subject");
  v7 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "dataDetectorsFeatureExtractor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v74[0] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v74, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v7, v5, v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureMailScanner setSubjectDataDetectorsFeatures:](self, "setSubjectDataDetectorsFeatures:", v10);

  v72 = CFSTR("IPFeatureExtractorContextDataDetectorsFeatures");
  -[IPFeatureMailScanner subjectDataDetectorsFeatures](self, "subjectDataDetectorsFeatures");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v73, &v72, 1);
  v12 = objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "sentenceFeatureExtractor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = v13;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v71, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)v7;
  v52 = (void *)v12;
  -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v7, v5, v14, v12);
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  v61 = 0u;
  v62 = 0u;
  v59 = 0u;
  v60 = 0u;
  -[IPFeatureMailScanner subjectDataDetectorsFeatures](self, "subjectDataDetectorsFeatures");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v60;
    v19 = MEMORY[0x24BDBD1C8];
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v60 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v59 + 1) + 8 * i), "contextDictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, CFSTR("extractedInSubject"));

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v59, v70, 16);
    }
    while (v17);
  }

  objc_msgSend(v5, "text");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "dataDetectorsFeatureExtractor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v69 = v23;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v69, 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v22, v5, v24, 0);
  v25 = objc_claimAutoreleasedReturnValue();

  v67[1] = CFSTR("IPFeatureExtractorContextDataDetectorsFeatures");
  v68[0] = v53;
  v67[0] = CFSTR("IPFeatureExtractorPreviousFeatureSentences");
  -[IPFeatureScanner _sortedFeaturesByRange:](self, "_sortedFeaturesByRange:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = v26;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
  v27 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "text");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "sentenceFeatureExtractor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v29;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v66, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v27;
  -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v28, v5, v30, v27);
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = v31;
  v32 = (void *)objc_msgSend(v31, "mutableCopy");
  v33 = v32;
  if (v25)
    objc_msgSend(v32, "addObjectsFromArray:", v25);
  v49 = v33;
  v51 = (void *)v25;
  objc_msgSend((id)objc_opt_class(), "keywordFeatureExtractor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v65, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v54, v5, v35, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v37 = v36;
  v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
  if (v38)
  {
    v39 = v38;
    v40 = *(_QWORD *)v56;
    v41 = MEMORY[0x24BDBD1C8];
    do
    {
      for (j = 0; j != v39; ++j)
      {
        if (*(_QWORD *)v56 != v40)
          objc_enumerationMutation(v37);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "contextDictionary");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "setObject:forKeyedSubscript:", v41, CFSTR("IPFeatureKeywordContextExtractedFromSubject"));

      }
      v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
    }
    while (v39);
  }

  objc_msgSend(v5, "lowercaseTextTruncated");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v63 = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v63, 1);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v44, v5, v45, 0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v37)
    objc_msgSend(v49, "addObjectsFromArray:", v37);
  if (v46)
    objc_msgSend(v49, "addObjectsFromArray:", v46);

  return v49;
}

void __81__IPFeatureMailScanner_scanEventsInMessageUnits_synchronously_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  void *v4;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  objc_msgSend(*(id *)(a1 + 32), "doSynchronousScanWithCompletionHandler:", *(_QWORD *)(a1 + 40));
  objc_sync_exit(v2);

  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

}

- (void)doSynchronousScanWithCompletionHandler:(id)a3
{
  void (**v4)(id, _QWORD, int64_t);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  void *v21;
  int64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  NSObject *v43;
  void *v44;
  id v45;
  IPFeatureMailScanner *v46;
  void *v47;
  unint64_t v48;
  void *v49;
  NSObject *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  NSObject *v57;
  void *v58;
  id v59;
  IPFeatureMailScanner *v60;
  void *v61;
  unint64_t v62;
  void *v63;
  NSObject *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  NSObject *v73;
  void *v74;
  id v75;
  IPFeatureMailScanner *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  char v82;
  uint64_t k;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t m;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  NSObject *v100;
  void *v101;
  uint64_t v102;
  void *v103;
  NSObject *v104;
  void *v105;
  id v106;
  IPFeatureMailScanner *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  uint64_t v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t n;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  unint64_t v126;
  void *v127;
  NSObject *v128;
  IPFeatureMailScanner *v129;
  IPFeatureMailScanner *v130;
  uint64_t v131;
  void *v132;
  unint64_t v133;
  void *v134;
  NSObject *v135;
  uint64_t v136;
  uint64_t v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void (**v145)(id, _QWORD, int64_t);
  void *v146;
  IPFeatureMailScanner *v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  uint8_t v172[128];
  uint8_t buf[4];
  uint64_t v174;
  _QWORD v175[4];

  v175[1] = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, int64_t))a3;
  objc_msgSend((id)objc_opt_class(), "dataDetectorsFeatureExtractor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v175[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v175, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPFeatureScanner bodyMessageUnits](self, "bodyMessageUnits");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "originalMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "subject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "originalMessage");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sender");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "originalMessage");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "dateSent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[IPFeatureScanner subjectEventVocabularyRejectionKeyword:](self, "subjectEventVocabularyRejectionKeyword:", v10);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v147 = self;
  if (!v15)
  {
    if (-[IPFeatureMailScanner isBannedSender:](self, "isBannedSender:", v12))
    {
      -[IPFeatureScanner setResultType:](self, "setResultType:", -40);
      v18 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v18 = _IPLogHandle;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219581000, v18, OS_LOG_TYPE_INFO, "Skipping message unit because sender is banned #FeatureManager", buf, 2u);
      }
      if (IPDebuggingModeEnabled_once != -1)
        dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
      if (IPDebuggingModeEnabled_sEnabled)
      {
        v19 = _IPLogHandle;
        if (!_IPLogHandle)
        {
          IPInitLogging();
          v19 = _IPLogHandle;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          v20 = v19;
          objc_msgSend(v12, "email");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v174 = (uint64_t)v21;
          _os_log_impl(&dword_219581000, v20, OS_LOG_TYPE_INFO, "Banned sender: %@ #FeatureManager", buf, 0xCu);

          v15 = 0;
        }
      }
      goto LABEL_25;
    }
    v145 = v4;
    -[IPFeatureMailScanner setSubjectDataDetectorsFeatures:](self, "setSubjectDataDetectorsFeatures:", MEMORY[0x24BDBD1A8]);
    -[IPFeatureScanner subjectEventVocabularyIgnoreDateKeyword:](self, "subjectEventVocabularyIgnoreDateKeyword:", v10);
    v139 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v139)
    {
      -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v10, v8, v6, 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[IPFeatureMailScanner setSubjectDataDetectorsFeatures:](self, "setSubjectDataDetectorsFeatures:", v23);

    }
    v144 = v6;
    -[IPFeatureMailScanner setDateInSubjectFeatureData:](self, "setDateInSubjectFeatureData:", 0);
    v166 = 0u;
    v167 = 0u;
    v164 = 0u;
    v165 = 0u;
    -[IPFeatureMailScanner subjectDataDetectorsFeatures](self, "subjectDataDetectorsFeatures");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "reverseObjectEnumerator");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v164, v172, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v165;
      while (2)
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v165 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v164 + 1) + 8 * i);
          if (!objc_msgSend(v30, "type") || objc_msgSend(v30, "type") == 1)
          {
            -[IPFeatureMailScanner setDateInSubjectFeatureData:](v147, "setDateInSubjectFeatureData:", v30);
            -[IPFeatureMailScanner setSubjectContainsDate:](v147, "setSubjectContainsDate:", 1);
            goto LABEL_40;
          }
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v164, v172, 16);
        if (v27)
          continue;
        break;
      }
    }
LABEL_40:

    v162 = 0u;
    v163 = 0u;
    v160 = 0u;
    v161 = 0u;
    -[IPFeatureScanner bodyMessageUnits](v147, "bodyMessageUnits");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v160, v171, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v161;
      do
      {
        for (j = 0; j != v33; ++j)
        {
          if (*(_QWORD *)v161 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v160 + 1) + 8 * j);
          v37 = (void *)MEMORY[0x219A2F708]();
          -[IPFeatureMailScanner processScanOfMessageUnit:](v147, "processScanOfMessageUnit:", v36);
          objc_autoreleasePoolPop(v37);
        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v160, v171, 16);
      }
      while (v33);
    }

    v38 = (void *)_IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v38 = (void *)_IPLogHandle;
    }
    v39 = v38;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      -[IPFeatureScanner detectedEvents](v147, "detectedEvents");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "count");
      *(_DWORD *)buf = 134217984;
      v174 = v41;
      _os_log_impl(&dword_219581000, v39, OS_LOG_TYPE_INFO, "%lu detected events #FeatureManager", buf, 0xCu);

    }
    if (IPDebuggingModeEnabled_once != -1)
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
    if (IPDebuggingModeEnabled_sEnabled)
    {
      v42 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v42 = (void *)_IPLogHandle;
      }
      v43 = v42;
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        -[IPFeatureScanner detectedEvents](v147, "detectedEvents");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "valueForKey:", CFSTR("ipsos_betterDescription"));
        v45 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v174 = (uint64_t)v45;
        _os_log_impl(&dword_219581000, v43, OS_LOG_TYPE_INFO, "Detected Events: %@ #FeatureManager", buf, 0xCu);

      }
    }
    v46 = v147;
    -[IPFeatureScanner detectedEvents](v147, "detectedEvents");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");

    if (v48 >= 0xA)
    {
      v49 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v49 = (void *)_IPLogHandle;
      }
      v50 = v49;
      if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
      {
        -[IPFeatureScanner detectedEvents](v147, "detectedEvents");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = objc_msgSend(v51, "count");
        *(_DWORD *)buf = 134217984;
        v174 = v52;
        _os_log_impl(&dword_219581000, v50, OS_LOG_TYPE_INFO, "Too many UNSTITCHED dates. (%lu)  Skipping. #FeatureManager", buf, 0xCu);

      }
      v46 = v147;
      -[IPFeatureScanner setResultType:](v147, "setResultType:", -12);
      -[IPFeatureScanner detectedEvents](v147, "detectedEvents");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "removeAllObjects");

    }
    -[IPFeatureScanner detectedEvents](v46, "detectedEvents");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner stitchedEventsFromEvents:](v46, "stitchedEventsFromEvents:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner setStitchedEvents:](v46, "setStitchedEvents:", v55);

    if (IPDebuggingModeEnabled_once != -1)
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
    if (IPDebuggingModeEnabled_sEnabled)
    {
      v56 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v56 = (void *)_IPLogHandle;
      }
      v57 = v56;
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        -[IPFeatureScanner stitchedEvents](v147, "stitchedEvents");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "valueForKey:", CFSTR("ipsos_betterDescription"));
        v59 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v174 = (uint64_t)v59;
        _os_log_impl(&dword_219581000, v57, OS_LOG_TYPE_INFO, "Stitched Events: %@ #FeatureManager", buf, 0xCu);

      }
    }
    v60 = v147;
    -[IPFeatureScanner stitchedEvents](v147, "stitchedEvents");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = objc_msgSend(v61, "count");

    if (v62 >= 3)
    {
      v63 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v63 = (void *)_IPLogHandle;
      }
      v64 = v63;
      if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
      {
        -[IPFeatureScanner stitchedEvents](v147, "stitchedEvents");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = objc_msgSend(v65, "count");
        *(_DWORD *)buf = 134217984;
        v174 = v66;
        _os_log_impl(&dword_219581000, v64, OS_LOG_TYPE_INFO, "Too many STITCHED dates. (%lu)  Skipping. #FeatureManager", buf, 0xCu);

      }
      v60 = v147;
      -[IPFeatureScanner setResultType:](v147, "setResultType:", -12);
      -[IPFeatureScanner setStitchedEvents:](v147, "setStitchedEvents:", MEMORY[0x24BDBD1A8]);
    }
    if (-[IPFeatureMailScanner subjectContainsDate](v60, "subjectContainsDate"))
    {
      -[IPFeatureMailScanner dateInSubjectFeatureData](v60, "dateInSubjectFeatureData");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "value");
      v68 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v68 = 0;
    }
    -[IPFeatureScanner stitchedEvents](v60, "stitchedEvents");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner bodyMessageUnits](v60, "bodyMessageUnits");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner bodyDataDetectorsFeatures](v60, "bodyDataDetectorsFeatures");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureMailScanner enrichEvents:messageUnits:dateInSubject:dataFeatures:](v60, "enrichEvents:messageUnits:dateInSubject:dataFeatures:", v69, v70, v68, v71);

    if (IPDebuggingModeEnabled_once != -1)
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
    if (IPDebuggingModeEnabled_sEnabled)
    {
      v72 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v72 = (void *)_IPLogHandle;
      }
      v73 = v72;
      if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
      {
        -[IPFeatureScanner stitchedEvents](v147, "stitchedEvents");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "valueForKey:", CFSTR("ipsos_betterDescription"));
        v75 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v174 = (uint64_t)v75;
        _os_log_impl(&dword_219581000, v73, OS_LOG_TYPE_INFO, "Enriched Events based on Event Type: %@ #FeatureManager", buf, 0xCu);

      }
    }
    v138 = v68;
    v140 = v14;
    v141 = v12;
    v142 = v10;
    v143 = v8;
    v158 = 0u;
    v159 = 0u;
    v156 = 0u;
    v157 = 0u;
    v76 = v147;
    -[IPFeatureScanner stitchedEvents](v147, "stitchedEvents");
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v78 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v156, v170, 16);
    if (v78)
    {
      v79 = v78;
      v80 = 0;
      v81 = *(_QWORD *)v157;
      v82 = 1;
      v146 = v77;
      do
      {
        for (k = 0; k != v79; ++k)
        {
          if (*(_QWORD *)v157 != v81)
            objc_enumerationMutation(v77);
          v84 = *(void **)(*((_QWORD *)&v156 + 1) + 8 * k);
          objc_msgSend(v84, "location");
          v85 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v85)
          {
            if ((v82 & 1) != 0)
            {
              v154 = 0u;
              v155 = 0u;
              v152 = 0u;
              v153 = 0u;
              -[IPFeatureMailScanner subjectDataDetectorsFeatures](v76, "subjectDataDetectorsFeatures");
              v86 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "reverseObjectEnumerator");
              v87 = (void *)objc_claimAutoreleasedReturnValue();

              v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
              if (v88)
              {
                v89 = v88;
                v90 = *(_QWORD *)v153;
                while (2)
                {
                  for (m = 0; m != v89; ++m)
                  {
                    if (*(_QWORD *)v153 != v90)
                      objc_enumerationMutation(v87);
                    v92 = *(void **)(*((_QWORD *)&v152 + 1) + 8 * m);
                    if (objc_msgSend(v92, "type") == 3
                      || objc_msgSend(v92, "type") == 7
                      || objc_msgSend(v92, "type") == 12
                      || objc_msgSend(v92, "type") == 13)
                    {
                      v76 = v147;
                      -[IPFeatureScanner cleanedStringForFeatureData:](v147, "cleanedStringForFeatureData:", v92);
                      v93 = objc_claimAutoreleasedReturnValue();

                      v80 = (void *)v93;
                      goto LABEL_110;
                    }
                  }
                  v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v152, v169, 16);
                  if (v89)
                    continue;
                  break;
                }
                v76 = v147;
LABEL_110:
                v77 = v146;
              }

            }
            objc_msgSend(v84, "setLocation:", v80);
            v82 = 0;
          }
        }
        v79 = objc_msgSend(v77, "countByEnumeratingWithState:objects:count:", &v156, v170, 16);
      }
      while (v79);
    }
    else
    {
      v80 = 0;
    }
    v94 = v80;

    -[IPFeatureScanner stitchedEvents](v76, "stitchedEvents");
    v95 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner adjustTimeForEvents:](v76, "adjustTimeForEvents:", v95);

    -[IPFeatureScanner stitchedEvents](v76, "stitchedEvents");
    v96 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner confidenceForEvents:](v76, "confidenceForEvents:", v96);

    -[IPFeatureScanner stitchedEvents](v76, "stitchedEvents");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v140;
    -[IPFeatureScanner filteredEventsForDetectedEvents:referenceDate:](v76, "filteredEventsForDetectedEvents:referenceDate:", v97, v140);
    v98 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner setFilteredDetectedEvents:](v76, "setFilteredDetectedEvents:", v98);

    v99 = (void *)_IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v99 = (void *)_IPLogHandle;
    }
    v100 = v99;
    v10 = v142;
    v8 = v143;
    v12 = v141;
    if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
    {
      -[IPFeatureScanner filteredDetectedEvents](v147, "filteredDetectedEvents");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = objc_msgSend(v101, "count");
      *(_DWORD *)buf = 134217984;
      v174 = v102;
      _os_log_impl(&dword_219581000, v100, OS_LOG_TYPE_INFO, "%lu detected events after filtering #FeatureManager", buf, 0xCu);

    }
    if (IPDebuggingModeEnabled_once != -1)
      dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
    if (IPDebuggingModeEnabled_sEnabled)
    {
      v103 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v103 = (void *)_IPLogHandle;
      }
      v104 = v103;
      if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
      {
        -[IPFeatureScanner filteredDetectedEvents](v147, "filteredDetectedEvents");
        v105 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v105, "valueForKey:", CFSTR("ipsos_betterDescription"));
        v106 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v174 = (uint64_t)v106;
        _os_log_impl(&dword_219581000, v104, OS_LOG_TYPE_INFO, "Filtered Events: %@ #FeatureManager", buf, 0xCu);

      }
    }
    v107 = v147;
    -[IPFeatureScanner filteredDetectedEvents](v147, "filteredDetectedEvents");
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner normalizedEvents:](v147, "normalizedEvents:", v108);

    -[IPFeatureScanner extractedNotesStrings](v147, "extractedNotesStrings");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureMailScanner subjectDataDetectorsFeatures](v147, "subjectDataDetectorsFeatures");
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner notesStringsFromDataFeatures:](v147, "notesStringsFromDataFeatures:", v110);
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "addObjectsFromArray:", v111);

    -[IPFeatureScanner extractedNotesStrings](v147, "extractedNotesStrings");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    v113 = objc_msgSend(v112, "count");

    if (v113)
    {
      -[IPFeatureScanner extractedNotesStrings](v147, "extractedNotesStrings");
      v114 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v114, "allObjects");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v115, "_pas_componentsJoinedByString:", CFSTR("\n"));
      v116 = (void *)objc_claimAutoreleasedReturnValue();

      v150 = 0u;
      v151 = 0u;
      v148 = 0u;
      v149 = 0u;
      -[IPFeatureScanner filteredDetectedEvents](v147, "filteredDetectedEvents");
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      v118 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v148, v168, 16);
      if (v118)
      {
        v119 = v118;
        v120 = *(_QWORD *)v149;
        do
        {
          for (n = 0; n != v119; ++n)
          {
            if (*(_QWORD *)v149 != v120)
              objc_enumerationMutation(v117);
            objc_msgSend(*(id *)(*((_QWORD *)&v148 + 1) + 8 * n), "setNotes:", v116);
          }
          v119 = objc_msgSend(v117, "countByEnumeratingWithState:objects:count:", &v148, v168, 16);
        }
        while (v119);
      }

      v107 = v147;
    }
    -[IPFeatureScanner filteredDetectedEvents](v107, "filteredDetectedEvents");
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "count");

    if (v123 == 1)
    {
      -[IPFeatureScanner setResultType:](v107, "setResultType:", 1);
      -[IPFeatureScanner filteredDetectedEvents](v107, "filteredDetectedEvents");
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v145;
      ((void (**)(id, void *, int64_t))v145)[2](v145, v124, -[IPFeatureScanner resultType](v107, "resultType"));

      v6 = v144;
LABEL_154:
      v15 = 0;
      goto LABEL_155;
    }
    -[IPFeatureScanner filteredDetectedEvents](v107, "filteredDetectedEvents");
    v125 = (void *)objc_claimAutoreleasedReturnValue();
    v126 = objc_msgSend(v125, "count");

    v6 = v144;
    v4 = v145;
    if (v126 < 3)
    {
      -[IPFeatureScanner filteredDetectedEvents](v107, "filteredDetectedEvents");
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      v133 = objc_msgSend(v132, "count");

      if (v133 < 2)
      {
        v137 = -[IPFeatureScanner resultType](v107, "resultType");
        v145[2](v145, MEMORY[0x24BDBD1A8], v137);
        goto LABEL_154;
      }
      v134 = (void *)_IPLogHandle;
      v15 = 0;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v134 = (void *)_IPLogHandle;
      }
      v135 = v134;
      if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219581000, v135, OS_LOG_TYPE_INFO, "Bailing out because more than 1 EVENT are detected #FeatureManager", buf, 2u);
      }

      v129 = v147;
      v130 = v147;
      v131 = -68;
    }
    else
    {
      v127 = (void *)_IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v127 = (void *)_IPLogHandle;
      }
      v128 = v127;
      v15 = 0;
      if (os_log_type_enabled(v128, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219581000, v128, OS_LOG_TYPE_INFO, "Bailing out because more than 3 EVENTS are detected #FeatureManager", buf, 2u);
      }

      v129 = v147;
      v130 = v147;
      v131 = 2;
    }
    -[IPFeatureScanner setResultType:](v130, "setResultType:", v131);
    v136 = -[IPFeatureScanner resultType](v129, "resultType");
    v145[2](v145, MEMORY[0x24BDBD1A8], v136);
LABEL_155:

    goto LABEL_26;
  }
  -[IPFeatureScanner setResultType:](self, "setResultType:", -50);
  v16 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v16 = _IPLogHandle;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219581000, v16, OS_LOG_TYPE_INFO, "Found REJECTION keyword in SUBJECT #FeatureManager", buf, 2u);
  }
  if (IPDebuggingModeEnabled_once != -1)
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v17 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v17 = _IPLogHandle;
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v174 = (uint64_t)v15;
      _os_log_impl(&dword_219581000, v17, OS_LOG_TYPE_INFO, "Subject rejection keyword: %@ #FeatureManager", buf, 0xCu);
    }
  }
LABEL_25:
  v22 = -[IPFeatureScanner resultType](self, "resultType");
  v4[2](v4, MEMORY[0x24BDBD1A8], v22);
LABEL_26:

}

- (void)processScanOfMessageUnit:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t i;
  void *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  NSObject *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t k;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  void *v84;
  NSObject *v85;
  NSObject *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  _BYTE v114[128];
  void *v115;
  _BYTE v116[128];
  const __CFString *v117;
  uint64_t v118;
  void *v119;
  void *v120;
  _QWORD v121[2];
  _QWORD v122[2];
  _BYTE v123[128];
  void *v124;
  const __CFString *v125;
  void *v126;
  uint8_t buf[4];
  unint64_t v128;
  const __CFString *v129;
  void *v130;
  _QWORD v131[4];

  v131[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "dataDetectorsFeatureExtractor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v131[0] = v5;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v131, 1);
  v6 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "originalMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "lowercaseSubject");
  v8 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "originalMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "dateSent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[IPFeatureScanner shouldReplaceSendDateWithCurrentDate](self, "shouldReplaceSendDateWithCurrentDate"))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  -[IPFeatureMailScanner dateInSubjectFeatureData](self, "dateInSubjectFeatureData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v129 = CFSTR("IPFeatureExtractorDetectedDateInSubjectFeatureData");
    -[IPFeatureMailScanner dateInSubjectFeatureData](self, "dateInSubjectFeatureData");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v130 = v13;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v130, &v129, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  objc_msgSend(v4, "text");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v15, v4, v6, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[IPFeatureScanner countOfFeaturesContainDateInTheFuture:messageUnitSentDate:](self, "countOfFeaturesContainDateInTheFuture:messageUnitSentDate:", v16, v10)|| (-[IPFeatureMailScanner subjectDataDetectorsFeatures](self, "subjectDataDetectorsFeatures"), v18 = (void *)objc_claimAutoreleasedReturnValue(), v19 = objc_msgSend(v18, "count"), v18, !v19))
  {
    v17 = (void *)objc_msgSend(v16, "copy");
  }
  else
  {
    -[IPFeatureMailScanner subjectDataDetectorsFeatures](self, "subjectDataDetectorsFeatures");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (void *)objc_msgSend(v20, "mutableCopy");

    objc_msgSend(v17, "addObjectsFromArray:", v16);
  }
  v100 = (void *)v6;
  v101 = (void *)v8;
  if (IPDebuggingModeEnabled_once != -1)
    dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
  if (IPDebuggingModeEnabled_sEnabled)
  {
    v21 = _IPLogHandle;
    if (!_IPLogHandle)
    {
      IPInitLogging();
      v21 = _IPLogHandle;
    }
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v128 = (unint64_t)v17;
      _os_log_impl(&dword_219581000, v21, OS_LOG_TYPE_INFO, "Data Detectors Features:\n%@ #FeatureManager", buf, 0xCu);
    }
  }
  v22 = -[IPFeatureScanner countOfFeaturesContainDateInTheFuture:messageUnitSentDate:](self, "countOfFeaturesContainDateInTheFuture:messageUnitSentDate:", v17, v10);
  if (v22)
  {
    v23 = v22;
    if (v22 >= 0xA)
    {
      v24 = v17;
      v25 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v25 = _IPLogHandle;
      }
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v128 = v23;
        _os_log_impl(&dword_219581000, v25, OS_LOG_TYPE_INFO, "Too many DETECTED dates in the future detected. (%lu)  Skipping. #FeatureManager", buf, 0xCu);
      }
      -[IPFeatureScanner setResultType:](self, "setResultType:", -12);
      v17 = v24;
      v26 = (void *)v8;
      goto LABEL_93;
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v10, -10800.0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[IPFeatureScanner dataFeatures:containDateOlderThan:preciseTimeOnly:](self, "dataFeatures:containDateOlderThan:preciseTimeOnly:", v17, v29, 1))
    {
      v30 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v30 = _IPLogHandle;
      }
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219581000, v30, OS_LOG_TYPE_INFO, "Contains a date in the past with precise time. Skipping. #FeatureManager", buf, 2u);
      }
      -[IPFeatureScanner setResultType:](self, "setResultType:", -110);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v10, -31536000.0);
      v31 = objc_claimAutoreleasedReturnValue();

      v99 = (void *)v31;
      if (!-[IPFeatureScanner dataFeatures:containDateOlderThan:preciseTimeOnly:](self, "dataFeatures:containDateOlderThan:preciseTimeOnly:", v17, v31, 0))
      {
        v96 = v17;
        v97 = v16;
        v94 = v14;
        v125 = CFSTR("IPFeatureExtractorContextDataDetectorsFeatures");
        -[IPFeatureMailScanner subjectDataDetectorsFeatures](self, "subjectDataDetectorsFeatures");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v126 = v33;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v126, &v125, 1);
        v34 = objc_claimAutoreleasedReturnValue();

        -[IPFeatureScanner bodyMessageUnits](self, "bodyMessageUnits");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "firstObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "sentenceFeatureExtractor");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v124 = v37;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v124, 1);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v93 = (void *)v34;
        -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v8, v36, v38, v34);
        v98 = (void *)objc_claimAutoreleasedReturnValue();

        v112 = 0u;
        v113 = 0u;
        v110 = 0u;
        v111 = 0u;
        -[IPFeatureMailScanner subjectDataDetectorsFeatures](self, "subjectDataDetectorsFeatures");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
        if (v40)
        {
          v41 = v40;
          v42 = *(_QWORD *)v111;
          v43 = MEMORY[0x24BDBD1C8];
          do
          {
            for (i = 0; i != v41; ++i)
            {
              if (*(_QWORD *)v111 != v42)
                objc_enumerationMutation(v39);
              objc_msgSend(*(id *)(*((_QWORD *)&v110 + 1) + 8 * i), "contextDictionary");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "setObject:forKeyedSubscript:", v43, CFSTR("extractedInSubject"));

            }
            v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v110, v123, 16);
          }
          while (v41);
        }

        v16 = v97;
        v122[0] = v98;
        v121[0] = CFSTR("IPFeatureExtractorPreviousFeatureSentences");
        v121[1] = CFSTR("IPFeatureExtractorContextDataDetectorsFeatures");
        -[IPFeatureScanner _sortedFeaturesByRange:](self, "_sortedFeaturesByRange:", v97);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v122[1] = v46;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, v121, 2);
        v47 = objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "text");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)objc_opt_class(), "sentenceFeatureExtractor");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v120 = v49;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v120, 1);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v92 = (void *)v47;
        -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v48, v4, v50, v47);
        v51 = (void *)objc_claimAutoreleasedReturnValue();

        v95 = v51;
        if (objc_msgSend(v51, "count"))
        {
          v52 = MEMORY[0x24BDBD1C8];
          objc_msgSend((id)objc_opt_class(), "keywordFeatureExtractor");
          v91 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = v91;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v119, 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v117 = CFSTR("IPFeatureExtractorContextSubject");
          v118 = v52;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v101, v4, v53, v54);
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v108 = 0u;
          v109 = 0u;
          v106 = 0u;
          v107 = 0u;
          v56 = v55;
          v57 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
          if (v57)
          {
            v58 = v57;
            v59 = *(_QWORD *)v107;
            v60 = MEMORY[0x24BDBD1C8];
            do
            {
              for (j = 0; j != v58; ++j)
              {
                if (*(_QWORD *)v107 != v59)
                  objc_enumerationMutation(v56);
                objc_msgSend(*(id *)(*((_QWORD *)&v106 + 1) + 8 * j), "contextDictionary");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "setObject:forKeyedSubscript:", v60, CFSTR("IPFeatureKeywordContextExtractedFromSubject"));

              }
              v58 = objc_msgSend(v56, "countByEnumeratingWithState:objects:count:", &v106, v116, 16);
            }
            while (v58);
          }

          objc_msgSend(v4, "lowercaseTextTruncated");
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          v115 = v91;
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v115, 1);
          v64 = (void *)objc_claimAutoreleasedReturnValue();
          -[IPFeatureScanner featuresForTextString:inMessageUnit:extractors:context:](self, "featuresForTextString:inMessageUnit:extractors:context:", v63, v4, v64, 0);
          v65 = objc_claimAutoreleasedReturnValue();

          v66 = (void *)objc_msgSend(v95, "mutableCopy");
          if (v96)
          {
            -[IPFeatureScanner _sortedFeaturesByRange:](self, "_sortedFeaturesByRange:", v96);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "addObjectsFromArray:", v67);

          }
          v14 = v94;
          if (v56)
            objc_msgSend(v66, "addObjectsFromArray:", v56);
          if (v65)
            objc_msgSend(v66, "addObjectsFromArray:", v65);
          v90 = v66;
          objc_msgSend(v4, "setFeatures:", v66);
          if (v96)
          {
            -[IPFeatureScanner bodyDataDetectorsFeatures](self, "bodyDataDetectorsFeatures");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v68, "addObjectsFromArray:", v96);

          }
          if (v56)
          {
            -[IPFeatureMailScanner subjectKeywordFeatures](self, "subjectKeywordFeatures");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v69, "addObjectsFromArray:", v56);

          }
          if (v65)
          {
            -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v70, "addObjectsFromArray:", v65);

          }
          -[IPFeatureScanner augmentDetectedDatesWithEndDates:](self, "augmentDetectedDatesWithEndDates:", v96);
          -[IPFeatureScanner _sortedFeaturesByRange:](self, "_sortedFeaturesByRange:", v66);
          v71 = objc_claimAutoreleasedReturnValue();
          -[IPFeatureScanner bodyAllFeatures](self, "bodyAllFeatures");
          v72 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v72, "addObjectsFromArray:", v71);

          if (IPDebuggingModeEnabled_once != -1)
            dispatch_once(&IPDebuggingModeEnabled_once, &__block_literal_global_430);
          if (IPDebuggingModeEnabled_sEnabled)
          {
            v73 = _IPLogHandle;
            if (!_IPLogHandle)
            {
              IPInitLogging();
              v73 = _IPLogHandle;
            }
            if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v128 = v71;
              _os_log_impl(&dword_219581000, v73, OS_LOG_TYPE_INFO, "Feature detection result:\n--> Unit Features:\n%@ #FeatureManager", buf, 0xCu);
            }
          }
          v89 = (void *)v65;
          -[IPFeatureScanner analyzeFeatures:messageUnit:](self, "analyzeFeatures:messageUnit:", v71, v4, v71);
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          -[IPFeatureScanner setDetectedEvents:](self, "setDetectedEvents:", v74);

          v104 = 0u;
          v105 = 0u;
          v102 = 0u;
          v103 = 0u;
          -[IPFeatureScanner detectedEvents](self, "detectedEvents");
          v75 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
          if (v76)
          {
            v77 = v76;
            v78 = *(_QWORD *)v103;
            do
            {
              for (k = 0; k != v77; ++k)
              {
                if (*(_QWORD *)v103 != v78)
                  objc_enumerationMutation(v75);
                objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * k), "setIpsos_eventAttributes:", objc_msgSend(*(id *)(*((_QWORD *)&v102 + 1) + 8 * k), "ipsos_eventAttributes") | 2);
              }
              v77 = objc_msgSend(v75, "countByEnumeratingWithState:objects:count:", &v102, v114, 16);
            }
            while (v77);
          }

          -[IPFeatureScanner extractedNotesStrings](self, "extractedNotesStrings");
          v80 = (void *)objc_claimAutoreleasedReturnValue();
          v81 = objc_msgSend(v80, "count");

          if (!v81)
          {
            -[IPFeatureScanner extractedNotesStrings](self, "extractedNotesStrings");
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            -[IPFeatureMailScanner subjectDataDetectorsFeatures](self, "subjectDataDetectorsFeatures");
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            -[IPFeatureScanner notesStringsFromDataFeatures:](self, "notesStringsFromDataFeatures:", v83);
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "addObjectsFromArray:", v84);

          }
          v26 = v101;
          v16 = v97;
        }
        else
        {
          v85 = _IPLogHandle;
          v26 = v101;
          v14 = v94;
          if (!_IPLogHandle)
          {
            IPInitLogging();
            v85 = _IPLogHandle;
          }
          if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
            v86 = v85;
            objc_msgSend(v4, "bestLanguageID");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v128 = (unint64_t)v87;
            _os_log_impl(&dword_219581000, v86, OS_LOG_TYPE_INFO, "No sentence polarity extracted. No sentence or no LSTM assets available for language identifier %@ #FeatureManager", buf, 0xCu);

          }
          -[IPFeatureScanner setResultType:](self, "setResultType:", -13);
        }
        v17 = v96;

        v29 = v99;
        goto LABEL_92;
      }
      v32 = _IPLogHandle;
      if (!_IPLogHandle)
      {
        IPInitLogging();
        v32 = _IPLogHandle;
      }
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_219581000, v32, OS_LOG_TYPE_INFO, "Contains a date in the far past. Skipping. #FeatureManager", buf, 2u);
      }
      -[IPFeatureScanner setResultType:](self, "setResultType:", -11);
      v29 = v99;
    }
    v26 = (void *)v8;
LABEL_92:

LABEL_93:
    v28 = v100;
    goto LABEL_94;
  }
  v27 = _IPLogHandle;
  if (!_IPLogHandle)
  {
    IPInitLogging();
    v27 = _IPLogHandle;
  }
  v28 = (void *)v6;
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219581000, v27, OS_LOG_TYPE_INFO, "No date in the future detected. Skipping. #FeatureManager", buf, 2u);
  }
  -[IPFeatureScanner setResultType:](self, "setResultType:", -10);
  v26 = v101;
LABEL_94:

}

- (void)enrichEvents:(id)a3 messageUnits:(id)a4 dateInSubject:(id)a5 dataFeatures:(id)a6
{
  id v10;
  id v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  unsigned int v28;
  int v29;
  char v30;
  uint64_t v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  uint64_t v37;
  int v38;
  void *v39;
  void *v40;
  int v41;
  double v42;
  void *v43;
  id v44;
  _BOOL4 v45;
  char v46;
  double v47;
  char v48;
  int v49;
  IPFeatureMailScanner *v50;
  double v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  double v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  IPFeatureMailScanner *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  int v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  uint64_t v73;
  IPFeatureMailScanner *v74;
  void *v75;
  void *v76;
  char v77;
  void *v78;
  uint64_t v79;
  id v80;
  id v81;
  void *v82;
  void *v83;
  void *v84;
  id obj;
  int v86;
  void *v87;
  id v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  id v93;
  IPFeatureMailScanner *v94;
  uint64_t v95;
  void *v96;
  unsigned int v97;
  char v98;
  unsigned __int8 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v93 = a4;
  v88 = a5;
  v11 = a6;
  if (objc_msgSend(v10, "count"))
  {
    -[IPFeatureScanner movieTitlesFromDataFeatures:](self, "movieTitlesFromDataFeatures:", v11);
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner sportTeamNamesFromDataFeatures:](self, "sportTeamNamesFromDataFeatures:", v11);
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner artisNamesFromDataFeatures:](self, "artisNamesFromDataFeatures:", v11);
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    -[IPFeatureScanner restaurantAndBarPOINamesFromDataFeatures:](self, "restaurantAndBarPOINamesFromDataFeatures:", v11);
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    v94 = self;
    v80 = v11;
    -[IPFeatureScanner entertainmentPOINamesFromDataFeatures:](self, "entertainmentPOINamesFromDataFeatures:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v100 = 0u;
    v101 = 0u;
    v102 = 0u;
    v103 = 0u;
    v81 = v10;
    obj = v10;
    v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v104, 16);
    if (!v92)
      goto LABEL_88;
    v91 = *(_QWORD *)v101;
    v13 = 0x24DAA4000uLL;
    v89 = v12;
    while (1)
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v101 != v91)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * v14);
        v16 = *(void **)(v13 + 2304);
        objc_msgSend(v15, "ipsos_messageUnit");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ipsos_messageUnit");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "keywordFeatures");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "ipsos_dataFeatures");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "eventClassificationTypeFromMessageUnit:keywordFeatures:datafeatures:", v17, v19, v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "setIpsos_eventClassificationType:", v21);

        objc_msgSend(v15, "ipsos_eventClassificationType");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = v22;
        if (v22 && !objc_msgSend(v22, "isFairlyGeneric"))
          goto LABEL_21;
        objc_msgSend(v93, "firstObject");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "bestLanguageID");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v90, "count"))
        {
          objc_msgSend(*(id *)(v13 + 2304), "eventTypeForMoviesAndLanguageID:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v84, "count"))
        {
          objc_msgSend(*(id *)(v13 + 2304), "eventTypeForSportAndLanguageID:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v83, "count"))
        {
          objc_msgSend(*(id *)(v13 + 2304), "eventTypeForCultureAndLanguageID:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v82, "count"))
        {
          objc_msgSend(*(id *)(v13 + 2304), "eventTypeForMealsAndLanguageID:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v12, "count"))
            goto LABEL_20;
          objc_msgSend(*(id *)(v13 + 2304), "eventTypeForEntertainmentAndLanguageID:", v25);
          v26 = objc_claimAutoreleasedReturnValue();
        }
        v27 = (void *)v26;

        v23 = v27;
LABEL_20:
        objc_msgSend(v15, "setIpsos_eventClassificationType:", v23);

        if (!v23)
          goto LABEL_74;
LABEL_21:
        v95 = v14;
        v28 = objc_msgSend(v15, "isAllDay");
        v29 = objc_msgSend(v15, "ipsos_allDayPreferred");
        v30 = objc_msgSend(v15, "ipsos_disableTimeAdjustment");
        v31 = objc_msgSend(v15, "ipsos_isTimeApproximate");
        v32 = objc_msgSend(v15, "ipsos_isEndTimeApproximate");
        objc_msgSend(v15, "startDate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "endDate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = v34;
        v97 = v28;
        if (v28)
        {
          objc_msgSend(v34, "timeIntervalSinceDate:", v33);
          v28 = fabs(v36) > 86400.0;
        }
        else
        {
          objc_msgSend(v23, "adjustedEventClassificationTypeWithStartDate:", v33);
          v37 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "setIpsos_eventClassificationType:", v37);
          v23 = (void *)v37;
        }
        if ((objc_msgSend(v23, "defaultStartingTimeHour") & 0x80000000) != 0)
        {
          v44 = 0;
          goto LABEL_36;
        }
        v86 = v29;
        v38 = v32;
        v39 = v35;
        v40 = (void *)MEMORY[0x24BDBCE60];
        v41 = 3600 * objc_msgSend(v23, "defaultStartingTimeHour");
        v42 = (double)(int)(v41 + 60 * objc_msgSend(v23, "defaultStartingTimeMinutes"));
        -[IPFeatureScanner normalizedAllDayDateFromDate:](v94, "normalizedAllDayDateFromDate:", v33);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "dateWithTimeInterval:sinceDate:", v43, v42);
        v44 = (id)objc_claimAutoreleasedReturnValue();

        v45 = 0;
        v46 = v97;
        if (!v44)
          v46 = 1;
        if ((v46 & 1) == 0 && ((v31 ^ 1) & 1) == 0)
        {
          objc_msgSend(v44, "timeIntervalSinceDate:", v33);
          v45 = fabs(v47) <= 5400.0;
        }
        if (v44)
          v48 = v30;
        else
          v48 = 1;
        v35 = v39;
        if ((v48 & 1) != 0)
        {
          v32 = v38;
LABEL_36:
          v14 = v95;
          goto LABEL_37;
        }
        v32 = v38;
        v14 = v95;
        if (((v97 ^ 1 | v86 | v28) ^ 1 | v45) == 1)
        {
          v54 = v44;

          v31 = 1;
          objc_msgSend(v15, "setIpsos_usesDefaultClassificationTypeStartTime:", 1);
          v44 = v54;

          v97 = 0;
          v33 = v44;
          v35 = v44;
        }
LABEL_37:
        if (v35 == v33)
          v49 = 1;
        else
          v49 = v32;
        if (v97)
        {
          v96 = v35;
          v50 = v94;
        }
        else
        {
          v50 = v94;
          if (v49)
          {
            objc_msgSend(v23, "defaultDuration");
            if (v51 <= 0.0)
            {
              if (-[IPFeatureScanner isDateAroundNoon:](v94, "isDateAroundNoon:", v33))
              {
                v55 = v33;
                v56 = 3600.0;
              }
              else
              {
                v55 = v33;
                v56 = 7200.0;
              }
              objc_msgSend(v55, "dateByAddingTimeInterval:", v56);
              v53 = objc_claimAutoreleasedReturnValue();
            }
            else
            {
              v52 = (void *)MEMORY[0x24BDBCE60];
              objc_msgSend(v23, "defaultDuration");
              objc_msgSend(v52, "dateWithTimeInterval:sinceDate:", v33);
              v53 = objc_claimAutoreleasedReturnValue();
            }
            v57 = (void *)v53;

            v96 = v57;
          }
          else
          {
            v96 = v35;
          }
        }
        v99 = 0;
        objc_msgSend(v93, "objectAtIndexedSubscript:", 0);
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v58, "originalMessage");
        v59 = (void *)objc_claimAutoreleasedReturnValue();

        -[IPFeatureScanner bodyMessageUnits](v50, "bodyMessageUnits");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "subject");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "adjustedEventTitleForMessageUnits:subject:dateInSubject:eventStartDate:isGeneratedFromSubject:", v60, v61, v88, v33, &v99);
        v62 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v23, "defaultTitle");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v61) = objc_msgSend(v63, "isEqualToString:", v62);

        v98 = 0;
        if ((_DWORD)v61)
        {
          if (objc_msgSend(v23, "isSportRelated"))
          {
            v64 = v94;
            v65 = v62;
            v66 = v84;
            goto LABEL_64;
          }
          if (objc_msgSend(v23, "isMovieRelated") && v90)
          {
            v64 = v94;
            v65 = v62;
            v66 = v90;
            goto LABEL_64;
          }
          if (objc_msgSend(v23, "isCultureRelated") && objc_msgSend(v83, "count"))
          {
            v64 = v94;
            v65 = v62;
            v66 = v83;
LABEL_64:
            -[IPFeatureScanner decoratedTitle:withSubtitles:](v64, "decoratedTitle:withSubtitles:", v65, v66);
            v68 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_65:
            v67 = 0;
            goto LABEL_66;
          }
          if (objc_msgSend(v23, "isMealRelated") && objc_msgSend(v82, "count"))
          {
            v74 = v94;
            v75 = v62;
            v76 = v82;
            goto LABEL_85;
          }
          if (!objc_msgSend(v62, "length") && objc_msgSend(v89, "count"))
          {
            v74 = v94;
            v75 = v62;
            v76 = v89;
LABEL_85:
            -[IPFeatureScanner decoratedTitle:withSubtitles:](v74, "decoratedTitle:withSubtitles:", v75, v76);
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v76, "count") == 1)
            {
              objc_msgSend(v76, "firstObject");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_66;
            }
            goto LABEL_65;
          }
          v77 = objc_msgSend(v59, "isGroupConversation");
          v67 = 0;
          if (objc_msgSend(v23, "prefersTitleSenderDecoration") && (v77 & 1) == 0)
          {
            objc_msgSend(v59, "sender");
            v87 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v59, "recipients");
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            -[IPFeatureScanner decoratedTitleFromEventType:title:sender:recipients:isSent:isTitleSenderDecorated:](v94, "decoratedTitleFromEventType:title:sender:recipients:isSent:isTitleSenderDecorated:", v23, v62, v87, v78, objc_msgSend(v59, "isSent"), &v98);
            v68 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_65;
          }
        }
        else
        {
          v67 = 0;
        }
        v68 = v62;
LABEL_66:
        objc_msgSend(v15, "setAllDay:", v97);
        objc_msgSend(v15, "setStartDate:", v33);
        objc_msgSend(v15, "setEndDate:", v96);
        objc_msgSend(v15, "setIpsos_isTimeApproximate:", v31);
        objc_msgSend(v15, "setTitle:", v68);
        if (objc_msgSend(v68, "length"))
        {
          v69 = v99;
          v70 = objc_msgSend(v15, "ipsos_eventAttributes");
          v71 = 1024;
          if (!v69)
            v71 = 2048;
          objc_msgSend(v15, "setIpsos_eventAttributes:", v70 | v71);
          if (v98)
            objc_msgSend(v15, "setIpsos_eventAttributes:", objc_msgSend(v15, "ipsos_eventAttributes") | 0x1000);
        }
        objc_msgSend(v15, "location");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        v73 = objc_msgSend(v72, "length");

        if (!v73)
          objc_msgSend(v15, "setLocation:", v67);

        v12 = v89;
        v13 = 0x24DAA4000;
LABEL_74:
        ++v14;
      }
      while (v92 != v14);
      v79 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v100, v104, 16);
      v92 = v79;
      if (!v79)
      {
LABEL_88:

        v11 = v80;
        v10 = v81;
        break;
      }
    }
  }

}

- (BOOL)isBannedSender:(id)a3
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  char v7;
  char v8;

  objc_msgSend(a3, "email");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("receipts.")) & 1) != 0)
      goto LABEL_10;
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("receipts@")) & 1) != 0)
      goto LABEL_10;
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("info@")) & 1) != 0)
      goto LABEL_10;
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("news@")) & 1) != 0)
      goto LABEL_10;
    if ((objc_msgSend(v3, "containsString:", CFSTR("_news@")) & 1) != 0)
      goto LABEL_10;
    if ((objc_msgSend(v3, "hasPrefix:", CFSTR("noreply@")) & 1) != 0)
      goto LABEL_10;
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@@%@"), CFSTR("radar"), CFSTR("apple.com"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v3, "hasPrefix:", v4);

    if ((v5 & 1) != 0
      || (objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@@%@"), CFSTR("travel"), CFSTR("res"), CFSTR("apple.com")), v6 = (void *)objc_claimAutoreleasedReturnValue(), v7 = objc_msgSend(v3, "hasPrefix:", v6), v6, (v7 & 1) != 0))
    {
LABEL_10:
      v8 = 1;
    }
    else
    {
      v8 = objc_msgSend(v3, "containsString:", CFSTR("newsletter"));
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (double)confidenceForEvent:(id)a3 baseConfidence:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  double v19;
  void *v20;
  unint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  double v26;
  void *v27;
  unint64_t v28;
  double v29;
  void *v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  double v38;
  double v39;
  uint64_t i;
  void *v41;
  void *v42;
  double v43;
  __CFString *v44;
  __CFString *v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  uint64_t v50;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  uint64_t v57;

  v57 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  -[IPFeatureScanner bodyMessageUnits](self, "bodyMessageUnits");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "originalMessage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "isAllDay") & 1) != 0)
  {
    v9 = 0.95;
  }
  else if ((objc_msgSend(v5, "ipsos_usesDefaultClassificationTypeStartTime") & 1) != 0)
  {
    v9 = 0.8;
  }
  else if (objc_msgSend(v5, "ipsos_isTimeApproximate"))
  {
    v9 = 0.8;
  }
  else
  {
    v9 = 1.0;
  }
  if (objc_msgSend(v5, "ipsos_isDateTimeTenseDependent"))
    v10 = v9 * 0.8;
  else
    v10 = v9;
  if (objc_msgSend(v5, "ipsos_timeNeedsMeridianGuess"))
    v10 = v10 * 0.9;
  if (objc_msgSend(v5, "ipsos_isEventTimeOnlyAndReferrengingToSentDate"))
    v10 = v10 * 0.75;
  -[IPFeatureScanner detectedEvents](self, "detectedEvents");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12 < 5)
  {
    -[IPFeatureScanner detectedEvents](self, "detectedEvents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");

    if (v14 < 4)
    {
      -[IPFeatureScanner detectedEvents](self, "detectedEvents");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      if (v16 > 2)
        v10 = v10 * 0.95;
    }
    else
    {
      v10 = v10 * 0.9;
    }
  }
  else
  {
    v10 = v10 * 0.7;
  }
  -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18 < 4)
  {
    -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    if (v21 < 3)
    {
      -[IPFeatureScanner stitchedEvents](self, "stitchedEvents");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");

      if (v23 <= 1)
        v19 = v10;
      else
        v19 = v10 * 0.9;
    }
    else
    {
      v19 = v10 * 0.8;
    }
  }
  else
  {
    v19 = v10 * 0.7;
  }
  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "count");

  if (v25 <= 5)
    v26 = v19;
  else
    v26 = v19 * 0.9;
  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "count");

  if (v28 >= 4)
  {
    v29 = 1.15;
LABEL_35:
    v26 = v26 * v29;
    goto LABEL_38;
  }
  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "count");

  if (v31 >= 3)
  {
    v29 = 1.1;
    goto LABEL_35;
  }
  -[IPFeatureScanner bodyKeywordFeatures](self, "bodyKeywordFeatures");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "count");

  if (v33 > 1)
    v26 = v26 * 1.05;
LABEL_38:
  v54 = 0u;
  v55 = 0u;
  v52 = 0u;
  v53 = 0u;
  objc_msgSend(v5, "ipsos_dataFeatures", 0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
  if (v35)
  {
    v36 = v35;
    v37 = *(_QWORD *)v53;
    v38 = 0.0;
    v39 = 0.0;
    do
    {
      for (i = 0; i != v36; ++i)
      {
        if (*(_QWORD *)v53 != v37)
          objc_enumerationMutation(v34);
        objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "contextDictionary");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("polarityProbability"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();

        if (v42)
        {
          objc_msgSend(v42, "doubleValue");
          if (v43 <= 0.001)
            v43 = -0.0;
          else
            v38 = v38 + 1.0;
          v39 = v39 + v43;
        }

      }
      v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v52, v56, 16);
    }
    while (v36);

    if (v38 > 0.0)
      v26 = v26 * ((1.0 - v39 / v38) * -0.5 + 1.0);
  }
  else
  {

  }
  objc_msgSend(v8, "type");
  v44 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v45 = IPMessageTypeEmail;

  if (v44 == v45)
  {
    objc_msgSend(v5, "ipsos_messageUnit");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "originalMessage");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "isReply");

    if (v48)
      v26 = v26 * 0.85;
    if ((unint64_t)objc_msgSend(v8, "messageUnitsTextLength") > 0xFA0)
      v26 = v26 * 0.5;
  }
  objc_msgSend(v5, "title");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = objc_msgSend(v49, "length");

  if (!v50)
    v26 = v26 * 0.85;

  return v26;
}

- (id)emailParticipantNames
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[IPFeatureScanner messageSenderName](self, "messageSenderName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
    objc_msgSend(v3, "addObject:", v4);
  -[IPFeatureScanner bodyMessageUnits](self, "bodyMessageUnits");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "originalMessage");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "recipients");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v16;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v16 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "displayableName");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v13, "length"))
          objc_msgSend(v3, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v10);
  }

  return v3;
}

- (NSArray)subjectDataDetectorsFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setSubjectDataDetectorsFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSArray)subjectSentenceFeatures
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setSubjectSentenceFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (NSMutableArray)subjectKeywordFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 112, 1);
}

- (void)setSubjectKeywordFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 112);
}

- (NSMutableArray)subjectAndBodyDataDetectorsFeatures
{
  return (NSMutableArray *)objc_getProperty(self, a2, 120, 1);
}

- (void)setSubjectAndBodyDataDetectorsFeatures:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 120);
}

- (BOOL)subjectContainsDate
{
  return self->_subjectContainsDate;
}

- (IPFeatureData)dateInSubjectFeatureData
{
  return (IPFeatureData *)objc_getProperty(self, a2, 128, 1);
}

- (void)setDateInSubjectFeatureData:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateInSubjectFeatureData, 0);
  objc_storeStrong((id *)&self->_subjectAndBodyDataDetectorsFeatures, 0);
  objc_storeStrong((id *)&self->_subjectKeywordFeatures, 0);
  objc_storeStrong((id *)&self->_subjectSentenceFeatures, 0);
  objc_storeStrong((id *)&self->_subjectDataDetectorsFeatures, 0);
}

@end
