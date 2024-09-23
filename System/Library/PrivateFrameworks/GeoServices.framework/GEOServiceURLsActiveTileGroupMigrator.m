@implementation GEOServiceURLsActiveTileGroupMigrator

- (BOOL)needsMigrationForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 dataSet:(id)a6
{
  id v8;
  void *v9;
  void *v10;
  int v11;

  v8 = a5;
  objc_msgSend(a4, "preferedURLSetFor:", a6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v8, "urlInfoSet");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v9) ^ 1;

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (GEOServiceURLsActiveTileGroupMigrator)initWithManifestConfiguration:(id)a3 mapLayerDataManager:(id)a4
{
  id v6;
  GEOServiceURLsActiveTileGroupMigrator *v7;
  GEOServiceURLsActiveTileGroupMigrator *v8;
  GEOServiceURLsActiveTileGroupMigrator *v9;
  objc_super v11;

  v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOServiceURLsActiveTileGroupMigrator;
  v7 = -[GEOServiceURLsActiveTileGroupMigrator init](&v11, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_manifestConfiguration, a3);
    v9 = v8;
  }

  return v8;
}

- (id)taskForNewTileGroup:(id)a3 inResourceManifest:(id)a4 oldTileGroup:(id)a5 activeScales:(id)a6 activeScenarios:(id)a7 dataSet:(id)a8 updateType:(int64_t)a9
{
  id v13;
  id v14;
  id v15;
  id v16;
  _GEOServiceURLsActiveTileGroupMigrationTask *v17;

  v13 = a8;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = -[_GEOServiceURLsActiveTileGroupMigrationTask initWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:oldTileGroup:dataSet:]([_GEOServiceURLsActiveTileGroupMigrationTask alloc], "initWithMigrator:manifestConfiguration:newTileGroup:inResourceManifest:oldTileGroup:dataSet:", self, self->_manifestConfiguration, v16, v15, v14, v13);

  return v17;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manifestConfiguration, 0);
}

@end
