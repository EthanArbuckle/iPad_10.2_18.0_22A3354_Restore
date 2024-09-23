@implementation GEOFeatureSpecificSimpleTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 10;
}

- (uint64_t)_regularTileKeyForTransitLineSelectionTileKey:(uint64_t)a3 muid:(_QWORD *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  _BYTE v20[128];
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceManifestManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  v18 = 0;
  v17 = 0;
  if ((GEOSelectionTileKeyGetXYZId(a3, (int *)&v19 + 1, &v19, &v18, &v17) & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = objc_msgSend(&unk_1E1E85768, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(&unk_1E1E85768);
        if ((objc_msgSend(v6, "supportsTileStyle:size:scale:", 47, objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "integerValue"), 0) & 1) != 0)break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(&unk_1E1E85768, "countByEnumeratingWithState:objects:count:", &v13, v20, 16);
          if (v8)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
      if (!a4)
        goto LABEL_15;
    }
    else
    {
LABEL_10:
      if (!a4)
        goto LABEL_15;
    }
    *a4 = v17;
LABEL_15:
    *(_QWORD *)((char *)v21 + 1) = ((unint64_t)HIDWORD(v19) << 46) | ((unint64_t)(v18 & 0x3F) << 40);
    LOBYTE(v21[0]) = 10;
    v11 = v21[0];
    goto LABEL_16;
  }
  *(_QWORD *)((char *)v21 + 1) = 0;
  LOBYTE(v21[0]) = 0;
  v11 = 0;
LABEL_16:

  return v11;
}

- (uint64_t)tileDataIsCacheableForTileKey:
{
  return 0;
}

- (id)activeTileSetForKey:(void *)a1
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceManifestManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = objc_msgSend(&unk_1E1E85780, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v4)
        objc_enumerationMutation(&unk_1E1E85780);
      v6 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v5), "integerValue");
      if ((objc_msgSend(v1, "supportsTileStyle:size:scale:", 47, v6, 0) & 1) != 0)
        break;
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(&unk_1E1E85780, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        if (v3)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    v6 = 2;
  }
  objc_msgSend(v1, "activeTileGroup");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeTileSetForStyle:size:scale:", 47, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)urlForTileKey:(uint64_t)a3
{
  void *v5;
  GEOURLWithHeaders *v6;
  uint64_t v7;
  void *v8;
  GEOURLComponentsWithHeaders *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  _QWORD v16[4];
  id v17;
  void *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD v23[3];

  v23[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceManifestManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activeTileSetForKey:", a3);
  v6 = (GEOURLWithHeaders *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v23[0] = objc_msgSend(a1, "_regularTileKeyForTransitLineSelectionTileKey:muid:", a3, &v22);
  v23[1] = v7;
  -[GEOURLWithHeaders baseURL](v6, "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v8);
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __55__GEOFeatureSpecificSimpleTileRequester_urlForTileKey___block_invoke;
    v16[3] = &unk_1E1C15290;
    v19 = v23;
    v17 = v5;
    v18 = a1;
    v20 = v22;
    v21 = a3;
    -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v9, "updateQueryItemsWithBlock:", v16);
    v15.receiver = a1;
    v15.super_class = (Class)GEOFeatureSpecificSimpleTileRequester;
    v10 = -[GEOSimpleTileRequester kindForTileKey:](&v15, sel_kindForTileKey_, v23);
    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOURLComponentsWithHeaders URLComponents](v9, "URLComponents");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "updateURLComponents:forRequestKind:", v12, v10);

    GEOURLAuthenticationForComponents(v9, v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_localizationURLForTileKey:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

void __55__GEOFeatureSpecificSimpleTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("style"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 48) + 13) >> 2);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("size"), *(_BYTE *)(*(_QWORD *)(a1 + 48) + 15) & 0xF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("scale"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 48) + 15) >> 4);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", *(_QWORD *)(a1 + 48)));
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(*(_QWORD *)(a1 + 48) + 6) & 0x3F);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("x"), ((*(_QWORD *)(*(_QWORD *)(a1 + 48) + 1) >> 46) | (*(_DWORD *)(*(_QWORD *)(a1 + 48) + 9) << 18)) & 0x3FFFFFF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(*(_QWORD *)(a1 + 48) + 10) & 0x3FFFFFF);
  objc_msgSend(v7, "addItemWithName:uint64Value:", CFSTR("id"), *(_QWORD *)(a1 + 56));
  if (GEOConfigGetBOOL(GeoServicesConfig_ShouldRequestWGS84Elevations, (uint64_t)off_1EDF4E2A8))
    objc_msgSend(v7, "addItemWithName:value:", CFSTR("vertical_datum"), CFSTR("wgs84"));
  +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addItemsFromArray:", v4);

  +[GEOPreflight queryItems](GEOPreflight, "queryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addItemsFromArray:", v5);

  v6 = objc_msgSend(*(id *)(a1 + 40), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 64));
  if ((_DWORD)v6)
    objc_msgSend(v7, "addItemWithName:intValue:", CFSTR("checksum"), v6);

}

- (id)_localizationURLForTileKey:(uint64_t)a3
{
  void *v5;
  GEOURLWithHeaders *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  GEOURLComponentsWithHeaders *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;
  _QWORD v21[4];
  id v22;
  id v23;
  void *v24;
  _QWORD *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceManifestManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activeTileSetForKey:", a3);
  v6 = (GEOURLWithHeaders *)objc_claimAutoreleasedReturnValue();
  v28 = 0;
  v29[0] = objc_msgSend(a1, "_regularTileKeyForTransitLineSelectionTileKey:muid:", a3, &v28);
  v29[1] = v7;
  objc_msgSend(a1, "tileRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizationURLStringIfNecessaryForActiveTileSet:tileKey:overrideLocale:", v6, v29, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "tileRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageForTileKey:overrideLocale:", v29, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v10);
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __68__GEOFeatureSpecificSimpleTileRequester__localizationURLForTileKey___block_invoke;
      v21[3] = &unk_1E1C152B8;
      v25 = v29;
      v22 = v5;
      v23 = v13;
      v24 = a1;
      v26 = v28;
      v27 = a3;
      -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v14, "updateQueryItemsWithBlock:", v21);
      v20.receiver = a1;
      v20.super_class = (Class)GEOFeatureSpecificSimpleTileRequester;
      v15 = -[GEOSimpleTileRequester kindForTileKey:](&v20, sel_kindForTileKey_, v29);
      +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOURLComponentsWithHeaders URLComponents](v14, "URLComponents");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "updateURLComponents:forRequestKind:", v17, v15);

      GEOURLAuthenticationForComponents(v14, v6);
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

void __68__GEOFeatureSpecificSimpleTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("style"), *(unsigned __int16 *)(*(_QWORD *)(a1 + 56) + 13) >> 2);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("size"), *(_BYTE *)(*(_QWORD *)(a1 + 56) + 15) & 0xF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("scale"), *(unsigned __int8 *)(*(_QWORD *)(a1 + 56) + 15) >> 4);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(*(id *)(a1 + 32), "versionForTileKey:", *(_QWORD *)(a1 + 56)));
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 6) & 0x3F);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("x"), ((*(_QWORD *)(*(_QWORD *)(a1 + 56) + 1) >> 46) | (*(_DWORD *)(*(_QWORD *)(a1 + 56) + 9) << 18)) & 0x3FFFFFF);
  objc_msgSend(v7, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(*(_QWORD *)(a1 + 56) + 10) & 0x3FFFFFF);
  objc_msgSend(v7, "addItemWithName:value:", CFSTR("lang"), *(_QWORD *)(a1 + 40));
  objc_msgSend(v7, "addItemWithName:uint64Value:", CFSTR("id"), *(_QWORD *)(a1 + 64));
  v3 = objc_msgSend(*(id *)(a1 + 48), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 72));
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
