@implementation GEOIdealTransportTypeFinder

+ (int64_t)idealTransportTypeForOrigin:(id)a3 destination:(id)a4 mapType:(int)a5
{
  $F24F406B2B787EFB06265DBA3D28CBD5 v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v6[0] = a3;
  v6[1] = a4;
  return objc_msgSend(a1, "idealTransportTypeForCoordinates:count:mapType:", v6, 2, *(_QWORD *)&a5);
}

+ (int64_t)idealTransportTypeForCoordinates:(id *)a3 count:(unint64_t)a4 mapType:(int)a5
{
  uint64_t v5;
  NSObject *v9;
  __CFString *v10;
  unint64_t v11;
  NSObject *v12;
  id v13;
  __CFString *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  int BOOL;
  NSObject *v21;
  const __CFString *v22;
  $F24F406B2B787EFB06265DBA3D28CBD5 *v23;
  uint64_t v24;
  double var1;
  double var0;
  double v27;
  double v28;
  double v29;
  NSObject *v30;
  double Double;
  NSObject *v32;
  double v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  _BYTE buf[24];
  void *v44;
  uint64_t *v45;
  uint64_t v46;

  v5 = *(_QWORD *)&a5;
  v46 = *MEMORY[0x1E0C80C00];
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    if (v5 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = off_1E1C03368[(int)v5];
    }
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = a4;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v10;
    _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_INFO, "Will determine ideal transport type for %lu coordinates (mapType: %{public}@", buf, 0x16u);

  }
  v11 = GEOGetUserTransportTypePreference();
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(a1, "_transportTypePreferenceAsString:", v11);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v5 >= 5)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v5);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E1C03368[(int)v5];
    }
    *(_DWORD *)buf = 138478083;
    *(_QWORD *)&buf[4] = v13;
    *(_WORD *)&buf[12] = 2113;
    *(_QWORD *)&buf[14] = v14;
    _os_log_impl(&dword_1885A9000, v12, OS_LOG_TYPE_INFO, "\tUser preference: %{private}@, map type: %{private}@\n", buf, 0x16u);

  }
  if (!_MergedGlobals_192)
  {
    *(_OWORD *)buf = xmmword_1E1C03328;
    *(_QWORD *)&buf[16] = 0;
    _MergedGlobals_192 = _sl_dlopen();
  }
  if (_MergedGlobals_192)
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x2050000000;
    v15 = (void *)qword_1ECDBBA48;
    v42 = qword_1ECDBBA48;
    if (!qword_1ECDBBA48)
    {
      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = __getAVExternalDeviceClass_block_invoke;
      v44 = &unk_1E1C03348;
      v45 = &v39;
      __getAVExternalDeviceClass_block_invoke((uint64_t)buf);
      v15 = (void *)v40[3];
    }
    v16 = objc_retainAutorelease(v15);
    _Block_object_dispose(&v39, 8);
    objc_msgSend(v16, "currentCarPlayExternalDevice");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v16) = v17 == 0;

    if ((v16 & 1) == 0)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v19 = "\tReturning [DRIVING] because connected to CarPlay";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
  }
  BOOL = GEOConfigGetBOOL(GeoServicesConfig_ITTEnableDistanceThresholds, (uint64_t)off_1EDF4D5D8);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = CFSTR("NO");
    if (BOOL)
      v22 = CFSTR("YES");
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = v22;
    _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_INFO, "\tenableDistanceThresholds: %@", buf, 0xCu);
  }

  if (!BOOL || v11 > 1)
  {
LABEL_54:
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1, "_transportTypePreferenceAsString:", v11);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      *(_QWORD *)&buf[4] = v36;
      _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_INFO, "\tReturning [%{private}@]", buf, 0xCu);

    }
    goto LABEL_56;
  }
  if (a4 < 2)
  {
LABEL_48:
    if (!v11)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
      v18 = objc_claimAutoreleasedReturnValue();
      v11 = 1;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v11 = 1;
        _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_INFO, "\tReturning [WALKING] because distance between waypoints never exceeds minimum for driving", buf, 2u);
      }
      goto LABEL_56;
    }
    goto LABEL_54;
  }
  v23 = a3 + 1;
  v24 = 1;
  while (1)
  {
    var1 = v23[-1].var1;
    if (var1 < -180.0
      || var1 > 180.0
      || (var0 = v23[-1].var0, var0 < -90.0)
      || var0 > 90.0
      || (v27 = v23->var1, v27 < -180.0)
      || v27 > 180.0
      || (v28 = v23->var0, v23->var0 < -90.0)
      || v28 > 90.0)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1885A9000, v35, OS_LOG_TYPE_INFO, "\tInvalid coordinates provided, skipping distance checks entirely", buf, 2u);
      }

      goto LABEL_54;
    }
    v29 = GEOCalculateDistanceRadius(var0, var1, v28, v27, 6367000.0);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218241;
      *(_QWORD *)&buf[4] = v24;
      *(_WORD *)&buf[12] = 2049;
      *(double *)&buf[14] = v29;
      _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_INFO, "\tDistance to destination %lu is %{private}0.1f meters", buf, 0x16u);
    }

    if (v11 != 1)
      break;
    Double = GEOConfigGetDouble(GeoServicesConfig_ITTMaxDistanceForWalking, (uint64_t)off_1EDF4D5E8);
    GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
    v32 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      *(double *)&buf[4] = Double;
      _os_log_impl(&dword_1885A9000, v32, OS_LOG_TYPE_INFO, "\tmaxDistanceForWalking: %g", buf, 0xCu);
    }

    if (v29 > Double)
    {
      GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        v19 = "\tReturning [DRIVING] because distance is too far to walk";
        goto LABEL_19;
      }
      goto LABEL_20;
    }
LABEL_47:
    ++v24;
    ++v23;
    if (a4 == v24)
      goto LABEL_48;
  }
  v33 = GEOConfigGetDouble(GeoServicesConfig_ITTMinDistanceForVehicle, (uint64_t)off_1EDF4D5F8);
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v33;
    _os_log_impl(&dword_1885A9000, v34, OS_LOG_TYPE_INFO, "\tminDistanceForVehicle: %g", buf, 0xCu);
  }

  if (v29 < v33)
    goto LABEL_47;
  GEOFindOrCreateLog("com.apple.GeoServices", "GEOIdealTransportTypeFinder");
  v18 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    goto LABEL_20;
  *(_WORD *)buf = 0;
  v19 = "\tReturning [DRIVING] because distance is above minimum threshold";
LABEL_19:
  _os_log_impl(&dword_1885A9000, v18, OS_LOG_TYPE_INFO, v19, buf, 2u);
LABEL_20:
  v11 = 0;
LABEL_56:

  return v11;
}

+ (int64_t)idealTransportTypeForMapType:(int)a3
{
  return objc_msgSend(a1, "idealTransportTypeForOrigin:destination:mapType:", *(_QWORD *)&a3, -180.0, -180.0, -180.0, -180.0);
}

+ (int64_t)idealTransportType
{
  return objc_msgSend(a1, "idealTransportTypeForMapType:", 0);
}

+ (id)_transportTypePreferenceAsString:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("UNKNOWN");
  else
    return off_1E1C03390[a3];
}

@end
