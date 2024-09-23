@implementation UIViewController(GKRestrictionAlerts)

- (id)_gkInGameUIUnavailableAlertWithRestrictionMode:()GKRestrictionAlerts dismissHandler:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  _QWORD v22[4];
  id v23;

  v6 = a4;
  objc_msgSend(MEMORY[0x24BE3A238], "localPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3A260], "shared");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "multiplayerAllowedPlayerType");

  if (!objc_msgSend(v8, "isGameCenterRestricted")
    && !objc_msgSend(v8, "lockedDown")
    && (a3 != 2 || v10)
    && (a3 == 3 || (objc_msgSend(v7, "isAuthenticated") & 1) != 0))
  {
    v14 = 0;
    v12 = 0;
    goto LABEL_13;
  }
  GKGameCenterUIFrameworkBundle();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  GKGameCenterUIFrameworkBundle();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
LABEL_13:
    v15 = 0;
    goto LABEL_14;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "setNavigationBarHidden:", 1);
  objc_msgSend(a1, "setModalPresentationStyle:", 17);
  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v12, v14, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setModalPresentationStyle:", 17);
  v16 = (void *)MEMORY[0x24BDF67E8];
  GKGameCenterUIFrameworkBundle();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __103__UIViewController_GKRestrictionAlerts___gkInGameUIUnavailableAlertWithRestrictionMode_dismissHandler___block_invoke;
  v22[3] = &unk_24DC27F70;
  v23 = v6;
  objc_msgSend(v16, "actionWithTitle:style:handler:", v18, 0, v22);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addAction:", v19);

LABEL_14:
  v20 = v15;

  return v20;
}

@end
