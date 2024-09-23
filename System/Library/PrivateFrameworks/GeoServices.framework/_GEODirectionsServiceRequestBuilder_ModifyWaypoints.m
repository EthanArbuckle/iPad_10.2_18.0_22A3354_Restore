@implementation _GEODirectionsServiceRequestBuilder_ModifyWaypoints

- (id)waypointsForRoute
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  GEOComposedWaypoint *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  unint64_t v35;
  NSObject *v36;
  void *v37;
  const char *v38;
  void *v39;
  void *v40;
  unint64_t v41;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentLocation");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentRoute");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "currentRoute");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "waypointsFromRouteCoordinate:", objc_msgSend(v10, "routeCoordinate"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        GEOGetDirectionsServiceLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_ERROR, "Waypoints retrieved from the current route is nil", buf, 2u);
        }

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count") + 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v14 = v11;
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v44;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v44 != v17)
              objc_enumerationMutation(v14);
            objc_msgSend(v13, "addObject:", *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * i), (_QWORD)v43);
          }
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
        }
        while (v16);
      }

      -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "waypointModificationType");

      if (v20 != 1)
      {
        if (v20)
        {
          GEOGetDirectionsServiceLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
          {
LABEL_28:

            v27 = [GEOComposedWaypoint alloc];
            -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "currentLocation");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = -[GEOComposedWaypoint initWithLocation:isCurrentLocation:](v27, "initWithLocation:isCurrentLocation:", v29, 1);

            objc_msgSend(v13, "insertObject:atIndex:", v23, 0);
            v26 = v13;
LABEL_41:

            goto LABEL_42;
          }
          GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v49 = v24;
LABEL_27:

          goto LABEL_28;
        }
        -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "waypointToInsert");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (v22)
        {
          -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
          v23 = objc_claimAutoreleasedReturnValue();
          -[NSObject waypointToInsert](v23, "waypointToInsert");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "insertObject:atIndex:", v24, 0);
          goto LABEL_27;
        }
        GEOGetDirectionsServiceLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v49 = v39;

        }
LABEL_40:
        v26 = 0;
        goto LABEL_41;
      }
      if ((unint64_t)objc_msgSend(v13, "count") <= 1)
      {
        GEOGetDirectionsServiceLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
        }
        goto LABEL_40;
      }
      -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "currentRoute");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "waypoints");
      v23 = objc_claimAutoreleasedReturnValue();

      v32 = -[NSObject count](v23, "count");
      v33 = v32 - -[NSObject count](v14, "count");
      -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "waypointIndexToRemove");

      if (v35 >= v33)
      {
        -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = objc_msgSend(v40, "waypointIndexToRemove") - v33;

        if (v41 < objc_msgSend(v13, "count"))
        {
          objc_msgSend(v13, "removeObjectAtIndex:", v41);
          goto LABEL_28;
        }
        GEOGetDirectionsServiceLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          goto LABEL_39;
        GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = v37;
      }
      else
      {
        GEOGetDirectionsServiceLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        {
LABEL_39:

          goto LABEL_40;
        }
        GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v49 = v37;
      }
      _os_log_impl(&dword_1885A9000, v36, OS_LOG_TYPE_ERROR, v38, buf, 0xCu);

      goto LABEL_39;
    }
  }
  else
  {

  }
  GEOGetDirectionsServiceLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    GEODirectionsServiceRequestTypeAsString(-[GEODirectionsServiceRequestBuilder _type](self, "_type"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v49 = v25;

  }
  v26 = 0;
LABEL_42:

  return v26;
}

- (int)directionsRequestFeedbackPurpose
{
  return 7;
}

- (int)originalWaypointRoutePurpose
{
  return 5;
}

@end
