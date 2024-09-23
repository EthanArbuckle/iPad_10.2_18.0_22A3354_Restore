@implementation APUIAirPlaySetupFlowLauncher

+ (BOOL)launchAirPlayAutomaticSetupFlowWithConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  int v8;
  const __CFString *v9;
  id v11;
  const __CFString *v12;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!APSSettingsIsFeatureEnabled())
  {
    if (gLogCategory_APUIAirPlaySetupFlowLauncher <= 60
      && (gLogCategory_APUIAirPlaySetupFlowLauncher != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    goto LABEL_21;
  }
  if (gLogCategory_APUIAirPlaySetupFlowLauncher <= 50
    && (gLogCategory_APUIAirPlaySetupFlowLauncher != -1 || _LogCategory_Initialize()))
  {
    v11 = v3;
    LogPrintF();
  }
  objc_msgSend(v3, "urlString", v11);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    APSLogErrorAt();
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", v5);
  v6 = objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    APSLogErrorAt();

LABEL_21:
    LOBYTE(v5) = 0;
    goto LABEL_15;
  }
  v7 = (__CFString *)v6;
  if (gLogCategory_APUIAirPlaySetupFlowLauncher <= 50
    && (gLogCategory_APUIAirPlaySetupFlowLauncher != -1 || _LogCategory_Initialize()))
  {
    v8 = IsAppleInternalBuild();
    v9 = CFSTR("#Redacted#");
    if (v8)
      v9 = v7;
    v12 = v9;
    LogPrintF();
  }
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v7, 0, v12);

  LOBYTE(v5) = 1;
LABEL_15:

  return (char)v5;
}

+ (BOOL)launchAirPlayManualSetupFlowForDiscoveryBroker:(id)a3
{
  id v3;

  v3 = a3;
  if (gLogCategory_APUIAirPlaySetupFlowLauncher <= 50
    && (gLogCategory_APUIAirPlaySetupFlowLauncher != -1 || _LogCategory_Initialize()))
  {
    if (v3)
      IsAppleInternalBuild();
    LogPrintF();
  }

  return 0;
}

+ (void)launchAirPlaySetupFlowWithUserInfo:(id)a3
{
  void *v3;
  id v4;
  id v5;
  const __CFString *v6;
  void *v7;
  const __CFString *v8;
  __CFString *v9;

  v9 = (__CFString *)a3;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0AE8]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.APSUIApp"), CFSTR("APUISetupViewController"));
  v4 = objc_alloc_init(MEMORY[0x24BEB0AD0]);
  v5 = objc_alloc_init(MEMORY[0x24BEB0AC8]);
  objc_msgSend(v5, "setReason:", CFSTR("Display AirPlay user experience"));
  objc_msgSend(v5, "setUserInfo:", v9);
  if (gLogCategory_APUIAirPlaySetupFlowLauncher <= 50
    && (gLogCategory_APUIAirPlaySetupFlowLauncher != -1 || _LogCategory_Initialize()))
  {
    if (v9 && !IsAppleInternalBuild())
      v6 = CFSTR("#Redacted#");
    else
      v6 = v9;
    v8 = v6;
    LogPrintF();
  }
  v7 = (void *)objc_msgSend(MEMORY[0x24BEB0AF8], "newHandleWithDefinition:configurationContext:", v3, v4, v8);
  objc_msgSend(v7, "activateWithContext:", v5);

}

@end
