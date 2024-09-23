@implementation WFAirplaneModeSettingsClient

- (void)getStateWithCompletionHandler:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[WFRadiosPreferencesSettingsClient radiosPreferences](self, "radiosPreferences");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "airplaneMode");

  getWFBundledIntentsLogObject();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "-[WFAirplaneModeSettingsClient getStateWithCompletionHandler:]";
    v10 = 1024;
    v11 = v6;
    _os_log_impl(&dword_22D353000, v7, OS_LOG_TYPE_INFO, "%s Retrieved Airplane Mode state: %d", (uint8_t *)&v8, 0x12u);
  }

  v4[2](v4, v6, 0);
}

- (void)setState:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);
  void *v7;
  NSObject *v8;
  int v9;
  const char *v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a3;
  v13 = *MEMORY[0x24BDAC8D0];
  v6 = (void (**)(id, _QWORD))a4;
  -[WFRadiosPreferencesSettingsClient radiosPreferences](self, "radiosPreferences");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAirplaneMode:", v4);

  getWFBundledIntentsLogObject();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = 136315394;
    v10 = "-[WFAirplaneModeSettingsClient setState:completionHandler:]";
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_22D353000, v8, OS_LOG_TYPE_INFO, "%s Set Airplane Mode state to %d", (uint8_t *)&v9, 0x12u);
  }

  v6[2](v6, 0);
}

@end
