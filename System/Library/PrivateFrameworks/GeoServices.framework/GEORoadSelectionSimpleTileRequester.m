@implementation GEORoadSelectionSimpleTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 19;
}

- (uint64_t)_regularTileKeyForRoadSelectionSelectionTileKey:(uint64_t)a3 roadId:(_QWORD *)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  _BYTE v23[128];
  _QWORD v24[3];

  v24[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceManifestManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v21 = 0;
  v20 = 0;
  if ((GEOSelectionTileKeyGetXYZId(a3, (int *)&v22 + 1, &v22, &v21, &v20) & 1) != 0)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v7 = objc_msgSend(&unk_1E1E85738, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
LABEL_4:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(&unk_1E1E85738);
        if ((objc_msgSend(v6, "supportsTileStyle:size:scale:", 87, objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v10), "integerValue"), 0) & 1) != 0)break;
        if (v8 == ++v10)
        {
          v8 = objc_msgSend(&unk_1E1E85738, "countByEnumeratingWithState:objects:count:", &v16, v23, 16);
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
    *a4 = v20;
LABEL_15:
    v12 = HIDWORD(v22);
    v13 = v21;
    v14 = objc_msgSend((id)objc_opt_class(), "tileProviderIdentifier");
    *(_QWORD *)((char *)v24 + 1) = (v12 << 46) | ((unint64_t)(v13 & 0x3F) << 40);
    LOBYTE(v24[0]) = v14 & 0x7F;
    v11 = v24[0];
    goto LABEL_16;
  }
  *(_QWORD *)((char *)v24 + 1) = 0;
  LOBYTE(v24[0]) = 0;
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
  v2 = objc_msgSend(&unk_1E1E85750, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v11;
LABEL_3:
    v5 = 0;
    while (1)
    {
      if (*(_QWORD *)v11 != v4)
        objc_enumerationMutation(&unk_1E1E85750);
      v6 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v5), "integerValue");
      if ((objc_msgSend(v1, "supportsTileStyle:size:scale:", 87, v6, 0) & 1) != 0)
        break;
      if (v3 == ++v5)
      {
        v3 = objc_msgSend(&unk_1E1E85750, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
  objc_msgSend(v7, "activeTileSetForStyle:size:scale:", 87, v6, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)urlForTileKey:(uint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  GEOURLComponentsWithHeaders *v9;
  GEOURLWithHeaders *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;
  uint64_t v17;
  _QWORD v18[4];
  id v19;
  void *v20;
  GEOURLWithHeaders *v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceManifestManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activeTileSetForKey:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  *(_QWORD *)&v25 = objc_msgSend(a1, "_regularTileKeyForRoadSelectionSelectionTileKey:roadId:", a3, &v17);
  *((_QWORD *)&v25 + 1) = v7;
  objc_msgSend(v6, "baseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v8);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __53__GEORoadSelectionSimpleTileRequester_urlForTileKey___block_invoke;
    v18[3] = &unk_1E1C08D38;
    v24 = v25;
    v19 = v5;
    v20 = a1;
    v22 = v17;
    v23 = a3;
    v10 = v6;
    v21 = v10;
    -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v9, "updateQueryItemsWithBlock:", v18);
    v16.receiver = a1;
    v16.super_class = (Class)GEORoadSelectionSimpleTileRequester;
    v11 = -[GEOSimpleTileRequester kindForTileKey:](&v16, sel_kindForTileKey_, &v25);
    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOURLComponentsWithHeaders URLComponents](v9, "URLComponents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "updateURLComponents:forRequestKind:", v13, v11);

    GEOURLAuthenticationForComponents(v9, v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "_localizationURLForTileKey:", a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v14;
}

void __53__GEORoadSelectionSimpleTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v8, "addItemWithName:uint64Value:", CFSTR("id"), *(_QWORD *)(a1 + 56));
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

  v6 = objc_msgSend(*(id *)(a1 + 40), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 64));
  if ((_DWORD)v6)
    objc_msgSend(v8, "addItemWithName:intValue:", CFSTR("checksum"), v6);
  objc_msgSend(*(id *)(a1 + 48), "disputedBordersQueryItemsForCountry:region:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48), *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addItemsFromArray:", v7);

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
  uint64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceManifestManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "activeTileSetForKey:", a3);
  v6 = (GEOURLWithHeaders *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  *(_QWORD *)&v29 = objc_msgSend(a1, "_regularTileKeyForRoadSelectionSelectionTileKey:roadId:", a3, &v21);
  *((_QWORD *)&v29 + 1) = v7;
  objc_msgSend(a1, "tileRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "locale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizationURLStringIfNecessaryForActiveTileSet:tileKey:overrideLocale:", v6, &v29, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(a1, "tileRequest");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "locale");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "languageForTileKey:overrideLocale:", &v29, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      v14 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v10);
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __66__GEORoadSelectionSimpleTileRequester__localizationURLForTileKey___block_invoke;
      v22[3] = &unk_1E1C08D38;
      v28 = v29;
      v23 = v5;
      v24 = v13;
      v25 = a1;
      v26 = v21;
      v27 = a3;
      -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v14, "updateQueryItemsWithBlock:", v22);
      v20.receiver = a1;
      v20.super_class = (Class)GEORoadSelectionSimpleTileRequester;
      v15 = -[GEOSimpleTileRequester kindForTileKey:](&v20, sel_kindForTileKey_, &v29);
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

void __66__GEORoadSelectionSimpleTileRequester__localizationURLForTileKey___block_invoke(uint64_t a1, void *a2)
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
  objc_msgSend(v7, "addItemWithName:uint64Value:", CFSTR("id"), *(_QWORD *)(a1 + 56));
  v3 = objc_msgSend(*(id *)(a1 + 48), "checksumMethodForIncomingTileDataWithKey:", *(_QWORD *)(a1 + 64));
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
