@implementation GEOCoarseLocationData

- (GEOCoarseLocationData)initWithFileURL:(void *)a3 tileKey:(uint64_t)a4
{
  id v6;
  GEOCoarseLocationData *v7;
  GEOGloriaDB *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  uint64_t v16;
  GEOGloriaDB *db;
  GEOGloriaDB *v18;
  void *v19;
  GEOCoarseLocationData *v20;
  NSObject *v21;
  const char *v22;
  uint8_t v24[16];
  objc_super v25;

  v6 = a3;
  v25.receiver = a1;
  v25.super_class = (Class)GEOCoarseLocationData;
  v7 = -[GEOCoarseLocationData init](&v25, sel_init);
  if (!v7)
    goto LABEL_11;
  v8 = [GEOGloriaDB alloc];
  v9 = *(unsigned __int8 *)(a4 + 11);
  v10 = *(unsigned __int16 *)(a4 + 9);
  v11 = *(_QWORD *)(a4 + 1);
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  GEOGetCoarseLocationLog();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *((_QWORD *)&v15 + 1) = v10 | (v9 << 16);
  *(_QWORD *)&v15 = v11;
  v16 = -[GEOGloriaDB initWithFileURL:rootQuadKey:metadataClass:dataClass:log:](v8, "initWithFileURL:rootQuadKey:metadataClass:dataClass:log:", v6, (unint64_t)(v15 >> 6), v12, v13, v14);
  db = v7->_db;
  v7->_db = (GEOGloriaDB *)v16;

  v18 = v7->_db;
  if (!v18)
  {
    GEOGetCoarseLocationLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      v22 = "Failed to load DB";
LABEL_9:
      _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_ERROR, v22, v24, 2u);
    }
LABEL_10:

LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  -[GEOGloriaDB metadata](v18, "metadata");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    GEOGetCoarseLocationLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      v22 = "Failed to load DB metadata";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  v20 = v7;
LABEL_12:

  return v20;
}

- (id)snappedLocationForLocation:(id)a3 addLocationNoise:(BOOL)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  GEOGloriaDB *db;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  NSObject *v18;
  id v19;
  uint8_t v21[8];
  _QWORD v22[4];
  id v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;

  v6 = a3;
  objc_msgSend(v6, "coordinate");
  v8 = v7;
  objc_msgSend(v6, "coordinate");
  v10 = v9;
  v28 = 0;
  v29 = &v28;
  v30 = 0x3032000000;
  v31 = __Block_byref_object_copy__70;
  v32 = __Block_byref_object_dispose__70;
  v33 = 0;
  db = self->_db;
  objc_msgSend(v6, "coordinate");
  v13 = v12;
  v15 = v14;
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __69__GEOCoarseLocationData_snappedLocationForLocation_addLocationNoise___block_invoke;
  v22[3] = &unk_1E1C11B88;
  v25 = v8;
  v26 = v10;
  v24 = &v28;
  v16 = v6;
  v23 = v16;
  v27 = a4;
  -[GEOGloriaDB unsafeEnumerateDataAtLocation:radius:visitor:](db, "unsafeEnumerateDataAtLocation:radius:visitor:", v22, v13, v15, 0.0);
  v17 = (void *)v29[5];
  if (!v17)
  {
    GEOGetCoarseLocationLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v21 = 0;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_INFO, "Did not find matching polygon in underlying data", v21, 2u);
    }

    v17 = (void *)v29[5];
  }
  v19 = v17;

  _Block_object_dispose(&v28, 8);
  return v19;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_db, 0);
}

void __69__GEOCoarseLocationData_snappedLocationForLocation_addLocationNoise___block_invoke(uint64_t a1, unint64_t a2, void *a3, _BYTE *a4)
{
  id v7;
  int v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  double v16;
  double v17;
  NSObject *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  GEOLatLng *v24;
  GEOLatLng *v25;
  GEOCoarseLocationMetadata *v26;
  uint64_t UInteger;
  NSObject *v28;
  void *context;
  void *v30;
  int64x2_t v31;
  int64x2_t v32;
  double v33;
  double v34;
  int64x2_t v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  double v40[2];
  unint64_t v41;
  unsigned __int8 v42;
  uint8_t buf[4];
  _BYTE v44[14];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  context = (void *)MEMORY[0x18D764E2C]();
  v8 = __clz(a2);
  v42 = (int)((63 - v8 + (((63 - v8) & 0x80u) >> 7)) << 24) >> 25;
  v41 = a2 - gloria::LEADING_BITS_VALUE_LUT[v42];
  v9 = gloria::TileId::ToBBOX((gloria::TileId *)&v41);
  v40[0] = v10;
  v40[1] = v9;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v30 = v7;
  objc_msgSend(v7, "territorys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v37;
    v31 = vdupq_n_s64(0xFFEFFFFFFFFFFFFFLL);
    v32 = vdupq_n_s64(0x7FEFFFFFFFFFFFFFuLL);
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v37 != v13)
          objc_enumerationMutation(v11);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
        v35[0] = v32;
        v35[1] = v31;
        if (GEOCoarseLocationTerritoryInfoContainsPoint(v15, v40, (double *)(a1 + 48), v35))
        {
          objc_msgSend(v15, "representativePoint", context);
          v33 = v16;
          v34 = v17;
          GEOGetCoarseLocationLog();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 68157955;
            *(_DWORD *)v44 = 16;
            *(_WORD *)&v44[4] = 2097;
            *(_QWORD *)&v44[6] = &v33;
            _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_INFO, "Found matching polygon in underlying data. Snapping to representative point (%{private,geo:coordinate}.*P).", buf, 0x12u);
          }

          objc_msgSend(v15, "maxDistanceMeters");
          v20 = v19;
          v21 = objc_msgSend(*(id *)(a1 + 32), "copy");
          v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
          v23 = *(void **)(v22 + 40);
          *(_QWORD *)(v22 + 40) = v21;

          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "clearSensitiveFieldsForCoarseLocation");
          v24 = [GEOLatLng alloc];
          v25 = -[GEOLatLng initWithCoordinate:](v24, "initWithCoordinate:", v33, v34);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setLatLng:", v25);

          v26 = objc_alloc_init(GEOCoarseLocationMetadata);
          -[GEOCoarseLocationMetadata setType:](v26, "setType:", 2);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setCoarseMetadata:", v26);
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setHorizontalAccuracy:", v20);
          if (*(_BYTE *)(a1 + 64)
            && ((objc_msgSend(v15, "shouldRandomize") & 1) != 0
             || GEOConfigGetBOOL(GeoServicesConfig_CoarseLocationAlwaysRandomizeRepresentativePoint, (uint64_t)off_1EDF4DC28)))
          {
            UInteger = GEOConfigGetUInteger(GeoServicesConfig_CoarseLocationRepresentativePointRandomizationDistance, (uint64_t)off_1EDF4DC18);
            GEOGetCoarseLocationLog();
            v28 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134349056;
              *(_QWORD *)v44 = UInteger;
              _os_log_impl(&dword_1885A9000, v28, OS_LOG_TYPE_INFO, "Representative point is of poor quality. Applying randomization <= %{public}llu meters", buf, 0xCu);
            }

            objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "applyCoarseLocationRandomizationWithMaximumDistance:", (double)(unint64_t)UInteger);
          }
          *a4 = 1;

        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    }
    while (v12);
  }

  objc_autoreleasePoolPop(context);
}

- (GEOCoarseLocationData)init
{
  GEOCoarseLocationData *result;

  result = (GEOCoarseLocationData *)objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

@end
