@implementation GEOMuninTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 5;
}

- (uint64_t)tileSetForKey:
{
  return 3;
}

- (uint64_t)activeTileSetForKey:
{
  return 0;
}

- (uint64_t)tileEditionForKey:
{
  return 0;
}

- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3
{
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  GEOURLWithHeaders *v23;
  GEOURLWithHeaders *v24;
  void *v26;
  void *v27;

  v4 = *(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16);
  v5 = *(unsigned int *)(a3 + 9) | ((*(_QWORD *)&v4 & 0xFFFFFFLL) << 32);
  v6 = *(_QWORD *)(a3 + 1);
  v7 = v4 >> 22;
  objc_msgSend(a1, "resourceManifestManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "muninBucketURLForId:lod:", *(unsigned __int16 *)(a3 + 13), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", CFSTR("vs-mesh"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*llu"), 20, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  for (i = 0; i != 20; i += 4)
  {
    objc_msgSend(v11, "substringWithRange:", i, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

  }
  v26 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("%@/%@/%@/%@/%@/%u/%u/%u"), v15, v16, v17, v18, v19, v5, HIWORD(v5) & 0x1F, v5 >> 54);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v27, "URLByAppendingPathComponent:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    GEOURLAuthenticationGenerateURL((uint64_t)v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = [GEOURLWithHeaders alloc];
    v24 = -[GEOURLWithHeaders initWithURL:headerFields:](v23, "initWithURL:headerFields:", v22, MEMORY[0x1E0C9AA70]);

  }
  else
  {
    v24 = 0;
  }

  return v24;
}

- (uint64_t)shouldReportAnalyticsOnErrorWithRetryForTileKey:
{
  return 0;
}

- (uint64_t)shouldReportAnalyticsOnSuccessForTileKey:
{
  return 1;
}

- (uint64_t)shouldReportAnalyticsOnErrorForTileKey:
{
  return 1;
}

- (id)additionalAnalyticsStatesForKey:(uint64_t)a3
{
  GEOLogMsgState *v5;
  GEOLogMsgStateMuninResource *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(GEOLogMsgState);
  -[GEOLogMsgState setStateType:](v5, "setStateType:", 717);
  v6 = objc_alloc_init(GEOLogMsgStateMuninResource);
  -[GEOLogMsgState setMuninResource:](v5, "setMuninResource:", v6);

  objc_msgSend(a1, "resourceManifestManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "muninBucketURLForId:lod:", *(unsigned __int16 *)(a3 + 13), *(unsigned __int8 *)(a3 + 15) >> 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOLogMsgState muninResource](v5, "muninResource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAssetBucket:", v8);

  v10 = *(unsigned __int8 *)(a3 + 15) >> 5;
  -[GEOLogMsgState muninResource](v5, "muninResource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLevelOfDetail:", v10);

  v14[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end
