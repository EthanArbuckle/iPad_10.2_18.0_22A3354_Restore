@implementation NPKUserNotificationExpressModeEnabled

- (NPKUserNotificationExpressModeEnabled)initWithPass:(id)a3
{
  id v4;
  NPKUserNotificationExpressModeEnabled *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)NPKUserNotificationExpressModeEnabled;
  v5 = -[NPKPassUserNotification initWithPass:](&v14, sel_initWithPass_, v4);
  if (v5)
  {
    objc_msgSend(v4, "paymentPass");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isHomeKeyPass");

    if ((v7 & 1) == 0)
    {
      pk_General_log();
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);

      if (v9)
      {
        pk_General_log();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          v11 = objc_opt_class();
          objc_msgSend(v4, "uniqueID");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v16 = v11;
          v17 = 2112;
          v18 = v12;
          _os_log_impl(&dword_213518000, v10, OS_LOG_TYPE_DEFAULT, "Warning: %@ only supports notifications for Home Key passes. Pass with uniqueID: %@", buf, 0x16u);

        }
      }

      v5 = 0;
    }
  }

  return v5;
}

- (id)notificationCategoryIdentifier
{
  return CFSTR("PDUserNotificationTypePassExpressModeEnabled");
}

- (id)title
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("HOME_KEY_EXPRESS_ENABLED_OPT_OUT_NOTIFICATION_TITLE_WATCH"), &stru_24CFF06D8, CFSTR("NanoPassKit-HomeKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)body
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[NPKPassUserNotification pass](self, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.NanoPassKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("HOME_KEY_EXPRESS_ENABLED_OPT_OUT_NOTIFICATION_MESSAGE_WATCH_DISABLE_ACTION"), &stru_24CFF06D8, CFSTR("NanoPassKit-HomeKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", v6, v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)userInfo
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  v6[0] = *MEMORY[0x24BE6F5E8];
  -[NPKPassUserNotification pass](self, "pass");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uniqueID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = *MEMORY[0x24BE6F9B8];
  v7[0] = v3;
  v7[1] = CFSTR("false");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)wantsBadgedIcon
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;
  char v9;

  -[NPKPassUserNotification pass](self, "pass");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "secureElementPass");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[NPKPassUserNotification pass](self, "pass");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rawIcon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 && v4 && (objc_msgSend(v4, "isAppleCardPass") & 1) == 0)
  {
    v9 = objc_msgSend(v4, "isPeerPaymentPass");

    if ((v9 & 1) == 0)
    {
      v7 = 1;
      goto LABEL_6;
    }
  }
  else
  {

  }
  v7 = 0;
LABEL_6:

  return v7;
}

@end
