@implementation NTKKaleidoscopeResourcesManifest

- (BOOL)validateImageListItem:(id)a3 withError:(id *)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  char isKindOfClass;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  const __CFString *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6
    || (v7 = (void *)v6,
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localIdentifier")),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v8,
        v7,
        (isKindOfClass & 1) == 0))
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v21;
    v27 = 2112;
    v28 = v22;
    _os_log_error_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid image list item identifier: %@", (uint8_t *)&v25, 0x16u);

LABEL_13:
    goto LABEL_14;
  }
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412546;
    v26 = v12;
    v27 = 2112;
    v28 = v13;
    _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "[SANITIZER:%@]: validating image list item: %@", (uint8_t *)&v25, 0x16u);

  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("imageURL"));
  v14 = objc_claimAutoreleasedReturnValue();
  if (!v14
    || (v15 = (void *)v14,
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("imageURL")),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v17 = objc_opt_isKindOfClass(),
        v16,
        v15,
        (v17 & 1) == 0))
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v18 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      goto LABEL_14;
    -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("imageURL"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138412802;
    v26 = v21;
    v27 = 2112;
    v28 = v23;
    v29 = 2112;
    v30 = CFSTR("imageURL");
    _os_log_error_impl(&dword_1B72A3000, v18, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid value: %@ for key: %@", (uint8_t *)&v25, 0x20u);

    goto LABEL_13;
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("imageURL"));
  v18 = objc_claimAutoreleasedReturnValue();
  if (!-[NTKBasePhotoResourcesManifest resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:](self, "resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:", v18, &unk_1E6CA9BE0, 1000, 2000000))
  {
LABEL_14:
    v19 = 0;
    goto LABEL_15;
  }
  v19 = -[NTKBasePhotoResourcesManifest resourceWithNameIsValidImage:](self, "resourceWithNameIsValidImage:", v18);
LABEL_15:

  return v19;
}

- (unint64_t)minCompatibleVersion
{
  return 1;
}

- (unint64_t)maxCompatibleVersion
{
  return 1;
}

- (unint64_t)maxNumberOfPhotos
{
  return 1;
}

@end
