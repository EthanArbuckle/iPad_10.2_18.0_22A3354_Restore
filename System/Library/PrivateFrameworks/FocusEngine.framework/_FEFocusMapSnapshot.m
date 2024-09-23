@implementation _FEFocusMapSnapshot

- (_FEFocusMapSnapshot)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 148, CFSTR("-init is not a valid initializer for this class."));

  return 0;
}

- (id)_initWithSnapshotter:(id)a3 mapArea:(id)a4 searchArea:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _FEFocusMapSnapshot *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  _FEFocusRegion *focusedRegion;
  void *v19;
  char v20;
  char v21;
  uint64_t v22;
  _FEFocusSearchInfo *searchInfo;
  uint64_t v24;
  _FEFocusMovementInfo *movementInfo;
  uint64_t v26;
  NSMutableSet *visitedRegionContainers;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  objc_super v33;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_16:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 155, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mapArea"));

    if (v11)
      goto LABEL_4;
    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 154, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("snapshotter"));

  if (!v10)
    goto LABEL_16;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_17:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 156, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("searchArea"));

LABEL_4:
  objc_msgSend(v10, "coordinateSpace");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12 != v13)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 157, CFSTR("The focus map snapshot's map area and search area must be expressed in the same coordinate space."));

  }
  v33.receiver = self;
  v33.super_class = (Class)_FEFocusMapSnapshot;
  v14 = -[_FEFocusMapSnapshot init](&v33, sel_init);
  if (v14)
  {
    objc_msgSend(v9, "focusSystem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->_focusSystem, v15);

    objc_msgSend(v9, "rootContainer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->_rootContainer, v16);

    objc_msgSend(v9, "focusedRegion");
    v17 = objc_claimAutoreleasedReturnValue();
    focusedRegion = v14->_focusedRegion;
    v14->_focusedRegion = (_FEFocusRegion *)v17;

    objc_msgSend(v9, "regionsContainer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v14->_regionsContainer, v19);

    if (objc_msgSend(v9, "clipToSnapshotRect"))
      v20 = 4;
    else
      v20 = 0;
    *(_BYTE *)&v14->_flags = *(_BYTE *)&v14->_flags & 0xFB | v20;
    if (objc_msgSend(v9, "ignoresRootContainerClippingRect"))
      v21 = 8;
    else
      v21 = 0;
    *(_BYTE *)&v14->_flags = *(_BYTE *)&v14->_flags & 0xF7 | v21;
    objc_msgSend(v9, "searchInfo");
    v22 = objc_claimAutoreleasedReturnValue();
    searchInfo = v14->_searchInfo;
    v14->_searchInfo = (_FEFocusSearchInfo *)v22;

    objc_msgSend(v9, "movementInfo");
    v24 = objc_claimAutoreleasedReturnValue();
    movementInfo = v14->_movementInfo;
    v14->_movementInfo = (_FEFocusMovementInfo *)v24;

    objc_storeStrong((id *)&v14->_mapArea, a4);
    objc_storeStrong((id *)&v14->_searchArea, a5);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v26 = objc_claimAutoreleasedReturnValue();
    visitedRegionContainers = v14->_visitedRegionContainers;
    v14->_visitedRegionContainers = (NSMutableSet *)v26;

    -[_FEFocusMapSnapshot _capture](v14, "_capture");
  }

  return v14;
}

- (void)dealloc
{
  __CFDictionary *subregionToRegionMap;
  __CFDictionary *regionToOccludingRegionsMap;
  __CFDictionary *regionToFocusItemCache;
  __CFDictionary *regionFrameCache;
  objc_super v7;

  subregionToRegionMap = self->_subregionToRegionMap;
  if (subregionToRegionMap)
  {
    CFRelease(subregionToRegionMap);
    self->_subregionToRegionMap = 0;
  }
  regionToOccludingRegionsMap = self->_regionToOccludingRegionsMap;
  if (regionToOccludingRegionsMap)
  {
    CFRelease(regionToOccludingRegionsMap);
    self->_regionToOccludingRegionsMap = 0;
  }
  regionToFocusItemCache = self->_regionToFocusItemCache;
  if (regionToFocusItemCache)
  {
    CFRelease(regionToFocusItemCache);
    self->_regionToFocusItemCache = 0;
  }
  regionFrameCache = self->_regionFrameCache;
  if (regionFrameCache)
  {
    CFRelease(regionFrameCache);
    self->_regionFrameCache = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)_FEFocusMapSnapshot;
  -[_FEFocusMapSnapshot dealloc](&v7, sel_dealloc);
}

- (NSArray)regions
{
  NSArray *regions;
  NSHashTable *filteredOriginalRegions;
  NSMutableArray *mutableUnoccludedRegions;
  id WeakRetained;
  NSHashTable *v8;
  _FEFocusMapSnapshot *v9;
  void *v10;
  void *v11;
  NSArray *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  void *v19;
  NSArray *v20;
  void *v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return (NSArray *)MEMORY[0x24BDBD1A8];
  regions = self->_regions;
  if (!regions)
  {
    mutableUnoccludedRegions = self->_mutableUnoccludedRegions;
    filteredOriginalRegions = self->_filteredOriginalRegions;
    WeakRetained = objc_loadWeakRetained((id *)&self->_regionsContainer);
    v8 = filteredOriginalRegions;
    v9 = self;
    +[_FEFocusRegionEvaluator regionsByEvaluatingOcclusionsForRegions:inSnapshot:](_FEFocusRegionEvaluator, "regionsByEvaluatingOcclusionsForRegions:inSnapshot:", mutableUnoccludedRegions, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (WeakRetained)
    {
      v22 = WeakRetained;
      v12 = (NSArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
      v23 = 0u;
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v21 = v11;
      v13 = v11;
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        do
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
            -[_FEFocusMapSnapshot originalRegionForRegion:](v9, "originalRegionForRegion:", v18, v21);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[NSHashTable containsObject:](v8, "containsObject:", v19))
              -[NSArray addObject:](v12, "addObject:", v18);

          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v15);
      }

      v11 = v21;
      WeakRetained = v22;
    }
    else
    {
      v12 = v10;
    }

    v20 = self->_regions;
    self->_regions = v12;

    regions = self->_regions;
  }
  return regions;
}

- (NSArray)originalRegions
{
  void *v4;
  void *v5;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if ((*(_BYTE *)&self->_flags & 1) == 0)
    return (NSArray *)MEMORY[0x24BDBD1A8];
  -[_FEFocusMapSnapshot regionsContainer](self, "regionsContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[NSHashTable allObjects](self->_filteredOriginalRegions, "allObjects");
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v6 = self->_mutableUnoccludedRegions;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[_FEFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10), (_QWORD)v13);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

    objc_msgSend(v5, "allObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v12;
  }
}

- (id)regionsForOriginalRegion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  void *v14;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 253, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalRegion"));

  }
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[_FEFocusMapSnapshot regions](self, "regions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[_FEFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == v5)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v9);
  }

  v14 = (void *)objc_msgSend(v6, "copy");
  return v14;
}

- (void)_trackSubregion:(id)a3 forRegion:(id)a4
{
  id v7;
  const void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id key;

  key = a3;
  v7 = a4;
  v8 = key;
  v9 = v7;
  if (key)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 271, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subregion"));

    v8 = 0;
    if (v9)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 272, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("originalRegion"));

  v8 = key;
LABEL_3:
  if (v8 == v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 273, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("subregion != originalRegion"));

    v8 = key;
  }
  CFDictionarySetValue(self->_subregionToRegionMap, v8, v9);

}

- (id)originalRegionForRegion:(id)a3
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 280, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

  }
  v6 = v5;
  CFDictionaryGetValue(self->_subregionToRegionMap, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (v7)
  {
    v9 = v6;
    do
    {
      v8 = v7;

      CFDictionaryGetValue(self->_subregionToRegionMap, v8);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v9 = v8;
    }
    while (v7);
  }

  return v8;
}

- (void)_trackOccludingRegion:(id)a3 forRegion:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[_FEFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetValue(self->_regionToOccludingRegionsMap, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "addObject:", v9);
  }
  else
  {
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v9, 0);
    CFDictionarySetValue(self->_regionToOccludingRegionsMap, v6, v8);
  }

}

- (id)occludingRegionsForRegion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 306, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

  }
  -[_FEFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetValue(self->_regionToOccludingRegionsMap, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = (void *)objc_msgSend(v7, "copy");
  else
    v9 = (void *)MEMORY[0x24BDBD1A8];

  return v9;
}

- (void)consumeRegionInformationForRegions:(id)a3 fromSnapshot:(id)a4
{
  CFDictionaryRef *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = (CFDictionaryRef *)a4;
  -[CFDictionaryRef coordinateSpace](v7, "coordinateSpace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_FEFocusMapSnapshot coordinateSpace](self, "coordinateSpace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 != v9)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 316, CFSTR("Unable to consume regions from a snapshot with a different coordinate system."));

  }
  v10 = (void *)objc_msgSend(v16, "mutableCopy");
  if (objc_msgSend(v10, "count"))
  {
    v11 = 0;
    do
    {
      objc_msgSend(v10, "objectAtIndexedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      CFDictionaryGetValue(v7[3], v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
      {
        CFDictionarySetValue(self->_subregionToRegionMap, v12, v13);
        objc_msgSend(v10, "addObject:", v13);
      }
      CFDictionaryGetValue(v7[4], v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
        CFDictionarySetValue(self->_regionToOccludingRegionsMap, v12, v14);

      ++v11;
    }
    while (v11 < objc_msgSend(v10, "count"));
  }

}

- (id)_cachedNextFocusedItemForRegion:(id)a3 withFocusMovementRequest:(id)a4 inMap:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p_%p_%p"), v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  CFDictionaryGetValue(self->_regionToFocusItemCache, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v8, "_nextFocusedItemForFocusMovementRequest:inMap:withSnapshot:", v9, v10, self);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v15 = (id)objc_claimAutoreleasedReturnValue();
    }
    v12 = v15;

    CFDictionarySetValue(self->_regionToFocusItemCache, v11, v12);
  }
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v16)
    v17 = 0;
  else
    v17 = v12;
  v18 = v17;

  return v18;
}

- (CGRect)snapshotFrameForRegion:(id)a3
{
  id v5;
  double *Value;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  CGRect result;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 350, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

  }
  Value = (double *)CFDictionaryGetValue(self->_regionFrameCache, v5);
  if (Value)
  {
    v7 = *Value;
    v8 = Value[1];
    v9 = Value[2];
    v10 = Value[3];
  }
  else
  {
    -[_FEFocusMapSnapshot coordinateSpace](self, "coordinateSpace");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[_FEFocusRegionEvaluator frameForRegion:inCoordinateSpace:](_FEFocusRegionEvaluator, "frameForRegion:inCoordinateSpace:", v5, v11);
    v7 = v12;
    v8 = v13;
    v9 = v14;
    v10 = v15;

    v16 = (double *)malloc_type_malloc(0x20uLL, 0x1000040E0EAB150uLL);
    *v16 = v7;
    v16[1] = v8;
    v16[2] = v9;
    v16[3] = v10;
    CFDictionarySetValue(self->_regionFrameCache, v5, v16);
  }

  v17 = v7;
  v18 = v8;
  v19 = v9;
  v20 = v10;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (void)markContainerAsProvidingDynamicContent
{
  NSHashTable *uncachableEnvironments;
  void *v3;
  id v4;

  uncachableEnvironments = self->_uncachableEnvironments;
  -[NSMutableArray lastObject](self->_stateStack, "lastObject");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "regionContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSHashTable addObject:](uncachableEnvironments, "addObject:", v3);

}

- (BOOL)hasOnlyStaticContent
{
  return -[NSHashTable count](self->_uncachableEnvironments, "count") == 0;
}

- (void)_capture
{
  NSArray *regions;
  NSMutableArray *v5;
  NSMutableArray *mutableUnoccludedRegions;
  NSHashTable *v7;
  NSHashTable *filteredOriginalRegions;
  const __CFAllocator *v9;
  NSMutableArray *v10;
  NSMutableArray *stateStack;
  NSHashTable *v12;
  NSHashTable *eligibleEnvironments;
  NSHashTable *v14;
  NSHashTable *ineligibleEnvironments;
  NSHashTable *v16;
  NSHashTable *uncachableEnvironments;
  id WeakRetained;
  void *v19;

  *(_BYTE *)&self->_flags &= ~1u;
  regions = self->_regions;
  self->_regions = 0;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  mutableUnoccludedRegions = self->_mutableUnoccludedRegions;
  self->_mutableUnoccludedRegions = v5;

  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 512);
  v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  filteredOriginalRegions = self->_filteredOriginalRegions;
  self->_filteredOriginalRegions = v7;

  if (*(_OWORD *)&self->_subregionToRegionMap != 0 || self->_regionToFocusItemCache || self->_regionFrameCache)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 392, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_subregionToRegionMap == NULL && _regionToOccludingRegionsMap == NULL && _regionToFocusItemCache == NULL && _regionFrameCache == NULL"));

  }
  v9 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  self->_subregionToRegionMap = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, &pointerKeyCallbacks, &pointerValueCallbacks);
  self->_regionToOccludingRegionsMap = CFDictionaryCreateMutable(v9, 0, &pointerKeyCallbacks, &equalValueCallbacks);
  self->_regionToFocusItemCache = CFDictionaryCreateMutable(v9, 0, &equalKeyCallbacks, &pointerValueCallbacks);
  self->_regionFrameCache = CFDictionaryCreateMutable(v9, 0, &pointerKeyCallbacks, &rectValueCallbacks);
  v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  stateStack = self->_stateStack;
  self->_stateStack = v10;

  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
  v12 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  eligibleEnvironments = self->_eligibleEnvironments;
  self->_eligibleEnvironments = v12;

  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
  v14 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  ineligibleEnvironments = self->_ineligibleEnvironments;
  self->_ineligibleEnvironments = v14;

  objc_msgSend(MEMORY[0x24BDD15C0], "hashTableWithOptions:", 517);
  v16 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
  uncachableEnvironments = self->_uncachableEnvironments;
  self->_uncachableEnvironments = v16;

  *(_BYTE *)&self->_flags &= ~2u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  -[_FEFocusMapSnapshot addRegionsInContainer:](self, "addRegionsInContainer:", WeakRetained);

  *(_BYTE *)&self->_flags |= 1u;
}

- (_FECoordinateSpace)coordinateSpace
{
  void *v2;
  void *v3;

  -[_FEFocusMapSnapshot _searchArea](self, "_searchArea");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "coordinateSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (_FECoordinateSpace *)v3;
}

- (void)addRegion:(id)a3
{
  void *v5;
  id v6;
  id WeakRetained;
  void *v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v13;
  id regions;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  int v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  double v33;
  double v34;
  id v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v38 = a3;
  if (!v38)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 424, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("region"));

  }
  -[NSMutableArray lastObject](self->_stateStack, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "regionContainerFocusSystem");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_focusSystem);
  if (v6 == WeakRetained)
  {
    -[_FEFocusMapSnapshot mapArea](self, "mapArea");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[_FEFocusMapSnapshot snapshotFrameForRegion:](self, "snapshotFrameForRegion:", v38);
    x = v40.origin.x;
    y = v40.origin.y;
    width = v40.size.width;
    height = v40.size.height;
    if (fabs(CGRectGetWidth(v40)) < 0.0001)
      goto LABEL_31;
    v41.origin.x = x;
    v41.origin.y = y;
    v41.size.width = width;
    v41.size.height = height;
    if (fabs(CGRectGetHeight(v41)) < 0.0001)
      goto LABEL_31;
    v13 = v38;
    if ((*(_BYTE *)&self->_flags & 4) != 0)
    {
      if (!objc_msgSend(v8, "intersectsRegion:inSnapshot:", v38, self))
      {
LABEL_31:

        goto LABEL_32;
      }
      if ((*(_BYTE *)&self->_flags & 4) != 0 && objc_msgSend(v38, "_shouldCropRegionToSearchArea"))
      {
        objc_msgSend(v8, "intersectionWithRegion:inSnapshot:", v38, self);
        regions = (id)objc_claimAutoreleasedReturnValue();
        v15 = v38;
        if (regions != v38)
        {
          if (regions)
          {
            -[_FEFocusMapSnapshot snapshotFrameForRegion:](self, "snapshotFrameForRegion:", regions);
            v15 = v38;
            x = v16;
            y = v17;
            width = v18;
            height = v19;
          }
          else
          {
            x = *MEMORY[0x24BDBF070];
            y = *(double *)(MEMORY[0x24BDBF070] + 8);
            width = *(double *)(MEMORY[0x24BDBF070] + 16);
            height = *(double *)(MEMORY[0x24BDBF070] + 24);
          }
        }

      }
      else
      {
        regions = v38;
      }
    }
    else
    {
      regions = v38;
    }
    if (regions)
    {
      if ((objc_msgSend(regions, "_isUnclippable", v13) & 1) != 0)
        goto LABEL_22;
      objc_msgSend(v6, "behavior");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "supportsClipToBounds");

      if (!v21)
        goto LABEL_22;
      -[NSMutableArray lastObject](self->_stateStack, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "clippingRect");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;

      v42.origin.x = v24;
      v42.origin.y = v26;
      v42.size.width = v28;
      v42.size.height = v30;
      if (CGRectIsNull(v42))
        goto LABEL_22;
      v43.origin.x = x;
      v43.origin.y = y;
      v43.size.width = width;
      v43.size.height = height;
      v46.origin.x = v24;
      v46.origin.y = v26;
      v46.size.width = v28;
      v46.size.height = v30;
      v44 = CGRectIntersection(v43, v46);
      v31 = v44.origin.x;
      v32 = v44.origin.y;
      v33 = v44.size.width;
      v34 = v44.size.height;
      v47.origin.x = x;
      v47.origin.y = y;
      v47.size.width = width;
      v47.size.height = height;
      if (CGRectEqualToRect(v44, v47))
      {
LABEL_22:
        v35 = regions;
        goto LABEL_23;
      }
      v45.origin.x = v31;
      v45.origin.y = v32;
      v45.size.width = v33;
      v45.size.height = v34;
      if (CGRectIsEmpty(v45))
      {
        v38 = 0;
LABEL_26:

        goto LABEL_31;
      }
      +[_FEFocusRegionEvaluator subregionFromRegion:withSnapshotFrame:inSnapshot:](_FEFocusRegionEvaluator, "subregionFromRegion:withSnapshotFrame:inSnapshot:", regions, self, v31, v32, v33, v34);
      v39 = (id)objc_claimAutoreleasedReturnValue();

      v35 = v39;
      if (v39)
      {
LABEL_23:
        v38 = v35;
        -[NSMutableArray addObject:](self->_mutableUnoccludedRegions, "addObject:");
        if ((*(_BYTE *)&self->_flags & 2) != 0)
        {
          -[_FEFocusMapSnapshot originalRegionForRegion:](self, "originalRegionForRegion:", v38);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSHashTable addObject:](self->_filteredOriginalRegions, "addObject:", v36);

        }
        regions = self->_regions;
        self->_regions = 0;
        goto LABEL_26;
      }
    }
    v38 = 0;
    goto LABEL_31;
  }
LABEL_32:

}

- (void)addRegions:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 475, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("regions"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[_FEFocusMapSnapshot addRegion:](self, "addRegion:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (void)addRegionsInContainer:(id)a3
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  NSHashTable *eligibleEnvironments;
  NSHashTable *ineligibleEnvironments;
  NSMutableArray *stateStack;
  id v12;
  NSHashTable *v13;
  NSHashTable *v14;
  NSMutableArray *v15;
  NSHashTable *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id WeakRetained;
  BOOL v26;
  double v27;
  double v28;
  double v29;
  double v30;
  id v31;
  NSMutableArray *v32;
  void *v33;
  id v34;
  NSMutableArray *v35;
  id v36;
  id v37;
  char v38;
  double height;
  double width;
  double y;
  double x;
  double v43;
  double v44;
  double v45;
  double v46;
  void *v47;
  int IsScrollableContainer;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  double v67;
  CGFloat v68;
  double v69;
  CGFloat v70;
  double v71;
  double MaxY;
  double v73;
  double MaxX;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  void *v86;
  double v87;
  CGFloat v88;
  double v89;
  CGFloat v90;
  double v91;
  CGFloat v92;
  double v93;
  CGFloat v94;
  void *v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  double v101;
  CGFloat v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  CGFloat v108;
  void *v109;
  BOOL IsNull;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  double MinX;
  double v121;
  double MinY;
  id v123;
  CGFloat v124;
  CGFloat v125;
  CGFloat v126;
  CGFloat v127;
  SEL v128;
  int v129;
  void *v130;
  _QWORD v131[3];
  char v132;
  uint64_t v133;
  uint64_t *v134;
  uint64_t v135;
  char v136;
  uint64_t v137;
  uint64_t *v138;
  uint64_t v139;
  uint64_t (*v140)(uint64_t, uint64_t);
  void (*v141)(uint64_t);
  id v142;
  uint64_t v143;
  uint64_t *v144;
  uint64_t v145;
  char IsEligibleForFocusOcclusion;
  uint8_t buf[16];
  void (*v148)(uint64_t, void *, _BYTE *);
  void *v149;
  id v150;
  id v151;
  NSHashTable *v152;
  NSHashTable *v153;
  uint64_t *v154;
  uint64_t *v155;
  _QWORD *v156;
  uint64_t *v157;
  uint64_t v158;
  CGRect v159;
  CGRect v160;
  CGRect v161;
  CGRect v162;
  CGRect v163;
  CGRect v164;
  CGRect v165;
  CGRect v166;
  CGRect v167;
  CGRect v168;
  CGRect v169;
  CGRect v170;
  CGRect v171;
  CGRect v172;
  CGRect v173;
  CGRect v174;
  CGRect v175;
  CGRect v176;
  CGRect v177;
  CGRect v178;
  CGRect v179;
  CGRect v180;
  CGRect v181;
  CGRect v182;
  CGRect v183;

  v158 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v113, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 483, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container"));

  }
  v6 = -[NSMutableSet count](self->_visitedRegionContainers, "count");
  -[NSMutableSet addObject:](self->_visitedRegionContainers, "addObject:", v5);
  v130 = v5;
  if (v6 == -[NSMutableSet count](self->_visitedRegionContainers, "count"))
  {
    logger();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(v5, "debugDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v8;
      _os_log_fault_impl(&dword_23C48C000, v7, OS_LOG_TYPE_FAULT, "Ignoring attempt to add focus items in already-visited container. This can potentially cause infinite recursion.\nContainer: %@", buf, 0xCu);

    }
    goto LABEL_74;
  }
  v128 = a2;
  eligibleEnvironments = self->_eligibleEnvironments;
  ineligibleEnvironments = self->_ineligibleEnvironments;
  stateStack = self->_stateStack;
  v12 = v5;
  v13 = eligibleEnvironments;
  v14 = ineligibleEnvironments;
  v15 = stateStack;
  if (v5)
  {
    if (v13)
      goto LABEL_8;
LABEL_76:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v116 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_FEFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_FEFocusRegionContainer>, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSArray<_FEFocusRegionSearchContextState *> *__strong)");
    v117 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v116, "handleFailureInFunction:file:lineNumber:description:", v117, CFSTR("_FEFocusMapSnapshot.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("eligibleEnvironments"));

    if (v14)
      goto LABEL_9;
    goto LABEL_77;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v114 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_FEFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_FEFocusRegionContainer>, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSArray<_FEFocusRegionSearchContextState *> *__strong)");
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v114, "handleFailureInFunction:file:lineNumber:description:", v115, CFSTR("_FEFocusMapSnapshot.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("container"));

  if (!v13)
    goto LABEL_76;
LABEL_8:
  if (v14)
    goto LABEL_9;
LABEL_77:
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v118 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "_FEFocusSystem *__UIFocusMapRecurseSearchForFocusSystemInEligibleContainer(__strong id<_FEFocusRegionContainer>, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSHashTable<id<_FEFocusEnvironment>> *__strong, NSArray<_FEFocusRegionSearchContextState *> *__strong)");
  v119 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v118, "handleFailureInFunction:file:lineNumber:description:", v119, CFSTR("_FEFocusMapSnapshot.m"), 35, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("ineligibleEnvironments"));

LABEL_9:
  v143 = 0;
  v144 = &v143;
  v145 = 0x2020000000;
  IsEligibleForFocusOcclusion = 0;
  IsEligibleForFocusOcclusion = _FEFocusEnvironmentIsEligibleForFocusOcclusion(v12, 0);
  if (*((_BYTE *)v144 + 24))
    v16 = v13;
  else
    v16 = v14;
  -[NSHashTable addObject:](v16, "addObject:", v12);
  if (*((_BYTE *)v144 + 24))
  {
    -[NSMutableArray lastObject](v15, "lastObject");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "regionContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v18, "_ui_isUIFocusRegionContainerProxy"))
    {
      objc_msgSend(v18, "owningEnvironment");
      v19 = objc_claimAutoreleasedReturnValue();

      v20 = v12;
      v18 = (void *)v19;
    }
    else
    {
      v20 = v12;
    }
    v137 = 0;
    v138 = &v137;
    v139 = 0x3032000000;
    v140 = __Block_byref_object_copy__1;
    v141 = __Block_byref_object_dispose__1;
    v142 = 0;
    v133 = 0;
    v134 = &v133;
    v135 = 0x2020000000;
    v136 = 0;
    v131[0] = 0;
    v131[1] = v131;
    v131[2] = 0x2020000000;
    v132 = 1;
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    v148 = ____UIFocusMapRecurseSearchForFocusSystemInEligibleContainer_block_invoke;
    v149 = &unk_250D3A490;
    v154 = &v137;
    v21 = v20;
    v150 = v21;
    v22 = v18;
    v151 = v22;
    v155 = &v133;
    v156 = v131;
    v152 = v13;
    v153 = v14;
    v157 = &v143;
    _FEFocusEnvironmentEnumerateAncestorEnvironments(v21, buf);
    if (*((_BYTE *)v144 + 24))
    {
      if (*((_BYTE *)v134 + 24))
      {
        -[NSMutableArray lastObject](v15, "lastObject");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "regionContainerFocusSystem");
        v7 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        +[_FEFocusSystem focusSystemForEnvironment:](_FEFocusSystem, "focusSystemForEnvironment:", v138[5]);
        v7 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      v7 = 0;
    }
    v12 = v20;

    _Block_object_dispose(v131, 8);
    _Block_object_dispose(&v133, 8);
    _Block_object_dispose(&v137, 8);

  }
  else
  {
    v7 = 0;
  }
  _Block_object_dispose(&v143, 8);

  if (!v7)
    goto LABEL_74;
  -[_FEFocusMapSnapshot regionsContainer](self, "regionsContainer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v129 = objc_msgSend(v12, "isEqual:", v24);
  if (v129 && (*(_BYTE *)&self->_flags & 2) == 0)
    *(_BYTE *)&self->_flags |= 2u;
  WeakRetained = objc_loadWeakRetained((id *)&self->_rootContainer);
  if ((objc_msgSend(v12, "isEqual:", WeakRetained) & 1) == 0)
  {

    goto LABEL_31;
  }
  v26 = (*(_BYTE *)&self->_flags & 8) == 0;

  if (v26)
  {
LABEL_31:
    v31 = objc_loadWeakRetained((id *)&self->_focusSystem);
    v32 = self->_stateStack;
    -[_FEFocusMapSnapshot coordinateSpace](self, "coordinateSpace");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v31;
    v35 = v32;
    v36 = v12;
    v37 = v33;
    v38 = objc_opt_respondsToSelector();
    v27 = *MEMORY[0x24BDBF070];
    v28 = *(double *)(MEMORY[0x24BDBF070] + 8);
    v29 = *(double *)(MEMORY[0x24BDBF070] + 16);
    v30 = *(double *)(MEMORY[0x24BDBF070] + 24);
    height = v30;
    width = v29;
    y = v28;
    x = *MEMORY[0x24BDBF070];
    if ((v38 & 1) != 0)
    {
      objc_msgSend(v36, "_clippingRectInCoordinateSpace:", v37);
      x = v43;
      y = v44;
      width = v45;
      height = v46;
    }
    v159.origin.x = x;
    v159.origin.y = y;
    v159.size.width = width;
    v159.size.height = height;
    if (!CGRectIsNull(v159) || -[NSMutableArray count](v35, "count"))
    {
      objc_msgSend(v36, "_focusItemContainer");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      IsScrollableContainer = _FEFocusItemContainerIsScrollableContainer(v47);
      *(_OWORD *)buf = *MEMORY[0x24BDBEFB0];
      if (IsScrollableContainer
        && objc_msgSend(v34, "_isScrollingScrollableContainer:targetContentOffset:", v47, buf))
      {
        v123 = v47;
        objc_msgSend(v123, "_focusContentOffset");
        v50 = v49;
        v52 = v51;
        objc_msgSend(v123, "_focusVisibleSize");
        v54 = v53;
        v56 = v55;
        objc_msgSend(v123, "_focusCoordinateSpace");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "convertRect:toCoordinateSpace:", v37, v50, v52, v54, v56);
        v126 = v59;
        v127 = v58;
        v124 = v61;
        v125 = v60;

        v160.origin.x = x;
        v160.origin.y = y;
        v160.size.width = width;
        v160.size.height = height;
        if (CGRectIsNull(v160))
        {
          x = v127;
          y = v126;
          width = v125;
          height = v124;
        }
        if (-[NSMutableArray count](v35, "count"))
        {
          -[NSMutableArray lastObject](v35, "lastObject");
          v62 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v62, "clippingRect");
          v64 = v63;
          v66 = v65;
          v68 = v67;
          v70 = v69;

          v161.origin.x = v64;
          v161.origin.y = v66;
          v161.size.width = v68;
          v161.size.height = v70;
          if (!CGRectIsNull(v161))
          {
            v162.origin.x = x;
            v162.origin.y = y;
            v162.size.width = width;
            v162.size.height = height;
            v181.origin.x = v64;
            v181.origin.y = v66;
            v181.size.width = v68;
            v181.size.height = v70;
            v163 = CGRectIntersection(v162, v181);
            x = v163.origin.x;
            y = v163.origin.y;
            width = v163.size.width;
            height = v163.size.height;
          }
        }
        v164.origin.x = x;
        v164.origin.y = y;
        v164.size.width = width;
        v164.size.height = height;
        MinY = CGRectGetMinY(v164);
        v165.origin.y = v126;
        v165.origin.x = v127;
        v165.size.height = v124;
        v165.size.width = v125;
        v121 = CGRectGetMinY(v165);
        v166.origin.x = x;
        v166.origin.y = y;
        v166.size.width = width;
        v166.size.height = height;
        MinX = CGRectGetMinX(v166);
        v167.origin.y = v126;
        v167.origin.x = v127;
        v167.size.height = v124;
        v167.size.width = v125;
        v71 = CGRectGetMinX(v167);
        v168.origin.y = v126;
        v168.origin.x = v127;
        v168.size.height = v124;
        v168.size.width = v125;
        MaxY = CGRectGetMaxY(v168);
        v169.origin.x = x;
        v169.origin.y = y;
        v169.size.width = width;
        v169.size.height = height;
        v73 = CGRectGetMaxY(v169);
        v170.origin.y = v126;
        v170.origin.x = v127;
        v170.size.height = v124;
        v170.size.width = v125;
        MaxX = CGRectGetMaxX(v170);
        v171.origin.x = x;
        v171.origin.y = y;
        v171.size.width = width;
        v171.size.height = height;
        v75 = MaxX - CGRectGetMaxX(v171);
        if (MinY - v121 >= 0.0)
          v76 = MinY - v121;
        else
          v76 = 0.0;
        if (MinX - v71 >= 0.0)
          v77 = MinX - v71;
        else
          v77 = 0.0;
        if (MaxY - v73 >= 0.0)
          v78 = MaxY - v73;
        else
          v78 = 0.0;
        if (v75 >= 0.0)
          v79 = v75;
        else
          v79 = 0.0;
        v80 = *(double *)buf;
        v81 = *(double *)&buf[8];
        objc_msgSend(v123, "_focusVisibleSize");
        v83 = v82;
        v85 = v84;
        objc_msgSend(v123, "_focusCoordinateSpace");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "convertRect:toCoordinateSpace:", v37, v80, v81, v83, v85);
        v88 = v87;
        v90 = v89;
        v92 = v91;
        v94 = v93;

        v172.origin.y = v126;
        v172.origin.x = v127;
        v172.size.height = v124;
        v172.size.width = v125;
        v182.origin.x = v88;
        v182.origin.y = v90;
        v182.size.width = v92;
        v182.size.height = v94;
        v173 = CGRectUnion(v172, v182);
        v27 = v77 + v173.origin.x;
        v28 = v76 + v173.origin.y;
        v29 = v173.size.width - (v77 + v79);
        v30 = v173.size.height - (v76 + v78);
        v173.origin.x = v77 + v173.origin.x;
        v173.origin.y = v76 + v173.origin.y;
        v173.size.width = v29;
        v173.size.height = v30;
        if (CGRectIsNull(v173))
        {
          v27 = *MEMORY[0x24BDBF090];
          v28 = *(double *)(MEMORY[0x24BDBF090] + 8);
          v29 = *(double *)(MEMORY[0x24BDBF090] + 16);
          v30 = *(double *)(MEMORY[0x24BDBF090] + 24);
        }

      }
      else
      {
        v174.origin.x = x;
        v174.origin.y = y;
        v174.size.width = width;
        v174.size.height = height;
        if (CGRectIsNull(v174))
        {
          -[NSMutableArray lastObject](v35, "lastObject");
          v95 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v95, "clippingRect");
          v27 = v96;
          v28 = v97;
          v29 = v98;
          v30 = v99;

        }
        else
        {
          if (-[NSMutableArray count](v35, "count"))
          {
            -[NSMutableArray lastObject](v35, "lastObject");
            v100 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "clippingRect");
            v102 = v101;
            v104 = v103;
            v106 = v105;
            v108 = v107;

            v175.origin.x = v102;
            v175.origin.y = v104;
            v175.size.width = v106;
            v175.size.height = v108;
            if (!CGRectIsNull(v175))
            {
              v176.origin.x = x;
              v176.origin.y = y;
              v176.size.width = width;
              v176.size.height = height;
              v183.origin.x = v102;
              v183.origin.y = v104;
              v183.size.width = v106;
              v183.size.height = v108;
              v177 = CGRectIntersection(v176, v183);
              x = v177.origin.x;
              y = v177.origin.y;
              width = v177.size.width;
              height = v177.size.height;
            }
          }
          v27 = x;
          v28 = y;
          v29 = width;
          v30 = height;
          v178.origin.x = x;
          v178.origin.y = y;
          v178.size.width = width;
          v178.size.height = height;
          if (CGRectIsNull(v178))
          {
            v27 = *MEMORY[0x24BDBF090];
            v28 = *(double *)(MEMORY[0x24BDBF090] + 8);
            v29 = *(double *)(MEMORY[0x24BDBF090] + 16);
            v30 = *(double *)(MEMORY[0x24BDBF090] + 24);
          }
        }
      }

    }
    goto LABEL_66;
  }
  v27 = *MEMORY[0x24BDBF070];
  v28 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v29 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v30 = *(double *)(MEMORY[0x24BDBF070] + 24);
LABEL_66:
  v179.origin.x = v27;
  v179.origin.y = v28;
  v179.size.width = v29;
  v179.size.height = v30;
  if (CGRectIsNull(v179))
  {
    if (-[NSMutableArray count](self->_stateStack, "count"))
    {
      -[NSMutableArray lastObject](self->_stateStack, "lastObject");
      v109 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v109, "clippingRect");
      IsNull = CGRectIsNull(v180);

      if (!IsNull)
      {
        objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
        v111 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v111, "handleFailureInMethod:object:file:lineNumber:description:", v128, self, CFSTR("_FEFocusMapSnapshot.m"), 512, CFSTR("Encountered a NULL clipping rect, which is invalid when previous containers are clipping."));

      }
    }
  }
  +[_FEFocusRegionSearchContextState stateWithRegionContainer:focusSystem:clippingRect:](_FEFocusRegionSearchContextState, "stateWithRegionContainer:focusSystem:clippingRect:", v12, v7, v27, v28, v29, v30);
  v112 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_stateStack, "addObject:", v112);
  objc_msgSend(v12, "_searchForFocusRegionsInContext:", self);
  -[NSMutableArray removeLastObject](self->_stateStack, "removeLastObject");
  if (v129 && (*(_BYTE *)&self->_flags & 2) != 0)
    *(_BYTE *)&self->_flags &= ~2u;

LABEL_74:
}

- (void)addRegionsInContainers:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_FEFocusMapSnapshot.m"), 529, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("containers"));

  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        -[_FEFocusMapSnapshot addRegionsInContainer:](self, "addRegionsInContainer:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i));
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (_FEFocusSystem)focusSystem
{
  return (_FEFocusSystem *)objc_loadWeakRetained((id *)&self->_focusSystem);
}

- (_FEFocusRegionContainer)rootContainer
{
  return (_FEFocusRegionContainer *)objc_loadWeakRetained((id *)&self->_rootContainer);
}

- (_FEFocusMapRect)mapArea
{
  return self->_mapArea;
}

- (_FEFocusRegion)focusedRegion
{
  return self->_focusedRegion;
}

- (_FEFocusRegionContainer)regionsContainer
{
  return (_FEFocusRegionContainer *)objc_loadWeakRetained((id *)&self->_regionsContainer);
}

- (_FEFocusSearchInfo)searchInfo
{
  return self->_searchInfo;
}

- (void)setSearchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_searchInfo, a3);
}

- (_FEFocusMovementInfo)movementInfo
{
  return self->_movementInfo;
}

- (void)setMovementInfo:(id)a3
{
  objc_storeStrong((id *)&self->_movementInfo, a3);
}

- (_FEFocusMapRect)_searchArea
{
  return self->_searchArea;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchArea, 0);
  objc_storeStrong((id *)&self->_movementInfo, 0);
  objc_storeStrong((id *)&self->_searchInfo, 0);
  objc_destroyWeak((id *)&self->_regionsContainer);
  objc_storeStrong((id *)&self->_focusedRegion, 0);
  objc_storeStrong((id *)&self->_mapArea, 0);
  objc_destroyWeak((id *)&self->_rootContainer);
  objc_destroyWeak((id *)&self->_focusSystem);
  objc_storeStrong((id *)&self->_visitedRegionContainers, 0);
  objc_storeStrong((id *)&self->_regions, 0);
  objc_storeStrong((id *)&self->_uncachableEnvironments, 0);
  objc_storeStrong((id *)&self->_ineligibleEnvironments, 0);
  objc_storeStrong((id *)&self->_eligibleEnvironments, 0);
  objc_storeStrong((id *)&self->_stateStack, 0);
  objc_storeStrong((id *)&self->_filteredOriginalRegions, 0);
  objc_storeStrong((id *)&self->_mutableUnoccludedRegions, 0);
}

- (id)debugQuickLookObject
{
  void *v2;
  void *v3;

  -[_FEFocusMapSnapshot _debugInfo](self, "_debugInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "image");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_FEFocusMapSnapshotDebugInfo)_debugInfo
{
  _FEFocusMapSnapshotDebugInfo *v3;

  objc_getAssociatedObject(self, sel__debugInfo);
  v3 = (_FEFocusMapSnapshotDebugInfo *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v3 = -[_FEFocusMapSnapshotDebugInfo initWithSnapshot:focusMapSearchInfo:]([_FEFocusMapSnapshotDebugInfo alloc], "initWithSnapshot:focusMapSearchInfo:", self, 0);
    objc_setAssociatedObject(self, sel__debugInfo, v3, (void *)1);
  }
  return v3;
}

- (id)_debugInfoWithFocusMapSearchInfo:(id)a3
{
  id v4;
  _FEFocusMapSnapshotDebugInfo *v5;

  v4 = a3;
  v5 = -[_FEFocusMapSnapshotDebugInfo initWithSnapshot:focusMapSearchInfo:]([_FEFocusMapSnapshotDebugInfo alloc], "initWithSnapshot:focusMapSearchInfo:", self, v4);

  return v5;
}

@end
