@implementation ETModelDefinition

- (ETModelDefinition)initWithInferenceNetworkPath:(id)a3 error:(id *)a4
{
  return -[ETModelDefinition initWithInferenceNetworkPath:inferenceInputs:inferenceOutputs:error:](self, "initWithInferenceNetworkPath:inferenceInputs:inferenceOutputs:error:", a3, MEMORY[0x1E0C9AA60], MEMORY[0x1E0C9AA60], a4);
}

- (ETModelDefinition)initWithInferenceNetworkPath:(id)a3 inferenceInputs:(id)a4 inferenceOutputs:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  ETModelDefinition *v13;
  ETModelDefinition *v14;
  objc_super v16;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v16.receiver = self;
  v16.super_class = (Class)ETModelDefinition;
  v13 = -[ETModelDefinition init](&v16, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_modelURL, a3);
    objc_storeStrong((id *)&v14->_inputs, a4);
    objc_storeStrong((id *)&v14->_outputs, a5);
  }

  return v14;
}

- (ETModelDefinition)initWithTrainingNetworkPath:(id)a3 inferenceInputs:(id)a4 inferenceOutputs:(id)a5 trainingInputs:(id)a6 trainingOutputs:(id)a7 trainingControlVariableName:(id)a8 withInitializer:(id)a9 error:(id *)a10
{
  id v15;
  id v16;
  id v17;
  id v18;
  ETModelDefinition *v19;
  id v20;
  void *v21;
  void *v22;
  ETModelDefinition *v23;
  id v25;
  id v26;
  id v27;
  id v29;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v26 = a6;
  v18 = a7;
  v25 = a8;
  v27 = a9;
  v29 = 0;
  v19 = -[ETModelDefinition initWithInferenceNetworkPath:inferenceInputs:inferenceOutputs:error:]([ETModelDefinition alloc], "initWithInferenceNetworkPath:inferenceInputs:inferenceOutputs:error:", v15, v16, v17, &v29);
  v20 = v29;

  if (v20)
  {
    v21 = v25;
    v22 = v26;
    v23 = 0;
    if (a10)
      *a10 = objc_retainAutorelease(v20);
  }
  else
  {
    if (v19)
    {
      objc_storeStrong((id *)&v19->_trainingInputs, a6);
      objc_storeStrong((id *)&v19->_trainingOutputs, a7);
      objc_storeStrong((id *)&v19->_isTrainingGlobalName, a8);
      objc_storeStrong((id *)&v19->_initializer, a9);
    }
    v23 = v19;
    v21 = v25;
    v22 = v26;
  }

  return v23;
}

- (NSArray)layerNames
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (NSArray)inputs
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)outputs
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)trainingInputs
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (NSArray)trainingOutputs
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (NSURL)modelURL
{
  return (NSURL *)objc_getProperty(self, a2, 48, 1);
}

- (NSString)isTrainingGlobalName
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (NSString)initializer
{
  return (NSString *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializer, 0);
  objc_storeStrong((id *)&self->_isTrainingGlobalName, 0);
  objc_storeStrong((id *)&self->_modelURL, 0);
  objc_storeStrong((id *)&self->_trainingOutputs, 0);
  objc_storeStrong((id *)&self->_trainingInputs, 0);
  objc_storeStrong((id *)&self->_outputs, 0);
  objc_storeStrong((id *)&self->_inputs, 0);
  objc_storeStrong((id *)&self->_layerNames, 0);
}

@end
