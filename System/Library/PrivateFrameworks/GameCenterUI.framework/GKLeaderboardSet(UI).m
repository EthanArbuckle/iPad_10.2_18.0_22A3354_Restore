@implementation GKLeaderboardSet(UI)

- (void)loadImageWithCompletionHandler:()UI
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  _QWORD *v15;
  _QWORD v16[4];
  NSObject *v17;
  _QWORD *v18;
  _QWORD v19[5];
  id v20;

  v4 = a3;
  v5 = dispatch_group_create();
  objc_msgSend(a1, "imageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__13;
  v19[4] = __Block_byref_object_dispose__13;
  v20 = 0;
  v7 = MEMORY[0x1E0C809B0];
  if (v6)
  {
    dispatch_group_enter(v5);
    v8 = (void *)MEMORY[0x1E0DC3870];
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = MEMORY[0x1E0C80D38];
    v11 = MEMORY[0x1E0C80D38];
    v16[0] = v7;
    v16[1] = 3221225472;
    v16[2] = __55__GKLeaderboardSet_UI__loadImageWithCompletionHandler___block_invoke;
    v16[3] = &unk_1E59C92B0;
    v18 = v19;
    v17 = v5;
    objc_msgSend(v8, "_gkloadRemoteImageForURL:queue:withCompletionHandler:", v9, v10, v16);

  }
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __55__GKLeaderboardSet_UI__loadImageWithCompletionHandler___block_invoke_2;
  v13[3] = &unk_1E59C8DE8;
  v14 = v4;
  v15 = v19;
  v12 = v4;
  dispatch_group_notify(v5, MEMORY[0x1E0C80D38], v13);

  _Block_object_dispose(v19, 8);
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
  objc_msgSend(v4, "_gkImageURLForSize:scale:", 335);
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
  objc_msgSend(v4, "_gkImageURLForSize:scale:", 335);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end
