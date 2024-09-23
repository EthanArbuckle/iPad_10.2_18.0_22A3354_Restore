@implementation GKLocalPlayer(Alerts)

+ (id)currentLocalPlayer
{
  id v0;
  id v1;

  if (currentLocalPlayer_sDispatchOnceToken != -1)
    dispatch_once(&currentLocalPlayer_sDispatchOnceToken, &__block_literal_global_6);
  if ((objc_msgSend((id)currentLocalPlayer_sCurrentLocalPlayer, "hasAcknowledgedLatestGDPR") & 1) != 0)
  {
    v0 = (id)currentLocalPlayer_sCurrentLocalPlayer;
  }
  else
  {
    if (!*MEMORY[0x24BE3A308])
      v1 = (id)GKOSLoggers();
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE3A2E0], OS_LOG_TYPE_ERROR))
      +[GKLocalPlayer(Alerts) currentLocalPlayer].cold.1();
    v0 = 0;
  }
  return v0;
}

+ (void)currentLocalPlayer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_3_0(&dword_219F71000, v0, v1, "The current local player will not be available as the GDPR have not been acknowledged yet. This is anticipated behavior and not an error.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)showCancelledAlertForPlayer:()Alerts
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = a3;
  GKGameCenterUIFrameworkBundle();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameWithOptions:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "localizedStringWithFormat:", v6, v7);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF6F98], "_gkKeyWindowRootViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  GKGameCenterUIFrameworkBundle();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v8, "_gkPresentAlertWithTitle:message:buttonTitle:", v12, 0, v10);

}

- (uint64_t)alertUserInStoreDemoModeEnabled
{
  void *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isStoreDemoModeEnabled");

  if ((_DWORD)v1)
  {
    objc_msgSend(MEMORY[0x24BDF6F98], "_gkKeyWindowRootViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    GKGameCenterUIFrameworkBundle();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    GKGetLocalizedStringFromTableInBundle();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (id)objc_msgSend(v2, "_gkPresentAlertWithTitle:message:buttonTitle:", v4, v6, v8);

  }
  return v1;
}

@end
