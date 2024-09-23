@implementation _GEORouteMatchUpdater

- (_GEORouteMatchUpdater)initWithTransitRouteMatcher:(id)a3
{
  id v4;
  _GEORouteMatchUpdater *v5;
  _GEORouteMatchUpdater *v6;
  uint64_t v7;
  GEOComposedRoute *route;
  GEOMapFeatureAccess *v9;
  GEOMapFeatureAccess *mapFeatureAccess;
  void *v11;
  uint64_t v12;
  GEOMotionContext *motionContext;
  _GEORouteMatchUpdater *v14;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_GEORouteMatchUpdater;
  v5 = -[_GEORouteMatchUpdater init](&v16, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_routeMatcher, v4);
    objc_msgSend(v4, "route");
    v7 = objc_claimAutoreleasedReturnValue();
    route = v6->_route;
    v6->_route = (GEOComposedRoute *)v7;

    v9 = objc_alloc_init(GEOMapFeatureAccess);
    mapFeatureAccess = v6->_mapFeatureAccess;
    v6->_mapFeatureAccess = v9;

    objc_msgSend(v4, "auditToken");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOMapFeatureAccess setAuditToken:](v6->_mapFeatureAccess, "setAuditToken:", v11);

    -[GEOMapFeatureAccess setAllowNetworkTileLoad:](v6->_mapFeatureAccess, "setAllowNetworkTileLoad:", 1);
    objc_msgSend(v4, "motionContext");
    v12 = objc_claimAutoreleasedReturnValue();
    motionContext = v6->_motionContext;
    v6->_motionContext = (GEOMotionContext *)v12;

    v14 = v6;
  }

  return v6;
}

- (BOOL)updateRouteMatch:(id)a3 previousRouteMatch:(id)a4 forLocation:(id)a5
{
  return 0;
}

- (unint64_t)priority
{
  return 0;
}

- (BOOL)_isLocation:(id)a3 nearStop:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  BOOL v12;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "latLng");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinate");
    v12 = -[_GEORouteMatchUpdater _isLocation:nearTransitPoint:transitID:featureSize:](self, "_isLocation:nearTransitPoint:transitID:featureSize:", v6, objc_msgSend(v8, "muid"), v10, v11, 50.0);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_isLocation:(id)a3 nearStation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double stationRadius;
  void *v10;
  double v11;
  double v12;
  BOOL v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_stationRadius <= 0.0)
    stationRadius = 100.0;
  else
    stationRadius = self->_stationRadius;
  if (v7)
  {
    objc_msgSend(v7, "location");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinate");
    v13 = -[_GEORouteMatchUpdater _isLocation:nearTransitPoint:transitID:featureSize:](self, "_isLocation:nearTransitPoint:transitID:featureSize:", v6, objc_msgSend(v8, "muid"), v11, v12, stationRadius);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (BOOL)_isLocation:(id)a3 nearTransitPoint:(id)a4 transitID:(unint64_t)a5 featureSize:(double)a6
{
  double var1;
  double var0;
  id v11;
  double v12;
  double v13;
  double v14;
  GEOMapFeatureAccess *mapFeatureAccess;
  id v16;
  void *v17;
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
  char v34;
  BOOL v36;
  double *v37;
  double Double;
  double v40;
  double v41;
  uint64_t v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  double v47;
  long double v48;
  double v49;
  double *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  long double v58;
  long double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  _QWORD v70[6];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a3;
  if (objc_msgSend(v11, "hasTransitID") && objc_msgSend(v11, "transitID") == a5)
  {
    LOBYTE(a5) = 1;
  }
  else
  {
    objc_msgSend(v11, "coordinate");
    v14 = GEOCalculateDistanceRadius(v12, v13, var0, var1, 6367000.0);
    if (v14 >= 1000.0)
      goto LABEL_22;
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__75;
    v75 = __Block_byref_object_dispose__75;
    v76 = 0;
    mapFeatureAccess = self->_mapFeatureAccess;
    v70[0] = MEMORY[0x1E0C809B0];
    v70[1] = 3221225472;
    v70[2] = __76___GEORouteMatchUpdater__isLocation_nearTransitPoint_transitID_featureSize___block_invoke;
    v70[3] = &unk_1E1C12780;
    v70[4] = self;
    v70[5] = &v71;
    v16 = -[GEOMapFeatureAccess findTransitPointWithID:near:pointHandler:completionHandler:](mapFeatureAccess, "findTransitPointWithID:near:pointHandler:completionHandler:", a5, v70, 0, var0, var1);
    v17 = (void *)v72[5];
    if (!v17)
      goto LABEL_20;
    if (objc_msgSend(v17, "polygonPointsCount"))
    {
      objc_msgSend((id)v72[5], "boundingRadius");
      self->_stationRadius = v18;
      objc_msgSend(v11, "coordinate");
      v20 = v19;
      v22 = v21;
      objc_msgSend((id)v72[5], "boundingRect");
      v24 = v23;
      v26 = v25;
      v28 = v27;
      v30 = v29;
      v32 = GEOTilePointForCoordinate(v20, v22, 20.0);
      v33 = v31;
      v34 = 0;
      if (fabs(v24) == INFINITY || fabs(v26) == INFINITY || v32 < v24)
      {
        LOBYTE(a5) = 0;
      }
      else
      {
        v36 = v32 < v24 + v28 && v31 >= v26 && v31 < v26 + v30;
        LOBYTE(a5) = 0;
        if (v36)
        {
          v37 = (double *)objc_msgSend((id)v72[5], "polygonPoints");
          if ((GEOMapPointInPolygon(v37, objc_msgSend((id)v72[5], "polygonPointsCount"), v32, v33) & 1) != 0)
          {
            v34 = 0;
            LOBYTE(a5) = 1;
          }
          else if (GEOConfigGetDouble(GeoServicesConfig_NavdTransitMinimumLocationAccuracyForStationEdgeIntersection, (uint64_t)off_1EDF4DA28) >= 0.0)
          {
            Double = GEOConfigGetDouble(GeoServicesConfig_NavdTransitMinimumLocationAccuracyForStationEdgeIntersection, (uint64_t)off_1EDF4DA28);
            objc_msgSend(v11, "horizontalAccuracy");
            if (Double <= v40)
            {
              objc_msgSend(v11, "horizontalAccuracy");
              v64 = v41;
            }
            else
            {
              v64 = GEOConfigGetDouble(GeoServicesConfig_NavdTransitMinimumLocationAccuracyForStationEdgeIntersection, (uint64_t)off_1EDF4DA28);
            }
            v42 = 0;
            v43 = 0;
            v65 = v14;
            v66 = a6;
            while (1)
            {
              v44 = objc_msgSend((id)v72[5], "polygonPointsCount");
              LOBYTE(a5) = v43 < v44 - 1;
              if (v43 >= v44 - 1)
                break;
              v45 = v43;
              if (!v43)
                v45 = objc_msgSend((id)v72[5], "polygonPointsCount");
              v46 = objc_msgSend((id)v72[5], "polygonPoints");
              v47 = *(double *)(v46 + v42);
              v48 = exp((*(double *)(v46 + v42 + 8) * 0.0078125 + -1048576.0) / 333772.107);
              v49 = atan(v48);
              v50 = (double *)(objc_msgSend((id)v72[5], "polygonPoints") + 16 * (v45 - 1));
              v51 = v50[1];
              v69 = *v50;
              objc_msgSend(v11, "coordinate");
              v53 = v52;
              v55 = v54;
              objc_msgSend(v11, "coordinate");
              v67 = v57;
              v68 = v56;
              v58 = exp((v51 * 0.0078125 + -1048576.0) / 333772.107);
              v59 = atan(v58);
              v62 = GEOClosestCoordinateOnLineSegmentFromCoordinate3D((v49 * -2.0 + 1.57079633) * 57.2957795, v47 * 0.0078125 * 0.000171661377 + -180.0, 1.79769313e308, (v59 * -2.0 + 1.57079633) * 57.2957795, v69 * 0.0078125 * 0.000171661377 + -180.0, 1.79769313e308, v60, v61, v53, v55);
              v34 = 0;
              ++v43;
              v42 += 16;
              v14 = v65;
              a6 = v66;
              if (GEOCalculateDistanceRadius(v62, v63, v68, v67, 6367000.0) < v64)
                goto LABEL_21;
            }
            v34 = 0;
          }
          else
          {
            v34 = 0;
            LOBYTE(a5) = 0;
          }
        }
      }
    }
    else
    {
LABEL_20:
      v34 = 1;
    }
LABEL_21:
    _Block_object_dispose(&v71, 8);

    if ((v34 & 1) != 0)
LABEL_22:
      LOBYTE(a5) = v14 < a6;
  }

  return a5 & 1;
}

- (double)_stationRadiusForStation:(id)a3 accessPoint:(id)a4 adjacentWalkingLegCoordinate:(id)a5
{
  double var1;
  double var0;
  id v8;
  id v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;

  var1 = a5.var1;
  var0 = a5.var0;
  v8 = a3;
  v9 = a4;
  if (v8)
  {
    v10 = 50.0;
    if (var1 >= -180.0 && var1 <= 180.0 && var0 >= -90.0 && var0 <= 90.0)
    {
      objc_msgSend(v8, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "coordinate");
      v13 = v12;
      v15 = v14;

      v10 = GEOCalculateDistanceRadius(v13, v15, var0, var1, 6367000.0);
      if (v9)
      {
        objc_msgSend(v9, "location");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "coordinate");
        v18 = v17;
        v20 = v19;

        v21 = GEOCalculateDistanceRadius(v13, v15, v18, v20, 6367000.0);
        if (v10 <= v21)
          v10 = v21;
      }
    }
  }
  else
  {
    v10 = 0.0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_auditToken, 0);
  objc_storeStrong((id *)&self->_motionContext, 0);
  objc_storeStrong((id *)&self->_mapFeatureAccess, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_routeMatcher);
}

@end
