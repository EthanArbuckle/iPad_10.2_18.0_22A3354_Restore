@implementation HMService(HFUserNotificationServiceSettings)

- (HFUserNotificationServiceSettings)hf_userNotificationSettings
{
  void *v2;
  HFUserNotificationServiceSettings *v3;
  void *v4;
  void *v5;
  HFUserNotificationServiceSettings *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bulletinBoardNotification");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return (HFUserNotificationServiceSettings *)0;
  v3 = [HFUserNotificationServiceSettings alloc];
  objc_msgSend(a1, "bulletinBoardNotification");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[HFUserNotificationServiceSettings initWithBulletinBoardNotifications:](v3, "initWithBulletinBoardNotifications:", v5);

  return v6;
}

- (id)hf_updateUserNotificationSettings:()HFUserNotificationServiceSettings
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "hf_userNotificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(a1, "bulletinBoardNotification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v11, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applySettingsToBulletinBoardNotifications:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0D519C0];
    objc_msgSend(MEMORY[0x1E0CB35C8], "hf_errorWithCode:", 32);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "futureWithError:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

@end
