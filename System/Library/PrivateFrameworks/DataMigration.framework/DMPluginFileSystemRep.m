@implementation DMPluginFileSystemRep

+ (id)_pathsContainingPossiblePluginDirectory
{
  return NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
}

+ (id)allReps
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  DMPluginFileSystemRep *v21;
  void *v23;
  void *v24;
  id obj;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "_pathsContainingPossiblePluginDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v39;
    v6 = (void *)MEMORY[0x1E0C9AA60];
    do
    {
      v7 = 0;
      v8 = v6;
      do
      {
        if (*(_QWORD *)v39 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v7), "stringByAppendingPathComponent:", CFSTR("DataClassMigrators"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "arrayByAddingObject:", v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        ++v7;
        v8 = v6;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v4);
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C9AA60];
  }
  v24 = v2;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v6;
  v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
  if (v28)
  {
    v26 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v35 != v26)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = 0;
        objc_msgSend(v13, "contentsOfDirectoryAtPath:error:", v12, &v33);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v33;

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        _DMLogFunc(v27, 7, CFSTR("Found %@ items in migration plugin directory %@. Error: %@"));

        v31 = 0u;
        v32 = 0u;
        v29 = 0u;
        v30 = 0u;
        v16 = v14;
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v42, 16, v23, v12, v15, v24);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v30;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v30 != v19)
                objc_enumerationMutation(v16);
              v21 = -[DMPluginFileSystemRep initWithName:atEnclosingPath:]([DMPluginFileSystemRep alloc], "initWithName:atEnclosingPath:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * j), v12);
              if (v21)
                objc_msgSend(v10, "addObject:", v21);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v42, 16);
          }
          while (v18);
        }

      }
      v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
    }
    while (v28);
  }

  return v10;
}

- (DMPluginFileSystemRep)initWithName:(id)a3 atEnclosingPath:(id)a4
{
  id v6;
  id v7;
  DMPluginFileSystemRep *v8;
  uint64_t v9;
  NSString *name;
  uint64_t v11;
  NSString *path;
  uint64_t v13;
  NSBundle *bundle;
  uint64_t v15;
  NSString *bundleIdentifier;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)DMPluginFileSystemRep;
  v8 = -[DMPluginFileSystemRep init](&v18, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v11 = objc_claimAutoreleasedReturnValue();
    path = v8->_path;
    v8->_path = (NSString *)v11;

    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v8->_path);
    v13 = objc_claimAutoreleasedReturnValue();
    bundle = v8->_bundle;
    v8->_bundle = (NSBundle *)v13;

    -[NSBundle bundleIdentifier](v8->_bundle, "bundleIdentifier");
    v15 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v8->_bundleIdentifier;
    v8->_bundleIdentifier = (NSString *)v15;

  }
  return v8;
}

- (BOOL)isBundleValid
{
  return self->_bundle != 0;
}

- (NSString)name
{
  return self->_name;
}

- (NSString)path
{
  return self->_path;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end
