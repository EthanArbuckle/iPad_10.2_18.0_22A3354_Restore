@implementation RTLocationDownsampler

+ (id)filterConvergingLocations:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v3, "reverseObjectEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (!v6)
  {
    v8 = 0;
    goto LABEL_19;
  }
  v7 = v6;
  v8 = 0;
  v9 = *(_QWORD *)v28;
  do
  {
    v10 = 0;
    do
    {
      if (*(_QWORD *)v28 != v9)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v10);
      if (!v8)
        goto LABEL_10;
      objc_msgSend(v8, "timestamp");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceDate:", v13);
      if (v14 > 20.0)
      {

LABEL_10:
        v19 = v11;

        v8 = v19;
LABEL_11:
        objc_msgSend(v4, "addObject:", v11);
        goto LABEL_12;
      }
      objc_msgSend(v8, "horizontalAccuracy");
      v16 = v15;
      objc_msgSend(v11, "horizontalAccuracy");
      v18 = v17;

      if (v16 > v18)
        goto LABEL_10;
      objc_msgSend(v8, "horizontalAccuracy");
      v21 = v20 + v20;
      objc_msgSend(v11, "horizontalAccuracy");
      if (v21 > v22)
        goto LABEL_11;
LABEL_12:
      ++v10;
    }
    while (v7 != v10);
    v23 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    v7 = v23;
  }
  while (v23);
LABEL_19:

  objc_msgSend(v4, "reverseObjectEnumerator");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "allObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

+ (id)downsampleLocations:(id)a3 outputSize:(unint64_t)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[RTLocationDownsampler createErrorFunctionWithPerpendicularDistance](RTLocationDownsampler, "createErrorFunctionWithPerpendicularDistance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTLocationDownsampler downsampleLocations:errorFunction:errorThreshold:outputSize:](RTLocationDownsampler, "downsampleLocations:errorFunction:errorThreshold:outputSize:", v5, v6, a4, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)downsampleLocations:(id)a3 errorFunction:(id)a4 errorThreshold:(double)a5 outputSize:(unint64_t)a6
{
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  int v16;
  unint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)MEMORY[0x1A85B6C24](a4);
  if (!a4)
  {
    +[RTLocationDownsampler createErrorFunctionWithPerpendicularDistance](RTLocationDownsampler, "createErrorFunctionWithPerpendicularDistance");
    v11 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v11;
  }
  v12 = v9;
  if (a5 > 0.0)
  {
    +[RTLocationDownsampler _downsampleLocations:errorFunction:errorThreshold:](RTLocationDownsampler, "_downsampleLocations:errorFunction:errorThreshold:", v9, v10, a5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (a6)
  {
    +[RTLocationDownsampler _downsampleLocations:errorFunction:outputSize:](RTLocationDownsampler, "_downsampleLocations:errorFunction:outputSize:", v12, v10, a6);
    v13 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v13;
  }
  _rt_log_facility_get_os_log(RTLogFacilityFramework);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v16 = 134218496;
    v17 = a6;
    v18 = 2048;
    v19 = objc_msgSend(v9, "count");
    v20 = 2048;
    v21 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_1A5E26000, v14, OS_LOG_TYPE_INFO, "RTLocationDownsampler: desired output size, %lu, input size, %lu, output size, %lu", (uint8_t *)&v16, 0x20u);
  }

  return v12;
}

+ (id)_downsampleLocations:(id)a3 errorFunction:(id)a4 errorThreshold:(double)a5
{
  id v7;
  id v8;
  double (**v9)(_QWORD, _QWORD, _QWORD);
  id v10;
  NSObject *v11;
  const char *v12;
  unint64_t v14;
  double v15;
  unint64_t v16;
  void *v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t v24[8];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (double (**)(_QWORD, _QWORD, _QWORD))v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)v24 = 0;
    v12 = "Invalid parameter not satisfying: locations";
LABEL_12:
    _os_log_error_impl(&dword_1A5E26000, v11, OS_LOG_TYPE_ERROR, v12, v24, 2u);
    goto LABEL_13;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      goto LABEL_13;
    *(_WORD *)v24 = 0;
    v12 = "Invalid parameter not satisfying: errorFunction";
    goto LABEL_12;
  }
  if (a5 <= 0.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v24 = 0;
      v12 = "Invalid parameter not satisfying: errorThreshold > 0";
      goto LABEL_12;
    }
LABEL_13:

    v10 = 0;
    goto LABEL_14;
  }
  if ((unint64_t)objc_msgSend(v7, "count") >= 3)
  {
    if ((unint64_t)(objc_msgSend(v7, "count") - 3) > 0xFFFFFFFFFFFFFFFDLL)
    {
      v14 = 0;
      v15 = 0.0;
    }
    else
    {
      v14 = 0;
      v15 = 0.0;
      v16 = 1;
      do
      {
        objc_msgSend(v7, "objectAtIndex:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = ((double (**)(_QWORD, void *, id))v9)[2](v9, v17, v7);
        if (v18 > v15)
        {
          v14 = v16;
          v15 = v18;
        }

        ++v16;
      }
      while (v16 < objc_msgSend(v7, "count") - 1);
    }
    if (v15 <= a5)
    {
      objc_msgSend(v7, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v20;
      objc_msgSend(v7, "lastObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25[1] = v22;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v7, "subarrayWithRange:", 0, v14 + 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationDownsampler _downsampleLocations:errorFunction:errorThreshold:](RTLocationDownsampler, "_downsampleLocations:errorFunction:errorThreshold:", v19, v9, a5);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v7, "subarrayWithRange:", v14, objc_msgSend(v7, "count") - v14);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationDownsampler _downsampleLocations:errorFunction:errorThreshold:](RTLocationDownsampler, "_downsampleLocations:errorFunction:errorThreshold:", v21, v9, a5);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = (id)objc_opt_new();
      objc_msgSend(v20, "subarrayWithRange:", 0, objc_msgSend(v20, "count") - 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addObjectsFromArray:", v23);

      objc_msgSend(v10, "addObjectsFromArray:", v22);
    }

  }
  else
  {
    v10 = v7;
  }
LABEL_14:

  return v10;
}

+ (id)_downsampleLocations:(id)a3 errorFunction:(id)a4 outputSize:(int64_t)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  uint64_t i;
  void *v17;
  double v18;
  double v19;
  id v20;
  void *v21;
  double v22;
  RTLocationDownsamplerTree *v23;
  void *v24;
  RTLocationDownsamplerTree *v25;
  int64_t v26;
  double v27;
  id v28;
  NSObject *v29;
  const char *v30;
  int64_t v32;
  _OWORD v33[8];
  _OWORD v34[2];
  uint8_t buf[16];
  _OWORD v36[2];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _OWORD v42[2];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: locations";
LABEL_30:
    _os_log_error_impl(&dword_1A5E26000, v29, OS_LOG_TYPE_ERROR, v30, buf, 2u);
    goto LABEL_31;
  }
  if (!v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      goto LABEL_31;
    *(_WORD *)buf = 0;
    v30 = "Invalid parameter not satisfying: errorFunction";
    goto LABEL_30;
  }
  if (a5 <= 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v30 = "Invalid parameter not satisfying: outputSize > 0";
      goto LABEL_30;
    }
LABEL_31:

    v28 = 0;
    goto LABEL_32;
  }
  if (objc_msgSend(v7, "count") <= (unint64_t)a5)
  {
    v28 = v7;
  }
  else
  {
    v32 = a5;
    v10 = (void *)objc_opt_new();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v11 = v7;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v44;
      v15 = -1.0;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v44 != v14)
            objc_enumerationMutation(v11);
          v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v17, "altitude");
          if (v18 >= 0.0 && (objc_msgSend(v17, "horizontalAccuracy"), v19 <= 650.0))
          {
            objc_msgSend(v10, "addObject:", v17);
            objc_msgSend(v17, "altitude");
            v15 = v22;
          }
          else
          {
            v41 = 0u;
            memset(v42, 0, 28);
            v39 = 0u;
            v40 = 0u;
            v37 = 0u;
            v38 = 0u;
            memset(v36, 0, sizeof(v36));
            *(_OWORD *)buf = 0u;
            if (v17)
              objc_msgSend(v17, "clientLocation");
            *(double *)((char *)v36 + 12) = v15;
            v20 = objc_alloc(MEMORY[0x1E0C9E3B8]);
            v33[6] = v40;
            v33[7] = v41;
            v34[0] = v42[0];
            *(_OWORD *)((char *)v34 + 12) = *(_OWORD *)((char *)v42 + 12);
            v33[2] = v36[1];
            v33[3] = v37;
            v33[4] = v38;
            v33[5] = v39;
            v33[0] = *(_OWORD *)buf;
            v33[1] = v36[0];
            v21 = (void *)objc_msgSend(v20, "initWithClientLocation:", v33);
            objc_msgSend(v10, "addObject:", v21);

          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v13);
    }

    if (objc_msgSend(v10, "count"))
    {
      v23 = [RTLocationDownsamplerTree alloc];
      v24 = (void *)objc_msgSend(v10, "copy");
      v25 = -[RTLocationDownsamplerTree initWithLocations:errorFunction:](v23, "initWithLocations:errorFunction:", v24, v9);

      if (v32 >= 3)
      {
        v26 = v32 - 2;
        do
        {
          -[RTLocationDownsamplerTree maximumError](v25, "maximumError");
          if (v27 == 0.0)
            break;
          -[RTLocationDownsamplerTree splitLocationsWithErrorFunction:](v25, "splitLocationsWithErrorFunction:", v9);
          --v26;
        }
        while (v26);
      }
      -[RTLocationDownsamplerTree sampledLocations](v25, "sampledLocations");
      v28 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v28 = v11;
    }

  }
LABEL_32:

  return v28;
}

+ (id)createErrorFunctionWithPerpendicularDistance
{
  return &__block_literal_global_7;
}

double __69__RTLocationDownsampler_createErrorFunctionWithPerpendicularDistance__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
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
  double v20;
  _BOOL4 v21;
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
  double v34;
  double v35;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.0;
  if (v6 && v7)
  {
    v9 = v6;
    v41 = 0.0;
    v42 = 0.0;
    v39 = 0.0;
    v40 = 0.0;
    v37 = 0.0;
    v38 = 0.0;
    objc_msgSend(v9, "coordinate");
    v11 = v10;
    objc_msgSend(v9, "coordinate");
    v13 = v12;
    objc_msgSend(v9, "altitude");
    v15 = v14;
    objc_msgSend(v4, "coordinate");
    v17 = v16;
    objc_msgSend(v4, "coordinate");
    v19 = v18;
    objc_msgSend(v4, "altitude");
    v21 = RTCommonConvertGeodeticToLocalFrame(&v42, &v41, &v40, v11, v13, v15, v17, v19, v20);
    v8 = 0.0;
    if (v21)
    {
      objc_msgSend(v9, "coordinate");
      v23 = v22;
      objc_msgSend(v9, "coordinate");
      v25 = v24;
      objc_msgSend(v9, "altitude");
      v27 = v26;
      objc_msgSend(v7, "coordinate");
      v29 = v28;
      objc_msgSend(v7, "coordinate");
      v31 = v30;
      objc_msgSend(v7, "altitude");
      if (RTCommonConvertGeodeticToLocalFrame(&v39, &v38, &v37, v23, v25, v27, v29, v31, v32))
      {
        v33 = sqrt(v37 * v37 + v38 * v38 + v39 * v39);
        if (v33 != 0.0)
        {
          v34 = sqrt((v38 * v40 - v37 * v41) * (v38 * v40 - v37 * v41)+ (v37 * v42 - v39 * v40) * (v37 * v42 - v39 * v40)+ (v39 * v41 - v38 * v42) * (v39 * v41 - v38 * v42))/ v33;
          objc_msgSend(v4, "horizontalAccuracy");
          v8 = v34 - v35;
        }
      }
    }

  }
  return v8;
}

+ (id)createErrorFunctionWithPerpendicularDistanceAndSpeed
{
  return &__block_literal_global_14;
}

double __77__RTLocationDownsampler_createErrorFunctionWithPerpendicularDistanceAndSpeed__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
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
  double v20;
  _BOOL4 v21;
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
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.0;
  if (v6 && v7)
  {
    v9 = v6;
    v57 = 0.0;
    v58 = 0.0;
    v55 = 0.0;
    v56 = 0.0;
    v53 = 0.0;
    v54 = 0.0;
    objc_msgSend(v9, "coordinate");
    v11 = v10;
    objc_msgSend(v9, "coordinate");
    v13 = v12;
    objc_msgSend(v9, "altitude");
    v15 = v14;
    objc_msgSend(v4, "coordinate");
    v17 = v16;
    objc_msgSend(v4, "coordinate");
    v19 = v18;
    objc_msgSend(v4, "altitude");
    v21 = RTCommonConvertGeodeticToLocalFrame(&v58, &v57, &v56, v11, v13, v15, v17, v19, v20);
    v8 = 0.0;
    if (v21)
    {
      objc_msgSend(v9, "coordinate");
      v23 = v22;
      objc_msgSend(v9, "coordinate");
      v25 = v24;
      objc_msgSend(v9, "altitude");
      v27 = v26;
      objc_msgSend(v7, "coordinate");
      v29 = v28;
      objc_msgSend(v7, "coordinate");
      v31 = v30;
      objc_msgSend(v7, "altitude");
      if (RTCommonConvertGeodeticToLocalFrame(&v55, &v54, &v53, v23, v25, v27, v29, v31, v32))
      {
        v33 = sqrt(v53 * v53 + v54 * v54 + v55 * v55);
        if (v33 != 0.0)
        {
          v34 = v56;
          v35 = v57;
          v36 = v58;
          v37 = sqrt((v54 * v56 - v53 * v57) * (v54 * v56 - v53 * v57)+ (v53 * v58 - v55 * v56) * (v53 * v58 - v55 * v56)+ (v55 * v57 - v54 * v58) * (v55 * v57 - v54 * v58))/ v33;
          objc_msgSend(v4, "horizontalAccuracy");
          v52 = v37;
          v8 = v37 - v38;
          objc_msgSend(v7, "timestamp");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "timestamp");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "timeIntervalSinceDate:", v40);
          v42 = v41;

          objc_msgSend(v4, "timestamp");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "timeIntervalSinceReferenceDate");
          v45 = v44;
          objc_msgSend(v9, "timestamp");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "timeIntervalSinceReferenceDate");
          v48 = v47;

          if (v42 > 0.0 && v45 - v48 > 0.0)
          {
            v49 = sqrt(v34 * v34 + v35 * v35 + v36 * v36);
            v50 = sqrt(v49 * v49 - v52 * v52) - v33 * (v45 - v48) / v42;
            if (v50 < 0.0)
              v50 = -v50;
            v8 = sqrt(v8 * v8 + v50 * v50);
          }
        }
      }
    }

  }
  return v8;
}

+ (id)createErrorFunctionWithAbsoluteCrosstrackDistance
{
  return &__block_literal_global_15;
}

double __74__RTLocationDownsampler_createErrorFunctionWithAbsoluteCrosstrackDistance__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  id v9;
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
  double v20;
  _BOOL4 v21;
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
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = 0.0;
  if (v6 && v7 && v6 != v7)
  {
    v9 = v6;
    v39 = 0.0;
    v40 = 0.0;
    v36 = 0.0;
    v37 = 0.0;
    objc_msgSend(v9, "coordinate");
    v11 = v10;
    objc_msgSend(v9, "coordinate");
    v13 = v12;
    objc_msgSend(v9, "altitude");
    v15 = v14;
    objc_msgSend(v4, "coordinate");
    v17 = v16;
    objc_msgSend(v4, "coordinate");
    v19 = v18;
    objc_msgSend(v4, "altitude");
    v21 = RTCommonConvertGeodeticToLocalFrame(&v40, &v39, &v38, v11, v13, v15, v17, v19, v20);
    v8 = 0.0;
    if (v21)
    {
      objc_msgSend(v9, "coordinate");
      v23 = v22;
      objc_msgSend(v9, "coordinate");
      v25 = v24;
      objc_msgSend(v9, "altitude");
      v27 = v26;
      objc_msgSend(v7, "coordinate");
      v29 = v28;
      objc_msgSend(v7, "coordinate");
      v31 = v30;
      objc_msgSend(v7, "altitude");
      if (RTCommonConvertGeodeticToLocalFrame(&v37, &v36, &v35, v23, v25, v27, v29, v31, v32))
      {
        if (v37 == 0.0)
          v33 = 0.0;
        else
          v33 = -v36 / v37;
        v8 = fabs(v39 + v33 * v40) / sqrt(v33 * v33 + 1.0);
      }
    }

  }
  return v8;
}

@end
