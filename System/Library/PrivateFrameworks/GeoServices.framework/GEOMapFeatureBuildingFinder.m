@implementation GEOMapFeatureBuildingFinder

- (vector<GeoCodecsVectorTilePoint,)_verticesFromTile:(GEOMapFeatureBuildingFinder *)self forBuildingIndex:(SEL)a3
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  GeoCodecsVectorTilePoint *end;
  unint64_t v13;
  __compressed_pair<GeoCodecsVectorTilePoint *, std::allocator<GeoCodecsVectorTilePoint>> *p_end_cap;
  uint64_t v15;
  uint64_t v16;
  unsigned __int16 *v17;
  int v18;
  unint64_t v19;
  uint64_t v20;
  GeoCodecsVectorTilePoint v21;
  GeoCodecsVectorTilePoint *begin;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  char *v27;
  GeoCodecsVectorTilePoint *v28;
  GeoCodecsVectorTilePoint *v29;
  GeoCodecsVectorTilePoint v30;
  vector<GeoCodecsVectorTilePoint, std::allocator<GeoCodecsVectorTilePoint>> *result;
  id v32;
  uint64_t v33;
  unsigned __int16 *v34;
  uint64_t v35;
  uint64_t v36;

  v32 = a4;
  v7 = objc_msgSend(v32, "daVinciBuildingSections");
  v35 = objc_msgSend(v32, "daVinciBuildingVertices");
  v8 = objc_msgSend(v32, "daVinciLineLoops");
  v9 = objc_msgSend(v32, "daVinciBuildings") + 40 * a5;
  v10 = *(unsigned __int16 *)(v9 + 32);
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  v11 = *(unsigned __int16 *)(v9 + 34);
  v34 = (unsigned __int16 *)(v9 + 34);
  if (*(_WORD *)(v9 + 34))
  {
    end = 0;
    v13 = 0;
    v36 = v7 + 20 * v10;
    p_end_cap = &retstr->__end_cap_;
    v33 = v8;
    do
    {
      v15 = *(unsigned int *)(v36 + 20 * v13 + 12);
      v16 = v8 + 8 * v15;
      v18 = *(unsigned __int16 *)(v16 + 4);
      v17 = (unsigned __int16 *)(v16 + 4);
      if (v18)
      {
        v19 = 0;
        v20 = v35 + 12 * *(unsigned int *)(v8 + 8 * v15);
        do
        {
          v21 = *(GeoCodecsVectorTilePoint *)(v20 + 12 * v19);
          if (end >= p_end_cap->__value_)
          {
            begin = retstr->__begin_;
            v23 = end - retstr->__begin_;
            v24 = v23 + 1;
            if ((unint64_t)(v23 + 1) >> 61)
              std::vector<zilch::GeoCoordinates>::__throw_length_error[abi:ne180100]();
            v25 = (char *)p_end_cap->__value_ - (char *)begin;
            if (v25 >> 2 > v24)
              v24 = v25 >> 2;
            if ((unint64_t)v25 >= 0x7FFFFFFFFFFFFFF8)
              v26 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v26 = v24;
            if (v26)
            {
              v27 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<zilch::StringList::Entry>>((uint64_t)&retstr->__end_cap_, v26);
              begin = retstr->__begin_;
              end = retstr->__end_;
            }
            else
            {
              v27 = 0;
            }
            v28 = (GeoCodecsVectorTilePoint *)&v27[8 * v23];
            *v28 = v21;
            v29 = v28 + 1;
            if (end != begin)
            {
              do
              {
                v30 = end[-1];
                --end;
                v28[-1] = v30;
                --v28;
              }
              while (end != begin);
              begin = retstr->__begin_;
            }
            retstr->__begin_ = v28;
            retstr->__end_ = v29;
            retstr->__end_cap_.__value_ = (GeoCodecsVectorTilePoint *)&v27[8 * v26];
            if (begin)
              operator delete(begin);
            end = v29;
          }
          else
          {
            *end++ = v21;
          }
          retstr->__end_ = end;
          ++v19;
        }
        while (v19 < *v17);
        v8 = v33;
        v11 = *v34;
      }
      ++v13;
    }
    while (v13 < v11);
  }

  return result;
}

- (id)findBuildingsNear:(id)a3 radius:(double)a4 tileSetStyle:(int)a5 handler:(id)a6 completionHandler:(id)a7
{
  double var1;
  double var0;
  id v13;
  id v14;
  uint64_t v15;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v16;
  GEOMapFeatureTileFinder *v17;
  void *v18;
  GEOMapFeatureTileFinder *v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  long double v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v28[5];
  id v29;
  double v30;
  uint64_t v31;
  double v32;

  var1 = a3.var1;
  var0 = a3.var0;
  v13 = a6;
  v14 = a7;
  if (a5 == 1)
    v15 = 73;
  else
    v15 = 11;
  v16 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", v15, 0);
  v17 = [GEOMapFeatureTileFinder alloc];
  -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:](v17, "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v16), v16, 0, v15, v18);

  v20 = GEOTilePointForCoordinate(var0, var1, 20.0);
  v22 = v21;
  v23 = GEOMapPointsPerMeterAtLatitude(var0);
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __95__GEOMapFeatureBuildingFinder_findBuildingsNear_radius_tileSetStyle_handler_completionHandler___block_invoke;
  v28[3] = &unk_1E1C02290;
  v28[4] = self;
  v30 = v20;
  v31 = v22;
  v32 = v23 * a4;
  v24 = v13;
  v29 = v24;
  v25 = (void *)MEMORY[0x18D765024](v28);
  -[GEOMapFeatureTileFinder findTilesAround:radius:handler:completionHandler:](v19, "findTilesAround:radius:handler:completionHandler:", v25, v14, var0, var1, a4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

void __95__GEOMapFeatureBuildingFinder_findBuildingsNear_radius_tileSetStyle_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int8x8_t v9;
  unint64_t v10;
  __int128 v11;
  unint64_t v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  GEOMapFeatureBuilding *v18;
  unint64_t i;
  void *v20;
  GEOMapFeatureBuilding *v21;
  _DWORD v22[3];
  __int128 __p;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "tileKey");
  v5 = *(unsigned __int8 *)(v4 + 10);
  v6 = *(unsigned __int16 *)(v4 + 8);
  v7 = *(_QWORD *)v4;
  v8 = *(_QWORD *)v4 << 32;
  v9 = vand_s8((int8x8_t)vzip1_s32((int32x2_t)((v6 & 0xFFFFFFFFFF00FFFFLL | (v5 << 16)) >> 2), (int32x2_t)(v5 & 0xFFFFFFFFFFFFLL)), (int8x8_t)0xF00003FFFLL);
  v10 = BYTE4(*(_QWORD *)v4) | ((((*(_QWORD *)v4 >> 40) | ((_DWORD)v6 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)v9.u32[0] << 34) | ((unint64_t)v9.u32[1] << 48) | (v5 << 48) & 0xF0000000000000;
  *(_QWORD *)((char *)&__p + 1) = v8 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v4 >> 8) & 0x3F) << 40);
  LOBYTE(__p) = v7;
  *((_QWORD *)&v11 + 1) = v10;
  *(_QWORD *)&v11 = v8;
  objc_msgSend(*(id *)(a1 + 32), "_boundingCircleWithCenter:radius:inTile:", (_QWORD)__p, (unint64_t)(v11 >> 56), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v12 = 0;
  v22[0] = v13;
  v22[1] = v14;
  v22[2] = v15;
  while (v12 < objc_msgSend(v3, "totalBuildingFootprintsCount"))
  {
    GEOBuildingFootprintFeatureAtIndex(v3, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "feature");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "_boundingCircle:intersectsFeature:", v22, v17))
    {
      v18 = -[GEOMapFeatureBuilding initWithFeature:]([GEOMapFeatureBuilding alloc], "initWithFeature:", v16);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    ++v12;
  }
  for (i = 0; i < objc_msgSend(v3, "daVinciBuildingCount"); ++i)
  {
    v20 = *(void **)(a1 + 32);
    if (v20)
    {
      objc_msgSend(v20, "_verticesFromTile:forBuildingIndex:", v3, i);
      v20 = *(void **)(a1 + 32);
    }
    else
    {
      __p = 0uLL;
      v24 = 0;
    }
    if (objc_msgSend(v20, "_boundingCircle:intersectsPoints:pointCount:", v22))
    {
      v21 = -[GEOMapFeatureBuilding initWithDaVinciTile:buildingIndex:]([GEOMapFeatureBuilding alloc], "initWithDaVinciTile:buildingIndex:", v3, i);
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

    }
    if ((_QWORD)__p)
    {
      *((_QWORD *)&__p + 1) = __p;
      operator delete((void *)__p);
    }
  }

}

- (id)findBuildingsNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  -[GEOMapFeatureBuildingFinder findBuildingsNear:radius:tileSetStyle:handler:completionHandler:](self, "findBuildingsNear:radius:tileSetStyle:handler:completionHandler:", 0, a5, a6, a3.var0, a3.var1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
