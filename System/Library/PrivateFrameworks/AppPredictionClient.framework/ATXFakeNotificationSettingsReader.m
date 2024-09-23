@implementation ATXFakeNotificationSettingsReader

- (ATXFakeNotificationSettingsReader)init
{
  ATXFakeNotificationSettingsReader *v2;
  void *v3;
  uint64_t v4;
  NSArray *digestDeliveryTimes;
  uint64_t v6;
  NSMutableDictionary *entityToIsAllowed;
  uint64_t v8;
  NSMutableDictionary *sendToDigest;
  uint64_t v10;
  NSMutableDictionary *messagesBreakthrough;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)ATXFakeNotificationSettingsReader;
  v2 = -[ATXFakeNotificationSettingsReader init](&v13, sel_init);
  if (v2)
  {
    v3 = (void *)objc_opt_new();
    objc_msgSend(v3, "notificationDigestDeliveryTimes");
    v4 = objc_claimAutoreleasedReturnValue();
    digestDeliveryTimes = v2->_digestDeliveryTimes;
    v2->_digestDeliveryTimes = (NSArray *)v4;

    v6 = objc_opt_new();
    entityToIsAllowed = v2->_entityToIsAllowed;
    v2->_entityToIsAllowed = (NSMutableDictionary *)v6;

    v8 = objc_opt_new();
    sendToDigest = v2->_sendToDigest;
    v2->_sendToDigest = (NSMutableDictionary *)v8;

    v10 = objc_opt_new();
    messagesBreakthrough = v2->_messagesBreakthrough;
    v2->_messagesBreakthrough = (NSMutableDictionary *)v10;

  }
  return v2;
}

- (void)setDefaultReturnValueForAppIsAllowed:(BOOL)a3
{
  self->_defaultIsAppAllowed = a3;
}

- (void)setDefaultReturnValueForContactIsAllowed:(BOOL)a3
{
  self->_defaultIsContactAllowed = a3;
}

- (void)setIsAllowedForEntity:(id)a3 isAllowed:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_entityToIsAllowed, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)setDefaultNotificationDigestDeliveryTimes:(id)a3
{
  objc_storeStrong((id *)&self->_digestDeliveryTimes, a3);
}

- (void)setDoesSendToDigest:(id)a3 doesSend:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_sendToDigest, "setObject:forKeyedSubscript:", v8, v7);

}

- (void)setDoMessagesBreakthrough:(id)a3 doesBreakthrough:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;
  id v8;

  v4 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithBool:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_messagesBreakthrough, "setObject:forKeyedSubscript:", v8, v7);

}

- (BOOL)appIsOnAllowList:(id)a3 mode:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_entityToIsAllowed, "objectForKeyedSubscript:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_defaultIsAppAllowed);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "BOOLValue");
  return v9;
}

- (BOOL)contactIsOnAllowList:(id)a3 mode:(unint64_t)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_entityToIsAllowed, "objectForKeyedSubscript:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_defaultIsContactAllowed);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "BOOLValue");
  return v9;
}

- (BOOL)appIsOnAllowList:(id)a3 dndModeUUID:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_entityToIsAllowed, "objectForKeyedSubscript:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_defaultIsAppAllowed);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "BOOLValue");
  return v9;
}

- (BOOL)contactIsOnAllowList:(id)a3 dndModeUUID:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  char v9;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_entityToIsAllowed, "objectForKeyedSubscript:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_defaultIsContactAllowed);
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  v9 = objc_msgSend(v8, "BOOLValue");
  return v9;
}

- (BOOL)appIsOnDenyList:(id)a3 dndModeUUID:(id)a4
{
  return 0;
}

- (BOOL)contactIsOnDenyList:(id)a3 dndModeUUID:(id)a4
{
  return 0;
}

- (id)notificationDigestDeliveryTimes
{
  return self->_digestDeliveryTimes;
}

- (BOOL)digestSetupComplete
{
  return 0;
}

- (BOOL)doesAppSendNotificationsToDigest:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_sendToDigest, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 0;

  return v5;
}

- (BOOL)doesAppAllowMessageBreakthrough:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_messagesBreakthrough, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  return v5;
}

- (id)allConfiguredDigestApps
{
  return (id)objc_opt_new();
}

- (id)numConfiguredModes
{
  return &unk_1E4DC14D0;
}

- (id)modeConfiguration:(id)a3
{
  return 0;
}

- (unint64_t)applicationConfigurationTypeForDNDModeUUID:(id)a3 success:(BOOL *)a4
{
  return 0;
}

- (unint64_t)senderConfigurationTypeForDNDModeUUID:(id)a3 success:(BOOL *)a4
{
  return 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messagesBreakthrough, 0);
  objc_storeStrong((id *)&self->_sendToDigest, 0);
  objc_storeStrong((id *)&self->_entityToIsAllowed, 0);
  objc_storeStrong((id *)&self->_digestDeliveryTimes, 0);
}

@end
