@implementation _HKGraphSeriesZoomLevelConfigurationManager

- (_HKGraphSeriesZoomLevelConfigurationManager)init
{
  _HKGraphSeriesZoomLevelConfigurationManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *displayTypeIdentifierToConfiguration;
  NSMutableDictionary *v5;
  NSMutableDictionary *graphSeriesUUIDToConfiguration;
  uint64_t v7;
  NSMutableArray *graphSeriesInOrderAdded;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)_HKGraphSeriesZoomLevelConfigurationManager;
  v2 = -[_HKGraphSeriesZoomLevelConfigurationManager init](&v10, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    displayTypeIdentifierToConfiguration = v2->_displayTypeIdentifierToConfiguration;
    v2->_displayTypeIdentifierToConfiguration = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    graphSeriesUUIDToConfiguration = v2->_graphSeriesUUIDToConfiguration;
    v2->_graphSeriesUUIDToConfiguration = v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    graphSeriesInOrderAdded = v2->_graphSeriesInOrderAdded;
    v2->_graphSeriesInOrderAdded = (NSMutableArray *)v7;

  }
  return v2;
}

- (void)addConfiguration:(id)a3
{
  NSMutableDictionary *displayTypeIdentifierToConfiguration;
  id v5;
  void *v6;
  void *v7;
  NSMutableDictionary *graphSeriesUUIDToConfiguration;
  void *v9;
  void *v10;
  NSMutableArray *graphSeriesInOrderAdded;
  id v12;

  displayTypeIdentifierToConfiguration = self->_displayTypeIdentifierToConfiguration;
  v5 = a3;
  objc_msgSend(v5, "displayType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_HKGraphSeriesZoomLevelConfigurationManager _displayTypeIdentifierForDisplayType:](self, "_displayTypeIdentifierForDisplayType:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](displayTypeIdentifierToConfiguration, "setObject:forKey:", v5, v7);

  graphSeriesUUIDToConfiguration = self->_graphSeriesUUIDToConfiguration;
  objc_msgSend(v5, "graphSeries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](graphSeriesUUIDToConfiguration, "setObject:forKey:", v5, v10);

  graphSeriesInOrderAdded = self->_graphSeriesInOrderAdded;
  objc_msgSend(v5, "graphSeries");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableArray addObject:](graphSeriesInOrderAdded, "addObject:", v12);
}

- (void)removeConfigurationForDisplayType:(id)a3
{
  id v4;
  NSMutableDictionary *displayTypeIdentifierToConfiguration;
  void *v6;
  NSMutableDictionary *graphSeriesUUIDToConfiguration;
  void *v8;
  void *v9;
  NSMutableArray *graphSeriesInOrderAdded;
  void *v11;
  id v12;

  v4 = a3;
  -[_HKGraphSeriesZoomLevelConfigurationManager configurationForDisplayType:](self, "configurationForDisplayType:", v4);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  displayTypeIdentifierToConfiguration = self->_displayTypeIdentifierToConfiguration;
  -[_HKGraphSeriesZoomLevelConfigurationManager _displayTypeIdentifierForDisplayType:](self, "_displayTypeIdentifierForDisplayType:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary removeObjectForKey:](displayTypeIdentifierToConfiguration, "removeObjectForKey:", v6);
  if (v12)
  {
    graphSeriesUUIDToConfiguration = self->_graphSeriesUUIDToConfiguration;
    objc_msgSend(v12, "graphSeries");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary removeObjectForKey:](graphSeriesUUIDToConfiguration, "removeObjectForKey:", v9);

    graphSeriesInOrderAdded = self->_graphSeriesInOrderAdded;
    objc_msgSend(v12, "graphSeries");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](graphSeriesInOrderAdded, "removeObject:", v11);

  }
}

- (void)reset
{
  -[NSMutableDictionary removeAllObjects](self->_displayTypeIdentifierToConfiguration, "removeAllObjects");
  -[NSMutableDictionary removeAllObjects](self->_graphSeriesUUIDToConfiguration, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_graphSeriesInOrderAdded, "removeAllObjects");
}

- (id)configurationForDisplayType:(id)a3
{
  NSMutableDictionary *displayTypeIdentifierToConfiguration;
  void *v4;
  void *v5;

  displayTypeIdentifierToConfiguration = self->_displayTypeIdentifierToConfiguration;
  -[_HKGraphSeriesZoomLevelConfigurationManager _displayTypeIdentifierForDisplayType:](self, "_displayTypeIdentifierForDisplayType:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](displayTypeIdentifierToConfiguration, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)configurationForGraphSeries:(id)a3
{
  NSMutableDictionary *graphSeriesUUIDToConfiguration;
  void *v4;
  void *v5;

  graphSeriesUUIDToConfiguration = self->_graphSeriesUUIDToConfiguration;
  objc_msgSend(a3, "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](graphSeriesUUIDToConfiguration, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)allDisplayTypes
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_graphSeriesInOrderAdded;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[_HKGraphSeriesZoomLevelConfigurationManager configurationForGraphSeries:](self, "configurationForGraphSeries:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8), (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "displayType");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)allGraphSeries
{
  return self->_graphSeriesInOrderAdded;
}

- (id)_displayTypeIdentifierForDisplayType:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a3, "displayTypeIdentifier"));
}

- (NSMutableDictionary)displayTypeIdentifierToConfiguration
{
  return self->_displayTypeIdentifierToConfiguration;
}

- (void)setDisplayTypeIdentifierToConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_displayTypeIdentifierToConfiguration, a3);
}

- (NSMutableDictionary)graphSeriesUUIDToConfiguration
{
  return self->_graphSeriesUUIDToConfiguration;
}

- (void)setGraphSeriesUUIDToConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_graphSeriesUUIDToConfiguration, a3);
}

- (NSMutableArray)graphSeriesInOrderAdded
{
  return self->_graphSeriesInOrderAdded;
}

- (void)setGraphSeriesInOrderAdded:(id)a3
{
  objc_storeStrong((id *)&self->_graphSeriesInOrderAdded, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphSeriesInOrderAdded, 0);
  objc_storeStrong((id *)&self->_graphSeriesUUIDToConfiguration, 0);
  objc_storeStrong((id *)&self->_displayTypeIdentifierToConfiguration, 0);
}

@end
