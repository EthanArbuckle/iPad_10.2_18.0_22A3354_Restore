@implementation HDConceptStoreTaskServer

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB4630];
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (Class)configurationClass
{
  return (Class)objc_opt_class();
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB64D0], "clientInterface");
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB64D0], "serverInterface");
}

- (void)connectionInvalidated
{
  void *v3;
  id v4;

  -[HDStandardTaskServer profile](self, "profile");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conceptIndexManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

}

- (void)remote_startObservingConceptIndexManagerWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, uint64_t, _QWORD);

  v6 = (void (**)(id, uint64_t, _QWORD))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conceptIndexManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:", self);

  v6[2](v6, 1, 0);
}

- (void)remote_currentIndexingState:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void (**v7)(id, uint64_t);

  v7 = (void (**)(id, uint64_t))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "conceptIndexManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = objc_msgSend(v5, "currentExecutionState");
  else
    v6 = 0;
  v7[2](v7, v6);

}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (void)remote_queryConceptByIdentifier:(id)a3 loadRelationships:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v7;
  void (**v8)(id, void *, id);
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v7 = a4;
  v8 = (void (**)(id, void *, id))a5;
  v9 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ontologyConceptManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0;
  objc_msgSend(v11, "conceptForIdentifier:options:error:", v9, v7, &v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v14;
  v8[2](v8, v12, v13);

}

- (void)remote_queryRelationshipsForNodeWithID:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, id);
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;

  v6 = (void (**)(id, void *, id))a4;
  v7 = a3;
  -[HDStandardTaskServer profile](self, "profile");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  +[HDOntologyConceptManager relationshipsForConceptWithIdentifier:profile:error:](HDOntologyConceptManager, "relationshipsForConceptWithIdentifier:profile:error:", v7, v8, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v11;
  v6[2](v6, v9, v10);

}

- (void)remote_queryCountOfConceptsAssociatedToUserRecordsWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  id v7;
  id v8;

  v4 = (void (**)(id, void *, id))a3;
  -[HDStandardTaskServer profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  +[HDConceptIndexEntity numberOfIndexedConceptsWithProfile:error:](HDConceptIndexEntity, "numberOfIndexedConceptsWithProfile:error:", v5, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v8;

  v4[2](v4, v6, v7);
}

- (void)conceptIndexManagerDidChangeExecutionState:(unint64_t)a3
{
  void *v4;
  _QWORD v5[5];

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __71__HDConceptStoreTaskServer_conceptIndexManagerDidChangeExecutionState___block_invoke;
  v5[3] = &unk_1E6CE8030;
  v5[4] = self;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientRemote_conceptIndexManagerDidChangeState:", a3);

}

void __71__HDConceptStoreTaskServer_conceptIndexManagerDidChangeExecutionState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  v4 = (void *)*MEMORY[0x1E0CB5370];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CB5370], OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = v4;
    HKSensitiveLogItem();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543618;
    v9 = v5;
    v10 = 2114;
    v11 = v7;
    _os_log_error_impl(&dword_1B7802000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Failed to call HKOntologyTaskServerClient clientRemote_conceptIndexManagerDidChangeState: with error: %{public}@", (uint8_t *)&v8, 0x16u);

  }
}

@end
