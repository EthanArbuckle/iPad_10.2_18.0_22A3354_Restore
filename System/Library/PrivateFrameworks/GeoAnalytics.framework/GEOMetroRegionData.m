@implementation GEOMetroRegionData

- (GEOMetroRegionData)init
{
  GEOMetroRegionData *result;

  result = (GEOMetroRegionData *)objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (GEOMetroRegionData)initWithFileURL:(id)a3
{
  id v4;
  GEOMetroRegionData *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  GEOGloriaDB *db;
  GEOMetroRegionData *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)GEOMetroRegionData;
  v5 = -[GEOMetroRegionData init](&v13, sel_init);
  if (!v5)
    goto LABEL_4;
  v6 = objc_alloc(MEMORY[0x24BE3CBF0]);
  v7 = objc_opt_class();
  GEOGetMetroRegionLog();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "initWithFileURL:rootQuadKey:metadataClass:dataClass:log:", v4, 0, 0, v7, v8);
  db = v5->_db;
  v5->_db = (GEOGloriaDB *)v9;

  if (v5->_db)
    v11 = v5;
  else
LABEL_4:
    v11 = 0;

  return v11;
}

- (id)metroNameForLocation:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const unsigned __int8 *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  GEOGloriaDB *db;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v23;
  uint64_t v24;
  BOOL (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t buf[8];
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t, uint64_t);
  uint64_t (*v39)();
  void *v40;
  uint64_t v41;
  uint64_t v42;

  v4 = a3;
  objc_msgSend(v4, "coordinate");
  v6 = v5;
  objc_msgSend(v4, "coordinate");
  v8 = v7;
  v35 = 0;
  v36 = &v35;
  v37 = 0x4012000000;
  v38 = __Block_byref_object_copy__0;
  v39 = __Block_byref_object_dispose__0;
  v40 = &unk_23CC5CFCD;
  objc_msgSend(v4, "coordinate");
  *(_QWORD *)buf = v9;
  v34 = v10;
  objc_msgSend(v4, "coordinate");
  v31 = v11;
  v32 = v12;
  gloria::TileId::FromLatLng((gloria::TileId *)buf, (double *)&v32, &metroTileZoom, v13);
  v41 = v14;
  v42 = v15;
  v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = v36[6] | gloria::LEADING_BITS_VALUE_LUT[*((unsigned __int8 *)v36 + 56)];
  db = self->_db;
  v23 = MEMORY[0x24BDAC760];
  v24 = 3221225472;
  v25 = __43__GEOMetroRegionData_metroNameForLocation___block_invoke;
  v26 = &unk_250DC0BA8;
  v28 = &v35;
  v29 = v6;
  v30 = v8;
  v19 = v16;
  v27 = v19;
  if ((-[GEOGloriaDB unsafeDataForQuadKey:result:](db, "unsafeDataForQuadKey:result:", v17, &v23) & 1) == 0)
  {
    GEOGetMetroRegionLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23CBB4000, v21, OS_LOG_TYPE_INFO, "Did not find matching polygon in underlying data", buf, 2u);
    }
    v20 = 0;
    goto LABEL_8;
  }
  if ((unint64_t)objc_msgSend(v19, "count", v23, v24, v25, v26) > 1)
  {
    objc_msgSend(v19, "sortedArrayUsingComparator:", &__block_literal_global_8);
    v21 = objc_claimAutoreleasedReturnValue();
    -[NSObject firstObject](v21, "firstObject");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  _Block_object_dispose(&v35, 8);
  return v20;
}

BOOL __43__GEOMetroRegionData_metroNameForLocation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;
  void *v14;
  _BOOL8 v15;
  int64x2_t v17;
  int64x2_t v18;
  int64x2_t v19;
  int64x2_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  double v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = gloria::TileId::ToBBOX((gloria::TileId *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 48));
  v25 = v5;
  v26 = v4;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(v3, "territorys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v22;
    v17 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v18 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v10, "hasPolygon", *(_OWORD *)&v17, *(_OWORD *)&v18, *(_OWORD *)&v19, *(_OWORD *)&v20))
        {
          v19 = v18;
          v20 = v17;
          if (!GEOCoarseLocationTerritoryInfoContainsPoint())
            continue;
        }
        else
        {
          objc_msgSend(v10, "regionNameStr");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11 == 0;

          if (v12)
            continue;
        }
        v13 = *(void **)(a1 + 32);
        objc_msgSend(v10, "regionNameStr");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v14);

      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v7);
  }

  v15 = objc_msgSend(*(id *)(a1 + 32), "count") != 0;
  return v15;
}

uint64_t __43__GEOMetroRegionData_metroNameForLocation___block_invoke_7(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

@end
