@implementation CSAudioRouteChangeMonitor

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_9237 != -1)
    dispatch_once(&sharedInstance_onceToken_9237, &__block_literal_global_9238);
  return (id)sharedInstance_sharedInstance_9239;
}

uint64_t __77__CSAudioRouteChangeMonitor_routeIsDoAPSupportedWithRouteUID_withCompletion___block_invoke_2(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "supportDoAP");
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __77__CSAudioRouteChangeMonitor_routeIsDoAPSupportedWithRouteUID_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)routeIsDoAPSupportedWithRouteUID:(id)a3 withCompletion:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v5 = a4;
  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("-"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __77__CSAudioRouteChangeMonitor_routeIsDoAPSupportedWithRouteUID_withCompletion___block_invoke;
  v15[3] = &unk_1E6880888;
  v9 = v5;
  v16 = v9;
  v10 = MEMORY[0x1B5E468D0](v15);
  v11 = (void *)v10;
  if (v7)
  {
    +[CSBluetoothManager sharedInstance](CSBluetoothManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v8;
    v13[1] = 3221225472;
    v13[2] = __77__CSAudioRouteChangeMonitor_routeIsDoAPSupportedWithRouteUID_withCompletion___block_invoke_2;
    v13[3] = &unk_1E68808B0;
    v14 = v11;
    objc_msgSend(v12, "getBTDeviceInfoWithBTAddressString:withCompletion:", v7, v13);

  }
  else
  {
    (*(void (**)(uint64_t, _QWORD))(v10 + 16))(v10, 0);
  }

}

void __43__CSAudioRouteChangeMonitor_sharedInstance__block_invoke()
{
  CSAudioRouteChangeMonitorImpl *v0;
  void *v1;

  v0 = objc_alloc_init(CSAudioRouteChangeMonitorImpl);
  v1 = (void *)sharedInstance_sharedInstance_9239;
  sharedInstance_sharedInstance_9239 = (uint64_t)v0;

}

- (void)_startMonitoringWithQueue:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSAudioRouteChangeMonitor _startMonitoringWithQueue:]", "CSAudioRouteChangeMonitor.m", 36, "NO");
}

- (void)_stopMonitoring
{
  __assert_rtn("-[CSAudioRouteChangeMonitor _stopMonitoring]", "CSAudioRouteChangeMonitor.m", 40, "NO");
}

- (void)getHearstRouteStatus:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSAudioRouteChangeMonitor getHearstRouteStatus:]", "CSAudioRouteChangeMonitor.m", 44, "NO");
}

- (int64_t)hearstRouteStatus
{
  __assert_rtn("-[CSAudioRouteChangeMonitor hearstRouteStatus]", "CSAudioRouteChangeMonitor.m", 49, "NO");
}

- (void)getJarvisConnected:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSAudioRouteChangeMonitor getJarvisConnected:]", "CSAudioRouteChangeMonitor.m", 54, "NO");
}

- (BOOL)jarvisConnected
{
  __assert_rtn("-[CSAudioRouteChangeMonitor jarvisConnected]", "CSAudioRouteChangeMonitor.m", 59, "NO");
}

- (BOOL)carPlayConnected
{
  __assert_rtn("-[CSAudioRouteChangeMonitor carPlayConnected]", "CSAudioRouteChangeMonitor.m", 64, "NO");
}

- (void)getHearstOwnershipStatus:(id)a3
{
  id v3;

  v3 = a3;
  __assert_rtn("-[CSAudioRouteChangeMonitor getHearstOwnershipStatus:]", "CSAudioRouteChangeMonitor.m", 69, "NO");
}

- (int64_t)hearstOwnership
{
  __assert_rtn("-[CSAudioRouteChangeMonitor hearstOwnership]", "CSAudioRouteChangeMonitor.m", 74, "NO");
}

@end
