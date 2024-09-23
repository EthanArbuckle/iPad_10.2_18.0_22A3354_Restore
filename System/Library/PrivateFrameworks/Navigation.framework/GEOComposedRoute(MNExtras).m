@implementation GEOComposedRoute(MNExtras)

- (uint64_t)findDivergenceAndConvergenceWithRoute:()MNExtras outDivergenceCoordinate:outConvergenceCoordinate:
{
  return objc_msgSend(a1, "findDivergenceAndConvergenceWithRoute:distanceInMeters:outDivergenceCoordinate:outConvergenceCoordinate:", 10.0);
}

- (void)findDivergenceAndConvergenceWithRoute:()MNExtras distanceInMeters:outDivergenceCoordinate:outConvergenceCoordinate:
{
  unsigned int v10;
  unsigned int v11;
  void *v12;
  void *v13;
  double v14;
  id v15;

  v15 = a4;
  v10 = objc_msgSend(a1, "pointCount");
  v11 = objc_msgSend(v15, "pointCount");
  if (v10 >= 2 && v11 >= 2)
  {
    objc_msgSend(a1, "_mapPoints");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_mapPoints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "pointAt:", 0);
    GEOMapPointsPerMeterAtLatitude();
    objc_msgSend(MEMORY[0x1E0D26FA8], "_findDivergenceAndConvergence:pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:", objc_msgSend(v12, "mapPoints"), objc_msgSend(v12, "count"), objc_msgSend(v13, "mapPoints"), objc_msgSend(v13, "count"), a5, 0, v14 * a2, v14 * a2, a6, 0);

  }
}

- (id)divergenceAndConvergenceWithRoute:()MNExtras
{
  objc_msgSend(a1, "divergenceAndConvergenceWithRoute:outOtherRoutePoints:", a3, 0);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)divergenceAndConvergenceWithRoute:()MNExtras outOtherRoutePoints:
{
  id v6;
  unsigned int v7;
  unsigned int v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  id v14;

  v6 = a3;
  v7 = objc_msgSend(a1, "pointCount");
  v8 = objc_msgSend(v6, "pointCount");
  v9 = 0;
  if (v7 >= 2 && v8 >= 2)
  {
    objc_msgSend(a1, "_mapPoints");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_mapPoints");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "pointAt:", 0);
    GEOMapPointsPerMeterAtLatitude();
    v14 = 0;
    objc_msgSend(MEMORY[0x1E0D26FA8], "findDivergenceAndConvergence:pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outCoordinatesA:outCoordinatesB:", objc_msgSend(v10, "mapPoints"), objc_msgSend(v10, "count"), objc_msgSend(v11, "mapPoints"), objc_msgSend(v11, "count"), &v14, a4, v12 * 10.0, v12);
    v9 = v14;

  }
  return v9;
}

+ (uint64_t)pointsDiverge:()MNExtras pointCount:otherPoints:pointCount:outCoordinateA:outCoordinateB:
{
  return objc_msgSend(a1, "_pointsDiverge:pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:", 0.01);
}

+ (uint64_t)_pointsDiverge:()MNExtras pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:
{
  uint64_t v9;
  double v17;
  unint64_t v18;
  unint64_t v19;
  int v22;
  char v23;
  double v24;
  double *v25;
  double *v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  double *v30;
  double *v31;
  double *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  unint64_t v48;
  double v49;
  float v50;
  int v51;
  double *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  unint64_t v58;
  double v59;
  float v60;
  int v61;

  v9 = 0;
  if (a5 < 2 || a7 < 2)
    return v9;
  v17 = a2 * a2;
  v18 = objc_msgSend(a1, "_startIndexForPoints:withPoints:pointCount:toleranceSquared:", *a6, a6[1], a2 * a2);
  v19 = objc_msgSend(a1, "_startIndexForPoints:withPoints:pointCount:toleranceSquared:", a6, a7, *a4, a4[1], v17);
  if (v18 == 0x7FFFFFFFFFFFFFFFLL && v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a8)
      *(_QWORD *)a8 = 0;
    if (a9)
      goto LABEL_14;
    return 1;
  }
  if (v18 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v19 && v19 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_22;
    if (v18)
    {
      v19 = 0;
      v22 = 0;
      goto LABEL_23;
    }
    goto LABEL_21;
  }
  if (!v19 || v19 == 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_21:
    v18 = 0;
    v19 = 1;
    goto LABEL_22;
  }
  v18 = 0;
LABEL_22:
  v22 = 1;
LABEL_23:
  v9 = 0;
  if (v18 >= a5 || v19 >= a7)
    return v9;
  v23 = 0;
  v24 = 0.0;
  while (1)
  {
    if ((v22 & 1) != 0)
      v25 = a4;
    else
      v25 = a6;
    if ((v22 & 1) != 0)
      v26 = a6;
    else
      v26 = a4;
    if ((v22 & 1) != 0)
      v27 = v19;
    else
      v27 = v18;
    if ((v22 & 1) != 0)
      v28 = v18;
    else
      v28 = v19;
    v29 = v27 - 1;
    if (!v27)
      v29 = 0;
    v30 = &v26[2 * v29];
    v31 = &v26[2 * v27];
    v32 = &v25[2 * v28];
    v33 = *v30;
    v34 = v30[1];
    v35 = *v31 - *v30;
    v36 = v31[1] - v34;
    v37 = v35 * v35 + 0.0 + v36 * v36;
    v38 = *v32;
    if (v37 <= 1.0e-15)
    {
      v39 = v32[1];
      v40 = 0.0;
    }
    else
    {
      v39 = v32[1];
      v40 = ((v38 - v33) * v35 + 0.0 + (v39 - v34) * v36) / v37;
      if (v40 < 0.0)
        v40 = 0.0;
      if (v40 > 1.0)
        v40 = 1.0;
    }
    v41 = (v38 - (v33 + v35 * v40)) * (v38 - (v33 + v35 * v40))
        + 0.0
        + (v39 - (v34 + v36 * v40)) * (v39 - (v34 + v36 * v40));
    if (v41 >= v17)
      break;
    if (v41 <= 0.01)
      goto LABEL_55;
    if (v24 > 0.0)
    {
      if (v41 <= v24)
      {
LABEL_55:
        v24 = 0.0;
        if ((v22 & 1) != 0)
          v18 = v28 + 1;
        else
          v19 = v28 + 1;
        v23 = 0;
        v22 = (v22 & 1) != 0;
        goto LABEL_64;
      }
      v23 = 0;
LABEL_59:
      if ((v22 & 1) != 0)
        v19 = v27 + 1;
      else
        v18 = v27 + 1;
      v22 ^= 1u;
      v24 = 0.0;
      goto LABEL_64;
    }
    v23 = 0;
    v22 ^= 1u;
    v24 = v41;
LABEL_64:
    v9 = 0;
    if (v18 >= a5 || v19 >= a7)
      return v9;
  }
  if (v24 > 0.0)
    goto LABEL_59;
  if ((v23 & 1) == 0)
  {
    v22 ^= 1u;
    v23 = 1;
    goto LABEL_64;
  }
  if (a8)
  {
    if (v18)
    {
      v42 = &a4[2 * v18];
      v43 = *(v42 - 2);
      v44 = *(v42 - 1);
      v45 = *v42 - v43;
      v46 = v42[1] - v44;
      v47 = v45 * v45 + 0.0 + v46 * v46;
      if (v47 <= 1.0e-15)
      {
        v51 = v18 - 1;
        v50 = 0.0;
      }
      else
      {
        v48 = v19 - 1;
        if (!v19)
          v48 = 0;
        v49 = ((a6[2 * v48] - v43) * v45 + 0.0 + (a6[2 * v48 + 1] - v44) * v46) / v47;
        if (v49 < 0.0)
          v49 = 0.0;
        if (v49 > 1.0)
          v49 = 1.0;
        v50 = v49;
        v51 = v18 - 1;
        if (v50 >= 1.0)
        {
          v51 += vcvtms_u32_f32(v50);
          v50 = v50 - (float)floorf(v50);
        }
      }
      *(_DWORD *)a8 = v51;
      *(float *)(a8 + 4) = v50;
    }
    else
    {
      *(_QWORD *)a8 = 0;
    }
  }
  if (a9)
  {
    if (v19)
    {
      v52 = &a6[2 * v19];
      v53 = *(v52 - 2);
      v54 = *(v52 - 1);
      v55 = *v52 - v53;
      v56 = v52[1] - v54;
      v57 = v55 * v55 + 0.0 + v56 * v56;
      if (v57 <= 1.0e-15)
      {
        v61 = v19 - 1;
        v60 = 0.0;
      }
      else
      {
        v58 = v18 - 1;
        if (!v18)
          v58 = 0;
        v59 = ((a4[2 * v58] - v53) * v55 + 0.0 + (a4[2 * v58 + 1] - v54) * v56) / v57;
        if (v59 < 0.0)
          v59 = 0.0;
        if (v59 > 1.0)
          v59 = 1.0;
        v60 = v59;
        v61 = v19 - 1;
        if (v60 >= 1.0)
        {
          v61 += vcvtms_u32_f32(v60);
          v60 = v60 - (float)floorf(v60);
        }
      }
      *(_DWORD *)a9 = v61;
      *(float *)(a9 + 4) = v60;
      return 1;
    }
LABEL_14:
    *(_QWORD *)a9 = 0;
  }
  return 1;
}

+ (uint64_t)pointsConverge:()MNExtras pointCount:otherPoints:pointCount:outCoordinateA:outCoordinateB:
{
  return objc_msgSend(a1, "_pointsConverge:pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:", 0.01);
}

+ (uint64_t)_pointsConverge:()MNExtras pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:
{
  uint64_t v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  id v16;
  id v17;

  v16 = 0;
  v17 = 0;
  v10 = objc_msgSend(a1, "_pointsConverge:pointCount:otherPoints:pointCount:tolerance:outCoordinatesA:outCoordinatesB:", a3, a4, a5, a6, &v17, &v16);
  v11 = v17;
  v12 = v16;
  if (!a7)
  {
LABEL_4:
    if (!a8)
      goto LABEL_10;
    goto LABEL_5;
  }
  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *a7 = objc_msgSend(v13, "routeCoordinate");

    goto LABEL_4;
  }
  *a7 = *MEMORY[0x1E0D26A38];
  if (!a8)
    goto LABEL_10;
LABEL_5:
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v12, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *a8 = objc_msgSend(v14, "routeCoordinate");

  }
  else
  {
    *a8 = *MEMORY[0x1E0D26A38];
  }
LABEL_10:

  return v10;
}

+ (uint64_t)_pointsConverge:()MNExtras pointCount:otherPoints:pointCount:tolerance:outCoordinatesA:outCoordinatesB:
{
  char v9;
  __int128 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
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
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  BOOL v54;
  double v55;
  double v56;
  double v57;
  double v58;
  unsigned int v59;
  unsigned int v60;
  float v61;
  unsigned int v62;
  float v63;
  unsigned int v64;
  float v65;
  float v66;
  uint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  _BOOL4 v71;
  NSObject *v72;
  NSObject *v73;
  __int128 v75;
  void *v78;
  void *v79;
  void *v80;
  id v81;
  unint64_t v82;
  id v83;
  void *v84;
  __int128 v85;
  double v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint8_t v91[128];
  uint8_t buf[4];
  const char *v93;
  __int16 v94;
  const char *v95;
  __int16 v96;
  int v97;
  __int16 v98;
  const char *v99;
  uint64_t v100;

  v9 = 0;
  v100 = *MEMORY[0x1E0C80C00];
  if (a5 >= 2 && a7 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_addPointsToArray:forMapPoints:pointCount:isPolylineA:", v80, a6, a7, 0);
    objc_msgSend(a1, "_addPointsToArray:forMapPoints:pointCount:isPolylineA:", v80, a4, a5, 1);
    objc_msgSend(v80, "sortUsingComparator:", &__block_literal_global_25);
    if (a8)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      *((_QWORD *)&v85 + 1) = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      *((_QWORD *)&v85 + 1) = 0;
    }
    if (a9)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      *(_QWORD *)&v85 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      *(_QWORD *)&v85 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v79 = (void *)objc_claimAutoreleasedReturnValue();
    v82 = 0;
    v9 = 0;
    v86 = a2 * a2;
    *(_QWORD *)&v16 = 136315906;
    v75 = v16;
    while (v82 < objc_msgSend(v80, "count", v75))
    {
      objc_msgSend(v80, "objectAtIndexedSubscript:");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isPolylineA"))
        v18 = v78;
      else
        v18 = v79;
      v83 = v18;
      if (objc_msgSend(v17, "isPolylineA"))
        v19 = v79;
      else
        v19 = v78;
      v81 = v19;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "index"));
      v84 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isStartOfSegment"))
      {
        objc_msgSend(v83, "objectForKeyedSubscript:", v84);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v20 == 0;

        if (!v21)
        {
          GEOFindOrCreateLog();
          v72 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v75;
            v93 = "+[GEOComposedRoute(MNExtras) _pointsConverge:pointCount:otherPoints:pointCount:tolerance:outCoordinate"
                  "sA:outCoordinatesB:]";
            v94 = 2080;
            v95 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEOComposedRoute+MNExtras.mm";
            v96 = 1024;
            v97 = 569;
            v98 = 2080;
            v99 = "currentPolylineSegments[key] == nil";
            _os_log_impl(&dword_1B0AD7000, v72, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
          }

        }
        objc_msgSend(v83, "setObject:forKey:", v17, v84);
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        objc_msgSend(v81, "allValues");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
        if (v23)
        {
          v24 = *(_QWORD *)v88;
          while (2)
          {
            for (i = 0; i != v23; ++i)
            {
              if (*(_QWORD *)v88 != v24)
                objc_enumerationMutation(v22);
              v26 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * i);
              if (objc_msgSend(v17, "isPolylineA"))
                v27 = v17;
              else
                v27 = v26;
              v28 = v27;
              if (objc_msgSend(v17, "isPolylineA"))
                v29 = v26;
              else
                v29 = v17;
              v30 = v29;
              objc_msgSend(v28, "segment");
              v32 = v31;
              v34 = v33;
              v36 = v35;
              v38 = v37;
              objc_msgSend(v30, "segment");
              v43 = ((v32 - v39) * v41 + 0.0 + (v34 - v40) * v42) / (v41 * v41 + 0.0 + v42 * v42);
              if (v43 < 0.0)
                v43 = 0.0;
              if (v43 <= 1.0)
                v44 = v43;
              else
                v44 = 1.0;
              v45 = v40 + v42 - v40;
              v46 = v39 + v41 - v39;
              v47 = (v39 + v46 * v44 - v32) * (v39 + v46 * v44 - v32)
                  + 0.0
                  + (v40 + v45 * v44 - v34) * (v40 + v45 * v44 - v34);
              v48 = ((v39 - v32) * v36 + 0.0 + (v40 - v34) * v38) / (v36 * v36 + 0.0 + v38 * v38);
              if (v48 < 0.0)
                v48 = 0.0;
              if (v48 <= 1.0)
                v49 = v48;
              else
                v49 = 1.0;
              v50 = v34 + v38 - v34;
              v51 = v34 + v50 * v49 - v40;
              v52 = v32 + v36 - v32;
              v53 = (v32 + v52 * v49 - v39) * (v32 + v52 * v49 - v39) + 0.0 + v51 * v51;
              v54 = v47 <= v86 || v53 <= v86;
              if (v54
                && (fabs(v49) >= 0.000001 || fabs(v44 + -1.0) >= 0.000001)
                && (fabs(v49 + -1.0) >= 0.000001 || fabs(v44) >= 0.000001))
              {
                v55 = 1.0 / sqrt(v52 * v52 + 0.0 + v50 * v50);
                v56 = v52 * v55;
                v57 = v50 * v55;
                v58 = 1.0 / sqrt(v46 * v46 + 0.0 + v45 * v45);
                if (v56 * (v46 * v58) + 0.0 + v57 * (v45 * v58) >= 0.99)
                {
                  if (v85 == 0)
                  {

                    v9 = 1;
                    goto LABEL_66;
                  }
                  v59 = objc_msgSend(v28, "index");
                  v60 = v59;
                  v61 = v49;
                  if (v61 >= 1.0)
                  {
                    v60 = v59 + vcvtms_u32_f32(v61);
                    v61 = v61 - (float)floorf(v61);
                  }
                  v62 = objc_msgSend(v30, "index");
                  v63 = v44;
                  v64 = v62 + vcvtms_u32_f32(v63);
                  v65 = v63 - (float)floorf(v63);
                  if (v63 >= 1.0)
                    v66 = v65;
                  else
                    v66 = v44;
                  if (v63 >= 1.0)
                    v67 = v64;
                  else
                    v67 = v62;
                  +[MNRouteCoordinateWithType convergenceCoordinate:](MNRouteCoordinateWithType, "convergenceCoordinate:", v60 | ((unint64_t)LODWORD(v61) << 32));
                  v68 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*((id *)&v85 + 1), "addObject:", v68);

                  +[MNRouteCoordinateWithType convergenceCoordinate:](MNRouteCoordinateWithType, "convergenceCoordinate:", v67 | ((unint64_t)LODWORD(v66) << 32));
                  v69 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend((id)v85, "addObject:", v69);

                  v9 = 1;
                }
              }

            }
            v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v87, v91, 16);
            if (v23)
              continue;
            break;
          }
        }
LABEL_66:

      }
      else
      {
        objc_msgSend(v83, "objectForKeyedSubscript:", v84);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = v70 == 0;

        if (v71)
        {
          GEOFindOrCreateLog();
          v73 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v73, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v75;
            v93 = "+[GEOComposedRoute(MNExtras) _pointsConverge:pointCount:otherPoints:pointCount:tolerance:outCoordinate"
                  "sA:outCoordinatesB:]";
            v94 = 2080;
            v95 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEOComposedRoute+MNExtras.mm";
            v96 = 1024;
            v97 = 608;
            v98 = 2080;
            v99 = "currentPolylineSegments[key] != nil";
            _os_log_impl(&dword_1B0AD7000, v73, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s)", buf, 0x26u);
          }

        }
        objc_msgSend(v83, "removeObjectForKey:", v84);
      }

      ++v82;
    }
    if ((v9 & 1) != 0)
    {
      if (a8)
      {
        objc_msgSend(*((id *)&v85 + 1), "sortUsingComparator:", &__block_literal_global_96);
        *a8 = objc_retainAutorelease(*((id *)&v85 + 1));
      }
      if (a9)
      {
        objc_msgSend((id)v85, "sortUsingComparator:", &__block_literal_global_96);
        *a9 = objc_retainAutorelease((id)v85);
      }
    }

  }
  return v9 & 1;
}

+ (void)findDivergenceAndConvergence:()MNExtras pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outCoordinatesA:outCoordinatesB:
{
  int v12;
  id v13;
  id v14;
  uint64_t v15;
  unint64_t v16;
  float *v17;
  uint64_t v18;
  float v19;
  uint64_t v20;
  float v21;
  void *v22;
  void *v23;
  float v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v39;
  id v40;
  uint64_t v42;
  id v43;
  id v44;
  _BYTE buf[12];
  __int16 v46;
  const char *v47;
  __int16 v48;
  int v49;
  __int16 v50;
  const char *v51;
  __int16 v52;
  void *v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  if (a9)
    *a9 = 0;
  if (a10)
    *a10 = 0;
  if (a6 >= 2 && a8 >= 2)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v40 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v39 = (id)objc_claimAutoreleasedReturnValue();
    v43 = 0;
    v44 = 0;
    v12 = objc_msgSend(a1, "_pointsConverge:pointCount:otherPoints:pointCount:tolerance:outCoordinatesA:outCoordinatesB:", a5, a6, a7, a8, &v44, &v43, a3);
    v13 = v44;
    v14 = v43;
    v15 = objc_msgSend(v13, "count");
    if (v15 != objc_msgSend(v14, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Mismatched number of convergence points"));
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      GEOFindOrCreateLog();
      v32 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136316162;
        *(_QWORD *)&buf[4] = "+[GEOComposedRoute(MNExtras) findDivergenceAndConvergence:pointCount:otherPoints:pointCount"
                             ":divergenceTolerance:convergenceTolerance:outCoordinatesA:outCoordinatesB:]";
        v46 = 2080;
        v47 = "/Library/Caches/com.apple.xbs/Sources/Navigation/Extras/GEOComposedRoute+MNExtras.mm";
        v48 = 1024;
        v49 = 663;
        v50 = 2080;
        v51 = "convergenceCoordinatesA.count == convergenceCoordinatesB.count";
        v52 = 2112;
        v53 = v31;
        _os_log_impl(&dword_1B0AD7000, v32, OS_LOG_TYPE_ERROR, "*** Assertion failure in %s, %s:%d: (%s) %@", buf, 0x30u);
      }

    }
    if (v12)
    {
      v16 = 0;
      v17 = (float *)MEMORY[0x1E0D26A38];
      LODWORD(v18) = *MEMORY[0x1E0D26A38];
      v19 = *(float *)(MEMORY[0x1E0D26A38] + 4);
      LODWORD(v20) = *MEMORY[0x1E0D26A38];
      v21 = v19;
      while (1)
      {
        if (v16 >= objc_msgSend(v13, "count"))
        {
LABEL_26:
          if (a9)
            *a9 = objc_retainAutorelease(v40);
          if (a10)
            *a10 = objc_retainAutorelease(v39);
          break;
        }
        objc_msgSend(v13, "objectAtIndexedSubscript:", v16);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectAtIndexedSubscript:", v16);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if ((_DWORD)v20 != *(_DWORD *)v17 || (v24 = *(float *)&v20, vabds_f32(v21, v17[1]) >= 0.00000011921))
        {
          v25 = objc_msgSend(v22, "routeCoordinate");
          if (v20 > v25 || (_DWORD)v20 == (_DWORD)v25 && v21 >= *((float *)&v25 + 1))
            goto LABEL_24;
          v24 = *v17;
        }
        if ((_DWORD)v18 == LODWORD(v24) && vabds_f32(v19, v17[1]) < 0.00000011921
          || (v26 = objc_msgSend(v23, "routeCoordinate"), v18 <= v26)
          && ((_DWORD)v18 != (_DWORD)v26 || v19 < *((float *)&v26 + 1)))
        {
          objc_msgSend(v40, "addObject:", v22);
          objc_msgSend(v39, "addObject:", v23);
          v27 = objc_msgSend(v22, "routeCoordinate");
          v28 = objc_msgSend(v23, "routeCoordinate");
          *(_QWORD *)buf = *(_QWORD *)v17;
          v42 = *(_QWORD *)buf;
          if ((objc_msgSend(a1, "_pointsDiverge:pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:", a5 + 16 * v27, a6 - v27, a7 + 16 * v28, a8 - v28, buf, &v42, a2) & 1) == 0)
          {

            goto LABEL_26;
          }
          *(_DWORD *)buf += v27;
          LODWORD(v42) = v42 + v28;
          +[MNRouteCoordinateWithType divergenceCoordinate:](MNRouteCoordinateWithType, "divergenceCoordinate:", *(_QWORD *)buf);
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          +[MNRouteCoordinateWithType divergenceCoordinate:](MNRouteCoordinateWithType, "divergenceCoordinate:", v42);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "addObject:", v29);
          objc_msgSend(v39, "addObject:", v30);
          v20 = objc_msgSend(v29, "routeCoordinate");
          v18 = objc_msgSend(v30, "routeCoordinate");

          v21 = *((float *)&v20 + 1);
          v19 = *((float *)&v18 + 1);
        }
LABEL_24:

        ++v16;
      }
    }

  }
}

+ (void)findDivergenceAndConvergence:()MNExtras pointCount:otherCoordinates:pointCount:distanceInMeters:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:
{
  unint64_t v11;
  unint64_t v15;
  _MNMapPointsArray *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v27;
  double v28;
  _MNMapPointsArray *v29;

  if (a5 >= 2)
  {
    v11 = a7;
    if (a7 >= 2)
    {
      v15 = a5;
      v29 = -[_MNMapPointsArray initWithCapacity:]([_MNMapPointsArray alloc], "initWithCapacity:", a5);
      v16 = -[_MNMapPointsArray initWithCapacity:]([_MNMapPointsArray alloc], "initWithCapacity:", v11);
      v17 = 0;
      do
      {
        GEOMapPointForCoordinate();
        v19 = v18;
        v21 = v20;
        v22 = -[_MNMapPointsArray mapPoints](v29, "mapPoints") + v17;
        v22->var0 = v19;
        v22->var1 = v21;
        v17 += 16;
        --v15;
      }
      while (v15);
      do
      {
        GEOMapPointForCoordinate();
        v24 = v23;
        v26 = v25;
        v27 = -[_MNMapPointsArray mapPoints](v16, "mapPoints") + v15;
        v27->var0 = v24;
        v27->var1 = v26;
        v15 += 16;
        --v11;
      }
      while (v11);
      GEOMapPointsPerMeterAtLatitude();
      objc_msgSend(MEMORY[0x1E0D26FA8], "_findDivergenceAndConvergence:pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:", -[_MNMapPointsArray mapPoints](v29, "mapPoints"), -[_MNMapPointsArray count](v29, "count"), -[_MNMapPointsArray mapPoints](v16, "mapPoints"), -[_MNMapPointsArray count](v16, "count"), a8, a9, v28 * a1, v28 * a1, a10, a11);

    }
  }
}

+ (uint64_t)findDivergenceAndConvergence:()MNExtras pointCount:otherPoints:pointCount:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:
{
  return objc_msgSend(a1, "_findDivergenceAndConvergence:pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:", 0.01, 0.01);
}

+ (void)_findDivergenceAndConvergence:()MNExtras pointCount:otherPoints:pointCount:divergenceTolerance:convergenceTolerance:outDivergenceCoordinateA:outDivergenceCoordinateB:outConvergenceCoordinateA:outConvergenceCoordinateB:
{
  void *v19;
  unint64_t *v20;
  unsigned int v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;

  v19 = result;
  v20 = (unint64_t *)MEMORY[0x1E0D26A38];
  if (a9)
    *a9 = *MEMORY[0x1E0D26A38];
  if (a10)
    *a10 = *v20;
  if (a11)
    *a11 = *v20;
  if (a12)
    *a12 = *v20;
  if (a6 >= 2 && a8 >= 2)
  {
    v27 = 0xBF80000000000000;
    v28 = 0xBF80000000000000;
    result = (void *)objc_msgSend(result, "_pointsDiverge:pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:", a5, a6, a7, a8, &v28, &v27);
    if ((_DWORD)result)
    {
      if (a9)
        *a9 = v28;
      v21 = v27;
      if (a10)
        *a10 = v27;
      v22 = v28 + 1;
      v23 = a6 - v22;
      if (a6 > v22)
      {
        v24 = v21 + 1;
        if (a8 > v24)
        {
          v25 = 0xBF80000000000000;
          v26 = 0xBF80000000000000;
          result = (void *)objc_msgSend(v19, "_pointsConverge:pointCount:otherPoints:pointCount:tolerance:outCoordinateA:outCoordinateB:", a5 + 16 * v22, v23, a7 + 16 * v24, a8 - v24, &v26, &v25, a3);
          if ((_DWORD)result)
          {
            LODWORD(v26) = v26 + v22;
            LODWORD(v25) = v25 + v24;
            if (a11)
              *a11 = v26;
            if (a12)
              *a12 = v25;
          }
        }
      }
    }
  }
  return result;
}

- (_MNMapPointsArray)_mapPoints
{
  unsigned int v2;
  uint64_t v3;
  _MNMapPointsArray *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v11;

  v2 = objc_msgSend(a1, "pointCount");
  v3 = v2;
  v4 = -[_MNMapPointsArray initWithCapacity:]([_MNMapPointsArray alloc], "initWithCapacity:", v2);
  if (v2)
  {
    v5 = 0;
    v6 = 0;
    do
    {
      objc_msgSend(a1, "pointAt:", v6);
      GEOMapPointForCoordinate();
      v8 = v7;
      v10 = v9;
      v11 = -[_MNMapPointsArray mapPoints](v4, "mapPoints") + v5;
      v11->var0 = v8;
      v11->var1 = v10;
      ++v6;
      v5 += 16;
    }
    while (v3 != v6);
  }
  return v4;
}

+ (uint64_t)_startIndexForPoints:()MNExtras withPoints:pointCount:toleranceSquared:
{
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;

  v7 = 0;
  v8 = (double *)(a6 + 16);
  do
  {
    if (1 - a7 == v7)
      return 0x7FFFFFFFFFFFFFFFLL;
    v9 = *(v8 - 2);
    v10 = *(v8 - 1);
    v11 = *v8 - v9;
    v12 = v8[1] - v10;
    v13 = 0.0;
    v14 = v11 * v11 + 0.0 + v12 * v12;
    if (v14 > 1.0e-15)
    {
      v13 = ((a1 - v9) * v11 + 0.0 + (a2 - v10) * v12) / v14;
      if (v13 < 0.0)
        v13 = 0.0;
      if (v13 > 1.0)
        v13 = 1.0;
    }
    --v7;
    v8 += 2;
  }
  while ((a1 - (v9 + v11 * v13)) * (a1 - (v9 + v11 * v13)) + 0.0 + (a2 - (v10 + v12 * v13)) * (a2 - (v10 + v12 * v13)) >= a3);
  v15 = ~v7;
  if (fabs(v13) < 0.000001)
    return v15;
  else
    return v15 + 1;
}

+ (void)_addPointsToArray:()MNExtras forMapPoints:pointCount:isPolylineA:
{
  uint64_t v9;
  uint64_t v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  _MNMapPointWithIndex *v17;
  _MNMapPointWithIndex *v18;
  double v19;
  double v20;
  _MNMapPointWithIndex *v21;
  double v22;
  double v23;
  id v24;

  v24 = a3;
  v9 = a5 - 1;
  if (a5 != 1)
  {
    v10 = 0;
    v11 = (double *)(a4 + 16);
    do
    {
      v12 = *(v11 - 2);
      v13 = *(v11 - 1);
      v14 = *v11;
      v15 = v11[1];
      v16 = *v11 - v12;
      if (v16 * v16 + 0.0 + (v15 - v13) * (v15 - v13) >= 0.000001)
      {
        v17 = objc_alloc_init(_MNMapPointWithIndex);
        v18 = v17;
        if (v14 >= v12)
          v19 = v12;
        else
          v19 = v14;
        if (v14 >= v12)
          v20 = v13;
        else
          v20 = v15;
        -[_MNMapPointWithIndex setPoint:](v17, "setPoint:", v19, v20);
        -[_MNMapPointWithIndex setIndex:](v18, "setIndex:", v10);
        -[_MNMapPointWithIndex setIsStartOfSegment:](v18, "setIsStartOfSegment:", 1);
        -[_MNMapPointWithIndex setIsPolylineA:](v18, "setIsPolylineA:", a6);
        -[_MNMapPointWithIndex setIsFlipped:](v18, "setIsFlipped:", v14 < v12);
        -[_MNMapPointWithIndex setSegment:](v18, "setSegment:", v12, v13, v16, v15 - v13);
        objc_msgSend(v24, "addObject:", v18);
        v21 = objc_alloc_init(_MNMapPointWithIndex);

        if (v14 >= v12)
          v22 = v14;
        else
          v22 = v12;
        if (v14 >= v12)
          v23 = v15;
        else
          v23 = v13;
        -[_MNMapPointWithIndex setPoint:](v21, "setPoint:", v22, v23);
        -[_MNMapPointWithIndex setIndex:](v21, "setIndex:", v10);
        -[_MNMapPointWithIndex setIsStartOfSegment:](v21, "setIsStartOfSegment:", 0);
        -[_MNMapPointWithIndex setIsPolylineA:](v21, "setIsPolylineA:", a6);
        -[_MNMapPointWithIndex setIsFlipped:](v21, "setIsFlipped:", v14 < v12);
        -[_MNMapPointWithIndex setSegment:](v21, "setSegment:", v12, v13, v16, v15 - v13);
        objc_msgSend(v24, "addObject:", v21);

      }
      ++v10;
      v11 += 2;
    }
    while (v9 != v10);
  }

}

+ (uint64_t)_stringForPoint:()MNExtras
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0.3f, %0.3f"), *a3, a3[1]);
}

- (uint64_t)isNavigableForWatch
{
  void *v2;
  char v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (objc_msgSend(a1, "transportType") == 1)
    return 1;
  objc_msgSend(MEMORY[0x1E0D27008], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentCountrySupportsNavigation");

  if ((v3 & 1) == 0 || !objc_msgSend(a1, "isNavigable"))
    return 0;
  v4 = objc_msgSend(a1, "transportType");
  v5 = 0;
  if (v4 <= 3 && v4 != 1)
  {
    if ((objc_msgSend(a1, "source") & 0xFFFFFFFFFFFFFFFELL) == 2)
      return 1;
    objc_msgSend(a1, "origin");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend(a1, "origin");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v7, "isCurrentLocation");

    }
    else
    {
      v5 = 1;
    }

  }
  return v5;
}

- (uint64_t)isMultipointRoute
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "legs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3 < 2)
    return 0;
  objc_msgSend(a1, "waypoints");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "waypoints");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subarrayWithRange:", 1, objc_msgSend(v6, "count") - 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v8 = v7;
  v4 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v9 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v8);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "isServerProvidedWaypoint", (_QWORD)v12) & 1) == 0)
        {
          v4 = 1;
          goto LABEL_13;
        }
      }
      v4 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_13:

  return v4;
}

- (id)userRequestedWaypoints
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(a1, "waypoints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__GEOComposedRoute_MNExtras__userRequestedWaypoints__block_invoke;
  v7[3] = &unk_1E61D3E48;
  v4 = v2;
  v8 = v4;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  v5 = (void *)objc_msgSend(v4, "copy");
  return v5;
}

@end
