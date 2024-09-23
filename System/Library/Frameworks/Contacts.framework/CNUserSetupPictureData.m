@implementation CNUserSetupPictureData

+ (id)log
{
  if (log_cn_once_token_0_2 != -1)
    dispatch_once(&log_cn_once_token_0_2, &__block_literal_global_39);
  return (id)log_cn_once_object_0_2;
}

void __29__CNUserSetupPictureData_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts.ui", "CNUserSetupPictureData");
  v1 = (void *)log_cn_once_object_0_2;
  log_cn_once_object_0_2 = (uint64_t)v0;

}

+ (id)userSetupPictureDataFromData:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v15;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0CB3710];
    v4 = a3;
    v15 = 0;
    objc_msgSend(v3, "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v4, &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v15;
    if (!v5)
    {
      objc_msgSend((id)objc_opt_class(), "log");
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        +[CNUserSetupPictureData userSetupPictureDataFromData:].cold.1((uint64_t)v6, v7, v8, v9, v10, v11, v12, v13);

    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (CNUserSetupPictureData)initWithImageData:(id)a3 thumbnailImageData:(id)a4 cropRect:(CGRect)a5 memojiMetadata:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v14;
  id v15;
  id v16;
  CNUserSetupPictureData *v17;
  CNUserSetupPictureData *v18;
  CNUserSetupPictureData *v19;
  objc_super v21;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v21.receiver = self;
  v21.super_class = (Class)CNUserSetupPictureData;
  v17 = -[CNUserSetupPictureData init](&v21, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_imageData, a3);
    objc_storeStrong((id *)&v18->_thumbnailImageData, a4);
    v18->_cropRect.origin.x = x;
    v18->_cropRect.origin.y = y;
    v18->_cropRect.size.width = width;
    v18->_cropRect.size.height = height;
    objc_storeStrong((id *)&v18->_memojiMetadata, a6);
    v19 = v18;
  }

  return v18;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CNUserSetupPictureData)initWithCoder:(id)a3
{
  id v4;
  int v5;
  void *v6;
  void *v7;
  NSString *v8;
  double x;
  double y;
  double width;
  double height;
  void *v13;
  CNUserSetupPictureData *v14;
  int v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSRect v24;

  v4 = a3;
  v5 = objc_msgSend(v4, "decodeIntForKey:", CFSTR("version"));
  if (v5 >= 2)
  {
    v15 = v5;
    objc_msgSend((id)objc_opt_class(), "log");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[CNUserSetupPictureData initWithCoder:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

    v14 = 0;
  }
  else
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("imageData"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("thumbnailImageData"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("cropRect"));
    v8 = (NSString *)objc_claimAutoreleasedReturnValue();
    v24 = NSRectFromString(v8);
    x = v24.origin.x;
    y = v24.origin.y;
    width = v24.size.width;
    height = v24.size.height;
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("memojiMetadata"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[CNUserSetupPictureData initWithImageData:thumbnailImageData:cropRect:memojiMetadata:](self, "initWithImageData:thumbnailImageData:cropRect:memojiMetadata:", v6, v7, v13, x, y, width, height);

    v14 = self;
  }

  return v14;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSRect v9;

  v4 = a3;
  objc_msgSend(v4, "encodeInt:forKey:", 1, CFSTR("version"));
  -[CNUserSetupPictureData imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("imageData"));

  -[CNUserSetupPictureData thumbnailImageData](self, "thumbnailImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("thumbnailImageData"));

  -[CNUserSetupPictureData cropRect](self, "cropRect");
  NSStringFromRect(v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v7, CFSTR("cropRect"));

  -[CNUserSetupPictureData memojiMetadata](self, "memojiMetadata");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v8, CFSTR("memojiMetadata"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  CNUserSetupPictureData *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  CNUserSetupPictureData *v16;

  v4 = [CNUserSetupPictureData alloc];
  -[CNUserSetupPictureData imageData](self, "imageData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUserSetupPictureData thumbnailImageData](self, "thumbnailImageData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNUserSetupPictureData cropRect](self, "cropRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CNUserSetupPictureData memojiMetadata](self, "memojiMetadata");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[CNUserSetupPictureData initWithImageData:thumbnailImageData:cropRect:memojiMetadata:](v4, "initWithImageData:thumbnailImageData:cropRect:memojiMetadata:", v5, v6, v15, v8, v10, v12, v14);

  return v16;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
}

- (NSData)thumbnailImageData
{
  return self->_thumbnailImageData;
}

- (void)setThumbnailImageData:(id)a3
{
  objc_storeStrong((id *)&self->_thumbnailImageData, a3);
}

- (CGRect)cropRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_cropRect.origin.x;
  y = self->_cropRect.origin.y;
  width = self->_cropRect.size.width;
  height = self->_cropRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setCropRect:(CGRect)a3
{
  self->_cropRect = a3;
}

- (NSData)memojiMetadata
{
  return self->_memojiMetadata;
}

- (void)setMemojiMetadata:(id)a3
{
  objc_storeStrong((id *)&self->_memojiMetadata, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_memojiMetadata, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

+ (void)userSetupPictureDataFromData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Error unarchiving setup user picture data: %@", a5, a6, a7, a8, 2u);
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_18F8BD000, a2, a3, "Unknown versions for Setup User picture data: %ld", a5, a6, a7, a8, 0);
}

@end
