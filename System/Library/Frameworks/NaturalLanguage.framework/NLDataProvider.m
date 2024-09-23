@implementation NLDataProvider

- (NLDataProvider)initWithConfiguration:(id)a3 dataURL:(id)a4
{
  id v6;
  id v7;
  NLDataProvider *v8;
  void *v9;
  void *v10;
  CFStringTokenizerRef v11;
  uint64_t v12;
  NLModelConfiguration *configuration;
  uint64_t v14;
  NSArray *instances;
  objc_super v17;
  CFRange v18;

  v6 = a3;
  v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)NLDataProvider;
  v8 = -[NLDataProvider init](&v17, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "type");
    v9 = (void *)objc_opt_class();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfURL:encoding:error:", v7, 4, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v18.location = 0;
    v18.length = 0;
    v11 = CFStringTokenizerCreate(0, &stru_1E4A3BA10, v18, 0, 0);
    v12 = objc_msgSend(v6, "copy");
    configuration = v8->_configuration;
    v8->_configuration = (NLModelConfiguration *)v12;

    objc_msgSend(v9, "readInstancesFromString:tokenizer:", v10, v11);
    v14 = objc_claimAutoreleasedReturnValue();
    instances = v8->_instances;
    v8->_instances = (NSArray *)v14;

    v8->_tokenizer = v11;
  }

  return v8;
}

- (void)dealloc
{
  __CFStringTokenizer *tokenizer;
  objc_super v4;

  tokenizer = self->_tokenizer;
  if (tokenizer)
    CFRelease(tokenizer);
  v4.receiver = self;
  v4.super_class = (Class)NLDataProvider;
  -[NLDataProvider dealloc](&v4, sel_dealloc);
}

- (NLModelConfiguration)configuration
{
  return self->_configuration;
}

- (unint64_t)numberOfInstances
{
  return -[NSArray count](self->_instances, "count");
}

- (id)instanceAtIndex:(unint64_t)a3
{
  return -[NSArray objectAtIndex:](self->_instances, "objectAtIndex:", a3);
}

- (void)_generateMapsWithModelTrainer:(id)a3
{
  unint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  unint64_t v40;
  uint64_t v41;
  NSDictionary *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  void *v47;
  void *v48;
  NSDictionary *labelMap;
  NSDictionary *v50;
  NSDictionary *inverseLabelMap;
  NSDictionary *v52;
  NSDictionary *v53;
  NSDictionary *vocabularyMap;
  NSDictionary *v55;
  NSDictionary *documentFrequencyMap;
  NSDictionary *v57;
  uint64_t v58;
  NSDictionary *v59;
  uint64_t v60;
  NSDictionary *v61;
  id v63;
  uint64_t v64;
  void *v65;
  uint64_t v66;
  unint64_t v67;
  unint64_t v68;
  NSDictionary *v69;
  NSDictionary *v70;
  id obj;
  id obja;
  unint64_t v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v3 = -[NLDataProvider numberOfInstances](self, "numberOfInstances");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v61 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v70 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v69 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v58 = objc_claimAutoreleasedReturnValue();
  v60 = v3;
  if (v3)
  {
    v6 = 0;
    v7 = 0;
    v73 = 1;
    do
    {
      v66 = v6;
      -[NLDataProvider instanceAtIndex:](self, "instanceAtIndex:", v6, v58);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "tokens");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = v8;
      objc_msgSend(v8, "labels");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v9, "count");
      v88 = 0u;
      v89 = 0u;
      v90 = 0u;
      v91 = 0u;
      obj = v10;
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
      v67 = v7;
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v89;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v89 != v14)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v88 + 1) + 8 * i);
            -[NSDictionary objectForKey:](v61, "objectForKey:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v17)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v73);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSDictionary setObject:forKey:](v61, "setObject:forKey:", v18, v16);
              -[NSDictionary setObject:forKey:](v70, "setObject:forKey:", v16, v18);
              ++v73;

            }
          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v88, v95, 16);
        }
        while (v13);
      }

      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v19 = v9;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v85;
        do
        {
          for (j = 0; j != v21; ++j)
          {
            if (*(_QWORD *)v85 != v22)
              objc_enumerationMutation(v19);
            v24 = *(_QWORD *)(*((_QWORD *)&v84 + 1) + 8 * j);
            objc_msgSend(v4, "objectForKey:", v24);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = objc_msgSend(v25, "unsignedIntegerValue");

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v26 + 1);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v4, "setObject:forKey:", v27, v24);

            objc_msgSend(v11, "addObject:", v24);
          }
          v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v84, v94, 16);
        }
        while (v21);
      }

      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v28 = v11;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v81;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v81 != v31)
              objc_enumerationMutation(v28);
            v33 = *(_QWORD *)(*((_QWORD *)&v80 + 1) + 8 * k);
            objc_msgSend(v5, "objectForKey:", v33);
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            v35 = objc_msgSend(v34, "unsignedIntegerValue");

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35 + 1);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setObject:forKey:", v36, v33);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v80, v93, 16);
        }
        while (v30);
      }
      v7 = v64 + v67;

      reportInstanceCompletionToTrainer(v63, v66, v60, 0);
      v6 = v66 + 1;
    }
    while (v66 + 1 != v60);
  }
  else
  {
    v7 = 0;
    v73 = 1;
  }
  v68 = v7;
  objc_msgSend(v4, "allKeys", v58);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __48__NLDataProvider__generateMapsWithModelTrainer___block_invoke;
  v78[3] = &unk_1E4A3A560;
  obja = v4;
  v79 = obja;
  objc_msgSend(v37, "sortedArrayUsingComparator:", v78);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v76 = 0u;
  v77 = 0u;
  v74 = 0u;
  v75 = 0u;
  v39 = v38;
  v40 = 16;
  v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
  v42 = v69;
  if (v41)
  {
    v43 = v41;
    v44 = *(_QWORD *)v75;
    v40 = 16;
    do
    {
      for (m = 0; m != v43; ++m)
      {
        if (*(_QWORD *)v75 != v44)
          objc_enumerationMutation(v39);
        v46 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * m);
        if (tokenIDFromTokenAndVocabularyMap(v46, v42) == 3)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v40);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "objectForKey:", v46);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSDictionary setObject:forKey:](v69, "setObject:forKey:", v47, v46);
          -[NSDictionary setObject:forKey:](v59, "setObject:forKey:", v48, v47);
          ++v40;

          v42 = v69;
        }
      }
      v43 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v74, v92, 16);
    }
    while (v43);
  }

  labelMap = self->_labelMap;
  self->_labelMap = v61;
  v50 = v61;

  inverseLabelMap = self->_inverseLabelMap;
  self->_inverseLabelMap = v70;
  v52 = v42;
  v53 = v70;

  vocabularyMap = self->_vocabularyMap;
  self->_vocabularyMap = v52;
  v55 = v52;

  documentFrequencyMap = self->_documentFrequencyMap;
  self->_documentFrequencyMap = v59;
  v57 = v59;

  self->_numberOfLabels = v73;
  self->_numberOfVocabularyEntries = v40;
  self->_numberOfTokens = v68;
  self->_generatedMaps = 1;

}

uint64_t __48__NLDataProvider__generateMapsWithModelTrainer___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "objectForKey:", a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");

  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "unsignedIntegerValue");
  if (v8 > v10)
    return -1;
  else
    return v8 < v10;
}

- (void)_performLanguageRecognition
{
  unint64_t v2;
  NLLanguageRecognizer *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;
  NSString *recognizedLanguage;
  id v25;
  void *v26;
  NLLanguageRecognizer *v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = -[NLDataProvider numberOfInstances](self, "numberOfInstances");
  v3 = objc_alloc_init(NLLanguageRecognizer);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      v7 = (void *)v6;
      -[NLDataProvider instanceAtIndex:](self, "instanceAtIndex:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[NLLanguageRecognizer reset](v3, "reset");
      objc_msgSend(v8, "string");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NLLanguageRecognizer processString:](v3, "processString:", v9);

      -[NLLanguageRecognizer dominantLanguage](v3, "dominantLanguage");
      v6 = objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v4, "objectForKey:", v6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setObject:forKey:", v12, v6);

      }
      ++v5;
    }
    while (v2 != v5);
  }
  else
  {
    v6 = 0;
  }
  v26 = (void *)v6;
  v27 = v3;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v4, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = 0;
    v18 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v30 != v18)
          objc_enumerationMutation(v13);
        v20 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "unsignedIntegerValue");

        if (v22 > v17)
        {
          v23 = v20;

          v16 = v23;
          v17 = v22;
        }
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  recognizedLanguage = self->_recognizedLanguage;
  self->_recognizedLanguage = (NSString *)v16;
  v25 = v16;

  self->_performedLanguageRecognition = 1;
}

- (void)_generateMaps
{
  -[NLDataProvider _generateMapsWithModelTrainer:](self, "_generateMapsWithModelTrainer:", 0);
}

- (void)generateMapsWithModelTrainer:(id)a3
{
  if (!self->_generatedMaps)
    -[NLDataProvider _generateMapsWithModelTrainer:](self, "_generateMapsWithModelTrainer:", a3);
}

- (__CFStringTokenizer)tokenizer
{
  return self->_tokenizer;
}

- (id)labelMap
{
  if (!self->_generatedMaps)
    -[NLDataProvider _generateMaps](self, "_generateMaps");
  return self->_labelMap;
}

- (id)inverseLabelMap
{
  if (!self->_generatedMaps)
    -[NLDataProvider _generateMaps](self, "_generateMaps");
  return self->_inverseLabelMap;
}

- (id)vocabularyMap
{
  if (!self->_generatedMaps)
    -[NLDataProvider _generateMaps](self, "_generateMaps");
  return self->_vocabularyMap;
}

- (id)documentFrequencyMap
{
  if (!self->_generatedMaps)
    -[NLDataProvider _generateMaps](self, "_generateMaps");
  return self->_documentFrequencyMap;
}

- (unint64_t)numberOfLabels
{
  if (!self->_generatedMaps)
    -[NLDataProvider _generateMaps](self, "_generateMaps");
  return self->_numberOfLabels;
}

- (unint64_t)numberOfVocabularyEntries
{
  if (!self->_generatedMaps)
    -[NLDataProvider _generateMaps](self, "_generateMaps");
  return self->_numberOfVocabularyEntries;
}

- (unint64_t)numberOfTokens
{
  if (!self->_generatedMaps)
    -[NLDataProvider _generateMaps](self, "_generateMaps");
  return self->_numberOfTokens;
}

- (NSString)recognizedLanguage
{
  if (!self->_performedLanguageRecognition)
    -[NLDataProvider _performLanguageRecognition](self, "_performLanguageRecognition");
  return self->_recognizedLanguage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recognizedLanguage, 0);
  objc_storeStrong((id *)&self->_documentFrequencyMap, 0);
  objc_storeStrong((id *)&self->_vocabularyMap, 0);
  objc_storeStrong((id *)&self->_inverseLabelMap, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_instances, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
