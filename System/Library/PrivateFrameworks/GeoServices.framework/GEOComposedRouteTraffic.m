@implementation GEOComposedRouteTraffic

- (GEOComposedRouteTraffic)initWithRoute:(id)a3 initializerData:(id)a4
{
  id v6;
  id v7;
  GEOComposedRouteTraffic *v8;
  uint64_t v9;
  GEORouteTrafficBuilder *trafficColors;
  uint64_t v11;
  NSArray *v12;
  GEOComposedRouteTraffic *v13;
  objc_super v15;

  v6 = a3;
  v7 = a4;
  v15.receiver = self;
  v15.super_class = (Class)GEOComposedRouteTraffic;
  v8 = -[GEOComposedRouteTraffic init](&v15, sel_init);
  if (v8)
  {
    if (GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteSection, (uint64_t)off_1EDF4DA58))
    {
      -[GEOComposedRouteTraffic _trafficColorInfosFromDebugSettingsForRoute:](v8, "_trafficColorInfosFromDebugSettingsForRoute:", v6);
      v9 = objc_claimAutoreleasedReturnValue();
      trafficColors = (GEORouteTrafficBuilder *)v8->_trafficColors;
      v8->_trafficColors = (NSArray *)v9;
    }
    else
    {
      trafficColors = objc_alloc_init(GEORouteTrafficBuilder);
      -[GEORouteTrafficBuilder buildTrafficForRoute:](trafficColors, "buildTrafficForRoute:", v6);
      -[GEOComposedRouteTraffic _trafficColorInfosFromTrafficBuilder:route:](v8, "_trafficColorInfosFromTrafficBuilder:route:", trafficColors, v6);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = v8->_trafficColors;
      v8->_trafficColors = (NSArray *)v11;

    }
    -[GEOComposedRouteTraffic _buildIncidentsForRoute:etaRoute:initializerData:](v8, "_buildIncidentsForRoute:etaRoute:initializerData:", v6, 0, v7);
    v13 = v8;
  }

  return v8;
}

- (GEOComposedRouteTraffic)initWithRoute:(id)a3 etaRoute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  NSArray *v11;
  GEORouteTrafficBuilder *trafficColors;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  char v18;
  GEOComposedRouteTraffic *v19;
  NSArray *v20;
  NSArray *v21;
  objc_super v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "uniqueRouteID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "uniqueRouteID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if ((v10 & 1) == 0)
  {
    GEOGetGEOComposedRouteTrafficLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v7, "uniqueRouteID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "uniqueRouteID");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v25 = v14;
      v26 = 2112;
      v27 = v15;
      _os_log_impl(&dword_1885A9000, v13, OS_LOG_TYPE_ERROR, "GEOComposedETARoute ID (%@) is not equal to GEOComposedRoute ID (%@). Skipping traffic creation.", buf, 0x16u);

    }
    objc_msgSend(v6, "uniqueRouteID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueRouteID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "isEqual:", v17);

    if ((v18 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: [route.uniqueRouteID isEqual:etaRoute.uniqueRouteID]", buf, 2u);
    }
    goto LABEL_8;
  }
  v23.receiver = self;
  v23.super_class = (Class)GEOComposedRouteTraffic;
  self = -[GEOComposedRouteTraffic init](&v23, sel_init);
  if (!self)
  {
LABEL_8:
    v19 = 0;
    goto LABEL_11;
  }
  if (GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteSection, (uint64_t)off_1EDF4DA58))
  {
    -[GEOComposedRouteTraffic _trafficColorInfosFromDebugSettingsForRoute:](self, "_trafficColorInfosFromDebugSettingsForRoute:", v6);
    v11 = (NSArray *)objc_claimAutoreleasedReturnValue();
    trafficColors = (GEORouteTrafficBuilder *)self->_trafficColors;
    self->_trafficColors = v11;
  }
  else
  {
    trafficColors = objc_alloc_init(GEORouteTrafficBuilder);
    -[GEORouteTrafficBuilder buildTrafficForRoute:etaRoute:](trafficColors, "buildTrafficForRoute:etaRoute:", v6, v7);
    -[GEOComposedRouteTraffic _trafficColorInfosFromTrafficBuilder:route:](self, "_trafficColorInfosFromTrafficBuilder:route:", trafficColors, v6);
    v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v21 = self->_trafficColors;
    self->_trafficColors = v20;

  }
  -[GEOComposedRouteTraffic _buildIncidentsForRoute:etaRoute:initializerData:](self, "_buildIncidentsForRoute:etaRoute:initializerData:", v6, v7, 0);
  self = self;
  v19 = self;
LABEL_11:

  return v19;
}

- (GEOComposedRouteTraffic)initWithColorInfos:(id)a3 incidentInfos:(id)a4
{
  id v7;
  id v8;
  GEOComposedRouteTraffic *v9;
  GEOComposedRouteTraffic *v10;
  void **p_trafficColors;
  GEOComposedRouteTrafficColorInfo *v12;
  uint64_t v13;
  void *v14;
  GEOComposedRouteTraffic *v15;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v17.receiver = self;
  v17.super_class = (Class)GEOComposedRouteTraffic;
  v9 = -[GEOComposedRouteTraffic init](&v17, sel_init);
  v10 = v9;
  if (v9)
  {
    p_trafficColors = (void **)&v9->_trafficColors;
    objc_storeStrong((id *)&v9->_trafficColors, a3);
    objc_storeStrong((id *)&v10->_incidents, a4);
    if (!-[NSArray count](v10->_trafficColors, "count"))
    {
      v12 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
      -[GEOComposedRouteTrafficColorInfo setColor:](v12, "setColor:", 4);
      -[GEOComposedRouteTrafficColorInfo setOffsetMeters:](v12, "setOffsetMeters:", 0.0);
      -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v12, "setRouteCoordinate:", 0);
      v18[0] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *p_trafficColors;
      *p_trafficColors = (void *)v13;

    }
    v15 = v10;
  }

  return v10;
}

- (id)_trafficColorInfosFromTrafficBuilder:(id)a3 route:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unsigned int v14;
  void *v15;
  double v16;
  double v17;
  GEOComposedRouteTrafficColorInfo *v18;
  uint8_t v20[16];

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "trafficColors");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "trafficOffsets");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "count");
  if (v9 != objc_msgSend(v8, "count"))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)v20 = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: trafficBuilderColors.count == trafficBuilderOffsets.count", v20, 2u);
    }
    goto LABEL_9;
  }
  v10 = objc_msgSend(v7, "count");
  if (v10 != objc_msgSend(v8, "count"))
  {
LABEL_9:
    v11 = 0;
    goto LABEL_10;
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
  {
    v12 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndexedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "doubleValue");
      v17 = v16;

      v18 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
      -[GEOComposedRouteTrafficColorInfo setColor:](v18, "setColor:", v14);
      -[GEOComposedRouteTrafficColorInfo setOffsetMeters:](v18, "setOffsetMeters:", v17);
      -[GEOComposedRouteTrafficColorInfo offsetMeters](v18, "offsetMeters");
      -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v18, "setRouteCoordinate:", objc_msgSend(v6, "coordinateAtOffset:"));
      objc_msgSend(v11, "addObject:", v18);

      ++v12;
    }
    while (v12 < objc_msgSend(v7, "count"));
  }
LABEL_10:

  return v11;
}

- (id)_trafficColorInfosFromDebugSettingsForRoute:(id)a3
{
  id v3;
  uint64_t UInteger;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  GEOComposedRouteTrafficColorInfo *v27;
  GEOComposedRouteTrafficColorInfo *v28;
  double v29;
  GEOComposedRouteTrafficColorInfo *v30;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  UInteger = GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteSection, (uint64_t)off_1EDF4DA58);
  v5 = GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteColor, (uint64_t)off_1EDF4DA68);
  v6 = (double)(unint64_t)GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteStart, (uint64_t)off_1EDF4DA78)* 0.01;
  v7 = (double)(unint64_t)GEOConfigGetUInteger(GeoServicesConfig_NavdDebugTrafficOnRouteEnd, (uint64_t)off_1EDF4DA88)* 0.01;
  if (v7 <= v6)
  {
    v20 = 0;
  }
  else
  {
    objc_msgSend(v3, "distance");
    if (UInteger == 2)
    {
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v3, "steps", 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      if (v10)
      {
        v11 = v10;
        v12 = 0;
        v13 = *(_QWORD *)v33;
        do
        {
          for (i = 0; i != v11; ++i)
          {
            if (*(_QWORD *)v33 != v13)
              objc_enumerationMutation(v9);
            v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
            objc_msgSend(v15, "distance");
            v17 = v16;
            objc_msgSend(v12, "distance");
            if (v17 > v18)
            {
              v19 = v15;

              v12 = v19;
            }
          }
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
        }
        while (v11);
      }
      else
      {
        v12 = 0;
      }

      objc_msgSend(v3, "distanceFromStartToRouteCoordinate:", objc_msgSend(v12, "startRouteCoordinate"));
      v22 = v23;
      objc_msgSend(v12, "distance");
      v21 = v24;

    }
    else
    {
      v21 = v8;
      v22 = 0.0;
    }
    v25 = v22 + v6 * v21;
    v26 = v22 + v7 * v21;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25 > 0.0)
    {
      v27 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
      -[GEOComposedRouteTrafficColorInfo setColor:](v27, "setColor:", 4);
      -[GEOComposedRouteTrafficColorInfo setOffsetMeters:](v27, "setOffsetMeters:", 0.0);
      -[GEOComposedRouteTrafficColorInfo offsetMeters](v27, "offsetMeters");
      -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v27, "setRouteCoordinate:", objc_msgSend(v3, "coordinateAtOffset:"));
      objc_msgSend(v20, "addObject:", v27);

    }
    v28 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
    -[GEOComposedRouteTrafficColorInfo setColor:](v28, "setColor:", v5);
    -[GEOComposedRouteTrafficColorInfo setOffsetMeters:](v28, "setOffsetMeters:", v25);
    -[GEOComposedRouteTrafficColorInfo offsetMeters](v28, "offsetMeters");
    -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v28, "setRouteCoordinate:", objc_msgSend(v3, "coordinateAtOffset:"));
    objc_msgSend(v20, "addObject:", v28);
    objc_msgSend(v3, "distance");
    if (v26 < v29)
    {
      v30 = objc_alloc_init(GEOComposedRouteTrafficColorInfo);
      -[GEOComposedRouteTrafficColorInfo setColor:](v30, "setColor:", 4);
      -[GEOComposedRouteTrafficColorInfo setOffsetMeters:](v30, "setOffsetMeters:", v26);
      -[GEOComposedRouteTrafficColorInfo offsetMeters](v30, "offsetMeters");
      -[GEOComposedRouteTrafficColorInfo setRouteCoordinate:](v30, "setRouteCoordinate:", objc_msgSend(v3, "coordinateAtOffset:"));
      objc_msgSend(v20, "addObject:", v30);

    }
  }

  return v20;
}

- (void)_buildIncidentsForRoute:(id)a3 etaRoute:(id)a4 initializerData:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSArray *v12;
  NSArray *incidents;
  void *v14;
  void *v15;
  void *v16;
  NSArray *v17;
  NSArray *offRouteIncidents;
  id v19;

  v19 = a3;
  v7 = a4;
  objc_msgSend(v19, "geoWaypointRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v19, "uniqueRouteID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uniqueRouteID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqual:", v10);

    if (v11)
      -[GEOComposedRouteTraffic _incidentsForRoute:etaRoute:](self, "_incidentsForRoute:etaRoute:", v19, v7);
    else
      -[GEOComposedRouteTraffic _incidentsForRoute:](self, "_incidentsForRoute:", v19);
    v12 = (NSArray *)objc_claimAutoreleasedReturnValue();
    incidents = self->_incidents;
    self->_incidents = v12;

    objc_msgSend(v19, "routeInitializerData");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "directionsResponse");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "incidentsOffRoutes");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_geo_map:", &__block_literal_global_137);
    v17 = (NSArray *)objc_claimAutoreleasedReturnValue();
    offRouteIncidents = self->_offRouteIncidents;
    self->_offRouteIncidents = v17;

  }
}

GEOComposedRouteTrafficIncidentInfo *__76__GEOComposedRouteTraffic__buildIncidentsForRoute_etaRoute_initializerData___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  GEOComposedRouteTrafficIncidentInfo *v3;
  void *v4;

  v2 = a2;
  v3 = objc_alloc_init(GEOComposedRouteTrafficIncidentInfo);
  -[GEOComposedRouteTrafficIncidentInfo setIncident:](v3, "setIncident:", v2);
  objc_msgSend(v2, "position");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "coordinate");
  -[GEOComposedRouteTrafficIncidentInfo setCoordinate:](v3, "setCoordinate:");

  return v3;
}

- (id)_incidentsForRoute:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  double v15;
  __objc2_class **v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  int v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  unsigned int v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  void *v32;
  unint64_t v33;
  id v34;
  __int128 v36;
  void *v37;
  uint64_t v38;
  uint8_t buf[4];
  int v40;
  __int16 v41;
  int v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "geoWaypointRoute");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  objc_msgSend(v5, "routeLegs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v7 == v9)
  {
    objc_msgSend(v5, "incidentsOnRouteLegs");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "legs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v14 = 0;
      v15 = 0.0;
      v16 = off_1E1BEC000;
      *(_QWORD *)&v13 = 67109376;
      v36 = v13;
      v37 = v5;
      while (1)
      {
        objc_msgSend(v5, "routeLegs", v36);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = objc_msgSend(v18, "incidentIndicesCount");
        if (v19 != objc_msgSend(v18, "incidentEndOffsetsInRoutesCount"))
        {
          GEOGetGEOComposedRouteTrafficLog();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            v21 = objc_msgSend(v18, "incidentIndicesCount");
            v22 = objc_msgSend(v18, "incidentEndOffsetsInRoutesCount");
            *(_DWORD *)buf = v36;
            v40 = v21;
            v16 = off_1E1BEC000;
            v41 = 1024;
            v42 = v22;
            _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_ERROR, "GEORoute incidentIndicesCount (%d) not equal to incidentEndOffsetsInRoutesCount (%d). This is a server error.", buf, 0xEu);
          }

          v23 = objc_msgSend(v18, "incidentIndicesCount");
          if (v23 != objc_msgSend(v18, "incidentEndOffsetsInRoutesCount"))
            break;
        }
        v38 = v14;
        if (objc_msgSend(v18, "incidentIndicesCount"))
        {
          v24 = 0;
          do
          {
            v25 = *(_DWORD *)(objc_msgSend(v18, "incidentEndOffsetsInRoutes") + 4 * v24) + v15;
            objc_msgSend(v10, "objectAtIndexedSubscript:", *(unsigned int *)(objc_msgSend(v18, "incidentIndices") + 4 * v24));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = objc_alloc_init(v16[20]);
            objc_msgSend(v27, "setIncident:", v26);
            objc_msgSend(v26, "position");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "coordinate");
            objc_msgSend(v27, "setCoordinate:");

            objc_msgSend(v27, "setOffsetMeters:", (double)v25);
            objc_msgSend(v27, "offsetMeters");
            objc_msgSend(v27, "setRouteCoordinate:", objc_msgSend(v3, "coordinateAtOffset:"));
            objc_msgSend(v4, "addObject:", v27);

            v16 = off_1E1BEC000;
            ++v24;
          }
          while (v24 < objc_msgSend(v18, "incidentIndicesCount"));
        }
        objc_msgSend(v3, "legs");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectAtIndexedSubscript:", v14);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v30, "distance");
        v15 = v15 + v31;

        ++v14;
        objc_msgSend(v3, "legs");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "count");

        v5 = v37;
        if (v38 + 1 >= v33)
          goto LABEL_12;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: geoRouteLeg.incidentIndicesCount == geoRouteLeg.incidentEndOffsetsInRoutesCount", buf, 2u);
      }

      v34 = 0;
    }
    else
    {
LABEL_12:
      v34 = v4;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: route.legs.count == geoWaypointRoute.routeLegs.count", buf, 2u);
    }
    v34 = 0;
  }

  return v34;
}

- (id)_incidentsForRoute:(id)a3 etaRoute:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  unint64_t v33;
  double v34;
  void *v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  double v39;
  void *v40;
  unint64_t v41;
  double v42;
  GEOComposedRouteTrafficIncidentInfo *v43;
  void *v44;
  void *v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  unint64_t v50;
  id v51;
  NSObject *v53;
  const char *v54;
  uint8_t *v55;
  id v56;
  uint64_t v57;
  void *v58;
  uint8_t buf[16];
  uint8_t v60[2];
  __int16 v61;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "geoETAWaypointRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distance");
  v9 = v8;
  objc_msgSend(v6, "length");
  if (v9 < (double)(int)v10)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
LABEL_24:
      v51 = 0;
      goto LABEL_17;
    }
    v61 = 0;
    v53 = MEMORY[0x1E0C81028];
    v54 = "Assertion failed: route.distance >= (int) etaRoute.length";
    v55 = (uint8_t *)&v61;
LABEL_26:
    _os_log_fault_impl(&dword_1885A9000, v53, OS_LOG_TYPE_FAULT, v54, v55, 2u);
    goto LABEL_24;
  }
  objc_msgSend(v5, "legs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(v7, "routeLegs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 < v14)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_24;
    *(_WORD *)v60 = 0;
    v53 = MEMORY[0x1E0C81028];
    v54 = "Assertion failed: route.legs.count >= geoETAWaypointRoute.routeLegs.count";
    v55 = v60;
    goto LABEL_26;
  }
  objc_msgSend(v5, "distance");
  v16 = v15;
  v56 = v6;
  objc_msgSend(v6, "length");
  v18 = v17;
  objc_msgSend(v5, "legs");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");
  objc_msgSend(v7, "routeLegs");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  v23 = 0.0;
  v24 = v20 - v22;
  if (v20 != v22)
  {
    v25 = 0;
    do
    {
      objc_msgSend(v5, "legs");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndexedSubscript:", v25);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "distance");
      v23 = v23 + v28;

      ++v25;
    }
    while (v24 != v25);
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "incidentsOnUserWaypointRoutes");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "routeLegs");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "count");

  if (v32)
  {
    v33 = 0;
    v34 = v16 - v18;
    v57 = v24;
    v58 = v7;
    while (1)
    {
      objc_msgSend(v7, "routeLegs");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "objectAtIndexedSubscript:", v33);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      v37 = objc_msgSend(v36, "incidentIndexsCount");
      if (v37 != objc_msgSend(v36, "incidentEndOffsetsInETARoutesCount"))
        break;
      if (objc_msgSend(v36, "incidentIndexsCount"))
      {
        v38 = 0;
        if (v33)
          v39 = v23;
        else
          v39 = v34;
        do
        {
          objc_msgSend(v30, "objectAtIndexedSubscript:", *(unsigned int *)(objc_msgSend(v36, "incidentIndexs") + 4 * v38));
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v41) = *(_DWORD *)(objc_msgSend(v36, "incidentEndOffsetsInETARoutes") + 4 * v38);
          v42 = v39 + (double)v41;
          v43 = objc_alloc_init(GEOComposedRouteTrafficIncidentInfo);
          -[GEOComposedRouteTrafficIncidentInfo setIncident:](v43, "setIncident:", v40);
          objc_msgSend(v40, "position");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "coordinate");
          -[GEOComposedRouteTrafficIncidentInfo setCoordinate:](v43, "setCoordinate:");

          -[GEOComposedRouteTrafficIncidentInfo setOffsetMeters:](v43, "setOffsetMeters:", v42);
          -[GEOComposedRouteTrafficIncidentInfo offsetMeters](v43, "offsetMeters");
          -[GEOComposedRouteTrafficIncidentInfo setRouteCoordinate:](v43, "setRouteCoordinate:", objc_msgSend(v5, "coordinateAtOffset:"));
          objc_msgSend(v29, "addObject:", v43);

          ++v38;
        }
        while (v38 < objc_msgSend(v36, "incidentIndexsCount"));
      }
      objc_msgSend(v5, "legs");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "objectAtIndexedSubscript:", v33 + v57);
      v46 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v46, "distance");
      v48 = v47;

      v23 = v23 + v48;
      ++v33;
      v7 = v58;
      objc_msgSend(v58, "routeLegs");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = objc_msgSend(v49, "count");

      if (v33 >= v50)
        goto LABEL_15;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: geoETARouteLeg.incidentIndexsCount == geoETARouteLeg.incidentEndOffsetsInETARoutesCount", buf, 2u);
    }

    v51 = 0;
  }
  else
  {
LABEL_15:
    v51 = v29;
  }
  v6 = v56;

LABEL_17:
  return v51;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GEOComposedRouteTraffic)initWithCoder:(id)a3
{
  id v4;
  GEOComposedRouteTraffic *v5;
  uint64_t v6;
  NSArray *trafficColors;
  uint64_t v8;
  NSArray *incidents;
  uint64_t v10;
  NSArray *offRouteIncidents;
  GEOComposedRouteTraffic *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)GEOComposedRouteTraffic;
  v5 = -[GEOComposedRouteTraffic init](&v14, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_trafficColors"));
    v6 = objc_claimAutoreleasedReturnValue();
    trafficColors = v5->_trafficColors;
    v5->_trafficColors = (NSArray *)v6;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_incidents"));
    v8 = objc_claimAutoreleasedReturnValue();
    incidents = v5->_incidents;
    v5->_incidents = (NSArray *)v8;

    objc_msgSend(v4, "decodeArrayOfObjectsOfClass:forKey:", objc_opt_class(), CFSTR("_offRouteIncidents"));
    v10 = objc_claimAutoreleasedReturnValue();
    offRouteIncidents = v5->_offRouteIncidents;
    v5->_offRouteIncidents = (NSArray *)v10;

    v12 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *trafficColors;
  id v5;

  trafficColors = self->_trafficColors;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", trafficColors, CFSTR("_trafficColors"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_incidents, CFSTR("_incidents"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_offRouteIncidents, CFSTR("_offRouteIncidents"));

}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray componentsJoinedByString:](self->_trafficColors, "componentsJoinedByString:", CFSTR(", "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendFormat:", CFSTR("%@"), v4);

  if (-[NSArray count](self->_incidents, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_incidents, "componentsJoinedByString:", CFSTR("\n\t"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\nIncidents on route:\n\t%@"), v5);

  }
  if (-[NSArray count](self->_offRouteIncidents, "count"))
  {
    -[NSArray componentsJoinedByString:](self->_offRouteIncidents, "componentsJoinedByString:", CFSTR("\n\t"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "appendFormat:", CFSTR("\nIncidents off route:\n\t%@"), v6);

  }
  return v3;
}

- (NSArray)routeTrafficColors
{
  return self->_trafficColors;
}

- (NSArray)routeIncidents
{
  return self->_incidents;
}

- (NSArray)offRouteIncidents
{
  return self->_offRouteIncidents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_offRouteIncidents, 0);
  objc_storeStrong((id *)&self->_incidents, 0);
  objc_storeStrong((id *)&self->_trafficColors, 0);
}

- (NSArray)trafficIncidents
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_incidents;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "incident", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (NSArray)trafficIncidentOffsets
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_incidents;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "offsetMeters", (_QWORD)v12);
        objc_msgSend(v9, "numberWithDouble:");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v10);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

- (unsigned)trafficColors
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  unsigned int *v11;
  int v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_trafficColors;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v8);
        v13 = 0;
        v13 = objc_msgSend(v9, "color");
        objc_msgSend(v3, "appendBytes:length:", &v13, 4);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v10 = objc_retainAutorelease(v3);
  v11 = (unsigned int *)objc_msgSend(v10, "bytes");

  return v11;
}

- (unint64_t)trafficColorsCount
{
  return -[NSArray count](self->_trafficColors, "count");
}

- (unsigned)trafficColorOffsets
{
  void *v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  id v11;
  unsigned int *v12;
  unsigned int v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v4 = self->_trafficColors;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v8);
        v14 = 0;
        objc_msgSend(v9, "offsetMeters");
        v14 = v10;
        objc_msgSend(v3, "appendBytes:length:", &v14, 4);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v11 = objc_retainAutorelease(v3);
  v12 = (unsigned int *)objc_msgSend(v11, "bytes");

  return v12;
}

- (unint64_t)trafficColorOffsetsCount
{
  return -[NSArray count](self->_trafficColors, "count");
}

@end
