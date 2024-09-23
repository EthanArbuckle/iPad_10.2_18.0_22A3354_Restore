@implementation GEOVisualLocalizationMetadataTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 14;
}

- (id)activeTileSetForKey:(void *)a1
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "resourceManifestManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "activeTileGroup");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activeTileSetForStyle:size:scale:", 70, 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)downloadsDataToDisk
{
  return 1;
}

- (id)urlForTileKey:(uint64_t)a3
{
  void *v4;
  void *v5;
  GEOURLComponentsWithHeaders *v6;
  GEOURLWithHeaders *v7;
  __int128 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t, void *);
  void *v28;
  GEOURLWithHeaders *v29;

  objc_msgSend(a1, "activeTileSetForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "baseURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = -[GEOURLComponentsWithHeaders initWithString:]([GEOURLComponentsWithHeaders alloc], "initWithString:", v5);
    if (v6)
    {
      v25 = MEMORY[0x1E0C809B0];
      v26 = 3221225472;
      v27 = __60__GEOVisualLocalizationMetadataTileRequester_urlForTileKey___block_invoke;
      v28 = &unk_1E1C11BE8;
      v7 = v4;
      v29 = v7;
      -[GEOURLComponentsWithHeaders updateQueryItemsWithBlock:](v6, "updateQueryItemsWithBlock:", &v25);
      *((_QWORD *)&v8 + 1) = *(unsigned int *)(a3 + 9) | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
      *(_QWORD *)&v8 = *(_QWORD *)(a3 + 1);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), (v8 >> 46) & 0x3FFFFFF, v25, v26, v27, v28);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOURLComponentsWithHeaders headerFields](v6, "headerFields");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, CFSTR("Maps-Tile-X"));

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), ((*(unsigned int *)(a3 + 9) | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32)) >> 8) & 0x3FFFFFF);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOURLComponentsWithHeaders headerFields](v6, "headerFields");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("Maps-Tile-Y"));

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), (*(_QWORD *)(a3 + 1) >> 40) & 0x3FLL);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOURLComponentsWithHeaders headerFields](v6, "headerFields");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, CFSTR("Maps-Tile-Z"));

      v15 = *(_DWORD *)(a3 + 1);
      if (((v15 >> 6) & 0x1FF) != 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), (v15 >> 6) & 0x1FF);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOURLComponentsWithHeaders headerFields](v6, "headerFields");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "setObject:forKeyedSubscript:", v16, CFSTR("Maps-VL-Data-Max-Format-Version"));

        v15 = *(_DWORD *)(a3 + 1);
      }
      v18 = v15 & 0x3F;
      if ((_DWORD)v18)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[GEOURLComponentsWithHeaders headerFields](v6, "headerFields");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("Maps-VL-Data-Max-Output-Version"));

      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%u"), 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GEOURLComponentsWithHeaders headerFields](v6, "headerFields");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setObject:forKeyedSubscript:", v21, CFSTR("Maps-VL-Metadata-Max-Format-Version"));

      GEOURLAuthenticationForComponents(v6, v7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v23 = 0;
    }

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

void __60__GEOVisualLocalizationMetadataTileRequester_urlForTileKey___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "addItemWithName:uintValue:", CFSTR("v"), objc_msgSend(v2, "version"));
  +[GEOPreflight queryItems](GEOPreflight, "queryItems");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addItemsFromArray:", v4);

}

@end
