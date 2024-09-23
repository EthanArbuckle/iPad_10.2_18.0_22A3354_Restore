@implementation ATXNotificationSettingsReader

- (ATXNotificationSettingsReader)init
{
  void *v3;
  void *v4;
  ATXNotificationSettingsReader *v5;

  +[ATXDNDModeConfigurationClient sharedInstance](ATXDNDModeConfigurationClient, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC60B0], "currentNotificationSettingsCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[ATXNotificationSettingsReader initWithModeConfigurationClient:notificationSettingsCenter:](self, "initWithModeConfigurationClient:notificationSettingsCenter:", v3, v4);

  return v5;
}

- (ATXNotificationSettingsReader)initWithModeConfigurationClient:(id)a3 notificationSettingsCenter:(id)a4
{
  id v7;
  id v8;
  ATXNotificationSettingsReader *v9;
  ATXNotificationSettingsReader *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)ATXNotificationSettingsReader;
  v9 = -[ATXNotificationSettingsReader init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_modeConfigClient, a3);
    objc_storeStrong((id *)&v10->_notificationSettingsCenter, a4);
  }

  return v10;
}

- (BOOL)appIsOnAllowList:(id)a3 dndModeUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[ATXNotificationSettingsReader modeConfiguration:](self, "modeConfiguration:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "exceptionForApplication:", v6) == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)appIsOnDenyList:(id)a3 dndModeUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[ATXNotificationSettingsReader modeConfiguration:](self, "modeConfiguration:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "exceptionForApplication:", v6) == 1;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)contactIsOnAllowList:(id)a3 dndModeUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[ATXNotificationSettingsReader modeConfiguration:](self, "modeConfiguration:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setContactIdentifier:", v6);
    objc_msgSend(v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "exceptionForContactHandle:", v8) == 0;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (BOOL)contactIsOnDenyList:(id)a3 dndModeUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v6 = a3;
  -[ATXNotificationSettingsReader modeConfiguration:](self, "modeConfiguration:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)objc_opt_new();
    objc_msgSend(v8, "setContactIdentifier:", v6);
    objc_msgSend(v7, "configuration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "exceptionForContactHandle:", v8) == 1;

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)modeConfiguration:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v4 = a3;
  if (v4)
  {
    -[ATXDNDModeConfigurationClient modeConfigurationForDNDModeWithUUID:](self->_modeConfigClient, "modeConfigurationForDNDModeWithUUID:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      __atxlog_handle_notification_management();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[ATXNotificationSettingsReader modeConfiguration:].cold.1((uint64_t)v4, v8);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)applicationConfigurationTypeForDNDModeUUID:(id)a3 success:(BOOL *)a4
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[ATXNotificationSettingsReader modeConfiguration:](self, "modeConfiguration:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    *a4 = 1;
    objc_msgSend(v5, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "applicationConfigurationType");

  }
  else
  {
    *a4 = 0;
    v8 = 2;
  }

  return v8;
}

- (unint64_t)senderConfigurationTypeForDNDModeUUID:(id)a3 success:(BOOL *)a4
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  -[ATXNotificationSettingsReader modeConfiguration:](self, "modeConfiguration:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    *a4 = 1;
    objc_msgSend(v5, "configuration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "senderConfigurationType");

  }
  else
  {
    *a4 = 0;
    v8 = 2;
  }

  return v8;
}

- (id)notificationDigestDeliveryTimes
{
  void *v2;
  void *v3;

  -[UNNotificationSettingsCenter notificationSystemSettings](self->_notificationSettingsCenter, "notificationSystemSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "scheduledDeliverySetting") == 2)
  {
    objc_msgSend(v2, "scheduledDeliveryTimes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v3;
}

- (BOOL)digestSetupComplete
{
  void *v2;
  BOOL v3;

  -[UNNotificationSettingsCenter notificationSystemSettings](self->_notificationSettingsCenter, "notificationSystemSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "scheduledDeliverySetting") == 2;

  return v3;
}

- (BOOL)doesAppSendNotificationsToDigest:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[UNNotificationSettingsCenter notificationSourceWithIdentifier:](self->_notificationSettingsCenter, "notificationSourceWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "scheduledDeliverySetting") == 2;
  return (char)v4;
}

- (BOOL)doesAppAllowMessageBreakthrough:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[UNNotificationSettingsCenter notificationSourceWithIdentifier:](self->_notificationSettingsCenter, "notificationSourceWithIdentifier:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sourceSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "notificationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "directMessagesSetting") == 2;
  return (char)v4;
}

- (id)allConfiguredDigestApps
{
  void *v2;
  void *v3;
  void *v4;

  -[UNNotificationSettingsCenter allNotificationSources](self->_notificationSettingsCenter, "allNotificationSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_pas_filteredSetWithTest:", &__block_literal_global_34);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_pas_mappedSetWithTransform:", &__block_literal_global_7_0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __56__ATXNotificationSettingsReader_allConfiguredDigestApps__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  _BOOL8 v3;
  void *v4;
  void *v5;

  v2 = a2;
  if ((objc_msgSend(v2, "isHiddenFromSettings") & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_msgSend(v2, "sourceSettings");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "notificationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v5, "scheduledDeliverySetting") == 2;

  }
  return v3;
}

uint64_t __56__ATXNotificationSettingsReader_allConfiguredDigestApps__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "sourceIdentifier");
}

- (id)numConfiguredModes
{
  void *v2;
  void *v3;
  void *v4;

  -[ATXDNDModeConfigurationClient configuredModes](self->_modeConfigClient, "configuredModes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationSettingsCenter, 0);
  objc_storeStrong((id *)&self->_modeConfigClient, 0);
}

- (void)modeConfiguration:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 138412546;
  v3 = a1;
  v4 = 2080;
  v5 = "-[ATXNotificationSettingsReader modeConfiguration:]";
  _os_log_error_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_ERROR, "Unable to retrieve mode configuration for DNDMode UUID: %@. Returning nil in %s", (uint8_t *)&v2, 0x16u);
}

@end
