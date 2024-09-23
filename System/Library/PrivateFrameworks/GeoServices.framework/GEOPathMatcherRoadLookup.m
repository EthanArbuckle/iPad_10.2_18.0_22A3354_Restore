@implementation GEOPathMatcherRoadLookup

- (GEOPathMatcherRoadLookup)initWithAuditToken:(id)a3
{
  id v4;
  GEOPathMatcherRoadLookup *v5;
  GEOPathMatcherRoadLookup *v6;
  void *v7;
  GEOMapFeatureAccess *v8;
  GEOMapFeatureAccess *mapFeatureAccess;
  NSCache *v10;
  NSCache *roadsCache;
  GEOPathMatcherRoadLookup *v13;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOPathMatcherRoadLookup;
  v5 = -[GEOPathMatcherRoadLookup init](&v14, sel_init);
  v6 = v5;
  if (v5)
  {
    v13 = v5;
    v7 = (void *)geo_dispatch_queue_create_with_format();
    v8 = -[GEOMapFeatureAccess initWithQueue:]([GEOMapFeatureAccess alloc], "initWithQueue:", v7, v13);
    mapFeatureAccess = v6->_mapFeatureAccess;
    v6->_mapFeatureAccess = v8;

    -[GEOMapFeatureAccess setAuditToken:](v6->_mapFeatureAccess, "setAuditToken:", v4);
    -[GEOMapFeatureAccess setAllowNetworkTileLoad:](v6->_mapFeatureAccess, "setAllowNetworkTileLoad:", 1);
    -[GEOMapFeatureAccess setJoinAllRoadsByMuid:](v6->_mapFeatureAccess, "setJoinAllRoadsByMuid:", 1);
    v10 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    roadsCache = v6->_roadsCache;
    v6->_roadsCache = v10;

    -[NSCache setCountLimit:](v6->_roadsCache, "setCountLimit:", 200);
  }

  return v6;
}

- (void)dealloc
{
  NSObject *v3;
  unint64_t mapFeatureRoadsCount;
  unint64_t cacheMissCount;
  objc_super v6;
  uint8_t buf[4];
  int v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  GEOGetGEOPathMatcherLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    cacheMissCount = self->_cacheMissCount;
    mapFeatureRoadsCount = self->_mapFeatureRoadsCount;
    *(_DWORD *)buf = 67109376;
    v8 = mapFeatureRoadsCount;
    v9 = 1024;
    v10 = cacheMissCount;
    _os_log_impl(&dword_1885A9000, v3, OS_LOG_TYPE_INFO, "Path matcher roads requested: %d, cache misses: %d", buf, 0xEu);
  }

  v6.receiver = self;
  v6.super_class = (Class)GEOPathMatcherRoadLookup;
  -[GEOPathMatcherRoadLookup dealloc](&v6, sel_dealloc);
}

- (GEOPathMatcherRoadKey)keyForRoad:(SEL)a3
{
  uint64_t v5;
  double v6;
  double v7;
  int64_t v8;
  uint64_t v9;
  unint64_t v10;
  GEOPathMatcherRoadKey *result;
  id v12;

  v12 = a4;
  if (objc_msgSend(v12, "coordinateCount"))
  {
    v5 = objc_msgSend(v12, "coordinates3d");
    v7 = *(double *)v5;
    v6 = *(double *)(v5 + 8);
  }
  else
  {
    v6 = -180.0;
    v7 = -180.0;
  }
  v8 = objc_msgSend(v12, "signedMuid");
  v9 = objc_msgSend(v12, "roadID");
  if (v8)
    v10 = 0;
  else
    v10 = v9;
  retstr->var0 = v8;
  retstr->var1 = v10;
  retstr->var2 = v7;
  retstr->var3 = v6;

  return result;
}

- (id)roadForKey:(GEOPathMatcherRoadKey *)a3
{
  __int128 v5;
  void *v6;
  double var3;
  double var2;
  NSObject *v9;
  void **v10;
  id v11;
  void *__p;
  char v14;
  _QWORD v15[11];
  char v16;
  uint64_t v17;
  _OWORD v18[2];
  uint8_t buf[4];
  void **v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = *(_OWORD *)&a3->var2;
  v18[0] = *(_OWORD *)&a3->var0;
  v18[1] = v5;
  -[GEOPathMatcherRoadLookup _roadForKey:](self, "_roadForKey:", v18);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    ++self->_cacheMissCount;
    if (!a3->var0
      || (var3 = a3->var3, var3 < -180.0)
      || var3 > 180.0
      || (var2 = a3->var2, var2 < -90.0)
      || var2 > 90.0
      || (-[GEOPathMatcherRoadLookup findRoadWithMuid:nearCoordinate:](self, "findRoadWithMuid:nearCoordinate:"),
          (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      if (a3->var1
        && (-[GEOMapFeatureAccess synchronousFindRoadWithID:](self->_mapFeatureAccess, "synchronousFindRoadWithID:"),
            (v6 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        ++self->_mapFeatureRoadsCount;
        -[GEOPathMatcherRoadLookup _cacheRoad:](self, "_cacheRoad:", v6);
      }
      else
      {
        std::ostringstream::basic_ostringstream[abi:ne180100]((uint64_t)v15);
        operator<<(v15, a3);
        GEOGetGEOPathMatcherLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          std::stringbuf::str();
          v10 = v14 >= 0 ? &__p : (void **)__p;
          *(_DWORD *)buf = 136315138;
          v20 = v10;
          _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_ERROR, "Error finding road with key: %s. This will probably cause path matching to fail.", buf, 0xCu);
          if (v14 < 0)
            operator delete(__p);
        }

        v15[0] = *MEMORY[0x1E0DE4F60];
        *(_QWORD *)((char *)v15 + *(_QWORD *)(v15[0] - 24)) = *(_QWORD *)(MEMORY[0x1E0DE4F60] + 24);
        v15[1] = MEMORY[0x1E0DE4FB8] + 16;
        if (v16 < 0)
          operator delete((void *)v15[9]);
        std::streambuf::~streambuf();
        std::ostream::~ostream();
        MEMORY[0x18D764310](&v17);
        v6 = 0;
      }
    }
  }
  v11 = v6;

  return v11;
}

- (GEOPathMatcherRoadKey)flippedRoad:(SEL)a3
{
  __int128 v7;
  void *v8;
  void *v9;
  int64_t var0;
  int64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  GEOPathMatcherRoadKey *result;
  _OWORD v24[2];
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = *(_OWORD *)&a4->var2;
  v24[0] = *(_OWORD *)&a4->var0;
  v24[1] = v7;
  -[GEOPathMatcherRoadLookup _roadForKey:](self, "_roadForKey:", v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  var0 = a4->var0;
  v11 = -a4->var0;
  if (v8)
  {
    objc_msgSend(v8, "flippedCopy");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    ++self->_mapFeatureRoadsCount;
    objc_msgSend(v12, "firstCoordinate");
    v14 = v13;
    v16 = v15;
    v17 = objc_msgSend(v12, "roadID");
    if (var0)
      v18 = 0;
    else
      v18 = v17;
    retstr->var0 = v11;
    retstr->var1 = v18;
    retstr->var2 = v14;
    retstr->var3 = v16;
    if (v12)
    {
      -[GEOPathMatcherRoadLookup _cacheRoad:](self, "_cacheRoad:", v12);
    }
    else
    {
      GEOGetGEOPathMatcherLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v21 = objc_msgSend(v9, "roadID");
        v22 = objc_msgSend(v9, "signedMuid");
        *(_DWORD *)buf = 134218240;
        v26 = v21;
        v27 = 2048;
        v28 = v22;
        _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "Error creating flipped road for roadID: %llu, muid: %lld", buf, 0x16u);
      }

    }
  }
  else
  {
    ++self->_cacheMissCount;
    v19 = a4->var1 ^ 1;
    if (var0)
      v19 = 0;
    retstr->var0 = v11;
    retstr->var1 = v19;
    *(_OWORD *)&retstr->var2 = *(_OWORD *)&a4->var2;
  }

  return result;
}

- (id)findRoadWithMuid:(int64_t)a3 nearCoordinate:(id)a4
{
  int64_t v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v11;
  $F24F406B2B787EFB06265DBA3D28CBD5 v12;
  uint8_t buf[4];
  int64_t v14;
  __int16 v15;
  int v16;
  __int16 v17;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  if (!a3)
    return 0;
  if (a3 >= 0)
    v6 = a3;
  else
    v6 = -a3;
  -[GEOMapFeatureAccess synchronousFindRoadWithMuid:nearCoordinate:](self->_mapFeatureAccess, "synchronousFindRoadWithMuid:nearCoordinate:", v6, *(_QWORD *)&v12.var0, *(_QWORD *)&v12.var1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (a3 < 0)
      objc_msgSend(v7, "flip");
    ++self->_mapFeatureRoadsCount;
    -[GEOPathMatcherRoadLookup _cacheRoad:](self, "_cacheRoad:", v8);
    v9 = v8;
  }
  else
  {
    GEOGetGEOPathMatcherLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218499;
      v14 = v6;
      v15 = 1040;
      v16 = 16;
      v17 = 2097;
      v18 = &v12;
      _os_log_impl(&dword_1885A9000, v11, OS_LOG_TYPE_ERROR, "Could not find road with muid %llu near coordinate %{private,geo:coordinate}.*P", buf, 0x1Cu);
    }

  }
  return v8;
}

- (id)findRoadsNearCoordinate:(id)a3 radius:(double)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[GEOMapFeatureAccess synchronousFindRoadsNear:radius:](self->_mapFeatureAccess, "synchronousFindRoadsNear:radius:", a3.var0, a3.var1, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  self->_mapFeatureRoadsCount += objc_msgSend(v5, "count");
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v12;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v6);
        -[GEOPathMatcherRoadLookup _cacheRoad:](self, "_cacheRoad:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v9++), (_QWORD)v11);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  return v6;
}

- (id)findOutgoingRoadsFrom:(GEOPathMatcherRoadKey *)a3
{
  __int128 v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[2];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&a3->var2;
  v16[0] = *(_OWORD *)&a3->var0;
  v16[1] = v4;
  -[GEOPathMatcherRoadLookup roadForKey:](self, "roadForKey:", v16);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapFeatureAccess synchronousFindRoadsFromNextIntersectionOf:](self->_mapFeatureAccess, "synchronousFindRoadsFromNextIntersectionOf:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  self->_mapFeatureRoadsCount += objc_msgSend(v6, "count");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v7);
        -[GEOPathMatcherRoadLookup _cacheRoad:](self, "_cacheRoad:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v10++), (_QWORD)v12);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

  return v7;
}

- (id)_roadForKey:(GEOPathMatcherRoadKey *)a3
{
  NSCache *roadsCache;
  unint64_t var0;
  void *v5;
  void *v6;

  roadsCache = self->_roadsCache;
  var0 = a3->var0;
  if (!a3->var0)
    var0 = a3->var1;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", var0 - 0x61C8864680B583EBLL);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache objectForKey:](roadsCache, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_cacheRoad:(id)a3
{
  id v4;
  NSCache *roadsCache;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v4 = a3;
  roadsCache = self->_roadsCache;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  -[GEOPathMatcherRoadLookup keyForRoad:](self, "keyForRoad:", v4);
  v7 = v9;
  if (!v9)
    v7 = v10;
  objc_msgSend(v6, "numberWithUnsignedLong:", v7 - 0x61C8864680B583EBLL);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCache setObject:forKey:](roadsCache, "setObject:forKey:", v4, v8);

}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSCache allObjects](self->_roadsCache, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%d roads:\n"), objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "roadID");
        objc_msgSend(v8, "debugDescription");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%llu - %@\n"), v9, v10, (_QWORD)v12);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_roadsCache, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
}

@end
