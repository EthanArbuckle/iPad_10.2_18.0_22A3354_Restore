@implementation GEOS2MapTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 16;
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
  objc_msgSend(v5, "activeTileSetForStyle:size:scale:", ((*(_QWORD *)(a3 + 1) >> 61) | (8 * *(_DWORD *)(a3 + 9))) & 0x3FFF, (*(_DWORD *)(a3 + 9) >> 11) & 0xF, (*(_DWORD *)(a3 + 9) >> 15) & 0xF);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)urlForTileKey:(uint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  GEOURLComponentsWithHeaders *v11;
  GEOURLWithHeaders *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v19;
  _QWORD v20[4];
  GEOURLWithHeaders *v21;
  id v22;
  void *v23;
  uint64_t v24;

  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    if ((objc_msgSend(v5, "hasLocalizationURL") & 1) != 0 || !objc_msgSend(v5, "supportedLanguagesCount"))
    {
      v10 = 0;
    }
    else
    {
      objc_msgSend(a1, "resourceManifestManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "tileRequest");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "locale");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "languageForTileKey:overrideLocale:", a3, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v11 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v6);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __39__GEOS2MapTileRequester_urlForTileKey___block_invoke;
    v20[3] = &unk_1E1C0DBE0;
    v24 = a3;
    v12 = v5;
    v21 = v12;
    v22 = v10;
    v23 = a1;
    v13 = v10;
    -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v11, "updateQueryItemsWithBlock:", v20);
    v19.receiver = a1;
    v19.super_class = (Class)GEOS2MapTileRequester;
    v14 = -[GEOSimpleTileRequester kindForTileKey:](&v19, sel_kindForTileKey_, a3);
    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOURLComponentsWithHeaders URLComponents](v11, "URLComponents");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "updateURLComponents:forRequestKind:", v16, v14);

    GEOURLAuthenticationForComponents(v11, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_localizationURLForTileKey:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v17;
}

void __39__GEOS2MapTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("style"), ((*(_QWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 61) | (8 * *(_DWORD *)(*(_QWORD *)(a1 + 56) + 9))) & 0x3FFF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("size"), (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 9) >> 11) & 0xF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("scale"), (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 9) >> 15) & 0xF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(*(id *)(a1 + 32), "version"));
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1) & 0x3F);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("x"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 6);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 5) & 0x3FFFFFF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("f"), (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 58) & 7);
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1EDF4E2A8))
    objc_msgSend(v7, "addItemWithName:value:", CFSTR("vertical_datum"), CFSTR("wgs84"));
  if (*(_QWORD *)(a1 + 40))
    objc_msgSend(v7, "addItemWithName:value:", CFSTR("vlang"));
  +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addItemsFromArray:", v4);

  +[GEOPreflight queryItems](GEOPreflight, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addItemsFromArray:", v5);

  v6 = objc_msgSend(*(id *)(a1 + 48), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 56));
  if ((_DWORD)v6)
    objc_msgSend(v7, "addItemWithName:intValue:", CFSTR("checksum"), v6);

}

- (id)_localizationURLForTileKey:(uint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GEOURLComponentsWithHeaders *v13;
  GEOURLWithHeaders *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[4];
  GEOURLWithHeaders *v22;
  id v23;
  void *v24;
  uint64_t v25;

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
    objc_msgSend(v5, "languageForTileKey:overrideLocale:", a3, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v13 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v9);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __52__GEOS2MapTileRequester__localizationURLForTileKey___block_invoke;
      v21[3] = &unk_1E1C0DBE0;
      v25 = a3;
      v14 = v6;
      v22 = v14;
      v23 = v12;
      v24 = a1;
      -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v13, "updateQueryItemsWithBlock:", v21);
      v20.receiver = a1;
      v20.super_class = (Class)GEOS2MapTileRequester;
      v15 = -[GEOSimpleTileRequester kindForTileKey:](&v20, sel_kindForTileKey_, a3);
      +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOURLComponentsWithHeaders URLComponents](v13, "URLComponents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateURLComponents:forRequestKind:", v17, v15);

      GEOURLAuthenticationForComponents(v13, v14);
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

  return v18;
}

void __52__GEOS2MapTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("style"), ((*(_QWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 61) | (8 * *(_DWORD *)(*(_QWORD *)(a1 + 56) + 9))) & 0x3FFF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("size"), (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 9) >> 11) & 0xF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("scale"), (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 9) >> 15) & 0xF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(*(id *)(a1 + 32), "version"));
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1) & 0x3F);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("x"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 6);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 5) & 0x3FFFFFF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("f"), (*(_QWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 58) & 7);
  objc_msgSend(v7, "addItemWithName:value:", CFSTR("lang"), *(_QWORD *)(a1 + 40));
  v3 = objc_msgSend(*(id *)(a1 + 48), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 56));
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

- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4
{
  return GEOConfigGetUInteger(GeoServicesConfig_TileExternalResourceContextSizeThreshold, (uint64_t)off_1EDF4E088) <= a4;
}

@end
