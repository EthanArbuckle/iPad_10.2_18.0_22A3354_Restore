@implementation CNSharingProfileOnboardingFlowResult

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("givenName"), self->_givenName);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("familyName"), self->_familyName);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("imageData"), self->_imageData);
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("wallpaper"), self->_wallpaper);
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("watchWallpaperImageData"), self->_watchWallpaperImageData);
  NSStringFromCGRect(self->_cropRect);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("cropRect"), v9);

  v11 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("type"), self->_type);
  v12 = (id)objc_msgSend(v3, "appendName:integerValue:", CFSTR("sharingAudience"), self->_sharingAudience);
  v13 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("didPersistImageToContact"), self->_didPersistImageToContact);
  objc_msgSend(v3, "build");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (void)setGivenName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSString)familyName
{
  return self->_familyName;
}

- (void)setFamilyName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
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

- (NSData)imageData
{
  return self->_imageData;
}

- (void)setImageData:(id)a3
{
  objc_storeStrong((id *)&self->_imageData, a3);
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

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (unint64_t)sharingAudience
{
  return self->_sharingAudience;
}

- (void)setSharingAudience:(unint64_t)a3
{
  self->_sharingAudience = a3;
}

- (BOOL)didPersistImageToContact
{
  return self->_didPersistImageToContact;
}

- (void)setDidPersistImageToContact:(BOOL)a3
{
  self->_didPersistImageToContact = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_watchWallpaperImageData, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

@end
