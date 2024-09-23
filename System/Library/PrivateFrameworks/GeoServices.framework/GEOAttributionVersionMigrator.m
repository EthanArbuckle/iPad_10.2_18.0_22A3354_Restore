@implementation GEOAttributionVersionMigrator

- (GEOAttributionVersionMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4
{
  id v6;
  GEOAttributionVersionMigrator *v7;
  GEOAttributionVersionMigrator *v8;
  uint64_t v9;
  geo_isolater *isolater;
  uint64_t v11;
  NSMutableArray *runningTasks;
  GEOAttributionVersionMigrator *v13;
  objc_super v15;

  v6 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOAttributionVersionMigrator;
  v7 = -[GEOAttributionVersionMigrator init](&v15, sel_init);
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
  id v13;
  id v14;
  id v15;
  id v16;
  _GEOAttributionMigrationTask *v17;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a8;
  if (GEOConfigGetBOOL(GeoServicesConfig_ManifestLoadPlainTextAttribution, (uint64_t)off_1EDF4E1D8))
    v17 = -[_GEOAttributionMigrationTask initWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:oldTileGroup:dataSet:]([_GEOAttributionMigrationTask alloc], "initWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:oldTileGroup:dataSet:", self, self->_manifestConfiguration, v13, v14, v15, v16);
  else
    v17 = 0;

  return v17;
}

- (void)_addRunningTask:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  geo_isolate_sync_data();

}

uint64_t __49__GEOAttributionVersionMigrator__addRunningTask___block_invoke(uint64_t a1)
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

uint64_t __52__GEOAttributionVersionMigrator__removeRunningTask___block_invoke(uint64_t a1)
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
