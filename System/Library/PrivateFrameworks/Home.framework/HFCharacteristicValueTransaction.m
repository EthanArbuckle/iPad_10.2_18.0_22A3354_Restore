@implementation HFCharacteristicValueTransaction

- (NSMutableSet)characteristicsToRead
{
  return self->_characteristicsToRead;
}

- (HFUpdateLogger)logger
{
  return self->_logger;
}

- (NSMutableDictionary)readFuturesKeyedByCharacteristicIdentifier
{
  return self->_readFuturesKeyedByCharacteristicIdentifier;
}

- (HFMutableAggregatedCharacteristicReadPolicy)readPolicy
{
  return self->_readPolicy;
}

- (NAFuture)commitFuture
{
  return self->_commitFuture;
}

- (NSMutableSet)writeCharacteristicRequests
{
  return self->_writeCharacteristicRequests;
}

- (NSMutableSet)actionsToExecute
{
  return self->_actionsToExecute;
}

- (NSMutableSet)actionSetsToExecute
{
  return self->_actionSetsToExecute;
}

- (OS_dispatch_group)onFinishGroup
{
  return self->_onFinishGroup;
}

- (void)setLoggerIsExternal:(BOOL)a3
{
  self->_loggerIsExternal = a3;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (BOOL)loggerIsExternal
{
  return self->_loggerIsExternal;
}

- (HFCharacteristicValueTransaction)init
{
  HFCharacteristicValueTransaction *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  dispatch_group_t v11;
  HFMutableAggregatedCharacteristicReadPolicy *v12;
  HFNotSupportedReadPolicy *v13;
  void *v14;
  HFMutableAggregatedCharacteristicReadPolicy *v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)HFCharacteristicValueTransaction;
  v2 = -[HFCharacteristicValueTransaction init](&v17, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueTransaction setCharacteristicsToRead:](v2, "setCharacteristicsToRead:", v3);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueTransaction setWriteCharacteristicRequests:](v2, "setWriteCharacteristicRequests:", v4);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueTransaction setActionSetsToExecute:](v2, "setActionSetsToExecute:", v5);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueTransaction setActionsToExecute:](v2, "setActionsToExecute:", v6);

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueTransaction setClientReasonsStack:](v2, "setClientReasonsStack:", v7);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueTransaction setReadFuturesKeyedByCharacteristicIdentifier:](v2, "setReadFuturesKeyedByCharacteristicIdentifier:", v8);

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HFCharacteristicValueTransaction setWriteFuturesKeyedByCharacteristicIdentifier:](v2, "setWriteFuturesKeyedByCharacteristicIdentifier:", v9);

    v10 = objc_alloc_init(MEMORY[0x1E0D519C0]);
    -[HFCharacteristicValueTransaction setCommitFuture:](v2, "setCommitFuture:", v10);

    v11 = dispatch_group_create();
    -[HFCharacteristicValueTransaction setOnFinishGroup:](v2, "setOnFinishGroup:", v11);

    v12 = [HFMutableAggregatedCharacteristicReadPolicy alloc];
    v13 = objc_alloc_init(HFNotSupportedReadPolicy);
    v18[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[HFAggregatedCharacteristicReadPolicy initWithPolicies:](v12, "initWithPolicies:", v14);
    -[HFCharacteristicValueTransaction setReadPolicy:](v2, "setReadPolicy:", v15);

  }
  return v2;
}

- (void)setCharacteristicsToRead:(id)a3
{
  objc_storeStrong((id *)&self->_characteristicsToRead, a3);
}

- (void)setWriteFuturesKeyedByCharacteristicIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_writeFuturesKeyedByCharacteristicIdentifier, a3);
}

- (void)setWriteCharacteristicRequests:(id)a3
{
  objc_storeStrong((id *)&self->_writeCharacteristicRequests, a3);
}

- (void)setReadPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_readPolicy, a3);
}

- (void)setReadFuturesKeyedByCharacteristicIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_readFuturesKeyedByCharacteristicIdentifier, a3);
}

- (void)setOnFinishGroup:(id)a3
{
  objc_storeStrong((id *)&self->_onFinishGroup, a3);
}

- (void)setCommitFuture:(id)a3
{
  objc_storeStrong((id *)&self->_commitFuture, a3);
}

- (void)setClientReasonsStack:(id)a3
{
  objc_storeStrong((id *)&self->_clientReasonsStack, a3);
}

- (void)setActionsToExecute:(id)a3
{
  objc_storeStrong((id *)&self->_actionsToExecute, a3);
}

- (void)setActionSetsToExecute:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetsToExecute, a3);
}

- (NSMutableArray)clientReasonsStack
{
  return self->_clientReasonsStack;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_clientReasonsStack, 0);
  objc_storeStrong((id *)&self->_onFinishGroup, 0);
  objc_storeStrong((id *)&self->_commitFuture, 0);
  objc_storeStrong((id *)&self->_writeFuturesKeyedByCharacteristicIdentifier, 0);
  objc_storeStrong((id *)&self->_readFuturesKeyedByCharacteristicIdentifier, 0);
  objc_storeStrong((id *)&self->_overallWriteError, 0);
  objc_storeStrong((id *)&self->_overallReadError, 0);
  objc_storeStrong((id *)&self->_actionsError, 0);
  objc_storeStrong((id *)&self->_actionSetErrorsKeyedByUUID, 0);
  objc_storeStrong((id *)&self->_actionsToExecute, 0);
  objc_storeStrong((id *)&self->_actionSetsToExecute, 0);
  objc_storeStrong((id *)&self->_writeCharacteristicRequests, 0);
  objc_storeStrong((id *)&self->_characteristicsToRead, 0);
  objc_storeStrong((id *)&self->_readPolicy, 0);
}

- (void)setOverallReadError:(id)a3
{
  objc_storeStrong((id *)&self->_overallReadError, a3);
}

- (id)executionErrorForActionSet:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[HFCharacteristicValueTransaction actionSetErrorsKeyedByUUID](self, "actionSetErrorsKeyedByUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSDictionary)actionSetErrorsKeyedByUUID
{
  return self->_actionSetErrorsKeyedByUUID;
}

- (void)setActionSetErrorsKeyedByUUID:(id)a3
{
  objc_storeStrong((id *)&self->_actionSetErrorsKeyedByUUID, a3);
}

- (NSError)actionsError
{
  return self->_actionsError;
}

- (void)setActionsError:(id)a3
{
  objc_storeStrong((id *)&self->_actionsError, a3);
}

- (NSError)overallReadError
{
  return self->_overallReadError;
}

- (NSError)overallWriteError
{
  return self->_overallWriteError;
}

- (void)setOverallWriteError:(id)a3
{
  objc_storeStrong((id *)&self->_overallWriteError, a3);
}

- (NSMutableDictionary)writeFuturesKeyedByCharacteristicIdentifier
{
  return self->_writeFuturesKeyedByCharacteristicIdentifier;
}

@end
