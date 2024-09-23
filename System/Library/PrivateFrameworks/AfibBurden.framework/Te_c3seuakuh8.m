@implementation Te_c3seuakuh8

+ (id)URLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("Te_c3seuakuh8"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[Te_c3seuakuh8 URLOfModelInThisBundle].cold.1();
    v4 = 0;
  }

  return v4;
}

- (Te_c3seuakuh8)initWithMLModel:(id)a3
{
  id v5;
  Te_c3seuakuh8 *v6;
  Te_c3seuakuh8 *v7;
  Te_c3seuakuh8 *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)Te_c3seuakuh8;
  v6 = -[Te_c3seuakuh8 init](&v10, sel_init);
  v7 = v6;
  if (v6 && (objc_storeStrong((id *)&v6->_model, a3), v7->_model))
    v8 = v7;
  else
    v8 = 0;

  return v8;
}

- (Te_c3seuakuh8)init
{
  void *v3;
  Te_c3seuakuh8 *v4;

  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[Te_c3seuakuh8 initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (Te_c3seuakuh8)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  Te_c3seuakuh8 *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[Te_c3seuakuh8 initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (Te_c3seuakuh8)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  Te_c3seuakuh8 *v6;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[Te_c3seuakuh8 initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (Te_c3seuakuh8)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  Te_c3seuakuh8 *v7;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[Te_c3seuakuh8 initWithMLModel:](self, "initWithMLModel:", v6);
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
  v8 = (void *)MEMORY[0x24BDBFFC8];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__Te_c3seuakuh8_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_250759010;
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

  v6 = (objc_class *)MEMORY[0x24BDC0018];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  -[Te_c3seuakuh8 predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  void *v5;
  Te_c3seuakuh8Output *v6;
  void *v7;
  void *v8;
  Te_c3seuakuh8Output *v9;

  -[MLModel predictionFromFeatures:options:error:](self->_model, "predictionFromFeatures:options:error:", a3, a4, a5);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = [Te_c3seuakuh8Output alloc];
    objc_msgSend(v5, "featureValueForName:", CFSTR("RHYTHM_TYPE_HEAD/FC_1/fully_connected/BiasAdd"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[Te_c3seuakuh8Output initWithRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:](v6, "initWithRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:", v8);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)predictionFromPlaceholder:(id)a3 error:(id *)a4
{
  id v6;
  Te_c3seuakuh8Input *v7;
  void *v8;

  v6 = a3;
  v7 = -[Te_c3seuakuh8Input initWithPlaceholder:]([Te_c3seuakuh8Input alloc], "initWithPlaceholder:", v6);

  -[Te_c3seuakuh8 predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  Te_c3seuakuh8Output *v16;
  void *v17;
  void *v18;
  Te_c3seuakuh8Output *v19;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v8);
  -[MLModel predictionsFromBatch:options:error:](self->_model, "predictionsFromBatch:options:error:", v10, v9, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") >= 1)
    {
      v21 = v9;
      v22 = v8;
      v14 = 0;
      do
      {
        objc_msgSend(v12, "featuresAtIndex:", v14, v21, v22);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [Te_c3seuakuh8Output alloc];
        objc_msgSend(v15, "featureValueForName:", CFSTR("RHYTHM_TYPE_HEAD/FC_1/fully_connected/BiasAdd"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "multiArrayValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = -[Te_c3seuakuh8Output initWithRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:](v16, "initWithRHYTHM_TYPE_HEAD_FC_1_fully_connected_BiasAdd:", v18);

        objc_msgSend(v13, "addObject:", v19);
        ++v14;
      }
      while (v14 < objc_msgSend(v12, "count"));
      v9 = v21;
      v8 = v22;
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

+ (void)URLOfModelInThisBundle
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_235FAB000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load Te_c3seuakuh8.mlmodelc in the bundle resource", v0, 2u);
}

@end
