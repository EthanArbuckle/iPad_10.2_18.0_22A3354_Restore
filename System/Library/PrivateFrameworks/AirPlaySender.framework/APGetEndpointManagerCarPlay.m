@implementation APGetEndpointManagerCarPlay

uint64_t __APGetEndpointManagerCarPlay_block_invoke(uint64_t a1)
{
  const char *v1;
  int v2;
  uint64_t result;
  int v4;
  CFTypeRef cf;

  if (gLogCategory_APEndpointManagerCarPlayFactory <= 50)
  {
    if (gLogCategory_APEndpointManagerCarPlayFactory != -1 || (a1 = _LogCategory_Initialize(), (_DWORD)a1))
      a1 = LogPrintF();
  }
  if (!MEMORY[0x1CAA3DF18](a1) || (v1 = getprogname(), strcmp(v1, "audiomxd")))
  {
    if (gLogCategory_APEndpointManagerCarPlayFactory <= 50
      && (gLogCategory_APEndpointManagerCarPlayFactory != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    cf = 0;
    v2 = APEndpointManagerCarPlayCreate(*MEMORY[0x1E0C9AE00], 0, &cf);
    if (!v2)
    {
      result = APSIsExplicitEndpointManagerInitializationEnabledInMX();
      if (!(_DWORD)result)
      {
        result = CMSessionMgrRegisterEndpointManager();
        if ((_DWORD)result)
        {
          if (gLogCategory_APEndpointManagerCarPlayFactory <= 90)
          {
            if (gLogCategory_APEndpointManagerCarPlayFactory != -1
              || (result = _LogCategory_Initialize(), (_DWORD)result))
            {
              result = LogPrintF();
            }
          }
        }
      }
      v4 = 0;
      APGetEndpointManagerCarPlay_sEndpointManager = (uint64_t)cf;
      goto LABEL_23;
    }
    v4 = v2;
    APSLogErrorAt();
    if (cf)
      CFRelease(cf);
    goto LABEL_28;
  }
  if (gLogCategory_APEndpointManagerCarPlayFactory <= 50
    && (gLogCategory_APEndpointManagerCarPlayFactory != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = FigEndpointManagerRemoteCopyCarPlayManager();
  v4 = result;
  if ((_DWORD)result)
  {
LABEL_28:
    result = APSLogErrorAt();
    if (gLogCategory_APEndpointManagerCarPlayFactory <= 90)
    {
      if (gLogCategory_APEndpointManagerCarPlayFactory != -1 || (result = _LogCategory_Initialize(), (_DWORD)result))
        result = LogPrintF();
    }
  }
LABEL_23:
  APGetEndpointManagerCarPlay_sCreationResult = v4;
  return result;
}

@end
