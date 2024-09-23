@implementation GKPlayer(UI)

- (void)loadPhotoForSize:()UI withCompletionHandler:
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v6 = a4;
  if (v6)
  {
    objc_msgSend(a1, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "photos");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(a1, "_loadPhotoForSize:withCompletionHandler:", a3, v6);
    }
    else
    {
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __55__GKPlayer_UI__loadPhotoForSize_withCompletionHandler___block_invoke;
      v9[3] = &unk_1E59C8D70;
      v9[4] = a1;
      v11 = a3;
      v10 = v6;
      objc_msgSend(a1, "loadProfileWithCompletionHandler:", v9);

    }
  }

}

- (void)_loadPhotoForSize:()UI withCompletionHandler:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;

  v6 = a4;
  if (v6)
  {
    v7 = (void *)MEMORY[0x1E0D252A8];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/CommonUI/GKPlayer+UI.m", 643, "-[GKPlayer(UI) _loadPhotoForSize:withCompletionHandler:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dispatchGroupWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke;
    v16[3] = &unk_1E59C6038;
    v16[4] = a1;
    v18 = a3;
    v11 = v9;
    v17 = v11;
    objc_msgSend(v11, "perform:", v16);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __56__GKPlayer_UI___loadPhotoForSize_withCompletionHandler___block_invoke_4;
    v13[3] = &unk_1E59C53C8;
    v14 = v11;
    v15 = v6;
    v12 = v11;
    objc_msgSend(v12, "notifyOnMainQueueWithBlock:", v13);

  }
}

@end
