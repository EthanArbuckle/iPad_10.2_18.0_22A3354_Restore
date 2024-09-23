@implementation GEORouteMatchUpdater

void __76___GEORouteMatchUpdater__isLocation_nearTransitPoint_transitID_featureSize___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __76___GEORouteMatchUpdater__isLocation_nearTransitPoint_transitID_featureSize___block_invoke_2;
  v8[3] = &unk_1E1C06E78;
  v9 = v3;
  v10 = v4;
  v6 = v3;
  v7 = (id)objc_msgSend(v5, "findTransitGeometryForPoint:completionHandler:", v6, v8);

}

void __76___GEORouteMatchUpdater__isLocation_nearTransitPoint_transitID_featureSize___block_invoke_2(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), *(id *)(a1 + 32));
}

void __63___GEORouteMatchUpdater_EnterBoard__isLocationNearAccessPoint___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  __int128 v7;
  _QWORD v8[4];
  __int128 v9;

  objc_msgSend(a2, "station");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __63___GEORouteMatchUpdater_EnterBoard__isLocationNearAccessPoint___block_invoke_2;
    v8[3] = &unk_1E1C127A8;
    v7 = *(_OWORD *)(a1 + 40);
    v5 = (id)v7;
    v9 = v7;
    v6 = (id)objc_msgSend(v4, "findTransitAccessPointsForStation:handler:completionHandler:", v3, v8, 0);

  }
}

void __63___GEORouteMatchUpdater_EnterBoard__isLocationNearAccessPoint___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  int v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  long double v14;
  void *v15;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v15 = v3;
    v5 = objc_msgSend(v3, "isEntrance");
    v4 = v15;
    if (v5)
    {
      objc_msgSend(v15, "radiusMeters");
      if (v6 == 0.0)
        v7 = 20.0;
      else
        v7 = v6;
      objc_msgSend(*(id *)(a1 + 32), "coordinate");
      v9 = v8;
      v11 = v10;
      objc_msgSend(v15, "coordinate");
      v14 = GEOCalculateDistanceRadius(v9, v11, v12, v13, 6367000.0);
      v4 = v15;
      if (v14 < v7)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }

}

@end
