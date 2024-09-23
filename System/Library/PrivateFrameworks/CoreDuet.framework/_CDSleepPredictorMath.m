@implementation _CDSleepPredictorMath

- (id)predictFrom:(id)a3 withTuning:(id)a4 usingVersion:(int)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  id v26;
  uint64_t v27;
  int v28;
  unsigned int v29;
  uint64_t v30;
  _DWORD *v31;
  id v32;
  NSObject *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  _QWORD v41[4];
  id v42;

  v7 = a3;
  v8 = a4;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 4 * objc_msgSend(v7, "count"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reverseObjectEnumerator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __61___CDSleepPredictorMath_predictFrom_withTuning_usingVersion___block_invoke;
  v41[3] = &unk_1E26E6A38;
  v12 = v9;
  v42 = v12;
  objc_msgSend(v11, "enumerateObjectsUsingBlock:", v41);

  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", 768);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kSleepTuningShort"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kSleepTuningShort"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "doubleValue");
    v17 = v16;

  }
  else
  {
    v17 = 0.8;
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kSleepTuningLong"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kSleepTuningLong"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "doubleValue");
    v21 = v20;

  }
  else
  {
    v21 = 0.7;
  }

  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kSleepTuningRatio"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("kSleepTuningRatio"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "doubleValue");
    v25 = v24;

  }
  else
  {
    v25 = 0.5;
  }

  v26 = objc_retainAutorelease(v12);
  v27 = objc_msgSend(v26, "mutableBytes");
  v28 = objc_msgSend(v7, "count");
  v29 = v28;
  if (a5 == 2 && v28 >= 1)
  {
    v30 = v28;
    v31 = (_DWORD *)v27;
    do
    {
      if (*v31 == -1)
        *v31 = 0;
      ++v31;
      --v30;
    }
    while (v30);
  }
  v32 = objc_retainAutorelease(v13);
  if (sleepPredictionWithParams(objc_msgSend(v32, "mutableBytes"), v27, v29, v17, v21, v25, a5))
  {
    +[_CDLogging knowledgeChannel](_CDLogging, "knowledgeChannel");
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      -[_CDSleepPredictorMath predictFrom:withTuning:usingVersion:].cold.1(v33);

    v34 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(objc_retainAutorelease(v32), "bytes");
    for (i = 0; i != 768; i += 8)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(v36 + i));
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "addObject:", v38);

    }
    objc_msgSend(v35, "reverseObjectEnumerator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v34;
}

- (id)predictFrom:(id)a3
{
  return -[_CDSleepPredictorMath predictFrom:withTuning:usingVersion:](self, "predictFrom:withTuning:usingVersion:", a3, MEMORY[0x1E0C9AA70], 1);
}

- (void)predictFrom:(os_log_t)log withTuning:usingVersion:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18DDBE000, log, OS_LOG_TYPE_ERROR, "Sleep Prediction: function aborted due to insufficient data", v1, 2u);
}

@end
