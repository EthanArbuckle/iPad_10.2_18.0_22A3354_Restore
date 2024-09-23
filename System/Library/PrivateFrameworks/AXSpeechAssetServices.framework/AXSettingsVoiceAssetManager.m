@implementation AXSettingsVoiceAssetManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_1);
  return (id)sharedInstance_Manager;
}

void __45__AXSettingsVoiceAssetManager_sharedInstance__block_invoke()
{
  AXSettingsVoiceAssetManager *v0;
  void *v1;

  v0 = objc_alloc_init(AXSettingsVoiceAssetManager);
  v1 = (void *)sharedInstance_Manager;
  sharedInstance_Manager = (uint64_t)v0;

}

- (void)dealloc
{
  __SCNetworkReachability *reachability;
  __SCNetworkReachability *v4;
  objc_super v5;

  reachability = self->_reachability;
  if (reachability)
  {
    SCNetworkReachabilitySetCallback(reachability, 0, 0);
    v4 = self->_reachability;
    if (v4)
    {
      CFRelease(v4);
      self->_reachability = 0;
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)AXSettingsVoiceAssetManager;
  -[AXSettingsVoiceAssetManager dealloc](&v5, sel_dealloc);
}

- (void)_updateAllowedToDownload
{
  AllowedToDownloadIsSet = 0;
}

- (BOOL)allowedToDownloadVoiceAssets
{
  int v2;
  __SCNetworkReachability *reachability;
  __SCNetworkReachability *v5;
  unsigned int v6;
  NSObject *v7;
  SCNetworkReachabilityContext v9;
  sockaddr address;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (AllowedToDownloadIsSet == 1)
  {
    v2 = AllowedToDownload;
    return v2 != 0;
  }
  reachability = self->_reachability;
  if (reachability)
  {
    *(_DWORD *)&address.sa_len = 0;
  }
  else
  {
    address = (sockaddr)xmmword_2172DF800;
    v5 = SCNetworkReachabilityCreateWithAddress(0, &address);
    self->_reachability = v5;
    v9.version = 0;
    v9.info = self;
    v9.retain = 0;
    v9.release = 0;
    v9.copyDescription = (CFStringRef (__cdecl *)(const void *))MEMORY[0x24BDBBC58];
    SCNetworkReachabilitySetCallback(v5, (SCNetworkReachabilityCallBack)__ReachabilityCallback_0, &v9);
    SCNetworkReachabilitySetDispatchQueue(self->_reachability, MEMORY[0x24BDAC9B8]);
    reachability = self->_reachability;
    *(_DWORD *)&address.sa_len = 0;
    if (!reachability)
    {
      v6 = 0;
      goto LABEL_7;
    }
  }
  SCNetworkReachabilityGetFlags(reachability, (SCNetworkReachabilityFlags *)&address.sa_len);
  v6 = *(_DWORD *)&address.sa_len;
LABEL_7:
  AXLogSpeechAssetDownload();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    LODWORD(v9.version) = 67109120;
    HIDWORD(v9.version) = (v6 >> 1) & 1;
    _os_log_impl(&dword_2172DC000, v7, OS_LOG_TYPE_INFO, "PREMIUM: Is reachable: %d", (uint8_t *)&v9, 8u);
  }

  AllowedToDownload = (v6 & 2) != 0;
  AllowedToDownloadIsSet = 1;
  v2 = v6 & 2;
  return v2 != 0;
}

@end
