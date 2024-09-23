@implementation CPFeatureFlags

- (BOOL)qrPluginEncryptionEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)expanseParticipantIDHashed
{
  return _os_feature_enabled_impl();
}

- (BOOL)expanseEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)expanseTopicStateEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)mochiEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)unreliableMessengerEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)sharePlayLiteEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)autoGameCenterEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)gameCenterSharePlayIntegration
{
  return _os_feature_enabled_impl();
}

- (BOOL)gameCenterFastSyncTransport
{
  return _os_feature_enabled_impl();
}

- (BOOL)newApplicationLauncherEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)sharePlayInFaceTimeCanvasEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)sharePlayAttachmentLedgerEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)wranglerEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)wranglerHomePodBoopEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)fastSyncPresenceSeparationEnabled
{
  if ((_os_feature_enabled_impl() & 1) != 0 || -[CPFeatureFlags wranglerEnabled](self, "wranglerEnabled"))
    return 1;
  else
    return _os_feature_enabled_impl();
}

- (BOOL)fastSyncRecoveryMessageHandlingEnabled
{
  return _os_feature_enabled_impl();
}

- (BOOL)appProtectionEnabled
{
  return _os_feature_enabled_impl();
}

@end
