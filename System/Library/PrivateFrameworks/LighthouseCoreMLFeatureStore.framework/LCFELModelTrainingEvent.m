@implementation LCFELModelTrainingEvent

- (id)init:(id)a3 batchProviderInfo:(id)a4 succeeded:(id)a5 trainingError:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  LCFELModelTrainingEvent *v15;
  uint64_t v16;
  NSUUID *contextId;
  uint64_t v18;
  NSUUID *eventId;
  objc_super v21;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v21.receiver = self;
  v21.super_class = (Class)LCFELModelTrainingEvent;
  v15 = -[LCFELModelTrainingEvent init](&v21, sel_init);
  if (v15)
  {
    +[LCFFeatureStoreContextId getContextId](LCFFeatureStoreContextId, "getContextId");
    v16 = objc_claimAutoreleasedReturnValue();
    contextId = v15->_contextId;
    v15->_contextId = (NSUUID *)v16;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v18 = objc_claimAutoreleasedReturnValue();
    eventId = v15->_eventId;
    v15->_eventId = (NSUUID *)v18;

    objc_storeStrong((id *)&v15->_modelName, a3);
    objc_storeStrong((id *)&v15->_bachProviderInfo, a4);
    objc_storeStrong((id *)&v15->_succeeded, a5);
    objc_storeStrong((id *)&v15->_trainingError, a6);
  }

  return v15;
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

- (LCFELBatchProviderInfo)bachProviderInfo
{
  return self->_bachProviderInfo;
}

- (NSNumber)succeeded
{
  return self->_succeeded;
}

- (NSError)trainingError
{
  return self->_trainingError;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trainingError, 0);
  objc_storeStrong((id *)&self->_succeeded, 0);
  objc_storeStrong((id *)&self->_bachProviderInfo, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_eventId, 0);
  objc_storeStrong((id *)&self->_contextId, 0);
}

@end
