@implementation DKDiagnosticContextMock

- (void)updateProgress:(id)a3 forTest:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  DiagnosticsKitLogHandleForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[DKDiagnosticContextMock updateProgress:forTest:]";
    v10 = 2112;
    v11 = v5;
    v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_22DE4C000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@, %@", (uint8_t *)&v8, 0x20u);
  }

}

- (void)enableVolumeHUD:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v3 = a3;
  v9 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[DKDiagnosticContextMock enableVolumeHUD:]";
    v7 = 1024;
    v8 = v3;
    _os_log_impl(&dword_22DE4C000, v4, OS_LOG_TYPE_DEFAULT, "%s: %d", (uint8_t *)&v5, 0x12u);
  }

}

- (void)setScreenToBrightness:(float)a3 animate:(BOOL)a4
{
  _BOOL4 v4;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  double v10;
  __int16 v11;
  _BOOL4 v12;
  uint64_t v13;

  v4 = a4;
  v13 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315650;
    v8 = "-[DKDiagnosticContextMock setScreenToBrightness:animate:]";
    v9 = 2048;
    v10 = a3;
    v11 = 1024;
    v12 = v4;
    _os_log_impl(&dword_22DE4C000, v6, OS_LOG_TYPE_DEFAULT, "%s: %f, %d", (uint8_t *)&v7, 0x1Cu);
  }

}

- (void)getAsset:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *);
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *))a4;
  DiagnosticsKitLogHandleForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[DKDiagnosticContextMock getAsset:completion:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_22DE4C000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDBCE50], "data");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8);

}

- (void)uploadAssets:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, void *, _QWORD);
  NSObject *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  DiagnosticsKitLogHandleForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[DKDiagnosticContextMock uploadAssets:completion:]";
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_22DE4C000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v9, 0x16u);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v8, 0);

}

- (void)showUI:(id)a3 completion:(id)a4
{
  id v5;
  void (**v6)(id, _QWORD);
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  DiagnosticsKitLogHandleForCategory(2);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315394;
    v9 = "-[DKDiagnosticContextMock showUI:completion:]";
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_22DE4C000, v7, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v8, 0x16u);
  }

  v6[2](v6, MEMORY[0x24BDBD1B8]);
}

- (void)requestPluginReloadOnFinishWithCompletion:(id)a3
{
  void (**v3)(_QWORD);
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(_QWORD))a3;
  DiagnosticsKitLogHandleForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[DKDiagnosticContextMock requestPluginReloadOnFinishWithCompletion:]";
    _os_log_impl(&dword_22DE4C000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3);
}

- (void)unpairSessionAccessoryOnTestCompletion
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[DKDiagnosticContextMock unpairSessionAccessoryOnTestCompletion]";
    _os_log_impl(&dword_22DE4C000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }

}

- (void)requestSessionAccessoryIdentifierWithCompletion:(id)a3
{
  void (**v3)(id, const __CFString *, _QWORD);
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = (void (**)(id, const __CFString *, _QWORD))a3;
  DiagnosticsKitLogHandleForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[DKDiagnosticContextMock requestSessionAccessoryIdentifierWithCompletion:]";
    _os_log_impl(&dword_22DE4C000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  v3[2](v3, &stru_24F99B508, 0);
}

- (void)allowSessionAccessoryDisconnectForDuration:(id)a3
{
  id v3;
  NSObject *v4;
  int v5;
  const char *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  DiagnosticsKitLogHandleForCategory(2);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "-[DKDiagnosticContextMock allowSessionAccessoryDisconnectForDuration:]";
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_22DE4C000, v4, OS_LOG_TYPE_DEFAULT, "%s: %@", (uint8_t *)&v5, 0x16u);
  }

}

- (void)clearAllowSessionAccessoryDisconnect
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(2);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 136315138;
    v4 = "-[DKDiagnosticContextMock clearAllowSessionAccessoryDisconnect]";
    _os_log_impl(&dword_22DE4C000, v2, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v3, 0xCu);
  }

}

- (void)displayAlertWithHeader:(id)a3 message:(id)a4 buttonStrings:(id)a5 completion:(id)a6
{
  NSObject *v6;
  int v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(2);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[DKDiagnosticContextMock displayAlertWithHeader:message:buttonStrings:completion:]";
    _os_log_impl(&dword_22DE4C000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v7, 0xCu);
  }

}

- (void)displayInstructions:(id)a3 style:(int)a4 imageLocators:(id)a5 title:(id)a6 subtitle:(id)a7 iconLocator:(id)a8 options:(id)a9 completion:(id)a10
{
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory(2);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[DKDiagnosticContextMock displayInstructions:style:imageLocators:title:subtitle:iconLocator:options:completion:]";
    _os_log_impl(&dword_22DE4C000, v10, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

}

@end
