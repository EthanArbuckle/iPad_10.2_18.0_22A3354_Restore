@implementation GEOVoltaireSimple3DTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 3;
}

- (unint64_t)tileSetForKey:(uint64_t)a3
{
  return ((((*(unsigned int *)(a3 + 9) | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32)) >> 26) & 0xFF0000FF | ((unsigned __int16)(*(_DWORD *)(a3 + 9) >> 2) << 8)) << 8) | 2;
}

- (id)activeTileSetForKey:(uint64_t)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  int v7;
  void *v8;

  objc_msgSend(a1, "resourceManifestManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activeTileGroup");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(unsigned __int16 *)(a3 + 13);
  v7 = v6 | (*(unsigned __int8 *)(a3 + 15) << 16);
  objc_msgSend(v5, "activeTileSetForStyle:size:scale:", ((*(unsigned int *)(a3 + 9) | ((*(_QWORD *)&v7 & 0xFFFFFFuLL) << 32)) >> 26) & 0x3FFF, v6 >> 8, HIWORD(v7));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
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
  v6 = objc_msgSend(v5, "versionForFlyoverRegion:", (*(_DWORD *)(a3 + 9) >> 2) & 0xFFFFFF);

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
    v13[2] = __50__GEOVoltaireSimple3DTileRequester_urlForTileKey___block_invoke;
    v13[3] = &unk_1E1C0DA10;
    v13[4] = a1;
    v13[5] = a3;
    -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v7, "updateQueryItemsWithBlock:", v13);
    v8 = objc_msgSend(a1, "kindForTileKey:", a3);
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

void __50__GEOVoltaireSimple3DTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "tileRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "manifestConfiguration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v3;
  +[GEOResourceManifestManager modernManagerForConfiguration:](GEOResourceManifestManager, "modernManagerForConfiguration:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "activeTileGroup");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "addItemWithName:uintValue:", CFSTR("style"), ((*(unsigned int *)(v4 + 9) | ((unint64_t)(*(unsigned __int16 *)(v4 + 13) | (*(unsigned __int8 *)(v4 + 15) << 16)) << 32)) >> 26) & 0x3FFF);
  v9 = (*(_DWORD *)(v4 + 9) >> 2) & 0xFFFFFF;
  objc_msgSend(v15, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(v8, "versionForFlyoverRegion:", v9));
  objc_msgSend(v15, "addItemWithName:uintValue:", CFSTR("region"), v9);
  objc_msgSend(v15, "addItemWithName:uintValue:", CFSTR("z"), *(_DWORD *)(v4 + 1) & 0x3F);
  objc_msgSend(v15, "addItemWithName:uintValue:", CFSTR("x"), *(_DWORD *)(v4 + 1) >> 6);
  objc_msgSend(v15, "addItemWithName:uintValue:", CFSTR("y"), *(_DWORD *)(v4 + 5) & 0x3FFFFFF);
  if (objc_msgSend(v8, "hasDataVersionForFlyoverRegion:", v9))
    objc_msgSend(v15, "addItemWithName:uintValue:", CFSTR("dv"), objc_msgSend(v8, "dataVersionForFlyoverRegion:", v9));
  v10 = *(unsigned int *)(v4 + 9) | ((unint64_t)(*(unsigned __int16 *)(v4 + 13) | (*(unsigned __int8 *)(v4 + 15) << 16)) << 32);
  if (((v10 >> 26) & 0x3FFF) <= 0x34 && ((1 << (v10 >> 26)) & 0x101C0000008000) != 0)
    objc_msgSend(v15, "addItemWithName:uintValue:", CFSTR("h"), (*(_QWORD *)(v4 + 1) >> 58) | (*(_DWORD *)(v4 + 9) << 6));
  +[GEOAdditionalEnabledMarkets additionalEnabledMarkets](GEOAdditionalEnabledMarkets, "additionalEnabledMarkets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "queryItems");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addItemsFromArray:", v13);

  +[GEOPreflight queryItems](GEOPreflight, "queryItems");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addItemsFromArray:", v14);

}

- (BOOL)shouldDownloadToDiskForTileKey:(uint64_t)a3 estimatedDataSize:(unint64_t)a4
{
  return GEOConfigGetUInteger(GeoServicesConfig_TileExternalResourceContextSizeThreshold, (uint64_t)off_1EDF4E088) <= a4;
}

@end
