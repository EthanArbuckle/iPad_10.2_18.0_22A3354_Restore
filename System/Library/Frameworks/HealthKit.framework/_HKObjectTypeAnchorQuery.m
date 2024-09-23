@implementation _HKObjectTypeAnchorQuery

- (_HKObjectTypeAnchorQuery)initWithUpdateHandler:(id)a3
{
  id v4;
  _HKObjectTypeAnchorQuery *v5;
  uint64_t v6;
  id updateHandler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKObjectTypeAnchorQuery;
  v5 = -[HKQuery _initWithObjectType:predicate:](&v9, sel__initWithObjectType_predicate_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    updateHandler = v5->_updateHandler;
    v5->_updateHandler = (id)v6;

    -[HKQuery setShouldSuppressDataCollection:](v5, "setShouldSuppressDataCollection:", 1);
  }

  return v5;
}

- (void)client_deliverAnchor:(id)a3 query:(id)a4
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
  block[2] = __55___HKObjectTypeAnchorQuery_client_deliverAnchor_query___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void)queue_queryDidDeactivate:(id)a3
{
  id updateHandler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKObjectTypeAnchorQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  updateHandler = self->_updateHandler;
  self->_updateHandler = &__block_literal_global_56;

}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_deliverError:(id)a3
{
  id updateHandler;
  id v5;
  void (**v6)(id, _HKObjectTypeAnchorQuery *, _QWORD, id);

  updateHandler = self->_updateHandler;
  v5 = a3;
  v6 = (void (**)(id, _HKObjectTypeAnchorQuery *, _QWORD, id))_Block_copy(updateHandler);
  v6[2](v6, self, 0, v5);

}

- (void)queue_populateConfiguration:(id)a3
{
  id v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_HKObjectTypeAnchorQuery;
  v3 = a3;
  -[HKQuery queue_populateConfiguration:](&v4, sel_queue_populateConfiguration_, v3);
  objc_msgSend(v3, "setShouldDeactivateAfterInitialResults:", 0, v4.receiver, v4.super_class);

}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3C8718;
}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  objc_super v5;

  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS____HKObjectTypeAnchorQuery;
  v3 = a3;
  objc_msgSendSuper2(&v5, sel_configureClientInterface_, v3);
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", objc_opt_class(), v5.receiver, v5.super_class);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_client_deliverAnchor_query_, 0, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_updateHandler, 0);
}

@end
