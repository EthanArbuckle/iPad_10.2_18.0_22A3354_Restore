@implementation GEOEnrouteNoticesUtil

+ (id)createEnrouteNoticesForComposedRoute:(id)a3 routeInitializerData:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "geoWaypointRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v5, "geoWaypointRoute");
    v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
    v10 = (void *)v8;
    goto LABEL_8;
  }
  objc_msgSend(v6, "directionsResponse");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "directionsResponse");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  objc_msgSend(v6, "etaTrafficUpdateResponse");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v6, "etaTrafficUpdateResponse");
    v8 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
LABEL_8:
  +[GEOEnrouteNoticesUtil _enrouteNoticesForRoute:provider:](GEOEnrouteNoticesUtil, "_enrouteNoticesForRoute:provider:", v5, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)_enrouteNoticesForRoute:(id)a3 provider:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v7 = a4;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__90;
  v24 = __Block_byref_object_dispose__90;
  v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v7, "_geoTrafficCameras");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_geoTrafficSignals");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __58__GEOEnrouteNoticesUtil__enrouteNoticesForRoute_provider___block_invoke;
  v15[3] = &unk_1E1C15848;
  v10 = v8;
  v16 = v10;
  v11 = v6;
  v17 = v11;
  v19 = &v20;
  v12 = v9;
  v18 = v12;
  objc_msgSend(a1, "_forEachGeoEnrouteNoticeOnRoute:handler:", v11, v15);
  v13 = (id)v21[5];

  _Block_object_dispose(&v20, 8);
  return v13;
}

void __58__GEOEnrouteNoticesUtil__enrouteNoticesForRoute_provider___block_invoke(_QWORD *a1, void *a2, uint64_t a3, uint64_t a4)
{
  int v7;
  void *v8;
  void *v9;
  GEOComposedRouteAnnotation *v10;
  GEOComposedTrafficSignal *v11;
  GEOComposedRouteAnnotation *v12;
  void *v13;
  void *v14;
  void *v15;
  GEOComposedTrafficSignal *v16;
  id v17;

  v17 = a2;
  v7 = objc_msgSend(v17, "type");
  switch(v7)
  {
    case 3:
      v12 = [GEOComposedRouteAnnotation alloc];
      objc_msgSend(v17, "routeAnnotation");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = -[GEOComposedRouteAnnotation initWithEnrouteNotice:enrouteNoticeIndex:legIndex:annotation:onRoute:](v12, "initWithEnrouteNotice:enrouteNoticeIndex:legIndex:annotation:onRoute:", v17, a3, a4, v13, a1[5]);

      if (v10)
        objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v10);
      goto LABEL_13;
    case 2:
      v14 = (void *)a1[6];
      objc_msgSend(v17, "objectIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "objectForKeyedSubscript:", v15);
      v10 = (GEOComposedRouteAnnotation *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = -[GEOComposedTrafficSignal initWithEnrouteNotice:enrouteNoticeIndex:legIndex:trafficSignal:onRoute:]([GEOComposedTrafficSignal alloc], "initWithEnrouteNotice:enrouteNoticeIndex:legIndex:trafficSignal:onRoute:", v17, a3, a4, v10, a1[5]);
        goto LABEL_10;
      }
LABEL_13:

      break;
    case 1:
      v8 = (void *)a1[4];
      objc_msgSend(v17, "objectIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (GEOComposedRouteAnnotation *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v11 = -[GEOComposedTrafficCamera initWithEnrouteNotice:enrouteNoticeIndex:legIndex:trafficCamera:onRoute:]([GEOComposedTrafficCamera alloc], "initWithEnrouteNotice:enrouteNoticeIndex:legIndex:trafficCamera:onRoute:", v17, a3, a4, v10, a1[5]);
LABEL_10:
        v16 = v11;
        if (v11)
          objc_msgSend(*(id *)(*(_QWORD *)(a1[7] + 8) + 40), "addObject:", v11);

        goto LABEL_13;
      }
      goto LABEL_13;
  }

}

+ (void)_forEachGeoEnrouteNoticeOnRoute:(id)a3 handler:(id)a4
{
  void (**v5)(id, void *, unint64_t, unint64_t);
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  unint64_t v22;
  id v23;

  v23 = a3;
  v5 = (void (**)(id, void *, unint64_t, unint64_t))a4;
  objc_msgSend(v23, "geoWaypointRoute");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "routeLegs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    v9 = 0;
    do
    {
      objc_msgSend(v23, "geoWaypointRoute");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "routeLegs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v9);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "enrouteNotices");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "count");

      if (v14)
      {
        v15 = 0;
        do
        {
          objc_msgSend(v12, "enrouteNotices");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectAtIndexedSubscript:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v5[2](v5, v17, v15, v9);
          ++v15;
          objc_msgSend(v12, "enrouteNotices");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "count");

        }
        while (v15 < v19);
      }

      ++v9;
      objc_msgSend(v23, "geoWaypointRoute");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "routeLegs");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "count");

    }
    while (v9 < v22);
  }

}

@end
