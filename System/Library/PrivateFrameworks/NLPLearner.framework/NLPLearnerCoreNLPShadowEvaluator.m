@implementation NLPLearnerCoreNLPShadowEvaluator

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLPLearner", "NLPLearnerCoreNLPShadowEvaluator");
    v3 = (void *)sLog_3;
    sLog_3 = (uint64_t)v2;

  }
}

- (id)modelCreationOptionsForModelURL:(id)a3 options:(id)a4
{
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[6];

  v20[5] = *MEMORY[0x24BDAC8D0];
  v6 = *MEMORY[0x24BE1E570];
  v7 = a3;
  objc_msgSend(a4, "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = (void *)*MEMORY[0x24BE1E578];
  if (v8)
    v10 = (void *)v8;
  v11 = v10;

  v20[0] = v7;
  v12 = *MEMORY[0x24BE1E590];
  v19[0] = CFSTR("kCoreLMURLKey");
  v19[1] = v12;
  -[NLPLearnerShadowEvaluator locale](self, "locale");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "languageCode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v20[2] = v11;
  v15 = *MEMORY[0x24BE1E5C0];
  v19[2] = v6;
  v19[3] = v15;
  v19[4] = *MEMORY[0x24BE1E588];
  v16 = *MEMORY[0x24BE1E580];
  v20[3] = *MEMORY[0x24BE1E5B8];
  v20[4] = v16;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v20, v19, 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (BOOL)setMaxSequenceLengthForModelURL:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  BOOL v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23;

  v4 = (void *)MEMORY[0x24BDBCF48];
  objc_msgSend(a3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("modelInfo.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = 0;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfURL:error:", v7, &v23);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v23;
  if (!v8)
  {
    v14 = sLog_3;
    if (os_log_type_enabled((os_log_t)sLog_3, OS_LOG_TYPE_ERROR))
      -[NLPLearnerCoreNLPShadowEvaluator setMaxSequenceLengthForModelURL:].cold.1((uint64_t)v7, (uint64_t)v9, v14);
    goto LABEL_8;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MaximumSequenceLength"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    v15 = sLog_3;
    if (os_log_type_enabled((os_log_t)sLog_3, OS_LOG_TYPE_ERROR))
      -[NLPLearnerCoreNLPShadowEvaluator setMaxSequenceLengthForModelURL:].cold.2((uint64_t)v8, v15, v16, v17, v18, v19, v20, v21);
LABEL_8:
    v13 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("MaximumSequenceLength"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLPLearnerCoreNLPShadowEvaluator setMaxSequenceLength:](self, "setMaxSequenceLength:", objc_msgSend(v12, "unsignedIntValue"));

  v13 = 1;
LABEL_9:

  return v13;
}

- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  const void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  long double v20;
  unint64_t v21;
  float v22;
  unint64_t v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v46;
  _QWORD v47[12];
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  float *v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  float *v65;
  uint64_t v66;
  int v67;
  id v68;
  _QWORD v69[4];
  _QWORD v70[4];
  uint64_t v71;
  void *v72;
  uint64_t v73;
  _QWORD v74[3];

  v74[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v46 = a6;
  if (v12)
  {
    -[NLPLearnerShadowEvaluator prepareDataFromRecords:](self, "prepareDataFromRecords:", v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "numSamples"))
    {
      v68 = 0;
      -[NLPLearnerCoreNLPShadowEvaluator modelCreationOptionsForModelURL:options:](self, "modelCreationOptionsForModelURL:options:", v12, v14);
      v16 = (const void *)CoreLMCreate();
      if (v16
        && -[NLPLearnerCoreNLPShadowEvaluator setMaxSequenceLengthForModelURL:](self, "setMaxSequenceLengthForModelURL:", v12))
      {
        -[NLPLearnerShadowEvaluator locale](self, "locale");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = LMStreamTokenizerCreate();

        v64 = 0;
        v65 = (float *)&v64;
        v66 = 0x2020000000;
        v67 = 0;
        v60 = 0;
        v61 = &v60;
        v62 = 0x2020000000;
        v63 = 0;
        v56 = 0;
        v57 = (float *)&v56;
        v58 = 0x2020000000;
        v59 = 0;
        v52 = 0;
        v53 = &v52;
        v54 = 0x2020000000;
        v55 = 0;
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v51 = 0;
        objc_msgSend(v15, "getSamples");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = MEMORY[0x24BDAC760];
        v47[1] = 3221225472;
        v47[2] = __85__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke;
        v47[3] = &unk_24EDB91B0;
        v47[10] = v16;
        v47[11] = v18;
        v47[4] = self;
        v47[5] = &v64;
        v47[6] = &v60;
        v47[7] = &v56;
        v47[8] = &v52;
        v47[9] = &v48;
        objc_msgSend(v19, "enumerateObjectsUsingBlock:", v47);

        CFRelease(v16);
        if (v18)
          LMStreamTokenizerRelease();
        v21 = v61[3];
        v22 = 0.0;
        LODWORD(v20) = 0;
        if (v21)
        {
          v20 = exp((float)((float)-v65[6] / (float)v21));
          *(float *)&v20 = v20;
        }
        v23 = v53[3];
        if (v23)
          v22 = (float)(v57[6] * 100.0) / (float)v23;
        v69[0] = CFSTR("MLPModelTrainerPerplexityKey");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", (double)v20);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v70[0] = v24;
        v69[1] = CFSTR("MLPModelTrainerOverallAccuracyKey");
        *(float *)&v25 = v22;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v70[1] = v26;
        v69[2] = CFSTR("Tokens");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v61[3]);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v70[2] = v27;
        v69[3] = CFSTR("Samples");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v49[3]);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v70[3] = v28;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v70, v69, 4);
        a7 = (id *)objc_claimAutoreleasedReturnValue();

        _Block_object_dispose(&v48, 8);
        _Block_object_dispose(&v52, 8);
        _Block_object_dispose(&v56, 8);
        _Block_object_dispose(&v60, 8);
        _Block_object_dispose(&v64, 8);
        goto LABEL_23;
      }
      v30 = v68;
      v31 = sLog_3;
      if (os_log_type_enabled((os_log_t)sLog_3, OS_LOG_TYPE_ERROR))
        -[NLPLearnerCoreNLPShadowEvaluator evaluateModel:onRecords:options:completion:error:].cold.2((uint64_t)v12, v31, v32, v33, v34, v35, v36, v37);
      if (a7)
      {
        v38 = (void *)MEMORY[0x24BDD1540];
        v71 = *MEMORY[0x24BDD0FC8];
        v39 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(v68, "description");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "stringWithFormat:", CFSTR("error loading core lm model: %@"), v40);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v72 = v41;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v72, &v71, 1);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NLPLearner.NLPShadowEvaluationErrorDomain"), 6, v42);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      if (!a7)
      {
LABEL_23:

        goto LABEL_24;
      }
      v43 = (void *)MEMORY[0x24BDD1540];
      v73 = *MEMORY[0x24BDD0FC8];
      v74[0] = CFSTR("missing evaluation data for PFL");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v74, &v73, 1);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NLPLearner.NLPShadowEvaluationErrorDomain"), 9, v44);
      *a7 = (id)objc_claimAutoreleasedReturnValue();

    }
    a7 = 0;
    goto LABEL_23;
  }
  v29 = sLog_3;
  if (os_log_type_enabled((os_log_t)sLog_3, OS_LOG_TYPE_ERROR))
    -[NLPLearnerCoreNLPShadowEvaluator evaluateModel:onRecords:options:completion:error:].cold.1(v29);
  a7 = 0;
LABEL_24:

  return a7;
}

void __85__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke(uint64_t a1, uint64_t a2)
{
  float v3;
  float v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "evaluateModel:onSingleExample:tokenizer:", *(_QWORD *)(a1 + 80), a2, *(_QWORD *)(a1 + 88));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "logfProbability");
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3
                                                             + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += objc_msgSend(v5, "tokenCount");
  objc_msgSend(v5, "predictedWords");
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4
                                                             + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += objc_msgSend(v5, "wordCount");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) += objc_msgSend(v5, "sentenceCount");

}

- (id)evaluateModel:(CoreLanguageModelWithState *)a3 onSingleExample:(id)a4 tokenizer:(void *)a5
{
  id v8;
  NLPLearnerEvaluationResultCoreLM *v9;
  double v10;
  double v11;
  _QWORD v13[4];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  int v33;

  v8 = a4;
  v9 = 0;
  if (a3 && a5)
  {
    if (-[NLPLearnerCoreNLPShadowEvaluator maxSequenceLength](self, "maxSequenceLength"))
    {
      v30 = 0;
      v31 = &v30;
      v32 = 0x2020000000;
      v33 = 0;
      v26 = 0;
      v27 = &v26;
      v28 = 0x2020000000;
      v29 = 0;
      v22 = 0;
      v23 = &v22;
      v24 = 0x2020000000;
      v25 = 0;
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      v21 = 0;
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v17 = 0;
      v13[0] = 0;
      v13[1] = v13;
      v13[2] = 0x2020000000;
      v13[3] = 0;
      strlen((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
      LMStreamTokenizerPushBytes();
      v9 = objc_alloc_init(NLPLearnerEvaluationResultCoreLM);
      LODWORD(v10) = *((_DWORD *)v31 + 6);
      -[NLPLearnerEvaluationResultCoreLM setLogfProbability:](v9, "setLogfProbability:", v10);
      -[NLPLearnerEvaluationResultCoreLM setTokenCount:](v9, "setTokenCount:", v19[3]);
      LODWORD(v11) = *((_DWORD *)v27 + 6);
      -[NLPLearnerEvaluationResultCoreLM setPredictedWords:](v9, "setPredictedWords:", v11);
      -[NLPLearnerEvaluationResultCoreLM setWordCount:](v9, "setWordCount:", v23[3]);
      -[NLPLearnerEvaluationResultCoreLM setSentenceCount:](v9, "setSentenceCount:", v15[3]);
      _Block_object_dispose(v13, 8);
      _Block_object_dispose(&v14, 8);
      _Block_object_dispose(&v18, 8);
      _Block_object_dispose(&v22, 8);
      _Block_object_dispose(&v26, 8);
      _Block_object_dispose(&v30, 8);
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  float v24;
  _QWORD v25[6];
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", a2, a3, 4);
    CoreLMCopyTokenIdsForText();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    v8 = v7 + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) + 1;
    if (v8 >= objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength"))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength");
    }
    else
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v7;
      v9 = *MEMORY[0x24BE1E5A0];
      v10 = *MEMORY[0x24BE1E598];
      v29[0] = *MEMORY[0x24BE1E5A8];
      v29[1] = v10;
      v30[0] = v9;
      v30[1] = &unk_24EDBC820;
      v29[2] = *MEMORY[0x24BE1E5B0];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "topK"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v30[2] = v11;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)CoreLMCopyPredictions();
      objc_msgSend(v13, "keysSortedByValueUsingComparator:", &__block_literal_global_0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = MEMORY[0x24BDAC760];
      v26[0] = MEMORY[0x24BDAC760];
      v26[1] = 3221225472;
      v26[2] = __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_2;
      v26[3] = &unk_24EDB9218;
      v16 = v5;
      v17 = *(_QWORD *)(a1 + 72);
      v27 = v16;
      v28 = v17;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v26);

      v18 = *(_QWORD *)(a1 + 88);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      v25[0] = v15;
      v25[1] = 3221225472;
      v25[2] = __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3;
      v25[3] = &unk_24EDB9240;
      v25[4] = *(_QWORD *)(a1 + 48);
      v25[5] = v18;
      objc_msgSend(v6, "enumerateObjectsUsingBlock:", v25);

    }
  }
  else if (a4 == 2)
  {
    v19 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    if (v19 < objc_msgSend(*(id *)(a1 + 32), "maxSequenceLength"))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", CoreLMGetSpecialTokenId());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 1);
      CoreLMCopyConditionalProbabilities();
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v21, "count") != 1)
        __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_cold_2();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_cold_1();

      objc_msgSend(v21, "firstObject");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "floatValue");
      *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = logf(v24)
                                                                 + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                             + 24);
    CoreLMReset();
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
  }
}

uint64_t __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_58(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  id v7;
  void *v8;
  id v9;

  v6 = (void *)MEMORY[0x24BDD14A8];
  v7 = a2;
  objc_msgSend(v6, "whitespaceAndNewlineCharacterSet");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByTrimmingCharactersInSet:", v8);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "isEqualToString:", *(_QWORD *)(a1 + 32)))
  {
    *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24)
                                                               + 1.0;
    *a4 = 1;
  }

}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  float v10;
  id v11;

  v11 = a2;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CoreLMCopyConditionalProbabilities();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") != 1)
    __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3_cold_2();
  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3_cold_1();

  objc_msgSend(v7, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatValue");
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = logf(v10)
                                                             + *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *a4 = CoreLMUpdateWithContext() ^ 1;

}

- (unint64_t)maxSequenceLength
{
  return self->_maxSequenceLength;
}

- (void)setMaxSequenceLength:(unint64_t)a3
{
  self->_maxSequenceLength = a3;
}

- (void)setMaxSequenceLengthForModelURL:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_22630F000, log, OS_LOG_TYPE_ERROR, "Failed to load '%@', error: '%@'", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)setMaxSequenceLengthForModelURL:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "modelInfo '%@' missing 'MaximumSequenceLength' parameter", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)evaluateModel:(os_log_t)log onRecords:options:completion:error:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22630F000, log, OS_LOG_TYPE_ERROR, "missing model path for evaluation", v1, 2u);
}

- (void)evaluateModel:(uint64_t)a3 onRecords:(uint64_t)a4 options:(uint64_t)a5 completion:(uint64_t)a6 error:(uint64_t)a7 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_22630F000, a2, a3, "error loading coreLM %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_cold_1()
{
  __assert_rtn("-[NLPLearnerCoreNLPShadowEvaluator evaluateModel:onSingleExample:tokenizer:]_block_invoke", "NLPLearnerCoreNLPShadowEvaluator.m", 155, "[probs.firstObject isKindOfClass:[NSNumber class]]");
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_cold_2()
{
  __assert_rtn("-[NLPLearnerCoreNLPShadowEvaluator evaluateModel:onSingleExample:tokenizer:]_block_invoke", "NLPLearnerCoreNLPShadowEvaluator.m", 154, "probs.count == 1");
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3_cold_1()
{
  __assert_rtn("-[NLPLearnerCoreNLPShadowEvaluator evaluateModel:onSingleExample:tokenizer:]_block_invoke_3", "NLPLearnerCoreNLPShadowEvaluator.m", 204, "[probs.firstObject isKindOfClass:[NSNumber class]]");
}

void __76__NLPLearnerCoreNLPShadowEvaluator_evaluateModel_onSingleExample_tokenizer___block_invoke_3_cold_2()
{
  __assert_rtn("-[NLPLearnerCoreNLPShadowEvaluator evaluateModel:onSingleExample:tokenizer:]_block_invoke_3", "NLPLearnerCoreNLPShadowEvaluator.m", 203, "probs.count == 1");
}

@end
