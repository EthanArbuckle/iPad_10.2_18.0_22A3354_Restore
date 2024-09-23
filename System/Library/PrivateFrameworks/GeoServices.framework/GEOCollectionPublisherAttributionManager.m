@implementation GEOCollectionPublisherAttributionManager

+ (id)sharedInstance
{
  if (qword_1ECDBCAA0 != -1)
    dispatch_once(&qword_1ECDBCAA0, &__block_literal_global_185);
  return (id)_MergedGlobals_321;
}

void __58__GEOCollectionPublisherAttributionManager_sharedInstance__block_invoke()
{
  GEOCollectionPublisherAttributionManager *v0;
  void *v1;

  v0 = objc_alloc_init(GEOCollectionPublisherAttributionManager);
  v1 = (void *)_MergedGlobals_321;
  _MergedGlobals_321 = (uint64_t)v0;

}

- (GEOCollectionPublisherAttributionManager)init
{
  GEOCollectionPublisherAttributionManager *v2;
  uint64_t v3;
  geo_isolater *isolator;
  NSCache *v5;
  NSCache *manifestsCache;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GEOCollectionPublisherAttributionManager;
  v2 = -[GEOCollectionPublisherAttributionManager init](&v8, sel_init);
  if (v2)
  {
    v3 = geo_isolater_create();
    isolator = v2->_isolator;
    v2->_isolator = (geo_isolater *)v3;

    v5 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    manifestsCache = v2->_manifestsCache;
    v2->_manifestsCache = v5;

  }
  return v2;
}

- (id)bestAttributionForPublisher:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99DC8];
  v5 = a3;
  objc_msgSend(v4, "preferredLanguages");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GEOCollectionPublisherAttributionManager bestAttributionForPublisher:preferredLanguages:](self, "bestAttributionForPublisher:preferredLanguages:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)bestAttributionForPublisher:(id)a3 preferredLanguages:(id)a4
{
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  GEOPublisherAttributionManifestIndex *index;
  void *v16;
  void *v17;
  unsigned int v18;
  uint64_t v19;
  void *v20;
  void *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  _GEOCollectionPublisherAttribution *v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  NSObject *v33;
  NSObject *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  NSObject *v40;
  __int16 v41;
  NSObject *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (!-[NSObject length](v6, "length"))
  {
    v28 = 0;
    goto LABEL_27;
  }
  v38 = 0u;
  v36 = 0u;
  v37 = 0u;
  v35 = 0u;
  -[NSCache allObjects](self->_manifestsCache, "allObjects");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v36;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v36 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * i), "publisherAttributionSources");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v28 = -[_GEOCollectionPublisherAttribution initWithPublisherAttributionSource:preferredLanguages:]([_GEOCollectionPublisherAttribution alloc], "initWithPublisherAttributionSource:preferredLanguages:", v14, v7);

          goto LABEL_26;
        }
      }
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
      if (v10)
        continue;
      break;
    }
  }

  geo_isolate_sync();
  index = self->_index;
  if (!index)
  {
    GEOGetPublisherAttributionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_WORD *)buf = 0;
    v29 = "Unable to parse index";
    v30 = v8;
    v31 = 2;
LABEL_24:
    _os_log_impl(&dword_1885A9000, v30, OS_LOG_TYPE_ERROR, v29, buf, v31);
    goto LABEL_25;
  }
  -[GEOPublisherAttributionManifestIndex publisherToFileIndex](index, "publisherToFileIndex");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "objectForKeyedSubscript:", v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    GEOGetPublisherAttributionLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      goto LABEL_25;
    *(_DWORD *)buf = 138412290;
    v40 = v6;
    v29 = "Publisher id \"%@\" not found in the index";
    v30 = v8;
    v31 = 12;
    goto LABEL_24;
  }
  v18 = -[GEOPublisherAttributionManifestIndex publisherToFileIndexForKey:](self->_index, "publisherToFileIndexForKey:", v6);
  if (-[GEOPublisherAttributionManifestIndex publisherAttributionFilesCount](self->_index, "publisherAttributionFilesCount") > v18)
  {
    v19 = v18;
    -[GEOPublisherAttributionManifestIndex publisherAttributionFiles](self->_index, "publisherAttributionFiles");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectAtIndexedSubscript:", v19);
    v8 = objc_claimAutoreleasedReturnValue();

    +[GEOResourceManager sharedManager](GEOResourceManager, "sharedManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "pathForResourceWithName:fallbackBundle:", v8, 0);
    v22 = objc_claimAutoreleasedReturnValue();

    if (-[NSObject length](v22, "length"))
    {
      v23 = (objc_class *)objc_opt_class();
      loadResource(v22, v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (v24)
      {
        v25 = v24;
        geo_isolate_sync();
        -[NSObject publisherAttributionSources](v25, "publisherAttributionSources");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectForKeyedSubscript:", v6);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        if (v27)
        {
          v28 = -[_GEOCollectionPublisherAttribution initWithPublisherAttributionSource:preferredLanguages:]([_GEOCollectionPublisherAttribution alloc], "initWithPublisherAttributionSource:preferredLanguages:", v27, v7);
        }
        else
        {
          GEOGetPublisherAttributionLog();
          v34 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412546;
            v40 = v6;
            v41 = 2112;
            v42 = v22;
            _os_log_impl(&dword_1885A9000, v34, OS_LOG_TYPE_ERROR, "Publisher \"%@\" does not exist in manifest \"%@\", buf, 0x16u);
          }

          v28 = 0;
        }

        goto LABEL_38;
      }
      GEOGetPublisherAttributionLog();
      v33 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v22;
        _os_log_impl(&dword_1885A9000, v33, OS_LOG_TYPE_ERROR, "Could not parse \"%@\", buf, 0xCu);
      }

      v25 = 0;
    }
    else
    {
      GEOGetPublisherAttributionLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v40 = v8;
        _os_log_impl(&dword_1885A9000, v25, OS_LOG_TYPE_ERROR, "Could not locate resource \"%@\", buf, 0xCu);
      }
    }
    v28 = 0;
LABEL_38:

    goto LABEL_26;
  }
  GEOGetPublisherAttributionLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v40) = v18;
    v29 = "File index %u is invalid";
    v30 = v8;
    v31 = 8;
    goto LABEL_24;
  }
LABEL_25:
  v28 = 0;
LABEL_26:

LABEL_27:
  return v28;
}

void __91__GEOCollectionPublisherAttributionManager_bestAttributionForPublisher_preferredLanguages___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    +[GEOResourceManager sharedManager](GEOResourceManager, "sharedManager");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "pathForResourceWithName:fallbackBundle:", CFSTR("publisher_attribution_manifest_index.pb"), 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v3, "length"))
    {
      v4 = (objc_class *)objc_opt_class();
      loadResource(v3, v4);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(a1 + 32);
      v7 = *(void **)(v6 + 24);
      *(_QWORD *)(v6 + 24) = v5;

    }
    else
    {
      GEOGetPublisherAttributionLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1885A9000, v8, OS_LOG_TYPE_ERROR, "Unable to locate index", v9, 2u);
      }

    }
  }
}

uint64_t __91__GEOCollectionPublisherAttributionManager_bestAttributionForPublisher_preferredLanguages___block_invoke_110(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_isolator, 0);
  objc_storeStrong((id *)&self->_manifestsCache, 0);
}

@end
