@implementation IMNicknameAvatarImage

- (IMNicknameAvatarImage)init
{
  return -[IMNicknameAvatarImage initWithImageName:imageFilePath:contentIsSensitive:](self, "initWithImageName:imageFilePath:contentIsSensitive:", 0, 0, 0);
}

- (IMNicknameAvatarImage)initWithImageName:(id)a3 imageFilePath:(id)a4 contentIsSensitive:(BOOL)a5
{
  id v8;
  id v9;
  IMNicknameAvatarImage *v10;
  uint64_t v11;
  NSString *imageName;
  uint64_t v13;
  NSString *imageFilePath;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v16.receiver = self;
  v16.super_class = (Class)IMNicknameAvatarImage;
  v10 = -[IMNicknameAvatarImage init](&v16, sel_init);
  if (v10)
  {
    v11 = objc_msgSend(v8, "copy");
    imageName = v10->_imageName;
    v10->_imageName = (NSString *)v11;

    v13 = objc_msgSend(v9, "copy");
    imageFilePath = v10->_imageFilePath;
    v10->_imageFilePath = (NSString *)v13;

    v10->_contentIsSensitive = a5;
  }

  return v10;
}

- (IMNicknameAvatarImage)initWithImageName:(id)a3 imageData:(id)a4 imageFilePath:(id)a5 contentIsSensitive:(BOOL)a6
{
  return (IMNicknameAvatarImage *)MEMORY[0x1E0DE7D20](self, sel_initWithImageName_imageData_imageFilePath_contentIsSensitive_error_);
}

- (IMNicknameAvatarImage)initWithImageName:(id)a3 imageData:(id)a4 imageFilePath:(id)a5 contentIsSensitive:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  IMNicknameAvatarImage *v14;

  v8 = a6;
  v12 = a5;
  v13 = a3;
  -[IMNicknameAvatarImage _writeImageData:path:error:](self, "_writeImageData:path:error:", a4, v12, a7);
  v14 = -[IMNicknameAvatarImage initWithImageName:imageFilePath:contentIsSensitive:](self, "initWithImageName:imageFilePath:contentIsSensitive:", v13, v12, v8);

  return v14;
}

- (IMNicknameAvatarImage)initWithPublicDictionaryMetadataRepresentation:(id)a3
{
  void *v4;
  IMNicknameAvatarImage *v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("imageName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[IMNicknameAvatarImage initWithImageName:imageFilePath:contentIsSensitive:](self, "initWithImageName:imageFilePath:contentIsSensitive:", v4, 0, 0);

  return v5;
}

- (IMNicknameAvatarImage)initWithPublicDictionaryMetadataRepresentation:(id)a3 imageData:(id)a4 imageFilePath:(id)a5 contentIsSensitive:(BOOL)a6 error:(id *)a7
{
  id v12;
  id v13;
  IMNicknameAvatarImage *v14;
  uint64_t v15;
  NSString *imageFilePath;

  v12 = a5;
  v13 = a3;
  -[IMNicknameAvatarImage _writeImageData:path:error:](self, "_writeImageData:path:error:", a4, v12, a7);
  self->_contentIsSensitive = a6;
  v14 = -[IMNicknameAvatarImage initWithPublicDictionaryMetadataRepresentation:](self, "initWithPublicDictionaryMetadataRepresentation:", v13);

  if (v14)
  {
    v15 = objc_msgSend(v12, "copy");
    imageFilePath = v14->_imageFilePath;
    v14->_imageFilePath = (NSString *)v15;

  }
  return v14;
}

- (IMNicknameAvatarImage)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  IMNicknameAvatarImage *v8;

  v4 = a3;
  objc_msgSend(v4, "objectForKey:", CFSTR("imageName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("imageFilePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("contentIsSensitive"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[IMNicknameAvatarImage initWithImageName:imageFilePath:contentIsSensitive:](self, "initWithImageName:imageFilePath:contentIsSensitive:", v5, v6, objc_msgSend(v7, "BOOLValue"));
  return v8;
}

- (id)dictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSString *imageName;
  NSString *imageFilePath;
  void *v7;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  imageName = self->_imageName;
  if (imageName)
    CFDictionarySetValue(v3, CFSTR("imageName"), imageName);
  imageFilePath = self->_imageFilePath;
  if (imageFilePath)
    CFDictionarySetValue(v4, CFSTR("imageFilePath"), imageFilePath);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_contentIsSensitive);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    CFDictionarySetValue(v4, CFSTR("contentIsSensitive"), v7);

  return v4;
}

- (id)publicDictionaryRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSString *imageName;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  imageName = self->_imageName;
  if (imageName)
    CFDictionarySetValue(v3, CFSTR("imageName"), imageName);
  return v4;
}

- (id)publicDictionaryMetadataRepresentation
{
  __CFDictionary *v3;
  __CFDictionary *v4;
  NSString *imageName;

  v3 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
  v4 = v3;
  imageName = self->_imageName;
  if (imageName)
    CFDictionarySetValue(v3, CFSTR("imageName"), imageName);
  return v4;
}

- (BOOL)_writeImageData:(id)a3 path:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v8, "stringByDeletingLastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  IMSharedHelperEnsureDirectoryExistsAtPath((uint64_t)v9);

  v14 = 0;
  v10 = objc_msgSend(v7, "writeToFile:options:error:", v8, 1073741825, &v14);
  v11 = v14;
  if ((v10 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v8;
        v17 = 2112;
        v18 = v11;
        _os_log_impl(&dword_19E239000, v12, OS_LOG_TYPE_INFO, "Failed to write avatar image data to path %@ with error %@ (imageExists will be NO)", buf, 0x16u);
      }

    }
    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }

  return v10;
}

- (id)loadAndReturnImageData
{
  return 0;
}

- (BOOL)hasImage
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[IMNicknameAvatarImage imageFilePath](self, "imageFilePath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[IMNicknameAvatarImage imageFilePath](self, "imageFilePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)imageData
{
  NSString *imageFilePath;
  void *v4;
  id v5;
  NSObject *v6;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_imageFilePath, "length"))
  {
    imageFilePath = self->_imageFilePath;
    v8 = 0;
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", imageFilePath, 0, &v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    if (v5 && IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v10 = v5;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_INFO, "Error reading nickname avatar image data: %@", buf, 0xCu);
      }

    }
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)imageExists
{
  void *v2;
  void *v3;
  char v4;

  -[IMNicknameAvatarImage imageFilePath](self, "imageFilePath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "fileExistsAtPath:", v2);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IMNicknameAvatarImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  IMNicknameAvatarImage *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageFilePath"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("contentIsSensitive"));

  v8 = -[IMNicknameAvatarImage initWithImageName:imageFilePath:contentIsSensitive:](self, "initWithImageName:imageFilePath:contentIsSensitive:", v5, v6, v7);
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[IMNicknameAvatarImage imageName](self, "imageName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v4, CFSTR("imageName"));

  -[IMNicknameAvatarImage imageFilePath](self, "imageFilePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeObject:forKey:", v5, CFSTR("imageFilePath"));

  objc_msgSend(v6, "encodeBool:forKey:", -[IMNicknameAvatarImage contentIsSensitive](self, "contentIsSensitive"), CFSTR("contentIsSensitive"));
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@: %p imageName: %@ imageFilePath: %@, contentIsSensitive: %d>"), objc_opt_class(), self, self->_imageName, self->_imageFilePath, self->_contentIsSensitive);
}

- (NSString)imageName
{
  return self->_imageName;
}

- (NSString)imageFilePath
{
  return self->_imageFilePath;
}

- (BOOL)contentIsSensitive
{
  return self->_contentIsSensitive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageFilePath, 0);
  objc_storeStrong((id *)&self->_imageName, 0);
}

@end
