@implementation MKRouteETAFetcher

void __88___MKRouteETAFetcher_requestNewETAForTransportType_additionalTransportTypes_completion___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v8 = *(void **)(v7 + 48);
  *(_QWORD *)(v7 + 48) = 0;

  if (a1[5] == *(_QWORD *)(a1[4] + 88))
  {
    *(CFAbsoluteTime *)(a1[4] + 32) = CFAbsoluteTimeGetCurrent();
    v9 = a1[4];
    objc_msgSend(v5, "source");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_coordinate");
    *(_QWORD *)(v9 + 16) = v11;
    *(_QWORD *)(v9 + 24) = v12;

    v13 = a1[4];
    if (v6)
    {
      *(_BYTE *)(v13 + 56) = 1;
      (*(void (**)(void))(a1[6] + 16))();
    }
    else
    {
      v25 = v5;
      *(_BYTE *)(v13 + 56) = 0;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(v5, "_sortedETAs");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v27;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v27 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
            v20 = objc_msgSend(v19, "transportType");
            if (v20 > 5)
              v21 = 1;
            else
              v21 = qword_18B2AA2B8[v20];
            +[_MKRouteETA routeETAWithDistance:travelTime:transportType:status:](_MKRouteETA, "routeETAWithDistance:travelTime:transportType:status:", v21, objc_msgSend(v19, "status"), (double)objc_msgSend(v19, "distance"), (double)objc_msgSend(v19, "travelTimeBestEstimate"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = *(void **)(a1[4] + 8);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        }
        while (v16);
      }

      v5 = v25;
      (*(void (**)(void))(a1[6] + 16))();
      v6 = 0;
    }
  }

}

@end
