@implementation CDNetworkContext

void __52___CDNetworkContext_keyPathForWiredConnectionStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/wired/status"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForWiredConnectionStatus_wiredConnection;
  keyPathForWiredConnectionStatus_wiredConnection = v0;

}

void __51___CDNetworkContext_keyPathForWiFiConnectionStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/wifi/status"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForWiFiConnectionStatus_wifiConnectionStatus;
  keyPathForWiFiConnectionStatus_wifiConnectionStatus = v0;

}

void __51___CDNetworkContext_keyPathForCellConnectionStatus__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[_CDContextualKeyPath keyPathWithKey:](_CDContextualKeyPath, "keyPathWithKey:", CFSTR("/system/cell/status"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)keyPathForCellConnectionStatus_cellConnectionStatus;
  keyPathForCellConnectionStatus_cellConnectionStatus = v0;

}

@end
