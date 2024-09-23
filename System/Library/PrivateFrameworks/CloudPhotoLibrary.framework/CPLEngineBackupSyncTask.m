@implementation CPLEngineBackupSyncTask

- (CPLEngineBackupSyncTask)initWithEngineLibrary:(id)a3 delegate:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CPLEngineBackupSyncTask;
  return -[CPLEngineForceSyncTask initWithScopeIdentifiers:engineLibrary:filter:delegate:](&v5, sel_initWithScopeIdentifiers_engineLibrary_filter_delegate_, MEMORY[0x1E0C9AA60], a3, 0, a4);
}

- (BOOL)forBackup
{
  return 1;
}

- (id)description
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v11;

  -[CPLEngineForceSyncTask _phaseDescription](self, "_phaseDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc(MEMORY[0x1E0CB3940]);
  v5 = objc_opt_class();
  -[CPLForceSyncTask taskIdentifier](self, "taskIdentifier");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v3)
    v8 = objc_msgSend(v4, "initWithFormat:", CFSTR("<%@ %@ (%@)>"), v5, v6, v3);
  else
    v8 = objc_msgSend(v4, "initWithFormat:", CFSTR("<%@ %@>"), v5, v6, v11);
  v9 = (void *)v8;

  return v9;
}

@end
