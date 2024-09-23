@implementation GEOComposedRouteMutableData

- (id)evInfoForStepID:(unint64_t)a3
{
  NSDictionary *stepsIDToEVInfos;
  void *v4;
  void *v5;

  stepsIDToEVInfos = self->_stepsIDToEVInfos;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](stepsIDToEVInfos, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)chargingStationInfoForLegIndex:(unint64_t)a3
{
  NSDictionary *legIndexToChargingStationInfos;
  void *v4;
  void *v5;

  legIndexToChargingStationInfos = self->_legIndexToChargingStationInfos;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](legIndexToChargingStationInfos, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)originDisplayInfoForLeg:(unint64_t)a3
{
  NSDictionary *originDisplayInfos;
  void *v4;
  void *v5;

  originDisplayInfos = self->_originDisplayInfos;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](originDisplayInfos, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)destinationDisplayInfoForLeg:(unint64_t)a3
{
  NSDictionary *destinationDisplayInfos;
  void *v4;
  void *v5;

  destinationDisplayInfos = self->_destinationDisplayInfos;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSDictionary objectForKeyedSubscript:](destinationDisplayInfos, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)initializeForRoute:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *rideSelections;
  GEOComposedRouteTraffic *v8;
  void *v9;
  GEOComposedRouteTraffic *v10;
  GEOComposedRouteTraffic *traffic;
  void *v12;
  void *v13;
  NSArray *v14;
  NSArray *trafficDelayInfos;
  void *v16;
  void *v17;
  NSArray *v18;
  NSArray *updateableCameraInfos;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  NSDictionary *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSDictionary *v34;
  void *v35;
  void *v36;
  void *v37;
  GEOComposedWaypointDisplayInfo *v38;
  void *v39;
  void *v40;
  GEOComposedWaypointDisplayInfo *v41;
  void *v42;
  GEOComposedWaypointDisplayInfo *v43;
  void *v44;
  void *v45;
  GEOComposedWaypointDisplayInfo *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  NSDictionary *legIndexToChargingStationInfos;
  NSDictionary *v54;
  NSDictionary *originDisplayInfos;
  NSDictionary *v56;
  NSDictionary *destinationDisplayInfos;
  void *v58;
  GEOComposedRouteMutableData *v59;
  id obj;
  void *v61;
  uint64_t v62;
  uint64_t v63;
  NSDictionary *v64;
  NSDictionary *v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "transportType") != 1)
  {
    v8 = [GEOComposedRouteTraffic alloc];
    objc_msgSend(v4, "routeInitializerData");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[GEOComposedRouteTraffic initWithRoute:initializerData:](v8, "initWithRoute:initializerData:", v4, v9);
    traffic = self->_traffic;
    self->_traffic = v10;

    objc_msgSend(v4, "geoWaypointRoute");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinates");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOComposedRouteVisualInfo visualInfosForGeoWaypointRoute:coordinates:updateable:](GEOComposedRouteVisualInfo, "visualInfosForGeoWaypointRoute:coordinates:updateable:", v12, v13, 1);
    v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
    trafficDelayInfos = self->_trafficDelayInfos;
    self->_trafficDelayInfos = v14;

    objc_msgSend(v4, "geoWaypointRoute");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinates");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOComposedRouteVisualInfo cameraInfosForGeoWaypointRoute:coordinates:updateable:](GEOComposedRouteVisualInfo, "cameraInfosForGeoWaypointRoute:coordinates:updateable:", v16, v17, 1);
    v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
    updateableCameraInfos = self->_updateableCameraInfos;
    self->_updateableCameraInfos = v18;

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    objc_msgSend(v4, "steps");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
    if (v21)
    {
      v22 = v21;
      v23 = 0;
      v24 = *(_QWORD *)v71;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v71 != v24)
            objc_enumerationMutation(v20);
          v26 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
          objc_msgSend(v26, "evInfo");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          if (v27)
          {
            if (!v23)
            {
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v26, "stepID"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "setObject:forKeyedSubscript:", v27, v28);

          }
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      }
      while (v22);
    }
    else
    {
      v23 = 0;
    }

    v58 = v23;
    v59 = self;
    objc_storeStrong((id *)&self->_stepsIDToEVInfos, v23);
    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v61 = v4;
    objc_msgSend(v4, "legs");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
    v29 = 0;
    if (!v63)
    {
      v64 = 0;
      v65 = 0;
      goto LABEL_34;
    }
    v64 = 0;
    v65 = 0;
    v62 = *(_QWORD *)v67;
    while (1)
    {
      v30 = 0;
      do
      {
        if (*(_QWORD *)v67 != v62)
          objc_enumerationMutation(obj);
        v31 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * v30);
        objc_msgSend(v31, "destination", v58);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "chargingInfo");
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (v33)
        {
          v34 = v64;
          if (!v64)
          {
            v35 = (void *)MEMORY[0x1E0C99E08];
            objc_msgSend(v61, "legs");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "dictionaryWithCapacity:", objc_msgSend(v36, "count"));
            v34 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

          }
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "legIndex"));
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = v34;
          -[NSDictionary setObject:forKeyedSubscript:](v34, "setObject:forKeyedSubscript:", v33, v37);

        }
        if (v65)
        {
          if (v29)
            goto LABEL_27;
        }
        else
        {
          v48 = (void *)MEMORY[0x1E0C99E08];
          objc_msgSend(v61, "legs");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "dictionaryWithCapacity:", objc_msgSend(v49, "count"));
          v65 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

          if (v29)
            goto LABEL_27;
        }
        v50 = (void *)MEMORY[0x1E0C99E08];
        objc_msgSend(v61, "legs");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v50, "dictionaryWithCapacity:", objc_msgSend(v51, "count"));
        v29 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

LABEL_27:
        v38 = [GEOComposedWaypointDisplayInfo alloc];
        objc_msgSend(v31, "geoOriginWaypointInfo");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "origin");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = -[GEOComposedWaypointDisplayInfo initWithGeoWaypointInfo:waypoint:](v38, "initWithGeoWaypointInfo:waypoint:", v39, v40);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "legIndex"));
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v65, "setObject:forKeyedSubscript:", v41, v42);

        v43 = [GEOComposedWaypointDisplayInfo alloc];
        objc_msgSend(v31, "geoDestinationWaypointInfo");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "destination");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        v46 = -[GEOComposedWaypointDisplayInfo initWithGeoWaypointInfo:waypoint:](v43, "initWithGeoWaypointInfo:waypoint:", v44, v45);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "legIndex"));
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSDictionary setObject:forKeyedSubscript:](v29, "setObject:forKeyedSubscript:", v46, v47);

        ++v30;
      }
      while (v63 != v30);
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      v63 = v52;
      if (!v52)
      {
LABEL_34:

        legIndexToChargingStationInfos = v59->_legIndexToChargingStationInfos;
        v59->_legIndexToChargingStationInfos = v64;
        v54 = v64;

        originDisplayInfos = v59->_originDisplayInfos;
        v59->_originDisplayInfos = v65;
        v56 = v65;

        destinationDisplayInfos = v59->_destinationDisplayInfos;
        v59->_destinationDisplayInfos = v29;

        v4 = v61;
        goto LABEL_35;
      }
    }
  }
  objc_msgSend(v4, "rideSelections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (NSArray *)objc_msgSend(v5, "copy");
  rideSelections = self->_rideSelections;
  self->_rideSelections = v6;

LABEL_35:
}

- (void)updateForRoute:(id)a3 etaRoute:(id)a4
{
  id v6;
  id v7;
  GEOComposedRouteTraffic *v8;
  GEOComposedRouteTraffic *traffic;
  NSArray *v10;
  NSArray *trafficDelayInfos;
  NSArray *v12;
  NSArray *updateableCameraInfos;
  void *v14;
  NSDictionary *v15;
  NSDictionary *stepsIDToEVInfos;
  void *v17;
  NSDictionary *v18;
  NSDictionary *legIndexToChargingStationInfos;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  unint64_t v24;
  NSDictionary *originDisplayInfos;
  void *v26;
  void *v27;
  NSDictionary *destinationDisplayInfos;
  void *v29;
  void *v30;
  NSDictionary *v31;
  void *v32;
  void *v33;
  void *v34;
  unint64_t v35;
  NSDictionary *v36;
  void *v37;
  void *v38;
  id v39;
  id obj;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v41 = v6;
  if (objc_msgSend(v6, "transportType") != 1)
  {
    v8 = -[GEOComposedRouteTraffic initWithRoute:etaRoute:]([GEOComposedRouteTraffic alloc], "initWithRoute:etaRoute:", v6, v7);
    traffic = self->_traffic;
    self->_traffic = v8;

    +[GEOComposedRouteVisualInfo visualInfosForRoute:etaRoute:](GEOComposedRouteVisualInfo, "visualInfosForRoute:etaRoute:", v6, v7);
    v10 = (NSArray *)objc_claimAutoreleasedReturnValue();
    trafficDelayInfos = self->_trafficDelayInfos;
    self->_trafficDelayInfos = v10;

    +[GEOComposedRouteVisualInfo cameraInfosForRoute:etaRoute:](GEOComposedRouteVisualInfo, "cameraInfosForRoute:etaRoute:", v6, v7);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    updateableCameraInfos = self->_updateableCameraInfos;
    self->_updateableCameraInfos = v12;

    if (self->_stepsIDToEVInfos)
    {
      objc_msgSend(v7, "evStepInfos");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (NSDictionary *)-[NSDictionary mutableCopy](self->_stepsIDToEVInfos, "mutableCopy");
      -[NSDictionary addEntriesFromDictionary:](v15, "addEntriesFromDictionary:", v14);
      stepsIDToEVInfos = self->_stepsIDToEVInfos;
      self->_stepsIDToEVInfos = v15;

    }
    if (self->_legIndexToChargingStationInfos)
    {
      objc_msgSend(v7, "evChargingStationInfos");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (NSDictionary *)-[NSDictionary mutableCopy](self->_legIndexToChargingStationInfos, "mutableCopy");
      -[NSDictionary addEntriesFromDictionary:](v18, "addEntriesFromDictionary:", v17);
      legIndexToChargingStationInfos = self->_legIndexToChargingStationInfos;
      self->_legIndexToChargingStationInfos = v18;

    }
    if (self->_originDisplayInfos || self->_destinationDisplayInfos)
    {
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v39 = v7;
      objc_msgSend(v7, "legs");
      obj = (id)objc_claimAutoreleasedReturnValue();
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v43)
      {
        v42 = *(_QWORD *)v45;
        do
        {
          for (i = 0; i != v43; ++i)
          {
            if (*(_QWORD *)v45 != v42)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
            objc_msgSend(v21, "originWaypointInfo");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "destinationWaypointInfo");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v21, "originalLegIndex");
            originDisplayInfos = self->_originDisplayInfos;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](originDisplayInfos, "objectForKeyedSubscript:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();

            if (v27)
            {
              if (v24)
              {
                destinationDisplayInfos = self->_destinationDisplayInfos;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24 - 1);
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary objectForKeyedSubscript:](destinationDisplayInfos, "objectForKeyedSubscript:", v29);
                v30 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v30 = 0;
              }
              objc_msgSend(v27, "setWaypointInfo:", v22);
              objc_msgSend(v30, "setWaypointInfo:", v22);

            }
            v31 = self->_destinationDisplayInfos;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSDictionary objectForKeyedSubscript:](v31, "objectForKeyedSubscript:", v32);
            v33 = (void *)objc_claimAutoreleasedReturnValue();

            if (v33)
            {
              objc_msgSend(v41, "legs");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = objc_msgSend(v34, "count") - 1;

              if (v24 >= v35)
              {
                v38 = 0;
              }
              else
              {
                v36 = self->_originDisplayInfos;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v24 + 1);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSDictionary objectForKeyedSubscript:](v36, "objectForKeyedSubscript:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

              }
              objc_msgSend(v33, "setWaypointInfo:", v23);
              objc_msgSend(v38, "setWaypointInfo:", v23);

            }
          }
          v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
        }
        while (v43);
      }

      v7 = v39;
    }
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteMutableData)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteMutableData *v5;
  uint64_t v6;
  GEOComposedRouteTraffic *traffic;
  uint64_t v8;
  NSArray *trafficDelayInfos;
  uint64_t v10;
  NSArray *updateableCameraInfos;
  uint64_t v12;
  uint64_t v13;
  NSDictionary *stepsIDToEVInfos;
  uint64_t v15;
  uint64_t v16;
  NSDictionary *legIndexToChargingStationInfos;
  uint64_t v18;
  uint64_t v19;
  NSDictionary *originDisplayInfos;
  uint64_t v21;
  uint64_t v22;
  NSDictionary *destinationDisplayInfos;
  uint64_t v24;
  NSArray *rideSelections;
  GEOComposedRouteMutableData *v26;

  v4 = a3;
  v5 = -[GEOComposedRouteMutableData init](self, "init");
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_traffic"));
    v6 = objc_claimAutoreleasedReturnValue();
    traffic = v5->_traffic;
    v5->_traffic = (GEOComposedRouteTraffic *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_trafficDelayInfos"));
    v8 = objc_claimAutoreleasedReturnValue();
    trafficDelayInfos = v5->_trafficDelayInfos;
    v5->_trafficDelayInfos = (NSArray *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_updateableCameraInfos"));
    v10 = objc_claimAutoreleasedReturnValue();
    updateableCameraInfos = v5->_updateableCameraInfos;
    v5->_updateableCameraInfos = (NSArray *)v10;

    v12 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v12, objc_opt_class(), CFSTR("_stepsIDToEVInfos"));
    v13 = objc_claimAutoreleasedReturnValue();
    stepsIDToEVInfos = v5->_stepsIDToEVInfos;
    v5->_stepsIDToEVInfos = (NSDictionary *)v13;

    v15 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v15, objc_opt_class(), CFSTR("_legIndexToChargingStationInfos"));
    v16 = objc_claimAutoreleasedReturnValue();
    legIndexToChargingStationInfos = v5->_legIndexToChargingStationInfos;
    v5->_legIndexToChargingStationInfos = (NSDictionary *)v16;

    v18 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v18, objc_opt_class(), CFSTR("_originDisplayInfos"));
    v19 = objc_claimAutoreleasedReturnValue();
    originDisplayInfos = v5->_originDisplayInfos;
    v5->_originDisplayInfos = (NSDictionary *)v19;

    v21 = objc_opt_class();
    objc_msgSend(v4, "decodeDictionaryWithKeysOfClass:objectsOfClass:forKey:", v21, objc_opt_class(), CFSTR("_destinationDisplayInfos"));
    v22 = objc_claimAutoreleasedReturnValue();
    destinationDisplayInfos = v5->_destinationDisplayInfos;
    v5->_destinationDisplayInfos = (NSDictionary *)v22;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_rideSelections"));
    v24 = objc_claimAutoreleasedReturnValue();
    rideSelections = v5->_rideSelections;
    v5->_rideSelections = (NSArray *)v24;

    v26 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  GEOComposedRouteTraffic *traffic;
  id v5;

  traffic = self->_traffic;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", traffic, CFSTR("_traffic"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_trafficDelayInfos, CFSTR("_trafficDelayInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_updateableCameraInfos, CFSTR("_updateableCameraInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_stepsIDToEVInfos, CFSTR("_stepsIDToEVInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_legIndexToChargingStationInfos, CFSTR("_legIndexToChargingStationInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originDisplayInfos, CFSTR("_originDisplayInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_destinationDisplayInfos, CFSTR("_destinationDisplayInfos"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_rideSelections, CFSTR("_rideSelections"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t k;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t m;
  void *v46;
  void *v47;
  void *v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  _BYTE v67[128];
  _BYTE v68[128];
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("Traffic: %@\n"), self->_traffic);
  v49 = v3;
  if (-[NSDictionary count](self->_stepsIDToEVInfos, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary allKeys](self->_stepsIDToEVInfos, "allKeys");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sortedArrayUsingSelector:", sel_compare_);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = log10((double)(unint64_t)objc_msgSend(v6, "count"));
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    v65 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v63 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * i);
          -[NSDictionary objectForKeyedSubscript:](self->_stepsIDToEVInfos, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("  %*d: %@\n"), ((int)v7 + 1), objc_msgSend(v13, "unsignedIntValue"), v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      }
      while (v10);
    }

    v3 = v49;
    objc_msgSend(v49, "appendFormat:", CFSTR("EV Step Info:\n%@\n"), v4);

  }
  if (-[NSDictionary count](self->_legIndexToChargingStationInfos, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary allKeys](self->_legIndexToChargingStationInfos, "allKeys");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sortedArrayUsingSelector:", sel_compare_);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = log10((double)(unint64_t)objc_msgSend(v17, "count"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v19 = v17;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v59 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * j);
          -[NSDictionary objectForKeyedSubscript:](self->_legIndexToChargingStationInfos, "objectForKeyedSubscript:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "appendFormat:", CFSTR("  %*d: %@\n"), ((int)v18 + 1), objc_msgSend(v24, "unsignedIntValue"), v25);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v58, v68, 16);
      }
      while (v21);
    }

    v3 = v49;
    objc_msgSend(v49, "appendFormat:", CFSTR("EV Charging Station Info: \n%@\n"), v15);

  }
  if (-[NSDictionary count](self->_originDisplayInfos, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary allKeys](self->_originDisplayInfos, "allKeys");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "sortedArrayUsingSelector:", sel_compare_);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v29 = log10((double)(unint64_t)objc_msgSend(v28, "count"));
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v57 = 0u;
    v30 = v28;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v32; ++k)
        {
          if (*(_QWORD *)v55 != v33)
            objc_enumerationMutation(v30);
          v35 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * k);
          -[NSDictionary objectForKeyedSubscript:](self->_originDisplayInfos, "objectForKeyedSubscript:", v35);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "appendFormat:", CFSTR("  %*d: %@\n"), ((int)v29 + 1), objc_msgSend(v35, "unsignedIntValue"), v36);

        }
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v67, 16);
      }
      while (v32);
    }

    v3 = v49;
    objc_msgSend(v49, "appendFormat:", CFSTR("Origin Display Info: \n%@\n"), v26);

  }
  if (-[NSDictionary count](self->_destinationDisplayInfos, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB37A0], "string");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary allKeys](self->_destinationDisplayInfos, "allKeys");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "sortedArrayUsingSelector:", sel_compare_);
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    v40 = log10((double)(unint64_t)objc_msgSend(v39, "count"));
    v50 = 0u;
    v51 = 0u;
    v52 = 0u;
    v53 = 0u;
    v41 = v39;
    v42 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v51;
      do
      {
        for (m = 0; m != v43; ++m)
        {
          if (*(_QWORD *)v51 != v44)
            objc_enumerationMutation(v41);
          v46 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * m);
          -[NSDictionary objectForKeyedSubscript:](self->_destinationDisplayInfos, "objectForKeyedSubscript:", v46);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "appendFormat:", CFSTR("  %*d: %@\n"), ((int)v40 + 1), objc_msgSend(v46, "unsignedIntValue"), v47);

        }
        v43 = objc_msgSend(v41, "countByEnumeratingWithState:objects:count:", &v50, v66, 16);
      }
      while (v43);
    }

    v3 = v49;
    objc_msgSend(v49, "appendFormat:", CFSTR("Origin Display Info: \n%@\n"), v37);

  }
  if (self->_rideSelections)
    objc_msgSend(v3, "appendFormat:", CFSTR("Ride Selections: %@\n"), self->_rideSelections);
  return v3;
}

- (GEOComposedRouteTraffic)traffic
{
  return self->_traffic;
}

- (void)setTraffic:(id)a3
{
  objc_storeStrong((id *)&self->_traffic, a3);
}

- (NSArray)trafficDelayInfos
{
  return self->_trafficDelayInfos;
}

- (void)setTrafficDelayInfos:(id)a3
{
  objc_storeStrong((id *)&self->_trafficDelayInfos, a3);
}

- (NSArray)updateableCameraInfos
{
  return self->_updateableCameraInfos;
}

- (void)setUpdateableCameraInfos:(id)a3
{
  objc_storeStrong((id *)&self->_updateableCameraInfos, a3);
}

- (NSArray)rideSelections
{
  return self->_rideSelections;
}

- (void)setRideSelections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideSelections, 0);
  objc_storeStrong((id *)&self->_destinationDisplayInfos, 0);
  objc_storeStrong((id *)&self->_originDisplayInfos, 0);
  objc_storeStrong((id *)&self->_legIndexToChargingStationInfos, 0);
  objc_storeStrong((id *)&self->_stepsIDToEVInfos, 0);
  objc_storeStrong((id *)&self->_updateableCameraInfos, 0);
  objc_storeStrong((id *)&self->_trafficDelayInfos, 0);
  objc_storeStrong((id *)&self->_traffic, 0);
}

@end
