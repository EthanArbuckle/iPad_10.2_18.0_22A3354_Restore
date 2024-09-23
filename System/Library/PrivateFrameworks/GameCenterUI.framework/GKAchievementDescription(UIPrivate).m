@implementation GKAchievementDescription(UIPrivate)

- (id)imageURL
{
  void *v2;
  uint64_t v3;
  BOOL v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3 == 1)
  {
    if (*MEMORY[0x1E0D25B68])
      v4 = 1;
    else
      v4 = *MEMORY[0x1E0D253F8] == 0;
    if (v4)
      v5 = 128;
    else
      v5 = 64;
  }
  else
  {
    v5 = 64;
  }
  objc_msgSend(a1, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D25B20], "sharedController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "greatestScreenScale");
  objc_msgSend(v7, "_gkImageURLForSize:scale:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (uint64_t)showBanner
{
  void *v2;
  void *v3;
  _QWORD v5[5];

  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recordPageWithID:pageContext:pageType:", v3, CFSTR("thirdParty"), CFSTR("achievementEarnedBanner"));

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __49__GKAchievementDescription_UIPrivate__showBanner__block_invoke;
  v5[3] = &unk_1E59C6E68;
  v5[4] = a1;
  return objc_msgSend(a1, "loadImageWithTimeout:completionHandler:", v5, 3.0);
}

@end
