@implementation GEOAltitudeManifestVersionParser

- (GEOAltitudeManifestVersionParser)initWithFileURL:(id)a3
{
  id v4;
  GEOAltitudeManifestVersionParser *v5;
  GEOAltitudeManifestVersionParser *v6;
  uint64_t v7;
  NSURL *fileURL;
  GEOAltitudeManifestVersionParser *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)GEOAltitudeManifestVersionParser;
  v5 = -[GEOAltitudeManifestVersionParser init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_parsed.lock._os_unfair_lock_opaque = 0;
    v5->_parsed.didRun = 0;
    v7 = objc_msgSend(v4, "copy");
    fileURL = v6->_fileURL;
    v6->_fileURL = (NSURL *)v7;

    v9 = v6;
  }

  return v6;
}

- (id)parse:(id *)a3
{
  _QWORD v6[5];

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__GEOAltitudeManifestVersionParser_parse___block_invoke;
  v6[3] = &unk_1E1BFF6F8;
  v6[4] = self;
  GEOOnce((uint64_t)&self->_parsed, v6);
  if (a3)
    *a3 = objc_retainAutorelease(self->_parseError);
  return self->_versions;
}

void __42__GEOAltitudeManifestVersionParser_parse___block_invoke(uint64_t a1)
{
  GEOFlyoverRegionVersions *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v2 = objc_alloc_init(GEOFlyoverRegionVersions);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 24);
  *(_QWORD *)(v3 + 24) = v2;

  v11 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B28]), "initWithContentsOfURL:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  objc_msgSend(v11, "setDelegate:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v11, "parse");
  objc_msgSend(v11, "parserError");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 32);
  *(_QWORD *)(v6 + 32) = v5;

  objc_msgSend(v11, "parserError");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = 0;

  }
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  v20 = a7;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("trigger")))
  {
    if (objc_msgSend(v20, "count"))
    {
      objc_msgSend(v20, "objectForKey:", CFSTR("region"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v20, "objectForKey:", CFSTR("region"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "intValue");

        objc_msgSend(v20, "objectForKey:", CFSTR("version"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "intValue");

        v14 = v13;
        objc_msgSend(v20, "objectForKey:", CFSTR("dataversion"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
        {
          objc_msgSend(v20, "objectForKey:", CFSTR("dataversion"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "intValue");

          v18 = v14 | 0x700000000;
          v19 = v17;
        }
        else
        {
          v19 = 0;
          v18 = v13 | 0x600000000;
        }
        -[GEOFlyoverRegionVersions addRegion:]((uint64_t)self->_versions, v19 | (v11 << 32), v18);
      }
    }
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parseError, 0);
  objc_storeStrong((id *)&self->_versions, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
}

@end
