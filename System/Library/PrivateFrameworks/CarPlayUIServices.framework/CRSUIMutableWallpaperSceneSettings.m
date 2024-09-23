@implementation CRSUIMutableWallpaperSceneSettings

- (void)setWallpaper:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 1049979832);

}

- (id)copyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([CRSUIWallpaperSceneSettings alloc], "initWithSettings:", self);
}

- (CRWallpaperData)wallpaper
{
  return self->_wallpaper;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_wallpaper, 0);
}

@end
