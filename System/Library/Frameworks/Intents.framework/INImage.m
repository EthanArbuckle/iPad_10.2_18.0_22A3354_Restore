@implementation INImage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (INImage)systemImageNamed:(NSString *)systemImageName
{
  NSString *v3;
  id v4;
  INImageBundle *v5;
  void *v6;

  v3 = systemImageName;
  v4 = -[INImage _initWithIdentifier:]([_INBundleImage alloc], "_initWithIdentifier:", 0);
  objc_msgSend(v4, "setImageName:", v3);

  v5 = objc_alloc_init(INImageBundle);
  -[INImageBundle setBundleType:](v5, "setBundleType:", 2);
  objc_msgSend(v4, "setImageBundle:", v5);
  objc_msgSend(v4, "_setRenderingMode:", 2);
  +[INCache sharedCache](INCache, "sharedCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addCacheableObject:", v4);

  return (INImage *)v4;
}

- (id)_initWithIdentifier:(id)a3
{
  id v5;
  INImage *v6;
  INImage *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)INImage;
  v6 = -[INImage init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    objc_msgSend((id)objc_opt_class(), "registerImageLoadersOnce");
  }

  return v7;
}

+ (void)registerImageLoadersOnce
{
  if (registerImageLoadersOnce_onceToken != -1)
    dispatch_once(&registerImageLoadersOnce_onceToken, &__block_literal_global_40848);
}

- (void)_setRenderingMode:(int64_t)a3
{
  self->__renderingMode = a3;
}

- (INImage)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  INImage *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("_identifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[INImage _initWithIdentifier:](self, "_initWithIdentifier:", v5);

  if (v6)
  {
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_imageSize.width"));
    v8 = v7;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_imageSize.height"));
    -[INImage _setImageSize:](v6, "_setImageSize:", v8, v9);
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_preferredScaledSize.width"));
    v11 = v10;
    objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("_preferredScaledSize.height"));
    v13 = v12;
    v14 = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("_renderingMode"));
    -[INImage _setPreferredScaledSize:](v6, "_setPreferredScaledSize:", v11, v13);
    -[INImage _setRenderingMode:](v6, "_setRenderingMode:", v14);
  }

  return v6;
}

+ (INImage)imageWithURL:(NSURL *)URL width:(double)width height:(double)height
{
  NSURL *v7;
  NSURL *v8;
  NSURL *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  char v15;
  _INURLImage *v16;
  void *v17;
  NSObject *v18;
  int v20;
  const char *v21;
  __int16 v22;
  NSURL *v23;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v7 = URL;
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  v9 = v7;
  if (-[NSURL isFileURL](v9, "isFileURL"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL path](v9, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isReadableFileAtPath:", v11);

    if ((v12 & 1) == 0)
      goto LABEL_9;
LABEL_8:
    v16 = -[_INURLImage initWithImageURL:]([_INURLImage alloc], "initWithImageURL:", v9);
    -[INImage _setImageSize:](v16, "_setImageSize:", width, height);
    +[INCache sharedCache](INCache, "sharedCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addCacheableObject:", v16);

    goto LABEL_12;
  }
  -[NSURL scheme](v9, "scheme");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "lowercaseString");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "isEqualToString:", CFSTR("http")))
  {

    goto LABEL_8;
  }
  v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("https"));

  if ((v15 & 1) != 0)
    goto LABEL_8;
LABEL_9:
  v18 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
  {
    v20 = 136315906;
    v21 = "+[INImage imageWithURL:width:height:]";
    v22 = 2112;
    v23 = v8;
    v24 = 2048;
    v25 = width;
    v26 = 2048;
    v27 = height;
    _os_log_error_impl(&dword_18BEBC000, v18, OS_LOG_TYPE_ERROR, "%s Invalid URL=%@ {%f,%f}", (uint8_t *)&v20, 0x2Au);
  }
  v16 = 0;
LABEL_12:

  return (INImage *)v16;
}

- (id)_copyWithSubclass:(Class)a3
{
  objc_class *v3;
  id v5;
  void *v6;
  void *v7;

  v3 = a3;
  if ((-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
    v3 = (objc_class *)objc_opt_class();
  v5 = [v3 alloc];
  -[INImage _identifier](self, "_identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "_initWithIdentifier:", v6);

  -[INImage _imageSize](self, "_imageSize");
  objc_msgSend(v7, "_setImageSize:");
  -[INImage _preferredScaledSize](self, "_preferredScaledSize");
  objc_msgSend(v7, "_setPreferredScaledSize:");
  objc_msgSend(v7, "_setRenderingMode:", -[INImage _renderingMode](self, "_renderingMode"));
  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  NSString *identifier;
  double v5;
  double v6;
  id v7;

  identifier = self->_identifier;
  v7 = a3;
  objc_msgSend(v7, "encodeObject:forKey:", identifier, CFSTR("_identifier"));
  -[INImage _imageSize](self, "_imageSize");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("_imageSize.width"));
  -[INImage _imageSize](self, "_imageSize");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("_imageSize.height"), v5);
  -[INImage _preferredScaledSize](self, "_preferredScaledSize");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("_preferredScaledSize.width"));
  -[INImage _preferredScaledSize](self, "_preferredScaledSize");
  objc_msgSend(v7, "encodeDouble:forKey:", CFSTR("_preferredScaledSize.height"), v6);
  objc_msgSend(v7, "encodeInteger:forKey:", -[INImage _renderingMode](self, "_renderingMode"), CFSTR("_renderingMode"));

}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_imageSize
{
  double width;
  double height;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  width = self->_imageSize.width;
  height = self->_imageSize.height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)_preferredScaledSize
{
  double width;
  double height;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  width = self->_preferredScaledSize.width;
  height = self->_preferredScaledSize.height;
  result.var1 = height;
  result.var0 = width;
  return result;
}

- (int64_t)_renderingMode
{
  return self->__renderingMode;
}

- (void)_setImageSize:(id)a3
{
  self->_imageSize = ($D4775485B13497D55C4F339E01923D43)a3;
}

- (void)_setPreferredScaledSize:(id)a3
{
  self->_preferredScaledSize = ($D4775485B13497D55C4F339E01923D43)a3;
}

+ (void)initialize
{
  objc_super v3;

  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___INImage;
  objc_msgSendSuper2(&v3, sel_initialize);
  if ((id)objc_opt_class() == a1 && INLogInitIfNeeded_once != -1)
    dispatch_once(&INLogInitIfNeeded_once, &__block_literal_global_66271);
}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[INImage _copyWithSubclass:](self, "_copyWithSubclass:", objc_opt_class());
}

+ (INImage)imageWithURL:(NSURL *)URL
{
  NSURL *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v4 = URL;
  v5 = -[INRemoteImageProxy _initWithURLRepresentation:]([INRemoteImageProxy alloc], "_initWithURLRepresentation:", v4);
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = -[_INBundleImage _initWithURLRepresentation:]([_INBundleImage alloc], "_initWithURLRepresentation:", v4);
    v9 = v8;
    if (v8)
    {
      v10 = v8;
    }
    else
    {
      objc_msgSend(a1, "imageWithURL:width:height:", v4, 180.0, 180.0);
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v10;

  }
  return (INImage *)v7;
}

- (id)_in_writeableFilePersistenceConfigurationForStoreType:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  _INFilePersistenceConfiguration *v17;
  int v19;
  const char *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[INImage _identifier](self, "_identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "URLPathAllowedCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeCharactersInString:", CFSTR("./:"));
  objc_msgSend(v4, "stringByAddingPercentEncodingWithAllowedCharacters:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "stringByAppendingPathExtension:", CFSTR("png"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v8;
  _INImageFilePersistenceDirectoryPathWithStoreTypeCreateIfNeeded(a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = INSiriLogContextIntents;
  if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
  {
    v19 = 136315394;
    v20 = "-[INImage(INImageFilePersistence) _in_writeableFilePersistenceConfigurationForStoreType:]";
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_18BEBC000, v12, OS_LOG_TYPE_INFO, "%s Checking writability of file path: %@", (uint8_t *)&v19, 0x16u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByDeletingLastPathComponent");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v13, "isWritableFileAtPath:", v14);

  v16 = INSiriLogContextIntents;
  if (v15)
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
    {
      v19 = 136315394;
      v20 = "-[INImage(INImageFilePersistence) _in_writeableFilePersistenceConfigurationForStoreType:]";
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_18BEBC000, v16, OS_LOG_TYPE_INFO, "%s Can write to file path: %@", (uint8_t *)&v19, 0x16u);
    }
    v17 = objc_alloc_init(_INFilePersistenceConfiguration);
    -[_INFilePersistenceConfiguration setIdentifier:](v17, "setIdentifier:", v9);
    -[_INFilePersistenceConfiguration setFilePath:](v17, "setFilePath:", v11);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      v19 = 136315394;
      v20 = "-[INImage(INImageFilePersistence) _in_writeableFilePersistenceConfigurationForStoreType:]";
      v21 = 2112;
      v22 = v11;
      _os_log_error_impl(&dword_18BEBC000, v16, OS_LOG_TYPE_ERROR, "%s Not able to write to file path: %@", (uint8_t *)&v19, 0x16u);
    }
    v17 = 0;
  }

  return v17;
}

- (NSData)_imageData
{
  return 0;
}

- (id)_in_downscaledImageForFilePersistence
{
  id v3;
  INImage *v4;
  NSObject *v5;
  INImage *v6;
  INImage *v7;
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  INImage *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = _INImageSizeProviderClass();
  if (v3)
  {
    -[INImage _preferredScaledSize](self, "_preferredScaledSize");
    v9 = 0;
    objc_msgSend(v3, "downscaledPNGImageForImage:size:error:", self, &v9);
    v4 = (INImage *)objc_claimAutoreleasedReturnValue();
    v3 = v9;
    if (!v3)
      goto LABEL_7;
    v5 = INSiriLogContextIntents;
    if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v11 = "-[INImage(INImageFilePersistence) _in_downscaledImageForFilePersistence]";
      v12 = 2112;
      v13 = self;
      v14 = 2112;
      v15 = v3;
      _os_log_error_impl(&dword_18BEBC000, v5, OS_LOG_TYPE_ERROR, "%s Failed to downscale data image %@ (non-fatal): %@", buf, 0x20u);
    }

  }
  v4 = 0;
LABEL_7:
  if (v4)
    v6 = v4;
  else
    v6 = self;
  v7 = v6;

  return v7;
}

void __35__INImage_registerImageLoadersOnce__block_invoke()
{
  void *v0;
  void *v1;
  INImageFilePersistence *v2;
  void *v3;
  INImageServiceConnection *v4;
  INPortableImageLoader *v5;

  v5 = objc_alloc_init(INPortableImageLoader);
  +[INImageServiceRegistry sharedInstance](INImageServiceRegistry, "sharedInstance");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "registerImageService:", v5);

  +[INImageServiceRegistry sharedInstance](INImageServiceRegistry, "sharedInstance");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_alloc_init(INImageFilePersistence);
  objc_msgSend(v1, "registerImageService:", v2);

  +[INImageServiceRegistry sharedInstance](INImageServiceRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(INImageServiceConnection);
  objc_msgSend(v3, "registerImageService:", v4);

}

- (id)_intents_readableTitleWithLocalizer:(id)a3 metadata:(id)a4
{
  return 0;
}

- (id)_intents_encodeWithJSONEncoder:(id)a3 codableDescription:(id)a4
{
  id v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  const __CFString *v27;
  void *v28;
  void *v29;
  INImage *v30;
  INImage *v31;
  INImage *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v38[2];
  _QWORD v39[2];
  _QWORD v40[2];
  _QWORD v41[3];

  v41[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INImage _imageSize](self, "_imageSize");
  if (v7 == 0.0 && (-[INImage _imageSize](self, "_imageSize"), v8 == 0.0))
  {
    +[INCache sharedCache](INCache, "sharedCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[INImage _identifier](self, "_identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cacheableObjectForIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = v11;
    if (v12)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v40[0] = CFSTR("width");
        v13 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "_imageSize");
        objc_msgSend(v13, "numberWithDouble:");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v40[1] = CFSTR("height");
        v41[0] = v14;
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(v12, "_imageSize");
        objc_msgSend(v15, "numberWithDouble:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v41[1] = v17;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 2);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKey:", v18, CFSTR("imageSize"));

      }
    }

  }
  else
  {
    v38[0] = CFSTR("width");
    v19 = (void *)MEMORY[0x1E0CB37E8];
    -[INImage _imageSize](self, "_imageSize");
    objc_msgSend(v19, "numberWithDouble:");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v38[1] = CFSTR("height");
    v39[0] = v12;
    v20 = (void *)MEMORY[0x1E0CB37E8];
    -[INImage _imageSize](self, "_imageSize");
    objc_msgSend(v20, "numberWithDouble:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v39, v38, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v23, CFSTR("imageSize"));

  }
  if (-[INImage _renderingMode](self, "_renderingMode"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[INImage _renderingMode](self, "_renderingMode"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v24, CFSTR("renderingMode"));

  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[INImage _imageData](self, "_imageData");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v26, CFSTR("imageData"));
    v27 = CFSTR("Data");
LABEL_24:

    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v27, CFSTR("type"));
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[INImage _URLRepresentation](self, "_URLRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "absoluteString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v28, CFSTR("uri"));

    v27 = CFSTR("Bundle");
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[INImage _URLRepresentation](self, "_URLRepresentation");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "absoluteString");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:", v26);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v29, CFSTR("uri"));

LABEL_23:
    v27 = CFSTR("URL");
    goto LABEL_24;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v30 = self;
    if (v30)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v31 = v30;
      else
        v31 = 0;
    }
    else
    {
      v31 = 0;
    }
    v32 = v31;

    -[INImage _URLRepresentation](v30, "_URLRepresentation");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "absoluteString");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v35, CFSTR("uri"));

    -[INImage _storageServiceIdentifier](v32, "_storageServiceIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "encodeObject:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "if_setObjectIfNonNil:forKey:", v26, CFSTR("storageServiceIdentifier"));
    goto LABEL_23;
  }
LABEL_25:
  v36 = (void *)objc_msgSend(v6, "copy");

  return v36;
}

+ (id)_intents_decodeWithJSONDecoder:(id)a3 codableDescription:(id)a4 from:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v13 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("uri"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_6;
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("type"));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Unknown")) & 1) == 0)
  {
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Data")) & 1) != 0)
    {

      v25 = objc_opt_class();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("imageData"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "decodeObjectOfClass:from:", v25, v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      +[INImage imageWithImageData:](INImage, "imageWithImageData:", v27);
      v13 = (id)objc_claimAutoreleasedReturnValue();

      goto LABEL_7;
    }
    if ((objc_msgSend(v12, "isEqualToString:", CFSTR("URL")) & 1) != 0
      || (objc_msgSend(v12, "isEqualToString:", CFSTR("Bundle")) & 1) != 0)
    {

      objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v10);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      +[INImage imageWithURL:](INImage, "imageWithURL:", v28);
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((objc_msgSend(v12, "isEqualToString:", CFSTR("Proxy")) & 1) == 0)
        goto LABEL_5;

      v13 = -[INImage _initWithIdentifier:]([INRemoteImageProxy alloc], "_initWithIdentifier:", v10);
      objc_msgSend(v13, "_setProxyIdentifier:", v10);
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("storageServiceIdentifier"));
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "_setStorageServiceIdentifier:", v28);
    }

    goto LABEL_7;
  }
LABEL_5:

LABEL_6:
  v13 = -[INImage _initWithIdentifier:]([INImage alloc], "_initWithIdentifier:", v10);
LABEL_7:
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("imageSize"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("width"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("imageSize"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "objectForKeyedSubscript:", CFSTR("height"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(v13, "_setImageSize:", v17, v21);
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("renderingMode"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "integerValue");

  objc_msgSend(v13, "_setRenderingMode:", v23);
LABEL_9:

  return v13;
}

- (int64_t)_compareSubProducerOne:(id)a3 subProducerTwo:(id)a4
{
  return INKeyImageUtilitiesDefaultCompareSubProducers(a3, a4);
}

- (void)generateCachePayloadWithCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  if (v4)
  {
    INCacheableGetSerializationQueue();
    v5 = objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __62__INImage_INCacheSupport__generateCachePayloadWithCompletion___block_invoke;
    v6[3] = &unk_1E2293BE8;
    v6[4] = self;
    v7 = v4;
    dispatch_async(v5, v6);

  }
}

void __62__INImage_INCacheSupport__generateCachePayloadWithCompletion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(*(id *)(a1 + 32), "_imageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v16, "setObject:forKey:", v2, CFSTR("_imageData"));
  objc_msgSend(*(id *)(a1 + 32), "_uri");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v16, "setObject:forKey:", v3, CFSTR("_uri"));
  objc_msgSend(*(id *)(a1 + 32), "_name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v16, "setObject:forKey:", v4, CFSTR("_name"));
  objc_msgSend(*(id *)(a1 + 32), "_bundlePath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v16, "setObject:forKey:", v5, CFSTR("_bundlePath"));
  objc_msgSend(*(id *)(a1 + 32), "_bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    objc_msgSend(v16, "setObject:forKey:", v6, CFSTR("_bundleIdentifier"));
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "_storageServiceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v16, "setObject:forKey:", v7, CFSTR("_storageServiceIdentifier"));
    objc_msgSend(*(id *)(a1 + 32), "_proxyIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      objc_msgSend(v16, "setObject:forKey:", v8, CFSTR("_proxyIdentifier"));

  }
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_imageSize");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v10, CFSTR("_imageSize.width"));

  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 32), "_imageSize");
  objc_msgSend(v11, "numberWithDouble:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setObject:forKey:", v13, CFSTR("_imageSize.height"));

  v14 = *(_QWORD *)(a1 + 40);
  v15 = (void *)objc_msgSend(v16, "copy");
  (*(void (**)(uint64_t, void *))(v14 + 16))(v14, v15);

}

+ (void)buildFromCachePayload:(id)a3 identifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    INCacheableGetSerializationQueue();
    v11 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__INImage_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke;
    v12[3] = &unk_1E228BE60;
    v13 = v9;
    v14 = v8;
    v16 = a1;
    v15 = v10;
    dispatch_async(v11, v12);

  }
}

void __71__INImage_INCacheSupport__buildFromCachePayload_identifier_completion___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;
  INImageBundle *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  id v22;

  v2 = *(id *)(a1 + 32);
  v22 = v2;
  if (!v2 || !objc_msgSend(v2, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "UUIDString");
    v4 = objc_claimAutoreleasedReturnValue();

    v22 = (id)v4;
  }
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("_uri"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("_imageData"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("_name"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("_bundlePath"));
  v8 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("_bundleIdentifier"));
  v9 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("_storageServiceIdentifier"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("_proxyIdentifier"));
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v6)
  {
    +[INImage imageWithImageData:](INImage, "imageWithImageData:", v6);
    v13 = objc_claimAutoreleasedReturnValue();
LABEL_6:
    v14 = (id)v13;
    goto LABEL_10;
  }
  if (v8 | v9 && v7)
  {
    v14 = -[INImage _initWithIdentifier:]([_INBundleImage alloc], "_initWithIdentifier:", 0);
    v15 = objc_alloc_init(INImageBundle);
    -[INImageBundle setBundlePath:](v15, "setBundlePath:", v8);
    -[INImageBundle setBundleIdentifier:](v15, "setBundleIdentifier:", v9);
    objc_msgSend(v14, "setImageName:", v7);
    objc_msgSend(v14, "setImageBundle:", v15);

    goto LABEL_10;
  }
  if (v5)
  {
    +[INImage imageWithURL:](INImage, "imageWithURL:", v5);
    v13 = objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v14 = 0;
  if (v10 && v11)
  {
    v14 = -[INImage _initWithIdentifier:]([INRemoteImageProxy alloc], "_initWithIdentifier:", v22);
    objc_msgSend(v14, "_setStorageServiceIdentifier:", v10);
    objc_msgSend(v14, "_setProxyIdentifier:", v12);
  }
LABEL_10:
  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("_imageSize.width"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  objc_msgSend(*(id *)(a1 + 40), "objectForKey:", CFSTR("_imageSize.height"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  objc_msgSend(v14, "_setImageSize:", v18, v21);
  objc_msgSend(v14, "_setIdentifier:", v22);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

- (void)_injectProxiesForImages:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD *);
  void *v8;
  _QWORD v9[4];
  id v10;

  v6 = a4;
  if (v6)
  {
    v7 = (void (**)(id, void *, _QWORD *))a3;
    v8 = (void *)-[INImage copy](self, "copy");
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __69__INImage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke;
    v9[3] = &unk_1E228C728;
    v10 = v6;
    v7[2](v7, v8, v9);

  }
}

uint64_t __69__INImage_INImageProxyInjecting___injectProxiesForImages_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (INImage)imageWithImageData:(NSData *)imageData
{
  NSData *v3;
  _INDataImage *v4;

  v3 = imageData;
  v4 = -[_INDataImage initWithImageData:]([_INDataImage alloc], "initWithImageData:", v3);

  return (INImage *)v4;
}

+ (INImage)imageNamed:(NSString *)name
{
  NSString *v3;
  id v4;
  INImageBundle *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = name;
  v4 = -[INImage _initWithIdentifier:]([_INBundleImage alloc], "_initWithIdentifier:", 0);
  objc_msgSend(v4, "setImageName:", v3);

  v5 = objc_alloc_init(INImageBundle);
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[INImageBundle setBundleIdentifier:](v5, "setBundleIdentifier:", v7);

  objc_msgSend(v4, "setImageBundle:", v5);
  +[INCache sharedCache](INCache, "sharedCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addCacheableObject:", v4);

  return (INImage *)v4;
}

+ (id)_bundleImageWithURL:(id)a3
{
  id v3;
  _INBundleImage *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = [_INBundleImage alloc];
  objc_msgSend(v3, "absoluteString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[INImage _initWithIdentifier:](v4, "_initWithIdentifier:", v5);
  return v6;
}

+ (id)_classesInCluster
{
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  v3[2] = objc_opt_class();
  v3[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (INImage)init
{

  return 0;
}

- (id)_initWithData:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "imageWithImageData:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)_isSystem
{
  return 0;
}

- (BOOL)_requiresRetrieval
{
  void *v2;
  BOOL v3;

  -[INImage _imageData](self, "_imageData");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 == 0;

  return v3;
}

- (void)_retrieveImageDataWithReply:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  INImage *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (v4)
  {
    -[INImage _preferredImageLoader](self, "_preferredImageLoader");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v13 = "-[INImage _retrieveImageDataWithReply:]";
        v14 = 2112;
        v15 = v5;
        v16 = 2112;
        v17 = self;
        _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Found preferred image loader %@ for image %@, attempting load", buf, 0x20u);
      }
      objc_msgSend(v5, "loadDataImageFromImage:usingPortableImageLoader:scaledSize:completion:", self, 0, v4, 0.0, 0.0);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2D50];
      v11 = CFSTR("No preferred image loader available for image: %@");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6001, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v9);

    }
  }

}

- (void)_retrieveImageFilePathWithReply:(id)a3
{
  void (**v4)(id, _QWORD, void *);
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const __CFString *v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  INImage *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD, void *))a3;
  if (v4)
  {
    -[INImage _preferredImageLoaderForFilePath](self, "_preferredImageLoaderForFilePath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = INSiriLogContextIntents;
      if (os_log_type_enabled((os_log_t)INSiriLogContextIntents, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315650;
        v13 = "-[INImage _retrieveImageFilePathWithReply:]";
        v14 = 2112;
        v15 = v5;
        v16 = 2112;
        v17 = self;
        _os_log_impl(&dword_18BEBC000, v6, OS_LOG_TYPE_INFO, "%s Found preferred image loader %@ for image %@, attempting load", buf, 0x20u);
      }
      objc_msgSend(v5, "filePathForImage:usingPortableImageLoader:completion:", self, 0, v4);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v10 = *MEMORY[0x1E0CB2D50];
      v11 = CFSTR("No preferred image loader available for image: %@");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6001, v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v4[2](v4, 0, v9);

    }
  }

}

- (void)_requestProxy:(id)a3
{
  +[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:completion:](INRemoteImageProxy, "requestProxyByStoringImage:qualityOfService:scaled:storeType:completion:", self, 17, 0, 0, a3);
}

- (id)_proxiedImageWithError:(id *)a3
{
  return +[INRemoteImageProxy requestProxyByStoringImage:qualityOfService:scaled:storeType:error:](INRemoteImageProxy, "requestProxyByStoringImage:qualityOfService:scaled:storeType:error:", self, 25, 0, 0, a3);
}

- (NSURL)_uri
{
  return 0;
}

- (NSString)_name
{
  return 0;
}

- (NSString)_bundlePath
{
  return 0;
}

- (NSString)_bundleIdentifier
{
  return 0;
}

- (NSData)_sandboxExtensionData
{
  return 0;
}

- (id)_preferredImageLoader
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[INImageServiceRegistry sharedInstance](INImageServiceRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageLoaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (((objc_opt_respondsToSelector() & 1) == 0
           || objc_msgSend(v10, "canLoadImageDataForImage:", self, (_QWORD)v13))
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = v10;
          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)_preferredImageLoaderForFilePath
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  +[INImageServiceRegistry sharedInstance](INImageServiceRegistry, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageLoaders");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (((objc_opt_respondsToSelector() & 1) == 0
           || objc_msgSend(v10, "canLoadImageDataForImage:", self, (_QWORD)v13))
          && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v11 = v10;
          goto LABEL_13;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)_URLRepresentation
{
  return 0;
}

- (id)_initWithURLRepresentation:(id)a3
{

  return 0;
}

- (BOOL)_isEligibleForProxying
{
  return 0;
}

- (BOOL)_isSupportedForDonation
{
  return 1;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[INImage _identifier](self, "_identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  INImage *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (INImage *)v4;
    if (self == v5)
    {
      v11 = 1;
    }
    else
    {
      -[INImage _identifier](self, "_identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[INImage _identifier](v5, "_identifier");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v6 == (void *)v7)
      {
        v11 = 1;
        v8 = v6;
      }
      else
      {
        v8 = (void *)v7;
        -[INImage _identifier](self, "_identifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[INImage _identifier](v5, "_identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "isEqual:", v10);

      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_description
{
  return -[INImage _descriptionAtIndent:](self, "_descriptionAtIndent:", 0);
}

- (id)_descriptionAtIndent:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  v5 = (void *)MEMORY[0x1E0CB3940];
  v11.receiver = self;
  v11.super_class = (Class)INImage;
  -[INImage description](&v11, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[INImage _dictionaryRepresentation](self, "_dictionaryRepresentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "descriptionAtIndent:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ %@"), v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_dictionaryRepresentation
{
  void *v3;
  NSString *identifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];
  _QWORD v11[4];

  v11[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("width:%f height:%f"), *(_QWORD *)&self->_imageSize.width, *(_QWORD *)&self->_imageSize.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = CFSTR("identifier");
  identifier = self->_identifier;
  v5 = identifier;
  if (!identifier)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[0] = v5;
  v10[1] = CFSTR("_imageSize");
  v6 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v11[1] = v6;
  v10[2] = CFSTR("_renderingMode");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->__renderingMode);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[2] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {

    if (identifier)
      goto LABEL_7;
LABEL_9:

    goto LABEL_7;
  }
  if (!identifier)
    goto LABEL_9;
LABEL_7:

  return v8;
}

- (NSString)_identifier
{
  return self->_identifier;
}

- (void)_setIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void)_loadImageDataAndSizeWithHelper:(id)a3 accessSpecifier:(id)a4 completion:(id)a5
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  if (a5)
  {
    v6 = (void *)MEMORY[0x1E0CB35C8];
    v11 = *MEMORY[0x1E0CB2D50];
    v12[0] = CFSTR("No intrinsic loading supported in the base class.");
    v7 = (void *)MEMORY[0x1E0C99D80];
    v8 = a5;
    objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6003, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, _QWORD, void *, double, double))a5 + 2))(v8, 0, 0, v10, 0.0, 0.0);

  }
}

- (void)_retrieveFilePathWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB35C8];
    v9 = *MEMORY[0x1E0CB2D50];
    v10[0] = CFSTR("Attempted to grab file path for an INImage, which is not supported");
    v5 = (void *)MEMORY[0x1E0C99D80];
    v6 = a3;
    objc_msgSend(v5, "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("IntentsErrorDomain"), 6004, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, void *))a3 + 2))(v6, 0, v8);

  }
}

@end
