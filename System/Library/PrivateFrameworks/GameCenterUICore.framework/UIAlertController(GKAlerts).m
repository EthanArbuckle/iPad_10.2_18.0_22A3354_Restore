@implementation UIAlertController(GKAlerts)

- (void)_gkAddCancelButtonWithAction:()GKAlerts
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x24BDF67E8];
  GKGameCenterUIFrameworkBundle();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  GKGetLocalizedStringFromTableInBundle();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__UIAlertController_GKAlerts___gkAddCancelButtonWithAction___block_invoke;
  v10[3] = &unk_24DC27F70;
  v11 = v4;
  v8 = v4;
  objc_msgSend(v5, "actionWithTitle:style:handler:", v7, 1, v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "addAction:", v9);
}

@end
