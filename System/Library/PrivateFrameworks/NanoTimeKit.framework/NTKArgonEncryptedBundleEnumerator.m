@implementation NTKArgonEncryptedBundleEnumerator

- (NTKArgonEncryptedBundleEnumerator)initWithSourceDirectoryPaths:(id)a3
{
  id v4;
  NTKArgonEncryptedBundleEnumerator *v5;
  NTKArgonEncryptedBundleEnumerator *v6;
  void *v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  uint64_t v23;
  NSArray *allObjects;
  uint64_t v25;
  NSEnumerator *urlEnumerator;
  NTKArgonEncryptedBundleEnumerator *v28;
  id v29;
  id obj;
  uint64_t v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  objc_super v45;
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  id v50;
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v45.receiver = self;
  v45.super_class = (Class)NTKArgonEncryptedBundleEnumerator;
  v5 = -[NTKArgonEncryptedBundleEnumerator init](&v45, sel_init);
  v6 = v5;
  if (v5)
  {
    v28 = v5;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v29 = v4;
    obj = v4;
    v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v32)
    {
      v31 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v42 != v31)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = 0;
          objc_msgSend(v10, "contentsOfDirectoryAtPath:error:", v9, &v40);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v40;

          if (v11)
          {
            v33 = v12;
            v35 = i;
            objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v9);
            v13 = objc_claimAutoreleasedReturnValue();
            v36 = 0u;
            v37 = 0u;
            v38 = 0u;
            v39 = 0u;
            v34 = v11;
            objc_msgSend(v11, "sortedArrayUsingSelector:", sel_caseInsensitiveCompare_);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v37;
              do
              {
                for (j = 0; j != v16; ++j)
                {
                  if (*(_QWORD *)v37 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
                  objc_msgSend(v19, "pathExtension");
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  v21 = objc_msgSend(v20, "isEqualToString:", CFSTR("aea"));

                  if (v21)
                  {
                    -[NSObject URLByAppendingPathComponent:](v13, "URLByAppendingPathComponent:", v19);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v7, "addObject:", v22);

                  }
                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
              }
              while (v16);
            }

            v11 = v34;
            i = v35;
            v12 = v33;
          }
          else
          {
            _NTKLoggingObjectForDomain(39, (uint64_t)"NTKLoggingDomainArgon");
            v13 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138543618;
              v48 = v9;
              v49 = 2114;
              v50 = v12;
              _os_log_impl(&dword_1B72A3000, v13, OS_LOG_TYPE_DEFAULT, "NTKArgonEncryptedBundleEnumerator: No directory found at %{public}@: %{public}@", buf, 0x16u);
            }
          }

        }
        v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v32);
    }

    v23 = objc_msgSend(v7, "copy");
    v6 = v28;
    allObjects = v28->_allObjects;
    v28->_allObjects = (NSArray *)v23;

    -[NSArray objectEnumerator](v28->_allObjects, "objectEnumerator");
    v25 = objc_claimAutoreleasedReturnValue();
    urlEnumerator = v28->_urlEnumerator;
    v28->_urlEnumerator = (NSEnumerator *)v25;

    v4 = v29;
  }

  return v6;
}

- (NTKArgonEncryptedBundleEnumerator)initWithSourceDirectoryURLs:(id)a3
{
  id v4;
  NTKArgonEncryptedBundleEnumerator *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)NTKArgonEncryptedBundleEnumerator;
  v5 = -[NTKArgonEncryptedBundleEnumerator init](&v20, sel_init);
  if (v5)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v17;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v17 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v11), "absoluteURL", (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "path");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v13);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }

    v14 = (void *)objc_msgSend(v6, "copy");
    v5 = -[NTKArgonEncryptedBundleEnumerator initWithSourceDirectoryPaths:](v5, "initWithSourceDirectoryPaths:", v14);

  }
  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSEnumerator countByEnumeratingWithState:objects:count:](self->_urlEnumerator, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastURL, 0);
  objc_storeStrong((id *)&self->_urlEnumerator, 0);
  objc_storeStrong((id *)&self->_allObjects, 0);
}

- (NTKArgonEncryptedBundleEnumerator)initWithSearchPathDomains:(unint64_t)a3
{
  NTKArgonEncryptedBundleEnumerator *v4;
  NTKArgonEncryptedBundleEnumerator *v5;
  void *v6;
  NTKArgonEncryptedBundleEnumerator *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)NTKArgonEncryptedBundleEnumerator;
  v4 = -[NTKArgonEncryptedBundleEnumerator init](&v9, sel_init);
  if (!v4)
    return 0;
  v5 = v4;
  NTKFaceSupportArchiveSearchPathsForDomains(a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[NTKArgonEncryptedBundleEnumerator initWithSourceDirectoryPaths:](v5, "initWithSourceDirectoryPaths:", v6);

  return v7;
}

- (id)nextObject
{
  NSURL *v3;
  NSURL *lastURL;

  -[NSEnumerator nextObject](self->_urlEnumerator, "nextObject");
  v3 = (NSURL *)objc_claimAutoreleasedReturnValue();
  lastURL = self->_lastURL;
  self->_lastURL = v3;

  return self->_lastURL;
}

- (NSArray)allObjects
{
  return -[NSEnumerator allObjects](self->_urlEnumerator, "allObjects");
}

@end
