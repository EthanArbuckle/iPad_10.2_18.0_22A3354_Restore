@implementation HMIFaceQualityFilterSVM

+ (id)dataScalerInputName
{
  return CFSTR("input");
}

+ (id)dataScalerOutputName
{
  return CFSTR("transformed_features");
}

+ (id)svmInputName
{
  return CFSTR("input");
}

+ (id)svmOutputName
{
  return CFSTR("classProbability");
}

- (HMIFaceQualityFilterSVM)initWithModelPath:(id)a3 dataScalerPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  HMIFaceQualityFilterSVM *v10;
  void *v11;
  uint64_t v12;
  id v13;
  MLModel *mlModel;
  void *v15;
  uint64_t v16;
  id v17;
  MLModel *scalerModel;
  HMIFaceQualityFilterSVM *v19;
  id v21;
  id v22;
  objc_super v23;

  v8 = a3;
  v9 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HMIFaceQualityFilterSVM;
  v10 = -[HMIFaceQualityFilterSVM init](&v23, sel_init);
  if (!v10)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v11, &v22);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v22;
  mlModel = v10->_mlModel;
  v10->_mlModel = (MLModel *)v12;

  if (v10->_mlModel)
  {
    objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = v13;
    objc_msgSend(MEMORY[0x24BDBFFC8], "modelWithContentsOfURL:error:", v15, &v21);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v21;

    scalerModel = v10->_scalerModel;
    v10->_scalerModel = (MLModel *)v16;

    if (v10->_scalerModel)
    {

LABEL_5:
      v19 = v10;
      goto LABEL_10;
    }
    v13 = v17;
    v11 = v15;
  }
  if (a5)
  {
    v13 = objc_retainAutorelease(v13);
    *a5 = v13;
  }
  HMIErrorLog(v10, v13);

  v19 = 0;
LABEL_10:

  return v19;
}

- (BOOL)predict:(id)a3 output:(double *)a4 error:(id *)a5
{
  id v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  HMIFaceQualityFilterModelInput *v18;
  void *v19;
  HMIFaceQualityFilterModelInput *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  uint64_t v26;
  HMIFaceQualityFilterModelInput *v27;
  void *v28;
  HMIFaceQualityFilterModelInput *v29;
  void *v30;
  void *v31;
  id v32;
  BOOL v33;
  BOOL v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  double *v45;
  void *v46;
  void *v47;
  id v48;
  id v49;

  v8 = a3;
  objc_msgSend(v8, "objectAtIndexedSubscript:", 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "doubleValue");
  v11 = fabs(v10);

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v12, 2);

  objc_msgSend(v8, "objectAtIndexedSubscript:", 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "doubleValue");
  v15 = v14;

  v16 = 100000.0;
  if (v15 <= 100000.0)
    v16 = v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:atIndexedSubscript:", v17, 3);

  v18 = [HMIFaceQualityFilterModelInput alloc];
  +[HMIFaceQualityFilterSVM dataScalerInputName](HMIFaceQualityFilterSVM, "dataScalerInputName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[HMIFaceQualityFilterModelInput initWithInput:inputName:](v18, "initWithInput:inputName:", v8, v19);

  -[HMIFaceQualityFilterSVM scalerModel](self, "scalerModel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = 0;
  objc_msgSend(v21, "predictionFromFeatures:error:", v20, &v49);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v49;

  if (!v22 || v23)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1019, v23);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = v40;
    if (a5)
      *a5 = objc_retainAutorelease(v40);
    HMIErrorLog(self, v41);

    v32 = objc_retainAutorelease(v23);
    v34 = 0;
    *a5 = v32;
  }
  else
  {
    v45 = a4;
    +[HMIFaceQualityFilterSVM dataScalerOutputName](HMIFaceQualityFilterSVM, "dataScalerOutputName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "featureValueForName:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v47 = v25;
    objc_msgSend(v25, "multiArrayValue");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = [HMIFaceQualityFilterModelInput alloc];
    +[HMIFaceQualityFilterSVM svmInputName](HMIFaceQualityFilterSVM, "svmInputName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = (void *)v26;
    v29 = -[HMIFaceQualityFilterModelInput initWithInput:inputName:](v27, "initWithInput:inputName:", v26, v28);

    -[HMIFaceQualityFilterSVM mlModel](self, "mlModel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    objc_msgSend(v30, "predictionFromFeatures:error:", v29, &v48);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v48;

    if (v31)
      v33 = v32 == 0;
    else
      v33 = 0;
    v34 = v33;
    if (v33)
    {
      +[HMIFaceQualityFilterSVM svmOutputName](HMIFaceQualityFilterSVM, "svmOutputName");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "featureValueForName:", v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "dictionaryValue");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v37, "objectForKeyedSubscript:", &unk_24DC145E8);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "doubleValue");
      *(_QWORD *)v45 = v39;

    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "hmiPrivateErrorWithCode:underlyingError:", 1019, v32);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = v42;
      if (a5)
        *a5 = objc_retainAutorelease(v42);
      HMIErrorLog(self, v43);

      *a5 = objc_retainAutorelease(v32);
    }

  }
  return v34;
}

+ (id)modelPathForResource:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDD1488];
  v4 = a3;
  objc_msgSend(v3, "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v4, CFSTR("mlmodelc"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)defaultRecognizabilityModelPath
{
  return (id)objc_msgSend(a1, "modelPathForResource:", CFSTR("FaceRecognizabilityFilterSVM"));
}

+ (id)defaultRecognizabilityDataScalerPath
{
  return (id)objc_msgSend(a1, "modelPathForResource:", CFSTR("FaceRecognizabilityFilterSVMDataScaler"));
}

+ (id)defaultAestheticQualityModelPath
{
  return (id)objc_msgSend(a1, "modelPathForResource:", CFSTR("FaceAestheticQualityFilterSVM"));
}

+ (id)defaultAestheticQualityDataScalerPath
{
  return (id)objc_msgSend(a1, "modelPathForResource:", CFSTR("FaceAestheticQualityFilterSVMDataScaler"));
}

- (MLModel)mlModel
{
  return (MLModel *)objc_getProperty(self, a2, 8, 1);
}

- (MLModel)scalerModel
{
  return (MLModel *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalerModel, 0);
  objc_storeStrong((id *)&self->_mlModel, 0);
}

@end
