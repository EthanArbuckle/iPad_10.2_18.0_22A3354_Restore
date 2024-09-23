@implementation _HKDateRangeQuery

- (_HKDateRangeQuery)initWithDateIntervalHandler:(id)a3
{
  id v4;
  _HKDateRangeQuery *v5;
  uint64_t v6;
  id handler;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_HKDateRangeQuery;
  v5 = -[HKQuery _initWithObjectType:predicate:](&v9, sel__initWithObjectType_predicate_, 0, 0);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    handler = v5->_handler;
    v5->_handler = (id)v6;

    -[HKQuery setShouldSuppressDataCollection:](v5, "setShouldSuppressDataCollection:", 1);
  }

  return v5;
}

- (void)client_deliverDateIntervals:(id)a3 forQuery:(id)a4
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
  block[2] = __58___HKDateRangeQuery_client_deliverDateIntervals_forQuery___block_invoke;
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
  id handler;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_HKDateRangeQuery;
  -[HKQuery queue_queryDidDeactivate:](&v5, sel_queue_queryDidDeactivate_, a3);
  handler = self->_handler;
  self->_handler = 0;

}

- (void)queue_validate
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_HKDateRangeQuery;
  -[HKQuery queue_validate](&v3, sel_queue_validate);
  if (!self->_handler)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("HKQueryValidationFailureException"), CFSTR("%@ handler must not be nil"), objc_opt_class());
}

- (BOOL)queue_shouldDeactivateAfterInitialResults
{
  return 0;
}

- (void)queue_deliverError:(id)a3
{
  void (**handler)(id, _HKDateRangeQuery *, _QWORD, id);

  handler = (void (**)(id, _HKDateRangeQuery *, _QWORD, id))self->_handler;
  if (handler)
    handler[2](handler, self, 0, a3);
}

+ (id)clientInterfaceProtocol
{
  return &unk_1EE3B9F30;
}

+ (void)configureClientInterface:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = a1;
  v8.super_class = (Class)&OBJC_METACLASS____HKDateRangeQuery;
  v3 = a3;
  objc_msgSendSuper2(&v8, sel_configureClientInterface_, v3);
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, v6, objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_client_deliverDateIntervals_forQuery_, 0, 0);

}

- (id)handler
{
  return self->_handler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_handler, 0);
}

@end
