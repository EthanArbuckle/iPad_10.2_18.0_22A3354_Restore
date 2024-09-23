@implementation APSIsVirtualMachine

uint64_t __APSIsVirtualMachine_block_invoke()
{
  uint64_t result;
  BOOL v1;
  size_t v2;
  int v3;

  v3 = 0;
  v2 = 4;
  result = sysctlbyname("kern.hv_vmm_present", &v3, &v2, 0, 0);
  if ((_DWORD)result)
    v1 = 1;
  else
    v1 = v3 == 0;
  if (!v1)
  {
    APSIsVirtualMachine_sIsVirtualMachine = 1;
    result = (uint64_t)APSSettingsGetInt64(CFSTR("useWiFiAndAWDLOnVirtualMachine"), 0);
    if (result)
      APSIsVirtualMachine_sIsVirtualMachine = 0;
    if (gLogCategory_APSSystemUtils <= 50)
    {
      if (gLogCategory_APSSystemUtils != -1)
        return LogPrintF();
      result = _LogCategory_Initialize();
      if ((_DWORD)result)
        return LogPrintF();
    }
  }
  return result;
}

@end
