@implementation UIImage(GKDashboardUtils)

+ (uint64_t)_gkHostImageWithBundleIdentifier:()GKDashboardUtils imageName:
{
  return 0;
}

+ (void)_gkMessageGroupImageWithIdentifier:()GKDashboardUtils handler:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;

  v5 = a3;
  v6 = a4;
  v7 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/TVDashboard/GKDashboardUtils.m", 489, "+[UIImage(GKDashboardUtils) _gkMessageGroupImageWithIdentifier:handler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D25B40], "sharedTheme");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "groupImageSourceWithDimension:", 128);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  GKAvatarSubdirectoryNameForPlayerID();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke;
  v21[3] = &unk_1E59C8C48;
  v14 = v11;
  v22 = v14;
  v15 = v12;
  v23 = v15;
  v16 = v9;
  v24 = v16;
  v17 = v5;
  v25 = v17;
  v26 = 128;
  objc_msgSend(v16, "perform:", v21);
  if (v6)
  {
    v18[0] = v13;
    v18[1] = 3221225472;
    v18[2] = __72__UIImage_GKDashboardUtils___gkMessageGroupImageWithIdentifier_handler___block_invoke_4;
    v18[3] = &unk_1E59C4D80;
    v20 = v6;
    v19 = v16;
    objc_msgSend(v19, "notifyOnMainQueueWithBlock:", v18);

  }
}

@end
