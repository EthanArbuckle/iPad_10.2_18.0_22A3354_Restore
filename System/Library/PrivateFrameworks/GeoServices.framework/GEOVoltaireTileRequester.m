@implementation GEOVoltaireTileRequester

- (id)activeTileSetForKey:(uint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "resourceManifestManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTileGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTileSetForStyle:size:scale:", *(unsigned __int16 *)(a3 + 13) >> 2, *(_BYTE *)(a3 + 15) & 0xF, *(unsigned __int8 *)(a3 + 15) >> 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (unsigned)tileProviderIdentifier
{
  return 2;
}

void __42__GEOVoltaireTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  objc_msgSend(v12, "addItemWithName:uintValue:", CFSTR("style"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 56) + 13) >> 2);
  objc_msgSend(v12, "addItemWithName:uintValue:", CFSTR("size"), *(_BYTE *)(*(_QWORD *)(a1 + 56) + 15) & 0xF);
  objc_msgSend(v12, "addItemWithName:uintValue:", CFSTR("scale"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 56) + 15) >> 4);
  objc_msgSend(*(id *)(a1 + 32), "resourceManifestManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "versionForTileKey:", *(_QWORD *)(a1 + 56));

  objc_msgSend(v12, "addItemWithName:uintValue:", CFSTR("v"), v4);
  objc_msgSend(v12, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 6) & 0x3F);
  objc_msgSend(v12, "addItemWithName:uintValue:", CFSTR("x"), ((*(_QWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 46) | (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 9) << 18)) & 0x3FFFFFF);
  objc_msgSend(v12, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 10) & 0x3FFFFFF);
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1EDF4E2A8))
    objc_msgSend(v12, "addItemWithName:value:", CFSTR("vertical_datum"), CFSTR("wgs84"));
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v12, "addItemWithName:value:", CFSTR("vlang"));
  v5 = objc_msgSend(*(id *)(a1 + 32), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 56));
  if ((_DWORD)v5)
    objc_msgSend(v12, "addItemWithName:intValue:", CFSTR("checksum"), v5);
  +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addItemsFromArray:", v7);

  +[GEOPreflight queryItems](GEOPreflight, "queryItems");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addItemsFromArray:", v8);

  objc_msgSend(*(id *)(a1 + 32), "resourceManifestManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "disputedBordersQueryItemsForTileKey:country:region:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addItemsFromArray:", v10);

  objc_msgSend(*(id *)(a1 + 32), "_deviceRegionSKUQueryItemForTileSet:", *(_QWORD *)(a1 + 48));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    objc_msgSend(v12, "addItem:", v11);

}

- (BOOL)checksumMethodForIncomingTileDataWithKey:(uint64_t)a3
{
  void *v3;
  _BOOL8 v4;

  if (!a3)
    return 0;
  objc_msgSend(a1, "activeTileSetForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasChecksumType") && objc_msgSend(v3, "checksumType") == 1;

  return v4;
}

- (id)_deviceRegionSKUQueryItemForTileSet:(id)a3
{
  void *v3;
  char BOOL;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a3, "deviceSKUAllowlists");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    BOOL = GEOConfigGetBOOL(GeoServicesConfig_SKURegionsServiceAllowlistAppliesToTiles, (uint64_t)off_1EDF4DDD8);
    +[GEOPlatform sharedPlatform](GEOPlatform, "sharedPlatform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if ((BOOL & 1) != 0)
      objc_msgSend(v5, "deviceCountrySKUForServiceRequests");
    else
      objc_msgSend(v5, "deviceCountrySKU");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 && objc_msgSend(v3, "containsObject:", v7))
    {
      objc_msgSend(MEMORY[0x1E0CB39D8], "queryItemWithName:value:", CFSTR("sku"), v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4
{
  return GEOConfigGetUInteger(GeoServicesConfig_TileExternalResourceContextSizeThreshold, (uint64_t)off_1EDF4E088) <= a4;
}

- (id)urlForTileKey:(uint64_t)a3
{
  void *v5;
  void *v6;
  GEOURLComponentsWithHeaders *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  GEOURLWithHeaders *v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  void *v23;
  id v24;
  GEOURLWithHeaders *v25;
  uint64_t v26;

  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v6);
    if (v7)
    {
      GEOTileKeyAssertIsStandard(a3);
      if ((objc_msgSend(v5, "hasLocalizationURL") & 1) != 0 || !objc_msgSend(v5, "supportedLanguagesCount"))
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(a1, "resourceManifestManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "tileRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "locale");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "languageForTileKey:overrideLocale:", a3, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();

      }
      v19 = MEMORY[0x1E0C809B0];
      v20 = 3221225472;
      v21 = __42__GEOVoltaireTileRequester_urlForTileKey___block_invoke;
      v22 = &unk_1E1C0DBE0;
      v26 = a3;
      v23 = a1;
      v24 = v11;
      v12 = v5;
      v25 = v12;
      v13 = v11;
      -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v7, "updateQueryItemsWithBlock:", &v19);
      v14 = objc_msgSend(a1, "kindForTileKey:", a3, v19, v20, v21, v22, v23);
      +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOURLComponentsWithHeaders URLComponents](v7, "URLComponents");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "updateURLComponents:forRequestKind:", v16, v14);

      GEOURLAuthenticationForComponents(v7, v12);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "_localizationURLForTileKey:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

- (id)localizationURLForTileKey:(uint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(a1, "_localizationURLForTileKey:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)needsLocalizationForKey:(uint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;

  objc_msgSend(a1, "resourceManifestManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activeTileSetForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tileRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizationURLStringIfNecessaryForActiveTileSet:tileKey:overrideLocale:", v6, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(a1, "tileRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "locale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bestLanguageWithOverrideLocale:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = v12 != 0;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_localizationURLForTileKey:(uint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  GEOURLComponentsWithHeaders *v10;
  void *v11;
  void *v12;
  void *v13;
  GEOURLWithHeaders *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  void *v23;
  GEOURLWithHeaders *v24;
  uint64_t v25;

  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "resourceManifestManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tileRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "locale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizationURLStringIfNecessaryForActiveTileSet:tileKey:overrideLocale:", v5, a3, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v10 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v9);
    if (v10)
    {
      objc_msgSend(a1, "tileRequest");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "locale");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "languageForTileKey:overrideLocale:", a3, v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        GEOTileKeyAssertIsStandard(a3);
        v20[0] = MEMORY[0x1E0C809B0];
        v20[1] = 3221225472;
        v20[2] = __55__GEOVoltaireTileRequester__localizationURLForTileKey___block_invoke;
        v20[3] = &unk_1E1C0DC08;
        v25 = a3;
        v21 = v6;
        v22 = v13;
        v23 = a1;
        v14 = v5;
        v24 = v14;
        -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v10, "updateQueryItemsWithBlock:", v20);
        v15 = objc_msgSend(a1, "kindForTileKey:", a3);
        +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOURLComponentsWithHeaders URLComponents](v10, "URLComponents");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "updateURLComponents:forRequestKind:", v17, v15);

        GEOURLAuthenticationForComponents(v10, v14);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v18 = 0;
      }

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (BOOL)shouldAllowEmptyDataForTileKey:(uint64_t)a3
{
  return (((unint64_t)*(unsigned __int16 *)(a3 + 13) << 32) & 0xFFFC00000000) == 0xE400000000;
}

void __55__GEOVoltaireTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "addItemWithName:uintValue:", CFSTR("style"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 64) + 13) >> 2);
  objc_msgSend(v10, "addItemWithName:uintValue:", CFSTR("size"), *(_BYTE *)(*(_QWORD *)(a1 + 64) + 15) & 0xF);
  objc_msgSend(v10, "addItemWithName:uintValue:", CFSTR("scale"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 64) + 15) >> 4);
  objc_msgSend(v10, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", *(_QWORD *)(a1 + 64)));
  objc_msgSend(v10, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(*(_QWORD *)(a1 + 64) + 6) & 0x3F);
  objc_msgSend(v10, "addItemWithName:uintValue:", CFSTR("x"), ((*(_QWORD *)(*(_QWORD *)(a1 + 64) + 1) >> 46) | (*(_DWORD *)(*(_QWORD *)(a1 + 64) + 9) << 18)) & 0x3FFFFFF);
  objc_msgSend(v10, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(*(_QWORD *)(a1 + 64) + 10) & 0x3FFFFFF);
  objc_msgSend(v10, "addItemWithName:value:", CFSTR("lang"), *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 48), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 64));
  if ((_DWORD)v3)
    objc_msgSend(v10, "addItemWithName:intValue:", CFSTR("checksum"), v3);
  +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addItemsFromArray:", v5);

  +[GEOPreflight queryItems](GEOPreflight, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addItemsFromArray:", v6);

  objc_msgSend(*(id *)(a1 + 48), "resourceManifestManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disputedBordersQueryItemsForTileKey:country:region:", *(_QWORD *)(a1 + 64), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addItemsFromArray:", v8);

  objc_msgSend(*(id *)(a1 + 48), "_deviceRegionSKUQueryItemForTileSet:", *(_QWORD *)(a1 + 56));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v10, "addItem:", v9);

}

- (void)failedLoadingTileForKey:(uint64_t)a3 baseOperation:(uint64_t)a4 error:(uint64_t)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (!a1[192])
  {
    v11 = a6;
    v7 = (void *)MEMORY[0x1E0C99D20];
    v8 = a6;
    objc_msgSend(v7, "arrayWithObjects:count:", &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "resourceManifestManager", v11, v12);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    a1[192] = GEOVoltaireTileRequesterHandleStaleManifestForErrors(v9, v10);

  }
}

- (id)additionalAnalyticsStatesForKey:(uint64_t)a3
{
  GEOLogMsgState *v4;
  GEOLogMsgStateTileSet *v5;
  GEOTileSetInfo *v6;
  void *v7;
  void *v8;
  unsigned int v10;
  unsigned int v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(GEOLogMsgState);
  -[GEOLogMsgState setStateType:](v4, "setStateType:", 706);
  v5 = objc_alloc_init(GEOLogMsgStateTileSet);
  -[GEOLogMsgState setTileSet:](v4, "setTileSet:", v5);

  v6 = objc_alloc_init(GEOTileSetInfo);
  -[GEOTileSetInfo setCount:](v6, "setCount:", 1);
  v11 = 0;
  GEOTileKeyStyle(a3, &v11);
  -[GEOTileSetInfo setStyle:](v6, "setStyle:", v11);
  v10 = 0;
  GEOTileKeyZoom(a3, &v10);
  -[GEOTileSetInfo setZoom:](v6, "setZoom:", v10);
  -[GEOLogMsgState tileSet](v4, "tileSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTileSetInfo:", v6);

  v12[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
