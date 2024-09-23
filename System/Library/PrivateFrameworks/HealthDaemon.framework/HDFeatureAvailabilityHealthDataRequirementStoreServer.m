@implementation HDFeatureAvailabilityHealthDataRequirementStoreServer

- (void)remote_getEvaluationOfRequirements:(id)a3 completion:(id)a4
{
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *manager;
  void (**v6)(id, void *, id);
  void *v7;
  id v8;
  id v9;

  manager = self->_manager;
  v9 = 0;
  v6 = (void (**)(id, void *, id))a4;
  -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager evaluationOfRequirements:error:](manager, "evaluationOfRequirements:error:", a3, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;
  v6[2](v6, v7, v8);

}

- (void)remote_startObservingChangesInRequirements:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  NSObject *v8;
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *manager;
  uint64_t v10;
  id v11;
  id v12;
  uint8_t buf[4];
  HDFeatureAvailabilityHealthDataRequirementStoreServer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v14 = self;
    _os_log_impl(&dword_1B7802000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Registering for changes", buf, 0xCu);
  }

  manager = self->_manager;
  v12 = 0;
  v10 = -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager registerObserver:forRequirements:queue:error:](manager, "registerObserver:forRequirements:queue:error:", self, v7, 0, &v12);

  v11 = v12;
  v6[2](v6, v10, v11);

}

- (void)remote_stopObservingChanges
{
  NSObject *v3;
  int v4;
  HDFeatureAvailabilityHealthDataRequirementStoreServer *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1B7802000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] Unregistering for changes", (uint8_t *)&v4, 0xCu);
  }

  -[HDFeatureAvailabilityHealthDataRequirementEvaluationManager unregisterObserver:](self->_manager, "unregisterObserver:", self);
}

- (void)featureAvailabilityRequirement:(id)a3 didUpdateSatisfaction:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  HDFeatureAvailabilityHealthDataRequirementStoreServer *v11;
  uint64_t v12;

  v4 = a4;
  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 138543362;
    v11 = self;
    _os_log_impl(&dword_1B7802000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Notifying client of requirement satisfaction update", (uint8_t *)&v10, 0xCu);
  }

  if (self)
  {
    -[HDStandardTaskServer client](self, "client");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "remoteObjectProxy");
    self = (HDFeatureAvailabilityHealthDataRequirementStoreServer *)objc_claimAutoreleasedReturnValue();

  }
  -[HDFeatureAvailabilityHealthDataRequirementStoreServer client_featureAvailabilityRequirement:didUpdateSatisfaction:](self, "client_featureAvailabilityRequirement:didUpdateSatisfaction:", v6, v4);

}

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v10;
  id v11;
  id v12;
  id v13;
  HDFeatureAvailabilityHealthDataRequirementStoreServer *v14;
  void *v15;
  uint64_t v16;
  HDFeatureAvailabilityHealthDataRequirementEvaluationManager *manager;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:]([HDFeatureAvailabilityHealthDataRequirementStoreServer alloc], "initWithUUID:configuration:client:delegate:", v13, v12, v11, v10);

  objc_msgSend(v11, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "healthDataRequirementEvaluationManager");
  v16 = objc_claimAutoreleasedReturnValue();
  manager = v14->_manager;
  v14->_manager = (HDFeatureAvailabilityHealthDataRequirementEvaluationManager *)v16;

  return v14;
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E0C9AA60];
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;

  v5 = a4;
  objc_msgSend(v5, "entitlements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasEntitlement:", *MEMORY[0x1E0CB59B0]);

  objc_msgSend(v5, "entitlements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "hasEntitlement:", *MEMORY[0x1E0CB4F08]);

  objc_msgSend(v5, "entitlements");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v10, "hasEntitlement:", *MEMORY[0x1E0CB4EF8]);
  return v7 | v9 | v5;
}

+ (id)taskIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
}

@end
