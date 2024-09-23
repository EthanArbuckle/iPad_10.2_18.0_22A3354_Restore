@implementation CNMeCardSharingResult

- (CNMeCardSharingResult)initWithGivenName:(id)a3 familyName:(id)a4 contactImage:(id)a5 wallpaper:(id)a6 watchWallpaperImageData:(id)a7 didSaveImageToMeCard:(BOOL)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  CNMeCardSharingResult *v18;
  CNMeCardSharingResult *v19;
  CNMeCardSharingResult *v20;
  id v23;
  objc_super v24;

  v23 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v24.receiver = self;
  v24.super_class = (Class)CNMeCardSharingResult;
  v18 = -[CNMeCardSharingResult init](&v24, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_givenName, a3);
    objc_storeStrong((id *)&v19->_familyName, a4);
    objc_storeStrong((id *)&v19->_contactImage, a5);
    objc_storeStrong((id *)&v19->_wallpaper, a6);
    objc_storeStrong((id *)&v19->_watchWallpaperImageData, a7);
    v19->_didSaveImageToMeCard = a8;
    v20 = v19;
  }

  return v19;
}

- (id)description
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0D13A08], "descriptionBuilderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("givenName"), self->_givenName);
  v5 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("familyName"), self->_familyName);
  v6 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("contactImage"), self->_contactImage);
  v7 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("wallpaper"), self->_wallpaper);
  v8 = (id)objc_msgSend(v3, "appendName:object:", CFSTR("watchWallpaperImageData"), self->_watchWallpaperImageData);
  v9 = (id)objc_msgSend(v3, "appendName:BOOLValue:", CFSTR("didSaveToMeCard"), self->_didSaveImageToMeCard);
  objc_msgSend(v3, "build");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)givenName
{
  return self->_givenName;
}

- (NSString)familyName
{
  return self->_familyName;
}

- (CNContactImage)contactImage
{
  return self->_contactImage;
}

- (CNWallpaper)wallpaper
{
  return self->_wallpaper;
}

- (NSData)watchWallpaperImageData
{
  return self->_watchWallpaperImageData;
}

- (BOOL)didSaveImageToMeCard
{
  return self->_didSaveImageToMeCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchWallpaperImageData, 0);
  objc_storeStrong((id *)&self->_wallpaper, 0);
  objc_storeStrong((id *)&self->_contactImage, 0);
  objc_storeStrong((id *)&self->_familyName, 0);
  objc_storeStrong((id *)&self->_givenName, 0);
}

@end
