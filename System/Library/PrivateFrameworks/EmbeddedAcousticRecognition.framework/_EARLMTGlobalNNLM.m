@implementation _EARLMTGlobalNNLM

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.speech.speechmodeltraining", "_EARLMTGlobalNNLM");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

+ (id)attachmentURL:(id)a3 withName:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  _QWORD v13[4];
  id v14;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "count");
  if (v6 && v7)
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __44___EARLMTGlobalNNLM_attachmentURL_withName___block_invoke;
    v13[3] = &unk_1E5D49290;
    v14 = v6;
    v8 = objc_msgSend(v5, "indexOfObjectPassingTest:", v13);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = 0;
    }
    else
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v6);

    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v6, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

+ (id)compressedAttachmentURLFromRecipe:(id)a3 attachments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("compressedAttachmentFilename"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_msgSend(a1, "attachmentURL:withName:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1AD756000, v10, OS_LOG_TYPE_INFO, "Attached compressed file URL: %@", (uint8_t *)&v13, 0xCu);
    }
    if (v9)
      v11 = v9;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_fetchTensorInfo:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  int v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v26;
  id obj;
  uint64_t v28;
  id v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *context;
  unsigned int v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _QWORD v44[5];
  _QWORD v45[5];
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v29 = a3;
  v26 = (id)objc_opt_new();
  v30 = (void *)objc_opt_new();
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingGlobals"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
  if (v4)
  {
    v34 = 0;
    v28 = *(_QWORD *)v41;
    do
    {
      v5 = 0;
      v31 = v4;
      do
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(obj);
        v6 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v5);
        context = (void *)MEMORY[0x1AF44DFA0]();
        objc_msgSend(v29, "getTensorNamed:directBind:", v6, 1);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v35 = v7;
        objc_msgSend(v7, "shape");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v37;
          LODWORD(v11) = 1;
          do
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v37 != v10)
                objc_enumerationMutation(v8);
              v13 = *(id *)(*((_QWORD *)&v36 + 1) + 8 * i);
              v14 = objc_msgSend(v13, "intValue");

              v11 = (v14 * v11);
            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
          }
          while (v9);
        }
        else
        {
          v11 = 1;
        }

        v45[0] = v6;
        v44[0] = CFSTR("name");
        v44[1] = CFSTR("size");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v45[1] = v32;
        v44[2] = CFSTR("shape");
        v15 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v35, "shape");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)objc_msgSend(v15, "initWithArray:copyItems:", v16, 1);
        v45[2] = v17;
        v44[3] = CFSTR("strides");
        v18 = objc_alloc(MEMORY[0x1E0C99DE8]);
        objc_msgSend(v35, "strides");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (void *)objc_msgSend(v18, "initWithArray:copyItems:", v19, 1);
        v45[3] = v20;
        v44[4] = CFSTR("offset");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v34);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v45[4] = v21;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v45, v44, 5);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = (void *)objc_msgSend(v22, "mutableCopy");
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v23, v6);

        objc_autoreleasePoolPop(context);
        v34 += v11;
        ++v5;
      }
      while (v5 != v31);
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v47, 16);
    }
    while (v4);
  }
  else
  {
    v34 = 0;
  }

  objc_msgSend(v26, "setObject:forKeyedSubscript:", v30, CFSTR("tensorInfo"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v34);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setObject:forKeyedSubscript:", v24, CFSTR("totalSize"));

  return v26;
}

- (_EARLMTGlobalNNLM)initWithRecipe:(id)a3
{
  id v5;
  _EARLMTGlobalNNLM *v6;
  _EARLMTGlobalNNLM *v7;
  uint64_t v8;
  NSString *assetPath;
  uint64_t v10;
  NSMutableArray *trainData;
  uint64_t v12;
  NSMutableArray *evalData;
  uint64_t v14;
  NSMutableDictionary *results;
  SimpleMmapBuffer *mmappedPartialWeights;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)_EARLMTGlobalNNLM;
  v6 = -[_EARLMTGlobalNNLM init](&v18, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_recipe, a3);
    v7->_numParam = 0;
    v8 = objc_opt_new();
    assetPath = v7->_assetPath;
    v7->_assetPath = (NSString *)v8;

    v10 = objc_opt_new();
    trainData = v7->_trainData;
    v7->_trainData = (NSMutableArray *)v10;

    v12 = objc_opt_new();
    evalData = v7->_evalData;
    v7->_evalData = (NSMutableArray *)v12;

    v7->_weightsAreUpdated = 0;
    v7->_numWordsTrain = 0;
    v7->_numWordsEval = 0;
    v14 = objc_opt_new();
    results = v7->_results;
    v7->_results = (NSMutableDictionary *)v14;

    v7->_deltaIsPartial = 0;
    mmappedPartialWeights = v7->_mmappedPartialWeights;
    v7->_mmappedPartialWeights = 0;

  }
  return v7;
}

- (_EARLMTGlobalNNLM)initWithRecipe:(id)a3 assetPath:(id)a4
{
  id v7;
  id v8;
  _EARLMTGlobalNNLM *v9;
  _EARLMTGlobalNNLM *v10;
  uint64_t v11;
  NSMutableArray *trainData;
  uint64_t v13;
  NSMutableArray *evalData;
  uint64_t v15;
  NSMutableDictionary *results;
  objc_super v18;

  v7 = a3;
  v8 = a4;
  v18.receiver = self;
  v18.super_class = (Class)_EARLMTGlobalNNLM;
  v9 = -[_EARLMTGlobalNNLM init](&v18, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_recipe, a3);
    objc_storeStrong((id *)&v10->_assetPath, a4);
    v10->_numParam = 0;
    v11 = objc_opt_new();
    trainData = v10->_trainData;
    v10->_trainData = (NSMutableArray *)v11;

    v13 = objc_opt_new();
    evalData = v10->_evalData;
    v10->_evalData = (NSMutableArray *)v13;

    v10->_weightsAreUpdated = 0;
    v10->_numWordsTrain = 0;
    v10->_numWordsEval = 0;
    v15 = objc_opt_new();
    results = v10->_results;
    v10->_results = (NSMutableDictionary *)v15;

  }
  return v10;
}

- (id)loadData
{
  __CFString *v3;
  __CFString *v4;
  NSString *v5;
  NSString *language;
  int v7;
  NSObject *v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  NSMutableArray *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  NSObject *v18;
  _BOOL4 v19;
  uint64_t v20;
  unint64_t numWordsTrain;
  unint64_t v22;
  uint64_t v23;
  unint64_t v24;
  NSObject *v25;
  uint64_t v26;
  unint64_t numWordsEval;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  unint64_t v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("language"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("en-US");
  -[__CFString stringByReplacingOccurrencesOfString:withString:](v3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("_"), CFSTR("-"));
  v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  language = self->_language;
  self->_language = v5;

  v7 = _parseRecipeBoolField(self->_recipe, CFSTR("mergeTrainDev"), 0);
  if (v7)
  {
    objc_storeStrong((id *)&self->_evalData, self->_trainData);
    v8 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v8, OS_LOG_TYPE_INFO, "merge training and evaluation data and use them for both training and evaluation", buf, 2u);
    }
  }
  v9 = (void *)MEMORY[0x1AF44DFA0]();
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v10 = self->_trainData;
  v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v36 != v12)
          objc_enumerationMutation(v10);
        self->_numWordsTrain += objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "count") + 1;
      }
      v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v11);
  }

  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v14 = self->_evalData;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v32;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v14);
        self->_numWordsEval += objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * j), "count") + 1;
      }
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v15);
  }

  v18 = (id)sLog;
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v7)
  {
    if (v19)
    {
      v20 = -[NSMutableArray count](self->_trainData, "count");
      numWordsTrain = self->_numWordsTrain;
      *(_DWORD *)buf = 134218240;
      v40 = v20;
      v41 = 2048;
      v42 = numWordsTrain;
      _os_log_impl(&dword_1AD756000, v18, OS_LOG_TYPE_INFO, "%lu sentences (%lu words) will be used for both traiing and evaluation data", buf, 0x16u);
    }

    v22 = self->_numWordsTrain + self->_numWordsEval;
    self->_numWordsTrain = v22;
    self->_numWordsEval = v22;
  }
  else
  {
    if (v19)
    {
      v23 = -[NSMutableArray count](self->_trainData, "count");
      v24 = self->_numWordsTrain;
      *(_DWORD *)buf = 134218240;
      v40 = v23;
      v41 = 2048;
      v42 = v24;
      _os_log_impl(&dword_1AD756000, v18, OS_LOG_TYPE_INFO, "%lu sentences (%lu words) will be used for traiing data", buf, 0x16u);
    }

    v25 = (id)sLog;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = -[NSMutableArray count](self->_evalData, "count");
      numWordsEval = self->_numWordsEval;
      *(_DWORD *)buf = 134218240;
      v40 = v26;
      v41 = 2048;
      v42 = numWordsEval;
      _os_log_impl(&dword_1AD756000, v25, OS_LOG_TYPE_INFO, "%lu sentences (%lu words) will be used for evaluation data", buf, 0x16u);
    }

    v22 = self->_numWordsTrain;
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_results, "setObject:forKeyedSubscript:", v28, CFSTR("NumWordsInTraining"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_numWordsEval);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_results, "setObject:forKeyedSubscript:", v29, CFSTR("NumWordsInEvaluation"));

  objc_autoreleasePoolPop(v9);
  return 0;
}

- (id)loadWeight
{
  void *v2;
  id v3;
  NSObject *v4;
  NSString *assetPath;
  void *v6;
  NSString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  BOOL v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  uint64_t i;
  id v36;
  int v37;
  void *v38;
  void *v39;
  BOOL v40;
  void *v41;
  float v42;
  float v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  id v51;
  id v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  id obj;
  id v61;
  uint64_t v62;
  uint64_t v63;
  void *context;
  uint64_t v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *__p;
  void *v80;
  uint64_t v81;
  void *v82;
  void *v83;
  uint64_t v84;
  _QWORD v85[3];
  const void *v86;
  _BYTE *v87;
  uint64_t v88;
  void *v89;
  _BYTE *v90;
  uint64_t v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  std::string v96;
  uint8_t buf[80];
  std::string __sz;
  _QWORD v99[5];
  _QWORD v100[5];
  id v101;
  id v102;
  id v103[5];
  _BYTE v104[128];
  uint64_t v105;
  void *v106;
  _BYTE v107[128];
  uint64_t v108;

  v108 = *MEMORY[0x1E0C80C00];
  v103[0] = 0;
  -[_EARLMTGlobalNNLM getEvalTask:](self, "getEvalTask:", v103);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v103[0];
  if (!v2 || v3)
  {
    v68 = v3;
    v61 = v68;
  }
  else
  {
    v54 = v2;
    v4 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AD756000, v4, OS_LOG_TYPE_INFO, "Evaluation model loaded in reloading weight", buf, 2u);
    }
    assetPath = self->_assetPath;
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("weightMap"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingString:](assetPath, "stringByAppendingString:", v6);
    v58 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = self->_assetPath;
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("weightFile"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingString:](v7, "stringByAppendingString:", v8);
    v53 = (id)objc_claimAutoreleasedReturnValue();

    v102 = 0;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v58, 4, &v102);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v102;
    v100[0] = 0;
    v100[1] = v100;
    v100[2] = 0x3032000000;
    v100[3] = __Block_byref_object_copy__16;
    v100[4] = __Block_byref_object_dispose__16;
    v101 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "componentsSeparatedByCharactersInSet:", v9);
    v56 = (void *)objc_claimAutoreleasedReturnValue();

    v99[0] = MEMORY[0x1E0C809B0];
    v99[1] = 3221225472;
    v99[2] = __31___EARLMTGlobalNNLM_loadWeight__block_invoke;
    v99[3] = &unk_1E5D46F38;
    v99[4] = v100;
    objc_msgSend(v56, "enumerateObjectsUsingBlock:", v99);
    v55 = objc_retainAutorelease(v53);
    std::string::basic_string[abi:ne180100]<0>(&__sz, (char *)objc_msgSend(v55, "UTF8String"));
    if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
      std::string::__init_copy_ctor_external(&v96, __sz.__r_.__value_.__l.__data_, __sz.__r_.__value_.__l.__size_);
    else
      v96 = __sz;
    StorageAccessor::EspressoStorageAccessor::EspressoStorageAccessor((uint64_t)buf, (__int128 *)&v96);
    if (SHIBYTE(v96.__r_.__value_.__r.__words[2]) < 0)
      operator delete(v96.__r_.__value_.__l.__data_);
    v94 = 0u;
    v95 = 0u;
    v92 = 0u;
    v93 = 0u;
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingGlobals"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
    if (v10)
    {
      v62 = *(_QWORD *)v93;
      v59 = *MEMORY[0x1E0CB2D50];
      while (1)
      {
        v11 = 0;
        v63 = v10;
        do
        {
          if (*(_QWORD *)v93 != v62)
            objc_enumerationMutation(obj);
          v66 = v11;
          v12 = *(void **)(*((_QWORD *)&v92 + 1) + 8 * v11);
          context = (void *)MEMORY[0x1AF44DFA0]();
          objc_msgSend(v12, "componentsSeparatedByString:", CFSTR("/"));
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "objectAtIndex:", 2);
          v70 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v67, "count") < 4)
          {
            v16 = v70;
          }
          else
          {
            objc_msgSend(v70, "stringByAppendingString:", CFSTR("/"));
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v67, "objectAtIndex:", 3);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "stringByAppendingString:", v14);
            v15 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v15;
          }
          v71 = v16;
          -[_EARLMTGlobalNNLM findTensorsIndicesByKeyWord:tensorInfo:](self, "findTensorsIndicesByKeyWord:tensorInfo:");
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v69, "objectForKey:", CFSTR("constant_blob"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17 == 0;

          if (!v18)
          {
            objc_msgSend(v69, "objectForKey:", CFSTR("constant_blob"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            StorageAccessor::EspressoStorageAccessor::GetDataView<float>((uint64_t)buf, objc_msgSend(v19, "integerValue"), &v89);
            v20 = v89;
            v90 = 0;
            v91 = 0;
            v89 = 0;

            goto LABEL_21;
          }
          objc_msgSend(v69, "objectForKey:", CFSTR("Q_meta"));
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v69, "objectForKey:", CFSTR("weights_u8"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v22 == 0;

            if (!v23)
            {
              objc_msgSend(v69, "objectForKey:", CFSTR("Q_meta"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              StorageAccessor::EspressoStorageAccessor::GetDataView<float>((uint64_t)buf, objc_msgSend(v24, "integerValue"), &v89);

              objc_msgSend(v69, "objectForKey:", CFSTR("weights_u8"));
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              StorageAccessor::EspressoStorageAccessor::GetDataView<unsigned char>((uint64_t)buf, (int)objc_msgSend(v25, "intValue"), &v86);

              objc_msgSend(v69, "objectForKey:", CFSTR("nB"));
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v25) = objc_msgSend(v26, "intValue");

              objc_msgSend(v69, "objectForKey:", CFSTR("nC"));
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              LODWORD(v26) = objc_msgSend(v27, "intValue");

              v83 = 0;
              v84 = 0;
              v82 = 0;
              std::vector<unsigned char>::__init_with_size[abi:ne180100]<unsigned char *,unsigned char *>(&v82, v86, (uint64_t)v87, v87 - (_BYTE *)v86);
              __p = 0;
              v80 = 0;
              v81 = 0;
              std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v89, (uint64_t)v90, (v90 - (_BYTE *)v89) >> 2);
              quasar::QuantizationTool::LinearRegionDequantize((uint64_t *)&v82, (int)v25, (int)v26, 64, (uint64_t *)&__p, v85);
              v20 = (void *)v85[0];
              memset(v85, 0, sizeof(v85));
              if (__p)
              {
                v80 = __p;
                operator delete(__p);
              }
              if (v82)
              {
                v83 = v82;
                operator delete(v82);
              }
              v28 = (void *)v86;
              if (!v86)
                goto LABEL_44;
              v87 = v86;
              goto LABEL_43;
            }
          }
          objc_msgSend(v69, "objectForKey:", CFSTR("w_quantization_scale"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v38
            || (objc_msgSend(v69, "objectForKey:", CFSTR("W_int8")),
                v39 = (void *)objc_claimAutoreleasedReturnValue(),
                v40 = v39 == 0,
                v39,
                v38,
                v40))
          {
            v45 = (void *)MEMORY[0x1E0CB35C8];
            v105 = v59;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Exception in fetching weights"));
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v106 = v46;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v106, &v105, 1);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 1, v47);
            v48 = objc_claimAutoreleasedReturnValue();

            v20 = 0;
            v68 = (id)v48;
            goto LABEL_21;
          }
          objc_msgSend(v69, "objectForKey:", CFSTR("w_quantization_scale"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "floatValue");
          v43 = v42;

          objc_msgSend(v69, "objectForKey:", CFSTR("W_int8"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          StorageAccessor::EspressoStorageAccessor::GetDataView<signed char>((uint64_t)buf, objc_msgSend(v44, "integerValue"), &v89);

          v77 = 0;
          v78 = 0;
          v76 = 0;
          std::vector<signed char>::__init_with_size[abi:ne180100]<signed char *,signed char *>(&v76, v89, (uint64_t)v90, v90 - (_BYTE *)v89);
          quasar::QuantizationTool::SimpleDequantize((uint64_t *)&v76, &v86, v43);
          v20 = (void *)v86;
          v87 = 0;
          v88 = 0;
          v86 = 0;
          v28 = v76;
          if (v76)
          {
            v77 = v76;
LABEL_43:
            operator delete(v28);
          }
LABEL_44:
          if (v89)
          {
            v90 = v89;
            operator delete(v89);
          }
LABEL_21:
          if (v68)
          {
            v61 = v68;
          }
          else
          {
            -[NSDictionary objectForKeyedSubscript:](self->_tensors, "objectForKeyedSubscript:", v12);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v30 = (void *)objc_msgSend(v29, "dataPointer");
            v74 = 0u;
            v75 = 0u;
            v72 = 0u;
            v73 = 0u;
            objc_msgSend(v29, "shape");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v104, 16);
            if (v32)
            {
              v33 = *(_QWORD *)v73;
              v34 = 1;
              do
              {
                for (i = 0; i != v32; ++i)
                {
                  if (*(_QWORD *)v73 != v33)
                    objc_enumerationMutation(v31);
                  v36 = *(id *)(*((_QWORD *)&v72 + 1) + 8 * i);
                  v37 = objc_msgSend(v36, "intValue");

                  v34 *= v37;
                }
                v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v72, v104, 16);
              }
              while (v32);
            }
            else
            {
              v34 = 1;
            }

            memcpy(v30, v20, 4 * v34);
          }

          if (v20)
            operator delete(v20);

          objc_autoreleasePoolPop(context);
          if (v68)
          {

            goto LABEL_59;
          }
          v68 = 0;
          v11 = v66 + 1;
        }
        while (v66 + 1 != v63);
        v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v92, v107, 16);
        v10 = v49;
        v68 = 0;
        v50 = 0;
        if (!v49)
          goto LABEL_58;
      }
    }
    v50 = v68;
LABEL_58:

    v51 = -[_EARLMTGlobalNNLM restoreFromLatestWeights:](self, "restoreFromLatestWeights:", v54);
    v68 = v50;
    v61 = v68;
LABEL_59:
    StorageAccessor::EspressoStorageAccessor::~EspressoStorageAccessor((StorageAccessor::EspressoStorageAccessor *)buf);
    if (SHIBYTE(__sz.__r_.__value_.__r.__words[2]) < 0)
      operator delete(__sz.__r_.__value_.__l.__data_);

    _Block_object_dispose(v100, 8);
    v2 = v54;
  }

  return v61;
}

- (id)saveWeight:(id)a3
{
  uint64_t v4;
  id v5;
  _EARLMTGlobalNNLM *v6;
  NSString *assetPath;
  void *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  const void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  uint64_t i;
  id v28;
  int v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  BOOL v35;
  void *v36;
  int v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BOOL v43;
  void *v44;
  float v45;
  float v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  id v55;
  id v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  id obj;
  id v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  _EARLMTGlobalNNLM *v69;
  void *context;
  void *v71;
  void *v72;
  id v73;
  void *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81[3];
  void *v82[3];
  void *__p;
  _BYTE *v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  std::string v94;
  _BYTE v95[80];
  std::string __s;
  void *v97;
  char v98;
  _QWORD v99[5];
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;
  id v106;
  id v107[5];
  uint64_t v108;
  void *v109;
  _BYTE v110[128];
  _BYTE v111[128];
  uint64_t v112;
  _BYTE v113[408];
  uint64_t v114;
  _QWORD v115[2];
  _BYTE v116[408];
  _QWORD v117[22];

  v117[19] = *MEMORY[0x1E0C80C00];
  v63 = a3;
  v107[0] = 0;
  v69 = self;
  -[_EARLMTGlobalNNLM getEvalTask:](self, "getEvalTask:", v107);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v107[0];
  v68 = (void *)v4;
  if (!v4
    || v5
    || (v6 = v69, v69->_weightsAreUpdated)
    && (-[_EARLMTGlobalNNLM restoreFromLatestWeights:](v69, "restoreFromLatestWeights:", v4),
        v5 = (id)objc_claimAutoreleasedReturnValue(),
        v6 = v69,
        v5))
  {
    v73 = v5;
    v65 = v73;
    goto LABEL_64;
  }
  assetPath = v6->_assetPath;
  -[NSDictionary objectForKeyedSubscript:](v6->_recipe, "objectForKeyedSubscript:", CFSTR("weightMap"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingString:](assetPath, "stringByAppendingString:", v8);
  v61 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v69->_assetPath;
  -[NSDictionary objectForKeyedSubscript:](v69->_recipe, "objectForKeyedSubscript:", CFSTR("weightFile"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingString:](v9, "stringByAppendingString:", v10);
  v56 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v63, "stringByAppendingString:", CFSTR("/"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](v69->_recipe, "objectForKeyedSubscript:", CFSTR("weightSaveFile"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingString:", v12);
  v55 = (id)objc_claimAutoreleasedReturnValue();

  v106 = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithContentsOfFile:encoding:error:", v61, 4, &v106);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v73 = v106;
  v100 = 0;
  v101 = &v100;
  v102 = 0x3032000000;
  v103 = __Block_byref_object_copy__16;
  v104 = __Block_byref_object_dispose__16;
  v105 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB3500], "newlineCharacterSet");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "componentsSeparatedByCharactersInSet:", v13);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v99[0] = MEMORY[0x1E0C809B0];
  v99[1] = 3221225472;
  v99[2] = __32___EARLMTGlobalNNLM_saveWeight___block_invoke;
  v99[3] = &unk_1E5D46F38;
  v99[4] = &v100;
  objc_msgSend(v59, "enumerateObjectsUsingBlock:", v99);
  v58 = objc_retainAutorelease(v56);
  std::string::basic_string[abi:ne180100]<0>(&v97, (char *)objc_msgSend(v58, "UTF8String"));
  v57 = objc_retainAutorelease(v55);
  std::string::basic_string[abi:ne180100]<0>(&__s, (char *)objc_msgSend(v57, "UTF8String"));
  std::ifstream::basic_ifstream(v115);
  std::ofstream::basic_ofstream(&v112);
  std::ostream::operator<<();
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)((char *)v115 + *(_QWORD *)(v115[0] - 24)), *(_DWORD *)&v116[*(_QWORD *)(v115[0] - 24) + 16] | 4);
  if (!std::filebuf::close())
    std::ios_base::clear((std::ios_base *)&v113[*(_QWORD *)(v112 - 24) - 8], *(_DWORD *)&v113[*(_QWORD *)(v112 - 24) + 24] | 4);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    std::string::__init_copy_ctor_external(&v94, __s.__r_.__value_.__l.__data_, __s.__r_.__value_.__l.__size_);
  else
    v94 = __s;
  StorageAccessor::EspressoStorageAccessor::EspressoStorageAccessor((uint64_t)v95, (__int128 *)&v94);
  if (SHIBYTE(v94.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v94.__r_.__value_.__l.__data_);
  v92 = 0u;
  v93 = 0u;
  v90 = 0u;
  v91 = 0u;
  -[NSDictionary objectForKeyedSubscript:](v69->_recipe, "objectForKeyedSubscript:", CFSTR("trainingGlobals"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  obj = v14;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v90, v111, 16);
  if (v15)
  {
    v67 = *(_QWORD *)v91;
    v62 = *MEMORY[0x1E0CB2D50];
    while (1)
    {
      v66 = v15;
      v16 = 0;
      do
      {
        if (*(_QWORD *)v91 != v67)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v90 + 1) + 8 * v16);
        context = (void *)MEMORY[0x1AF44DFA0]();
        objc_msgSend(v17, "componentsSeparatedByString:", CFSTR("/"));
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectAtIndex:", 2);
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        if ((unint64_t)objc_msgSend(v71, "count") >= 4)
        {
          objc_msgSend(v74, "stringByAppendingString:", CFSTR("/"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v71, "objectAtIndex:", 3);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "stringByAppendingString:", v19);
          v20 = objc_claimAutoreleasedReturnValue();

          v74 = (void *)v20;
        }
        objc_msgSend(v68, "getTensorNamed:directBind:", v17, 1);
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        -[_EARLMTGlobalNNLM findTensorsIndicesByKeyWord:tensorInfo:](v69, "findTensorsIndicesByKeyWord:tensorInfo:", v74, v101[5]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = (const void *)objc_msgSend(v72, "dataPointer");
        v88 = 0u;
        v89 = 0u;
        v87 = 0u;
        v86 = 0u;
        objc_msgSend(v72, "shape");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v86, v110, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v87;
          v26 = 1;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v87 != v25)
                objc_enumerationMutation(v23);
              v28 = *(id *)(*((_QWORD *)&v86 + 1) + 8 * i);
              v29 = objc_msgSend(v28, "intValue");

              v26 *= v29;
            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v86, v110, 16);
          }
          while (v24);
        }
        else
        {
          v26 = 1;
        }

        __p = 0;
        v84 = 0;
        v85 = 0;
        std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&__p, v22, (uint64_t)v22 + 4 * v26, v26);
        objc_msgSend(v21, "objectForKey:", CFSTR("constant_blob"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = v30 == 0;

        if (!v31)
        {
          objc_msgSend(v21, "objectForKey:", CFSTR("constant_blob"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          StorageAccessor::EspressoStorageAccessor::SetDataView<float>((uint64_t)v95, objc_msgSend(v32, "integerValue"), (uint64_t *)&__p);

          goto LABEL_33;
        }
        objc_msgSend(v21, "objectForKey:", CFSTR("Q_meta"));
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v33
          || (objc_msgSend(v21, "objectForKey:", CFSTR("weights_u8")),
              v34 = (void *)objc_claimAutoreleasedReturnValue(),
              v35 = v34 == 0,
              v34,
              v33,
              v35))
        {
          objc_msgSend(v21, "objectForKey:", CFSTR("w_quantization_scale"));
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v41
            || (objc_msgSend(v21, "objectForKey:", CFSTR("W_int8")),
                v42 = (void *)objc_claimAutoreleasedReturnValue(),
                v43 = v42 == 0,
                v42,
                v41,
                v43))
          {
            v48 = (void *)MEMORY[0x1E0CB35C8];
            v108 = v62;
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Exception in saving weights"));
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v109 = v49;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v109, &v108, 1);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v48, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 1, v50);
            v51 = objc_claimAutoreleasedReturnValue();

            v73 = (id)v51;
            goto LABEL_33;
          }
          objc_msgSend(v21, "objectForKey:", CFSTR("w_quantization_scale"));
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "floatValue");
          v46 = v45;

          v76 = 0;
          v77 = 0;
          v75 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v75, __p, (uint64_t)v84, (v84 - (_BYTE *)__p) >> 2);
          quasar::QuantizationTool::SimpleQuantizeWithRatio((unint64_t **)&v75, (unint64_t *)v81, v46);
          if (v75)
          {
            v76 = v75;
            operator delete(v75);
          }
          objc_msgSend(v21, "objectForKey:", CFSTR("W_int8"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          StorageAccessor::EspressoStorageAccessor::SetDataView<signed char>((uint64_t)v95, objc_msgSend(v47, "integerValue"), (uint64_t *)v81);

        }
        else
        {
          objc_msgSend(v21, "objectForKey:", CFSTR("nB"));
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = objc_msgSend(v36, "intValue");

          objc_msgSend(v21, "objectForKey:", CFSTR("nC"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v36) = objc_msgSend(v38, "intValue");

          v79 = 0;
          v80 = 0;
          v78 = 0;
          std::vector<float>::__init_with_size[abi:ne180100]<float *,float *>(&v78, __p, (uint64_t)v84, (v84 - (_BYTE *)__p) >> 2);
          quasar::QuantizationTool::LinearRegionQuantize(&v78, v37, (int)v36, objc_msgSend(&unk_1E5D5BE70, "intValue"), v81);
          if (v78)
          {
            v79 = v78;
            operator delete(v78);
          }
          objc_msgSend(v21, "objectForKey:", CFSTR("Q_meta"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          StorageAccessor::EspressoStorageAccessor::SetDataView<float>((uint64_t)v95, objc_msgSend(v39, "integerValue"), (uint64_t *)v81);

          objc_msgSend(v21, "objectForKey:", CFSTR("weights_u8"));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          StorageAccessor::EspressoStorageAccessor::SetDataView<unsigned char>((uint64_t)v95, (int)objc_msgSend(v40, "intValue"), (uint64_t *)v82);

          if (v82[0])
          {
            v82[1] = v82[0];
            operator delete(v82[0]);
          }
        }
        if (v81[0])
        {
          v81[1] = v81[0];
          operator delete(v81[0]);
        }
LABEL_33:
        if (v73)
          v65 = v73;
        if (__p)
        {
          v84 = __p;
          operator delete(__p);
        }

        objc_autoreleasePoolPop(context);
        if (v73)
        {

          goto LABEL_59;
        }
        v73 = 0;
        ++v16;
      }
      while (v16 != v66);
      v14 = obj;
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v90, v111, 16);
      v15 = v52;
      v73 = 0;
      v53 = 0;
      if (!v52)
        goto LABEL_58;
    }
  }
  v53 = v73;
LABEL_58:

  v73 = v53;
  v65 = v73;
LABEL_59:
  StorageAccessor::EspressoStorageAccessor::~EspressoStorageAccessor((StorageAccessor::EspressoStorageAccessor *)v95);
  v112 = *MEMORY[0x1E0DE4F48];
  *(_QWORD *)&v113[*(_QWORD *)(v112 - 24) - 8] = *(_QWORD *)(MEMORY[0x1E0DE4F48] + 24);
  MEMORY[0x1AF44CA70](v113);
  std::ostream::~ostream();
  MEMORY[0x1AF44D094](&v114);
  v115[0] = *MEMORY[0x1E0DE4F40];
  *(_QWORD *)((char *)v115 + *(_QWORD *)(v115[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F40] + 24);
  MEMORY[0x1AF44CA70](v116);
  std::istream::~istream();
  MEMORY[0x1AF44D094](v117);
  if (SHIBYTE(__s.__r_.__value_.__r.__words[2]) < 0)
    operator delete(__s.__r_.__value_.__l.__data_);
  if (v98 < 0)
    operator delete(v97);

  _Block_object_dispose(&v100, 8);
LABEL_64:

  return v65;
}

- (id)setup
{
  void *v3;
  void *v4;
  NSArray *attachments;
  NSString *assetPath;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  _EARLMTKaldiVocab *v11;
  id v12;
  _EARLMTKaldiVocab *vocab;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v23;
  NSMutableDictionary *partialUpdateOffsets;
  void *v25;
  BOOL v26;
  void *v27;
  NSArray *v28;
  void *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  void *v34;
  void *v35;
  NSMutableDictionary *v36;
  NSMutableDictionary *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  uint64_t v41;
  void *v42;
  _BOOL4 v43;
  TextProcessorInference *v44;
  void *v45;
  TextProcessorInference *v46;
  TextProcessorInference *textProcessorInference;
  DataSourceInference *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  DataSourceInference *v53;
  DataSourceInference *fofeInferenceSource;
  void *v55;
  TextProcessorTrain *v56;
  TextProcessorTrain *textProcessorTrain;
  uint64_t v58;
  NSMutableArray *trainData;
  DataSourceTrain *v60;
  unint64_t v61;
  int v62;
  unint64_t v63;
  void *v64;
  void *v65;
  DataSourceTrain *v66;
  DataSourceTrain *fofeTrainSource;
  NSObject *v68;
  void *v69;
  id v70;
  void *v71;
  NSDictionary *v72;
  NSDictionary *tensorInfo;
  void *v74;
  SimpleMmapBuffer *v75;
  SimpleMmapBuffer *mmappedWeights;
  SimpleMmapBuffer *v77;
  float *value;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  unint64_t numParam;
  size_t v86;
  float *v87;
  NSDictionary *v88;
  NSDictionary *tensors;
  NSObject *v90;
  void *v91;
  void *v92;
  void *v93;
  unint64_t v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  _QWORD v99[6];
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  id v104;
  id v105;
  id v106[5];
  uint64_t v107;
  const __CFString *v108;
  uint64_t v109;
  void *v110;
  _BYTE v111[128];
  _QWORD v112[8];
  uint64_t v113;
  const __CFString *v114;
  uint64_t v115;
  const __CFString *v116;
  uint64_t v117;
  const __CFString *v118;
  uint64_t v119;
  id v120;
  uint8_t buf[4];
  void *v122;
  uint64_t v123;
  void *v124;
  uint64_t v125;
  _QWORD v126[3];

  v126[1] = *MEMORY[0x1E0C80C00];
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("kaldiVocab"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)objc_opt_class();
    attachments = self->_attachments;
    assetPath = self->_assetPath;
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("kaldiVocab"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSString stringByAppendingString:](assetPath, "stringByAppendingString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attachmentURL:withName:", attachments, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      v10 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v122 = v9;
        _os_log_impl(&dword_1AD756000, v10, OS_LOG_TYPE_INFO, "Attached vocabulary URL: %@", buf, 0xCu);
      }
      v106[0] = 0;
      v11 = -[_EARLMTKaldiVocab initWithContentsOfUrl:outError:]([_EARLMTKaldiVocab alloc], "initWithContentsOfUrl:outError:", v9, v106);
      v12 = v106[0];
      vocab = self->_vocab;
      self->_vocab = v11;

      if (v12)
      {
        v14 = (void *)MEMORY[0x1E0CB35C8];
        v119 = *MEMORY[0x1E0CB3388];
        v120 = v12;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v120, &v119, 1);
        v15 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v15);
        v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:

        goto LABEL_11;
      }
      v23 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AD756000, v23, OS_LOG_TYPE_INFO, "Vocabulary loaded", buf, 2u);
      }
      partialUpdateOffsets = self->_partialUpdateOffsets;
      self->_partialUpdateOffsets = 0;

      -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("partialUpdateOffsetFile"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25 == 0;

      if (v26)
        goto LABEL_22;
      v27 = (void *)objc_opt_class();
      v28 = self->_attachments;
      -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("partialUpdateOffsetFile"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "attachmentURL:withName:", v28, v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue();

      if (v30)
      {
        v105 = 0;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v30, 1, &v105);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = v105;
        if (v32)
        {
          v12 = v32;
          v33 = (void *)MEMORY[0x1E0CB35C8];
          v115 = *MEMORY[0x1E0CB2D50];
          v116 = CFSTR("Unable to load partial update offsets");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v116, &v115, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v34);
          v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_41:
          v15 = v30;
          goto LABEL_10;
        }
        v104 = 0;
        objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v31, 1, &v104);
        v36 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        v12 = v104;
        if (v12 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
        {
          v83 = (void *)MEMORY[0x1E0CB35C8];
          v113 = *MEMORY[0x1E0CB2D50];
          v114 = CFSTR("Unable to load _recipe[kRecipePartialUpdateOffsetFile] as json");
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v114, &v113, 1);
          v84 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v83, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 153, v84);
          v16 = (id)objc_claimAutoreleasedReturnValue();

          goto LABEL_41;
        }
        v37 = self->_partialUpdateOffsets;
        self->_partialUpdateOffsets = v36;

        self->_deltaIsPartial = 1;
LABEL_22:
        v112[0] = CFSTR("inferenceContextSize");
        v112[1] = CFSTR("trainingContextKey");
        v112[2] = CFSTR("trainingTargetKey");
        v112[3] = CFSTR("sequenceLength");
        v112[4] = CFSTR("numNoise");
        v112[5] = CFSTR("batchSize");
        v112[6] = CFSTR("trainingMaskKey");
        v112[7] = CFSTR("trainingNoiseKey");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v112, 8);
        v102 = 0u;
        v103 = 0u;
        v100 = 0u;
        v101 = 0u;
        v15 = (id)objc_claimAutoreleasedReturnValue();
        v38 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
        if (v38)
        {
          v39 = *(_QWORD *)v101;
          while (2)
          {
            for (i = 0; i != v38; ++i)
            {
              if (*(_QWORD *)v101 != v39)
                objc_enumerationMutation(v15);
              v41 = *(_QWORD *)(*((_QWORD *)&v100 + 1) + 8 * i);
              -[NSDictionary valueForKey:](self->_recipe, "valueForKey:", v41);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              v43 = v42 == 0;

              if (v43)
              {
                objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to read recipe[%@]"), v41);
                v80 = (void *)objc_claimAutoreleasedReturnValue();
                v81 = (void *)MEMORY[0x1E0CB35C8];
                v109 = *MEMORY[0x1E0CB2D50];
                v110 = v80;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v110, &v109, 1);
                v82 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v81, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v82);
                v16 = (id)objc_claimAutoreleasedReturnValue();

                goto LABEL_9;
              }
            }
            v38 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v100, v111, 16);
            if (v38)
              continue;
            break;
          }
        }

        v44 = [TextProcessorInference alloc];
        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("inferenceContextSize"));
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[TextProcessorInference initWithLength:vocab:BOS:](v44, "initWithLength:vocab:BOS:", objc_msgSend(v45, "integerValue"), self->_vocab, -[_EARLMTKaldiVocab beginOfSentenceIndex](self->_vocab, "beginOfSentenceIndex"));
        textProcessorInference = self->_textProcessorInference;
        self->_textProcessorInference = v46;

        v48 = [DataSourceInference alloc];
        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("inferenceContextSize"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = objc_msgSend(v49, "integerValue");
        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingContextKey"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingTargetKey"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        v53 = -[DataSourceInference initWithLength:contextKey:targetKey:](v48, "initWithLength:contextKey:targetKey:", v50, v51, v52);
        fofeInferenceSource = self->_fofeInferenceSource;
        self->_fofeInferenceSource = v53;

        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("sequenceLength"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v49) = objc_msgSend(v55, "intValue");

        v56 = -[TextProcessorTrain initWithVocab:]([TextProcessorTrain alloc], "initWithVocab:", self->_vocab);
        textProcessorTrain = self->_textProcessorTrain;
        self->_textProcessorTrain = v56;

        v58 = (int)v49;
        trainData = self->_trainData;
        v99[0] = MEMORY[0x1E0C809B0];
        v99[1] = 3221225472;
        v99[2] = __26___EARLMTGlobalNNLM_setup__block_invoke;
        v99[3] = &unk_1E5D47228;
        v99[4] = self;
        v99[5] = (int)v49;
        -[NSMutableArray enumerateObjectsUsingBlock:](trainData, "enumerateObjectsUsingBlock:", v99);
        v60 = [DataSourceTrain alloc];
        v61 = -[TextProcessorTrain numberSamples](self->_textProcessorTrain, "numberSamples");
        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("numNoise"));
        v94 = v61;
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v61) = objc_msgSend(v95, "intValue");
        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("batchSize"));
        v93 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = objc_msgSend(v93, "intValue");
        v63 = -[_EARLMTKaldiVocab vocabSize](self->_vocab, "vocabSize");
        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingContextKey"));
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingTargetKey"));
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingMaskKey"));
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingNoiseKey"));
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = -[DataSourceTrain initWithNumDataPoints:sequenceLength:noiseSize:batchSize:vocabSize:contextKey:targetKey:maskKey:noiseKey:](v60, "initWithNumDataPoints:sequenceLength:noiseSize:batchSize:vocabSize:contextKey:targetKey:maskKey:noiseKey:", v94, v58, (int)v61, v62, v63, v97, v96, v64, v65);
        fofeTrainSource = self->_fofeTrainSource;
        self->_fofeTrainSource = v66;

        v68 = sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AD756000, v68, OS_LOG_TYPE_INFO, "Data feeder loaded", buf, 2u);
        }
        v98 = 0;
        -[_EARLMTGlobalNNLM getEvalTask:](self, "getEvalTask:", &v98);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        v70 = v98;
        v12 = v70;
        if (!v69 || v70)
        {
          v16 = v70;
LABEL_52:

          goto LABEL_10;
        }
        -[_EARLMTGlobalNNLM _fetchTensorInfo:](self, "_fetchTensorInfo:", v69);
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("tensorInfo"));
        v72 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        tensorInfo = self->_tensorInfo;
        self->_tensorInfo = v72;

        objc_msgSend(v71, "objectForKeyedSubscript:", CFSTR("totalSize"));
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        self->_numParam = (int)objc_msgSend(v74, "intValue");

        if (_parseRecipeBoolField(self->_recipe, CFSTR("enableMemoryMap"), 0))
        {
          v75 = -[SimpleMmapBuffer initWithData:ofSize:]([SimpleMmapBuffer alloc], "initWithData:ofSize:", 0, 4 * self->_numParam);
          mmappedWeights = self->_mmappedWeights;
          self->_mmappedWeights = v75;

          v77 = self->_mmappedWeights;
          if (!v77)
          {
            v91 = (void *)MEMORY[0x1E0CB35C8];
            v107 = *MEMORY[0x1E0CB2D50];
            v108 = CFSTR("Unable to memory map the buffer");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v108, &v107, 1);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v91, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v92);
            v16 = (id)objc_claimAutoreleasedReturnValue();

LABEL_51:
            goto LABEL_52;
          }
          value = self->_weights.__ptr_.__value_;
          self->_weights.__ptr_.__value_ = 0;
          if (value)
          {
            MEMORY[0x1AF44D160](value, 0x1000C8052888210);
            v77 = self->_mmappedWeights;
          }
          v79 = -[SimpleMmapBuffer dataPointer](v77, "dataPointer");
        }
        else
        {
          numParam = self->_numParam;
          if (numParam >> 62)
            v86 = -1;
          else
            v86 = 4 * numParam;
          v79 = (void *)operator new[]();
          bzero(v79, v86);
          v87 = self->_weights.__ptr_.__value_;
          self->_weights.__ptr_.__value_ = (float *)v79;
          if (v87)
          {
            MEMORY[0x1AF44D160](v87, 0x1000C8052888210);
            v79 = self->_weights.__ptr_.__value_;
          }
        }
        self->_weightsRawPtr = (float *)v79;
        _fetchTensors(self->_tensorInfo, v69, (uint64_t)v79);
        v88 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
        tensors = self->_tensors;
        self->_tensors = v88;

        v90 = sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AD756000, v90, OS_LOG_TYPE_INFO, "Initial weights and tensor shapes have been read from evaluation graph", buf, 2u);
        }
        v16 = 0;
        goto LABEL_51;
      }
      v35 = (void *)MEMORY[0x1E0CB35C8];
      v117 = *MEMORY[0x1E0CB2D50];
      v118 = CFSTR("recipe[kRecipePartialUpdateOffsetFile] is configured but not resolved");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v118, &v117, 1);
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v15);
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v123 = *MEMORY[0x1E0CB2D50];
      v19 = (void *)MEMORY[0x1E0CB3940];
      -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("kaldiVocab"));
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "stringWithFormat:", CFSTR("No vocab file attached: %@"), v15);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v124 = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v124, &v123, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v21);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
LABEL_9:
    v12 = 0;
    goto LABEL_10;
  }
  v17 = (void *)MEMORY[0x1E0CB35C8];
  v125 = *MEMORY[0x1E0CB2D50];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No vocab filename specified in recipe."));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v126[0] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, &v125, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 151, v9);
  v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return v16;
}

- (id)getEvalTask:(id *)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  NSString *assetPath;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  id v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _QWORD v36[2];
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[2];
  uint64_t v40;
  void *v41;
  _QWORD v42[3];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v42[0] = CFSTR("inferenceInputs");
  v42[1] = CFSTR("inferenceOutputs");
  v42[2] = CFSTR("inferenceGraph");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v33;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v33 != v7)
          objc_enumerationMutation(v5);
        v9 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        -[NSDictionary valueForKey:](self->_recipe, "valueForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to read recipe[%@]"), v9);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = (void *)MEMORY[0x1E0CB35C8];
          v40 = *MEMORY[0x1E0CB2D50];
          v41 = v12;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 154, v15);
          v21 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
          goto LABEL_19;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v32, v43, 16);
      if (v6)
        continue;
      break;
    }
  }

  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("inferenceInputs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("inferenceOutputs"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  assetPath = self->_assetPath;
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("inferenceGraph"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingString:](assetPath, "stringByAppendingString:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "attachmentURL:withName:", self->_attachments, v15);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D1F4A8]);
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("checkpointName"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  v18 = (void *)objc_msgSend(v16, "initWithTrainingNetworkPath:inferenceInputs:inferenceOutputs:trainingInputs:trainingOutputs:trainingControlVariableName:withInitializer:error:", v29, v5, v12, v5, v12, CFSTR("is_training"), v17, &v31);
  v19 = v31;

  if (v19 || !v18)
  {
    v23 = (void *)MEMORY[0x1E0CB35C8];
    v38[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create ETModelDefinition (evaluation)"));
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v38[1] = *MEMORY[0x1E0CB3388];
    v39[0] = v20;
    v39[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 154, v24);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

LABEL_17:
    v21 = 0;
    goto LABEL_18;
  }
  v30 = 0;
  v20 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4C8]), "initWithTrainingModelDefinition:forPlatform:error:", v18, 1, &v30);
  v19 = v30;
  if (v19 || !v20)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v36[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create ETTaskDefinition (evaluation)"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v36[1] = *MEMORY[0x1E0CB3388];
    v37[0] = v26;
    v37[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v37, v36, 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 154, v27);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_17;
  }
  v20 = v20;
  v21 = v20;
LABEL_18:

LABEL_19:
  return v21;
}

- (id)findTensorsIndicesByKeyWord:(id)a3 tensorInfo:(id)a4
{
  id v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__16;
  v16 = __Block_byref_object_dispose__16;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __60___EARLMTGlobalNNLM_findTensorsIndicesByKeyWord_tensorInfo___block_invoke;
  v9[3] = &unk_1E5D492B8;
  v10 = v5;
  v11 = &v12;
  v6 = v5;
  objc_msgSend(a4, "enumerateKeysAndObjectsUsingBlock:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)getTrainTask:(id *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;
  _BOOL4 v11;
  NSString *assetPath;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  unint64_t numParam;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v42;
  void *v43;
  void *v44;
  uint8_t buf[16];
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  const __CFString *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  uint64_t v58;
  const __CFString *v59;
  uint64_t v60;
  void *v61;
  _BYTE v62[128];
  _QWORD v63[9];

  v63[7] = *MEMORY[0x1E0C80C00];
  v63[0] = CFSTR("trainingGraph");
  v63[1] = CFSTR("inferenceInputs");
  v63[2] = CFSTR("inferenceOutputs");
  v63[3] = CFSTR("trainingInputs");
  v63[4] = CFSTR("trainingOutputs");
  v63[5] = CFSTR("trainingGlobals");
  v63[6] = CFSTR("numberOfEpochs");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 7);
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v49;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v49 != v7)
          objc_enumerationMutation(v5);
        v9 = *(id *)(*((_QWORD *)&v48 + 1) + 8 * i);
        -[NSDictionary objectForKey:](self->_recipe, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10 == 0;

        if (v11)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to read recipe[%@]"), v9);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0CB35C8];
          v60 = *MEMORY[0x1E0CB2D50];
          v61 = v15;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v61, &v60, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 152, v30);
          *a3 = (id)objc_claimAutoreleasedReturnValue();

          v28 = 0;
          v14 = v5;
          goto LABEL_28;
        }

      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v48, v62, 16);
      if (v6)
        continue;
      break;
    }
  }

  assetPath = self->_assetPath;
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingGraph"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingString:](assetPath, "stringByAppendingString:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "attachmentURL:withName:", self->_attachments, v14);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingOutputs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingInputs"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0D1F4A8]);
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("inferenceInputs"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("inferenceOutputs"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("checkpointName"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v44 = (void *)objc_msgSend(v16, "initWithTrainingNetworkPath:inferenceInputs:inferenceOutputs:trainingInputs:trainingOutputs:trainingControlVariableName:withInitializer:error:", v9, v17, v18, v43, v15, CFSTR("is_training"), v19, &v47);
    v20 = v47;

    if (v20 || !v44)
    {
      v32 = (void *)MEMORY[0x1E0CB35C8];
      v33 = *MEMORY[0x1E0CB3388];
      v56[0] = *MEMORY[0x1E0CB2D50];
      v56[1] = v33;
      v57[0] = CFSTR("Unable to create ETModelDefinition (train)");
      v57[1] = v20;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = v32;
      v26 = (void *)v34;
      objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 152);
      v28 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v46 = 0;
      v42 = objc_msgSend(objc_alloc(MEMORY[0x1E0D1F4C8]), "initWithTrainingModelDefinition:forPlatform:error:", v44, 1, &v46);
      v20 = v46;
      if (v20 || !v42)
      {
        v36 = (void *)MEMORY[0x1E0CB35C8];
        v54[0] = *MEMORY[0x1E0CB2D50];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to create ETTaskDefinition (training)"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v54[1] = *MEMORY[0x1E0CB3388];
        v55[0] = v37;
        v55[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 152, v38);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v21 = sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AD756000, v21, OS_LOG_TYPE_INFO, "Training model loaded", buf, 2u);
        }
        numParam = self->_numParam;
        -[_EARLMTGlobalNNLM _fetchTensorInfo:](self, "_fetchTensorInfo:", v42);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("totalSize"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(numParam) = numParam == objc_msgSend(v24, "unsignedLongValue");

        if ((numParam & 1) != 0)
        {
          -[_EARLMTGlobalNNLM restoreFromLatestWeights:](self, "restoreFromLatestWeights:", v42);
          v25 = (id)objc_claimAutoreleasedReturnValue();
          *a3 = v25;
          v26 = (void *)v42;
          if (v25)
            v27 = 0;
          else
            v27 = (void *)v42;
          v28 = v27;
          goto LABEL_27;
        }
        v39 = (void *)MEMORY[0x1E0CB35C8];
        v52 = *MEMORY[0x1E0CB2D50];
        v53 = CFSTR("Unexpected number of parameters changed (training, this[%lu] vs previous[%lu])");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 152, v40);
        *a3 = (id)objc_claimAutoreleasedReturnValue();

      }
      v28 = 0;
      v26 = (void *)v42;
    }
LABEL_27:

    goto LABEL_28;
  }
  v31 = (void *)MEMORY[0x1E0CB35C8];
  v58 = *MEMORY[0x1E0CB2D50];
  v59 = CFSTR("training model is not attached");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v59, &v58, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 152, v15);
  v28 = 0;
  *a3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_28:

  return v28;
}

- (id)restoreFromLatestWeights:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingGlobals"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v7)
        objc_enumerationMutation(v5);
      v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v8);
      objc_msgSend(v4, "getTensorNamed:directBind:", v9, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSDictionary objectForKeyedSubscript:](self->_tensors, "objectForKeyedSubscript:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _copy(v11, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        break;
      if (v6 == ++v8)
      {
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

- (id)evaluate
{
  _EARLMTGlobalNNLM *v2;
  void *v3;
  id v4;
  NSObject *v5;
  id v6;
  float v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  DataSourceInference *fofeInferenceSource;
  void *v13;
  id v14;
  BOOL v15;
  int v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  id v21;
  void *v22;
  float *v23;
  float v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  int v29;
  double v30;
  NSObject *v31;
  void *v32;
  float v33;
  float v34;
  double v35;
  void *v36;
  double v37;
  void *v38;
  NSObject *v39;
  const char *v40;
  void *v41;
  float v42;
  float v43;
  double v44;
  void *v45;
  double v46;
  void *v47;
  void *v48;
  float v49;
  float v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  NSMutableArray *obj;
  void *v60;
  int v61;
  void *context;
  uint64_t v63;
  uint64_t v64;
  id v65;
  id v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  int v70;
  id v71;
  id v72;
  _EARLMTGlobalNNLM *v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  id v78;
  id v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  id v88[5];
  uint8_t buf[4];
  double v90;
  __int16 v91;
  double v92;
  _BYTE v93[128];
  _QWORD v94[2];
  _QWORD v95[2];
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v2 = self;
  v98 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1AF44DFA0](self, a2);
  v88[0] = 0;
  -[_EARLMTGlobalNNLM getEvalTask:](v2, "getEvalTask:", v88);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v88[0];
  if (!v3 || v4)
    goto LABEL_7;
  v5 = sLog;
  if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AD756000, v5, OS_LOG_TYPE_INFO, "Evaluation model loaded", buf, 2u);
  }
  if (v2->_weightsAreUpdated)
  {
    -[_EARLMTGlobalNNLM restoreFromLatestWeights:](v2, "restoreFromLatestWeights:", v3);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
LABEL_7:
      v72 = v4;
      v66 = v72;
      goto LABEL_59;
    }
  }
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  obj = v2->_evalData;
  v69 = v3;
  v73 = v2;
  v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
  if (v56)
  {
    v61 = 0;
    v6 = 0;
    v57 = *(_QWORD *)v85;
    v64 = *MEMORY[0x1E0CB2D50];
    v63 = *MEMORY[0x1E0CB3388];
    v7 = 0.0;
    do
    {
      for (i = 0; i != v56; ++i)
      {
        v72 = v6;
        if (*(_QWORD *)v85 != v57)
          objc_enumerationMutation(obj);
        v60 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v84 + 1) + 8 * i), "mutableCopy");
        -[TextProcessorInference resetWithBOS:](v2->_textProcessorInference, "resetWithBOS:", -[_EARLMTKaldiVocab beginOfSentenceIndex](v2->_vocab, "beginOfSentenceIndex"));
        -[_EARLMTKaldiVocab endOfSentenceToken](v2->_vocab, "endOfSentenceToken");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "addObject:", v8);

        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v65 = v60;
        v9 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
        if (v9)
        {
          v68 = *(_QWORD *)v81;
          while (2)
          {
            v10 = 0;
            v67 = v9;
            v61 += v9;
            do
            {
              if (*(_QWORD *)v81 != v68)
                objc_enumerationMutation(v65);
              v71 = *(id *)(*((_QWORD *)&v80 + 1) + 8 * v10);
              -[TextProcessorInference addText:](v73->_textProcessorInference, "addText:");
              v11 = (void *)MEMORY[0x1AF44DFA0](-[DataSourceInference setVectorsWithProcessor:](v73->_fofeInferenceSource, "setVectorsWithProcessor:", v73->_textProcessorInference));
              fofeInferenceSource = v73->_fofeInferenceSource;
              v79 = v72;
              objc_msgSend(v69, "doInferenceOnData:error:", fofeInferenceSource, &v79);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v79;

              if (v13)
                v15 = v14 == 0;
              else
                v15 = 0;
              v16 = v15;
              v70 = v16;
              if (v15)
              {
                v78 = 0;
                objc_msgSend(v13, "dataPointAtIndex:error:", 0, &v78);
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = v78;
                v74 = 0u;
                v75 = 0u;
                v76 = 0u;
                v77 = 0u;
                v26 = v17;
                v18 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
                if (v18)
                {
                  v19 = *(_QWORD *)v75;
                  do
                  {
                    for (j = 0; j != v18; ++j)
                    {
                      if (*(_QWORD *)v75 != v19)
                        objc_enumerationMutation(v26);
                      v21 = *(id *)(*((_QWORD *)&v74 + 1) + 8 * j);
                      objc_msgSend(v26, "objectForKeyedSubscript:", v21);
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      v23 = (float *)objc_msgSend(v22, "dataPointer");

                      v24 = *v23;
                      v7 = v7 + v24;
                    }
                    v18 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
                  }
                  while (v18);
                }

              }
              else
              {
                v25 = (void *)MEMORY[0x1E0CB35C8];
                v94[0] = v64;
                v94[1] = v63;
                v95[0] = CFSTR("Call to doInferenceOnData during evaluation failed.");
                v95[1] = v14;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
                v26 = (id)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 154, v26);
                v66 = (id)objc_claimAutoreleasedReturnValue();
                v72 = v14;
              }

              objc_autoreleasePoolPop(v11);
              if (!v70)
              {

                goto LABEL_58;
              }
              ++v10;
            }
            while (v10 != v67);
            v9 = objc_msgSend(v65, "countByEnumeratingWithState:objects:count:", &v80, v96, 16);
            if (v9)
              continue;
            break;
          }
        }

        v6 = v72;
        v2 = v73;
      }
      v56 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v84, v97, 16);
    }
    while (v56);
  }
  else
  {
    v61 = 0;
    v6 = 0;
    v7 = 0.0;
  }
  v72 = v6;

  -[NSMutableDictionary objectForKeyedSubscript:](v73->_results, "objectForKeyedSubscript:", CFSTR("NumWordsInEvaluation"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  if (!v27)
    v27 = &unk_1E5D5BE88;
  v29 = objc_msgSend(v27, "intValue");

  if (v29 >= 1 && v29 != v61)
  {
    v31 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[_EARLMTGlobalNNLM evaluate].cold.1(v29, v61, v31);
  }
  if (v73->_weightsAreUpdated)
  {
    if (v73->_mmappedPartialWeights)
    {
      *(float *)&v30 = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v73->_results, "setObject:forKeyedSubscript:", v32, CFSTR("TotalEvalCostWithPartialUpdate"));

      v33 = v7 / (float)v61;
      v34 = expf(v33);
      *(float *)&v35 = v33;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v73->_results, "setObject:forKeyedSubscript:", v36, CFSTR("EvaluationCostWithPartialUpdate"));

      *(float *)&v37 = v34;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v73->_results, "setObject:forKeyedSubscript:", v38, CFSTR("EvaluationPPLWithPartialUpdate"));

      v39 = sLog;
      if (!os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        goto LABEL_57;
      *(_DWORD *)buf = 134218240;
      v90 = v33;
      v91 = 2048;
      v92 = v34;
      v40 = "evaluation cost/PPL with partial update: %.2f/%.2f";
    }
    else
    {
      *(float *)&v30 = v7;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v73->_results, "setObject:forKeyedSubscript:", v48, CFSTR("TotalEvalCostAfterTraining"));

      v49 = v7 / (float)v61;
      v50 = expf(v49);
      *(float *)&v51 = v49;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v51);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v73->_results, "setObject:forKeyedSubscript:", v52, CFSTR("EvaluationCostAfterTraining"));

      *(float *)&v53 = v50;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v53);
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v73->_results, "setObject:forKeyedSubscript:", v54, CFSTR("EvaluationPPLAfterTraining"));

      v39 = sLog;
      if (!os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        goto LABEL_57;
      *(_DWORD *)buf = 134218240;
      v90 = v49;
      v91 = 2048;
      v92 = v50;
      v40 = "evaluation cost/PPL after training: %.2f/%.2f";
    }
  }
  else
  {
    *(float *)&v30 = v7;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v30);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v73->_results, "setObject:forKeyedSubscript:", v41, CFSTR("TotalEvalCostBeforeTraining"));

    v42 = v7 / (float)v61;
    v43 = expf(v42);
    *(float *)&v44 = v42;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v44);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v73->_results, "setObject:forKeyedSubscript:", v45, CFSTR("EvaluationCostBeforeTraining"));

    *(float *)&v46 = v43;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v46);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v73->_results, "setObject:forKeyedSubscript:", v47, CFSTR("EvaluationPPLBeforeTraining"));

    v39 = sLog;
    if (!os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      goto LABEL_57;
    *(_DWORD *)buf = 134218240;
    v90 = v42;
    v91 = 2048;
    v92 = v43;
    v40 = "evaluation cost/PPL before training: %.2f/%.2f";
  }
  _os_log_impl(&dword_1AD756000, v39, OS_LOG_TYPE_INFO, v40, buf, 0x16u);
LABEL_57:
  v66 = 0;
LABEL_58:
  v3 = v69;
LABEL_59:

  objc_autoreleasePoolPop(context);
  return v66;
}

- (id)train
{
  uint64_t v3;
  void *v4;
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  float *v10;
  NSObject *v11;
  double v12;
  void *v13;
  BOOL v14;
  void *v15;
  int v16;
  void *v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  int v28;
  void *v29;
  double v30;
  void *v31;
  int v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  float v37;
  float v38;
  float v39;
  uint64_t v40;
  _BOOL4 v41;
  double v42;
  const char *v43;
  NSObject *v44;
  uint32_t v45;
  NSObject *v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  DataSourceTrain *fofeTrainSource;
  char v57;
  void *v58;
  void *v59;
  void *v60;
  void *v62;
  void *v63;
  void *context;
  void *v65;
  void *v66;
  id v67;
  _QWORD v68[4];
  id v69;
  _EARLMTGlobalNNLM *v70;
  _QWORD *v71;
  __int128 *v72;
  uint64_t *v73;
  _QWORD *v74;
  uint64_t *v75;
  __int128 *v76;
  int v77;
  _QWORD v78[4];
  id v79;
  id v80;
  _EARLMTGlobalNNLM *v81;
  id v82;
  _QWORD *v83;
  __int128 *p_buf;
  _QWORD *v85;
  uint64_t *v86;
  __int128 *v87;
  _QWORD v88[3];
  BOOL v89;
  uint64_t v90;
  float *v91;
  uint64_t v92;
  float v93;
  _QWORD v94[3];
  int v95;
  uint64_t v96;
  uint64_t *v97;
  uint64_t v98;
  uint64_t (*v99)(uint64_t, uint64_t);
  void (*v100)(uint64_t);
  id v101;
  id v102;
  id v103[5];
  _QWORD v104[2];
  _QWORD v105[2];
  uint8_t v106[4];
  uint64_t v107;
  __int128 v108;
  uint64_t v109;
  BOOL v110;
  __int128 buf;
  uint64_t v112;
  uint64_t (*v113)(uint64_t, uint64_t);
  void (*v114)(uint64_t);
  id v115;
  uint64_t v116;

  v116 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = MEMORY[0x1AF44DFA0]();
  v103[0] = 0;
  -[_EARLMTGlobalNNLM getTrainTask:](self, "getTrainTask:", v103);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v103[0];
  context = (void *)v3;
  if (!v4 || v5)
  {
    v27 = v5;
    v28 = 1;
    v29 = v27;
    goto LABEL_35;
  }
  v65 = v4;
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingOutputs"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("learningRateName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6 == 0;

  if (!v7)
  {
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("learningRateName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "getTensorNamed:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = (float *)objc_msgSend(v9, "dataPointer");
    v11 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      v12 = *v10;
      LODWORD(buf) = 134217984;
      *(double *)((char *)&buf + 4) = v12;
      _os_log_impl(&dword_1AD756000, v11, OS_LOG_TYPE_INFO, "The learning rate embedded in the training graph is %f", (uint8_t *)&buf, 0xCu);
    }
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("learningRateValue"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 == 0;

    if (!v14)
    {
      -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("learningRateValue"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "floatValue");
      *(_DWORD *)v10 = v16;

      -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("learningRateName"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v102 = 0;
      objc_msgSend(v65, "setTensorNamed:withValue:error:", v17, v9, &v102);
      v18 = v102;

      v19 = sLog;
      if (v18)
      {
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
          -[_EARLMTGlobalNNLM train].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);
      }
      else if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
      {
        v30 = *v10;
        LODWORD(buf) = 134217984;
        *(double *)((char *)&buf + 4) = v30;
        _os_log_impl(&dword_1AD756000, v19, OS_LOG_TYPE_INFO, "Override learning rate with value %f", (uint8_t *)&buf, 0xCu);
      }

    }
  }
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("batchPerUpdate"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "unsignedIntValue");

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v112 = 0x3032000000;
  v113 = __Block_byref_object_copy__16;
  v114 = __Block_byref_object_dispose__16;
  v115 = (id)objc_opt_new();
  v96 = 0;
  v97 = &v96;
  v98 = 0x3032000000;
  v99 = __Block_byref_object_copy__16;
  v100 = __Block_byref_object_dispose__16;
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("sparseGlobals"));
  v33 = objc_claimAutoreleasedReturnValue();
  v34 = (void *)v33;
  v35 = (void *)MEMORY[0x1E0C9AA60];
  if (v33)
    v35 = (void *)v33;
  v101 = v35;

  v94[0] = 0;
  v94[1] = v94;
  v94[2] = 0x2020000000;
  v95 = 0;
  v90 = 0;
  v91 = (float *)&v90;
  v92 = 0x2020000000;
  v93 = 0.0;
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("l2ClipNorm"));
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "floatValue");
  if (v37 == 0.0)
    v38 = 0.0;
  else
    v38 = v37;

  v93 = v38;
  v88[0] = 0;
  v88[1] = v88;
  v88[2] = 0x2020000000;
  v89 = 0;
  v39 = v91[6];
  v89 = v39 > 0.0;
  v40 = sLog;
  v41 = os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO);
  if (v39 <= 0.0)
  {
    if (!v41)
      goto LABEL_26;
    LOWORD(v108) = 0;
    v43 = "Gradients are not clipped";
    v44 = v40;
    v45 = 2;
  }
  else
  {
    if (!v41)
      goto LABEL_26;
    v42 = v91[6];
    LODWORD(v108) = 134217984;
    *(double *)((char *)&v108 + 4) = v42;
    v43 = "Gradients are clipped by global L2Norm of %f";
    v44 = v40;
    v45 = 12;
  }
  _os_log_impl(&dword_1AD756000, v44, OS_LOG_TYPE_INFO, v43, (uint8_t *)&v108, v45);
LABEL_26:
  *(_QWORD *)&v108 = 0;
  *((_QWORD *)&v108 + 1) = &v108;
  v109 = 0x2020000000;
  v110 = v32 > 0;
  if (v32 >= 1)
  {
    v46 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      v47 = v97[5];
      *(_DWORD *)v106 = 138412290;
      v107 = v47;
      _os_log_impl(&dword_1AD756000, v46, OS_LOG_TYPE_INFO, "Gradient of %@ are accumulated in a sparse fashion", v106, 0xCu);
    }
  }
  v48 = MEMORY[0x1E0C809B0];
  v78[0] = MEMORY[0x1E0C809B0];
  v78[1] = 3221225472;
  v78[2] = __26___EARLMTGlobalNNLM_train__block_invoke;
  v78[3] = &unk_1E5D492E0;
  v49 = v62;
  v79 = v49;
  v80 = v66;
  v81 = self;
  v83 = v94;
  p_buf = &buf;
  v85 = v88;
  v86 = &v90;
  v87 = &v108;
  v50 = v65;
  v82 = v50;
  v63 = (void *)MEMORY[0x1AF44E144](v78);
  v68[0] = v48;
  v68[1] = 3221225472;
  v68[2] = __26___EARLMTGlobalNNLM_train__block_invoke_214;
  v68[3] = &unk_1E5D49308;
  v51 = v49;
  v69 = v51;
  v70 = self;
  v71 = v94;
  v72 = &buf;
  v77 = v32;
  v73 = &v96;
  v74 = v88;
  v75 = &v90;
  v76 = &v108;
  v52 = (void *)MEMORY[0x1AF44E144](v68);
  v53 = (void *)objc_opt_new();
  v54 = (void *)MEMORY[0x1AF44E144](v63);
  objc_msgSend(v53, "setObject:forKeyedSubscript:", v54, *MEMORY[0x1E0D1F480]);

  if (*(_BYTE *)(*((_QWORD *)&v108 + 1) + 24))
  {
    v55 = (void *)MEMORY[0x1AF44E144](v52);
    objc_msgSend(v53, "setObject:forKeyedSubscript:", v55, *MEMORY[0x1E0D1F470]);

  }
  -[TextProcessorTrain shuffleSamples](self->_textProcessorTrain, "shuffleSamples");
  -[DataSourceTrain setVectorsWithProcessor:](self->_fofeTrainSource, "setVectorsWithProcessor:", self->_textProcessorTrain);
  fofeTrainSource = self->_fofeTrainSource;
  -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("numberOfEpochs"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0;
  v57 = objc_msgSend(v50, "doTrainingOnData:forNumberOfEpochs:withCallback:error:", fofeTrainSource, (int)objc_msgSend(v29, "intValue"), v53, &v67);
  v27 = v67;

  if ((v57 & 1) != 0)
  {
    v28 = 0;
  }
  else
  {
    v58 = (void *)MEMORY[0x1E0CB35C8];
    v104[0] = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Training failed with error."));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v104[1] = *MEMORY[0x1E0CB3388];
    v105[0] = v59;
    v105[1] = v27;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v105, v104, 2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 152, v60);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 1;
  }

  _Block_object_dispose(&v108, 8);
  _Block_object_dispose(v88, 8);
  _Block_object_dispose(&v90, 8);
  _Block_object_dispose(v94, 8);
  _Block_object_dispose(&v96, 8);

  _Block_object_dispose(&buf, 8);
  v4 = v65;
LABEL_35:

  objc_autoreleasePoolPop(context);
  if (!v28)
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_results, "setObject:forKeyedSubscript:", v66, CFSTR("TrainingCostOfEachBatch"));
    v29 = 0;
    self->_weightsAreUpdated = 1;
  }

  return v29;
}

- (id)evaluatePartialDelta
{
  void *v3;
  id v4;
  NSDictionary *v5;
  NSDictionary *tensors;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  void *v25;
  void *v26;
  unsigned int v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id obj;
  void *v43;
  float *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49[5];
  uint64_t v50;
  void *v51;
  uint64_t v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v49[0] = 0;
  -[_EARLMTGlobalNNLM getEvalTask:](self, "getEvalTask:", v49);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v49[0];
  v43 = v3;
  if (v3 && !v4)
  {
    _fetchTensors(self->_tensorInfo, v3, (uint64_t)self->_weightsRawPtr);
    v5 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    tensors = self->_tensors;
    self->_tensors = v5;

    v44 = -[SimpleMmapBuffer dataPointer](self->_mmappedPartialWeights, "dataPointer");
    v7 = -[SimpleMmapBuffer size](self->_mmappedPartialWeights, "size");
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingGlobals"));
    obj = (id)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
    v9 = 0;
    if (v8)
    {
      v10 = v7 >> 2;
      v11 = *(_QWORD *)v46;
      v39 = *(_QWORD *)v46;
      do
      {
        v12 = 0;
        v40 = v8;
        while (2)
        {
          if (*(_QWORD *)v46 != v11)
            objc_enumerationMutation(obj);
          v13 = 0;
          v41 = v12;
          v14 = *(_QWORD *)(*((_QWORD *)&v45 + 1) + 8 * v12);
          while (1)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_partialUpdateOffsets, "objectForKeyedSubscript:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = v13 < objc_msgSend(v15, "count");

            if (!v16)
              break;
            -[NSMutableDictionary objectForKeyedSubscript:](self->_partialUpdateOffsets, "objectForKeyedSubscript:", v14);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectAtIndexedSubscript:", v13);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("start"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = objc_msgSend(v19, "unsignedIntegerValue");

            -[NSMutableDictionary objectForKeyedSubscript:](self->_partialUpdateOffsets, "objectForKeyedSubscript:", v14);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "objectAtIndexedSubscript:", v13);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "objectForKeyedSubscript:", CFSTR("end"));
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "unsignedIntegerValue");

            -[NSDictionary objectForKeyedSubscript:](self->_tensorInfo, "objectForKeyedSubscript:", v14);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "objectForKeyedSubscript:", CFSTR("size"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_msgSend(v26, "unsignedIntValue");

            -[NSDictionary objectForKeyedSubscript:](self->_tensors, "objectForKeyedSubscript:", v14);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "dataPointer");

            if (v20 < v24)
            {
              while (1)
              {
                if (v20 > v27)
                {
                  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("setting %@[%lu] while size(%@) == %lu"), v14, v20, v14, v27);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = (void *)MEMORY[0x1E0CB35C8];
                  v52 = *MEMORY[0x1E0CB2D50];
                  v53 = v33;
                  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 154, v35);
                  v36 = objc_claimAutoreleasedReturnValue();
                  goto LABEL_25;
                }
                if (v9 > v10)
                  break;
                v30 = v9 + 1;
                *(float *)(v29 + 4 * v20) = v44[v9] + *(float *)(v29 + 4 * v20);
                ++v20;
                ++v9;
                if (v24 == v20)
                  goto LABEL_16;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("accessing partiaDelta[%lu] while size(partiaDelta) == %lu"), v9, v10);
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v37 = (void *)MEMORY[0x1E0CB35C8];
              v50 = *MEMORY[0x1E0CB2D50];
              v51 = v33;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v51, &v50, 1);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 154, v35);
              v36 = objc_claimAutoreleasedReturnValue();
LABEL_25:
              v32 = (void *)v36;

              v31 = 0;
              goto LABEL_26;
            }
            v30 = v9;
LABEL_16:
            ++v13;
            v9 = v30;
          }
          v12 = v41 + 1;
          v11 = v39;
          if (v41 + 1 != v40)
            continue;
          break;
        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v54, 16);
      }
      while (v8);
    }

    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
      -[_EARLMTGlobalNNLM evaluatePartialDelta].cold.1();
    -[_EARLMTGlobalNNLM evaluate](self, "evaluate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v31 = v4;
  v32 = v31;
LABEL_26:

  return v32;
}

- (id)computeDelta:(BOOL)a3
{
  _BOOL4 v3;
  uint64_t v5;
  void *v6;
  id v7;
  NSDictionary *v8;
  id v9;
  double v10;
  NSDictionary *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  BOOL v25;
  void *v26;
  void *v27;
  unsigned int v28;
  float *weightsRawPtr;
  float v30;
  unint64_t numParam;
  float *v32;
  uint64_t v33;
  double v34;
  float v35;
  int v36;
  void *v37;
  void *v38;
  void *v39;
  NSData *delta;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  void *v45;
  _BOOL4 v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  NSData *v51;
  void *v52;
  void *v53;
  float v54;
  NSObject *v55;
  double v56;
  void *v57;
  void *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  uint64_t v63;
  int v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  NSObject *v70;
  unint64_t j;
  void *v72;
  BOOL v73;
  void *v74;
  void *v75;
  void *v76;
  int v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  float v84;
  float v85;
  unint64_t v86;
  uint64_t v87;
  unint64_t v88;
  float *v89;
  float v90;
  unint64_t v91;
  float *v92;
  uint64_t v93;
  double v94;
  float v95;
  void *v96;
  void *v97;
  void *v98;
  float v99;
  NSObject *v100;
  unint64_t v101;
  double v102;
  float *v103;
  float *v104;
  unint64_t v105;
  uint64_t v106;
  float v107;
  NSObject *v108;
  float v109;
  NSObject *v110;
  double v111;
  SimpleMmapBuffer *v112;
  SimpleMmapBuffer *mmappedPartialWeights;
  unint64_t v114;
  float numWordsTrain;
  float *v116;
  NSObject *v117;
  void *v118;
  void *v119;
  void *v120;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  void *v128;
  _BOOL4 v129;
  void *v130;
  void *context;
  void *v132;
  void *v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  id v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  uint64_t v151;
  const __CFString *v152;
  uint64_t v153;
  const __CFString *v154;
  uint64_t v155;
  void *v156;
  _BYTE v157[128];
  _QWORD v158[2];
  uint64_t v159;
  const __CFString *v160;
  uint64_t v161;
  void *v162;
  _QWORD v163[3];
  _QWORD v164[3];
  void *v165;
  _BYTE v166[128];
  uint64_t v167;
  void *v168;
  uint8_t v169[128];
  uint8_t buf[4];
  double v171;
  uint64_t v172;

  v3 = a3;
  v172 = *MEMORY[0x1E0C80C00];
  v5 = MEMORY[0x1AF44DFA0](self, a2);
  v146 = 0;
  -[_EARLMTGlobalNNLM getEvalTask:](self, "getEvalTask:", &v146);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  context = (void *)v5;
  v129 = v3;
  v7 = v146;
  v130 = v7;
  v132 = v6;
  if (!v6 || v7)
  {
    v10 = COERCE_DOUBLE(v7);
    v36 = 1;
  }
  else
  {
    v8 = self->_tensorInfo;
    v9 = v6;
    v10 = COERCE_DOUBLE(objc_opt_new());
    v149 = 0u;
    v150 = 0u;
    v147 = 0u;
    v148 = 0u;
    v11 = v8;
    v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v147, buf, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v148;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v148 != v13)
            objc_enumerationMutation(v11);
          v15 = *(_QWORD *)(*((_QWORD *)&v147 + 1) + 8 * i);
          objc_msgSend(v9, "getTensorNamed:directBind:", v15, 1);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)&v10, "setObject:forKeyedSubscript:", v16, v15);

        }
        v12 = -[NSDictionary countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v147, buf, 16);
      }
      while (v12);
    }

    v142 = 0u;
    v143 = 0u;
    v144 = 0u;
    v145 = 0u;
    v17 = *(id *)&v10;
    v133 = v17;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v142, v169, 16);
    if (v18)
    {
      v125 = *(_QWORD *)v143;
      do
      {
        v19 = 0;
        v123 = v18;
        do
        {
          if (*(_QWORD *)v143 != v125)
            objc_enumerationMutation(v17);
          v20 = *(_QWORD *)(*((_QWORD *)&v142 + 1) + 8 * v19);
          objc_msgSend(v17, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v127 = v19;
          v22 = objc_msgSend(v21, "dataPointer");

          v10 = 0.0;
          while (1)
          {
            -[NSDictionary objectForKeyedSubscript:](self->_tensorInfo, "objectForKeyedSubscript:", v20);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("size"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = *(_QWORD *)&v10 < (int)objc_msgSend(v24, "intValue");

            if (!v25)
              break;
            -[NSDictionary objectForKeyedSubscript:](self->_tensorInfo, "objectForKeyedSubscript:", v20);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "objectForKeyedSubscript:", CFSTR("offset"));
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "intValue");

            weightsRawPtr = self->_weightsRawPtr;
            v30 = weightsRawPtr[LODWORD(v10) + v28] - *(float *)(v22 + 4 * *(_QWORD *)&v10);
            weightsRawPtr[LODWORD(v10) + v28] = v30;
            ++*(_QWORD *)&v10;
            if ((LODWORD(v30) & 0x7FFFFFFFu) >= 0x7F800000)
            {
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("delta[%d] is not finite"), *(_QWORD *)&v10 + v28 - 1);
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = (void *)MEMORY[0x1E0CB35C8];
              v167 = *MEMORY[0x1E0CB2D50];
              v168 = v37;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v168, &v167, 1);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 156, v39);
              v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

              goto LABEL_26;
            }
          }
          v19 = v127 + 1;
          v17 = v133;
        }
        while (v127 + 1 != v123);
        v18 = objc_msgSend(v133, "countByEnumeratingWithState:objects:count:", &v142, v169, 16);
      }
      while (v18);
    }

    numParam = self->_numParam;
    if (numParam)
    {
      v32 = self->_weightsRawPtr;
      v33 = 4 * numParam;
      v34 = 0.0;
      do
      {
        v35 = *v32++;
        v34 = v34 + (float)(v35 * v35);
        v33 -= 4;
      }
      while (v33);
    }
    else
    {
      v34 = 0.0;
    }
    v54 = sqrt(v34);
    v55 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v171 = v54;
      _os_log_impl(&dword_1AD756000, v55, OS_LOG_TYPE_INFO, "l2-norm of the delta is %f", buf, 0xCu);
    }
    *(float *)&v56 = v54;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v56);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_results, "setObject:forKeyedSubscript:", v57, CFSTR("DeltaL2Norm"));

    if (!self->_deltaIsPartial)
      goto LABEL_99;
    self->_numParam = 0;
    v138 = 0u;
    v139 = 0u;
    v140 = 0u;
    v141 = 0u;
    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("trainingGlobals"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v138, v166, 16);
    if (v59)
    {
      v60 = *(_QWORD *)v139;
      v128 = v58;
      v122 = *(_QWORD *)v139;
      do
      {
        v61 = 0;
        v124 = v59;
        while (2)
        {
          if (*(_QWORD *)v139 != v60)
            objc_enumerationMutation(v58);
          v126 = v61;
          v10 = *(double *)(*((_QWORD *)&v138 + 1) + 8 * v61);
          -[NSDictionary objectForKeyedSubscript:](self->_tensorInfo, "objectForKeyedSubscript:", *(_QWORD *)&v10);
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "objectForKeyedSubscript:", CFSTR("offset"));
          v63 = objc_claimAutoreleasedReturnValue();
          v64 = objc_msgSend((id)v63, "intValue");

          -[NSMutableDictionary objectForKeyedSubscript:](self->_partialUpdateOffsets, "objectForKeyedSubscript:", *(_QWORD *)&v10);
          v65 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v63) = v65 == 0;

          if ((v63 & 1) != 0)
          {
            v164[0] = &unk_1E5D5BE88;
            v163[0] = CFSTR("start");
            v163[1] = CFSTR("end");
            -[NSDictionary objectForKeyedSubscript:](self->_tensorInfo, "objectForKeyedSubscript:", *(_QWORD *)&v10);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("size"));
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            v163[2] = CFSTR("scale");
            v164[1] = v67;
            v164[2] = &unk_1E5D5BFD8;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v164, v163, 3);
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            v165 = v68;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v165, 1);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](self->_partialUpdateOffsets, "setObject:forKeyedSubscript:", v69, *(_QWORD *)&v10);

            v70 = sLog;
            if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              v171 = v10;
              _os_log_debug_impl(&dword_1AD756000, v70, OS_LOG_TYPE_DEBUG, "%@ applies full update", buf, 0xCu);
            }
          }
          for (j = 0; ; ++j)
          {
            -[NSMutableDictionary objectForKeyedSubscript:](self->_partialUpdateOffsets, "objectForKeyedSubscript:", *(_QWORD *)&v10);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v73 = j < objc_msgSend(v72, "count");

            if (!v73)
              break;
            -[NSMutableDictionary objectForKeyedSubscript:](self->_partialUpdateOffsets, "objectForKeyedSubscript:", *(_QWORD *)&v10);
            v74 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v74, "objectAtIndexedSubscript:", j);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v75, "objectForKeyedSubscript:", CFSTR("start"));
            v76 = (void *)objc_claimAutoreleasedReturnValue();
            v77 = objc_msgSend(v76, "unsignedIntValue");

            -[NSMutableDictionary objectForKeyedSubscript:](self->_partialUpdateOffsets, "objectForKeyedSubscript:", *(_QWORD *)&v10);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v78, "objectAtIndexedSubscript:", j);
            v79 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v79, "objectForKeyedSubscript:", CFSTR("end"));
            v80 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v75) = objc_msgSend(v80, "unsignedIntValue");

            -[NSMutableDictionary objectForKeyedSubscript:](self->_partialUpdateOffsets, "objectForKeyedSubscript:", *(_QWORD *)&v10);
            v81 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v81, "objectAtIndexedSubscript:", j);
            v82 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "objectForKeyedSubscript:", CFSTR("scale"));
            v83 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v83, "floatValue");
            v85 = v84;

            v86 = (v77 + v64);
            v87 = ((_DWORD)v75 + v64);
            if (v86 < v87)
            {
              v88 = self->_numParam;
              while (v86 >= v88)
              {
                v89 = self->_weightsRawPtr;
                v90 = v85 * v89[v86];
                self->_numParam = v88 + 1;
                v89[v88] = v90;
                ++v86;
                ++v88;
                if (v87 == v86)
                  goto LABEL_62;
              }
              objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shifting delta[%lu] to delta[%lu] may overwrite chosen gradient"), v86, v88);
              v96 = (void *)objc_claimAutoreleasedReturnValue();
              v97 = (void *)MEMORY[0x1E0CB35C8];
              v161 = *MEMORY[0x1E0CB2D50];
              v162 = v96;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v162, &v161, 1);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v97, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 156, v98);
              v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

              goto LABEL_26;
            }
LABEL_62:
            ;
          }
          v61 = v126 + 1;
          v58 = v128;
          v60 = v122;
          if (v126 + 1 != v124)
            continue;
          break;
        }
        v59 = objc_msgSend(v128, "countByEnumeratingWithState:objects:count:", &v138, v166, 16);
      }
      while (v59);
    }

    v91 = self->_numParam;
    if (v91)
    {
      v92 = self->_weightsRawPtr;
      v93 = 4 * v91;
      v94 = 0.0;
      do
      {
        v95 = *v92++;
        v94 = v94 + (float)(v95 * v95);
        v93 -= 4;
      }
      while (v93);
    }
    else
    {
      v94 = 0.0;
    }
    v99 = sqrt(v94);
    v100 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v171 = v99;
      _os_log_impl(&dword_1AD756000, v100, OS_LOG_TYPE_INFO, "l2-norm of the partial delta before normalization is %f", buf, 0xCu);
    }
    v101 = self->_numParam;
    v102 = 0.0;
    if (v101)
    {
      v103 = self->_weightsRawPtr;
      v104 = v103;
      v105 = self->_numParam;
      do
      {
        *v104 = (float)(v54 / v99) * *v104;
        ++v104;
        --v105;
      }
      while (v105);
      v106 = 4 * v101;
      v102 = 0.0;
      do
      {
        v107 = *v103++;
        v102 = v102 + (float)(v107 * v107);
        v106 -= 4;
      }
      while (v106);
    }
    v108 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      v109 = sqrt(v102);
      *(_DWORD *)buf = 134217984;
      v171 = v109;
      _os_log_impl(&dword_1AD756000, v108, OS_LOG_TYPE_INFO, "l2-norm of the partial delta after normalization is %f", buf, 0xCu);
    }
    v110 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
    {
      v111 = *(double *)&self->_numParam;
      *(_DWORD *)buf = 134217984;
      v171 = v111;
      _os_log_impl(&dword_1AD756000, v110, OS_LOG_TYPE_INFO, "Gradients of %lu parameters are chosen and sent to server", buf, 0xCu);
    }
    v112 = -[SimpleMmapBuffer initWithData:ofSize:]([SimpleMmapBuffer alloc], "initWithData:ofSize:", self->_weightsRawPtr, 4 * self->_numParam);
    mmappedPartialWeights = self->_mmappedPartialWeights;
    self->_mmappedPartialWeights = v112;

    if (!self->_mmappedPartialWeights)
    {
      v118 = (void *)MEMORY[0x1E0CB35C8];
      v159 = *MEMORY[0x1E0CB2D50];
      v160 = CFSTR("Unable to buffer partial delta");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v160, &v159, 1);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v118, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 1, v119);
      v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());

LABEL_26:
      v36 = 1;
    }
    else
    {
LABEL_99:
      if (_parseRecipeBoolField(self->_recipe, CFSTR("deltaIsWeighted"), 1))
      {
        v114 = self->_numParam;
        if (v114)
        {
          numWordsTrain = (float)self->_numWordsTrain;
          v116 = self->_weightsRawPtr;
          do
          {
            *v116 = *v116 * numWordsTrain;
            ++v116;
            --v114;
          }
          while (v114);
        }
        v117 = sLog;
        if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AD756000, v117, OS_LOG_TYPE_INFO, "delta is weighted", buf, 2u);
        }
      }
      v36 = 0;
    }

  }
  objc_autoreleasePoolPop(context);
  if (!v36)
  {
    if (!v129)
    {
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_weightsRawPtr, 4 * self->_numParam);
      v51 = (NSData *)objc_claimAutoreleasedReturnValue();
      v10 = 0.0;
      delta = self->_delta;
      self->_delta = v51;
LABEL_95:

      goto LABEL_96;
    }
    v158[0] = CFSTR("maxNorm");
    v158[1] = CFSTR("normBinCount");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v158, 2);
    v136 = 0u;
    v137 = 0u;
    v134 = 0u;
    v135 = 0u;
    delta = (NSData *)(id)objc_claimAutoreleasedReturnValue();
    v41 = -[NSData countByEnumeratingWithState:objects:count:](delta, "countByEnumeratingWithState:objects:count:", &v134, v157, 16);
    if (v41)
    {
      v42 = *(_QWORD *)v135;
      while (2)
      {
        for (k = 0; k != v41; ++k)
        {
          if (*(_QWORD *)v135 != v42)
            objc_enumerationMutation(delta);
          v44 = *(_QWORD *)(*((_QWORD *)&v134 + 1) + 8 * k);
          -[NSDictionary valueForKey:](self->_recipe, "valueForKey:", v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = v45 == 0;

          if (v46)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unable to read recipe[%@]"), v44);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v52 = (void *)MEMORY[0x1E0CB35C8];
            v155 = *MEMORY[0x1E0CB2D50];
            v156 = v48;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v156, &v155, 1);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v52, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 153, v53);
            v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v47 = delta;
            goto LABEL_93;
          }
        }
        v41 = -[NSData countByEnumeratingWithState:objects:count:](delta, "countByEnumeratingWithState:objects:count:", &v134, v157, 16);
        if (v41)
          continue;
        break;
      }
    }

    -[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("iCloudAggServiceKey"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    if (v47
      || (-[NSDictionary objectForKeyedSubscript:](self->_recipe, "objectForKeyedSubscript:", CFSTR("HaruspexKey")),
          (v47 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBase64EncodedString:options:", v47, 0);
      v49 = *MEMORY[0x1E0CB2D50];
      if (!v48)
      {
        v50 = (void *)MEMORY[0x1E0CB35C8];
        v153 = *MEMORY[0x1E0CB2D50];
        v154 = CFSTR("Corrupted HaruspexKey");
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v154, &v153, 1);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 153, v48);
        v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
LABEL_94:

        goto LABEL_95;
      }
    }
    else
    {
      v48 = 0;
      v49 = *MEMORY[0x1E0CB2D50];
    }
    v120 = (void *)MEMORY[0x1E0CB35C8];
    v151 = v49;
    v152 = CFSTR("Privatization of deltas failed");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v152, &v151, 1);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v120, "errorWithDomain:code:userInfo:", CFSTR("com.apple.siri.languagemodeltraining"), 153, v53);
    v10 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
LABEL_93:

    goto LABEL_94;
  }
LABEL_96:

  return *(id *)&v10;
}

- (NSArray)attachments
{
  return self->_attachments;
}

- (void)setAttachments:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSData)delta
{
  return self->_delta;
}

- (NSMutableArray)trainData
{
  return self->_trainData;
}

- (void)setTrainData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSMutableArray)evalData
{
  return self->_evalData;
}

- (void)setEvalData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSMutableDictionary)results
{
  return self->_results;
}

- (BOOL)deltaIsPartial
{
  return self->_deltaIsPartial;
}

- (_EARLMTKaldiVocab)vocab
{
  return self->_vocab;
}

- (void).cxx_destruct
{
  float *value;

  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_delta, 0);
  objc_storeStrong((id *)&self->_mmappedPartialWeights, 0);
  objc_storeStrong((id *)&self->_partialUpdateOffsets, 0);
  objc_storeStrong((id *)&self->_tensorInfo, 0);
  objc_storeStrong((id *)&self->_tensorsWeightMap, 0);
  objc_storeStrong((id *)&self->_tensors, 0);
  objc_storeStrong((id *)&self->_mmappedWeights, 0);
  value = self->_weights.__ptr_.__value_;
  self->_weights.__ptr_.__value_ = 0;
  if (value)
    MEMORY[0x1AF44D160](value, 0x1000C8052888210);
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_fofeTrainSource, 0);
  objc_storeStrong((id *)&self->_textProcessorTrain, 0);
  objc_storeStrong((id *)&self->_fofeInferenceSource, 0);
  objc_storeStrong((id *)&self->_textProcessorInference, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_vocab, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_evalData, 0);
  objc_storeStrong((id *)&self->_trainData, 0);
  objc_storeStrong((id *)&self->_recipe, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 17) = 0;
  return self;
}

- (void)evaluate
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_1AD756000, log, OS_LOG_TYPE_ERROR, "Data size mismatch. %d tokens were fetched while %d words were evaluated", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_1();
}

- (void)train
{
  OUTLINED_FUNCTION_0_2(&dword_1AD756000, a1, a3, "Unable to override learning rate", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3_0();
}

- (void)evaluatePartialDelta
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1AD756000, v0, OS_LOG_TYPE_DEBUG, "parsed %lu chosen gradients", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end
