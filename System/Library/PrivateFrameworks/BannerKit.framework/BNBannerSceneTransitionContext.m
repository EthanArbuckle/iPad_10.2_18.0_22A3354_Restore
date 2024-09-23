@implementation BNBannerSceneTransitionContext

- (BSAnimationSettings)bannerAnimationSettings
{
  void *v2;
  void *v3;

  -[FBSSettings otherSettings](self, "otherSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForSetting:", 50);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (BSAnimationSettings *)v3;
}

- (void)setBannerAnimationSettings:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[FBSSettings otherSettings](self, "otherSettings");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forSetting:", v4, 50);

}

@end
