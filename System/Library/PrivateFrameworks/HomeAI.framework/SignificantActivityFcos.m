@implementation SignificantActivityFcos

+ (id)URLOfModelInThisBundle
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("SignificantActivityFcos"), CFSTR("mlmodelc"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      +[SignificantActivityFcos URLOfModelInThisBundle].cold.1();
    v4 = 0;
  }

  return v4;
}

- (SignificantActivityFcos)initWithMLModel:(id)a3
{
  id v5;
  SignificantActivityFcos *v6;
  SignificantActivityFcos *v7;
  SignificantActivityFcos *v8;
  objc_super v10;

  v5 = a3;
  if (v5)
  {
    v10.receiver = self;
    v10.super_class = (Class)SignificantActivityFcos;
    v6 = -[SignificantActivityFcos init](&v10, sel_init);
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

- (SignificantActivityFcos)init
{
  void *v3;
  SignificantActivityFcos *v4;

  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SignificantActivityFcos initWithContentsOfURL:error:](self, "initWithContentsOfURL:error:", v3, 0);

  return v4;
}

- (SignificantActivityFcos)initWithConfiguration:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SignificantActivityFcos *v8;

  v6 = a3;
  objc_msgSend((id)objc_opt_class(), "URLOfModelInThisBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SignificantActivityFcos initWithContentsOfURL:configuration:error:](self, "initWithContentsOfURL:configuration:error:", v7, v6, a4);

  return v8;
}

- (SignificantActivityFcos)initWithContentsOfURL:(id)a3 error:(id *)a4
{
  void *v5;
  SignificantActivityFcos *v6;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    self = -[SignificantActivityFcos initWithMLModel:](self, "initWithMLModel:", v5);
    v6 = self;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (SignificantActivityFcos)initWithContentsOfURL:(id)a3 configuration:(id)a4 error:(id *)a5
{
  void *v6;
  SignificantActivityFcos *v7;

  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:configuration:error:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    self = -[SignificantActivityFcos initWithMLModel:](self, "initWithMLModel:", v6);
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
  v10[2] = __77__SignificantActivityFcos_loadContentsOfURL_configuration_completionHandler___block_invoke;
  v10[3] = &unk_24DBEE5F0;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "loadContentsOfURL:configuration:completionHandler:", a3, a4, v10);

}

void __77__SignificantActivityFcos_loadContentsOfURL_configuration_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  SignificantActivityFcos *v3;
  id v4;

  v4 = a2;
  if (v4)
  {
    v3 = -[SignificantActivityFcos initWithMLModel:]([SignificantActivityFcos alloc], "initWithMLModel:", v4);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

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
  -[SignificantActivityFcos predictionFromFeatures:options:error:](self, "predictionFromFeatures:options:error:", v7, v8, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictionFromFeatures:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  SignificantActivityFcosOutput *v19;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  SignificantActivityFcosOutput *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;

  v8 = a4;
  v9 = a3;
  -[SignificantActivityFcos model](self, "model");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predictionFromFeatures:options:error:", v9, v8, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v37 = [SignificantActivityFcosOutput alloc];
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_class_prob0"));
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "multiArrayValue");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_box0_offset0"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "multiArrayValue");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_box1_offset0"));
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "multiArrayValue");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_object_roll0"));
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "multiArrayValue");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_object_yaw0"));
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "multiArrayValue");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_class_prob1"));
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "multiArrayValue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_box0_offset1"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "multiArrayValue");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_box1_offset1"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "multiArrayValue");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_object_roll1"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "multiArrayValue");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_object_yaw1"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "multiArrayValue");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_class_prob2"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "multiArrayValue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_box0_offset2"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "multiArrayValue");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_box1_offset2"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "multiArrayValue");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_object_roll2"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "multiArrayValue");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_object_yaw2"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "multiArrayValue");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_class_prob3"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "multiArrayValue");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_box0_offset3"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "multiArrayValue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_box1_offset3"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "multiArrayValue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_object_roll3"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "multiArrayValue");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_object_yaw3"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "multiArrayValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_class_prob4"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "multiArrayValue");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_box0_offset4"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "multiArrayValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_box1_offset4"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "multiArrayValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_object_roll4"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "multiArrayValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "featureValueForName:", CFSTR("HomeSSD_object_yaw4"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "multiArrayValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SignificantActivityFcosOutput initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:](v37, "initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:", v64, v63, v62, v61, v60, v59, v58, v57, v56, v55, v54, v53, v52,
            v50,
            v51,
            v49,
            v25,
            v48,
            v22,
            v12,
            v21,
            v13,
            v14,
            v16,
            v18);

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
  -[SignificantActivityFcos model](self, "model");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __68__SignificantActivityFcos_predictionFromFeatures_completionHandler___block_invoke;
  v10[3] = &unk_24DBEE618;
  v11 = v6;
  v9 = v6;
  objc_msgSend(v8, "predictionFromFeatures:completionHandler:", v7, v10);

}

void __68__SignificantActivityFcos_predictionFromFeatures_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SignificantActivityFcosOutput *v13;
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD, SignificantActivityFcosOutput *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SignificantActivityFcosOutput *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;

  v61 = a2;
  if (v61)
  {
    v43 = a1;
    v42 = a3;
    v31 = [SignificantActivityFcosOutput alloc];
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_class_prob0"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "multiArrayValue");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box0_offset0"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "multiArrayValue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box1_offset0"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "multiArrayValue");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_roll0"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "multiArrayValue");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_yaw0"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "multiArrayValue");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_class_prob1"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "multiArrayValue");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box0_offset1"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "multiArrayValue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box1_offset1"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "multiArrayValue");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_roll1"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "multiArrayValue");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_yaw1"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "multiArrayValue");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_class_prob2"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "multiArrayValue");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box0_offset2"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "multiArrayValue");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box1_offset2"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "multiArrayValue");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_roll2"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "multiArrayValue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_yaw2"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "multiArrayValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_class_prob3"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "multiArrayValue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box0_offset3"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "multiArrayValue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box1_offset3"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "multiArrayValue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_roll3"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "multiArrayValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_yaw3"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "multiArrayValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_class_prob4"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "multiArrayValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box0_offset4"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "multiArrayValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box1_offset4"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_roll4"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "multiArrayValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_yaw4"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "multiArrayValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SignificantActivityFcosOutput initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:](v31, "initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:", v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v49, v47,
            v48,
            v20,
            v46,
            v45,
            v44,
            v17,
            v5,
            v6,
            v16,
            v8,
            v10,
            v12);

    (*(void (**)(void))(*(_QWORD *)(v43 + 32) + 16))();
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void (**)(uint64_t, _QWORD, SignificantActivityFcosOutput *))(v14 + 16);
    v13 = a3;
    v15(v14, 0, v13);
  }

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
  -[SignificantActivityFcos model](self, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__SignificantActivityFcos_predictionFromFeatures_options_completionHandler___block_invoke;
  v13[3] = &unk_24DBEE618;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v11, "predictionFromFeatures:options:completionHandler:", v10, v9, v13);

}

void __76__SignificantActivityFcos_predictionFromFeatures_options_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SignificantActivityFcosOutput *v13;
  uint64_t v14;
  void (*v15)(uint64_t, _QWORD, SignificantActivityFcosOutput *);
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SignificantActivityFcosOutput *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;

  v61 = a2;
  if (v61)
  {
    v43 = a1;
    v42 = a3;
    v31 = [SignificantActivityFcosOutput alloc];
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_class_prob0"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "multiArrayValue");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box0_offset0"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "multiArrayValue");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box1_offset0"));
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "multiArrayValue");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_roll0"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "multiArrayValue");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_yaw0"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "multiArrayValue");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_class_prob1"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "multiArrayValue");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box0_offset1"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "multiArrayValue");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box1_offset1"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "multiArrayValue");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_roll1"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "multiArrayValue");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_yaw1"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "multiArrayValue");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_class_prob2"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "multiArrayValue");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box0_offset2"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "multiArrayValue");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box1_offset2"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "multiArrayValue");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_roll2"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "multiArrayValue");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_yaw2"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "multiArrayValue");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_class_prob3"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "multiArrayValue");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box0_offset3"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "multiArrayValue");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box1_offset3"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "multiArrayValue");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_roll3"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "multiArrayValue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_yaw3"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "multiArrayValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_class_prob4"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "multiArrayValue");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box0_offset4"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "multiArrayValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_box1_offset4"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "multiArrayValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_roll4"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "multiArrayValue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "featureValueForName:", CFSTR("HomeSSD_object_yaw4"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "multiArrayValue");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[SignificantActivityFcosOutput initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:](v31, "initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:", v60, v59, v58, v57, v56, v55, v54, v53, v52, v51, v50, v49, v47,
            v48,
            v20,
            v46,
            v45,
            v44,
            v17,
            v5,
            v6,
            v16,
            v8,
            v10,
            v12);

    (*(void (**)(void))(*(_QWORD *)(v43 + 32) + 16))();
  }
  else
  {
    v14 = *(_QWORD *)(a1 + 32);
    v15 = *(void (**)(uint64_t, _QWORD, SignificantActivityFcosOutput *))(v14 + 16);
    v13 = a3;
    v15(v14, 0, v13);
  }

}

- (id)predictionFromImage_Placeholder:(__CVBuffer *)a3 error:(id *)a4
{
  SignificantActivityFcosInput *v6;
  void *v7;

  v6 = -[SignificantActivityFcosInput initWithImage_Placeholder:]([SignificantActivityFcosInput alloc], "initWithImage_Placeholder:", a3);
  -[SignificantActivityFcos predictionFromFeatures:error:](self, "predictionFromFeatures:error:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
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
  void *v22;
  void *v23;
  uint64_t v24;
  void *v26;
  id v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  SignificantActivityFcosOutput *v45;
  SignificantActivityFcosOutput *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;

  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFF60]), "initWithFeatureProviderArray:", v8);
  -[SignificantActivityFcos model](self, "model");
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
      v29 = v13;
      v14 = 0;
      v30 = v12;
      do
      {
        v75 = v14;
        objc_msgSend(v12, "featuresAtIndex:", v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = [SignificantActivityFcosOutput alloc];
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_class_prob0"));
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "multiArrayValue");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_box0_offset0"));
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "multiArrayValue");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_box1_offset0"));
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "multiArrayValue");
        v72 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_object_roll0"));
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "multiArrayValue");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_object_yaw0"));
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "multiArrayValue");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_class_prob1"));
        v52 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "multiArrayValue");
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_box0_offset1"));
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v51, "multiArrayValue");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_box1_offset1"));
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "multiArrayValue");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_object_roll1"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "multiArrayValue");
        v66 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_object_yaw1"));
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "multiArrayValue");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_class_prob2"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "multiArrayValue");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_box0_offset2"));
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "multiArrayValue");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_box1_offset2"));
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "multiArrayValue");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_object_roll2"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "multiArrayValue");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_object_yaw2"));
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "multiArrayValue");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_class_prob3"));
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "multiArrayValue");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_box0_offset3"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "multiArrayValue");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_box1_offset3"));
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "multiArrayValue");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_object_roll3"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "multiArrayValue");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_object_yaw3"));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "multiArrayValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_class_prob4"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "multiArrayValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_box0_offset4"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "multiArrayValue");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_box1_offset4"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "multiArrayValue");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_object_roll4"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "multiArrayValue");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "featureValueForName:", CFSTR("HomeSSD_object_yaw4"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "multiArrayValue");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[SignificantActivityFcosOutput initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:](v45, "initWithHomeSSD_class_prob0:HomeSSD_box0_offset0:HomeSSD_box1_offset0:HomeSSD_object_roll0:HomeSSD_object_yaw0:HomeSSD_class_prob1:HomeSSD_box0_offset1:HomeSSD_box1_offset1:HomeSSD_object_roll1:HomeSSD_object_yaw1:HomeSSD_class_prob2:HomeSSD_box0_offset2:HomeSSD_box1_offset2:HomeSSD_object_roll2:HomeSSD_object_yaw2:HomeSSD_class_prob3:HomeSSD_box0_offset3:HomeSSD_box1_offset3:HomeSSD_object_roll3:HomeSSD_object_yaw3:HomeSSD_class_prob4:HomeSSD_box0_offset4:HomeSSD_box1_offset4:HomeSSD_object_roll4:HomeSSD_object_yaw4:", v74, v73, v72, v71, v70, v69, v68, v67, v66, v65, v64, v63, v62,
                v61,
                v60,
                v58,
                v59,
                v33,
                v31,
                v16,
                v17,
                v18,
                v19,
                v21,
                v23);

        v13 = v29;
        v12 = v30;

        objc_msgSend(v29, "addObject:", v46);
        v24 = objc_msgSend(v30, "count");
        v14 = v75 + 1;
      }
      while (v75 + 1 < v24);
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
  _os_log_error_impl(&dword_219D45000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Could not load SignificantActivityFcos.mlmodelc in the bundle resource", v0, 2u);
}

@end
