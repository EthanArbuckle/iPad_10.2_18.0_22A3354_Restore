@implementation CBCE2

+ (id)URLOfModelInThisBundle
{
  NSObject *log;
  os_log_type_t type;
  id v5;
  uint8_t v6[7];
  char v7;
  id location;
  id v9[3];
  id v10;

  v9[2] = a1;
  v9[1] = (id)a2;
  v5 = (id)objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v9[0] = (id)objc_msgSend(v5, "pathForResource:ofType:", CFSTR("CBCE2"), CFSTR("mlmodelc"));

  if (v9[0])
  {
    v10 = (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9[0]);
  }
  else
  {
    location = MEMORY[0x1E0C81028];
    v7 = 16;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_ERROR))
    {
      log = location;
      type = v7;
      __os_log_helper_16_0_0(v6);
      _os_log_error_impl(&dword_1B5291000, log, type, "Could not load CBCE2.mlmodelc in the bundle resource", v6, 2u);
    }
    objc_storeStrong(&location, 0);
    v10 = 0;
  }
  objc_storeStrong(v9, 0);
  return v10;
}

- (CBCE2)initWithMLModel:(id)a3
{
  id v3;
  objc_super v5;
  id location[2];
  id v7;
  CBCE2 *v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0;
  v5.receiver = v3;
  v5.super_class = (Class)CBCE2;
  v7 = -[CBCE2 init](&v5, sel_init);
  objc_storeStrong(&v7, v7);
  if (v7)
  {
    objc_storeStrong((id *)v7 + 1, location[0]);
    if (*((_QWORD *)v7 + 1))
      v8 = (CBCE2 *)v7;
    else
      v8 = 0;
  }
  else
  {
    v8 = 0;
  }
  objc_storeStrong(location, 0);
  objc_storeStrong(&v7, 0);
  return v8;
}

- (CBCE2)init
{
  id v4;
  CBCE2 *v5;
  CBCE2 *v6;

  v6 = self;
  v4 = (id)objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v6 = 0;
  v6 = -[CBCE2 initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0);
  return v5;
}

- (CBCE2)initWithConfiguration:(id)a3 error:(id *)a4
{
  CBCE2 *v5;
  id v6;
  CBCE2 *v7;
  id location[2];
  CBCE2 *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v9;
  v6 = (id)objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v9 = 0;
  v9 = -[CBCE2 initWithContentsOfURL:configuration:error:](v5, "initWithContentsOfURL:configuration:error:");
  v7 = v9;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (CBCE2)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v4;
  id v7[2];
  id location[2];
  id v9;
  CBCE2 *v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = (id)objc_msgSend(getMLModelClass_0(), "modelWithContentsOfURL:error:", location[0], a4);
  if (v7[0])
  {
    v4 = v9;
    v9 = 0;
    v9 = (id)objc_msgSend(v4, "initWithMLModel:", v7[0]);
    v10 = (CBCE2 *)v9;
  }
  else
  {
    v10 = 0;
  }
  objc_storeStrong(v7, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v9, 0);
  return v10;
}

- (CBCE2)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v5;
  id v9[2];
  id v10;
  id location[2];
  id v12;
  CBCE2 *v13;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9[1] = a5;
  v9[0] = (id)objc_msgSend(getMLModelClass_0(), "modelWithContentsOfURL:configuration:error:", location[0], v10, a5);
  if (v9[0])
  {
    v5 = v12;
    v12 = 0;
    v12 = (id)objc_msgSend(v5, "initWithMLModel:", v9[0]);
    v13 = (CBCE2 *)v12;
  }
  else
  {
    v13 = 0;
  }
  objc_storeStrong(v9, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  objc_storeStrong(&v12, 0);
  return v13;
}

+ (void)loadWithConfiguration:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  id location[2];
  id v9;

  v9 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7 = 0;
  objc_storeStrong(&v7, a4);
  v5 = v9;
  v6 = (id)objc_msgSend(v9, "URLOfModelInThisBundle");
  objc_msgSend(v5, "loadContentsOfURL:configuration:completionHandler:");

  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

+ (void)loadContentsOfURL:(id)a3 configuration:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id MLModelClass_0;
  uint64_t v10;
  int v11;
  int v12;
  void (*v13)(_QWORD *, void *, void *);
  void *v14;
  id v15;
  id v16;
  id v17;
  id location[3];

  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  MLModelClass_0 = getMLModelClass_0();
  v7 = location[0];
  v8 = v17;
  v10 = MEMORY[0x1E0C809B0];
  v11 = -1073741824;
  v12 = 0;
  v13 = __59__CBCE2_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v14 = &unk_1E68EA6F8;
  v15 = v16;
  objc_msgSend(MLModelClass_0, "loadContentsOfURL:configuration:completionHandler:", v7, v8);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __59__CBCE2_loadContentsOfURL_configuration_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  CBCE2 *v3;
  id v6[2];
  id v7;
  id location[2];

  location[1] = a1;
  location[0] = 0;
  objc_storeStrong(location, a2);
  v7 = 0;
  objc_storeStrong(&v7, a3);
  v6[1] = a1;
  if (location[0])
  {
    v3 = [CBCE2 alloc];
    v6[0] = -[CBCE2 initWithMLModel:](v3, "initWithMLModel:", location[0]);
    (*(void (**)(void))(a1[4] + 16))();
    objc_storeStrong(v6, 0);
  }
  else
  {
    (*(void (**)(void))(a1[4] + 16))();
  }
  objc_storeStrong(&v7, 0);
  objc_storeStrong(location, 0);
}

- (id)predictionFromFeatures:(id)a3 error:(id *)a4
{
  id v5;
  CBCE2 *v6;
  id v7;
  id v8;
  id location[2];
  CBCE2 *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = v10;
  v5 = location[0];
  v7 = objc_alloc_init((Class)getMLPredictionOptionsClass_0());
  v8 = -[CBCE2 predictionFromFeatures:options:error:](v6, "predictionFromFeatures:options:error:", v5);

  objc_storeStrong(location, 0);
  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  CBCE2Output *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v23[2];
  id v24;
  id location[2];
  CBCE2 *v26;
  CBCE2Output *v27;

  v26 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v24 = 0;
  objc_storeStrong(&v24, a4);
  v23[1] = a5;
  v23[0] = -[MLModel predictionFromFeatures:options:error:](v26->_model, "predictionFromFeatures:options:error:", location[0], v24, a5);
  if (v23[0])
  {
    v6 = [CBCE2Output alloc];
    v20 = (id)objc_msgSend(v23[0], "featureValueForName:", CFSTR("CBCE2_Q0_output"));
    v19 = (id)objc_msgSend(v20, "multiArrayValue");
    v18 = (id)objc_msgSend(v23[0], "featureValueForName:", CFSTR("CBCE2_Q1_output"));
    v17 = (id)objc_msgSend(v18, "multiArrayValue");
    v16 = (id)objc_msgSend(v23[0], "featureValueForName:", CFSTR("CBCE2_Q2_output"));
    v15 = (id)objc_msgSend(v16, "multiArrayValue");
    v14 = (id)objc_msgSend(v23[0], "featureValueForName:", CFSTR("CBCE2_Q3_output"));
    v13 = (id)objc_msgSend(v14, "multiArrayValue");
    v12 = (id)objc_msgSend(v23[0], "featureValueForName:", CFSTR("CBCE2_Q4_output"));
    v11 = (id)objc_msgSend(v12, "multiArrayValue");
    v10 = (id)objc_msgSend(v23[0], "featureValueForName:", CFSTR("strength_output"));
    v9 = (id)objc_msgSend(v10, "multiArrayValue");
    v8 = (id)objc_msgSend(v23[0], "featureValueForName:", CFSTR("uncertainty"));
    v7 = (id)objc_msgSend(v8, "multiArrayValue");
    v27 = -[CBCE2Output initWithCBCE2_Q0_output:CBCE2_Q1_output:CBCE2_Q2_output:CBCE2_Q3_output:CBCE2_Q4_output:strength_output:uncertainty:](v6, "initWithCBCE2_Q0_output:CBCE2_Q1_output:CBCE2_Q2_output:CBCE2_Q3_output:CBCE2_Q4_output:strength_output:uncertainty:", v19, v17, v15, v13, v11, v9, v7);

  }
  else
  {
    v27 = 0;
  }
  objc_storeStrong(v23, 0);
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  return v27;
}

- (id)predictionFromInput:(id)a3 error:(id *)a4
{
  CBCE2Input *v4;
  id v7;
  id v8[2];
  id location[2];
  CBCE2 *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v8[1] = a4;
  v4 = [CBCE2Input alloc];
  v8[0] = -[CBCE2Input initWithInput:](v4, "initWithInput:", location[0]);
  v7 = -[CBCE2 predictionFromFeatures:error:](v10, "predictionFromFeatures:error:", v8[0], a4);
  objc_storeStrong(v8, 0);
  objc_storeStrong(location, 0);
  return v7;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5;
  CBCE2Output *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  CBCE2Output *v25;
  id v26;
  uint64_t i;
  id v28;
  int v29;
  id v30;
  id v31[2];
  id v32;
  id location[2];
  CBCE2 *v34;
  id v35;

  v34 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v32 = 0;
  objc_storeStrong(&v32, a4);
  v31[1] = a5;
  v5 = objc_alloc((Class)getMLArrayBatchProviderClass_0());
  v31[0] = (id)objc_msgSend(v5, "initWithFeatureProviderArray:", location[0]);
  v30 = -[MLModel predictionsFromBatch:options:error:](v34->_model, "predictionsFromBatch:options:error:", v31[0], v32, a5);
  if (v30)
  {
    v28 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v30, "count"));
    for (i = 0; ; ++i)
    {
      v22 = i;
      if (v22 >= objc_msgSend(v30, "count"))
        break;
      v26 = (id)objc_msgSend(v30, "featuresAtIndex:", i);
      v7 = [CBCE2Output alloc];
      v21 = (id)objc_msgSend(v26, "featureValueForName:", CFSTR("CBCE2_Q0_output"));
      v20 = (id)objc_msgSend(v21, "multiArrayValue");
      v19 = (id)objc_msgSend(v26, "featureValueForName:", CFSTR("CBCE2_Q1_output"));
      v18 = (id)objc_msgSend(v19, "multiArrayValue");
      v17 = (id)objc_msgSend(v26, "featureValueForName:", CFSTR("CBCE2_Q2_output"));
      v16 = (id)objc_msgSend(v17, "multiArrayValue");
      v15 = (id)objc_msgSend(v26, "featureValueForName:", CFSTR("CBCE2_Q3_output"));
      v14 = (id)objc_msgSend(v15, "multiArrayValue");
      v13 = (id)objc_msgSend(v26, "featureValueForName:", CFSTR("CBCE2_Q4_output"));
      v12 = (id)objc_msgSend(v13, "multiArrayValue");
      v11 = (id)objc_msgSend(v26, "featureValueForName:", CFSTR("strength_output"));
      v10 = (id)objc_msgSend(v11, "multiArrayValue");
      v9 = (id)objc_msgSend(v26, "featureValueForName:", CFSTR("uncertainty"));
      v8 = (id)objc_msgSend(v9, "multiArrayValue");
      v25 = -[CBCE2Output initWithCBCE2_Q0_output:CBCE2_Q1_output:CBCE2_Q2_output:CBCE2_Q3_output:CBCE2_Q4_output:strength_output:uncertainty:](v7, "initWithCBCE2_Q0_output:CBCE2_Q1_output:CBCE2_Q2_output:CBCE2_Q3_output:CBCE2_Q4_output:strength_output:uncertainty:", v20, v18, v16, v14, v12, v10, v8);

      objc_msgSend(v28, "addObject:", v25);
      objc_storeStrong((id *)&v25, 0);
      objc_storeStrong(&v26, 0);
    }
    v35 = v28;
    v29 = 1;
    objc_storeStrong(&v28, 0);
  }
  else
  {
    v35 = 0;
    v29 = 1;
  }
  objc_storeStrong(&v30, 0);
  objc_storeStrong(v31, 0);
  objc_storeStrong(&v32, 0);
  objc_storeStrong(location, 0);
  return v35;
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
