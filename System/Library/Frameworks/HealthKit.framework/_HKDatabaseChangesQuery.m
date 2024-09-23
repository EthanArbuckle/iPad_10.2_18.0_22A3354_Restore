@implementation _HKDatabaseChangesQuery

- (_HKDatabaseChangesQuery)initWithTypes:(id)a3 anchor:(id)a4 resultsHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _HKDatabaseChangesQuery *v11;
  uint64_t v12;
  NSArray *sampleTypes;
  uint64_t v14;
  HKQueryAnchor *anchor;
  uint64_t v16;
  id resultsHandler;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)_HKDatabaseChangesQuery;
  v11 = -[HKQuery _initWithObjectType:predicate:](&v19, sel__initWithObjectType_predicate_, 0, 0);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    sampleTypes = v11->_sampleTypes;
    v11->_sampleTypes = (NSArray *)v12;

    v14 = objc_msgSend(v9, "copy");
    anchor = v11->_anchor;
    v11->_anchor = (HKQueryAnchor *)v14;

    v16 = objc_msgSend(v10, "copy");
    resultsHandler = v11->_resultsHandler;
    v11->_resultsHandler = (id)v16;

    v11->_anchorStrategyChangeCountLimit = 50000;
  }

  return v11;
}

- (void)setIncludeChangeDetails:(BOOL)a3
{
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  self->_includeChangeDetails = a3;
}

- (void)setChangeDetailsQueryStrategy:(int64_t)a3
{
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  self->_changeDetailsQueryStrategy = a3;
}

- (void)setAnchorStrategyChangeCountLimit:(int64_t)a3
{
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", a2);
  self->_anchorStrategyChangeCountLimit = a3;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3E7608;
}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS____HKDatabaseChangesQuery;
  v3 = a3;
  objc_msgSendSuper2(&v7, sel_configureClientInterface_, v3);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "hk_typesForDictionaryMapping:to:", v5, objc_opt_class(), v7.receiver, v7.super_class);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_client_deliverQueryAnchor_sampleTypeChanges_queryUUID_, 1, 0);

}

+ (void)configureServerInterface:(id)a3
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS____HKDatabaseChangesQuery;
  objc_msgSendSuper2(&v3, sel_configureServerInterface_, a3);
}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_HKDatabaseChangesQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v6, sel_queue_populateConfiguration_, v4);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", self->_sampleTypes, v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSampleTypes:", v5);

  objc_msgSend(v4, "setAnchor:", self->_anchor);
  objc_msgSend(v4, "setShouldDeactivateAfterInitialResults:", 0);
  objc_msgSend(v4, "setShouldSuppressDataCollection:", 1);
  objc_msgSend(v4, "setIncludeChangeDetails:", self->_includeChangeDetails);
  objc_msgSend(v4, "setChangeDetailsQueryStrategy:", self->_changeDetailsQueryStrategy);
  objc_msgSend(v4, "setAnchorStrategyChangeCountLimit:", self->_anchorStrategyChangeCountLimit);

}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_deliverError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD block[5];
  id v8;
  id v9;

  v4 = a3;
  v5 = _Block_copy(self->_resultsHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46___HKDatabaseChangesQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

- (void)queue_queryDidDeactivate:(id)a3
{
  id resultsHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKDatabaseChangesQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  resultsHandler = self->_resultsHandler;
  self->_resultsHandler = 0;

}

- (void)client_deliverQueryAnchor:(id)a3 sampleTypeChanges:(id)a4 queryUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HKQuery queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81___HKDatabaseChangesQuery_client_deliverQueryAnchor_sampleTypeChanges_queryUUID___block_invoke;
  v15[3] = &unk_1E37EBEA8;
  v15[4] = self;
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (BOOL)includeChangeDetails
{
  return self->_includeChangeDetails;
}

- (int64_t)anchorStrategyChangeCountLimit
{
  return self->_anchorStrategyChangeCountLimit;
}

- (id)resultsHandler
{
  return self->_resultsHandler;
}

- (NSArray)sampleTypes
{
  return self->_sampleTypes;
}

- (HKQueryAnchor)anchor
{
  return self->_anchor;
}

- (int64_t)changeDetailsQueryStrategy
{
  return self->_changeDetailsQueryStrategy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_sampleTypes, 0);
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end
