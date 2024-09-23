@implementation AMSUserNotificationSettingsItem

- (AMSUserNotificationSettingsItem)initWithIdentifier:(id)a3 dictionaryRepresentation:(id)a4
{
  id v7;
  id v8;
  AMSUserNotificationSettingsItem *v9;
  AMSUserNotificationSettingsItem *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)AMSUserNotificationSettingsItem;
  v9 = -[AMSUserNotificationSettingsItem init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_identifier, a3);
    objc_msgSend(v8, "valueForKeyPath:", CFSTR("data"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "valueForKeyPath:", CFSTR("data"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_enabled = objc_msgSend(v12, "BOOLValue");

    }
    else
    {
      v10->_enabled = 0;
    }

    objc_msgSend(v8, "valueForKeyPath:", CFSTR("dataUpdated"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v8, "valueForKeyPath:", CFSTR("dataUpdated"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v10->_userChanged = objc_msgSend(v14, "BOOLValue");

    }
    else
    {
      v10->_userChanged = 0;
    }

  }
  return v10;
}

- (AMSUserNotificationSettingsItem)initWithIdentifier:(id)a3 enabled:(BOOL)a4
{
  id v7;
  AMSUserNotificationSettingsItem *v8;
  AMSUserNotificationSettingsItem *v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AMSUserNotificationSettingsItem;
  v8 = -[AMSUserNotificationSettingsItem init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_identifier, a3);
    v9->_enabled = a4;
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[3];
  _QWORD v10[4];

  v10[3] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("itemId");
  -[AMSUserNotificationSettingsItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSUserNotificationSettingsItem isEnabled](self, "isEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("userChanged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSUserNotificationSettingsItem userChanged](self, "userChanged"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSUserNotificationSettingsItem isEnabled](self, "isEnabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("dataUpdated");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSUserNotificationSettingsItem userChanged](self, "userChanged"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSDictionary)updateDictionary
{
  void *v2;
  void *v3;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("data");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSUserNotificationSettingsItem isEnabled](self, "isEnabled"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (BOOL)userChanged
{
  return self->_userChanged;
}

- (void)setUserChanged:(BOOL)a3
{
  self->_userChanged = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
