@implementation CLSBusinessCategoryCache

- (CLSBusinessCategoryCache)initWithURL:(id)a3 dataModelName:(id)a4
{
  CLSBusinessCategoryCache *v4;
  uint64_t v5;
  NSPredicate *predicateEntryWithUpdateTimestamp;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CLSBusinessCategoryCache;
  v4 = -[CLSDBCache initWithURL:dataModelName:](&v8, sel_initWithURL_dataModelName_, a3, a4);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(updateTimestamp <= $updateTimestamp)"));
    v5 = objc_claimAutoreleasedReturnValue();
    predicateEntryWithUpdateTimestamp = v4->_predicateEntryWithUpdateTimestamp;
    v4->_predicateEntryWithUpdateTimestamp = (NSPredicate *)v5;

  }
  return v4;
}

- (id)dataModelName
{
  return CFSTR("CLSBusinessCategoryCacheModel");
}

- (void)invalidateCacheItemsBeforeDateWithTimestamp:(double)a3
{
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  double v9;

  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __72__CLSBusinessCategoryCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke;
  v7[3] = &unk_1E84F9308;
  v9 = a3;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  objc_msgSend(v6, "performBlockAndWait:", v7);

}

- (void)invalidateCacheForGeoServiceProviderChangeToProvider:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  CLSBusinessCategoryCache *v11;

  v4 = a3;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __81__CLSBusinessCategoryCache_invalidateCacheForGeoServiceProviderChangeToProvider___block_invoke;
  v8[3] = &unk_1E84F8ED0;
  v9 = v4;
  v10 = v5;
  v11 = self;
  v6 = v5;
  v7 = v4;
  objc_msgSend(v6, "performBlockAndWait:", v8);

}

- (id)predicateForEntryNearbyRegion:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v6 = 0;
  v7 = 0;
  v5 = 0;
  v4 = 0;
  CLSCalculateRangeCoordinateForRegion(a3, (double *)&v7, (double *)&v6, (double *)&v5, (double *)&v4);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(latitude >= %f) && (latitude <= %f) && (longitude >= %f) && (longitude <= %f)"), v7, v5, v6, v4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)predicateForRegion:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v14 = 0;
  v15 = 0;
  v12 = 0;
  v13 = 0;
  v3 = a3;
  CLSCalculateRangeCoordinateForRegion(v3, (double *)&v15, (double *)&v14, (double *)&v13, (double *)&v12);
  v4 = (void *)MEMORY[0x1E0CB3880];
  v6 = v14;
  v5 = v15;
  v8 = v12;
  v7 = v13;
  objc_msgSend(v3, "radius");
  v10 = v9;

  objc_msgSend(v4, "predicateWithFormat:", CFSTR("(latitude >= %f) && (latitude <= %f) && (longitude >= %f) && (longitude <= %f) && (radius == %f)"), v5, v7, v6, v8, v10);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_fetchedBusinessItemByMUIDForBusinessItems:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  uint64_t v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v28 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * i), "muid"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v8);
  }

  -[CLSBusinessCategoryCache _fetchBusinessItemsForMUIDs:](self, "_fetchBusinessItemsForMUIDs:", v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v12, "count"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v14 = v12;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (j = 0; j != v16; ++j)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
        v20 = objc_msgSend(v19, "muid", (_QWORD)v23);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, v21);

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v16);
  }

  return v13;
}

- (void)insertBatchesOfBusinessItems:(id)a3 forRegions:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  CLSBusinessCategoryCache *v15;

  v10 = a3;
  v6 = a4;
  if (v10)
  {
    if (v6)
    {
      v7 = objc_msgSend(v6, "count");
      if (v7 == objc_msgSend(v10, "count"))
      {
        -[CLSDBCache managedObjectContext](self, "managedObjectContext");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __68__CLSBusinessCategoryCache_insertBatchesOfBusinessItems_forRegions___block_invoke;
        v11[3] = &unk_1E84F7950;
        v12 = v10;
        v13 = v6;
        v14 = v8;
        v15 = self;
        v9 = v8;
        objc_msgSend(v9, "performBlockAndWait:", v11);

      }
    }
  }

}

- (id)nearestItemForRegion:(id)a3 inItems:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  double v14;
  uint64_t i;
  void *v16;
  double v17;
  CLLocationDegrees v18;
  CLLocationDegrees v19;
  CLLocationCoordinate2D v20;
  double v21;
  double v22;
  id v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "center");
  v29 = v7;
  v30 = v8;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v26;
    v14 = 1.79769313e308;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v26 != v13)
          objc_enumerationMutation(v9);
        v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v16, "latitude", 0, 0, (_QWORD)v25);
        v18 = v17;
        objc_msgSend(v16, "longitude");
        v20 = CLLocationCoordinate2DMake(v18, v19);
        CLLocationCoordinate2DGetDistanceFrom();
        if (v21 < v14)
        {
          v22 = v21;
          v23 = v16;

          v12 = v23;
          v14 = v22;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16, *(_QWORD *)&v20.latitude, *(_QWORD *)&v20.longitude);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)businessItemsForRegion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1348;
  v18 = __Block_byref_object_dispose__1349;
  v19 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__CLSBusinessCategoryCache_businessItemsForRegion___block_invoke;
  v10[3] = &unk_1E84F9380;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)businessItemsInRegion:(id)a3 categories:(id)a4 maximumDistance:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  id v21;
  double v22;

  v8 = a3;
  v9 = a4;
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSDBCache managedObjectContext](self, "managedObjectContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __77__CLSBusinessCategoryCache_businessItemsInRegion_categories_maximumDistance___block_invoke;
    v17[3] = &unk_1E84F7978;
    v17[4] = self;
    v18 = v8;
    v19 = v11;
    v20 = v9;
    v22 = a5;
    v12 = v10;
    v21 = v12;
    v13 = v11;
    objc_msgSend(v13, "performBlockAndWait:", v17);
    v14 = v21;
    v15 = v12;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v15;
}

- (id)_businessItemInRegion:(id)a3 matchingCategories:(id)a4 maximumDistance:(double)a5 forBusinessItems:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  int v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  double v24;
  CLLocationDegrees v25;
  CLLocationDegrees v26;
  double v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t, char);
  void *v36;
  id v37;
  CLLocationCoordinate2D *v38;
  CLLocationCoordinate2D v39;
  uint64_t v40;
  int v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a6;
  v12 = v10;
  v39.latitude = 0.0;
  *(_QWORD *)&v39.longitude = &v39;
  v40 = 0x2020000000;
  v41 = 0;
  GEOSpatialLookupAllCategories();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = MEMORY[0x1E0C809B0];
  v34 = 3221225472;
  v35 = ___CLSBusinessCategoryCacheSerializeCategories_block_invoke;
  v36 = &unk_1E84F7A18;
  v14 = v12;
  v37 = v14;
  v38 = &v39;
  objc_msgSend(v13, "enumerateObjectsUsingBlock:", &v33);
  v15 = *(_DWORD *)(*(_QWORD *)&v39.longitude + 24);

  _Block_object_dispose(&v39, 8);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "center");
  v33 = v17;
  v34 = v18;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v19 = v11;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v19);
        v23 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        if ((objc_msgSend(v23, "categories", (_QWORD)v29) & v15) != 0)
        {
          v39.latitude = 0.0;
          v39.longitude = 0.0;
          objc_msgSend(v23, "latitude");
          v25 = v24;
          objc_msgSend(v23, "longitude");
          v39 = CLLocationCoordinate2DMake(v25, v26);
          CLLocationCoordinate2DGetDistanceFrom();
          if (v27 <= a5)
            objc_msgSend(v16, "addObject:", v23);
        }
      }
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
    }
    while (v20);
  }

  return v16;
}

- (id)businessItemsForMuid:(unint64_t)a3
{
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  CLSBusinessCategoryCache *v11;
  uint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1348;
  v18 = __Block_byref_object_dispose__1349;
  v19 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __49__CLSBusinessCategoryCache_businessItemsForMuid___block_invoke;
  v9[3] = &unk_1E84F79A0;
  v13 = a3;
  v6 = v5;
  v11 = self;
  v12 = &v14;
  v10 = v6;
  objc_msgSend(v6, "performBlockAndWait:", v9);
  v7 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v7;
}

- (id)businessItemsForMuids:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  CLSBusinessCategoryCache *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v4 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1348;
  v19 = __Block_byref_object_dispose__1349;
  v20 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __50__CLSBusinessCategoryCache_businessItemsForMuids___block_invoke;
  v10[3] = &unk_1E84F9380;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v13 = self;
  v14 = &v15;
  v12 = v7;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (id)businessItemFromManagedObject:(id)a3
{
  id v3;
  void *v4;
  double v5;
  CLLocationDegrees v6;
  double v7;
  CLLocationDegrees v8;
  double v9;
  double v10;
  uint64_t v11;
  CLLocationCoordinate2D v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  CLSBusinessItem *v20;
  CLSBusinessItem *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t, char);
  void *v33;
  id v34;
  int v35;

  v3 = a3;
  objc_msgSend(v3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "latitude");
  v6 = v5;
  objc_msgSend(v3, "longitude");
  v8 = v7;
  objc_msgSend(v3, "radius");
  v10 = v9;
  v11 = objc_msgSend(v3, "muid");
  v12 = CLLocationCoordinate2DMake(v6, v8);
  v13 = objc_alloc(MEMORY[0x1E0C9E368]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v13, "initWithCenter:radius:identifier:", v15, v12.latitude, v12.longitude, v10);

  LODWORD(v14) = objc_msgSend(v3, "categories");
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  GEOSpatialLookupAllCategories();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = MEMORY[0x1E0C809B0];
  v31 = 3221225472;
  v32 = ___CLSBusinessCategoryCacheDeserializeCategories_block_invoke;
  v33 = &unk_1E84F7A40;
  v35 = (int)v14;
  v19 = v17;
  v34 = v19;
  objc_msgSend(v18, "enumerateObjectsUsingBlock:", &v30);

  if (v19)
  {
    v20 = [CLSBusinessItem alloc];
    v21 = -[CLSBusinessItem initWithName:region:categories:](v20, "initWithName:region:categories:", v4, v16, v19, v30, v31, v32, v33);
    -[CLSBusinessItem setMuid:](v21, "setMuid:", v11);
    -[CLSBusinessItem setCached:](v21, "setCached:", 1);
    objc_msgSend(v3, "businessCategories");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v22)
    {
      objc_msgSend(v22, "componentsSeparatedByString:", CFSTR("_#_"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v24 = 0;
    }
    -[CLSBusinessItem setBusinessCategories:](v21, "setBusinessCategories:", v24);

    -[CLSBusinessItem setVenueCapacity:](v21, "setVenueCapacity:", objc_msgSend(v3, "venueCapacity"));
    objc_msgSend(v3, "geoServiceProvider");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSBusinessItem setGeoServiceProvider:](v21, "setGeoServiceProvider:", v27);

    objc_msgSend(v3, "isoCountryCode");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[CLSBusinessItem setIsoCountryCode:](v21, "setIsoCountryCode:", v28);

  }
  else
  {
    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging", v30, v31, v32, v33);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "loggingConnection");
    v26 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v30) = 0;
      _os_log_error_impl(&dword_1CAB79000, v26, OS_LOG_TYPE_ERROR, "An error occurred unarchiving categories value for business item", (uint8_t *)&v30, 2u);
    }

    v21 = 0;
  }

  return v21;
}

- (BOOL)hasRegion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[5];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__CLSBusinessCategoryCache_hasRegion___block_invoke;
  v9[3] = &unk_1E84F9380;
  v9[4] = self;
  v6 = v4;
  v10 = v6;
  v7 = v5;
  v11 = v7;
  v12 = &v13;
  objc_msgSend(v7, "performBlockAndWait:", v9);
  LOBYTE(v5) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v5;
}

- (unint64_t)numberOfBusinessItemsForRegion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  unint64_t v8;
  _QWORD v10[5];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __59__CLSBusinessCategoryCache_numberOfBusinessItemsForRegion___block_invoke;
  v10[3] = &unk_1E84F9380;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  v7 = v5;
  v12 = v7;
  v13 = &v14;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (id)_fetchBusinessItemsForMUIDs:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__1348;
  v18 = __Block_byref_object_dispose__1349;
  v19 = 0;
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__CLSBusinessCategoryCache__fetchBusinessItemsForMUIDs___block_invoke;
  v10[3] = &unk_1E84F79C8;
  v6 = v4;
  v11 = v6;
  v13 = &v14;
  v7 = v5;
  v12 = v7;
  objc_msgSend(v7, "performBlockAndWait:", v10);
  v8 = (id)v15[5];

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)_updateManagedBusinessItem:(id)a3 withBusinessItem:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t, char);
  void *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "region");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "categories");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  GEOSpatialLookupAllCategories();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v24 = 3221225472;
  v25 = ___CLSBusinessCategoryCacheSerializeCategories_block_invoke;
  v26 = &unk_1E84F7A18;
  v10 = v8;
  v27 = v10;
  v28 = &v29;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v23);
  v11 = *((unsigned int *)v30 + 6);

  _Block_object_dispose(&v29, 8);
  objc_msgSend(v7, "center", v23, v24, v25, v26);
  v13 = v12;
  v15 = v14;
  objc_msgSend(v5, "setMuid:", objc_msgSend(v6, "muid"));
  objc_msgSend(v5, "setVenueCapacity:", objc_msgSend(v6, "venueCapacity"));
  objc_msgSend(v5, "setLatitude:", v13);
  objc_msgSend(v5, "setLongitude:", v15);
  objc_msgSend(v7, "radius");
  objc_msgSend(v5, "setRadius:");
  objc_msgSend(v5, "setCategories:", v11);
  objc_msgSend(v6, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setName:", v16);

  objc_msgSend(v6, "businessCategories");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v17);
    objc_msgSend(v18, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "componentsJoinedByString:", CFSTR("_#_"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v20 = 0;
  }
  objc_msgSend(v5, "setBusinessCategories:", v20);

  objc_msgSend(v6, "geoServiceProvider");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGeoServiceProvider:", v21);

  objc_msgSend(v6, "isoCountryCode");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsoCountryCode:", v22);

}

- (id)updateBusinessItems:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  CLSBusinessCategoryCache *v15;
  id v16;
  void *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CLSDBCache managedObjectContext](self, "managedObjectContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __48__CLSBusinessCategoryCache_updateBusinessItems___block_invoke;
  v13[3] = &unk_1E84F7950;
  v14 = v4;
  v15 = self;
  v7 = v5;
  v16 = v7;
  v17 = v6;
  v8 = v6;
  v9 = v4;
  objc_msgSend(v8, "performBlockAndWait:", v13);
  v10 = v17;
  v11 = v7;

  return v11;
}

- (NSPredicate)predicateEntryWithUpdateTimestamp
{
  return self->_predicateEntryWithUpdateTimestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predicateEntryWithUpdateTimestamp, 0);
}

void __48__CLSBusinessCategoryCache_updateBusinessItems___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  uint64_t v31;
  id obj;
  uint64_t v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v31 = a1;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
  v5 = 0x1E0CB3000uLL;
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v43 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v9, "muid", v31));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, v10);

      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v47, 16);
    }
    while (v6);
  }

  v11 = (id *)v31;
  v12 = *(void **)(v31 + 40);
  objc_msgSend(v2, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_fetchBusinessItemsForMUIDs:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v14;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v33)
  {
    v15 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v39 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(*(id *)(v5 + 2024), "numberWithUnsignedLongLong:", objc_msgSend(v17, "muid", v31));
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "objectForKeyedSubscript:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = v2;
          objc_msgSend(v2, "removeObjectForKey:", v18);
          objc_msgSend(v19, "name");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setName:", v21);

          objc_msgSend(v17, "setVenueCapacity:", objc_msgSend(v19, "venueCapacity"));
          objc_msgSend(v19, "businessCategories");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count"))
          {
            v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v22);
            objc_msgSend(v23, "allObjects");
            v24 = v15;
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "componentsJoinedByString:", CFSTR("_#_"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            v15 = v24;
            v11 = (id *)v31;
          }
          else
          {
            v26 = 0;
          }
          objc_msgSend(v17, "setBusinessCategories:", v26);

          objc_msgSend(v11[5], "businessItemFromManagedObject:", v17);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
            objc_msgSend(v11[6], "addObject:", v27);

          v5 = 0x1E0CB3000;
          v2 = v20;
        }

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v33);
  }

  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __48__CLSBusinessCategoryCache_updateBusinessItems___block_invoke_2;
  v34[3] = &unk_1E84F79F0;
  v28 = v11[7];
  v29 = v11[5];
  v30 = v11[6];
  v35 = v28;
  v36 = v29;
  v37 = v30;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v34);
  objc_msgSend(v11[5], "_save");

}

void __48__CLSBusinessCategoryCache_updateBusinessItems___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0C97B20];
  v5 = a3;
  +[CLSManagedBusinessItem entityName](CLSManagedBusinessItem, "entityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "insertNewObjectForEntityForName:inManagedObjectContext:", v6, *(_QWORD *)(a1 + 32));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "_updateManagedBusinessItem:withBusinessItem:", v8, v5);
  objc_msgSend(*(id *)(a1 + 40), "businessItemFromManagedObject:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

}

void __56__CLSBusinessCategoryCache__fetchBusinessItemsForMUIDs___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSManagedBusinessItem entityName](CLSManagedBusinessItem, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("muid IN %@"), a1[4]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = (void *)a1[5];
  v11 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v11);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v11;
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v7;

}

void __59__CLSBusinessCategoryCache_numberOfBusinessItemsForRegion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSBusinessCacheEntry entityName](CLSBusinessCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 32), "predicateForRegion:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = *(void **)(a1 + 48);
  v18 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C97B48];
    +[CLSManagedBusinessItem entityName](CLSManagedBusinessItem, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entry == %@)"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v13);
    v14 = *(void **)(a1 + 48);
    v17 = v8;
    v15 = objc_msgSend(v14, "countForFetchRequest:error:", v12, &v17);
    v16 = v17;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v15;
    v8 = v16;
  }

}

void __38__CLSBusinessCategoryCache_hasRegion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  BOOL v9;
  char v10;
  id v11;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSBusinessCacheEntry entityName](CLSBusinessCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "predicateForRegion:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = *(void **)(a1 + 48);
  v11 = 0;
  v7 = objc_msgSend(v6, "countForFetchRequest:error:", v4, &v11);
  v8 = v11;
  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  v10 = !v9;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v10;

}

void __50__CLSBusinessCategoryCache_businessItemsForMuids___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  id v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSManagedBusinessItem entityName](CLSManagedBusinessItem, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("muid in %@"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = *(void **)(a1 + 40);
  v22 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v22);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v22;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = v7;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        v16 = 0;
        do
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          objc_msgSend(*(id *)(a1 + 48), "businessItemFromManagedObject:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v16));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v17);

          ++v16;
        }
        while (v14 != v16);
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v14);
    }

  }
}

void __49__CLSBusinessCategoryCache_businessItemsForMuid___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;

  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSManagedBusinessItem entityName](CLSManagedBusinessItem, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("muid == %lu"), *(_QWORD *)(a1 + 56));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  objc_msgSend(v4, "setFetchLimit:", 1);
  v6 = *(void **)(a1 + 32);
  v13 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "businessItemFromManagedObject:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

  }
}

void __77__CLSBusinessCategoryCache_businessItemsInRegion_categories_maximumDistance___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  id v29;
  id v30;
  uint8_t buf[4];
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSBusinessCacheEntry entityName](CLSBusinessCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "predicateForEntryNearbyRegion:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = *(void **)(a1 + 48);
  v30 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v30);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v30;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(*(id *)(a1 + 32), "nearestItemForRegion:inItems:", *(_QWORD *)(a1 + 40), v7);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C97B48];
    +[CLSManagedBusinessItem entityName](CLSManagedBusinessItem, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entry == %@)"), v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:");
    v13 = *(void **)(a1 + 48);
    v29 = v8;
    objc_msgSend(v13, "executeFetchRequest:error:", v12, &v29);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v29;

    objc_msgSend(*(id *)(a1 + 32), "_businessItemInRegion:matchingCategories:maximumDistance:forBusinessItems:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 56), v14, *(double *)(a1 + 72));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v26;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v26 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(a1 + 32), "businessItemFromManagedObject:", *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v19));
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (v20)
            objc_msgSend(*(id *)(a1 + 64), "addObject:", v20);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
      }
      while (v17);
    }

    v8 = v22;
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v21 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138477827;
    v32 = v21;
    _os_log_debug_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[BusinessCache] No Entry for region %{private}@", buf, 0xCu);
  }

}

void __51__CLSBusinessCategoryCache_businessItemsForRegion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSBusinessCacheEntry entityName](CLSBusinessCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(*(id *)(a1 + 32), "predicateForRegion:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPredicate:", v5);

  v6 = *(void **)(a1 + 48);
  v32 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v4, &v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;
  if (v7 && objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0C97B48];
    +[CLSManagedBusinessItem entityName](CLSManagedBusinessItem, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(entry == %@)"), v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v13);
    v14 = *(void **)(a1 + 48);
    v31 = v8;
    objc_msgSend(v14, "executeFetchRequest:error:", v12, &v31);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v31;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v15, "count"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v19 = v15;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v28;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v28 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(a1 + 32), "businessItemFromManagedObject:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v23));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "addObject:", v24);

          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v21);
    }

    v8 = v25;
  }

}

uint64_t __68__CLSBusinessCategoryCache_insertBatchesOfBusinessItems_forRegions___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id obj;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *context;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSince1970");
  v4 = v3;

  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  obj = *(id *)(a1 + 32);
  v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v27)
  {
    v5 = 0;
    v26 = *(_QWORD *)v38;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v38 != v26)
          objc_enumerationMutation(obj);
        v31 = v6;
        v7 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * v6);
        context = (void *)MEMORY[0x1D1796094]();
        v32 = v5;
        objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", v5);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = (void *)MEMORY[0x1E0C97B20];
        +[CLSBusinessCacheEntry entityName](CLSBusinessCacheEntry, "entityName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "insertNewObjectForEntityForName:inManagedObjectContext:", v10, *(_QWORD *)(a1 + 48));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "center");
        v13 = v12;
        objc_msgSend(v11, "setLatitude:");
        objc_msgSend(v11, "setLongitude:", v13);
        v29 = v8;
        objc_msgSend(v8, "radius");
        objc_msgSend(v11, "setRadius:");
        v28 = v11;
        objc_msgSend(v11, "setUpdateTimestamp:", v4);
        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0u;
        v34 = 0u;
        v35 = 0u;
        v36 = 0u;
        v15 = v7;
        v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v34;
          do
          {
            v19 = 0;
            do
            {
              if (*(_QWORD *)v34 != v18)
                objc_enumerationMutation(v15);
              v20 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * v19);
              v21 = (void *)MEMORY[0x1E0C97B20];
              +[CLSManagedBusinessItem entityName](CLSManagedBusinessItem, "entityName");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "insertNewObjectForEntityForName:inManagedObjectContext:", v22, *(_QWORD *)(a1 + 48));
              v23 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(*(id *)(a1 + 56), "_updateManagedBusinessItem:withBusinessItem:", v23, v20);
              objc_msgSend(v14, "addObject:", v23);

              ++v19;
            }
            while (v17 != v19);
            v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
          }
          while (v17);
        }
        v5 = v32 + 1;

        objc_msgSend(v28, "setBusinessItems:", v14);
        objc_autoreleasePoolPop(context);
        v6 = v31 + 1;
      }
      while (v31 + 1 != v27);
      v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v27);
  }

  return objc_msgSend(*(id *)(a1 + 56), "_save");
}

void __81__CLSBusinessCategoryCache_invalidateCacheForGeoServiceProviderChangeToProvider___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  id v54;
  id v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  uint64_t v60;
  _QWORD v61[5];

  v61[2] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSManagedBusinessItem entityName](CLSManagedBusinessItem, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("geoServiceProvider != %@"), *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D71A98], "autoNaviCountryCode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(MEMORY[0x1E0D71A98], "isAutoNaviRevGeoProvider:", *(_QWORD *)(a1 + 32)))
    v7 = CFSTR("isoCountryCode == %@");
  else
    v7 = CFSTR("isoCountryCode != %@");
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", v7, v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v48 = (void *)v8;
  v61[0] = v8;
  v61[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v61, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", v11);
  v12 = *(void **)(a1 + 40);
  v55 = 0;
  objc_msgSend(v12, "executeFetchRequest:error:", v4, &v55);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v55;
  if (objc_msgSend(v13, "count"))
  {
    v46 = v6;
    v15 = (void *)MEMORY[0x1E0C97B48];
    +[CLSBusinessCacheEntry entityName](CLSBusinessCacheEntry, "entityName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchRequestWithEntityName:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("ANY businessItems IN %@"), v13);
    v18 = objc_claimAutoreleasedReturnValue();

    v44 = (void *)v18;
    objc_msgSend(v17, "setPredicate:", v18);
    v45 = v17;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithFetchRequest:", v17);
    objc_msgSend(v19, "setResultType:", 2);
    v20 = *(void **)(a1 + 40);
    v54 = v14;
    v43 = v19;
    objc_msgSend(v20, "executeRequest:error:", v19, &v54);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v54;

    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "loggingConnection");
    v24 = objc_claimAutoreleasedReturnValue();

    v47 = v5;
    v42 = v4;
    if (v22)
    {
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v22;
        _os_log_error_impl(&dword_1CAB79000, v24, OS_LOG_TYPE_ERROR, "Failed to batch-delete business cache entries: Error: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v21, "result");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v58 = v25;
      v59 = 2112;
      v60 = v26;
      _os_log_impl(&dword_1CAB79000, v24, OS_LOG_TYPE_INFO, "Batch deleted %@ business cache entries, for provider %@", buf, 0x16u);

    }
    v27 = v21;

    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v29 = v13;
    v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
    if (v30)
    {
      v31 = v30;
      v32 = *(_QWORD *)v51;
      do
      {
        for (i = 0; i != v31; ++i)
        {
          if (*(_QWORD *)v51 != v32)
            objc_enumerationMutation(v29);
          objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "objectID");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObject:", v34);

        }
        v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v56, 16);
      }
      while (v31);
    }

    v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C97A90]), "initWithObjectIDs:", v28);
    v36 = *(void **)(a1 + 40);
    v49 = v22;
    objc_msgSend(v36, "executeRequest:error:", v35, &v49);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v49;

    +[CLSLogging sharedLogging](CLSLogging, "sharedLogging");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "loggingConnection");
    v39 = objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v5 = v47;
      v4 = v42;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v14;
        _os_log_error_impl(&dword_1CAB79000, v39, OS_LOG_TYPE_ERROR, "Failed to batch-delete business cache entries: Error: %@", buf, 0xCu);
      }
    }
    else
    {
      v5 = v47;
      v4 = v42;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v37, "result");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138412546;
        v58 = v40;
        v59 = 2112;
        v60 = v41;
        _os_log_impl(&dword_1CAB79000, v39, OS_LOG_TYPE_INFO, "Batch deleted %@ business items, for provider %@", buf, 0x16u);

      }
    }

    objc_msgSend(*(id *)(a1 + 48), "_save");
    v11 = v44;
    v6 = v46;
  }

}

void __72__CLSBusinessCategoryCache_invalidateCacheItemsBeforeDateWithTimestamp___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  unint64_t v15;
  void *v16;
  unint64_t v17;
  unint64_t v18;
  id v19;
  id v20;
  const __CFString *v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0C97B48];
  +[CLSBusinessCacheEntry entityName](CLSBusinessCacheEntry, "entityName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fetchRequestWithEntityName:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "predicateEntryWithUpdateTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = CFSTR("updateTimestamp");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)(a1 + 48));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "predicateWithSubstitutionVariables:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setPredicate:", v8);
  objc_msgSend(*(id *)(a1 + 32), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  objc_msgSend(v9, "executeFetchRequest:error:", v4, &v20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v20;

  if (v10)
  {
    v11 = objc_msgSend(v10, "count");
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      do
      {
        v14 = (void *)MEMORY[0x1D1796094]();
        v15 = 0;
        do
        {
          objc_msgSend(v10, "objectAtIndexedSubscript:", v13 + v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 40), "deleteObject:", v16);
          v17 = v13 + v15 + 1;

          v18 = v15 + 1;
          if (v15 > 0x12)
            break;
          ++v15;
        }
        while (v17 < v12);
        objc_msgSend(*(id *)(a1 + 32), "_save");
        objc_autoreleasePoolPop(v14);
        v13 += v18;
      }
      while (v17 < v12);
    }
  }

}

@end
