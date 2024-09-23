@implementation GEOGloriaQuadIDTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 12;
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
  objc_msgSend(v5, "activeTileSetForTileType:scale:", ((*(unsigned __int16 *)(a3 + 9) | (*(unsigned __int8 *)(a3 + 11) << 16)) >> 6) & 0x3FFF, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)downloadsDataToDisk
{
  return 1;
}

- (BOOL)_shouldReportAnalyticsForTileKey:(uint64_t)a3
{
  return ((*(unsigned __int16 *)(a3 + 9) | (*(unsigned __int8 *)(a3 + 11) << 16)) & 0xFFF80) == 4736;
}

- (uint64_t)shouldReportAnalyticsOnErrorWithRetryForTileKey:
{
  return 0;
}

- (id)urlForTileKey:(uint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  const __CFString *v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  void *v12;
  GEOURLComponentsWithHeaders *v13;
  void *v14;
  GEOURLComponentsWithHeaders *v15;
  void *v16;

  objc_msgSend(a1, "activeTileSetForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "baseURL"), v6 = (void *)objc_claimAutoreleasedReturnValue(), v6, v6))
  {
    v7 = ((*(unsigned __int16 *)(a3 + 9) | (*(unsigned __int8 *)(a3 + 11) << 16)) >> 6) & 0x3FFF;
    if ((_DWORD)v7 == 80)
    {
      *((_QWORD *)&v11 + 1) = *(unsigned __int16 *)(a3 + 9) | ((unint64_t)*(unsigned __int8 *)(a3 + 11) << 16);
      *(_QWORD *)&v11 = *(_QWORD *)(a3 + 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu/%llu/%hu/%hu"), 80, (unint64_t)(v11 >> 6), *(_DWORD *)(a3 + 12) & 0x3FF, (*(_DWORD *)(a3 + 12) >> 10) & 0x3FF);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((_DWORD)v7 == 65)
        v8 = CFSTR("zoom%llu/%llu.tar.gz");
      else
        v8 = CFSTR("%llu/%llu");
      if ((_DWORD)v7 == 65)
        v7 = *(_QWORD *)(a3 + 1) & 0x3FLL;
      *((_QWORD *)&v9 + 1) = *(unsigned __int16 *)(a3 + 9) | ((unint64_t)*(unsigned __int8 *)(a3 + 11) << 16);
      *(_QWORD *)&v9 = *(_QWORD *)(a3 + 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", v8, v7, (unint64_t)(v9 >> 6));
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (void *)v10;
    v13 = [GEOURLComponentsWithHeaders alloc];
    objc_msgSend(v5, "baseURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = -[GEOURLComponentsWithHeaders initWithString:](v13, "initWithString:", v14);

    -[GEOURLComponentsWithHeaders appendPathComponents:](v15, "appendPathComponents:", v12);
    -[GEOURLComponentsWithHeaders URLWithHeaders](v15, "URLWithHeaders");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (GEOTileData)processTileData:(void *)a3 forKey:(uint64_t)a4 error:(_QWORD *)a5
{
  id v7;
  void *v8;
  unsigned int v9;
  BOOL v10;
  int v11;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  GEOTileData *v22;

  v7 = a3;
  v8 = v7;
  v9 = (((*(unsigned __int16 *)(a4 + 9) | (*(unsigned __int8 *)(a4 + 11) << 16)) >> 6) & 0x3FFF) - 65;
  v10 = v9 > 0x1D;
  v11 = (1 << v9) & 0x20018E01;
  if (v10 || v11 == 0)
  {
    v22 = (GEOTileData *)v7;
  }
  else
  {
    v13 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "UUIDString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0C99E98];
    NSTemporaryDirectory();
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fileURLWithPath:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "fileURLWithPath:relativeToURL:", v15, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "fileURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    GEOGetTileLoadingLog();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = +[GEOUnarchiver decompressDataAtURL:toURL:log:error:](GEOUnarchiver, "decompressDataAtURL:toURL:log:error:", v20, v19, v21, a5);

    if ((v17 & 1) != 0)
    {
      v22 = -[GEOTileData initWithFileURL:]([GEOTileData alloc], "initWithFileURL:", v19);
      if (a5)
        *a5 = 0;
    }
    else
    {
      v22 = 0;
    }

  }
  return v22;
}

@end
