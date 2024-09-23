@implementation GEONetworkEventDataRecorder

+ (void)recordNetworkEventDataForDataRequestKind:(id)a3 usedBackgroundURL:(id)a4 requestAppIdentifier:(id)a5 appMajorVersion:(id)a6 appMinorVersion:(id)a7 error:(id)a8 clientMetrics:(id)a9 additionalStates:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  int v26;
  int v27;
  unsigned int v28;
  int v29;
  int v30;
  int v31;
  unsigned int v32;
  id v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v21 = a9;
  v22 = a10;
  if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    v33 = a1;
    GEODataRequestKindAsString(*(_QWORD *)&a3);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetNetEventRecorderLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v35 = v23;
      _os_log_impl(&dword_1885A9000, v24, OS_LOG_TYPE_DEBUG, "saving netevent data for kind %@", buf, 0xCu);
    }

    if (a3.var0 <= 767)
    {
      if (a3.var0 == 673)
        v26 = 6;
      else
        v26 = 0;
      if (a3.var0 == 672)
        v27 = 7;
      else
        v27 = v26;
      if (a3.var0 == 512)
        v28 = 4;
      else
        v28 = v27;
      if (HIDWORD(*(unint64_t *)&a3) == 57)
        v29 = 25;
      else
        v29 = 5;
      if (a3.var0 != 256)
        v29 = 0;
      if (a3.var0 == 6)
        v30 = 24;
      else
        v30 = v29;
      if (a3.var0 <= 511)
        v28 = v30;
      if ((a3.var0 - 4) >= 2)
        v31 = 0;
      else
        v31 = 14;
      if ((a3.var0 - 2) >= 2)
        v32 = v31;
      else
        v32 = 19;
      if (a3.var0 <= 5)
        v25 = v32;
      else
        v25 = v28;
    }
    else
    {
      v25 = 0;
      if (a3.var0 <= 2847)
      {
        if (a3.var0 == 768 || a3.var0 == 1280 || a3.var0 == 1792)
          v25 = 13;
      }
      else
      {
        switch(a3.var0)
        {
          case 0xB20:
            v25 = 11;
            break;
          case 0xB21:
            v25 = 12;
            break;
          case 0xB22:
            v25 = 18;
            break;
          case 0xB23:
            v25 = 17;
            break;
          case 0xB27:
            v25 = 9;
            break;
          case 0xB28:
            v25 = 23;
            break;
          case 0xB2A:
            v25 = 27;
            break;
          default:
            break;
        }
      }
    }
    objc_msgSend(v33, "_recordNetworkEventForDataRequestKind:networkService:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:states:", a3, v25, v16, v17, v18, v19, v20, v21, v22);

  }
}

+ (void)_recordNetworkEventForDataRequestKind:(id)a3 networkService:(int)a4 usedBackgroundURL:(id)a5 requestAppIdentifier:(id)a6 appMajorVersion:(id)a7 appMinorVersion:(id)a8 error:(id)a9 clientMetrics:(id)a10 states:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  int v35;
  $C4D369C9F02205611300857CFD58F739 v36;

  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v20 = a11;
  +[GEOReferenceTimeManager sharedManager](GEOReferenceTimeManager, "sharedManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __182__GEONetworkEventDataRecorder__recordNetworkEventForDataRequestKind_networkService_usedBackgroundURL_requestAppIdentifier_appMajorVersion_appMinorVersion_error_clientMetrics_states___block_invoke;
  v28[3] = &unk_1E1C10288;
  v35 = a4;
  v36 = a3;
  v29 = v15;
  v30 = v16;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v34 = v20;
  v22 = v20;
  v23 = v19;
  v24 = v18;
  v25 = v17;
  v26 = v16;
  v27 = v15;
  objc_msgSend(v21, "referenceTimeResult:", v28);

}

void __182__GEONetworkEventDataRecorder__recordNetworkEventForDataRequestKind_networkService_usedBackgroundURL_requestAppIdentifier_appMajorVersion_appMinorVersion_error_clientMetrics_states___block_invoke(uint64_t a1, int a2, double a3)
{
  void *v5;
  GEONetworkEventData *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceReferenceDate:", a3);
    v6 = objc_alloc_init(GEONetworkEventData);
    -[GEONetworkEventData setEventTimestamp:](v6, "setEventTimestamp:", a3);
    -[GEONetworkEventData setNetworkService:](v6, "setNetworkService:", *(unsigned int *)(a1 + 80));
    -[GEONetworkEventData setDataRequestKindType:](v6, "setDataRequestKindType:", *(unsigned int *)(a1 + 84));
    -[GEONetworkEventData setDataRequestKindSubtype:](v6, "setDataRequestKindSubtype:", *(unsigned int *)(a1 + 88));
    -[GEONetworkEventData setAppIdentifier:](v6, "setAppIdentifier:", *(_QWORD *)(a1 + 32));
    -[GEONetworkEventData setRequestingAppIdentifier:](v6, "setRequestingAppIdentifier:", *(_QWORD *)(a1 + 32));
    -[GEONetworkEventData setRequestingAppMajorVer:](v6, "setRequestingAppMajorVer:", *(_QWORD *)(a1 + 40));
    -[GEONetworkEventData setRequestingAppMinorVer:](v6, "setRequestingAppMinorVer:", *(_QWORD *)(a1 + 48));
    v7 = *(void **)(a1 + 56);
    if (v7)
    {
      objc_msgSend(v7, "domain");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEONetworkEventData setErrorDomain:](v6, "setErrorDomain:", v8);

      -[GEONetworkEventData setErrorCode:](v6, "setErrorCode:", objc_msgSend(*(id *)(a1 + 56), "code"));
    }
    -[GEONetworkEventData setClientMetrics:](v6, "setClientMetrics:", *(_QWORD *)(a1 + 64));
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v9 = *(id *)(a1 + 72);
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v27;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(v9);
          -[GEONetworkEventData addAdditionalStates:](v6, "addAdditionalStates:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13++), (_QWORD)v26);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v11);
    }

    +[GEOCountryConfiguration sharedConfiguration](GEOCountryConfiguration, "sharedConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "countryCode");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONetworkEventData setCountryCode:](v6, "setCountryCode:", v15);

    +[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "activeTileGroup");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONetworkEventData setTilesetId:](v6, "setTilesetId:", objc_msgSend(v17, "identifier"));

    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localeIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONetworkEventData setLocale:](v6, "setLocale:", v19);

    _getValue(GeoServicesConfig_ResourceManifestEnvironment, (uint64_t)off_1EDF4CC88, 1, 0, 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONetworkEventData setManifestEnvironment:](v6, "setManifestEnvironment:", v20);

    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "experimentsInfo");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "mapsAbClientMetadata");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "clientDatasetMetadata");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEONetworkEventData setDatasetId:](v6, "setDatasetId:", objc_msgSend(v24, "datasetId"));

    +[GEONetworkEventFileManager sharedManager](GEONetworkEventFileManager, "sharedManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "saveNetworkEventData:atTime:", v6, v5);

  }
}

+ (id)sharedRecorder
{
  if (qword_1ECDBC280 != -1)
    dispatch_once(&qword_1ECDBC280, &__block_literal_global_121);
  return (id)_MergedGlobals_261;
}

void __45__GEONetworkEventDataRecorder_sharedRecorder__block_invoke()
{
  GEONetworkEventDataRecorder *v0;
  void *v1;

  v0 = objc_alloc_init(GEONetworkEventDataRecorder);
  v1 = (void *)_MergedGlobals_261;
  _MergedGlobals_261 = (uint64_t)v0;

}

+ (void)recordNetworkEventDataForTileKey:(uint64_t)a3 requestAppIdentifier:(uint64_t)a4 appMajorVersion:(void *)a5 appMinorVersion:(void *)a6 error:(void *)a7 clientMetrics:(void *)a8 additionalStates:(void *)a9
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  GEOTileSetInfo *v25;
  int v26;
  unsigned __int8 *v27;
  GEOLogMsgState *v28;
  GEOLogMsgStateTileSet *v29;
  void *v30;
  uint64_t v31;
  GEOTileSetInfo *v32;
  GEOLogMsgState *v33;
  uint8_t buf[4];
  void *v35;
  uint64_t v36;
  _QWORD v37[2];

  v37[1] = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v37[0] = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    GEOGetNetEventRecorderLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      GEOStringFromTileKey((char *)&v36);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138477827;
      v35 = v21;
      _os_log_impl(&dword_1885A9000, v20, OS_LOG_TYPE_DEBUG, "saving netevent data for tilekey %{private}@", buf, 0xCu);

    }
    *(_DWORD *)buf = 0;
    if (GEOTileKeyStyle((uint64_t)&v36, buf))
    {
      v22 = *(unsigned int *)buf;
      v23 = ((unint64_t)*(unsigned int *)buf << 32) | 0x100;
      if (*(_DWORD *)buf == 57 || (v36 & 0x7F) == 7)
      {
        v24 = 25;
LABEL_17:
        objc_msgSend(a1, "_recordNetworkEventForDataRequestKind:networkService:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:states:", v23, v24, 0, v14, v15, v16, v17, v18, v19);
        goto LABEL_18;
      }
      v25 = objc_alloc_init(GEOTileSetInfo);
      -[GEOTileSetInfo setCount:](v25, "setCount:", 1);
      v32 = v25;
      -[GEOTileSetInfo setStyle:](v25, "setStyle:", v22);
      v26 = v36 & 0x7F;
      if (v26 == 15)
      {
        v27 = (unsigned __int8 *)v37 + 1;
      }
      else
      {
        if (v26 != 13)
        {
LABEL_13:
          v28 = objc_alloc_init(GEOLogMsgState);
          -[GEOLogMsgState setStateType:](v28, "setStateType:", 706);
          v29 = objc_alloc_init(GEOLogMsgStateTileSet);
          -[GEOLogMsgState setTileSet:](v28, "setTileSet:", v29);

          -[GEOLogMsgState tileSet](v28, "tileSet");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "addTileSetInfo:", v32);

          if (v19)
          {
            objc_msgSend(v19, "arrayByAddingObject:", v28);
            v31 = objc_claimAutoreleasedReturnValue();

            v19 = (id)v31;
          }
          else
          {
            v33 = v28;
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
            v19 = (id)objc_claimAutoreleasedReturnValue();
          }

          v24 = 5;
          goto LABEL_17;
        }
        v27 = (unsigned __int8 *)&v36 + 3;
      }
      -[GEOTileSetInfo setUncertainty:](v25, "setUncertainty:", *v27);
      goto LABEL_13;
    }
  }
LABEL_18:

}

+ (void)recordNetworkEventDataForDataRequestKind:(id)a3 networkService:(int)a4 usedBackgroundURL:(id)a5 requestAppIdentifier:(id)a6 appMajorVersion:(id)a7 appMinorVersion:(id)a8 error:(id)a9 clientMetrics:(id)a10 additionalStates:(id)a11
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  if (+[GEOPlatform isRunningInGeod](GEOPlatform, "isRunningInGeod"))
  {
    GEODataRequestKindAsString(*(_QWORD *)&a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetNetEventRecorderLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v27 = v22;
      _os_log_impl(&dword_1885A9000, v23, OS_LOG_TYPE_DEBUG, "saving netevent data for kind %@", buf, 0xCu);
    }

    objc_msgSend(a1, "_recordNetworkEventForDataRequestKind:networkService:usedBackgroundURL:requestAppIdentifier:appMajorVersion:appMinorVersion:error:clientMetrics:states:", a3, a4, v15, v16, v17, v18, v19, v20, v21);
  }

}

@end
