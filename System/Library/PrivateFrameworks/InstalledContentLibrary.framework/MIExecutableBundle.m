@implementation MIExecutableBundle

- (void)dealloc
{
  __CFBundle *cfBundle;
  objc_super v4;

  cfBundle = self->_cfBundle;
  if (cfBundle)
  {
    CFRelease(cfBundle);
    self->_cfBundle = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)MIExecutableBundle;
  -[MIExecutableBundle dealloc](&v4, sel_dealloc);
}

- (BOOL)_validateWithError:(id *)a3
{
  unsigned __int8 v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  objc_super v23;
  id v24;

  v23.receiver = self;
  v23.super_class = (Class)MIExecutableBundle;
  v24 = 0;
  v5 = -[MIBundle _validateWithError:](&v23, sel__validateWithError_, &v24);
  v6 = v24;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    -[MIBundle infoPlistSubset](self, "infoPlistSubset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE70]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v10 = v9;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v10;
    else
      v11 = 0;

    if (!v11)
      goto LABEL_11;
    if (!objc_msgSend(v11, "length"))
      goto LABEL_11;
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle bundleURL](self, "bundleURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "URLByAppendingPathComponent:isDirectory:", v11, 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle bundleURL](self, "bundleURL");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "realPathForURL:ifChildOfURL:", v15, v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v12 = 1;
    }
    else
    {
LABEL_11:
      -[MIBundle bundleURL](self, "bundleURL");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "path");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIExecutableBundle _validateWithError:]", 108, CFSTR("MIInstallerErrorDomain"), 11, 0, &unk_1E6CD3FC8, CFSTR("Bundle at path %@ has missing or invalid CFBundleExecutable in its Info.plist"), v20, (uint64_t)v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (a3)
      {
        v7 = objc_retainAutorelease(v21);
        v12 = 0;
        *a3 = v7;
      }
      else
      {
        v12 = 0;
        v7 = v21;
      }
    }

  }
  else if (a3)
  {
    v7 = objc_retainAutorelease(v6);
    v12 = 0;
    *a3 = v7;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (id)initForTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIExecutableBundle;
  return -[MIBundle initForTesting](&v3, sel_initForTesting);
}

- (MIExecutableBundle)initWithBundleInContainer:(id)a3 withExtension:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  MIExecutableBundle *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "containerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13.receiver = self;
  v13.super_class = (Class)MIExecutableBundle;
  v11 = -[MIBundle initWithBundleInDirectory:withExtension:error:](&v13, sel_initWithBundleInDirectory_withExtension_error_, v10, v9, a5);

  if (v11)
    objc_storeWeak((id *)&v11->_bundleContainer, v8);

  return v11;
}

+ (id)bundlesInParentBundle:(id)a3 subDirectory:(id)a4 matchingPredicate:(id)a5 error:(id *)a6
{
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MIExecutableBundle;
  objc_msgSendSuper2(&v7, sel_bundlesInParentBundle_subDirectory_matchingPredicate_error_, a3, a4, a5, a6);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)allowsAppleAppExtensionsNotInExtensionCache
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MIExecutableBundle;
  return -[MIBundle allowsAppleAppExtensionsNotInExtensionCache](&v3, sel_allowsAppleAppExtensionsNotInExtensionCache);
}

- (NSString)executableName
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AE70]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v5 = v4;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;

  }
  else
  {
    v6 = 0;
  }

  return (NSString *)v6;
}

- (NSURL)executableURL
{
  void *v3;
  void *v4;
  void *v5;

  -[MIBundle bundleURL](self, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableName](self, "executableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (NSURL)relativeExecutablePath
{
  void *v3;
  void *v4;
  void *v5;

  -[MIBundle relativePath](self, "relativePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableName](self, "executableName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v5;
}

- (__CFBundle)cfBundle
{
  __CFBundle *result;
  void *v4;

  result = self->_cfBundle;
  if (!result)
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    self->_cfBundle = (__CFBundle *)_CFBundleCreateUnique();

    return self->_cfBundle;
  }
  return result;
}

- (id)executableImageSlicesWithError:(id *)a3
{
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  NSArray **p_executableImageSlices;
  NSArray *executableImageSlices;
  id v12;
  const char *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  if (-[MIBundle isPlaceholder](self, "isPlaceholder"))
  {
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle executableImageSlicesWithError:]", 198, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("This bundle is a placeholder and so does not have an executable, so executable image slices are not available."), v5, v17);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v7 = 0;
    goto LABEL_3;
  }
  p_executableImageSlices = &self->_executableImageSlices;
  executableImageSlices = self->_executableImageSlices;
  if (executableImageSlices)
    return executableImageSlices;
  -[MIExecutableBundle executableURL](self, "executableURL");
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v13 = (const char *)objc_msgSend(v12, "fileSystemRepresentation");

  v18 = 0;
  MIMachOFileImageSlices(v13, &v18);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = v18;
  if (!v7)
    goto LABEL_3;
  if (!objc_msgSend(v7, "count"))
  {
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle executableImageSlicesWithError:]", 213, CFSTR("MIInstallerErrorDomain"), 73, 0, 0, CFSTR("Executable at %s contained no image slices"), v14, (uint64_t)v13);
    v16 = objc_claimAutoreleasedReturnValue();

    v6 = (id)v16;
LABEL_3:
    if (a3)
    {
      v6 = objc_retainAutorelease(v6);
      v8 = 0;
      *a3 = v6;
    }
    else
    {
      v8 = 0;
    }
    goto LABEL_11;
  }
  objc_storeStrong((id *)p_executableImageSlices, v7);
  v7 = v7;
  v8 = v7;
LABEL_11:
  v15 = v8;

  return v15;
}

- (NSArray)executableImageSlices
{
  return (NSArray *)-[MIExecutableBundle executableImageSlicesWithError:](self, "executableImageSlicesWithError:", 0);
}

- (id)executablePlatformsWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  id v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v20 = 0;
  -[MIExecutableBundle executableImageSlicesWithError:](self, "executableImageSlicesWithError:", &v20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v20;
  if (!v6)
  {
    v14 = 0;
    if (!a3)
      goto LABEL_14;
    goto LABEL_12;
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * v12), "platform", (_QWORD)v16));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
    }
    while (v10);
  }

  v14 = (void *)objc_msgSend(v5, "copy");
  if (a3)
  {
LABEL_12:
    if (!v14)
      *a3 = objc_retainAutorelease(v7);
  }
LABEL_14:

  return v14;
}

- (BOOL)hasExecutableSliceForPlatform:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  id v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v18;

  v5 = *(_QWORD *)&a3;
  v18 = 0;
  -[MIExecutableBundle executablePlatformsWithError:](self, "executablePlatformsWithError:", &v18);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v18;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v7, "containsObject:", v9);

    if ((v10 & 1) != 0)
    {
      v11 = 1;
      goto LABEL_8;
    }
    MIMachOStringForPlatform(v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle executableURL](self, "executableURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[MIExecutableBundle hasExecutableSliceForPlatform:error:]", 269, CFSTR("MIInstallerErrorDomain"), 198, 0, 0, CFSTR("Executable at %@ did not contain a slice built for platform %@."), v15, (uint64_t)v14);
    v16 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v16;
  }
  if (a4)
  {
    v8 = objc_retainAutorelease(v8);
    v11 = 0;
    *a4 = v8;
  }
  else
  {
    v11 = 0;
  }
LABEL_8:

  return v11;
}

- (id)_nameListForPlatformSet:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        MIMachOStringForPlatform(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v9), "unsignedIntValue", (_QWORD)v14));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)onlyHasExecutableSlicesForPlatform:(unsigned int)a3 error:(id *)a4
{
  uint64_t v5;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  int v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v25;

  v5 = *(_QWORD *)&a3;
  MIMachOStringForPlatform(*(uint64_t *)&a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  -[MIExecutableBundle executablePlatformsWithError:](self, "executablePlatformsWithError:", &v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v25;
  if (!v8)
    goto LABEL_11;
  v10 = objc_msgSend(v8, "count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "containsObject:", v11);

  if (v10 == 1)
  {
    if ((v12 & 1) != 0)
    {
      v13 = 1;
      goto LABEL_14;
    }
    objc_msgSend(v8, "allObjects");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "firstObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    MIMachOStringForPlatform(objc_msgSend(v14, "unsignedIntValue"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle executableURL](self, "executableURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v18 = objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[MIExecutableBundle onlyHasExecutableSlicesForPlatform:error:]", 325, CFSTR("MIInstallerErrorDomain"), 198, 0, 0, CFSTR("Executable at %@ did not contain a slice built for platform %@ (found only platform %@)."), v21, v18);
  }
  else
  {
    if (!v12)
    {
      -[MIExecutableBundle _nameListForPlatformSet:](self, "_nameListForPlatformSet:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIExecutableBundle executableURL](self, "executableURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"-[MIExecutableBundle onlyHasExecutableSlicesForPlatform:error:]", 318, CFSTR("MIInstallerErrorDomain"), 198, 0, 0, CFSTR("Expected to find one or more platform slices for %@ in executable at %@ but only found other platforms: %@"), v23, (uint64_t)v7);
      v22 = objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    v14 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "removeObject:", v15);

    -[MIExecutableBundle _nameListForPlatformSet:](self, "_nameListForPlatformSet:", v14);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle executableURL](self, "executableURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "path");
    v18 = objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[MIExecutableBundle onlyHasExecutableSlicesForPlatform:error:]", 313, CFSTR("MIInstallerErrorDomain"), 198, 0, 0, CFSTR("Expected to find only one or more platform slices for %@ in executable at %@ but also found other platforms: %@"), v19, (uint64_t)v7);
  }
  v22 = objc_claimAutoreleasedReturnValue();

  v9 = (id)v18;
LABEL_10:

  v9 = (id)v22;
LABEL_11:
  if (a4)
  {
    v9 = objc_retainAutorelease(v9);
    v13 = 0;
    *a4 = v9;
  }
  else
  {
    v13 = 0;
  }
LABEL_14:

  return v13;
}

- (BOOL)hasExecutableSliceForCPUType:(int)a3 subtype:(int)a4 error:(id *)a5
{
  uint64_t v7;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  int v18;
  uint64_t v20;
  BOOL v21;
  void *v23;
  void *v24;
  id *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v7 = *(_QWORD *)&a3;
  v32 = *MEMORY[0x1E0C80C00];
  v30 = 0;
  -[MIExecutableBundle executableImageSlicesWithError:](self, "executableImageSlicesWithError:", &v30);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v30;
  v11 = v10;
  if (!v9)
  {
    v21 = 0;
    if (!a5)
      goto LABEL_20;
    goto LABEL_18;
  }
  v24 = v10;
  v25 = a5;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    while (2)
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        v18 = objc_msgSend(v17, "cpuSubtype");
        if (objc_msgSend(v17, "cpuType") == (_DWORD)v7 && (v18 & 0xFFFFFF) == a4)
        {
          v21 = 1;
          v11 = v24;
          goto LABEL_15;
        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      if (v14)
        continue;
      break;
    }
  }

  -[MIBundle bundleURL](self, "bundleURL");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "path");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateError((uint64_t)"-[MIExecutableBundle hasExecutableSliceForCPUType:subtype:error:]", 356, CFSTR("MIInstallerErrorDomain"), 198, 0, 0, CFSTR("Did not find at least one executable slice with CPU type %d and subtype %d in bundle %@"), v20, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0;
LABEL_15:

  a5 = v25;
  if (v25)
  {
LABEL_18:
    if (!v21)
      *a5 = objc_retainAutorelease(v11);
  }
LABEL_20:

  return v21;
}

- (id)lsInstallTypeWithError:(id *)a3
{
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;

  if (self->_lsInstallType)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  -[MIExecutableBundle bundleContainer](self, "bundleContainer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!v6)
  {
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle lsInstallTypeWithError:]", 430, CFSTR("MIInstallerErrorDomain"), 158, 0, 0, CFSTR("Could not get install type because no bundle container relation is set on %@"), v7, (uint64_t)self);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 0;
    goto LABEL_11;
  }
  v19 = 0;
  objc_msgSend(v6, "bundleMetadataWithError:", &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v19;
  if (!v9)
  {
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle lsInstallTypeWithError:]", 436, CFSTR("MIInstallerErrorDomain"), 158, v11, 0, CFSTR("Could not get install type because bundle metadata could not be read from %@"), v10, (uint64_t)v8);
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v15 = (void *)v16;

LABEL_11:
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle bundleURL](self, "bundleURL");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "installTypeFromExtendedAttributeOnBundle:error:", v18, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (v14)
      self->_lsInstallType = objc_msgSend(v14, "unsignedIntegerValue");
    goto LABEL_13;
  }
  v12 = objc_msgSend(v9, "installType");
  if (!v12)
  {
    _CreateError((uint64_t)"-[MIExecutableBundle lsInstallTypeWithError:]", 442, CFSTR("MIInstallerErrorDomain"), 158, 0, 0, CFSTR("Install type not set in bundle metadata for %@"), v13, (uint64_t)v8);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  self->_lsInstallType = v12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v14;
}

- (void)setBundleParentDirectoryURL:(id)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MIExecutableBundle;
  -[MIBundle setBundleParentDirectoryURL:](&v6, sel_setBundleParentDirectoryURL_, a3);
  -[MIBundle bundleURL](self, "bundleURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle wk2AppBundle](self, "wk2AppBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBundleParentDirectoryURL:", v4);

}

- (id)watchKitAppExecutableHashWithError:(id *)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v17;
  void *v18;
  id v19;
  id v20;

  -[MIExecutableBundle watchKitAppExecutableHash](self, "watchKitAppExecutableHash");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = 0;
    v8 = 0;
    goto LABEL_13;
  }
  if (-[MIBundle isPlaceholder](self, "isPlaceholder") || -[MIBundle bundleType](self, "bundleType") != 4)
  {
    -[MIBundle identifier](self, "identifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[MIExecutableBundle watchKitAppExecutableHashWithError:]", 512, CFSTR("MIInstallerErrorDomain"), 85, 0, 0, CFSTR("%@ is not expected to contain watch app executables"), v15, (uint64_t)v14);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v7 = 0;
  }
  else
  {
    v20 = 0;
    -[MIExecutableBundle watchKitAppBundleForWKVersionOrEarlier:error:](self, "watchKitAppBundleForWKVersionOrEarlier:error:", 3, &v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v20;
    if (v9)
    {
      if (!objc_msgSend(v9, "isPlaceholder"))
      {
        objc_msgSend(v9, "executableURL");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        v19 = v10;
        MICreateSHA256Digest(v7, &v19);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v19;

        if (v6)
        {
          -[MIExecutableBundle setWatchKitAppExecutableHash:](self, "setWatchKitAppExecutableHash:", v6);
          goto LABEL_13;
        }
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          -[MIBundle identifier](self, "identifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
        goto LABEL_10;
      }
      -[MIBundle identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"-[MIExecutableBundle watchKitAppExecutableHashWithError:]", 504, CFSTR("MIInstallerErrorDomain"), 139, 0, 0, CFSTR("%@ contains a placeholder watch app, so an executable hash is not possible."), v12, (uint64_t)v11);
      v13 = objc_claimAutoreleasedReturnValue();

      v10 = (id)v13;
    }

    v7 = 0;
    v8 = v10;
  }
LABEL_10:
  if (a3)
  {
    v8 = objc_retainAutorelease(v8);
    v6 = 0;
    *a3 = v8;
  }
  else
  {
    v6 = 0;
  }
LABEL_13:

  return v6;
}

- (id)installationIdentitySettingIfNotSet:(BOOL)a3 withError:(id *)a4
{
  _BOOL8 v5;
  void *v7;
  void *v8;

  v5 = a3;
  -[MIExecutableBundle installationIdentity](self, "installationIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[MIExecutableBundle installationIdentity](self, "installationIdentity");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MIInstallationIdentity installationIdentityForBundle:settingIfNotSet:error:](MIInstallationIdentity, "installationIdentityForBundle:settingIfNotSet:error:", self, v5, a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle setInstallationIdentity:](self, "setInstallationIdentity:", v8);
  }
  return v8;
}

- (BOOL)transferInstallationIdentityFromBundle:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  BOOL v11;
  id v13;
  id v14;

  v14 = 0;
  +[MIInstallationIdentity identityForUpdateOfBundle:error:](MIInstallationIdentity, "identityForUpdateOfBundle:error:", a3, &v14);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v14;
  v8 = v7;
  if (v6)
  {
    v13 = v7;
    v9 = objc_msgSend(v6, "writeToBundle:error:", self, &v13);
    v10 = v13;

    if ((v9 & 1) != 0)
    {
      -[MIExecutableBundle setInstallationIdentity:](self, "setInstallationIdentity:", v6);
      v11 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v10 = v7;
  }
  if (a4)
    *a4 = objc_retainAutorelease(v10);
  -[MIExecutableBundle setInstallationIdentity:](self, "setInstallationIdentity:", 0);
  v11 = 0;
LABEL_8:

  return v11;
}

- (BOOL)makeAndSetNewInstallationIdentityWithError:(id *)a3
{
  id v5;
  int v6;
  id v7;

  v5 = +[MIInstallationIdentity newIdentityForBundle:](MIInstallationIdentity, "newIdentityForBundle:", self);
  v6 = objc_msgSend(v5, "writeToBundle:error:", self, a3);
  if (v6)
    v7 = v5;
  else
    v7 = 0;
  -[MIExecutableBundle setInstallationIdentity:](self, "setInstallationIdentity:", v7);

  return v6;
}

- (unsigned)maxLinkedSDKVersion
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int v5;
  uint64_t v6;
  uint64_t i;
  unsigned int v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[MIExecutableBundle executableImageSlices](self, "executableImageSlices", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "sdkVersion");
        if (v5 <= v8)
          v5 = v8;
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)estimatedMemoryUsageToValidate
{
  void *v2;
  void *v3;
  id v4;
  int v5;
  void *v6;
  unint64_t v7;
  stat v9;

  -[MIBundle bundleURL](self, "bundleURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("_CodeSignature/CodeResources"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  memset(&v9, 0, sizeof(v9));
  v4 = objc_retainAutorelease(v3);
  if (lstat((const char *)objc_msgSend(v4, "fileSystemRepresentation"), &v9))
  {
    v5 = *__error();
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v4, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      strerror(v5);
      MOLogWrite();

    }
    v7 = 0;
  }
  else
  {
    v7 = (unint64_t)((double)v9.st_size * 3.9);
  }

  return v7;
}

- (unint64_t)compatibilityState
{
  id v3;
  unint64_t v4;
  id v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (-[MIBundle isPlaceholder](self, "isPlaceholder")
    || -[MIBundle bundleType](self, "bundleType") == 7
    || -[MIBundle bundleType](self, "bundleType") == 9)
  {
    v3 = 0;
LABEL_5:
    v4 = 0;
    goto LABEL_6;
  }
  -[MIExecutableBundle executableURL](self, "executableURL");
  v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v11 = 0;
  v7 = MIMachOFileMatchesMyArchitecture((const char *)objc_msgSend(v6, "fileSystemRepresentation"), &v11);
  v3 = v11;

  if ((v7 & 1) != 0)
    goto LABEL_5;
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    -[MIBundle identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle bundleURL](self, "bundleURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  v3 = 0;
  v4 = 2;
LABEL_6:

  return v4;
}

+ (BOOL)isGrandfatheredNonContainerizedForSigningInfo:(id)a3
{
  uint64_t v3;
  id v4;
  void *v5;
  void *v6;
  char v7;

  v3 = isGrandfatheredNonContainerizedForSigningInfo__onceToken;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&isGrandfatheredNonContainerizedForSigningInfo__onceToken, &__block_literal_global_6);
  v5 = (void *)isGrandfatheredNonContainerizedForSigningInfo__grandfatheredSigningIDs;
  objc_msgSend(v4, "codeInfoIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "containsObject:", v6);
  return v7;
}

void __68__MIExecutableBundle_isGrandfatheredNonContainerizedForSigningInfo___block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E6CD47D8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isGrandfatheredNonContainerizedForSigningInfo__grandfatheredSigningIDs;
  isGrandfatheredNonContainerizedForSigningInfo__grandfatheredSigningIDs = v0;

}

- (BOOL)_hasNonContainerizingEntitlement:(id)a3 checkSeatbeltProfiles:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  BOOL v14;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "entitlements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MIHasNoContainerEntitlement(v7);

  if (v8)
  {
    if (!objc_msgSend((id)objc_opt_class(), "isGrandfatheredNonContainerizedForSigningInfo:", v6)
      || !gLogHandle
      || *(int *)(gLogHandle + 44) < 7)
    {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  objc_msgSend(v6, "entitlements");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MIHasNoSandboxEntitlement(v9);

  if (v10)
  {
    if (!objc_msgSend((id)objc_opt_class(), "isGrandfatheredNonContainerizedForSigningInfo:", v6)
      || !gLogHandle
      || *(int *)(gLogHandle + 44) < 7)
    {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  if (!v4
    || (objc_msgSend(v6, "entitlements"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = MIHasSeatbeltProfilesEntitlement(v11),
        v11,
        !v12))
  {
    v14 = 0;
    goto LABEL_18;
  }
  if (objc_msgSend((id)objc_opt_class(), "isGrandfatheredNonContainerizedForSigningInfo:", v6)
    && gLogHandle
    && *(int *)(gLogHandle + 44) >= 7)
  {
LABEL_16:
    -[MIBundle identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
LABEL_17:
  v14 = 1;
LABEL_18:

  return v14;
}

- (BOOL)needsDataContainer
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  char v8;
  void *v9;
  void *v11;

  -[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:](self, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 0, 0, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 0;
  switch(-[MIBundle bundleType](self, "bundleType"))
  {
    case 1u:
      if (!v3)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
          goto LABEL_18;
LABEL_19:
        v4 = 1;
        goto LABEL_22;
      }
      objc_msgSend(v3, "entitlements");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = MIHasContainerRequiredEntitlement(v6);

      if (v7)
      {
        if (objc_msgSend((id)objc_opt_class(), "isGrandfatheredNonContainerizedForSigningInfo:", v3)
          && gLogHandle
          && *(int *)(gLogHandle + 44) >= 7)
        {
LABEL_18:
          -[MIBundle identifier](self, "identifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

          goto LABEL_19;
        }
        goto LABEL_19;
      }
      if (-[MIExecutableBundle _hasNonContainerizingEntitlement:checkSeatbeltProfiles:](self, "_hasNonContainerizingEntitlement:checkSeatbeltProfiles:", v3, 1))
      {
LABEL_21:
        v4 = 0;
      }
      else
      {
        v8 = objc_msgSend((id)objc_opt_class(), "isGrandfatheredNonContainerizedForSigningInfo:", v3);
LABEL_12:
        v4 = v8 ^ 1;
      }
LABEL_22:

      return v4;
    case 2u:
    case 5u:
      if (v3)
      {
        objc_msgSend(v3, "entitlements");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v4 = MIHasContainerRequiredEntitlement(v5);

        goto LABEL_22;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        -[MIBundle identifier](self, "identifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();

      }
      goto LABEL_21;
    case 3u:
    case 7u:
    case 8u:
    case 9u:
    case 0xAu:
    case 0xBu:
      goto LABEL_22;
    case 4u:
      v8 = -[MIExecutableBundle _hasNonContainerizingEntitlement:checkSeatbeltProfiles:](self, "_hasNonContainerizingEntitlement:checkSeatbeltProfiles:", v3, 0);
      goto LABEL_12;
    case 6u:
      goto LABEL_19;
    default:
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("Unhandled bundle type %hhu"), -[MIBundle bundleType](self, "bundleType"));
      goto LABEL_21;
  }
}

- (int)dataProtectionClass
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  int v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  int v15;
  void *v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:](self, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 0, 0, 0, 0, 0, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "entitlements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MICopyDataProtectionIfAvailableEntitlement(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    goto LABEL_23;
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  if (!v6)
  {
    objc_opt_class();
    v8 = v5;
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v9 = v8;
    else
      v9 = 0;

    if (v9)
    {
      v19 = 0u;
      v20 = 0u;
      v21 = 0u;
      v22 = 0u;
      v10 = v8;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v20;
        while (2)
        {
          for (i = 0; i != v12; ++i)
          {
            if (*(_QWORD *)v20 != v13)
              objc_enumerationMutation(v10);
            v15 = _ProtectionClassForString(*(void **)(*((_QWORD *)&v19 + 1) + 8 * i));
            if (v15)
            {
              v7 = v15;
              goto LABEL_22;
            }
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
          if (v12)
            continue;
          break;
        }
      }
      v7 = 0;
LABEL_22:

      if (v7)
        goto LABEL_30;
    }
LABEL_23:
    MICopyDataProtectionClassEntitlement(v3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v7 = _ProtectionClassForString(v16);
      if (v7)
      {
LABEL_29:

        goto LABEL_30;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
    }
    v7 = 0;
    goto LABEL_29;
  }
  v7 = _ProtectionClassForString(v5);
  if (!v7)
    goto LABEL_23;
LABEL_30:

  return v7;
}

- (BOOL)updateMCMWithCodeSigningInfoAsAdvanceCopy:(BOOL)a3 withError:(id *)a4
{
  _BOOL4 v5;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  BOOL v17;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;

  v5 = a3;
  if (-[MIExecutableBundle codeSignatureVerificationState](self, "codeSignatureVerificationState") - 1 >= 2)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      MOLogWrite();
    goto LABEL_17;
  }
  if (-[MIBundle bundleType](self, "bundleType") - 1 > 5)
  {
LABEL_17:
    v16 = 0;
    v17 = 1;
    goto LABEL_18;
  }
  v7 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", -[MIExecutableBundle dataContainerContentClass](self, "dataContainerContentClass"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("com.apple.MobileContainerManager.DataContainerClass"));

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MIBundle parentBundleID](self, "parentBundleID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, CFSTR("com.apple.MobileContainerManager.ParentBundleID"));

  }
  if (-[MIBundle isPlaceholder](self, "isPlaceholder"))
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("com.apple.MobileContainerManager.PlaceholderEntitlements"));
  if (v5)
    objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("com.apple.MobileContainerManager.AdvanceCopy"));
  -[MIExecutableBundle codeSigningInfo](self, "codeSigningInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dictionaryRepresentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    -[MIBundle identifier](self, "identifier");
    v23 = v11;
    v24 = v7;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  -[MIBundle identifier](self, "identifier", v22, v23, v24);
  v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v12, "UTF8String");
  v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v14 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  v15 = container_set_code_signing_info_for_identifier();

  if (v15 == 1)
  {

    goto LABEL_17;
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("MIContainerManagerErrorDomain"), v15, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle isPlaceholder](self, "isPlaceholder");
  _CreateAndLogError((uint64_t)"-[MIExecutableBundle updateMCMWithCodeSigningInfoAsAdvanceCopy:withError:]", 955, CFSTR("MIInstallerErrorDomain"), 110, v19, 0, CFSTR("Failed to set code signing info with MCM for %@, isPlaceholder: %c"), v21, (uint64_t)v20);
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v17 = 0;
  if (a4 && v16)
  {
    v16 = objc_retainAutorelease(v16);
    v17 = 0;
    *a4 = v16;
  }
LABEL_18:

  return v17;
}

- (id)_codeSigningInfoFromMCM
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  MICodeSigningInfo *v9;
  MICodeSigningInfo *v10;
  void *v11;

  if (-[MIBundle bundleType](self, "bundleType") - 1 > 5)
    return 0;
  -[MIBundle identifier](self, "identifier");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v3, "UTF8String");
  v4 = (void *)container_copy_code_signing_info_for_identifier();

  if (!v4)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIBundle identifier](self, "identifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v6 = 0;
    goto LABEL_16;
  }
  v5 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  objc_opt_class();
  v6 = v5;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = 0;

  if (!v7)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
LABEL_16:
    v9 = 0;
    goto LABEL_17;
  }
  v9 = -[MICodeSigningInfo initWithDictionaryRepresentation:fromSource:]([MICodeSigningInfo alloc], "initWithDictionaryRepresentation:fromSource:", v6, 3);
LABEL_17:
  v10 = v9;

  return v10;
}

- (id)codeSigningInfoByValidatingResources:(BOOL)a3 performingOnlineAuthorization:(BOOL)a4 ignoringCachedSigningInfo:(BOOL)a5 checkingTrustCacheIfApplicable:(BOOL)a6 skippingProfileIDValidation:(BOOL)a7 error:(id *)a8
{
  _BOOL4 v9;
  _BOOL4 v12;
  _BOOL4 v13;
  unint64_t v15;
  void *v16;
  uint64_t v18;
  void *v19;
  _BOOL4 v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  void *v25;
  void *v26;
  MICodeSigningInfo *v27;
  void *v28;
  void *v29;
  MICodeSigningInfo *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  int v35;
  int v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v41;
  char v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  char v47;
  void *v48;
  void *v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  id v58;
  int v59;
  id v60;
  int *v61;
  void *v62;
  void *v63;
  char v64;
  id v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  id v73;
  char v74;

  v9 = a7;
  v12 = a4;
  v13 = a3;
  v15 = -[MIExecutableBundle codeSignatureVerificationState](self, "codeSignatureVerificationState");
  if (a5 || v15 - 3 < 0xFFFFFFFFFFFFFFFELL)
  {
    if (v15 == 6 || v15 == 3)
    {
      if (a8)
      {
        -[MIExecutableBundle codeSigningInfoError](self, "codeSigningInfoError");
        *a8 = (id)objc_claimAutoreleasedReturnValue();
        return 0;
      }
      return 0;
    }
    if (!a5 && -[MIBundle bundleType](self, "bundleType") == 4)
    {
      -[MIExecutableBundle _codeSigningInfoFromMCM](self, "_codeSigningInfoFromMCM");
      v18 = objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        v19 = (void *)v18;
        -[MIExecutableBundle setCodeSigningInfo:](self, "setCodeSigningInfo:", v18);
        self->_codeSignatureVerificationState = 5;
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          -[MIBundle identifier](self, "identifier");
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
        return v19;
      }
    }
    v20 = -[MIBundle isStaticContent](self, "isStaticContent");
    if (v20 && -[MIBundle bundleType](self, "bundleType") == 7)
    {
      +[MIFileManager defaultManager](MIFileManager, "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIExecutableBundle executableURL](self, "executableURL");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v21, "itemDoesNotExistAtURL:", v22);

      if (v23)
      {
        self->_codeSignatureVerificationState = 4;
        _CreateError((uint64_t)"-[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:]", 1042, CFSTR("MIInstallerErrorDomain"), 71, 0, 0, CFSTR("Built in framework is expectedly missing its bundle executable."), v24, (uint64_t)v67);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (a8)
          *a8 = objc_retainAutorelease(v25);

        return 0;
      }
    }
    if (-[MIBundle isPlaceholder](self, "isPlaceholder"))
    {
      self->_codeSignatureVerificationState = 1;
      v27 = [MICodeSigningInfo alloc];
      -[MIBundle identifier](self, "identifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle bundleURL](self, "bundleURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      MICopyPlaceholderEntitlements(v28);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = -[MICodeSigningInfo initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:signerType:profileType:signingInfoSource:launchWarningData:](v27, "initWithSignerIdentity:signerOrganization:codeInfoIdentifier:teamIdentifier:signatureVersion:entitlements:signerType:profileType:signingInfoSource:launchWarningData:", CFSTR("Unsigned Placeholder"), CFSTR("Unsigned Placeholder"), v16, CFSTR("Unsigned Placeholder"), &unk_1E6CD48B0, v29, 6, 1, 1, 0);
      -[MIExecutableBundle setCodeSigningInfo:](self, "setCodeSigningInfo:", v30);

      goto LABEL_25;
    }
    +[MICodeSigningVerifier codeSigningVerifierForBundle:](MICodeSigningVerifier, "codeSigningVerifierForBundle:", self);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (!v31)
    {
      -[MIBundle bundleURL](self, "bundleURL");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:]", 1065, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to create verifier for executable %@"), v38, (uint64_t)v37);
      v39 = (void *)objc_claimAutoreleasedReturnValue();

      if (a8)
        *a8 = objc_retainAutorelease(v39);

      v19 = 0;
      goto LABEL_78;
    }
    if (v13)
    {
      objc_msgSend(v31, "setValidateResources:", 1);
      if (!v12)
      {
LABEL_31:
        if (!v9)
          goto LABEL_33;
        goto LABEL_32;
      }
    }
    else if (!v12)
    {
      goto LABEL_31;
    }
    objc_msgSend(v32, "setPerformOnlineAuthorization:", 1);
    if (!v9)
    {
LABEL_33:
      -[MIBundle parentBundle](self, "parentBundle");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "codeSigningEnforcementIsDisabled");

      if (v35)
      {
        objc_msgSend(v32, "setAllowAdhocSigning:", 1);
        objc_msgSend(v32, "setVerifyTrustCachePresence:", 0);
        objc_msgSend(v32, "setValidateUsingDetachedSignature:", 0);
        if (-[MIBundle isRemovableSystemApp](self, "isRemovableSystemApp")
          || objc_msgSend(v33, "isRemovableSystemApp"))
        {
          objc_msgSend(v32, "setValidateResources:", 0);
        }
        if (!v20 && !-[MIBundle isRemovableSystemApp](self, "isRemovableSystemApp"))
        {
          v36 = objc_msgSend(v33, "isRemovableSystemApp") ^ 1;
          if (a6)
            goto LABEL_60;
          goto LABEL_59;
        }
        goto LABEL_58;
      }
      if (-[MIBundle isRemovableSystemApp](self, "isRemovableSystemApp"))
      {
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          -[MIBundle identifier](self, "identifier");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
        objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
        v40 = v32;
        v41 = 1;
      }
      else
      {
        if (!objc_msgSend(v33, "isRemovableSystemApp"))
        {
          if (v20)
          {
            if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
            {
              -[MIBundle identifier](self, "identifier");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              MOLogWrite();

            }
            objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
            objc_msgSend(v32, "setVerifyTrustCachePresence:", 1);
            objc_msgSend(v32, "setValidateResources:", 0);
          }
          else
          {
            if (!MGGetBoolAnswer())
            {
              v74 = 0;
              +[MITestManager sharedInstance](MITestManager, "sharedInstance");
              v63 = (void *)objc_claimAutoreleasedReturnValue();
              v73 = 0;
              v64 = objc_msgSend(v63, "isRunningInTestMode:outError:", &v74, &v73);
              v65 = v73;

              if ((v64 & 1) == 0)
              {
                if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
                {
                  v67 = v65;
                  MOLogWrite();
                }
                v74 = 0;

                v65 = 0;
              }
              v36 = v74 != 0;
              if (v74)
              {
                if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
                {
                  -[MIBundle bundleURL](self, "bundleURL", v67);
                  v66 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v66, "path");
                  v67 = (void *)objc_claimAutoreleasedReturnValue();
                  MOLogWrite();

                }
                objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
              }

              if (a6)
              {
LABEL_60:
                v72 = 0;
                v42 = objc_msgSend(v32, "performValidationWithError:", &v72, v67);
                v43 = v72;
                if ((v42 & 1) != 0)
                {
                  objc_msgSend(v32, "signingInfo");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v44, "codeInfoIdentifier");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MIBundle identifier](self, "identifier");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v47 = objc_msgSend(v45, "isEqualToString:", v46);

                  if ((v47 & 1) != 0)
                  {
                    self->_codeSignatureVerificationState = 2;
                    objc_msgSend(v32, "signingInfo");
                    v48 = (void *)objc_claimAutoreleasedReturnValue();
                    -[MIExecutableBundle setCodeSigningInfo:](self, "setCodeSigningInfo:", v48);

                    if (v36)
                    {
                      -[MIExecutableBundle codeSigningInfo](self, "codeSigningInfo");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      v50 = objc_msgSend(v49, "codeSignerType");

                      if (v50 == 1 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 5))
                      {
                        -[MIBundle bundleURL](self, "bundleURL");
                        v51 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v51, "path");
                        v69 = (void *)objc_claimAutoreleasedReturnValue();
                        MOLogWrite();

                      }
                    }
                    -[MIExecutableBundle codeSigningInfo](self, "codeSigningInfo", v69);
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    goto LABEL_77;
                  }
                  v71 = v33;
                  self->_codeSignatureVerificationState = 6;
                  objc_msgSend(v32, "signingInfo");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v52, "codeInfoIdentifier");
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MIBundle identifier](self, "identifier");
                  v54 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MIBundle bundleURL](self, "bundleURL");
                  v55 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v55, "path");
                  v70 = (void *)objc_claimAutoreleasedReturnValue();
                  _CreateAndLogError((uint64_t)"-[MIExecutableBundle codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:]", 1166, CFSTR("MIInstallerErrorDomain"), 77, 0, &unk_1E6CD3FF0, CFSTR("Code signing identifier (%@) does not match bundle identifier (%@) for %@"), v56, (uint64_t)v53);
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  -[MIExecutableBundle setCodeSigningInfoError:](self, "setCodeSigningInfoError:", v57);

                  if (a8)
                  {
                    -[MIExecutableBundle codeSigningInfoError](self, "codeSigningInfoError");
                    *a8 = (id)objc_claimAutoreleasedReturnValue();
                  }
                  -[MIExecutableBundle executableURL](self, "executableURL");
                  v58 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                  v59 = lchmod((const char *)objc_msgSend(v58, "fileSystemRepresentation"), 0x1A4u);

                  v33 = v71;
                  if (v59 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
                  {
                    -[MIExecutableBundle executableURL](self, "executableURL");
                    v60 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
                    objc_msgSend(v60, "fileSystemRepresentation");
                    v61 = __error();
                    strerror(*v61);
                    MOLogWrite();

                  }
                }
                else
                {
                  self->_codeSignatureVerificationState = 3;
                  -[MIExecutableBundle setCodeSigningInfoError:](self, "setCodeSigningInfoError:", v43);
                  if (a8)
                  {
                    v19 = 0;
                    *a8 = objc_retainAutorelease(v43);
LABEL_77:

LABEL_78:
                    return v19;
                  }
                }
                v19 = 0;
                goto LABEL_77;
              }
LABEL_59:
              objc_msgSend(v32, "setVerifyTrustCachePresence:", 0, v67);
              goto LABEL_60;
            }
            if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
            {
              -[MIBundle bundleURL](self, "bundleURL");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "path");
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              MOLogWrite();

            }
            objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
          }
LABEL_58:
          v36 = 0;
          if (a6)
            goto LABEL_60;
          goto LABEL_59;
        }
        if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
        {
          -[MIBundle identifier](self, "identifier");
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
        objc_msgSend(v32, "setAllowAdhocSigning:", 1, v67);
        objc_msgSend(v32, "setValidateResources:", 0);
        v40 = v32;
        v41 = 0;
      }
      objc_msgSend(v40, "setValidateUsingDetachedSignature:", v41);
      objc_msgSend(v32, "setVerifyTrustCachePresence:", 1);
      goto LABEL_58;
    }
LABEL_32:
    objc_msgSend(v32, "setSkipProfileIDValidation:", 1);
    goto LABEL_33;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) < 7)
    goto LABEL_26;
  -[MIBundle identifier](self, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = v16;
  MOLogWrite();
LABEL_25:

LABEL_26:
  -[MIExecutableBundle codeSigningInfo](self, "codeSigningInfo", v67);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  return v19;
}

- (int)_installEmbeddedProvisioningProfileAtURL:(id)a3 withProgress:(id)a4
{
  id v5;
  void (**v6)(id, const __CFString *, _QWORD);
  id v7;
  int v8;
  int v9;
  stat v11;

  v5 = a3;
  v6 = (void (**)(id, const __CFString *, _QWORD))a4;
  memset(&v11, 0, sizeof(v11));
  v7 = objc_retainAutorelease(v5);
  if (lstat((const char *)objc_msgSend(v7, "fileSystemRepresentation"), &v11))
  {
    v8 = *__error();
    if (v8 != 2 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      objc_msgSend(objc_retainAutorelease(v7), "fileSystemRepresentation");
      strerror(v8);
      MOLogWrite();
    }
    v9 = 0;
  }
  else
  {
    if (v6)
      v6[2](v6, CFSTR("InstallingEmbeddedProfile"), 0);
    v9 = MIInstallProfileAtURL(v7);
  }

  return v9;
}

- (int)installEmbeddedProvisioningProfileWithProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIBundle bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("embedded.mobileprovision"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = -[MIExecutableBundle _installEmbeddedProvisioningProfileAtURL:withProgress:](self, "_installEmbeddedProvisioningProfileAtURL:withProgress:", v6, v4);
  return (int)self;
}

- (int)installMacStyleEmbeddedProvisioningProfileWithProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MIBundle bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("embedded.provisionprofile"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(self) = -[MIExecutableBundle _installEmbeddedProvisioningProfileAtURL:withProgress:](self, "_installEmbeddedProvisioningProfileAtURL:withProgress:", v6, v4);
  return (int)self;
}

- (BOOL)_hasNoConflictWithSystemAppsForSigningInfo:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char hasNoConflictWithSystemAppBundleIDs;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  int v22;
  void *v23;
  void *v24;
  void *v26;

  v6 = a3;
  -[MIBundle bundleTypeDescription](self, "bundleTypeDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[MIBundle bundleType](self, "bundleType") == 1)
  {
    objc_msgSend(v6, "entitlements");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MIHasSystemApplicationEntitlement(v8);

    if (v9)
    {
      if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      {
        -[MIBundle identifier](self, "identifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();

      }
      +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance", v26);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "systemAppPlaceholderXPCServiceBundleIDs");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (_hasNoConflictWithSystemAppBundleIDs(v11, v12, CFSTR("System App XPC Service"), v7, a4))
      {
        +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "systemAppPlaceholderAppExtensionBundleIDs");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        -[MIBundle identifier](self, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        hasNoConflictWithSystemAppBundleIDs = _hasNoConflictWithSystemAppBundleIDs(v14, v15, CFSTR("System App Extension"), v7, a4);

        goto LABEL_19;
      }
      hasNoConflictWithSystemAppBundleIDs = 0;
LABEL_22:

LABEL_23:
      goto LABEL_24;
    }
  }
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "systemAppPlaceholderBundleIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundle identifier](self, "identifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = _hasNoConflictWithSystemAppBundleIDs(v18, v19, CFSTR("System App"), v7, a4);

  if (v20)
  {
    -[MIBundle parentBundle](self, "parentBundle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v10, "codeSigningInfoByValidatingResources:performingOnlineAuthorization:ignoringCachedSigningInfo:checkingTrustCacheIfApplicable:skippingProfileIDValidation:error:", 0, 0, 0, 0, 0, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "entitlements");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = MIHasSystemApplicationEntitlement(v21);

      if (v22)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) < 7)
        {
          hasNoConflictWithSystemAppBundleIDs = 1;
          goto LABEL_23;
        }
        -[MIBundle identifier](self, "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        MOLogWrite();
        hasNoConflictWithSystemAppBundleIDs = 1;
        goto LABEL_22;
      }

    }
    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "systemAppPlaceholderXPCServiceBundleIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!_hasNoConflictWithSystemAppBundleIDs(v12, v13, CFSTR("System App XPC Service"), v7, a4))
    {
      hasNoConflictWithSystemAppBundleIDs = 0;
      goto LABEL_21;
    }
    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "systemAppPlaceholderAppExtensionBundleIDs");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundle identifier](self, "identifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    hasNoConflictWithSystemAppBundleIDs = _hasNoConflictWithSystemAppBundleIDs(v23, v24, CFSTR("System App Extension"), v7, a4);

LABEL_19:
LABEL_21:

    goto LABEL_22;
  }
  hasNoConflictWithSystemAppBundleIDs = 0;
LABEL_24:

  return hasNoConflictWithSystemAppBundleIDs;
}

- (BOOL)hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:(id)a3 forPersona:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  BOOL v13;
  id v14;
  void *v15;
  int v16;
  id v17;
  _BOOL4 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  id v24;
  void *v25;
  int v26;
  _BOOL4 v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  void *v32;
  int hasNoConflictWithNonContainerizedSystemApp;
  uint64_t v34;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;

  v8 = a3;
  v9 = a4;
  -[MIBundle bundleTypeDescription](self, "bundleTypeDescription");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[MIBundle bundleType](self, "bundleType");
  if (v11 > 0xB)
    goto LABEL_21;
  v13 = 1;
  if (((1 << v11) & 0x1E) != 0)
  {
    -[MIBundle identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = 0;
    v16 = _checkIdentifierForConflict(v15, (uint64_t)v9, 4, CFSTR("App Extension"), v10, &v38);
    v17 = v38;

    if (v16)
    {
      v37 = v17;
      v18 = -[MIExecutableBundle _hasNoConflictWithSystemAppsForSigningInfo:error:](self, "_hasNoConflictWithSystemAppsForSigningInfo:error:", v8, &v37);
      v14 = v37;

      if (v18)
      {
        objc_msgSend(v8, "codeInfoIdentifier");
        v19 = objc_claimAutoreleasedReturnValue();
        if (v19)
        {
          v20 = (void *)v19;
          objc_msgSend(v8, "codeInfoIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v36 = v14;
          v22 = _checkIdentifierForConflict(v21, (uint64_t)v9, 4, CFSTR("App Extension"), v10, &v36);
          v23 = v36;
          goto LABEL_9;
        }
LABEL_24:
        v13 = 1;
        goto LABEL_27;
      }
LABEL_22:
      if (!a5)
        goto LABEL_26;
      goto LABEL_23;
    }
LABEL_19:
    v14 = v17;
    if (!a5)
      goto LABEL_26;
    goto LABEL_23;
  }
  if (((1 << v11) & 0xB80) == 0)
  {
    if (v11 == 6)
    {
      -[MIBundle identifier](self, "identifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v43 = 0;
      v26 = _checkIdentifierForConflict(v25, (uint64_t)v9, 2, CFSTR("App"), v10, &v43);
      v14 = v43;

      if (!v26)
        goto LABEL_22;
      v42 = v14;
      v27 = -[MIExecutableBundle _hasNoConflictWithSystemAppsForSigningInfo:error:](self, "_hasNoConflictWithSystemAppsForSigningInfo:error:", v8, &v42);
      v17 = v42;

      if (v27)
      {
        objc_msgSend(v8, "codeInfoIdentifier");
        v28 = objc_claimAutoreleasedReturnValue();
        if (!v28)
          goto LABEL_30;
        v29 = (void *)v28;
        objc_msgSend(v8, "codeInfoIdentifier");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v41 = v17;
        v31 = _checkIdentifierForConflict(v30, (uint64_t)v9, 2, CFSTR("App"), v10, &v41);
        v14 = v41;

        v17 = v14;
        if (v31)
        {
LABEL_30:
          -[MIBundle identifier](self, "identifier");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v17;
          hasNoConflictWithNonContainerizedSystemApp = _hasNoConflictWithNonContainerizedSystemApp(v32, v10, &v40);
          v14 = v40;

          if (hasNoConflictWithNonContainerizedSystemApp)
          {
            objc_msgSend(v8, "codeInfoIdentifier");
            v34 = objc_claimAutoreleasedReturnValue();
            if (v34)
            {
              v20 = (void *)v34;
              objc_msgSend(v8, "codeInfoIdentifier");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = v14;
              v22 = _hasNoConflictWithNonContainerizedSystemApp(v21, v10, &v39);
              v23 = v39;
LABEL_9:
              v24 = v23;

              if ((v22 & 1) != 0)
              {
                v13 = 1;
                v14 = v24;
                goto LABEL_27;
              }
              v14 = v24;
              if (!a5)
              {
LABEL_26:
                v13 = 0;
                goto LABEL_27;
              }
LABEL_23:
              v14 = objc_retainAutorelease(v14);
              v13 = 0;
              *a5 = v14;
              goto LABEL_27;
            }
            goto LABEL_24;
          }
        }
        goto LABEL_22;
      }
      goto LABEL_19;
    }
LABEL_21:
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle hasNoConflictsWithOtherInstalledEntitiesForSigningInfo:forPersona:error:]", 1467, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Don't know how to check bundle %@ for conflicts."), v12, (uint64_t)self);
    v14 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  v14 = 0;
LABEL_27:

  return v13;
}

- (unint64_t)dataContainerContentClass
{
  unsigned int v2;

  v2 = -[MIBundle bundleType](self, "bundleType");
  if (v2 > 0xB)
    return 0;
  else
    return qword_1B77958D8[(char)v2];
}

- (Class)dataContainerClass
{
  return (Class)objc_opt_class();
}

- (id)dataContainerForPersona:(id)a3 error:(id *)a4
{
  return -[MIExecutableBundle _dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:](self, "_dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:", 0, a3, 0, 0, 0, a4);
}

- (id)dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 created:(BOOL *)a6 error:(id *)a7
{
  return -[MIExecutableBundle _dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:](self, "_dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:", a3, a4, a5, 1, a6, a7);
}

- (id)_dataContainerCreatingIfNeeded:(BOOL)a3 forPersona:(id)a4 makeLive:(BOOL)a5 checkIfNeeded:(BOOL)a6 created:(BOOL *)a7 error:(id *)a8
{
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL8 v12;
  id v14;
  void *v15;
  id v16;
  void *v17;
  char v18;
  id v19;
  id v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  char v26;
  id v27;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;

  v10 = a6;
  v11 = a5;
  v12 = a3;
  v14 = a4;
  if (v10 && !-[MIExecutableBundle needsDataContainer](self, "needsDataContainer"))
  {
    -[MIBundle bundleURL](self, "bundleURL");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle _dataContainerCreatingIfNeeded:forPersona:makeLive:checkIfNeeded:created:error:]", 1534, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Asked for data container for %@ but none is needed."), v24, (uint64_t)v23);
    v19 = (id)objc_claimAutoreleasedReturnValue();

    v15 = 0;
    if (a8)
      goto LABEL_29;
LABEL_23:
    v20 = 0;
    goto LABEL_30;
  }
  v34 = 0;
  -[objc_class dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:](-[MIExecutableBundle dataContainerClass](self, "dataContainerClass"), "dataContainerForExecutableBundle:forPersona:createIfNeeded:temporary:created:error:", self, v14, v12, 0, a7, &v34);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v34;
  v17 = v16;
  if (!v15)
  {
    if (!v12)
    {
      objc_msgSend(v16, "domain");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v21, "isEqualToString:", CFSTR("MIContainerManagerErrorDomain")) & 1) != 0)
      {
        v22 = objc_msgSend(v17, "code");

        if (v22 == 21)
          goto LABEL_28;
      }
      else
      {

      }
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIBundle identifier](self, "identifier");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
LABEL_28:
    v15 = 0;
    v19 = v17;
    if (a8)
      goto LABEL_29;
    goto LABEL_23;
  }
  if (!v12 || !v11)
    goto LABEL_8;
  v33 = v16;
  v18 = objc_msgSend(v15, "makeContainerLiveWithError:", &v33);
  v19 = v33;

  if ((v18 & 1) == 0)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIBundle identifier](self, "identifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = v19;
      MOLogWrite();

    }
    -[MIBundle identifier](self, "identifier", v29, v31);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = 0;
    v26 = objc_msgSend(v15, "removeUnderlyingContainerWaitingForDeletion:error:", 0, &v32);
    v27 = v32;
    if ((v26 & 1) == 0 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      MOLogWrite();

    if (!a8)
      goto LABEL_23;
LABEL_29:
    v19 = objc_retainAutorelease(v19);
    v20 = 0;
    *a8 = v19;
    goto LABEL_30;
  }
  v17 = v19;
LABEL_8:
  v20 = v15;
  v15 = v20;
  v19 = v17;
LABEL_30:

  return v20;
}

- (BOOL)executableExistsWithError:(id *)a3
{
  id v5;
  void *v6;
  void *v7;
  char v8;
  BOOL v9;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;

  if (-[MIBundle isPlaceholder](self, "isPlaceholder"))
  {
    v5 = 0;
LABEL_4:
    v9 = 1;
    goto LABEL_5;
  }
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableURL](self, "executableURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = objc_msgSend(v6, "itemExistsAtURL:error:", v7, &v15);
  v5 = v15;

  if ((v8 & 1) != 0)
    goto LABEL_4;
  -[MIBundle relativePath](self, "relativePath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle relativeExecutablePath](self, "relativeExecutablePath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError((uint64_t)"-[MIExecutableBundle executableExistsWithError:]", 1580, CFSTR("MIInstallerErrorDomain"), 71, v5, 0, CFSTR("%@ is missing its bundle executable. Please check your build settings to make sure that a bundle executable is produced at the path \"%@\"."), v12, (uint64_t)v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a3)
  {
    v5 = objc_retainAutorelease(v13);
    v9 = 0;
    *a3 = v5;
  }
  else
  {
    v9 = 0;
    v5 = v13;
  }
LABEL_5:

  return v9;
}

- (BOOL)makeExecutableWithError:(id *)a3
{
  id v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  int *v10;
  uint64_t v11;
  id v12;
  BOOL v13;

  if (-[MIBundle isLaunchProhibited](self, "isLaunchProhibited")
    || -[MIBundle isPlaceholder](self, "isPlaceholder")
    || (-[MIExecutableBundle executableURL](self, "executableURL"),
        v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue()),
        v6 = lchmod((const char *)objc_msgSend(v5, "fileSystemRepresentation"), 0x1EDu),
        v5,
        !v6))
  {
    v12 = 0;
    v13 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], *__error(), 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle executableURL](self, "executableURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "path");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = __error();
    strerror(*v10);
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle makeExecutableWithError:]", 1618, CFSTR("MIInstallerErrorDomain"), 4, v7, &unk_1E6CD4018, CFSTR("Failed to chmod %@ : %s"), v11, (uint64_t)v9);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v12 = objc_retainAutorelease(v12);
      v13 = 0;
      *a3 = v12;
    }
    else
    {
      v13 = 0;
    }
  }

  return v13;
}

- (BOOL)setLaunchWarningData:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  char v16;
  id v17;
  int v18;
  BOOL v19;
  uint64_t v20;
  id *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  id v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  -[MIBundle thisBundleAndAllContainedBundlesWithError:](self, "thisBundleAndAllContainedBundlesWithError:", &v31);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v31;
  if (v7)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v23 = v7;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v10)
    {
      v11 = v10;
      v22 = a4;
      v12 = *(_QWORD *)v28;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v14, "mayHaveExecutableProgram"))
          {
            objc_msgSend(v14, "executableURL");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v6)
            {
              v26 = v8;
              v16 = objc_msgSend(v24, "setData:forExtendedAttributeNamed:onURL:error:", v6, CFSTR("com.apple.mis.warning"), v15, &v26);
              v17 = v26;

              if ((v16 & 1) == 0)
                goto LABEL_18;
            }
            else
            {
              v25 = v8;
              v18 = objc_msgSend(v24, "removeExtendedAttributeNamed:fromURL:error:", CFSTR("com.apple.mis.warning"), v15, &v25);
              v17 = v25;

              if (!v18)
              {
LABEL_18:
                v8 = v15;
                a4 = v22;
                v7 = v23;
                goto LABEL_19;
              }
            }

            v8 = v17;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
        if (v11)
          continue;
        break;
      }
    }

    v19 = 1;
    v17 = v8;
    v7 = v23;
  }
  else
  {
    -[MIBundle identifier](self, "identifier");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle setLaunchWarningData:withError:]", 1640, CFSTR("MIInstallerErrorDomain"), 4, v8, 0, CFSTR("Failed to get all bundles within app %@"), v20, (uint64_t)v9);
    v17 = (id)objc_claimAutoreleasedReturnValue();
LABEL_19:

    if (a4)
    {
      v17 = objc_retainAutorelease(v17);
      v19 = 0;
      *a4 = v17;
    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (BOOL)validatePluginKitMetadataWithError:(id *)a3
{
  unsigned int v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  objc_super v18;
  id v19;

  v18.receiver = self;
  v18.super_class = (Class)MIExecutableBundle;
  v19 = 0;
  v5 = -[MIBundle validatePluginKitMetadataWithError:](&v18, sel_validatePluginKitMetadataWithError_, &v19);
  v6 = v19;
  if (v5)
  {
    -[MIExecutableBundle watchKitV2AppBundleWithError:](self, "watchKitV2AppBundleWithError:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
    {
      v11 = 1;
      goto LABEL_16;
    }
    objc_msgSend(v7, "siriIntents");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v11 = 1;
LABEL_15:

LABEL_16:
      if (!a3)
        goto LABEL_19;
      goto LABEL_17;
    }
    -[MIBundle siriIntents](self, "siriIntents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      if ((objc_msgSend(v9, "isSubsetOfSet:", v10) & 1) != 0)
      {
        v11 = 1;
LABEL_14:

        goto LABEL_15;
      }
      objc_msgSend(v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIExecutableBundle validatePluginKitMetadataWithError:]", 1696, CFSTR("MIInstallerErrorDomain"), 126, 0, &unk_1E6CD4068, CFSTR("Siri Intents in the WatchKit app %@ are not a subset of the Siri Intents in the companion app %@"), v15, (uint64_t)v12);
    }
    else
    {
      objc_msgSend(v8, "identifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIExecutableBundle validatePluginKitMetadataWithError:]", 1693, CFSTR("MIInstallerErrorDomain"), 126, 0, &unk_1E6CD4040, CFSTR("Siri Intents app extension is present in the WatchKit app %@ but there are no Siri Intents in the companion app %@"), v14, (uint64_t)v12);
    }
    v16 = objc_claimAutoreleasedReturnValue();

    v11 = 0;
    v6 = (id)v16;
    goto LABEL_14;
  }
  v11 = 0;
  if (!a3)
    goto LABEL_19;
LABEL_17:
  if (!v11)
    *a3 = objc_retainAutorelease(v6);
LABEL_19:

  return v11;
}

- (id)bundleSignatureVersionWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v12;
  unsigned int v13;

  v13 = 0;
  -[MIExecutableBundle executableURL](self, "executableURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MIFetchSignatureVersionForExecutableURL(v5, &v13);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[MIExecutableBundle executableURL](self, "executableURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    MIErrorStringForMISError(v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle bundleSignatureVersionWithError:]", 1715, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to fetch signature version for executable at %@ with libMIS error %@"), v9, (uint64_t)v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      *a3 = objc_retainAutorelease(v10);

  }
  return v6;
}

- (id)enumerateDylibsWithBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[4];
  id v17;

  v4 = a3;
  -[MIBundle bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Frameworks"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__MIExecutableBundle_enumerateDylibsWithBlock___block_invoke;
  v16[3] = &unk_1E6CB75E8;
  v17 = v4;
  v8 = v4;
  objc_msgSend(v7, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v6, 1, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "domain");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
    {
      v11 = objc_msgSend(v9, "code");

      if (v11 == 2)
      {
        v12 = 0;
LABEL_8:

        goto LABEL_9;
      }
    }
    else
    {

    }
    objc_msgSend(v6, "path");
    v13 = objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle enumerateDylibsWithBlock:]", 1746, CFSTR("MIInstallerErrorDomain"), 54, v9, 0, CFSTR("Failed to discover dylibs in directory %@"), v14, v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)v13;
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:

  return v12;
}

uint64_t __47__MIExecutableBundle_enumerateDylibsWithBlock___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  v5 = a2;
  v6 = v5;
  if (a3 == 8
    && (objc_msgSend(v5, "pathExtension"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isEqualToString:", CFSTR("dylib")),
        v7,
        v8))
  {
    v9 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

- (NSURL)rootSinfURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MIBundle bundleURL](self, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("SC_Info"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[MIExecutableBundle executableName](self, "executableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.sinf"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (NSURL)rootSuppURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MIBundle bundleURL](self, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("SC_Info"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[MIExecutableBundle executableName](self, "executableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.supp"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (NSURL)rootSupfURL
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[MIBundle bundleURL](self, "bundleURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("SC_Info"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  -[MIExecutableBundle executableName](self, "executableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@.supf"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v8;
}

- (BOOL)updateSinfWithData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  id v16;

  v6 = a3;
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "uid");

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "gid");

  -[MIBundle bundleURL](self, "bundleURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableName](self, "executableName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  v13 = MIUpdateSinfWithData(v6, v11, v12, v8, v10, &v16);

  v14 = v16;
  if (a4 && (v13 & 1) == 0)
    *a4 = objc_retainAutorelease(v14);

  return v13;
}

- (void)bestEffortRollbackSinfData:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = 0;
    v5 = -[MIExecutableBundle updateSinfWithData:error:](self, "updateSinfWithData:error:", v4, &v9);
    v6 = v9;
    if (!v5 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      -[MIBundle identifier](self, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIBundle identifier](self, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    -[MIExecutableBundle removeSinf](self, "removeSinf", v7);
    v6 = 0;
  }

}

- (id)updateAndValidateSinf:(id)a3 error:(id *)a4
{
  return -[MIExecutableBundle updateAndValidateSinf:withRollback:error:](self, "updateAndValidateSinf:withRollback:error:", a3, 1, a4);
}

- (id)updateAndValidateSinf:(id)a3 withRollback:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  id v18;
  void *v19;
  BOOL v20;
  id v21;
  void *v22;
  id v23;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;

  v6 = a4;
  v8 = a3;
  if (!v6)
  {
    v11 = 0;
    goto LABEL_12;
  }
  v9 = (void *)MEMORY[0x1E0C99D50];
  -[MIExecutableBundle rootSinfURL](self, "rootSinfURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = 0;
  objc_msgSend(v9, "dataWithContentsOfURL:options:error:", v10, 2, &v31);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v31;

  if (!v11)
  {
    objc_msgSend(v12, "domain");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB28A8]) & 1) != 0)
    {
      v14 = objc_msgSend(v12, "code");

      if (v14 == 260)
        goto LABEL_11;
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIExecutableBundle rootSinfURL](self, "rootSinfURL");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[MIBundle identifier](self, "identifier");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = v12;
      v25 = v16;
      MOLogWrite();

    }
  }
LABEL_11:

LABEL_12:
  v30 = 0;
  v17 = -[MIExecutableBundle updateSinfWithData:error:](self, "updateSinfWithData:error:", v8, &v30, v25, v26, v27);
  v18 = v30;
  v19 = v18;
  if (!v17)
  {
    v22 = 0;
    v21 = v18;
    if (!a5)
      goto LABEL_23;
    goto LABEL_21;
  }
  v29 = v18;
  v20 = -[MIExecutableBundle validateSinfWithError:](self, "validateSinfWithError:", &v29);
  v21 = v29;

  if (v20)
  {
    v28 = v21;
    -[MIExecutableBundle fairPlaySinfInfoWithError:](self, "fairPlaySinfInfoWithError:", &v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v28;

    v21 = v23;
    if (!a5)
      goto LABEL_23;
    goto LABEL_21;
  }
  if (v6)
    -[MIExecutableBundle bestEffortRollbackSinfData:](self, "bestEffortRollbackSinfData:", v11);
  v22 = 0;
  if (a5)
  {
LABEL_21:
    if (!v22)
      *a5 = objc_retainAutorelease(v21);
  }
LABEL_23:

  return v22;
}

- (BOOL)replicateRootSinfWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;

  -[MIBundle bundleURL](self, "bundleURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableName](self, "executableName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "uid");
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = MIReplicateRootSinf(v5, v6, v8, objc_msgSend(v9, "gid"), a3);

  return (char)a3;
}

- (void)removeSinf
{
  void *v3;
  id v4;

  -[MIBundle bundleURL](self, "bundleURL");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle executableName](self, "executableName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MIRemoveSinf(v4, v3);

}

- (BOOL)needsSinf
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle rootSuppURL](self, "rootSuppURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "itemExistsAtURL:", v4) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIExecutableBundle rootSupfURL](self, "rootSupfURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "itemExistsAtURL:", v7);

  }
  return v5;
}

- (BOOL)hasSinf
{
  void *v3;
  void *v4;
  char v5;

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIExecutableBundle rootSinfURL](self, "rootSinfURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "itemExistsAtURL:", v4);

  return v5;
}

- (id)fairPlaySinfInfoWithError:(id *)a3
{
  _BOOL4 v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  id v24;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  int v38;

  v38 = -1;
  v37 = 0;
  v5 = -[MIExecutableBundle getSinfDataType:withError:](self, "getSinfDataType:withError:", &v38, &v37);
  v6 = v37;
  v7 = v6;
  if (!v5)
  {
    v9 = 0;
    v11 = v6;
    goto LABEL_5;
  }
  if (v38)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setIsMissingRequiredSINF:", 0);
    v9 = 0;
    v10 = 0;
    goto LABEL_29;
  }
  -[MIExecutableBundle rootSinfURL](self, "rootSinfURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v7;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v9, 2, &v36);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v36;

  if (!v12)
  {
    objc_msgSend(v11, "domain");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v17 = objc_msgSend(v11, "code");

      if (v17 == 260)
        goto LABEL_5;
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v9, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
LABEL_5:
    v10 = 0;
    v8 = 0;
    if (!a3)
      goto LABEL_32;
    goto LABEL_30;
  }
  v35 = 0;
  v10 = objc_retainAutorelease(v12);
  hZZRqgZwI(objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 42, (uint64_t)&v35);
  if (v13 == -42031)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      objc_msgSend(v9, "path");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v35 = 0;
  }
  else if (v13)
  {
    objc_msgSend(v9, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]", 1917, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Could not get MID-based SINF status from SINF at %@: %ld"), v15, (uint64_t)v14);
LABEL_28:
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = 0;
LABEL_29:
    v11 = v7;
    if (!a3)
      goto LABEL_32;
    goto LABEL_30;
  }
  v34 = 0;
  v10 = objc_retainAutorelease(v10);
  hZZRqgZwI(objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 1, (uint64_t)&v34);
  if (v18)
  {
    objc_msgSend(v9, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]", 1929, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Could not get purchaser DSID from SINF at %@: %ld"), v19, (uint64_t)v14);
    goto LABEL_28;
  }
  v33 = 0;
  v10 = objc_retainAutorelease(v10);
  hZZRqgZwI(objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 41, (uint64_t)&v33);
  if (v20)
  {
    objc_msgSend(v9, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]", 1937, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Could not get family ID from SINF at %@: %ld"), v21, (uint64_t)v14);
    goto LABEL_28;
  }
  v32 = 0;
  v10 = objc_retainAutorelease(v10);
  hZZRqgZwI(objc_msgSend(v10, "bytes"), objc_msgSend(v10, "length"), 40, (uint64_t)&v32);
  if (v22)
  {
    objc_msgSend(v9, "path");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle fairPlaySinfInfoWithError:]", 1945, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Could not get downloader DSID from SINF at %@: %ld"), v23, (uint64_t)v14);
    goto LABEL_28;
  }
  v26 = v35 != 0;
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v34);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setApplicationDSID:", v27);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v33);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFamilyID:", v28);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v32);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDownloaderDSID:", v29);

  objc_msgSend(v8, "setHasMIDBasedSINF:", v26);
  objc_msgSend(v8, "setIsMissingRequiredSINF:", 0);
  if (!a3)
    goto LABEL_32;
LABEL_30:
  if (!v8)
    *a3 = objc_retainAutorelease(v11);
LABEL_32:
  v24 = v8;

  return v24;
}

- (BOOL)setSinfDataType:(unsigned int)a3 withError:(id *)a4
{
  uint64_t v5;
  BOOL v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  id *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  id v17;
  id *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  int v32;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id obj;
  uint64_t v39;
  id *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _BYTE v45[128];
  uint64_t v46;

  v5 = *(_QWORD *)&a3;
  v46 = *MEMORY[0x1E0C80C00];
  if (!-[MIBundle isPlaceholder](self, "isPlaceholder"))
  {
    v39 = 0;
    v40 = (id *)&v39;
    v41 = 0x3032000000;
    v42 = __Block_byref_object_copy__7;
    v43 = __Block_byref_object_dispose__7;
    v44 = 0;
    -[MIExecutableBundle setSinfDataType:](self, "setSinfDataType:", v5);
    -[MIExecutableBundle setSinfDataTypeIsSet:](self, "setSinfDataTypeIsSet:", 1);
    if (-[MIBundle isAppTypeBundle](self, "isAppTypeBundle"))
    {
      v8 = -[MIExecutableBundle needsSinf](self, "needsSinf");
      if ((_DWORD)v5)
        v9 = v8;
      else
        v9 = 0;
      if (!v9)
        goto LABEL_8;
    }
    else if (!(_DWORD)v5)
    {
LABEL_8:
      v10 = 0;
      v7 = 1;
LABEL_31:

      _Block_object_dispose(&v39, 8);
      return v7;
    }
    v11 = v40 + 5;
    obj = v40[5];
    -[MIBundle thisBundleAndAllContainedBundlesWithError:](self, "thisBundleAndAllContainedBundlesWithError:", &obj);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = a4;
    objc_storeStrong(v11, obj);
    if (v29)
    {
      v36 = 0u;
      v37 = 0u;
      v34 = 0u;
      v35 = 0u;
      v12 = v29;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
      v30 = v12;
      if (v13)
      {
        v14 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v35 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              objc_msgSend(v16, "executableURL");
              v17 = (id)objc_claimAutoreleasedReturnValue();
              v18 = v40 + 5;
              v33 = v40[5];
              v19 = MISetSinfDataType(v17, v5, &v33);
              objc_storeStrong(v18, v33);
              if ((v19 & 1) == 0)
                goto LABEL_28;
              if (objc_msgSend(v16, "isAppTypeBundle"))
              {
                v20 = v40[5];
                v40[5] = 0;

                v31[0] = MEMORY[0x1E0C809B0];
                v31[1] = 3221225472;
                v31[2] = __48__MIExecutableBundle_setSinfDataType_withError___block_invoke;
                v31[3] = &unk_1E6CB7610;
                v32 = v5;
                v31[4] = &v39;
                -[MIExecutableBundle enumerateDylibsWithBlock:](self, "enumerateDylibsWithBlock:", v31);
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v22 = v21;
                if (v40[5])
                  goto LABEL_27;
                if (v21)
                {
                  objc_storeStrong(v40 + 5, v21);
LABEL_27:

                  goto LABEL_28;
                }
              }

              v12 = v30;
            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v45, 16);
          if (v13)
            continue;
          break;
        }
      }

      v7 = 1;
      v10 = v30;
    }
    else
    {
      v23 = v40[5];
      -[MIBundle identifier](self, "identifier");
      v24 = objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIExecutableBundle setSinfDataType:withError:]", 1993, CFSTR("MIInstallerErrorDomain"), 4, v23, 0, CFSTR("Failed to get all bundles within app %@"), v25, v24);
      v26 = objc_claimAutoreleasedReturnValue();
      v30 = (void *)v24;
      v17 = v40[5];
      v40[5] = (id)v26;
LABEL_28:

      v7 = 0;
      if (v28)
        *v28 = objc_retainAutorelease(v40[5]);
      v10 = v29;
    }
    goto LABEL_31;
  }
  return 1;
}

uint64_t __48__MIExecutableBundle_setSinfDataType_withError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  id v9;

  v4 = *(unsigned int *)(a1 + 40);
  v9 = 0;
  v5 = MISetSinfDataType(a2, v4, &v9);
  v6 = v9;
  v7 = v9;
  if ((v5 & 1) == 0)
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), v6);

  return v5;
}

- (BOOL)getSinfDataType:(unsigned int *)a3 withError:(id *)a4
{
  void *v8;
  char v9;

  if (-[MIExecutableBundle sinfDataTypeIsSet](self, "sinfDataTypeIsSet"))
  {
    if (*a3)
      *a3 = -[MIExecutableBundle sinfDataType](self, "sinfDataType");
    return 1;
  }
  else
  {
    -[MIExecutableBundle executableURL](self, "executableURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MIGetSinfDataType(v8, a3, a4);

    return v9;
  }
}

- (BOOL)validateSinfWithError:(id *)a3
{
  id v5;
  BOOL v6;
  _BOOL4 v8;
  id v9;
  int v10;
  int v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  MIExecutableBundle *v18;
  void *v19;
  id v20;
  int v21;

  if (!-[MIExecutableBundle hasSinf](self, "hasSinf") || -[MIBundle isPlaceholder](self, "isPlaceholder"))
  {
    v5 = 0;
LABEL_4:
    v6 = 1;
    goto LABEL_5;
  }
  v21 = -1;
  v20 = 0;
  v8 = -[MIExecutableBundle getSinfDataType:withError:](self, "getSinfDataType:withError:", &v21, &v20);
  v5 = v20;
  if (v8)
  {
    if (v21)
      goto LABEL_4;
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      v18 = self;
      MOLogWrite();
    }
    -[MIExecutableBundle executableURL](self, "executableURL", v18);
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v9, "fileSystemRepresentation");
    mm0Euuzhc();
    v11 = v10;

    switch(v11)
    {
      case -42057:
        -[MIBundle bundleURL](self, "bundleURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle validateSinfWithError:]", 2089, CFSTR("MIInstallerErrorDomain"), 174, 0, &unk_1E6CD40B8, CFSTR("The SINF provided for the bundle at %@ does not have a matching key in the FairPlay keybag."), v15, (uint64_t)v13);
        break;
      case 0:
        goto LABEL_4;
      case -42056:
        -[MIBundle bundleURL](self, "bundleURL");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle validateSinfWithError:]", 2086, CFSTR("MIInstallerErrorDomain"), 120, 0, &unk_1E6CD4090, CFSTR("The SINF provided for the bundle at %@ is not valid so this application will not run."), v14, (uint64_t)v13);
        break;
      default:
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          -[MIBundle bundleURL](self, "bundleURL");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "path");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
        goto LABEL_4;
    }
    v16 = objc_claimAutoreleasedReturnValue();

    v5 = (id)v16;
  }
  if (a3)
  {
    v5 = objc_retainAutorelease(v5);
    v6 = 0;
    *a3 = v5;
  }
  else
  {
    v6 = 0;
  }
LABEL_5:

  return v6;
}

- (BOOL)_hasResource:(id)a3 withExtension:(id)a4
{
  __CFString *v6;
  __CFString *v7;
  __CFBundle *v8;
  CFURLRef v9;
  BOOL v10;

  v6 = (__CFString *)a3;
  v7 = (__CFString *)a4;
  v8 = -[MIExecutableBundle cfBundle](self, "cfBundle");
  if (v8 && (v9 = CFBundleCopyResourceURL(v8, v6, v7, 0)) != 0)
  {
    CFRelease(v9);
    v10 = 1;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)hasWatchCustomNotification
{
  return -[MIExecutableBundle _hasResource:withExtension:](self, "_hasResource:withExtension:", CFSTR("Interface-notification"), CFSTR("plist"));
}

- (BOOL)hasWatchGlance
{
  return -[MIExecutableBundle _hasResource:withExtension:](self, "_hasResource:withExtension:", CFSTR("Interface-glance"), CFSTR("plist"));
}

- (BOOL)isExtensionBasedWatchKitApp
{
  void *v2;
  void *v3;
  char v4;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("WKWatchKitApp"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MIBooleanValue(v3, 0);

  return v4;
}

- (BOOL)isExtensionlessWatchKitApp
{
  void *v2;
  void *v3;
  char v4;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("WKApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MIBooleanValue(v3, 0);

  return v4;
}

- (NSString)companionAppIdentifier
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("WKCompanionAppBundleIdentifier"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v4 = v3;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v4;
  else
    v5 = 0;

  return (NSString *)v5;
}

- (NSArray)counterpartIdentifiers
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (-[MIBundle bundleType](self, "bundleType") != 1 && -[MIBundle bundleType](self, "bundleType") != 10)
  {
LABEL_8:
    if (-[MIBundle bundleType](self, "bundleType") == 4)
    {
      -[MIExecutableBundle watchKitAppBundleForWKVersionOrEarlier:error:](self, "watchKitAppBundleForWKVersionOrEarlier:error:", 3, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = v7;
        objc_msgSend(v7, "identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v12[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 1);
        v6 = (id)objc_claimAutoreleasedReturnValue();

LABEL_13:
        return (NSArray *)v6;
      }
    }
    else if (-[MIBundle bundleType](self, "bundleType") == 9)
    {
      -[MIExecutableBundle companionAppIdentifier](self, "companionAppIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v11, 1);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_13;
    }
    v6 = 0;
    return (NSArray *)v6;
  }
  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("LSCounterpartIdentifiers"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v5 = v4;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;
  else
    v6 = 0;

  objc_opt_class();
  if ((MIArrayContainsOnlyClass(v6) & 1) == 0)
  {

    goto LABEL_8;
  }
  return (NSArray *)v6;
}

- (BOOL)minimumWatchOSVersionIsPreV6
{
  void *v2;
  void *v3;
  BOOL v4;

  -[MIBundle minimumOSVersion](self, "minimumOSVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = !v2
    || (objc_msgSend(v2, "hasPrefix:", CFSTR("8.2")) & 1) != 0
    || objc_msgSend(v3, "compare:options:", CFSTR("6.0"), 64) == -1;

  return v4;
}

- (BOOL)watchKitAppRunsIndependentlyOfCompanion
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  id v15;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WKRunsIndependentlyOfCompanionApp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MIBooleanValue(v4, 0);

  if ((v5 & 1) != 0)
    return 1;
  v7 = -[MIBundle bundleType](self, "bundleType");
  v6 = 0;
  if (v7 <= 0xA && ((1 << v7) & 0x63E) != 0)
  {
    v15 = 0;
    -[MIExecutableBundle watchKitPluginWithError:](self, "watchKitPluginWithError:", &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    v10 = v9;
    if (v8)
    {
      v6 = objc_msgSend(v8, "watchKitAppRunsIndependentlyOfCompanion");
LABEL_15:

      return v6;
    }
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("MIInstallerErrorDomain")))
    {
      v12 = objc_msgSend(v10, "code");

      if (v12 == 96)
      {

        v6 = 0;
        v10 = 0;
        goto LABEL_15;
      }
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIBundle identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v6 = 0;
    goto LABEL_15;
  }
  return v6;
}

- (BOOL)isWatchOnlyApp
{
  void *v3;
  void *v4;
  char v5;
  char v6;
  unsigned int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v14;
  id v15;

  -[MIBundle infoPlistSubset](self, "infoPlistSubset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("WKWatchOnly"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MIBooleanValue(v4, 0);

  if ((v5 & 1) != 0)
    return 1;
  v7 = -[MIBundle bundleType](self, "bundleType");
  v6 = 0;
  if (v7 <= 0xA && ((1 << v7) & 0x63E) != 0)
  {
    v15 = 0;
    -[MIExecutableBundle watchKitPluginWithError:](self, "watchKitPluginWithError:", &v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v15;
    v10 = v9;
    if (v8)
    {
      v6 = objc_msgSend(v8, "isWatchOnlyApp");
LABEL_15:

      return v6;
    }
    objc_msgSend(v9, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("MIInstallerErrorDomain")))
    {
      v12 = objc_msgSend(v10, "code");

      if (v12 == 96)
      {

        v6 = 0;
        v10 = 0;
        goto LABEL_15;
      }
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      -[MIBundle identifier](self, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v6 = 0;
    goto LABEL_15;
  }
  return v6;
}

- (id)watchKitPluginWithError:(id *)a3
{
  void *v5;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[MIExecutableBundle watchKitPlugin](self, "watchKitPlugin");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MIExecutableBundle watchKitPlugin](self, "watchKitPlugin");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[MIBundle pluginKitBundlesWithError:](self, "pluginKitBundlesWithError:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (!v7)
      goto LABEL_14;
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          if ((objc_msgSend(v14, "isWatchKitExtension", (_QWORD)v17) & 1) != 0)
          {
            -[MIExecutableBundle setWatchKitPlugin:](self, "setWatchKitPlugin:", v14);
            v16 = v14;

            goto LABEL_16;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v11)
          continue;
        break;
      }
    }

    if (a3)
    {
      _CreateError((uint64_t)"-[MIExecutableBundle watchKitPluginWithError:]", 2275, CFSTR("MIInstallerErrorDomain"), 96, 0, 0, CFSTR("No WatchKit extension found"), v15, v17);
      v16 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
LABEL_14:
      v16 = 0;
    }
LABEL_16:

    return v16;
  }
}

- (unsigned)watchKitVersionWithError:(id *)a3
{
  unsigned __int8 v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v12;
  id v13;

  if (-[MIExecutableBundle isExtensionlessWatchKitApp](self, "isExtensionlessWatchKitApp"))
    return 3;
  if (-[MIExecutableBundle isExtensionBasedWatchKitApp](self, "isExtensionBasedWatchKitApp"))
  {
    v13 = 0;
    -[MIExecutableBundle watchKitPluginWithError:](self, "watchKitPluginWithError:", &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v13;
    v8 = v7;
    if (v6)
    {
      v5 = 3;
LABEL_16:

      return v5;
    }
    objc_msgSend(v7, "domain");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("MIInstallerErrorDomain")))
    {
      v10 = objc_msgSend(v8, "code");

      if (v10 == 96)
      {
        v5 = 2;
        goto LABEL_16;
      }
    }
    else
    {

    }
    v5 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v8);
    goto LABEL_16;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
  {
    -[MIBundle identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  return 1;
}

- (id)watchKitAppBundleForWKVersionOrEarlier:(unsigned __int8)a3 error:(id *)a4
{
  uint64_t v4;
  void *v6;
  id v7;
  id v9;

  if (a3 == 3)
  {
    v9 = 0;
    -[MIExecutableBundle watchKitV2AppBundleWithError:](self, "watchKitV2AppBundleWithError:", &v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v9;
    if (!a4)
      goto LABEL_10;
    goto LABEL_8;
  }
  if (a3 == 2)
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitAppBundleForWKVersionOrEarlier:error:]", 2314, CFSTR("MIInstallerErrorDomain"), 133, 0, 0, CFSTR("WatchKit version enum value %hhu is no longer supported"), v4, 2);
  else
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitAppBundleForWKVersionOrEarlier:error:]", 2321, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Unknown WatchKit version enum value %hhu"), v4, a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  if (a4)
  {
LABEL_8:
    if (!v6)
      *a4 = objc_retainAutorelease(v7);
  }
LABEL_10:

  return v6;
}

- (id)_discoverWatchAppBundleAsPlaceholder:(BOOL)a3 error:(id *)a4
{
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  id v18;
  _QWORD v19[4];
  __CFString *v20;
  MIExecutableBundle *v21;
  uint64_t *v22;
  uint64_t *v23;
  BOOL v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;

  if (a3)
    v7 = CFSTR("com.apple.WatchPlaceholder");
  else
    v7 = CFSTR("Watch");
  -[MIBundle bundleURL](self, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", v7, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0;
  v32 = &v31;
  v33 = 0x3032000000;
  v34 = __Block_byref_object_copy__7;
  v35 = __Block_byref_object_dispose__7;
  v36 = 0;
  v25 = 0;
  v26 = (id *)&v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__7;
  v29 = __Block_byref_object_dispose__7;
  v30 = 0;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __65__MIExecutableBundle__discoverWatchAppBundleAsPlaceholder_error___block_invoke;
  v19[3] = &unk_1E6CB7638;
  v22 = &v31;
  v23 = &v25;
  v20 = (__CFString *)v7;
  v21 = self;
  v24 = a3;
  objc_msgSend(v10, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v9, 1, v19);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    if (!v26[5])
      objc_storeStrong(v26 + 5, v11);
    v12 = (void *)v32[5];
    v32[5] = 0;
    goto LABEL_8;
  }
  if (!v32[5] && !v26[5])
  {
    -[MIBundle identifier](self, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[MIExecutableBundle _discoverWatchAppBundleAsPlaceholder:error:]", 2387, CFSTR("MIInstallerErrorDomain"), 85, 0, 0, CFSTR("No WatchKit 2.0 app bundle or placeholder found for app %@"), v16, (uint64_t)v12);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = v26[5];
    v26[5] = (id)v17;

LABEL_8:
  }
  v13 = (void *)v32[5];
  if (a4 && !v13)
  {
    *a4 = objc_retainAutorelease(v26[5]);
    v13 = (void *)v32[5];
  }
  v14 = v13;

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v31, 8);

  return v14;
}

uint64_t __65__MIExecutableBundle__discoverWatchAppBundleAsPlaceholder_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  MIEmbeddedWatchBundle *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v5 = a2;
  v6 = v5;
  if (a3 == 4)
  {
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isEqualToString:", CFSTR("app")))
    {
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
      {
        objc_msgSend(v6, "lastPathComponent");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bundleURL");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "lastPathComponent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle _discoverWatchAppBundleAsPlaceholder:error:]_block_invoke", 2354, CFSTR("MIInstallerErrorDomain"), 91, 0, &unk_1E6CD40E0, CFSTR("Unexpectedly found a second watch app, \"%@\", in this app's \"%@\" directory when we had already found \"%@\" in that directory. An iOS app may only have one embedded watch app."), v10, (uint64_t)v8);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v13 = *(void **)(v12 + 40);
        *(_QWORD *)(v12 + 40) = v11;

        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v15 = *(void **)(v14 + 40);
        *(_QWORD *)(v14 + 40) = 0;

LABEL_5:
        v16 = 0;
LABEL_15:

        goto LABEL_16;
      }
      v17 = [MIEmbeddedWatchBundle alloc];
      v19 = *(_QWORD *)(a1 + 32);
      v18 = *(_QWORD *)(a1 + 40);
      objc_msgSend(v6, "lastPathComponent");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = *(unsigned __int8 *)(a1 + 64);
      v38 = 0;
      v22 = -[MIEmbeddedWatchBundle initWithParentBundle:parentSubdirectory:bundleName:isPlaceholder:error:](v17, "initWithParentBundle:parentSubdirectory:bundleName:isPlaceholder:error:", v18, v19, v20, v21, &v38);
      v23 = v38;
      v24 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v25 = *(void **)(v24 + 40);
      *(_QWORD *)(v24 + 40) = v22;

      v26 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
      if (!v26)
      {
        objc_msgSend(v6, "path");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle _discoverWatchAppBundleAsPlaceholder:error:]_block_invoke", 2362, CFSTR("MIInstallerErrorDomain"), 92, v23, &unk_1E6CD4108, CFSTR("Could not create bundle for WatchKit app at %@"), v32, (uint64_t)v31);
        v33 = objc_claimAutoreleasedReturnValue();
        v34 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v35 = *(void **)(v34 + 40);
        *(_QWORD *)(v34 + 40) = v33;

        goto LABEL_5;
      }
      if ((objc_msgSend(v26, "isApplicableToKnownWatchOSVersion") & 1) == 0)
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
        {
          objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "bundleURL");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "path");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          MOLogWrite();

        }
        v28 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v29 = *(void **)(v28 + 40);
        *(_QWORD *)(v28 + 40) = 0;

      }
    }
    v16 = 1;
    goto LABEL_15;
  }
  v16 = 1;
LABEL_16:

  return v16;
}

- (id)watchKitV2AppBundleWithError:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v10;
  id v11;
  id v12;
  int v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  id v37;
  id v38;

  -[MIExecutableBundle wk2AppBundle](self, "wk2AppBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

    goto LABEL_4;
  }
  -[MIExecutableBundle wk2AppBundleError](self, "wk2AppBundleError");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v38 = 0;
    -[MIExecutableBundle _discoverWatchAppBundleAsPlaceholder:error:](self, "_discoverWatchAppBundleAsPlaceholder:error:", 0, &v38);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v38;
    v12 = v11;
    if (v10)
    {
LABEL_10:
      if ((objc_msgSend(v10, "isExtensionBasedWatchKitApp") & 1) != 0
        || (objc_msgSend(v10, "isExtensionlessWatchKitApp") & 1) != 0)
      {
        v36 = v12;
        v13 = objc_msgSend(v10, "watchKitVersionWithError:", &v36);
        v14 = v36;

        if (v13 == 3)
        {
          v12 = v14;
LABEL_36:
          -[MIExecutableBundle setWk2AppBundle:](self, "setWk2AppBundle:", v10);
          -[MIExecutableBundle setWk2AppBundleError:](self, "setWk2AppBundleError:", v12);
          v8 = v10;

          return v8;
        }
        objc_msgSend(v10, "bundleURL");
        v12 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "path");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitV2AppBundleWithError:]", 2440, CFSTR("MIInstallerErrorDomain"), 92, v14, &unk_1E6CD41A8, CFSTR("Found WatchKit app at %@ but it was not a WatchKit 2 app. Is it missing its app extension?"), v19, (uint64_t)v18);
        v20 = objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(v10, "bundleURL");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "path");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitV2AppBundleWithError:]", 2432, CFSTR("MIInstallerErrorDomain"), 92, 0, &unk_1E6CD4180, CFSTR("Found WatchKit 2.0 app at %@ but it does not have a WKWatchKitApp or WKApplication key set to true in its Info.plist"), v27, (uint64_t)v26);
        v20 = objc_claimAutoreleasedReturnValue();

        v12 = v25;
      }
      goto LABEL_32;
    }
    objc_msgSend(v11, "domain");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = *MEMORY[0x1E0CB2FE0];
    if (!objc_msgSend(v15, "isEqualToString:", *MEMORY[0x1E0CB2FE0]) || objc_msgSend(v12, "code") != 2)
    {
      objc_msgSend(v12, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!objc_msgSend(v17, "isEqualToString:", v16) || objc_msgSend(v12, "code") != 20)
      {
        objc_msgSend(v12, "domain");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v21, "isEqualToString:", CFSTR("MIInstallerErrorDomain")) & 1) != 0)
        {
          v22 = objc_msgSend(v12, "code");

          if (v22 == 85)
            goto LABEL_23;
        }
        else
        {

        }
        -[MIBundle bundleURL](self, "bundleURL");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitV2AppBundleWithError:]", 2415, CFSTR("MIInstallerErrorDomain"), 92, v12, &unk_1E6CD4130, CFSTR("Could not get contents of Watch directory in %@"), v28, (uint64_t)v10);
        goto LABEL_30;
      }

    }
LABEL_23:

    v37 = 0;
    -[MIExecutableBundle _discoverWatchAppBundleAsPlaceholder:error:](self, "_discoverWatchAppBundleAsPlaceholder:error:", 1, &v37);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v37;
    v12 = v23;
    if (v10)
      goto LABEL_10;
    objc_msgSend(v23, "domain");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v24, "isEqualToString:", v16) && objc_msgSend(v12, "code") == 2)
    {

LABEL_39:
      -[MIBundle identifier](self, "identifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateError((uint64_t)"-[MIExecutableBundle watchKitV2AppBundleWithError:]", 2423, CFSTR("MIInstallerErrorDomain"), 85, 0, 0, CFSTR("No WatchKit 2.0 placeholder found for app %@"), v32, (uint64_t)v10);
      v29 = objc_claimAutoreleasedReturnValue();
      goto LABEL_31;
    }
    objc_msgSend(v12, "domain");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v30, "isEqualToString:", v16) & 1) != 0)
    {
      v31 = objc_msgSend(v12, "code");

      if (v31 == 20)
        goto LABEL_39;
    }
    else
    {

    }
    objc_msgSend(v12, "domain");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "isEqualToString:", CFSTR("MIInstallerErrorDomain")))
    {
      v34 = objc_msgSend(v12, "code");

      if (v34 == 85)
      {
LABEL_33:
        if (a3)
        {
          v12 = objc_retainAutorelease(v12);
          v10 = 0;
          *a3 = v12;
        }
        else
        {
          v10 = 0;
        }
        goto LABEL_36;
      }
    }
    else
    {

    }
    -[MIBundle bundleURL](self, "bundleURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle watchKitV2AppBundleWithError:]", 2425, CFSTR("MIInstallerErrorDomain"), 92, v12, &unk_1E6CD4158, CFSTR("Could not get contents of watch placeholder directory in %@"), v35, (uint64_t)v10);
LABEL_30:
    v29 = objc_claimAutoreleasedReturnValue();
LABEL_31:
    v20 = v29;
LABEL_32:

    v12 = (id)v20;
    goto LABEL_33;
  }
LABEL_4:
  if (a3)
  {
    -[MIExecutableBundle wk2AppBundle](self, "wk2AppBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      -[MIExecutableBundle wk2AppBundleError](self, "wk2AppBundleError");
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  -[MIExecutableBundle wk2AppBundle](self, "wk2AppBundle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  return v8;
}

- (BOOL)hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:(unsigned __int8)a3 error:(id *)a4
{
  int v5;
  void *v7;
  void *v8;
  uint64_t *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  BOOL v22;
  const __CFString *v23;
  const __CFString *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v5 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  if (hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__onceToken != -1)
    dispatch_once(&hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__onceToken, &__block_literal_global_362);
  if ((v5 & 0xFE) != 2)
    -[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:].cold.2();
  -[MIBundle bundleURL](self, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  MILoadInfoPlist(v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == 2)
  {
    v9 = &hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV1Keys;
  }
  else
  {
    if (v5 != 3)
      -[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:].cold.1();
    v9 = &hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV2Keys;
  }
  v10 = (id)*v9;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
LABEL_10:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
      objc_opt_class();
      v17 = v16;
      v18 = (objc_opt_isKindOfClass() & 1) != 0 ? v17 : 0;

      if (!v18)
        break;
      if ((objc_msgSend(v10, "containsObject:", v17) & 1) == 0)
      {
        v24 = CFSTR("Unknown");
        if (v5 == 3)
          v24 = CFSTR("2.0");
        if (v5 == 2)
          v24 = CFSTR("1.0");
        _CreateAndLogError((uint64_t)"-[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:]", 2553, CFSTR("MIInstallerErrorDomain"), 99, 0, &unk_1E6CD41F8, CFSTR("WatchKit %@ app has disallowed Info.plist key: %@"), v20, (uint64_t)v24);
LABEL_31:
        v21 = (id)objc_claimAutoreleasedReturnValue();

        if (a4)
        {
          v21 = objc_retainAutorelease(v21);
          v22 = 0;
          *a4 = v21;
        }
        else
        {
          v22 = 0;
        }
        goto LABEL_34;
      }
      if (v13 == ++v15)
      {
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        if (v13)
          goto LABEL_10;
        goto LABEL_20;
      }
    }
    v23 = CFSTR("Unknown");
    if (v5 == 3)
      v23 = CFSTR("2.0");
    if (v5 == 2)
      v23 = CFSTR("1.0");
    _CreateAndLogError((uint64_t)"-[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:]", 2548, CFSTR("MIInstallerErrorDomain"), 98, 0, &unk_1E6CD41D0, CFSTR("WatchKit %@ app had an Info.plist key that was not a string."), v19, (uint64_t)v23);
    goto LABEL_31;
  }
LABEL_20:

  v21 = 0;
  v22 = 1;
LABEL_34:

  return v22;
}

void __85__MIExecutableBundle_hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error___block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV1Keys;
  hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV1Keys = (uint64_t)&unk_1E6CD47F0;

  objc_msgSend(&unk_1E6CD47F0, "arrayByAddingObjectsFromArray:", &unk_1E6CD4808);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV2Keys;
  hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion_error__allowedV2Keys = v1;

}

- (void)setExecutableImageSlices:(id)a3
{
  objc_storeStrong((id *)&self->_executableImageSlices, a3);
}

- (MIBundleContainer)bundleContainer
{
  return (MIBundleContainer *)objc_loadWeakRetained((id *)&self->_bundleContainer);
}

- (void)setBundleContainer:(id)a3
{
  objc_storeWeak((id *)&self->_bundleContainer, a3);
}

- (unint64_t)codeSignatureVerificationState
{
  return self->_codeSignatureVerificationState;
}

- (NSError)wk2AppBundleError
{
  return self->_wk2AppBundleError;
}

- (void)setWk2AppBundleError:(id)a3
{
  objc_storeStrong((id *)&self->_wk2AppBundleError, a3);
}

- (MIEmbeddedWatchBundle)wk2AppBundle
{
  return self->_wk2AppBundle;
}

- (void)setWk2AppBundle:(id)a3
{
  objc_storeStrong((id *)&self->_wk2AppBundle, a3);
}

- (MICodeSigningInfo)codeSigningInfo
{
  return self->_codeSigningInfo;
}

- (void)setCodeSigningInfo:(id)a3
{
  objc_storeStrong((id *)&self->_codeSigningInfo, a3);
}

- (NSError)codeSigningInfoError
{
  return self->_codeSigningInfoError;
}

- (void)setCodeSigningInfoError:(id)a3
{
  objc_storeStrong((id *)&self->_codeSigningInfoError, a3);
}

- (NSString)watchKitAppExecutableHash
{
  return self->_watchKitAppExecutableHash;
}

- (void)setWatchKitAppExecutableHash:(id)a3
{
  objc_storeStrong((id *)&self->_watchKitAppExecutableHash, a3);
}

- (MIPluginKitBundle)watchKitPlugin
{
  return self->_watchKitPlugin;
}

- (void)setWatchKitPlugin:(id)a3
{
  objc_storeStrong((id *)&self->_watchKitPlugin, a3);
}

- (MIInstallationIdentity)installationIdentity
{
  return self->_installationIdentity;
}

- (void)setInstallationIdentity:(id)a3
{
  objc_storeStrong((id *)&self->_installationIdentity, a3);
}

- (unint64_t)lsInstallType
{
  return self->_lsInstallType;
}

- (void)setLsInstallType:(unint64_t)a3
{
  self->_lsInstallType = a3;
}

- (unsigned)sinfDataType
{
  return self->_sinfDataType;
}

- (void)setSinfDataType:(unsigned int)a3
{
  self->_sinfDataType = a3;
}

- (BOOL)sinfDataTypeIsSet
{
  return self->_sinfDataTypeIsSet;
}

- (void)setSinfDataTypeIsSet:(BOOL)a3
{
  self->_sinfDataTypeIsSet = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_installationIdentity, 0);
  objc_storeStrong((id *)&self->_watchKitPlugin, 0);
  objc_storeStrong((id *)&self->_watchKitAppExecutableHash, 0);
  objc_storeStrong((id *)&self->_codeSigningInfoError, 0);
  objc_storeStrong((id *)&self->_codeSigningInfo, 0);
  objc_storeStrong((id *)&self->_wk2AppBundle, 0);
  objc_storeStrong((id *)&self->_wk2AppBundleError, 0);
  objc_destroyWeak((id *)&self->_bundleContainer);
  objc_storeStrong((id *)&self->_executableImageSlices, 0);
}

- (void)hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:.cold.1()
{
  if (!gLogHandle || *(int *)(gLogHandle + 44) > 2)
    MOLogWrite();
  __assert_rtn("-[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:]", "MIExecutableBundle.m", 2542, "false");
}

- (void)hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:.cold.2()
{
  __assert_rtn("-[MIExecutableBundle hasOnlyAllowedWatchKitAppInfoPlistKeysForWatchKitVersion:error:]", "MIExecutableBundle.m", 2526, "MIWatchKitVersion_1_0 == version || MIWatchKitVersion_2_0 == version");
}

@end
