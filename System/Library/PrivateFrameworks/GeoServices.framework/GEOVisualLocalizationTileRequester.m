@implementation GEOVisualLocalizationTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 15;
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
  objc_msgSend(v2, "activeTileSetForStyle:size:scale:", 71, 2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)downloadsDataToDisk
{
  return 1;
}

- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  GEOURLComponentsWithHeaders *v13;
  GEOURLWithHeaders *v14;
  uint64_t v15;
  GEOURLWithHeaders *v16;

  objc_msgSend(a1, "activeTileSetForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(a1, "tileRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "additionalInfos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      _GEOVisualLocalizationTileURLPathForKey(a3, objc_msgSend(objc_retainAutorelease(v9), "bytes"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10
        && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "URLByAppendingPathComponent:", v10),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v11,
            v12))
      {
        v13 = -[GEOURLComponentsWithHeaders initWithURL:]([GEOURLComponentsWithHeaders alloc], "initWithURL:", v12);
        if (v13)
        {
          GEOURLAuthenticationGenerateURL((uint64_t)v12);
          v15 = objc_claimAutoreleasedReturnValue();

          v16 = [GEOURLWithHeaders alloc];
          v14 = -[GEOURLWithHeaders initWithURL:headerFields:](v16, "initWithURL:headerFields:", v15, MEMORY[0x1E0C9AA70]);
          v12 = (void *)v15;
        }
        else
        {
          v14 = 0;
        }

      }
      else
      {
        v14 = 0;
      }

    }
    else
    {
      v14 = 0;
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)additionalAnalyticsStatesForKey:(uint64_t)a3
{
  GEOLogMsgState *v4;
  GEOLogMsgStateTileSet *v5;
  GEOTileSetInfo *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = objc_alloc_init(GEOLogMsgState);
  -[GEOLogMsgState setStateType:](v4, "setStateType:", 706);
  v5 = objc_alloc_init(GEOLogMsgStateTileSet);
  -[GEOLogMsgState setTileSet:](v4, "setTileSet:", v5);

  v6 = objc_alloc_init(GEOTileSetInfo);
  -[GEOTileSetInfo setCount:](v6, "setCount:", 1);
  -[GEOTileSetInfo setUncertainty:](v6, "setUncertainty:", *(unsigned __int8 *)(a3 + 9));
  -[GEOTileSetInfo setZoom:](v6, "setZoom:", *(_DWORD *)(a3 + 10) & 0x1F);
  -[GEOTileSetInfo setStyle:](v6, "setStyle:", 71);
  -[GEOLogMsgState tileSet](v4, "tileSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addTileSetInfo:", v6);

  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
