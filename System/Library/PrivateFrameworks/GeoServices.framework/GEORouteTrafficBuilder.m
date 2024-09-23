@implementation GEORouteTrafficBuilder

- (GEORouteTrafficBuilder)init
{
  GEORouteTrafficBuilder *v2;
  GEORouteTrafficBuilder *v3;
  uint64_t v4;
  NSMutableArray *trafficColors;
  uint64_t v6;
  NSMutableArray *trafficOffsets;
  GEORouteTrafficBuilder *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GEORouteTrafficBuilder;
  v2 = -[GEORouteTrafficBuilder init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_trafficDistance = 0.0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = objc_claimAutoreleasedReturnValue();
    trafficColors = v3->_trafficColors;
    v3->_trafficColors = (NSMutableArray *)v4;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = objc_claimAutoreleasedReturnValue();
    trafficOffsets = v3->_trafficOffsets;
    v3->_trafficOffsets = (NSMutableArray *)v6;

    v8 = v3;
  }

  return v3;
}

- (void)buildTrafficForRoute:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "geoWaypointRoute");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    -[GEORouteTrafficBuilder _buildTrafficForRoute:toDistance:](self, "_buildTrafficForRoute:toDistance:", v5, 4294967300.0);

}

- (void)buildTrafficForRoute:(id)a3 etaRoute:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "geoWaypointRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    -[GEORouteTrafficBuilder _buildTrafficForRoute:etaRoute:](self, "_buildTrafficForRoute:etaRoute:", v8, v6);

}

- (void)_buildTrafficForRoute:(id)a3 etaRoute:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  void *v36;
  void *v37;
  uint64_t v38;
  unint64_t v39;
  double v40;
  uint64_t v41;
  unint64_t v42;
  double v43;
  NSMutableArray *trafficColors;
  void *v45;
  NSMutableArray *trafficOffsets;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double v54;
  uint64_t i;
  void *v56;
  uint64_t v57;
  double v58;
  NSMutableArray *v59;
  void *v60;
  NSMutableArray *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  void *v67;
  unint64_t v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  void *v74;
  uint64_t v75;
  void *v76;
  id v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  uint8_t v82[128];
  uint8_t buf[4];
  const char *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  const char *v88;
  __int16 v89;
  double v90;
  uint64_t v91;

  v91 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "geoETAWaypointRoute");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "distance");
  v10 = v9;
  objc_msgSend(v7, "length");
  v74 = v7;
  if (v10 <= floor(v11))
  {
    objc_msgSend(v6, "distance");
    v13 = v12;
    objc_msgSend(v7, "length");
    if (vabdd_f64(v13, floor(v14)) >= 2.22044605e-16)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v6, "distance");
        v72 = v71;
        objc_msgSend(v7, "length");
        *(_DWORD *)buf = 136315906;
        v84 = "route.distance";
        v85 = 2048;
        v86 = v72;
        v87 = 2080;
        v88 = "floor(etaRoute.length)";
        v89 = 2048;
        v90 = floor(v73);
        _os_log_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s = %lf, %s = %lf", buf, 0x2Au);
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        goto LABEL_27;
      *(_WORD *)buf = 0;
      v69 = MEMORY[0x1E0C81028];
      v70 = "Assertion failed: route.distance > floor(etaRoute.length) || fabs(route.distance - floor(etaRoute.length)) <"
            " 2.2204460492503131e-16";
LABEL_37:
      _os_log_fault_impl(&dword_1885A9000, v69, OS_LOG_TYPE_FAULT, v70, buf, 2u);
      goto LABEL_27;
    }
  }
  objc_msgSend(v6, "legs", v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");
  objc_msgSend(v8, "routeLegs");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v16 < v18)
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v69 = MEMORY[0x1E0C81028];
    v70 = "Assertion failed: route.legs.count >= geoETAWaypointRoute.routeLegs.count";
    goto LABEL_37;
  }
  objc_msgSend(v6, "distance");
  v20 = v19;
  objc_msgSend(v7, "length");
  v22 = v20 - v21;
  -[GEORouteTrafficBuilder _buildTrafficForRoute:toDistance:](self, "_buildTrafficForRoute:toDistance:", v6, v22);
  objc_msgSend(v6, "legs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "count");
  objc_msgSend(v8, "routeLegs");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  v27 = 0.0;
  v28 = v24 - v26;
  if (v24 != v26)
  {
    v29 = 0;
    do
    {
      objc_msgSend(v6, "legs");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", v29);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "distance");
      v27 = v27 + v32;

      ++v29;
    }
    while (v28 != v29);
  }
  objc_msgSend(v8, "routeLegs");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "count");

  if (v34)
  {
    v35 = 0;
    v76 = v8;
    v77 = v6;
    v75 = v28;
    while (1)
    {
      objc_msgSend(v8, "routeLegs");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "objectAtIndexedSubscript:", v35);
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = objc_msgSend(v37, "trafficColorsCount");
      if (v38 != objc_msgSend(v37, "trafficColorOffsetsCount"))
        break;
      if (objc_msgSend(v37, "trafficColorsCount"))
      {
        v39 = 0;
        if (v35)
          v40 = v27;
        else
          v40 = v22;
        do
        {
          v41 = *(unsigned int *)(objc_msgSend(v37, "trafficColors") + 4 * v39);
          LODWORD(v42) = *(_DWORD *)(objc_msgSend(v37, "trafficColorOffsets") + 4 * v39);
          v43 = v40 + (double)v42;
          trafficColors = self->_trafficColors;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v41);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](trafficColors, "addObject:", v45);

          trafficOffsets = self->_trafficOffsets;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v43);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableArray addObject:](trafficOffsets, "addObject:", v47);

          ++v39;
        }
        while (v39 < objc_msgSend(v37, "trafficColorsCount"));
      }
      if (!objc_msgSend(v37, "trafficColorsCount"))
      {
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        objc_msgSend(v37, "trafficColorInfos");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "firstObject");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "trafficColorAndOffsets");
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
        if (v51)
        {
          v52 = v51;
          v53 = *(_QWORD *)v79;
          if (v35)
            v54 = v27;
          else
            v54 = v22;
          do
          {
            for (i = 0; i != v52; ++i)
            {
              if (*(_QWORD *)v79 != v53)
                objc_enumerationMutation(v50);
              v56 = *(void **)(*((_QWORD *)&v78 + 1) + 8 * i);
              v57 = objc_msgSend(v56, "color");
              v58 = v54 + (double)objc_msgSend(v56, "offset");
              v59 = self->_trafficColors;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v57);
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](v59, "addObject:", v60);

              v61 = self->_trafficOffsets;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v58);
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableArray addObject:](v61, "addObject:", v62);

            }
            v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v78, v82, 16);
          }
          while (v52);
        }

        v8 = v76;
        v6 = v77;
        v28 = v75;
      }
      objc_msgSend(v6, "legs");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v63, "objectAtIndexedSubscript:", v35 + v28);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v64, "distance");
      v66 = v65;

      v27 = v27 + v66;
      ++v35;
      objc_msgSend(v8, "routeLegs");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      v68 = objc_msgSend(v67, "count");

      if (v35 >= v68)
        goto LABEL_27;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: geoETARouteLeg.trafficColorsCount == geoETARouteLeg.trafficColorOffsetsCount", buf, 2u);
    }

  }
LABEL_27:

}

- (void)_buildTrafficForRoute:(id)a3 toDistance:(double)a4
{
  id v6;
  void *v7;
  double v8;
  BOOL v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  double v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  double v25;
  NSMutableArray *v26;
  void *v27;
  NSMutableArray *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t i;
  void *v42;
  uint64_t v43;
  double v44;
  NSMutableArray *trafficColors;
  void *v46;
  NSMutableArray *trafficOffsets;
  void *v48;
  NSObject *v49;
  int v50;
  int v51;
  void *v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  int v60;
  __int16 v61;
  int v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "geoWaypointRoute");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "distance");
  v9 = v8 < a4;
  v10 = a4;
  if (v9)
    objc_msgSend(v6, "distance", a4);
  self->_trafficDistance = v10;
  -[NSMutableArray removeAllObjects](self->_trafficColors, "removeAllObjects");
  -[NSMutableArray removeAllObjects](self->_trafficOffsets, "removeAllObjects");
  objc_msgSend(v6, "legs");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");
  objc_msgSend(v7, "routeLegs");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v12 == v14)
  {
    objc_msgSend(v6, "legs");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "count");

    if (v16)
    {
      v17 = 0;
      v18 = 0.0;
      while (1)
      {
        objc_msgSend(v7, "routeLegs");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectAtIndexedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "trafficColorsCount");
        if (v21 != objc_msgSend(v20, "trafficColorOffsetsCount"))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: geoRouteLeg.trafficColorsCount == geoRouteLeg.trafficColorOffsetsCount", buf, 2u);
          }
          GEOGetGEORouteTrafficBuilderLog();
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
          {
            v50 = objc_msgSend(v20, "trafficColorsCount");
            v51 = objc_msgSend(v20, "trafficColorOffsetsCount");
            *(_DWORD *)buf = 67109376;
            v60 = v50;
            v61 = 1024;
            v62 = v51;
            _os_log_impl(&dword_1885A9000, v49, OS_LOG_TYPE_ERROR, "GEORoute trafficColorsCount (%d) not equal to trafficColorOffsetsCount (%d). This is a server error.", buf, 0xEu);
          }

          self->_trafficDistance = (double)objc_msgSend(v7, "distanceMeters");
          goto LABEL_25;
        }
        if (objc_msgSend(v20, "trafficColorsCount"))
          break;
LABEL_12:
        if (!objc_msgSend(v20, "trafficColorsCount"))
        {
          v52 = v7;
          v53 = v6;
          v56 = 0u;
          v57 = 0u;
          v54 = 0u;
          v55 = 0u;
          objc_msgSend(v20, "trafficColorInfos");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firstObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "trafficColorAndOffsets");
          v37 = (void *)objc_claimAutoreleasedReturnValue();

          v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
          if (v38)
          {
            v39 = v38;
            v40 = *(_QWORD *)v55;
            while (2)
            {
              for (i = 0; i != v39; ++i)
              {
                if (*(_QWORD *)v55 != v40)
                  objc_enumerationMutation(v37);
                v42 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
                v43 = objc_msgSend(v42, "color");
                v44 = (double)objc_msgSend(v42, "offset");
                if (v44 >= a4)
                {

                  v7 = v52;
                  v6 = v53;
                  goto LABEL_25;
                }
                trafficColors = self->_trafficColors;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v43);
                v46 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray addObject:](trafficColors, "addObject:", v46);

                trafficOffsets = self->_trafficOffsets;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v44);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                -[NSMutableArray addObject:](trafficOffsets, "addObject:", v48);

              }
              v39 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
              if (v39)
                continue;
              break;
            }
          }

          v7 = v52;
          v6 = v53;
        }
        objc_msgSend(v6, "legs");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndexedSubscript:", v17);
        v31 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v31, "distance");
        v18 = v18 + v32;

        ++v17;
        objc_msgSend(v6, "legs");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");

        if (v17 >= v34)
          goto LABEL_26;
      }
      v22 = 0;
      while (1)
      {
        v23 = *(unsigned int *)(objc_msgSend(v20, "trafficColors") + 4 * v22);
        LODWORD(v24) = *(_DWORD *)(objc_msgSend(v20, "trafficColorOffsets") + 4 * v22);
        v25 = v18 + (double)v24;
        if (v25 >= a4)
          break;
        v26 = self->_trafficColors;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v26, "addObject:", v27);

        v28 = self->_trafficOffsets;
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v25);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableArray addObject:](v28, "addObject:", v29);

        if (++v22 >= (unint64_t)objc_msgSend(v20, "trafficColorsCount"))
          goto LABEL_12;
      }
LABEL_25:

    }
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: route.legs.count == geoWaypointRoute.routeLegs.count", buf, 2u);
    }
    self->_trafficDistance = (double)objc_msgSend(v7, "distanceMeters");
  }
LABEL_26:

}

- (void)addTrafficFromRoute:(id)a3 withStepRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;

  length = a4.length;
  location = a4.location;
  v11 = a3;
  if (objc_msgSend(v11, "routeType"))
    v7 = self->_trafficDistance + 0.0;
  else
    v7 = 0.0;
  objc_msgSend(v11, "distanceFromStepIndex:toStepIndex:", 0, location);
  v9 = v7 + v8;
  objc_msgSend(v11, "distanceFromStepIndex:toStepIndex:", 0, location + length);
  -[GEORouteTrafficBuilder addTrafficFromRoute:from:to:](self, "addTrafficFromRoute:from:to:", v11, v9, (v7 + v10));

}

- (void)addTrafficFromRoute:(id)a3 from:(unsigned int)a4 to:(unsigned int)a5
{
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  NSMutableArray *trafficColors;
  void *v16;
  NSMutableArray *trafficOffsets;
  void *v18;
  unint64_t v19;
  unsigned int *v20;
  unsigned int *v21;
  unsigned int v22;
  double v23;
  NSMutableArray *v24;
  unsigned int v25;
  void *v26;
  NSMutableArray *v27;
  void *v28;
  id v29;

  v29 = a3;
  v8 = objc_msgSend(v29, "trafficColorOffsets");
  v9 = objc_msgSend(v29, "trafficColorOffsetsCount");
  v10 = objc_msgSend(v29, "trafficColors");
  v11 = objc_msgSend(v29, "trafficColorsCount");
  v12 = 0;
  if (v9 >= v11)
    v13 = v11;
  else
    v13 = v9;
  if (v13)
  {
    while (*(_DWORD *)(v8 + 4 * v12) < a4)
    {
      if (v13 == ++v12)
      {
        v12 = v13;
        goto LABEL_15;
      }
    }
  }
  if (v12 < v13)
  {
    v14 = v12;
    while (*(_DWORD *)(v8 + 4 * v14) < a5)
    {
      if (v13 == ++v14)
        goto LABEL_14;
    }
    v13 = v14;
    if (!v12)
      goto LABEL_18;
LABEL_15:
    if (v12 - 1 < v11)
    {
      trafficColors = self->_trafficColors;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(v10 + 4 * (v12 - 1)));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](trafficColors, "addObject:", v16);

      trafficOffsets = self->_trafficOffsets;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_trafficDistance);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](trafficOffsets, "addObject:", v18);

    }
    goto LABEL_18;
  }
  v13 = v12;
LABEL_14:
  if (v12)
    goto LABEL_15;
LABEL_18:
  v19 = v13 - v12;
  if (v13 > v12)
  {
    v20 = (unsigned int *)(v10 + 4 * v12);
    v21 = (unsigned int *)(v8 + 4 * v12);
    do
    {
      v22 = *v21++;
      v23 = self->_trafficDistance + (double)v22 - (double)a4;
      v24 = self->_trafficColors;
      v25 = *v20++;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v24, "addObject:", v26);

      v27 = self->_trafficOffsets;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v23);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](v27, "addObject:", v28);

      --v19;
    }
    while (v19);
  }
  self->_trafficDistance = self->_trafficDistance + (double)(a5 - a4);

}

- (void)addTrafficFromETARoute:(id)a3
{
  unsigned int *v4;
  unsigned int *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unsigned int v9;
  double v10;
  NSMutableArray *trafficColors;
  unsigned int v12;
  void *v13;
  NSMutableArray *trafficOffsets;
  void *v15;
  id v16;

  v16 = a3;
  v4 = (unsigned int *)objc_msgSend(v16, "trafficColorOffsets");
  v5 = (unsigned int *)objc_msgSend(v16, "trafficColors");
  v6 = objc_msgSend(v16, "trafficColorOffsetsCount");
  v7 = objc_msgSend(v16, "trafficColorsCount");
  if (v6 >= v7)
    v8 = v7;
  else
    v8 = v6;
  for (; v8; --v8)
  {
    v9 = *v4++;
    v10 = self->_trafficDistance + (double)v9;
    trafficColors = self->_trafficColors;
    v12 = *v5++;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](trafficColors, "addObject:", v13);

    trafficOffsets = self->_trafficOffsets;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray addObject:](trafficOffsets, "addObject:", v15);

  }
}

- (void)_removeDuplicateTraffic
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  int v8;
  void *v9;
  int v10;
  uint64_t v11;
  id v12;

  v3 = -[NSMutableArray count](self->_trafficOffsets, "count");
  if (v3 >= 2)
  {
    v4 = v3;
    objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    for (i = 1; i != v4; ++i)
    {
      -[NSMutableArray objectAtIndexedSubscript:](self->_trafficColors, "objectAtIndexedSubscript:", i);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "unsignedIntegerValue");

      -[NSMutableArray objectAtIndexedSubscript:](self->_trafficColors, "objectAtIndexedSubscript:", v5);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "unsignedIntegerValue");

      v11 = i;
      if (v8 == v10)
      {
        objc_msgSend(v12, "addIndex:", i);
        v11 = v5;
      }
      v5 = v11;
    }
    -[NSMutableArray removeObjectsAtIndexes:](self->_trafficColors, "removeObjectsAtIndexes:", v12);
    -[NSMutableArray removeObjectsAtIndexes:](self->_trafficOffsets, "removeObjectsAtIndexes:", v12);

  }
}

- (void)copyTrafficToRoute:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSMutableArray count](self->_trafficOffsets, "count"))
  {
    -[GEORouteTrafficBuilder _removeDuplicateTraffic](self, "_removeDuplicateTraffic");
    objc_msgSend(v4, "clearTrafficColors");
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = self->_trafficColors;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v20;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v20 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(v4, "addTrafficColor:", objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v9++), "unsignedIntegerValue"));
        }
        while (v7 != v9);
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      }
      while (v7);
    }

    objc_msgSend(v4, "clearTrafficColorOffsets");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v10 = self->_trafficOffsets;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v16;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v4, "addTrafficColorOffset:", objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v14++), "unsignedIntegerValue", (_QWORD)v15));
        }
        while (v12 != v14);
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      }
      while (v12);
    }

  }
  else
  {
    objc_msgSend(v4, "clearTrafficColorOffsets");
    objc_msgSend(v4, "clearTrafficColors");
  }

}

- (id)trafficColors
{
  -[GEORouteTrafficBuilder _removeDuplicateTraffic](self, "_removeDuplicateTraffic");
  return (id)-[NSMutableArray copy](self->_trafficColors, "copy");
}

- (id)trafficOffsets
{
  -[GEORouteTrafficBuilder _removeDuplicateTraffic](self, "_removeDuplicateTraffic");
  return (id)-[NSMutableArray copy](self->_trafficOffsets, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trafficOffsets, 0);
  objc_storeStrong((id *)&self->_trafficColors, 0);
}

@end
