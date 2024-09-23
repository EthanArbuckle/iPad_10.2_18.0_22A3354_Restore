@implementation SNSoundPrintASmokeAlarmModel

+ (id)URLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;
  uint8_t v6[16];

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("SNSoundPrintASmokeAlarmModel"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_error_impl(&dword_1D42A7000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Could not load SNSoundPrintASmokeAlarmModel.mlmodelc in the bundle resource", v6, 2u);
    }
    v4 = 0;
  }

  return v4;
}

- (SNSoundPrintASmokeAlarmModel)initWithMLModel:(id)a3
{
  id v5;
  SNSoundPrintASmokeAlarmModel *v6;
  SNSoundPrintASmokeAlarmModel *v7;
  SNSoundPrintASmokeAlarmModel *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SNSoundPrintASmokeAlarmModel;
    v6 = -[SNSoundPrintASmokeAlarmModel init](&v10, sel_init);
    v7 = v6;
    if (v6)
      objc_storeStrong((id *)&v6->_model, a3);
    self = v7;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (SNSoundPrintASmokeAlarmModel)init
{
  void *v3;
  SNSoundPrintASmokeAlarmModel *v4;

  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SNSoundPrintASmokeAlarmModel initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (SNSoundPrintASmokeAlarmModel)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SNSoundPrintASmokeAlarmModel *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SNSoundPrintASmokeAlarmModel initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (SNSoundPrintASmokeAlarmModel)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  SNSoundPrintASmokeAlarmModel *v6;

  objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[SNSoundPrintASmokeAlarmModel initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SNSoundPrintASmokeAlarmModel)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  SNSoundPrintASmokeAlarmModel *v7;

  objc_msgSend(MEMORY[0x1E0C9E940], "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[SNSoundPrintASmokeAlarmModel initWithMLModel:](self, "initWithMLModel:", v6);
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  objc_msgSend(a1, "URLOfModelInThisBundle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "loadContentsOfURL:configuration:completionHandler:", v8, v7, v6);

}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  v8 = (void *)MEMORY[0x1E0C9E940];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D450DBE4;
  v10[3] = &unk_1E97C4DF0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "loadContentsOfURL:configuration:completionHandler:", a3, a4, v10);

}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;

  v6 = (objc_class *)MEMORY[0x1E0C9E9B0];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[SNSoundPrintASmokeAlarmModel predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  SNSoundPrintASmokeAlarmModelOutput *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  SNSoundPrintASmokeAlarmModelOutput *v21;
  void *v22;
  SNSoundPrintASmokeAlarmModelOutput *v23;
  void *v25;
  void *v26;

  v8 = a4;
  v9 = a3;
  -[SNSoundPrintASmokeAlarmModel model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [SNSoundPrintASmokeAlarmModelOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("input_1"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "multiArrayValue");
    v13 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("Confidence"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "multiArrayValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("Detected"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "multiArrayValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("thresholdedHistoryOut"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "multiArrayValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("detectedHistoryOut"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "multiArrayValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v12;
    v22 = (void *)v13;
    v23 = -[SNSoundPrintASmokeAlarmModelOutput initWithInput_1:Confidence:Detected:thresholdedHistoryOut:detectedHistoryOut:](v21, "initWithInput_1:Confidence:Detected:thresholdedHistoryOut:detectedHistoryOut:", v13, v14, v16, v18, v20);

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)predictionFromFeatures:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v7 = a3;
  -[SNSoundPrintASmokeAlarmModel model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = sub_1D450DF38;
  v10[3] = &unk_1E97C4E18;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "predictionFromFeatures:completionHandler:", v7, v10);

}

- (void)predictionFromFeatures:(id)a3 options:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SNSoundPrintASmokeAlarmModel model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = sub_1D450E1B8;
  v13[3] = &unk_1E97C4E18;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

- (id)predictionFromInput1:(id)a3 stateIn:(id)a4 thresholdedHistoryIn:(id)a5 detectedHistoryIn:(id)a6 error:(id *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  SNSoundPrintASmokeAlarmModelInput *v16;
  void *v17;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[SNSoundPrintASmokeAlarmModelInput initWithInput1:stateIn:thresholdedHistoryIn:detectedHistoryIn:]([SNSoundPrintASmokeAlarmModelInput alloc], "initWithInput1:stateIn:thresholdedHistoryIn:detectedHistoryIn:", v15, v14, v13, v12);

  -[SNSoundPrintASmokeAlarmModel predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v16, a7);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  SNSoundPrintASmokeAlarmModelOutput *v22;
  void *v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  SNSoundPrintASmokeAlarmModelOutput *v29;
  void *v30;
  void *v31;
  void *v32;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E8E0]), "initWithFeatureProviderArray:", v8);
  -[SNSoundPrintASmokeAlarmModel model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") >= 1)
    {
      v24 = v10;
      v25 = v9;
      v26 = v8;
      v27 = v13;
      v14 = 0;
      do
      {
        objc_msgSend(v12, "featuresAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v29 = [SNSoundPrintASmokeAlarmModelOutput alloc];
        objc_msgSend(v15, "featureValueForName:", CFSTR("input_1"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "multiArrayValue");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("Confidence"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "multiArrayValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("Detected"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "multiArrayValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("thresholdedHistoryOut"));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "multiArrayValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("detectedHistoryOut"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "multiArrayValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[SNSoundPrintASmokeAlarmModelOutput initWithInput_1:Confidence:Detected:thresholdedHistoryOut:detectedHistoryOut:](v29, "initWithInput_1:Confidence:Detected:thresholdedHistoryOut:detectedHistoryOut:", v28, v16, v17, v19, v21);

        v13 = v27;
        objc_msgSend(v27, "addObject:", v22);

        ++v14;
      }
      while (v14 < objc_msgSend(v12, "count"));
      v9 = v25;
      v8 = v26;
      v10 = v24;
    }
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (MLModel)model
{
  return self->_model;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_model, 0);
}

@end
