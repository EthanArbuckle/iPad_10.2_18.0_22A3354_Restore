@implementation MLAB

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
  v9[0] = (id)objc_msgSend(v5, "pathForResource:ofType:", CFSTR("MLAB"), CFSTR("mlmodelc"));

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
      _os_log_error_impl(&dword_1B5291000, log, type, "Could not load MLAB.mlmodelc in the bundle resource", v6, 2u);
    }
    objc_storeStrong(&location, 0);
    v10 = 0;
  }
  objc_storeStrong(v9, 0);
  return v10;
}

- (MLAB)initWithMLModel:(id)a3
{
  id v3;
  objc_super v5;
  id location[2];
  id v7;
  MLAB *v8;

  v7 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v3 = v7;
  v7 = 0;
  v5.receiver = v3;
  v5.super_class = (Class)MLAB;
  v7 = -[MLAB init](&v5, sel_init);
  objc_storeStrong(&v7, v7);
  if (v7)
  {
    objc_storeStrong((id *)v7 + 1, location[0]);
    if (*((_QWORD *)v7 + 1))
      v8 = (MLAB *)v7;
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

- (MLAB)init
{
  id v4;
  MLAB *v5;
  MLAB *v6;

  v6 = self;
  v4 = (id)objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v6 = 0;
  v6 = -[MLAB initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:");
  v5 = v6;

  objc_storeStrong((id *)&v6, 0);
  return v5;
}

- (MLAB)initWithConfiguration:(id)a3 error:(id *)a4
{
  MLAB *v5;
  id v6;
  MLAB *v7;
  id location[2];
  MLAB *v9;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v5 = v9;
  v6 = (id)objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v9 = 0;
  v9 = -[MLAB initWithContentsOfURL:configuration:error:](v5, "initWithContentsOfURL:configuration:error:");
  v7 = v9;

  objc_storeStrong(location, 0);
  objc_storeStrong((id *)&v9, 0);
  return v7;
}

- (MLAB)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  id v4;
  id v7[2];
  id location[2];
  id v9;
  MLAB *v10;

  v9 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v7[1] = a4;
  v7[0] = (id)objc_msgSend(getMLModelClass_1(), "modelWithContentsOfURL:error:", location[0], a4);
  if (v7[0])
  {
    v4 = v9;
    v9 = 0;
    v9 = (id)objc_msgSend(v4, "initWithMLModel:", v7[0]);
    v10 = (MLAB *)v9;
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

- (MLAB)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  id v5;
  id v9[2];
  id v10;
  id location[2];
  id v12;
  MLAB *v13;

  v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v10 = 0;
  objc_storeStrong(&v10, a4);
  v9[1] = a5;
  v9[0] = (id)objc_msgSend(getMLModelClass_1(), "modelWithContentsOfURL:configuration:error:", location[0], v10, a5);
  if (v9[0])
  {
    v5 = v12;
    v12 = 0;
    v12 = (id)objc_msgSend(v5, "initWithMLModel:", v9[0]);
    v13 = (MLAB *)v12;
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
  id MLModelClass_1;
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
  MLModelClass_1 = getMLModelClass_1();
  v7 = location[0];
  v8 = v17;
  v10 = MEMORY[0x1E0C809B0];
  v11 = -1073741824;
  v12 = 0;
  v13 = __58__MLAB_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v14 = &unk_1E68EADB8;
  v15 = v16;
  objc_msgSend(MLModelClass_1, "loadContentsOfURL:configuration:completionHandler:", v7, v8);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
}

void __58__MLAB_loadContentsOfURL_configuration_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  MLAB *v3;
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
    v3 = [MLAB alloc];
    v6[0] = -[MLAB initWithMLModel:](v3, "initWithMLModel:", location[0]);
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
  MLAB *v6;
  id v7;
  id v8;
  id location[2];
  MLAB *v10;

  v10 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v6 = v10;
  v5 = location[0];
  v7 = objc_alloc_init((Class)getMLPredictionOptionsClass_1());
  v8 = -[MLAB predictionFromFeatures:options:error:](v6, "predictionFromFeatures:options:error:", v5);

  objc_storeStrong(location, 0);
  return v8;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  uint64_t v6;
  id obj;
  MLABOutput *v8;
  uint64_t *v9;
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
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id *v41;
  MLModel *v42;
  int v43;
  id v44[2];
  id v45;
  id location[2];
  MLAB *v47;
  MLABOutput *v48;

  v40 = a4;
  v41 = a5;
  v47 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v45 = 0;
  objc_storeStrong(&v45, v40);
  v44[1] = v41;
  v42 = -[MLAB model](v47, "model");
  v44[0] = -[MLModel predictionFromFeatures:options:error:](v42, "predictionFromFeatures:options:error:", location[0], v45, v41);

  if (v44[0])
  {
    v8 = [MLABOutput alloc];
    v39 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("Identity"));
    v38 = (id)objc_msgSend(v39, "multiArrayValue");
    v37 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("LTM_output_E"));
    v36 = (id)objc_msgSend(v37, "multiArrayValue");
    v35 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("Identity_10"));
    v34 = (id)objc_msgSend(v35, "multiArrayValue");
    v33 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("Identity_11"));
    v32 = (id)objc_msgSend(v33, "multiArrayValue");
    v31 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("Identity_12"));
    v30 = (id)objc_msgSend(v31, "multiArrayValue");
    v29 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("Identity_13"));
    v28 = (id)objc_msgSend(v29, "multiArrayValue");
    v27 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("Identity_14"));
    v26 = (id)objc_msgSend(v27, "multiArrayValue");
    v25 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("LTM_output_L"));
    v24 = (id)objc_msgSend(v25, "multiArrayValue");
    v23 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("LTM_output_S"));
    v22 = (id)objc_msgSend(v23, "multiArrayValue");
    v21 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("Identity_4"));
    v20 = (id)objc_msgSend(v21, "multiArrayValue");
    v19 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("Identity_5"));
    v18 = (id)objc_msgSend(v19, "multiArrayValue");
    v17 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("STM_output_E"));
    v16 = (id)objc_msgSend(v17, "multiArrayValue");
    v15 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("STM_output_L"));
    v14 = (id)objc_msgSend(v15, "multiArrayValue");
    v13 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("STM_output_S"));
    v12 = (id)objc_msgSend(v13, "multiArrayValue");
    v11 = (id)objc_msgSend(v44[0], "featureValueForName:", CFSTR("Identity_9"));
    v10 = (id)objc_msgSend(v11, "multiArrayValue");
    v9 = &v6;
    v48 = -[MLABOutput initWithIdentity:LTM_output_E:Identity_10:Identity_11:Identity_12:Identity_13:Identity_14:LTM_output_L:LTM_output_S:Identity_4:Identity_5:STM_output_E:STM_output_L:STM_output_S:Identity_9:](v8, "initWithIdentity:LTM_output_E:Identity_10:Identity_11:Identity_12:Identity_13:Identity_14:LTM_output_L:LTM_output_S:Identity_4:Identity_5:STM_output_E:STM_output_L:STM_output_S:Identity_9:", v38, v36, v34, v32, v30, v28, v26, v24, v22, v20, v18, v16, v14, v12, v10);

  }
  else
  {
    v48 = 0;
  }
  v43 = 1;
  obj = 0;
  objc_storeStrong(v44, 0);
  objc_storeStrong(&v45, obj);
  objc_storeStrong(location, obj);
  return v48;
}

- (id)predictionFromInput_x:(id)a3 target_lux:(id)a4 target_nits:(id)a5 target_weight:(id)a6 error:(id *)a7
{
  MLABInput *v7;
  id v13;
  id v14[2];
  id v15;
  id v16;
  id v17;
  id location[2];
  MLAB *v19;

  v19 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v17 = 0;
  objc_storeStrong(&v17, a4);
  v16 = 0;
  objc_storeStrong(&v16, a5);
  v15 = 0;
  objc_storeStrong(&v15, a6);
  v14[1] = a7;
  v7 = [MLABInput alloc];
  v14[0] = -[MLABInput initWithInput_x:target_lux:target_nits:target_weight:](v7, "initWithInput_x:target_lux:target_nits:target_weight:", location[0], v17, v16, v15);
  v13 = -[MLAB predictionFromFeatures:error:](v19, "predictionFromFeatures:error:", v14[0], a7);
  objc_storeStrong(v14, 0);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v13;
}

- (id)predictionsFromInputs:(id)a3 options:(id)a4 error:(id *)a5
{
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v10;
  id obj;
  id *v12;
  MLABOutput *v13;
  uint64_t *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id *v45;
  id *v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  id *v51;
  MLModel *v52;
  uint64_t v53;
  id v54;
  uint64_t i;
  id v56;
  int v57;
  id v58;
  id v59[2];
  id v60;
  id location[2];
  MLAB *v62;
  id v63;

  v50 = a4;
  v51 = a5;
  v62 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v60 = 0;
  objc_storeStrong(&v60, v50);
  v59[1] = v51;
  v5 = objc_alloc((Class)getMLArrayBatchProviderClass_1());
  v59[0] = (id)objc_msgSend(v5, "initWithFeatureProviderArray:", location[0]);
  v52 = -[MLAB model](v62, "model");
  v58 = -[MLModel predictionsFromBatch:options:error:](v52, "predictionsFromBatch:options:error:", v59[0], v60, v51);

  if (v58)
  {
    v49 = MEMORY[0x1E0C99DE8];
    v56 = (id)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v58, "count"));
    for (i = 0; ; ++i)
    {
      v48 = i;
      v6 = objc_msgSend(v58, "count");
      if (v48 >= v6)
        break;
      v7 = (id)objc_msgSend(v58, "featuresAtIndex:", i);
      v46 = &v54;
      v54 = v7;
      v13 = [MLABOutput alloc];
      v44 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("Identity"));
      v43 = (id)objc_msgSend(v44, "multiArrayValue");
      v42 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("LTM_output_E"));
      v41 = (id)objc_msgSend(v42, "multiArrayValue");
      v40 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("Identity_10"));
      v39 = (id)objc_msgSend(v40, "multiArrayValue");
      v38 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("Identity_11"));
      v37 = (id)objc_msgSend(v38, "multiArrayValue");
      v36 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("Identity_12"));
      v35 = (id)objc_msgSend(v36, "multiArrayValue");
      v34 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("Identity_13"));
      v33 = (id)objc_msgSend(v34, "multiArrayValue");
      v32 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("Identity_14"));
      v31 = (id)objc_msgSend(v32, "multiArrayValue");
      v30 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("LTM_output_L"));
      v29 = (id)objc_msgSend(v30, "multiArrayValue");
      v28 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("LTM_output_S"));
      v27 = (id)objc_msgSend(v28, "multiArrayValue");
      v26 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("Identity_4"));
      v25 = (id)objc_msgSend(v26, "multiArrayValue");
      v24 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("Identity_5"));
      v23 = (id)objc_msgSend(v24, "multiArrayValue");
      v22 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("STM_output_E"));
      v21 = (id)objc_msgSend(v22, "multiArrayValue");
      v20 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("STM_output_L"));
      v19 = (id)objc_msgSend(v20, "multiArrayValue");
      v18 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("STM_output_S"));
      v17 = (id)objc_msgSend(v18, "multiArrayValue");
      v16 = (id)objc_msgSend(v54, "featureValueForName:", CFSTR("Identity_9"));
      v15 = (id)objc_msgSend(v16, "multiArrayValue");
      v14 = &v10;
      v8 = -[MLABOutput initWithIdentity:LTM_output_E:Identity_10:Identity_11:Identity_12:Identity_13:Identity_14:LTM_output_L:LTM_output_S:Identity_4:Identity_5:STM_output_E:STM_output_L:STM_output_S:Identity_9:](v13, "initWithIdentity:LTM_output_E:Identity_10:Identity_11:Identity_12:Identity_13:Identity_14:LTM_output_L:LTM_output_S:Identity_4:Identity_5:STM_output_E:STM_output_L:STM_output_S:Identity_9:", v43, v41, v39, v37, v35, v33, v31, v29, v27, v25, v23, v21, v19, v17, v15);
      v45 = (id *)&v53;
      v53 = v8;

      objc_msgSend(v56, "addObject:", v53);
      v47 = 0;
      objc_storeStrong(v45, 0);
      objc_storeStrong(v46, v47);
    }
    v12 = &v56;
    v63 = v56;
    v57 = 1;
    objc_storeStrong(v12, 0);
  }
  else
  {
    v63 = 0;
    v57 = 1;
  }
  obj = 0;
  objc_storeStrong(&v58, 0);
  objc_storeStrong(v59, obj);
  objc_storeStrong(&v60, obj);
  objc_storeStrong(location, obj);
  return v63;
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
