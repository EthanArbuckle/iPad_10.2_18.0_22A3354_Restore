@implementation LCFELFeatureImportanceEvent

- (id)init:(id)a3 targetLabelFeatureName:(id)a4 results:(id)a5 succeeded:(id)a6 analysisError:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  LCFELFeatureImportanceEvent *v17;
  uint64_t v18;
  NSUUID *contextId;
  uint64_t v20;
  NSUUID *eventId;
  id v23;
  objc_super v24;

  v23 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v24.receiver = self;
  v24.super_class = (Class)LCFELFeatureImportanceEvent;
  v17 = -[LCFELFeatureImportanceEvent init](&v24, sel_init);
  if (v17)
  {
    +[LCFFeatureStoreContextId getContextId](LCFFeatureStoreContextId, "getContextId");
    v18 = objc_claimAutoreleasedReturnValue();
    contextId = v17->_contextId;
    v17->_contextId = (NSUUID *)v18;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v20 = objc_claimAutoreleasedReturnValue();
    eventId = v17->_eventId;
    v17->_eventId = (NSUUID *)v20;

    objc_storeStrong((id *)&v17->_inputBachProviderInfo, a3);
    objc_storeStrong((id *)&v17->_targetLabelFeatureName, a4);
    objc_storeStrong((id *)&v17->_results, a5);
    objc_storeStrong((id *)&v17->_succeeded, a6);
    objc_storeStrong((id *)&v17->_analysisError, a7);
  }

  return v17;
}

- (NSUUID)contextId
{
  return self->_contextId;
}

- (NSUUID)eventId
{
  return self->_eventId;
}

- (LCFELBatchProviderInfo)inputBachProviderInfo
{
  return self->_inputBachProviderInfo;
}

- (NSString)targetLabelFeatureName
{
  return self->_targetLabelFeatureName;
}

- (NSArray)results
{
  return self->_results;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (NSError)analysisError
{
  return self->_analysisError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analysisError, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
  objc_storeStrong((id *)&self->_results, 0);
  objc_storeStrong((id *)&self->_targetLabelFeatureName, 0);
  objc_storeStrong((id *)&self->_inputBachProviderInfo, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end
