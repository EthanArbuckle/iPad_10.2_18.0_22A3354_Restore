@implementation GKAchievementDescription(UI)

- (void)loadImageWithCompletionHandler:()UI
{
  void (**v4)(id, void *, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];
  void (**v20)(id, void *, _QWORD);

  v4 = a3;
  objc_msgSend(a1, "imageNameForIcon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)MEMORY[0x1E0DC3870];
    v7 = (void *)MEMORY[0x1E0CB34D0];
    objc_msgSend(a1, "game");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "gameDescriptor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleWithIdentifier:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "imageNamed:inBundle:compatibleWithTraitCollection:", v5, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      v4[2](v4, v12, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB28A8], 4, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(id, void *, void *))v4)[2](v4, 0, v18);

    }
LABEL_8:

    goto LABEL_9;
  }
  objc_msgSend(a1, "imageURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    if (!v4)
      goto LABEL_9;
    if (GKApplicationLinkedOnOrAfter())
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D24C28], 1, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    ((void (**)(id, void *, void *))v4)[2](v4, 0, v12);
    goto LABEL_8;
  }
  v14 = (void *)MEMORY[0x1E0DC3870];
  v15 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "imageURL");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLWithString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __63__GKAchievementDescription_UI__loadImageWithCompletionHandler___block_invoke;
  v19[3] = &unk_1E59C5CB0;
  v19[4] = a1;
  v20 = v4;
  objc_msgSend(v14, "_gkloadRemoteImageForURL:queue:withCompletionHandler:", v17, MEMORY[0x1E0C80D38], v19);

LABEL_9:
}

- (void)loadImageWithTimeout:()UI completionHandler:
{
  id v6;
  uint64_t v7;
  id v8;
  dispatch_time_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD v14[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[3];
  char v18;

  v6 = a4;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v7 = MEMORY[0x1E0C809B0];
  v18 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke;
  v14[3] = &unk_1E59C6E18;
  v16 = v17;
  v8 = v6;
  v15 = v8;
  objc_msgSend(a1, "loadImageWithCompletionHandler:", v14);
  v9 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
  v11[0] = v7;
  v11[1] = 3221225472;
  v11[2] = __71__GKAchievementDescription_UI__loadImageWithTimeout_completionHandler___block_invoke_3;
  v11[3] = &unk_1E59C6E40;
  v12 = v8;
  v13 = v17;
  v10 = v8;
  dispatch_after(v9, MEMORY[0x1E0C80D38], v11);

  _Block_object_dispose(v17, 8);
}

+ (id)incompleteAchievementImage
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "achievementsNotStartedIcon");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

+ (id)placeholderCompletedAchievementImage
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "achievementsDefaultIcon");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

@end
