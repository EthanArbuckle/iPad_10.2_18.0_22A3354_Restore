@implementation _HKCurrentActivitySummaryQuery

- (_HKCurrentActivitySummaryQuery)initWithUpdateHandler:(id)a3
{
  id v4;
  void *v5;
  _HKCurrentActivitySummaryQuery *v6;
  uint64_t v7;
  id updateHandler;
  objc_super v10;

  v4 = a3;
  +[HKObjectType activitySummaryType](HKObjectType, "activitySummaryType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.receiver = self;
  v10.super_class = (Class)_HKCurrentActivitySummaryQuery;
  v6 = -[HKQuery _initWithObjectType:predicate:](&v10, sel__initWithObjectType_predicate_, v5, 0);

  if (v6)
  {
    v7 = objc_msgSend(v4, "copy");
    updateHandler = v6->_updateHandler;
    v6->_updateHandler = (id)v7;

  }
  return v6;
}

- (void)client_deliverActivitySummaries:(id)a3 queryUUID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HKQuery queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3D0998;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____HKCurrentActivitySummaryQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverActivitySummaries_queryUUID_, 0, 0);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKCurrentActivitySummaryQuery;
  v4 = a3;
  -[HKQuery queue_populateConfiguration:](&v5, sel_queue_populateConfiguration_, v4);
  objc_msgSend(v4, "setCollectionIntervals:", self->_collectionIntervals, v5.receiver, v5.super_class);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id updateHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKCurrentActivitySummaryQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  updateHandler = self->_updateHandler;
  self->_updateHandler = 0;

}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_HKCurrentActivitySummaryQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_updateHandler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ updateHandler must not be nil"), objc_opt_class());
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
  v5 = _Block_copy(self->_updateHandler);
  if (v5)
  {
    -[HKQuery clientQueue](self, "clientQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __53___HKCurrentActivitySummaryQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

- (void)_setCollectionIntervals:(id)a3
{
  id v4;
  NSDictionary *v5;
  NSDictionary *collectionIntervals;

  v4 = a3;
  -[HKQuery _throwInvalidArgumentExceptionIfHasBeenExecuted:](self, "_throwInvalidArgumentExceptionIfHasBeenExecuted:", sel__setCollectionIntervals_);
  v5 = (NSDictionary *)objc_msgSend(v4, "copy");

  collectionIntervals = self->_collectionIntervals;
  self->_collectionIntervals = v5;

}

- (NSDictionary)_collectionIntervals
{
  return self->_collectionIntervals;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_collectionIntervals, 0);
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
