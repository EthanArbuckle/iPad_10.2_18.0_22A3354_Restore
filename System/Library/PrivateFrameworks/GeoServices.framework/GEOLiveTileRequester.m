@implementation GEOLiveTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 18;
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
  objc_msgSend(v5, "activeTileSetForStyle:size:scale:", ((*(_QWORD *)(a3 + 1) >> 58) | (*(_DWORD *)(a3 + 9) << 6)) & 0x3FFF, (*(_DWORD *)(a3 + 9) >> 8) & 0xF, (unsigned __int16)*(_DWORD *)(a3 + 9) >> 12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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
  GEOURLWithHeaders *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(uint64_t, void *);
  void *v22;
  GEOURLWithHeaders *v23;
  id v24;
  void *v25;
  uint64_t v26;

  if ((*(_DWORD *)(a3 + 9) & 0xF0000) == 0)
    return 0;
  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v6);
    if (v7)
    {
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
      v21 = __38__GEOLiveTileRequester_urlForTileKey___block_invoke;
      v22 = &unk_1E1C0DBE0;
      v26 = a3;
      v13 = v5;
      v23 = v13;
      v24 = v11;
      v25 = a1;
      v14 = v11;
      -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v7, "updateQueryItemsWithBlock:", &v19);
      v15 = objc_msgSend(a1, "kindForTileKey:", a3, v19, v20, v21, v22);
      +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOURLComponentsWithHeaders URLComponents](v7, "URLComponents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateURLComponents:forRequestKind:", v17, v15);

      GEOURLAuthenticationForComponents(v7, v13);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v18 = 0;
    }

  }
  else
  {
    objc_msgSend(a1, "_localizationURLForTileKey:", a3);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

void __38__GEOLiveTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "addItemWithName:uintValue:", CFSTR("style"), ((*(_QWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 58) | (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 9) << 6)) & 0x3FFF);
  objc_msgSend(v5, "addItemWithName:uintValue:", CFSTR("size"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 10) & 0xF);
  objc_msgSend(v5, "addItemWithName:uintValue:", CFSTR("scale"), (unsigned __int16)*(_DWORD *)(*(_QWORD *)(a1 + 56) + 9) >> 12);
  objc_msgSend(v5, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(*(id *)(a1 + 32), "version"));
  objc_msgSend(v5, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1) & 0x3F);
  objc_msgSend(v5, "addItemWithName:uintValue:", CFSTR("x"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 6);
  objc_msgSend(v5, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 5) & 0x3FFFFFF);
  objc_msgSend(v5, "addItemWithName:uintValue:", CFSTR("domain"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 11) & 0xF);
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1EDF4E2A8))
    objc_msgSend(v5, "addItemWithName:value:", CFSTR("vertical_datum"), CFSTR("wgs84"));
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v5, "addItemWithName:value:", CFSTR("vlang"));
  v3 = objc_msgSend(*(id *)(a1 + 48), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 56));
  v4 = v5;
  if (v3)
  {
    objc_msgSend(v5, "addItemWithName:intValue:", CFSTR("checksum"));
    v4 = v5;
  }

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
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t, void *);
  void *v23;
  GEOURLWithHeaders *v24;
  id v25;
  void *v26;
  uint64_t v27;

  if ((*(_DWORD *)(a3 + 9) & 0xF0000) == 0)
    return 0;
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
        v20 = MEMORY[0x1E0C809B0];
        v21 = 3221225472;
        v22 = __51__GEOLiveTileRequester__localizationURLForTileKey___block_invoke;
        v23 = &unk_1E1C0DBE0;
        v27 = a3;
        v14 = v5;
        v24 = v14;
        v25 = v13;
        v26 = a1;
        -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v10, "updateQueryItemsWithBlock:", &v20);
        v15 = objc_msgSend(a1, "kindForTileKey:", a3, v20, v21, v22, v23);
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

void __51__GEOLiveTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(v9, "addItemWithName:uintValue:", CFSTR("style"), ((*(_QWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 58) | (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 9) << 6)) & 0x3FFF);
  objc_msgSend(v9, "addItemWithName:uintValue:", CFSTR("size"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 10) & 0xF);
  objc_msgSend(v9, "addItemWithName:uintValue:", CFSTR("scale"), (unsigned __int16)*(_DWORD *)(*(_QWORD *)(a1 + 56) + 9) >> 12);
  objc_msgSend(v9, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(*(id *)(a1 + 32), "version"));
  objc_msgSend(v9, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1) & 0x3F);
  objc_msgSend(v9, "addItemWithName:uintValue:", CFSTR("x"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 6);
  objc_msgSend(v9, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 5) & 0x3FFFFFF);
  objc_msgSend(v9, "addItemWithName:uintValue:", CFSTR("domain"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 11) & 0xF);
  objc_msgSend(v9, "addItemWithName:value:", CFSTR("lang"), *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 48), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 56));
  if ((_DWORD)v3)
    objc_msgSend(v9, "addItemWithName:intValue:", CFSTR("checksum"), v3);
  +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addItemsFromArray:", v5);

  +[GEOPreflight queryItems](GEOPreflight, "queryItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addItemsFromArray:", v6);

  objc_msgSend(*(id *)(a1 + 48), "resourceManifestManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "disputedBordersQueryItemsForTileKey:country:region:", *(_QWORD *)(a1 + 56), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addItemsFromArray:", v8);

}

@end
