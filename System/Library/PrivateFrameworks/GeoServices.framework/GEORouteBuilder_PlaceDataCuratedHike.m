@implementation GEORouteBuilder_PlaceDataCuratedHike

- (GEORouteBuilder_PlaceDataCuratedHike)initWithMapItem:(id)a3
{
  id v4;
  GEORouteBuilder_PlaceDataCuratedHike *v5;
  GEORouteBuilder_PlaceDataCuratedHike *v6;
  GEORouteBuilder_PlaceDataCuratedHike *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)GEORouteBuilder_PlaceDataCuratedHike;
  v5 = -[GEORouteBuilder_PlaceDataCuratedHike init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[GEORouteBuilder_PlaceDataCuratedHike setMapItem:](v5, "setMapItem:", v4);
    v7 = v6;
  }

  return v6;
}

+ (id)builderWithMapItem:(id)a3
{
  id v3;
  GEORouteBuilder_PlaceDataCuratedHike *v4;

  v3 = a3;
  v4 = -[GEORouteBuilder_PlaceDataCuratedHike initWithMapItem:]([GEORouteBuilder_PlaceDataCuratedHike alloc], "initWithMapItem:", v3);

  return v4;
}

- (void)setMapItem:(id)a3
{
  id v5;
  GEOPDHikeAssociatedInfo *v6;
  GEOPDHikeAssociatedInfo *hikeAssociatedInfo;
  GEOPDHikeGeometry *v8;
  GEOPDHikeGeometry *hikeGeometry;
  GEOPDHikeSummary *v10;
  GEOPDHikeSummary *hikeSummary;
  id v12;

  objc_storeStrong((id *)&self->_mapItem, a3);
  v5 = a3;
  objc_msgSend(v5, "_hikeAssociatedInfo");
  v6 = (GEOPDHikeAssociatedInfo *)objc_claimAutoreleasedReturnValue();
  hikeAssociatedInfo = self->_hikeAssociatedInfo;
  self->_hikeAssociatedInfo = v6;

  objc_msgSend(v5, "_hikeGeometry");
  v8 = (GEOPDHikeGeometry *)objc_claimAutoreleasedReturnValue();
  hikeGeometry = self->_hikeGeometry;
  self->_hikeGeometry = v8;

  objc_msgSend(v5, "_hikeSummary");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "hikeSummary");
  v10 = (GEOPDHikeSummary *)objc_claimAutoreleasedReturnValue();
  hikeSummary = self->_hikeSummary;
  self->_hikeSummary = v10;

}

- (int)_transportType
{
  return 2;
}

- (id)_newRouteInstance
{
  return (id)objc_opt_new();
}

- (BOOL)_buildCoordinates
{
  void *v3;
  GEORawRouteGeometry *v4;
  void *v5;
  NSObject *v6;
  GEOComposedRouteCoordinateArray *v7;
  unint64_t v8;
  BOOL v9;
  NSObject *v10;
  _DWORD v13[4];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[GEOPDHikeGeometry routingPathLeg](self->_hikeGeometry, "routingPathLeg");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = [GEORawRouteGeometry alloc];
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[GEORawRouteGeometry initWithRawData:](v4, "initWithRawData:", v5);

    v7 = -[GEOComposedRouteCoordinateArray initWithRawRouteGeometry:]([GEOComposedRouteCoordinateArray alloc], "initWithRawRouteGeometry:", v6);
    v8 = -[GEOComposedRouteCoordinateArray coordinateCount](v7, "coordinateCount");
    v9 = v8 > 1;
    if (v8 > 1)
    {
      -[GEORouteBuilderBase route](self, "route");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject setCoordinates:](v10, "setCoordinates:", v7);
    }
    else
    {
      GEOGetGEORouteBuilder_PlaceDataCuratedHikeLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v13[0] = 67109120;
        v13[1] = -[GEOComposedRouteCoordinateArray coordinateCount](v7, "coordinateCount");
        _os_log_impl(&dword_1885A9000, v10, OS_LOG_TYPE_ERROR, "Error building route coordinates. Total point count is less than 2. Actual: %d", (uint8_t *)v13, 8u);
      }
    }

  }
  else
  {
    GEOGetGEORouteBuilder_PlaceDataCuratedHikeLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v13[0]) = 0;
      _os_log_impl(&dword_1885A9000, v6, OS_LOG_TYPE_ERROR, "Cannot build coordinates because hike geometry is empty.", (uint8_t *)v13, 2u);
    }
    v9 = 0;
  }

  return v9;
}

- (BOOL)_buildComponents
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint8_t v8[16];
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[GEORouteBuilderBase _singleLegWithLocationTypeWaypoints](self, "_singleLegWithLocationTypeWaypoints");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
  {
    v9[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
    v5 = objc_claimAutoreleasedReturnValue();
    -[GEORouteBuilderBase route](self, "route");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setLegs:", v5);

  }
  else
  {
    GEOGetGEORouteBuilder_PlaceDataCuratedHikeLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Error building route leg.", v8, 2u);
    }
  }

  return v4 != 0;
}

- (BOOL)_setMiscInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOComposedString *v12;
  void *v13;
  GEOComposedString *v14;

  -[GEORouteBuilderBase route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOMapItem addressObject](self->_mapItem, "addressObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAddress:", v4);

  objc_msgSend(v3, "setDistance:", (double)-[GEOPDHikeSummary lengthMeters](self->_hikeSummary, "lengthMeters"));
  objc_msgSend(v3, "setElevationModel:", -[GEOMapItem _hikeGeometryElevationModel](self->_mapItem, "_hikeGeometryElevationModel"));
  objc_msgSend(v3, "setExpectedTime:", -[GEOPDHikeSummary expectedDurationSeconds](self->_hikeSummary, "expectedDurationSeconds"));
  -[GEOMapItem name](self->_mapItem, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v5);

  objc_msgSend(v3, "setSource:", 2);
  objc_msgSend(v3, "setTotalAscent:", (float)-[GEOPDHikeSummary sumElevationGainCm](self->_hikeSummary, "sumElevationGainCm") * 0.01);
  objc_msgSend(v3, "setTotalDescent:", (float)-[GEOPDHikeSummary sumElevationLossCm](self->_hikeSummary, "sumElevationLossCm") * 0.01);
  -[GEOMapItem _identifier](self->_mapItem, "_identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTourIdentifier:", v6);

  objc_msgSend(v3, "setTourMuid:", -[GEOPDHikeAssociatedInfo encryptedTourMuid](self->_hikeAssociatedInfo, "encryptedTourMuid"));
  -[GEOMapItem name](self->_mapItem, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserProvidedName:", v7);

  -[GEOMapItem disclaimerText](self->_mapItem, "disclaimerText");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringValue");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisclaimerText:", v9);

  -[GEOMapItem urlData](self->_mapItem, "urlData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisclaimerURL:", v10);

  -[GEOPDHikeSummary hikeTypeName](self->_hikeSummary, "hikeTypeName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = [GEOComposedString alloc];
    -[GEOPDHikeSummary hikeTypeName](self->_hikeSummary, "hikeTypeName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[GEOComposedString initWithGeoFormattedString:](v12, "initWithGeoFormattedString:", v13);
    objc_msgSend(v3, "setHikeTypeString:", v14);

  }
  -[GEORouteBuilder_PlaceDataCuratedHike _setAnchorPoints](self, "_setAnchorPoints");

  return 1;
}

- (void)_setAnchorPoints
{
  void *v3;
  void *v4;
  uint64_t v5;
  GEOMapItemIdentifier *v6;
  GEOComposedRouteAnchorPoint *v7;
  void *v8;
  GEOComposedRouteAnchorPoint *v9;
  GEOComposedRouteAnchorPoint *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  GEOMapItemIdentifier *v16;
  GEOComposedRouteAnchorPoint *v17;
  void *v18;
  void *v19;
  GEOMapItemIdentifier *v20;
  GEOComposedRouteAnchorPoint *v21;
  void *v22;
  GEOComposedRouteAnchorPoint *v23;
  GEOComposedRouteAnchorPoint *v24;
  id *v25;
  void *v26;
  void *v27;
  GEOComposedRouteAnchorPoint *v28;
  void *v29;
  uint8_t buf[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOPDHikeAssociatedInfo startMuids](self->_hikeAssociatedInfo, "startMuids");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = objc_claimAutoreleasedReturnValue();

  v29 = (void *)v5;
  if (v5)
  {
    v6 = -[GEOMapItemIdentifier initWithMapsIdentifier:]([GEOMapItemIdentifier alloc], "initWithMapsIdentifier:", v5);
    v7 = [GEOComposedRouteAnchorPoint alloc];
    -[GEORouteBuilderBase route](self, "route");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startLocationCoordinate");
    v9 = -[GEOComposedRouteAnchorPoint initWithMapItemIdentifier:coordinate:](v7, "initWithMapItemIdentifier:coordinate:", v6);

  }
  else
  {
    v10 = [GEOComposedRouteAnchorPoint alloc];
    -[GEORouteBuilderBase route](self, "route");
    v6 = (GEOMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
    -[GEOMapItemIdentifier startLocationCoordinate](v6, "startLocationCoordinate");
    v9 = -[GEOComposedRouteAnchorPoint initWithLocationCoordinate:](v10, "initWithLocationCoordinate:");
  }

  -[GEOComposedRouteAnchorPoint setIsCuratedRoute:](v9, "setIsCuratedRoute:", 1);
  v28 = v9;
  objc_msgSend(v3, "addObject:", v9);
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  -[GEOPDHikeAssociatedInfo intermediateMuids](self->_hikeAssociatedInfo, "intermediateMuids");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v32 != v14)
          objc_enumerationMutation(v11);
        v16 = -[GEOMapItemIdentifier initWithMapsIdentifier:]([GEOMapItemIdentifier alloc], "initWithMapsIdentifier:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i));
        v17 = -[GEOComposedRouteAnchorPoint initWithMapItemIdentifier:]([GEOComposedRouteAnchorPoint alloc], "initWithMapItemIdentifier:", v16);
        -[GEOComposedRouteAnchorPoint setIsCuratedRoute:](v17, "setIsCuratedRoute:", 1);
        objc_msgSend(v3, "addObject:", v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v13);
  }

  -[GEOPDHikeAssociatedInfo endMuids](self->_hikeAssociatedInfo, "endMuids");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "lastObject");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    v20 = -[GEOMapItemIdentifier initWithMapsIdentifier:]([GEOMapItemIdentifier alloc], "initWithMapsIdentifier:", v19);
    v21 = [GEOComposedRouteAnchorPoint alloc];
    -[GEORouteBuilderBase route](self, "route");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "endLocationCoordinate");
    v23 = -[GEOComposedRouteAnchorPoint initWithMapItemIdentifier:coordinate:](v21, "initWithMapItemIdentifier:coordinate:", v20);

  }
  else
  {
    v24 = [GEOComposedRouteAnchorPoint alloc];
    -[GEORouteBuilderBase route](self, "route");
    v20 = (GEOMapItemIdentifier *)objc_claimAutoreleasedReturnValue();
    -[GEOMapItemIdentifier endLocationCoordinate](v20, "endLocationCoordinate");
    v23 = -[GEOComposedRouteAnchorPoint initWithLocationCoordinate:](v24, "initWithLocationCoordinate:");
  }

  -[GEOComposedRouteAnchorPoint setIsCuratedRoute:](v23, "setIsCuratedRoute:", 1);
  objc_msgSend(v3, "addObject:", v23);
  if ((unint64_t)objc_msgSend(v3, "count") <= 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: anchorPoints.count >= 2", buf, 2u);
    }
    __break(1u);
  }
  +[GEOComposedRouteAnchorPointList listWithAnchorPoints:](GEOComposedRouteAnchorPointList, "listWithAnchorPoints:", v3);
  v25 = (id *)objc_claimAutoreleasedReturnValue();
  -[GEORouteBuilderBase route](self, "route");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedRouteAnchorPointList updateWithRoute:](v25, v26);

  -[GEORouteBuilderBase route](self, "route");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setAnchorPoints:", v25);

}

- (GEOMapItem)mapItem
{
  return self->_mapItem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mapItem, 0);
  objc_storeStrong((id *)&self->_hikeSummary, 0);
  objc_storeStrong((id *)&self->_hikeGeometry, 0);
  objc_storeStrong((id *)&self->_hikeAssociatedInfo, 0);
}

@end
