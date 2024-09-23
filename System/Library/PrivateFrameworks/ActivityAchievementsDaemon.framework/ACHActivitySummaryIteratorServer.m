@implementation ACHActivitySummaryIteratorServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x24BE01238];
}

- (ACHActivitySummaryIteratorServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  ACHActivitySummaryIteratorServer *v11;
  id v12;
  void *v13;
  uint64_t v14;
  HDActivitySummaryBuilder *builder;
  uint64_t v16;
  NSCalendar *calendar;
  objc_super v19;

  v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ACHActivitySummaryIteratorServer;
  v11 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:](&v19, sel_initWithUUID_configuration_client_delegate_, a3, a4, v10, a6);
  if (v11)
  {
    v12 = objc_alloc(MEMORY[0x24BE40A10]);
    objc_msgSend(v10, "profile");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "initWithProfile:", v13);
    builder = v11->_builder;
    v11->_builder = (HDActivitySummaryBuilder *)v14;

    objc_msgSend(MEMORY[0x24BDBCE48], "hk_gregorianCalendar");
    v16 = objc_claimAutoreleasedReturnValue();
    calendar = v11->_calendar;
    v11->_calendar = (NSCalendar *)v16;

  }
  return v11;
}

- (void)remote_activitySummariesForStartDateComponents:(id)a3 endDateComponents:(id)a4 includePrivateProperties:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD, id);
  void *v13;
  HDActivitySummaryBuilder *builder;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, id))a6;
  HDActivityCacheEntityPredicateForCachesInDateComponentsRange();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__18;
  v22 = __Block_byref_object_dispose__18;
  v23 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[HDActivitySummaryBuilder setShouldIncludePrivateProperties:](self->_builder, "setShouldIncludePrivateProperties:", v7);
  builder = self->_builder;
  v16[4] = &v18;
  v17 = 0;
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __137__ACHActivitySummaryIteratorServer_remote_activitySummariesForStartDateComponents_endDateComponents_includePrivateProperties_completion___block_invoke;
  v16[3] = &unk_24D13C068;
  -[HDActivitySummaryBuilder enumerateActivitySummariesWithPredicate:error:handler:](builder, "enumerateActivitySummariesWithPredicate:error:handler:", v13, &v17, v16);
  v15 = v17;
  v12[2](v12, v19[5], v15);

  _Block_object_dispose(&v18, 8);
}

uint64_t __137__ACHActivitySummaryIteratorServer_remote_activitySummariesForStartDateComponents_endDateComponents_includePrivateProperties_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", a2);
}

- (id)exportedInterface
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D77130);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x24BDBCF20]);
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithArray:", v4);
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_remote_activitySummariesForStartDateComponents_endDateComponents_includePrivateProperties_completion_, 0, 1);

  return v2;
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254D82A38);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_calendar, 0);
  objc_storeStrong((id *)&self->_builder, 0);
}

@end
