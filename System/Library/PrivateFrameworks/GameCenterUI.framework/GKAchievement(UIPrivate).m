@implementation GKAchievement(UIPrivate)

- (id)imageURL
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "_achievementDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (void)showBanner
{
  id v1;

  objc_msgSend(a1, "_achievementDescription");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "showBanner");

}

- (void)loadImageWithCompletionHandler:()UIPrivate
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(a1, "_achievementDescription");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadImageWithCompletionHandler:", v4);

}

@end
