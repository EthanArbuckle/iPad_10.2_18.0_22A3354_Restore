@implementation _GEODirectionsServiceRequestBuilder_ResumeNavAfterPause

- (int)directionsRequestFeedbackPurpose
{
  return 4;
}

- (int)originalWaypointRoutePurpose
{
  return 8;
}

- (id)geoOriginalWaypointRoute
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  NSObject *v10;
  int v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  void *v21;
  unint64_t v22;
  NSObject *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  GEOOriginalRouteLeg *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  unint64_t v46;
  id v47;
  NSObject *v48;
  int v49;
  void *v50;
  int v52;
  int v53;
  __int16 v54;
  int v55;
  __int16 v56;
  int v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resumeRouteHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeGeometry");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "resumeRouteHandle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    GEOGetDirectionsServiceLog();
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
    if (v17)
    {
      if (v19)
      {
        LOWORD(v52) = 0;
LABEL_30:
        _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_ERROR, v20, (uint8_t *)&v52, 2u);
      }
    }
    else if (v19)
    {
      LOWORD(v52) = 0;
      goto LABEL_30;
    }

    v50 = (void *)objc_opt_new();
    objc_msgSend(v50, "setPurpose:", 8);
    objc_msgSend(v50, "setCreationMethod:", 0);
    v5 = v50;
    v47 = v5;
    goto LABEL_32;
  }
  -[GEODirectionsServiceRequestBuilder _waypoints](self, "_waypoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count") - 1;
  objc_msgSend(v5, "routeLegs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9 <= v7)
  {
    objc_msgSend(v5, "routeLegs");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (v22 < v7)
    {
      GEOGetDirectionsServiceLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = objc_msgSend(v6, "count");
        objc_msgSend(v5, "routeLegs");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 67109632;
        v53 = v24;
        v54 = 1024;
        v55 = v7;
        v56 = 1024;
        v57 = objc_msgSend(v25, "count");

      }
      objc_msgSend(v5, "routeLegs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v7 != v27)
      {
        v28 = 0;
        if (v7 - v27 <= 1)
          v29 = 1;
        else
          v29 = v7 - v27;
        do
        {
          objc_msgSend(v5, "routeLegs");
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v30)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "setRouteLegs:", v31);

          }
          v32 = objc_alloc_init(GEOOriginalRouteLeg);
          objc_msgSend(v5, "routeLegs");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "insertObject:atIndex:", v32, v28);

          ++v28;
        }
        while (v29 != v28);
      }
    }
  }
  else
  {
    GEOGetDirectionsServiceLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = objc_msgSend(v6, "count");
      objc_msgSend(v5, "routeLegs");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 67109632;
      v53 = v11;
      v54 = 1024;
      v55 = v7;
      v56 = 1024;
      v57 = objc_msgSend(v12, "count");

    }
    objc_msgSend(v5, "routeLegs");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count") - v7;

    objc_msgSend(v5, "routeLegs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "removeObjectsInRange:", 0, v14);

  }
  objc_msgSend(v5, "routeLegs");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v34, "count");

  if (v35 == v7)
  {
    objc_msgSend(v5, "routeLegs");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_msgSend(v36, "count");

    if (v37)
    {
      v38 = 0;
      do
      {
        objc_msgSend(v5, "routeLegs");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "objectAtIndexedSubscript:", v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v6, "objectAtIndexedSubscript:", v38);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "geoWaypointInfo");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setOriginWaypointInfo:", v42);

        objc_msgSend(v6, "objectAtIndexedSubscript:", ++v38);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "geoWaypointInfo");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "setDestinationWaypointInfo:", v44);

        objc_msgSend(v5, "routeLegs");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = objc_msgSend(v45, "count");

      }
      while (v38 < v46);
    }
    objc_msgSend(v5, "setCreationMethod:", 0);
    v47 = v5;
  }
  else
  {
    GEOGetDirectionsServiceLog();
    v48 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
    {
      v49 = objc_msgSend(v6, "count");
      v52 = 67109376;
      v53 = v49;
      v54 = 1024;
      v55 = v7;
    }

    v47 = 0;
  }

LABEL_32:
  return v47;
}

- (void)setMiscFieldsInDirectionsRequest:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "resumeRouteHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "serverSessionState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSessionState:", v7);

  objc_msgSend(v4, "sessionState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    GEOGetDirectionsServiceLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
    }

  }
}

@end
