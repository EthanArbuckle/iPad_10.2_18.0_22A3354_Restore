@implementation GEOMuninMeshRequester

+ (unsigned)tileProviderIdentifier
{
  return 6;
}

- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __CFString *v11;
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
  void *v23;
  GEOURLWithHeaders *v24;
  GEOURLWithHeaders *v25;
  void *v27;
  __CFString *v28;
  void *v29;

  v4 = *(unsigned __int8 *)(a3 + 15) >> 5;
  objc_msgSend(a1, "resourceManifestManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "muninBucketURLForId:lod:", *(unsigned __int16 *)(a3 + 13), v4);
  v6 = objc_claimAutoreleasedReturnValue();

  v7 = *(unsigned int *)(a3 + 9) | ((unint64_t)(*(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16)) << 32);
  v8 = *(_QWORD *)(a3 + 1);
  v27 = (void *)v6;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*u"), 10, v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*llu"), 20, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = CFSTR("mt");
  if (!(_DWORD)v4)
    v11 = CFSTR("m");
  v28 = v11;
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  for (i = 0; i != 20; i += 4)
  {
    objc_msgSend(v10, "substringWithRange:", i, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

  }
  v15 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@/%@/%@/%@/%@/%@/%@/%u"), v16, v17, v18, v19, v20, v29, v28, v4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "URLByAppendingPathComponent:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    GEOURLAuthenticationGenerateURL((uint64_t)v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = [GEOURLWithHeaders alloc];
    v25 = -[GEOURLWithHeaders initWithURL:headerFields:](v24, "initWithURL:headerFields:", v23, MEMORY[0x1E0C9AA70]);

  }
  else
  {
    v25 = 0;
  }

  return v25;
}

@end
