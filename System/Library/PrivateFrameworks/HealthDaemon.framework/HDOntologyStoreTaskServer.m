@implementation HDOntologyStoreTaskServer

+ (id)createTaskServerWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  HDOntologyStoreTaskServer *v19;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v13, "profile");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "daemon");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "behavior");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "supportsOntology");

  if ((v18 & 1) != 0)
  {
    v19 = -[HDStandardTaskServer initWithUUID:configuration:client:delegate:]([HDOntologyStoreTaskServer alloc], "initWithUUID:configuration:client:delegate:", v11, v12, v13, v14);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "hk_assignError:code:description:", a7, 110, CFSTR("Device does not support health ontology"));
    v19 = 0;
  }

  return v19;
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E0CB5758];
}

- (id)remoteInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB69B8], "clientInterface");
}

- (id)exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x1E0CB69B8], "serverInterface");
}

- (void)remote_insertEntries:(id)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;

  v6 = (void (**)(id, uint64_t, id))a4;
  v7 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shardRegistry");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v10 = objc_msgSend(v9, "insertEntries:error:", v7, &v12);

  v11 = v12;
  v6[2](v6, v10, v11);

}

- (id)updateCoordinator
{
  void *v1;
  void *v2;
  void *v3;

  if (a1)
  {
    objc_msgSend(a1, "profile");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "daemon");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "ontologyUpdateCoordinator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)remote_ontologyShardRegistryEntriesWithCompletion:(id)a3
{
  void (**v4)(id, void *, id);
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v4 = (void (**)(id, void *, id))a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "shardRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  objc_msgSend(v6, "entriesWithPredicate:orderingTerms:error:", 0, 0, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_ontologyServerURLWithCompletion:(id)a3
{
  void (**v4)(id, id, _QWORD);
  void *v5;
  id v6;

  v4 = (void (**)(id, id, _QWORD))a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "ontologyServerURL");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v6, 0);
}

- (void)remote_setOntologyServerURL:(id)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void (**v8)(id, uint64_t, _QWORD);

  v8 = (void (**)(id, uint64_t, _QWORD))a4;
  v6 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setOntologyServerURL:", v6);

  v8[2](v8, 1, 0);
}

- (void)remote_updateShardRegistryWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateShardRegistryWithCompletion:", v4);

}

- (void)remote_downloadRequiredShardsWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "downloadRequiredShardsWithCompletion:", v4);

}

- (void)remote_importRequiredShardsWithCompletion:(id)a3
{
  void (**v4)(id, uint64_t, id);
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;

  v4 = (void (**)(id, uint64_t, id))a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "importer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v7 = objc_msgSend(v6, "importStagedShardFilesWithError:", &v9);
  v8 = v9;

  v4[2](v4, v7, v8);
}

- (void)remote_updateOntologyForReason:(int64_t)a3 completion:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "updateOntologyWithReason:completion:", a3, v6);

}

- (void)remote_requestGatedOntologyUpdateWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "triggerGatedUpdateWithMaximumDelay:completion:", v4, 1.0);

}

- (void)remote_pruneOntologyWithOptions:(unint64_t)a3 completion:(id)a4
{
  void (**v6)(id, uint64_t, id);
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v6 = (void (**)(id, uint64_t, id))a4;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pruner");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v9 = objc_msgSend(v8, "pruneOntologyWithOptions:error:", a3, &v11);
  v10 = v11;

  v6[2](v6, v9, v10);
}

- (void)remote_markShardsWithIdentifiers:(id)a3 options:(unint64_t)a4 completion:(id)a5
{
  void (**v8)(id, uint64_t, id);
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;

  v8 = (void (**)(id, uint64_t, id))a5;
  v9 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "featureCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v12 = objc_msgSend(v11, "markShardsWithIdentifiers:options:error:", v9, a4, &v14);

  v13 = v14;
  v8[2](v8, v12, v13);

}

- (void)remote_shardRequirementStatusesWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a3;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "featureCoordinator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "shardRequirementStatuses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void *, _QWORD))a3 + 2))(v5, v7, 0);

}

- (void)remote_observeOntologyStoreChanges:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  void (**v6)(id, uint64_t, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v6 = (void (**)(id, uint64_t, _QWORD))a4;
  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "downloader");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  -[HDOntologyStoreTaskServer updateCoordinator](self);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "importer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "addOntologyShardDownloaderObserver:queue:", self, 0);
    objc_msgSend(v9, "addOntologyShardImporterObserver:queue:", self, 0);
  }
  else
  {
    objc_msgSend(v10, "removeOntologyShardDownloaderObserver:", self);
    objc_msgSend(v9, "removeOntologyShardImporterObserver:", self);
  }
  v6[2](v6, 1, 0);

}

- (void)ontologyShardDownloader:(id)a3 didStageEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  HDOntologyStoreTaskServer *v15;
  id v16;
  uint8_t buf[4];
  HDOntologyStoreTaskServer *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __67__HDOntologyStoreTaskServer_ontologyShardDownloader_didStageEntry___block_invoke;
  v14 = &unk_1E6CEF7C8;
  v15 = self;
  v6 = v5;
  v16 = v6;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogHealthOntology();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

  if (v9)
  {
    HKLogHealthOntology();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: Notify client for staged entry %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v7, "client_didStageEntry:", v6, v11, v12, v13, v14, v15);

}

void __67__HDOntologyStoreTaskServer_ontologyShardDownloader_didStageEntry___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Unable to notify client for staged entry %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
  }

}

- (void)ontologyShardImporter:(id)a3 didImportEntry:(id)a4
{
  id v5;
  id v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  HDOntologyStoreTaskServer *v15;
  id v16;
  uint8_t buf[4];
  HDOntologyStoreTaskServer *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __66__HDOntologyStoreTaskServer_ontologyShardImporter_didImportEntry___block_invoke;
  v14 = &unk_1E6CEF7C8;
  v15 = self;
  v6 = v5;
  v16 = v6;
  -[HDStandardTaskServer remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _HKInitializeLogging();
  HKLogHealthOntology();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

  if (v9)
  {
    HKLogHealthOntology();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543618;
      v18 = self;
      v19 = 2114;
      v20 = v6;
      _os_log_impl(&dword_1B7802000, v10, OS_LOG_TYPE_INFO, "%{public}@: Notify client for imported entry %{public}@", buf, 0x16u);
    }

  }
  objc_msgSend(v7, "client_didImportEntry:", v6, v11, v12, v13, v14, v15);

}

void __66__HDOntologyStoreTaskServer_ontologyShardImporter_didImportEntry___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogHealthOntology();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138543874;
    v8 = v5;
    v9 = 2114;
    v10 = v6;
    v11 = 2114;
    v12 = v3;
    _os_log_error_impl(&dword_1B7802000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Unable to notify client for imported entry %{public}@: %{public}@", (uint8_t *)&v7, 0x20u);
  }

}

@end
