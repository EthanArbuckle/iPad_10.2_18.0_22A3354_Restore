@implementation DistributedNotificationPoster

+ (void)postNotificationForAlarmsEdited
{
  +[DistributedNotificationPoster postNotificationForUserPreferences:localNotifications:](DistributedNotificationPoster, "postNotificationForUserPreferences:localNotifications:", 1, 1);
}

+ (void)postNotificationForAlarmActiveChanged
{
  +[DistributedNotificationPoster postNotificationForUserPreferences:localNotifications:](DistributedNotificationPoster, "postNotificationForUserPreferences:localNotifications:", 0, 1);
}

+ (void)postNotificationForUserPreferences:(BOOL)a3 localNotifications:(BOOL)a4
{
  _BOOL4 v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  _QWORD v13[2];

  v4 = a4;
  v5 = a3;
  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v12 = CFSTR("bundleIdentifier");
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_7;
  }
  else
  {
    v8 = 0;
    if (!v5)
      goto LABEL_7;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("com.apple.mobiletimer-framework.preferences-and-notifications-changed-externally");
LABEL_11:
    objc_msgSend(v9, "postNotificationName:object:userInfo:deliverImmediately:", v11, 0, v8, 1);

    goto LABEL_12;
  }
LABEL_7:
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("com.apple.mobiletimer-framework.preferences-changed-externally");
    goto LABEL_11;
  }
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB35B0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("com.apple.mobiletimer-framework.local-notifications-changed-externally");
    goto LABEL_11;
  }
LABEL_12:

}

@end
