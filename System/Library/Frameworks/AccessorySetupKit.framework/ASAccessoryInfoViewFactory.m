@implementation ASAccessoryInfoViewFactory

+ (id)infoViewControllerFromDevice:(id)a3
{
  id v3;
  ASAccessoryInfoViewController *v4;

  v3 = a3;
  v4 = -[ASAccessoryInfoViewController initWithDevice:]([ASAccessoryInfoViewController alloc], "initWithDevice:", v3);

  return v4;
}

+ (id)forgetDeviceButtonTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Forget Device"), &stru_250420148, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)forgetDeviceAlertTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Forget Device Title"), &stru_250420148, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)forgetDeviceAlertBody
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Forget Device Message"), &stru_250420148, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)forgetDeviceAlertConfirm
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Forget Device Confirm"), &stru_250420148, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)forgetDeviceAlertCancel
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Cancel"), &stru_250420148, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end
