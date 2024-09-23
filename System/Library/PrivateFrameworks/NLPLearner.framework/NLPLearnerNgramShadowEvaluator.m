@implementation NLPLearnerNgramShadowEvaluator

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLPLearner", "NLPLearnerNgramShadowEvaluator");
    v3 = (void *)sLog_4;
    sLog_4 = (uint64_t)v2;

  }
}

- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  unint64_t v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v32;
  _QWORD v33[8];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  float *v39;
  uint64_t v40;
  int v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint64_t v44;
  void *v45;
  _QWORD v46[2];
  _QWORD v47[2];
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v32 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  -[NLPLearnerShadowEvaluator prepareDataFromRecords:](self, "prepareDataFromRecords:", v12);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "numSamples"))
  {
    v46[0] = *MEMORY[0x24BE5EEB8];
    -[NLPLearnerShadowEvaluator locale](self, "locale");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "languageCode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v46[1] = *MEMORY[0x24BE5EE60];
    v47[0] = v17;
    v47[1] = MEMORY[0x24BDBD1C0];
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = LMLanguageModelCreate();
    if (v19)
    {
      v38 = 0;
      v39 = (float *)&v38;
      v40 = 0x2020000000;
      v41 = 0;
      v34 = 0;
      v35 = &v34;
      v36 = 0x2020000000;
      v37 = 0;
      objc_msgSend(v15, "getSamples");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v33[0] = MEMORY[0x24BDAC760];
      v33[1] = 3221225472;
      v33[2] = __83__NLPLearnerNgramShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke;
      v33[3] = &unk_24EDB9290;
      v33[4] = self;
      v33[5] = &v38;
      v33[6] = &v34;
      v33[7] = v19;
      objc_msgSend(v20, "enumerateObjectsUsingBlock:", v33);

      v22 = v35[3];
      if (v22)
        *(float *)&v21 = (float)(v39[6] * 100.0) / (float)v22;
      else
        LODWORD(v21) = 0;
      v42[0] = CFSTR("MLPModelTrainerOverallAccuracyKey");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithFloat:", v21);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v42[1] = CFSTR("Samples");
      v43[0] = v29;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v15, "numSamples"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43[1] = v30;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      _Block_object_dispose(&v34, 8);
      _Block_object_dispose(&v38, 8);
    }
    else
    {
      v25 = sLog_4;
      if (os_log_type_enabled((os_log_t)sLog_4, OS_LOG_TYPE_ERROR))
        -[NLPLearnerNgramShadowEvaluator evaluateModel:onRecords:options:completion:error:].cold.1((uint64_t)v32, v25);
      if (a7)
      {
        v26 = (void *)MEMORY[0x24BDD1540];
        v44 = *MEMORY[0x24BDD0FC8];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error loading static lm model"));
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = v27;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v45, &v44, 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NLPLearner.NLPShadowEvaluationErrorDomain"), 6, v28);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

      }
      v24 = 0;
    }
  }
  else
  {
    if (!a7)
    {
      v24 = 0;
      goto LABEL_15;
    }
    v23 = (void *)MEMORY[0x24BDD1540];
    v48 = *MEMORY[0x24BDD0FC8];
    v49[0] = CFSTR("missing evaluation data for PFL");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NLPLearner.NLPShadowEvaluationErrorDomain"), 9, v18);
    v24 = 0;
    *a7 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_15:
  return v24;
}

void __83__NLPLearnerNgramShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;

  v6 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v7 = sLog_4;
    if (os_log_type_enabled((os_log_t)sLog_4, OS_LOG_TYPE_ERROR))
      __83__NLPLearnerNgramShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke_cold_1(v7);
    *a4 = 1;
  }
  v8 = objc_retainAutorelease(v6);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");
  v11 = (v10 >> 2) - 1;
  if (v11 >= 2)
  {
    for (i = 1; i != v11; ++i)
    {
      LMLanguageModelCreatePredictionEnumerator();
      if (LMPredictionEnumeratorAdvance())
      {
        v13 = -1;
        do
        {
          if (++v13 >= (unint64_t)objc_msgSend(*(id *)(a1 + 32), "topK"))
            break;
          LMPredictionEnumeratorGetPrediction();
          if (!*(_DWORD *)(v9 + 4 * i))
          {
            *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)
                                                                                              + 8)
                                                                                  + 24)
                                                                       + 1.0;
            break;
          }
        }
        while ((LMPredictionEnumeratorAdvance() & 1) != 0);
      }
      LMPredictionEnumeratorRelease();
    }
  }
  if (v10 > 0xB)
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = (v10 >> 2)
                                                                + *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24)
                                                                - 2;

}

- (void)evaluateModel:(uint64_t)a1 onRecords:(NSObject *)a2 options:completion:error:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22630F000, a2, OS_LOG_TYPE_ERROR, "error loading coreLM %@", (uint8_t *)&v2, 0xCu);
}

void __83__NLPLearnerNgramShadowEvaluator_evaluateModel_onRecords_options_completion_error___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22630F000, log, OS_LOG_TYPE_ERROR, "something went wrong", v1, 2u);
}

@end
