@implementation IFCacheImage

- (NSData)validationToken
{
  return (NSData *)objc_getProperty(self, a2, 120, 1);
}

- (NSUUID)uuid
{
  return (NSUUID *)objc_getProperty(self, a2, 112, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_validationToken, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (IFCacheImage)initWithData:(id)a3 uuid:(id)a4 validationToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  CGImage *v13;
  unint64_t v14;
  void *v15;
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  NSObject *v22;
  IFCacheImage *v23;
  IFCacheImage *v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v8, "__IS_imageHeader");
  if (!v11)
  {
    IFDefaultLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[IFCacheImage initWithData:uuid:validationToken:].cold.3();

  }
  v13 = +[IFImage createCGImageWithIFImageData:](IFImage, "createCGImageWithIFImageData:", v8);
  if (v13)
  {
    if (v11)
      goto LABEL_7;
  }
  else
  {
    IFDefaultLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[IFCacheImage initWithData:uuid:validationToken:].cold.2();

    if (v11)
    {
LABEL_7:
      if (*(_DWORD *)(v11 + 8))
      {
        +[IFImage createCALayereWithIFImageData:](IFImage, "createCALayereWithIFImageData:", v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
LABEL_13:
          v17 = *(float *)(v11 + 24);
          v18 = *(float *)(v11 + 28);
          LODWORD(v14) = *(_DWORD *)(v11 + 12);
          v19 = *(float *)(v11 + 16);
          v20 = *(float *)(v11 + 20);
          v21 = (double)v14;
          goto LABEL_18;
        }
        IFDefaultLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          -[IFCacheImage initWithData:uuid:validationToken:].cold.1();

      }
      v15 = 0;
      goto LABEL_13;
    }
  }
  v15 = 0;
  v21 = 0.0;
  v19 = 0.0;
  v20 = 0.0;
  v17 = 0.0;
  v18 = 0.0;
LABEL_18:
  v23 = -[IFConcreteImage initWithCGImage:scale:](self, "initWithCGImage:scale:", v13, v21);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_uuid, a4);
    objc_storeStrong((id *)&v24->_validationToken, a5);
    -[IFConcreteImage setMinimumSize:](v24, "setMinimumSize:", v17, v18);
    -[IFConcreteImage setIconSize:](v24, "setIconSize:", v19, v20);
    -[IFImage setCALayer:](v24, "setCALayer:", v15);
  }
  if (v13)
    CFRelease(v13);

  return v24;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (IFCacheImage)initWithCoder:(id)a3
{
  id v4;
  IFCacheImage *v5;
  uint64_t v6;
  NSUUID *uuid;
  uint64_t v8;
  NSData *validationToken;
  float v10;
  double v11;
  float v12;
  float v13;
  double v14;
  float v15;
  objc_super v17;

  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)IFCacheImage;
  v5 = -[IFImage initWithCoder:](&v17, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "_IF_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("uuid"));
    v6 = objc_claimAutoreleasedReturnValue();
    uuid = v5->_uuid;
    v5->_uuid = (NSUUID *)v6;

    objc_msgSend(v4, "_IF_decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("validationToken"));
    v8 = objc_claimAutoreleasedReturnValue();
    validationToken = v5->_validationToken;
    v5->_validationToken = (NSData *)v8;

    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("minimumSize.width"));
    v11 = v10;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("minimumSize.height"));
    -[IFConcreteImage setMinimumSize:](v5, "setMinimumSize:", v11, v12);
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("iconSize.width"));
    v14 = v13;
    objc_msgSend(v4, "decodeFloatForKey:", CFSTR("iconSize.height"));
    -[IFConcreteImage setIconSize:](v5, "setIconSize:", v14, v15);
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)IFCacheImage;
  v4 = a3;
  -[IFImage encodeWithCoder:](&v11, sel_encodeWithCoder_, v4);
  objc_msgSend(v4, "encodeObject:forKey:", self->_uuid, CFSTR("uuid"), v11.receiver, v11.super_class);
  objc_msgSend(v4, "encodeObject:forKey:", self->_validationToken, CFSTR("validationToken"));
  -[IFConcreteImage minimumSize](self, "minimumSize");
  *(float *)&v5 = v5;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("minimumSize.width"), v5);
  -[IFConcreteImage minimumSize](self, "minimumSize");
  *(float *)&v7 = v6;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("minimumSize.height"), v7);
  -[IFConcreteImage iconSize](self, "iconSize");
  *(float *)&v8 = v8;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("iconSize.width"), v8);
  -[IFConcreteImage iconSize](self, "iconSize");
  *(float *)&v10 = v9;
  objc_msgSend(v4, "encodeFloat:forKey:", CFSTR("iconSize.height"), v10);

}

- (void)initWithData:uuid:validationToken:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D4106000, v0, v1, "Failed to read layer tree from cache data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithData:uuid:validationToken:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D4106000, v0, v1, "Failed to read bitmap image from cache data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithData:uuid:validationToken:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_1D4106000, v0, v1, "Failed to read header from cache data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
