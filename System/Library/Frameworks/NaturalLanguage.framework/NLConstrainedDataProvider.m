@implementation NLConstrainedDataProvider

- (NLConstrainedDataProvider)initWithDataProvider:(id)a3 parameters:(_NLConstraintParameters *)a4 modelTrainer:(id)a5
{
  id v9;
  id v10;
  NLConstrainedDataProvider *v11;
  NLTagger *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  void *v26;
  NLTagger *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  __int128 v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  NSObject *v43;
  id v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  uint64_t v48;
  uint64_t i;
  uint64_t v50;
  void *v51;
  unint64_t v52;
  unint64_t v53;
  id v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t j;
  void *v59;
  unint64_t v60;
  unint64_t v61;
  void *v62;
  unint64_t v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  NSArray *locators;
  NSArray *v74;
  NSDictionary *labelMap;
  NSDictionary *v76;
  NSDictionary *inverseLabelMap;
  NSDictionary *v78;
  NSDictionary *vocabularyMap;
  NSDictionary *v80;
  NSDictionary *documentFrequencyMap;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  NLConstrainedDataProvider *v87;
  NSDictionary *v88;
  void *v89;
  unint64_t v90;
  NLTagger *v91;
  id v92;
  NSArray *v93;
  NSDictionary *v94;
  unint64_t v95;
  NSDictionary *v96;
  NSDictionary *v97;
  __int128 v98;
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
  objc_super v110;
  _BYTE v111[128];
  _BYTE v112[128];
  uint8_t v113[128];
  _BYTE buf[32];
  __int128 v115;
  _QWORD v116[4];

  v116[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v110.receiver = self;
  v110.super_class = (Class)NLConstrainedDataProvider;
  v11 = -[NLConstrainedDataProvider init](&v110, sel_init);
  if (v11)
  {
    v86 = a3;
    v92 = v10;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v93 = (NSArray *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "labelMap");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "vocabularyMap");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "documentFrequencyMap");
    v85 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v96 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v88 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v94 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v97 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v89 = v9;
    v90 = objc_msgSend(v9, "numberOfInstances");
    v12 = [NLTagger alloc];
    v116[0] = CFSTR("TokenType");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v116, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = -[NLTagger initWithTagSchemes:](v12, "initWithTagSchemes:", v13);

    v14 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "internal");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 0;
      _os_log_impl(&dword_1A36A7000, v16, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v14);
    if (objc_msgSend(&unk_1E4A47DE8, "count"))
    {
      v17 = 0;
      do
      {
        v18 = (void *)MEMORY[0x1A8592E0C]();
        NLGetLogCategory(0);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "internal");
        v20 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(&unk_1E4A47DE8, "objectAtIndexedSubscript:", v17);
          v21 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
          v22 = objc_msgSend(v21, "UTF8String");
          *(_DWORD *)buf = 134218498;
          *(_QWORD *)&buf[4] = 1;
          *(_WORD *)&buf[12] = 2048;
          *(_QWORD *)&buf[14] = v17;
          *(_WORD *)&buf[22] = 2082;
          *(_QWORD *)&buf[24] = v22;
          _os_log_impl(&dword_1A36A7000, v20, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %{public}s", buf, 0x20u);

        }
        objc_autoreleasePoolPop(v18);
        ++v17;
      }
      while (v17 < objc_msgSend(&unk_1E4A47DE8, "count"));
    }
    v87 = v11;
    v23 = v90;
    v24 = (unint64_t)((double)(v90 / 0x64) * 10.0);
    if (v24 <= 1)
      v24 = 1;
    if (v24 >= 0x64)
      v25 = 100;
    else
      v25 = v24;
    v27 = v91;
    v26 = v92;
    if (v90)
    {
      v28 = 0;
      v29 = -1;
      do
      {
        objc_msgSend(v89, "instanceAtIndex:", v28);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v89, "tokenizer");
        v32 = *(_OWORD *)&a4->maxSplitTokens;
        *(_OWORD *)buf = *(_OWORD *)&a4->splitSentences;
        *(_OWORD *)&buf[16] = v32;
        v115 = *(_OWORD *)&a4->maxLabels;
        objc_msgSend(v30, "locatorsWithIndex:parameters:tagger:tokenizer:", v28, buf, v27, v31);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = -[NSArray addObjectsFromArray:](v93, "addObjectsFromArray:", v33);
        if (!((v23 + v29) % v25))
        {
          v35 = (void *)MEMORY[0x1A8592E0C](v34);
          NLGetLogCategory(0);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "internal");
          v37 = objc_claimAutoreleasedReturnValue();

          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)&buf[4] = 2;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = 0;
            *(_WORD *)&buf[22] = 2048;
            *(_QWORD *)&buf[24] = v28 + 1;
            _os_log_impl(&dword_1A36A7000, v37, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %lu", buf, 0x20u);
          }

          objc_autoreleasePoolPop(v35);
          v38 = (void *)MEMORY[0x1A8592E0C]();
          NLGetLogCategory(0);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "internal");
          v40 = objc_claimAutoreleasedReturnValue();

          v23 = v90;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218496;
            *(_QWORD *)&buf[4] = 2;
            *(_WORD *)&buf[12] = 2048;
            *(_QWORD *)&buf[14] = 1;
            *(_WORD *)&buf[22] = 2048;
            *(_QWORD *)&buf[24] = v90;
            _os_log_impl(&dword_1A36A7000, v40, OS_LOG_TYPE_INFO, "event: %lu, column: %lu, value: %lu", buf, 0x20u);
          }

          objc_autoreleasePoolPop(v38);
          v27 = v91;
          v26 = v92;
        }
        reportInstanceCompletionToTrainer(v26, v28, v23, 1);

        ++v28;
        --v29;
      }
      while (v23 != v28);
    }
    v41 = (void *)MEMORY[0x1A8592E0C]();
    NLGetLogCategory(0);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "internal");
    v43 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = 3;
      _os_log_impl(&dword_1A36A7000, v43, OS_LOG_TYPE_INFO, "event: %lu", buf, 0xCu);
    }

    objc_autoreleasePoolPop(v41);
    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v44 = v83;
    v45 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
    if (v45)
    {
      v46 = v45;
      v47 = 0;
      v48 = *(_QWORD *)v107;
      do
      {
        for (i = 0; i != v46; ++i)
        {
          if (*(_QWORD *)v107 != v48)
            objc_enumerationMutation(v44);
          v50 = *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * i);
          objc_msgSend(v44, "objectForKey:", v50);
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v52 = objc_msgSend(v51, "unsignedIntegerValue");
          if (a4->maxLabels - 1 >= v52)
          {
            v53 = v52;
            -[NSDictionary setObject:forKey:](v96, "setObject:forKey:", v51, v50);
            -[NSDictionary setObject:forKey:](v88, "setObject:forKey:", v50, v51);
            if (v53 > v47)
              v47 = v53;
          }

        }
        v46 = objc_msgSend(v44, "countByEnumeratingWithState:objects:count:", &v106, v113, 16);
      }
      while (v46);
    }
    else
    {
      v47 = 0;
    }

    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v54 = v84;
    v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
    if (v55)
    {
      v56 = v55;
      v95 = 0;
      v57 = *(_QWORD *)v103;
      do
      {
        for (j = 0; j != v56; ++j)
        {
          if (*(_QWORD *)v103 != v57)
            objc_enumerationMutation(v54);
          v59 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
          v60 = tokenIDFromTokenAndVocabularyMap(v59, v54);
          if (v60 >= 0x10)
          {
            v61 = v60;
            if (a4->maxVocabularySize - 1 >= v60)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v60);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary setObject:forKey:](v94, "setObject:forKey:", v62, v59);

              v63 = v95;
              if (v61 > v95)
                v63 = v61;
              v95 = v63;
            }
          }
        }
        v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v102, v112, 16);
      }
      while (v56);
    }
    else
    {
      v95 = 0;
    }

    v100 = 0u;
    v101 = 0u;
    v98 = 0u;
    v99 = 0u;
    v64 = v85;
    v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
    if (v65)
    {
      v66 = v65;
      v67 = *(_QWORD *)v99;
      do
      {
        for (k = 0; k != v66; ++k)
        {
          if (*(_QWORD *)v99 != v67)
            objc_enumerationMutation(v64);
          v69 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * k);
          objc_msgSend(v64, "objectForKey:", v69);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if (a4->maxVocabularySize - 1 >= objc_msgSend(v69, "unsignedIntegerValue"))
            -[NSDictionary setObject:forKey:](v97, "setObject:forKey:", v70, v69);

        }
        v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v98, v111, 16);
      }
      while (v66);
    }

    v11 = v87;
    objc_storeStrong((id *)&v87->_dataProvider, v86);
    v72 = *(_OWORD *)&a4->maxSplitTokens;
    v71 = *(_OWORD *)&a4->maxLabels;
    *(_OWORD *)&v87->_parameters.splitSentences = *(_OWORD *)&a4->splitSentences;
    *(_OWORD *)&v87->_parameters.maxSplitTokens = v72;
    *(_OWORD *)&v87->_parameters.maxLabels = v71;
    locators = v87->_locators;
    v87->_locators = v93;
    v74 = v93;

    labelMap = v87->_labelMap;
    v87->_labelMap = v96;
    v76 = v96;

    inverseLabelMap = v87->_inverseLabelMap;
    v87->_inverseLabelMap = v88;
    v78 = v88;

    vocabularyMap = v87->_vocabularyMap;
    v87->_vocabularyMap = v94;
    v80 = v94;

    documentFrequencyMap = v87->_documentFrequencyMap;
    v87->_documentFrequencyMap = v97;

    v87->_numberOfLabels = v47 + 1;
    v87->_numberOfVocabularyEntries = v95 + 1;

    v9 = v89;
    v10 = v92;
  }

  return v11;
}

- (id)configuration
{
  return -[NLDataProvider configuration](self->_dataProvider, "configuration");
}

- (unint64_t)numberOfInstances
{
  return -[NSArray count](self->_locators, "count");
}

- (id)instanceAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[NSArray objectAtIndex:](self->_locators, "objectAtIndex:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLDataProvider instanceAtIndex:](self->_dataProvider, "instanceAtIndex:", objc_msgSend(v4, "instanceIndex"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subInstanceWithLocator:tokenizer:", v4, -[NLConstrainedDataProvider tokenizer](self, "tokenizer"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (__CFStringTokenizer)tokenizer
{
  return -[NLDataProvider tokenizer](self->_dataProvider, "tokenizer");
}

- (id)labelMap
{
  return self->_labelMap;
}

- (id)inverseLabelMap
{
  return self->_inverseLabelMap;
}

- (id)vocabularyMap
{
  return self->_vocabularyMap;
}

- (id)documentFrequencyMap
{
  return self->_documentFrequencyMap;
}

- (unint64_t)numberOfLabels
{
  return self->_numberOfLabels;
}

- (unint64_t)numberOfVocabularyEntries
{
  return self->_numberOfVocabularyEntries;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentFrequencyMap, 0);
  objc_storeStrong((id *)&self->_vocabularyMap, 0);
  objc_storeStrong((id *)&self->_inverseLabelMap, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_locators, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
}

@end
