@implementation NLPLearnerMontrealShadowEvaluator

+ (void)initialize
{
  os_log_t v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = os_log_create("com.apple.NLPLearner", "NLPLearnerMontrealShadowEvaluator");
    v3 = (void *)sLog_1;
    sLog_1 = (uint64_t)v2;

  }
}

- (id)prepareDataFromRecords:(id)a3 modelBundle:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  int64_t v10;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = -[NLPLearnerShadowEvaluator evaluationTask](self, "evaluationTask");
  -[NLPLearnerShadowEvaluator locale](self, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[NLPLearnerTextData dataForPFL:andLocale:](NLPLearnerTextData, "dataForPFL:andLocale:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[NLPLearnerShadowEvaluator evaluationTask](self, "evaluationTask") == 2
    || -[NLPLearnerShadowEvaluator evaluationTask](self, "evaluationTask") == 4)
  {
    v13 = CFSTR("montrealidmap.dat");
  }
  else
  {
    if (-[NLPLearnerShadowEvaluator evaluationTask](self, "evaluationTask") != 1)
    {
      if (-[NLPLearnerShadowEvaluator evaluationTask](self, "evaluationTask") == 3)
      {
        objc_msgSend(v9, "absoluteString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "addResource:", v15);
        goto LABEL_6;
      }
      if (a5)
      {
        v18 = (void *)MEMORY[0x24BDD1540];
        v21 = *MEMORY[0x24BDD0FC8];
        v22[0] = CFSTR("unknown evaluation task for PFL");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NLPLearner.NLPShadowEvaluationErrorDomain"), 4, v19);
        *a5 = (id)objc_claimAutoreleasedReturnValue();

      }
LABEL_13:
      v17 = 0;
      goto LABEL_14;
    }
    v13 = CFSTR("emojiClasses.plist");
  }
  +[NLPLearnerUtils getAttachmentURLByName:inDirectory:error:](NLPLearnerUtils, "getAttachmentURLByName:inDirectory:error:", v13, v9, a5);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    goto LABEL_13;
  v15 = v14;
  objc_msgSend(v14, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addResource:", v16);

LABEL_6:
  objc_msgSend(v12, "loadFromCoreDuet:limitSamplesTo:", v8, -[NLPLearnerShadowEvaluator maxSamples](self, "maxSamples"));
  v17 = v12;
LABEL_14:

  return v17;
}

- (id)evaluateModel:(id)a3 onRecords:(id)a4 options:(id)a5 completion:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  const void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  if (v12)
  {
    objc_msgSend(v12, "URLByDeletingLastPathComponent");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NLPLearnerMontrealShadowEvaluator prepareDataFromRecords:modelBundle:error:](self, "prepareDataFromRecords:modelBundle:error:", v13, v16, a7);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v17, "numSamples"))
    {
      if (a7)
      {
        v30 = (void *)MEMORY[0x24BDD1540];
        v40 = *MEMORY[0x24BDD0FC8];
        v41[0] = CFSTR("missing evaluation data for PFL");
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v41, &v40, 1);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NLPLearner.NLPShadowEvaluationErrorDomain"), 9, v31);
        *a7 = (id)objc_claimAutoreleasedReturnValue();

        a7 = 0;
      }
      goto LABEL_16;
    }
    v38 = *MEMORY[0x24BE68F98];
    v39 = v12;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MRLNeuralNetworkCreate();
    v20 = sLog_1;
    if (v19)
    {
      v21 = (const void *)v19;
      if (os_log_type_enabled((os_log_t)sLog_1, OS_LOG_TYPE_DEBUG))
        -[NLPLearnerMontrealShadowEvaluator evaluateModel:onRecords:options:completion:error:].cold.3((uint64_t)v12, v20);
      -[NLPLearnerMontrealShadowEvaluator evaluateModel:onData:options:completion:](self, "evaluateModel:onData:options:completion:", v21, v17, v14, v15);
      a7 = (id *)objc_claimAutoreleasedReturnValue();
      CFRelease(v21);
      goto LABEL_15;
    }
    if (os_log_type_enabled((os_log_t)sLog_1, OS_LOG_TYPE_ERROR))
    {
      -[NLPLearnerMontrealShadowEvaluator evaluateModel:onRecords:options:completion:error:].cold.2((uint64_t)v12, v20);
      if (!a7)
        goto LABEL_15;
    }
    else if (!a7)
    {
LABEL_15:

LABEL_16:
      goto LABEL_17;
    }
    v35 = (void *)MEMORY[0x24BDD1540];
    v36 = *MEMORY[0x24BDD0FC8];
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("error loading nlmodel: %@"), 0);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v32;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v37, &v36, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "errorWithDomain:code:userInfo:", CFSTR("com.apple.NLPLearner.NLPShadowEvaluationErrorDomain"), 6, v33);
    *a7 = (id)objc_claimAutoreleasedReturnValue();

    a7 = 0;
    goto LABEL_15;
  }
  v22 = sLog_1;
  if (os_log_type_enabled((os_log_t)sLog_1, OS_LOG_TYPE_ERROR))
    -[NLPLearnerMontrealShadowEvaluator evaluateModel:onRecords:options:completion:error:].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
  a7 = 0;
LABEL_17:

  return a7;
}

+ (BOOL)isInTopKPredictions:(unint64_t)a3 scores:(float *)a4 total:(unint64_t)a5 topK:(unint64_t)a6
{
  _QWORD *v6;
  float v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v11;
  unint64_t v12;
  float v13;
  uint64_t i;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  if (a6 >= a5)
    return 1;
  v6 = (_QWORD *)((char *)v18 - ((8 * a6 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = *a4;
  if (a6)
  {
    v8 = 0;
    v9 = 0;
    do
    {
      v6[v8] = v8;
      if (a4[v8] < v7)
      {
        v9 = v8;
        v7 = a4[v8];
      }
      ++v8;
    }
    while (a6 != v8);
  }
  else
  {
    v9 = 0;
  }
  v11 = a6;
  while (2)
  {
    v12 = v11;
    v13 = v7;
    while (1)
    {
      v7 = a4[v12];
      if (v7 <= v13)
      {
        v7 = v13;
        goto LABEL_21;
      }
      v6[v9] = v12;
      if (a6)
        break;
      ++v12;
      v13 = v7;
      if (a5 == v12)
        return 0;
    }
    for (i = 0; i != a6; ++i)
    {
      if (a4[v6[i]] < v7)
      {
        v9 = i;
        v7 = a4[v6[i]];
      }
    }
LABEL_21:
    v11 = v12 + 1;
    if (a5 - 1 != v12)
      continue;
    break;
  }
  if (!a6)
    return 0;
  if (*v6 == a3)
    return 1;
  v15 = 1;
  do
  {
    v16 = v15;
    if (a6 == v15)
      break;
    v17 = v6[v15++];
  }
  while (v17 != a3);
  return v16 < a6;
}

- (id)evaluateModel:(MontrealNeuralNetwork *)a3 onData:(id)a4 options:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  double v16;
  void *v17;
  unint64_t v18;
  float v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t Output;
  uint64_t OutputDimension;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  unint64_t v43;
  id v44;
  id v45;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (a3)
  {
    v13 = 0x24BDD1000;
    if (-[NLPLearnerShadowEvaluator evaluationTask](self, "evaluationTask") == 4)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "nextEvaluationDataPoint");
      v15 = objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        v17 = (void *)v15;
        v36 = v14;
        v37 = v12;
        v38 = v11;
        v18 = 0;
        v40 = *MEMORY[0x24BE68F50];
        v39 = *MEMORY[0x24BE68F58];
        v19 = 0.0;
        v41 = v10;
        do
        {
          objc_msgSend(v17, "objectForKey:", v40);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKey:", v39);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v21, "count");
          v42 = objc_retainAutorelease(v20);
          objc_msgSend(v42, "bytes");
          MRLNeuralNetworkSetInput();
          MRLNeuralNetworkPredict();
          Output = MRLNeuralNetworkGetOutput();
          OutputDimension = MRLNeuralNetworkGetOutputDimension();
          v25 = v22 - 1;
          v43 = v18;
          if (v22 != 1)
          {
            v26 = OutputDimension;
            v27 = 0;
            v28 = 4 * OutputDimension;
            do
            {
              objc_msgSend(v21, "objectAtIndexedSubscript:", v27);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "unsignedIntegerValue");

              if (v30 != 3
                && objc_msgSend((id)objc_opt_class(), "isInTopKPredictions:scores:total:topK:", v30, Output, v26, -[NLPLearnerShadowEvaluator topK](self, "topK")))
              {
                v19 = v19 + 1.0;
              }
              ++v27;
              Output += v28;
            }
            while (v25 != v27);
          }
          v18 = v25 + v43;

          v10 = v41;
          objc_msgSend(v41, "nextEvaluationDataPoint");
          v31 = objc_claimAutoreleasedReturnValue();

          v17 = (void *)v31;
        }
        while (v31);
        if (v18)
          *(float *)&v16 = (float)(v19 * 100.0) / (float)v18;
        else
          LODWORD(v16) = 0;
        v12 = v37;
        v11 = v38;
        v13 = 0x24BDD1000uLL;
        v14 = v36;
      }
      else
      {
        LODWORD(v16) = 0;
      }
      objc_msgSend(*(id *)(v13 + 1760), "numberWithFloat:", v16);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v33, CFSTR("MLPModelTrainerOverallAccuracyKey"));

    }
    else
    {
      v45 = v12;
      v44 = v10;
      v32 = (void *)MRLNeuralNetworkCopyEvaluationResults();
      v14 = (void *)objc_msgSend(v32, "mutableCopy");

    }
    objc_msgSend(*(id *)(v13 + 1760), "numberWithUnsignedInteger:", objc_msgSend(v10, "numSamples"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v34, CFSTR("Samples"));

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void *__77__NLPLearnerMontrealShadowEvaluator_evaluateModel_onData_options_completion___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  v4 = *(_QWORD *)(a1 + 40);
  if (v4 && (*(unsigned int (**)(void))(v4 + 16))())
  {
    v5 = sLog_1;
    if (os_log_type_enabled((os_log_t)sLog_1, OS_LOG_TYPE_ERROR))
      __77__NLPLearnerMontrealShadowEvaluator_evaluateModel_onData_options_completion___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = 0;
    *a2 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "nextEvaluationDataPoint");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v14;
    if (v14)
      v15 = v14;
    else
      *a2 = 1;

  }
  return v13;
}

- (void)evaluateModel:(uint64_t)a3 onRecords:(uint64_t)a4 options:(uint64_t)a5 completion:(uint64_t)a6 error:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_22630F000, a1, a3, "missing model path for evaluation", a5, a6, a7, a8, 0);
}

- (void)evaluateModel:(uint64_t)a1 onRecords:(NSObject *)a2 options:completion:error:.cold.2(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_22630F000, a2, OS_LOG_TYPE_ERROR, "error loading nlmodel %@", (uint8_t *)&v2, 0xCu);
}

- (void)evaluateModel:(uint64_t)a1 onRecords:(NSObject *)a2 options:completion:error:.cold.3(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_22630F000, a2, OS_LOG_TYPE_DEBUG, "running evaluation for %@", (uint8_t *)&v2, 0xCu);
}

void __77__NLPLearnerMontrealShadowEvaluator_evaluateModel_onData_options_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_2(&dword_22630F000, a1, a3, "evaluation interrupted by request to defer", a5, a6, a7, a8, 0);
}

@end
