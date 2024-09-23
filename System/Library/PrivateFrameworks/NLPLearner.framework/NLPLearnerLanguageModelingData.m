@implementation NLPLearnerLanguageModelingData

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLP", "NLPLearnerLanguageModelingData");
    v3 = (void *)sLog;
    sLog = (uint64_t)v2;

  }
}

+ (unint64_t)defaultMaxSequenceLength
{
  return 50;
}

- (NLPLearnerLanguageModelingData)initWithLocale:(id)a3
{
  id v4;
  NLPLearnerLanguageModelingData *v5;
  void *v6;
  void *v7;
  const void *v8;
  NLPLearnerLanguageModelingData *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;
  uint64_t v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)NLPLearnerLanguageModelingData;
  v5 = -[NLPLearnerTextData initWithLocale:](&v18, sel_initWithLocale_, v4);
  if (!v5)
    goto LABEL_3;
  -[NLPLearnerTextData setMaxSequenceLength:](v5, "setMaxSequenceLength:", objc_msgSend((id)objc_opt_class(), "defaultMaxSequenceLength"));
  v19 = *MEMORY[0x24BE5F198];
  -[NLPLearnerTextData locale](v5, "locale");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "languageCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, &v19, 1);
  v8 = (const void *)LXLexiconCreate();
  nlp::CFScopedPtr<_LXLexicon const*>::reset((const void **)&v5->_lexicon.m_ref, v8);

  if (!v5->_lexicon.m_ref)
  {
    v10 = sLog;
    if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
      -[NLPLearnerLanguageModelingData initWithLocale:].cold.1(0, v10, v11, v12, v13, v14, v15, v16);

    v9 = 0;
  }
  else
  {
LABEL_3:
    v9 = v5;
  }

  return v9;
}

- (void)addPreprocessedExample:(void *)a3
{
  void *v4;
  void *v5;
  const __CFData *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  _BYTE v12[24];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  -[NLPLearnerLanguageModelingData tokenIDMapPath](self, "tokenIDMapPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NLPLearnerLanguageModelingData tokenIDMapPath](self, "tokenIDMapPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (const __CFData *)LMCreateMontrealIDsFromLMTokenIDSequence();

    if (v6)
    {
      CFDataGetBytePtr(v6);
      -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength", v6);
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", 0);
      v9 = (id)sLog;
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        objc_msgSend(v8, "componentsJoinedByString:", CFSTR(" "));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[NLPLearnerLanguageModelingData addPreprocessedExample:].cold.2(v10, (uint64_t)v12, v9);
      }

      -[NLPLearnerTextData sentences](self, "sentences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v8);

      CFRelease(v6);
    }
    else
    {
      v7 = sLog;
      if (os_log_type_enabled((os_log_t)sLog, OS_LOG_TYPE_ERROR))
        -[NLPLearnerLanguageModelingData addPreprocessedExample:].cold.1(v7);
    }
  }
}

- (BOOL)loadFromCoreDuet:(id)a3 limitSamplesTo:(unint64_t)a4
{
  id v6;
  void *v7;
  objc_super v9;
  _QWORD v10[6];
  _QWORD v11[6];
  std::vector<unsigned int> __p;

  v6 = a3;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4812000000;
  v11[3] = __Block_byref_object_copy__0;
  v11[4] = __Block_byref_object_dispose__0;
  v11[5] = &unk_226323833;
  memset(&__p, 0, sizeof(__p));
  std::vector<unsigned int>::reserve(&__p, -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength"));
  -[NLPLearnerTextData locale](self, "locale");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = 3221225472;
  v10[2] = __66__NLPLearnerLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke;
  v10[3] = &unk_24EDB92B8;
  v10[4] = self;
  v10[5] = v11;
  v9.receiver = self;
  v9.super_class = (Class)NLPLearnerLanguageModelingData;
  v10[0] = MEMORY[0x24BDAC760];
  -[NLPLearnerTextData loadFromCoreDuet:limitSamplesTo:withLocale:andLMStreamTokenizationBlock:](&v9, sel_loadFromCoreDuet_limitSamplesTo_withLocale_andLMStreamTokenizationBlock_, v6, a4, v7, v10);

  _Block_object_dispose(v11, 8);
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }

  return 1;
}

void __66__NLPLearnerLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;
  char *v11;
  unint64_t v12;
  _DWORD *v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  char *v20;
  char *v21;
  int v22;
  _QWORD *v23;
  int *v24;
  unint64_t v25;
  _DWORD *v26;
  int *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  char *v32;
  int *v33;
  char *v34;
  int v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  int v45;

  if (a4)
  {
    v5 = a4;
    if (a4 == 2)
    {
      v10 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
      v11 = (char *)v10[7];
      v12 = v10[8];
      if ((unint64_t)v11 >= v12)
      {
        v14 = (char *)v10[6];
        v15 = (v11 - v14) >> 2;
        if ((unint64_t)(v15 + 1) >> 62)
          goto LABEL_47;
        v16 = v12 - (_QWORD)v14;
        v17 = (uint64_t)(v12 - (_QWORD)v14) >> 1;
        if (v17 <= v15 + 1)
          v17 = v15 + 1;
        if (v16 >= 0x7FFFFFFFFFFFFFFCLL)
          v18 = 0x3FFFFFFFFFFFFFFFLL;
        else
          v18 = v17;
        if (v18)
        {
          v19 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(v10 + 8), v18);
          v14 = (char *)v10[6];
          v11 = (char *)v10[7];
        }
        else
        {
          v19 = 0;
        }
        v20 = &v19[4 * v15];
        v21 = &v19[4 * v18];
        *(_DWORD *)v20 = 2;
        v13 = v20 + 4;
        while (v11 != v14)
        {
          v22 = *((_DWORD *)v11 - 1);
          v11 -= 4;
          *((_DWORD *)v20 - 1) = v22;
          v20 -= 4;
        }
        v10[6] = v20;
        v10[7] = v13;
        v10[8] = v21;
        if (v14)
          operator delete(v14);
      }
      else
      {
        *(_DWORD *)v11 = 2;
        v13 = v11 + 4;
      }
      v10[7] = v13;
      objc_msgSend(*(id *)(a1 + 32), "addPreprocessedExample:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                              + 48);
      return;
    }
    if (a4 == 1)
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 56) != *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)
                                                                                                + 8)
                                                                                    + 48))
        __66__NLPLearnerLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke_cold_1();
      v5 = 1;
    }
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%C"), 8217);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", v7, CFSTR("'"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v42 = 0;
    v43 = &v42;
    v44 = 0x2020000000;
    v45 = 0;
    v36 = 0;
    v37 = &v36;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__49;
    v40 = __Block_byref_object_dispose__50;
    v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    LXLexiconEnumerateEntriesForString();
    v5 = *((_DWORD *)v43 + 6);
    if (!v5)
    {
      if (objc_msgSend((id)v37[5], "count") == 1)
      {
        objc_msgSend((id)v37[5], "objectAtIndexedSubscript:", 0);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v5 = objc_msgSend(v9, "unsignedIntValue");

      }
      else
      {
        v5 = *((_DWORD *)v43 + 6);
      }
    }
    _Block_object_dispose(&v36, 8);

    _Block_object_dispose(&v42, 8);
  }
  v23 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v24 = (int *)v23[7];
  v25 = v23[8];
  if ((unint64_t)v24 >= v25)
  {
    v27 = (int *)v23[6];
    v28 = v24 - v27;
    if (!((unint64_t)(v28 + 1) >> 62))
    {
      v29 = v25 - (_QWORD)v27;
      v30 = (uint64_t)(v25 - (_QWORD)v27) >> 1;
      if (v30 <= v28 + 1)
        v30 = v28 + 1;
      if (v29 >= 0x7FFFFFFFFFFFFFFCLL)
        v31 = 0x3FFFFFFFFFFFFFFFLL;
      else
        v31 = v30;
      if (v31)
      {
        v32 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<float>>((uint64_t)(v23 + 8), v31);
        v27 = (int *)v23[6];
        v24 = (int *)v23[7];
      }
      else
      {
        v32 = 0;
      }
      v33 = (int *)&v32[4 * v28];
      v34 = &v32[4 * v31];
      *v33 = v5;
      v26 = v33 + 1;
      while (v24 != v27)
      {
        v35 = *--v24;
        *--v33 = v35;
      }
      v23[6] = v33;
      v23[7] = v26;
      v23[8] = v34;
      if (v27)
        operator delete(v27);
      goto LABEL_44;
    }
LABEL_47:
    std::vector<float>::__throw_length_error[abi:ne180100]();
  }
  *v24 = v5;
  v26 = v24 + 1;
LABEL_44:
  v23[7] = v26;
}

- (id)nextTrainingDataBatch:(unint64_t)a3
{
  unint64_t v5;
  void *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x24BDAC8D0];
  v5 = -[NLPLearnerTextData iterator](self, "iterator") + a3;
  if (v5 > -[NLPLearnerTextData numSamples](self, "numSamples"))
    return 0;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (a3)
  {
    v8 = 0;
    v9 = (_QWORD *)MEMORY[0x24BE68EE0];
    v10 = (uint64_t *)MEMORY[0x24BE68ED8];
    do
    {
      -[NLPLearnerTextData sentences](self, "sentences");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v8 + -[NLPLearnerTextData iterator](self, "iterator"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "subarrayWithRange:", 0, objc_msgSend(v12, "count") - 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "subarrayWithRange:", 1, objc_msgSend(v12, "count") - 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *v10;
      v20[0] = *v9;
      v20[1] = v15;
      v21[0] = v13;
      v21[1] = v14;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v21, v20, 2);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addObject:", v16);

      ++v8;
    }
    while (a3 != v8);
  }
  -[NLPLearnerTextData setIterator:](self, "setIterator:", -[NLPLearnerTextData iterator](self, "iterator") + a3);
  v18 = *MEMORY[0x24BE68EC0];
  v19 = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)nextEvaluationDataPoint
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *exception;
  void *__p;
  _BYTE *v15;
  CFTypeRef cf;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v3 = -[NLPLearnerTextData iterator](self, "iterator");
  if (v3 >= -[NLPLearnerTextData numSamples](self, "numSamples"))
  {
    v11 = 0;
  }
  else
  {
    -[NLPLearnerTextData sentences](self, "sentences");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndexedSubscript:", -[NLPLearnerTextData iterator](self, "iterator"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "subarrayWithRange:", 0, objc_msgSend(v5, "count") - 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v5, "count") - 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    v9 = v8;
    if (v8)
      CFRetain(v8);
    applesauce::CF::ArrayRef::ArrayRef((applesauce::CF::ArrayRef *)&cf, v9);

    if (!cf)
    {
      exception = __cxa_allocate_exception(0x10uLL);
      MEMORY[0x227694FA4](exception, "Could not construct");
      __cxa_throw(exception, MEMORY[0x24BEDB730], MEMORY[0x24BEDAB60]);
    }
    applesauce::CF::convert_to<std::vector<float>,0>(cf, (uint64_t)&__p);
    v17[0] = *MEMORY[0x24BE68F50];
    objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", __p, v15 - (_BYTE *)__p);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v17[1] = *MEMORY[0x24BE68F58];
    v18[0] = v10;
    v18[1] = v7;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NLPLearnerTextData setIterator:](self, "setIterator:", -[NLPLearnerTextData iterator](self, "iterator") + 1);
    if (__p)
    {
      v15 = __p;
      operator delete(__p);
    }
    if (cf)
      CFRelease(cf);

  }
  return v11;
}

- (NSString)tokenIDMapPath
{
  return self->_tokenIDMapPath;
}

- (void)setTokenIDMapPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenIDMapPath, 0);
  nlp::CFScopedPtr<_LXLexicon const*>::reset((const void **)&self->_lexicon.m_ref, 0);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 6) = 0;
  return self;
}

- (BOOL)addExamples:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  id v18;
  id obj;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v18 = a3;
  v4 = objc_alloc_init(MEMORY[0x24BDD16F0]);
  objc_msgSend(v4, "setNumberStyle:", 1);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = v18;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v5)
  {
    v21 = *(_QWORD *)v27;
    do
    {
      v6 = 0;
      v20 = v5;
      do
      {
        if (*(_QWORD *)v27 != v21)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v6);
        if (objc_msgSend(v7, "length"))
        {
          objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(" "));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v8, "count"));
          v24 = 0u;
          v25 = 0u;
          v22 = 0u;
          v23 = 0u;
          v10 = v8;
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v11)
          {
            v12 = *(_QWORD *)v23;
LABEL_9:
            v13 = 0;
            while (1)
            {
              if (*(_QWORD *)v23 != v12)
                objc_enumerationMutation(v10);
              objc_msgSend(v4, "numberFromString:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v13));
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v9, "addObject:", v14);
              v15 = objc_msgSend(v9, "count");
              LOBYTE(v15) = v15 < -[NLPLearnerTextData maxSequenceLength](self, "maxSequenceLength");

              if ((v15 & 1) == 0)
                break;
              if (v11 == ++v13)
              {
                v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
                if (v11)
                  goto LABEL_9;
                break;
              }
            }
          }

          -[NLPLearnerTextData sentences](self, "sentences");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "addObject:", v9);

          v5 = v20;
        }
        ++v6;
      }
      while (v6 != v5);
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v5);
  }

  return 1;
}

- (void)initWithLocale:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "Lexicon load failed %@", a5, a6, a7, a8, 2u);
}

- (void)addPreprocessedExample:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22630F000, log, OS_LOG_TYPE_ERROR, "Token id mapping failed", v1, 2u);
}

- (void)addPreprocessedExample:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_1_0(&dword_22630F000, a2, a3, "Tokens: '%@'", (uint8_t *)a2);

}

void __66__NLPLearnerLanguageModelingData_loadFromCoreDuet_limitSamplesTo___block_invoke_cold_1()
{
  __assert_rtn("-[NLPLearnerLanguageModelingData loadFromCoreDuet:limitSamplesTo:]_block_invoke", "NLPLearnerLanguageModelingData.mm", 145, "tokens.size() == 0 && \"unexpected sentence beginning\");
}

@end
