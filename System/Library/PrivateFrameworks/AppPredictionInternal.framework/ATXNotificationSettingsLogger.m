@implementation ATXNotificationSettingsLogger

- (ATXNotificationSettingsLogger)init
{
  void *v3;
  ATXNotificationSettingsLogger *v4;

  v3 = (void *)objc_opt_new();
  v4 = -[ATXNotificationSettingsLogger initWithNotificationSettingsReader:](self, "initWithNotificationSettingsReader:", v3);

  return v4;
}

- (ATXNotificationSettingsLogger)initWithNotificationSettingsReader:(id)a3
{
  id v5;
  ATXNotificationSettingsLogger *v6;
  ATXNotificationSettingsLogger *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ATXNotificationSettingsLogger;
  v6 = -[ATXNotificationSettingsLogger init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_reader, a3);

  return v7;
}

- (void)logNotificationSettingsMetricsWithXPCActivity:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;

  v12 = (id)objc_opt_new();
  -[ATXNotificationSettingsReader notificationDigestDeliveryTimes](self->_reader, "notificationDigestDeliveryTimes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  objc_msgSend(v12, "setNumDailyDigests:", v5);
  -[ATXNotificationSettingsReader allConfiguredDigestApps](self->_reader, "allConfiguredDigestApps");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setNumDigestApps:", objc_msgSend(v6, "count"));

  -[ATXNotificationSettingsReader numConfiguredModes](self->_reader, "numConfiguredModes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "unsignedIntegerValue");
  else
    v9 = 0;
  objc_msgSend(v12, "setNumConfiguredModes:", v9);
  v10 = objc_alloc(MEMORY[0x1E0C99EA0]);
  v11 = (void *)objc_msgSend(v10, "initWithSuiteName:", *MEMORY[0x1E0D80ED8]);
  objc_msgSend(v12, "setHasOfferedDigest:", objc_msgSend(v11, "BOOLForKey:", *MEMORY[0x1E0CF92F8]));
  objc_msgSend(v12, "setHasSetupDigest:", objc_msgSend(v11, "BOOLForKey:", *MEMORY[0x1E0CF9310]));
  objc_msgSend(v12, "logToCoreAnalytics");

}

- (void)logNotificationSettingsMetrics
{
  -[ATXNotificationSettingsLogger logNotificationSettingsMetricsWithXPCActivity:](self, "logNotificationSettingsMetricsWithXPCActivity:", 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_reader, 0);
}

@end
