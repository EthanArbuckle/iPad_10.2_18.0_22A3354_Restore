@implementation HMAccessory(HFUserNotificationServiceSettings)

- (id)hf_bulletinNotifications
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_opt_new();
  objc_msgSend(a1, "_hf_audioAnalysisEventBulletinBoardNotification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_safeAddObject:", v3);

  v4 = (void *)objc_msgSend(v2, "copy");
  return v4;
}

- (HFUserNotificationServiceSettings)hf_userNotificationSettings
{
  HFUserNotificationServiceSettings *v2;
  void *v3;
  HFUserNotificationServiceSettings *v4;

  v2 = [HFUserNotificationServiceSettings alloc];
  objc_msgSend(a1, "hf_bulletinNotifications");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HFUserNotificationServiceSettings initWithBulletinBoardNotifications:](v2, "initWithBulletinBoardNotifications:", v3);

  return v4;
}

- (id)hf_updateUserNotificationSettings:()HFUserNotificationServiceSettings
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  objc_msgSend(a1, "hf_userNotificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "hf_bulletinNotifications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applySettingsToBulletinBoardNotifications:", v6);
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "futureWithError:", v6);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
