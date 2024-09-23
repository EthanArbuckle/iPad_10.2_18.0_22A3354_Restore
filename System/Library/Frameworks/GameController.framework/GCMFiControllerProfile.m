@implementation GCMFiControllerProfile

uint64_t __40___GCMFiControllerProfile_deviceManager__block_invoke(uint64_t a1)
{
  _GCDefaultDeviceManager *v2;
  void *v3;
  uint64_t v4;
  void *v5;

  v2 = [_GCDefaultDeviceManager alloc];
  NSStringFromClass(*(Class *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[_GCDefaultDeviceManager initWithIdentifier:matchingFilter:probeScore:](v2, "initWithIdentifier:matchingFilter:probeScore:", v3, *(_QWORD *)(a1 + 32), *MEMORY[0x24BE3A698]);
  v5 = (void *)deviceManager_deviceManager_0;
  deviceManager_deviceManager_0 = v4;

  return objc_msgSend((id)deviceManager_deviceManager_0, "setDelegate:", *(_QWORD *)(a1 + 32));
}

BOOL __73___GCMFiControllerProfile_determineCapabilitiesWithServiceInfo_initInfo___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  int v6;

  v2 = a2;
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Max"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("Min"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  if (v3 && v4)
  {
    v6 = objc_msgSend(v3, "intValue");
    v5 = v6 - objc_msgSend(v4, "intValue") == 1;
  }

  return v5;
}

uint64_t __73___GCMFiControllerProfile_determineCapabilitiesWithServiceInfo_initInfo___block_invoke_2(uint64_t a1, int a2)
{
  if ((a2 - 1) > 0xF)
    return 22;
  else
    return qword_21526CEE0[a2 - 1];
}

@end
