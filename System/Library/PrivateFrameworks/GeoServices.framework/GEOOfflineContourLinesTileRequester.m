@implementation GEOOfflineContourLinesTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 84;
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

- (uint64_t)_regularTileKeyForContourLinesTileKey:(uint64_t)a3
{
  __int128 v4;

  if (!a3 || (*(_BYTE *)a3 & 0x7F) != 0x14)
    return 0;
  *(_QWORD *)((char *)&v4 + 1) = ((unint64_t)(*(_QWORD *)(a3 + 1) >> 6) << 46) | ((*(_QWORD *)(a3 + 1) & 0x3FLL) << 40);
  LOBYTE(v4) = 2;
  return v4;
}

- (id)_offlineDataKeyForTileKey:(uint64_t)a3 localeKey:(void *)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v11[0] = objc_msgSend(a1, "_regularTileKeyForContourLinesTileKey:", a3);
  v11[1] = v7;
  v10.receiver = a1;
  v10.super_class = (Class)GEOOfflineContourLinesTileRequester;
  -[GEOOfflineVectorTileRequester _offlineDataKeyForTileKey:localeKey:](&v10, sel__offlineDataKeyForTileKey_localeKey_, v11, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
