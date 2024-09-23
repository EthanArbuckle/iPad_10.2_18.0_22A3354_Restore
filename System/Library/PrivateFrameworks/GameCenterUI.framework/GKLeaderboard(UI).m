@implementation GKLeaderboard(UI)

- (void)loadImageWithCompletionHandler:()UI
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  _QWORD v11[4];
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKLeaderboard+UI.m", 28, "-[GKLeaderboard(UI) loadImageWithCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "imageURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  v10 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke;
    v14[3] = &unk_1E59C41C0;
    v15 = v8;
    v16 = v7;
    objc_msgSend(v16, "perform:", v14);

  }
  if (v4)
  {
    v11[0] = v10;
    v11[1] = 3221225472;
    v11[2] = __52__GKLeaderboard_UI__loadImageWithCompletionHandler___block_invoke_3;
    v11[3] = &unk_1E59C4D80;
    v13 = v4;
    v12 = v7;
    objc_msgSend(v12, "notifyOnMainQueueWithBlock:", v11);

  }
}

- (id)imageURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceIdiom");

  objc_msgSend(a1, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25B20], "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "greatestScreenScale");
  objc_msgSend(v4, "_gkImageURLForSize:scale:", 187);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)miniImageURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userInterfaceIdiom");

  objc_msgSend(a1, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "icons");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25B20], "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "greatestScreenScale");
  objc_msgSend(v4, "_gkImageURLForSize:scale:", 187);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)localizedStringForTimeScope:()UI
{
  void *v0;
  void *v1;

  GKGameCenterUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)localizedStringForLeaderboardOccurrence:()UI
{
  void *v0;
  void *v1;

  GKGameCenterUIFrameworkBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
