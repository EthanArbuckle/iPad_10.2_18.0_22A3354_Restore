@implementation HUAnnounceNotificationSettingsItem

- (HUAnnounceNotificationSettingsItem)initWithNotificationMode:(unint64_t)a3 user:(id)a4
{
  id v7;
  HUAnnounceNotificationSettingsItem *v8;
  HUAnnounceNotificationSettingsItem *v9;
  objc_super v11;

  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HUAnnounceNotificationSettingsItem;
  v8 = -[HUAnnounceNotificationSettingsItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_notificationMode = a3;
    objc_storeStrong((id *)&v8->_user, a4);
    v9->_sortOrder = +[HUAnnounceNotificationSettingsItem sortOrderForMode:](HUAnnounceNotificationSettingsItem, "sortOrderForMode:", a3);
  }

  return v9;
}

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[6];

  v19[5] = *MEMORY[0x1E0C80C00];
  -[HUAnnounceNotificationSettingsItem user](self, "user", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "announceUserSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "deviceNotificationMode");
  v18[0] = *MEMORY[0x1E0D30D18];
  -[HUAnnounceNotificationSettingsItem _notificationModeToString:](self, "_notificationModeToString:", -[HUAnnounceNotificationSettingsItem notificationMode](self, "notificationMode"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v7;
  v18[1] = *MEMORY[0x1E0D30DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", -[HUAnnounceNotificationSettingsItem notificationMode](self, "notificationMode") == v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v8;
  v18[2] = *MEMORY[0x1E0D30B80];
  v9 = (void *)MEMORY[0x1E0C99E60];
  -[HUAnnounceNotificationSettingsItem user](self, "user");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithObject:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v11;
  v18[3] = *MEMORY[0x1E0D30DA8];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[HUAnnounceNotificationSettingsItem sortOrder](self, "sortOrder"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[4] = *MEMORY[0x1E0D30CE8];
  v19[3] = v12;
  v19[4] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v19, v18, 5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D519C0];
  objc_msgSend(MEMORY[0x1E0D314B8], "outcomeWithResults:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "futureWithResult:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

+ (unint64_t)sortOrderForMode:(unint64_t)a3
{
  if (a3 == 3)
    return 2;
  else
    return a3 == 2;
}

- (id)_notificationModeToString:(unint64_t)a3
{
  __CFString *v3;
  __CFString *v4;

  switch(a3)
  {
    case 0uLL:
      v3 = CFSTR("HUAnnounceNotificationSetting_NotSet");
      goto LABEL_8;
    case 1uLL:
      v3 = CFSTR("HUAnnounceNotificationSetting_Never");
      goto LABEL_8;
    case 2uLL:
      v3 = CFSTR("HUAnnounceNotificationSetting_AtHome");
      goto LABEL_8;
    case 3uLL:
      v3 = CFSTR("HUAnnounceNotificationSetting_Always");
LABEL_8:
      _HULocalizedStringWithDefaultValue(v3, v3, 1);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v4 = &stru_1E6F60E80;
      break;
  }
  return v4;
}

- (unint64_t)notificationMode
{
  return self->_notificationMode;
}

- (HMUser)user
{
  return self->_user;
}

- (unint64_t)sortOrder
{
  return self->_sortOrder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_user, 0);
}

@end
