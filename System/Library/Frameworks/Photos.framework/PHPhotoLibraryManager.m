@implementation PHPhotoLibraryManager

- (PHPhotoLibraryManager)init
{
  PHPhotoLibraryManager *v2;
  id v3;
  id v4;
  uint64_t v5;
  PLLazyObject *lazyAssetsdClient;
  _QWORD v8[4];
  id v9;
  id location;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PHPhotoLibraryManager;
  v2 = -[PHPhotoLibraryManager init](&v11, sel_init);
  if (v2)
  {
    v3 = objc_initWeak(&location, v2);

    v4 = objc_alloc(MEMORY[0x1E0D73248]);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __29__PHPhotoLibraryManager_init__block_invoke;
    v8[3] = &unk_1E35DDF28;
    objc_copyWeak(&v9, &location);
    v5 = objc_msgSend(v4, "initWithBlock:", v8);
    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
    lazyAssetsdClient = v2->_lazyAssetsdClient;
    v2->_lazyAssetsdClient = (PLLazyObject *)v5;

  }
  return v2;
}

- (id)newAssetsdClient
{
  return objc_alloc_init(MEMORY[0x1E0D73268]);
}

- (id)assetsdClient
{
  return (id)-[PLLazyObject objectValue](self->_lazyAssetsdClient, "objectValue");
}

- (id)_findPhotoLibraryIdentifiersMatchingSearchCriteria:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  -[PHPhotoLibraryManager assetsdClient](self, "assetsdClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "libraryManagementClient");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHPhotoLibraryManager internalTestOptions](self, "internalTestOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[PHPhotoLibraryManager internalTestOptions](self, "internalTestOptions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInternalTestOptions:", v10);

  }
  objc_msgSend(v8, "findPhotoLibraryIdentifiersMatchingSearchCriteria:error:", v6, a4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)findPhotoLibrariesInDomain:(int64_t)a3 error:(id *)a4
{
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;

  v7 = objc_alloc_init(MEMORY[0x1E0D719D8]);
  objc_msgSend(v7, "setDomain:", a3);
  v15 = 0;
  -[PHPhotoLibraryManager _findPhotoLibraryIdentifiersMatchingSearchCriteria:error:](self, "_findPhotoLibraryIdentifiersMatchingSearchCriteria:error:", v7, &v15);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v15;
  v10 = v9;
  if (v8)
  {
    objc_msgSend(v8, "_pl_map:", &__block_literal_global_35421);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PHPublicErrorFromError(v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a4)
      *a4 = objc_retainAutorelease(v12);

    v11 = 0;
  }

  return v11;
}

- (id)_optionsDictionaryFromOpenOptions:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (objc_msgSend(v4, "internalCreateOptions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "internalCreateOptions"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, *MEMORY[0x1E0D72400]);

  }
  if (objc_msgSend(v4, "internalUpgradeOptions"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v4, "internalUpgradeOptions"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("PHPhotoLibraryUpgradeOptions"));

  }
  objc_msgSend(v4, "libraryURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v4, "libraryURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v9, *MEMORY[0x1E0D72420]);

  }
  -[PHPhotoLibraryManager internalTestOptions](self, "internalTestOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    -[PHPhotoLibraryManager internalTestOptions](self, "internalTestOptions");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D72450]);

  }
  return v5;
}

- (id)openPhotoLibraryWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PHPhotoLibrary *v10;
  void *v11;
  BOOL v12;
  id v13;
  id v15;

  v8 = a4;
  v9 = a3;
  +[PHPhotoLibrary enableMultiLibraryMode](PHPhotoLibrary, "enableMultiLibraryMode");
  v10 = -[PHPhotoLibrary initWithPhotoLibraryURL:]([PHPhotoLibrary alloc], "initWithPhotoLibraryURL:", v9);

  if (v10)
  {
    -[PHPhotoLibraryManager _optionsDictionaryFromOpenOptions:](self, "_optionsDictionaryFromOpenOptions:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0;
    v12 = -[PHPhotoLibrary openAndWaitWithUpgrade:options:error:](v10, "openAndWaitWithUpgrade:options:error:", objc_msgSend(v8, "allowsUpgrade"), v11, &v15);
    v13 = v15;
    if (!v12)
    {

      v10 = 0;
      if (a5)
        *a5 = objc_retainAutorelease(v13);
    }

  }
  return v10;
}

- (id)openPhotoLibraryWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  id v21;
  id v22;

  v8 = a4;
  objc_msgSend(a3, "librarySearchCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  -[PHPhotoLibraryManager _findPhotoLibraryIdentifiersMatchingSearchCriteria:error:](self, "_findPhotoLibraryIdentifiersMatchingSearchCriteria:error:", v9, &v22);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v22;
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v10, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "libraryURL");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14)
    {
      v21 = 0;
      -[PHPhotoLibraryManager openPhotoLibraryWithURL:options:error:](self, "openPhotoLibraryWithURL:options:error:", v14, v8, &v21);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v21;
      v17 = v16;
      if (!v15 && a5)
        *a5 = objc_retainAutorelease(v16);

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3201, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v19;
      if (a5)
      {
        v17 = objc_retainAutorelease(v19);
        v15 = 0;
        *a5 = v17;
      }
      else
      {
        v15 = 0;
      }
    }

  }
  else
  {
    PHPublicErrorFromError(v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    if (a5)
    {
      v14 = objc_retainAutorelease(v18);
      v15 = 0;
      *a5 = v14;
    }
    else
    {
      v15 = 0;
    }
  }

  return v15;
}

- (void)openPhotoLibraryWithIdentifier:(id)a3 options:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  dispatch_get_global_queue(0, 0);
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__PHPhotoLibraryManager_openPhotoLibraryWithIdentifier_options_handler___block_invoke;
  block[3] = &unk_1E35DF520;
  block[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_sync(v11, block);

}

- (id)_optionsDictionaryFromCreateOptions:(id)a3 name:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v28;
  _QWORD v29[2];

  v29[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a4;
  v9 = objc_alloc_init(v7);
  v10 = objc_msgSend(v6, "internalCreateOptions");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D72448]);

  if (v10)
  {
    v28 = CFSTR("PHPhotoLibraryCreateOptions");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, &v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    +[PHPhotoLibrary plLibraryOptionsFromPHOptions:createOptions:](PHPhotoLibrary, "plLibraryOptionsFromPHOptions:createOptions:", v12, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D72400];
    objc_msgSend(v13, "objectForKeyedSubscript:", *MEMORY[0x1E0D72400]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v14);

  }
  objc_msgSend(v6, "libraryURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v6, "libraryURL");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v17, *MEMORY[0x1E0D72420]);

  }
  objc_msgSend(v6, "userDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v6, "userDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v19, *MEMORY[0x1E0D72430]);

  }
  if (objc_msgSend(v6, "domain"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "domain"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, *MEMORY[0x1E0D72438]);

  }
  objc_msgSend(v6, "containerIdentifier");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
  {
    objc_msgSend(v6, "containerIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, *MEMORY[0x1E0D72428]);

  }
  objc_msgSend(v6, "identifierUUID");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    objc_msgSend(v6, "identifierUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v24, *MEMORY[0x1E0D72440]);

  }
  -[PHPhotoLibraryManager internalTestOptions](self, "internalTestOptions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (v25)
  {
    -[PHPhotoLibraryManager internalTestOptions](self, "internalTestOptions");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, *MEMORY[0x1E0D72450]);

  }
  return v9;
}

- (id)createPhotoLibraryWithName:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  PHPhotoLibrary *v20;
  void *v21;
  void *v22;
  void *v24;
  id v25;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibraryManager.m"), 212, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("name"));

  }
  +[PHPhotoLibrary enableMultiLibraryMode](PHPhotoLibrary, "enableMultiLibraryMode");
  objc_msgSend(v10, "libraryURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11
    && (v12 = (void *)objc_opt_class(),
        objc_msgSend(v10, "libraryURL"),
        v13 = (void *)objc_claimAutoreleasedReturnValue(),
        LODWORD(v12) = objc_msgSend(v12, "_createClientPhotoLibraryBundleURL:error:", v13, a5),
        v13,
        !(_DWORD)v12))
  {
    v20 = 0;
  }
  else
  {
    -[PHPhotoLibraryManager _optionsDictionaryFromCreateOptions:name:](self, "_optionsDictionaryFromCreateOptions:name:", v10, v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibraryManager assetsdClient](self, "assetsdClient");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "libraryManagementClient");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = 0;
    objc_msgSend(v16, "createManagedPhotoLibraryWithOptions:error:", v14, &v25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v25;
    v19 = v18;
    if (v17)
    {
      v20 = -[PHPhotoLibrary initWithPhotoLibraryURL:]([PHPhotoLibrary alloc], "initWithPhotoLibraryURL:", v17);
    }
    else
    {
      PHPublicErrorFromError(v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = v21;
      if (a5)
        *a5 = objc_retainAutorelease(v21);

      v20 = 0;
    }

  }
  return v20;
}

- (id)createPhotoLibraryWithURL:(id)a3 options:(id)a4 error:(id *)a5
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;

  v9 = a3;
  v10 = a4;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHPhotoLibraryManager.m"), 235, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("url"));

  }
  objc_msgSend(v9, "lastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByDeletingPathExtension");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    v13 = (void *)objc_msgSend(v10, "copy");
  }
  else
  {
    +[PHPhotoLibraryCreationOptions creationOptionsForUserLibrary](PHPhotoLibraryCreationOptions, "creationOptionsForUserLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_msgSend(v13, "setLibraryURL:", v9);
  -[PHPhotoLibraryManager createPhotoLibraryWithName:options:error:](self, "createPhotoLibraryWithName:options:error:", v12, v14, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (id)attributesForLibraryWithIdentifier:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  PHPhotoLibraryAttributes *v18;
  void *v20;
  id v21;

  v6 = a3;
  +[PHPhotoLibrary enableMultiLibraryMode](PHPhotoLibrary, "enableMultiLibraryMode");
  objc_msgSend(v6, "pl_libraryIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    goto LABEL_8;
  objc_msgSend(v6, "librarySearchCriteria");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  -[PHPhotoLibraryManager _findPhotoLibraryIdentifiersMatchingSearchCriteria:error:](self, "_findPhotoLibraryIdentifiersMatchingSearchCriteria:error:", v8, &v21);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v21;
  v11 = v10;
  if (v9)
  {
    objc_msgSend(v9, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PHPublicErrorFromError(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (a4)
      *a4 = objc_retainAutorelease(v12);

    v7 = 0;
  }

  if (v7)
  {
LABEL_8:
    v14 = objc_alloc(MEMORY[0x1E0D73280]);
    objc_msgSend(v7, "libraryURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (id)objc_msgSend(v14, "initWithLibraryURL:", v15);

    objc_msgSend(MEMORY[0x1E0D715C0], "settingsWithPathManager:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PHPhotoLibraryAttributes initWithLibraryIdentifier:cplSettings:]([PHPhotoLibraryAttributes alloc], "initWithLibraryIdentifier:cplSettings:", v7, v17);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3201, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v20;
    if (a4)
    {
      v16 = objc_retainAutorelease(v20);
      v7 = 0;
      v18 = 0;
      *a4 = v16;
    }
    else
    {
      v7 = 0;
      v18 = 0;
    }
  }

  return v18;
}

- (BOOL)deletePhotoLibraryWithIdentifier:(id)a3 options:(id)a4 error:(id *)a5
{
  __CFString *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __CFString *v19;
  NSObject *v20;
  const __CFString *v21;
  const __CFString *v22;
  id v24;
  id v25;
  uint8_t buf[4];
  const __CFString *v27;
  __int16 v28;
  __CFString *v29;
  __int16 v30;
  const __CFString *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = (__CFString *)a3;
  +[PHPhotoLibrary enableMultiLibraryMode](PHPhotoLibrary, "enableMultiLibraryMode");
  PLPhotoKitGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v7;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_DEFAULT, "Delete library request initiated for library %@", buf, 0xCu);
  }

  -[__CFString librarySearchCriteria](v7, "librarySearchCriteria");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  -[PHPhotoLibraryManager _findPhotoLibraryIdentifiersMatchingSearchCriteria:error:](self, "_findPhotoLibraryIdentifiersMatchingSearchCriteria:error:", v9, &v25);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v25;
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v10, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      -[PHPhotoLibraryManager assetsdClient](self, "assetsdClient");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "libraryManagementClient");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v13, "libraryURL");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = 0;
      v17 = objc_msgSend(v15, "closeAndDeletePhotoLibraryAtURL:error:", v16, &v24);
      v18 = v24;

      v19 = 0;
      if ((v17 & 1) == 0)
      {
        PHPublicErrorFromError(v18);
        v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3201, 0);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v17 = 0;
    }

  }
  else
  {
    PHPublicErrorFromError(v11);
    v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
  }
  PLPhotoKitGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    v21 = CFSTR("failed");
    if (v17)
      v21 = CFSTR("succeeded");
    *(_DWORD *)buf = 138543874;
    v27 = v21;
    v22 = &stru_1E35DFFF8;
    v28 = 2112;
    v29 = v7;
    if (!v17)
      v22 = v19;
    v30 = 2112;
    v31 = v22;
    _os_log_impl(&dword_1991EC000, v20, OS_LOG_TYPE_ERROR, "Delete library request %{public}@ for library %@ %@", buf, 0x20u);
  }

  if (a5)
    *a5 = objc_retainAutorelease(v19);

  return v17;
}

- (NSDictionary)internalTestOptions
{
  return (NSDictionary *)objc_getProperty(self, a2, 16, 1);
}

- (void)setInternalTestOptions:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalTestOptions, 0);
  objc_storeStrong((id *)&self->_lazyAssetsdClient, 0);
}

void __72__PHPhotoLibraryManager_openPhotoLibraryWithIdentifier_options_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v9 = 0;
  objc_msgSend(v2, "openPhotoLibraryWithIdentifier:options:error:", v3, v4, &v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  if (v5)
  {
    v7 = v5;
    v8 = 0;
  }
  else
  {
    v7 = 0;
    v8 = v6;
  }
  (*(void (**)(_QWORD, void *, id))(a1[7] + 16))(a1[7], v7, v8);

}

PHPhotoLibraryIdentifier *__58__PHPhotoLibraryManager_findPhotoLibrariesInDomain_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  PHPhotoLibraryIdentifier *v3;

  v2 = a2;
  v3 = -[PHPhotoLibraryIdentifier initWithPLLibraryIdentifier:]([PHPhotoLibraryIdentifier alloc], "initWithPLLibraryIdentifier:", v2);

  return v3;
}

id __29__PHPhotoLibraryManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
    v3 = (void *)objc_msgSend(WeakRetained, "newAssetsdClient");
  else
    v3 = 0;

  return v3;
}

+ (BOOL)_createClientPhotoLibraryBundleURL:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  id v11;
  BOOL v12;
  char v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0CB3620]);
  objc_msgSend(v5, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

  if (v8)
  {
    v9 = (void *)MEMORY[0x1E0CB35C8];
    v20 = *MEMORY[0x1E0CB3308];
    v21[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, &v20, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 3107, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v19 = 0;
    v12 = 1;
    v13 = objc_msgSend(v6, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v19);
    v11 = v19;
    if ((v13 & 1) != 0)
      goto LABEL_9;
    PLUnderlyingErrorThatHasDomainAndCode();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(v5, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByDeletingLastPathComponent");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, *MEMORY[0x1E0CB2AA0]);

      objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("You do not have permission to write to the selected folder"), *MEMORY[0x1E0CB2D68]);
      objc_msgSend(v14, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0CB3388]);
      objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), 5404, v14);
      v17 = objc_claimAutoreleasedReturnValue();

      v11 = (id)v17;
    }
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
LABEL_9:

  return v12;
}

@end
