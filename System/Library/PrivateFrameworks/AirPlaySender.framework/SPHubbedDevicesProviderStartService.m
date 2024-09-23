@implementation SPHubbedDevicesProviderStartService

void __SPHubbedDevicesProviderStartService_block_invoke()
{
  int v0;
  uint64_t v1;
  void (*v2)(uint64_t);
  int v3;
  uint64_t v4;

  v4 = 0;
  v0 = SPGetEndpointManager(&v4);
  SPHubbedDevicesProviderStartService_err = v0;
  if (v0)
  {
    if (v0 == -72390)
    {
      v3 = -6735;
LABEL_20:
      SPHubbedDevicesProviderStartService_err = v3;
      goto LABEL_8;
    }
    goto LABEL_23;
  }
  if (!v4)
    goto LABEL_19;
  SPHubbedDevicesProviderStartService_err = SPHubbedDevicesProviderCreate((CFTypeRef *)&SPHubbedDevicesProviderStartService_sharedProvider);
  if (SPHubbedDevicesProviderStartService_err)
  {
LABEL_23:
    APSLogErrorAt();
    goto LABEL_8;
  }
  if (!SPHubbedDevicesProviderStartService_sharedProvider)
  {
LABEL_19:
    APSLogErrorAt();
    v3 = -6762;
    goto LABEL_20;
  }
  SPHubbedDevicesProviderStartService_err = SPHubbedDevicesProviderAddListener(SPHubbedDevicesProviderStartService_sharedProvider, v4, (uint64_t)hubbedDevicesProviderRemote_handleDevicesChanged);
  if (SPHubbedDevicesProviderStartService_err)
    goto LABEL_23;
  SPHubbedDevicesProviderStartService_err = SPHubbedDevicesProviderStartAsync((const void *)SPHubbedDevicesProviderStartService_sharedProvider);
  if (SPHubbedDevicesProviderStartService_err)
  {
    APSLogErrorAt();
    SPHubbedDevicesProviderRemoveListener(SPHubbedDevicesProviderStartService_sharedProvider, v4);
  }
  else
  {
    CMNotificationCenterGetDefaultLocalCenter();
    CMNotificationCenterAddListener();
  }
LABEL_8:
  if (SPHubbedDevicesProviderStartService_err)
  {
    v1 = SPHubbedDevicesProviderStartService_sharedProvider;
    if (SPHubbedDevicesProviderStartService_sharedProvider)
    {
      v2 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 8) + 24);
      if (v2)
        v2(v1);
      if (SPHubbedDevicesProviderStartService_sharedProvider)
      {
        CFRelease((CFTypeRef)SPHubbedDevicesProviderStartService_sharedProvider);
        SPHubbedDevicesProviderStartService_sharedProvider = 0;
      }
    }
  }
}

@end
