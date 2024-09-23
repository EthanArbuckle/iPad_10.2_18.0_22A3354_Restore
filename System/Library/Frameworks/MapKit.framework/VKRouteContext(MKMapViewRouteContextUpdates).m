@implementation VKRouteContext(MKMapViewRouteContextUpdates)

- (uint64_t)_setRouteContextInspectedSegmentIndex:()MKMapViewRouteContextUpdates inspectedStepIndex:
{
  objc_msgSend(a1, "setInspectedSegmentIndex:");
  return objc_msgSend(a1, "setInspectedStepIndex:", a4);
}

- (void)_setRouteContextAnnotationText:()MKMapViewRouteContextUpdates etaType:tollCurrency:advisoryStyleAttributes:forRoute:
{
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  v12 = a6;
  objc_msgSend(a1, "_routeInfoForRoute:", a7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 || v12)
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6560]), "initWithEtaText:etaAdvisoryStyleAttributes:routeEtaType:", v15, v12, a4);
    objc_msgSend(v13, "setEtaDescription:", v14);
  }
  else
  {
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6560]), "initWithEtaText:glyphType:", v15, a5 != 0);
    objc_msgSend(v13, "setEtaDescription:", v14);
  }

}

- (void)_setRouteContextAnnotationText:()MKMapViewRouteContextUpdates tollCurrency:forRoute:
{
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  objc_msgSend(a1, "_routeInfoForRoute:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6560]), "initWithEtaText:glyphType:", v10, a4 != 0);
  objc_msgSend(v8, "setEtaDescription:", v9);

}

- (void)_setRouteContextAnnotationText:()MKMapViewRouteContextUpdates advisoryStyleAttributes:forRoute:
{
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  objc_msgSend(a1, "_routeInfoForRoute:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC6560]), "initWithEtaText:etaAdvisoryStyleAttributes:", v11, v8);
  objc_msgSend(v9, "setEtaDescription:", v10);

}

- (void)_setRouteContextAnnotationTexts:()MKMapViewRouteContextUpdates forLegsInRoute:
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;

  v14 = a3;
  v6 = a4;
  objc_msgSend(a1, "_routeInfoForRoute:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v14, "count"));
  v9 = objc_msgSend(v14, "count");
  objc_msgSend(v6, "legs");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");

  if (v9 == v11)
  {
    objc_msgSend(v6, "legs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __95__VKRouteContext_MKMapViewRouteContextUpdates___setRouteContextAnnotationTexts_forLegsInRoute___block_invoke;
    v15[3] = &unk_1E20DC038;
    v16 = v14;
    v17 = v8;
    objc_msgSend(v12, "enumerateObjectsUsingBlock:", v15);

  }
  v13 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(v7, "setRouteLegEtaAnnotations:", v13);

}

- (void)_setRouteContextAnnotationFocus:()MKMapViewRouteContextUpdates forRoute:
{
  id v5;

  objc_msgSend(a1, "_routeInfoForRoute:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasFocus:", a3);

}

- (void)_setAlternateRouteContextAnnotationETAComparison:()MKMapViewRouteContextUpdates forRoute:
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  _BOOL4 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "alternateRoutes", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "route");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        v13 = v12 == v6;

        if (v13)
        {
          objc_msgSend(v11, "setEtaComparisionToMain:", a3);
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)_updateWaypointCaptions
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "routeInfo");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(v1, "waypoints", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v6, "type") == 2)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v1, "route");
            v7 = objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "waypoint");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)v7, "waypointDisplayInfoForWaypoint:", v8);
            v9 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v9, "waypointCaption");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v7) = v10 == 0;

            if ((v7 & 1) != 0)
            {
              v11 = v6;
              v12 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v11, "chargeInfo");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "chargingTime");
              objc_msgSend(v12, "_navigation_stringWithSeconds:abbreviated:", (unint64_t)v14, 1);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "setChargeTimeText:", v15);

            }
          }
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

}

@end
