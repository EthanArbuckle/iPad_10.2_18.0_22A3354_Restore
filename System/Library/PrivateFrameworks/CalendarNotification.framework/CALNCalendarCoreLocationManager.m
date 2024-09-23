@implementation CALNCalendarCoreLocationManager

- (CALNCalendarCoreLocationManager)initWithCoreLocationProvider:(id)a3
{
  id v5;
  CALNCalendarCoreLocationManager *v6;
  CALNCalendarCoreLocationManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CALNCalendarCoreLocationManager;
  v6 = -[CALNCalendarCoreLocationManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_coreLocationProvider, a3);

  return v7;
}

- (BOOL)allowsLocationAlerts
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;
  char v12;
  char v14;
  char v15;

  -[CALNCalendarCoreLocationManager coreLocationProvider](self, "coreLocationProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *MEMORY[0x24BE14020];
  v5 = objc_msgSend(v3, "authorizationStatusForBundleIdentifier:", *MEMORY[0x24BE14020]);

  objc_msgSend(MEMORY[0x24BE13FC8], "bundle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CALNCalendarCoreLocationManager coreLocationProvider](self, "coreLocationProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "preciseLocationAuthorizedForBundleIdentifier:", v4);

  -[CALNCalendarCoreLocationManager coreLocationProvider](self, "coreLocationProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "authorizationStatusForBundle:", v6);

  -[CALNCalendarCoreLocationManager coreLocationProvider](self, "coreLocationProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "preciseLocationAuthorizedForBundle:", v6);

  if (v10 != 3 || v5 <= 2)
    v14 = 0;
  else
    v14 = v8;
  v15 = v14 & v12;

  return v15;
}

- (void)markAsHavingReceivedLocation
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_215D9B000, log, OS_LOG_TYPE_DEBUG, "Marking as heaving received location", v1, 2u);
}

- (CALNCoreLocationProvider)coreLocationProvider
{
  return self->_coreLocationProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coreLocationProvider, 0);
}

@end
