@implementation MKQuickRouteManager

void __33___MKQuickRouteManager_updateETA__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  double v12;
  BOOL v13;
  void *v14;
  void *v15;
  int v16;
  _BOOL4 v17;
  _BOOL4 v18;
  double v19;
  double v20;
  _BOOL4 v21;
  _BOOL4 v22;
  double v23;
  double v24;
  double v25;
  _BOOL4 v26;
  void *v27;
  int v28;
  BOOL v29;
  int v30;
  uint64_t v31;
  void *v32;
  dispatch_time_t v33;
  void *v34;
  void *v35;
  id v36;
  _QWORD *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, void *);
  void *v42;
  void *v43;
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  char v51;
  _QWORD block[5];
  id v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  BOOL v57;

  v4 = *(_QWORD **)(a1 + 32);
  v5 = v4[3];
  objc_msgSend(v4, "originCoordinate");
  v8 = v6;
  v9 = v7;
  v10 = *(_QWORD *)(a1 + 32);
  if (v5 == a2 && !*(_BYTE *)(v10 + 56))
  {
    if (!objc_msgSend(*(id *)(v10 + 8), "shouldUpdateEstimatedTravelTimeForNewOrigin:", v6, v7))
      return;
    v10 = *(_QWORD *)(a1 + 32);
  }
  *(_BYTE *)(v10 + 56) = 0;
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v11 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (v11)
  {
    objc_msgSend(v11, "travelTime");
    v13 = v12 < 0.0 || v5 != a2;
  }
  else
  {
    v13 = 1;
  }
  v57 = v13;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "expireETAsIfNoLongerValid");
  if (objc_msgSend(*(id *)(a1 + 32), "haveETAsForPreferredTransportType:", a2)
    && (objc_msgSend(*(id *)(a1 + 32), "bestETAForPreferredDirectionsType:", a2),
        (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v14);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = a2;
    objc_msgSend(*(id *)(a1 + 32), "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "quickRouteManager:didUpdateETA:error:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32), *((unsigned __int8 *)v55 + 24));
  }
  else
  {
    +[_MKRouteETA routeETAWithDistance:travelTime:transportType:](_MKRouteETA, "routeETAWithDistance:travelTime:transportType:", a2, -1.0, -1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(*(id *)(a1 + 32), "isUsingCurrentLocationForOrigin");
    v17 = v9 >= -180.0;
    if (v9 > 180.0)
      v17 = 0;
    if (v8 < -90.0)
      v17 = 0;
    v18 = v8 <= 90.0 && v17;
    objc_msgSend(*(id *)(a1 + 32), "destinationCoordinate");
    v21 = v20 >= -180.0;
    if (v20 > 180.0)
      v21 = 0;
    if (v19 < -90.0)
      v21 = 0;
    v22 = v19 <= 90.0 && v21;
    if (v18 && v22)
    {
      GEOCalculateDistance();
      v24 = v23;
      objc_msgSend(*(id *)(a1 + 32), "_maxDistanceToRequestETA");
      v26 = v24 > v25 && v25 > 0.0;
      if (objc_msgSend(*(id *)(a1 + 32), "_transportTypeShouldBeSmart"))
        objc_msgSend(v14, "setTransportType:", objc_msgSend(*(id *)(a1 + 32), "guessTransportTypeForDistance:preferredDirectionsType:", a2, v24));
    }
    else
    {
      v26 = 0;
    }
    objc_msgSend(*(id *)(a1 + 32), "mapItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "originMapItem");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isEqual:", v15);
    if (v15)
      v29 = v22;
    else
      v29 = 0;
    if (v29)
    {
      v30 = v16 & !v18 | v26 | v28;
      v31 = *(_QWORD *)(a1 + 32);
      if (v30 == 1)
      {
        objc_msgSend((id)v31, "view");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "quickRouteManager:didUpdateETA:error:animated:", *(_QWORD *)(a1 + 32), v14, 0, 0);

      }
      else
      {
        if (*(_QWORD *)(v31 + 16))
        {
          if (v5 == a2)
          {
            objc_msgSend(*(id *)(v31 + 16), "setTravelTime:", -1.0);
            objc_msgSend(*(id *)(a1 + 32), "view");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "quickRouteManager:didUpdateETA:error:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), 0, 0);
          }
          else
          {
            objc_msgSend((id)v31, "view");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v34, "quickRouteManager:didUpdateETA:error:animated:", *(_QWORD *)(a1 + 32), v14, 0, 0);
          }

          *((_BYTE *)v55 + 24) = 1;
          v31 = *(_QWORD *)(a1 + 32);
        }
        v48 = 0;
        v49 = &v48;
        v50 = 0x2020000000;
        v51 = 0;
        *(_QWORD *)(v31 + 24) = a2;
        v35 = *(void **)(a1 + 32);
        v39 = MEMORY[0x1E0C809B0];
        v40 = 3221225472;
        v41 = __33___MKQuickRouteManager_updateETA__block_invoke_3;
        v42 = &unk_1E20DC140;
        v43 = v35;
        v47 = a2;
        v36 = v14;
        v44 = v36;
        v45 = &v54;
        v46 = &v48;
        objc_msgSend(v35, "requestNewETAForPreferredTransportType:completion:", a2, &v39);
        if (!*((_BYTE *)v49 + 24))
        {
          v37 = *(_QWORD **)(a1 + 32);
          if (!v37[2])
          {
            objc_msgSend(v37, "view", v39, v40, v41, v42, v43);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "quickRouteManager:didUpdateETA:error:animated:", *(_QWORD *)(a1 + 32), v36, 0, 0);

          }
        }

        _Block_object_dispose(&v48, 8);
      }
    }
    else
    {
      v33 = dispatch_time(0, 150000000);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __33___MKQuickRouteManager_updateETA__block_invoke_2;
      block[3] = &unk_1E20D7E58;
      block[4] = *(_QWORD *)(a1 + 32);
      v53 = v14;
      dispatch_after(v33, MEMORY[0x1E0C80D38], block);

    }
  }

  _Block_object_dispose(&v54, 8);
}

void __33___MKQuickRouteManager_updateETA__block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "mapItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "quickRouteManager:didUpdateETA:error:animated:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), 0, 0);

  }
}

void __33___MKQuickRouteManager_updateETA__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (v6
    || (objc_msgSend(*(id *)(a1 + 32), "bestETAForPreferredDirectionsType:", *(_QWORD *)(a1 + 64)),
        (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v3 = *(id *)(a1 + 40);
  }
  else
  {
    v3 = v4;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 16), v4);
  }
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "quickRouteManager:didUpdateETA:error:animated:", *(_QWORD *)(a1 + 32), v3, v6, *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
}

void __74___MKQuickRouteManager_requestNewETAForPreferredTransportType_completion___block_invoke(_QWORD *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void (*v7)(void);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unsigned int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!a3)
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v5, "_sortedETAs", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v9)
    {
      v10 = v9;
      v11 = 0;
      v12 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v8);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          if (objc_msgSend(v14, "status"))
          {
            v15 = objc_msgSend(v14, "transportType");
            if (v15 > 5)
              v16 = 1;
            else
              v16 = qword_18B2AA2B8[v15];
            v11 |= v16 == a1[6];
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v10);
    }
    else
    {
      v11 = 0;
    }

    objc_msgSend(*(id *)(a1[4] + 8), "etaResults");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19 && (v11 & 1) == 0)
    {
      if (objc_msgSend(v6, "transportType") == a1[6])
      {
        objc_msgSend(v6, "expectedTravelTime");
        v21 = v20;

        if (v21 <= 0.0)
        {
LABEL_24:
          v7 = *(void (**)(void))(a1[5] + 16);
          goto LABEL_25;
        }
        objc_msgSend(v6, "distance");
        v23 = v22;
        objc_msgSend(v6, "expectedTravelTime");
        +[_MKRouteETA routeETAWithDistance:travelTime:transportType:](_MKRouteETA, "routeETAWithDistance:travelTime:transportType:", a1[6], v23, v24);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1[4] + 8), "etaResults");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1[6]);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setObject:forKeyedSubscript:", v17, v19);
      }
      else
      {
        v19 = 0;
      }
    }

    goto LABEL_24;
  }
  v7 = *(void (**)(void))(a1[5] + 16);
LABEL_25:
  v7();

}

@end
