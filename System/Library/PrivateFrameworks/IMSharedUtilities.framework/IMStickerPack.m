@implementation IMStickerPack

- (IMStickerPack)initWithGUID:(id)a3 name:(id)a4 displayAssetURL:(id)a5 fileURL:(id)a6 appBundleIdentifier:(id)a7 appVersion:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  IMStickerPack *v20;
  uint64_t v21;
  NSString *GUID;
  NSMutableSet *v23;
  NSMutableSet *stickers;
  uint64_t v25;
  NSString *name;
  uint64_t v27;
  NSURL *displayAssetURL;
  uint64_t v29;
  NSURL *fileURL;
  uint64_t v31;
  NSString *appBundleIdentifier;
  uint64_t v33;
  NSString *appVersion;
  objc_super v36;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v36.receiver = self;
  v36.super_class = (Class)IMStickerPack;
  v20 = -[IMStickerPack init](&v36, sel_init);
  if (v20)
  {
    v21 = objc_msgSend(v14, "copy");
    GUID = v20->_GUID;
    v20->_GUID = (NSString *)v21;

    v23 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    stickers = v20->_stickers;
    v20->_stickers = v23;

    v25 = objc_msgSend(v15, "copy");
    name = v20->_name;
    v20->_name = (NSString *)v25;

    v27 = objc_msgSend(v16, "copy");
    displayAssetURL = v20->_displayAssetURL;
    v20->_displayAssetURL = (NSURL *)v27;

    v29 = objc_msgSend(v17, "copy");
    fileURL = v20->_fileURL;
    v20->_fileURL = (NSURL *)v29;

    v31 = objc_msgSend(v18, "copy");
    appBundleIdentifier = v20->_appBundleIdentifier;
    v20->_appBundleIdentifier = (NSString *)v31;

    v33 = objc_msgSend(v19, "copy");
    appVersion = v20->_appVersion;
    v20->_appVersion = (NSString *)v33;

  }
  return v20;
}

- (NSSet)stickers
{
  return (NSSet *)(id)-[NSMutableSet copy](self->_stickers, "copy");
}

- (void)addSticker:(id)a3
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3)
  {
    -[NSMutableSet addObject:](self->_stickers, "addObject:");
  }
  else
  {
    IMLogHandleForCategory("IMStickerPack");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_19E36CF8C(v3, v4, v5, v6, v7, v8, v9, v10);

  }
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  __CFString *v4;
  const __CFString *GUID;
  const __CFString *name;
  NSURL *displayAssetURL;
  NSURL *fileURL;
  __CFString *v9;
  void *v10;

  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = &stru_1E3FBBA48;
  if (self->_GUID)
    GUID = (const __CFString *)self->_GUID;
  else
    GUID = &stru_1E3FBBA48;
  if (self->_name)
    name = (const __CFString *)self->_name;
  else
    name = &stru_1E3FBBA48;
  displayAssetURL = self->_displayAssetURL;
  if (displayAssetURL)
  {
    -[NSURL path](self->_displayAssetURL, "path");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  fileURL = self->_fileURL;
  if (fileURL)
  {
    -[NSURL path](self->_fileURL, "path");
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = &stru_1E3FBBA48;
  }
  objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", GUID, CFSTR("s"), name, CFSTR("n"), v4, CFSTR("a"), v9, CFSTR("f"), self->_appVersion, CFSTR("appversion"), self->_appBundleIdentifier, CFSTR("appid"), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (fileURL)

  if (displayAssetURL)
  return (NSDictionary *)v10;
}

- (IMStickerPack)initWithDictionary:(id)a3
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
  IMStickerPack *v13;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("a"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("f"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_msgSend(v4, "objectForKey:", CFSTR("s"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("n"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("appid"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("appversion"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[IMStickerPack initWithGUID:name:displayAssetURL:fileURL:appBundleIdentifier:appVersion:](self, "initWithGUID:name:displayAssetURL:fileURL:appBundleIdentifier:appVersion:", v9, v10, v6, v8, v11, v12);

  return v13;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<IMDStickerPack name:%@ GUID %@ displayAssetURL %@ fileURL %@ stickers %@>"), self->_name, self->_GUID, self->_displayAssetURL, self->_fileURL, self->_stickers);
}

- (id)_generatePackGUIDWithPackID:(id)a3 appBundleID:(id)a4 appVersion:(id)a5
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@_%@"), a4, a5, a3);
}

- (IMStickerPack)initWithStickerPackProperties:(id)a3 stickerPackBundleURL:(id)a4 appBundleIdentifier:(id)a5 appVersion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject *v16;
  IMStickerPack *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v32;
  id v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10 && v11 && v12)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleIconFile"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v11, "path");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringByAppendingPathComponent:", v14);
      v16 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v16);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = 0;
    }
    objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleIdentifier"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleIdentifier"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMStickerPack _generatePackGUIDWithPackID:appBundleID:appVersion:](self, "_generatePackGUIDWithPackID:appBundleID:appVersion:", v19, v12, v13);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (void *)objc_msgSend(v20, "copy");

      objc_msgSend(v10, "objectForKey:", CFSTR("CFBundleName"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      self = -[IMStickerPack initWithGUID:name:displayAssetURL:fileURL:appBundleIdentifier:appVersion:](self, "initWithGUID:name:displayAssetURL:fileURL:appBundleIdentifier:appVersion:", v21, v22, v14, v11, v12, v13);

      v17 = self;
    }
    else
    {
      IMLogHandleForCategory("IMStickerPack");
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        sub_19E36CFC0(v23, v24, v25, v26, v27, v28, v29, v30);

      v17 = 0;
    }

  }
  else
  {
    IMLogHandleForCategory("IMStickerPack");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v32 = 138413058;
      v33 = v10;
      v34 = 2112;
      v35 = v12;
      v36 = 2112;
      v37 = v11;
      v38 = 2112;
      v39 = v13;
      _os_log_error_impl(&dword_19E239000, v16, OS_LOG_TYPE_ERROR, "IMStickerPack invalid parameters passed to initializer stickerProperties %@, appBundlerID %@, bundleURL %@, appVersion %@", (uint8_t *)&v32, 0x2Au);
    }
    v17 = 0;
  }

  return v17;
}

- (NSString)GUID
{
  return self->_GUID;
}

- (void)setGUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSURL)displayAssetURL
{
  return self->_displayAssetURL;
}

- (void)setDisplayAssetURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSURL)fileURL
{
  return self->_fileURL;
}

- (void)setFileURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)appBundleIdentifier
{
  return self->_appBundleIdentifier;
}

- (void)setAppBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)appVersion
{
  return self->_appVersion;
}

- (void)setAppVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appVersion, 0);
  objc_storeStrong((id *)&self->_appBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_fileURL, 0);
  objc_storeStrong((id *)&self->_displayAssetURL, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_GUID, 0);
  objc_storeStrong((id *)&self->_stickers, 0);
}

@end
