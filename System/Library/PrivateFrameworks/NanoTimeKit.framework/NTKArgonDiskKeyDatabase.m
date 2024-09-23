@implementation NTKArgonDiskKeyDatabase

- (NTKArgonDiskKeyDatabase)initWithSearchPathDomains:(unint64_t)a3
{
  NTKArgonDiskKeyDatabase *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSArray *searchPaths;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  objc_super v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v20.receiver = self;
  v20.super_class = (Class)NTKArgonDiskKeyDatabase;
  v4 = -[NTKArgonDiskKeyDatabase init](&v20, sel_init);
  if (v4)
  {
    NTKFaceSupportUnencryptedBundleSearchPathsForDomains(a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v7 = v5;
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
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v11), (_QWORD)v16);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "addObject:", v12);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
      }
      while (v9);
    }

    v13 = objc_msgSend(v7, "copy");
    searchPaths = v4->_searchPaths;
    v4->_searchPaths = (NSArray *)v13;

    v4->_lock._os_unfair_lock_opaque = 0;
  }
  return v4;
}

- (id)keyDescriptorEnumerator
{
  os_unfair_lock_s *p_lock;
  NSSet *knownKeyDescriptors;
  void *v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  knownKeyDescriptors = self->_knownKeyDescriptors;
  if (!knownKeyDescriptors)
  {
    -[NTKArgonDiskKeyDatabase _locked_rebuildCache](self, "_locked_rebuildCache");
    knownKeyDescriptors = self->_knownKeyDescriptors;
  }
  -[NSSet objectEnumerator](knownKeyDescriptors, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (id)keyDescriptorForFileName:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSSet *knownKeyDescriptors;
  NSSet *v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  int v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  knownKeyDescriptors = self->_knownKeyDescriptors;
  if (!knownKeyDescriptors)
  {
    -[NTKArgonDiskKeyDatabase _locked_rebuildCache](self, "_locked_rebuildCache");
    knownKeyDescriptors = self->_knownKeyDescriptors;
  }
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = knownKeyDescriptors;
  v8 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v11, "fileName", (_QWORD)v15);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "isEqualToString:", v4);

        if (v13)
        {
          v8 = v11;
          goto LABEL_13;
        }
      }
      v8 = (id)-[NSSet countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_13:

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)clearCaches
{
  os_unfair_lock_s *p_lock;
  NSSet *knownKeyDescriptors;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  knownKeyDescriptors = self->_knownKeyDescriptors;
  self->_knownKeyDescriptors = 0;

  os_unfair_lock_unlock(p_lock);
}

- (void)_locked_rebuildCache
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  void *v22;
  void *v23;
  NTKArgonKeyDescriptor *v24;
  uint64_t v25;
  NSSet *knownKeyDescriptors;
  NTKArgonDiskKeyDatabase *v27;
  NSArray *obj;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NTKArgonKeyDescriptor *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  os_unfair_lock_assert_owner(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v27 = self;
  obj = self->_searchPaths;
  v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
  if (v30)
  {
    v29 = *(_QWORD *)v40;
    v3 = 0x1E0C99000uLL;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v40 != v29)
          objc_enumerationMutation(obj);
        v32 = v4;
        objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * v4), v27);
        v5 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (void *)v5;
        objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, 0, 2, 0);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v8 = v7;
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
        if (v9)
        {
          v10 = v9;
          v11 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v36 != v11)
                objc_enumerationMutation(v8);
              v13 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
              objc_msgSend(v13, "lastPathComponent");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "pathExtension");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("bundle"));

              if (v16)
              {
                v17 = *(void **)(v3 + 3456);
                objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("Info.plist"));
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v17, "dictionaryWithContentsOfURL:", v18);
                v19 = (void *)objc_claimAutoreleasedReturnValue();

                if (v19)
                {
                  objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Argon"));
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v20)
                  {
                    objc_opt_class();
                    if ((objc_opt_isKindOfClass() & 1) != 0)
                    {
                      v21 = v3;
                      objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("FileName"));
                      v22 = (void *)objc_claimAutoreleasedReturnValue();
                      if (v22)
                      {
                        objc_opt_class();
                        if ((objc_opt_isKindOfClass() & 1) != 0)
                        {
                          objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("Key"));
                          v23 = (void *)objc_claimAutoreleasedReturnValue();
                          if (v23)
                          {
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              v24 = -[NTKArgonKeyDescriptor initWithKey:fileName:]([NTKArgonKeyDescriptor alloc], "initWithKey:fileName:", v23, v22);
                              if (v24)
                              {
                                v34 = v24;
                                objc_msgSend(v33, "addObject:", v24);
                                v24 = v34;
                              }

                            }
                          }

                        }
                      }

                      v3 = v21;
                    }
                  }

                }
              }
            }
            v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v35, v43, 16);
          }
          while (v10);
        }

        v4 = v32 + 1;
      }
      while (v32 + 1 != v30);
      v30 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v39, v44, 16);
    }
    while (v30);
  }

  v25 = objc_msgSend(v33, "copy");
  knownKeyDescriptors = v27->_knownKeyDescriptors;
  v27->_knownKeyDescriptors = (NSSet *)v25;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownKeyDescriptors, 0);
  objc_storeStrong((id *)&self->_searchPaths, 0);
}

@end
