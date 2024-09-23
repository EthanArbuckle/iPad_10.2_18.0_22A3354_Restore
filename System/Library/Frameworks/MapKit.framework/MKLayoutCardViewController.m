@implementation MKLayoutCardViewController

- (BOOL)isTransitItem
{
  void *v2;
  char v3;

  -[MKLayoutCardViewController mapItem](self, "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_isMapItemTypeTransit");

  return v3;
}

- (BOOL)isLayoutDynamic
{
  void *v2;
  BOOL v3;

  -[MKLayoutCardViewController _layoutModuleForMapItem](self, "_layoutModuleForMapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)_layoutModuleForMapItem
{
  void *v3;
  void *v4;
  void *v5;

  if (GEOConfigGetBOOL())
  {
    GEOConfigGetArray();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3
      || (objc_msgSend(MEMORY[0x1E0D27238], "moduleLayoutEntryFromArray:", v3),
          (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if ((GEOConfigGetBOOL() & 1) != 0)
      {
        v4 = 0;
      }
      else
      {
        -[MKLayoutCardViewController mapItem](self, "mapItem");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "_placecardLayout");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_createModuleLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLayoutCardViewController setCacheVC:](self, "setCacheVC:", v5);

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKLayoutCardViewController setCacheModuleType:](self, "setCacheModuleType:", v6);

  -[MKLayoutCardViewController _layoutModuleForMapItem](self, "_layoutModuleForMapItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "modules");
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        -[MKLayoutCardViewController _createViewControllerForModule:](self, "_createViewControllerForModule:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          -[MKLayoutCardViewController cacheVC](self, "cacheVC");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v11, "type"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

          -[MKLayoutCardViewController cacheModuleType](self, "cacheModuleType");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v12, "hash"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v11, v16);

          if (objc_msgSend(v11, "type") == 5)
          {
            objc_msgSend(v4, "lastObject");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v17, "setBottomHairlineHidden:", 1);

          }
          objc_msgSend(v4, "addObject:", v12);
        }

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

}

- (id)_cachedViewControllerForModule:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[MKLayoutCardViewController cacheVC](self, "cacheVC");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_createViewControllerForModule:(id)a3
{
  return 0;
}

- (MKMapItem)mapItem
{
  return self->_mapItem;
}

- (void)setMapItem:(id)a3
{
  objc_storeStrong((id *)&self->_mapItem, a3);
}

- (NSMutableDictionary)cacheVC
{
  return self->_cacheVC;
}

- (void)setCacheVC:(id)a3
{
  objc_storeStrong((id *)&self->_cacheVC, a3);
}

- (NSMutableDictionary)cacheModuleType
{
  return self->_cacheModuleType;
}

- (void)setCacheModuleType:(id)a3
{
  objc_storeStrong((id *)&self->_cacheModuleType, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheModuleType, 0);
  objc_storeStrong((id *)&self->_cacheVC, 0);
  objc_storeStrong((id *)&self->_mapItem, 0);
}

@end
