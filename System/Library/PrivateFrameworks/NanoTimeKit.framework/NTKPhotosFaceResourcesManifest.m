@implementation NTKPhotosFaceResourcesManifest

- (BOOL)didLoadRawManifest:(id)a3
{
  NSString *v4;
  NSString *assetCollectionIdentifier;
  NSObject *v7;

  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("assetCollection"));
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
  assetCollectionIdentifier = self->_assetCollectionIdentifier;
  self->_assetCollectionIdentifier = v4;

  if (!self->_assetCollectionIdentifier)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return 1;
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[NTKPhotosFaceResourcesManifest didLoadRawManifest:].cold.1(self, (uint64_t *)&self->_assetCollectionIdentifier, v7);

  return 0;
}

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
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  BOOL v20;
  NSObject *v21;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
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
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "lastPathComponent");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v24;
      v28 = 2112;
      v29 = v25;
      _os_log_error_impl(&dword_1B72A3000, v21, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid image list item identifier '%@'.", (uint8_t *)&v26, 0x16u);

    }
    goto LABEL_15;
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
    v26 = 138412546;
    v27 = v12;
    v28 = 2112;
    v29 = v13;
    _os_log_impl(&dword_1B72A3000, v10, OS_LOG_TYPE_DEFAULT, "[SANITIZER:%@]: validating image list item: %@", (uint8_t *)&v26, 0x16u);

  }
  if (!-[NTKPhotosFaceResourcesManifest _imageListItemContainsValidImage:](self, "_imageListItemContainsValidImage:", v5))goto LABEL_15;
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isIris"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "BOOLValue");

  if (v15)
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "lastPathComponent");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("localIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = 138412546;
      v27 = v18;
      v28 = 2112;
      v29 = v19;
      _os_log_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_DEFAULT, "[SANITIZER:%@]: image list item '%@' includes iris video.", (uint8_t *)&v26, 0x16u);

    }
    if (!-[NTKPhotosFaceResourcesManifest _imageListItemContainsValidIrisVideo:](self, "_imageListItemContainsValidIrisVideo:", v5))goto LABEL_15;
  }
  if (!-[NTKPhotosFaceResourcesManifest _imageListItemHasValidCropValues:](self, "_imageListItemHasValidCropValues:", v5))
  {
LABEL_15:
    v20 = 0;
    goto LABEL_16;
  }
  v20 = -[NTKPhotosFaceResourcesManifest _imageListItemHasValidAnalysisValues:](self, "_imageListItemHasValidAnalysisValues:", v5);
LABEL_16:

  return v20;
}

- (BOOL)_imageListItemContainsValidImage:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  void *v9;
  BOOL v10;
  NSObject *v11;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  const __CFString *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageURL"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageURL")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        isKindOfClass = objc_opt_isKindOfClass(),
        v7,
        v6,
        (isKindOfClass & 1) != 0))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NTKBasePhotoResourcesManifest resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:](self, "resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:", v9, &unk_1E6CA8BC0, 1000, 2000000))
    {
      v10 = -[NTKBasePhotoResourcesManifest resourceWithNameIsValidImage:](self, "resourceWithNameIsValidImage:", v9);
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "lastPathComponent");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("imageURL"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412802;
      v17 = v14;
      v18 = 2112;
      v19 = v15;
      v20 = 2112;
      v21 = CFSTR("imageURL");
      _os_log_error_impl(&dword_1B72A3000, v11, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid value: %@ for key: %@", (uint8_t *)&v16, 0x20u);

    }
    v10 = 0;
  }

  return v10;
}

- (BOOL)_imageListItemContainsValidIrisVideo:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __CFString *v25;
  BOOL v26;
  void *v28;
  void *v29;
  void *v30;
  double Seconds;
  uint64_t v32;
  void *v33;
  void *v34;
  char v35;
  uint64_t v36;
  void *v37;
  void *v38;
  char isKindOfClass;
  void *v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  const char *v51;
  CMTime time;
  uint8_t buf[4];
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  const __CFString *v58;
  __int16 v59;
  double v60;
  uint64_t v61;
  _QWORD v62[2];
  CGSize v63;

  v62[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisVideoURL"));
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisVideoURL")),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_opt_class(),
        v8 = objc_opt_isKindOfClass(),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisVideoURL"));
    v9 = objc_claimAutoreleasedReturnValue();
    if (-[NTKBasePhotoResourcesManifest resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:](self, "resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:", v9, &unk_1E6CA8BD8, 10000, 4000000))
    {
      -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "URLByAppendingPathComponent:isDirectory:", v9, 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)MEMORY[0x1E0C8B3C0];
      v61 = *MEMORY[0x1E0C8AD90];
      v62[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, &v61, 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "URLAssetWithURL:options:", v11, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "isPlayable") & 1) == 0)
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[NTKPhotosFaceResourcesManifest _imageListItemContainsValidIrisVideo:].cold.1(self, v11);
        goto LABEL_21;
      }
      objc_msgSend(v14, "tracksWithMediaType:", *MEMORY[0x1E0C8A808]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "firstObject");
      v16 = objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          -[NTKPhotosFaceResourcesManifest _imageListItemContainsValidIrisVideo:].cold.1(self, v11);
        goto LABEL_20;
      }
      -[NSObject naturalSize](v16, "naturalSize");
      if (v17 < 1.0
        || (-[NSObject naturalSize](v16, "naturalSize"), v18 < 1.0)
        || (-[NSObject naturalSize](v16, "naturalSize"), v19 > 1920.0)
        || (-[NSObject naturalSize](v16, "naturalSize"), v20 > 1920.0))
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "lastPathComponent");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject naturalSize](v16, "naturalSize");
          NSStringFromCGSize(v63);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "path");
          v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v54 = v23;
          v55 = 2112;
          v56 = v24;
          v57 = 2112;
          v58 = v25;
          _os_log_error_impl(&dword_1B72A3000, v21, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: unexpected iris video dimensions '%@' at path '%@'", buf, 0x20u);

        }
        goto LABEL_20;
      }
      if (v14)
        objc_msgSend(v14, "duration");
      else
        memset(&time, 0, sizeof(time));
      Seconds = CMTimeGetSeconds(&time);
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisDuration"));
      v32 = objc_claimAutoreleasedReturnValue();
      if (v32
        && (v33 = (void *)v32,
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisDuration")),
            v34 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_opt_class(),
            v35 = objc_opt_isKindOfClass(),
            v34,
            v33,
            (v35 & 1) != 0))
      {
        objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisStillDisplayTime"));
        v36 = objc_claimAutoreleasedReturnValue();
        if (v36)
        {
          v37 = (void *)v36;
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisStillDisplayTime"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

          if ((isKindOfClass & 1) != 0)
          {
            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisDuration"));
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "doubleValue");
            v42 = v41;

            objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisStillDisplayTime"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "doubleValue");
            v45 = v44;

            if (v42 <= 0.0 || v42 >= 10.0 || vabdd_f64(Seconds, v42) >= 0.100000001)
            {
              _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
              v21 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                goto LABEL_20;
              -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "lastPathComponent");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "path");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v54 = v49;
              v55 = 2112;
              v56 = v50;
              v57 = 2048;
              v58 = *(const __CFString **)&Seconds;
              v59 = 2048;
              v60 = v42;
              v51 = "[SANITIZER:%@]: iris video '%@' has unexpected duration. Actual: %f, encoded: %f";
            }
            else
            {
              if (v45 > 0.0 && v45 < Seconds)
              {
                v26 = 1;
                goto LABEL_22;
              }
              _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
              v21 = objc_claimAutoreleasedReturnValue();
              if (!os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
                goto LABEL_20;
              -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
              v46 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v46, "lastPathComponent");
              v49 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "path");
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v54 = v49;
              v55 = 2112;
              v56 = v50;
              v57 = 2048;
              v58 = *(const __CFString **)&v45;
              v59 = 2048;
              v60 = Seconds;
              v51 = "[SANITIZER:%@]: iris video '%@' has unexpected still dislplay time: %f. Actual Duration: %f";
            }
            _os_log_error_impl(&dword_1B72A3000, v21, OS_LOG_TYPE_ERROR, v51, buf, 0x2Au);

            goto LABEL_40;
          }
        }
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
LABEL_39:
          -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "lastPathComponent");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisDuration"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v54 = v47;
          v55 = 2112;
          v56 = v48;
          v57 = 2112;
          v58 = CFSTR("irisDuration");
          _os_log_error_impl(&dword_1B72A3000, v21, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid value: %@ for key: %@", buf, 0x20u);

LABEL_40:
        }
      }
      else
      {
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
          goto LABEL_39;
      }
LABEL_20:

LABEL_21:
      v26 = 0;
LABEL_22:

      goto LABEL_15;
    }
  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "lastPathComponent");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("irisVideoURL"));
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v54 = v29;
      v55 = 2112;
      v56 = v30;
      v57 = 2112;
      v58 = CFSTR("irisVideoURL");
      _os_log_error_impl(&dword_1B72A3000, v9, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid value: %@ for key: %@", buf, 0x20u);

    }
  }
  v26 = 0;
LABEL_15:

  return v26;
}

- (BOOL)_imageListItemHasValidCropValues:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 isKindOfClass;
  void *v12;
  float v13;
  float v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  BOOL v26;
  NSObject *v27;
  NSObject *v28;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NTKPhotosFaceResourcesManifest *v36;
  NSObject *obj;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _BYTE v46[128];
  _QWORD v47[4];
  uint8_t buf[4];
  void *v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  _BYTE v54[128];
  _QWORD v55[7];

  v36 = self;
  v55[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v55[0] = CFSTR("cropH");
  v55[1] = CFSTR("cropW");
  v55[2] = CFSTR("cropX");
  v55[3] = CFSTR("cropY");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v55, 4);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v43;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v8, v36);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          objc_msgSend(v3, "objectForKeyedSubscript:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();

        }
        else
        {
          isKindOfClass = 0;
        }

        objc_msgSend(v3, "objectForKeyedSubscript:", v8);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "floatValue");
        v14 = v13;

        if (((fabsf(v14) != INFINITY) & isKindOfClass) == 0)
        {
          _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            -[NTKBasePhotoResourcesManifest resourceDirectoryURL](v36, "resourceDirectoryURL");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "lastPathComponent");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "objectForKeyedSubscript:", v8);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v49 = v31;
            v50 = 2112;
            v51 = v32;
            v52 = 2112;
            v53 = v8;
            _os_log_error_impl(&dword_1B72A3000, v16, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid crop value: %@ for key: %@", buf, 0x20u);

          }
          v26 = 0;
          v15 = obj;
          v27 = obj;
          goto LABEL_30;
        }
      }
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v42, v54, 16);
      if (v5)
        continue;
      break;
    }
  }
  v15 = obj;

  v47[0] = CFSTR("originalCropH");
  v47[1] = CFSTR("originalCropW");
  v47[2] = CFSTR("originalCropX");
  v47[3] = CFSTR("originalCropY");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 4);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v39;
    while (2)
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v39 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v3, "objectForKeyedSubscript:", v21, v36);
        v22 = objc_claimAutoreleasedReturnValue();
        if (v22)
        {
          v23 = (void *)v22;
          objc_msgSend(v3, "objectForKeyedSubscript:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v25 = objc_opt_isKindOfClass();

          if ((v25 & 1) != 0)
            continue;
        }
        _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        {
          -[NTKBasePhotoResourcesManifest resourceDirectoryURL](v36, "resourceDirectoryURL");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "lastPathComponent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "objectForKeyedSubscript:", v21);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v49 = v34;
          v50 = 2112;
          v51 = v35;
          v52 = 2112;
          v53 = v21;
          _os_log_error_impl(&dword_1B72A3000, v28, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid crop value: %@ for key: %@", buf, 0x20u);

        }
        v26 = 0;
        goto LABEL_28;
      }
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
      v26 = 1;
      if (v18)
        continue;
      break;
    }
LABEL_28:
    v27 = v16;
    v15 = obj;
  }
  else
  {
    v26 = 1;
    v27 = v16;
  }
LABEL_30:

  return v26;
}

- (BOOL)_imageListItemHasValidAnalysisValues:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  BOOL v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  BOOL v21;
  BOOL v22;
  NSObject *v23;
  NSObject *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _QWORD v43[6];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];
  _QWORD v51[7];

  v51[4] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v51[0] = CFSTR("topAnalysis");
  v51[1] = CFSTR("bottomAnalysis");
  v51[2] = CFSTR("leftAnalysis");
  v51[3] = CFSTR("rightAnalysis");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 4);
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v39;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v39 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = +[NTKPhotoAnalysis isValidDictionary:](NTKPhotoAnalysis, "isValidDictionary:", v10);

        if (!v11)
        {
          _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
          v12 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "lastPathComponent");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "objectForKeyedSubscript:", v9);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v45 = v27;
            v46 = 2112;
            v47 = v28;
            v48 = 2112;
            v49 = v9;
            _os_log_error_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid analysis dictionary: %@ for key: %@", buf, 0x20u);

          }
          v22 = 0;
          v23 = v4;
          goto LABEL_27;
        }
      }
      v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      if (v6)
        continue;
      break;
    }
  }

  v43[0] = CFSTR("fastAnalysis");
  v43[1] = CFSTR("slowAnalysis");
  v43[2] = CFSTR("insideAnalysis");
  v43[3] = CFSTR("outsideAnalysis");
  v43[4] = CFSTR("upAnalysis");
  v43[5] = CFSTR("downAnalysis");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 6);
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v13 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
  if (v13)
  {
    v14 = v13;
    v32 = v4;
    v15 = *(_QWORD *)v35;
    while (2)
    {
      for (j = 0; j != v14; ++j)
      {
        if (*(_QWORD *)v35 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j);
        objc_msgSend(v3, "objectForKeyedSubscript:", v17, v32);
        v18 = objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v19 = (void *)v18;
          objc_msgSend(v3, "objectForKeyedSubscript:", v17);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = +[NTKPhotoAnalysis isValidDictionary:](NTKPhotoAnalysis, "isValidDictionary:", v20);

          if (!v21)
          {
            _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
            v24 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              -[NTKBasePhotoResourcesManifest resourceDirectoryURL](self, "resourceDirectoryURL");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "lastPathComponent");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v3, "objectForKeyedSubscript:", v17);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              v45 = v30;
              v46 = 2112;
              v47 = v31;
              v48 = 2112;
              v49 = v17;
              _os_log_error_impl(&dword_1B72A3000, v24, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: invalid analysis dictionary: %@ for key: %@", buf, 0x20u);

            }
            v22 = 0;
            goto LABEL_25;
          }
        }
      }
      v14 = -[NSObject countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      v22 = 1;
      if (v14)
        continue;
      break;
    }
LABEL_25:
    v23 = v12;
    v4 = v32;
  }
  else
  {
    v22 = 1;
    v23 = v12;
  }
LABEL_27:

  return v22;
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
  return 24;
}

- (NSString)assetCollectionIdentifier
{
  return self->_assetCollectionIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCollectionIdentifier, 0);
}

- (void)didLoadRawManifest:(NSObject *)a3 .cold.1(void *a1, uint64_t *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "resourceDirectoryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *a2;
  v8 = 138412802;
  v9 = v6;
  v10 = 2112;
  v11 = v7;
  v12 = 2112;
  v13 = CFSTR("assetCollection");
  _os_log_error_impl(&dword_1B72A3000, a3, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: unexpected value: '%@' for key: %@.", (uint8_t *)&v8, 0x20u);

}

- (void)_imageListItemContainsValidIrisVideo:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t v12;

  objc_msgSend(a1, "resourceDirectoryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastPathComponent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v6, v7, "[SANITIZER:%@]: invalid video asset at path '%@'", v8, v9, v10, v11, v12);

  OUTLINED_FUNCTION_8();
}

@end
