@implementation MPStoreItemMetadataRequest

- (BOOL)isPersonalized
{
  return self->_personalizationStyle != 0;
}

- (void)setPersonalizationStyle:(int64_t)a3
{
  self->_personalizationStyle = a3;
}

- (void)setItemIdentifiers:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (MPStoreItemMetadataRequest)init
{
  MPStoreItemMetadataRequest *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MPStoreItemMetadataRequest;
  result = -[MPStoreItemMetadataRequest init](&v3, sel_init);
  if (result)
    result->_retryDelay = 5.0;
  return result;
}

- (ICUserIdentity)userIdentity
{
  ICUserIdentity *userIdentity;
  ICUserIdentity *v4;
  ICUserIdentity *v5;

  userIdentity = self->_userIdentity;
  if (!userIdentity)
  {
    objc_msgSend(MEMORY[0x1E0DDC100], "activeAccount");
    v4 = (ICUserIdentity *)objc_claimAutoreleasedReturnValue();
    v5 = self->_userIdentity;
    self->_userIdentity = v4;

    userIdentity = self->_userIdentity;
  }
  return userIdentity;
}

- (ICUserIdentityStore)userIdentityStore
{
  ICUserIdentityStore *userIdentityStore;

  userIdentityStore = self->_userIdentityStore;
  if (userIdentityStore)
    return userIdentityStore;
  objc_msgSend(MEMORY[0x1E0DDC108], "defaultIdentityStore");
  return (ICUserIdentityStore *)(id)objc_claimAutoreleasedReturnValue();
}

- (ICUserIdentity)delegatedUserIdentity
{
  return self->_delegatedUserIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentityStore, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_delegatedUserIdentity, 0);
  objc_storeStrong((id *)&self->_clientInfo, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_timeoutInterval, 0);
  objc_storeStrong((id *)&self->_itemIdentifiers, 0);
}

- (NSString)clientIdentifier
{
  if (self->_clientIdentifier)
    return self->_clientIdentifier;
  else
    return (NSString *)&stru_1E3163D10;
}

- (ICClientInfo)clientInfo
{
  ICClientInfo *clientInfo;

  clientInfo = self->_clientInfo;
  if (clientInfo)
    return clientInfo;
  objc_msgSend(MEMORY[0x1E0DDBEF8], "defaultInfo");
  return (ICClientInfo *)(id)objc_claimAutoreleasedReturnValue();
}

- (NSArray)itemIdentifiers
{
  if (self->_itemIdentifiers)
    return self->_itemIdentifiers;
  else
    return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (NSString)requestingBundleIdentifier
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[ICClientInfo requestingBundleIdentifier](self->_clientInfo, "requestingBundleIdentifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E3163D10;
  v4 = v2;

  return v4;
}

- (NSString)requestingBundleVersion
{
  __CFString *v2;
  __CFString *v3;
  NSString *v4;

  -[ICClientInfo requestingBundleVersion](self->_clientInfo, "requestingBundleVersion");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = &stru_1E3163D10;
  v4 = v2;

  return v4;
}

- (void)setRequestingBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  ICClientInfo *v6;
  ICClientInfo *clientInfo;
  id v8;

  v4 = a3;
  -[MPStoreItemMetadataRequest clientInfo](self, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v8, "setRequestingBundleIdentifier:", v4);
  v6 = (ICClientInfo *)objc_msgSend(v8, "copy");
  clientInfo = self->_clientInfo;
  self->_clientInfo = v6;

}

- (void)setRequestingBundleVersion:(id)a3
{
  id v4;
  void *v5;
  ICClientInfo *v6;
  ICClientInfo *clientInfo;
  id v8;

  v4 = a3;
  -[MPStoreItemMetadataRequest clientInfo](self, "clientInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v8, "setRequestingBundleVersion:", v4);
  v6 = (ICClientInfo *)objc_msgSend(v8, "copy");
  clientInfo = self->_clientInfo;
  self->_clientInfo = v6;

}

- (ICStorePlatformRequest)storePlatformRequest
{
  id v3;
  void *v4;
  unint64_t v5;
  _QWORD *v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  NSNumber *timeoutInterval;
  _QWORD v13[5];

  v3 = objc_alloc_init(MEMORY[0x1E0DDC098]);
  -[MPStoreItemMetadataRequest itemIdentifiers](self, "itemIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setItemIdentifiers:", v4);

  v5 = -[MPStoreItemMetadataRequest reason](self, "reason");
  if (v5 - 1 > 2)
    v6 = (_QWORD *)MEMORY[0x1E0DDBE28];
  else
    v6 = (_QWORD *)qword_1E31535B8[v5 - 1];
  objc_msgSend(v3, "setKeyProfile:", *v6);
  v7 = -[MPStoreItemMetadataRequest personalizationStyle](self, "personalizationStyle");
  if (v7 >= 3)
    v8 = 0;
  else
    v8 = v7;
  objc_msgSend(v3, "setPersonalizationStyle:", v8);
  objc_msgSend(v3, "setReturnsLocalEquivalencies:", -[MPStoreItemMetadataRequest allowLocalEquivalencies](self, "allowLocalEquivalencies"));
  -[MPStoreItemMetadataRequest retryDelay](self, "retryDelay");
  objc_msgSend(v3, "setRetryDelay:");
  v9 = objc_alloc(MEMORY[0x1E0DDC0A0]);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __50__MPStoreItemMetadataRequest_storePlatformRequest__block_invoke;
  v13[3] = &unk_1E315F468;
  v13[4] = self;
  v10 = (void *)objc_msgSend(v9, "initWithBlock:", v13);
  objc_msgSend(v3, "setRequestContext:", v10);
  if (-[NSString length](self->_clientIdentifier, "length"))
    objc_msgSend(v3, "setClientIdentifier:", self->_clientIdentifier);
  if (-[NSString length](self->_platform, "length"))
    objc_msgSend(v3, "setPlatformIdentifier:", self->_platform);
  timeoutInterval = self->_timeoutInterval;
  if (timeoutInterval)
  {
    -[NSNumber doubleValue](timeoutInterval, "doubleValue");
    objc_msgSend(v3, "setTimeoutInterval:");
  }
  if (self->_shouldIgnoreCache)
    objc_msgSend(v3, "setShouldIgnoreCache:", 1);

  return (ICStorePlatformRequest *)v3;
}

- (BOOL)allowLocalEquivalencies
{
  return self->_allowLocalEquivalencies;
}

- (void)setAllowLocalEquivalencies:(BOOL)a3
{
  self->_allowLocalEquivalencies = a3;
}

- (unint64_t)reason
{
  return self->_reason;
}

- (void)setReason:(unint64_t)a3
{
  self->_reason = a3;
}

- (NSNumber)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (double)retryDelay
{
  return self->_retryDelay;
}

- (void)setRetryDelay:(double)a3
{
  self->_retryDelay = a3;
}

- (BOOL)shouldIgnoreCache
{
  return self->_shouldIgnoreCache;
}

- (void)setShouldIgnoreCache:(BOOL)a3
{
  self->_shouldIgnoreCache = a3;
}

- (BOOL)shouldIgnoreExpiration
{
  return self->_shouldIgnoreExpiration;
}

- (void)setShouldIgnoreExpiration:(BOOL)a3
{
  self->_shouldIgnoreExpiration = a3;
}

- (BOOL)shouldRequireCachedResults
{
  return self->_shouldRequireCachedResults;
}

- (void)setShouldRequireCachedResults:(BOOL)a3
{
  self->_shouldRequireCachedResults = a3;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (int64_t)personalizationStyle
{
  return self->_personalizationStyle;
}

- (void)setClientInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void)setDelegatedUserIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (void)setUserIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void)setUserIdentityStore:(id)a3
{
  objc_storeStrong((id *)&self->_userIdentityStore, a3);
}

void __50__MPStoreItemMetadataRequest_storePlatformRequest__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "delegatedUserIdentity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegatedIdentity:", v5);

  objc_msgSend(*(id *)(a1 + 32), "userIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentity:", v6);

  objc_msgSend(*(id *)(a1 + 32), "userIdentityStore");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIdentityStore:", v7);

  objc_msgSend(*(id *)(a1 + 32), "clientInfo");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClientInfo:", v8);

}

@end
