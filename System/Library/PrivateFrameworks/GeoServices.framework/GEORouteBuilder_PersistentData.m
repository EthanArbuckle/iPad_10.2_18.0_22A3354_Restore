@implementation GEORouteBuilder_PersistentData

- (GEORouteBuilder_PersistentData)initWithPersistentData:(id)a3
{
  id v5;
  GEORouteBuilder_PersistentData *v6;
  GEORouteBuilder_PersistentData *v7;
  GEORouteBuilder_PersistentData *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEORouteBuilder_PersistentData;
  v6 = -[GEORouteBuilder_PersistentData init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_persistentData, a3);
    v8 = v7;
  }

  return v7;
}

- (int)_transportType
{
  return -[GEOComposedGeometryRoutePersistentData transportType](self->_persistentData, "transportType");
}

- (id)_newRouteInstance
{
  return (id)objc_opt_new();
}

- (BOOL)_buildCoordinates
{
  void *v3;
  GEOComposedRouteCoordinateArray *v4;
  void *v5;
  BOOL v6;
  NSObject *v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  -[GEOComposedGeometryRoutePersistentData rawRouteGeometry](self->_persistentData, "rawRouteGeometry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    GEOGetGEORouteBuilder_PersistentDataLog();
    v4 = (GEOComposedRouteCoordinateArray *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v4->super, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl(&dword_1885A9000, &v4->super, OS_LOG_TYPE_ERROR, "Cannot build coordinates because raw route geometry is empty.", (uint8_t *)v9, 2u);
    }
    goto LABEL_9;
  }
  v4 = -[GEOComposedRouteCoordinateArray initWithRawRouteGeometry:]([GEOComposedRouteCoordinateArray alloc], "initWithRawRouteGeometry:", v3);
  if (-[GEOComposedRouteCoordinateArray coordinateCount](v4, "coordinateCount") <= 1)
  {
    GEOGetGEORouteBuilder_PersistentDataLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9[0] = 67109120;
      v9[1] = -[GEOComposedRouteCoordinateArray coordinateCount](v4, "coordinateCount");
      _os_log_impl(&dword_1885A9000, v7, OS_LOG_TYPE_ERROR, "Error building route coordinates. Total point count is less than 2. Actual: %d", (uint8_t *)v9, 8u);
    }

LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  -[GEORouteBuilderBase route](self, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCoordinates:", v4);

  v6 = 1;
LABEL_10:

  return v6;
}

- (BOOL)_buildComponents
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint8_t v13[16];
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  -[GEORouteBuilderBase _singleLegWithLocationTypeWaypoints](self, "_singleLegWithLocationTypeWaypoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[GEOComposedGeometryRoutePersistentData anchorPoints](self->_persistentData, "anchorPoints");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[NSObject copy](v5, "copy");
      objc_msgSend(v3, "setOrigin:", v6);

    }
    -[GEOComposedGeometryRoutePersistentData anchorPoints](self->_persistentData, "anchorPoints");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "lastObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = (void *)objc_msgSend(v8, "copy");
      objc_msgSend(v3, "setDestination:", v9);

    }
    v14[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORouteBuilderBase route](self, "route");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setLegs:", v10);

  }
  else
  {
    GEOGetGEORouteBuilder_PersistentDataLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1885A9000, v5, OS_LOG_TYPE_ERROR, "Error building route leg.", v13, 2u);
    }
  }

  return v3 != 0;
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
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  -[GEORouteBuilderBase route](self, "route");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOComposedGeometryRoutePersistentData routeID](self->_persistentData, "routeID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "setUniqueRouteID:", v4);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUniqueRouteID:", v5);

  }
  objc_msgSend(v3, "setSource:", -[GEOComposedGeometryRoutePersistentData source](self->_persistentData, "source"));
  -[GEOComposedGeometryRoutePersistentData routeName](self->_persistentData, "routeName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v6);

  -[GEOComposedGeometryRoutePersistentData userProvidedName](self->_persistentData, "userProvidedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserProvidedName:", v7);

  -[GEOComposedGeometryRoutePersistentData userProvidedNotes](self->_persistentData, "userProvidedNotes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserProvidedNotes:", v8);

  -[GEOComposedGeometryRoutePersistentData storageID](self->_persistentData, "storageID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStorageID:", v9);

  -[GEOComposedGeometryRoutePersistentData tourIdentifier](self->_persistentData, "tourIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTourIdentifier:", v10);

  objc_msgSend(v3, "setTourMuid:", -[GEOComposedGeometryRoutePersistentData tourMuid](self->_persistentData, "tourMuid"));
  -[GEOComposedGeometryRoutePersistentData anchorPoints](self->_persistentData, "anchorPoints");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAnchorPoints:", v11);

  -[GEOComposedGeometryRoutePersistentData address](self->_persistentData, "address");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAddress:", v12);

  -[GEOComposedGeometryRoutePersistentData distance](self->_persistentData, "distance");
  objc_msgSend(v3, "setDistance:");
  -[GEOComposedGeometryRoutePersistentData duration](self->_persistentData, "duration");
  objc_msgSend(v3, "setExpectedTime:", v13);
  -[GEOComposedGeometryRoutePersistentData elevationProfile](self->_persistentData, "elevationProfile");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setElevationProfile:", v14);

  objc_msgSend(v3, "setElevationModel:", -[GEOComposedGeometryRoutePersistentData elevationModel](self->_persistentData, "elevationModel"));
  -[GEOComposedGeometryRoutePersistentData travelDirectionArrows](self->_persistentData, "travelDirectionArrows");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVisualInfos:", v15);

  -[GEOComposedGeometryRoutePersistentData routeNameLabels](self->_persistentData, "routeNameLabels");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setVisualInfosForRouteNameLabels:", v16);

  -[GEOComposedGeometryRoutePersistentData disclaimerText](self->_persistentData, "disclaimerText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisclaimerText:", v17);

  -[GEOComposedGeometryRoutePersistentData disclaimerURL](self->_persistentData, "disclaimerURL");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisclaimerURL:", v18);

  v19 = (void *)objc_opt_new();
  objc_msgSend(v19, "initializeForRoute:", v3);
  objc_msgSend(v3, "setMutableData:", v19);

  return 1;
}

- (GEOComposedGeometryRoutePersistentData)persistentData
{
  return self->_persistentData;
}

- (void)setPersistentData:(id)a3
{
  objc_storeStrong((id *)&self->_persistentData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentData, 0);
}

@end
