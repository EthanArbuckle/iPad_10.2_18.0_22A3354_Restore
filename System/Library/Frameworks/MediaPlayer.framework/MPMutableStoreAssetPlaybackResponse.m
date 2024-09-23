@implementation MPMutableStoreAssetPlaybackResponse

- (id)copyWithZone:(_NSZone *)a3
{
  return -[MPStoreAssetPlaybackResponse _copyWithPlaybackResponseClass:](self, "_copyWithPlaybackResponseClass:", objc_opt_class());
}

- (void)setDialogDictionary:(id)a3
{
  NSDictionary *v4;
  NSDictionary *dialogDictionary;

  v4 = (NSDictionary *)objc_msgSend(a3, "copy");
  dialogDictionary = self->super._dialogDictionary;
  self->super._dialogDictionary = v4;

}

- (void)setExpirationDate:(id)a3
{
  NSDate *v4;
  NSDate *expirationDate;

  v4 = (NSDate *)objc_msgSend(a3, "copy");
  expirationDate = self->super._expirationDate;
  self->super._expirationDate = v4;

}

- (void)setFileAssetInfoList:(id)a3
{
  NSArray *v4;
  NSArray *fileAssetInfoList;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  fileAssetInfoList = self->super._fileAssetInfoList;
  self->super._fileAssetInfoList = v4;

}

- (void)setHlsAssetInfo:(id)a3
{
  objc_storeStrong((id *)&self->super._hlsAssetInfo, a3);
}

- (void)setLiveRadioStream:(BOOL)a3
{
  self->super._liveRadioStream = a3;
}

- (void)setRadioStreamAssetInfoList:(id)a3
{
  NSArray *v4;
  NSArray *radioStreamAssetInfoList;

  v4 = (NSArray *)objc_msgSend(a3, "copy");
  radioStreamAssetInfoList = self->super._radioStreamAssetInfoList;
  self->super._radioStreamAssetInfoList = v4;

}

- (void)setSuzeLeaseID:(id)a3
{
  objc_storeStrong(&self->super._suzeLeaseID, a3);
}

- (void)setSubscriptionRequired:(BOOL)a3
{
  self->super._subscriptionRequired = a3;
}

- (void)setOnlineSubscriptionKeysRequired:(BOOL)a3
{
  self->super._onlineSubscriptionKeysRequired = a3;
}

@end
