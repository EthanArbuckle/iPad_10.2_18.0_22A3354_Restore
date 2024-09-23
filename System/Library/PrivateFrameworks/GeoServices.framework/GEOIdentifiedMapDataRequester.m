@implementation GEOIdentifiedMapDataRequester

+ (unsigned)tileProviderIdentifier
{
  return 9;
}

+ (uint64_t)tileSetForKey:(uint64_t)a3
{
  return (*(unsigned __int8 *)(a3 + 10) << 8) | 0x800001u;
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

- (id)activeTileSetForKey:(uint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a1, "resourceManifestManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTileGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeTileSetForStyle:", *(unsigned __int8 *)(a3 + 10));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOURLComponentsWithHeaders)_urlComponentsForKey:(uint64_t)a3 url:(void *)a4
{
  id v6;
  GEOURLComponentsWithHeaders *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  GEOURLComponentsWithHeaders *v17;
  _QWORD v19[6];

  v6 = a4;
  v7 = -[GEOURLComponentsWithHeaders initWithURL:]([GEOURLComponentsWithHeaders alloc], "initWithURL:", v6);

  if (v7)
  {
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __58__GEOIdentifiedMapDataRequester__urlComponentsForKey_url___block_invoke;
    v19[3] = &unk_1E1C0DA10;
    v19[4] = a1;
    v19[5] = a3;
    -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v7, "updateQueryItemsWithBlock:", v19);
    v8 = *(unsigned __int8 *)(a3 + 10);
    if ((_DWORD)v8 == 60)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((*(_DWORD *)(a3 + 11) & 1) != 0)
      {
        objc_msgSend(CFSTR("application/vnd.apple.maps.material;tex="), "stringByAppendingString:", CFSTR("astc"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v10);

      }
      objc_msgSend(CFSTR("application/vnd.apple.maps.material;tex="), "stringByAppendingString:", CFSTR("png"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "addObject:", v11);

      objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOURLComponentsWithHeaders headerFields](v7, "headerFields");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, CFSTR("Accept"));

      v8 = *(unsigned __int8 *)(a3 + 10);
    }
    v14 = (v8 << 32) | 0x100;
    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOURLComponentsWithHeaders URLComponents](v7, "URLComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateURLComponents:forRequestKind:", v16, v14);

    v17 = v7;
  }

  return v7;
}

void __58__GEOIdentifiedMapDataRequester__urlComponentsForKey_url___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("style"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 10));
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1EDF4E2A8))
    objc_msgSend(v7, "addItemWithName:value:", CFSTR("vertical_datum"), CFSTR("wgs84"));
  v3 = objc_msgSend(*(id *)(a1 + 32), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)v3)
    objc_msgSend(v7, "addItemWithName:intValue:", CFSTR("checksum"), v3);
  +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addItemsFromArray:", v5);

  +[GEOPreflight queryItems](GEOPreflight, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addItemsFromArray:", v6);

}

- (id)urlForTileKey:(uint64_t)a3
{
  GEOURLWithHeaders *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (GEOURLWithHeaders *)objc_claimAutoreleasedReturnValue();
  -[GEOURLWithHeaders baseURL](v5, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6), (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), *(_QWORD *)(a3 + 1));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLByAppendingPathComponent:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), -[GEOURLWithHeaders version](v5, "version"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "URLByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "_urlComponentsForKey:url:", a3, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    GEOURLAuthenticationForComponents(v13, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4
{
  return GEOConfigGetUInteger(GeoServicesConfig_TileExternalResourceContextSizeThreshold, (uint64_t)off_1EDF4E088) <= a4;
}

@end
