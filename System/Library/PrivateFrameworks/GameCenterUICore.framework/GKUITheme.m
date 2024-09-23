@implementation GKUITheme

- (GKUtilityService)utilityService
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE3A178], "daemonProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "utilityService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GKUtilityService *)v3;
}

- (void)clearResourceCache
{
  void *v2;

  -[GKUITheme resourceCache](self, "resourceCache");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

  +[GKImageSource clearCache](GKImageSource, "clearCache");
}

+ (id)sharedTheme
{
  if (sharedTheme_onceToken != -1)
    dispatch_once(&sharedTheme_onceToken, &__block_literal_global_13);
  return (id)sharedTheme_sSharedTheme;
}

void __24__GKUITheme_sharedTheme__block_invoke()
{
  GKUITheme *v0;
  void *v1;

  v0 = objc_alloc_init(GKUITheme);
  v1 = (void *)sharedTheme_sSharedTheme;
  sharedTheme_sSharedTheme = (uint64_t)v0;

}

- (GKUITheme)init
{
  GKUITheme *v2;
  id v3;
  GKUITheme *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKUITheme;
  v2 = -[GKUITheme init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    objc_msgSend(v3, "setName:", CFSTR("com.apple.gamekit.theme.cache"));
    -[GKUITheme setResourceCache:](v2, "setResourceCache:", v3);
    v4 = v2;

  }
  return v2;
}

- (id)imageNamed:(id)a3
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  v4 = GKThemeBundle_onceToken[0];
  v5 = a3;
  if (v4 != -1)
    dispatch_once(GKThemeBundle_onceToken, &__block_literal_global_167);
  objc_msgSend(v3, "imageNamed:inBundle:", v5, GKThemeBundle_bundle);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)messagesInviteBackgroundImage
{
  return -[GKUITheme imageNamed:](self, "imageNamed:", CFSTR("GKMessageImage"));
}

- (UIImage)ratingStarsBackgroundImage
{
  return (UIImage *)-[GKUITheme imageNamed:](self, "imageNamed:", CFSTR("GKRatingStarsSmallBackground"));
}

- (UIImage)ratingStarsForegroundImage
{
  return (UIImage *)-[GKUITheme imageNamed:](self, "imageNamed:", CFSTR("GKRatingStarsSmallForeground"));
}

- (UIImage)interactiveRatingStarsForeground
{
  return (UIImage *)-[GKUITheme imageNamed:](self, "imageNamed:", CFSTR("DWGameRatingStars"));
}

- (UIImage)interactiveRatingStarsBackground
{
  return (UIImage *)-[GKUITheme imageNamed:](self, "imageNamed:", CFSTR("DWGameRatingDots"));
}

- (id)eventIconImage
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  NSStringFromSelector(a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __27__GKUITheme_eventIconImage__block_invoke;
  v6[3] = &unk_24DC27FF8;
  v6[4] = self;
  -[GKUITheme resourceWithName:missingHandler:](self, "resourceWithName:missingHandler:", v3, v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id __27__GKUITheme_eventIconImage__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  +[GKBrush brush](GKiOSAppIconBrush, "brush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "imageNamed:", CFSTR("GKEventIcon"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  objc_msgSend(v2, "drawnImageForSize:opaque:input:", 0, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)secondaryLabelCompositingFilter
{
  if (*MEMORY[0x24BE3A2C0])
    return (id)*MEMORY[0x24BDE5BD8];
  else
    return 0;
}

- (id)achievementsNotStartedIcon
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:", CFSTR("lock.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)achievementsDefaultIcon
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("list.portrait.on.rectangle.portrait.angled.fill"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (CGSize)formSheetSize
{
  double v2;
  double v3;
  CGSize result;

  objc_msgSend(MEMORY[0x24BDF6F98], "defaultFormSheetSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (CGSize)authenticateExtensionFormSheetSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = 624.0;
  v3 = 740.0;
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)formSheetCornerRadius
{
  return 10.0;
}

- (id)resourceForSelector:(SEL)a3 missingHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  v6 = a4;
  NSStringFromSelector(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKUITheme resourceWithName:missingHandler:](self, "resourceWithName:missingHandler:", v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)resourceWithName:(id)a3 missingHandler:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  uint64_t v9;
  void *v10;

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  -[GKUITheme resourceCache](self, "resourceCache");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKey:", v6);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (v7 && !v9)
  {
    v7[2](v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKey:", v10, v6);
  }

  return v10;
}

- (id)networkImageSourceWithName:(id)a3 imageBrush:(id)a4
{
  id v5;
  id v6;
  GKNetworkImageSource *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GKImageSource initWithName:imageBrush:]([GKNetworkImageSource alloc], "initWithName:imageBrush:", v6, v5);

  return v7;
}

- (id)localImageSourceWithName:(id)a3 imageBrush:(id)a4
{
  id v5;
  id v6;
  GKLocalImageSource *v7;

  v5 = a4;
  v6 = a3;
  v7 = -[GKImageSource initWithName:imageBrush:]([GKLocalImageSource alloc], "initWithName:imageBrush:", v6, v5);

  return v7;
}

- (GKNetworkImageSource)macGameIconSource
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __30__GKUITheme_macGameIconSource__block_invoke;
  v3[3] = &unk_24DC28020;
  v3[4] = self;
  -[GKUITheme resourceForSelector:missingHandler:](self, "resourceForSelector:missingHandler:", a2, v3);
  return (GKNetworkImageSource *)(id)objc_claimAutoreleasedReturnValue();
}

id __30__GKUITheme_macGameIconSource__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[GKBrush brush](GKMacGameIconBrush, "brush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("macGameIcon"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GKNetworkImageSource)untreatedAchievementImageSource
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __44__GKUITheme_untreatedAchievementImageSource__block_invoke;
  v3[3] = &unk_24DC28020;
  v3[4] = self;
  -[GKUITheme resourceForSelector:missingHandler:](self, "resourceForSelector:missingHandler:", a2, v3);
  return (GKNetworkImageSource *)(id)objc_claimAutoreleasedReturnValue();
}

id __44__GKUITheme_untreatedAchievementImageSource__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[GKBrush brush](GKCircleImageBrush, "brush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("untreatedAchievementImageSource"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldRenderDefaultImageWithBrush:", 1);

  return v3;
}

- (GKNetworkImageSource)untreatedAchievementImageDetailSource
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __50__GKUITheme_untreatedAchievementImageDetailSource__block_invoke;
  v3[3] = &unk_24DC28020;
  v3[4] = self;
  -[GKUITheme resourceForSelector:missingHandler:](self, "resourceForSelector:missingHandler:", a2, v3);
  return (GKNetworkImageSource *)(id)objc_claimAutoreleasedReturnValue();
}

id __50__GKUITheme_untreatedAchievementImageDetailSource__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[GKBrush brush](GKCircleImageBrush, "brush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("untreatedAchievementImageDetailSource"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShouldRenderDefaultImageWithBrush:", 1);

  return v3;
}

- (id)avatarSourceWithDimension:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("avatarSourceWithDimension%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __39__GKUITheme_avatarSourceWithDimension___block_invoke;
  v10[3] = &unk_24DC28048;
  v10[4] = self;
  v10[5] = a3;
  -[GKUITheme resourceWithName:missingHandler:](self, "resourceWithName:missingHandler:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __39__GKUITheme_avatarSourceWithDimension___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[GKBrush brush](GKAvatarImageBrush, "brush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDimension:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("avatarImage"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)monogramSourceWithDimension:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("monogramSource_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __41__GKUITheme_monogramSourceWithDimension___block_invoke;
  v10[3] = &unk_24DC28048;
  v10[4] = self;
  v10[5] = a3;
  -[GKUITheme resourceWithName:missingHandler:](self, "resourceWithName:missingHandler:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __41__GKUITheme_monogramSourceWithDimension___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[GKBrush brush](GKAvatarImageBrush, "brush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDimension:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "localImageSourceWithName:imageBrush:", CFSTR("monogram"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)placeholderSourceWithDimension:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("placeholderSource_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __44__GKUITheme_placeholderSourceWithDimension___block_invoke;
  v10[3] = &unk_24DC28048;
  v10[4] = self;
  v10[5] = a3;
  -[GKUITheme resourceWithName:missingHandler:](self, "resourceWithName:missingHandler:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __44__GKUITheme_placeholderSourceWithDimension___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[GKBrush brush](GKAvatarImageBrush, "brush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDimension:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "localImageSourceWithName:imageBrush:", CFSTR("placeholder"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)groupImageSourceWithDimension:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[6];

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("groupImageSource_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __43__GKUITheme_groupImageSourceWithDimension___block_invoke;
  v10[3] = &unk_24DC28048;
  v10[4] = self;
  v10[5] = a3;
  -[GKUITheme resourceWithName:missingHandler:](self, "resourceWithName:missingHandler:", v7, v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id __43__GKUITheme_groupImageSourceWithDimension___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  +[GKBrush brush](GKAvatarImageBrush, "brush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDimension:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "localImageSourceWithName:imageBrush:", CFSTR("groupImage"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (GKNetworkImageSource)photoListSource
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __28__GKUITheme_photoListSource__block_invoke;
  v3[3] = &unk_24DC28070;
  v3[4] = self;
  -[GKUITheme resourceForSelector:missingHandler:](self, "resourceForSelector:missingHandler:", a2, v3);
  return (GKNetworkImageSource *)(id)objc_claimAutoreleasedReturnValue();
}

id __28__GKUITheme_photoListSource__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  +[GKBrush brush](GKCircleImageBrush, "brush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("listCircularPhoto"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultPlayerPhoto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultImage:", v4);

  objc_msgSend(v3, "setShouldRenderDefaultImageWithBrush:", 0);
  return v3;
}

- (GKNetworkImageSource)photoDetailSource
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __30__GKUITheme_photoDetailSource__block_invoke;
  v3[3] = &unk_24DC28070;
  v3[4] = self;
  -[GKUITheme resourceForSelector:missingHandler:](self, "resourceForSelector:missingHandler:", a2, v3);
  return (GKNetworkImageSource *)(id)objc_claimAutoreleasedReturnValue();
}

id __30__GKUITheme_photoDetailSource__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  +[GKBrush brush](GKCircleImageBrush, "brush");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setSizeOverride:", 60.0, 60.0);
  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("detailCircularPhoto"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultPlayerPhoto");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDefaultImage:", v4);

  objc_msgSend(v3, "setShouldRenderDefaultImageWithBrush:", 0);
  return v3;
}

- (GKNetworkImageSource)iconLeaderboardListSource
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __38__GKUITheme_iconLeaderboardListSource__block_invoke;
  v3[3] = &unk_24DC28020;
  v3[4] = self;
  -[GKUITheme resourceForSelector:missingHandler:](self, "resourceForSelector:missingHandler:", a2, v3);
  return (GKNetworkImageSource *)(id)objc_claimAutoreleasedReturnValue();
}

id __38__GKUITheme_iconLeaderboardListSource__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("iconLeaderboardList"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultLeaderboardIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKColorPalette sharedPalette](GKColorPalette, "sharedPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disabledTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_gkImageByTintingWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDefaultImage:", v6);

  objc_msgSend(v2, "setShouldRenderDefaultImageWithBrush:", 0);
  return v2;
}

- (GKNetworkImageSource)iconLeaderboardSetListSource
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __41__GKUITheme_iconLeaderboardSetListSource__block_invoke;
  v3[3] = &unk_24DC28020;
  v3[4] = self;
  -[GKUITheme resourceForSelector:missingHandler:](self, "resourceForSelector:missingHandler:", a2, v3);
  return (GKNetworkImageSource *)(id)objc_claimAutoreleasedReturnValue();
}

id __41__GKUITheme_iconLeaderboardSetListSource__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "networkImageSourceWithName:imageBrush:", CFSTR("iconLeaderboardList"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "defaultLeaderboardIcon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKColorPalette sharedPalette](GKColorPalette, "sharedPalette");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disabledTextColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_gkImageByTintingWithColor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setDefaultImage:", v6);

  objc_msgSend(v2, "setShouldRenderDefaultImageWithBrush:", 0);
  return v2;
}

- (id)defaultLeaderboardIcon
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6AC8], "_systemImageNamed:", CFSTR("list.bullet.below.star.filled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)defaultPlayerPhoto
{
  return -[GKUITheme imageNamed:](self, "imageNamed:", CFSTR("FriendsGenericProfilePic"));
}

- (id)removePlayerButtonImage
{
  return -[GKUITheme imageNamed:](self, "imageNamed:", CFSTR("RemovePlayerButton"));
}

- (id)playerPickerUnselectedImage
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:compatibleWithTraitCollection:", CFSTR("circle"), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "secondaryLabelColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_flatImageWithColor:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)playerPickerSelectedImage
{
  return (id)objc_msgSend(MEMORY[0x24BDF6AC8], "systemImageNamed:compatibleWithTraitCollection:", CFSTR("checkmark.circle.fill"), 0);
}

- (id)navbarActionButtonIcon
{
  return (id)objc_msgSend(MEMORY[0x24BDF6AC8], "kitImageNamed:", CFSTR("UITabBarMoreTemplateSelected"));
}

- (id)statusDotImage
{
  return -[GKUITheme resourceWithName:missingHandler:](self, "resourceWithName:missingHandler:", CFSTR("statusDot"), &__block_literal_global_83);
}

id __27__GKUITheme_statusDotImage__block_invoke()
{
  void *v0;
  double v1;
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "scale");
  +[GKImageContext imageDrawnWithSize:scale:options:usingBlock:](GKImageContext, "imageDrawnWithSize:scale:options:usingBlock:", 4, &__block_literal_global_87, 13.0, 13.0, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "imageWithRenderingMode:", 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __27__GKUITheme_statusDotImage__block_invoke_2()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "set");
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithOvalInRect:", 0.0, 0.0, 13.0, 13.0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fill");

}

- (NSCache)resourceCache
{
  return self->_resourceCache;
}

- (void)setResourceCache:(id)a3
{
  objc_storeStrong((id *)&self->_resourceCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceCache, 0);
}

@end
