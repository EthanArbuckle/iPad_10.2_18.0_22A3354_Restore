@implementation AMSUINotificationSettingsViewModel

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v4;
  uint64_t v5;
  int64_t v6;

  -[AMSUINotificationSettingsViewModel sections](self, "sections", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  v6 = v5 + -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton");

  return v6;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a3;
  if (a4 || !-[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"))
  {
    -[AMSUINotificationSettingsViewModel sections](self, "sections");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    v10 = a4 - -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton");

    if (v9 <= v10)
    {
      v7 = 0;
    }
    else
    {
      -[AMSUINotificationSettingsViewModel sections](self, "sections");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", a4 - -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "items");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v13, "count");

    }
  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "section")
    || !-[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"))
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kAMSUINotificationInAppSettingsCellIdentifier"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[AMSUINotificationSettingsViewModel sections](self, "sections");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")- -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v14, "items");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v7, "row"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setDelegate:", self);
    objc_msgSend(v8, "setItem:", v16);

  }
  else
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("kAMSUINotificationInAppSettingsButtonCellIdentifier"), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10 == 1)
      v12 = CFSTR("NOTIFICATIONS_SETTINGS_ALLOW_NOTIFICATIONS_IPAD");
    else
      v12 = CFSTR("NOTIFICATIONS_SETTINGS_ALLOW_NOTIFICATIONS_IPHONE");
    AMSUILocalizedStringFromBundle(v12, 0, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setTextColor:", v20);

    objc_msgSend(v8, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setNumberOfLines:", 0);

    objc_msgSend(v8, "textLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLineBreakMode:", 0);
  }

  return v8;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  v6 = a3;
  if ((a4 || !-[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"))
    && (v7 = a4
           - -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"),
        -[AMSUINotificationSettingsViewModel sections](self, "sections"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "count"),
        v8,
        v7 <= v9))
  {
    -[AMSUINotificationSettingsViewModel sections](self, "sections");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectAtIndexedSubscript:", a4 - -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  __CFString *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = a3;
  if (!a4 && -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"))
  {
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "userInterfaceIdiom");

    objc_msgSend(MEMORY[0x24BDD1488], "bundleWithIdentifier:", CFSTR("com.apple.AppleMediaServicesUI"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8 == 1)
      v10 = CFSTR("NOTIFICATIONS_SETTINGS_ALLOW_NOTIFICATIONS_FOOTER_APPSTORE_IPAD");
    else
      v10 = CFSTR("NOTIFICATIONS_SETTINGS_ALLOW_NOTIFICATIONS_FOOTER_APPSTORE_IPHONE");
    AMSUILocalizedStringFromBundle(v10, 0, v9);
    v16 = objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  v11 = a4 - -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton");
  -[AMSUINotificationSettingsViewModel sections](self, "sections");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 <= v13)
  {
    -[AMSUINotificationSettingsViewModel sections](self, "sections");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndexedSubscript:", a4 - -[AMSUINotificationSettingsViewModel showAllowNotificationsButton](self, "showAllowNotificationsButton"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "footer");
    v16 = objc_claimAutoreleasedReturnValue();
LABEL_10:
    v14 = (void *)v16;

    goto LABEL_11;
  }
  v14 = 0;
LABEL_11:

  return v14;
}

- (void)notificationInAppSettingsTableViewCellDidToggleValue:(id)a3 forItem:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[AMSUINotificationSettingsViewModel delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    -[AMSUINotificationSettingsViewModel delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "viewModel:didReceiveValueChange:forItem:", self, v10, v6);

  }
}

- (AMSUINotificationSettingsViewModelDelegate)delegate
{
  return (AMSUINotificationSettingsViewModelDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (BOOL)showAllowNotificationsButton
{
  return self->_showAllowNotificationsButton;
}

- (void)setShowAllowNotificationsButton:(BOOL)a3
{
  self->_showAllowNotificationsButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
