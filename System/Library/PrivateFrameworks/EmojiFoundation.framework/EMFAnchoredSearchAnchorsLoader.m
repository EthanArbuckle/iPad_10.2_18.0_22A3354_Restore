@implementation EMFAnchoredSearchAnchorsLoader

- (EMFAnchoredSearchAnchorsLoader)initWithLocaleIdentifier:(id)a3
{
  id v4;
  EMFAnchoredSearchAnchorsLoader *v5;
  uint64_t v6;
  NSString *localeIdentifier;
  uint64_t v8;
  EMFAnchoredSearchAnchorsCache *anchorsCache;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EMFAnchoredSearchAnchorsLoader;
  v5 = -[EMFAnchoredSearchAnchorsLoader init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)v6;

    +[EMFAnchoredSearchAnchorsCache sharedCache](EMFAnchoredSearchAnchorsCache, "sharedCache");
    v8 = objc_claimAutoreleasedReturnValue();
    anchorsCache = v5->_anchorsCache;
    v5->_anchorsCache = (EMFAnchoredSearchAnchorsCache *)v8;

  }
  return v5;
}

- (NSArray)leftHandAnchors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EMFAnchoredSearchAnchorsLoader locallyCachedAnchorCollection](self, "locallyCachedAnchorCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[EMFAnchoredSearchAnchorsLoader localeIdentifier](self, "localeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMFAnchoredSearchAnchorsLoader _loadAndCacheAnchorsForLocaleIdentifierIfNecessary:](self, "_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:", v4);

  }
  -[EMFAnchoredSearchAnchorsLoader locallyCachedAnchorCollection](self, "locallyCachedAnchorCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "leftHandAnchors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (NSArray)rightHandAnchors
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[EMFAnchoredSearchAnchorsLoader locallyCachedAnchorCollection](self, "locallyCachedAnchorCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[EMFAnchoredSearchAnchorsLoader localeIdentifier](self, "localeIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[EMFAnchoredSearchAnchorsLoader _loadAndCacheAnchorsForLocaleIdentifierIfNecessary:](self, "_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:", v4);

  }
  -[EMFAnchoredSearchAnchorsLoader locallyCachedAnchorCollection](self, "locallyCachedAnchorCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightHandAnchors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

- (void)_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  EMFAnchoredSearchAnchorCollection *v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  NSObject *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  __int128 *p_buf;
  uint8_t v44[4];
  id v45;
  __int16 v46;
  id v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int128 buf;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[EMFAnchoredSearchAnchorsLoader locallyCachedAnchorCollection](self, "locallyCachedAnchorCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    -[EMFAnchoredSearchAnchorsLoader anchorsCache](self, "anchorsCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "anchorCollectionForLocaleIdentifier:", v4);
    v7 = (EMFAnchoredSearchAnchorCollection *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[EMFAnchoredSearchAnchorsLoader setLocallyCachedAnchorCollection:](self, "setLocallyCachedAnchorCollection:", v7);
LABEL_42:

      goto LABEL_43;
    }
    emf_logging_get_default_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v4;
      _os_log_impl(&dword_1B3DE1000, v8, OS_LOG_TYPE_INFO, "Loading search anchors for locale '%{public}@'", (uint8_t *)&buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v53 = 0x3032000000;
    v54 = __Block_byref_object_copy__0;
    v55 = __Block_byref_object_dispose__0;
    objc_msgSend(v9, "URLForResource:withExtension:subdirectory:", v4, CFSTR("plist"), CFSTR("Anchor Strings"));
    v56 = (id)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "languageIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      emf_logging_get_default_log();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v44 = 138543618;
        v45 = v4;
        v46 = 2114;
        v47 = v12;
        _os_log_impl(&dword_1B3DE1000, v13, OS_LOG_TYPE_INFO, "No search anchors found for locale identifier '%{public}@'; attempting to load data associated with the normal"
          "ized locale identifier '%{public}@'.",
          v44,
          0x16u);
      }

      objc_msgSend(v9, "URLForResource:withExtension:subdirectory:", v12, CFSTR("plist"), CFSTR("Anchor Strings"));
      v14 = objc_claimAutoreleasedReturnValue();
      v15 = *(void **)(*((_QWORD *)&buf + 1) + 40);
      *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v14;

      v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      if (!v10)
      {
        emf_logging_get_default_log();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v44 = 138543362;
          v45 = v4;
          _os_log_impl(&dword_1B3DE1000, v16, OS_LOG_TYPE_INFO, "No search anchors found for locale identifier '%{public}@'; attempting to load a fallback language.",
            v44,
            0xCu);
        }

        v17 = (void *)MEMORY[0x1E0C99DC8];
        v40[0] = MEMORY[0x1E0C809B0];
        v40[1] = 3221225472;
        v40[2] = __85__EMFAnchoredSearchAnchorsLoader__loadAndCacheAnchorsForLocaleIdentifierIfNecessary___block_invoke;
        v40[3] = &unk_1E66F9EB0;
        v18 = v4;
        v41 = v18;
        p_buf = &buf;
        v42 = v9;
        objc_msgSend(v17, "_enumerateLanguageFallbackGraphForLocaleIdentifier:usingBlock:", v18, v40);
        if (!*(_QWORD *)(*((_QWORD *)&buf + 1) + 40))
        {
          emf_logging_get_default_log();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            -[EMFAnchoredSearchAnchorsLoader _loadAndCacheAnchorsForLocaleIdentifierIfNecessary:].cold.1((uint64_t)v18, v33, v34);

          v7 = 0;
          v20 = v41;
          goto LABEL_41;
        }

        v10 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      }
    }
    v39 = 0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v10, &v39);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v39;
    if (!v20 && v19 && objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("metadata"));
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (v21)
      {
        -[NSObject objectForKeyedSubscript:](v21, "objectForKeyedSubscript:", CFSTR("schemaVersion"));
        v23 = objc_claimAutoreleasedReturnValue();
        v24 = v23;
        if (v23 && -[NSObject unsignedLongValue](v23, "unsignedLongValue") == 1)
        {
          v7 = -[EMFAnchoredSearchAnchorCollection initWithLocaleIdentifier:]([EMFAnchoredSearchAnchorCollection alloc], "initWithLocaleIdentifier:", v4);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("leftHandAnchors"));
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = v25;
          if (v25 && -[NSObject count](v25, "count"))
            -[EMFAnchoredSearchAnchorCollection setLeftHandAnchors:](v7, "setLeftHandAnchors:", v26);
          objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("rightHandAnchors"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          if (v38 && objc_msgSend(v38, "count"))
            -[EMFAnchoredSearchAnchorCollection setRightHandAnchors:](v7, "setRightHandAnchors:", v38);
          -[EMFAnchoredSearchAnchorsLoader anchorsCache](self, "anchorsCache");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "setAnchorCollection:forLocaleIdentifier:", v7, v4);

          -[EMFAnchoredSearchAnchorsLoader setLocallyCachedAnchorCollection:](self, "setLocallyCachedAnchorCollection:", v7);
          emf_logging_get_default_log();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "absoluteString");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v37 = -[NSObject count](v26, "count");
            v30 = objc_msgSend(v38, "count");
            *(_DWORD *)v44 = 138544130;
            v45 = v29;
            v46 = 2114;
            v47 = v4;
            v48 = 2048;
            v49 = v37;
            v50 = 2048;
            v51 = v30;
            _os_log_impl(&dword_1B3DE1000, v28, OS_LOG_TYPE_INFO, "Loaded search anchor plist '%{public}@' for locale '%{public}@' (%lu left, %lu right)", v44, 0x2Au);

          }
        }
        else
        {
          emf_logging_get_default_log();
          v26 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "absoluteString");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[EMFAnchoredSearchAnchorsLoader _loadAndCacheAnchorsForLocaleIdentifierIfNecessary:].cold.3(v31, v44, -[NSObject unsignedLongValue](v24, "unsignedLongValue"), v26);
          }
          v7 = 0;
        }

      }
      else
      {
        emf_logging_get_default_log();
        v24 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "absoluteString");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[EMFAnchoredSearchAnchorsLoader _loadAndCacheAnchorsForLocaleIdentifierIfNecessary:].cold.2(v32, (uint64_t)v44, v24);
        }
        v7 = 0;
      }

    }
    else
    {
      emf_logging_get_default_log();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "absoluteString");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedDescription");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)v44 = 138543874;
        v45 = v35;
        v46 = 2114;
        v47 = v4;
        v48 = 2114;
        v49 = (uint64_t)v36;
        _os_log_error_impl(&dword_1B3DE1000, v22, OS_LOG_TYPE_ERROR, "Search anchor plist at path '%{public}@' for locale '%{public}@' could not be read with error: '%{public}@", v44, 0x20u);

      }
      v7 = 0;
    }

LABEL_41:
    _Block_object_dispose(&buf, 8);

    goto LABEL_42;
  }
LABEL_43:

}

void __85__EMFAnchoredSearchAnchorsLoader__loadAndCacheAnchorsForLocaleIdentifierIfNecessary___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if ((objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", v5) & 1) == 0)
  {
    emf_logging_get_default_log();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v10 = 138543362;
      v11 = v5;
      _os_log_impl(&dword_1B3DE1000, v6, OS_LOG_TYPE_INFO, "Loading search anchors for language fallback '%{public}@'", (uint8_t *)&v10, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 40), "URLForResource:withExtension:subdirectory:", v5, CFSTR("plist"), CFSTR("Anchor Strings"));
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      *a3 = 1;
  }

}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (EMFAnchoredSearchAnchorsCache)anchorsCache
{
  return self->_anchorsCache;
}

- (void)setAnchorsCache:(id)a3
{
  objc_storeStrong((id *)&self->_anchorsCache, a3);
}

- (EMFAnchoredSearchAnchorCollection)locallyCachedAnchorCollection
{
  return (EMFAnchoredSearchAnchorCollection *)objc_loadWeakRetained((id *)&self->_locallyCachedAnchorCollection);
}

- (void)setLocallyCachedAnchorCollection:(id)a3
{
  objc_storeWeak((id *)&self->_locallyCachedAnchorCollection, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_locallyCachedAnchorCollection);
  objc_storeStrong((id *)&self->_anchorsCache, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

- (void)_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1B3DE1000, a2, a3, "Could not load search anchors for locale identifier '%{public}@'.", (uint8_t *)&v3);
}

- (void)_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:(NSObject *)a3 .cold.2(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_0_1(&dword_1B3DE1000, a3, (uint64_t)a3, "Search anchor plist at path '%{public}@' is malformed and lacks a 'metadata' segment.", (uint8_t *)a2);

}

- (void)_loadAndCacheAnchorsForLocaleIdentifierIfNecessary:(uint64_t)a3 .cold.3(void *a1, uint8_t *buf, uint64_t a3, os_log_t log)
{
  *(_DWORD *)buf = 138543618;
  *(_QWORD *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2048;
  *(_QWORD *)(buf + 14) = a3;
  _os_log_error_impl(&dword_1B3DE1000, log, OS_LOG_TYPE_ERROR, "Search anchor plist at path '%{public}@' registers an unsupported schemaVersion of '%lu'.", buf, 0x16u);

}

@end
