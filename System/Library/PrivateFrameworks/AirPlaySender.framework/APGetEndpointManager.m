@implementation APGetEndpointManager

void __APGetEndpointManager_block_invoke()
{
  const char *v0;
  int v1;
  CFTypeRef cf;

  if (MEMORY[0x1CAA3DF18]() && (v0 = getprogname(), !strcmp(v0, "audiomxd")))
  {
    if (gLogCategory_APEndpointManagerFactory <= 50
      && (gLogCategory_APEndpointManagerFactory != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v1 = FigEndpointManagerRemoteCopyAirPlayManager();
    if (v1)
      goto LABEL_31;
  }
  else
  {
    if (gLogCategory_APEndpointManagerFactory <= 50
      && (gLogCategory_APEndpointManagerFactory != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    cf = 0;
    v1 = APEndpointManagerCreate(&cf);
    if (v1)
    {
      APSLogErrorAt();
    }
    else
    {
      if (!APSIsExplicitEndpointManagerInitializationEnabledInMX()
        && CMSessionMgrRegisterEndpointManager()
        && gLogCategory_APEndpointManagerFactory <= 90
        && (gLogCategory_APEndpointManagerFactory != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      APGetEndpointManager_sEndpointManager = (uint64_t)cf;
      cf = 0;
    }
    if (gLogCategory_APEndpointManagerFactory <= 50
      && (gLogCategory_APEndpointManagerFactory != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    if (cf)
      CFRelease(cf);
    if (v1)
LABEL_31:
      APSLogErrorAt();
  }
  APGetEndpointManager_sCreationResult = v1;
}

@end
