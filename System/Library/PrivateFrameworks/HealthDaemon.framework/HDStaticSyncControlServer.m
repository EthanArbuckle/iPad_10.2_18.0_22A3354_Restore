@implementation HDStaticSyncControlServer

- (id)remote_runStaticSyncExportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 batchSize:(unint64_t)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  HDStaticSyncExportTask *v15;
  void *v16;
  HDStaticSyncExportTask *v17;
  void *v18;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = [HDStaticSyncExportTask alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[HDStaticSyncExportTask initWithProfile:options:storeIdentifier:URL:batchSize:](v15, "initWithProfile:options:storeIdentifier:URL:batchSize:", v16, a3, v14, v13, a6);

  -[HDStaticSyncExportTask runWithCompletion:](v17, "runWithCompletion:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (id)remote_runStaticSyncImportWithOptions:(unint64_t)a3 storeIdentifier:(id)a4 URL:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  HDStaticSyncImportTask *v13;
  void *v14;
  HDStaticSyncImportTask *v15;
  void *v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = [HDStaticSyncImportTask alloc];
  -[HDStandardTaskServer profile](self, "profile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[HDStaticSyncImportTask initWithProfile:options:storeIdentifier:URL:](v13, "initWithProfile:options:storeIdentifier:URL:", v14, a3, v12, v11);

  -[HDStaticSyncImportTask runWithCompletion:](v15, "runWithCompletion:", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (id)taskIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB6C60], "taskIdentifier");
}

+ (id)requiredEntitlements
{
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = *MEMORY[0x1E0CB59B0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
