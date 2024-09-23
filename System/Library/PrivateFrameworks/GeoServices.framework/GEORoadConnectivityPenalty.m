@implementation GEORoadConnectivityPenalty

- (GEORoadConnectivityPenalty)init
{
  GEORoadConnectivityPenalty *result;

  result = (GEORoadConnectivityPenalty *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEORoadConnectivityPenalty)initWithOriginRoad:(id)a3
{
  id v5;
  GEORoadConnectivityPenalty *v6;
  GEORoadConnectivityPenalty *v7;
  GEOMapFeatureAccess *v8;
  GEOMapFeatureAccess *mapFeatureAccess;
  GEORoadConnectivityPenalty *v10;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GEORoadConnectivityPenalty;
  v6 = -[GEORoadConnectivityPenalty init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originRoad, a3);
    v8 = objc_alloc_init(GEOMapFeatureAccess);
    mapFeatureAccess = v7->_mapFeatureAccess;
    v7->_mapFeatureAccess = v8;

    v7->_maxDepthForRoadConnectivity = 5;
    v7->_completedConnectivityMap = 0;
    -[GEORoadConnectivityPenalty _initConnectivityMap](v7, "_initConnectivityMap");
    v10 = v7;
  }

  return v7;
}

- (void)_initConnectivityMap
{
  NSMutableDictionary *v3;
  NSMutableDictionary *roadIntersections;
  NSMutableDictionary *v5;
  void *v6;

  v3 = (NSMutableDictionary *)objc_opt_new();
  roadIntersections = self->_roadIntersections;
  self->_roadIntersections = v3;

  v5 = self->_roadIntersections;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[GEOMapFeatureRoad muid](self->_originRoad, "muid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKey:](v5, "setObject:forKey:", &unk_1E1E80F98, v6);

  -[GEORoadConnectivityPenalty _addRoadsFromOriginRoad:currentDepth:](self, "_addRoadsFromOriginRoad:currentDepth:", self->_originRoad, 0);
}

- (void)_addRoadsFromOriginRoad:(id)a3 currentDepth:(unint64_t)a4
{
  id v6;
  GEOMapFeatureAccess *mapFeatureAccess;
  uint64_t v8;
  id v9;
  _QWORD v10[5];
  _QWORD v11[4];
  id v12;
  id v13[2];
  id location;

  v6 = a3;
  if (self->_maxDepthForRoadConnectivity > a4)
  {
    objc_initWeak(&location, self);
    mapFeatureAccess = self->_mapFeatureAccess;
    v8 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __67__GEORoadConnectivityPenalty__addRoadsFromOriginRoad_currentDepth___block_invoke;
    v11[3] = &unk_1E1C07218;
    objc_copyWeak(v13, &location);
    v12 = v6;
    v13[1] = (id)a4;
    v10[0] = v8;
    v10[1] = 3221225472;
    v10[2] = __67__GEORoadConnectivityPenalty__addRoadsFromOriginRoad_currentDepth___block_invoke_10;
    v10[3] = &unk_1E1C00E10;
    v10[4] = self;
    v9 = -[GEOMapFeatureAccess findRoadsFromNextIntersectionOf:handler:completionHandler:](mapFeatureAccess, "findRoadsFromNextIntersectionOf:handler:completionHandler:", v12, v11, v10);

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }

}

void __67__GEORoadConnectivityPenalty__addRoadsFromOriginRoad_currentDepth___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  unint64_t v11;
  id v12;
  unint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;

  v22 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "roadIntersections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v22, "muid"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(v7, "roadIntersections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v22, "muid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", &unk_1E1E80FB0, v9);

  }
  v10 = objc_loadWeakRetained((id *)(a1 + 40));
  v11 = objc_msgSend(v10, "shortestLengthToRoad:", *(_QWORD *)(a1 + 32)) + 1;
  v12 = objc_loadWeakRetained((id *)(a1 + 40));
  v13 = objc_msgSend(v12, "shortestLengthToRoad:", v22);
  v14 = objc_loadWeakRetained((id *)(a1 + 40));
  v15 = v14;
  if (v11 >= v13)
    v16 = objc_msgSend(v14, "shortestLengthToRoad:", v22);
  else
    v16 = objc_msgSend(v14, "shortestLengthToRoad:", *(_QWORD *)(a1 + 32)) + 1;

  v17 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v17, "roadIntersections");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v22, "muid"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setObject:forKey:", v19, v20);

  v21 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v21, "_addRoadsFromOriginRoad:currentDepth:", v22, *(_QWORD *)(a1 + 48) + 1);

}

uint64_t __67__GEORoadConnectivityPenalty__addRoadsFromOriginRoad_currentDepth___block_invoke_10(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 48) = 1;
  return result;
}

- (GEOMapFeatureRoad)originRoad
{
  return self->_originRoad;
}

- (unint64_t)shortestLengthToRoad:(id)a3
{
  id v4;
  NSMutableDictionary *roadIntersections;
  void *v6;
  void *v7;
  NSMutableDictionary *v8;
  void *v9;
  void *v10;
  unint64_t v11;

  v4 = a3;
  roadIntersections = self->_roadIntersections;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](roadIntersections, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = self->_roadIntersections;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKey:](v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntValue");

  }
  else
  {
    v11 = 5;
  }

  return v11;
}

- (double)penaltyForCandidate:(id)a3
{
  void *v4;
  double v5;

  if (!self->_completedConnectivityMap)
    return 0.0;
  objc_msgSend(a3, "road");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (double)(1 << -[GEORoadConnectivityPenalty shortestLengthToRoad:](self, "shortestLengthToRoad:", v4));

  return v5;
}

- (NSMutableDictionary)roadIntersections
{
  return self->_roadIntersections;
}

- (void)setRoadIntersections:(id)a3
{
  objc_storeStrong((id *)&self->_roadIntersections, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
  objc_storeStrong((id *)&self->_roadIntersections, 0);
  objc_storeStrong((id *)&self->_originRoad, 0);
  objc_storeStrong((id *)&self->_location, 0);
}

@end
