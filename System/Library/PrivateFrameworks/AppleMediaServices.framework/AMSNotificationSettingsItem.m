@implementation AMSNotificationSettingsItem

- (AMSNotificationSettingsItem)initWithTitle:(id)a3 description:(id)a4 identifier:(id)a5 enabled:(BOOL)a6
{
  id v11;
  id v12;
  id v13;
  AMSNotificationSettingsItem *v14;
  AMSNotificationSettingsItem *v15;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AMSNotificationSettingsItem;
  v14 = -[AMSNotificationSettingsItem init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_desc, a4);
    v15->_enabled = a6;
    objc_storeStrong((id *)&v15->_identifier, a5);
    objc_storeStrong((id *)&v15->_title, a3);
  }

  return v15;
}

- (AMSNotificationSettingsItem)initWithDictionaryRepresentation:(id)a3
{
  id v4;
  AMSNotificationSettingsItem *v5;
  void *v6;
  NSString *v7;
  NSString *identifier;
  void *v9;
  NSString *v10;
  NSString *title;
  void *v12;
  NSString *v13;
  NSString *desc;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)AMSNotificationSettingsItem;
  v5 = -[AMSNotificationSettingsItem init](&v20, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("settingId"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;

    identifier = v5->_identifier;
    v5->_identifier = v7;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("title"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;

    title = v5->_title;
    v5->_title = v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("description"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;

    desc = v5->_desc;
    v5->_desc = v13;

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("value.data"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "valueForKeyPath:", CFSTR("value.data"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_enabled = objc_msgSend(v16, "BOOLValue");

    }
    else
    {
      v5->_enabled = 0;
    }

    objc_msgSend(v4, "valueForKeyPath:", CFSTR("value.dataUpdated"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v4, "valueForKeyPath:", CFSTR("value.dataUpdated"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v5->_userChanged = objc_msgSend(v18, "BOOLValue");

    }
    else
    {
      v5->_userChanged = 0;
    }

  }
  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[5];
  _QWORD v12[6];

  v12[5] = *MEMORY[0x1E0C80C00];
  v11[0] = CFSTR("itemId");
  -[AMSNotificationSettingsItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v3;
  v11[1] = CFSTR("title");
  -[AMSNotificationSettingsItem title](self, "title");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v4;
  v11[2] = CFSTR("desc");
  -[AMSNotificationSettingsItem desc](self, "desc");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v5;
  v11[3] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSNotificationSettingsItem isEnabled](self, "isEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[3] = v6;
  v11[4] = CFSTR("userChanged");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSNotificationSettingsItem userChanged](self, "userChanged"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[4] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSObject ams_generateDescriptionWithSubObjects:](self, "ams_generateDescriptionWithSubObjects:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (NSDictionary)dictionaryRepresentation
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("settingId");
  -[AMSNotificationSettingsItem identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("data");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[AMSNotificationSettingsItem isEnabled](self, "isEnabled"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v5;
}

- (NSString)desc
{
  return self->_desc;
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

- (NSString)title
{
  return self->_title;
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
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_desc, 0);
}

@end
