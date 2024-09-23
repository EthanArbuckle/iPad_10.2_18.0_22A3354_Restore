@implementation MPCPlaybackAccount

- (BOOL)hasCatalogPlaybackCapability
{
  if (self->_delegated)
    return 1;
  else
    return -[ICMusicSubscriptionStatus hasCapability:](self->_subscriptionStatus, "hasCapability:", 128);
}

- (NSString)shortHashedDSID
{
  NSUInteger v3;
  NSString *hashedDSID;
  NSString *v5;

  v3 = -[NSString length](self->_hashedDSID, "length");
  hashedDSID = self->_hashedDSID;
  if (v3 < 8)
  {
    v5 = hashedDSID;
  }
  else
  {
    -[NSString substringToIndex:](hashedDSID, "substringToIndex:", 7);
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (NSString)storeFrontIdentifier
{
  return self->_storeFrontIdentifier;
}

- (BOOL)isDelegated
{
  return self->_delegated;
}

- (BOOL)isActiveAccount
{
  return self->_activeAccount;
}

- (ICMusicSubscriptionStatus)subscriptionStatus
{
  return self->_subscriptionStatus;
}

- (BOOL)isPrivateListeningEnabled
{
  return self->_privateListeningEnabled;
}

- (id)copyWithZone:(_NSZone *)a3
{
  _BOOL4 delegated;
  MPCPlaybackAccount *v5;
  ICUserIdentity *userIdentity;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;

  delegated = self->_delegated;
  v5 = [MPCPlaybackAccount alloc];
  userIdentity = self->_userIdentity;
  if (delegated)
    v7 = -[MPCPlaybackAccount initWithDelegatedUserIdentity:](v5, "initWithDelegatedUserIdentity:", userIdentity);
  else
    v7 = -[MPCPlaybackAccount initWithUserIdentity:subscriptionStatus:](v5, "initWithUserIdentity:subscriptionStatus:", userIdentity, self->_subscriptionStatus);
  v8 = v7;
  v9 = -[NSString copy](self->_hashedDSID, "copy");
  v10 = *(void **)(v8 + 32);
  *(_QWORD *)(v8 + 32) = v9;

  *(_BYTE *)(v8 + 8) = self->_hasCloudLibraryEnabled;
  v11 = -[NSString copy](self->_storeFrontIdentifier, "copy");
  v12 = *(void **)(v8 + 40);
  *(_QWORD *)(v8 + 40) = v11;

  *(_BYTE *)(v8 + 9) = self->_activeAccount;
  *(_BYTE *)(v8 + 10) = self->_privateListeningEnabled;
  objc_storeStrong((id *)(v8 + 48), self->_bag);
  objc_storeStrong((id *)(v8 + 56), self->__whaStreamerStorage);
  return (id)v8;
}

- (MPCPlaybackAccount)initWithUserIdentity:(id)a3 subscriptionStatus:(id)a4
{
  id v7;
  id v8;
  MPCPlaybackAccount *v9;
  MPCPlaybackAccount *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPCPlaybackAccount;
  v9 = -[MPCPlaybackAccount init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userIdentity, a3);
    objc_storeStrong((id *)&v10->_subscriptionStatus, a4);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__whaStreamerStorage, 0);
  objc_storeStrong((id *)&self->_bag, 0);
  objc_storeStrong((id *)&self->_storeFrontIdentifier, 0);
  objc_storeStrong((id *)&self->_hashedDSID, 0);
  objc_storeStrong((id *)&self->_subscriptionStatus, 0);
  objc_storeStrong((id *)&self->_userIdentity, 0);
}

- (ICURLBag)bag
{
  return self->_bag;
}

- (void)setStoreFrontIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void)setPrivateListeningEnabled:(BOOL)a3
{
  self->_privateListeningEnabled = a3;
}

- (void)setHashedDSID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (void)setHasCloudLibraryEnabled:(BOOL)a3
{
  self->_hasCloudLibraryEnabled = a3;
}

- (void)setBag:(id)a3
{
  objc_storeStrong((id *)&self->_bag, a3);
}

- (void)setActiveAccount:(BOOL)a3
{
  self->_activeAccount = a3;
}

- (NSString)hashedDSID
{
  return self->_hashedDSID;
}

- (BOOL)usesLease
{
  void *v3;
  char v4;

  if (self->_delegated)
    return 1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDDCCB0]), "initWithICSubscriptionStatus:", self->_subscriptionStatus);
  v4 = objc_msgSend(v3, "shouldUseLease");

  return v4;
}

- (id)description
{
  void *v3;
  NSString *hashedDSID;
  ICUserIdentity *userIdentity;
  const __CFString *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  hashedDSID = self->_hashedDSID;
  userIdentity = self->_userIdentity;
  if (self->_activeAccount)
    v6 = CFSTR("YES");
  else
    v6 = CFSTR("NO");
  if (self->_delegated)
    v7 = CFSTR("YES");
  else
    v7 = CFSTR("NO");
  if (self->_hasCloudLibraryEnabled)
    v8 = CFSTR("YES");
  else
    v8 = CFSTR("NO");
  if (self->_privateListeningEnabled)
    v9 = CFSTR("YES");
  else
    v9 = CFSTR("NO");
  if (-[MPCPlaybackAccount canAutoPlay](self, "canAutoPlay"))
    v10 = CFSTR("YES");
  else
    v10 = CFSTR("NO");
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<MPCPlaybackAccount:%p hashedDSID=%@ identity=%@ isActiveAccount=%@ isDelegated=%@ cloudLibraryEnabled=%@ privateListeningEnabled=%@ canAutoPlay=%@ storeFront=%@ subscriptionStatus=%@ bag=%@>"), self, hashedDSID, userIdentity, v6, v7, v8, v9, v10, self->_storeFrontIdentifier, self->_subscriptionStatus, self->_bag);
}

- (BOOL)canAutoPlay
{
  char v4;
  void *v5;
  char v6;

  if (self->_delegated)
    return 1;
  v4 = -[ICMusicSubscriptionStatus hasCapability:](self->_subscriptionStatus, "hasCapability:", 256);
  -[ICURLBag radioConfiguration](self->_bag, "radioConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isContinueListeningAvailable");

  return v4 & -[MPCPlaybackAccount hasCatalogPlaybackCapability](self, "hasCatalogPlaybackCapability") & v6;
}

- (id)_copyStreamerStorage:(id)a3
{
  id v5;
  MPCPlaybackAccount *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  void *v13;
  _QWORD v15[3];
  uint64_t v16;

  v5 = a3;
  v6 = self;
  sub_210C92FC8(a3, (uint64_t)v15);

  v7 = v16;
  if (!v16)
    return 0;
  v8 = __swift_project_boxed_opaque_existential_0Tm(v15, v16);
  v9 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v8, v8, v10);
  v12 = (char *)v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v9 + 16))(v12);
  v13 = (void *)sub_210E9352C();
  (*(void (**)(char *, uint64_t))(v9 + 8))(v12, v7);
  __swift_destroy_boxed_opaque_existential_0Tm((uint64_t)v15);
  return v13;
}

- (id)delegateTokenAWithError:(id *)a3
{
  MPCPlaybackAccount *v3;
  id v4;

  v3 = self;
  v4 = sub_210C9332C();

  return v4;
}

- (void)getDelegateTokenEWithTokenB:(_MPCProtoDelegateInfoTokenB *)a3 completion:(id)a4
{
  void *v6;
  _QWORD *v7;
  _MPCProtoDelegateInfoTokenB *v8;
  MPCPlaybackAccount *v9;

  v6 = _Block_copy(a4);
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = a3;
  v7[3] = v6;
  v7[4] = self;
  v8 = a3;
  v9 = self;
  sub_210C336D8((uint64_t)&unk_254A7E550, (uint64_t)v7);
}

- (MPCPlaybackAccount)initWithDelegatedUserIdentity:(id)a3
{
  id v5;
  MPCPlaybackAccount *v6;
  MPCPlaybackAccount *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPCPlaybackAccount;
  v6 = -[MPCPlaybackAccount init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_userIdentity, a3);
    *(_WORD *)&v7->_privateListeningEnabled = 257;
  }

  return v7;
}

- (unint64_t)hash
{
  ICUserIdentity *userIdentity;
  void *v3;
  unint64_t v4;

  userIdentity = self->_userIdentity;
  objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[ICUserIdentity hashInStore:](userIdentity, "hashInStore:", v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id *v5;
  id *v6;
  ICMusicSubscriptionStatus *subscriptionStatus;
  ICMusicSubscriptionStatus *v8;
  ICMusicSubscriptionStatus *v9;
  ICMusicSubscriptionStatus *v10;
  int v11;
  char v12;
  ICUserIdentity *userIdentity;
  id v15;
  void *v16;
  ICUserIdentity *v17;
  ICUserIdentity *v18;
  id v19;
  void *v20;
  int v21;
  NSString *hashedDSID;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  int v26;
  NSString *storeFrontIdentifier;
  NSString *v28;
  NSString *v29;
  NSString *v30;
  int v31;
  ICURLBag *bag;
  ICURLBag *v33;
  ICURLBag *v34;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v12 = 0;
    goto LABEL_11;
  }
  v5 = (id *)v4;
  v6 = v5;
  if (!self->_delegated == (*((_BYTE *)v5 + 11) != 0)
    || !self->_activeAccount == (*((_BYTE *)v5 + 9) != 0)
    || !self->_hasCloudLibraryEnabled == (*((_BYTE *)v5 + 8) != 0)
    || !self->_privateListeningEnabled == (*((_BYTE *)v5 + 10) != 0))
  {
    goto LABEL_8;
  }
  subscriptionStatus = self->_subscriptionStatus;
  v8 = (ICMusicSubscriptionStatus *)v5[3];
  if (subscriptionStatus == v8)
  {

LABEL_13:
    userIdentity = self->_userIdentity;
    v15 = v6[2];
    objc_msgSend(MEMORY[0x24BEC8A60], "defaultIdentityStore");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = userIdentity;
    v18 = (ICUserIdentity *)v15;
    v19 = v16;
    v20 = v19;
    if (v17 == v18)
    {

    }
    else
    {
      if (!v17 || !v18)
      {

        v12 = 0;
        goto LABEL_31;
      }
      v21 = -[ICUserIdentity isEqualToIdentity:inStore:](v17, "isEqualToIdentity:inStore:", v18, v19);

      if (!v21)
        goto LABEL_26;
    }
    hashedDSID = self->_hashedDSID;
    v23 = (NSString *)v6[4];
    if (hashedDSID == v23)
    {

    }
    else
    {
      v24 = v23;
      v25 = hashedDSID;
      v26 = -[NSString isEqual:](v25, "isEqual:", v24);

      if (!v26)
        goto LABEL_26;
    }
    storeFrontIdentifier = self->_storeFrontIdentifier;
    v28 = (NSString *)v6[5];
    if (storeFrontIdentifier == v28)
    {

    }
    else
    {
      v29 = v28;
      v30 = storeFrontIdentifier;
      v31 = -[NSString isEqual:](v30, "isEqual:", v29);

      if (!v31)
      {
LABEL_26:
        v12 = 0;
LABEL_32:

        goto LABEL_9;
      }
    }
    bag = self->_bag;
    v33 = (ICURLBag *)v6[6];
    v34 = bag;
    v17 = v34;
    if (v34 == v33)
      v12 = 1;
    else
      v12 = -[ICURLBag isEqual:](v34, "isEqual:", v33);
LABEL_31:

    goto LABEL_32;
  }
  v9 = v8;
  v10 = subscriptionStatus;
  v11 = -[ICMusicSubscriptionStatus isEqual:](v10, "isEqual:", v9);

  if (v11)
    goto LABEL_13;
LABEL_8:
  v12 = 0;
LABEL_9:

LABEL_11:
  return v12;
}

- (BOOL)hasDelegationCapability
{
  char v4;

  if (self->_delegated)
    return 0;
  v4 = -[ICMusicSubscriptionStatus hasCapability:](self->_subscriptionStatus, "hasCapability:", 256);
  return -[MPCPlaybackAccount hasCatalogPlaybackCapability](self, "hasCatalogPlaybackCapability") & v4;
}

- (BOOL)hasCloudLibraryEnabled
{
  return self->_hasCloudLibraryEnabled;
}

- (id)_whaStreamerStorage
{
  return self->__whaStreamerStorage;
}

- (void)set_whaStreamerStorage:(id)a3
{
  objc_storeStrong(&self->__whaStreamerStorage, a3);
}

@end
