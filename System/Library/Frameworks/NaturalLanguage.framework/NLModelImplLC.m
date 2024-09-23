@implementation NLModelImplLC

- (NLModelImplLC)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t CRFSuiteMaxEntModelFromData;
  unint64_t v23;
  NLModelImplLC *v24;
  NLModelConfiguration *v25;
  NLModelConfiguration *configuration;
  NSDictionary *v27;
  NSDictionary *labelMap;
  NSDictionary *v29;
  NSDictionary *vocabularyMap;
  NSDictionary *v31;
  NSDictionary *documentFrequencyMap;
  NLModelImplLC *v33;
  void *v34;
  void *v35;
  objc_super v37;
  uint64_t v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x1E0C80C00];
  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a9;
  CRFSuiteMaxEntModelFromData = createCRFSuiteMaxEntModelFromData(v16);
  v23 = unsignedIntegerForKey(v21, 0x1E4A3BC90, 0);

  if (CRFSuiteMaxEntModelFromData
    && (v37.receiver = self,
        v37.super_class = (Class)NLModelImplLC,
        v24 = -[NLModelImplLC init](&v37, sel_init),
        (self = v24) != 0))
  {
    v24->_maxEntModel = (const void *)CRFSuiteMaxEntModelFromData;
    v25 = (NLModelConfiguration *)objc_msgSend(v17, "copy");
    configuration = self->_configuration;
    self->_configuration = v25;

    v27 = (NSDictionary *)objc_msgSend(v18, "copy");
    labelMap = self->_labelMap;
    self->_labelMap = v27;

    v29 = (NSDictionary *)objc_msgSend(v19, "copy");
    vocabularyMap = self->_vocabularyMap;
    self->_vocabularyMap = v29;

    v31 = (NSDictionary *)objc_msgSend(v20, "copy");
    documentFrequencyMap = self->_documentFrequencyMap;
    self->_documentFrequencyMap = v31;

    self->_numberOfTrainingInstances = v23;
    objc_storeStrong((id *)&self->_modelData, a3);
    self = self;
    v33 = self;
  }
  else
  {
    if (a10)
    {
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v38 = *MEMORY[0x1E0CB2D50];
      v39[0] = CFSTR("Failed to load model file, invalid MaxEnt model data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, &v38, 1);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v35);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v33 = 0;
  }

  return v33;
}

- (NLModelImplLC)initWithModelTrainer:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double Current;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NLModelImplLC *v18;
  _OWORD v21[3];
  __CFString *v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = xmmword_1A36F74D0;
  v21[1] = vdupq_n_s64(0x400uLL);
  v21[2] = xmmword_1A36F74E0;
  +[NLDataSet dataSetWithDataSet:constraintParameters:modelTrainer:](NLDataSet, "dataSetWithDataSet:constraintParameters:modelTrainer:", v6, v21, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inverseLabelMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vocabularyMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentFrequencyMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "numberOfTrainingInstances");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Starting MaxEnt training with %llu samples"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:", v12);

  Current = CFAbsoluteTimeGetCurrent();
  createCRFSuiteMaxEntModelDataFromTrainingDataSet(v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Finished MaxEnt training in %.2f seconds"), CFAbsoluteTimeGetCurrent() - Current);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:", v15);

  v22 = CFSTR("NumberOfTrainingInstances");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[NLModelImplLC initWithModelData:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:error:](self, "initWithModelData:configuration:labelMap:vocabularyMap:documentFrequencyMap:customEmbeddingData:trainingInfo:error:", v14, v5, v8, v9, v10, 0, v17, 0);

  return v18;
}

- (void)dealloc
{
  const void *maxEntModel;
  objc_super v4;

  maxEntModel = self->_maxEntModel;
  if (maxEntModel)
    releaseCRFSuiteMaxEntModel(maxEntModel, a2);
  v4.receiver = self;
  v4.super_class = (Class)NLModelImplLC;
  -[NLModelImplLC dealloc](&v4, sel_dealloc);
}

- (id)modelData
{
  return self->_modelData;
}

- (id)configuration
{
  return self->_configuration;
}

- (id)labelMap
{
  return self->_labelMap;
}

- (id)vocabularyMap
{
  return self->_vocabularyMap;
}

- (id)documentFrequencyMap
{
  return self->_documentFrequencyMap;
}

- (unint64_t)numberOfTrainingInstances
{
  return self->_numberOfTrainingInstances;
}

- (id)predictedLabelForString:(id)a3
{
  const void *maxEntModel;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  maxEntModel = self->_maxEntModel;
  v5 = a3;
  -[NLModelImplLC labelMap](self, "labelMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplLC vocabularyMap](self, "vocabularyMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplLC documentFrequencyMap](self, "documentFrequencyMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  predictedCRFSuiteMaxEntModelLabelForString((uint64_t)maxEntModel, v6, v7, v8, (NSDictionary *)-[NLModelImplLC numberOfTrainingInstances](self, "numberOfTrainingInstances"), v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)predictedLabelsForTokens:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;

  v4 = a3;
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR(" "));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplLC predictedLabelForString:](self, "predictedLabelForString:", v5);
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v8 = 0;
    if (v6)
      v9 = v6;
    else
      v9 = &stru_1E4A3BA10;
    do
    {
      objc_msgSend(v7, "addObject:", v9);
      ++v8;
    }
    while (v8 < objc_msgSend(v4, "count"));
  }

  return v7;
}

- (id)predictedLabelHypothesesForString:(id)a3 maximumCount:(unint64_t)a4
{
  const void *maxEntModel;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  maxEntModel = self->_maxEntModel;
  v7 = a3;
  -[NLModelImplLC labelMap](self, "labelMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplLC vocabularyMap](self, "vocabularyMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplLC documentFrequencyMap](self, "documentFrequencyMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  predictedCRFSuiteMaxEntModelLabelHypothesesForString((uint64_t)maxEntModel, v8, v9, v10, (NSDictionary *)-[NLModelImplLC numberOfTrainingInstances](self, "numberOfTrainingInstances"), v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  topHypotheses(v11, a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)predictedLabelHypothesesForTokens:(id)a3 maximumCount:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;

  v6 = a3;
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR(" "));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplLC predictedLabelHypothesesForString:maximumCount:](self, "predictedLabelHypothesesForString:maximumCount:", v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    v10 = 0;
    if (v8)
      v11 = v8;
    else
      v11 = (void *)MEMORY[0x1E0C9AA70];
    do
    {
      objc_msgSend(v9, "addObject:", v11);
      ++v10;
    }
    while (v10 < objc_msgSend(v6, "count"));
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modelData, 0);
  objc_storeStrong((id *)&self->_documentFrequencyMap, 0);
  objc_storeStrong((id *)&self->_vocabularyMap, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
