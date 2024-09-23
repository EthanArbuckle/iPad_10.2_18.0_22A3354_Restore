@implementation NLModelImplL

- (NLModelImplL)initWithOwnedModelObject:(const void *)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 numberOfTrainingInstances:(unint64_t)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NLModelImplL *v18;
  NLModelConfiguration *v19;
  NLModelConfiguration *configuration;
  NSDictionary *v21;
  NSDictionary *labelMap;
  NSDictionary *v23;
  NSDictionary *vocabularyMap;
  NSDictionary *v25;
  NSDictionary *documentFrequencyMap;
  objc_super v28;

  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (a3)
  {
    v28.receiver = self;
    v28.super_class = (Class)NLModelImplL;
    v18 = -[NLModelImplL init](&v28, sel_init);
    self = v18;
    if (v18)
    {
      v18->_maxEntModel = a3;
      v19 = (NLModelConfiguration *)objc_msgSend(v14, "copy");
      configuration = self->_configuration;
      self->_configuration = v19;

      v21 = (NSDictionary *)objc_msgSend(v15, "copy");
      labelMap = self->_labelMap;
      self->_labelMap = v21;

      v23 = (NSDictionary *)objc_msgSend(v16, "copy");
      vocabularyMap = self->_vocabularyMap;
      self->_vocabularyMap = v23;

      v25 = (NSDictionary *)objc_msgSend(v17, "copy");
      documentFrequencyMap = self->_documentFrequencyMap;
      self->_documentFrequencyMap = v25;

      self->_numberOfTrainingInstances = a8;
    }
  }

  return self;
}

- (NLModelImplL)initWithModelData:(id)a3 configuration:(id)a4 labelMap:(id)a5 vocabularyMap:(id)a6 documentFrequencyMap:(id)a7 customEmbeddingData:(id)a8 trainingInfo:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t MaxEntModelFromData;
  uint64_t v21;
  NLModelImplL *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a9;
  MaxEntModelFromData = createMaxEntModelFromData(a3);
  v21 = unsignedIntegerForKey(v19, 0x1E4A3BC90, 0);

  if (MaxEntModelFromData)
  {
    self = -[NLModelImplL initWithOwnedModelObject:configuration:labelMap:vocabularyMap:documentFrequencyMap:numberOfTrainingInstances:](self, "initWithOwnedModelObject:configuration:labelMap:vocabularyMap:documentFrequencyMap:numberOfTrainingInstances:", MaxEntModelFromData, v15, v16, v17, v18, v21);
    v22 = self;
  }
  else
  {
    if (a10)
    {
      v23 = (void *)MEMORY[0x1E0CB35C8];
      v26 = *MEMORY[0x1E0CB2D50];
      v27[0] = CFSTR("Failed to load model file, invalid MaxEnt model data");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 1, v24);
      *a10 = (id)objc_claimAutoreleasedReturnValue();

    }
    v22 = 0;
  }

  return v22;
}

- (NLModelImplL)initWithModelTrainer:(id)a3 error:(id *)a4
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
  unint64_t v13;
  uint64_t MaxEntModelFromTrainingDataSet;
  NLModelImplL *v15;
  _OWORD v18[3];

  v4 = a3;
  objc_msgSend(v4, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dataSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = xmmword_1A36F74D0;
  v18[1] = vdupq_n_s64(0x400uLL);
  v18[2] = xmmword_1A36F74E0;
  +[NLDataSet dataSetWithDataSet:constraintParameters:modelTrainer:](NLDataSet, "dataSetWithDataSet:constraintParameters:modelTrainer:", v6, v18, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "inverseLabelMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "vocabularyMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "documentFrequencyMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "numberOfTrainingInstances");
  objc_msgSend(v4, "options");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = unsignedIntegerForKey(v12, (uint64_t)CFSTR("MaximumIterations"), 150);

  MaxEntModelFromTrainingDataSet = createMaxEntModelFromTrainingDataSet(v7, v4, v13);
  v15 = -[NLModelImplL initWithOwnedModelObject:configuration:labelMap:vocabularyMap:documentFrequencyMap:numberOfTrainingInstances:](self, "initWithOwnedModelObject:configuration:labelMap:vocabularyMap:documentFrequencyMap:numberOfTrainingInstances:", MaxEntModelFromTrainingDataSet, v5, v8, v9, v10, v11);

  return v15;
}

- (void)dealloc
{
  ME_Model *maxEntModel;
  objc_super v4;

  maxEntModel = (ME_Model *)self->_maxEntModel;
  if (maxEntModel)
    releaseMaxEntModel(maxEntModel);
  v4.receiver = self;
  v4.super_class = (Class)NLModelImplL;
  -[NLModelImplL dealloc](&v4, sel_dealloc);
}

- (id)modelData
{
  _QWORD *maxEntModel;

  maxEntModel = self->_maxEntModel;
  if (maxEntModel)
  {
    dataFromMaxEntModel(maxEntModel);
    maxEntModel = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return maxEntModel;
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
  ME_Model *maxEntModel;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  maxEntModel = (ME_Model *)self->_maxEntModel;
  v5 = a3;
  -[NLModelImplL labelMap](self, "labelMap");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplL vocabularyMap](self, "vocabularyMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplL documentFrequencyMap](self, "documentFrequencyMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  predictedMaxEntModelLabelForString(maxEntModel, v6, v7, v8, (NSDictionary *)-[NLModelImplL numberOfTrainingInstances](self, "numberOfTrainingInstances"), v5);
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
  -[NLModelImplL predictedLabelForString:](self, "predictedLabelForString:", v5);
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
  ME_Model *maxEntModel;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  maxEntModel = (ME_Model *)self->_maxEntModel;
  v7 = a3;
  -[NLModelImplL labelMap](self, "labelMap");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplL vocabularyMap](self, "vocabularyMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelImplL documentFrequencyMap](self, "documentFrequencyMap");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  predictedMaxEntModelLabelHypothesesForString(maxEntModel, v8, v9, v10, (NSDictionary *)-[NLModelImplL numberOfTrainingInstances](self, "numberOfTrainingInstances"), v7);
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
  -[NLModelImplL predictedLabelHypothesesForString:maximumCount:](self, "predictedLabelHypothesesForString:maximumCount:", v7, a4);
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
  objc_storeStrong((id *)&self->_documentFrequencyMap, 0);
  objc_storeStrong((id *)&self->_vocabularyMap, 0);
  objc_storeStrong((id *)&self->_labelMap, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
