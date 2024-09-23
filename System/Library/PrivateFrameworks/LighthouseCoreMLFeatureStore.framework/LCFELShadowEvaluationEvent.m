@implementation LCFELShadowEvaluationEvent

- (id)init:(id)a3 inputBachProviderInfo:(id)a4 evaluatedPredictions:(id)a5 accuracy:(id)a6 succeeded:(id)a7 evaluationError:(id)a8
{
  id v15;
  id v16;
  id v17;
  LCFELShadowEvaluationEvent *v18;
  uint64_t v19;
  NSUUID *contextId;
  uint64_t v21;
  NSUUID *eventId;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v26 = a3;
  v25 = a4;
  v24 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v27.receiver = self;
  v27.super_class = (Class)LCFELShadowEvaluationEvent;
  v18 = -[LCFELShadowEvaluationEvent init](&v27, sel_init);
  if (v18)
  {
    +[LCFFeatureStoreContextId getContextId](LCFFeatureStoreContextId, "getContextId");
    v19 = objc_claimAutoreleasedReturnValue();
    contextId = v18->_contextId;
    v18->_contextId = (NSUUID *)v19;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v21 = objc_claimAutoreleasedReturnValue();
    eventId = v18->_eventId;
    v18->_eventId = (NSUUID *)v21;

    objc_storeStrong((id *)&v18->_modelName, a3);
    objc_storeStrong((id *)&v18->_inputBachProviderInfo, a4);
    objc_storeStrong((id *)&v18->_evaluatedPredictions, a5);
    objc_storeStrong((id *)&v18->_succeeded, a7);
    objc_storeStrong((id *)&v18->_evaluationError, a8);
    objc_storeStrong((id *)&v18->_accuracy, a6);
  }

  return v18;
}

- (NSUUID)contextId
{
  return self->_contextId;
}

- (NSUUID)eventId
{
  return self->_eventId;
}

- (NSString)modelName
{
  return self->_modelName;
}

- (LCFELBatchProviderInfo)inputBachProviderInfo
{
  return self->_inputBachProviderInfo;
}

- (NSArray)evaluatedPredictions
{
  return self->_evaluatedPredictions;
}

- (NSNumber)accuracy
{
  return self->_accuracy;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (NSError)evaluationError
{
  return self->_evaluationError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_evaluationError, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
  objc_storeStrong((id *)&self->_accuracy, 0);
  objc_storeStrong((id *)&self->_evaluatedPredictions, 0);
  objc_storeStrong((id *)&self->_inputBachProviderInfo, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end
