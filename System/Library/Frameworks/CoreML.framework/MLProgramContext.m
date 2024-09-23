@implementation MLProgramContext

- (MLProgramContext)initWithExecutionState:(id)a3 functionNameToStateMap:(id)a4
{
  id v7;
  id v8;
  MLProgramContext *v9;
  MLProgramContext *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MLProgramContext;
  v9 = -[MLProgramContext init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_executionState, a3);
    objc_storeStrong((id *)&v10->_functionNameToStateMap, a4);
  }

  return v10;
}

- (NSDictionary)functionNameToInputLayersNames
{
  return self->_functionNameToInputLayersNames;
}

- (void)setFunctionNameToInputLayersNames:(id)a3
{
  objc_storeStrong((id *)&self->_functionNameToInputLayersNames, a3);
}

- (NSDictionary)functionNameToOutputLayersNames
{
  return self->_functionNameToOutputLayersNames;
}

- (void)setFunctionNameToOutputLayersNames:(id)a3
{
  objc_storeStrong((id *)&self->_functionNameToOutputLayersNames, a3);
}

- (MLFeatureProvider)executionState
{
  return self->_executionState;
}

- (void)setExecutionState:(id)a3
{
  objc_storeStrong((id *)&self->_executionState, a3);
}

- (NSString)trainFunctionLossName
{
  return self->_trainFunctionLossName;
}

- (void)setTrainFunctionLossName:(id)a3
{
  objc_storeStrong((id *)&self->_trainFunctionLossName, a3);
}

- (NSString)forwardFunctionLossName
{
  return self->_forwardFunctionLossName;
}

- (void)setForwardFunctionLossName:(id)a3
{
  objc_storeStrong((id *)&self->_forwardFunctionLossName, a3);
}

- (NSDictionary)functionNameToStateMap
{
  return self->_functionNameToStateMap;
}

- (void)setFunctionNameToStateMap:(id)a3
{
  objc_storeStrong((id *)&self->_functionNameToStateMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_functionNameToStateMap, 0);
  objc_storeStrong((id *)&self->_forwardFunctionLossName, 0);
  objc_storeStrong((id *)&self->_trainFunctionLossName, 0);
  objc_storeStrong((id *)&self->_executionState, 0);
  objc_storeStrong((id *)&self->_functionNameToOutputLayersNames, 0);
  objc_storeStrong((id *)&self->_functionNameToInputLayersNames, 0);
}

@end
