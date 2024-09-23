@implementation CNWallpaper

+ (id)log
{
  if (log_cn_once_token_0_11 != -1)
    dispatch_once(&log_cn_once_token_0_11, &__block_literal_global_115);
  return (id)log_cn_once_object_0_11;
}

void __18__CNWallpaper_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNWallpaper");
  v1 = (void *)log_cn_once_object_0_11;
  log_cn_once_object_0_11 = (uint64_t)v0;

}

- (CNWallpaper)initWithImageData:(id)a3 type:(id)a4
{
  id v6;
  CNWallpaper *v7;
  CNWallpaper *v8;
  NSData *v9;
  NSData *posterArchiveData;
  CNWallpaper *v11;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNWallpaper;
  v7 = -[CNWallpaper init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_imageData, a3);
    v9 = (NSData *)objc_alloc_init(MEMORY[0x1E0C99D50]);
    posterArchiveData = v8->_posterArchiveData;
    v8->_posterArchiveData = v9;

    v11 = v8;
  }

  return v8;
}

- (CNWallpaper)initWithImageData:(id)a3 posterArchiveData:(id)a4
{
  id v7;
  id v8;
  CNWallpaper *v9;
  CNWallpaper *v10;
  CNWallpaper *v11;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CNWallpaper;
  v9 = -[CNWallpaper init](&v13, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_imageData, a3);
    objc_storeStrong((id *)&v10->_posterArchiveData, a4);
    v11 = v10;
  }

  return v10;
}

- (CNWallpaper)initWithPosterArchiveData:(id)a3
{
  id v5;
  CNWallpaper *v6;
  CNWallpaper *v7;
  NSData *imageData;
  CNWallpaper *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CNWallpaper;
  v6 = -[CNWallpaper init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    imageData = v6->_imageData;
    v6->_imageData = 0;

    objc_storeStrong((id *)&v7->_posterArchiveData, a3);
    v9 = v7;
  }

  return v7;
}

- (CNWallpaper)initWithDataRepresentation:(id)a3
{
  void *v4;
  id v5;
  CNWallpaper *v6;
  id v7;
  CNWallpaper *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3710];
    v5 = a3;
    v11 = 0;
    objc_msgSend(v4, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v5, &v11);
    v6 = (CNWallpaper *)objc_claimAutoreleasedReturnValue();

    v7 = v11;
    if (v6)
    {
      v8 = v6;
    }
    else
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v13 = v7;
        _os_log_impl(&dword_18F8BD000, v9, OS_LOG_TYPE_DEFAULT, "Error unarchiving Core Data value into CNWallpaper: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (CNWallpaper)initWithDataRepresentationForPersistence:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  id v7;
  int v8;
  NSObject *v9;
  CNWallpaper *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (objc_class *)MEMORY[0x1E0CB3710];
    v5 = a3;
    v20 = 0;
    v6 = (void *)objc_msgSend([v4 alloc], "initForReadingFromData:error:", v5, &v20);

    v7 = v20;
    v8 = objc_msgSend(v6, "decodeIntForKey:", CFSTR("version"));
    if (v8 >= 5)
    {
      v11 = v8;
      objc_msgSend((id)objc_opt_class(), "log");
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[CNWallpaper initWithDataRepresentationForPersistence:].cold.1(v11, v9, v12, v13, v14, v15, v16, v17);
    }
    else
    {
      objc_msgSend(v6, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posterArchiveData"));
      v9 = objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        v10 = -[CNWallpaper initWithPosterArchiveData:contentIsSensitive:]([CNWallpaper alloc], "initWithPosterArchiveData:contentIsSensitive:", v9, objc_msgSend(v6, "decodeBoolForKey:", CFSTR("_contentIsSensitive")));
LABEL_12:

        goto LABEL_13;
      }
      objc_msgSend((id)objc_opt_class(), "log");
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v7;
        _os_log_impl(&dword_18F8BD000, v18, OS_LOG_TYPE_DEFAULT, "Error unarchiving Core Data value into CNWallpaper: %@", buf, 0xCu);
      }

    }
    v10 = 0;
    goto LABEL_12;
  }
  v10 = 0;
LABEL_13:

  return v10;
}

- (CNWallpaper)initWithPosterArchiveData:(id)a3 contentIsSensitive:(BOOL)a4
{
  id v7;
  CNWallpaper *v8;
  CNWallpaper *v9;
  CNWallpaper *v10;
  objc_super v12;

  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CNWallpaper;
  v8 = -[CNWallpaper init](&v12, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_posterArchiveData, a3);
    v9->_contentIsSensitive = a4;
    v10 = v9;
  }

  return v9;
}

- (CNWallpaper)initWithPosterArchiveData:(id)a3 metadata:(id)a4 contentIsSensitive:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  CNWallpaper *v16;
  CNWallpaper *v17;
  CNWallpaper *v18;
  uint64_t v20;

  v5 = a5;
  v8 = a4;
  v9 = a3;
  if (v8)
  {
    objc_msgSend(v8, "fontDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fontColorDescription");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "backgroundColorDescription");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "extensionBundleID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v8, "isVertical");
    objc_msgSend(v8, "visualFingerprintData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v20) = v5;
    v16 = -[CNWallpaper initWithPosterArchiveData:fontDescription:fontColorDescription:backgroundColorDescription:extensionBundleID:vertical:visualFingerprintData:contentIsSensitive:](self, "initWithPosterArchiveData:fontDescription:fontColorDescription:backgroundColorDescription:extensionBundleID:vertical:visualFingerprintData:contentIsSensitive:", v9, v10, v11, v12, v13, v14, v15, v20);

    v17 = v16;
  }
  else
  {
    v18 = -[CNWallpaper initWithPosterArchiveData:contentIsSensitive:](self, "initWithPosterArchiveData:contentIsSensitive:", v9, v5);

    v17 = v18;
  }

  return v17;
}

- (CNWallpaper)initWithPosterArchiveData:(id)a3 fontDescription:(id)a4 fontColorDescription:(id)a5 backgroundColorDescription:(id)a6 extensionBundleID:(id)a7 vertical:(BOOL)a8 visualFingerprintData:(id)a9 contentIsSensitive:(BOOL)a10
{
  _BOOL8 v10;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  CNWallpaper *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CNWallpaper *v32;
  CNWallpaperMetadata *v33;
  CNWallpaperMetadata *metadata;
  objc_super v36;

  v10 = a8;
  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a9;
  v36.receiver = self;
  v36.super_class = (Class)CNWallpaper;
  v23 = -[CNWallpaper init](&v36, sel_init);
  if (v23)
  {
    if (!(*(unsigned int (**)(void))(*MEMORY[0x1E0D13818] + 16))())
    {
      objc_storeStrong((id *)&v23->_posterArchiveData, a3);
      v33 = -[CNWallpaperMetadata initWithFontDescription:fontColorDescription:backgroundColorDescription:extensionBundleID:vertical:visualFingerprintData:]([CNWallpaperMetadata alloc], "initWithFontDescription:fontColorDescription:backgroundColorDescription:extensionBundleID:vertical:visualFingerprintData:", v18, v19, v20, v21, v10, v22);
      metadata = v23->_metadata;
      v23->_metadata = v33;

      v23->_contentIsSensitive = a10;
      v32 = v23;
      goto LABEL_8;
    }
    objc_msgSend((id)objc_opt_class(), "log");
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      -[CNWallpaper initWithPosterArchiveData:fontDescription:fontColorDescription:backgroundColorDescription:extensionBundleID:vertical:visualFingerprintData:contentIsSensitive:].cold.1(v24, v25, v26, v27, v28, v29, v30, v31);

  }
  v32 = 0;
LABEL_8:

  return v32;
}

- (NSData)dataRepresentation
{
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", self, 1, &v7);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v9 = v3;
      _os_log_impl(&dword_18F8BD000, v5, OS_LOG_TYPE_DEFAULT, "Error archiving CNWallpaper: %@", buf, 0xCu);
    }

  }
  return (NSData *)v2;
}

- (id)dataRepresentationForPersistence
{
  void *v3;
  void *v4;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
  objc_msgSend(v3, "encodeInt:forKey:", 4, CFSTR("version"));
  objc_msgSend(v3, "encodeObject:forKey:", self->_posterArchiveData, CFSTR("_posterArchiveData"));
  objc_msgSend(v3, "encodeBool:forKey:", self->_contentIsSensitive, CFSTR("_contentIsSensitive"));
  objc_msgSend(v3, "finishEncoding");
  objc_msgSend(v3, "encodedData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)generateSnapshotImageDataForWatch
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  objc_msgSend((id)objc_opt_class(), "log");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    -[CNWallpaper generateSnapshotImageDataForWatch].cold.2(v3, v4, v5, v6, v7, v8, v9, v10);

  v11 = *MEMORY[0x1E0D13818];
  -[CNWallpaper posterArchiveData](self, "posterArchiveData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v11) = (*(uint64_t (**)(uint64_t, void *))(v11 + 16))(v11, v12);

  if ((_DWORD)v11)
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[CNWallpaper generateSnapshotImageDataForWatch].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    goto LABEL_9;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
LABEL_9:
    v21 = 0;
    return v21;
  }
  -[CNWallpaper snapshotImageDataForWatch](self, "snapshotImageDataForWatch");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  return v21;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNWallpaper)initWithCoder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  NSData *v7;
  NSData *posterArchiveData;
  void *v9;
  CNWallpaperMetadata *v10;
  CNWallpaperMetadata *metadata;
  CNWallpaper *v12;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("version"));
  if (v5 >= 5)
  {
    v13 = v5;
    objc_msgSend((id)objc_opt_class(), "log");
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[CNWallpaper initWithDataRepresentationForPersistence:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

    v12 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_posterArchiveData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (NSData *)objc_msgSend(v6, "copy");
    posterArchiveData = self->_posterArchiveData;
    self->_posterArchiveData = v7;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_metadata"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (CNWallpaperMetadata *)objc_msgSend(v9, "copy");
    metadata = self->_metadata;
    self->_metadata = v10;

    self->_contentIsSensitive = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("_contentIsSensitive"));
    v12 = self;
  }

  return v12;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", 4, CFSTR("version"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_posterArchiveData, CFSTR("_posterArchiveData"));
  objc_msgSend(v4, "encodeObject:forKey:", self->_metadata, CFSTR("_metadata"));
  objc_msgSend(v4, "encodeBool:forKey:", self->_contentIsSensitive, CFSTR("_contentIsSensitive"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CNWallpaper *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(CNWallpaper);
  -[CNWallpaper posterArchiveData](self, "posterArchiveData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNWallpaper setPosterArchiveData:](v4, "setPosterArchiveData:", v5);

  -[CNWallpaper metadata](self, "metadata");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNWallpaper setMetadata:](v4, "setMetadata:", v6);

  -[CNWallpaper setContentIsSensitive:](v4, "setContentIsSensitive:", -[CNWallpaper contentIsSensitive](self, "contentIsSensitive"));
  -[CNWallpaper generatedWatchImageData](self, "generatedWatchImageData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNWallpaper setGeneratedWatchImageData:](v4, "setGeneratedWatchImageData:", v7);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  CNWallpaper *v4;
  unint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  _BOOL4 v8;

  v4 = (CNWallpaper *)a3;
  if (self == v4)
  {
    LOBYTE(v8) = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ((v5 = (unint64_t)-[CNWallpaper posterArchiveData](self, "posterArchiveData"),
           v6 = (unint64_t)-[CNWallpaper posterArchiveData](v4, "posterArchiveData"),
           !(v5 | v6))
       || objc_msgSend((id)v5, "isEqual:", v6)))
    {
      v7 = -[CNWallpaper contentIsSensitive](self, "contentIsSensitive");
      v8 = v7 ^ -[CNWallpaper contentIsSensitive](v4, "contentIsSensitive") ^ 1;
    }
    else
    {
      LOBYTE(v8) = 0;
    }
  }

  return v8;
}

- (id)wallpaperIncludingIMWallpaperMetadata:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CNWallpaper *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  CNWallpaper *v17;
  uint64_t v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v20[0] = CFSTR("name");
  v4 = a3;
  objc_msgSend(v4, "fontName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v5;
  v20[1] = CFSTR("point-size");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "fontSize");
  objc_msgSend(v6, "numberWithDouble:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v7;
  v20[2] = CFSTR("weight");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v4, "fontWeight");
  objc_msgSend(v8, "numberWithDouble:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = [CNWallpaper alloc];
  -[CNWallpaper posterArchiveData](self, "posterArchiveData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fontColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "backgroundColor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "type");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v4, "isVertical");

  LOBYTE(v19) = -[CNWallpaper contentIsSensitive](self, "contentIsSensitive");
  v17 = -[CNWallpaper initWithPosterArchiveData:fontDescription:fontColorDescription:backgroundColorDescription:extensionBundleID:vertical:visualFingerprintData:contentIsSensitive:](v11, "initWithPosterArchiveData:fontDescription:fontColorDescription:backgroundColorDescription:extensionBundleID:vertical:visualFingerprintData:contentIsSensitive:", v12, v10, v13, v14, v15, v16, 0, v19);

  return v17;
}

- (NSDictionary)fontDescription
{
  void *v2;
  void *v3;

  -[CNWallpaper metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)fontColorDescription
{
  void *v2;
  void *v3;

  -[CNWallpaper metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "fontColorDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSDictionary)backgroundColorDescription
{
  void *v2;
  void *v3;

  -[CNWallpaper metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backgroundColorDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (NSString)extensionBundleID
{
  void *v2;
  void *v3;

  -[CNWallpaper metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "extensionBundleID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isVertical
{
  void *v2;
  char v3;

  -[CNWallpaper metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isVertical");

  return v3;
}

- (NSData)visualFingerprintData
{
  void *v2;
  void *v3;

  -[CNWallpaper metadata](self, "metadata");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "visualFingerprintData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSData *)v3;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSData)posterArchiveData
{
  return self->_posterArchiveData;
}

- (void)setPosterArchiveData:(id)a3
{
  objc_storeStrong((id *)&self->_posterArchiveData, a3);
}

- (void)setDataRepresentation:(id)a3
{
  objc_storeStrong((id *)&self->_dataRepresentation, a3);
}

- (CNWallpaperMetadata)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)contentIsSensitive
{
  return self->_contentIsSensitive;
}

- (void)setContentIsSensitive:(BOOL)a3
{
  self->_contentIsSensitive = a3;
}

- (NSData)generatedWatchImageData
{
  return self->_generatedWatchImageData;
}

- (void)setGeneratedWatchImageData:(id)a3
{
  objc_storeStrong((id *)&self->_generatedWatchImageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_generatedWatchImageData, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_dataRepresentation, 0);
  objc_storeStrong((id *)&self->_posterArchiveData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

- (void)initWithDataRepresentationForPersistence:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Wallpaper has a higher version number than we know how to handle: %ld", a5, a6, a7, a8, 0);
}

- (void)initWithPosterArchiveData:(NSObject *)a1 fontDescription:(uint64_t)a2 fontColorDescription:(uint64_t)a3 backgroundColorDescription:(uint64_t)a4 extensionBundleID:(uint64_t)a5 vertical:(uint64_t)a6 visualFingerprintData:(uint64_t)a7 contentIsSensitive:(uint64_t)a8 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2(&dword_18F8BD000, a1, a3, "Error initializing CNWallpaper: posterArchiveData is empty", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_4();
}

- (void)generateSnapshotImageDataForWatch
{
  OUTLINED_FUNCTION_4();
}

@end
