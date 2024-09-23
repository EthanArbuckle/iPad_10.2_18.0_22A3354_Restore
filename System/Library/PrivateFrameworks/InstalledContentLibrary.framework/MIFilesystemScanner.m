@implementation MIFilesystemScanner

- (BOOL)_scanAppsDirectory:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[4];

  v6 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __52__MIFilesystemScanner__scanAppsDirectory_withError___block_invoke;
  v16[3] = &unk_1E6CB6F00;
  v16[4] = self;
  v16[5] = v17;
  objc_msgSend(v7, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v6, 1, v16);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      objc_msgSend(v6, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {

    goto LABEL_11;
  }
  v10 = objc_msgSend(v8, "code");

  if (v10 == 2)
  {
LABEL_9:
    v12 = 1;
    goto LABEL_14;
  }
LABEL_11:
  _CreateAndLogError((uint64_t)"-[MIFilesystemScanner _scanAppsDirectory:withError:]", 76, CFSTR("MIInstallerErrorDomain"), 27, v8, 0, CFSTR("Failed to enumerate %@"), v11, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v8 = objc_retainAutorelease(v13);
    v12 = 0;
    *a4 = v8;
  }
  else
  {
    v12 = 0;
    v8 = v13;
  }
LABEL_14:

  _Block_object_dispose(v17, 8);
  return v12;
}

uint64_t __52__MIFilesystemScanner__scanAppsDirectory_withError___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  void *v20;
  id v21;
  id v22;

  v5 = a2;
  v6 = v5;
  if (a3 == 4)
  {
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("app")))
    {
LABEL_18:

      goto LABEL_19;
    }
    v22 = 0;
    +[MIBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v6, &v22);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v22;
    v10 = v9;
    if (v8)
    {
      if ((objc_msgSend(v8, "isPlaceholder") & 1) != 0
        || (+[MIFileManager defaultManager](MIFileManager, "defaultManager"),
            v11 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v8, "executableURL"),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            v13 = objc_msgSend(v11, "itemDoesNotExistAtURL:", v12),
            v12,
            v11,
            !v13))
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "personaUniqueString");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = v10;
        v17 = objc_msgSend(v15, "scanExecutableBundle:inContainer:forPersona:withError:", v8, 0, v16, &v21);
        v18 = v21;

        if (v17)
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
        v10 = v18;
        goto LABEL_17;
      }
      if (gLogHandle && *(int *)(gLogHandle + 44) < 3)
      {
LABEL_17:

        goto LABEL_18;
      }
      objc_msgSend(v8, "executableURL");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    else
    {
      if (_IsMalformedBundleError(v9) || gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_17;
      objc_msgSend(v6, "path");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

    goto LABEL_17;
  }
LABEL_19:

  return 1;
}

- (BOOL)_scanFrameworkDirectory:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[4];

  v6 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__MIFilesystemScanner__scanFrameworkDirectory_withError___block_invoke;
  v16[3] = &unk_1E6CB6F00;
  v16[4] = self;
  v16[5] = v17;
  objc_msgSend(v7, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v6, 1, v16);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      objc_msgSend(v6, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {

    goto LABEL_11;
  }
  v10 = objc_msgSend(v8, "code");

  if (v10 == 2)
  {
LABEL_9:
    v12 = 1;
    goto LABEL_14;
  }
LABEL_11:
  _CreateAndLogError((uint64_t)"-[MIFilesystemScanner _scanFrameworkDirectory:withError:]", 159, CFSTR("MIInstallerErrorDomain"), 27, v8, 0, CFSTR("Failed to enumerate %@"), v11, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v8 = objc_retainAutorelease(v13);
    v12 = 0;
    *a4 = v8;
  }
  else
  {
    v12 = 0;
    v8 = v13;
  }
LABEL_14:

  _Block_object_dispose(v17, 8);
  return v12;
}

uint64_t __57__MIFilesystemScanner__scanFrameworkDirectory_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  id v19;
  char v20;
  id v22;
  id v23;
  id v24;

  v3 = a2;
  objc_msgSend(v3, "pathExtension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("framework"))
    && !+[MIBundle bundleIsInDenyList:](MIBundle, "bundleIsInDenyList:", v3))
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
    if ((v5 & 0x80) != 0)
    {
      objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("PlugIns"), 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[MIFileManager defaultManager](MIFileManager, "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "itemDoesNotExistAtURL:", v6);

      if (v8)
      {
        objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Extensions"), 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[MIFileManager defaultManager](MIFileManager, "defaultManager");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "itemDoesNotExistAtURL:", v9);

        if ((v11 & 1) != 0)
        {

          goto LABEL_21;
        }
      }

    }
    v24 = 0;
    +[MIBundle bundleForURL:error:](MIExecutableBundle, "bundleForURL:error:", v3, &v24);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v24;
    v14 = v13;
    if (!v12)
    {
      if (_IsMalformedBundleError(v13) || gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_20;
      objc_msgSend(v3, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
LABEL_19:

LABEL_20:
      goto LABEL_21;
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if ((v5 & 0x80) != 0)
    {
      v23 = v14;
      v20 = objc_msgSend(v15, "scanAppExtensionsInFrameworkBundle:withError:", v12, &v23);
      v19 = v23;

      if ((v20 & 1) == 0)
      {
LABEL_18:
        v14 = v19;
        goto LABEL_19;
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "personaUniqueString");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v14;
      v18 = objc_msgSend(v16, "scanExecutableBundle:inContainer:forPersona:withError:", v12, 0, v17, &v22);
      v19 = v22;

      if (!v18)
        goto LABEL_18;
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    goto LABEL_18;
  }
LABEL_21:

  return 1;
}

- (BOOL)_scanFrameworksLocationsWithError:(id *)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  id v13;
  void *v14;
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allFrameworksDirectories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        v16 = 0;
        v12 = -[MIFilesystemScanner _scanFrameworkDirectory:withError:](self, "_scanFrameworkDirectory:withError:", v11, &v16);
        v13 = v16;
        if (!v12)
        {
          -[MIFilesystemScanner delegate](self, "delegate");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "errorOccurred:", v13);

        }
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return 1;
}

- (BOOL)_scanExtensionKitDirectory:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  void *v13;
  void *v15;
  _QWORD v16[6];
  _QWORD v17[4];

  v6 = a3;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v17[3] = 0;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __60__MIFilesystemScanner__scanExtensionKitDirectory_withError___block_invoke;
  v16[3] = &unk_1E6CB6F00;
  v16[4] = self;
  v16[5] = v17;
  objc_msgSend(v7, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v6, 1, v16);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      objc_msgSend(v6, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    v8 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v8, "domain");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
  {

    goto LABEL_11;
  }
  v10 = objc_msgSend(v8, "code");

  if (v10 == 2)
  {
LABEL_9:
    v12 = 1;
    goto LABEL_14;
  }
LABEL_11:
  _CreateAndLogError((uint64_t)"-[MIFilesystemScanner _scanExtensionKitDirectory:withError:]", 227, CFSTR("MIInstallerErrorDomain"), 27, v8, 0, CFSTR("Failed to enumerate %@"), v11, (uint64_t)v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v8 = objc_retainAutorelease(v13);
    v12 = 0;
    *a4 = v8;
  }
  else
  {
    v12 = 0;
    v8 = v13;
  }
LABEL_14:

  _Block_object_dispose(v17, 8);
  return v12;
}

uint64_t __60__MIFilesystemScanner__scanExtensionKitDirectory_withError___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  id v16;
  id v17;

  v5 = a2;
  v6 = v5;
  if (a3 == 4)
  {
    objc_msgSend(v5, "pathExtension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v7, "isEqualToString:", CFSTR("appex")))
    {
LABEL_9:

      goto LABEL_10;
    }
    v17 = 0;
    +[MIBundle bundleForURL:error:](MIExtensionKitBundle, "bundleForURL:error:", v6, &v17);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v17;
    v10 = v9;
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "personaUniqueString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v10;
      v13 = objc_msgSend(v11, "scanExecutableBundle:inContainer:forPersona:withError:", v8, 0, v12, &v16);
      v14 = v16;

      if (v13)
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v10 = v14;
    }
    else
    {
      if (_IsMalformedBundleError(v9) || gLogHandle && *(int *)(gLogHandle + 44) < 3)
        goto LABEL_8;
      objc_msgSend(v6, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();
    }

LABEL_8:
    goto LABEL_9;
  }
LABEL_10:

  return 1;
}

- (id)builtInExtensionKitExtensionsDirectories
{
  void *v2;
  void *v3;

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "builtInExtensionKitExtensionsDirectories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_scanExtensionKitLocations:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  id v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v17;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v9);
        v15 = 0;
        v11 = -[MIFilesystemScanner _scanExtensionKitDirectory:withError:](self, "_scanExtensionKitDirectory:withError:", v10, &v15);
        v12 = v15;
        if (!v11)
        {
          -[MIFilesystemScanner delegate](self, "delegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "errorOccurred:", v12);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }

  return 1;
}

- (BOOL)_scanBundleContainersWithClass:(unint64_t)a3 withError:(id *)a4 ignoredErrorOccurredOnOneOrMoreItems:(BOOL *)a5
{
  void *v9;
  void *v10;
  id *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  char v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v32;
  void *context;
  void *v34;
  id obj;
  uint64_t v36;
  MIFilesystemScanner *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = (void *)MEMORY[0x1BCCAA068](self, a2);
  v37 = self;
  -[MIFilesystemScanner personaUniqueString](self, "personaUniqueString");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v45 = 0;
    v11 = (id *)&v45;
    +[MIContainer containersWithClass:personaUniqueString:error:](MIBundleContainer, "containersWithClass:personaUniqueString:error:", a3, v10, &v45);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v44 = 0;
    v11 = (id *)&v44;
    +[MIContainer containersWithClass:error:](MIBundleContainer, "containersWithClass:error:", a3, &v44);
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v13 = (void *)v12;
  v15 = *v11;
  if (v13)
  {
    v32 = v10;
    -[MIFilesystemScanner delegate](v37, "delegate");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v38 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
      MOLogWrite();
    context = v9;
    v34 = v13;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    obj = v13;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v16)
    {
      v17 = v16;
      v36 = 0;
      v18 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          v21 = (void *)MEMORY[0x1BCCAA068]();
          objc_msgSend(v20, "bundle");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v22)
          {
            objc_msgSend(v20, "bundle");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            -[MIFilesystemScanner personaUniqueString](v37, "personaUniqueString");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = v15;
            v25 = objc_msgSend(v38, "scanExecutableBundle:inContainer:forPersona:withError:", v23, v20, v24, &v39);
            v26 = v39;

            if ((v25 & 1) != 0)
            {
              ++v36;
            }
            else if (a5)
            {
              *a5 = 1;
            }
            v15 = v26;
          }
          else
          {
            if (a5)
              *a5 = 1;
            objc_msgSend(v20, "identifier");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            _CreateAndLogError((uint64_t)"-[MIFilesystemScanner _scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:]", 288, CFSTR("MIInstallerErrorDomain"), 36, 0, 0, CFSTR("No bundle found in container %@; skipping."),
              v28,
              (uint64_t)v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "errorOccurred:", v29);

          }
          objc_autoreleasePoolPop(v21);
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v17);
    }

    objc_autoreleasePoolPop(context);
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
      MOLogWrite();
    v13 = v34;
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MIFilesystemScanner _scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:]", 275, CFSTR("MIInstallerErrorDomain"), 4, v15, 0, CFSTR("Failed to scan for bundle containers of content class %ld"), v14, a3);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_autoreleasePoolPop(v9);
    if (a4)
    {
      v15 = objc_retainAutorelease(v30);
      *a4 = v15;
    }
    else
    {
      v15 = v30;
    }
  }

  return v13 != 0;
}

- (MIFilesystemScanner)initWithScanOptions:(unint64_t)a3 personaUniqueString:(id)a4
{
  id v7;
  MIFilesystemScanner *v8;
  MIFilesystemScanner *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)MIFilesystemScanner;
  v8 = -[MIFilesystemScanner init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_options = a3;
    objc_storeStrong((id *)&v8->_personaUniqueString, a4);
  }

  return v9;
}

- (MIFilesystemScanner)initWithScanOptions:(unint64_t)a3
{
  void *v5;
  void *v6;
  MIFilesystemScanner *v7;

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "primaryPersonaString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MIFilesystemScanner initWithScanOptions:personaUniqueString:](self, "initWithScanOptions:personaUniqueString:", a3, v6);

  return v7;
}

- (MIFilesystemScanner)init
{
  void *v3;
  void *v4;
  MIFilesystemScanner *v5;

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "primaryPersonaString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MIFilesystemScanner initWithScanOptions:personaUniqueString:](self, "initWithScanOptions:personaUniqueString:", 3967, v4);

  return v5;
}

- (BOOL)performScanWithError:(id *)a3
{
  void *v4;
  __int16 v5;
  id v6;
  BOOL v7;
  _BOOL4 v8;
  BOOL v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  BOOL v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v23;
  BOOL v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  BOOL v29;
  void *v30;
  BOOL v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  BOOL v36;
  id v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t i;
  uint64_t v48;
  void *v49;
  id v50;
  BOOL v51;
  id v52;
  void *v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  BOOL v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  BOOL v77;
  void *v79;
  char v80;
  void *v81;
  MIFilesystemScanner *v82;
  void *v83;
  id v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  id v89;
  id v90;
  id v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  id v96;
  id v97;
  id v98;
  id v99;
  id v100;
  id v101;
  id v102;
  id v103;
  id v104;
  id v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  _BYTE v110[128];
  _BYTE v111[128];
  _BYTE v112[128];
  uint64_t v113;

  v113 = *MEMORY[0x1E0C80C00];
  +[MIFileManager defaultManager](MIFileManager, "defaultManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIFilesystemScanner delegate](self, "delegate");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MIFilesystemScanner options](self, "options");
  if ((v5 & 1) != 0)
  {
    v105 = 0;
    v7 = -[MIFilesystemScanner _scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:](self, "_scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:", 1, &v105, 0);
    v6 = v105;
    if (!v7)
      objc_msgSend(v83, "errorOccurred:", v6);
  }
  else
  {
    v6 = 0;
  }
  v8 = +[ICLFeatureFlags appReferencesEnabled](ICLFeatureFlags, "appReferencesEnabled");
  if ((v5 & 0x400) != 0 && v8)
  {
    v104 = v6;
    v9 = -[MIFilesystemScanner _scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:](self, "_scanBundleContainersWithClass:withError:ignoredErrorOccurredOnOneOrMoreItems:", 14, &v104, 0);
    v10 = v104;

    if (!v9)
      objc_msgSend(v83, "errorOccurred:", v10);
  }
  else
  {
    v10 = v6;
  }
  v82 = self;
  if ((v5 & 2) == 0)
  {
    v11 = v10;
    if ((v5 & 0x20) != 0)
      goto LABEL_12;
LABEL_28:
    v15 = v11;
    if ((v5 & 8) != 0)
      goto LABEL_15;
LABEL_29:
    v19 = v15;
    if ((v5 & 0x40) != 0)
      goto LABEL_18;
LABEL_30:
    v23 = v19;
    if ((v5 & 0x10) != 0)
      goto LABEL_21;
    goto LABEL_31;
  }
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "systemAppsDirectory");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v103 = v10;
  v29 = -[MIFilesystemScanner _scanAppsDirectory:withError:](self, "_scanAppsDirectory:withError:", v28, &v103);
  v11 = v103;

  if (!v29)
    objc_msgSend(v83, "errorOccurred:", v11);
  if ((v5 & 0x20) == 0)
    goto LABEL_28;
LABEL_12:
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coreServicesDirectory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v102 = v11;
  v14 = -[MIFilesystemScanner _scanAppsDirectory:withError:](self, "_scanAppsDirectory:withError:", v13, &v102);
  v15 = v102;

  if (!v14)
    objc_msgSend(v83, "errorOccurred:", v15);
  if ((v5 & 8) == 0)
    goto LABEL_29;
LABEL_15:
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "internalAppsDirectory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v101 = v15;
  v18 = -[MIFilesystemScanner _scanAppsDirectory:withError:](self, "_scanAppsDirectory:withError:", v17, &v101);
  v19 = v101;

  if (!v18)
    objc_msgSend(v83, "errorOccurred:", v19);
  if ((v5 & 0x40) == 0)
    goto LABEL_30;
LABEL_18:
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "systemAppPlaceholdersDirectory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = v19;
  v22 = -[MIFilesystemScanner _scanAppsDirectory:withError:](self, "_scanAppsDirectory:withError:", v21, &v100);
  v23 = v100;

  if (!v22)
    objc_msgSend(v83, "errorOccurred:", v23);
  if ((v5 & 0x10) != 0)
  {
LABEL_21:
    v99 = v23;
    v24 = -[MIFilesystemScanner _scanFrameworksLocationsWithError:](self, "_scanFrameworksLocationsWithError:", &v99);
    v25 = v99;

    if (!v24)
      objc_msgSend(v83, "errorOccurred:", v25);
    if ((v5 & 0x800) == 0)
      goto LABEL_24;
    goto LABEL_32;
  }
LABEL_31:
  v25 = v23;
  if ((v5 & 0x800) == 0)
  {
LABEL_24:
    v26 = v25;
    goto LABEL_34;
  }
LABEL_32:
  -[MIFilesystemScanner builtInExtensionKitExtensionsDirectories](self, "builtInExtensionKitExtensionsDirectories");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = v25;
  v31 = -[MIFilesystemScanner _scanExtensionKitLocations:withError:](self, "_scanExtensionKitLocations:withError:", v30, &v98);
  v26 = v98;

  if (!v31)
    objc_msgSend(v83, "errorOccurred:", v26);
LABEL_34:
  if ((v5 & 0x200) != 0)
  {
    +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "cryptexAppsDirectory");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v26;
    objc_msgSend(v4, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:", v33, 0, 1, &v97);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = v97;

    if (v34)
    {
      v96 = v35;
      v36 = -[MIFilesystemScanner _scanAppsDirectory:withError:](self, "_scanAppsDirectory:withError:", v34, &v96);
      v37 = v96;

      v35 = v37;
      if (v36)
        goto LABEL_43;
    }
    else
    {
      objc_msgSend(v35, "domain");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v38, "isEqualToString:", *MEMORY[0x1E0CB2FE0]) & 1) != 0)
      {
        v39 = objc_msgSend(v35, "code");

        if (v39 == 2)
          goto LABEL_43;
      }
      else
      {

      }
    }
    objc_msgSend(v83, "errorOccurred:", v35);
LABEL_43:

    v26 = v35;
  }
  if ((v5 & 0x100) == 0)
    goto LABEL_63;
  v80 = v5;
  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "cryptexFrameworksDirectories");
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v42 = v41;
  v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v92, v111, 16);
  if (!v43)
    goto LABEL_60;
  v44 = v43;
  v45 = *(_QWORD *)v93;
  v46 = *MEMORY[0x1E0CB2FE0];
  do
  {
    for (i = 0; i != v44; ++i)
    {
      if (*(_QWORD *)v93 != v45)
        objc_enumerationMutation(v42);
      v48 = *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * i);

      v91 = 0;
      objc_msgSend(v4, "realPathForURL:allowNonExistentPathComponents:isDirectory:error:", v48, 0, 1, &v91);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v50 = v91;
      v26 = v50;
      if (v49)
      {
        v90 = v50;
        v51 = -[MIFilesystemScanner _scanAppsDirectory:withError:](v82, "_scanAppsDirectory:withError:", v49, &v90);
        v52 = v90;

        v26 = v52;
        if (!v51)
          goto LABEL_57;
      }
      else
      {
        objc_msgSend(v50, "domain");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v53, "isEqualToString:", v46) & 1) == 0)
        {

LABEL_57:
          objc_msgSend(v83, "errorOccurred:", v26);
          goto LABEL_58;
        }
        v54 = objc_msgSend(v26, "code");

        if (v54 != 2)
          goto LABEL_57;
      }
LABEL_58:

    }
    v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v92, v111, 16);
  }
  while (v44);
LABEL_60:
  v55 = v26;

  +[MIDaemonConfiguration sharedInstance](MIDaemonConfiguration, "sharedInstance");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "cryptexExtensionKitExtensionsDirectories");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v89 = v26;
  v58 = -[MIFilesystemScanner _scanExtensionKitLocations:withError:](v82, "_scanExtensionKitLocations:withError:", v57, &v89);
  v26 = v89;

  if (!v58)
    objc_msgSend(v83, "errorOccurred:", v26);

  LOBYTE(v5) = v80;
LABEL_63:
  if ((v5 & 4) != 0)
  {
    v81 = v4;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    MIDiskImageManagerProxy();
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "diskMountPaths");
    v61 = (void *)objc_claimAutoreleasedReturnValue();

    v108 = 0u;
    v109 = 0u;
    v106 = 0u;
    v107 = 0u;
    v62 = v61;
    v63 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
    if (v63)
    {
      v64 = v63;
      v65 = *(_QWORD *)v107;
      do
      {
        for (j = 0; j != v64; ++j)
        {
          if (*(_QWORD *)v107 != v65)
            objc_enumerationMutation(v62);
          objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", *(_QWORD *)(*((_QWORD *)&v106 + 1) + 8 * j), 1);
          v67 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v67, "URLByAppendingPathComponent:isDirectory:", CFSTR("Applications"), 1);
          v68 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v59, "addObject:", v68);

        }
        v64 = objc_msgSend(v62, "countByEnumeratingWithState:objects:count:", &v106, v112, 16);
      }
      while (v64);
    }

    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
    {
      v79 = v59;
      MOLogWrite();
    }
    v69 = (void *)objc_msgSend(v59, "copy", v79);

    v85 = 0u;
    v86 = 0u;
    v87 = 0u;
    v88 = 0u;
    v70 = v69;
    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v85, v110, 16);
    if (v71)
    {
      v72 = v71;
      v73 = *(_QWORD *)v86;
      do
      {
        v74 = 0;
        v75 = v26;
        do
        {
          if (*(_QWORD *)v86 != v73)
            objc_enumerationMutation(v70);
          v76 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * v74);
          v84 = v75;
          v77 = -[MIFilesystemScanner _scanAppsDirectory:withError:](v82, "_scanAppsDirectory:withError:", v76, &v84);
          v26 = v84;

          if (!v77)
            objc_msgSend(v83, "errorOccurred:", v26);
          ++v74;
          v75 = v26;
        }
        while (v72 != v74);
        v72 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v85, v110, 16);
      }
      while (v72);
    }

    v4 = v81;
  }

  return 1;
}

- (MIFilesystemScannerDelegate)delegate
{
  return (MIFilesystemScannerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)options
{
  return self->_options;
}

- (NSString)personaUniqueString
{
  return self->_personaUniqueString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_personaUniqueString, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
