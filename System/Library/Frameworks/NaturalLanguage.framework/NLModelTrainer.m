@implementation NLModelTrainer

- (NLModelTrainer)initWithConfiguration:(id)a3 dataSet:(id)a4 options:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NLModelTrainer *v14;
  uint64_t v15;
  NLModelConfiguration *configuration;
  uint64_t v17;
  NSDictionary *options;
  char v19;
  NLModelTrainer *v20;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v22.receiver = self;
    v22.super_class = (Class)NLModelTrainer;
    v14 = -[NLModelTrainer init](&v22, sel_init);
    if (v14)
    {
      v15 = objc_msgSend(v10, "copy");
      configuration = v14->_configuration;
      v14->_configuration = (NLModelConfiguration *)v15;

      objc_storeStrong((id *)&v14->_dataSet, a4);
      v17 = objc_msgSend(v12, "copy");
      options = v14->_options;
      v14->_options = (NSDictionary *)v17;

      objc_storeStrong((id *)&v14->_delegate, a6);
      if (v13)
      {
        v14->_delegateRespondsToLogMessage = objc_opt_respondsToSelector() & 1;
        v19 = objc_opt_respondsToSelector();
      }
      else
      {
        v19 = 0;
        v14->_delegateRespondsToLogMessage = 0;
      }
      v14->_delegateRespondsToShouldStop = v19 & 1;
    }
    self = v14;
    v20 = self;
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

+ (id)modelTrainerWithConfiguration:(id)a3 dataSet:(id)a4 options:(id)a5 delegate:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithConfiguration:dataSet:options:delegate:", v13, v12, v11, v10);

  return v14;
}

- (NLModelConfiguration)configuration
{
  return self->_configuration;
}

- (NLDataSet)dataSet
{
  return self->_dataSet;
}

- (NSDictionary)options
{
  return self->_options;
}

- (NLModelTrainerDelegate)delegate
{
  return self->_delegate;
}

- (Class)modelImplClass
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  objc_class *v15;

  -[NLModelTrainer configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "options");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  BOOLForKeyWithDefault(v4, CFSTR("UseCRF"));

  -[NLModelTrainer configuration](self, "configuration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "options");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  BOOLForKeyWithDefault(v6, CFSTR("UseRNN"));

  -[NLModelTrainer configuration](self, "configuration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "options");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  BOOLForKeyWithDefault(v8, CFSTR("UseTransfer"));

  getenv("NLUseCRFSuiteMaxEnt");
  -[NLModelTrainer configuration](self, "configuration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "options");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Algorithm"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v11, "isEqualToString:", CFSTR("CRF"));
    objc_msgSend(v11, "isEqualToString:", CFSTR("RNN"));
    objc_msgSend(v11, "isEqualToString:", CFSTR("Transfer"));
  }
  -[NLModelTrainer configuration](self, "configuration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "type");

  if (v13 > 1)
    v14 = 0;
  else
    v14 = (void *)objc_opt_class();
  v15 = v14;

  return v15;
}

- (void)trainModel
{
  void *v3;
  id v4;
  void *v5;
  NLModel *v6;
  void *v7;
  NLModel *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v3 = (void *)objc_msgSend(objc_alloc(-[NLModelTrainer modelImplClass](self, "modelImplClass")), "initWithModelTrainer:error:", self, &v11);
  v4 = v11;
  v5 = v4;
  if (v3)
  {
    v6 = [NLModel alloc];
    -[NLModelTrainer configuration](self, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[NLModel initWithConfiguration:modelImpl:](v6, "initWithConfiguration:modelImpl:", v7, v3);

    -[NLModelTrainer setModel:](self, "setModel:", v8);
  }
  else
  {
    if (!v4)
    {
      v9 = (void *)MEMORY[0x1E0CB35C8];
      v12 = *MEMORY[0x1E0CB2D50];
      v13[0] = CFSTR("Failed to train model");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("NLNaturalLanguageErrorDomain"), 9, v10);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

    }
    -[NLModelTrainer setTrainingError:](self, "setTrainingError:", v5);
  }

}

- (id)model
{
  return self->_model;
}

- (void)setModel:(id)a3
{
  objc_storeStrong((id *)&self->_model, a3);
}

- (NSError)trainingError
{
  return self->_trainingError;
}

- (void)setTrainingError:(id)a3
{
  objc_storeStrong((id *)&self->_trainingError, a3);
}

- (NLModel)trainedModel
{
  NLModel *model;
  void *v4;
  void *v5;

  model = self->_model;
  if (!model)
  {
    if (self->_trainingError)
    {
      model = 0;
    }
    else
    {
      -[NLModelTrainer logMessage:](self, "logMessage:", CFSTR("Tokenizing data and extracting features"));
      -[NLModelTrainer dataSet](self, "dataSet");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dataProviderOfType:", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "generateMapsWithModelTrainer:", self);

      -[NLModelTrainer trainModel](self, "trainModel");
      model = self->_model;
    }
  }
  return model;
}

- (NSDictionary)testResults
{
  void *v3;
  void *v4;
  void *v5;

  -[NLModelTrainer model](self, "model");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NLModelTrainer dataSet](self, "dataSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "testResultsWithDataSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (void)logMessage:(id)a3
{
  if (self->_delegateRespondsToLogMessage)
    -[NLModelTrainerDelegate modelTrainer:logMessage:](self->_delegate, "modelTrainer:logMessage:", self, a3);
}

- (void)trainer:(id)a3 logMessage:(id)a4
{
  -[NLModelTrainer logMessage:](self, "logMessage:", a4);
}

- (BOOL)shouldStop
{
  if (self->_delegateRespondsToShouldStop)
    return -[NLModelTrainerDelegate modelTrainerShouldStop:](self->_delegate, "modelTrainerShouldStop:", self);
  else
    return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_trainingError, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_dataSet, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
