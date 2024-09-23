@implementation model_period_10pct

+ (id)URLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("model_period_10pct"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[model_period_10pct URLOfModelInThisBundle].cold.1();
    v4 = 0;
  }

  return v4;
}

- (model_period_10pct)initWithMLModel:(id)a3
{
  id v5;
  model_period_10pct *v6;
  model_period_10pct *v7;
  model_period_10pct *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)model_period_10pct;
    v6 = -[model_period_10pct init](&v10, sel_init);
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

- (model_period_10pct)init
{
  void *v3;
  model_period_10pct *v4;

  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[model_period_10pct initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (model_period_10pct)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  model_period_10pct *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[model_period_10pct initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (model_period_10pct)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  model_period_10pct *v6;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[model_period_10pct initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (model_period_10pct)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  model_period_10pct *v7;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[model_period_10pct initWithMLModel:](self, "initWithMLModel:", v6);
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
  v10[2] = __72__model_period_10pct_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_24E71D3C0;
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
  -[model_period_10pct predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  model_period_10pctOutput *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  model_period_10pctOutput *v19;

  v8 = a4;
  v9 = a3;
  -[model_period_10pct model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [model_period_10pctOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("out"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "multiArrayValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("lstm_1_h_out"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "multiArrayValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("lstm_1_c_out"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "multiArrayValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[model_period_10pctOutput initWithOut:lstm_1_h_out:lstm_1_c_out:](v12, "initWithOut:lstm_1_h_out:lstm_1_c_out:", v14, v16, v18);

  }
  else
  {
    v19 = 0;
  }

  return v19;
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
  -[model_period_10pct model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __63__model_period_10pct_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_24E71D3E8;
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
  -[model_period_10pct model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __71__model_period_10pct_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_24E71D3E8;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

- (id)predictionFromIn:(id)a3 lstm_1_h_in:(id)a4 lstm_1_c_in:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  model_period_10pctInput *v13;
  void *v14;

  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = -[model_period_10pctInput initWithIn:lstm_1_h_in:lstm_1_c_in:]([model_period_10pctInput alloc], "initWithIn:lstm_1_h_in:lstm_1_c_in:", v12, v11, v10);

  -[model_period_10pct predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v13, a6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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
  model_period_10pctOutput *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  model_period_10pctOutput *v24;
  void *v26;
  id v27;
  id v28;
  void *v29;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v8);
  -[model_period_10pct model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "predictionsFromBatch:options:error:", v10, v9, a5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count") >= 1)
    {
      v26 = v10;
      v27 = v9;
      v28 = v8;
      v29 = v12;
      v14 = 0;
      do
      {
        objc_msgSend(v12, "featuresAtIndex:", v14, v26, v27, v28);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = [model_period_10pctOutput alloc];
        objc_msgSend(v15, "featureValueForName:", CFSTR("out"));
        v17 = v13;
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "multiArrayValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("lstm_1_h_out"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "multiArrayValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("lstm_1_c_out"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "multiArrayValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[model_period_10pctOutput initWithOut:lstm_1_h_out:lstm_1_c_out:](v16, "initWithOut:lstm_1_h_out:lstm_1_c_out:", v19, v21, v23);

        v13 = v17;
        v12 = v29;
        objc_msgSend(v13, "addObject:", v24);

        ++v14;
      }
      while (v14 < objc_msgSend(v29, "count"));
      v9 = v27;
      v8 = v28;
      v10 = v26;
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
  _os_log_error_impl(&dword_221550000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load model_period_10pct.mlmodelc in the bundle resource", v0, 2u);
}

@end
