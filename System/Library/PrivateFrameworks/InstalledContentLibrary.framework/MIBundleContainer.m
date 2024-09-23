@implementation MIBundleContainer

+ (id)appBundleContainerForIdentifier:(id)a3 temporary:(BOOL)a4 inDomain:(unint64_t)a5 withError:(id *)a6
{
  _BOOL4 v8;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v8 = a4;
  v11 = a3;
  if (a5 == 3)
  {
    if (v8)
    {
      v18 = 0;
      objc_msgSend(a1, "privateTempAppBundleContainerWithIdentifier:error:", v11, &v18);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v18;
    }
    else
    {
      v17 = 0;
      objc_msgSend(a1, "privateAppBundleContainerWithIdentifier:createIfNeeded:created:error:", v11, 0, 0, &v17);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v17;
    }
  }
  else
  {
    if (a5 != 2)
    {
      _CreateAndLogError((uint64_t)"+[MIBundleContainer appBundleContainerForIdentifier:temporary:inDomain:withError:]", 79, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("MIInstallationDomain was not set to either MIInstallationDomainSystemShared or MIInstallationDomainUserPrivate: %lu"), v10, a5);
      v15 = objc_claimAutoreleasedReturnValue();
      v12 = 0;
      goto LABEL_11;
    }
    if (v8)
    {
      v20 = 0;
      objc_msgSend(a1, "tempAppBundleContainerWithIdentifier:error:", v11, &v20);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v20;
    }
    else
    {
      v19 = 0;
      objc_msgSend(a1, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", v11, 0, 0, &v19);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = v19;
    }
  }
  v15 = v13;
LABEL_11:
  if (!(v12 | v15))
  {
    _CreateAndLogError((uint64_t)"+[MIBundleContainer appBundleContainerForIdentifier:temporary:inDomain:withError:]", 85, CFSTR("MIInstallerErrorDomain"), 26, 0, 0, CFSTR("Could not find installed app with identifier %@ in domain %lu"), v14, (uint64_t)v11);
    v15 = objc_claimAutoreleasedReturnValue();
  }
  if (a6 && !v12)
    *a6 = objc_retainAutorelease((id)v15);

  return (id)v12;
}

+ (id)appBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v10 = a3;
  +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryPersonaString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:", v10, v12, 1, v8, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)pluginKitPluginBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v10 = a3;
  +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryPersonaString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:", v10, v12, 3, v8, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)tempAppBundleContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryPersonaString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tempContainerWithIdentifier:forPersona:ofContentClass:error:", v6, v8, 1, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)privateAppBundleContainerWithIdentifier:(id)a3 createIfNeeded:(BOOL)a4 created:(BOOL *)a5 error:(id *)a6
{
  _BOOL8 v8;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a4;
  v10 = a3;
  +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "primaryPersonaString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "containerWithIdentifier:forPersona:ofContentClass:createIfNeeded:created:error:", v10, v12, 14, v8, a5, a6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)privateTempAppBundleContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryPersonaString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tempContainerWithIdentifier:forPersona:ofContentClass:error:", v6, v8, 14, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)tempAppBundleContainerWithIdentifier:(id)a3 inDomain:(unint64_t)a4 withError:(id *)a5
{
  return (id)objc_msgSend(a1, "appBundleContainerForIdentifier:temporary:inDomain:withError:", a3, 1, a4, a5);
}

+ (id)tempPluginKitPluginBundleContainerWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  +[MIGlobalConfiguration sharedInstance](MIGlobalConfiguration, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "primaryPersonaString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "tempContainerWithIdentifier:forPersona:ofContentClass:error:", v6, v8, 3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)appBundleContainerForIdentifier:(id)a3 inDomain:(unint64_t)a4 withError:(id *)a5
{
  return (id)objc_msgSend(a1, "appBundleContainerForIdentifier:temporary:inDomain:withError:", a3, 0, a4, a5);
}

+ (id)allAppBundleContainersWithError:(id *)a3
{
  return (id)objc_msgSend((id)objc_opt_class(), "containersWithClass:error:", 1, a3);
}

+ (BOOL)purgeTransientBundleContainersWithError:(id *)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  char v21;
  void *v22;
  BOOL v23;
  void *v25;
  id v26;
  id *v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_opt_new();
  v6 = (void *)objc_opt_new();
  if (!+[ICLFeatureFlags transientBundleCleanupEnabled](ICLFeatureFlags, "transientBundleCleanupEnabled"))
  {
    _CreateAndLogError((uint64_t)"+[MIBundleContainer purgeTransientBundleContainersWithError:]", 157, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("%s is not enabled"), v7, (uint64_t)"+[MIBundleContainer purgeTransientBundleContainersWithError:]");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    v8 = 0;
    if (!a3)
      goto LABEL_27;
    goto LABEL_25;
  }
  v39 = 0;
  objc_msgSend((id)objc_opt_class(), "containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:", 0, 0, 1, 0, 1, 0, &v39);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v39;
  if (!v8)
  {
    v22 = 0;
    if (!a3)
      goto LABEL_27;
    goto LABEL_25;
  }
  v38 = v9;
  objc_msgSend((id)objc_opt_class(), "containersForIdentifier:groupContainerIdentifier:ofContentClass:forPersona:fetchTransient:createIfNeeded:error:", 0, 0, 14, 0, 1, 0, &v38);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v38;

  if (!v10)
  {
    v22 = 0;
    v9 = v11;
    if (!a3)
      goto LABEL_27;
LABEL_25:
    v11 = objc_retainAutorelease(v9);
    v23 = 0;
    *a3 = v11;
    goto LABEL_29;
  }
  v27 = a3;
  v28 = a1;
  v30 = v8;
  objc_msgSend(v5, "addObjectsFromArray:", v8);
  v29 = (void *)v10;
  objc_msgSend(v5, "addObjectsFromArray:", v10);
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v12 = v5;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  if (!v13)
    goto LABEL_21;
  v14 = v13;
  v15 = *(_QWORD *)v35;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      v17 = v11;
      if (*(_QWORD *)v35 != v15)
        objc_enumerationMutation(v12);
      v18 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
      v33 = 0;
      v32 = v11;
      v19 = objc_msgSend(v18, "isStagedUpdateContainer:withError:", &v33, &v32, v25);
      v11 = v32;

      if ((v19 & 1) != 0)
      {
        if (v33)
          continue;
      }
      else
      {
        if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        {
          v25 = v18;
          v26 = v11;
          MOLogWrite();
        }
        v33 = 0;
      }
      objc_msgSend(v6, "addObject:", v18, v25, v26);
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      {
        v25 = v18;
        MOLogWrite();
      }
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v34, v40, 16);
  }
  while (v14);
LABEL_21:

  if (!objc_msgSend(v6, "count"))
  {
    v23 = 1;
    v8 = v30;
    v22 = v29;
    goto LABEL_29;
  }
  v20 = (void *)objc_msgSend(v6, "copy");
  v31 = v11;
  v21 = objc_msgSend(v28, "removeContainers:waitForDeletion:error:", v20, 0, &v31);
  v9 = v31;

  v8 = v30;
  v22 = v29;
  if ((v21 & 1) != 0)
  {
    v23 = 1;
    goto LABEL_28;
  }
  a3 = v27;
  if (v27)
    goto LABEL_25;
LABEL_27:
  v23 = 0;
LABEL_28:
  v11 = v9;
LABEL_29:

  return v23;
}

- (BOOL)hasParallelPlaceholder
{
  void *v3;
  void *v4;
  char v5;

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundleContainer parallelPlaceholderURL](self, "parallelPlaceholderURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "itemExistsAtURL:", v4);

  return v5;
}

- (NSURL)parallelPlaceholderURL
{
  void *v2;
  void *v3;

  -[MIContainer containerURL](self, "containerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.mobileinstallation.placeholder"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (BOOL)writeiTunesMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  BOOL v12;
  id v14;
  id v15;

  v6 = a3;
  v15 = 0;
  objc_msgSend(v6, "propertyListDataWithError:", &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;
  v9 = v8;
  if (v7)
  {
    v14 = v8;
    v10 = -[MIBundleContainer _writeRawiTunesMetadataData:error:](self, "_writeRawiTunesMetadataData:error:", v7, &v14);
    v11 = v14;

    if (v10)
    {
      -[MIBundleContainer setITunesMetadata:](self, "setITunesMetadata:", v6);
      v12 = 1;
      goto LABEL_8;
    }
  }
  else
  {
    v11 = v8;
  }
  if (a4)
  {
    v11 = objc_retainAutorelease(v11);
    v12 = 0;
    *a4 = v11;
  }
  else
  {
    v12 = 0;
  }
LABEL_8:

  return v12;
}

- (BOOL)_writeRawiTunesMetadataData:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v14;

  v6 = a3;
  -[MIBundleContainer iTunesMetadataURL](self, "iTunesMetadataURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v8 = objc_msgSend(v6, "writeToURL:options:error:", v7, 268435457, &v14);

  v9 = v14;
  if ((v8 & 1) == 0)
  {
    objc_msgSend(v7, "path");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundleContainer _writeRawiTunesMetadataData:error:]", 263, CFSTR("MIInstallerErrorDomain"), 124, v9, &unk_1E6CD4428, CFSTR("Failed to write iTunesMetadata to %@"), v11, (uint64_t)v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v9 = objc_retainAutorelease(v12);
      *a4 = v9;
    }
    else
    {
      v9 = v12;
    }
  }

  return v8;
}

- (BOOL)bestEffortRollbackiTunesMetadata:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  BOOL v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  BOOL v15;
  id v17;
  id v18;
  id v19;

  v6 = a3;
  if (v6)
  {
    v19 = 0;
    +[MIStoreMetadata metadataFromPlistData:error:](MIStoreMetadata, "metadataFromPlistData:error:", v6, &v19);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v19;
    v9 = v8;
    if (v7)
    {
      v18 = v8;
      v10 = -[MIBundleContainer _writeRawiTunesMetadataData:error:](self, "_writeRawiTunesMetadataData:error:", v6, &v18);
      v11 = v18;

      if (v10)
      {
        -[MIBundleContainer setITunesMetadata:](self, "setITunesMetadata:", v7);

LABEL_7:
        v15 = 1;
        goto LABEL_19;
      }
      if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
        MOLogWrite();
    }
    else
    {
      v11 = v8;
    }

  }
  else
  {
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[MIBundleContainer iTunesMetadataURL](self, "iTunesMetadataURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v14 = objc_msgSend(v12, "removeItemAtURL:error:", v13, &v17);
    v11 = v17;

    if ((v14 & 1) != 0)
    {
      -[MIBundleContainer setITunesMetadata:](self, "setITunesMetadata:", 0);
      goto LABEL_7;
    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
      MOLogWrite();
  }
  if (a4)
  {
    v11 = objc_retainAutorelease(v11);
    v15 = 0;
    *a4 = v11;
  }
  else
  {
    v15 = 0;
  }
LABEL_19:

  return v15;
}

+ (BOOL)updateiTunesMetadata:(id)a3 forAppWithIdentifier:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  char v14;
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v18 = 0;
  objc_msgSend(a1, "appBundleContainerWithIdentifier:createIfNeeded:created:error:", a4, 0, 0, &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v18;
  v11 = v10;
  if (v9)
  {
    v17 = v10;
    objc_msgSend(v8, "propertyListDataWithError:", &v17);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v17;

    if (v12)
    {
      v16 = v13;
      v14 = objc_msgSend(v9, "writeiTunesMetadata:error:", v8, &v16);
      v11 = v16;

      if (!a5)
        goto LABEL_10;
    }
    else
    {
      v14 = 0;
      v11 = v13;
      if (!a5)
        goto LABEL_10;
    }
  }
  else
  {
    v14 = 0;
    if (!a5)
      goto LABEL_10;
  }
  if ((v14 & 1) == 0)
    *a5 = objc_retainAutorelease(v11);
LABEL_10:

  return v14;
}

- (id)iTunesMetadataWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v11;

  -[MIBundleContainer iTunesMetadata](self, "iTunesMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
  }
  else
  {
    -[MIBundleContainer iTunesMetadataURL](self, "iTunesMetadataURL");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    +[MIStoreMetadata metadataFromPlistAtURL:error:](MIStoreMetadata, "metadataFromPlistAtURL:error:", v7, &v11);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    v8 = v11;

    if (v6)
    {
      -[MIBundleContainer setITunesMetadata:](self, "setITunesMetadata:", v6);
      v9 = v6;
    }
    else if (a3)
    {
      *a3 = objc_retainAutorelease(v8);
    }

  }
  return v6;
}

- (id)_bundleExtensionForContainerClassWithError:(id *)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  const __CFString *v7;

  v5 = -[MIContainer containerClass](self, "containerClass");
  v6 = 0;
  v7 = CFSTR("app");
  if (v5 != 1 && v5 != 14)
  {
    _CreateAndLogError((uint64_t)"-[MIBundleContainer _bundleExtensionForContainerClassWithError:]", 386, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("BundleContainer can't be created for container type %llu"), v4, v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (a3)
    {
      v6 = objc_retainAutorelease(v6);
      v7 = 0;
      *a3 = v6;
    }
    else
    {
      v7 = 0;
    }
  }

  return (id)v7;
}

- (BOOL)_configureBundleWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  MIExecutableBundle *v9;
  id v10;
  MIExecutableBundle *bundle;
  void *v13;
  id v14;
  id v15;

  -[MIContainer containerURL](self, "containerURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  -[MIBundleContainer _bundleExtensionForContainerClassWithError:](self, "_bundleExtensionForContainerClassWithError:", &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  v8 = v7;
  if (v6)
  {
    v14 = v7;
    v9 = -[MIExecutableBundle initWithBundleInContainer:withExtension:error:]([MIExecutableBundle alloc], "initWithBundleInContainer:withExtension:error:", self, v6, &v14);
    v10 = v14;

    bundle = self->_bundle;
    self->_bundle = v9;

    if (!self->_bundle && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      objc_msgSend(v5, "path");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else if (a3)
  {
    v10 = objc_retainAutorelease(v7);
    *a3 = v10;
  }
  else
  {
    v10 = v7;
  }

  return v6 != 0;
}

- (MIBundleContainer)initWithToken:(id)a3 options:(unint64_t)a4 error:(id *)a5
{
  id v8;
  MIBundleContainer *v9;
  id v10;
  void *v11;
  BOOL v12;
  id v13;
  MIBundleContainer *v14;
  MIExecutableBundle *v15;
  void *v16;
  uint64_t v17;
  MIExecutableBundle *bundle;
  MIExecutableBundle *v19;
  void *v20;
  uint64_t v21;
  id v23;
  id v24;
  objc_super v25;
  objc_super v26;
  id v27;

  v8 = a3;
  v26.receiver = self;
  v26.super_class = (Class)MIBundleContainer;
  v27 = 0;
  v9 = -[MIContainer initWithToken:options:error:](&v26, sel_initWithToken_options_error_, v8, a4, &v27);
  v10 = v27;
  if (v9)
  {
    v25.receiver = v9;
    v25.super_class = (Class)MIBundleContainer;
    -[MIContainer rawContainer](&v25, sel_rawContainer);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      if (objc_msgSend(v8, "hasIdentifiedBundle"))
      {
        v24 = v10;
        v12 = -[MIBundleContainer _configureBundleWithError:](v9, "_configureBundleWithError:", &v24);
        v13 = v24;

        v10 = v13;
        if (!v12)
          goto LABEL_5;
      }
      else
      {
        v13 = v10;
      }
    }
    else
    {
      v15 = [MIExecutableBundle alloc];
      objc_msgSend(v8, "bundleURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v10;
      v17 = -[MIBundle initWithBundleURL:error:](v15, "initWithBundleURL:error:", v16, &v23);
      v13 = v23;

      bundle = v9->_bundle;
      v9->_bundle = (MIExecutableBundle *)v17;

      v19 = v9->_bundle;
      if (!v19)
      {
        objc_msgSend(v8, "bundleURL");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIBundleContainer initWithToken:options:error:]", 433, CFSTR("MIInstallerErrorDomain"), 4, v13, 0, CFSTR("Failed to create app bundle from %@"), v21, (uint64_t)v20);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (a5)
          goto LABEL_6;
LABEL_12:
        v14 = 0;
        goto LABEL_13;
      }
      -[MIExecutableBundle setBundleContainer:](v19, "setBundleContainer:", v9);
    }
    v14 = v9;
    v10 = v13;
    goto LABEL_13;
  }
LABEL_5:
  if (!a5)
    goto LABEL_12;
LABEL_6:
  v10 = objc_retainAutorelease(v10);
  v14 = 0;
  *a5 = v10;
LABEL_13:

  return v14;
}

- (id)initForAppContainerWithURL:(id)a3
{
  id v4;
  MIBundleContainer *v5;
  MIExecutableBundle *v6;
  id v7;
  MIExecutableBundle *bundle;
  void *v10;
  id v11;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MIBundleContainer;
  v5 = -[MIContainer initWithContainerURL:](&v12, sel_initWithContainerURL_, v4);
  if (v5)
  {
    v11 = 0;
    v6 = -[MIExecutableBundle initWithBundleInContainer:withExtension:error:]([MIExecutableBundle alloc], "initWithBundleInContainer:withExtension:error:", v5, CFSTR("app"), &v11);
    v7 = v11;
    bundle = v5->_bundle;
    v5->_bundle = v6;

    if (!v5->_bundle && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      objc_msgSend(v4, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }

  return v5;
}

- (MIBundleContainer)initWithContainer:(id)a3 error:(id *)a4
{
  MIBundleContainer *v5;
  MIBundleContainer *v6;
  _BOOL4 v7;
  id v8;
  id v9;
  MIBundleContainer *v10;
  id v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MIBundleContainer;
  v5 = -[MIContainer initWithContainer:error:](&v13, sel_initWithContainer_error_, a3);
  v6 = v5;
  if (!v5 || -[MIContainer status](v5, "status") != 1)
  {
    v9 = 0;
    goto LABEL_7;
  }
  v12 = 0;
  v7 = -[MIBundleContainer _configureBundleWithError:](v6, "_configureBundleWithError:", &v12);
  v8 = v12;
  v9 = v8;
  if (v7)
  {
LABEL_7:
    v10 = v6;
    goto LABEL_8;
  }
  if (a4)
  {
    v9 = objc_retainAutorelease(v8);
    v10 = 0;
    *a4 = v9;
  }
  else
  {
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (NSURL)iTunesMetadataURL
{
  void *v2;
  void *v3;

  -[MIContainer containerURL](self, "containerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("iTunesMetadata.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSURL)bundleMetadataURL
{
  void *v2;
  void *v3;

  -[MIContainer containerURL](self, "containerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("BundleMetadata.plist"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)bundleMetadataWithError:(id *)a3
{
  uint64_t v5;
  MIBundleMetadata *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v12;
  uint64_t v13;
  id v14;

  -[MIBundleContainer bundleMetadata](self, "bundleMetadata");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (MIBundleMetadata *)v5;
    v7 = 0;
LABEL_5:
    v10 = (void *)-[MIBundleMetadata copy](v6, "copy");
    v8 = v6;
    goto LABEL_6;
  }
  -[MIBundleContainer bundleMetadataURL](self, "bundleMetadataURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  +[MIBundleMetadata metadataFromURL:error:](MIBundleMetadata, "metadataFromURL:error:", v8, &v14);
  v6 = (MIBundleMetadata *)objc_claimAutoreleasedReturnValue();
  v9 = v14;
  v7 = v9;
  if (v6)
  {
LABEL_4:
    -[MIBundleContainer setBundleMetadata:](self, "setBundleMetadata:", v6);

    goto LABEL_5;
  }
  objc_msgSend(v9, "domain");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
  {
    v13 = objc_msgSend(v7, "code");

    if (v13 == 260)
    {
      v6 = objc_alloc_init(MIBundleMetadata);
      goto LABEL_4;
    }
  }
  else
  {

  }
  if (a3)
  {
    v7 = objc_retainAutorelease(v7);
    v10 = 0;
    *a3 = v7;
  }
  else
  {
    v10 = 0;
  }
LABEL_6:

  return v10;
}

- (BOOL)saveBundleMetadata:(id)a3 withError:(id *)a4
{
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v12;

  v6 = a3;
  -[MIBundleContainer bundleMetadataURL](self, "bundleMetadataURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  v8 = objc_msgSend(v6, "serializeToURL:error:", v7, &v12);
  v9 = v12;
  v10 = v9;
  if (v8)
  {
    -[MIBundleContainer setBundleMetadata:](self, "setBundleMetadata:", v6);
  }
  else if (a4)
  {
    *a4 = objc_retainAutorelease(v9);
  }

  return v8;
}

- (BOOL)captureBundleByMoving:(id)a3 withError:(id *)a4
{
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  id v15;
  BOOL v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v21;

  v7 = a3;
  -[MIContainer containerURL](self, "containerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _CreateAndLogError((uint64_t)"-[MIBundleContainer captureBundleByMoving:withError:]", 562, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed get container URL from %@"), v8, (uint64_t)self);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    v11 = 0;
    if (a4)
    {
LABEL_7:
      v15 = objc_retainAutorelease(v15);
      v16 = 0;
      *a4 = v15;
      goto LABEL_8;
    }
LABEL_5:
    v16 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v7, "bundleName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "URLByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v14 = objc_msgSend(v12, "moveItemAtURL:toURL:error:", v13, v11, &v21);
  v15 = v21;

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v7, "bundleURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundleContainer captureBundleByMoving:withError:]", 568, CFSTR("MIInstallerErrorDomain"), 20, v15, &unk_1E6CD4450, CFSTR("Failed to move application at %@ into container path %@"), v18, (uint64_t)v17);
    v19 = objc_claimAutoreleasedReturnValue();

    v15 = (id)v19;
    if (a4)
      goto LABEL_7;
    goto LABEL_5;
  }
  objc_storeStrong((id *)&self->_bundle, a3);
  objc_msgSend(v7, "setBundleParentDirectoryURL:", v9);
  objc_msgSend(v7, "setBundleContainer:", self);
  v16 = 1;
LABEL_8:

  return v16;
}

- (BOOL)makeContainerLiveReplacingContainer:(id)a3 reason:(unint64_t)a4 waitForDeletion:(BOOL)a5 withError:(id *)a6
{
  _BOOL8 v7;
  id v10;
  BOOL v11;
  id v12;
  _BOOL4 v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  BOOL v19;
  id v20;
  char v21;
  MIBundleContainer *v23;
  void *v24;
  id v25;
  id v26;
  objc_super v27;
  id v28;
  id v29;
  char v30;

  v7 = a5;
  v10 = a3;
  v30 = 0;
  v29 = 0;
  v11 = -[MIContainer isStagedUpdateContainer:withError:](self, "isStagedUpdateContainer:withError:", &v30, &v29);
  v12 = v29;
  if (!v11)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      v23 = self;
      v25 = v12;
      MOLogWrite();
    }
    v30 = 1;
  }
  v27.receiver = self;
  v27.super_class = (Class)MIBundleContainer;
  v28 = 0;
  v13 = -[MIContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:](&v27, sel_makeContainerLiveReplacingContainer_reason_waitForDeletion_withError_, v10, a4, v7, &v28, v23, v25);
  v14 = v28;
  if (v13)
  {
    -[MIContainer containerURL](self, "containerURL");
    v15 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v13) = v15 != 0;
    if (v15)
    {
      v17 = (void *)v15;
      -[MIBundleContainer bundle](self, "bundle");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setBundleParentDirectoryURL:", v17);

    }
    else
    {
      _CreateAndLogError((uint64_t)"-[MIBundleContainer makeContainerLiveReplacingContainer:reason:waitForDeletion:withError:]", 602, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to get container URL from %@"), v16, (uint64_t)self);
      v17 = v14;
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  if (v30)
  {
    v26 = v12;
    v19 = -[MIContainer clearStagedUpdateContainerStatusWithError:](self, "clearStagedUpdateContainerStatusWithError:", &v26);
    v20 = v26;

    if (!v19 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    {
      -[MIContainer identifier](self, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else
  {
    v20 = v12;
  }
  if (a6)
    v21 = v13;
  else
    v21 = 1;
  if ((v21 & 1) == 0)
    *a6 = objc_retainAutorelease(v14);

  return v13;
}

- (unsigned)bundleMaxLinkedSDKVersion
{
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  id v14;

  v14 = 0;
  -[MIContainer infoValueForKey:error:](self, "infoValueForKey:error:", CFSTR("com.apple.MobileInstallation.BundleMaxLinkedSDKVersion"), &v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v14;
  objc_opt_class();
  v5 = v3;
  v6 = 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v6 = v5;

  if (v6)
  {
    LODWORD(v7) = objc_msgSend(v6, "unsignedIntValue");
LABEL_5:
    v8 = v4;
    goto LABEL_6;
  }
  -[MIBundleContainer bundle](self, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v10, "maxLinkedSDKVersion");

  if (!(_DWORD)v7)
    goto LABEL_5;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v4;
  v12 = -[MIContainer setInfoValue:forKey:error:](self, "setInfoValue:forKey:error:", v11, CFSTR("com.apple.MobileInstallation.BundleMaxLinkedSDKVersion"), &v13);
  v8 = v13;

  if (!v12 && (!gLogHandle || *(int *)(gLogHandle + 44) >= 3))
    MOLogWrite();
LABEL_6:

  return v7;
}

- (BOOL)shouldHaveCorrespondingDataContainer
{
  void *v2;
  char v3;

  -[MIBundleContainer bundle](self, "bundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "needsDataContainer");

  return v3;
}

- (BOOL)captureStoreDataFromDirectory:(id)a3 doCopy:(BOOL)a4 failureIsFatal:(BOOL)a5 includeiTunesMetadata:(BOOL)a6 withError:(id *)a7
{
  _BOOL8 v8;
  _BOOL8 v9;
  uint64_t v10;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  BOOL v18;
  void *v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  id v32;
  id v33;

  v8 = a6;
  v9 = a5;
  v10 = a4;
  v12 = a3;
  -[MIBundleContainer iTunesMetadataURL](self, "iTunesMetadataURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIContainer containerURL](self, "containerURL");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    +[MIFileManager defaultManager](MIFileManager, "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    LODWORD(v10) = objc_msgSend(v16, "captureStoreDataFromDirectory:toDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:", v12, v15, v10, v9, v8, &v33);
    v17 = v33;

    if ((_DWORD)v10)
      v18 = !v8;
    else
      v18 = 1;
    if (v18)
    {
      v19 = 0;
      v20 = v17;
      if (!a7)
        goto LABEL_17;
      goto LABEL_15;
    }
    v32 = v17;
    +[MIStoreMetadata metadataFromPlistAtURL:error:](MIStoreMetadata, "metadataFromPlistAtURL:error:", v13, &v32);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v32;

    if (v19)
    {
      objc_msgSend(v19, "distributorInfo");
      v21 = objc_claimAutoreleasedReturnValue();
      if (v21)
      {
        v10 = v21;
        objc_msgSend(v12, "path");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        _CreateAndLogError((uint64_t)"-[MIBundleContainer captureStoreDataFromDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]", 675, CFSTR("MIInstallerErrorDomain"), 215, 0, 0, CFSTR("iTunesMetadata.plist captured from %@ has distributorInfo set; this is not allowed. Found distributorInfo: %@"),
          v23,
          (uint64_t)v22);
        v24 = objc_claimAutoreleasedReturnValue();

        LOBYTE(v10) = 0;
        v20 = (id)v24;
        if (!a7)
          goto LABEL_17;
        goto LABEL_15;
      }
LABEL_21:
      -[MIBundleContainer setITunesMetadata:](self, "setITunesMetadata:", v19);
      LOBYTE(v10) = 1;
      goto LABEL_17;
    }
    objc_msgSend(v20, "userInfo");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v27, "domain");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "isEqualToString:", *MEMORY[0x1E0CB28A8]))
    {
      v29 = objc_msgSend(v27, "code");

      if (v29 == 260)
      {

        v20 = 0;
        goto LABEL_21;
      }
    }
    else
    {

    }
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v13, "path");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
  }
  else
  {
    _CreateAndLogError((uint64_t)"-[MIBundleContainer captureStoreDataFromDirectory:doCopy:failureIsFatal:includeiTunesMetadata:withError:]", 652, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to get container URL"), v14, v30);
    v20 = (id)objc_claimAutoreleasedReturnValue();
  }
  v19 = 0;
  LOBYTE(v10) = 0;
  if (!a7)
    goto LABEL_17;
LABEL_15:
  if ((v10 & 1) == 0)
  {
    v20 = objc_retainAutorelease(v20);
    LOBYTE(v10) = 0;
    *a7 = v20;
  }
LABEL_17:

  return v10;
}

- (NSURL)stashBaseURL
{
  void *v2;
  void *v3;

  -[MIContainer containerURL](self, "containerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.mobileinstallation.stash"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (id)_stashURLForIndex:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[MIBundleContainer stashBaseURL](self, "stashBaseURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu"), a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_stashedBundleContainerForIndex:(unint64_t)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  char v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  objc_class *v18;
  uint64_t v19;
  id v21;

  -[MIBundleContainer _stashURLForIndex:](self, "_stashURLForIndex:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v8 = objc_msgSend(v7, "itemExistsAtURL:error:", v6, &v21);
  v9 = v21;

  if ((v8 & 1) != 0)
  {
    v10 = -[MIBundleContainer initForAppContainerWithURL:]([MIStashedBundleContainer alloc], "initForAppContainerWithURL:", v6);
    if (v10)
    {
      v11 = v10;
      v12 = v9;
      goto LABEL_9;
    }
    v18 = (objc_class *)objc_opt_class();
    NSStringFromClass(v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundleContainer _stashedBundleContainerForIndex:error:]", 725, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to create %@ instance for %@"), v19, (uint64_t)v14);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = (void *)*MEMORY[0x1E0CB28A8];
    -[MIContainer containerURL](self, "containerURL");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "path");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateError((uint64_t)"-[MIBundleContainer _stashedBundleContainerForIndex:error:]", 719, v13, 260, v9, 0, CFSTR("No stash was found in bundle container %@ with index %lu (at %@)"), v16, (uint64_t)v14);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v12 = (id)v17;

  if (a4)
  {
    v12 = objc_retainAutorelease(v12);
    v11 = 0;
    *a4 = v12;
  }
  else
  {
    v11 = 0;
  }
LABEL_9:

  return v11;
}

- (id)stashedBundleContainerWithError:(id *)a3
{
  return -[MIBundleContainer _stashedBundleContainerForIndex:error:](self, "_stashedBundleContainerForIndex:error:", 0, a3);
}

- (BOOL)cloneContentFromStashedBundleContainer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  BOOL v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v22;
  _QWORD v23[4];
  id v24;
  id v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;

  v6 = a3;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__8;
  v31 = __Block_byref_object_dispose__8;
  v32 = 0;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIContainer containerURL](self, "containerURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    _CreateAndLogError((uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]", 772, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed get container URL for %@ when trying to clone content from %@"), v8, (uint64_t)self);
    v16 = objc_claimAutoreleasedReturnValue();
    v10 = 0;
    v13 = 0;
LABEL_7:
    v17 = (void *)v28[5];
    v28[5] = v16;
    goto LABEL_9;
  }
  objc_msgSend(v6, "bundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(v6, "containerURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]", 778, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Could not locate bundle in stashed bundle container at %@"), v18, (uint64_t)v17);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = (void *)v28[5];
    v28[5] = v19;

    v10 = 0;
    v13 = 0;
LABEL_9:

    if (a4)
      goto LABEL_5;
LABEL_10:
    v15 = 0;
    goto LABEL_11;
  }
  objc_msgSend(v6, "containerURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __66__MIBundleContainer_cloneContentFromStashedBundleContainer_error___block_invoke;
  v23[3] = &unk_1E6CB7698;
  v12 = v9;
  v24 = v12;
  v25 = v7;
  v26 = &v27;
  objc_msgSend(v25, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v11, 1, v23);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v28[5])
  {
    if (!v13)
    {
      objc_storeStrong((id *)&self->_bundle, v10);
      objc_msgSend(v10, "setBundleParentDirectoryURL:", v12);
      objc_msgSend(v10, "setBundleContainer:", self);
      v13 = 0;
      v15 = 1;
      goto LABEL_11;
    }
    _CreateAndLogError((uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]", 807, CFSTR("MIInstallerErrorDomain"), 4, v13, 0, CFSTR("Failed to enumerate stashed container"), v14, v22);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_7;
  }
  if (!a4)
    goto LABEL_10;
LABEL_5:
  v15 = 0;
  *a4 = objc_retainAutorelease((id)v28[5]);
LABEL_11:

  _Block_object_dispose(&v27, 8);
  return v15;
}

uint64_t __66__MIBundleContainer_cloneContentFromStashedBundleContainer_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v17;
  id v18;

  v5 = a2;
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_ItemIsIgnoredContainerContentForStash(v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:isDirectory:", v6, a3 == 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    v18 = 0;
    v7 = objc_msgSend(v9, "copyItemAtURL:toURL:alwaysClone:error:", v5, v8, 0, &v18);
    v10 = v18;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v5, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIBundleContainer cloneContentFromStashedBundleContainer:error:]_block_invoke", 794, CFSTR("MIInstallerErrorDomain"), 4, v10, 0, CFSTR("Failed to clone stashed item %@ to %@"), v12, (uint64_t)v11);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }

  return v7;
}

- (BOOL)transferExistingStashesFromContainer:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  void *v12;
  BOOL v13;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v6 = a3;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stashBaseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[MIBundleContainer stashBaseURL](self, "stashBaseURL");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "itemDoesNotExistAtURL:", v8) & 1) != 0)
  {
    v10 = 0;
LABEL_7:
    v13 = 1;
    goto LABEL_8;
  }
  v21 = 0;
  v11 = objc_msgSend(v7, "copyItemAtURL:toURL:alwaysClone:error:", v8, v9, 0, &v21);
  v10 = v21;
  if (v11)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
    {
      -[MIBundleContainer bundle](self, "bundle");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    goto LABEL_7;
  }
  -[MIBundleContainer bundle](self, "bundle");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "identifier");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  _CreateAndLogError((uint64_t)"-[MIBundleContainer transferExistingStashesFromContainer:error:]", 840, CFSTR("MIInstallerErrorDomain"), 4, v10, 0, CFSTR("Failed to preserve existing stashed version of app %@ at %@"), v17, (uint64_t)v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4)
  {
    v10 = objc_retainAutorelease(v18);
    v13 = 0;
    *a4 = v10;
  }
  else
  {
    v13 = 0;
    v10 = v18;
  }
LABEL_8:

  return v13;
}

- (BOOL)stashBundleContainerContents:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id *v10;
  char v11;
  id *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  BOOL v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  id *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  char v41;
  id v42;
  id v43;
  _QWORD v44[4];
  id v45;
  id v46;
  uint64_t *v47;
  id v48;
  id obj;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;

  v6 = a3;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__8;
  v54 = __Block_byref_object_dispose__8;
  v55 = 0;
  +[MIFileManager defaultManager](MIFileManager, "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundleContainer stashBaseURL](self, "stashBaseURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MIBundleContainer _stashURLForIndex:](self, "_stashURLForIndex:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id *)(v51 + 5);
  obj = (id)v51[5];
  v11 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:", v8, 0, 493, 4, &obj);
  objc_storeStrong(v10, obj);
  if ((v11 & 1) == 0)
  {
    v22 = (void *)v51[5];
    objc_msgSend(v8, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 870, CFSTR("MIInstallerErrorDomain"), 4, v22, 0, CFSTR("Failed to create stash base directory at %@"), v24, (uint64_t)v23);
    v25 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v28 = (void *)v51[5];
    v51[5] = v25;

    v16 = 0;
    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_9;
  }
  v12 = (id *)(v51 + 5);
  v48 = (id)v51[5];
  v13 = objc_msgSend(v7, "createDirectoryAtURL:withIntermediateDirectories:mode:class:error:", v9, 0, 493, 4, &v48);
  objc_storeStrong(v12, v48);
  if ((v13 & 1) == 0)
  {
    v26 = (void *)v51[5];
    objc_msgSend(v8, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 876, CFSTR("MIInstallerErrorDomain"), 4, v26, 0, CFSTR("Failed to create stash base directory at %@"), v27, (uint64_t)v23);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v6, "containerURL");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __56__MIBundleContainer_stashBundleContainerContents_error___block_invoke;
  v44[3] = &unk_1E6CB7698;
  v15 = v9;
  v45 = v15;
  v46 = v7;
  v47 = &v50;
  objc_msgSend(v46, "enumerateURLsForItemsInDirectoryAtURL:ignoreSymlinks:withBlock:", v14, 1, v44);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v51[5])
  {
    v18 = 0;
    v19 = 0;
    v20 = 0;
    if (!a4)
    {
LABEL_5:
      v21 = 0;
      goto LABEL_11;
    }
LABEL_10:
    v21 = 0;
    *a4 = objc_retainAutorelease((id)v51[5]);
    goto LABEL_11;
  }
  if (v16)
  {
    _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 906, CFSTR("MIInstallerErrorDomain"), 4, v16, 0, CFSTR("Failed to enumerate stashed container"), v17, v39);
    v30 = objc_claimAutoreleasedReturnValue();
    v18 = 0;
    v19 = 0;
    v20 = 0;
LABEL_14:
    v23 = (void *)v51[5];
    v51[5] = v30;
LABEL_9:

    if (!a4)
      goto LABEL_5;
    goto LABEL_10;
  }
  v20 = -[MIBundleContainer initForAppContainerWithURL:]([MIStashedBundleContainer alloc], "initForAppContainerWithURL:", v15);
  if (!v20)
  {
    objc_msgSend(v15, "path");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 913, CFSTR("MIInstallerErrorDomain"), 4, 0, 0, CFSTR("Failed to create MIStashedBundleContainer instance for %@"), v38, (uint64_t)v23);
    v25 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v31 = (id *)(v51 + 5);
  v43 = (id)v51[5];
  objc_msgSend(v6, "bundleMetadataWithError:", &v43);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v31, v43);
  if (!v19)
  {
    _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 920, CFSTR("MIInstallerErrorDomain"), 4, (void *)v51[5], 0, CFSTR("Failed to read bundle metadata from %@"), v32, (uint64_t)v6);
    v30 = objc_claimAutoreleasedReturnValue();
    v16 = 0;
    v18 = 0;
    v19 = 0;
    goto LABEL_14;
  }
  v18 = (void *)objc_msgSend(v20, "newStashMetadata");
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDateStashed:", v33);

  objc_msgSend(v19, "installDate");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDateOriginallyInstalled:", v34);

  v35 = (id *)(v51 + 5);
  v42 = (id)v51[5];
  v41 = objc_msgSend(v20, "saveStashMetadata:withError:", v18, &v42);
  objc_storeStrong(v35, v42);
  if ((v41 & 1) == 0)
  {
    _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]", 929, CFSTR("MIInstallerErrorDomain"), 4, (void *)v51[5], 0, CFSTR("Failed to save stash metadata"), v36, v39);
    v30 = objc_claimAutoreleasedReturnValue();
    v16 = 0;
    goto LABEL_14;
  }
  if (!gLogHandle || *(int *)(gLogHandle + 44) >= 5)
  {
    -[MIBundleContainer bundle](self, "bundle");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "identifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    MOLogWrite();

  }
  v16 = 0;
  v21 = 1;
LABEL_11:

  _Block_object_dispose(&v50, 8);
  return v21;
}

uint64_t __56__MIBundleContainer_stashBundleContainerContents_error___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v17;
  id v18;

  v5 = a2;
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_ItemIsIgnoredContainerContentForStash(v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:isDirectory:", v6, a3 == 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(a1 + 40);
    v18 = 0;
    v7 = objc_msgSend(v9, "copyItemAtURL:toURL:alwaysClone:error:", v5, v8, 0, &v18);
    v10 = v18;
    if ((v7 & 1) == 0)
    {
      objc_msgSend(v5, "path");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      _CreateAndLogError((uint64_t)"-[MIBundleContainer stashBundleContainerContents:error:]_block_invoke", 893, CFSTR("MIInstallerErrorDomain"), 4, v10, 0, CFSTR("Failed to clone existing container item at path %@ to stash path %@"), v12, (uint64_t)v11);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }

  return v7;
}

- (NSURL)compatibilityLinkDestination
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v8;
  void *v9;

  -[MIBundleContainer bundle](self, "bundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isPlaceholder") & 1) != 0)
  {
LABEL_10:
    v6 = 0;
    goto LABEL_11;
  }
  v4 = -[MIBundleContainer bundleMaxLinkedSDKVersion](self, "bundleMaxLinkedSDKVersion");
  if (!(_DWORD)v4)
  {
    if (!gLogHandle || *(int *)(gLogHandle + 44) >= 3)
    {
      objc_msgSend(v3, "bundleURL");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "path");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      MOLogWrite();

    }
    goto LABEL_10;
  }
  if (v4 >= 0x80000)
  {
    if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
      MOLogWrite();
    goto LABEL_10;
  }
  if (gLogHandle && *(int *)(gLogHandle + 44) >= 7)
  {
    v8 = v4;
    MOLogWrite();
  }
  objc_msgSend(v3, "bundleURL", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

  return (NSURL *)v6;
}

- (NSURL)referenceStorageURL
{
  void *v2;
  void *v3;

  -[MIContainer containerURL](self, "containerURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("References"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (MIExecutableBundle)bundle
{
  return self->_bundle;
}

- (MIBundleMetadata)bundleMetadata
{
  return self->_bundleMetadata;
}

- (void)setBundleMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (MIStoreMetadata)iTunesMetadata
{
  return self->_iTunesMetadata;
}

- (void)setITunesMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iTunesMetadata, 0);
  objc_storeStrong((id *)&self->_bundleMetadata, 0);
  objc_storeStrong((id *)&self->_bundle, 0);
}

@end
