@implementation GKAchievementChallenge(UI)

- (id)alertGoalText
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "achievement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)listTitleText
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "achievement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "title");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)listGoalText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "issuingPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayNameWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)composeGoalText
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "achievement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "unachievedDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(v1, "title");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v2;
}

- (id)iconSource
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "untreatedAchievementImageSource");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)iconURLString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "achievement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)smallIconURLString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "achievement");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
