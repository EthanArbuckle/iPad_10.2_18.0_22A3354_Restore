@implementation GEOLegacyVisualLocalizationTileRequester

+ (unsigned)tileProviderIdentifier
{
  return 13;
}

- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t *v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  void *v14;
  void *v15;
  GEOURLComponentsWithHeaders *v16;
  GEOURLWithHeaders *v17;
  uint64_t v18;
  GEOURLWithHeaders *v19;
  char v21;
  uint64_t v22;
  char v23;
  int v24;
  __int16 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
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
      v10 = (uint64_t *)objc_msgSend(objc_retainAutorelease(v9), "bytes");
      v21 = *(_BYTE *)a3 & 0x80 | 0xF;
      v22 = *v10;
      v23 = *(_BYTE *)(a3 + 3);
      *((_QWORD *)&v12 + 1) = *(unsigned int *)(a3 + 12);
      *(_QWORD *)&v12 = *(_QWORD *)(a3 + 4);
      v11 = v12 >> 22;
      v25 = WORD2(v11) & 0x7FFF;
      v24 = v11 & 0xFC000000 | ((unint64_t)v12 >> 17) & 0x3FFFFE0 | WORD1(v12) & 0x1F;
      _GEOVisualLocalizationTileURLPathForKey((uint64_t)&v21, (uint64_t)v10);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13
        && (objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6),
            v14 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v14, "URLByAppendingPathComponent:", v13),
            v15 = (void *)objc_claimAutoreleasedReturnValue(),
            v14,
            v15))
      {
        v16 = -[GEOURLComponentsWithHeaders initWithURL:]([GEOURLComponentsWithHeaders alloc], "initWithURL:", v15);
        if (v16)
        {
          GEOURLAuthenticationGenerateURL((uint64_t)v15);
          v18 = objc_claimAutoreleasedReturnValue();

          v19 = [GEOURLWithHeaders alloc];
          v17 = -[GEOURLWithHeaders initWithURL:headerFields:](v19, "initWithURL:headerFields:", v18, MEMORY[0x1E0C9AA70]);
          v15 = (void *)v18;
        }
        else
        {
          v17 = 0;
        }

      }
      else
      {
        v17 = 0;
      }

    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

@end
