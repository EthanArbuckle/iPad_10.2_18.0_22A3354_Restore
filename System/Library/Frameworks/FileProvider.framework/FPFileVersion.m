@implementation FPFileVersion

- (FPFileVersion)initWithVersion:(id)a3 displayName:(id)a4 originalURL:(id)a5 physicalURL:(id)a6 identifier:(id)a7 modificationDate:(id)a8 lastEditorNameComponents:(id)a9 size:(id)a10
{
  id v17;
  id v18;
  FPFileVersion *v19;
  FPFileVersion *v20;
  void *v21;
  NSURL *originalURL;
  uint64_t v23;
  id v24;
  GSAdditionStoring *storage;
  void *v26;
  uint64_t v27;
  NSURL *url;
  void *v29;
  FPFileVersion *v30;
  NSObject *v31;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  objc_super v40;

  v38 = a3;
  v37 = a4;
  v36 = a5;
  v35 = a6;
  v34 = a7;
  v33 = a8;
  v17 = a9;
  v18 = a10;
  v40.receiver = self;
  v40.super_class = (Class)FPFileVersion;
  v19 = -[FPFileVersion init](&v40, sel_init);
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_version, a3);
    objc_storeStrong((id *)&v20->_displayName, a4);
    objc_storeStrong((id *)&v20->_originalURL, a5);
    objc_storeStrong((id *)&v20->_wrapper, a6);
    objc_storeStrong((id *)&v20->_fpItemIdentifier, a7);
    objc_storeStrong((id *)&v20->_modificationDate, a8);
    objc_storeStrong((id *)&v20->_lastEditorNameComponents, a9);
    v20->_size = objc_msgSend(v18, "unsignedIntValue");
    objc_msgSend(MEMORY[0x1E0D25D48], "manager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    originalURL = v20->_originalURL;
    v39 = 0;
    objc_msgSend(v21, "permanentStorageForItemAtURL:allocateIfNone:error:", originalURL, 1, &v39);
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = v39;
    storage = v20->_storage;
    v20->_storage = (GSAdditionStoring *)v23;

    if (v20->_storage)
    {
      objc_msgSend((id)objc_opt_class(), "gsNamespace");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[FPFileVersion fetchGSURLForNamespace:](v20, "fetchGSURLForNamespace:", v26);
      v27 = objc_claimAutoreleasedReturnValue();
      url = v20->_url;
      v20->_url = (NSURL *)v27;

      if (v20->_url)
      {
        -[FPFileVersion physicalURL](v20, "physicalURL");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        if (v29)
        {
          -[FPFileVersion physicalURL](v20, "physicalURL");
          _CFURLPromiseSetPhysicalURL();
        }
        -[FPFileVersion registerThumbnailNotification](v20, "registerThumbnailNotification");
        -[FPFileVersion checkThumbnailChanged](v20, "checkThumbnailChanged");

        goto LABEL_7;
      }
    }
    else
    {
      fp_current_or_default_log();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        -[FPFileVersion initWithVersion:displayName:originalURL:physicalURL:identifier:modificationDate:lastEditorNameComponents:size:].cold.1((uint64_t)&v20->_originalURL, v24);

    }
    v30 = 0;
    goto LABEL_12;
  }
LABEL_7:
  v30 = v20;
LABEL_12:

  return v30;
}

- (void)dealloc
{
  FPFileVersion *v2;
  int notifyToken;
  objc_super v4;

  v2 = self;
  objc_sync_enter(v2);
  notifyToken = v2->_notifyToken;
  if (notifyToken != -1)
    notify_cancel(notifyToken);
  objc_sync_exit(v2);

  v4.receiver = v2;
  v4.super_class = (Class)FPFileVersion;
  -[FPFileVersion dealloc](&v4, sel_dealloc);
}

- (void)checkThumbnailChanged
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  FPFileVersion *v8;
  int notifyToken;

  -[FPSandboxingURLWrapper url](self->_wrapper, "url");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "startAccessingSecurityScopedResource");

  -[FPSandboxingURLWrapper url](self->_wrapper, "url");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fp_hasThumbnailOnImmutableDocument");

  if (v4)
  {
    -[FPSandboxingURLWrapper url](self->_wrapper, "url");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stopAccessingSecurityScopedResource");

  }
  v8 = self;
  objc_sync_enter(v8);
  if ((_DWORD)v6)
  {
    notifyToken = v8->_notifyToken;
    if (notifyToken != -1)
      notify_cancel(notifyToken);
  }
  objc_sync_exit(v8);

  -[FPFileVersion setHasThumbnail:](v8, "setHasThumbnail:", v6);
}

- (void)registerThumbnailNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  const char *v8;
  NSObject *v9;
  _QWORD handler[4];
  id v11;
  id location;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[NSURL path](self->_url, "path");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("com.apple.fileprovider.thumbnail-available.%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fp_libnotifyPerUserNotificationName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (registerThumbnailNotification_onceToken != -1)
    dispatch_once(&registerThumbnailNotification_onceToken, &__block_literal_global_13);
  location = 0;
  objc_initWeak(&location, self);
  v7 = objc_retainAutorelease(v6);
  v8 = (const char *)objc_msgSend(v7, "UTF8String");
  v9 = registerThumbnailNotification_thumbnailQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __46__FPFileVersion_registerThumbnailNotification__block_invoke_2;
  handler[3] = &unk_1E4449998;
  objc_copyWeak(&v11, &location);
  notify_register_dispatch(v8, &self->_notifyToken, v9, handler);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __46__FPFileVersion_registerThumbnailNotification__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.fileprovider.version.thumbnails", v2);
  v1 = (void *)registerThumbnailNotification_thumbnailQueue;
  registerThumbnailNotification_thumbnailQueue = (uint64_t)v0;

}

void __46__FPFileVersion_registerThumbnailNotification__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkThumbnailChanged");

}

- (NSString)lastEditorDeviceName
{
  return -[NSFileProviderItemVersion lastEditorDeviceName](self->_version, "lastEditorDeviceName");
}

- (NSString)lastEditorFormattedName
{
  NSPersonNameComponents *lastEditorNameComponents;
  void *v3;

  lastEditorNameComponents = self->_lastEditorNameComponents;
  if (lastEditorNameComponents)
  {
    objc_msgSend(MEMORY[0x1E0CB3858], "localizedStringFromPersonNameComponents:style:options:", lastEditorNameComponents, 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return (NSString *)v3;
}

- (FPFileVersion)initWithCoder:(id)a3
{
  id v4;
  FPFileVersion *v5;
  uint64_t v6;
  NSFileProviderItemVersion *version;
  uint64_t v8;
  NSString *displayName;
  uint64_t v10;
  NSURL *originalURL;
  uint64_t v12;
  FPSandboxingURLWrapper *wrapper;
  uint64_t v14;
  FPItemID *fpItemIdentifier;
  uint64_t v16;
  NSDate *modificationDate;
  uint64_t v18;
  NSPersonNameComponents *lastEditorNameComponents;
  void *v20;
  NSURL *v21;
  uint64_t v22;
  id v23;
  GSAdditionStoring *storage;
  uint64_t v25;
  NSURL *url;
  void *v27;
  FPFileVersion *v28;
  NSObject *v29;
  id v31;
  objc_super v32;

  v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)FPFileVersion;
  v5 = -[FPFileVersion init](&v32, sel_init);
  if (!v5)
  {
LABEL_6:
    v28 = v5;
    goto LABEL_10;
  }
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("version"));
  v6 = objc_claimAutoreleasedReturnValue();
  version = v5->_version;
  v5->_version = (NSFileProviderItemVersion *)v6;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("filename"));
  v8 = objc_claimAutoreleasedReturnValue();
  displayName = v5->_displayName;
  v5->_displayName = (NSString *)v8;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("url"));
  v10 = objc_claimAutoreleasedReturnValue();
  originalURL = v5->_originalURL;
  v5->_originalURL = (NSURL *)v10;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("physicalURL"));
  v12 = objc_claimAutoreleasedReturnValue();
  wrapper = v5->_wrapper;
  v5->_wrapper = (FPSandboxingURLWrapper *)v12;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("fpItemIdentifier"));
  v14 = objc_claimAutoreleasedReturnValue();
  fpItemIdentifier = v5->_fpItemIdentifier;
  v5->_fpItemIdentifier = (FPItemID *)v14;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("modificationDate"));
  v16 = objc_claimAutoreleasedReturnValue();
  modificationDate = v5->_modificationDate;
  v5->_modificationDate = (NSDate *)v16;

  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("lastEditorNameComponents"));
  v18 = objc_claimAutoreleasedReturnValue();
  lastEditorNameComponents = v5->_lastEditorNameComponents;
  v5->_lastEditorNameComponents = (NSPersonNameComponents *)v18;

  v5->_size = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("size"));
  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v5->_originalURL;
  v31 = 0;
  objc_msgSend(v20, "permanentStorageForItemAtURL:allocateIfNone:error:", v21, 1, &v31);
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = v31;
  storage = v5->_storage;
  v5->_storage = (GSAdditionStoring *)v22;

  if (v5->_storage)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("GSURL"));
    v25 = objc_claimAutoreleasedReturnValue();
    url = v5->_url;
    v5->_url = (NSURL *)v25;

    -[FPFileVersion physicalURL](v5, "physicalURL");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if (v27)
    {
      -[FPFileVersion physicalURL](v5, "physicalURL");
      _CFURLPromiseSetPhysicalURL();
      -[FPFileVersion registerThumbnailNotification](v5, "registerThumbnailNotification");
      -[FPFileVersion checkThumbnailChanged](v5, "checkThumbnailChanged");
    }

    goto LABEL_6;
  }
  fp_current_or_default_log();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    -[FPFileVersion initWithVersion:displayName:originalURL:physicalURL:identifier:modificationDate:lastEditorNameComponents:size:].cold.1((uint64_t)&v5->_originalURL, v23);

  v28 = 0;
LABEL_10:

  return v28;
}

- (void)encodeWithCoder:(id)a3
{
  NSFileProviderItemVersion *version;
  id v5;

  version = self->_version;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", version, CFSTR("version"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_displayName, CFSTR("filename"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_originalURL, CFSTR("url"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_fpItemIdentifier, CFSTR("fpItemIdentifier"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_modificationDate, CFSTR("modificationDate"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_lastEditorNameComponents, CFSTR("lastEditorNameComponents"));
  objc_msgSend(v5, "encodeInt64:forKey:", self->_size, CFSTR("size"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_wrapper, CFSTR("physicalURL"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_url, CFSTR("GSURL"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)etagForVersion:(id)a3 providerDomainID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  objc_class *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v6, "fp_toProviderID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProvider")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.CloudDocs.iCloudDriveFileProviderManaged")))
  {
    v16 = 0;
    v17 = &v16;
    v18 = 0x2050000000;
    v8 = (void *)getBRFieldContentSignatureClass_softClass;
    v19 = getBRFieldContentSignatureClass_softClass;
    if (!getBRFieldContentSignatureClass_softClass)
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __getBRFieldContentSignatureClass_block_invoke;
      v15[3] = &unk_1E444B188;
      v15[4] = &v16;
      __getBRFieldContentSignatureClass_block_invoke((uint64_t)v15);
      v8 = (void *)v17[3];
    }
    v9 = objc_retainAutorelease(v8);
    _Block_object_dispose(&v16, 8);
    v10 = [v9 alloc];
    objc_msgSend(v5, "contentVersion");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v10, "initWithData:", v11);

    objc_msgSend(v12, "etag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "etagHash");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v13;
}

- (NSString)etag
{
  NSFileProviderItemVersion *version;
  void *v3;
  void *v4;

  version = self->_version;
  -[FPItemID providerDomainID](self->_fpItemIdentifier, "providerDomainID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPFileVersion etagForVersion:providerDomainID:](FPFileVersion, "etagForVersion:providerDomainID:", version, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

+ (id)versionFaultName:(id)a3 identifier:(id)a4 ext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  objc_msgSend(v8, "providerDomainID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPFileVersion etagForVersion:providerDomainID:](FPFileVersion, "etagForVersion:providerDomainID:", v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v8, "domainIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringWithFormat:", CFSTR("%@_%@_%@.%@"), v13, v14, v11, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (NSCopying)persistentIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0D25D48], "manager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPFileVersion storage](self, "storage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL lastPathComponent](self->_url, "lastPathComponent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "gsNamespace");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistentIdentifierInStorage:forAdditionNamed:inNameSpace:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSCopying *)v7;
}

+ (id)storagePrefixForOriginalURL:(id)a3
{
  id v3;
  uint64_t v4;
  int v5;
  void *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v11;

  v3 = objc_retainAutorelease(a3);
  v4 = open((const char *)objc_msgSend(v3, "fileSystemRepresentation"), 0x200000);
  if ((v4 & 0x80000000) != 0)
  {
    fp_current_or_default_log();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      +[FPFileVersion storagePrefixForOriginalURL:].cold.1(v3, v7);
    v6 = 0;
  }
  else
  {
    v5 = v4;
    v11 = 0;
    objc_msgSend(MEMORY[0x1E0D25D40], "storagePrefixForFileDescriptor:error:", v4, &v11);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v11;
    close(v5);
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      fp_current_or_default_log();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        +[FPFileVersion storagePrefixForOriginalURL:].cold.2(v3, v7);

    }
  }

  return v6;
}

- (id)fetchGSURLForNamespace:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[FPFileVersion version](self, "version");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPFileVersion fpItemIdentifier](self, "fpItemIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPFileVersion originalURL](self, "originalURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pathExtension");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPFileVersion versionFaultName:identifier:ext:](FPFileVersion, "versionFaultName:identifier:ext:", v5, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPFileVersion originalURL](self, "originalURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[FPFileVersion storagePrefixForOriginalURL:](FPFileVersion, "storagePrefixForOriginalURL:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = (void *)MEMORY[0x1E0C99E98];
    v16[0] = v11;
    v16[1] = v4;
    v16[2] = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fileURLWithPathComponents:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (NSURL)physicalURL
{
  return -[FPSandboxingURLWrapper url](self->_wrapper, "url");
}

- (id)description
{
  NSString *displayName;
  void *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  unint64_t size;
  NSDate *modificationDate;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSURL *v14;
  NSURL *v15;
  uint64_t v17;
  void *v18;

  v18 = (void *)MEMORY[0x1E0CB37A0];
  v17 = objc_opt_class();
  displayName = self->_displayName;
  -[NSFileProviderItemVersion lastEditorDeviceName](self->_version, "lastEditorDeviceName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[FPFileVersion lastEditorFormattedName](self, "lastEditorFormattedName");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  if (v5)
    v7 = (const __CFString *)v5;
  else
    v7 = CFSTR("You");
  size = self->_size;
  modificationDate = self->_modificationDate;
  v10 = -[FPFileVersion hasThumbnail](self, "hasThumbnail");
  -[FPFileVersion etag](self, "etag");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSURL path](self->_url, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", CFSTR("<%@ name:'%@' device:'%@' owner:'%@' size:%llu mtime:%@ thumbnail:%d etag:%@ url:'%@'"), v17, displayName, v4, v7, size, modificationDate, v10, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[FPSandboxingURLWrapper url](self->_wrapper, "url");
  v14 = (NSURL *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14 && self->_url != v14)
    objc_msgSend(v13, "appendFormat:", CFSTR(" physical:'%@'"), v14);
  objc_msgSend(v13, "appendString:", CFSTR(">"));

  return v13;
}

+ (id)stripExtensionFromAddition:(id)a3
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a3, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "hasSuffix:", CFSTR(".")))
  {
    objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 1);
    v4 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v4;
  }
  return v3;
}

+ (id)parseInfoFromVersionURL:(id)a3 domainIdentifier:(id *)a4 fpItemIdentifier:(id *)a5 etag:(id *)a6
{
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  id v27;

  *a6 = 0;
  *a5 = 0;
  *a4 = 0;
  objc_msgSend(a3, "pathComponents");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfObject:", CFSTR(".DocumentRevisions-V100"));
  v11 = 0;
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = v10;
    v13 = objc_msgSend(v9, "indexOfObject:", CFSTR("PerUID"));
    v14 = 3;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
      v14 = 4;
    v15 = v14 + v12;
    v16 = v15 + 1;
    if (objc_msgSend(v9, "count") >= (unint64_t)(v15 + 1))
    {
      objc_msgSend(v9, "objectAtIndexedSubscript:", v15);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "count") >= (unint64_t)(v15 + 2)
        && (objc_msgSend((id)objc_opt_class(), "gsNamespace"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v11, "isEqualToString:", v17),
            v17,
            (v18 & 1) != 0))
      {
        objc_msgSend(v9, "objectAtIndexedSubscript:", v16);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        +[FPFileVersion stripExtensionFromAddition:](FPFileVersion, "stripExtensionFromAddition:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        v21 = objc_msgSend(v20, "rangeOfString:options:", CFSTR("_"), 4);
        if (v21 != 0x7FFFFFFFFFFFFFFFLL)
        {
          v22 = v21;
          v23 = objc_msgSend(v20, "rangeOfString:options:range:", CFSTR("_"), 4, 0, v21);
          if (v23 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v24 = v23;
            objc_msgSend(v20, "substringToIndex:", v23);
            *a4 = (id)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "substringToIndex:", v22);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "substringFromIndex:", v24 + 1);
            *a5 = (id)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v20, "substringFromIndex:", v22 + 1);
            *a6 = (id)objc_claimAutoreleasedReturnValue();
          }
        }
        v26 = v11;

      }
      else
      {
        v27 = v11;
      }

    }
    else
    {
      v11 = 0;
    }
  }

  return v11;
}

+ (id)parseEtag:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[FPFileVersion stripExtensionFromAddition:](FPFileVersion, "stripExtensionFromAddition:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "componentsSeparatedByString:", CFSTR("_"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v4, "count") >= 3)
  {
    objc_msgSend(v4, "objectAtIndexedSubscript:", objc_msgSend(v4, "count") - 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (NSString)gsNamespace
{
  return (NSString *)(id)*MEMORY[0x1E0D25D00];
}

- (NSURL)url
{
  return self->_url;
}

- (NSFileProviderItemVersion)version
{
  return self->_version;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (unint64_t)size
{
  return self->_size;
}

- (NSDate)modificationDate
{
  return self->_modificationDate;
}

- (NSPersonNameComponents)lastEditorNameComponents
{
  return self->_lastEditorNameComponents;
}

- (NSURL)originalURL
{
  return self->_originalURL;
}

- (FPItemID)fpItemIdentifier
{
  return self->_fpItemIdentifier;
}

- (BOOL)hasThumbnail
{
  return self->_hasThumbnail;
}

- (void)setHasThumbnail:(BOOL)a3
{
  self->_hasThumbnail = a3;
}

- (GSAdditionStoring)storage
{
  return self->_storage;
}

- (void)setStorage:(id)a3
{
  objc_storeStrong((id *)&self->_storage, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storage, 0);
  objc_storeStrong((id *)&self->_fpItemIdentifier, 0);
  objc_storeStrong((id *)&self->_originalURL, 0);
  objc_storeStrong((id *)&self->_lastEditorNameComponents, 0);
  objc_storeStrong((id *)&self->_modificationDate, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_wrapper, 0);
}

- (void)initWithVersion:(uint64_t)a1 displayName:(void *)a2 originalURL:physicalURL:identifier:modificationDate:lastEditorNameComponents:size:.cold.1(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a2, "fp_prettyDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v3, v4, "[ERROR] Failed to provide persistentIdentifier for URL %@. Error: %@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_7();
}

+ (void)storagePrefixForOriginalURL:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  int v5;
  void *v6;
  __int16 v7;
  int v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *__error();
  v5 = 138412546;
  v6 = v3;
  v7 = 1024;
  v8 = v4;
  _os_log_error_impl(&dword_1A0A34000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed to open original file %@. error: (%{errno}d)", (uint8_t *)&v5, 0x12u);

}

+ (void)storagePrefixForOriginalURL:(void *)a1 .cold.2(void *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "fp_shortDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "fp_prettyDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_2_1(&dword_1A0A34000, v5, v6, "[ERROR] Failed to provide URL to the Genstore for this version. URL: %@ error: %@", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_7();
}

@end
