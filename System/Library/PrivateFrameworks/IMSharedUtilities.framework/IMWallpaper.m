@implementation IMWallpaper

- (void)encodeWithCoder:(id)a3
{
  MEMORY[0x1E0DE7D20](self->swiftImpl, sel_encodeWithCoder_);
}

- (IMWallpaper)initWithFileName:(id)a3 filePath:(id)a4 lowResFileName:(id)a5 lowResFilePath:(id)a6 metadata:(id)a7 contentIsSensitive:(BOOL)a8
{
  _BOOL8 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  IMWallpaper *v19;
  IMWallpaper_SwiftImpl *v20;
  IMWallpaper_SwiftImpl *swiftImpl;
  objc_super v23;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v23.receiver = self;
  v23.super_class = (Class)IMWallpaper;
  v19 = -[IMWallpaper init](&v23, sel_init);
  if (v19)
  {
    v20 = -[IMWallpaper_SwiftImpl initWithFileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:]([IMWallpaper_SwiftImpl alloc], "initWithFileName:filePath:lowResFileName:lowResFilePath:metadata:contentIsSensitive:", v14, v15, v16, v17, v18, v8);
    swiftImpl = v19->swiftImpl;
    v19->swiftImpl = v20;

  }
  return v19;
}

- (IMWallpaper)initWithFileName:(id)a3 filePath:(id)a4 data:(id)a5 lowResFileName:(id)a6 lowResFilePath:(id)a7 lowResData:(id)a8 metadata:(id)a9 contentIsSensitive:(BOOL)a10 error:(id *)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  IMWallpaper *v24;
  IMWallpaper_SwiftImpl *v25;
  IMWallpaper_SwiftImpl *swiftImpl;
  uint64_t v28;
  objc_super v29;

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v22 = a8;
  v23 = a9;
  v29.receiver = self;
  v29.super_class = (Class)IMWallpaper;
  v24 = -[IMWallpaper init](&v29, sel_init);
  if (v24)
  {
    LOBYTE(v28) = a10;
    v25 = -[IMWallpaper_SwiftImpl initWithFileName:filePath:data:lowResFileName:lowResFilePath:lowResData:metadata:contentIsSensitive:error:]([IMWallpaper_SwiftImpl alloc], "initWithFileName:filePath:data:lowResFileName:lowResFilePath:lowResData:metadata:contentIsSensitive:error:", v17, v18, v19, v20, v21, v22, v23, v28, a11);
    swiftImpl = v24->swiftImpl;
    v24->swiftImpl = v25;

  }
  return v24;
}

- (IMWallpaper)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  IMWallpaper *v6;
  IMWallpaper_SwiftImpl *v7;
  IMWallpaper_SwiftImpl *swiftImpl;
  IMWallpaper *v9;
  objc_super v11;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    v11.receiver = self;
    v11.super_class = (Class)IMWallpaper;
    v6 = -[IMWallpaper init](&v11, sel_init);
    if (v6)
    {
      v7 = -[IMWallpaper_SwiftImpl initWithDictionaryRepresentation:]([IMWallpaper_SwiftImpl alloc], "initWithDictionaryRepresentation:", v5);
      swiftImpl = v6->swiftImpl;
      v6->swiftImpl = v7;

    }
    self = v6;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (IMWallpaper)initWithCoder:(id)a3
{
  id v4;
  IMWallpaper *v5;
  IMWallpaper_SwiftImpl *v6;
  IMWallpaper_SwiftImpl *swiftImpl;
  IMWallpaper *v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IMWallpaper;
  v5 = -[IMWallpaper init](&v10, sel_init);
  if (v5
    && (v6 = -[IMWallpaper_SwiftImpl initWithCoder:]([IMWallpaper_SwiftImpl alloc], "initWithCoder:", v4), swiftImpl = v5->swiftImpl, v5->swiftImpl = v6, swiftImpl, !v5->swiftImpl))
  {
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (NSString)fileName
{
  return -[IMWallpaper_SwiftImpl fileName](self->swiftImpl, "fileName");
}

- (NSString)filePath
{
  return -[IMWallpaper_SwiftImpl filePath](self->swiftImpl, "filePath");
}

- (NSString)lowResFileName
{
  return -[IMWallpaper_SwiftImpl lowResFileName](self->swiftImpl, "lowResFileName");
}

- (NSString)lowResFilePath
{
  return -[IMWallpaper_SwiftImpl lowResFilePath](self->swiftImpl, "lowResFilePath");
}

- (int64_t)dataVersion
{
  return -[IMWallpaper_SwiftImpl dataVersion](self->swiftImpl, "dataVersion");
}

- (IMWallpaperMetadata)metadata
{
  return -[IMWallpaper_SwiftImpl metadata](self->swiftImpl, "metadata");
}

- (id)wallpaperData
{
  IMWallpaper_SwiftImpl *swiftImpl;
  void *v3;
  id v4;
  id v6;

  swiftImpl = self->swiftImpl;
  v6 = 0;
  -[IMWallpaper_SwiftImpl fetchWallpaperDataAndReturnError:](swiftImpl, "fetchWallpaperDataAndReturnError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (!v3 && _IMWillLog())
    _IMAlwaysLog();

  return v3;
}

- (id)lowResWallpaperData
{
  IMWallpaper_SwiftImpl *swiftImpl;
  void *v3;
  id v4;
  id v6;

  swiftImpl = self->swiftImpl;
  v6 = 0;
  -[IMWallpaper_SwiftImpl fetchLowResWallpaperDataAndReturnError:](swiftImpl, "fetchLowResWallpaperDataAndReturnError:", &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v6;
  if (!v3 && _IMWillLog())
    _IMAlwaysLog();

  return v3;
}

- (BOOL)wallpaperExists
{
  return -[IMWallpaper_SwiftImpl wallpaperExists](self->swiftImpl, "wallpaperExists");
}

- (BOOL)lowResWallpaperExists
{
  return -[IMWallpaper_SwiftImpl lowResWallpaperExists](self->swiftImpl, "lowResWallpaperExists");
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)contentIsSensitive
{
  return -[IMWallpaper_SwiftImpl contentIsSensitive](self->swiftImpl, "contentIsSensitive");
}

- (BOOL)isEqual:(id)a3
{
  IMWallpaper *v4;
  IMWallpaper *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL4 v22;
  void *v23;
  void *v24;
  int64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  char v29;
  BOOL v30;
  BOOL v31;
  _BOOL4 v33;
  _BOOL4 v34;

  v4 = (IMWallpaper *)a3;
  if (self == v4)
  {
    v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      -[IMWallpaper fileName](self, "fileName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMWallpaper fileName](v5, "fileName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isEqualToString:", v7) & 1) != 0)
      {
        v34 = 1;
      }
      else
      {
        -[IMWallpaper fileName](self, "fileName");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v34 = 0;
        }
        else
        {
          -[IMWallpaper fileName](v5, "fileName");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = v10 == 0;

        }
      }

      -[IMWallpaper filePath](self, "filePath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMWallpaper filePath](v5, "filePath");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", v12) & 1) != 0)
      {
        v33 = 1;
      }
      else
      {
        -[IMWallpaper filePath](self, "filePath");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          v33 = 0;
        }
        else
        {
          -[IMWallpaper filePath](v5, "filePath");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v33 = v14 == 0;

        }
      }

      -[IMWallpaper lowResFileName](self, "lowResFileName");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMWallpaper lowResFileName](v5, "lowResFileName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqualToString:", v16) & 1) != 0)
      {
        v17 = 1;
      }
      else
      {
        -[IMWallpaper lowResFileName](self, "lowResFileName");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
        {
          v17 = 0;
        }
        else
        {
          -[IMWallpaper lowResFileName](v5, "lowResFileName");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v19 == 0;

        }
      }

      -[IMWallpaper lowResFilePath](self, "lowResFilePath");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMWallpaper lowResFilePath](v5, "lowResFilePath");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isEqualToString:", v21) & 1) != 0)
      {
        v22 = 1;
      }
      else
      {
        -[IMWallpaper lowResFilePath](self, "lowResFilePath");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
        {
          v22 = 0;
        }
        else
        {
          -[IMWallpaper lowResFilePath](v5, "lowResFilePath");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = v24 == 0;

        }
      }

      v25 = -[IMWallpaper dataVersion](self, "dataVersion");
      v26 = -[IMWallpaper dataVersion](v5, "dataVersion");
      -[IMWallpaper metadata](self, "metadata");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[IMWallpaper metadata](v5, "metadata");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "isEqual:", v28);

      v30 = -[IMWallpaper contentIsSensitive](self, "contentIsSensitive");
      v31 = -[IMWallpaper contentIsSensitive](v5, "contentIsSensitive");
      v8 = 0;
      if (v34 && v33 && v17 && v22 && v25 == v26)
        v8 = v29 & (v30 ^ v31 ^ 1);

    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = -[IMWallpaper_SwiftImpl isEqual:](self->swiftImpl, "isEqual:", v4);
      else
        v8 = 0;
    }
  }

  return v8;
}

- (id)publicDictionaryRepresentation
{
  return -[IMWallpaper_SwiftImpl publicDictionaryRepresentation](self->swiftImpl, "publicDictionaryRepresentation");
}

- (id)dictionaryRepresentation
{
  return -[IMWallpaper_SwiftImpl dictionaryRepresentation](self->swiftImpl, "dictionaryRepresentation");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->swiftImpl, 0);
}

@end
