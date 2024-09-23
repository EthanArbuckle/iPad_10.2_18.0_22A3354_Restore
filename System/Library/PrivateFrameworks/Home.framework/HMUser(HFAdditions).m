@implementation HMUser(HFAdditions)

- (uint64_t)hf_isImportingPhotosLibraryEnabledForFaceRecognition
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photosPersonManagerSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isImportingFromPhotoLibraryEnabled");
  }
  else
  {
    HFLogForCategory(0x13uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = a1;
      v10 = 2080;
      v11 = "-[HMUser(HFAdditions) hf_isImportingPhotosLibraryEnabledForFaceRecognition]";
      v12 = 2112;
      v13 = v7;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "%@ (%s): externalPersonManagerSettings is nil for user %@", (uint8_t *)&v8, 0x20u);

    }
    v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_isSharingPhotosLibraryEnabledForFaceRecognition
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "photosPersonManagerSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "isSharingFaceClassificationsEnabled");
  }
  else
  {
    HFLogForCategory(0x13uLL);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(a1, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138412802;
      v9 = a1;
      v10 = 2080;
      v11 = "-[HMUser(HFAdditions) hf_isSharingPhotosLibraryEnabledForFaceRecognition]";
      v12 = 2112;
      v13 = v7;
      _os_log_error_impl(&dword_1DD34E000, v5, OS_LOG_TYPE_ERROR, "%@ (%s): externalPersonManagerSettings is nil for user %@", (uint8_t *)&v8, 0x20u);

    }
    v4 = 0;
  }

  return v4;
}

- (uint64_t)hf_getPhotosLibrarySettingsStatus
{
  void *v2;
  int v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "personManagerSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isImportingFromPhotoLibraryEnabled");

  objc_msgSend(a1, "personManagerSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v2) = objc_msgSend(v4, "isSharingFaceClassificationsEnabled");

  v5 = 2;
  if ((_DWORD)v2)
    v5 = 3;
  if (v3)
    return v5;
  else
    return 1;
}

@end
