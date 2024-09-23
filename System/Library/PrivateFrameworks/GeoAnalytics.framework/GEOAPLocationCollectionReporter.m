@implementation GEOAPLocationCollectionReporter

+ (void)reportRealtimeLocationCollection:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  uint64_t v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t buf[16];

  v3 = a3;
  if ((+[GEOAPLocationCollectionReporter _fuzzProbes:]((uint64_t)GEOAPLocationCollectionReporter, v3) & 1) != 0)
  {
    GEOConfigGetDate();
    v4 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject earlierDate:](v4, "earlierDate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToDate:", v4);

    if (v7)
    {
      GEOConfigGetDouble();
      objc_msgSend(v5, "dateByAddingTimeInterval:", v8 * 60.0);
      v9 = objc_claimAutoreleasedReturnValue();

      GEOConfigSetDate();
      v10 = 1;
      v4 = v9;
    }
    else
    {
      v10 = GEOConfigGetUInteger() + 1;
    }
    if (v10 <= GEOConfigGetUInteger())
    {
      GEOConfigSetUInteger();
      objc_msgSend(v3, "data");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      +[GEOAPPortal captureRealTrafficWithLocationCollection:](GEOAPPortal, "captureRealTrafficWithLocationCollection:", v12);

    }
    else
    {
      GEOGetTrafficProbeAnalyticsLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_23CBB4000, v11, OS_LOG_TYPE_INFO, "dropping realtime traffic probe - over budget", v13, 2u);
      }

    }
  }
  else
  {
    GEOGetTrafficProbeAnalyticsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23CBB4000, v4, OS_LOG_TYPE_INFO, "dropping realtime collection; no obfuscation ", buf, 2u);
    }
  }

}

+ (uint64_t)_fuzzProbes:(uint64_t)a1
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  NSObject *v9;
  _BOOL4 v10;
  uint64_t v11;
  __int16 v13[8];
  uint8_t v14[16];
  uint8_t buf[16];

  v2 = a2;
  v3 = (void *)objc_opt_self();
  objc_msgSend(MEMORY[0x24BE3CBB8], "sharedConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "countryCode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("CN")))
  {
    GEOGetTrafficProbeAnalyticsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23CBB4000, v6, OS_LOG_TYPE_DEBUG, "blurring CN traffic data", buf, 2u);
    }

    v7 = objc_msgSend(v3, "_fuzzCNProbes:", v2);
  }
  else
  {
    v8 = objc_msgSend(v5, "isEqualToString:", CFSTR("IN"));
    GEOGetTrafficProbeAnalyticsLog();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_23CBB4000, v9, OS_LOG_TYPE_DEBUG, "blurring IN traffic data", v14, 2u);
      }

      v7 = objc_msgSend(v3, "_fuzzINProbes:", v2);
    }
    else
    {
      if (v10)
      {
        v13[0] = 0;
        _os_log_impl(&dword_23CBB4000, v9, OS_LOG_TYPE_DEBUG, "blurring ROW traffic data", (uint8_t *)v13, 2u);
      }

      v7 = objc_msgSend(v3, "_fuzzROWProbes:", v2);
    }
  }
  v11 = v7;

  return v11;
}

+ (void)reportBatchLocationCollection:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  v3 = a3;
  if ((+[GEOAPLocationCollectionReporter _fuzzProbes:]((uint64_t)GEOAPLocationCollectionReporter, v3) & 1) != 0)
  {
    objc_msgSend(v3, "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GEOAPPortal captureBatchTrafficWithLocationCollection:](GEOAPPortal, "captureBatchTrafficWithLocationCollection:", v4);

  }
  else
  {
    GEOGetTrafficProbeAnalyticsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_23CBB4000, v5, OS_LOG_TYPE_INFO, "dropping batch collection; no obfuscation ", v6, 2u);
    }

  }
}

+ (void)reportReferencePressureCollection:(id)a3
{
  +[GEOAPPortal capturePressureDataWithPressureData:](GEOAPPortal, "capturePressureDataWithPressureData:", a3);
}

+ (void)reportCalibratedPressureCollection:(id)a3
{
  id v3;

  objc_msgSend(a3, "data");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[GEOAPPortal capturePressureDataWithPressureData:](GEOAPPortal, "capturePressureDataWithPressureData:", v3);

}

+ (void)_withCollectionRequest:(id)a3 fuzzBaseline:(BOOL)a4 fuzzCourseAccuracy:(BOOL)a5 fuzzSpeedAccuracy:(BOOL)a6 fuzzHorizAccuracy:(BOOL)a7 fuzzVertAccuracy:(BOOL)a8 useOneSecondPrecision:(BOOL)a9
{
  _BOOL4 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  double v19;
  double v20;
  double v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v28 = *MEMORY[0x24BDAC8D0];
  if (a4 || a5 || a6 || a7 || a8 || a9)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    objc_msgSend(a3, "locations");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    if (!v14)
      goto LABEL_34;
    v15 = v14;
    v16 = *(_QWORD *)v24;
    while (1)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v18 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        if (v13)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "clearAppBundleIdIndices");
          objc_msgSend(v18, "setHasProvider:", 0);
          objc_msgSend(v18, "setHasFloor:", 0);
          objc_msgSend(v18, "setHasMotionVehicleConnectedStateChanged:", 0);
          objc_msgSend(v18, "setHasMotionVehicleConnected:", 0);
          objc_msgSend(v18, "setRawMotionActivity:", 0);
          objc_msgSend(v18, "setMotionActivity:", 0);
          objc_msgSend(v18, "setHasModeIndicator:", 0);
          objc_msgSend(v18, "setHasHorzUncSemiMaj:", 0);
          objc_msgSend(v18, "setHasHorzUncSemiMin:", 0);
          objc_msgSend(v18, "setHasHorzUncSemiMajAz:", 0);
          if (!a9)
          {
LABEL_14:
            if (!v12)
              goto LABEL_15;
            goto LABEL_21;
          }
        }
        else if (!a9)
        {
          goto LABEL_14;
        }
        objc_msgSend(v18, "timestamp");
        objc_msgSend(v18, "setTimestamp:", rint(v19));
        if (!v12)
        {
LABEL_15:
          if (!v11)
            goto LABEL_16;
          goto LABEL_22;
        }
LABEL_21:
        objc_msgSend(v18, "setHasCourseAccuracy:", 0);
        if (!v11)
        {
LABEL_16:
          if (v10)
            goto LABEL_23;
          goto LABEL_17;
        }
LABEL_22:
        objc_msgSend(v18, "setHasSpeedAccuracy:", 0);
        if (v10)
        {
LABEL_23:
          objc_msgSend(v18, "horizontalAccuracy");
          if (*(float *)&v20 <= 10.0)
            *(float *)&v20 = 1111.0;
          else
            LODWORD(v20) = dword_23CC49CA8[*(float *)&v20 > 50.0];
          objc_msgSend(v18, "setHorizontalAccuracy:", v20);
          if (!v9)
            continue;
          goto LABEL_27;
        }
LABEL_17:
        if (!v9)
          continue;
LABEL_27:
        if (objc_msgSend(v18, "hasVerticalAccuracy"))
        {
          objc_msgSend(v18, "verticalAccuracy");
          if (*(float *)&v21 <= 10.0)
            *(float *)&v21 = 1111.0;
          else
            LODWORD(v21) = dword_23CC49CA8[*(float *)&v21 > 50.0];
          objc_msgSend(v18, "setVerticalAccuracy:", v21);
        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (!v15)
      {
LABEL_34:

        return;
      }
    }
  }
}

+ (BOOL)_fuzzCNProbes:(id)a3
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  objc_msgSend(a1, "_withCollectionRequest:fuzzBaseline:fuzzCourseAccuracy:fuzzSpeedAccuracy:fuzzHorizAccuracy:fuzzVertAccuracy:useOneSecondPrecision:", a3, 1, 1, 1, 1, 1, v4);
  return 1;
}

+ (unint64_t)_geoShifterObfuscationSeed
{
  return GEOConfigGetUint64();
}

+ (BOOL)_fuzzINProbes:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  float v16;
  float v17;
  void *v18;
  void *v19;
  uint64_t v20;
  double v21;
  double v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  uint32_t v26;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE buf[32];
  __int16 v46;
  double v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (GEOConfigGetBOOL())
  {
    v5 = objc_msgSend(a1, "_geoShifterObfuscationSeed");
    v28 = v5 != 0;
    if (v5)
    {
      v6 = v5;
      v34 = 0u;
      v35 = 0u;
      v32 = 0u;
      v33 = 0u;
      objc_msgSend(v4, "locations");
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
      if (!v8)
        goto LABEL_28;
      v9 = *(_QWORD *)v33;
      while (1)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v9)
            objc_enumerationMutation(v7);
          v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          v30 = 0.0;
          v31 = 0.0;
          v29 = 0.0;
          objc_msgSend(v11, "latitude");
          v13 = v12;
          objc_msgSend(v11, "longitude");
          v15 = v14;
          objc_msgSend(v11, "altitude");
          v17 = v16;
          v36 = 0;
          v37 = &v36;
          v38 = 0x2020000000;
          v18 = off_254316C78;
          v39 = off_254316C78;
          if (!off_254316C78)
          {
            v40 = 0;
            v41 = 0;
            v42 = &v41;
            v43 = 0x2020000000;
            v19 = (void *)_MergedGlobals_11;
            v44 = _MergedGlobals_11;
            if (!_MergedGlobals_11)
            {
              *(_OWORD *)buf = xmmword_250DC12F0;
              *(_OWORD *)&buf[16] = *(_OWORD *)&off_250DC1300;
              v20 = _sl_dlopen();
              v42[3] = v20;
              _MergedGlobals_11 = v20;
              v19 = (void *)v20;
            }
            _Block_object_dispose(&v41, 8);
            if (!v19)
            {
              abort_report_np();
LABEL_32:
              __break(1u);
            }
            if (v40)
              free(v40);
            v18 = dlsym(v19, "GeoShifter_obfuscate");
            v37[3] = (uint64_t)v18;
            off_254316C78 = v18;
          }
          _Block_object_dispose(&v36, 8);
          if (!v18)
          {
            dlerror();
            abort_report_np();
            goto LABEL_32;
          }
          v21 = v17;
          ((void (*)(uint64_t, double *, double *, double *, double, double, double))v18)(v6, &v31, &v30, &v29, v13, v15, v21);
          objc_msgSend(v11, "setLatitude:", v31);
          objc_msgSend(v11, "setLongitude:", v30);
          if (objc_msgSend(v11, "hasAltitude"))
          {
            HIDWORD(v22) = HIDWORD(v29);
            *(float *)&v22 = v29;
            objc_msgSend(v11, "setAltitude:", v22);
            GEOGetTrafficProbeAnalyticsLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              goto LABEL_22;
            *(_DWORD *)buf = 134546945;
            *(double *)&buf[4] = v13;
            *(_WORD *)&buf[12] = 2053;
            *(double *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2053;
            *(double *)&buf[24] = v21;
            v46 = 2053;
            v47 = v31;
            v48 = 2053;
            v49 = v30;
            v50 = 2053;
            v51 = v29;
            v24 = v23;
            v25 = "blurring result (%{sensitive}f, %{sensitive}f, %{sensitive}f) --> (%{sensitive}f, %{sensitive}f, %{sensitive}f)";
            v26 = 62;
          }
          else
          {
            GEOGetTrafficProbeAnalyticsLog();
            v23 = objc_claimAutoreleasedReturnValue();
            if (!os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
              goto LABEL_22;
            *(_DWORD *)buf = 134546433;
            *(double *)&buf[4] = v13;
            *(_WORD *)&buf[12] = 2053;
            *(double *)&buf[14] = v15;
            *(_WORD *)&buf[22] = 2053;
            *(double *)&buf[24] = v31;
            v46 = 2053;
            v47 = v30;
            v24 = v23;
            v25 = "blurring result (%{sensitive}f, %{sensitive}f) --> (%{sensitive}f, %{sensitive}f)";
            v26 = 42;
          }
          _os_log_impl(&dword_23CBB4000, v24, OS_LOG_TYPE_DEBUG, v25, buf, v26);
LABEL_22:

        }
        v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v32, v52, 16);
        if (!v8)
          goto LABEL_28;
      }
    }
    GEOGetTrafficProbeAnalyticsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_23CBB4000, v7, OS_LOG_TYPE_INFO, "shifting seed not available; must drop", buf, 2u);
    }
LABEL_28:

  }
  else
  {
    v28 = 1;
  }

  return v28;
}

+ (BOOL)_fuzzROWProbes:(id)a3
{
  id v4;
  uint64_t BOOL;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v4 = a3;
  BOOL = GEOConfigGetBOOL();
  v6 = GEOConfigGetBOOL();
  v7 = GEOConfigGetBOOL();
  v8 = GEOConfigGetBOOL();
  v9 = GEOConfigGetBOOL();
  LOBYTE(v11) = GEOConfigGetBOOL();
  objc_msgSend(a1, "_withCollectionRequest:fuzzBaseline:fuzzCourseAccuracy:fuzzSpeedAccuracy:fuzzHorizAccuracy:fuzzVertAccuracy:useOneSecondPrecision:", v4, BOOL, v6, v7, v8, v9, v11);

  return 1;
}

@end
