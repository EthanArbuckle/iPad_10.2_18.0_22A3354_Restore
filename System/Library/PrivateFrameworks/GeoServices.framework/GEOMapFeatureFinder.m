@implementation GEOMapFeatureFinder

- (GEOMapFeatureFinder)initWithMap:(id)a3 center:(id)a4
{
  double var1;
  double var0;
  GEOMapFeatureFinder *result;
  objc_super v7;

  var1 = a4.var1;
  var0 = a4.var0;
  v7.receiver = self;
  v7.super_class = (Class)GEOMapFeatureFinder;
  result = -[GEOMapRequest initWithManager:](&v7, sel_initWithManager_, a3);
  if (result)
  {
    result->_coordinate.latitude = var0;
    result->_coordinate.longitude = var1;
  }
  return result;
}

- (void)cancel
{
  GEOMapTileFinder *tileFinder;
  objc_super v4;

  -[GEOMapTileFinder cancel](self->_tileFinder, "cancel");
  tileFinder = self->_tileFinder;
  self->_tileFinder = 0;

  -[GEOMapFeatureFinder setRoadHandler:](self, "setRoadHandler:", 0);
  -[GEOMapFeatureFinder setPointHandler:](self, "setPointHandler:", 0);
  -[GEOMapFeatureFinder setPolygonHandler:](self, "setPolygonHandler:", 0);
  v4.receiver = self;
  v4.super_class = (Class)GEOMapFeatureFinder;
  -[GEOMapRequest cancel](&v4, sel_cancel);
}

- (GEOMapAccess)map
{
  return (GEOMapAccess *)self->super._requestManager;
}

- (void)findFeatures:(id)a3 pointHandler:(id)a4 polygonHandler:(id)a5 completionHandler:(id)a6
{
  id v10;
  double latitude;
  double v12;
  uint64_t v13;
  uint64_t v14;
  long double v15;
  void *v16;
  GEOMapTileFinder *v17;
  GEOMapTileFinder *tileFinder;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  _QWORD v23[16];
  id v24;
  id location;
  _QWORD v26[19];
  _QWORD v27[4];
  _QWORD v28[4];
  _QWORD v29[3];
  int v30;
  _QWORD v31[4];
  _QWORD v32[3];
  char v33;
  _QWORD v34[3];
  int v35;
  _QWORD v36[4];
  _QWORD v37[4];
  _QWORD v38[4];
  _QWORD v39[3];
  int v40;
  _QWORD v41[5];
  id v42;

  v10 = a3;
  v22 = a4;
  v21 = a5;
  -[GEOMapRequest setCompletionHandler:](self, "setCompletionHandler:", a6);
  latitude = self->_coordinate.latitude;
  v12 = GEOTilePointForCoordinate(latitude, self->_coordinate.longitude, 20.0);
  v14 = v13;
  v15 = GEOMapPointsPerMeterAtLatitude(latitude);
  -[GEOMapFeatureFinder map](self, "map");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[GEOMapTileFinder realisticTileFinderForMap:center:radius:](GEOMapTileFinder, "realisticTileFinderForMap:center:radius:", v16, self->_coordinate.latitude, self->_coordinate.longitude, 1000.0);
  v17 = (GEOMapTileFinder *)objc_claimAutoreleasedReturnValue();
  tileFinder = self->_tileFinder;
  self->_tileFinder = v17;

  -[GEOMapFeatureFinder setRoadHandler:](self, "setRoadHandler:", v10);
  -[GEOMapFeatureFinder setPointHandler:](self, "setPointHandler:", v22);
  -[GEOMapFeatureFinder setPolygonHandler:](self, "setPolygonHandler:", v21);
  v41[0] = 0;
  v41[1] = v41;
  v41[2] = 0x3032000000;
  v41[3] = __Block_byref_object_copy__54;
  v41[4] = __Block_byref_object_dispose__54;
  v42 = 0;
  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v40 = 2139095039;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v38[3] = 0;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  v37[3] = 0;
  v36[0] = 0;
  v36[1] = v36;
  v36[2] = 0x2020000000;
  v36[3] = 0;
  v34[0] = 0;
  v34[1] = v34;
  v34[2] = 0x2020000000;
  v35 = 0;
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x2020000000;
  v33 = 0;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v30 = 2139095039;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v27[3] = 0;
  v19 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke;
  v26[3] = &unk_1E1C0D8B8;
  *(double *)&v26[16] = v12;
  v26[17] = v14;
  *(long double *)&v26[18] = v15;
  v26[4] = self;
  v26[5] = v39;
  v26[6] = v41;
  v26[7] = v38;
  v26[8] = v37;
  v26[9] = v36;
  v26[10] = v34;
  v26[11] = v32;
  v26[12] = v29;
  v26[13] = v31;
  v26[14] = v28;
  v26[15] = v27;
  v20 = (void *)MEMORY[0x18D765024](v26);
  objc_initWeak(&location, self);
  v23[0] = v19;
  v23[1] = 3221225472;
  v23[2] = __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_5;
  v23[3] = &unk_1E1C0D8E0;
  objc_copyWeak(&v24, &location);
  v23[6] = v37;
  v23[7] = v36;
  v23[8] = v34;
  v23[9] = v39;
  v23[10] = v38;
  v23[11] = v32;
  v23[12] = v31;
  v23[13] = v29;
  v23[14] = v28;
  v23[15] = v27;
  v23[4] = self;
  v23[5] = v41;
  -[GEOMapRequest setCompletionHandler:](self->_tileFinder, "setCompletionHandler:", v23);
  -[GEOMapTileFinder findTiles:](self->_tileFinder, "findTiles:", v20);
  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  _Block_object_dispose(v27, 8);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v29, 8);
  _Block_object_dispose(v31, 8);
  _Block_object_dispose(v32, 8);
  _Block_object_dispose(v34, 8);
  _Block_object_dispose(v36, 8);
  _Block_object_dispose(v37, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v41, 8);

}

void __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  float v14;
  float v15;
  double v16;
  double v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  float v23;
  float v24;
  _QWORD v25[5];
  __int128 v26;
  uint64_t v27;
  double v28;
  float v29;
  float v30;
  _QWORD v31[5];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  double v36;
  float v37;
  float v38;
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "tileKey");
  v5 = *(_QWORD *)v4;
  v6 = *(_QWORD *)v4 << 32;
  v7 = BYTE4(*(_QWORD *)v4) | ((((*(_QWORD *)v4 >> 40) | (*(unsigned __int16 *)(v4 + 8) << 24)) & 0x3FFFFFF) << 8) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(unsigned __int16 *)(v4 + 8) >> 2) << 34) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v4 + 10) & 0xF) << 48) & 0xFF0FFFFFFFFFFFFFLL | ((unint64_t)(*(_BYTE *)(v4 + 10) >> 4) << 52);
  *(_QWORD *)((char *)v40 + 1) = v6 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(v40[0]) = v5;
  *((_QWORD *)&v8 + 1) = v7;
  *(_QWORD *)&v8 = v6;
  v39[0] = v40[0];
  v39[1] = v8 >> 56;
  v9 = GEOMapRectForGEOTileKey((uint64_t)v39);
  v13 = *(double *)(a1 + 136);
  v14 = (*(double *)(a1 + 128) - v9) / v11;
  v15 = (v12 - (v13 - v10)) / v12;
  v16 = *(double *)(a1 + 144);
  v17 = v11 / v16;
  v18 = *(_QWORD **)(a1 + 32);
  v19 = MEMORY[0x1E0C809B0];
  if (v18[8])
  {
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_2;
    v31[3] = &unk_1E1C0D840;
    v37 = v14;
    v38 = (v12 - (v13 - v10)) / v12;
    v32 = *(_OWORD *)(a1 + 40);
    v36 = v11 / v16;
    v33 = *(_OWORD *)(a1 + 56);
    v34 = *(_OWORD *)(a1 + 72);
    v20 = *(_QWORD *)(a1 + 88);
    v31[4] = v18;
    v35 = v20;
    objc_msgSend(v3, "forEachRoad:", v31);
    v18 = *(_QWORD **)(a1 + 32);
  }
  if (v18[9])
  {
    v25[0] = v19;
    v25[1] = 3221225472;
    v25[2] = __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_3;
    v25[3] = &unk_1E1C0D868;
    v25[4] = v18;
    v29 = v14;
    v30 = v15;
    v26 = *(_OWORD *)(a1 + 96);
    v27 = *(_QWORD *)(a1 + 112);
    v28 = v17;
    objc_msgSend(v3, "forEachPoint:", v25);
    v18 = *(_QWORD **)(a1 + 32);
  }
  if (v18[10])
  {
    v22[0] = v19;
    v22[1] = 3221225472;
    v22[2] = __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_4;
    v22[3] = &unk_1E1C0D890;
    v23 = v14;
    v24 = v15;
    v21 = *(_QWORD *)(a1 + 120);
    v22[4] = v18;
    v22[5] = v21;
    objc_msgSend(v3, "forEachPolygon:", v22);
  }

}

void __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  void *v6;
  unint64_t i;
  _QWORD *v8;
  float v9;
  uint64_t v10;
  float *v11;
  int v12;
  uint64_t v13;
  unint64_t v14;

  v4 = a2;
  objc_msgSend(v4, "feature");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) || objc_msgSend(v5, "labelCount") || objc_msgSend(v6, "shieldCount"))
  {
    for (i = 0; i < objc_msgSend(v4, "sectionCount"); ++i)
    {
      v14 = 0;
      v8 = GEOMultiSectionFeaturePoints(v4, i, &v14);
      v13 = 0;
      v12 = 0;
      v9 = gm::Matrix<float,2,1>::distanceSquaredToPolyline<int,void>((float *)(a1 + 104), v14, (uint64_t)v8, &v13, (float *)&v12);
      if (v9 < *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      {
        objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
        *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_QWORD *)(a1 + 96);
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = i;
        v10 = v13;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v13;
        *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = v12;
        v11 = (float *)&v8[v10];
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = (float)((float)(0.0
                                                                                   - (float)((float)(v11[3] - v11[1])
                                                                                           * (float)(*(float *)(a1 + 104) - *v11)))
                                                                           + (float)((float)(v11[2] - *v11)
                                                                                   * (float)(*(float *)(a1 + 108)
                                                                                           - v11[1]))) > 0.0;
      }
    }
  }

}

double __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_3(uint64_t a1, uint64_t a2, double result)
{
  float v3;

  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 88) || *(_BYTE *)(a2 + 73))
  {
    v3 = *(float *)(a2 + 88) - *(float *)(a1 + 72);
    *(float *)&result = (float)((float)(v3 * v3) + 0.0)
                      + (float)((float)(*(float *)(a2 + 92) - *(float *)(a1 + 76))
                              * (float)(*(float *)(a2 + 92) - *(float *)(a1 + 76)));
    if (*(float *)&result < *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = a2;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = LODWORD(result);
      result = *(double *)(a1 + 64);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = result;
    }
  }
  return result;
}

uint64_t __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_4(uint64_t result, uint64_t a2)
{
  uint64_t v3;

  v3 = result;
  if (!*(_BYTE *)(*(_QWORD *)(result + 32) + 88) || *(_BYTE *)(a2 + 73))
  {
    result = GEOPolygonFeatureContains((float *)a2, *(float *)(result + 48), *(float *)(result + 52));
    if ((_DWORD)result)
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 40) + 8) + 24) = a2;
  }
  return result;
}

void __82__GEOMapFeatureFinder_findFeatures_pointHandler_polygonHandler_completionHandler___block_invoke_5(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  void *v4;
  float *v5;
  double v6;
  unint64_t v7;
  unint64_t v8;
  float v9;
  float v10;
  float *v11;
  float v12;
  float v13;
  float v14;
  float v15;
  float v16;
  float v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  std::__shared_weak_count *v27;
  unint64_t *p_shared_owners;
  unint64_t v29;
  std::__shared_weak_count *v30;
  unint64_t *v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  std::__shared_weak_count *v35;
  unint64_t *v36;
  unint64_t v37;
  std::__shared_weak_count *v38;
  unint64_t *v39;
  unint64_t v40;
  std::__shared_weak_count *v41;
  unint64_t *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  std::__shared_weak_count *v46;
  unint64_t *v47;
  unint64_t v48;
  std::__shared_weak_count *v49;
  unint64_t *v50;
  unint64_t v51;
  std::__shared_weak_count *v52;
  unint64_t *v53;
  unint64_t v54;
  uint64_t v55;
  void *v56;
  _QWORD *v57;
  std::__shared_weak_count *v58;
  _QWORD *v59;
  std::__shared_weak_count *v60;
  char *v61;
  std::__shared_weak_count *v62;
  _QWORD *v63;
  std::__shared_weak_count *v64;
  uint64_t v65;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 128));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (WeakRetained[8])
    {
      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      if (v4)
      {
        v65 = 0;
        v5 = (float *)GEOMultiSectionFeaturePoints(v4, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), &v65);
        if (v65 == 1)
        {
          v17 = NAN;
        }
        else
        {
          v7 = 0;
          v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
          v9 = *v5;
          v10 = v5[1];
          v11 = v5 + 3;
          LODWORD(v6) = 0;
          v12 = 0.0;
          v13 = 0.0;
          do
          {
            v14 = v9;
            v15 = v10;
            v9 = *(v11 - 1);
            v10 = *v11;
            v16 = sqrtf((float)((float)((float)(v14 - v9) * (float)(v14 - v9)) + 0.0)+ (float)((float)(v15 - *v11) * (float)(v15 - *v11)));
            if (v7 >= v8)
            {
              if (v8 == v7)
                v13 = v13 + (float)(v16 * *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24));
            }
            else
            {
              v13 = v13 + v16;
            }
            ++v7;
            v12 = v12 + v16;
            v11 += 2;
          }
          while (v65 - 1 != v7);
          v17 = v13 / v12;
        }
        v18 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "getRoad", v6);
        v19 = operator new(0x50uLL);
        v19[1] = 0;
        v20 = v19 + 1;
        v19[2] = 0;
        *v19 = &off_1E1BFB410;
        v19[4] = v18;
        v19[5] = 0;
        v19[3] = &off_1E1BF6708;
        *((_BYTE *)v19 + 72) = 0;
        v19[7] = 0;
        v19[8] = 0;
        v19[6] = 0;
        v63 = v19 + 3;
        v64 = (std::__shared_weak_count *)v19;
        v21 = *(_QWORD *)(a1 + 64);
        v22 = *(_QWORD *)(a1 + 88);
        *((double *)v19 + 5) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24)
                             * sqrtf(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24));
        v23 = *(_DWORD *)(*(_QWORD *)(v21 + 8) + 24);
        v24 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
        LOBYTE(v22) = *(_BYTE *)(*(_QWORD *)(v22 + 8) + 24);
        v19[6] = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
        v19[7] = v24;
        *((_DWORD *)v19 + 16) = v23;
        *((float *)v19 + 17) = v17;
        *((_BYTE *)v19 + 72) = v22;
        v25 = v3[8];
        v61 = (char *)(v19 + 3);
        v62 = (std::__shared_weak_count *)v19;
        do
          v26 = __ldxr(v20);
        while (__stxr(v26 + 1, v20));
        (*(void (**)(uint64_t, char **))(v25 + 16))(v25, &v61);
        v27 = v62;
        if (v62)
        {
          p_shared_owners = (unint64_t *)&v62->__shared_owners_;
          do
            v29 = __ldaxr(p_shared_owners);
          while (__stlxr(v29 - 1, p_shared_owners));
          if (!v29)
          {
            ((void (*)(std::__shared_weak_count *))v27->__on_zero_shared)(v27);
            std::__shared_weak_count::__release_weak(v27);
          }
        }
        v30 = v64;
        if (v64)
        {
          v31 = (unint64_t *)&v64->__shared_owners_;
          do
            v32 = __ldaxr(v31);
          while (__stlxr(v32 - 1, v31));
          if (!v32)
          {
            ((void (*)(std::__shared_weak_count *))v30->__on_zero_shared)(v30);
            std::__shared_weak_count::__release_weak(v30);
          }
        }
      }
    }
    v33 = v3[9];
    if (v33)
    {
      v34 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24);
      if (v34)
      {
        v35 = (std::__shared_weak_count *)operator new(0x30uLL);
        v35->__shared_owners_ = 0;
        v36 = (unint64_t *)&v35->__shared_owners_;
        v35->__shared_weak_owners_ = 0;
        v35->__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BFB480;
        v35[1].__shared_owners_ = v34;
        v35[1].__shared_weak_owners_ = 0;
        v35[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BF6760;
        v63 = &v35[1].__vftable;
        v64 = v35;
        *(double *)&v35[1].__shared_weak_owners_ = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24)
                                                 * sqrtf(*(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24));
        v59 = &v35[1].__vftable;
        v60 = v35;
        do
          v37 = __ldxr(v36);
        while (__stxr(v37 + 1, v36));
        (*(void (**)(uint64_t, _QWORD **))(v33 + 16))(v33, &v59);
        v38 = v60;
        if (v60)
        {
          v39 = (unint64_t *)&v60->__shared_owners_;
          do
            v40 = __ldaxr(v39);
          while (__stlxr(v40 - 1, v39));
          if (!v40)
          {
            ((void (*)(std::__shared_weak_count *))v38->__on_zero_shared)(v38);
            std::__shared_weak_count::__release_weak(v38);
          }
        }
        v41 = v64;
        if (v64)
        {
          v42 = (unint64_t *)&v64->__shared_owners_;
          do
            v43 = __ldaxr(v42);
          while (__stlxr(v43 - 1, v42));
          if (!v43)
          {
            ((void (*)(std::__shared_weak_count *))v41->__on_zero_shared)(v41);
            std::__shared_weak_count::__release_weak(v41);
          }
        }
      }
    }
    v44 = v3[10];
    if (v44)
    {
      v45 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24);
      if (v45)
      {
        v46 = (std::__shared_weak_count *)operator new(0x30uLL);
        v46->__shared_owners_ = 0;
        v47 = (unint64_t *)&v46->__shared_owners_;
        v46->__shared_weak_owners_ = 0;
        v46->__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BFB4B8;
        v46[1].__shared_owners_ = v45;
        v46[1].__shared_weak_owners_ = 0;
        v46[1].__vftable = (std::__shared_weak_count_vtbl *)&off_1E1BF6790;
        v63 = &v46[1].__vftable;
        v64 = v46;
        v57 = &v46[1].__vftable;
        v58 = v46;
        do
          v48 = __ldxr(v47);
        while (__stxr(v48 + 1, v47));
        (*(void (**)(uint64_t, _QWORD **))(v44 + 16))(v44, &v57);
        v49 = v58;
        if (v58)
        {
          v50 = (unint64_t *)&v58->__shared_owners_;
          do
            v51 = __ldaxr(v50);
          while (__stlxr(v51 - 1, v50));
          if (!v51)
          {
            ((void (*)(std::__shared_weak_count *))v49->__on_zero_shared)(v49);
            std::__shared_weak_count::__release_weak(v49);
          }
        }
        v52 = v64;
        if (v64)
        {
          v53 = (unint64_t *)&v64->__shared_owners_;
          do
            v54 = __ldaxr(v53);
          while (__stlxr(v54 - 1, v53));
          if (!v54)
          {
            ((void (*)(std::__shared_weak_count *))v52->__on_zero_shared)(v52);
            std::__shared_weak_count::__release_weak(v52);
          }
        }
      }
    }
    v55 = *(_QWORD *)(a1 + 32);
    v56 = *(void **)(v55 + 56);
    *(_QWORD *)(v55 + 56) = 0;

    objc_msgSend(v3, "complete");
  }

}

- (id)roadHandler
{
  return self->_roadHandler;
}

- (void)setRoadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)pointHandler
{
  return self->_pointHandler;
}

- (void)setPointHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)polygonHandler
{
  return self->_polygonHandler;
}

- (void)setPolygonHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)ignoreUnnamedFeatures
{
  return self->_ignoreUnnamedFeatures;
}

- (void)setIgnoreUnnamedFeatures:(BOOL)a3
{
  self->_ignoreUnnamedFeatures = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_polygonHandler, 0);
  objc_storeStrong(&self->_pointHandler, 0);
  objc_storeStrong(&self->_roadHandler, 0);
  objc_storeStrong((id *)&self->_tileFinder, 0);
}

@end
