@implementation GEOOfflineIdentifiedMapDataRequester

+ (unsigned)tileProviderIdentifier
{
  return 73;
}

- (uint64_t)tileSetForKey:(uint64_t)a3
{
  return (*(unsigned __int8 *)(a3 + 10) << 8) | 0x800001u;
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

- (GEOOfflineDataKey)_offlineDataKeyForTileKey:(uint64_t)a3 localeKey:(void *)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  GEOOfflineDataKey *v10;
  unint64_t v12;
  uint8_t buf[16];

  v5 = a4;
  v6 = v5;
  if (a3)
  {
    v12 = bswap64(*(_QWORD *)(a3 + 1));
    v7 = objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 1) + 8;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v7);
    objc_msgSend(v8, "appendBytes:length:", &v12, 8);
    if (objc_msgSend(v6, "length"))
    {
      objc_msgSend(v6, "dataUsingEncoding:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "appendData:", v9);

    }
    v10 = -[GEOOfflineDataKey initWithLayer:serviceKey:]([GEOOfflineDataKey alloc], "initWithLayer:serviceKey:", 11, v8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: onlineTileKey != ((void *)0)", buf, 2u);
    }
    v10 = 0;
  }

  return v10;
}

@end
