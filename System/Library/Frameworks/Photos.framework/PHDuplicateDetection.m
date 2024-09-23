@implementation PHDuplicateDetection

+ (BOOL)assetsArePendingForDuplicateMergeProcessing:(id)a3 inPhotoLibrary:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a4)
    return objc_msgSend(a4, "assetsArePendingForDuplicateMergeProcessingWithLocalIdentifiers:", a3);
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2938];
  v12[0] = CFSTR("invalid photolibrary");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PLBackendGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_1991EC000, v8, OS_LOG_TYPE_ERROR, "Duplicate Merge check failed with missing photolibrary. Error: %@", (uint8_t *)&v9, 0xCu);
  }

  return 0;
}

+ (void)mergeDuplicateAssetWithLocalIdentifierGroupingContainer:(id)a3 inPhotoLibrary:(id)a4 completionHandler:(id)a5
{
  void (**v7)(id, _QWORD, void *);
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD, void *))a5;
  if (a4)
  {
    objc_msgSend(a4, "mergeDuplicateAssetsWithLocalIdentifierGroupingContainer:completionHandler:", a3, v7);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0CB35C8];
    v14 = *MEMORY[0x1E0CB2938];
    v15[0] = CFSTR("invalid photolibrary");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "errorWithDomain:code:userInfo:", CFSTR("PHPhotosErrorDomain"), -1, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = v10;
      _os_log_impl(&dword_1991EC000, v11, OS_LOG_TYPE_ERROR, "Duplicate Merge processing failed with missing photolibrary. Error: %@", (uint8_t *)&v12, 0xCu);
    }

    if (v7)
      v7[2](v7, 0, v10);

  }
}

@end
