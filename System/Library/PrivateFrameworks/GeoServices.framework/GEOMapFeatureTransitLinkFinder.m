@implementation GEOMapFeatureTransitLinkFinder

- (id)findTransitLinksNear:(id)a3 radius:(double)a4 handler:(id)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  $7E3FC3C8846FD6918BD0D88F3AA609C8 v13;
  GEOMapFeatureTileFinder *v14;
  void *v15;
  GEOMapFeatureTileFinder *v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  long double v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[5];
  id v26;
  double v27;
  uint64_t v28;
  double v29;

  var1 = a3.var1;
  var0 = a3.var0;
  v11 = a5;
  v12 = a6;
  v13 = +[GEOMapFeatureAccess tileSetInfoForStyle:scale:](GEOMapFeatureAccess, "tileSetInfoForStyle:scale:", 37, 0);
  v14 = [GEOMapFeatureTileFinder alloc];
  -[GEOMapFeatureAccessFinder requestParameters](self, "requestParameters");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[GEOMapFeatureTileFinder initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:](v14, "initWithZoomLevel:tileSize:tileScale:tileSetStyle:requestParameters:", HIDWORD(*(unint64_t *)&v13), v13, 0, 37, v15);

  v17 = GEOTilePointForCoordinate(var0, var1, 20.0);
  v19 = v18;
  v20 = GEOMapPointsPerMeterAtLatitude(var0);
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __88__GEOMapFeatureTransitLinkFinder_findTransitLinksNear_radius_handler_completionHandler___block_invoke;
  v25[3] = &unk_1E1C02290;
  v25[4] = self;
  v27 = v17;
  v28 = v19;
  v29 = v20 * a4;
  v21 = v11;
  v26 = v21;
  v22 = (void *)MEMORY[0x18D765024](v25);
  -[GEOMapFeatureTileFinder findTilesAround:radius:handler:completionHandler:](v16, "findTilesAround:radius:handler:completionHandler:", v22, v12, var0, var1, a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  return v23;
}

void __88__GEOMapFeatureTransitLinkFinder_findTransitLinksNear_radius_handler_completionHandler___block_invoke(uint64_t a1, void *a2)
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
  unint64_t i;
  GEOMapFeatureTransitLink *v19;
  _BYTE v20[12];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "tileKey");
  v5 = *(unsigned __int8 *)(v4 + 10);
  v6 = *(unsigned __int16 *)(v4 + 8);
  v7 = *(_QWORD *)v4;
  v8 = *(_QWORD *)v4 << 32;
  v9 = vand_s8((int8x8_t)vzip1_s32((int32x2_t)((v6 & 0xFFFFFFFFFF00FFFFLL | (v5 << 16)) >> 2), (int32x2_t)(v5 & 0xFFFFFFFFFFFFLL)), (int8x8_t)0xF00003FFFLL);
  v10 = BYTE4(*(_QWORD *)v4) | ((((*(_QWORD *)v4 >> 40) | ((_DWORD)v6 << 24)) & 0x3FFFFFF) << 8) | ((unint64_t)v9.u32[0] << 34) | ((unint64_t)v9.u32[1] << 48) | (v5 << 48) & 0xF0000000000000;
  *(_QWORD *)&v20[1] = v8 & 0xFFFFC00000000000 | ((unint64_t)((*(_QWORD *)v4 >> 8) & 0x3F) << 40);
  v20[0] = v7;
  *((_QWORD *)&v11 + 1) = v10;
  *(_QWORD *)&v11 = v8;
  objc_msgSend(*(id *)(a1 + 32), "_boundingCircleWithCenter:radius:inTile:", *(_QWORD *)v20, (unint64_t)(v11 >> 56), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v12 = 0;
  *(_DWORD *)v20 = v13;
  *(_DWORD *)&v20[4] = v14;
  *(_DWORD *)&v20[8] = v15;
  while (v12 < objc_msgSend(v3, "transitLinkCount"))
  {
    objc_msgSend(v3, "transitLinks");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(*(id *)(a1 + 32), "_boundingCircle:intersectsTransitLink:", v20, v17))
    {
      for (i = 0; i < *(_QWORD *)(objc_msgSend(v17, "transitIndexRange") + 8); ++i)
      {
        v19 = -[GEOMapFeatureTransitLink initWithTransitLink:lineIndex:]([GEOMapFeatureTransitLink alloc], "initWithTransitLink:lineIndex:", v17, i);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

      }
    }

    ++v12;
  }

}

@end
