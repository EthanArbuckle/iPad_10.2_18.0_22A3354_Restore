@implementation ATXModeEntityStore

- (ATXModeEntityStore)init
{
  void *v3;
  ATXModeEntityStore *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXModeEntityStore initWithModeMetadataConstants:](self, "initWithModeMetadataConstants:", v3);

  return v4;
}

- (ATXModeEntityStore)initWithModeMetadataConstants:(id)a3
{
  id v5;
  ATXModeEntityStore *v6;
  uint64_t v7;
  NSMutableDictionary *entityStore;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ATXModeEntityStore;
  v6 = -[ATXModeEntityStore init](&v10, sel_init);
  if (v6)
  {
    v7 = objc_opt_new();
    entityStore = v6->_entityStore;
    v6->_entityStore = (NSMutableDictionary *)v7;

    objc_storeStrong((id *)&v6->_modeMetadataConstants, a3);
  }

  return v6;
}

- (id)appEntityForBundleId:(id)a3
{
  id v4;
  void *v5;
  ATXModeEntityStore *v6;
  void *v7;
  ATXSessionTaggingAppEntity *v8;

  v4 = a3;
  if (v4)
  {
    +[ATXSessionTaggingAppEntity keyForBundleId:](ATXSessionTaggingAppEntity, "keyForBundleId:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self;
    objc_sync_enter(v6);
    -[NSMutableDictionary objectForKeyedSubscript:](v6->_entityStore, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[NSMutableDictionary objectForKeyedSubscript:](v6->_entityStore, "objectForKeyedSubscript:", v5);
      v8 = (ATXSessionTaggingAppEntity *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = -[ATXSessionTaggingAppEntity initWithBundleId:modeMetadataConstants:]([ATXSessionTaggingAppEntity alloc], "initWithBundleId:modeMetadataConstants:", v4, v6->_modeMetadataConstants);
      -[NSMutableDictionary setObject:forKeyedSubscript:](v6->_entityStore, "setObject:forKeyedSubscript:", v8, v5);
    }
    objc_sync_exit(v6);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_modeMetadataConstants, 0);
  objc_storeStrong((id *)&self->_entityStore, 0);
}

@end
