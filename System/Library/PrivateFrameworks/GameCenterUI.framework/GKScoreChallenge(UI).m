@implementation GKScoreChallenge(UI)

- (id)alertGoalText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(a1, "leaderboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedTitle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "score");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formattedValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v8, v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)listTitleText
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "internal");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "leaderboard");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "title");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)listGoalText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  objc_msgSend(a1, "score");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (objc_msgSend(a1, "leaderboard"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "title"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "issuingPlayer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayNameWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", v8, v3, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)composeGoalText
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(a1, "score");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "formattedValue");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "leaderboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = 0;
  if (v3 && v6)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    GKGameCenterUIFrameworkBundle();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", v10, v3, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (id)iconSource
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "iconLeaderboardListSource");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

- (id)smallIconURLString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "leaderboard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "miniImageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)iconURLString
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "leaderboard");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "imageURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end
