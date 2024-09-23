@implementation NTKCompanionMemoriesEditor

- (id)_fetchSingleAsset
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc(MEMORY[0x1E0D515F8]);
  -[NTKCompanionResourceDirectoryEditor device](self, "device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "nrDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithCollectionTarget:device:", 3, v5);

  objc_msgSend(v6, "assetCollections");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "anyObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NTKCompanionSinglePHAssetEditor optionsForSingleAsset](self, "optionsForSingleAsset");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "fetchKeyAssetsInAssetCollection:options:", v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "localizedTitle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v11;
    _os_log_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_DEFAULT, "NTKCompanionMemoriesEditor: assetCollection %@, asset == %@", (uint8_t *)&v15, 0x16u);

  }
  return v11;
}

@end
