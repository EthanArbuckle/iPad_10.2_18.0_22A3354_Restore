@implementation NLDataSet

- (NLDataSet)initWithConfiguration:(id)a3 trainingDataProvider:(id)a4 validationDataProvider:(id)a5 testDataProvider:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NLDataSet *v14;
  uint64_t v15;
  NLModelConfiguration *configuration;
  objc_super v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v18.receiver = self;
  v18.super_class = (Class)NLDataSet;
  v14 = -[NLDataSet init](&v18, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    configuration = v14->_configuration;
    v14->_configuration = (NLModelConfiguration *)v15;

    objc_storeStrong((id *)&v14->_trainingDataProvider, a4);
    objc_storeStrong((id *)&v14->_validationDataProvider, a5);
    objc_storeStrong((id *)&v14->_testDataProvider, a6);
  }

  return v14;
}

- (NLDataSet)initWithConfiguration:(id)a3 trainingDataURL:(id)a4 validationDataURL:(id)a5 testDataURL:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NLDataProvider *v14;
  NLDataProvider *v15;
  NLDataProvider *v16;
  NLDataSet *v17;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[NLDataProvider initWithConfiguration:dataURL:]([NLDataProvider alloc], "initWithConfiguration:dataURL:", v13, v12);

  v15 = -[NLDataProvider initWithConfiguration:dataURL:]([NLDataProvider alloc], "initWithConfiguration:dataURL:", v13, v11);
  v16 = -[NLDataProvider initWithConfiguration:dataURL:]([NLDataProvider alloc], "initWithConfiguration:dataURL:", v13, v10);

  v17 = -[NLDataSet initWithConfiguration:trainingDataProvider:validationDataProvider:testDataProvider:](self, "initWithConfiguration:trainingDataProvider:validationDataProvider:testDataProvider:", v13, v14, v15, v16);
  return v17;
}

- (NLDataSet)initWithConfiguration:(id)a3 dataProvider:(id)a4 validationSplit:(double)a5 testingSplit:(double)a6
{
  id v10;
  id v11;
  void *v12;
  NLSplitDataProvider *v13;
  void *v14;
  NLSplitDataProvider *v15;
  NLSplitDataProvider *v16;
  void *v17;
  NLSplitDataProvider *v18;
  NLSplitDataProvider *v19;
  void *v20;
  NLSplitDataProvider *v21;
  NLDataSet *v22;

  v10 = a4;
  v11 = a3;
  splitIndexes(objc_msgSend(v10, "numberOfInstances"), a5, a6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [NLSplitDataProvider alloc];
  objc_msgSend(v12, "objectAtIndex:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[NLSplitDataProvider initWithDataProvider:indexes:](v13, "initWithDataProvider:indexes:", v10, v14);

  v16 = [NLSplitDataProvider alloc];
  objc_msgSend(v12, "objectAtIndex:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[NLSplitDataProvider initWithDataProvider:indexes:](v16, "initWithDataProvider:indexes:", v10, v17);

  v19 = [NLSplitDataProvider alloc];
  objc_msgSend(v12, "objectAtIndex:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = -[NLSplitDataProvider initWithDataProvider:indexes:](v19, "initWithDataProvider:indexes:", v10, v20);

  v22 = -[NLDataSet initWithConfiguration:trainingDataProvider:validationDataProvider:testDataProvider:](self, "initWithConfiguration:trainingDataProvider:validationDataProvider:testDataProvider:", v11, v15, v18, v21);
  return v22;
}

+ (id)dataSetWithDataSet:(id)a3 constraintParameters:(_NLConstraintParameters *)a4 modelTrainer:(id)a5
{
  id v7;
  id v8;
  NLConstrainedDataProvider *v9;
  void *v10;
  __int128 v11;
  NLConstrainedDataProvider *v12;
  void *v13;
  void *v14;
  NLDataSet *v15;
  void *v16;
  NLDataSet *v17;
  _OWORD v19[3];

  v7 = a5;
  v8 = a3;
  v9 = [NLConstrainedDataProvider alloc];
  objc_msgSend(v8, "dataProviderOfType:", 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)&a4->maxSplitTokens;
  v19[0] = *(_OWORD *)&a4->splitSentences;
  v19[1] = v11;
  v19[2] = *(_OWORD *)&a4->maxLabels;
  v12 = -[NLConstrainedDataProvider initWithDataProvider:parameters:modelTrainer:](v9, "initWithDataProvider:parameters:modelTrainer:", v10, v19, v7);

  objc_msgSend(v8, "dataProviderOfType:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataProviderOfType:", 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = [NLDataSet alloc];
  objc_msgSend(v8, "configuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[NLDataSet initWithConfiguration:trainingDataProvider:validationDataProvider:testDataProvider:](v15, "initWithConfiguration:trainingDataProvider:validationDataProvider:testDataProvider:", v16, v12, v13, v14);
  return v17;
}

- (NLModelConfiguration)configuration
{
  return self->_configuration;
}

- (id)dataProviderOfType:(int64_t)a3
{
  if ((unint64_t)a3 <= 2)
    self = (NLDataSet *)*((id *)&self->_trainingDataProvider + a3);
  return self;
}

- (unint64_t)numberOfTrainingInstances
{
  void *v2;
  unint64_t v3;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfInstances");

  return v3;
}

- (unint64_t)numberOfValidationInstances
{
  void *v2;
  unint64_t v3;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfInstances");

  return v3;
}

- (unint64_t)numberOfTestInstances
{
  void *v2;
  unint64_t v3;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfInstances");

  return v3;
}

- (id)trainingInstanceAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instanceAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)validationInstanceAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instanceAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)testInstanceAtIndex:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "instanceAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)labelMap
{
  void *v2;
  void *v3;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "labelMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)inverseLabelMap
{
  void *v2;
  void *v3;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inverseLabelMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)vocabularyMap
{
  void *v2;
  void *v3;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "vocabularyMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)documentFrequencyMap
{
  void *v2;
  void *v3;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "documentFrequencyMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)numberOfLabels
{
  void *v2;
  unint64_t v3;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfLabels");

  return v3;
}

- (unint64_t)numberOfVocabularyEntries
{
  void *v2;
  unint64_t v3;

  -[NLDataSet dataProviderOfType:](self, "dataProviderOfType:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfVocabularyEntries");

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_testDataProvider, 0);
  objc_storeStrong((id *)&self->_validationDataProvider, 0);
  objc_storeStrong((id *)&self->_trainingDataProvider, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
