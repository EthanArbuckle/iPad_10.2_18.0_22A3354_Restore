@implementation GEOResourcesVersionMigrator

- (GEOResourcesVersionMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4
{
  id v6;
  GEOResourcesVersionMigrator *v7;
  GEOResourcesVersionMigrator *v8;
  uint64_t v9;
  geo_isolater *isolater;
  uint64_t v11;
  NSMutableArray *runningTasks;
  GEOResourcesVersionMigrator *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOResourcesVersionMigrator;
  v7 = -[GEOResourcesVersionMigrator init](&v15, sel_init);
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
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = -[_GEOResourcesVersionMigrationTask initForRequiredWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:dataSet:oldTileGroup:activeScales:activeScenarios:]([_GEOResourcesVersionMigrationTask alloc], "initForRequiredWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:dataSet:oldTileGroup:activeScales:activeScenarios:", self, self->_manifestConfiguration, v20, v19, v15, v18, v17, v16);

  return v21;
}

- (id)opportunisticTaskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 activeNames:(id)a8 dataSet:(id)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  v17 = a9;
  if (objc_msgSend(v16, "count"))
    v18 = -[_GEOResourcesVersionMigrationTask initForOpportunisticWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:dataSet:oldTileGroup:activeNames:]([_GEOResourcesVersionMigrationTask alloc], "initForOpportunisticWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:dataSet:oldTileGroup:activeNames:", self, self->_manifestConfiguration, v13, v14, v17, v15, v16);
  else
    v18 = 0;

  return v18;
}

- (void)_addRunningTask:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

uint64_t __47__GEOResourcesVersionMigrator__addRunningTask___block_invoke(uint64_t a1)
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

uint64_t __50__GEOResourcesVersionMigrator__removeRunningTask___block_invoke(uint64_t a1)
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
