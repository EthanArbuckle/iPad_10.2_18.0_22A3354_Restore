@implementation CRSUIWallpaperSceneSettings

- (CRWallpaperData)wallpaper
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 1049979832);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (CRWallpaperData *)v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[FBSSettings initWithSettings:]([CRSUIMutableWallpaperSceneSettings alloc], "initWithSettings:", self);
}

@end
