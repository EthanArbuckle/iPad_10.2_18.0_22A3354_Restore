@implementation GEOMapTransitPointFinder

- (GEOMapTransitPointFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1;
  double var0;
  id v9;
  GEOMapTransitPointFinder *v10;
  double v11;
  uint64_t v12;
  GEOMapTileFinder *tileFinder;
  objc_super v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapTransitPointFinder;
  v10 = -[GEOMapRequest initWithManager:](&v15, sel_initWithManager_, v9);
  if (v10)
  {
    v10->_centerPoint.x = GEOTilePointForCoordinate(var0, var1, 20.0);
    v10->_centerPoint.y = v11;
    v10->_mapRadius = GEOMapPointsPerMeterAtLatitude(var0) * a5;
    +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", v9, var0, var1, a5);
    v12 = objc_claimAutoreleasedReturnValue();
    tileFinder = v10->_tileFinder;
    v10->_tileFinder = (GEOMapTileFinder *)v12;

  }
  return v10;
}

- (GEOMapTransitPointFinder)initWithMap:(id)a3 approxLocation:(id)a4 pointID:(unint64_t)a5
{
  double var1;
  double var0;
  id v9;
  GEOMapTransitPointFinder *v10;
  double v11;
  uint64_t v12;
  GEOMapTileFinder *tileFinder;
  objc_super v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  if (a5)
  {
    v15.receiver = self;
    v15.super_class = (Class)GEOMapTransitPointFinder;
    v10 = -[GEOMapRequest initWithManager:](&v15, sel_initWithManager_, v9);
    if (v10)
    {
      v10->_centerPoint.x = GEOTilePointForCoordinate(var0, var1, 20.0);
      v10->_centerPoint.y = v11;
      v10->_mapRadius = GEOMapPointsPerMeterAtLatitude(var0) * 500.0;
      +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", v9, var0, var1);
      v12 = objc_claimAutoreleasedReturnValue();
      tileFinder = v10->_tileFinder;
      v10->_tileFinder = (GEOMapTileFinder *)v12;

      v10->_pointID = a5;
    }
    self = v10;
    a5 = (unint64_t)self;
  }

  return (GEOMapTransitPointFinder *)a5;
}

- (GEOMapTransitPointFinder)initWithMap:(id)a3 approxLocation:(id)a4 parentID:(unint64_t)a5
{
  double var1;
  double var0;
  id v9;
  GEOMapTransitPointFinder *v10;
  double v11;
  uint64_t v12;
  GEOMapTileFinder *tileFinder;
  objc_super v15;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  if (a5)
  {
    v15.receiver = self;
    v15.super_class = (Class)GEOMapTransitPointFinder;
    v10 = -[GEOMapRequest initWithManager:](&v15, sel_initWithManager_, v9);
    if (v10)
    {
      v10->_centerPoint.x = GEOTilePointForCoordinate(var0, var1, 20.0);
      v10->_centerPoint.y = v11;
      v10->_mapRadius = GEOMapPointsPerMeterAtLatitude(var0) * 500.0;
      +[GEOMapTileFinder detailedTransitTileFinderForMap:center:radius:](GEOMapTileFinder, "detailedTransitTileFinderForMap:center:radius:", v9, var0, var1);
      v12 = objc_claimAutoreleasedReturnValue();
      tileFinder = v10->_tileFinder;
      v10->_tileFinder = (GEOMapTileFinder *)v12;

      v10->_parentID = a5;
    }
    self = v10;
    a5 = (unint64_t)self;
  }

  return (GEOMapTransitPointFinder *)a5;
}

- (void)cancel
{
  GEOMapTileFinder *tileFinder;
  objc_super v4;

  tileFinder = self->_tileFinder;
  if (tileFinder && !-[GEOMapRequest isFinished](tileFinder, "isFinished"))
    -[GEOMapTileFinder cancel](self->_tileFinder, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)GEOMapTransitPointFinder;
  -[GEOMapRequest cancel](&v4, sel_cancel);
}

- (GEOMapAccess)map
{
  return (GEOMapAccess *)self->super._requestManager;
}

- (void)findTransitPointsOfType:(unint64_t)a3 nodeHandler:(id)a4 accessPointHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  GEOMapTileFinder *tileFinder;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  unint64_t v17;
  _QWORD v18[5];
  id v19;
  id location;

  v8 = a4;
  v9 = a5;
  objc_initWeak(&location, self);
  v10 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke;
  v18[3] = &unk_1E1C00588;
  v18[4] = self;
  objc_copyWeak(&v19, &location);
  -[GEOMapRequest setCompletionHandler:](self->_tileFinder, "setCompletionHandler:", v18);
  tileFinder = self->_tileFinder;
  v14[0] = v10;
  v14[1] = 3221225472;
  v14[2] = __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_2;
  v14[3] = &unk_1E1C005D8;
  v14[4] = self;
  v12 = v9;
  v15 = v12;
  v17 = a3;
  v13 = v8;
  v16 = v13;
  -[GEOMapTileFinder findTiles:](tileFinder, "findTiles:", v14);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

}

void __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "complete");

}

void __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double *v14;
  double v15;
  double v16;
  float v17;
  float v18;
  float v19;
  float v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  _QWORD *v28;
  int v29;
  uint64_t v30;
  double v31;
  double v32;
  double v33;
  double v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _QWORD v47[4];
  id v48;
  id v49;
  uint64_t v50;
  _QWORD v51[4];
  id v52;
  id v53;
  uint64_t v54;
  _QWORD v55[2];
  _QWORD v56[4];

  v56[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "tileKey");
  v5 = *(_QWORD *)v4;
  v6 = *(_QWORD *)v4 << 32;
  v7 = BYTE4(*(_QWORD *)v4) | ((((*(_QWORD *)v4 >> 40) | (*(unsigned __int16 *)(v4 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v4 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v4 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v4 + 10) >> 4) << 52);
  *(_QWORD *)((char *)v56 + 1) = v6 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(v56[0]) = v5;
  *((_QWORD *)&v8 + 1) = v7;
  *(_QWORD *)&v8 = v6;
  v55[0] = v56[0];
  v55[1] = v8 >> 56;
  v9 = GEOMapRectForGEOTileKey((uint64_t)v55);
  v11 = v10;
  v13 = v12;
  v14 = *(double **)(a1 + 32);
  v46 = v9;
  *(float *)&v9 = (v14[6] - v9) / v10;
  v16 = v15;
  *(float *)&v15 = (v13 - (v14[7] - v15)) / v13;
  *(float *)&v10 = v14[8] / v10;
  v17 = *(float *)&v9 - *(float *)&v10;
  v18 = *(float *)&v15 - *(float *)&v10;
  v19 = *(float *)&v9 + *(float *)&v10;
  v20 = *(float *)&v15 + *(float *)&v10;
  if (*(_QWORD *)(a1 + 40) && (*(_BYTE *)(a1 + 56) & 1) != 0)
  {
    v35 = 0;
    v36 = 0;
    v37 = MEMORY[0x1E0C809B0];
    while (v36 < objc_msgSend(v3, "transitAccessPointCount"))
    {
      v38 = objc_msgSend(v3, "transitAccessPoints");
      v39 = v38 + v35;
      v40 = *(_QWORD **)(a1 + 32);
      v41 = v40[10];
      if (!v41 || *(_QWORD *)(v39 + 224) == v41)
      {
        v51[0] = v37;
        v51[1] = 3221225472;
        v51[2] = __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_3;
        v51[3] = &unk_1E1C005B0;
        v54 = v38 + v35;
        v52 = v3;
        v53 = *(id *)(a1 + 40);
        *(float *)&v42 = v17;
        *(float *)&v43 = v18;
        *(float *)&v44 = v19;
        *(float *)&v45 = v20;
        objc_msgSend(v40, "_validatePoint:rect:localSearch:validPointHandler:", v39, v51, v46, v16, v11, v13, v42, v43, v44, v45);

      }
      ++v36;
      v35 += 248;
    }
  }
  if (*(_QWORD *)(a1 + 48) && (*(_BYTE *)(a1 + 56) & 0xE) != 0)
  {
    v21 = 0;
    v22 = 272;
    v23 = MEMORY[0x1E0C809B0];
    while (v21 < objc_msgSend(v3, "transitNodeCount"))
    {
      v24 = objc_msgSend(v3, "transitNodes");
      v25 = v24 + v22;
      v26 = *(_QWORD **)(a1 + 32);
      v27 = v26[10];
      if (v27)
      {
        v28 = *(_QWORD **)(v25 - 16);
        if (!v28 || v27 != *v28)
          goto LABEL_21;
      }
      else if (!v24)
      {
        goto LABEL_21;
      }
      v29 = *(unsigned __int8 *)(v24 + v22);
      if (v29 == 3)
      {
        if ((*(_BYTE *)(a1 + 56) & 8) != 0)
          goto LABEL_20;
      }
      else
      {
        if (v29 == 1)
        {
          if ((*(_BYTE *)(a1 + 56) & 4) == 0)
            goto LABEL_21;
LABEL_20:
          v30 = v25 - 272;
          v47[0] = v23;
          v47[1] = 3221225472;
          v47[2] = __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_4;
          v47[3] = &unk_1E1C005B0;
          v48 = v3;
          v50 = v30;
          v49 = *(id *)(a1 + 48);
          *(float *)&v31 = v17;
          *(float *)&v32 = v18;
          *(float *)&v33 = v19;
          *(float *)&v34 = v20;
          objc_msgSend(v26, "_validatePoint:rect:localSearch:validPointHandler:", v30, v47, v46, v16, v11, v13, v31, v32, v33, v34);

          goto LABEL_21;
        }
        if (!*(_BYTE *)(v24 + v22) && (*(_BYTE *)(a1 + 56) & 2) != 0)
          goto LABEL_20;
      }
LABEL_21:
      ++v21;
      v22 += 344;
    }
  }

}

void __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_3(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  void *v5;
  char *v6;
  unint64_t *v7;
  id v8;
  uint64_t v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *p_shared_owners;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  char *v17;
  std::__shared_weak_count *v18;
  char *v19;
  std::__shared_weak_count *v20;

  v4 = a1[6];
  v5 = (void *)a1[4];
  v6 = (char *)operator new(0x38uLL);
  *((_QWORD *)v6 + 1) = 0;
  v7 = (unint64_t *)(v6 + 8);
  *((_QWORD *)v6 + 2) = 0;
  *(_QWORD *)v6 = &off_1E1BFB448;
  v8 = v5;
  *(_OWORD *)(v6 + 24) = *a2;
  *((_QWORD *)v6 + 5) = v4;
  *((_QWORD *)v6 + 6) = v8;
  v19 = v6 + 24;
  v20 = (std::__shared_weak_count *)v6;
  v9 = a1[5];
  v17 = v6 + 24;
  v18 = (std::__shared_weak_count *)v6;
  do
    v10 = __ldxr(v7);
  while (__stxr(v10 + 1, v7));
  (*(void (**)(uint64_t, char **))(v9 + 16))(v9, &v17);
  v11 = v18;
  if (v18)
  {
    p_shared_owners = (unint64_t *)&v18->__shared_owners_;
    do
      v13 = __ldaxr(p_shared_owners);
    while (__stlxr(v13 - 1, p_shared_owners));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v20;
  if (v20)
  {
    v15 = (unint64_t *)&v20->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

void __83__GEOMapTransitPointFinder_findTransitPointsOfType_nodeHandler_accessPointHandler___block_invoke_4(_QWORD *a1, _OWORD *a2)
{
  void *v4;
  uint64_t v5;
  std::__shared_weak_count *v6;
  unint64_t *p_shared_owners;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  std::__shared_weak_count *v11;
  unint64_t *v12;
  unint64_t v13;
  std::__shared_weak_count *v14;
  unint64_t *v15;
  unint64_t v16;
  uint64_t v17;
  std::__shared_weak_count *v18;
  uint64_t v19;
  std::__shared_weak_count *v20;

  v4 = (void *)a1[4];
  v5 = a1[6];
  v6 = (std::__shared_weak_count *)operator new(0x50uLL);
  v6->__shared_owners_ = 0;
  p_shared_owners = (unint64_t *)&v6->__shared_owners_;
  v6->__shared_weak_owners_ = 0;
  v6->__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BFB3D8;
  v8 = geo::MapNode::MapNode((uint64_t)&v6[1], a2, v4, *(_QWORD *)(v5 + 240));
  v6[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BF6648;
  v6[2].__shared_weak_owners_ = v5;
  v19 = v8;
  v20 = v6;
  v9 = a1[5];
  v17 = v8;
  v18 = v6;
  do
    v10 = __ldxr(p_shared_owners);
  while (__stxr(v10 + 1, p_shared_owners));
  (*(void (**)(uint64_t, uint64_t *))(v9 + 16))(v9, &v17);
  v11 = v18;
  if (v18)
  {
    v12 = (unint64_t *)&v18->__shared_owners_;
    do
      v13 = __ldaxr(v12);
    while (__stlxr(v13 - 1, v12));
    if (!v13)
    {
      ((void (*)(std::__shared_weak_count *))v11->__on_zero_shared)(v11);
      std::__shared_weak_count::__release_weak(v11);
    }
  }
  v14 = v20;
  if (v20)
  {
    v15 = (unint64_t *)&v20->__shared_owners_;
    do
      v16 = __ldaxr(v15);
    while (__stlxr(v16 - 1, v15));
    if (!v16)
    {
      ((void (*)(std::__shared_weak_count *))v14->__on_zero_shared)(v14);
      std::__shared_weak_count::__release_weak(v14);
    }
  }
}

- (void)_validatePoint:(void *)a3 rect:(id)a4 localSearch:()Box<float validPointHandler:(2>)a5
{
  double var1;
  double var0;
  double v8;
  double v9;
  void (**v12)(id, _QWORD *);
  uint64_t v13;
  char v14;
  float v15;
  char v16;
  unint64_t pointID;
  uint64_t v18;
  GEOMapTileFinder *tileFinder;
  _QWORD v20[2];
  Box<float, 2> v21;

  var1 = a4.var1.var1;
  var0 = a4.var1.var0;
  v8 = a4.var0.var1;
  v9 = a4.var0.var0;
  v21 = a5;
  v12 = (void (**)(id, _QWORD *))a6;
  v13 = 0;
  v14 = 1;
  while (1)
  {
    v15 = *((float *)a3 + v13 + 22);
    if (v15 < v21.var0._e[v13] || v15 >= v21.var1._e[v13])
      break;
    v16 = v14;
    v14 = 0;
    v13 = 1;
    if ((v16 & 1) == 0)
    {
      pointID = self->_pointID;
      if (!pointID || *((_QWORD *)a3 + 5) == pointID)
      {
        v20[0] = GEOCoordinate2DForMapPoint(v9 + *((float *)a3 + 22) * var0, v8 + (float)(1.0 - *((float *)a3 + 23)) * var1);
        v20[1] = v18;
        v12[2](v12, v20);
        if (self->_pointID)
        {
          -[GEOMapTileFinder cancel](self->_tileFinder, "cancel");
          tileFinder = self->_tileFinder;
          self->_tileFinder = 0;

          -[GEOMapRequest complete](self, "complete");
        }
      }
      break;
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileFinder, 0);
}

@end
