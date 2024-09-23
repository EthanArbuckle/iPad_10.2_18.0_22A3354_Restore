@implementation DKConfiguration

- (DKConfiguration)init
{
  DKConfiguration *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)DKConfiguration;
  result = -[DKConfiguration init](&v3, sel_init);
  if (result)
    result->_allowNonInteractiveCloudUpload = 1;
  return result;
}

+ (id)defaultConfiguration
{
  return objc_alloc_init((Class)a1);
}

+ (id)setupAssistantConfiguration
{
  id v2;

  v2 = objc_alloc_init((Class)a1);
  objc_msgSend(v2, "setPostFollowUp:", 1);
  objc_msgSend(v2, "setSkipBackup:", 1);
  objc_msgSend(v2, "setPreventOpeningSafari:", 1);
  objc_msgSend(v2, "setPresentsNetworkSettingsModally:", 1);
  return v2;
}

- (BOOL)upsellTradeIn
{
  return self->_upsellTradeIn;
}

- (void)setUpsellTradeIn:(BOOL)a3
{
  self->_upsellTradeIn = a3;
}

- (BOOL)postFollowUp
{
  return self->_postFollowUp;
}

- (void)setPostFollowUp:(BOOL)a3
{
  self->_postFollowUp = a3;
}

- (BOOL)skipBackup
{
  return self->_skipBackup;
}

- (void)setSkipBackup:(BOOL)a3
{
  self->_skipBackup = a3;
}

- (BOOL)preventOpeningSafari
{
  return self->_preventOpeningSafari;
}

- (void)setPreventOpeningSafari:(BOOL)a3
{
  self->_preventOpeningSafari = a3;
}

- (BOOL)presentsNetworkSettingsModally
{
  return self->_presentsNetworkSettingsModally;
}

- (void)setPresentsNetworkSettingsModally:(BOOL)a3
{
  self->_presentsNetworkSettingsModally = a3;
}

- (BOOL)allowNonInteractiveCloudUpload
{
  return self->_allowNonInteractiveCloudUpload;
}

- (void)setAllowNonInteractiveCloudUpload:(BOOL)a3
{
  self->_allowNonInteractiveCloudUpload = a3;
}

@end
