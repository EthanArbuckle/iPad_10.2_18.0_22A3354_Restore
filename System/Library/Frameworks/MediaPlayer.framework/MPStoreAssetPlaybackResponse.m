@implementation MPStoreAssetPlaybackResponse

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[MPStoreAssetPlaybackResponse _copyWithPlaybackResponseClass:](self, "_copyWithPlaybackResponseClass:", objc_opt_class());
}

- (id)_copyWithPlaybackResponseClass:(Class)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v4 = objc_alloc_init(a3);
  if (v4)
  {
    v5 = -[NSDictionary copy](self->_dialogDictionary, "copy");
    v6 = (void *)*((_QWORD *)v4 + 1);
    *((_QWORD *)v4 + 1) = v5;

    objc_storeStrong((id *)v4 + 2, self->_expirationDate);
    objc_storeStrong((id *)v4 + 3, self->_fileAssetInfoList);
    objc_storeStrong((id *)v4 + 4, self->_hlsAssetInfo);
    *((_BYTE *)v4 + 40) = self->_liveRadioStream;
    v7 = -[NSArray copy](self->_radioStreamAssetInfoList, "copy");
    v8 = (void *)*((_QWORD *)v4 + 6);
    *((_QWORD *)v4 + 6) = v7;

    objc_storeStrong((id *)v4 + 7, self->_suzeLeaseID);
    *((_BYTE *)v4 + 64) = self->_subscriptionRequired;
    *((_BYTE *)v4 + 65) = self->_onlineSubscriptionKeysRequired;
  }
  return v4;
}

- (NSDictionary)dialogDictionary
{
  return self->_dialogDictionary;
}

- (NSDate)expirationDate
{
  return self->_expirationDate;
}

- (NSArray)fileAssetInfoList
{
  return self->_fileAssetInfoList;
}

- (MPStoreHLSAssetInfo)hlsAssetInfo
{
  return self->_hlsAssetInfo;
}

- (BOOL)isLiveRadioStream
{
  return self->_liveRadioStream;
}

- (NSArray)radioStreamAssetInfoList
{
  return self->_radioStreamAssetInfoList;
}

- (id)suzeLeaseID
{
  return self->_suzeLeaseID;
}

- (BOOL)isSubscriptionRequired
{
  return self->_subscriptionRequired;
}

- (BOOL)onlineSubscriptionKeysRequired
{
  return self->_onlineSubscriptionKeysRequired;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_suzeLeaseID, 0);
  objc_storeStrong((id *)&self->_radioStreamAssetInfoList, 0);
  objc_storeStrong((id *)&self->_hlsAssetInfo, 0);
  objc_storeStrong((id *)&self->_fileAssetInfoList, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_dialogDictionary, 0);
}

@end
