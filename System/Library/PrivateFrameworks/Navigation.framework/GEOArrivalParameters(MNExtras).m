@implementation GEOArrivalParameters(MNExtras)

- (uint64_t)containsCoordinate:()MNExtras arrivalRegionType:
{
  MNLocation *v7;
  uint64_t v8;

  v7 = -[MNLocation initWithLatitude:longitude:]([MNLocation alloc], "initWithLatitude:longitude:", a2, a3);
  v8 = objc_msgSend(a1, "containsLocation:arrivalRegionType:", v7, a5);

  return v8;
}

- (uint64_t)containsLocation:()MNExtras arrivalRegionType:
{
  return objc_msgSend(a1, "containsLocation:arrivalRegionType:parameters:", a3, a4, 0);
}

- (BOOL)containsLocation:()MNExtras arrivalRegionType:parameters:
{
  return objc_msgSend(a1, "regionContainmentTypeForLocation:arrivalRegionType:parameters:") == 0;
}

- (uint64_t)regionContainmentTypeForLocation:()MNExtras arrivalRegionType:parameters:
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  char v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  int v25;
  void *v26;
  double v27;
  char v28;
  double v29;
  void *v30;
  double v31;
  int v32;
  char v33;
  uint64_t v34;
  uint64_t v36;
  void *v37;
  id obj;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  if (qword_1ED0C4120 != -1)
    dispatch_once(&qword_1ED0C4120, &__block_literal_global_48);
  v9 = (void *)_MergedGlobals_48;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "_navigation_geoCoordinate");
  v13 = v12;
  v15 = v14;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  objc_msgSend(a1, "arrivalMapRegions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v17)
  {
    v18 = v17;
    v36 = 0;
    v37 = v7;
    v19 = 0;
    v20 = 0;
    v21 = *(_QWORD *)v41;
    obj = v16;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v41 != v21)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v23, "arrivalRegionAction", v36));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v11, "containsObject:", v24);

        if (v25
          && (objc_msgSend(v23, "arrivalRegion"),
              v26 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v8, "excludeDistancePadding"),
              v28 = objc_msgSend(v26, "containsCoordinate:radius:", v13, v15, v27),
              v26,
              (v28 & 1) != 0))
        {
          v36 = 1;
        }
        else if (objc_msgSend(v23, "arrivalRegionAction") == a4)
        {
          if (!objc_msgSend(v23, "hasRouteEndDistanceThresholdCm")
            || objc_msgSend(v37, "state") == 1
            && (objc_msgSend(v37, "distanceToEndOfCurrentLeg"), v29 >= 0.0)
            && v29 <= (float)objc_msgSend(v23, "routeEndDistanceThresholdCm") * 0.01)
          {
            objc_msgSend(v23, "arrivalRegion");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "includeDistancePadding");
            v32 = objc_msgSend(v30, "containsCoordinate:radius:", v13, v15, v31);

            if (v32)
            {
              if (!objc_msgSend(v11, "count"))
              {

                v33 = v36;
                v7 = v37;
                goto LABEL_25;
              }
              v19 = 1;
            }
          }
          v20 = 1;
        }
      }
      v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      if (v18)
        continue;
      break;
    }

    if ((v20 & 1) != 0)
    {
      v7 = v37;
      v33 = v19 ^ 1 | v36;
LABEL_25:
      v34 = v33 & 1;
      goto LABEL_27;
    }
    v34 = 2;
    v7 = v37;
  }
  else
  {

    v34 = 2;
  }
LABEL_27:

  return v34;
}

@end
