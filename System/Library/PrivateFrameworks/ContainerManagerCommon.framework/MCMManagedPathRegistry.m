@implementation MCMManagedPathRegistry

- (MCMManagedPathRegistry)initWithDaemonUser:(id)a3 privileged:(BOOL)a4
{
  id v7;
  MCMManagedPathRegistry *v8;
  MCMManagedPathRegistry *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSSet *paths;
  objc_super v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MCMManagedPathRegistry;
  v8 = -[MCMManagedPathRegistry init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_daemonUser, a3);
    v9->_privileged = a4;
    -[MCMManagedPathRegistry _initPathPropertiesWithDaemonUser:](v9, "_initPathPropertiesWithDaemonUser:", v7);
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObjects:", v9->_home, v9->_library, v9->_containermanagerLibrary, v9->_containermanagerPendingUpdates, v9->_containermanagerReplaceOperations, v9->_containermanagerDeleteOperations, v9->_caches, v9->_containermanagerCaches, v9->_containermanagerDeathrow, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9->_containermanagerLibraryIntermediate)
      objc_msgSend(v10, "addObject:");
    if (v9->_containermanagerCachesIntermediate)
      objc_msgSend(v11, "addObject:");
    v12 = objc_msgSend(v11, "copy");
    paths = v9->_paths;
    v9->_paths = (NSSet *)v12;

  }
  return v9;
}

- (id)orderedPathsFromPaths:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  _BYTE v21[128];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v22 + 1) + 8 * v9);
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "addObject:", v10);
        objc_msgSend(v10, "parent");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          do
          {
            objc_msgSend(v10, "parent");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "addObject:", v13);

            objc_msgSend(v10, "parent");
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v14, "parent");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            v10 = v14;
          }
          while (v15);
        }
        else
        {
          v14 = v10;
        }
        v16 = objc_msgSend(v11, "count");
        if (v16)
        {
          v17 = v16 - 1;
          do
          {
            v18 = v14;
            objc_msgSend(v11, "objectAtIndexedSubscript:", v17);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v4, "containsObject:", v14) & 1) == 0)
              objc_msgSend(v4, "addObject:", v14);
            --v17;
          }
          while (v17 != -1);
        }

        ++v9;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v22, v21, 16);
    }
    while (v7);
  }

  v19 = (void *)objc_msgSend(v4, "copy");
  return v19;
}

- (id)managedPathForURL:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  _BYTE v13[128];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MCMManagedPathRegistry paths](self, "paths");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "url");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v13, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)_addPaths:(id)a3
{
  NSSet *v4;
  NSSet *paths;

  -[NSSet setByAddingObjectsFromArray:](self->_paths, "setByAddingObjectsFromArray:", a3);
  v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
  paths = self->_paths;
  self->_paths = v4;

}

- (void)_initPathPropertiesWithDaemonUser:(id)a3
{
  void *v4;
  MCMManagedPath *v5;
  MCMManagedPath *home;
  MCMManagedPath *v7;
  MCMManagedPath *library;
  MCMManagedPath *v9;
  MCMManagedPath *containermanagerLibrary;
  MCMManagedPath *v11;
  MCMManagedPath *v12;
  MCMManagedPath *v13;
  MCMManagedPath *containermanagerPendingUpdates;
  MCMManagedPath *v15;
  MCMManagedPath *containermanagerReplaceOperations;
  MCMManagedPath *v17;
  MCMManagedPath *containermanagerDeleteOperations;
  MCMManagedPath *v19;
  MCMManagedPath *caches;
  MCMManagedPath *v21;
  MCMManagedPath *containermanagerCaches;
  MCMManagedPath *v23;
  MCMManagedPath *v24;
  MCMManagedPath *v25;
  MCMManagedPath *containermanagerDeathrow;
  id v27;

  v27 = a3;
  objc_msgSend(v27, "homeDirectoryURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MCMManagedPath initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:]([MCMManagedPath alloc], "initWithURL:flags:ACLConfig:mode:dpClass:owner:parent:", v4, 0, 0, 493, 0xFFFFFFFFLL, v27, 0);
  home = self->_home;
  self->_home = v5;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_home, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("Library"), 2, 2, 493, 0xFFFFFFFFLL, v27);
  v7 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  library = self->_library;
  self->_library = v7;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_library, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("MobileContainerManager"), 7, 1, 493, 4, v27);
  v9 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerLibrary = self->_containermanagerLibrary;
  self->_containermanagerLibrary = v9;

  objc_storeStrong((id *)&self->_containermanagerLibraryIntermediate, self->_containermanagerLibrary);
  if (-[MCMManagedPathRegistry privileged](self, "privileged"))
  {
    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_containermanagerLibraryIntermediate, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("System"), 7, 1, 493, 4, v27);
    v11 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    v12 = self->_containermanagerLibrary;
    self->_containermanagerLibrary = v11;

  }
  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_containermanagerLibrary, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("PendingUpdates"), 7, 1, 493, 4, v27);
  v13 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerPendingUpdates = self->_containermanagerPendingUpdates;
  self->_containermanagerPendingUpdates = v13;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_containermanagerLibrary, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("Replace"), 7, 1, 493, 4, v27);
  v15 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerReplaceOperations = self->_containermanagerReplaceOperations;
  self->_containermanagerReplaceOperations = v15;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_containermanagerLibraryIntermediate, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("Delete"), 7, 1, 493, 4, v27);
  v17 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerDeleteOperations = self->_containermanagerDeleteOperations;
  self->_containermanagerDeleteOperations = v17;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_library, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("Caches"), 2, 2, 493, 0xFFFFFFFFLL, v27);
  v19 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  caches = self->_caches;
  self->_caches = v19;

  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_caches, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("com.apple.containermanagerd"), 3, 1, 493, 4, v27);
  v21 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerCaches = self->_containermanagerCaches;
  self->_containermanagerCaches = v21;

  if (-[MCMManagedPathRegistry privileged](self, "privileged"))
  {
    objc_storeStrong((id *)&self->_containermanagerCachesIntermediate, self->_containermanagerCaches);
    -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_containermanagerCaches, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("System"), 3, 1, 493, 4, v27);
    v23 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
    v24 = self->_containermanagerCaches;
    self->_containermanagerCaches = v23;

  }
  -[MCMManagedPath managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:](self->_containermanagerCaches, "managedPathByAppendingPathComponent:flags:ACLConfig:mode:dpClass:owner:", CFSTR("Dead"), 7, 1, 493, 4, v27);
  v25 = (MCMManagedPath *)objc_claimAutoreleasedReturnValue();
  containermanagerDeathrow = self->_containermanagerDeathrow;
  self->_containermanagerDeathrow = v25;

}

- (NSSet)paths
{
  return self->_paths;
}

- (MCMPOSIXUser)daemonUser
{
  return self->_daemonUser;
}

- (MCMManagedPath)home
{
  return self->_home;
}

- (MCMManagedPath)library
{
  return self->_library;
}

- (MCMManagedPath)containermanagerLibrary
{
  return self->_containermanagerLibrary;
}

- (MCMManagedPath)containermanagerLibraryIntermediate
{
  return self->_containermanagerLibraryIntermediate;
}

- (MCMManagedPath)containermanagerPendingUpdates
{
  return self->_containermanagerPendingUpdates;
}

- (MCMManagedPath)containermanagerReplaceOperations
{
  return self->_containermanagerReplaceOperations;
}

- (MCMManagedPath)containermanagerDeleteOperations
{
  return self->_containermanagerDeleteOperations;
}

- (MCMManagedPath)caches
{
  return self->_caches;
}

- (MCMManagedPath)containermanagerCaches
{
  return self->_containermanagerCaches;
}

- (MCMManagedPath)containermanagerCachesIntermediate
{
  return self->_containermanagerCachesIntermediate;
}

- (MCMManagedPath)containermanagerDeathrow
{
  return self->_containermanagerDeathrow;
}

- (BOOL)privileged
{
  return self->_privileged;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_containermanagerDeathrow, 0);
  objc_storeStrong((id *)&self->_containermanagerCachesIntermediate, 0);
  objc_storeStrong((id *)&self->_containermanagerCaches, 0);
  objc_storeStrong((id *)&self->_caches, 0);
  objc_storeStrong((id *)&self->_containermanagerDeleteOperations, 0);
  objc_storeStrong((id *)&self->_containermanagerReplaceOperations, 0);
  objc_storeStrong((id *)&self->_containermanagerPendingUpdates, 0);
  objc_storeStrong((id *)&self->_containermanagerLibraryIntermediate, 0);
  objc_storeStrong((id *)&self->_containermanagerLibrary, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_daemonUser, 0);
  objc_storeStrong((id *)&self->_paths, 0);
}

@end
