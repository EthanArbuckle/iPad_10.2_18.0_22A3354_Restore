@implementation GEOMapEdgeFinder

- (GEOMapEdgeFinder)initWithMap:(id)a3 center:(id)a4 radius:(double)a5
{
  double var1;
  double var0;
  id v9;
  GEOMapEdgeFinder *v10;
  double v11;
  objc_super v13;

  var1 = a4.var1;
  var0 = a4.var0;
  v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMapEdgeFinder;
  v10 = -[GEOMapRequest initWithManager:](&v13, sel_initWithManager_, v9);
  if (v10)
  {
    v10->_centerPoint.x = GEOTilePointForCoordinate(var0, var1, 20.0);
    v10->_centerPoint.y = v11;
    v10->_mapRadius = GEOMapPointsPerMeterAtLatitude(var0) * a5;
  }

  return v10;
}

- (void)cancel
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[GEOMapEdgeFinder map](self, "map");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "callbackQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__GEOMapEdgeFinder_cancel__block_invoke;
  block[3] = &unk_1E1C00178;
  block[4] = self;
  dispatch_async(v4, block);

}

id __26__GEOMapEdgeFinder_cancel__block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  char v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setEdgeHandler:", 0);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 40);
  if (v3)
  {
    v4 = objc_msgSend(v3, "isFinished");
    v2 = *(_QWORD *)(a1 + 32);
    if ((v4 & 1) == 0)
    {
      objc_msgSend(*(id *)(v2 + 40), "cancel");
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = *(id *)(v2 + 80);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isFinished") & 1) == 0)
          objc_msgSend(v9, "cancel");
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11.receiver = *(id *)(a1 + 32);
  v11.super_class = (Class)GEOMapEdgeFinder;
  return objc_msgSendSuper2(&v11, sel_cancel);
}

- (GEOMapAccess)map
{
  return (GEOMapAccess *)self->super._requestManager;
}

- (void)findEdges:(id)a3
{
  id v4;
  NSMutableSet *v5;
  NSMutableSet *edgeBuilders;
  uint64_t v7;
  GEOMapTileFinder *tileFinder;
  _QWORD v9[5];
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  -[GEOMapEdgeFinder setEdgeHandler:](self, "setEdgeHandler:", v4);
  v5 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
  edgeBuilders = self->_edgeBuilders;
  self->_edgeBuilders = v5;

  objc_initWeak(&location, self);
  v7 = MEMORY[0x1E0C809B0];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __30__GEOMapEdgeFinder_findEdges___block_invoke;
  v10[3] = &unk_1E1C0D778;
  objc_copyWeak(&v11, &location);
  -[GEOMapRequest setCompletionHandler:](self->_tileFinder, "setCompletionHandler:", v10);
  tileFinder = self->_tileFinder;
  v9[0] = v7;
  v9[1] = 3221225472;
  v9[2] = __30__GEOMapEdgeFinder_findEdges___block_invoke_2;
  v9[3] = &unk_1E1C0D818;
  v9[4] = self;
  -[GEOMapTileFinder findTiles:](tileFinder, "findTiles:", v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __30__GEOMapEdgeFinder_findEdges___block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)*((_QWORD *)WeakRetained + 5);
    *((_QWORD *)WeakRetained + 5) = 0;

    if (!objc_msgSend(*((id *)WeakRetained + 10), "count"))
      objc_msgSend(WeakRetained, "complete");
  }

}

void __30__GEOMapEdgeFinder_findEdges___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  __int128 v8;
  double v9;
  double *v10;
  double v11;
  float v12;
  double v13;
  double v14;
  double v15;
  _QWORD v16[5];
  _DWORD v17[2];
  _QWORD v18[2];
  _BYTE v19[12];
  float v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "tileKey");
  v5 = *(_QWORD *)v4;
  v6 = *(_QWORD *)v4 << 32;
  v7 = BYTE4(*(_QWORD *)v4) | ((((*(_QWORD *)v4 >> 40) | (*(unsigned __int16 *)(v4 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v4 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v4 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v4 + 10) >> 4) << 52);
  *(_QWORD *)&v19[1] = v6 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v4 >> 8) & 0x3F) << 40);
  v19[0] = v5;
  *((_QWORD *)&v8 + 1) = v7;
  *(_QWORD *)&v8 = v6;
  v18[0] = *(_QWORD *)v19;
  v18[1] = v8 >> 56;
  v9 = GEOMapRectForGEOTileKey((uint64_t)v18);
  v10 = *(double **)(a1 + 32);
  v12 = (v10[6] - v9) / v11;
  *(float *)&v13 = (v14 - (v10[7] - v13)) / v14;
  *(float *)v17 = v12;
  v17[1] = LODWORD(v13);
  v15 = v10[8] / v11;
  *(float *)&v11 = v15;
  *(float *)&v15 = *(float *)&v11 * *(float *)&v11;
  *(float *)v19 = v12 - *(float *)&v11;
  *(float *)&v19[4] = *(float *)&v13 - *(float *)&v11;
  *(float *)&v19[8] = v12 + *(float *)&v11;
  v20 = *(float *)&v13 + *(float *)&v11;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __30__GEOMapEdgeFinder_findEdges___block_invoke_3;
  v16[3] = &unk_1E1C0D7F0;
  v16[4] = v10;
  objc_msgSend(v10, "_buildersInTile:localPoint:localRadiusSqr:localSearch:handler:", v3, v17, v19, v16, v15);

}

void __30__GEOMapEdgeFinder_findEdges___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  _QWORD v5[5];
  _QWORD v6[5];

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", v3);
  v4 = MEMORY[0x1E0C809B0];
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __30__GEOMapEdgeFinder_findEdges___block_invoke_4;
  v6[3] = &unk_1E1C0D7A0;
  v6[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setCompletionHandler:", v6);
  v5[0] = v4;
  v5[1] = 3221225472;
  v5[2] = __30__GEOMapEdgeFinder_findEdges___block_invoke_5;
  v5[3] = &unk_1E1C0D7C8;
  v5[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "buildEdge:", v5);

}

void __30__GEOMapEdgeFinder_findEdges___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v4 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "removeObject:");
  v3 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v3 + 40) && !objc_msgSend(*(id *)(v3 + 80), "count"))
    objc_msgSend(*(id *)(a1 + 32), "complete");

}

void __30__GEOMapEdgeFinder_findEdges___block_invoke_5(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  std::__shared_weak_count *v5;
  unint64_t *p_shared_owners;
  unint64_t v7;
  std::__shared_weak_count *v8;
  unint64_t *v9;
  unint64_t v10;
  uint64_t v11;
  std::__shared_weak_count *v12;

  if ((objc_msgSend(*(id *)(a1 + 32), "_checkEdgeForDuplicates:", a2) & 1) == 0)
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72);
    if (v4)
    {
      v5 = (std::__shared_weak_count *)a2[1];
      v11 = *a2;
      v12 = v5;
      if (v5)
      {
        p_shared_owners = (unint64_t *)&v5->__shared_owners_;
        do
          v7 = __ldxr(p_shared_owners);
        while (__stxr(v7 + 1, p_shared_owners));
      }
      (*(void (**)(uint64_t, uint64_t *))(v4 + 16))(v4, &v11);
      v8 = v12;
      if (v12)
      {
        v9 = (unint64_t *)&v12->__shared_owners_;
        do
          v10 = __ldaxr(v9);
        while (__stlxr(v10 - 1, v9));
        if (!v10)
        {
          ((void (*)(std::__shared_weak_count *))v8->__on_zero_shared)(v8);
          std::__shared_weak_count::__release_weak(v8);
        }
      }
    }
  }
}

- (void)_buildersInTile:(id)a3 localPoint:(const void *)a4 localRadiusSqr:(float)a5 localSearch:(const void *)a6 handler:(id)a7
{
  -[GEOMapEdgeFinder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a4, a6, a7);
}

- (BOOL)_checkEdgeForDuplicates:(const void *)a3
{
  -[GEOMapEdgeFinder doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)edgeHandler
{
  return self->_edgeHandler;
}

- (void)setEdgeHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeBuilders, 0);
  objc_storeStrong(&self->_edgeHandler, 0);
  objc_storeStrong((id *)&self->_tileFinder, 0);
}

@end
