@implementation GEOPOITypeMapping

void __42__GEOPOITypeMapping_typeToCategoryMapping__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[3];
  if (!v3)
  {
    objc_msgSend(v2, "loadPOICategoriesJSON");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (id)typeToCategoryMapping
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__97;
  v12 = __Block_byref_object_dispose__97;
  v13 = 0;
  v6 = MEMORY[0x1E0C809B0];
  geo_isolate_sync();
  v2 = (void *)v9[5];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary", v6, 3221225472, __42__GEOPOITypeMapping_typeToCategoryMapping__block_invoke, &unk_1E1BFF920, self, &v8);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (id)categoryForPOIType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = *(_QWORD *)&a3;
  -[GEOPOITypeMapping typeToCategoryMapping](self, "typeToCategoryMapping");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)sharedMapping
{
  if (qword_1ECDBCBD8 != -1)
    dispatch_once(&qword_1ECDBCBD8, &__block_literal_global_202);
  return (id)_MergedGlobals_333;
}

void __34__GEOPOITypeMapping_sharedMapping__block_invoke()
{
  GEOPOITypeMapping *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v0 = [GEOPOITypeMapping alloc];
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  +[GEOResourceManager sharedManager](GEOResourceManager, "sharedManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = -[GEOPOITypeMapping initWithResourceManifestManager:resourceManager:](v0, "initWithResourceManifestManager:resourceManager:", v4, v1);
  v3 = (void *)_MergedGlobals_333;
  _MergedGlobals_333 = v2;

}

- (GEOPOITypeMapping)init
{
  GEOPOITypeMapping *result;

  result = (GEOPOITypeMapping *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOPOITypeMapping)initWithResourceManifestManager:(id)a3 resourceManager:(id)a4
{
  id v7;
  id v8;
  GEOPOITypeMapping *v9;
  GEOPOITypeMapping *v10;
  uint64_t v11;
  geo_isolater *accessLock;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GEOPOITypeMapping;
  v9 = -[GEOPOITypeMapping init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_manifestManager, a3);
    objc_storeStrong((id *)&v10->_resourceManager, a4);
    v11 = geo_isolater_create();
    accessLock = v10->_accessLock;
    v10->_accessLock = (geo_isolater *)v11;

    -[GEOResourceManifestManager addTileGroupObserver:queue:](v10->_manifestManager, "addTileGroupObserver:queue:", v10, MEMORY[0x1E0C80D38]);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[GEOPOITypeMapping _tearDown](self, "_tearDown");
  v3.receiver = self;
  v3.super_class = (Class)GEOPOITypeMapping;
  -[GEOPOITypeMapping dealloc](&v3, sel_dealloc);
}

- (void)_tearDown
{
  GEOResourceManifestManager *manifestManager;

  -[GEOResourceManifestManager removeTileGroupObserver:](self->_manifestManager, "removeTileGroupObserver:", self);
  manifestManager = self->_manifestManager;
  self->_manifestManager = 0;

}

- (BOOL)isAlwaysVisiblePOIType:(int)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;

  v3 = *(_QWORD *)&a3;
  -[GEOPOITypeMapping alwaysVisibleTypes](self, "alwaysVisibleTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

- (id)typesForPOICategories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[GEOPOITypeMapping categoryToTypeMapping](self, "categoryToTypeMapping");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(v5, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11), (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v12)
          objc_msgSend(v6, "addObjectsFromArray:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (void)loadPOICategoriesJSON
{
  GEOResourceManager *resourceManager;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  resourceManager = self->_resourceManager;
  objc_msgSend(MEMORY[0x1E0CB34D0], "__geoBundle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOResourceManager dataForResourceWithName:fallbackBundle:](resourceManager, "dataForResourceWithName:fallbackBundle:", CFSTR("POITypeMapping.json"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v5, 0, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    if (v7)
    {
      GEOGetGEOPOICategoryLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Error parsing POI Categories JSON %@", buf, 0xCu);
      }

      if (GEOPOITypeMappingLogJSONFault_onceToken == -1)
        goto LABEL_16;
    }
    else
    {
      if (v6)
      {
        -[GEOPOITypeMapping parsePOICategoriesJSON:](self, "parsePOICategoriesJSON:", v6);
LABEL_16:

        goto LABEL_17;
      }
      GEOGetGEOPOICategoryLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Empty result returned when parsing POI Categories", buf, 2u);
      }

      if (GEOPOITypeMappingLogJSONFault_onceToken == -1)
        goto LABEL_16;
    }
    dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_112_1);
    goto LABEL_16;
  }
  GEOGetGEOPOICategoryLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Failed to read POI categories json", buf, 2u);
  }

  if (GEOPOITypeMappingLogJSONFault_onceToken != -1)
    dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_112_1);
LABEL_17:

}

- (void)parsePOICategoriesJSON:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  id v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "objectForKey:", CFSTR("always_visible_poi_types"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[GEOPOITypeMapping parseVisiblePOITypesJSON:](self, "parseVisiblePOITypesJSON:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", CFSTR("poi_category_mapping"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v19 = 0;
        v20 = 0;
        -[GEOPOITypeMapping parseCategoryMappingJSON:categoryToPOIType:POITypeToCategory:](self, "parseCategoryMappingJSON:categoryToPOIType:POITypeToCategory:", v7, &v20, &v19);
        v8 = v20;
        v9 = v20;
        v10 = v19;
        v11 = v19;
        v12 = v11;
        if (v6 && v9 && v11)
        {
          objc_storeStrong((id *)&self->_alwaysVisibleTypes, v6);
          objc_storeStrong((id *)&self->_categoryToTypeMapping, v8);
          objc_storeStrong((id *)&self->_typeToCategoryMapping, v10);
        }
      }
      else
      {
        GEOGetGEOPOICategoryLog();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v22 = (id)objc_opt_class();
          v18 = v22;
          _os_log_impl(&dword_1885A9000, v17, OS_LOG_TYPE_ERROR, "Unexpected type for POI category mapping %@", buf, 0xCu);

        }
        if (GEOPOITypeMappingLogJSONFault_onceToken != -1)
          dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_112_1);
        v12 = 0;
        v9 = 0;
      }

    }
    else
    {
      GEOGetGEOPOICategoryLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v22 = (id)objc_opt_class();
        v16 = v22;
        _os_log_impl(&dword_1885A9000, v15, OS_LOG_TYPE_ERROR, "Unexpected type for visible POIs value %@", buf, 0xCu);

      }
      if (GEOPOITypeMappingLogJSONFault_onceToken != -1)
        dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_112_1);
    }

  }
  else
  {
    GEOGetGEOPOICategoryLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = (id)objc_opt_class();
      v14 = v22;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "Unexpected type for POI category JSON %@", buf, 0xCu);

    }
    if (GEOPOITypeMappingLogJSONFault_onceToken != -1)
      dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_112_1);
  }

}

- (id)parseVisiblePOITypesJSON:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        else
        {
          GEOGetGEOPOICategoryLog();
          v11 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          {
            v12 = (void *)objc_opt_class();
            *(_DWORD *)buf = 138412290;
            v21 = v12;
            v13 = v12;
            _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Unexpected type for visible POI types entry. Expected NSNumber, found %@", buf, 0xCu);

          }
          if (GEOPOITypeMappingLogJSONFault_onceToken != -1)
            dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_112_1);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v7);
  }

  v14 = (void *)objc_msgSend(v4, "copy");
  return v14;
}

- (BOOL)parseCategoryMappingJSON:(id)a3 categoryToPOIType:(id *)a4 POITypeToCategory:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;

  v7 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 1;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v7, "count"));
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __82__GEOPOITypeMapping_parseCategoryMappingJSON_categoryToPOIType_POITypeToCategory___block_invoke;
  v14[3] = &unk_1E1C20A18;
  v10 = v9;
  v15 = v10;
  v11 = v8;
  v16 = v11;
  v17 = &v18;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v14);
  if (*((_BYTE *)v19 + 24))
  {
    v12 = 1;
    if (a4 && a5)
    {
      *a4 = (id)objc_msgSend(v11, "copy");
      *a5 = (id)objc_msgSend(v10, "copy");
      v12 = *((_BYTE *)v19 + 24) != 0;
    }
  }
  else
  {
    v12 = 0;
  }

  _Block_object_dispose(&v18, 8);
  return v12;
}

void __82__GEOPOITypeMapping_parseCategoryMappingJSON_categoryToPOIType_POITypeToCategory___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    GEOGetGEOPOICategoryLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = (id)objc_opt_class();
      v17 = v26;
      _os_log_impl(&dword_1885A9000, v16, OS_LOG_TYPE_ERROR, "Unexpected POI category mapping key type. Found %@", buf, 0xCu);

    }
    if (GEOPOITypeMappingLogJSONFault_onceToken == -1)
      goto LABEL_18;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v27 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v18, v7);

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v8);
      goto LABEL_19;
    }
    GEOGetGEOPOICategoryLog();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v26 = (id)objc_opt_class();
      v20 = v26;
      _os_log_impl(&dword_1885A9000, v19, OS_LOG_TYPE_ERROR, "Unexpected POI category mapping value type. Found %@", buf, 0xCu);

    }
    if (GEOPOITypeMappingLogJSONFault_onceToken == -1)
      goto LABEL_18;
LABEL_25:
    dispatch_once(&GEOPOITypeMappingLogJSONFault_onceToken, &__block_literal_global_112_1);
LABEL_18:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    *a4 = 1;
    goto LABEL_19;
  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "addObject:", v15, (_QWORD)v21);
          objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v15);
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v28, 16);
    }
    while (v12);
  }

  if (objc_msgSend(v9, "count"))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v9, v7);

LABEL_19:
}

- (id)alwaysVisibleTypes
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__97;
  v12 = __Block_byref_object_dispose__97;
  v13 = 0;
  v6 = MEMORY[0x1E0C809B0];
  geo_isolate_sync();
  v2 = (void *)v9[5];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set", v6, 3221225472, __39__GEOPOITypeMapping_alwaysVisibleTypes__block_invoke, &unk_1E1BFF920, self, &v8);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __39__GEOPOITypeMapping_alwaysVisibleTypes__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[1];
  if (!v3)
  {
    objc_msgSend(v2, "loadPOICategoriesJSON");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (id)categoryToTypeMapping
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v6;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__97;
  v12 = __Block_byref_object_dispose__97;
  v13 = 0;
  v6 = MEMORY[0x1E0C809B0];
  geo_isolate_sync();
  v2 = (void *)v9[5];
  if (v2)
  {
    v3 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionary", v6, 3221225472, __42__GEOPOITypeMapping_categoryToTypeMapping__block_invoke, &unk_1E1BFF920, self, &v8);
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __42__GEOPOITypeMapping_categoryToTypeMapping__block_invoke(uint64_t a1)
{
  _QWORD *v2;
  void *v3;

  v2 = *(_QWORD **)(a1 + 32);
  v3 = (void *)v2[2];
  if (!v3)
  {
    objc_msgSend(v2, "loadPOICategoriesJSON");
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), v3);
}

- (void)clearCachedValues
{
  geo_isolate_sync();
}

void __38__GEOPOITypeMapping_clearCachedValues__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 8);
  *(_QWORD *)(v2 + 8) = 0;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(v4 + 16);
  *(_QWORD *)(v4 + 16) = 0;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceManager, 0);
  objc_storeStrong((id *)&self->_manifestManager, 0);
  objc_storeStrong((id *)&self->_accessLock, 0);
  objc_storeStrong((id *)&self->_typeToCategoryMapping, 0);
  objc_storeStrong((id *)&self->_categoryToTypeMapping, 0);
  objc_storeStrong((id *)&self->_alwaysVisibleTypes, 0);
}

@end
