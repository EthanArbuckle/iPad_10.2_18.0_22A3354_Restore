@implementation GEOVoltaireSputnikMetadataTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 4;
}

- (uint64_t)tileSetForKey:(uint64_t)a3
{
  return ((HIBYTE(*(_QWORD *)(a3 + 1)) | (*(_QWORD *)(a3 + 1) >> 24) & 0xFFFF00) << 8) | 2;
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
  objc_msgSend(v5, "activeTileSetForTileType:scale:", *(_DWORD *)(a3 + 8) & 0x3FFF, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (uint64_t)tileEditionForKey:(uint64_t)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "resourceManifestManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTileGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "versionForFlyoverRegion:", *(_DWORD *)(a3 + 5) & 0xFFFFFF);

  return v6;
}

- (id)urlForTileKey:(uint64_t)a3
{
  GEOURLWithHeaders *v5;
  void *v6;
  GEOURLComponentsWithHeaders *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[6];

  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (GEOURLWithHeaders *)objc_claimAutoreleasedReturnValue();
  -[GEOURLWithHeaders baseURL](v5, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v6);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __57__GEOVoltaireSputnikMetadataTileRequester_urlForTileKey___block_invoke;
    v13[3] = &unk_1E1C0DA10;
    v13[4] = a1;
    v13[5] = a3;
    -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v7, "updateQueryItemsWithBlock:", v13);
    v8 = *(_QWORD *)(a3 + 4) & 0x3FFF00000000 | 0x100;
    +[GEOExperimentConfiguration sharedConfiguration](GEOExperimentConfiguration, "sharedConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[GEOURLComponentsWithHeaders URLComponents](v7, "URLComponents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateURLComponents:forRequestKind:", v10, v8);

    GEOURLAuthenticationForComponents(v7, v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void __57__GEOVoltaireSputnikMetadataTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _DWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = *(_DWORD **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "tileRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manifestConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v3;
  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeTileGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "addItemWithName:uintValue:", CFSTR("style"), v4[2] & 0x3FFF);
  v9 = *(_DWORD *)((char *)v4 + 5) & 0xFFFFFF;
  objc_msgSend(v13, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(v8, "versionForFlyoverRegion:", v9));
  objc_msgSend(v13, "addItemWithName:uintValue:", CFSTR("part"), *(unsigned int *)((char *)v4 + 1));
  objc_msgSend(v13, "addItemWithName:uintValue:", CFSTR("region"), v9);
  if (objc_msgSend(v8, "hasDataVersionForFlyoverRegion:", v9))
    objc_msgSend(v13, "addItemWithName:uintValue:", CFSTR("dv"), objc_msgSend(v8, "dataVersionForFlyoverRegion:", v9));
  +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "queryItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addItemsFromArray:", v11);

  +[GEOPreflight queryItems](GEOPreflight, "queryItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addItemsFromArray:", v12);

}

@end
