@implementation MPStoreAssetInfoPlaybackCacheRequest

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4;
  uint64_t v5;

  v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v5 = v4;
  if (v4)
  {
    *(_QWORD *)(v4 + 8) = self->_accountID;
    objc_storeStrong((id *)(v4 + 40), self->_cloudUniversalLibraryID);
    *(_QWORD *)(v5 + 16) = self->_delegatedAccountID;
    objc_storeStrong((id *)(v5 + 32), self->_redownloadParameters);
    *(_QWORD *)(v5 + 24) = self->_requestType;
    *(_QWORD *)(v5 + 72) = self->_storeRadioAdamID;
    *(_QWORD *)(v5 + 56) = self->_storeCloudID;
    *(_QWORD *)(v5 + 64) = self->_storePurchasedAdamID;
    *(_QWORD *)(v5 + 48) = self->_storeSubscriptionAdamID;
  }
  return (id)v5;
}

- (unint64_t)hash
{
  int64_t requestType;
  unint64_t v3;
  NSUInteger storeSubscriptionAdamID;
  unint64_t storeCloudID;
  int64_t storePurchasedAdamID;
  int64_t v7;

  requestType = self->_requestType;
  v3 = self->_delegatedAccountID ^ self->_accountID ^ requestType;
  switch(requestType)
  {
    case 0:
    case 1:
      v3 ^= -[NSString hash](self->_redownloadParameters, "hash");
      return v3;
    case 2:
      storeSubscriptionAdamID = self->_storeSubscriptionAdamID;
      goto LABEL_6;
    case 3:
      storeSubscriptionAdamID = self->_storeRadioAdamID;
      goto LABEL_6;
    case 4:
      storeCloudID = self->_storeCloudID;
      storePurchasedAdamID = self->_storePurchasedAdamID;
      v7 = self->_storeSubscriptionAdamID;
      storeSubscriptionAdamID = v7 ^ storeCloudID ^ storePurchasedAdamID ^ -[NSString hash](self->_cloudUniversalLibraryID, "hash");
LABEL_6:
      v3 ^= storeSubscriptionAdamID;
      break;
    default:
      return v3;
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  MPStoreAssetInfoPlaybackCacheRequest *v4;
  int64_t requestType;
  NSString *redownloadParameters;
  char v7;
  int64_t storeSubscriptionAdamID;
  int64_t storeRadioAdamID;

  v4 = (MPStoreAssetInfoPlaybackCacheRequest *)a3;
  if (v4 == self)
  {
LABEL_18:
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && self->_accountID == v4->_accountID
      && self->_delegatedAccountID == v4->_delegatedAccountID
      && (requestType = self->_requestType, requestType == v4->_requestType))
    {
      switch(requestType)
      {
        case 0:
        case 1:
          redownloadParameters = self->_redownloadParameters;
          if (redownloadParameters == v4->_redownloadParameters)
            goto LABEL_18;
          goto LABEL_8;
        case 2:
          storeSubscriptionAdamID = self->_storeSubscriptionAdamID;
          storeRadioAdamID = v4->_storeSubscriptionAdamID;
          goto LABEL_11;
        case 3:
          storeSubscriptionAdamID = self->_storeRadioAdamID;
          storeRadioAdamID = v4->_storeRadioAdamID;
LABEL_11:
          v7 = storeSubscriptionAdamID == storeRadioAdamID;
          break;
        case 4:
          if (self->_storeCloudID != v4->_storeCloudID
            || self->_storePurchasedAdamID != v4->_storePurchasedAdamID
            || self->_storeSubscriptionAdamID != v4->_storeSubscriptionAdamID)
          {
            goto LABEL_17;
          }
          redownloadParameters = self->_cloudUniversalLibraryID;
          if (redownloadParameters == v4->_cloudUniversalLibraryID)
            goto LABEL_18;
LABEL_8:
          v7 = -[NSString isEqual:](redownloadParameters, "isEqual:");
          break;
        default:
          goto LABEL_18;
      }
    }
    else
    {
LABEL_17:
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)accountID
{
  return self->_accountID;
}

- (void)setAccountID:(unint64_t)a3
{
  self->_accountID = a3;
}

- (unint64_t)delegatedAccountID
{
  return self->_delegatedAccountID;
}

- (void)setDelegatedAccountID:(unint64_t)a3
{
  self->_delegatedAccountID = a3;
}

- (int64_t)requestType
{
  return self->_requestType;
}

- (void)setRequestType:(int64_t)a3
{
  self->_requestType = a3;
}

- (NSString)redownloadParameters
{
  return self->_redownloadParameters;
}

- (void)setRedownloadParameters:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)cloudUniversalLibraryID
{
  return self->_cloudUniversalLibraryID;
}

- (void)setCloudUniversalLibraryID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)storeSubscriptionAdamID
{
  return self->_storeSubscriptionAdamID;
}

- (void)setStoreSubscriptionAdamID:(int64_t)a3
{
  self->_storeSubscriptionAdamID = a3;
}

- (unint64_t)storeCloudID
{
  return self->_storeCloudID;
}

- (void)setStoreCloudID:(unint64_t)a3
{
  self->_storeCloudID = a3;
}

- (int64_t)storePurchasedAdamID
{
  return self->_storePurchasedAdamID;
}

- (void)setStorePurchasedAdamID:(int64_t)a3
{
  self->_storePurchasedAdamID = a3;
}

- (int64_t)storeRadioAdamID
{
  return self->_storeRadioAdamID;
}

- (void)setStoreRadioAdamID:(int64_t)a3
{
  self->_storeRadioAdamID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudUniversalLibraryID, 0);
  objc_storeStrong((id *)&self->_redownloadParameters, 0);
}

@end
