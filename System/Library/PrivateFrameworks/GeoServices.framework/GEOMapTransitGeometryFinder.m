@implementation GEOMapTransitGeometryFinder

- (GEOMapTransitGeometryFinder)initWithMap:(id)a3 transitID:(unint64_t)a4 coordinate:(id)a5
{
  double var1;
  double var0;
  id v9;
  GEOMapTransitGeometryFinder *v10;
  uint64_t v11;
  GEOMapTileFinder *tileFinder;
  GEOMapTransitGeometryFinder *v13;
  objc_super v15;

  var1 = a5.var1;
  var0 = a5.var0;
  v9 = a3;
  v15.receiver = self;
  v15.super_class = (Class)GEOMapTransitGeometryFinder;
  v10 = -[GEOMapRequest initWithManager:](&v15, sel_initWithManager_, v9);
  if (v10)
  {
    +[GEOMapTileFinder transitGeometryTileFinderForMap:center:radius:](GEOMapTileFinder, "transitGeometryTileFinderForMap:center:radius:", v9, var0, var1, 50.0);
    v11 = objc_claimAutoreleasedReturnValue();
    tileFinder = v10->_tileFinder;
    v10->_tileFinder = (GEOMapTileFinder *)v11;

    v10->_transitID = a4;
    v13 = v10;
  }

  return v10;
}

- (void)cancel
{
  GEOMapTileFinder *tileFinder;
  objc_super v4;

  tileFinder = self->_tileFinder;
  if (tileFinder && !-[GEOMapRequest isFinished](tileFinder, "isFinished"))
    -[GEOMapTileFinder cancel](self->_tileFinder, "cancel");
  v4.receiver = self;
  v4.super_class = (Class)GEOMapTransitGeometryFinder;
  -[GEOMapRequest cancel](&v4, sel_cancel);
}

- (void)findTransitGeometryWithHandler:(id)a3
{
  id v4;
  uint64_t v5;
  GEOMapTileFinder *tileFinder;
  _QWORD v7[5];
  id v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  if (v4)
  {
    objc_initWeak(&location, self);
    v5 = MEMORY[0x1E0C809B0];
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __62__GEOMapTransitGeometryFinder_findTransitGeometryWithHandler___block_invoke;
    v9[3] = &unk_1E1C0D778;
    objc_copyWeak(&v10, &location);
    -[GEOMapRequest setCompletionHandler:](self->_tileFinder, "setCompletionHandler:", v9);
    tileFinder = self->_tileFinder;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __62__GEOMapTransitGeometryFinder_findTransitGeometryWithHandler___block_invoke_2;
    v7[3] = &unk_1E1C0F460;
    v7[4] = self;
    v8 = v4;
    -[GEOMapTileFinder findTiles:](tileFinder, "findTiles:", v7);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }

}

void __62__GEOMapTransitGeometryFinder_findTransitGeometryWithHandler___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = (void *)WeakRetained[5];
    WeakRetained[5] = 0;

    objc_msgSend(WeakRetained, "complete");
  }

}

void __62__GEOMapTransitGeometryFinder_findTransitGeometryWithHandler___block_invoke_2(uint64_t a1, void *a2)
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
  double v14;
  double v15;
  unint64_t i;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  double *v20;
  __n128 v21;
  __n128 v22;
  double *v23;
  double *v24;
  float *v25;
  double v26;
  uint64_t v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[2];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "tileKey");
  v5 = *(_QWORD *)v4;
  v6 = *(_QWORD *)v4 << 32;
  v7 = BYTE4(*(_QWORD *)v4) | ((((*(_QWORD *)v4 >> 40) | (*(unsigned __int16 *)(v4 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v4 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v4 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v4 + 10) >> 4) << 52);
  *(_QWORD *)((char *)v32 + 1) = v6 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(v32[0]) = v5;
  *((_QWORD *)&v8 + 1) = v7;
  *(_QWORD *)&v8 = v6;
  v31[0] = v32[0];
  v31[1] = v8 >> 56;
  v9 = GEOMapRectForGEOTileKey((uint64_t)v31);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  for (i = 0; i < objc_msgSend(v3, "polygonsCount"); ++i)
  {
    v17 = (_QWORD *)(objc_msgSend(v3, "polygons") + (i << 7));
    if (v17[5] == *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
    {
      v32[0] = 0;
      v18 = geo::codec::multiSectionFeaturePoints(v17, 0, v32);
      v19 = v32[0];
      v20 = (double *)malloc_type_malloc(16 * v32[0], 0x1000040451B5BE8uLL);
      v23 = v20;
      if (v19)
      {
        v24 = v20 + 1;
        v25 = (float *)v18 + 1;
        v26 = -1.79769313e308;
        v21.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
        v27 = v19;
        v28 = -1.79769313e308;
        v22.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
        do
        {
          v29 = v9 + *(v25 - 1) * v13;
          v30 = v11 + (float)(1.0 - *v25) * v15;
          v21.n128_f64[0] = fmin(v21.n128_f64[0], v29);
          v22.n128_f64[0] = fmin(v22.n128_f64[0], v30);
          v28 = fmax(v28, v29);
          v26 = fmax(v26, v30);
          *(v24 - 1) = v29;
          *v24 = v30;
          v24 += 2;
          v25 += 2;
          --v27;
        }
        while (v27);
      }
      else
      {
        v28 = -1.79769313e308;
        v22.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
        v26 = -1.79769313e308;
        v21.n128_u64[0] = 0x7FEFFFFFFFFFFFFFLL;
      }
      (*(void (**)(__n128, __n128, double, double))(*(_QWORD *)(a1 + 40) + 16))(v21, v22, v28 - v21.n128_f64[0], v26 - v22.n128_f64[0]);
      free(v23);
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tileFinder, 0);
}

@end
