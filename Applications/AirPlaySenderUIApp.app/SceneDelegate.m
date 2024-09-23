@implementation SceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a5, "URLContexts", a3, a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "allObjects"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "firstObject"));

  if (dword_10001EF18 <= 30
    && (dword_10001EF18 != -1 || _LogCategory_Initialize(&dword_10001EF18, 33554462)))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
    LogPrintF(&dword_10001EF18, "-[SceneDelegate scene:willConnectToSession:options:]", 33554462, "willConnectToSession - URL: %@", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "URL"));
  -[SceneDelegate _handleURL:](self, "_handleURL:", v9);

}

- (void)scene:(id)a3 openURLContexts:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "allObjects", a3));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (dword_10001EF18 <= 30
    && (dword_10001EF18 != -1 || _LogCategory_Initialize(&dword_10001EF18, 33554462)))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
    LogPrintF(&dword_10001EF18, "-[SceneDelegate scene:openURLContexts:]", 33554462, "willConnectToSession - URL: %@", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "URL"));
  -[SceneDelegate _handleURL:](self, "_handleURL:", v7);

}

- (void)_handleURL:(id)a3
{
  __CFString *v4;
  uint64_t v5;
  int v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  int v14;
  const __CFString *v15;
  void *v16;
  id v17;
  const __CFString *v18;
  void *v19;

  v4 = (__CFString *)a3;
  if (!v4)
  {
    if (dword_10001EF18 <= 30
      && (dword_10001EF18 != -1 || _LogCategory_Initialize(&dword_10001EF18, 33554462)))
    {
      LogPrintF(&dword_10001EF18, "-[SceneDelegate _handleURL:]", 33554462, "URL is nil");
    }
    goto LABEL_27;
  }
  v5 = -[SceneDelegate _setupAssistantEnabled](self, "_setupAssistantEnabled");
  if ((v5 & 1) == 0)
  {
    if (dword_10001EF18 <= 60
      && (dword_10001EF18 != -1 || _LogCategory_Initialize(&dword_10001EF18, 33554492)))
    {
      LogPrintF(&dword_10001EF18, "-[SceneDelegate _handleURL:]", 33554492, "Feature not enabled");
    }
    goto LABEL_27;
  }
  if (dword_10001EF18 <= 50)
  {
    if (dword_10001EF18 != -1 || (v5 = _LogCategory_Initialize(&dword_10001EF18, 33554482), (_DWORD)v5))
    {
      v6 = IsAppleInternalBuild(v5);
      v7 = CFSTR("#Redacted#");
      if (v6)
        v7 = v4;
      LogPrintF(&dword_10001EF18, "-[SceneDelegate _handleURL:]", 33554482, "Handling URL: %@", v7);
    }
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString absoluteString](v4, "absoluteString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[APUIAirPlayURLParser setupPayloadFromAirPlayURL:](APUIAirPlayURLParser, "setupPayloadFromAirPlayURL:", v8));

  if (!v9)
  {
    if (dword_10001EF18 <= 50)
    {
      if (dword_10001EF18 != -1 || (v10 = _LogCategory_Initialize(&dword_10001EF18, 33554482), (_DWORD)v10))
      {
        v14 = IsAppleInternalBuild(v10);
        v15 = CFSTR("#Redacted#");
        if (v14)
          v15 = v4;
        LogPrintF(&dword_10001EF18, "-[SceneDelegate _handleURL:]", 33554482, "Failed to parse setup payload from URL: %@", v15);
      }
    }
LABEL_27:
    v13 = 0;
    v9 = 0;
    v11 = 0;
    goto LABEL_28;
  }
  v17 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v9, 1, &v17));
  v12 = v17;
  if (v12)
  {
    v13 = v12;
    if (dword_10001EF18 <= 50
      && (dword_10001EF18 != -1 || _LogCategory_Initialize(&dword_10001EF18, 33554482)))
    {
      LogPrintF(&dword_10001EF18, "-[SceneDelegate _handleURL:]", 33554482, "Error while creating setup payload data, bailing out: %@", v13);
    }
  }
  else
  {
    v18 = CFSTR("setupPayload");
    v19 = v11;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1));
    +[APUIAirPlaySetupFlowLauncher launchAirPlaySetupFlowWithUserInfo:](APUIAirPlaySetupFlowLauncher, "launchAirPlaySetupFlowWithUserInfo:", v16);

    v13 = 0;
  }
LABEL_28:

}

- (BOOL)_setupAssistantEnabled
{
  uint64_t Shared;
  const char *v3;
  const char *v4;
  char IsFeatureEnabled;

  IsFeatureEnabled = 0;
  Shared = APSRemoteConfigGetShared(self, a2);
  if (Shared
    && APSRemoteConfigGetBooleanIfPresent(Shared, kAPSRemoteConfigKey_AirPlaySetupAssistantAndBrokeredDiscovery, &IsFeatureEnabled))
  {
    v3 = "remotely";
  }
  else
  {
    IsFeatureEnabled = APSSettingsIsFeatureEnabled(CFSTR("SetupAssistant"));
    v3 = "locally";
  }
  if (dword_10001EF18 <= 50
    && (dword_10001EF18 != -1 || _LogCategory_Initialize(&dword_10001EF18, 33554482)))
  {
    if (IsFeatureEnabled)
      v4 = "enabled";
    else
      v4 = "disabled";
    LogPrintF(&dword_10001EF18, "-[SceneDelegate _setupAssistantEnabled]", 33554482, "%s %s", v3, v4);
  }
  return IsFeatureEnabled != 0;
}

- (UIWindow)window
{
  return self->_window;
}

- (void)setWindow:(id)a3
{
  objc_storeStrong((id *)&self->_window, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
}

@end
