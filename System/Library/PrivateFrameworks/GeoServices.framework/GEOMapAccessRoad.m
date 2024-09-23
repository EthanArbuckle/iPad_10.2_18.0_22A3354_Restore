@implementation GEOMapAccessRoad

- (GEOMapAccessRoad)initWithMap:(id)a3 roadEdge:(shared_ptr<geo::MapEdgeRoad>)a4
{
  MapEdgeRoad *ptr;
  id v6;
  std::__shared_weak_count *v7;
  unint64_t *p_shared_owners;
  unint64_t v9;
  GEOMapAccessRoad *v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  uint64_t v14;
  MapEdgeRoad *v15;
  unint64_t *v16;
  unint64_t v17;
  std::__shared_weak_count *cntrl;
  unint64_t *v19;
  unint64_t v20;
  objc_super v22;
  MapEdgeRoad *v23;
  std::__shared_weak_count *v24;

  ptr = a4.__ptr_;
  v6 = a3;
  v7 = (std::__shared_weak_count *)*((_QWORD *)ptr + 1);
  v23 = *(MapEdgeRoad **)ptr;
  v24 = v7;
  if (v7)
  {
    p_shared_owners = (unint64_t *)&v7->__shared_owners_;
    do
      v9 = __ldxr(p_shared_owners);
    while (__stxr(v9 + 1, p_shared_owners));
  }
  v22.receiver = self;
  v22.super_class = (Class)GEOMapAccessRoad;
  v10 = -[GEOMapAccessLine initWithMap:edge:](&v22, sel_initWithMap_edge_, v6, &v23);
  v11 = v24;
  if (v24)
  {
    v12 = (unint64_t *)&v24->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  if (v10)
  {
    v15 = *(MapEdgeRoad **)ptr;
    v14 = *((_QWORD *)ptr + 1);
    if (v14)
    {
      v16 = (unint64_t *)(v14 + 8);
      do
        v17 = __ldxr(v16);
      while (__stxr(v17 + 1, v16));
    }
    cntrl = (std::__shared_weak_count *)v10->_roadEdge.__cntrl_;
    v10->_roadEdge.__ptr_ = v15;
    v10->_roadEdge.__cntrl_ = (__shared_weak_count *)v14;
    if (cntrl)
    {
      v19 = (unint64_t *)&cntrl->__shared_owners_;
      do
        v20 = __ldaxr(v19);
      while (__stlxr(v20 - 1, v19));
      if (!v20)
      {
        ((void (*)(std::__shared_weak_count *))cntrl->__on_zero_shared)(cntrl);
        std::__shared_weak_count::__release_weak(cntrl);
      }
    }
    v10->_roadID = 0;
  }

  return v10;
}

- (int)roadClass
{
  return (*(uint64_t (**)(MapEdgeRoad *))(*(_QWORD *)self->_roadEdge.__ptr_ + 72))(self->_roadEdge.__ptr_);
}

- (int)formOfWay
{
  return (*(uint64_t (**)(MapEdgeRoad *))(*(_QWORD *)self->_roadEdge.__ptr_ + 80))(self->_roadEdge.__ptr_);
}

- (int)travelDirection
{
  return (*(uint64_t (**)(MapEdgeRoad *))(*(_QWORD *)self->_roadEdge.__ptr_ + 120))(self->_roadEdge.__ptr_);
}

- (double)roadWidth
{
  void *v2;
  double v3;
  double v4;

  geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOMapAccessRoad estimatedWidthForRoad:](GEOMapAccessRoad, "estimatedWidthForRoad:", v2);
  v4 = v3;

  return v4;
}

- (unint64_t)speedLimit
{
  void *v2;
  unint64_t v3;

  geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displaySpeedLimit");

  return v3;
}

- (BOOL)speedLimitIsMPH
{
  void *v2;
  char v3;

  geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "displaySpeedLimitIsMPH");

  return v3;
}

- (BOOL)isTunnel
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isTunnel");

  return v5;
}

- (BOOL)isBridge
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBridge");

  return v5;
}

- (BOOL)isRail
{
  void *v2;
  void *v3;
  void *v4;
  char v5;

  geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isRailway");

  return v5;
}

- (int)rampType
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "feature");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "attributes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "rampType");

  return v5;
}

- (void)roadFeaturesWithHandler:(id)a3
{
  MapEdgeRoad *ptr;
  id *v5;
  id *v6;
  id v7;
  void *v8;
  void (**v9)(id, void *);

  v9 = (void (**)(id, void *))a3;
  if (v9)
  {
    ptr = self->_roadEdge.__ptr_;
    v5 = (id *)*((_QWORD *)ptr + 5);
    v6 = (id *)*((_QWORD *)ptr + 6);
    while (v5 != v6)
    {
      v7 = *v5;
      objc_msgSend(v7, "road");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2](v9, v8);

      ++v5;
    }
  }

}

- (void)roadEdgesWithHandler:(id)a3
{
  MapEdgeRoad *ptr;
  id *v5;
  id *v6;
  id v7;
  void (**v8)(id, id);

  v8 = (void (**)(id, id))a3;
  if (v8)
  {
    ptr = self->_roadEdge.__ptr_;
    v5 = (id *)*((_QWORD *)ptr + 5);
    v6 = (id *)*((_QWORD *)ptr + 6);
    while (v5 != v6)
    {
      v7 = *v5;
      v8[2](v8, v7);

      ++v5;
    }
  }

}

- (id)findRoadsFrom:(id)a3 completionHandler:(id)a4
{
  id v6;
  MapEdgeRoad *ptr;
  GEOMapAccess *map;
  void (*v9)(MapEdgeRoad *, GEOMapAccess *, _QWORD *, id);
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v6 = a3;
  ptr = self->_roadEdge.__ptr_;
  map = self->super._map;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __52__GEOMapAccessRoad_findRoadsFrom_completionHandler___block_invoke;
  v13[3] = &unk_1E1C02BA8;
  v13[4] = self;
  v14 = v6;
  v9 = *(void (**)(MapEdgeRoad *, GEOMapAccess *, _QWORD *, id))(*(_QWORD *)ptr + 96);
  v10 = v6;
  v9(ptr, map, v13, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __52__GEOMapAccessRoad_findRoadsFrom_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessRoad *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessRoad *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessRoad alloc];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessRoad initWithMap:roadEdge:](v4, "initWithMap:roadEdge:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (id)findRoadsFromPreviousIntersection:(id)a3 completionHandler:(id)a4
{
  id v6;
  MapEdgeRoad *ptr;
  GEOMapAccess *map;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  ptr = self->_roadEdge.__ptr_;
  map = self->super._map;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __72__GEOMapAccessRoad_findRoadsFromPreviousIntersection_completionHandler___block_invoke;
  v12[3] = &unk_1E1C02BA8;
  v12[4] = self;
  v13 = v6;
  v9 = v6;
  geo::MapEdgeRoad::findEdgesFromStartNode((uint64_t)ptr, map, v12, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __72__GEOMapAccessRoad_findRoadsFromPreviousIntersection_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessRoad *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessRoad *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessRoad alloc];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessRoad initWithMap:roadEdge:](v4, "initWithMap:roadEdge:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (id)findRoadsToPreviousIntersection:(id)a3 completionHandler:(id)a4
{
  id v6;
  MapEdgeRoad *ptr;
  GEOMapAccess *map;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  ptr = self->_roadEdge.__ptr_;
  map = self->super._map;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__GEOMapAccessRoad_findRoadsToPreviousIntersection_completionHandler___block_invoke;
  v12[3] = &unk_1E1C02BA8;
  v12[4] = self;
  v13 = v6;
  v9 = v6;
  geo::MapEdgeRoad::findEdgesToStartNode((uint64_t)ptr, map, v12, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __70__GEOMapAccessRoad_findRoadsToPreviousIntersection_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessRoad *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessRoad *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessRoad alloc];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessRoad initWithMap:roadEdge:](v4, "initWithMap:roadEdge:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (id)findRoadsFromNextIntersection:(id)a3 completionHandler:(id)a4
{
  id v6;
  MapEdgeRoad *ptr;
  GEOMapAccess *map;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  ptr = self->_roadEdge.__ptr_;
  map = self->super._map;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __68__GEOMapAccessRoad_findRoadsFromNextIntersection_completionHandler___block_invoke;
  v12[3] = &unk_1E1C02BA8;
  v12[4] = self;
  v13 = v6;
  v9 = v6;
  geo::MapEdgeRoad::findEdgesFromEndNode((uint64_t)ptr, map, v12, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __68__GEOMapAccessRoad_findRoadsFromNextIntersection_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessRoad *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessRoad *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessRoad alloc];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessRoad initWithMap:roadEdge:](v4, "initWithMap:roadEdge:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (id)findRoadsToNextIntersection:(id)a3 completionHandler:(id)a4
{
  id v6;
  MapEdgeRoad *ptr;
  GEOMapAccess *map;
  id v9;
  void *v10;
  _QWORD v12[5];
  id v13;

  v6 = a3;
  ptr = self->_roadEdge.__ptr_;
  map = self->super._map;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __66__GEOMapAccessRoad_findRoadsToNextIntersection_completionHandler___block_invoke;
  v12[3] = &unk_1E1C02BA8;
  v12[4] = self;
  v13 = v6;
  v9 = v6;
  geo::MapEdgeRoad::findEdgesToEndNode((uint64_t)ptr, map, v12, a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void __66__GEOMapAccessRoad_findRoadsToNextIntersection_completionHandler___block_invoke(uint64_t a1, uint64_t *a2)
{
  GEOMapAccessRoad *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  unint64_t v8;
  GEOMapAccessRoad *v9;
  std::__shared_weak_count *v10;
  unint64_t *v11;
  unint64_t v12;
  uint64_t v13;
  std::__shared_weak_count *v14;

  v4 = [GEOMapAccessRoad alloc];
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = (std::__shared_weak_count *)a2[1];
  v13 = *a2;
  v14 = v6;
  if (v6)
  {
    p_shared_owners = (unint64_t *)&v6->__shared_owners_;
    do
      v8 = __ldxr(p_shared_owners);
    while (__stxr(v8 + 1, p_shared_owners));
  }
  v9 = -[GEOMapAccessRoad initWithMap:roadEdge:](v4, "initWithMap:roadEdge:", v5, &v13);
  v10 = v14;
  if (v14)
  {
    v11 = (unint64_t *)&v14->__shared_owners_;
    do
      v12 = __ldaxr(v11);
    while (__stlxr(v12 - 1, v11));
    if (!v12)
    {
      ((void (*)(std::__shared_weak_count *))v10->__on_zero_shared)(v10);
      std::__shared_weak_count::__release_weak(v10);
    }
  }
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));

}

- (NSString)internalRoadName
{
  void *v2;
  void *v3;
  void *v4;

  (*(void (**)(MapEdgeRoad *, SEL))(*(_QWORD *)self->_roadEdge.__ptr_ + 64))(self->_roadEdge.__ptr_, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 && objc_msgSend(v2, "name"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", objc_msgSend(v3, "name"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return (NSString *)v4;
}

- (unint64_t)roadID
{
  unint64_t roadID;
  shared_ptr<geo::MapEdgeRoad> *p_roadEdge;
  id *v4;
  id *v5;
  unsigned int v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  __int128 v16;
  unint64_t v17;
  unsigned int v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  __int128 v27;
  int v28;
  int v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  uint64_t v40;
  void *v41;
  __int128 v42;
  _QWORD v43[3];

  v43[2] = *MEMORY[0x1E0C80C00];
  roadID = self->_roadID;
  if (!roadID)
  {
    p_roadEdge = &self->_roadEdge;
    geo::MapEdgeRoad::roadFeature((geo::MapEdgeRoad *)self->_roadEdge.__ptr_);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id *)*((_QWORD *)p_roadEdge->__ptr_ + 5);
    v5 = (id *)*((_QWORD *)p_roadEdge->__ptr_ + 6);
    if (v4 != v5)
    {
      v6 = -1;
      v7 = -1;
      do
      {
        v8 = *v4;
        objc_msgSend(v8, "road");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "feature");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "containingTile");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        v42 = 0uLL;
        v12 = objc_msgSend(v11, "tileKey");
        v13 = *(_QWORD *)v12;
        v14 = *(_QWORD *)v12 << 32;
        v15 = BYTE4(*(_QWORD *)v12) | ((((*(_QWORD *)v12 >> 40) | (*(unsigned __int16 *)(v12 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v12 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v12 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v12 + 10) >> 4) << 52);
        *(_QWORD *)((char *)v43 + 1) = v14 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v12 >> 8) & 0x3F) << 40);
        LOBYTE(v43[0]) = v13;
        *((_QWORD *)&v16 + 1) = v15;
        *(_QWORD *)&v16 = v14;
        *(_QWORD *)&v42 = v43[0];
        *((_QWORD *)&v42 + 1) = v16 >> 56;
        GEOTileKeyAssertIsStandard((uint64_t)&v42);
        v17 = *(unsigned int *)((char *)&v42 + 9) | ((unint64_t)(*(unsigned __int16 *)((char *)&v42 + 13) | (HIBYTE(v42) << 16)) << 32);
        v18 = ((*(_QWORD *)((char *)&v42 + 1) >> 46) | (*(_DWORD *)((char *)&v42 + 9) << 18)) & 0x3FFFFFF;
        if (v18 >= v6)
        {
          if (v18 != v6)
            goto LABEL_9;
          v19 = (v17 >> 8) & 0x3FFFFFF;
          if (v19 >= v7)
            goto LABEL_9;
        }
        else
        {
          v19 = (v17 >> 8) & 0x3FFFFFF;
        }
        v20 = v9;

        v7 = v19;
        v6 = v18;
        v41 = v20;
LABEL_9:

        ++v4;
      }
      while (v4 != v5);
    }
    objc_msgSend(v41, "feature", 72, self);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "containingTile");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = objc_msgSend(v22, "tileKey");
    v24 = *(_QWORD *)v23;
    v25 = *(_QWORD *)v23 << 32;
    v26 = BYTE4(*(_QWORD *)v23) | ((((*(_QWORD *)v23 >> 40) | (*(unsigned __int16 *)(v23 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v23 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v23 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v23 + 10) >> 4) << 52);
    *(_QWORD *)((char *)v43 + 1) = v25 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v23 >> 8) & 0x3F) << 40);
    LOBYTE(v43[0]) = v24;
    *((_QWORD *)&v27 + 1) = v26;
    *(_QWORD *)&v27 = v25;
    *(_QWORD *)&v42 = v43[0];
    *((_QWORD *)&v42 + 1) = v27 >> 56;
    GEOTileKeyAssertIsStandard((uint64_t)&v42);
    v28 = HIBYTE(v42);
    v29 = *(unsigned __int16 *)((char *)&v42 + 13);
    v30 = *(unsigned int *)((char *)&v42 + 9);
    v31 = *(_QWORD *)((char *)&v42 + 1);
    v32 = objc_msgSend(v41, "get");
    objc_msgSend(v22, "lines");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "objectAtIndex:", 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "get");

    *((_QWORD *)&v27 + 1) = v30 | ((unint64_t)(v29 | (v28 << 16)) << 32);
    *(_QWORD *)&v27 = v31;
    v36 = (v27 >> 8) & 0xFFFFFFC000000000;
    *(_QWORD *)&v27 = v31;
    roadID = v36 | (v27 >> 60) & 0x3FFFFFF000 | (0x4EC4EC4EC4EC4EC5 * ((v32 - v35) >> 3));
    *(_QWORD *)(v40 + v38) = roadID;

  }
  return roadID;
}

- (id)tileKeys
{
  GEOTileKeyList *v3;
  MapEdgeRoad *ptr;
  id *v5;
  id *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  __int128 v15;
  uint64_t v17;
  uint64_t v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  v3 = -[GEOTileKeyList initWithCapacity:]([GEOTileKeyList alloc], "initWithCapacity:", (uint64_t)(*((_QWORD *)self->_roadEdge.__ptr_ + 6) - *((_QWORD *)self->_roadEdge.__ptr_ + 5)) >> 3);
  ptr = self->_roadEdge.__ptr_;
  v5 = (id *)*((_QWORD *)ptr + 5);
  v6 = (id *)*((_QWORD *)ptr + 6);
  while (v5 != v6)
  {
    v7 = *v5;
    objc_msgSend(v7, "road");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "feature");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "containingTile");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = 0;
    v18 = 0;
    v11 = objc_msgSend(v10, "tileKey");
    v12 = *(_QWORD *)v11;
    v13 = *(_QWORD *)v11 << 32;
    v14 = BYTE4(*(_QWORD *)v11) | ((((*(_QWORD *)v11 >> 40) | (*(unsigned __int16 *)(v11 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v11 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v11 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v11 + 10) >> 4) << 52);
    *(_QWORD *)((char *)v19 + 1) = v13 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v11 >> 8) & 0x3F) << 40);
    LOBYTE(v19[0]) = v12;
    *((_QWORD *)&v15 + 1) = v14;
    *(_QWORD *)&v15 = v13;
    v17 = v19[0];
    v18 = v15 >> 56;
    -[GEOTileKeyList addKey:](v3, "addKey:", &v17);

    ++v5;
  }
  return v3;
}

- (NSString)description
{
  void *v2;
  void **v3;
  void *v4;
  void *__p[2];
  char v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  (*(void (**)(void **__return_ptr))(*(_QWORD *)self->_roadEdge.__ptr_ + 88))(__p);
  if (v7 >= 0)
    v3 = __p;
  else
    v3 = (void **)__p[0];
  objc_msgSend(v2, "stringWithUTF8String:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 < 0)
    operator delete(__p[0]);
  return (NSString *)v4;
}

- (void).cxx_destruct
{
  std::shared_ptr<std::vector<zilch::GeoCoordinates> const>::~shared_ptr[abi:ne180100]((uint64_t)&self->_roadEdge);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 7) = 0;
  *((_QWORD *)self + 8) = 0;
  return self;
}

+ (double)estimatedWidthForRoad:(id)a3
{
  id v3;
  void *v4;
  double v5;
  unsigned int v6;
  double *v7;

  v3 = a3;
  v4 = v3;
  v5 = 7.4;
  if (v3)
  {
    if (objc_msgSend(v3, "travelDirection"))
    {
      v6 = objc_msgSend(v4, "roadClass");
      if (v6 >= 7)
      {
        v5 = 5.55;
        goto LABEL_9;
      }
      v7 = (double *)&unk_189CD9FE0;
      goto LABEL_7;
    }
    v6 = objc_msgSend(v4, "roadClass");
    if (v6 < 8)
    {
      v7 = (double *)&unk_189CD9FA0;
LABEL_7:
      v5 = v7[v6];
    }
  }
LABEL_9:

  return v5;
}

@end
