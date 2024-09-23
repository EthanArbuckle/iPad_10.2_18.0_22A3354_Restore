@implementation GEOMuninHEIFTextureRequester

+ (unsigned)tileProviderIdentifier
{
  return 7;
}

- (GEOURLWithHeaders)urlForTileKey:(uint64_t)a3
{
  unsigned int *v3;
  unsigned int v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  GEOURLWithHeaders *v26;
  GEOURLWithHeaders *v27;
  void *v29;
  void *v30;
  void *v31;

  v3 = (unsigned int *)(a3 + 9);
  v4 = *(unsigned __int16 *)(a3 + 13) | (*(unsigned __int8 *)(a3 + 15) << 16);
  v5 = *(unsigned int *)(a3 + 9) | ((*(_QWORD *)&v4 & 0xFFFFFFLL) << 32);
  v6 = v4 >> 21;
  objc_msgSend(a1, "resourceManifestManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "muninBucketURLForId:lod:", *((unsigned __int16 *)v3 + 2), v6);
  v8 = objc_claimAutoreleasedReturnValue();

  v9 = *v3 | ((unint64_t)(*((unsigned __int16 *)v3 + 2) | (*((unsigned __int8 *)v3 + 6) << 16)) << 32);
  v10 = *((_QWORD *)v3 - 1);
  v31 = (void *)v8;
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v8);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*u"), 10, v9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%0*llu"), 20, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 5);
  for (i = 0; i != 20; i += 4)
  {
    objc_msgSend(v11, "substringWithRange:", i, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObject:", v14);

  }
  v15 = v5 >> 53;
  v16 = HIWORD(v9) & 0x1F;
  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v12, "objectAtIndexedSubscript:", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 2);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndexedSubscript:", 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("%@/%@/%@/%@/%@/%@/t/%u/%u"), v18, v19, v20, v21, v22, v30, v16, v15);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v29, "URLByAppendingPathComponent:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    GEOURLAuthenticationGenerateURL((uint64_t)v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    v26 = [GEOURLWithHeaders alloc];
    v27 = -[GEOURLWithHeaders initWithURL:headerFields:](v26, "initWithURL:headerFields:", v25, MEMORY[0x1E0C9AA70]);

  }
  else
  {
    v27 = 0;
  }

  return v27;
}

@end
