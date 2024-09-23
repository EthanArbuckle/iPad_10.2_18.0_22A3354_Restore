@implementation PAMediaConversionServiceResourceURLCollection

- (PAMediaConversionServiceResourceURLCollection)init
{
  PAMediaConversionServiceResourceURLCollection *v2;
  uint64_t v3;
  NSMutableDictionary *urlReferencesByRole;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PAMediaConversionServiceResourceURLCollection;
  v2 = -[PAMediaConversionServiceResourceURLCollection init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = objc_claimAutoreleasedReturnValue();
    urlReferencesByRole = v2->_urlReferencesByRole;
    v2->_urlReferencesByRole = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (BOOL)isEqual:(id)a3
{
  NSMutableDictionary *urlReferencesByRole;
  void *v4;

  urlReferencesByRole = self->_urlReferencesByRole;
  objc_msgSend(a3, "urlReferencesByRole");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(urlReferencesByRole) = -[NSMutableDictionary isEqual:](urlReferencesByRole, "isEqual:", v4);

  return (char)urlReferencesByRole;
}

- (unint64_t)hash
{
  unint64_t v2;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__PAMediaConversionServiceResourceURLCollection_hash__block_invoke;
  v4[3] = &unk_1E9953620;
  v4[4] = &v5;
  -[PAMediaConversionServiceResourceURLCollection enumerateResourceURLReferences:](self, "enumerateResourceURLReferences:", v4);
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)setResourceURL:(id)a3 forRole:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v7 = a4;
  if (v13)
  {
    if (v7)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 251, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

    if (v7)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 252, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("role"));

LABEL_3:
  -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 253, CFSTR("This resource URL collection already has a URL for role '%@'"), v7);

  }
  +[PAMediaConversionServiceResourceURLReference referenceWithURL:](PAMediaConversionServiceResourceURLReference, "referenceWithURL:", v13);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_urlReferencesByRole, "setObject:forKeyedSubscript:", v9, v7);

}

- (void)setResourceURL:(id)a3 forRole:(id)a4 deleteOnDeallocation:(BOOL)a5
{
  _BOOL8 v5;
  id v8;

  v5 = a5;
  v8 = a4;
  -[PAMediaConversionServiceResourceURLCollection setResourceURL:forRole:](self, "setResourceURL:forRole:", a3, v8);
  -[PAMediaConversionServiceResourceURLCollection setShouldDeleteURLOnDeallocation:forRole:](self, "setShouldDeleteURLOnDeallocation:forRole:", v5, v8);

}

- (id)resourceURLForRole:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 266, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("role"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "validateAccessForURL:role:", v7, v5);
    v10 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v10;
  }

  return v7;
}

- (void)setShouldDeleteURLOnDeallocation:(BOOL)a3 forRole:(id)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  v9 = a4;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 277, CFSTR("No URL is currently set for role %@"), v9);

  }
  objc_msgSend(v7, "setShouldDeleteOnDeallocation:", v4);

}

- (BOOL)containsAllRoles:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 283, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[roles count]"));

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v11)
        {
          v12 = 0;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 1;
LABEL_13:

  return v12;
}

- (BOOL)containsAnyRole:(id)a3
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[roles count]"));

  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i));
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (v11)
        {
          v12 = 1;
          goto LABEL_13;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_13:

  return v12;
}

- (id)typeIdentifierForResourceURLWithRole:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  char v10;
  id v11;
  id v12;
  void *v13;
  char v14;
  void *v15;
  int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  int v23;
  CGImageSource *v24;
  CGImageSource *v25;
  void *v26;
  void *v27;
  id v28;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 305, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("role"));

  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 313, CFSTR("Unexpected nil role"));

    }
    v34 = 0;
    v9 = *MEMORY[0x1E0C99AD0];
    v33 = 0;
    v10 = objc_msgSend(v8, "getResourceValue:forKey:error:", &v34, v9, &v33);
    v11 = v34;
    v12 = v33;
    v13 = v12;
    if ((v10 & 1) != 0)
    {
      v14 = 0;
LABEL_13:
      if (v11)
      {
        if ((v14 & 1) == 0)
        {
          objc_msgSend(MEMORY[0x1E0CEC3F8], "typeWithIdentifier:", v11);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = objc_msgSend(v22, "conformsToType:", *MEMORY[0x1E0CEC520]);

          if (v23)
          {
            v24 = CGImageSourceCreateWithURL((CFURLRef)v8, 0);
            if (v24)
            {
              v25 = v24;
              CGImageSourceGetType(v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = v26;
              if (v26)
              {
                v28 = v26;

                v11 = v28;
              }
              CFRelease(v25);

            }
          }
        }
      }
LABEL_24:

      goto LABEL_25;
    }
    objc_msgSend(v12, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB28A8]);
    v14 = v16;
    if (v16)
    {
      v17 = objc_msgSend(v13, "code");

      if (v17 != 260)
      {
        v14 = 0;
        if (v11)
          goto LABEL_13;
        goto LABEL_21;
      }
      v18 = (void *)MEMORY[0x1E0CEC3F8];
      objc_msgSend(v8, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "pathExtension");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "typeWithFilenameExtension:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "identifier");
      v21 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v21;
    }

    if (v11)
      goto LABEL_13;
LABEL_21:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = v5;
      v37 = 2112;
      v38 = v30;
      v39 = 2114;
      v40 = v13;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to determine type identifier for URL with role %{public}@ %@: %{public}@", buf, 0x20u);

    }
    v11 = 0;
    goto LABEL_24;
  }
  v11 = 0;
LABEL_25:

  return v11;
}

- (id)bookmarkDataDictionaryRepresentationWithError:(id *)a3
{
  void *v5;
  NSMutableDictionary *urlReferencesByRole;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __95__PAMediaConversionServiceResourceURLCollection_bookmarkDataDictionaryRepresentationWithError___block_invoke;
  v10[3] = &unk_1E9953648;
  v12 = &v18;
  v7 = v5;
  v11 = v7;
  v13 = &v14;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](urlReferencesByRole, "enumerateKeysAndObjectsUsingBlock:", v10);
  if (*((_BYTE *)v15 + 24))
  {
    v8 = 0;
    if (a3)
      *a3 = objc_retainAutorelease((id)v19[5]);
  }
  else
  {
    v8 = v7;
  }

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8;
}

- (id)filenameExtensionAndPathHashForRole:(id)a3
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v10;
  uint64_t v11;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v10 = 0;
    v11 = 0;
    objc_msgSend(v3, "getPathHash:lastPathComponent:", &v11, &v10);
    v5 = v10;
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@|%lx"), v7, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)ensureFilesExistWithError:(id *)a3
{
  void *v5;
  NSMutableDictionary *urlReferencesByRole;
  id v7;
  int v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__PAMediaConversionServiceResourceURLCollection_ensureFilesExistWithError___block_invoke;
  v10[3] = &unk_1E9953648;
  v7 = v5;
  v11 = v7;
  v12 = &v14;
  v13 = &v18;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](urlReferencesByRole, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = *((unsigned __int8 *)v15 + 24);
  if (a3 && *((_BYTE *)v15 + 24))
    *a3 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8 == 0;
}

- (BOOL)removeExistingEmptyFilesWithError:(id *)a3
{
  void *v5;
  NSMutableDictionary *urlReferencesByRole;
  id v7;
  int v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy_;
  v22 = __Block_byref_object_dispose_;
  v23 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  urlReferencesByRole = self->_urlReferencesByRole;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__PAMediaConversionServiceResourceURLCollection_removeExistingEmptyFilesWithError___block_invoke;
  v10[3] = &unk_1E9953648;
  v12 = &v18;
  v13 = &v14;
  v7 = v5;
  v11 = v7;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](urlReferencesByRole, "enumerateKeysAndObjectsUsingBlock:", v10);
  v8 = *((unsigned __int8 *)v15 + 24);
  if (a3 && *((_BYTE *)v15 + 24))
    *a3 = objc_retainAutorelease((id)v19[5]);

  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);

  return v8 == 0;
}

- (BOOL)allURLsAreReadable
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__PAMediaConversionServiceResourceURLCollection_allURLsAreReadable__block_invoke;
  v6[3] = &unk_1E9953670;
  v8 = &v9;
  v4 = v3;
  v7 = v4;
  -[PAMediaConversionServiceResourceURLCollection enumerateResourceURLs:](self, "enumerateResourceURLs:", v6);
  LOBYTE(self) = *((_BYTE *)v10 + 24);

  _Block_object_dispose(&v9, 8);
  return (char)self;
}

- (id)logMessageSummaryWithFullPath:(BOOL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *, void *);
  void *v13;
  id v14;
  BOOL v15;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("<"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __79__PAMediaConversionServiceResourceURLCollection_logMessageSummaryWithFullPath___block_invoke;
  v13 = &unk_1E9953698;
  v14 = v6;
  v15 = a3;
  v7 = v6;
  -[PAMediaConversionServiceResourceURLCollection enumerateResourceURLs:](self, "enumerateResourceURLs:", &v10);
  objc_msgSend(v7, "componentsJoinedByString:", CFSTR("|"), v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v8);

  objc_msgSend(v5, "appendString:", CFSTR(">"));
  return v5;
}

- (id)logMessageSummary
{
  return -[PAMediaConversionServiceResourceURLCollection logMessageSummaryWithFullPath:](self, "logMessageSummaryWithFullPath:", 0);
}

- (id)description
{
  return -[PAMediaConversionServiceResourceURLCollection logMessageSummaryWithFullPath:](self, "logMessageSummaryWithFullPath:", 1);
}

- (id)fileSizeSummary
{
  void *v3;
  void *v4;
  NSMutableDictionary *urlReferencesByRole;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("<"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  urlReferencesByRole = self->_urlReferencesByRole;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PAMediaConversionServiceResourceURLCollection_fileSizeSummary__block_invoke;
  v9[3] = &unk_1E99536C0;
  v10 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](urlReferencesByRole, "enumerateKeysAndObjectsUsingBlock:", v9);
  objc_msgSend(v6, "componentsJoinedByString:", CFSTR("|"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v7);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return v3;
}

- (void)enumerateResourceURLReferences:(id)a3
{
  void (**v4)(id, uint64_t, void *, unsigned __int8 *);
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  unsigned __int8 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, uint64_t, void *, unsigned __int8 *))a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allKeys](self->_urlReferencesByRole, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_96);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v15 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
      -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0;
      v4[2](v4, v11, v12, &v13);
      LODWORD(v11) = v13;

      if ((_DWORD)v11)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateResourceURLs:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__PAMediaConversionServiceResourceURLCollection_enumerateResourceURLs___block_invoke;
  v6[3] = &unk_1E9953708;
  v7 = v4;
  v5 = v4;
  -[PAMediaConversionServiceResourceURLCollection enumerateResourceURLReferences:](self, "enumerateResourceURLReferences:", v6);

}

- (unint64_t)urlCount
{
  return -[NSMutableDictionary count](self->_urlReferencesByRole, "count");
}

- (id)urlForDebugDumpWithDirectoryName:(id)a3 inExistingParentDirectory:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  char v15;
  void *v16;
  void *v17;
  id *v18;
  char v19;
  id v20;
  id v21;
  void *v22;
  BOOL v23;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  PAMediaConversionServiceResourceURLCollection *v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  id obj;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  id v43;
  char v44;
  uint64_t v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 541, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("outputDirectoryName"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 542, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("parentDirectoryURL"));

LABEL_3:
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v11, "path");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "fileExistsAtPath:isDirectory:", v13, &v44);

  if (v44)
    v15 = v14;
  else
    v15 = 0;
  if ((v15 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 546, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("exists && isDirectory"));

  }
  objc_msgSend(v11, "URLByAppendingPathComponent:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  v39 = &v38;
  v40 = 0x3032000000;
  v41 = __Block_byref_object_copy_;
  v42 = __Block_byref_object_dispose_;
  v43 = 0;
  v45 = *MEMORY[0x1E0CB2A98];
  v46[0] = CFSTR("mobile");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id *)(v39 + 5);
  obj = (id)v39[5];
  v19 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v16, 0, v17, &obj);
  objc_storeStrong(v18, obj);

  if ((v19 & 1) != 0)
    goto LABEL_9;
  objc_msgSend((id)v39[5], "domain");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v22, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
  {
    v23 = objc_msgSend((id)v39[5], "code") == 516;

    if (v23)
    {
LABEL_9:
      v33 = 0;
      v34 = &v33;
      v35 = 0x2020000000;
      v36 = 0;
      v28[0] = MEMORY[0x1E0C809B0];
      v28[1] = 3221225472;
      v28[2] = __114__PAMediaConversionServiceResourceURLCollection_urlForDebugDumpWithDirectoryName_inExistingParentDirectory_error___block_invoke;
      v28[3] = &unk_1E9953730;
      v20 = v16;
      v29 = v20;
      v30 = self;
      v31 = &v38;
      v32 = &v33;
      -[PAMediaConversionServiceResourceURLCollection enumerateResourceURLs:](self, "enumerateResourceURLs:", v28);
      if (*((_BYTE *)v34 + 24))
      {
        v21 = 0;
        if (a5)
          *a5 = objc_retainAutorelease((id)v39[5]);
      }
      else
      {
        v21 = v20;
      }

      _Block_object_dispose(&v33, 8);
      goto LABEL_20;
    }
  }
  else
  {

  }
  v21 = 0;
  if (a5)
    *a5 = objc_retainAutorelease((id)v39[5]);
LABEL_20:
  _Block_object_dispose(&v38, 8);

  return v21;
}

- (BOOL)copyURL:(id)a3 forRole:(id)a4 toDirectory:(id)a5 error:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  int v12;
  char v13;
  void *v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *MEMORY[0x1E0CB2A98];
  v18[0] = CFSTR("mobile");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 0, v11, a6);

  v13 = 0;
  if (v12)
  {
    objc_msgSend(v8, "lastPathComponent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "URLByAppendingPathComponent:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v10, "copyItemAtURL:toURL:error:", v8, v15, a6);
  }

  return v13;
}

- (NSMutableDictionary)urlReferencesByRole
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setUrlReferencesByRole:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PAMediaConversionServiceResourceURLCollectionAccessProvider)accessProviderDelegate
{
  return (PAMediaConversionServiceResourceURLCollectionAccessProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccessProviderDelegate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessProviderDelegate, 0);
  objc_storeStrong((id *)&self->_urlReferencesByRole, 0);
}

void __114__PAMediaConversionServiceResourceURLCollection_urlForDebugDumpWithDirectoryName_inExistingParentDirectory_error___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  char v13;
  id obj;

  v7 = (void *)a1[4];
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "URLByAppendingPathComponent:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)a1[5];
  v12 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v12 + 40);
  v13 = objc_msgSend(v11, "copyURL:forRole:toDirectory:error:", v8, v9, v10, &obj);

  objc_storeStrong((id *)(v12 + 40), obj);
  if ((v13 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = 1;
    *a4 = 1;
  }

}

void __71__PAMediaConversionServiceResourceURLCollection_enumerateResourceURLs___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  id v7;
  id v8;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = a2;
  objc_msgSend(a3, "url");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v7, v8, a4);

}

uint64_t __80__PAMediaConversionServiceResourceURLCollection_enumerateResourceURLReferences___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __64__PAMediaConversionServiceResourceURLCollection_fileSizeSummary__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  char v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  _QWORD v15[2];
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v13 = 0;
  v14 = 0;
  v6 = objc_msgSend(a3, "getFileSize:error:", &v14, &v13);
  v7 = v13;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v14);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringValue");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v5;
      v18 = 2114;
      v19 = v7;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to get file size for url with role %{public}@: %{public}@", buf, 0x16u);
    }
    v9 = CFSTR("?");
  }
  v10 = *(void **)(a1 + 32);
  v15[0] = v5;
  v15[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR("="));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v12);

}

void __79__PAMediaConversionServiceResourceURLCollection_logMessageSummaryWithFullPath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(a1 + 32);
  v14[0] = v5;
  v8 = *(unsigned __int8 *)(a1 + 40);
  objc_msgSend(v6, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  v11 = v9;
  if (!v8)
  {
    objc_msgSend(v9, "lastPathComponent");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "componentsJoinedByString:", CFSTR("="));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v13);

  if (!v8)
}

void __67__PAMediaConversionServiceResourceURLCollection_allURLsAreReadable__block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  v6 = *(void **)(a1 + 32);
  objc_msgSend(a3, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v6, "isReadableFileAtPath:", v7);

  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) ^ 1;
}

void __83__PAMediaConversionServiceResourceURLCollection_removeExistingEmptyFilesWithError___block_invoke(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  char v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  const char *v17;
  uint64_t v18;
  id v19;
  id obj;
  uint64_t v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v9 + 40);
  v21 = 0;
  v10 = objc_msgSend(v8, "getFileSize:error:", &v21, &obj);
  objc_storeStrong((id *)(v9 + 40), obj);
  if ((v10 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "url");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138543874;
      v23 = v7;
      v24 = 2112;
      v25 = v14;
      v26 = 2114;
      v27 = v18;
      v16 = MEMORY[0x1E0C81028];
      v17 = "Unable to get file size for URL ref with role %{public}@ %@: %{public}@";
      goto LABEL_10;
    }
LABEL_7:
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
    goto LABEL_8;
  }
  if (!v21)
  {
    v11 = (void *)a1[4];
    objc_msgSend(v8, "url");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(a1[5] + 8);
    v19 = *(id *)(v13 + 40);
    LOBYTE(v11) = objc_msgSend(v11, "removeItemAtURL:error:", v12, &v19);
    objc_storeStrong((id *)(v13 + 40), v19);

    if ((v11 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v8, "url");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
        *(_DWORD *)buf = 138543874;
        v23 = v7;
        v24 = 2112;
        v25 = v14;
        v26 = 2114;
        v27 = v15;
        v16 = MEMORY[0x1E0C81028];
        v17 = "Unable to remove empty file for URL ref with role %{public}@ %@: %{public}@";
LABEL_10:
        _os_log_error_impl(&dword_1D51DF000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x20u);

        goto LABEL_7;
      }
      goto LABEL_7;
    }
  }
LABEL_8:

}

void __75__PAMediaConversionServiceResourceURLCollection_ensureFilesExistWithError___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id obj;
  char v25;
  uint64_t v26;
  const __CFString *v27;
  uint64_t v28;
  const __CFString *v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "url");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(*(id *)(a1 + 32), "fileExistsAtPath:isDirectory:", v8, 0) & 1) != 0)
    goto LABEL_17;
  objc_msgSend(v6, "url");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByDeletingLastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v10, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = objc_msgSend(v11, "fileExistsAtPath:isDirectory:", v12, &v25);

  if ((_DWORD)v11)
  {
    if (v25)
      goto LABEL_9;
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    *(_DWORD *)buf = 138412290;
    v31 = v8;
    v13 = MEMORY[0x1E0C81028];
    v14 = "Attempting to create empty destination output file at path %@ but the parent directory path exists and is not a directory";
    goto LABEL_19;
  }
  v15 = *(void **)(a1 + 32);
  v28 = *MEMORY[0x1E0CB2A98];
  v29 = CFSTR("mobile");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v17 + 40);
  LOBYTE(v15) = objc_msgSend(v15, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v10, 1, v16, &obj);
  objc_storeStrong((id *)(v17 + 40), obj);

  if ((v15 & 1) != 0)
    goto LABEL_9;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v23 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    *(_DWORD *)buf = 138412290;
    v31 = v23;
    v13 = MEMORY[0x1E0C81028];
    v14 = "Attempting to create empty destination output file at path %@ but parent directory creation failed:";
LABEL_19:
    _os_log_error_impl(&dword_1D51DF000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
  }
LABEL_8:
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
LABEL_9:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v18 = *(void **)(a1 + 32);
    v26 = *MEMORY[0x1E0CB2A98];
    v27 = CFSTR("mobile");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v18) = objc_msgSend(v18, "createFileAtPath:contents:attributes:", v8, 0, v19);

    if ((v18 & 1) == 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v31 = v8;
        _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to create empty file at destination %@", buf, 0xCu);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    }
  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    *a4 = 1;
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("PAMediaConversionServiceErrorDomain"), 4, 0);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v22 = *(void **)(v21 + 40);
    *(_QWORD *)(v21 + 40) = v20;

  }
LABEL_17:

}

void __95__PAMediaConversionServiceResourceURLCollection_bookmarkDataDictionaryRepresentationWithError___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  obj = *(id *)(v8 + 40);
  objc_msgSend(a3, "dictionaryRepresentationWithError:", &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v7);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v13 = v7;
      v14 = 2114;
      v15 = v10;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to encode bookmark data for resource in role %{public}@: %{public}@", buf, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

}

uint64_t __53__PAMediaConversionServiceResourceURLCollection_hash__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result;
  uint64_t v5;

  v5 = 0;
  result = objc_msgSend(a3, "getPathHash:lastPathComponent:", &v5, 0);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) ^= v5;
  return result;
}

+ (id)collectionWithMainResourceURL:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setResourceURL:forRole:", v3, CFSTR("PAMediaConversionResourceRoleMainResource"));

  return v4;
}

+ (id)collectionForBookmarkDataDictionaryRepresentation:(id)a3 accessProvider:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 169, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bookmarkDictionary"));

  }
  v11 = (void *)objc_opt_new();
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __120__PAMediaConversionServiceResourceURLCollection_collectionForBookmarkDataDictionaryRepresentation_accessProvider_error___block_invoke;
  v16[3] = &unk_1E99535D8;
  v18 = &v24;
  v12 = v11;
  v17 = v12;
  v19 = &v20;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v16);
  if (*((_BYTE *)v21 + 24))
  {
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease((id)v25[5]);
  }
  else
  {
    if (v10)
      objc_msgSend(v12, "setAccessProviderDelegate:", v10);
    v13 = v12;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);

  return v13;
}

+ (BOOL)getSignatureString:(id *)a3 filenameSummary:(id *)a4 forDictionaryRepresentation:(id)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  void *v20;
  _BOOL4 v21;
  id v22;
  BOOL v23;
  void *v25;
  id *v26;
  id *v27;
  char v28;
  id v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v9 = a5;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PAMediaConversionServiceResourceURLCollection.m"), 200, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bookmarkDictionary"));

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v9, "allKeys");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sortedArrayUsingComparator:", &__block_literal_global);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v13)
  {
    v14 = v13;
    v26 = a3;
    v27 = a4;
    v15 = 0;
    v16 = *(_QWORD *)v32;
    v28 = 1;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v32 != v16)
          objc_enumerationMutation(v12);
        v18 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        v29 = 0;
        v30 = 0;
        v19 = v9;
        objc_msgSend(v9, "objectForKeyedSubscript:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = +[PAMediaConversionServiceResourceURLReference getPathHash:lastPathComponent:forDictionaryRepresentation:](PAMediaConversionServiceResourceURLReference, "getPathHash:lastPathComponent:forDictionaryRepresentation:", &v30, &v29, v20);
        v22 = v29;

        if (v21)
        {
          v15 ^= v30;
          objc_msgSend(v10, "addObject:", v22);
        }
        else
        {
          v28 = 0;
        }

        v9 = v19;
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v14);

    a3 = v26;
    a4 = v27;
    if ((v28 & 1) == 0)
    {
      v23 = 0;
      goto LABEL_21;
    }
  }
  else
  {

    v15 = 0;
  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lx"), v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (a4)
  {
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR("|"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v23 = 1;
LABEL_21:

  return v23;
}

+ (id)filenameSummaryStringForDictionaryRepresentation:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a3, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "valueForKey:", CFSTR("lastPathComponent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "componentsJoinedByString:", CFSTR("|"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

uint64_t __112__PAMediaConversionServiceResourceURLCollection_getSignatureString_filenameSummary_forDictionaryRepresentation___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

void __120__PAMediaConversionServiceResourceURLCollection_collectionForBookmarkDataDictionaryRepresentation_accessProvider_error___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id obj;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v8 + 40);
  +[PAMediaConversionServiceResourceURLReference referenceWithDictionaryRepresentation:error:](PAMediaConversionServiceResourceURLReference, "referenceWithDictionaryRepresentation:error:", a3, &obj);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v8 + 40), obj);
  if (v9)
  {
    objc_msgSend(*(id *)(a1[4] + 8), "setObject:forKeyedSubscript:", v9, v7);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40);
      *(_DWORD *)buf = 138543618;
      v13 = v7;
      v14 = 2114;
      v15 = v10;
      _os_log_error_impl(&dword_1D51DF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Unable to decode bookmark data for resource in role %{public}@: %{public}@", buf, 0x16u);
    }
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
  }
  *a4 = *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24);

}

- (BOOL)isBlastDoorAccessRequired
{
  void *v2;
  char v3;

  -[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBlastDoorAccessRequired");

  return v3;
}

- (NSDictionary)blastDoorMainSourceProperties
{
  void *v2;
  void *v3;

  -[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blastDoorMainSourceProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)blastDoorVideoComplementProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_urlReferencesByRole, "objectForKeyedSubscript:", CFSTR("PAMediaConversionResourceRoleVideoComplement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "url");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "propertiesForVideoComplementURL:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (NSURL)blastDoorSourceURL
{
  void *v2;
  void *v3;

  -[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "blastDoorSourceURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSError)blastDoorError
{
  void *v2;
  void *v3;

  -[PAMediaConversionServiceResourceURLCollection accessProviderDelegate](self, "accessProviderDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSError *)v3;
}

@end
