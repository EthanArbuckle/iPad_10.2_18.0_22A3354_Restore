@implementation HDUserTrackedConceptQueryServer

- (HDUserTrackedConceptQueryServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  id v10;
  HDUserTrackedConceptQueryServer *v11;
  uint64_t v12;
  NSArray *sortDescriptors;
  objc_super v15;

  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HDUserTrackedConceptQueryServer;
  v11 = -[HDQueryServer initWithUUID:configuration:client:delegate:](&v15, sel_initWithUUID_configuration_client_delegate_, a3, v10, a5, a6);
  if (v11)
  {
    objc_msgSend(v10, "sortDescriptors");
    v12 = objc_claimAutoreleasedReturnValue();
    sortDescriptors = v11->_sortDescriptors;
    v11->_sortDescriptors = (NSArray *)v12;

  }
  return v11;
}

+ (Class)queryClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  char v10;
  BOOL v11;

  v6 = a4;
  objc_msgSend(v6, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "hasEntitlement:", *MEMORY[0x1E0CB59B0]);

  if ((v8 & 1) != 0
    || (objc_msgSend(v6, "entitlements"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "hasPrivateAccessEntitlementWithIdentifier:", *MEMORY[0x1E0CB59A8]),
        v9,
        (v10 & 1) != 0))
  {
    v11 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:format:", a5, 4, CFSTR("Missing required entitlement. Please reach out to the HealthKit team (Potentially in #help-healthkit-disclosed Slack channel) for further instructions."));
    v11 = 0;
  }

  return v11;
}

- (void)_queue_start
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  id v17;
  id v18;
  objc_super v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  HDUserTrackedConceptQueryServer *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)HDUserTrackedConceptQueryServer;
  -[HDQueryServer _queue_start](&v19, sel__queue_start);
  -[HDQueryServer queryUUID](self, "queryUUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer clientProxy](self, "clientProxy");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HDQueryServer client](self, "client");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authorizationOracle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "clientHasAuthorizationForAllTypes");

  if ((v7 & 1) == 0)
  {
    -[HDQueryServer objectType](self, "objectType");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0;
    -[HDQueryServer readAuthorizationStatusForType:error:](self, "readAuthorizationStatusForType:error:", v8, &v18);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v18;

    if (!v9)
    {
      objc_msgSend(v4, "client_deliverError:forQuery:", v10, v3);
      goto LABEL_13;
    }
    if ((objc_msgSend(v9, "canRead") & 1) == 0)
    {
      v14 = (void *)MEMORY[0x1E0C9AA60];
      v13 = v4;
      goto LABEL_12;
    }

  }
  -[HDQueryServer profile](self, "profile");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  +[HDUserDomainConceptAPIObjectManager allAPIObjectsFromUserDomainConceptsWithProfile:error:](HDUserDomainConceptAPIObjectManager, "allAPIObjectsFromUserDomainConceptsWithProfile:error:", v11, &v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v17;

  objc_msgSend(v12, "hk_filter:", &__block_literal_global_136);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v13 = v4;
    v14 = v9;
LABEL_12:
    objc_msgSend(v13, "client_deliverUserTrackedConcepts:queryUUID:", v14, v3);
    goto LABEL_13;
  }
  _HKInitializeLogging();
  HKLogHealthOntology();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    HKSensitiveLogItem();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v21 = v16;
    v22 = 2114;
    v23 = self;
    _os_log_error_impl(&dword_1B7802000, v15, OS_LOG_TYPE_ERROR, "%{public}@: Error while fetching concepts: %{public}@", buf, 0x16u);

  }
  objc_msgSend(v4, "client_deliverError:forQuery:", v10, v3);
  v9 = 0;
LABEL_13:

}

uint64_t __47__HDUserTrackedConceptQueryServer__queue_start__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "userTrackedConceptType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0CB60C8]);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
}

@end
