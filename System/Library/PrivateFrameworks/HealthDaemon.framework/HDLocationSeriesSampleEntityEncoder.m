@implementation HDLocationSeriesSampleEntityEncoder

uint64_t __87___HDLocationSeriesSampleEntityEncoder_codableRepresentationForPersistentID_row_error___block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "addLocationData:", a2);
  return 1;
}

uint64_t __130___HDLocationSeriesSampleEntityEncoder_generateCodableRepresentationsForPersistentID_row_maxBytesPerRepresentation_error_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  HDCodableLocationSeries *v13;
  uint64_t v14;
  void *v15;
  id obj;

  v3 = a2;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) + 124 > *(_QWORD *)(a1 + 72))
  {
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v4 + 40);
    v5 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    objc_storeStrong((id *)(v4 + 40), obj);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = 0;

    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    if (v5 == 1)
    {
LABEL_6:
      v11 = 0;
      goto LABEL_10;
    }
    if (v5 == 2)
    {
      if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "hk_error:format:", 100, CFSTR("Message send for codable representation reported error status without specifying an error."));
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
        v10 = *(void **)(v9 + 40);
        *(_QWORD *)(v9 + 40) = v8;

      }
      goto LABEL_6;
    }
  }
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  if (!v12)
  {
    v13 = objc_alloc_init(HDCodableLocationSeries);
    v14 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v15 = *(void **)(v14 + 40);
    *(_QWORD *)(v14 + 40) = v13;

    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setSample:", *(_QWORD *)(a1 + 32));
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "setFrozen:", *(unsigned __int8 *)(a1 + 88));
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(a1 + 80);
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  }
  objc_msgSend(v12, "addLocationData:", v3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) += 124;
  v11 = 1;
LABEL_10:

  return v11;
}

uint64_t __90___HDLocationSeriesSampleEntityEncoder__enumerateCodableSeries_transaction_error_handler___block_invoke(uint64_t a1, double a2, uint64_t a3, void *a4)
{
  id v6;
  uint64_t v7;
  id v8;
  HDCodableLocationDatum *v9;
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
  uint64_t v20;
  uint64_t v21;
  _OWORD v23[6];
  __int128 v24;
  __int128 v25;
  _OWORD v26[2];

  v6 = a4;
  v7 = *(_QWORD *)(a1 + 32);
  v8 = v6;
  v9 = objc_alloc_init(HDCodableLocationDatum);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v10 = *(double *)((char *)&v23[4] + 12);
  }
  else
  {
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    v10 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setTimestamp:](v9, "setTimestamp:", v10, *(_QWORD *)&v23[0]);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v11 = *(double *)((char *)v23 + 4);
  }
  else
  {
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    v11 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setLatitude:](v9, "setLatitude:", v11, v23[0]);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v12 = *(double *)((char *)v23 + 12);
  }
  else
  {
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    v12 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setLongitude:](v9, "setLongitude:", v12, v23[0], *(_QWORD *)&v23[1]);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v13 = *(double *)((char *)&v23[1] + 12);
  }
  else
  {
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    v13 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setAltitude:](v9, "setAltitude:", v13, v23[0], *(_QWORD *)&v23[1]);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v14 = *(double *)((char *)&v23[2] + 12);
  }
  else
  {
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    v14 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setSpeed:](v9, "setSpeed:", v14, v23[0], *(_QWORD *)&v23[1]);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v15 = *(double *)((char *)&v23[3] + 12);
  }
  else
  {
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    v15 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setCourse:](v9, "setCourse:", v15, v23[0], *(_QWORD *)&v23[1]);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v16 = *(double *)((char *)&v23[1] + 4);
  }
  else
  {
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    v16 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setHorizontalAccuracy:](v9, "setHorizontalAccuracy:", v16, v23[0], v23[1], *(_QWORD *)&v23[2]);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v17 = *(double *)((char *)&v23[2] + 4);
  }
  else
  {
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    v17 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setVerticalAccuracy:](v9, "setVerticalAccuracy:", v17, v23[0], v23[1], v23[2], *(_QWORD *)&v23[3]);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v18 = *(double *)((char *)&v23[3] + 4);
  }
  else
  {
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    v18 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setSpeedAccuracy:](v9, "setSpeedAccuracy:", v18, v23[0], v23[1], v23[2], v23[3], *(_QWORD *)&v23[4]);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v19 = *(double *)((char *)&v23[4] + 4);
  }
  else
  {
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    v19 = 0.0;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setCourseAccuracy:](v9, "setCourseAccuracy:", v19, v23[0], v23[1], v23[2], v23[3], v23[4], v23[5], v24, v25, v26[0], v26[1]);
  if (v8)
  {
    objc_msgSend(v8, "clientLocation");
    v20 = HIDWORD(v26[0]);
  }
  else
  {
    v20 = 0;
    v25 = 0u;
    memset(v26, 0, 28);
    v24 = 0u;
    memset(v23, 0, sizeof(v23));
  }
  -[HDCodableLocationDatum setSignalEnvironmentType:](v9, "setSignalEnvironmentType:", v20, v23[0], v23[1], v23[2], v23[3], v23[4], v23[5], v24, v25, v26[0], v26[1]);

  v21 = (*(uint64_t (**)(uint64_t, HDCodableLocationDatum *, double))(v7 + 16))(v7, v9, a2);
  return v21;
}

@end
