@implementation GEOMapRegion(MKAdditions)

+ (id)_mapkit_mapRegionEnclosingAnnotations:()MKAdditions
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  double v16;
  double v17;
  double v18;
  uint64_t i;
  double v20;
  double v21;
  id v22;
  uint64_t v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t j;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (objc_msgSend(v3, "count"))
  {
    if (objc_msgSend(v3, "count") == 1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "coordinate");
      v6 = v5;
      v8 = v7;

      v9 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0D27208]), "initWithLatitude:longitude:", v6, v8);
    }
    else
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v10 = v3;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
      v12 = -180.0;
      if (v11)
      {
        v13 = v11;
        v14 = *(_QWORD *)v38;
        v15 = 90.0;
        v16 = -180.0;
        v17 = 180.0;
        v18 = -90.0;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v38 != v14)
              objc_enumerationMutation(v10);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "coordinate");
            if (v20 < v15)
              v15 = v20;
            if (v20 > v18)
              v18 = v20;
            if (v21 < v17)
              v17 = v21;
            if (v21 > v16)
              v16 = v21;
          }
          v13 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
        }
        while (v13);
      }
      else
      {
        v15 = 90.0;
        v18 = -90.0;
        v17 = 180.0;
        v16 = -180.0;
      }

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v22 = v10;
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      v24 = 180.0;
      if (v23)
      {
        v25 = v23;
        v26 = *(_QWORD *)v34;
        v12 = -180.0;
        v24 = 180.0;
        do
        {
          for (j = 0; j != v25; ++j)
          {
            if (*(_QWORD *)v34 != v26)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "coordinate", (_QWORD)v33);
            if (v28 >= 0.0)
            {
              if (v28 < v24)
                v24 = v28;
            }
            else if (v28 > v12)
            {
              v12 = v28;
            }
          }
          v25 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v25);
      }

      v29 = 180.0 - v24 + v12 + 180.0;
      v9 = objc_alloc_init(MEMORY[0x1E0D27208]);
      objc_msgSend(v9, "setSouthLat:", v15);
      objc_msgSend(v9, "setNorthLat:", v18);
      if (v16 - v17 >= v29)
        v30 = v24;
      else
        v30 = v17;
      if (v16 - v17 >= v29)
        v31 = v12;
      else
        v31 = v16;
      objc_msgSend(v9, "setWestLng:", v30, (_QWORD)v33);
      objc_msgSend(v9, "setEastLng:", v31);
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)_mapkit_mapRegionForCoordinateRegion:()MKAdditions
{
  void *v6;

  v6 = 0;
  if (a3 >= -180.0 && a3 <= 180.0 && a2 >= -90.0 && a2 <= 90.0)
  {
    v6 = 0;
    if (a4 >= 0.0 && a4 <= 180.0 && a5 >= 0.0 && a5 <= 360.0)
    {
      objc_msgSend(a1, "_geo_mapRegionForGEOCoordinateRegion:");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v6;
}

@end
