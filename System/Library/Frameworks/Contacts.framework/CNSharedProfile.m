@implementation CNSharedProfile

+ (id)log
{
  if (log_cn_once_token_0_6 != -1)
    dispatch_once(&log_cn_once_token_0_6, &__block_literal_global_89);
  return (id)log_cn_once_object_0_6;
}

void __22__CNSharedProfile_log__block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.contacts", "CNSharedProfile");
  v1 = (void *)log_cn_once_object_0_6;
  log_cn_once_object_0_6 = (uint64_t)v0;

}

- (CNSharedProfile)initWithNickname:(id)a3
{
  id v4;
  CNSharedProfile *v5;
  void *v6;
  uint64_t v7;
  NSData *imageData;
  void *v9;
  uint64_t v10;
  NSData *thumbnailImageData;
  CGSize v12;
  CNWallpaper *v13;
  void *v14;
  void *v15;
  void *v16;
  CNWallpaper *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  CNWallpaper *wallpaper;
  CNWallpaper *v22;
  void *v23;
  uint64_t v24;
  NSData *watchWallpaperImageData;
  CNSharedProfile *v26;
  objc_super v28;

  v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)CNSharedProfile;
  v5 = -[CNSharedProfile init](&v28, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "avatar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageData");
    v7 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v7;

    objc_msgSend(v4, "avatar");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "imageData");
    v10 = objc_claimAutoreleasedReturnValue();
    thumbnailImageData = v5->_thumbnailImageData;
    v5->_thumbnailImageData = (NSData *)v10;

    v12 = *(CGSize *)(MEMORY[0x1E0C9D648] + 16);
    v5->_cropRect.origin = (CGPoint)*MEMORY[0x1E0C9D648];
    v5->_cropRect.size = v12;
    v13 = [CNWallpaper alloc];
    objc_msgSend(v4, "wallpaper");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "wallpaperData");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "wallpaper");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[CNWallpaper initWithPosterArchiveData:contentIsSensitive:](v13, "initWithPosterArchiveData:contentIsSensitive:", v15, objc_msgSend(v16, "contentIsSensitive"));

    objc_msgSend(v4, "wallpaper");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "metadata");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      -[CNWallpaper wallpaperIncludingIMWallpaperMetadata:](v17, "wallpaperIncludingIMWallpaperMetadata:", v19);
      v20 = objc_claimAutoreleasedReturnValue();

      v17 = (CNWallpaper *)v20;
    }
    wallpaper = v5->_wallpaper;
    v5->_wallpaper = v17;
    v22 = v17;

    objc_msgSend(v4, "wallpaper");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "lowResWallpaperData");
    v24 = objc_claimAutoreleasedReturnValue();
    watchWallpaperImageData = v5->_watchWallpaperImageData;
    v5->_watchWallpaperImageData = (NSData *)v24;

    v26 = v5;
  }

  return v5;
}

- (CNSharedProfile)initWithContact:(id)a3
{
  id v4;
  CNSharedProfile *v5;
  uint64_t v6;
  NSData *imageData;
  uint64_t v8;
  NSData *thumbnailImageData;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  uint64_t v14;
  NSString *imageType;
  uint64_t v16;
  CNWallpaper *wallpaper;
  uint64_t v18;
  NSData *watchWallpaperImageData;
  CNSharedProfile *v20;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CNSharedProfile;
  v5 = -[CNSharedProfile init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "imageData");
    v6 = objc_claimAutoreleasedReturnValue();
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v6;

    objc_msgSend(v4, "thumbnailImageData");
    v8 = objc_claimAutoreleasedReturnValue();
    thumbnailImageData = v5->_thumbnailImageData;
    v5->_thumbnailImageData = (NSData *)v8;

    objc_msgSend(v4, "cropRect");
    v5->_cropRect.origin.x = v10;
    v5->_cropRect.origin.y = v11;
    v5->_cropRect.size.width = v12;
    v5->_cropRect.size.height = v13;
    objc_msgSend(v4, "imageType");
    v14 = objc_claimAutoreleasedReturnValue();
    imageType = v5->_imageType;
    v5->_imageType = (NSString *)v14;

    objc_msgSend(v4, "wallpaper");
    v16 = objc_claimAutoreleasedReturnValue();
    wallpaper = v5->_wallpaper;
    v5->_wallpaper = (CNWallpaper *)v16;

    objc_msgSend(v4, "watchWallpaperImageData");
    v18 = objc_claimAutoreleasedReturnValue();
    watchWallpaperImageData = v5->_watchWallpaperImageData;
    v5->_watchWallpaperImageData = (NSData *)v18;

    v20 = v5;
  }

  return v5;
}

- (CNSharedProfile)initWithRecentContactImage:(id)a3 recentPoster:(id)a4
{
  id v6;
  id v7;
  CNSharedProfile *v8;
  uint64_t v9;
  NSData *imageData;
  void *v11;
  uint64_t v12;
  NSData *thumbnailImageData;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  uint64_t v18;
  NSString *imageType;
  CNWallpaper *v20;
  void *v21;
  CNWallpaper *v22;
  CNWallpaper *wallpaper;
  CNWallpaper *v24;
  NSData *watchWallpaperImageData;
  CNSharedProfile *v26;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)CNSharedProfile;
  v8 = -[CNSharedProfile init](&v28, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "imageData");
    v9 = objc_claimAutoreleasedReturnValue();
    imageData = v8->_imageData;
    v8->_imageData = (NSData *)v9;

    objc_msgSend(v6, "imageData");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cropRect");
    -[CNSharedProfile thumbnailImageDataFromImageData:cropRect:](v8, "thumbnailImageDataFromImageData:cropRect:", v11);
    v12 = objc_claimAutoreleasedReturnValue();
    thumbnailImageData = v8->_thumbnailImageData;
    v8->_thumbnailImageData = (NSData *)v12;

    objc_msgSend(v6, "cropRect");
    v8->_cropRect.origin.x = v14;
    v8->_cropRect.origin.y = v15;
    v8->_cropRect.size.width = v16;
    v8->_cropRect.size.height = v17;
    -[CNSharedProfile imageTypeStringFromContactImage:](v8, "imageTypeStringFromContactImage:", v6);
    v18 = objc_claimAutoreleasedReturnValue();
    imageType = v8->_imageType;
    v8->_imageType = (NSString *)v18;

    v20 = [CNWallpaper alloc];
    objc_msgSend(v7, "posterData");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[CNWallpaper initWithPosterArchiveData:](v20, "initWithPosterArchiveData:", v21);

    wallpaper = v8->_wallpaper;
    v8->_wallpaper = v22;
    v24 = v22;

    watchWallpaperImageData = v8->_watchWallpaperImageData;
    v8->_watchWallpaperImageData = 0;

    v26 = v8;
  }

  return v8;
}

- (id)imageTypeStringFromContactImage:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;

  v3 = a3;
  v4 = v3;
  if (v3 && (v5 = objc_msgSend(v3, "source"), (unint64_t)(v5 - 1) <= 3))
    v6 = *off_1E29FBE10[v5 - 1];
  else
    v6 = 0;

  return v6;
}

- (NSData)thumbnailImageData
{
  NSData *thumbnailImageData;
  void *v4;
  NSData *v5;
  NSData *v6;

  thumbnailImageData = self->_thumbnailImageData;
  if (!thumbnailImageData)
  {
    -[CNSharedProfile imageData](self, "imageData");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNSharedProfile cropRect](self, "cropRect");
    -[CNSharedProfile thumbnailImageDataFromImageData:cropRect:](self, "thumbnailImageDataFromImageData:cropRect:", v4);
    v5 = (NSData *)objc_claimAutoreleasedReturnValue();
    v6 = self->_thumbnailImageData;
    self->_thumbnailImageData = v5;

    thumbnailImageData = self->_thumbnailImageData;
  }
  return thumbnailImageData;
}

- (id)thumbnailImageDataFromImageData:(id)a3 cropRect:(CGRect)a4
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  id v9;

  v9 = 0;
  CNImageUtilsCroppedImageDataFromFullSizeImageData(a3, &v9, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v9;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[CNSharedProfile thumbnailImageDataFromImageData:cropRect:].cold.1(v5, v7);

  }
  return v4;
}

- (CNContact)contact
{
  CNMutableContact *v3;

  v3 = objc_alloc_init(CNMutableContact);
  -[CNMutableContact setImageData:](v3, "setImageData:", self->_imageData);
  -[CNMutableContact setThumbnailImageData:](v3, "setThumbnailImageData:", self->_thumbnailImageData);
  -[CNMutableContact setCropRect:](v3, "setCropRect:", self->_cropRect.origin.x, self->_cropRect.origin.y, self->_cropRect.size.width, self->_cropRect.size.height);
  -[CNMutableContact setWallpaper:](v3, "setWallpaper:", self->_wallpaper);
  -[CNMutableContact setImageType:](v3, "setImageType:", self->_imageType);
  -[CNMutableContact setWatchWallpaperImageData:](v3, "setWatchWallpaperImageData:", self->_watchWallpaperImageData);
  return (CNContact *)v3;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
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

- (NSString)imageType
{
  return self->_imageType;
}

- (void)setImageType:(id)a3
{
  objc_storeStrong((id *)&self->_imageType, a3);
}

- (CNWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (void)setWallpaper:(id)a3
{
  objc_storeStrong((id *)&self->_wallpaper, a3);
}

- (NSData)watchWallpaperImageData
{
  return self->_watchWallpaperImageData;
}

- (void)setWatchWallpaperImageData:(id)a3
{
  objc_storeStrong((id *)&self->_watchWallpaperImageData, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchWallpaperImageData, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_imageType, 0);
  objc_storeStrong((id *)&self->_thumbnailImageData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
}

- (void)thumbnailImageDataFromImageData:(void *)a1 cropRect:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_18F8BD000, a2, OS_LOG_TYPE_ERROR, "Failed to generate thumbnailImageData, %@", (uint8_t *)&v4, 0xCu);

}

@end
