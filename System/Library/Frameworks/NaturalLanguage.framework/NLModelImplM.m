@implementation NLModelImplM

- (NLModelImplM)initWithOwnedModelObject:(const void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 numberOfTrainingInstances:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  NLModelImplM *v15;
  NLModelConfiguration *v16;
  NLModelConfiguration *configuration;
  NSDictionary *v18;
  NSDictionary *labelMap;
  NSDictionary *v20;
  NSDictionary *vocabularyMap;
  objc_super v23;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (a3)
  {
    v23.receiver = self;
    v23.super_class = (Class)NLModelImplM;
    v15 = -[NLModelImplM init](&v23, sel_init);
    self = v15;
    if (v15)
    {
      v15->_mrlModel = a3;
      v16 = (NLModelConfiguration *)objc_msgSend(v12, "copy");
      configuration = self->_configuration;
      self->_configuration = v16;

      v18 = (NSDictionary *)objc_msgSend(v13, "copy");
      labelMap = self->_labelMap;
      self->_labelMap = v18;

      v20 = (NSDictionary *)objc_msgSend(v14, "copy");
      vocabularyMap = self->_vocabularyMap;
      self->_vocabularyMap = v20;

      self->_numberOfTrainingInstances = a7;
    }
  }

  return self;
}

- (NLModelImplM)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  id v14;
  id v15;
  id v16;
  id v17;
  uint64_t MRLModelFromData;
  uint64_t v19;
  NLModelImplM *v20;
  void *v21;
  void *v22;
  uint64_t v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a9;
  MRLModelFromData = createMRLModelFromData(a3);
  v19 = unsignedIntegerForKey(v17, 0x1E4A3BC90, 0);

  if (MRLModelFromData)
  {
    self = -[NLModelImplM initWithOwnedModelObject:configuration:labelMap:vocabularyMap:numberOfTrainingInstances:](self, "initWithOwnedModelObject:configuration:labelMap:vocabularyMap:numberOfTrainingInstances:", MRLModelFromData, v14, v15, v16, v19);
    v20 = self;
  }
  else
  {
    if (a10)
    {
      v21 = (void *)MEMORY[0x1E0CB35C8];
      v24 = *MEMORY[0x1E0CB2D50];
      v25[0] = CFSTR("Failed to load model file, invalid RNN model data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v22);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v20 = 0;
  }

  return v20;
}

- (NLModelImplM)initWithModelTrainer:(id)a3 error:(id *)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t MRLModelFromTrainingDataSet;
  NLModelImplM *v15;
  _BYTE v18[8];
  __int128 v19;
  __int128 v20;
  uint64_t v21;

  memset(&v18[1], 0, 7);
  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = 1;
  v19 = xmmword_1A36F7910;
  v20 = xmmword_1A36F7920;
  v21 = 0x7FFFLL;
  +[NLDataSet dataSetWithDataSet:constraintParameters:modelTrainer:](NLDataSet, "dataSetWithDataSet:constraintParameters:modelTrainer:", v6, v18, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inverseLabelMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vocabularyMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "numberOfTrainingInstances");
  objc_msgSend(v4, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = BOOLForKeyWithDefault(v12, CFSTR("UseBidirectionalNeuralNetwork"));

  MRLModelFromTrainingDataSet = createMRLModelFromTrainingDataSet(v7, v13, v10, v4);
  v15 = -[NLModelImplM initWithOwnedModelObject:configuration:labelMap:vocabularyMap:numberOfTrainingInstances:](self, "initWithOwnedModelObject:configuration:labelMap:vocabularyMap:numberOfTrainingInstances:", MRLModelFromTrainingDataSet, v5, v8, v9, v10);

  return v15;
}

- (void)dealloc
{
  const void *mrlModel;
  objc_super v4;

  mrlModel = self->_mrlModel;
  if (mrlModel)
    releaseMRLModel(mrlModel);
  v4.receiver = self;
  v4.super_class = (Class)NLModelImplM;
  -[NLModelImplM dealloc](&v4, sel_dealloc);
}

- (id)modelData
{
  void *mrlModel;

  mrlModel = (void *)self->_mrlModel;
  if (mrlModel)
  {
    dataFromMRLModel();
    mrlModel = (void *)objc_claimAutoreleasedReturnValue();
  }
  return mrlModel;
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

- (unint64_t)numberOfTrainingInstances
{
  return self->_numberOfTrainingInstances;
}

- (id)predictedLabelForString:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  const void *mrlModel;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  -[NLModelImplM configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = BOOLForKeyWithDefault(v6, CFSTR("UseBidirectionalNeuralNetwork"));

  mrlModel = self->_mrlModel;
  -[NLModelImplM labelMap](self, "labelMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplM vocabularyMap](self, "vocabularyMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  predictedMRLModelLabelForString(mrlModel, v7, v9, v10, v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  -[NLModelImplM predictedLabelForString:](self, "predictedLabelForString:", v5);
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
  id v6;
  void *v7;
  void *v8;
  int v9;
  const void *mrlModel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  -[NLModelImplM configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = BOOLForKeyWithDefault(v8, CFSTR("UseBidirectionalNeuralNetwork"));

  mrlModel = self->_mrlModel;
  -[NLModelImplM labelMap](self, "labelMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplM vocabularyMap](self, "vocabularyMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  predictedMRLModelLabelHypothesesForString(mrlModel, v9, v11, v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  topHypotheses(v13, a4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
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
  -[NLModelImplM predictedLabelHypothesesForString:maximumCount:](self, "predictedLabelHypothesesForString:maximumCount:", v7, a4);
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
  objc_storeStrong((id *)&self->_vocabularyMap, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
