@implementation AMSURLRequestProperties

- (AMSPurchaseInfo)purchaseInfo
{
  return self->_purchaseInfo;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;

  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = -[ACAccount copyWithZone:](self->_account, "copyWithZone:", a3);
  v7 = *(void **)(v5 + 16);
  *(_QWORD *)(v5 + 16) = v6;

  v8 = -[NSDictionary copyWithZone:](self->_additionalMetrics, "copyWithZone:", a3);
  v9 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v8;

  *(_QWORD *)(v5 + 32) = self->_anisetteType;
  objc_storeStrong((id *)(v5 + 40), self->_bag);
  v10 = -[AMSProcessInfo copyWithZone:](self->_clientInfo, "copyWithZone:", a3);
  v11 = *(void **)(v5 + 48);
  *(_QWORD *)(v5 + 48) = v10;

  *(_QWORD *)(v5 + 56) = self->_dialogOptions;
  *(_BYTE *)(v5 + 8) = self->_disableBiometricsResponseHandling;
  *(_BYTE *)(v5 + 9) = self->_disableLoadURLMetrics;
  *(_BYTE *)(v5 + 10) = self->_disableResponseDecoding;
  *(_BYTE *)(v5 + 11) = self->_excludeIdentifierHeadersForAccount;
  objc_storeStrong((id *)(v5 + 64), self->_gsTokenIdentifier);
  v12 = -[AMSKeychainOptions copyWithZone:](self->_keychainOptions, "copyWithZone:", a3);
  v13 = *(void **)(v5 + 72);
  *(_QWORD *)(v5 + 72) = v12;

  *(_BYTE *)(v5 + 12) = self->_knownToBeTrusted;
  v14 = -[NSString copyWithZone:](self->_logUUID, "copyWithZone:", a3);
  v15 = *(void **)(v5 + 80);
  *(_QWORD *)(v5 + 80) = v14;

  *(_QWORD *)(v5 + 88) = self->_maxRetryCount;
  *(_QWORD *)(v5 + 96) = self->_mescalType;
  objc_storeStrong((id *)(v5 + 104), self->_purchaseInfo);
  *(_BYTE *)(v5 + 13) = self->_remoteSecuritySigningEnabled;
  objc_storeStrong((id *)(v5 + 112), self->_responseDecoder);
  *(_QWORD *)(v5 + 120) = self->_reversePushType;
  *(_BYTE *)(v5 + 14) = self->_shouldSetCookiesFromResponse;
  *(_BYTE *)(v5 + 15) = self->_shouldSetStorefrontFromResponse;
  v16 = -[NSMutableDictionary mutableCopyWithZone:](self->_userInfo, "mutableCopyWithZone:", a3);
  v17 = *(void **)(v5 + 128);
  *(_QWORD *)(v5 + 128) = v16;

  return (id)v5;
}

- (AMSURLRequestProperties)init
{
  AMSURLRequestProperties *v2;
  AMSURLRequestProperties *v3;
  void *v4;
  uint64_t v5;
  NSString *logUUID;
  NSMutableDictionary *v7;
  NSMutableDictionary *userInfo;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AMSURLRequestProperties;
  v2 = -[AMSURLRequestProperties init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_excludeIdentifierHeadersForAccount = 0;
    AMSSetLogKey(0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "copy");
    logUUID = v3->_logUUID;
    v3->_logUUID = (NSString *)v5;

    v3->_maxRetryCount = 3;
    *(_WORD *)&v3->_remoteSecuritySigningEnabled = 256;
    v3->_shouldSetStorefrontFromResponse = 1;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    userInfo = v3->_userInfo;
    v3->_userInfo = v7;

  }
  return v3;
}

- (void)setShouldSetStorefrontFromResponse:(BOOL)a3
{
  self->_shouldSetStorefrontFromResponse = a3;
}

- (void)setShouldSetCookiesFromResponse:(BOOL)a3
{
  self->_shouldSetCookiesFromResponse = a3;
}

- (void)setResponseDecoder:(id)a3
{
  objc_storeStrong((id *)&self->_responseDecoder, a3);
}

- (void)setRemoteSecuritySigningEnabled:(BOOL)a3
{
  self->_remoteSecuritySigningEnabled = a3;
}

- (void)setMescalType:(int64_t)a3
{
  self->_mescalType = a3;
}

- (void)setKnownToBeTrusted:(BOOL)a3
{
  self->_knownToBeTrusted = a3;
}

- (void)setKeychainOptions:(id)a3
{
  objc_storeStrong((id *)&self->_keychainOptions, a3);
}

- (void)setGsTokenIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_gsTokenIdentifier, a3);
}

- (void)setDisableResponseDecoding:(BOOL)a3
{
  self->_disableResponseDecoding = a3;
}

- (void)setDialogOptions:(int64_t)a3
{
  self->_dialogOptions = a3;
}

- (void)setClientInfo:(id)a3
{
  objc_storeStrong((id *)&self->_clientInfo, a3);
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void)setAnisetteType:(int64_t)a3
{
  self->_anisetteType = a3;
}

- (void)setAdditionalMetrics:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_responseDecoder, 0);
  objc_storeStrong((id *)&self->_purchaseInfo, 0);
  objc_storeStrong((id *)&self->_logUUID, 0);
  objc_storeStrong((id *)&self->_keychainOptions, 0);
  objc_storeStrong((id *)&self->_gsTokenIdentifier, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_additionalMetrics, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

- (AMSResponseDecoding)responseDecoder
{
  return self->_responseDecoder;
}

- (BOOL)disableLoadURLMetrics
{
  return self->_disableLoadURLMetrics;
}

- (NSDictionary)additionalMetrics
{
  return self->_additionalMetrics;
}

- (BOOL)remoteSecuritySigningEnabled
{
  return self->_remoteSecuritySigningEnabled;
}

- (AMSProcessInfo)clientInfo
{
  return self->_clientInfo;
}

- (void)setLogUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)shouldSetCookiesFromResponse
{
  return self->_shouldSetCookiesFromResponse;
}

- (NSString)logUUID
{
  return self->_logUUID;
}

- (int64_t)mescalType
{
  return self->_mescalType;
}

- (BOOL)disableResponseDecoding
{
  return self->_disableResponseDecoding;
}

- (BOOL)knownToBeTrusted
{
  return self->_knownToBeTrusted;
}

- (int64_t)reversePushType
{
  return self->_reversePushType;
}

- (AMSBagProtocol)bag
{
  return self->_bag;
}

- (ACAccount)account
{
  return self->_account;
}

- (int64_t)anisetteType
{
  return self->_anisetteType;
}

- (void)setDisableLoadURLMetrics:(BOOL)a3
{
  self->_disableLoadURLMetrics = a3;
}

- (BOOL)disableBiometricsResponseHandling
{
  return self->_disableBiometricsResponseHandling;
}

- (NSMutableDictionary)userInfo
{
  return self->_userInfo;
}

- (void)setMaxRetryCount:(int64_t)a3
{
  self->_maxRetryCount = a3;
}

- (int64_t)dialogOptions
{
  return self->_dialogOptions;
}

- (void)setDisableBiometricsResponseHandling:(BOOL)a3
{
  self->_disableBiometricsResponseHandling = a3;
}

- (NSString)gsTokenIdentifier
{
  return self->_gsTokenIdentifier;
}

- (BOOL)excludeIdentifierHeadersForAccount
{
  return self->_excludeIdentifierHeadersForAccount;
}

- (void)setExcludeIdentifierHeadersForAccount:(BOOL)a3
{
  self->_excludeIdentifierHeadersForAccount = a3;
}

- (AMSKeychainOptions)keychainOptions
{
  return self->_keychainOptions;
}

- (int64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setPurchaseInfo:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseInfo, a3);
}

- (void)setReversePushType:(int64_t)a3
{
  self->_reversePushType = a3;
}

- (BOOL)shouldSetStorefrontFromResponse
{
  return self->_shouldSetStorefrontFromResponse;
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

@end
