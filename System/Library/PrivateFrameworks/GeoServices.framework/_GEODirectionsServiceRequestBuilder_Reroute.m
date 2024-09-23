@implementation _GEODirectionsServiceRequestBuilder_Reroute

- (int)directionsRequestFeedbackPurpose
{
  return 5;
}

- (int)originalWaypointRoutePurpose
{
  if (-[GEODirectionsServiceRequestBuilder _type](self, "_type") == 4)
    return 1;
  else
    return 13;
}

- (void)setMiscFieldsInDirectionsRequest:(id)a3
{
  id v4;
  double v5;
  id v6;

  v4 = a3;
  -[GEODirectionsServiceRequestBuilder _parameters](self, "_parameters");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "displayRemainingTimeToDestination");
  objc_msgSend(v4, "setLastEtaDisplayed:", v5);

}

- (void)verifyWaypointsForDirectionsRequest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  int v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  int v29;
  __int16 v30;
  int v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(v3, "originalWaypointRoute", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "routeLegs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    v9 = 1;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v11, "destinationWaypointInfo");
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          objc_msgSend(v11, "destinationWaypointInfo");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "source");

          if (v15 == 2)
            continue;
        }
        ++v9;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v7);
  }
  else
  {
    v9 = 1;
  }

  objc_msgSend(v3, "originalWaypointRoute");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v3, "waypointTypeds");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "count");

    if (v18 != v9)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "waypointTypeds");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");
        objc_msgSend(v3, "originalWaypointRoute");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "routeLegs");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "count");
        *(_DWORD *)buf = 67109376;
        v29 = v20;
        v30 = 1024;
        v31 = v23;
        _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Mismatched number of waypoints (%d) and legs (%d) in DirectionsRequest. This request will most likely fail.", buf, 0xEu);

      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: directionsRequest.waypointTypeds.count == expectedWaypointsCount", buf, 2u);
      }
    }
  }

}

@end
