@implementation HKGraphSeriesConfigurationManager

- (HKGraphSeriesConfigurationManager)init
{
  HKGraphSeriesConfigurationManager *v2;
  uint64_t v3;
  NSMutableDictionary *zoomLevelConfigurationManagers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKGraphSeriesConfigurationManager;
  v2 = -[HKGraphSeriesConfigurationManager init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    zoomLevelConfigurationManagers = v2->_zoomLevelConfigurationManagers;
    v2->_zoomLevelConfigurationManagers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void)addConfiguration:(id)a3 zoom:(int64_t)a4
{
  id v6;
  int64_t v7;
  NSMutableDictionary *zoomLevelConfigurationManagers;
  void *v9;
  void *v10;
  void *v11;
  NSMutableDictionary *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  id v16;

  v6 = a3;
  v7 = -[HKGraphSeriesConfigurationManager _zoomLevelForGraphZoom:](self, "_zoomLevelForGraphZoom:", a4);
  zoomLevelConfigurationManagers = self->_zoomLevelConfigurationManagers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](zoomLevelConfigurationManagers, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    v11 = (void *)objc_opt_new();
    v12 = self->_zoomLevelConfigurationManagers;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  v14 = self->_zoomLevelConfigurationManagers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](v14, "objectForKeyedSubscript:", v16);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addConfiguration:", v6);

}

- (void)removeConfigurationsForDisplayType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMutableDictionary allValues](self->_zoomLevelConfigurationManagers, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "removeConfigurationForDisplayType:", v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)reset
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[NSMutableDictionary allValues](self->_zoomLevelConfigurationManagers, "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "reset");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (id)configurationForDisplayType:(id)a3 zoom:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HKGraphSeriesConfigurationManager _configurationManagerForZoom:](self, "_configurationManagerForZoom:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationForDisplayType:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)configurationForGraphSeries:(id)a3 zoom:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a3;
  -[HKGraphSeriesConfigurationManager _configurationManagerForZoom:](self, "_configurationManagerForZoom:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationForGraphSeries:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)allDisplayTypes
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  for (i = 2; i != 8; ++i)
  {
    -[HKGraphSeriesConfigurationManager allDisplayTypesForZoom:](self, "allDisplayTypesForZoom:", i);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v5);

  }
  objc_msgSend(v3, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)allDisplayTypesForZoom:(int64_t)a3
{
  void *v3;
  void *v4;

  -[HKGraphSeriesConfigurationManager _configurationManagerForZoom:](self, "_configurationManagerForZoom:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allDisplayTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)allGraphSeriesForZoom:(int64_t)a3
{
  void *v3;
  void *v4;

  -[HKGraphSeriesConfigurationManager _configurationManagerForZoom:](self, "_configurationManagerForZoom:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allGraphSeries");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)configurationContainsDisplayType:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HKGraphSeriesConfigurationManager allDisplayTypes](self, "allDisplayTypes", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v5);
        if (*(id *)(*((_QWORD *)&v10 + 1) + 8 * i) == v4)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (int64_t)_zoomLevelForGraphZoom:(int64_t)a3
{
  int64_t result;
  void *v6;

  result = 3;
  switch(a3)
  {
    case 0:
      result = 8;
      break;
    case 1:
      result = 7;
      break;
    case 2:
      result = 6;
      break;
    case 3:
      result = 5;
      break;
    case 4:
      result = 4;
      break;
    case 6:
      result = 2;
      break;
    case 7:
      result = 1;
      break;
    case 8:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HKGraphSeriesConfigurationManager.m"), 145, CFSTR("Invalid zoom level provided"));

      result = 3;
      break;
    default:
      return result;
  }
  return result;
}

- (id)_configurationManagerForZoom:(int64_t)a3
{
  int64_t v4;
  NSMutableDictionary *zoomLevelConfigurationManagers;
  void *v6;
  void *v7;

  v4 = -[HKGraphSeriesConfigurationManager _zoomLevelForGraphZoom:](self, "_zoomLevelForGraphZoom:", a3);
  zoomLevelConfigurationManagers = self->_zoomLevelConfigurationManagers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](zoomLevelConfigurationManagers, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoomLevelConfigurationManagers, 0);
}

@end
