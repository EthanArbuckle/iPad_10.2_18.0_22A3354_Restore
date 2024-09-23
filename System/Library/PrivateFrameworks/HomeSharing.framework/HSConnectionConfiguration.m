@implementation HSConnectionConfiguration

- (HSConnectionConfiguration)init
{
  HSConnectionConfiguration *v2;
  uint64_t v3;
  ICUserIdentity *userIdentity;
  uint64_t v5;
  ICUserIdentityStore *userIdentityStore;
  __CFString *v7;
  uint64_t v8;
  NSString *buildIdentifier;
  void *v10;
  void *v11;
  uint64_t v12;
  NSString *purchaseClientIdentifier;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)HSConnectionConfiguration;
  v2 = -[HSConnectionConfiguration init](&v15, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BEC8A58], "activeLockerAccount");
    v3 = objc_claimAutoreleasedReturnValue();
    userIdentity = v2->_userIdentity;
    v2->_userIdentity = (ICUserIdentity *)v3;

    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v5 = objc_claimAutoreleasedReturnValue();
    userIdentityStore = v2->_userIdentityStore;
    v2->_userIdentityStore = (ICUserIdentityStore *)v5;

    v7 = (__CFString *)MGCopyAnswer();
    if (!-[__CFString length](v7, "length"))
    {

      v7 = CFSTR("UNKNOWN");
    }
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@/%@"), CFSTR("1.3"), v7);
    v8 = objc_claimAutoreleasedReturnValue();
    buildIdentifier = v2->_buildIdentifier;
    v2->_buildIdentifier = (NSString *)v8;

    v10 = (void *)MEMORY[0x24BDD17C8];
    HSGetCloudDAAPClientPrefix();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("%@/%@%@"), CFSTR("1.1"), v11, v7);
    v12 = objc_claimAutoreleasedReturnValue();
    purchaseClientIdentifier = v2->_purchaseClientIdentifier;
    v2->_purchaseClientIdentifier = (NSString *)v12;

    v2->_requestReason = 0;
  }
  return v2;
}

- (HSConnectionConfiguration)initWithCoder:(id)a3
{
  id v4;
  HSConnectionConfiguration *v5;
  uint64_t v6;
  ICUserIdentity *userIdentity;
  uint64_t v8;
  ICUserIdentityStore *userIdentityStore;
  uint64_t v10;
  NSURL *baseURL;
  uint64_t v12;
  NSString *libraryBagKey;
  uint64_t v14;
  NSString *buildIdentifier;
  uint64_t v16;
  NSString *purchaseClientIdentifier;
  uint64_t v18;
  NSNumber *familyMemberStoreID;
  objc_super v21;

  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)HSConnectionConfiguration;
  v5 = -[HSConnectionConfiguration init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userIdentity"));
    v6 = objc_claimAutoreleasedReturnValue();
    userIdentity = v5->_userIdentity;
    v5->_userIdentity = (ICUserIdentity *)v6;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("userIdentityStore"));
    v8 = objc_claimAutoreleasedReturnValue();
    userIdentityStore = v5->_userIdentityStore;
    v5->_userIdentityStore = (ICUserIdentityStore *)v8;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("baseURL"));
    v10 = objc_claimAutoreleasedReturnValue();
    baseURL = v5->_baseURL;
    v5->_baseURL = (NSURL *)v10;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("libraryBagKey"));
    v12 = objc_claimAutoreleasedReturnValue();
    libraryBagKey = v5->_libraryBagKey;
    v5->_libraryBagKey = (NSString *)v12;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("buildIdentifier"));
    v14 = objc_claimAutoreleasedReturnValue();
    buildIdentifier = v5->_buildIdentifier;
    v5->_buildIdentifier = (NSString *)v14;

    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("purchaseClientIdentifier"));
    v16 = objc_claimAutoreleasedReturnValue();
    purchaseClientIdentifier = v5->_purchaseClientIdentifier;
    v5->_purchaseClientIdentifier = (NSString *)v16;

    v5->_requestReason = objc_msgSend(v4, "decodeInt64ForKey:", CFSTR("requestReason"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("familyMemberStoreID"));
    v18 = objc_claimAutoreleasedReturnValue();
    familyMemberStoreID = v5->_familyMemberStoreID;
    v5->_familyMemberStoreID = (NSNumber *)v18;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  ICUserIdentity *userIdentity;
  ICUserIdentityStore *userIdentityStore;
  id v6;

  userIdentity = self->_userIdentity;
  userIdentityStore = self->_userIdentityStore;
  v6 = a3;
  objc_msgSend(v6, "ic_encodeUserIdentity:withStore:forKey:", userIdentity, userIdentityStore, CFSTR("userIdentity"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_userIdentityStore, CFSTR("userIdentityStore"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_baseURL, CFSTR("baseURL"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_libraryBagKey, CFSTR("libraryBagKey"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_buildIdentifier, CFSTR("buildIdentifier"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_purchaseClientIdentifier, CFSTR("purchaseClientIdentifier"));
  objc_msgSend(v6, "encodeInt64:forKey:", self->_requestReason, CFSTR("requestReason"));
  objc_msgSend(v6, "encodeObject:forKey:", self->_familyMemberStoreID, CFSTR("familyMemberStoreID"));

}

- (id)copyWithZone:(_NSZone *)a3
{
  HSConnectionConfiguration *v4;
  uint64_t v5;
  NSURL *baseURL;
  uint64_t v7;
  NSString *libraryBagKey;
  uint64_t v9;
  NSString *buildIdentifier;
  uint64_t v11;
  NSString *purchaseClientIdentifier;

  v4 = objc_alloc_init(HSConnectionConfiguration);
  objc_storeStrong((id *)&v4->_userIdentity, self->_userIdentity);
  objc_storeStrong((id *)&v4->_userIdentityStore, self->_userIdentityStore);
  v5 = -[NSURL copy](self->_baseURL, "copy");
  baseURL = v4->_baseURL;
  v4->_baseURL = (NSURL *)v5;

  v7 = -[NSString copy](self->_libraryBagKey, "copy");
  libraryBagKey = v4->_libraryBagKey;
  v4->_libraryBagKey = (NSString *)v7;

  v9 = -[NSString copy](self->_buildIdentifier, "copy");
  buildIdentifier = v4->_buildIdentifier;
  v4->_buildIdentifier = (NSString *)v9;

  v11 = -[NSString copy](self->_purchaseClientIdentifier, "copy");
  purchaseClientIdentifier = v4->_purchaseClientIdentifier;
  v4->_purchaseClientIdentifier = (NSString *)v11;

  v4->_requestReason = self->_requestReason;
  objc_storeStrong((id *)&v4->_familyMemberStoreID, self->_familyMemberStoreID);
  return v4;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void)setUserIdentity:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (ICUserIdentityStore)userIdentityStore
{
  return self->_userIdentityStore;
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)libraryBagKey
{
  return self->_libraryBagKey;
}

- (void)setLibraryBagKey:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)buildIdentifier
{
  return self->_buildIdentifier;
}

- (void)setBuildIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSString)purchaseClientIdentifier
{
  return self->_purchaseClientIdentifier;
}

- (void)setPurchaseClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (int64_t)requestReason
{
  return self->_requestReason;
}

- (void)setRequestReason:(int64_t)a3
{
  self->_requestReason = a3;
}

- (NSNumber)familyMemberStoreID
{
  return self->_familyMemberStoreID;
}

- (void)setFamilyMemberStoreID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_familyMemberStoreID, 0);
  objc_storeStrong((id *)&self->_purchaseClientIdentifier, 0);
  objc_storeStrong((id *)&self->_buildIdentifier, 0);
  objc_storeStrong((id *)&self->_libraryBagKey, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_userIdentityStore, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
