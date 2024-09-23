@implementation MKRoute

- (id)_initWithGEOComposedRoute:(id)a3
{
  id v5;
  MKRoute *v6;
  MKRoute *v7;
  id *p_geoComposedRoute;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  unsigned int v13;
  uint64_t v14;
  _QWORD *v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  MKRoutePolyline *polyline;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  int v44;
  void *v45;
  id v46;
  void *v47;
  NSArray *steps;
  NSArray *v49;
  MKRoute *v50;
  void *v52;
  void (**v53)(_QWORD);
  id v54;
  id obj;
  uint64_t v56;
  MKRoute *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  NSArray *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[6];
  objc_super v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v67.receiver = self;
  v67.super_class = (Class)MKRoute;
  v6 = -[MKRoute init](&v67, sel_init);
  v7 = v6;
  if (v6)
  {
    p_geoComposedRoute = (id *)&v6->_geoComposedRoute;
    objc_storeStrong((id *)&v6->_geoComposedRoute, a3);
    if (objc_msgSend(v5, "elevationModel") || !GEOConfigGetBOOL())
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D27420], "modernManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "activeTileGroup");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activeTileSetForTileType:scale:", 92, 1);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11 != 0;

    }
    v13 = objc_msgSend(*p_geoComposedRoute, "pointCount");
    if (v13)
    {
      v14 = v13;
      v15 = malloc_type_malloc(16 * v13, 0x1000040451B5BE8uLL);
      if (v15)
      {
        v16 = v15;
        v17 = malloc_type_malloc(8 * v14, 0x100004000313F17uLL);
        if (v17)
        {
          v18 = v17;
          v19 = 0;
          v20 = v16 + 1;
          do
          {
            objc_msgSend(*p_geoComposedRoute, "pointAt:", v19);
            *(v20 - 1) = v21;
            *v20 = v22;
            v18[v19++] = v23;
            v20 += 2;
          }
          while (v14 != v19);
          v66[0] = MEMORY[0x1E0C809B0];
          v66[1] = 3221225472;
          v66[2] = __37__MKRoute__initWithGEOComposedRoute___block_invoke_2;
          v66[3] = &__block_descriptor_48_e5_v8__0l;
          v66[4] = v16;
          v66[5] = v18;
          v53 = (void (**)(_QWORD))MEMORY[0x18D778DB8](v66);
          +[MKPolyline polylineWithCoordinates:elevations:count:elevationCorrection:](MKRoutePolyline, "polylineWithCoordinates:elevations:count:elevationCorrection:", v16, v18, v14, v12);
          v24 = objc_claimAutoreleasedReturnValue();
          polyline = v7->_polyline;
          v7->_polyline = (MKRoutePolyline *)v24;

          -[MKRoute name](v7, "name");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          -[MKShape setTitle:](v7->_polyline, "setTitle:", v26);

          v54 = v5;
          -[MKRoutePolyline _setRequiresModernMap:](v7->_polyline, "_setRequiresModernMap:", objc_msgSend(v5, "transportType") != 0);
          v61 = (NSArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", -[GEOComposedRoute stepsCount](v7->_geoComposedRoute, "stepsCount"));
          v27 = -[GEOComposedRoute stepsCount](v7->_geoComposedRoute, "stepsCount");
          v62 = 0u;
          v63 = 0u;
          v64 = 0u;
          v65 = 0u;
          -[GEOComposedRoute steps](v7->_geoComposedRoute, "steps");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
          if (v58)
          {
            v28 = 0;
            v56 = v27;
            v57 = v7;
            v59 = 1;
            v60 = *(_QWORD *)v63;
            while (2)
            {
              v29 = 0;
              v30 = v28;
              do
              {
                if (*(_QWORD *)v63 != v60)
                  objc_enumerationMutation(obj);
                v31 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * v29);
                objc_msgSend(v31, "endRouteCoordinate");
                v32 = GEOPolylineCoordinateNearestIndex();
                if (v32 < v30
                  || (v28 = v32,
                      -[MKRoutePolyline _stepWithRange:](v7->_polyline, "_stepWithRange:", v30, v32 - v30 + 1),
                      (v33 = objc_claimAutoreleasedReturnValue()) == 0))
                {
                  v52 = v53;
                  v53[2](v53);
LABEL_36:

                  v50 = 0;
                  v5 = v54;
                  goto LABEL_33;
                }
                v34 = (void *)v33;
                v35 = (void *)MEMORY[0x1E0CB3940];
                _MKLocalizedStringFromThisBundle(CFSTR("Step %d of %d"));
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v35, "stringWithFormat:", v36, v59 + v29, v56);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setTitle:", v37);

                objc_msgSend(v31, "geoStep");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "instructionSet");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v39, "genericInstruction");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "maneuver");
                v41 = (void *)objc_claimAutoreleasedReturnValue();

                objc_msgSend(v34, "setSubtitle:", v41);
                if (objc_msgSend(*p_geoComposedRoute, "transportType") == 2)
                  v42 = 2;
                else
                  v42 = 1;
                objc_msgSend(v31, "geoStep");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = objc_msgSend(v43, "hasOverrideTransportType");

                if (v44)
                {
                  objc_msgSend(v31, "geoStep");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v45, "overrideTransportType") == 2)
                    v42 = 2;
                  else
                    v42 = 1;

                }
                v46 = -[MKRouteStep _initWithGEOComposedRouteStep:instructions:transportType:polyline:]([MKRouteStep alloc], "_initWithGEOComposedRouteStep:instructions:transportType:polyline:", v31, v41, v42, v34);
                v7 = v57;
                if (!v46)
                {
                  v52 = v53;
                  v53[2](v53);

                  goto LABEL_36;
                }
                v47 = v46;
                -[NSArray addObject:](v61, "addObject:", v46);

                ++v29;
                v30 = v28;
              }
              while (v58 != v29);
              v58 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v68, 16);
              v59 = (v59 + v29);
              if (v58)
                continue;
              break;
            }
          }

          steps = v7->_steps;
          v7->_steps = v61;
          v49 = v61;

          -[GEOComposedRoute clearPoints](v7->_geoComposedRoute, "clearPoints");
          v53[2](v53);

          v5 = v54;
          goto LABEL_30;
        }
        free(v16);
      }
    }
    v50 = 0;
    goto LABEL_33;
  }
LABEL_30:
  v50 = v7;
LABEL_33:

  return v50;
}

void __37__MKRoute__initWithGEOComposedRoute___block_invoke_2(uint64_t a1)
{
  free(*(void **)(a1 + 32));
  free(*(void **)(a1 + 40));
}

- (MKDirectionsTransportType)transportType
{
  if (-[GEOComposedRoute transportType](self->_geoComposedRoute, "transportType") == 2)
    return 2;
  else
    return 1;
}

- (NSString)name
{
  return (NSString *)-[GEOComposedRoute name](self->_geoComposedRoute, "name");
}

- (BOOL)hasTolls
{
  return -[GEOComposedRoute avoidsTolls](self->_geoComposedRoute, "avoidsTolls") ^ 1;
}

- (BOOL)hasHighways
{
  return -[GEOComposedRoute avoidsHighways](self->_geoComposedRoute, "avoidsHighways") ^ 1;
}

- (NSArray)advisoryNotices
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  -[GEOComposedRoute advisories](self->_geoComposedRoute, "advisories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v9, "advisoryItems");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "count");

        if (v11)
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          objc_msgSend(v9, "advisoryItems", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v13)
          {
            v14 = v13;
            v15 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v14; ++j)
              {
                if (*(_QWORD *)v20 != v15)
                  objc_enumerationMutation(v12);
                objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * j), "subtitleString");
                v17 = (void *)objc_claimAutoreleasedReturnValue();
                __26__MKRoute_advisoryNotices__block_invoke(v17, v3);

              }
              v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v14);
          }
        }
        else
        {
          objc_msgSend(v9, "titleString");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          __26__MKRoute_advisoryNotices__block_invoke(v12, v3);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }

  return (NSArray *)v3;
}

void __26__MKRoute_advisoryNotices__block_invoke(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint8_t v5[16];

  v3 = a2;
  objc_msgSend(a1, "stringWithDefaultOptions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "addObject:", v4);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_fault_impl(&dword_18B0B0000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: evaluatedString != ((void *)0)", v5, 2u);
  }

}

- (CLLocationDistance)distance
{
  CLLocationDistance result;

  -[GEOComposedRoute distance](self->_geoComposedRoute, "distance");
  return result;
}

- (NSTimeInterval)expectedTravelTime
{
  return (double)-[GEOComposedRoute expectedTime](self->_geoComposedRoute, "expectedTime");
}

- (MKPolyline)polyline
{
  return &self->_polyline->super;
}

- (NSArray)steps
{
  return self->_steps;
}

- (GEOComposedRoute)_geoComposedRoute
{
  return self->_geoComposedRoute;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_steps, 0);
  objc_storeStrong((id *)&self->_polyline, 0);
  objc_storeStrong((id *)&self->_geoComposedRoute, 0);
}

@end
