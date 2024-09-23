@implementation HDConceptQueryServer

- (HDConceptQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)HDConceptQueryServer;
  return -[HDQueryServer initWithUUID:configuration:client:delegate:](&v7, sel_initWithUUID_configuration_client_delegate_, a3, a4, a5, a6);
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _BOOL4 v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  HDConceptQueryServer *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)HDConceptQueryServer;
  -[HDQueryServer _queue_start](&v19, sel__queue_start);
  -[HDQueryServer queryUUID](self, "queryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer clientProxy](self, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HDQueryServer configuration](self, "configuration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "selection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer profile](self, "profile");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateWithProfile:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer profile](self, "profile");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __36__HDConceptQueryServer__queue_start__block_invoke;
  v16[3] = &unk_1E6CEB848;
  v10 = v5;
  v17 = v10;
  v11 = +[HDOntologyConceptManager enumerateConceptsMatchingPredicate:profile:error:enumerationHandler:](HDOntologyConceptManager, "enumerateConceptsMatchingPredicate:profile:error:enumerationHandler:", v8, v9, &v18, v16);
  v12 = v18;

  if (v11)
  {
    objc_msgSend(v4, "client_deliverConcepts:queryUUID:", v10, v3);
  }
  else
  {
    _HKInitializeLogging();
    HKLogHealthOntology();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HKSensitiveLogItem();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v21 = v14;
      v22 = 2114;
      v23 = self;
      _os_log_error_impl(&dword_1B7802000, v13, OS_LOG_TYPE_ERROR, "%{public}@: Error while fetching concepts: %{public}@", buf, 0x16u);

    }
    objc_msgSend(v4, "client_deliverError:forQuery:", v12, v3);
  }

}

uint64_t __36__HDConceptQueryServer__queue_start__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
  return 1;
}

@end
