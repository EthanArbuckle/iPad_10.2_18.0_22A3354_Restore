@implementation GEOContourLinesSimpleTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 20;
}

- (uint64_t)_regularTileKeyForContourLinesTileKey:(uint64_t)a3 units:(_BYTE *)a4
{
  unint64_t v4;
  __int128 v6;

  if (!a3 || (*(_BYTE *)a3 & 0x7F) != 0x14)
    return 0;
  v4 = *(_QWORD *)(a3 + 1);
  if (a4)
    *a4 = (v4 >> 62) | (4 * *(_BYTE *)(a3 + 9));
  *(_QWORD *)((char *)&v6 + 1) = ((unint64_t)(v4 >> 6) << 46) | ((v4 & 0x3F) << 40);
  LOBYTE(v6) = objc_msgSend((id)objc_opt_class(), "tileProviderIdentifier") & 0x7F;
  return v6;
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
  objc_msgSend(v5, "activeTileSetForStyle:size:scale:", 90, (*(_QWORD *)(a3 + 1) >> 58) & 0xFLL, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)urlForTileKey:(uint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  GEOURLComponentsWithHeaders *v11;
  GEOURLWithHeaders *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v18;
  char v19;
  _QWORD v20[4];
  id v21;
  __CFString *v22;
  void *v23;
  GEOURLWithHeaders *v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceManifestManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activeTileSetForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  *(_QWORD *)&v27 = objc_msgSend(a1, "_regularTileKeyForContourLinesTileKey:units:", a3, &v19);
  *((_QWORD *)&v27 + 1) = v7;
  if (v19)
    v8 = CFSTR("meters");
  else
    v8 = CFSTR("feet");
  v9 = v8;
  objc_msgSend(v6, "baseURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v10);
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __52__GEOContourLinesSimpleTileRequester_urlForTileKey___block_invoke;
    v20[3] = &unk_1E1C20320;
    v26 = v27;
    v21 = v5;
    v22 = v9;
    v23 = a1;
    v25 = a3;
    v12 = v6;
    v24 = v12;
    -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v11, "updateQueryItemsWithBlock:", v20);
    v18.receiver = a1;
    v18.super_class = (Class)GEOContourLinesSimpleTileRequester;
    v13 = -[GEOSimpleTileRequester kindForTileKey:](&v18, sel_kindForTileKey_, &v27);
    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOURLComponentsWithHeaders URLComponents](v11, "URLComponents");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "updateURLComponents:forRequestKind:", v15, v13);

    GEOURLAuthenticationForComponents(v11, v12);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_localizationURLForTileKey:", a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

void __52__GEOContourLinesSimpleTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "addItemWithName:uintValue:", CFSTR("style"), *(unsigned __int16 *)(a1 + 85) >> 2);
  objc_msgSend(v8, "addItemWithName:uintValue:", CFSTR("size"), *(_BYTE *)(a1 + 87) & 0xF);
  objc_msgSend(v8, "addItemWithName:uintValue:", CFSTR("scale"), *(unsigned __int8 *)(a1 + 87) >> 4);
  objc_msgSend(v8, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", a1 + 72));
  objc_msgSend(v8, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(a1 + 78) & 0x3F);
  objc_msgSend(v8, "addItemWithName:uintValue:", CFSTR("x"), ((*(_QWORD *)(a1 + 73) >> 46) | (*(_DWORD *)(a1 + 81) << 18)) & 0x3FFFFFF);
  objc_msgSend(v8, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(a1 + 82) & 0x3FFFFFF);
  objc_msgSend(v8, "addItemWithName:value:", CFSTR("units"), *(_QWORD *)(a1 + 40));
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1EDF4E2A8))
    objc_msgSend(v8, "addItemWithName:value:", CFSTR("vertical_datum"), CFSTR("wgs84"));
  +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addItemsFromArray:", v4);

  +[GEOPreflight queryItems](GEOPreflight, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addItemsFromArray:", v5);

  v6 = objc_msgSend(*(id *)(a1 + 48), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 64));
  if ((_DWORD)v6)
    objc_msgSend(v8, "addItemWithName:intValue:", CFSTR("checksum"), v6);
  objc_msgSend(*(id *)(a1 + 56), "disputedBordersQueryItemsForCountry:region:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addItemsFromArray:", v7);

}

- (id)_localizationURLForTileKey:(uint64_t)a3
{
  void *v5;
  GEOURLWithHeaders *v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  GEOURLComponentsWithHeaders *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v22;
  char v23;
  _QWORD v24[4];
  id v25;
  id v26;
  __CFString *v27;
  void *v28;
  uint64_t v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceManifestManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activeTileSetForKey:", a3);
  v6 = (GEOURLWithHeaders *)objc_claimAutoreleasedReturnValue();
  v23 = 0;
  *(_QWORD *)&v31 = objc_msgSend(a1, "_regularTileKeyForContourLinesTileKey:units:", a3, &v23);
  *((_QWORD *)&v31 + 1) = v7;
  if (v23)
    v8 = CFSTR("meters");
  else
    v8 = CFSTR("feet");
  v9 = v8;
  objc_msgSend(a1, "tileRequest");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "locale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizationURLStringIfNecessaryForActiveTileSet:tileKey:overrideLocale:", v6, &v31, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(a1, "tileRequest");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "locale");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageForTileKey:overrideLocale:", &v31, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      v16 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v12);
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __65__GEOContourLinesSimpleTileRequester__localizationURLForTileKey___block_invoke;
      v24[3] = &unk_1E1C20320;
      v30 = v31;
      v25 = v5;
      v26 = v15;
      v27 = v9;
      v28 = a1;
      v29 = a3;
      -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v16, "updateQueryItemsWithBlock:", v24);
      v22.receiver = a1;
      v22.super_class = (Class)GEOContourLinesSimpleTileRequester;
      v17 = -[GEOSimpleTileRequester kindForTileKey:](&v22, sel_kindForTileKey_, &v31);
      +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOURLComponentsWithHeaders URLComponents](v16, "URLComponents");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "updateURLComponents:forRequestKind:", v19, v17);

      GEOURLAuthenticationForComponents(v16, v6);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __65__GEOContourLinesSimpleTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("style"), *(unsigned __int16 *)(a1 + 85) >> 2);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("size"), *(_BYTE *)(a1 + 87) & 0xF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("scale"), *(unsigned __int8 *)(a1 + 87) >> 4);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", a1 + 72));
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(a1 + 78) & 0x3F);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("x"), ((*(_QWORD *)(a1 + 73) >> 46) | (*(_DWORD *)(a1 + 81) << 18)) & 0x3FFFFFF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(a1 + 82) & 0x3FFFFFF);
  objc_msgSend(v7, "addItemWithName:value:", CFSTR("lang"), *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "addItemWithName:value:", CFSTR("units"), *(_QWORD *)(a1 + 48));
  v3 = objc_msgSend(*(id *)(a1 + 56), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 64));
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

@end
