@implementation _HKSampleTypeQuery

- (_HKSampleTypeQuery)initWithPredicate:(id)a3 resultsHandler:(id)a4
{
  id v6;
  _HKSampleTypeQuery *v7;
  uint64_t v8;
  id resultsHandler;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)_HKSampleTypeQuery;
  v7 = -[HKQuery _initWithObjectType:predicate:](&v11, sel__initWithObjectType_predicate_, 0, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    resultsHandler = v7->_resultsHandler;
    v7->_resultsHandler = (id)v8;

  }
  return v7;
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3C10A0;
}

+ (void)configureClientInterface:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS____HKSampleTypeQuery;
  objc_msgSendSuper2(&v6, sel_configureClientInterface_, v4);
  v5 = (id)objc_msgSend(v4, "hk_setArrayOfClass:forSelector:argumentIndex:ofReply:", objc_opt_class(), sel_client_deliverSampleTypes_query_, 0, 0);

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
    block[2] = __41___HKSampleTypeQuery_queue_deliverError___block_invoke;
    block[3] = &unk_1E37E6710;
    v9 = v5;
    block[4] = self;
    v8 = v4;
    dispatch_async(v6, block);

  }
}

- (void)client_deliverSampleTypes:(id)a3 query:(id)a4
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
  block[2] = __54___HKSampleTypeQuery_client_deliverSampleTypes_query___block_invoke;
  block[3] = &unk_1E37E6738;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_resultsHandler, 0);
}

@end
