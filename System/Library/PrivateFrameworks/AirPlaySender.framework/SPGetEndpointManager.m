@implementation SPGetEndpointManager

void __SPGetEndpointManager_block_invoke()
{
  uint64_t IsFeatureEnabled;
  int v1;
  CFTypeRef cf;

  IsFeatureEnabled = APSSettingsIsFeatureEnabled();
  if (!(_DWORD)IsFeatureEnabled)
  {
    IsFeatureEnabled = APSSettingsGetIntWithDefault();
    if (!(_DWORD)IsFeatureEnabled)
    {
      v1 = -72390;
LABEL_16:
      if (gLogCategory_SPEndpointManagerFactory <= 90
        && (gLogCategory_SPEndpointManagerFactory != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      goto LABEL_37;
    }
  }
  if (gLogCategory_SPEndpointManagerFactory <= 50)
  {
    if (gLogCategory_SPEndpointManagerFactory != -1
      || (IsFeatureEnabled = _LogCategory_Initialize(), (_DWORD)IsFeatureEnabled))
    {
      IsFeatureEnabled = LogPrintF();
    }
  }
  if (MEMORY[0x1CAA3DF18](IsFeatureEnabled) && !FigServer_IsAirplayd())
  {
    if (gLogCategory_SPEndpointManagerFactory <= 50
      && (gLogCategory_SPEndpointManagerFactory != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v1 = FigEndpointManagerRemoteCopySidePlayManager();
    if (v1)
      goto LABEL_43;
  }
  else
  {
    if (gLogCategory_SPEndpointManagerFactory <= 50
      && (gLogCategory_SPEndpointManagerFactory != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    cf = 0;
    v1 = SPEndpointManagerCreate(&cf);
    if (v1)
    {
      APSLogErrorAt();
    }
    else
    {
      if (!APSIsExplicitEndpointManagerInitializationEnabledInMX()
        && CMSessionMgrRegisterEndpointManager()
        && gLogCategory_SPEndpointManagerFactory <= 90
        && (gLogCategory_SPEndpointManagerFactory != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      SPGetEndpointManager_sEndpointManager = (uint64_t)cf;
      cf = 0;
    }
    if (gLogCategory_SPEndpointManagerFactory <= 50
      && (gLogCategory_SPEndpointManagerFactory != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (cf)
      CFRelease(cf);
    if (v1)
    {
LABEL_43:
      APSLogErrorAt();
      goto LABEL_16;
    }
  }
LABEL_37:
  SPGetEndpointManager_sCreationResult = v1;
}

@end
