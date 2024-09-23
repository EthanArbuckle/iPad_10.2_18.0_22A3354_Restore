@implementation PHExternalAssetResource

- (PHExternalAssetResource)initWithResourceType:(int64_t)a3
{
  PHExternalAssetResource *v5;
  PHExternalAssetResource *v6;
  void *v9;
  objc_super v10;

  if (!a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHExternalAssetResource.m"), 102, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("type"));

  }
  v10.receiver = self;
  v10.super_class = (Class)PHExternalAssetResource;
  v5 = -[PHExternalAssetResource init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_sandboxExtensionHandle = -1;
    v5->_resourceType = a3;
    v5->_cplResourceType = +[PHExternalAssetResource probableCPLResourceTypeFromAssetResourceType:](PHExternalAssetResource, "probableCPLResourceTypeFromAssetResourceType:", a3);
  }
  return v6;
}

- (PHExternalAssetResource)initWithPropertyListRepresentation:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  PHExternalAssetResource *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHAssetResourceCreationOptions *v13;
  NSObject *v14;
  const __CFString *v15;
  int v17;
  const __CFString *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = -[PHExternalAssetResource initWithResourceType:](self, "initWithResourceType:", v6);
  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("fileURL"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v8, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sandboxExtensionToken"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHExternalAssetResource _consumeSandboxExtension:](v7, "_consumeSandboxExtension:", v10);

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("data"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("creationOptions"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[PHAssetResourceCreationOptions initWithPropertyListRepresentation:]([PHAssetResourceCreationOptions alloc], "initWithPropertyListRepresentation:", v12);
    -[PHExternalAssetResource setFileURL:](v7, "setFileURL:", v9);
    -[PHExternalAssetResource setData:](v7, "setData:", v11);
    -[PHExternalAssetResource setCreationOptions:](v7, "setCreationOptions:", v13);
    if (v7->_sandboxExtensionHandle == -1 && !v7->_data)
    {
      PLPhotoKitGetLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = CFSTR("non-null");
        if (!v8)
          v15 = CFSTR("null");
        v17 = 138543618;
        v18 = v15;
        v19 = 2112;
        v20 = v8;
        _os_log_impl(&dword_1991EC000, v14, OS_LOG_TYPE_ERROR, "No sandbox extension and no data for %{public}@ filePath %@", (uint8_t *)&v17, 0x16u);
      }

    }
  }

  return v7;
}

- (PHExternalAssetResource)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHExternalAssetResource.m"), 136, CFSTR("Calling init on PHExternalAssetResource without additional arguments is invalid"));

  return -[PHExternalAssetResource initWithResourceType:](self, "initWithResourceType:", 1);
}

- (void)dealloc
{
  objc_super v3;

  -[PHExternalAssetResource _releaseSandboxExtension](self, "_releaseSandboxExtension");
  v3.receiver = self;
  v3.super_class = (Class)PHExternalAssetResource;
  -[PHExternalAssetResource dealloc](&v3, sel_dealloc);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHExternalAssetResource originalFilename](self, "originalFilename");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHExternalAssetResource uniformTypeIdentifier](self, "uniformTypeIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> filename: %@ uti: %@"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_issueSandboxExtension
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[NSURL path](self->_fileURL, "path");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v2, "length"))
  {
LABEL_9:
    v3 = 0;
    goto LABEL_10;
  }
  PLGetSandboxExtensionTokenIfPossible();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    PLPhotoKitGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(MEMORY[0x1E0D73208], "redactedDescriptionForPath:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412546;
      v10 = v2;
      v11 = 2114;
      v12 = v5;
      _os_log_impl(&dword_1991EC000, v4, OS_LOG_TYPE_INFO, "PHExternalAssetResource: fallback to readonly sandbox extension for %@ (%{public}@)", (uint8_t *)&v9, 0x16u);

    }
    PLGetSandboxExtensionToken();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      PLPhotoKitGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(MEMORY[0x1E0D73208], "redactedDescriptionForPath:", v2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v2;
        v11 = 2114;
        v12 = v7;
        _os_log_impl(&dword_1991EC000, v6, OS_LOG_TYPE_ERROR, "PHExternalAssetResource: Unable to issue sandbox extension for %@ (%{public}@)", (uint8_t *)&v9, 0x16u);

      }
      goto LABEL_9;
    }
  }
LABEL_10:

  return v3;
}

- (void)_consumeSandboxExtension:(id)a3
{
  id v5;
  int64_t v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  void *v10;
  uint8_t buf[2];
  __int16 v12;

  v5 = a3;
  if (objc_msgSend(v5, "length"))
  {
    if (self->_sandboxExtensionHandle != -1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PHExternalAssetResource.m"), 167, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("_sandboxExtensionHandle == -1"));

    }
    if (!objc_msgSend(objc_retainAutorelease(v5), "UTF8String"))
    {
      PLPhotoKitGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        v8 = "Unable to get UTF8String from sandbox extension token";
        v9 = buf;
        goto LABEL_10;
      }
LABEL_11:

      goto LABEL_12;
    }
    v6 = sandbox_extension_consume();
    self->_sandboxExtensionHandle = v6;
    if (v6 == -1)
    {
      PLPhotoKitGetLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
        v12 = 0;
        v8 = "Unable to consume sandbox extension";
        v9 = (uint8_t *)&v12;
LABEL_10:
        _os_log_impl(&dword_1991EC000, v7, OS_LOG_TYPE_FAULT, v8, v9, 2u);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }
LABEL_12:

}

- (void)_releaseSandboxExtension
{
  if ((self->_sandboxExtensionHandle & 0x8000000000000000) == 0)
  {
    sandbox_extension_release();
    self->_sandboxExtensionHandle = -1;
  }
}

- (id)propertyListRepresentation
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PHExternalAssetResource fileURL](self, "fileURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, CFSTR("fileURL"));

  -[PHExternalAssetResource _issueSandboxExtension](self, "_issueSandboxExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("sandboxExtensionToken"));

  objc_msgSend(v3, "setObject:forKeyedSubscript:", self->_data, CFSTR("data"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_resourceType);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v7, CFSTR("type"));

  -[PHAssetResourceCreationOptions propertyListRepresentation](self->_creationOptions, "propertyListRepresentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v8, CFSTR("creationOptions"));

  return v3;
}

- (BOOL)duplicateAllowsReadAccess
{
  return self->_duplicateAllowsReadAccess;
}

- (void)_setDuplicateAllowsReadAccess:(BOOL)a3
{
  self->_duplicateAllowsReadAccess = a3;
}

- (NSString)originalFilename
{
  return -[PHAssetResourceCreationOptions originalFilename](self->_creationOptions, "originalFilename");
}

- (NSString)uniformTypeIdentifier
{
  return -[PHAssetResourceCreationOptions uniformTypeIdentifier](self->_creationOptions, "uniformTypeIdentifier");
}

- (int64_t)type
{
  return self->_resourceType;
}

- (PHAssetResourceCreationOptions)creationOptions
{
  return self->_creationOptions;
}

- (void)setCreationOptions:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)cplResourceType
{
  return self->_cplResourceType;
}

- (NSData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_storeStrong((id *)&self->_data, a3);
}

- (BOOL)isLibraryAssetResource
{
  return self->_isLibraryAssetResource;
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)pixelWidth
{
  return self->_pixelWidth;
}

- (void)setPixelWidth:(int64_t)a3
{
  self->_pixelWidth = a3;
}

- (int64_t)pixelHeight
{
  return self->_pixelHeight;
}

- (void)setPixelHeight:(int64_t)a3
{
  self->_pixelHeight = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_creationOptions, 0);
}

+ (unint64_t)probableCPLResourceTypeFromAssetResourceType:(int64_t)a3
{
  unint64_t result;
  unint64_t v4;

  result = 0;
  switch(a3)
  {
    case 1:
    case 2:
    case 3:
    case 19:
      result = 1;
      break;
    case 4:
      result = 17;
      break;
    case 5:
      result = 2;
      break;
    case 6:
      result = 16;
      break;
    case 7:
    case 17:
    case 18:
      return result;
    case 8:
      result = 15;
      break;
    case 9:
      result = 18;
      break;
    case 10:
      result = 19;
      break;
    case 11:
      result = 20;
      break;
    case 12:
      result = 25;
      break;
    case 13:
    case 14:
      result = 23;
      break;
    case 15:
      result = 24;
      break;
    case 16:
      result = 22;
      break;
    default:
      v4 = 14;
      if (a3 != 110)
        v4 = 0;
      if (a3 == 108)
        result = 13;
      else
        result = v4;
      break;
  }
  return result;
}

+ (id)assetResourceForDuplicatingAssetResource:(id)a3 asData:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;

  v6 = a4;
  v8 = a3;
  objc_msgSend(a1, "assetResourceForDuplicatingAssetResource:newResourceType:asData:error:", v8, objc_msgSend(v8, "type"), v6, a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)assetResourceForDuplicatingAssetResource:(id)a3 newResourceType:(int64_t)a4 asData:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  PHAssetResourceCreationOptions *v25;
  void *v27;
  id v28;

  v7 = a5;
  v11 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PHExternalAssetResource.m"), 204, CFSTR("External resources invalid for duplication"));

  }
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithResourceType:", a4);
  objc_msgSend(v11, "privateFileURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (!v7)
  {
    objc_msgSend(v13, "path");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17
      && (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
          v18 = (void *)objc_claimAutoreleasedReturnValue(),
          v19 = objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v17, 0),
          v18,
          v19))
    {
      objc_msgSend(v12, "setFileURL:", v14);
    }
    else
    {

      if (a6)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "ph_errorWithCode:localizedDescription:", 3303, CFSTR("Missing required asset resource file '%@'"), v17);
        v12 = 0;
        *a6 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
    }

    if (!v12)
      goto LABEL_21;
LABEL_18:
    objc_msgSend(v12, "_setDuplicateAllowsReadAccess:", 1);
    objc_msgSend(v11, "originalFilename");
    v23 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "uniformTypeIdentifier");
    v24 = objc_claimAutoreleasedReturnValue();
    if (v23 | v24)
    {
      v25 = objc_alloc_init(PHAssetResourceCreationOptions);
      -[PHAssetResourceCreationOptions setOriginalFilename:](v25, "setOriginalFilename:", v23);
      -[PHAssetResourceCreationOptions setUniformTypeIdentifier:](v25, "setUniformTypeIdentifier:", v24);
      objc_msgSend(v12, "setCreationOptions:", v25);

    }
    goto LABEL_21;
  }
  v28 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfURL:options:error:", v13, 1, &v28);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v28;
  if (v15)
  {
    objc_msgSend(v12, "setData:", v15);
  }
  else
  {

    if (a6)
    {
      v20 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(v14, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "description");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "ph_errorWithCode:localizedDescription:", 3302, CFSTR("Failed to read asset resource file '%@' %@"), v21, v22);
      *a6 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = 0;
  }

  if (v12)
    goto LABEL_18;
LABEL_21:

  return v12;
}

@end
