@implementation MNLocation

- (NSUUID)uuid
{
  return self->_uuid;
}

- (MNLocation)initWithClientLocation:(id *)a3
{
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[8];
  _OWORD v9[2];

  var13 = a3->var13;
  v8[6] = *(_OWORD *)&a3->var11;
  v8[7] = var13;
  v9[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v9 + 12) = *(_OWORD *)&a3->var16;
  v4 = *(_OWORD *)&a3->var5;
  v8[2] = *(_OWORD *)&a3->var3;
  v8[3] = v4;
  v5 = *(_OWORD *)&a3->var9;
  v8[4] = *(_OWORD *)&a3->var7;
  v8[5] = v5;
  v6 = *(_OWORD *)&a3->var1.var1;
  v8[0] = *(_OWORD *)&a3->var0;
  v8[1] = v6;
  return -[MNLocation initWithClientLocation:matchInfo:](self, "initWithClientLocation:matchInfo:", v8, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalDate, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_shieldText, 0);
  objc_storeStrong((id *)&self->_roadName, 0);
  objc_storeStrong((id *)&self->_detailedMatchInfo, 0);
  objc_storeStrong((id *)&self->_rawLocation, 0);
  objc_storeStrong((id *)&self->_roadMatch, 0);
  objc_storeStrong((id *)&self->_routeMatch, 0);
  objc_storeStrong((id *)&self->_routeID, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (void)setIsLeeched:(BOOL)a3
{
  self->_isLeeched = a3;
}

- (MNLocation)initWithCLLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MNLocation *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[32];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "clientLocation");
  }
  else
  {
    v16 = 0u;
    memset(v17, 0, 28);
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v9 = 0u;
  }
  objc_msgSend(v5, "matchInfo", v9, v10, v11, v12, v13, v14, v15, v16, *(_QWORD *)v17, *(_OWORD *)&v17[8], *(_QWORD *)&v17[24]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MNLocation initWithClientLocation:matchInfo:](self, "initWithClientLocation:matchInfo:", &v9, v6);

  return v7;
}

- (MNLocation)initWithClientLocation:(id *)a3 matchInfo:(id)a4
{
  id v6;
  $F24F406B2B787EFB06265DBA3D28CBD5 var13;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  MNLocation *v11;
  uint64_t v12;
  NSUUID *uuid;
  id v14;
  $F24F406B2B787EFB06265DBA3D28CBD5 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  CLLocation *rawLocation;
  MNLocation *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  $F24F406B2B787EFB06265DBA3D28CBD5 v30;
  _OWORD v31[2];
  objc_super v32;

  v6 = a4;
  v32.receiver = self;
  v32.super_class = (Class)MNLocation;
  var13 = a3->var13;
  v29 = *(_OWORD *)&a3->var11;
  v30 = var13;
  v31[0] = *(_OWORD *)&a3->var14;
  *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)&a3->var16;
  v8 = *(_OWORD *)&a3->var5;
  v25 = *(_OWORD *)&a3->var3;
  v26 = v8;
  v9 = *(_OWORD *)&a3->var9;
  v27 = *(_OWORD *)&a3->var7;
  v28 = v9;
  v10 = *(_OWORD *)&a3->var1.var1;
  v23 = *(_OWORD *)&a3->var0;
  v24 = v10;
  v11 = -[MNLocation initWithClientLocation:](&v32, sel_initWithClientLocation_, &v23);
  if (v11)
  {
    if (GEOConfigGetBOOL())
    {
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v12 = objc_claimAutoreleasedReturnValue();
      uuid = v11->_uuid;
      v11->_uuid = (NSUUID *)v12;

    }
    v14 = objc_alloc(MEMORY[0x1E0C9E3B8]);
    v15 = a3->var13;
    v29 = *(_OWORD *)&a3->var11;
    v30 = v15;
    v31[0] = *(_OWORD *)&a3->var14;
    *(_OWORD *)((char *)v31 + 12) = *(_OWORD *)&a3->var16;
    v16 = *(_OWORD *)&a3->var5;
    v25 = *(_OWORD *)&a3->var3;
    v26 = v16;
    v17 = *(_OWORD *)&a3->var9;
    v27 = *(_OWORD *)&a3->var7;
    v28 = v17;
    v18 = *(_OWORD *)&a3->var1.var1;
    v23 = *(_OWORD *)&a3->var0;
    v24 = v18;
    v19 = objc_msgSend(v14, "initWithClientLocation:matchInfo:", &v23, v6);
    rawLocation = v11->_rawLocation;
    v11->_rawLocation = (CLLocation *)v19;

    v11->_traceIndex = 0x7FFFFFFFFFFFFFFFLL;
    v21 = v11;
  }

  return v11;
}

- (MNLocation)initWithRouteMatch:(id)a3 rawLocation:(id)a4 locationMatchType:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MNLocation *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSUUID *routeID;
  CLLocationDegrees v24;
  CLLocationDegrees v25;
  MNLocation *v26;
  _OWORD v28[8];
  _OWORD v29[27];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _OWORD v33[2];

  v9 = a3;
  v10 = a4;
  v11 = v10;
  v32 = 0u;
  memset(v33, 0, 28);
  v30 = 0u;
  v31 = 0u;
  memset(&v29[22], 0, 80);
  if (v10)
    objc_msgSend(v10, "clientLocation");
  if (a5 != 2)
  {
    if (a5)
      goto LABEL_14;
    if (v11)
    {
      objc_msgSend(v11, "clientLocation");
      if (DWORD2(v29[20]) == 2)
      {
        objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
        *(_QWORD *)((char *)&v29[22] + 4) = v12;
        objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
        *(_QWORD *)((char *)&v29[22] + 12) = v13;
LABEL_12:
        objc_msgSend(v11, "rawCourse");
        goto LABEL_13;
      }
      objc_msgSend(v11, "clientLocation");
    }
    else
    {
      memset(&v29[12], 0, 156);
      memset(&v29[2], 0, 156);
    }
    *(_OWORD *)((char *)&v29[22] + 4) = *(_OWORD *)((char *)&v29[8] + 4);
    goto LABEL_12;
  }
  objc_msgSend(v9, "locationCoordinate3D");
  *(_QWORD *)((char *)&v29[22] + 4) = v14;
  objc_msgSend(v9, "locationCoordinate3D");
  *(_QWORD *)((char *)&v29[22] + 12) = v15;
  objc_msgSend(v9, "locationCoordinate3D");
  *(_QWORD *)((char *)&v29[23] + 12) = v16;
  objc_msgSend(v9, "matchedCourse");
LABEL_13:
  *(_QWORD *)((char *)&v29[25] + 12) = v17;
LABEL_14:
  v28[6] = v31;
  v28[7] = v32;
  v29[0] = v33[0];
  *(_OWORD *)((char *)v29 + 12) = *(_OWORD *)((char *)v33 + 12);
  v28[2] = v29[24];
  v28[3] = v29[25];
  v28[4] = v29[26];
  v28[5] = v30;
  v28[0] = v29[22];
  v28[1] = v29[23];
  v18 = -[MNLocation initWithClientLocation:](self, "initWithClientLocation:", v28);
  if (v18)
  {
    objc_msgSend(v9, "road");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "feature");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[MNLocation _readFromRoadFeature:](v18, "_readFromRoadFeature:", v20);
    objc_msgSend(v9, "route");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uniqueRouteID");
    v22 = objc_claimAutoreleasedReturnValue();
    routeID = v18->_routeID;
    v18->_routeID = (NSUUID *)v22;

    objc_storeStrong((id *)&v18->_rawLocation, a4);
    objc_storeStrong((id *)&v18->_routeMatch, a3);
    v18->_state = 1;
    objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
    v18->_rawShiftedCoordinate.latitude = v24;
    v18->_rawShiftedCoordinate.longitude = v25;
    v26 = v18;

  }
  return v18;
}

- (MNLocation)initWithRoadMatch:(id)a3 rawLocation:(id)a4 locationMatchType:(unint64_t)a5
{
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  MNLocation *v18;
  void *v19;
  CLLocationDegrees v20;
  CLLocationDegrees v21;
  MNLocation *v22;
  _OWORD v24[8];
  _OWORD v25[27];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[2];

  v9 = a3;
  v10 = a4;
  v11 = v10;
  v28 = 0u;
  memset(v29, 0, 28);
  v26 = 0u;
  v27 = 0u;
  memset(&v25[22], 0, 80);
  if (v10)
    objc_msgSend(v10, "clientLocation");
  if (a5 != 2)
  {
    if (a5)
      goto LABEL_14;
    if (v11)
    {
      objc_msgSend(v11, "clientLocation");
      if (DWORD2(v25[20]) == 2)
      {
        objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
        *(_QWORD *)((char *)&v25[22] + 4) = v12;
        objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
        *(_QWORD *)((char *)&v25[22] + 12) = v13;
LABEL_12:
        objc_msgSend(v11, "rawCourse");
        goto LABEL_13;
      }
      objc_msgSend(v11, "clientLocation");
    }
    else
    {
      memset(&v25[12], 0, 156);
      memset(&v25[2], 0, 156);
    }
    *(_OWORD *)((char *)&v25[22] + 4) = *(_OWORD *)((char *)&v25[8] + 4);
    goto LABEL_12;
  }
  objc_msgSend(v9, "coordinateOnRoad");
  *(_QWORD *)((char *)&v25[22] + 4) = v14;
  objc_msgSend(v9, "coordinateOnRoad");
  *(_QWORD *)((char *)&v25[22] + 12) = v15;
  objc_msgSend(v9, "coordinateOnRoad");
  *(_QWORD *)((char *)&v25[23] + 12) = v16;
  objc_msgSend(v9, "courseOnRoad");
LABEL_13:
  *(_QWORD *)((char *)&v25[25] + 12) = v17;
LABEL_14:
  v24[6] = v27;
  v24[7] = v28;
  v25[0] = v29[0];
  *(_OWORD *)((char *)v25 + 12) = *(_OWORD *)((char *)v29 + 12);
  v24[2] = v25[24];
  v24[3] = v25[25];
  v24[4] = v25[26];
  v24[5] = v26;
  v24[0] = v25[22];
  v24[1] = v25[23];
  v18 = -[MNLocation initWithClientLocation:](self, "initWithClientLocation:", v24);
  if (v18)
  {
    objc_msgSend(v9, "roadFeature");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNLocation _readFromRoadFeature:](v18, "_readFromRoadFeature:", v19);
    objc_storeStrong((id *)&v18->_rawLocation, a4);
    objc_storeStrong((id *)&v18->_roadMatch, a3);
    v18->_state = 2;
    objc_msgSend(v11, "_navigation_rawShiftedCoordinate");
    v18->_rawShiftedCoordinate.latitude = v20;
    v18->_rawShiftedCoordinate.longitude = v21;
    v22 = v18;

  }
  return v18;
}

- (MNLocation)initWithRawLocation:(id)a3 locationMatchType:(unint64_t)a4
{
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  MNLocation *v12;
  MNLocation *v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  MNLocation *v16;
  _OWORD v18[8];
  _OWORD v19[14];
  __int128 v20;
  _OWORD v21[2];
  __int128 v22;
  _OWORD v23[4];

  v7 = a3;
  v8 = v7;
  v22 = 0u;
  memset(v23, 0, 60);
  memset(v21, 0, sizeof(v21));
  v20 = 0u;
  memset(&v19[12], 0, 32);
  if (!v7)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
      goto LABEL_9;
    memset(&v19[2], 0, 156);
    goto LABEL_7;
  }
  objc_msgSend(v7, "clientLocation");
  if ((a4 & 0xFFFFFFFFFFFFFFFDLL) != 0)
    goto LABEL_9;
  objc_msgSend(v8, "clientLocation");
  if (DWORD2(v19[10]) != 2)
  {
LABEL_7:
    *(_OWORD *)((char *)&v19[12] + 4) = *(_OWORD *)((char *)v23 + 4);
    goto LABEL_8;
  }
  objc_msgSend(v8, "_navigation_rawShiftedCoordinate");
  *(_QWORD *)((char *)&v19[12] + 4) = v9;
  objc_msgSend(v8, "_navigation_rawShiftedCoordinate");
  *(_QWORD *)((char *)&v19[12] + 12) = v10;
LABEL_8:
  objc_msgSend(v8, "rawCourse");
  *(_QWORD *)((char *)v21 + 12) = v11;
LABEL_9:
  v18[6] = v23[0];
  v18[7] = v23[1];
  v19[0] = v23[2];
  *(_OWORD *)((char *)v19 + 12) = *(_OWORD *)((char *)&v23[2] + 12);
  v18[2] = v20;
  v18[3] = v21[0];
  v18[4] = v21[1];
  v18[5] = v22;
  v18[0] = v19[12];
  v18[1] = v19[13];
  v12 = -[MNLocation initWithClientLocation:](self, "initWithClientLocation:", v18);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_rawLocation, a3);
    v13->_state = 0;
    objc_msgSend(v8, "_navigation_rawShiftedCoordinate");
    v13->_rawShiftedCoordinate.latitude = v14;
    v13->_rawShiftedCoordinate.longitude = v15;
    v16 = v13;
  }

  return v13;
}

- (MNLocation)initWithRawLocation:(id)a3
{
  return -[MNLocation initWithRawLocation:locationMatchType:](self, "initWithRawLocation:locationMatchType:", a3, 1);
}

- (id)propagatedLocationForTimeInterval:(double)a3 shouldProjectAlongRoute:(BOOL)a4
{
  _BOOL4 v4;
  GEORouteMatch *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  MNLocation *v30;
  MNLocation *v31;
  _OWORD v33[8];
  _OWORD v34[4];
  __int128 v35;
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[3];

  v4 = a4;
  v39 = 0u;
  memset(v40, 0, 28);
  v37 = 0u;
  v38 = 0u;
  memset(v36, 0, sizeof(v36));
  v35 = 0u;
  memset(&v34[2], 0, 32);
  -[MNLocation clientLocation](self, "clientLocation");
  v7 = self->_routeMatch;
  if (v4 && -[MNLocation _canProjectAlongRoute](self, "_canProjectAlongRoute"))
  {
    -[MNLocation speed](self, "speed");
    v9 = v8 * a3;
    -[GEORouteMatch route](self->_routeMatch, "route");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEORouteMatch step](self->_routeMatch, "step");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "routeCoordinateForDistance:afterRouteCoordinate:", -[GEORouteMatch routeCoordinate](self->_routeMatch, "routeCoordinate"), v9);
    v13 = objc_msgSend(v11, "endRouteCoordinate");
    if ((GEOConfigGetBOOL() & 1) == 0 && GEOPolylineCoordinateIsABeforeB())
      v12 = v13;
    objc_msgSend(v10, "pointAtRouteCoordinate:", v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    objc_msgSend(v10, "courseAtRouteCoordinateIndex:", v12);
    v21 = v20;
    *(double *)((char *)&v34[2] + 4) = v15;
    *(double *)((char *)&v34[2] + 12) = v17;
    *(double *)((char *)v36 + 12) = v20;
    v22 = objc_alloc(MEMORY[0x1E0D274E0]);
    v23 = -[GEORouteMatch stepIndex](self->_routeMatch, "stepIndex");
    -[MNLocation timestamp](self, "timestamp");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (void *)objc_msgSend(v22, "initWithRoute:routeCoordinate:locationCoordinate:stepIndex:matchedCourse:timestamp:", v10, v12, v23, v24, v15, v17, v19, v21);

    objc_msgSend(v25, "setIsGoodMatch:", -[GEORouteMatch isGoodMatch](self->_routeMatch, "isGoodMatch"));
    objc_msgSend(v25, "setShouldProjectLocationAlongRoute:", -[GEORouteMatch shouldProjectLocationAlongRoute](self->_routeMatch, "shouldProjectLocationAlongRoute"));
    -[GEORouteMatch distanceFromRoute](self->_routeMatch, "distanceFromRoute");
    objc_msgSend(v25, "setDistanceFromRoute:");
    -[GEORouteMatch modifiedHorizontalAccuracy](self->_routeMatch, "modifiedHorizontalAccuracy");
    objc_msgSend(v25, "setModifiedHorizontalAccuracy:");
    -[GEORouteMatch modifiedCourseAccuracy](self->_routeMatch, "modifiedCourseAccuracy");
    objc_msgSend(v25, "setModifiedCourseAccuracy:");
    objc_msgSend(v25, "setIsTunnelProjection:", -[GEORouteMatch isTunnelProjection](self->_routeMatch, "isTunnelProjection"));
    objc_msgSend(v25, "setProjectedFrom:", self->_routeMatch);

    v7 = (GEORouteMatch *)v25;
  }
  else
  {
    -[MNLocation propagateLocationToTime:](self, "propagateLocationToTime:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    v27 = v26;
    objc_msgSend(v10, "coordinate");
    *(_QWORD *)((char *)&v34[2] + 4) = v27;
    *(_QWORD *)((char *)&v34[2] + 12) = v28;
    objc_msgSend(v10, "course");
    *(_QWORD *)((char *)v36 + 12) = v29;
  }

  v30 = [MNLocation alloc];
  v33[6] = v38;
  v33[7] = v39;
  v34[0] = v40[0];
  *(_OWORD *)((char *)v34 + 12) = *(_OWORD *)((char *)v40 + 12);
  v33[2] = v35;
  v33[3] = v36[0];
  v33[4] = v36[1];
  v33[5] = v37;
  v33[0] = v34[2];
  v33[1] = v34[3];
  v31 = -[MNLocation initWithClientLocation:](v30, "initWithClientLocation:", v33);
  -[MNLocation setState:](v31, "setState:", self->_state);
  -[MNLocation setRouteMatch:](v31, "setRouteMatch:", v7);
  -[MNLocation setRoadMatch:](v31, "setRoadMatch:", self->_roadMatch);
  -[MNLocation setRawLocation:](v31, "setRawLocation:", self->_rawLocation);
  -[MNLocation setRoadName:](v31, "setRoadName:", self->_roadName);
  -[MNLocation setShieldText:](v31, "setShieldText:", self->_shieldText);
  -[MNLocation setShieldType:](v31, "setShieldType:", self->_shieldType);
  -[MNLocation setRoadLineType:](v31, "setRoadLineType:", self->_roadLineType);
  -[MNLocation setRampType:](v31, "setRampType:", self->_rampType);
  -[MNLocation setSpeedLimit:](v31, "setSpeedLimit:", self->_speedLimit);
  -[MNLocation setSpeedLimitIsMPH:](v31, "setSpeedLimitIsMPH:", self->_speedLimitIsMPH);
  -[MNLocation setSpeedLimitShieldType:](v31, "setSpeedLimitShieldType:", self->_speedLimitShieldType);
  -[MNLocation setIsDirectional:](v31, "setIsDirectional:", self->_isDirectional);
  -[MNLocation setLocationUnreliable:](v31, "setLocationUnreliable:", self->_locationUnreliable);
  -[MNLocation setExpirationDate:](v31, "setExpirationDate:", self->_expirationDate);
  -[MNLocation setOriginalDate:](v31, "setOriginalDate:", self->_originalDate);
  -[MNLocation setRawShiftedCoordinate:](v31, "setRawShiftedCoordinate:", self->_rawShiftedCoordinate.latitude, self->_rawShiftedCoordinate.longitude);
  -[MNLocation setTraceIndex:](v31, "setTraceIndex:", self->_traceIndex);
  -[MNLocation setTraceTimestamp:](v31, "setTraceTimestamp:", self->_traceTimestamp);

  return v31;
}

- (BOOL)isEqualToLocation:(id)a3
{
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  int v45;
  int v46;
  int v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  unint64_t v57;
  unint64_t v58;
  void *v59;
  int v60;
  void *v61;
  unint64_t v62;
  unint64_t v63;
  void *v64;
  int v65;
  void *v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  int v70;
  void *v71;
  unint64_t v72;
  unint64_t v73;
  void *v74;
  int v75;
  void *v76;
  unint64_t v77;
  unint64_t v78;
  void *v79;
  int v80;
  _BOOL4 v81;
  void *v82;
  GEORouteMatch *routeMatch;
  int v84;
  float v85;
  double v86;
  double v87;
  void *v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  double v93;
  double v94;
  double v95;
  void *v96;
  double v97;
  int v98;
  void *v99;
  double v100;
  double v101;
  void *v102;
  double v103;
  double v104;
  double v105;
  double v106;
  double v107;
  double v108;
  void *v109;
  double v110;
  double v111;
  _BOOL4 v112;
  void *v113;
  int v114;
  GEORoadMatch *roadMatch;
  double v116;
  double v117;
  void *v118;
  double v119;
  double v120;
  double v121;
  void *v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  void *v129;
  int v130;
  int v131;

  v4 = a3;
  if (!v4)
    goto LABEL_77;
  if (GEOConfigGetBOOL())
  {
    v5 = v4[2];
    v6 = self->_uuid;
    v7 = (void *)v6;
    if (v6 | v5)
      LOBYTE(v5) = objc_msgSend((id)v6, "isEqual:", v5);
    else
      LOBYTE(v5) = 1;

    goto LABEL_78;
  }
  -[MNLocation coordinate](self, "coordinate");
  v9 = v8;
  v11 = v10;
  objc_msgSend(v4, "coordinate");
  LOBYTE(v5) = 0;
  if (vabdd_f64(v9, v13) >= 0.000001)
    goto LABEL_78;
  if (vabdd_f64(v11, v12) >= 0.000001)
    goto LABEL_78;
  -[MNLocation rawCoordinate](self, "rawCoordinate");
  v15 = v14;
  v17 = v16;
  objc_msgSend(v4, "rawCoordinate");
  LOBYTE(v5) = 0;
  if (vabdd_f64(v15, v19) >= 0.000001 || vabdd_f64(v17, v18) >= 0.000001)
    goto LABEL_78;
  -[MNLocation altitude](self, "altitude");
  v21 = v20;
  objc_msgSend(v4, "altitude");
  if (vabdd_f64(v21, v22) >= 0.000001)
    goto LABEL_77;
  -[MNLocation horizontalAccuracy](self, "horizontalAccuracy");
  v24 = v23;
  objc_msgSend(v4, "horizontalAccuracy");
  if (vabdd_f64(v24, v25) >= 0.000001)
    goto LABEL_77;
  -[MNLocation verticalAccuracy](self, "verticalAccuracy");
  v27 = v26;
  objc_msgSend(v4, "verticalAccuracy");
  if (vabdd_f64(v27, v28) >= 0.000001)
    goto LABEL_77;
  -[MNLocation course](self, "course");
  v30 = v29;
  objc_msgSend(v4, "course");
  if (vabdd_f64(v30, v31) >= 0.000001)
    goto LABEL_77;
  -[MNLocation rawCourse](self, "rawCourse");
  v33 = v32;
  objc_msgSend(v4, "rawCourse");
  if (vabdd_f64(v33, v34) >= 0.000001)
    goto LABEL_77;
  -[MNLocation courseAccuracy](self, "courseAccuracy");
  v36 = v35;
  objc_msgSend(v4, "courseAccuracy");
  if (vabdd_f64(v36, v37) >= 0.000001)
    goto LABEL_77;
  -[MNLocation speed](self, "speed");
  v39 = v38;
  objc_msgSend(v4, "speed");
  if (vabdd_f64(v39, v40) >= 0.000001)
    goto LABEL_77;
  -[MNLocation speedAccuracy](self, "speedAccuracy");
  v42 = v41;
  objc_msgSend(v4, "speedAccuracy");
  if (vabdd_f64(v42, v43) >= 0.000001)
    goto LABEL_77;
  -[MNLocation timestamp](self, "timestamp");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timestamp");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend((id)v5, "isEqualToDate:", v44))
    goto LABEL_75;
  v45 = -[MNLocation type](self, "type");
  if (v45 != objc_msgSend(v4, "type"))
    goto LABEL_75;
  v46 = -[MNLocation integrity](self, "integrity");
  if (v46 != objc_msgSend(v4, "integrity"))
    goto LABEL_75;
  v47 = -[MNLocation referenceFrame](self, "referenceFrame");
  if (v47 != objc_msgSend(v4, "referenceFrame"))
    goto LABEL_75;
  -[MNLocation clientLocation](self, "clientLocation");
  objc_msgSend(v4, "clientLocation");
  if (v131 != v130)
    goto LABEL_75;
  -[MNLocation rawShiftedCoordinate](self, "rawShiftedCoordinate");
  v49 = v48;
  v51 = v50;
  objc_msgSend(v4, "rawShiftedCoordinate");
  v53 = v52;
  v55 = vabdd_f64(v49, v54);

  LOBYTE(v5) = 0;
  if (v55 >= 0.000001 || vabdd_f64(v51, v53) >= 0.000001)
    goto LABEL_78;
  if (self->_state != v4[3])
    goto LABEL_77;
  v56 = (void *)v4[4];
  v57 = self->_routeID;
  v58 = v56;
  if (v57 | v58)
  {
    v59 = (void *)v58;
    v60 = objc_msgSend((id)v57, "isEqual:", v58);

    if (!v60)
      goto LABEL_77;
  }
  v61 = (void *)v4[11];
  v62 = self->_roadName;
  v63 = v61;
  if (v62 | v63)
  {
    v64 = (void *)v63;
    v65 = objc_msgSend((id)v62, "isEqual:", v63);

    if (!v65)
      goto LABEL_77;
  }
  v66 = (void *)v4[12];
  v67 = self->_shieldText;
  v68 = v66;
  if (v67 | v68)
  {
    v69 = (void *)v68;
    v70 = objc_msgSend((id)v67, "isEqual:", v68);

    if (!v70)
      goto LABEL_77;
  }
  if (self->_shieldType != v4[13])
    goto LABEL_77;
  if (self->_roadLineType != *((_DWORD *)v4 + 28))
    goto LABEL_77;
  if (self->_rampType != *((_DWORD *)v4 + 29))
    goto LABEL_77;
  if (self->_speedLimit != v4[15])
    goto LABEL_77;
  if (self->_speedLimitIsMPH != *((unsigned __int8 *)v4 + 128))
    goto LABEL_77;
  if (self->_isDirectional != *((unsigned __int8 *)v4 + 144))
    goto LABEL_77;
  if (self->_locationUnreliable != *((unsigned __int8 *)v4 + 145))
    goto LABEL_77;
  v71 = (void *)v4[19];
  v72 = self->_expirationDate;
  v73 = v71;
  if (v72 | v73)
  {
    v74 = (void *)v73;
    v75 = objc_msgSend((id)v72, "isEqual:", v73);

    if (!v75)
      goto LABEL_77;
  }
  v76 = (void *)v4[20];
  v77 = self->_originalDate;
  v78 = v76;
  if (v77 | v78)
  {
    v79 = (void *)v78;
    v80 = objc_msgSend((id)v77, "isEqual:", v78);

    if (!v80)
    {
LABEL_77:
      LOBYTE(v5) = 0;
      goto LABEL_78;
    }
  }
  v81 = self->_routeMatch == 0;
  objc_msgSend(v4, "routeMatch");
  v82 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = v81 ^ (v82 != 0);

  routeMatch = self->_routeMatch;
  if (!routeMatch)
  {
    if (!(_DWORD)v5)
      goto LABEL_78;
    goto LABEL_57;
  }
  if (!(_DWORD)v5)
    goto LABEL_78;
  v84 = -[GEORouteMatch routeCoordinate](routeMatch, "routeCoordinate");
  objc_msgSend(v4, "routeMatch");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v84 != objc_msgSend((id)v5, "routeCoordinate"))
    goto LABEL_76;
  LODWORD(v85) = (unint64_t)-[GEORouteMatch routeCoordinate](self->_routeMatch, "routeCoordinate") >> 32;
  objc_msgSend(v4, "routeMatch");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (vabds_f32(v85, COERCE_FLOAT((unint64_t)objc_msgSend(v44, "routeCoordinate") >> 32)) >= 0.000001)
  {
LABEL_75:

LABEL_76:
    goto LABEL_77;
  }
  -[GEORouteMatch locationCoordinate](self->_routeMatch, "locationCoordinate");
  v87 = v86;
  objc_msgSend(v4, "routeMatch");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "locationCoordinate");
  if (vabdd_f64(v87, v89) >= 0.000001)
  {
LABEL_74:

    goto LABEL_75;
  }
  -[GEORouteMatch locationCoordinate](self->_routeMatch, "locationCoordinate");
  v91 = v90;
  objc_msgSend(v4, "routeMatch");
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v92, "locationCoordinate");
  if (vabdd_f64(v91, v93) >= 0.000001)
  {
LABEL_73:

    goto LABEL_74;
  }
  -[GEORouteMatch matchedCourse](self->_routeMatch, "matchedCourse");
  v95 = v94;
  objc_msgSend(v4, "routeMatch");
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v96, "matchedCourse");
  if (vabdd_f64(v95, v97) >= 0.000001)
  {
LABEL_72:

    goto LABEL_73;
  }
  v98 = -[GEORouteMatch isGoodMatch](self->_routeMatch, "isGoodMatch");
  objc_msgSend(v4, "routeMatch");
  v99 = (void *)objc_claimAutoreleasedReturnValue();
  if (v98 != objc_msgSend(v99, "isGoodMatch"))
  {
LABEL_71:

    goto LABEL_72;
  }
  -[GEORouteMatch distanceFromRoute](self->_routeMatch, "distanceFromRoute");
  v101 = v100;
  objc_msgSend(v4, "routeMatch");
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "distanceFromRoute");
  if (vabdd_f64(v101, v103) >= 0.000001)
  {
LABEL_70:

    goto LABEL_71;
  }
  -[GEORouteMatch modifiedHorizontalAccuracy](self->_routeMatch, "modifiedHorizontalAccuracy");
  v105 = v104;
  objc_msgSend(v4, "routeMatch");
  v129 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v129, "modifiedHorizontalAccuracy");
  if (vabdd_f64(v105, v106) >= 0.000001)
  {

    goto LABEL_70;
  }
  -[GEORouteMatch modifiedCourseAccuracy](self->_routeMatch, "modifiedCourseAccuracy");
  v108 = v107;
  objc_msgSend(v4, "routeMatch");
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v109, "modifiedCourseAccuracy");
  v111 = vabdd_f64(v108, v110);

  if (v111 >= 0.000001)
    goto LABEL_77;
LABEL_57:
  v112 = self->_roadMatch == 0;
  objc_msgSend(v4, "roadMatch");
  v113 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v112 ^ (v113 != 0);

  roadMatch = self->_roadMatch;
  if (roadMatch)
    LOBYTE(v5) = 0;
  else
    LOBYTE(v5) = v114;
  if (roadMatch && v114)
  {
    -[GEORoadMatch coordinateOnRoad](roadMatch, "coordinateOnRoad");
    v117 = v116;
    objc_msgSend(v4, "roadMatch");
    v118 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v118, "coordinateOnRoad");
    if (vabdd_f64(v117, v119) >= 0.000001)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      -[GEORoadMatch coordinateOnRoad](self->_roadMatch, "coordinateOnRoad");
      v121 = v120;
      objc_msgSend(v4, "roadMatch");
      v122 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v122, "coordinateOnRoad");
      if (vabdd_f64(v121, v123) >= 0.000001)
      {
        LOBYTE(v5) = 0;
      }
      else
      {
        -[GEORoadMatch courseOnRoad](self->_roadMatch, "courseOnRoad");
        v125 = v124;
        objc_msgSend(v4, "roadMatch");
        v126 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v126, "courseOnRoad");
        LOBYTE(v5) = vabdd_f64(v125, v127) < 0.000001;

      }
    }

  }
LABEL_78:

  return v5;
}

- (void)setRouteMatch:(id)a3
{
  id v4;
  void *v5;
  NSUUID *v6;
  NSUUID *routeID;
  GEORouteMatch *routeMatch;

  v4 = a3;
  objc_msgSend(v4, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "uniqueRouteID");
  v6 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  routeID = self->_routeID;
  self->_routeID = v6;

  routeMatch = self->_routeMatch;
  self->_routeMatch = (GEORouteMatch *)v4;

}

- (NSString)roadName
{
  unint64_t state;
  NSString *roadName;
  NSString *v4;
  NSObject *v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  state = self->_state;
  if (!state)
  {
LABEL_11:
    v4 = 0;
    return v4;
  }
  if (state == 2)
  {
    roadName = self->_roadName;
    if (!roadName)
    {
      -[GEORoadMatch roadName](self->_roadMatch, "roadName");
      v4 = (NSString *)objc_claimAutoreleasedReturnValue();
      return v4;
    }
    goto LABEL_7;
  }
  if (state != 1)
  {
    GEOFindOrCreateLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v7 = 136315650;
      v8 = "-[MNLocation roadName]";
      v9 = 2080;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Location/MNLocation.m";
      v11 = 1024;
      v12 = 373;
      _os_log_impl(&dword_1B0AD7000, v5, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: Hit an unreachable code path", (uint8_t *)&v7, 0x1Cu);
    }

    goto LABEL_11;
  }
  roadName = self->_roadName;
  if (!roadName)
    roadName = self->_shieldText;
LABEL_7:
  v4 = roadName;
  return v4;
}

- (unint64_t)stepIndex
{
  GEORouteMatch *routeMatch;

  routeMatch = self->_routeMatch;
  if (routeMatch)
    return -[GEORouteMatch stepIndex](routeMatch, "stepIndex");
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isProjected
{
  if (self->_routeMatch && -[MNLocation state](self, "state") == 1)
    return -[GEORouteMatch isTunnelProjection](self->_routeMatch, "isTunnelProjection");
  else
    return 0;
}

- (NSDate)originalDate
{
  NSDate *originalDate;

  originalDate = self->_originalDate;
  if (originalDate)
    return originalDate;
  -[CLLocation timestamp](self->_rawLocation, "timestamp");
  return (NSDate *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setRawShiftedCoordinate:(CLLocationCoordinate2D)a3
{
  self->_rawShiftedCoordinate = a3;
}

- (double)distanceToEndOfRoute
{
  GEORouteMatch *routeMatch;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  routeMatch = self->_routeMatch;
  if (!routeMatch)
    return -1.0;
  v4 = -[GEORouteMatch routeCoordinate](routeMatch, "routeCoordinate");
  -[GEORouteMatch route](self->_routeMatch, "route");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "distanceToEndFromRouteCoordinate:", v4);
  v7 = v6;

  return v7;
}

- (double)distanceToEndOfCurrentLeg
{
  GEORouteMatch *routeMatch;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v8;
  double v9;
  double v10;

  routeMatch = self->_routeMatch;
  if (!routeMatch)
    return -1.0;
  v4 = -[GEORouteMatch routeCoordinate](routeMatch, "routeCoordinate");
  -[GEORouteMatch leg](self->_routeMatch, "leg");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "endRouteCoordinate");

  if ((GEOPolylineCoordinateIsABeforeB() & 1) != 0)
    return -1.0;
  -[GEORouteMatch route](self->_routeMatch, "route");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v4, v6);
  v10 = v9;

  return v10;
}

- (id)matchInfo
{
  return (id)-[CLLocation matchInfo](self->_rawLocation, "matchInfo");
}

- (BOOL)_canProjectAlongRoute
{
  int v3;
  char v4;
  double v5;
  BOOL v6;
  double v8;

  v3 = -[GEORouteMatch shouldProjectLocationAlongRoute](self->_routeMatch, "shouldProjectLocationAlongRoute");
  if (self->_state == 1)
    v4 = -[GEORouteMatch isGoodMatch](self->_routeMatch, "isGoodMatch");
  else
    v4 = 0;
  -[MNLocation speed](self, "speed");
  if (v5 >= 0.0)
  {
    -[MNLocation speedAccuracy](self, "speedAccuracy");
    v6 = v8 >= 0.0;
    if (!v3)
      return 0;
  }
  else
  {
    v6 = 0;
    if (!v3)
      return 0;
  }
  return v4 & v6;
}

- (id)_roadFeature
{
  void *v2;
  void *v3;

  if (self->_state == 2)
  {
    -[GEORoadMatch roadFeature](self->_roadMatch, "roadFeature");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GEORouteMatch road](self->_routeMatch, "road");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "feature");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v2;
}

- (void)_readFromRoadFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = a3;
    objc_msgSend(v4, "feature");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "attributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    self->_roadLineType = objc_msgSend(v6, "lineType");

    objc_msgSend(v4, "feature");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "attributes");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    self->_rampType = objc_msgSend(v8, "rampType");

    self->_speedLimit = objc_msgSend(v4, "displaySpeedLimit");
    self->_speedLimitIsMPH = objc_msgSend(v4, "displaySpeedLimitIsMPH");
    LODWORD(v7) = objc_msgSend(v4, "speedLimitShieldId");

    self->_speedLimitShieldType = v7;
  }
}

- (BOOL)_navigation_isStale
{
  NSDate *expirationDate;
  void *v5;

  if (-[MNLocation isProjected](self, "isProjected") || -[MNLocation locationUnreliable](self, "locationUnreliable"))
  {
    LOBYTE(expirationDate) = 1;
  }
  else
  {
    expirationDate = self->_expirationDate;
    if (expirationDate)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(expirationDate) = -[NSDate compare:](expirationDate, "compare:", v5) != NSOrderedDescending;

    }
  }
  return (char)expirationDate;
}

- (BOOL)_navigation_hasValidCourse
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MNLocation;
  return -[CLLocation _navigation_hasValidCourse](&v4, sel__navigation_hasValidCourse)
      || -[MNLocation state](self, "state") != 0;
}

- (id)_navigation_routeMatch
{
  return self->_routeMatch;
}

- (CLLocationCoordinate2D)_navigation_rawShiftedCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_rawShiftedCoordinate.latitude;
  longitude = self->_rawShiftedCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (id)_navigation_detailedMatchInfo
{
  return self->_detailedMatchInfo;
}

- (id)description
{
  void *v3;
  void *v4;
  unint64_t state;
  __CFString *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  unsigned int v45;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UUID: %@"), self->_uuid);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v4);

  state = self->_state;
  if (state > 2)
    v6 = 0;
  else
    v6 = off_1E61D7B10[state];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Match type: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v7);

  v8 = (void *)MEMORY[0x1E0CB3940];
  -[MNLocation coordinate](self, "coordinate");
  v10 = v9;
  -[MNLocation coordinate](self, "coordinate");
  v12 = v11;
  -[MNLocation horizontalAccuracy](self, "horizontalAccuracy");
  v14 = v13;
  -[MNLocation rawCoordinate](self, "rawCoordinate");
  v16 = v15;
  -[MNLocation rawCoordinate](self, "rawCoordinate");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Coordinate: %f, %f ±%0.2f (raw: %f, %f)"), v10, v12, v14, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v18);

  v19 = (void *)MEMORY[0x1E0CB3940];
  -[MNLocation course](self, "course");
  v21 = v20;
  -[MNLocation courseAccuracy](self, "courseAccuracy");
  v23 = v22;
  -[MNLocation rawCourse](self, "rawCourse");
  objc_msgSend(v19, "stringWithFormat:", CFSTR("Course: %0.2f° ±%0.2f (raw: %0.2f°)"), v21, v23, v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v25);

  v26 = (void *)MEMORY[0x1E0CB3940];
  -[MNLocation speed](self, "speed");
  v28 = v27;
  -[CLLocation _navigation_speedAccuracy](self, "_navigation_speedAccuracy");
  objc_msgSend(v26, "stringWithFormat:", CFSTR("Speed: %0.2f m/s ±%0.2f"), v28, v29);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v30);

  v31 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  objc_msgSend(v31, "setDateFormat:", CFSTR("yyyy-MM-dd h:mm:ss.SSS a"));
  -[MNLocation timestamp](self, "timestamp");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "stringFromDate:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = (void *)MEMORY[0x1E0CB3940];
  -[MNLocation timestamp](self, "timestamp");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "timeIntervalSinceReferenceDate");
  objc_msgSend(v34, "stringWithFormat:", CFSTR("Date: %@ (%0.3f)"), v33, v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v37);

  v38 = (void *)MEMORY[0x1E0D27178];
  -[MNLocation coordinate](self, "coordinate");
  if (objc_msgSend(v38, "isLocationShiftRequiredForCoordinate:"))
  {
    v39 = (void *)MEMORY[0x1E0CB3940];
    -[MNLocation _referenceFrameAsString:](self, "_referenceFrameAsString:", -[MNLocation referenceFrame](self, "referenceFrame"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    -[MNLocation clientLocation](self, "clientLocation");
    -[MNLocation _referenceFrameAsString:](self, "_referenceFrameAsString:", v45);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "stringWithFormat:", CFSTR("Reference frame: %@ (raw: %@)"), v40, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v42);

  }
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR("\n"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();

  return v43;
}

- (id)_referenceFrameAsString:(int)a3
{
  const __CFString *v3;

  v3 = CFSTR("Unknown");
  if (a3 == 2)
    v3 = CFSTR("ChinaShifted");
  if (a3 == 1)
    return CFSTR("WGS84");
  else
    return (id)v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNLocation)initWithCoder:(id)a3
{
  id v4;
  MNLocation *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSUUID *routeID;
  uint64_t v10;
  CLLocation *rawLocation;
  id v12;
  const void *v13;
  size_t v14;
  uint64_t v15;
  NSString *roadName;
  uint64_t v17;
  NSString *shieldText;
  uint64_t v19;
  NSDate *expirationDate;
  uint64_t v21;
  NSDate *originalDate;
  uint64_t v23;
  GEORouteMatch *routeMatch;
  uint64_t v25;
  GEORoadMatch *roadMatch;
  id v27;
  uint64_t v28;
  CLLocation *v29;
  MNLocation *v30;
  _BYTE v32[156];
  unint64_t v33;
  objc_super v34;

  v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)MNLocation;
  v5 = -[MNLocation initWithCoder:](&v34, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    v5->_state = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_state"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeID"));
    v8 = objc_claimAutoreleasedReturnValue();
    routeID = v5->_routeID;
    v5->_routeID = (NSUUID *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_rawLocation"));
    v10 = objc_claimAutoreleasedReturnValue();
    rawLocation = v5->_rawLocation;
    v5->_rawLocation = (CLLocation *)v10;

    v33 = 0;
    v12 = objc_retainAutorelease(v4);
    v13 = (const void *)objc_msgSend(v12, "decodeBytesForKey:returnedLength:", CFSTR("_rawShiftedCoordinate"), &v33);
    if (v33 && v13)
    {
      if (v33 >= 0x10)
        v14 = 16;
      else
        v14 = v33;
      memcpy(&v5->_rawShiftedCoordinate, v13, v14);
    }
    objc_msgSend(v12, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_roadName"));
    v15 = objc_claimAutoreleasedReturnValue();
    roadName = v5->_roadName;
    v5->_roadName = (NSString *)v15;

    objc_msgSend(v12, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_shieldText"));
    v17 = objc_claimAutoreleasedReturnValue();
    shieldText = v5->_shieldText;
    v5->_shieldText = (NSString *)v17;

    v5->_shieldType = objc_msgSend(v12, "decodeIntegerForKey:", CFSTR("_shieldType"));
    v5->_roadLineType = objc_msgSend(v12, "decodeIntegerForKey:", CFSTR("_roadLineType"));
    v5->_rampType = objc_msgSend(v12, "decodeIntegerForKey:", CFSTR("_rampType"));
    v5->_speedLimit = objc_msgSend(v12, "decodeIntegerForKey:", CFSTR("_speedLimit"));
    v5->_speedLimitIsMPH = objc_msgSend(v12, "decodeBoolForKey:", CFSTR("_speedLimitIsMPH"));
    v5->_speedLimitShieldType = objc_msgSend(v12, "decodeIntegerForKey:", CFSTR("_speedLimitShieldType"));
    v5->_isDirectional = objc_msgSend(v12, "decodeBoolForKey:", CFSTR("_isDirectional"));
    v5->_locationUnreliable = objc_msgSend(v12, "decodeBoolForKey:", CFSTR("_locationUnreliable"));
    objc_msgSend(v12, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_expirationDate"));
    v19 = objc_claimAutoreleasedReturnValue();
    expirationDate = v5->_expirationDate;
    v5->_expirationDate = (NSDate *)v19;

    objc_msgSend(v12, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_originalDate"));
    v21 = objc_claimAutoreleasedReturnValue();
    originalDate = v5->_originalDate;
    v5->_originalDate = (NSDate *)v21;

    objc_msgSend(v12, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_routeMatch"));
    v23 = objc_claimAutoreleasedReturnValue();
    routeMatch = v5->_routeMatch;
    v5->_routeMatch = (GEORouteMatch *)v23;

    objc_msgSend(v12, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_roadMatch"));
    v25 = objc_claimAutoreleasedReturnValue();
    roadMatch = v5->_roadMatch;
    v5->_roadMatch = (GEORoadMatch *)v25;

    if (!v5->_rawLocation)
    {
      v27 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      -[MNLocation clientLocation](v5, "clientLocation");
      v28 = objc_msgSend(v27, "initWithClientLocation:", v32);
      v29 = v5->_rawLocation;
      v5->_rawLocation = (CLLocation *)v28;

    }
    v5->_traceIndex = 0x7FFFFFFFFFFFFFFFLL;
    v30 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MNLocation;
  v4 = a3;
  -[MNLocation encodeWithCoder:](&v5, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, CFSTR("_uuid"), v5.receiver, v5.super_class);
  objc_msgSend(v4, "encodeInteger:forKey:", self->_state, CFSTR("_state"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeID, CFSTR("_routeID"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_rawLocation, CFSTR("_rawLocation"));
  objc_msgSend(v4, "encodeBytes:length:forKey:", &self->_rawShiftedCoordinate, 16, CFSTR("_rawShiftedCoordinate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_roadName, CFSTR("_roadName"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_shieldText, CFSTR("_shieldText"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_shieldType, CFSTR("_shieldType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_roadLineType, CFSTR("_roadLineType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_rampType, CFSTR("_rampType"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_speedLimit, CFSTR("_speedLimit"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_speedLimitIsMPH, CFSTR("_speedLimitIsMPH"));
  objc_msgSend(v4, "encodeInteger:forKey:", self->_speedLimitShieldType, CFSTR("_speedLimitShieldType"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_isDirectional, CFSTR("_isDirectional"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_locationUnreliable, CFSTR("_locationUnreliable"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_expirationDate, CFSTR("_expirationDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_originalDate, CFSTR("_originalDate"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_routeMatch, CFSTR("_routeMatch"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_roadMatch, CFSTR("_roadMatch"));

}

- (void)setUuid:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSUUID)routeID
{
  return self->_routeID;
}

- (GEORouteMatch)routeMatch
{
  return self->_routeMatch;
}

- (GEORoadMatch)roadMatch
{
  return self->_roadMatch;
}

- (void)setRoadMatch:(id)a3
{
  objc_storeStrong((id *)&self->_roadMatch, a3);
}

- (CLLocation)rawLocation
{
  return self->_rawLocation;
}

- (void)setRawLocation:(id)a3
{
  objc_storeStrong((id *)&self->_rawLocation, a3);
}

- (GEONavigationMatchInfo)detailedMatchInfo
{
  return self->_detailedMatchInfo;
}

- (void)setDetailedMatchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_detailedMatchInfo, a3);
}

- (void)setRoadName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (NSString)shieldText
{
  return self->_shieldText;
}

- (void)setShieldText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (int64_t)shieldType
{
  return self->_shieldType;
}

- (void)setShieldType:(int64_t)a3
{
  self->_shieldType = a3;
}

- (unsigned)roadLineType
{
  return self->_roadLineType;
}

- (void)setRoadLineType:(unsigned int)a3
{
  self->_roadLineType = a3;
}

- (int)rampType
{
  return self->_rampType;
}

- (void)setRampType:(int)a3
{
  self->_rampType = a3;
}

- (unint64_t)speedLimit
{
  return self->_speedLimit;
}

- (void)setSpeedLimit:(unint64_t)a3
{
  self->_speedLimit = a3;
}

- (BOOL)speedLimitIsMPH
{
  return self->_speedLimitIsMPH;
}

- (void)setSpeedLimitIsMPH:(BOOL)a3
{
  self->_speedLimitIsMPH = a3;
}

- (int64_t)speedLimitShieldType
{
  return self->_speedLimitShieldType;
}

- (void)setSpeedLimitShieldType:(int64_t)a3
{
  self->_speedLimitShieldType = a3;
}

- (BOOL)isDirectional
{
  return self->_isDirectional;
}

- (void)setIsDirectional:(BOOL)a3
{
  self->_isDirectional = a3;
}

- (BOOL)locationUnreliable
{
  return self->_locationUnreliable;
}

- (void)setLocationUnreliable:(BOOL)a3
{
  self->_locationUnreliable = a3;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (void)setExpirationDate:(id)a3
{
  objc_storeStrong((id *)&self->_expirationDate, a3);
}

- (void)setOriginalDate:(id)a3
{
  objc_storeStrong((id *)&self->_originalDate, a3);
}

- (CLLocationCoordinate2D)rawShiftedCoordinate
{
  double latitude;
  double longitude;
  CLLocationCoordinate2D result;

  latitude = self->_rawShiftedCoordinate.latitude;
  longitude = self->_rawShiftedCoordinate.longitude;
  result.longitude = longitude;
  result.latitude = latitude;
  return result;
}

- (BOOL)isLeeched
{
  return self->_isLeeched;
}

- (unint64_t)traceIndex
{
  return self->_traceIndex;
}

- (void)setTraceIndex:(unint64_t)a3
{
  self->_traceIndex = a3;
}

- (double)traceTimestamp
{
  return self->_traceTimestamp;
}

- (void)setTraceTimestamp:(double)a3
{
  self->_traceTimestamp = a3;
}

@end
