@implementation GKLocalPlayerInternal

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)secureCodedPropertyKeys
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __48__GKLocalPlayerInternal_secureCodedPropertyKeys__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (secureCodedPropertyKeys_onceToken_466 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_466, block);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_465;
}

void __48__GKLocalPlayerInternal_secureCodedPropertyKeys__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  objc_super v5;
  _QWORD v6[7];
  _QWORD v7[8];

  v7[7] = *MEMORY[0x1E0C80C00];
  v5.receiver = *(id *)(a1 + 32);
  v5.super_class = (Class)&OBJC_METACLASS___GKLocalPlayerInternal;
  objc_msgSendSuper2(&v5, sel_secureCodedPropertyKeys);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v6[0] = CFSTR("accountName");
  v7[0] = objc_opt_class();
  v6[1] = CFSTR("numberOfRequests");
  v7[1] = objc_opt_class();
  v6[2] = CFSTR("numberOfTurns");
  v7[2] = objc_opt_class();
  v6[3] = CFSTR("numberOfChallenges");
  v7[3] = objc_opt_class();
  v6[4] = CFSTR("loginStatus");
  v7[4] = objc_opt_class();
  v6[5] = CFSTR("allowChallengeFriendInvites");
  v7[5] = objc_opt_class();
  v6[6] = CFSTR("allowMultiplayerFriendInvites");
  v7[6] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 7);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addEntriesFromDictionary:", v3);

  v4 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_465;
  secureCodedPropertyKeys_sSecureCodedKeys_465 = (uint64_t)v2;

}

- (id)minimalInternal
{
  return (id)objc_msgSend((id)objc_opt_class(), "minimalInternalFromSourcePlayer:", self);
}

+ (id)minimalInternalFromSourcePlayer:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "internalRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayerID:", v5);

  objc_msgSend(v3, "scopedIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setScopedIDs:", v6);

  objc_msgSend(v3, "alias");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAlias:", v7);

  objc_msgSend(v3, "firstName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFirstName:", v8);

  objc_msgSend(v3, "lastName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLastName:", v9);

  objc_msgSend(v3, "friendLevel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFriendLevel:", v10);

  objc_msgSend(v3, "friendBiDirectional");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFriendBiDirectional:", v11);

  objc_msgSend(v3, "friendPlayedWith");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFriendPlayedWith:", v12);

  objc_msgSend(v3, "friendPlayedNearby");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFriendPlayedNearby:", v13);

  objc_msgSend(v3, "compositeName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCompositeName:", v14);

  objc_msgSend(v3, "accountName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccountName:", v15);

  objc_msgSend(v3, "contactsAssociationID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContactsAssociationID:", v16);

  objc_msgSend(v4, "setContactsIntegrationConsent:", objc_msgSend(v3, "contactsIntegrationConsent"));
  objc_msgSend(v3, "serviceLastUpdatedTimestamp");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setServiceLastUpdatedTimestamp:", v17);
  return v4;
}

- (BOOL)isPurpleBuddyAccount
{
  return HIBYTE(LOWORD(self->super.super.super._flags._value)) & 1;
}

- (void)setPurpleBuddyAccount:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xFEFF | v3;
}

- (BOOL)isDefaultNickname
{
  return (LOWORD(self->super.super.super._flags._value) >> 12) & 1;
}

- (void)setDefaultNickname:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xEFFF | v3;
}

- (BOOL)isDefaultPrivacyVisibility
{
  return (LOWORD(self->super.super.super._flags._value) >> 13) & 1;
}

- (void)setDefaultPrivacyVisibility:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xDFFF | v3;
}

- (BOOL)isDefaultContactsIntegrationConsent
{
  return (LOWORD(self->super.super.super._flags._value) >> 14) & 1;
}

- (void)setDefaultContactsIntegrationConsent:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xBFFF | v3;
}

- (int)globalFriendListAccess
{
  return self->super.super.super._globalFriendListAccess;
}

- (void)setGlobalFriendListAccess:(int)a3
{
  self->super.super.super._globalFriendListAccess = a3;
}

- (BOOL)isUnderage
{
  void *v3;
  char v4;
  _BOOL4 v5;

  +[GKPreferences shared](GKPreferences, "shared");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "forceUnderage");

  if ((v4 & 1) != 0)
    LOBYTE(v5) = 1;
  else
    return (LOWORD(self->super.super.super._flags._value) >> 9) & 1;
  return v5;
}

- (void)setUnderage:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xFDFF | v3;
}

- (BOOL)isFindable
{
  return (LOWORD(self->super.super.super._flags._value) >> 11) & 1;
}

- (void)setFindable:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xF7FF | v3;
}

- (BOOL)isPhotoPending
{
  return (LOWORD(self->super.super.super._flags._value) >> 10) & 1;
}

- (void)setPhotoPending:(BOOL)a3
{
  __int16 v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  *(_WORD *)&self->super.super.super._flags.var0 = *(_WORD *)&self->super.super.super._flags.var0 & 0xFBFF | v3;
}

- (BOOL)isLocalPlayer
{
  return 1;
}

- (BOOL)isFriend
{
  return 0;
}

- (int)defaultFamiliarity
{
  return 1;
}

- (BOOL)hasAcknowledgedLatestGDPR
{
  void *v2;
  char v3;

  -[GKPlayerInternal onboarding](self, "onboarding");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasAcknowledgedLatestGDPR");

  return v3;
}

- (id)accountName
{
  return self->_accountName;
}

- (void)setAccountName:(id)a3
{
  objc_storeStrong((id *)&self->_accountName, a3);
}

- (unsigned)numberOfRequests
{
  return self->_numberOfRequests;
}

- (void)setNumberOfRequests:(unsigned __int16)a3
{
  self->_numberOfRequests = a3;
}

- (unsigned)numberOfTurns
{
  return self->_numberOfTurns;
}

- (void)setNumberOfTurns:(unsigned __int16)a3
{
  self->_numberOfTurns = a3;
}

- (unsigned)numberOfChallenges
{
  return self->_numberOfChallenges;
}

- (void)setNumberOfChallenges:(unsigned __int16)a3
{
  self->_numberOfChallenges = a3;
}

- (unint64_t)loginStatus
{
  return self->_loginStatus;
}

- (void)setLoginStatus:(unint64_t)a3
{
  self->_loginStatus = a3;
}

- (BOOL)allowChallengeFriendInvites
{
  return self->_allowChallengeFriendInvites;
}

- (void)setAllowChallengeFriendInvites:(BOOL)a3
{
  self->_allowChallengeFriendInvites = a3;
}

- (BOOL)allowMultiplayerFriendInvites
{
  return self->_allowMultiplayerFriendInvites;
}

- (void)setAllowMultiplayerFriendInvites:(BOOL)a3
{
  self->_allowMultiplayerFriendInvites = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountName, 0);
}

@end
