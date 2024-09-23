@implementation CNWallpaperMetadata

+ (id)log
{
  if (log_cn_once_token_0_0 != -1)
    dispatch_once(&log_cn_once_token_0_0, &__block_literal_global_13);
  return (id)log_cn_once_object_0_0;
}

void __26__CNWallpaperMetadata_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNWallpaperMetadata");
  v1 = (void *)log_cn_once_object_0_0;
  log_cn_once_object_0_0 = (uint64_t)v0;

}

- (CNWallpaperMetadata)initWithFontDescription:(id)a3 fontColorDescription:(id)a4 backgroundColorDescription:(id)a5 extensionBundleID:(id)a6 vertical:(BOOL)a7 visualFingerprintData:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  CNWallpaperMetadata *v18;
  CNWallpaperMetadata *v19;
  CNWallpaperMetadata *v20;
  id v23;
  objc_super v24;

  v23 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)CNWallpaperMetadata;
  v18 = -[CNWallpaperMetadata init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_fontDescription, a3);
    objc_storeStrong((id *)&v19->_fontColorDescription, a4);
    objc_storeStrong((id *)&v19->_backgroundColorDescription, a5);
    objc_storeStrong((id *)&v19->_extensionBundleID, a6);
    v19->_vertical = a7;
    objc_storeStrong((id *)&v19->_visualFingerprintData, a8);
    v20 = v19;
  }

  return v19;
}

- (CNWallpaperMetadata)initWithDataRepresentation:(id)a3
{
  void *v4;
  id v5;
  CNWallpaperMetadata *v6;
  id v7;
  CNWallpaperMetadata *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v17;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = a3;
    v17 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v17);
    v6 = (CNWallpaperMetadata *)objc_claimAutoreleasedReturnValue();

    v7 = v17;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CNWallpaperMetadata initWithDataRepresentation:].cold.1((uint64_t)v7, v9, v10, v11, v12, v13, v14, v15);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (NSData)dataRepresentation
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v13);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v13;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[CNWallpaperMetadata dataRepresentation].cold.1((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);

  }
  return (NSData *)v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNWallpaperMetadata)initWithCoder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSDictionary *v11;
  NSDictionary *fontDescription;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSDictionary *v18;
  NSDictionary *fontColorDescription;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  NSDictionary *v25;
  NSDictionary *backgroundColorDescription;
  void *v27;
  NSString *v28;
  NSString *extensionBundleID;
  void *v30;
  NSData *v31;
  NSData *visualFingerprintData;
  CNWallpaperMetadata *v33;
  int v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("version"));
  if (v5 >= 3)
  {
    v34 = v5;
    objc_msgSend((id)objc_opt_class(), "log");
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      -[CNWallpaperMetadata initWithCoder:].cold.1(v34, v35, v36, v37, v38, v39, v40, v41);

    v33 = 0;
  }
  else
  {
    v6 = (void *)MEMORY[0x1E0C99E60];
    v7 = objc_opt_class();
    v8 = objc_opt_class();
    objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, CFSTR("_fontDescription"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (NSDictionary *)objc_msgSend(v10, "copy");
    fontDescription = self->_fontDescription;
    self->_fontDescription = v11;

    v13 = (void *)MEMORY[0x1E0C99E60];
    v14 = objc_opt_class();
    v15 = objc_opt_class();
    objc_msgSend(v13, "setWithObjects:", v14, v15, objc_opt_class(), 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v16, CFSTR("_fontColorDescription"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (NSDictionary *)objc_msgSend(v17, "copy");
    fontColorDescription = self->_fontColorDescription;
    self->_fontColorDescription = v18;

    v20 = (void *)MEMORY[0x1E0C99E60];
    v21 = objc_opt_class();
    v22 = objc_opt_class();
    objc_msgSend(v20, "setWithObjects:", v21, v22, objc_opt_class(), 0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v23, CFSTR("_backgroundColorDescription"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (NSDictionary *)objc_msgSend(v24, "copy");
    backgroundColorDescription = self->_backgroundColorDescription;
    self->_backgroundColorDescription = v25;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_extensionBundleID"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (NSString *)objc_msgSend(v27, "copy");
    extensionBundleID = self->_extensionBundleID;
    self->_extensionBundleID = v28;

    self->_vertical = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_vertical"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_visualFingerprintData"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = (NSData *)objc_msgSend(v30, "copy");
    visualFingerprintData = self->_visualFingerprintData;
    self->_visualFingerprintData = v31;

    v33 = self;
  }

  return v33;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", 2, CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fontDescription, CFSTR("_fontDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_fontColorDescription, CFSTR("_fontColorDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_backgroundColorDescription, CFSTR("_backgroundColorDescription"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_extensionBundleID, CFSTR("_extensionBundleID"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_vertical, CFSTR("_vertical"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_visualFingerprintData, CFSTR("_visualFingerprintData"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CNWallpaperMetadata *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = objc_alloc_init(CNWallpaperMetadata);
  -[CNWallpaperMetadata fontDescription](self, "fontDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNWallpaperMetadata setFontDescription:](v4, "setFontDescription:", v5);

  -[CNWallpaperMetadata fontColorDescription](self, "fontColorDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNWallpaperMetadata setFontColorDescription:](v4, "setFontColorDescription:", v6);

  -[CNWallpaperMetadata backgroundColorDescription](self, "backgroundColorDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNWallpaperMetadata setBackgroundColorDescription:](v4, "setBackgroundColorDescription:", v7);

  -[CNWallpaperMetadata extensionBundleID](self, "extensionBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNWallpaperMetadata setExtensionBundleID:](v4, "setExtensionBundleID:", v8);

  -[CNWallpaperMetadata setVertical:](v4, "setVertical:", -[CNWallpaperMetadata isVertical](self, "isVertical"));
  -[CNWallpaperMetadata visualFingerprintData](self, "visualFingerprintData");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNWallpaperMetadata setVisualFingerprintData:](v4, "setVisualFingerprintData:", v9);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CNWallpaperMetadata *v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  _BOOL4 v13;
  unint64_t v14;
  unint64_t v15;
  BOOL v16;

  v4 = (CNWallpaperMetadata *)a3;
  if (self == v4)
    goto LABEL_14;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_15;
  v5 = (unint64_t)-[CNWallpaperMetadata fontDescription](self, "fontDescription");
  v6 = (unint64_t)-[CNWallpaperMetadata fontDescription](v4, "fontDescription");
  if (v5 | v6)
  {
    if (!objc_msgSend((id)v5, "isEqual:", v6))
      goto LABEL_15;
  }
  v7 = (unint64_t)-[CNWallpaperMetadata fontColorDescription](self, "fontColorDescription");
  v8 = (unint64_t)-[CNWallpaperMetadata fontColorDescription](v4, "fontColorDescription");
  if (v7 | v8)
  {
    if (!objc_msgSend((id)v7, "isEqual:", v8))
      goto LABEL_15;
  }
  if (((v9 = (unint64_t)-[CNWallpaperMetadata backgroundColorDescription](self, "backgroundColorDescription"),
         v10 = (unint64_t)-[CNWallpaperMetadata backgroundColorDescription](v4, "backgroundColorDescription"),
         !(v9 | v10))
     || objc_msgSend((id)v9, "isEqual:", v10))
    && ((v11 = (unint64_t)-[CNWallpaperMetadata extensionBundleID](self, "extensionBundleID"),
         v12 = (unint64_t)-[CNWallpaperMetadata extensionBundleID](v4, "extensionBundleID"),
         !(v11 | v12))
     || objc_msgSend((id)v11, "isEqual:", v12))
    && (v13 = -[CNWallpaperMetadata isVertical](self, "isVertical"),
        v13 == -[CNWallpaperMetadata isVertical](v4, "isVertical"))
    && ((v14 = (unint64_t)-[CNWallpaperMetadata visualFingerprintData](self, "visualFingerprintData"),
         v15 = (unint64_t)-[CNWallpaperMetadata visualFingerprintData](v4, "visualFingerprintData"),
         !(v14 | v15))
     || objc_msgSend((id)v14, "isEqual:", v15)))
  {
LABEL_14:
    v16 = 1;
  }
  else
  {
LABEL_15:
    v16 = 0;
  }

  return v16;
}

- (NSDictionary)fontDescription
{
  return self->_fontDescription;
}

- (void)setFontDescription:(id)a3
{
  objc_storeStrong((id *)&self->_fontDescription, a3);
}

- (NSDictionary)fontColorDescription
{
  return self->_fontColorDescription;
}

- (void)setFontColorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_fontColorDescription, a3);
}

- (NSDictionary)backgroundColorDescription
{
  return self->_backgroundColorDescription;
}

- (void)setBackgroundColorDescription:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColorDescription, a3);
}

- (NSString)extensionBundleID
{
  return self->_extensionBundleID;
}

- (void)setExtensionBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_extensionBundleID, a3);
}

- (BOOL)isVertical
{
  return self->_vertical;
}

- (void)setVertical:(BOOL)a3
{
  self->_vertical = a3;
}

- (NSData)visualFingerprintData
{
  return self->_visualFingerprintData;
}

- (void)setVisualFingerprintData:(id)a3
{
  objc_storeStrong((id *)&self->_visualFingerprintData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualFingerprintData, 0);
  objc_storeStrong((id *)&self->_extensionBundleID, 0);
  objc_storeStrong((id *)&self->_backgroundColorDescription, 0);
  objc_storeStrong((id *)&self->_fontColorDescription, 0);
  objc_storeStrong((id *)&self->_fontDescription, 0);
}

- (void)initWithDataRepresentation:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Error unarchiving Core Data value into CNWallpaperMetadata: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)dataRepresentation
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Error archiving CNWallpaperMetadata: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2_0();
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Wallpaper has a higher version number than we know how to handle: %ld", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

@end
