@implementation GEOSearchAttributionManifestVersionMigrator

- (BOOL)needsMigrationForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 dataSet:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;

  v8 = a5;
  objc_msgSend(a4, "preferedURLSetFor:", a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "hasSearchAttributionManifestURL"))
  {
    objc_msgSend(v8, "urlInfoSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "searchAttributionManifestURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "searchAttributionManifestURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "url");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v12, "isEqualToString:", v14) ^ 1;

  }
  else
  {
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (GEOSearchAttributionManifestVersionMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4
{
  id v6;
  GEOSearchAttributionManifestVersionMigrator *v7;
  GEOSearchAttributionManifestVersionMigrator *v8;
  uint64_t v9;
  geo_isolater *isolater;
  uint64_t v11;
  NSMutableArray *runningTasks;
  GEOSearchAttributionManifestVersionMigrator *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOSearchAttributionManifestVersionMigrator;
  v7 = -[GEOSearchAttributionManifestVersionMigrator init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_manifestConfiguration, a3);
    v9 = geo_isolater_create();
    isolater = v8->_isolater;
    v8->_isolater = (geo_isolater *)v9;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v11 = objc_claimAutoreleasedReturnValue();
    runningTasks = v8->_runningTasks;
    v8->_runningTasks = (NSMutableArray *)v11;

    v13 = v8;
  }

  return v8;
}

- (id)taskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 dataSet:(id)a8 updateType:(int64_t)a9
{
  id v12;
  id v13;
  id v14;
  void *v15;
  _GEOSearchAttributionManifestVersionMigrationTask *v16;
  void *v17;
  void *v18;
  _GEOSearchAttributionManifestVersionMigrationTask *v19;

  v12 = a4;
  v13 = a5;
  v14 = a8;
  if (-[GEOResourceManifestConfiguration isDefaultConfiguration](self->_manifestConfiguration, "isDefaultConfiguration"))
  {
    objc_msgSend(v12, "preferedURLSetFor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = [_GEOSearchAttributionManifestVersionMigrationTask alloc];
    objc_msgSend(v15, "searchAttributionManifestURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "nsURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[_GEOSearchAttributionManifestVersionMigrationTask initWithMigrator:newSearchAttributionManifestURL:oldTileGroup:](v16, "initWithMigrator:newSearchAttributionManifestURL:oldTileGroup:", self, v18, v13);

  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (void)_addRunningTask:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

uint64_t __63__GEOSearchAttributionManifestVersionMigrator__addRunningTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

- (void)_removeRunningTask:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

uint64_t __66__GEOSearchAttributionManifestVersionMigrator__removeRunningTask___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_runningTasks, 0);
  objc_storeStrong((id *)&self->_isolater, 0);
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
}

@end
