@implementation GEOSimpleRoutePreloadCamera

- (void)implicateTilesForCoordinate:(id)a3 route:(id)a4 nearestRoutePointIdx:(double)a5 stepNearManeuever:(BOOL)a6 into:(id)a7 stepSize:(double)a8 maneuverSize:(double)a9 tileSetStyles:(id)a10
{
  _BOOL4 v13;
  double var1;
  double var0;
  id v16;
  void *v17;
  unsigned int v18;
  long double v19;
  long double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  unsigned int v29;
  uint64_t v30;
  __int128 v31;
  unint64_t v32;
  void *v34;
  void *v35;
  _BOOL4 v36;
  GEOTileKeyList *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  id obj;
  unsigned int v46;
  unsigned int v47;
  unint64_t v48;
  unint64_t v49;
  unint64_t v50;
  void *v51;
  unsigned int v52;
  unsigned int v53;
  id v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD v63[2];
  _BYTE v64[128];
  _BYTE v65[128];
  _QWORD v66[4];

  v13 = a6;
  var1 = a3.var1;
  var0 = a3.var0;
  v66[2] = *MEMORY[0x1E0C80C00];
  v16 = a7;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = a10;
  v42 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
  if (v42)
  {
    v43 = *(_QWORD *)v60;
    if (!v13)
      a9 = a8;
    do
    {
      v44 = 0;
      do
      {
        if (*(_QWORD *)v60 != v43)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * v44);
        v18 = objc_msgSend(v17, "integerValue");
        objc_msgSend(obj, "objectForKey:", v17);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = exp2(15.0 - (double)v18);
        v20 = GEOMapRectMakeWithRadialDistance(var0, var1, a9 * v19);
        v23 = (double)(1 << v18) * 0.0000000037252903;
        v48 = vcvtmd_u64_f64(v23 * v20) | 0x3E30000000000000;
        v46 = vcvtmd_u64_f64(v23 * (v20 + v24));
        if (v48 <= v46)
        {
          v47 = vcvtmd_u64_f64(v23 * v21);
          v52 = vcvtmd_u64_f64(v23 * (v21 + v22));
          v49 = (unint64_t)(v18 & 0x3F) << 40;
          do
          {
            if (v47 <= v52)
            {
              v50 = v48 << 46;
              v53 = v47;
              do
              {
                v57 = 0u;
                v58 = 0u;
                v55 = 0u;
                v56 = 0u;
                v54 = v51;
                v25 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
                if (v25)
                {
                  v26 = *(_QWORD *)v56;
                  do
                  {
                    for (i = 0; i != v25; ++i)
                    {
                      if (*(_QWORD *)v56 != v26)
                        objc_enumerationMutation(v54);
                      v28 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
                      v29 = objc_msgSend(v28, "style");
                      *(_QWORD *)((char *)v66 + 1) = v50 | v49;
                      LOBYTE(v66[0]) = 2;
                      *((_QWORD *)&v31 + 1) = (v48 >> 18) | ((unint64_t)(v53 & 0x3FFFFFF) << 8) | ((unint64_t)(v29 & 0x3FFF) << 34) | 0x2000000000000;
                      *(_QWORD *)&v31 = v50 | v49;
                      v30 = v31 >> 56;
                      v32 = (unint64_t)(v29 == 26) << 7;
                      if (v29 <= 0x19 && ((1 << v29) & 0x200101C) != 0)
                        v32 = 128;
                      v63[0] = v32 | v66[0] & 0xFFFFFFFFFFFFFF7FLL;
                      v63[1] = v30;
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v28, "restrictions"));
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v16, "objectForKeyedSubscript:", v34);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      v36 = v35 == 0;

                      if (v36)
                      {
                        v37 = objc_alloc_init(GEOTileKeyList);
                        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v28, "restrictions"));
                        v38 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v16, "setObject:forKeyedSubscript:", v37, v38);

                      }
                      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v28, "restrictions"));
                      v39 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v16, "objectForKeyedSubscript:", v39);
                      v40 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v40, "addKey:", v63);

                    }
                    v25 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v55, v64, 16);
                  }
                  while (v25);
                }

                ++v53;
              }
              while (v53 <= v52);
            }
            v48 = (v48 + 1);
          }
          while (v48 <= v46);
        }

        ++v44;
      }
      while (v44 != v42);
      v41 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v65, 16);
      v42 = v41;
    }
    while (v41);
  }

}

- (id)implicateAssetMetadataTilesForCoordinate:(id)a3 size:(double)a4
{
  double var1;
  double var0;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  GEOTileKeyList *v18;
  double v19;
  unint64_t v20;
  unsigned int v21;
  unint64_t v22;
  unsigned int v23;
  char v24;
  uint64_t v25;
  unsigned int v26;
  unint64_t v27;
  __int128 v28;
  unsigned int v30;
  unsigned int v31;
  unint64_t v32;
  unint64_t v33;
  uint64_t v34;
  _QWORD v35[3];

  var1 = a3.var1;
  var0 = a3.var0;
  v35[2] = *MEMORY[0x1E0C80C00];
  +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeTileGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeTileSetForStyle:size:scale:", 78, 2, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && objc_msgSend(v9, "availableTilesCount"))
  {
    v10 = objc_msgSend(v9, "maximumZoomLevelForMapPoint:", GEOTilePointForCoordinate(var0, var1, 20.0));
    v11 = GEOMapRectMakeWithRadialDistance(var0, var1, a4);
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = objc_alloc_init(GEOTileKeyList);
    v19 = (double)(1 << v10) * 0.0000000037252903;
    LODWORD(v20) = vcvtmd_u64_f64(v19 * v11);
    v30 = vcvtmd_u64_f64(v19 * (v11 + v15));
    v32 = v20;
    if (v20 <= v30)
    {
      v31 = vcvtmd_u64_f64(v19 * v13);
      v21 = vcvtmd_u64_f64(v19 * (v13 + v17));
      v22 = (unint64_t)(v10 & 0x3F) << 40;
      do
      {
        if (v31 <= v21)
        {
          v23 = v31;
          do
          {
            v33 = 0;
            v34 = 0;
            v24 = objc_msgSend(v9, "size");
            v25 = objc_msgSend(v9, "scale");
            v26 = objc_msgSend(v9, "style");
            *(_QWORD *)((char *)v35 + 1) = (v32 << 46) | v22;
            LOBYTE(v35[0]) = 2;
            if (v26 <= 0x19 && ((1 << v26) & 0x200101C) != 0)
              v27 = 128;
            else
              v27 = (unint64_t)(v26 == 26) << 7;
            *((_QWORD *)&v28 + 1) = (v32 >> 18) | ((unint64_t)(v23 & 0x3FFFFFF) << 8) | ((unint64_t)(v26 & 0x3FFF) << 34) | ((unint64_t)(v24 & 0xF) << 48) | (v25 << 52);
            *(_QWORD *)&v28 = v32 << 46;
            v33 = v27 | v35[0] & 0xFFFFFFFFFFFFFF7FLL;
            v34 = v28 >> 56;
            -[GEOTileKeyList addKey:](v18, "addKey:", &v33);
            ++v23;
          }
          while (v23 <= v21);
        }
        v32 = (v32 + 1);
      }
      while (v32 <= v30);
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
