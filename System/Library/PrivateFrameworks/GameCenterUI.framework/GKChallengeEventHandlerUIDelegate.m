@implementation GKChallengeEventHandlerUIDelegate

- (void)showReceivedBannerForIssuingPlayer:(id)a3 challenge:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "alertGoalText");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayNameWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v12, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (GKApplicationLinkedOnOrAfter())
    +[GKNotificationBanner showBannerWithTitle:player:message:touchHandler:](GKNotificationBanner, "showBannerWithTitle:player:message:touchHandler:", v9, v8, v13, v7);
  else
    +[GKNotificationBanner showBannerWithTitle:player:message:completionHandler:](GKNotificationBanner, "showBannerWithTitle:player:message:completionHandler:", v9, v8, v13, v7);

}

- (void)showRemotelyCompletedBannerForReceivingPlayer:(id)a3 challenge:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v7 = a5;
  v8 = a3;
  objc_msgSend(a4, "alertGoalText");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "displayNameWithOptions:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", v12, v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (GKApplicationLinkedOnOrAfter())
    +[GKNotificationBanner showBannerWithTitle:player:message:touchHandler:](GKNotificationBanner, "showBannerWithTitle:player:message:touchHandler:", v9, v8, v13, v7);
  else
    +[GKNotificationBanner showBannerWithTitle:player:message:completionHandler:](GKNotificationBanner, "showBannerWithTitle:player:message:completionHandler:", v9, v8, v13, v7);

}

- (void)showLocallyCompletedBannerForIssuingPlayer:(id)a3 challenge:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __98__GKChallengeEventHandlerUIDelegate_showLocallyCompletedBannerForIssuingPlayer_challenge_handler___block_invoke;
  v13[3] = &unk_1E59C6E90;
  v14 = v8;
  v15 = v7;
  v16 = v9;
  v10 = v9;
  v11 = v7;
  v12 = v8;
  objc_msgSend(v12, "loadBannerImageWithHandler:", v13);

}

void __98__GKChallengeEventHandlerUIDelegate_showLocallyCompletedBannerForIssuingPlayer_challenge_handler___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "alertGoalText");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0CB3940];
  GKGameCenterUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "displayNameWithOptions:", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v8, v14);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = GKApplicationLinkedOnOrAfter();
  GKGameCenterUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 48);
  if (v10)
    +[GKNotificationBanner showBannerWithTitle:image:message:touchHandler:](GKNotificationBanner, "showBannerWithTitle:image:message:touchHandler:", v12, v4, v9, v13);
  else
    +[GKNotificationBanner showBannerWithTitle:image:message:completionHandler:](GKNotificationBanner, "showBannerWithTitle:image:message:completionHandler:", v12, v4, v9, v13);

}

@end
