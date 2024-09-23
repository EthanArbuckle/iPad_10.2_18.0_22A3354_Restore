@implementation GEOOfflineVectorTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 66;
}

- (uint64_t)tileSetForKey:(void *)a1
{
  void *v1;
  void *v2;
  __int16 v3;
  char v4;
  uint64_t v5;

  objc_msgSend(a1, "activeTileSetForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "style");
    v4 = objc_msgSend(v2, "scale");
    v5 = ((v3 & 0x3FFF | ((objc_msgSend(v2, "size") & 0xF) << 14) & 0xFFC3FFFF | ((v4 & 0xF) << 18)) << 8) | 1;
  }
  else
  {
    v5 = 0;
  }

  return v5;
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
  objc_msgSend(v5, "activeTileSetForStyle:size:scale:", *(unsigned __int16 *)(a3 + 13) >> 2, *(_BYTE *)(a3 + 15) & 0xF, *(unsigned __int8 *)(a3 + 15) >> 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (GEOOfflineDataKey)_offlineDataKeyForTileKey:(uint64_t)a3 localeKey:(void *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  NSObject *v9;
  unint64_t v10;
  __int128 v11;
  void *v12;
  GEOOfflineDataKey *v13;
  unint64_t v15;
  unsigned int v16;
  unsigned int v17;

  v5 = a4;
  if (!a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_fault_impl(&dword_1885A9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Assertion failed: onlineTileKey != ((void *)0)", (uint8_t *)&v15, 2u);
    }
    goto LABEL_14;
  }
  v17 = 0;
  if (!GEOTileKeyStyle(a3, &v17) || (*(_BYTE *)a3 & 0x7F) != 2)
  {
LABEL_14:
    v13 = 0;
    goto LABEL_15;
  }
  v16 = bswap32(v17);
  v6 = objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 1) + 12;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", v6);
  objc_msgSend(v7, "appendBytes:length:", &v16, 4);
  v8 = *(_QWORD *)(a3 + 1);
  if (((v8 >> 40) & 0x3F) < 0x20)
  {
    *((_QWORD *)&v11 + 1) = *(unsigned int *)(a3 + 9) | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
    *(_QWORD *)&v11 = *(_QWORD *)(a3 + 1);
    v10 = (v11 >> 17) & 0x7FFFFFE0000000 | (*((_QWORD *)&v11 + 1) >> 8) & 0x3FFFFFFLL | (v8 >> 40 << 59);
  }
  else
  {
    GEOGetTileLoadingLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1885A9000, v9, OS_LOG_TYPE_FAULT, "[Offline] z is too large to fit in a tile path key", (uint8_t *)&v15, 2u);
    }

    v10 = 0;
  }
  v15 = bswap64(v10);
  objc_msgSend(v7, "appendBytes:length:", &v15, 8);
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v5, "dataUsingEncoding:", 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendData:", v12);

  }
  v13 = -[GEOOfflineDataKey initWithLayer:serviceKey:]([GEOOfflineDataKey alloc], "initWithLayer:serviceKey:", 9, v7);

LABEL_15:
  return v13;
}

- (void)_fetchEmptyFallbackIfPossibleForOfflineTileKey:(__int128 *)a3 onlineTileKey:(__int128 *)a4 completionHandler:(void *)a5
{
  id v8;
  __int128 v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = *a4;
  v16 = *a3;
  v15 = v9;
  +[GEOOfflineDataAccess sharedInstance](GEOOfflineDataAccess, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "delegateQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __112__GEOOfflineVectorTileRequester__fetchEmptyFallbackIfPossibleForOfflineTileKey_onlineTileKey_completionHandler___block_invoke;
  v13[3] = &unk_1E1C14BE0;
  v13[4] = a1;
  v14 = v8;
  v12 = v8;
  objc_msgSend(v10, "getFullyDownloadedRegionsWithCallbackQueue:callback:", v11, v13);

}

void __112__GEOOfflineVectorTileRequester__fetchEmptyFallbackIfPossibleForOfflineTileKey_onlineTileKey_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  unsigned int UInteger;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  GEOTileData *v25;
  NSObject *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD block[4];
  id v32;
  uint8_t buf[4];
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "count"))
  {
    v4 = GEOMapRectForGEOTileKey(a1 + 48);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = v3;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v28;
      while (2)
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v28 != v14)
            objc_enumerationMutation(v11);
          v16 = GEOMapRectForMapRegion(*(void **)(*((_QWORD *)&v27 + 1) + 8 * v15));
          if ((GEOMapRectIntersectsRect(v16, v17, v18, v19, v4, v6, v8, v10) & 1) != 0)
          {

            goto LABEL_15;
          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
        if (v13)
          continue;
        break;
      }
    }

    UInteger = GEOConfigGetUInteger(GeoOfflineConfig_GlobalTileCoverageMaxZoom, (uint64_t)off_1EDF4EBB8);
    if (UInteger && (*(_DWORD *)buf = 0, GEOTileKeyZoom(a1 + 48, buf)) && *(_DWORD *)buf <= UInteger)
    {
LABEL_15:
      GEOGetTileLoadingLog();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        GEOStringFromTileKey((char *)(a1 + 64));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v34 = v22;
        _os_log_impl(&dword_1885A9000, v21, OS_LOG_TYPE_DEBUG, "[Offline] Generating empty VMP4 for tile %@", buf, 0xCu);

      }
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", _block_invoke_emptyVMP4, 29, 0, (_QWORD)v27);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = *(_QWORD *)(a1 + 40);
      v25 = -[GEOTileData initWithData:]([GEOTileData alloc], "initWithData:", v23);
      (*(void (**)(uint64_t, GEOTileData *))(v24 + 16))(v24, v25);

    }
    else
    {
      (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40));
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "delegateQueue");
    v26 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __112__GEOOfflineVectorTileRequester__fetchEmptyFallbackIfPossibleForOfflineTileKey_onlineTileKey_completionHandler___block_invoke_2;
    block[3] = &unk_1E1C01F48;
    v32 = *(id *)(a1 + 40);
    dispatch_async(v26, block);

  }
}

uint64_t __112__GEOOfflineVectorTileRequester__fetchEmptyFallbackIfPossibleForOfflineTileKey_onlineTileKey_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
