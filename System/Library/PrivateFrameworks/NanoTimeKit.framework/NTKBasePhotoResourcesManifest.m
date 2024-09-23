@implementation NTKBasePhotoResourcesManifest

+ (id)manifestForResourceDirectory:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;

  v4 = a3;
  if (v4
    && (objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v4),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    -[NSObject URLByAppendingPathComponent:](v5, "URLByAppendingPathComponent:", CFSTR("Images.plist"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithResourceDirectoryURL:", v6);
    if ((objc_msgSend(v8, "_loadRawManifestAtURL:", v7) & 1) != 0)
    {
      v9 = v8;
    }
    else
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        +[NTKBasePhotoResourcesManifest manifestForResourceDirectory:].cold.2();

      v9 = 0;
    }

  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[NTKBasePhotoResourcesManifest manifestForResourceDirectory:].cold.1(v6);
    v9 = 0;
  }

  return v9;
}

- (id)_initWithResourceDirectoryURL:(id)a3
{
  id v4;
  NTKBasePhotoResourcesManifest *v5;
  uint64_t v6;
  NSURL *resourceDirectoryURL;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NTKBasePhotoResourcesManifest;
  v5 = -[NTKBasePhotoResourcesManifest init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    resourceDirectoryURL = v5->_resourceDirectoryURL;
    v5->_resourceDirectoryURL = (NSURL *)v6;

  }
  return v5;
}

- (BOOL)_loadRawManifestAtURL:(id)a3
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  BOOL v8;
  NSObject *v9;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (!v4)
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[NTKBasePhotoResourcesManifest _loadRawManifestAtURL:].cold.2((uint64_t)self);
      v8 = 0;
      goto LABEL_21;
    }
    -[NSObject objectForKeyedSubscript:](v4, "objectForKeyedSubscript:", CFSTR("version"));
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      self->_version = -[NSObject unsignedIntegerValue](v6, "unsignedIntegerValue");
      -[NSObject objectForKeyedSubscript:](v5, "objectForKeyedSubscript:", CFSTR("imageList"));
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_storeStrong((id *)&self->_imageList, v7);
          v8 = -[NTKBasePhotoResourcesManifest didLoadRawManifest:](self, "didLoadRawManifest:", v5);
LABEL_20:

LABEL_21:
          goto LABEL_22;
        }
      }
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[NTKBasePhotoResourcesManifest _loadRawManifestAtURL:].cold.4();

    }
    else
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[NTKBasePhotoResourcesManifest _loadRawManifestAtURL:].cold.3();
    }
    v8 = 0;
    goto LABEL_20;
  }
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    -[NTKBasePhotoResourcesManifest _loadRawManifestAtURL:].cold.1((uint64_t)self);
  v8 = 0;
LABEL_22:

  return v8;
}

- (BOOL)_validateImageListItem:(id)a3 withError:(id *)a4
{
  id v6;
  BOOL v7;
  NSObject *v8;

  v6 = a3;
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v7 = -[NTKBasePhotoResourcesManifest validateImageListItem:withError:](self, "validateImageListItem:withError:", v6, a4);
  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[NTKBasePhotoResourcesManifest _validateImageListItem:withError:].cold.1((uint64_t)self);

    v7 = 0;
  }

  return v7;
}

- (BOOL)validateManifestWithError:(id *)a3
{
  unint64_t version;
  unint64_t v6;
  NSObject *v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  BOOL v11;
  unint64_t v12;
  NSObject *v13;
  NSObject *v14;
  NSArray *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  version = self->_version;
  if (version < -[NTKBasePhotoResourcesManifest minCompatibleVersion](self, "minCompatibleVersion")
    || (v6 = self->_version, v6 > -[NTKBasePhotoResourcesManifest maxCompatibleVersion](self, "maxCompatibleVersion")))
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[NTKBasePhotoResourcesManifest validateManifestWithError:].cold.1();

    if (a3)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("com.apple.nanotimekit.resourceDirectory");
      v10 = 2004;
LABEL_7:
      objc_msgSend(v8, "errorWithDomain:code:userInfo:", v9, v10, 0);
      v11 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return v11;
    }
    return 0;
  }
  if (!-[NSArray count](self->_imageList, "count"))
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[NTKBasePhotoResourcesManifest validateManifestWithError:].cold.2((uint64_t)self);

    if (a3)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("com.apple.nanotimekit.photos");
      v10 = 1006;
      goto LABEL_7;
    }
    return 0;
  }
  v12 = -[NSArray count](self->_imageList, "count");
  if (v12 > -[NTKBasePhotoResourcesManifest maxNumberOfPhotos](self, "maxNumberOfPhotos"))
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[NTKBasePhotoResourcesManifest validateManifestWithError:].cold.3();

    if (a3)
    {
      v8 = (void *)MEMORY[0x1E0CB35C8];
      v9 = CFSTR("com.apple.nanotimekit.photos");
      v10 = 1007;
      goto LABEL_7;
    }
    return 0;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = self->_imageList;
  v17 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v22 != v19)
          objc_enumerationMutation(v16);
        if (!-[NTKBasePhotoResourcesManifest _validateImageListItem:withError:](self, "_validateImageListItem:withError:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i), a3, (_QWORD)v21))
        {
          if (a3)
          {
            objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.nanotimekit.resourceDirectory"), 2003, 0);
            v11 = 0;
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v11 = 0;
          }
          goto LABEL_32;
        }
      }
      v18 = -[NSArray countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v18)
        continue;
      break;
    }
  }
  v11 = 1;
LABEL_32:

  return v11;
}

- (BOOL)resourceWithName:(id)a3 isValidMediaAssetOfType:(id)a4 withMinFileSize:(unint64_t)a5 maxFileSize:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  void *v15;
  void *v16;
  char v17;
  NSURL **p_resourceDirectoryURL;
  NSURL *resourceDirectoryURL;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  BOOL v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint8_t buf[4];
  void *v39;
  __int16 v40;
  uint64_t v41;
  __int16 v42;
  void *v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((objc_msgSend(v10, "hasPrefix:", CFSTR("~")) & 1) == 0
    && (objc_msgSend(v10, "hasPrefix:", CFSTR(".")) & 1) == 0
    && !objc_msgSend(v10, "containsString:", CFSTR("/")))
  {
    objc_msgSend(v10, "pathExtension");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "lowercaseString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v11, "containsObject:", v16);

    if ((v17 & 1) == 0)
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[NTKBasePhotoResourcesManifest resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:].cold.3();
      goto LABEL_6;
    }
    resourceDirectoryURL = self->_resourceDirectoryURL;
    p_resourceDirectoryURL = &self->_resourceDirectoryURL;
    -[NSURL URLByAppendingPathComponent:isDirectory:](resourceDirectoryURL, "URLByAppendingPathComponent:isDirectory:", v10, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "URLByResolvingSymlinksInPath");
    v12 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v12, "path");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "attributesOfItemAtPath:error:", v22, 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[NTKBasePhotoResourcesManifest resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:].cold.2();
      goto LABEL_22;
    }
    v24 = *MEMORY[0x1E0CB2B18];
    objc_msgSend(v23, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B18]);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!v25)
      goto LABEL_12;
    v26 = (void *)v25;
    objc_msgSend(v23, "objectForKeyedSubscript:", v24);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v24;
    v28 = v23;
    v29 = (void *)*MEMORY[0x1E0CB2B28];

    v30 = v27 == v29;
    v23 = v28;
    v24 = v37;
    if (v30)
    {
      if (objc_msgSend(v23, "fileSize") >= a5 && objc_msgSend(v23, "fileSize") <= a6)
      {
        v13 = 1;
        goto LABEL_23;
      }
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        -[NSURL lastPathComponent](*p_resourceDirectoryURL, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v23, "fileSize");
        -[NSObject path](v12, "path");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v39 = v32;
        v40 = 2048;
        v41 = v35;
        v42 = 2112;
        v43 = v36;
        _os_log_error_impl(&dword_1B72A3000, v31, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: unexpected file size %lu at path '%@'", buf, 0x20u);

        goto LABEL_14;
      }
    }
    else
    {
LABEL_12:
      _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        -[NSURL lastPathComponent](*p_resourceDirectoryURL, "lastPathComponent");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "objectForKeyedSubscript:", v24);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject path](v12, "path");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v39 = v32;
        v40 = 2112;
        v41 = (uint64_t)v33;
        v42 = 2112;
        v43 = v34;
        _os_log_error_impl(&dword_1B72A3000, v31, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: unexpected file type '%@' for asset at path: '%@'", buf, 0x20u);

LABEL_14:
      }
    }
LABEL_22:

    v13 = 0;
LABEL_23:

    goto LABEL_7;
  }
  _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    -[NTKBasePhotoResourcesManifest resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:].cold.1();
LABEL_6:
  v13 = 0;
LABEL_7:

  return v13;
}

- (BOOL)resourceWithNameIsValidImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  NSObject *v12;
  BOOL v13;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;
  CGSize v25;

  v24 = *MEMORY[0x1E0C80C00];
  -[NSURL URLByAppendingPathComponent:isDirectory:](self->_resourceDirectoryURL, "URLByAppendingPathComponent:isDirectory:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "imageWithContentsOfFile:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "size");
  if (v8 >= 1.0
    && (objc_msgSend(v7, "size"), v9 >= 1.0)
    && (objc_msgSend(v7, "size"), v10 <= 4096.0)
    && (objc_msgSend(v7, "size"), v11 <= 4096.0))
  {
    v13 = 1;
  }
  else
  {
    _NTKLoggingObjectForDomain(6, (uint64_t)"NTKLoggingDomainPhoto");
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      -[NSURL lastPathComponent](self->_resourceDirectoryURL, "lastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "size");
      NSStringFromCGSize(v25);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "path");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412802;
      v19 = v15;
      v20 = 2112;
      v21 = v16;
      v22 = 2112;
      v23 = v17;
      _os_log_error_impl(&dword_1B72A3000, v12, OS_LOG_TYPE_ERROR, "[SANITIZER:%@]: unexpected image dimensions '%@' at path '%@'", (uint8_t *)&v18, 0x20u);

    }
    v13 = 0;
  }

  return v13;
}

- (BOOL)didLoadRawManifest:(id)a3
{
  return 1;
}

- (BOOL)validateImageListItem:(id)a3 withError:(id *)a4
{
  return 0;
}

- (unint64_t)minCompatibleVersion
{
  return 0;
}

- (unint64_t)maxCompatibleVersion
{
  return 0;
}

- (unint64_t)maxNumberOfPhotos
{
  return 0;
}

- (NSURL)resourceDirectoryURL
{
  return self->_resourceDirectoryURL;
}

- (NSArray)imageList
{
  return self->_imageList;
}

- (unint64_t)version
{
  return self->_version;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageList, 0);
  objc_storeStrong((id *)&self->_resourceDirectoryURL, 0);
}

+ (void)manifestForResourceDirectory:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B72A3000, log, OS_LOG_TYPE_ERROR, "[SANITIZER:nil]: Unable to load manifest, resource directory is nil.", v1, 2u);
}

+ (void)manifestForResourceDirectory:.cold.2()
{
  id v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  objc_msgSend(v0, "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "[SANITIZER:%@]: Failed to load manifest: %@.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)_loadRawManifestAtURL:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_4_1(a1), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1B72A3000, v2, v3, "[SANITIZER:%@]: manifest URL is nil.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)_loadRawManifestAtURL:(uint64_t)a1 .cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_4_1(a1), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1B72A3000, v2, v3, "[SANITIZER:%@]: unable to decode manifest.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)_loadRawManifestAtURL:.cold.3()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "[SANITIZER:%@]: invalid version: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)_loadRawManifestAtURL:.cold.4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  objc_msgSend(*(id *)(v0 + 8), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_7_0(&dword_1B72A3000, v2, v3, "[SANITIZER:%@]: unexpected value: '%@' for key: %@. ", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_9();
}

- (void)_validateImageListItem:(uint64_t)a1 withError:.cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_4_1(a1), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1B72A3000, v2, v3, "[SANITIZER:%@]: unexpected image list item data", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)validateManifestWithError:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "[SANITIZER:%@]: incompatible version: %lu.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)validateManifestWithError:(uint64_t)a1 .cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend((id)OUTLINED_FUNCTION_4_1(a1), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1B72A3000, v2, v3, "[SANITIZER:%@]: invalid manifest. Image list is empty.", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_4();
}

- (void)validateManifestWithError:.cold.3()
{
  id *v0;
  id *v1;
  id *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  OUTLINED_FUNCTION_11();
  v2 = v1;
  objc_msgSend(v1[1], "lastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*v0, "count");
  objc_msgSend(v2, "maxNumberOfPhotos");
  OUTLINED_FUNCTION_7_0(&dword_1B72A3000, v4, v5, "[SANITIZER:%@]: invalid manifest. Too many photos: %lu (expecting: %lu)", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_9();
}

- (void)resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:.cold.1()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "[SANITIZER:%@]: invalid filename '%@'", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

- (void)resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:.cold.2()
{
  void *v0;
  id *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  OUTLINED_FUNCTION_11();
  objc_msgSend(*v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v3, v4, "[SANITIZER:%@]: unable to open asset at path: '%@'", v5, v6, v7, v8, 2u);

  OUTLINED_FUNCTION_8();
}

- (void)resourceWithName:isValidMediaAssetOfType:withMinFileSize:maxFileSize:.cold.3()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  OUTLINED_FUNCTION_11();
  objc_msgSend((id)OUTLINED_FUNCTION_4_1(v0), "lastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_0_3(&dword_1B72A3000, v2, v3, "[SANITIZER:%@]: invalid extension '%@'", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_8();
}

@end
