@implementation GKGame(GKSpringboardSupport)

+ (void)removeHistoryForGameWithBundleIdentifier:()GKSpringboardSupport completionHandler:
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0D25298];
  v7 = a3;
  objc_msgSend(v6, "proxyForLocalPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gameServicePrivate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __91__GKGame_GKSpringboardSupport__removeHistoryForGameWithBundleIdentifier_completionHandler___block_invoke;
  v11[3] = &unk_1E59C4DA8;
  v12 = v5;
  v10 = v5;
  objc_msgSend(v9, "removeGameForBundleID:handler:", v7, v11);

}

@end
