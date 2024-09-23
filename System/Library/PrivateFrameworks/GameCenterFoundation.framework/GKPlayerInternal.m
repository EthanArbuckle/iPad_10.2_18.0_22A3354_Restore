@implementation GKPlayerInternal

- (GKPlayerInternalOnboarding)onboarding
{
  return (GKPlayerInternalOnboarding *)objc_getProperty(self, a2, 240, 1);
}

- (BOOL)isLocalPlayer
{
  return 0;
}

- (BOOL)isUnderage
{
  return 0;
}

- (NSString)playerID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKPlayerInternal)initWithSanitizeBeforeEncodingBlock:(id)a3
{
  id v4;
  GKPlayerInternal *v5;
  void *v6;
  id sanitizeBeforeEncoding;

  v4 = a3;
  v5 = -[GKPlayerInternal init](self, "init");
  if (v5)
  {
    v6 = _Block_copy(v4);
    sanitizeBeforeEncoding = v5->_sanitizeBeforeEncoding;
    v5->_sanitizeBeforeEncoding = v6;

  }
  return v5;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_17 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_17, &__block_literal_global_58);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_17;
}

void __43__GKPlayerInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  _QWORD v6[32];
  _QWORD v7[33];

  v7[32] = *MEMORY[0x1E0C80C00];
  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  v7[3] = objc_opt_class();
  v7[4] = objc_opt_class();
  v7[5] = objc_opt_class();
  v7[6] = objc_opt_class();
  v7[7] = objc_opt_class();
  v7[8] = objc_opt_class();
  v7[9] = objc_opt_class();
  v7[10] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, CFSTR("playerID"), CFSTR("scopedIDs"), CFSTR("alias"), CFSTR("avatarType"), CFSTR("friendLevel"), CFSTR("friendBiDirectional"), CFSTR("friendPlayedWith"), CFSTR("friendPlayedNearby"), CFSTR("acceptedGameInviteFromThisFriend"), CFSTR("initiatedGameInviteToThisFriend"), CFSTR("automatchedTogether"), CFSTR("photos"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[11] = v3;
  v6[12] = CFSTR("flags");
  v7[12] = objc_opt_class();
  v6[13] = CFSTR("numberOfFriends");
  v7[13] = objc_opt_class();
  v6[14] = CFSTR("numberOfFriendsInCommon");
  v7[14] = objc_opt_class();
  v6[15] = CFSTR("numberOfGames");
  v7[15] = objc_opt_class();
  v6[16] = CFSTR("numberOfGamesInCommon");
  v7[16] = objc_opt_class();
  v6[17] = CFSTR("numberOfAchievements");
  v7[17] = objc_opt_class();
  v6[18] = CFSTR("numberOfAchievementPoints");
  v7[18] = objc_opt_class();
  v6[19] = CFSTR("messagesID");
  v7[19] = objc_opt_class();
  v6[20] = CFSTR("onboarding");
  v7[20] = objc_opt_class();
  v6[21] = CFSTR("achievementsVisibility");
  v7[21] = objc_opt_class();
  v6[22] = CFSTR("gamesPlayedVisibility");
  v7[22] = objc_opt_class();
  v6[23] = CFSTR("friendsVisibility");
  v7[23] = objc_opt_class();
  v6[24] = CFSTR("globalFriendListAccess");
  v7[24] = objc_opt_class();
  v6[25] = CFSTR("isArcadeSubscriber");
  v7[25] = objc_opt_class();
  v6[26] = CFSTR("contactsIntegrationConsent");
  v7[26] = objc_opt_class();
  v6[27] = CFSTR("contactsAssociationID");
  v7[27] = objc_opt_class();
  v6[28] = CFSTR("inboxEntry");
  v7[28] = objc_opt_class();
  v6[29] = CFSTR("isInContacts");
  v7[29] = objc_opt_class();
  v6[30] = CFSTR("contact");
  v7[30] = objc_opt_class();
  v6[31] = CFSTR("serviceLastUpdatedTimestamp");
  v7[31] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 32);
  v4 = objc_claimAutoreleasedReturnValue();

  v5 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_17;
  secureCodedPropertyKeys_sSecureCodedKeys_17 = v4;

}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t (**v7)(void);
  int v8;
  objc_super v9;

  v4 = a3;
  -[GKPlayerInternal sanitizeBeforeEncoding](self, "sanitizeBeforeEncoding");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    -[GKPlayerInternal sanitizeBeforeEncoding](self, "sanitizeBeforeEncoding");
    v7 = (uint64_t (**)(void))objc_claimAutoreleasedReturnValue();
    v8 = v7[2]();

    if (v8)
      -[GKPlayerInternal sanitize](self, "sanitize");
  }
  v9.receiver = self;
  v9.super_class = (Class)GKPlayerInternal;
  -[GKInternalRepresentation encodeWithCoder:](&v9, sel_encodeWithCoder_, v4);

}

- (id)conciseDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKPlayerInternal playerID](self, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal alias](self, "alias");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal friendLevel](self, "friendLevel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("playerID:%@ alias:%@ FL%@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)serverRepresentation
{
  NSObject *v2;
  id v3;

  v2 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v3 = GKOSLoggers();
    v2 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    -[GKPlayerInternal serverRepresentation].cold.1(v2);
  return (id)MEMORY[0x1E0C9AA70];
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  GKPlayerInternal *v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = (GKPlayerInternal *)v4;
    if (self == v5)
    {
      v8 = 1;
    }
    else
    {
      -[GKPlayerInternal playerID](self, "playerID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayerInternal playerID](v5, "playerID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKPlayerInternal playerID](self, "playerID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)minimalInternal
{
  void *v3;
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

  objc_msgSend((id)objc_opt_class(), "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal playerID](self, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPlayerID:", v4);

  -[GKPlayerInternal scopedIDs](self, "scopedIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setScopedIDs:", v5);

  -[GKPlayerInternal alias](self, "alias");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlias:", v6);

  -[GKPlayerInternal firstName](self, "firstName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFirstName:", v7);

  -[GKPlayerInternal lastName](self, "lastName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setLastName:", v8);

  -[GKPlayerInternal friendLevel](self, "friendLevel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFriendLevel:", v9);

  -[GKPlayerInternal friendBiDirectional](self, "friendBiDirectional");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFriendBiDirectional:", v10);

  -[GKPlayerInternal friendPlayedWith](self, "friendPlayedWith");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFriendPlayedWith:", v11);

  -[GKPlayerInternal friendPlayedNearby](self, "friendPlayedNearby");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setFriendPlayedNearby:", v12);

  -[GKPlayerInternal acceptedGameInviteFromThisFriend](self, "acceptedGameInviteFromThisFriend");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAcceptedGameInviteFromThisFriend:", v13);

  -[GKPlayerInternal initiatedGameInviteToThisFriend](self, "initiatedGameInviteToThisFriend");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInitiatedGameInviteToThisFriend:", v14);

  -[GKPlayerInternal automatchedTogether](self, "automatchedTogether");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAutomatchedTogether:", v15);

  -[GKPlayerInternal compositeName](self, "compositeName");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setCompositeName:", v16);

  objc_msgSend(v3, "setAchievementsVisibility:", -[GKPlayerInternal achievementsVisibility](self, "achievementsVisibility"));
  objc_msgSend(v3, "setFriendsVisibility:", -[GKPlayerInternal friendsVisibility](self, "friendsVisibility"));
  objc_msgSend(v3, "setGamesPlayedVisibility:", -[GKPlayerInternal gamesPlayedVisibility](self, "gamesPlayedVisibility"));
  objc_msgSend(v3, "setGlobalFriendListAccess:", -[GKPlayerInternal globalFriendListAccess](self, "globalFriendListAccess"));
  objc_msgSend(v3, "setIsArcadeSubscriber:", -[GKPlayerInternal isArcadeSubscriber](self, "isArcadeSubscriber"));
  return v3;
}

+ (id)compositeNameForFirstName:(id)a3 lastName:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  id v8;
  void *v9;

  if ((unint64_t)a3 | (unint64_t)a4)
  {
    v5 = (objc_class *)MEMORY[0x1E0C97360];
    v6 = a4;
    v7 = a3;
    v8 = objc_alloc_init(v5);
    objc_msgSend(v8, "setContactType:", 0);
    objc_msgSend(v8, "setGivenName:", v7);

    objc_msgSend(v8, "setFamilyName:", v6);
    objc_msgSend(MEMORY[0x1E0C97218], "stringFromContact:style:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)displayNameWithOptions:(unsigned __int8)a3
{
  uint64_t v3;
  char isKindOfClass;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;

  v3 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[GKPlayerInternal alias](self, "alias");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((isKindOfClass & 1) == 0)
  {
    v7 = (void *)objc_opt_class();
    -[GKPlayerInternal compositeName](self, "compositeName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayNameWithOptions:alias:composite:", v3, v6, v8);
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  return v6;
}

+ (id)displayNameWithOptions:(unsigned __int8)a3 alias:(id)a4 composite:(id)a5
{
  id v7;
  id v8;
  void *v9;
  BOOL v10;
  void *v12;
  id v13;

  v7 = a4;
  v8 = a5;
  v9 = v8;
  if (v7)
    v10 = 1;
  else
    v10 = v8 == 0;
  if (!v10 && (a3 & 1) == 0)
    v12 = v8;
  else
    v12 = v7;
  v13 = v12;

  return v13;
}

+ (Class)classForFamiliarity:(int)a3
{
  return (Class)(id)objc_opt_class();
}

- (int)defaultFamiliarity
{
  return 0;
}

- (BOOL)isLoaded
{
  NSUInteger v3;

  v3 = -[NSString length](self->_playerID, "length");
  if (v3)
    LOBYTE(v3) = -[NSString length](self->_alias, "length") != 0;
  return v3;
}

- (BOOL)isFriend
{
  return 0;
}

- (BOOL)isAutomatchPlayer
{
  return 0;
}

- (BOOL)isUnknownPlayer
{
  return 0;
}

- (BOOL)isAnonymousPlayer
{
  return 0;
}

- (BOOL)isGuestPlayer
{
  return 0;
}

- (unsigned)flags
{
  return self->_flags._value;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags._value = a3;
}

- (void)setMessagesID:(id)a3
{
  NSString *v4;
  NSString *messagesID;

  if (self->_messagesID != a3)
  {
    objc_msgSend(a3, "lowercaseString");
    v4 = (NSString *)objc_claimAutoreleasedReturnValue();
    messagesID = self->_messagesID;
    self->_messagesID = v4;

  }
}

- (NSString)firstName
{
  return 0;
}

- (void)setContact:(id)a3
{
  objc_storeStrong((id *)&self->_contact, a3);
}

- (NSString)lastName
{
  return 0;
}

- (NSString)compositeName
{
  return 0;
}

- (NSString)status
{
  return 0;
}

- (NSDate)lastPlayedDate
{
  return 0;
}

- (GKGameInternal)lastPlayedGame
{
  return 0;
}

- (BOOL)challengedTogether
{
  return 0;
}

- (NSDate)lastChallengedDate
{
  return 0;
}

- (GKGameInternal)lastChallengedGame
{
  return 0;
}

- (BOOL)allowReceivingFriendInvites
{
  return 0;
}

- (NSString)accountName
{
  return 0;
}

- (NSArray)friends
{
  return (NSArray *)MEMORY[0x1E0C9AA60];
}

- (BOOL)isPurpleBuddyAccount
{
  return 0;
}

- (BOOL)isDefaultNickname
{
  return 0;
}

- (BOOL)isDefaultPrivacyVisibility
{
  return 0;
}

- (BOOL)isDefaultContactsIntegrationConsent
{
  return 0;
}

- (int)globalFriendListSharingStatus
{
  return -1;
}

- (BOOL)isArcadeSubscriber
{
  return self->_isArcadeSubscriber;
}

- (void)setIsArcadeSubscriber:(BOOL)a3
{
  self->_isArcadeSubscriber = a3;
}

- (BOOL)isFindable
{
  return 0;
}

- (BOOL)isPhotoPending
{
  return 0;
}

- (BOOL)allowNearbyMultiplayer
{
  return 1;
}

- (unsigned)numberOfRequests
{
  return 0;
}

- (unsigned)numberOfTurns
{
  return 0;
}

- (unsigned)numberOfChallenges
{
  return 0;
}

- (BOOL)allowChallengeFriendInvites
{
  return 0;
}

- (BOOL)allowMultiplayerFriendInvites
{
  return 0;
}

- (NSString)guestIdentifier
{
  return 0;
}

- (id)debugDescription
{
  uint64_t v3;
  void *v4;
  __CFString *v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  uint64_t v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;

  -[GKPlayerInternal playerID](self, "playerID");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v3)
    v5 = (__CFString *)v3;
  else
    v5 = CFSTR("nil");
  v6 = v5;

  -[GKPlayerInternal alias](self, "alias");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (__CFString *)v7;
  else
    v9 = CFSTR("nil");
  v10 = v9;

  -[GKPlayerInternal accountName](self, "accountName");
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (v11)
    v13 = (__CFString *)v11;
  else
    v13 = CFSTR("nil");
  v14 = v13;

  v15 = (void *)MEMORY[0x1E0CB3940];
  v16 = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", self->_achievementsVisibility);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayerInternal scopedIDs](self, "scopedIDs");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("%@(%p)(playerID:%@, alias:%@, accountName: %@, _achievementsVisibility:%@, scopedIDs: %@)"), v16, self, v6, v10, v14, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (void)sanitize
{
  -[GKPlayerInternal setAccountName:](self, "setAccountName:", 0);
  -[GKPlayerInternal setFriends:](self, "setFriends:", MEMORY[0x1E0C9AA60]);
  -[GKPlayerInternal setFirstName:](self, "setFirstName:", 0);
  -[GKPlayerInternal setLastName:](self, "setLastName:", 0);
  -[GKPlayerInternal setCompositeName:](self, "setCompositeName:", 0);
  -[GKPlayerInternal setLastPlayedGame:](self, "setLastPlayedGame:", 0);
  -[GKPlayerInternal setStatus:](self, "setStatus:", 0);
  -[GKPlayerInternal setLastPlayedDate:](self, "setLastPlayedDate:", 0);
  -[GKPlayerInternal setContact:](self, "setContact:", 0);
  -[GKPlayerInternal setContactsAssociationID:](self, "setContactsAssociationID:", 0);
  -[GKPlayerInternal setContactsIntegrationConsent:](self, "setContactsIntegrationConsent:", 2);
  -[GKPlayerInternal setChallengedTogether:](self, "setChallengedTogether:", 0);
  -[GKPlayerInternal setLastChallengedDate:](self, "setLastChallengedDate:", 0);
  -[GKPlayerInternal setLastChallengedGame:](self, "setLastChallengedGame:", 0);
  -[GKPlayerInternal setAllowReceivingFriendInvites:](self, "setAllowReceivingFriendInvites:", 0);
  -[GKPlayerInternal setAllowChallengeFriendInvites:](self, "setAllowChallengeFriendInvites:", 0);
  -[GKPlayerInternal setAllowMultiplayerFriendInvites:](self, "setAllowMultiplayerFriendInvites:", 0);
}

- (void)setPlayerID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (GKScopedIDs)scopedIDs
{
  return (GKScopedIDs *)objc_getProperty(self, a2, 16, 1);
}

- (void)setScopedIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (NSString)alias
{
  return self->_alias;
}

- (void)setAlias:(id)a3
{
  objc_storeStrong((id *)&self->_alias, a3);
}

- (NSNumber)avatarType
{
  return self->_avatarType;
}

- (void)setAvatarType:(id)a3
{
  objc_storeStrong((id *)&self->_avatarType, a3);
}

- (NSDictionary)photos
{
  return self->_photos;
}

- (void)setPhotos:(id)a3
{
  objc_storeStrong((id *)&self->_photos, a3);
}

- (unsigned)numberOfFriends
{
  return self->_numberOfFriends;
}

- (void)setNumberOfFriends:(unsigned __int16)a3
{
  self->_numberOfFriends = a3;
}

- (unsigned)numberOfFriendsInCommon
{
  return self->_numberOfFriendsInCommon;
}

- (void)setNumberOfFriendsInCommon:(unsigned __int16)a3
{
  self->_numberOfFriendsInCommon = a3;
}

- (unsigned)numberOfGames
{
  return self->_numberOfGames;
}

- (void)setNumberOfGames:(unsigned __int16)a3
{
  self->_numberOfGames = a3;
}

- (unsigned)numberOfGamesInCommon
{
  return self->_numberOfGamesInCommon;
}

- (void)setNumberOfGamesInCommon:(unsigned __int16)a3
{
  self->_numberOfGamesInCommon = a3;
}

- (unsigned)numberOfAchievements
{
  return self->_numberOfAchievements;
}

- (void)setNumberOfAchievements:(unsigned int)a3
{
  self->_numberOfAchievements = a3;
}

- (unsigned)numberOfAchievementPoints
{
  return self->_numberOfAchievementPoints;
}

- (void)setNumberOfAchievementPoints:(unsigned int)a3
{
  self->_numberOfAchievementPoints = a3;
}

- (NSString)messagesID
{
  return self->_messagesID;
}

- (NSNumber)friendLevel
{
  return self->_friendLevel;
}

- (void)setFriendLevel:(id)a3
{
  objc_storeStrong((id *)&self->_friendLevel, a3);
}

- (NSNumber)friendBiDirectional
{
  return self->_friendBiDirectional;
}

- (void)setFriendBiDirectional:(id)a3
{
  objc_storeStrong((id *)&self->_friendBiDirectional, a3);
}

- (NSNumber)friendPlayedWith
{
  return self->_friendPlayedWith;
}

- (void)setFriendPlayedWith:(id)a3
{
  objc_storeStrong((id *)&self->_friendPlayedWith, a3);
}

- (NSNumber)friendPlayedNearby
{
  return self->_friendPlayedNearby;
}

- (void)setFriendPlayedNearby:(id)a3
{
  objc_storeStrong((id *)&self->_friendPlayedNearby, a3);
}

- (NSNumber)acceptedGameInviteFromThisFriend
{
  return self->_acceptedGameInviteFromThisFriend;
}

- (void)setAcceptedGameInviteFromThisFriend:(id)a3
{
  objc_storeStrong((id *)&self->_acceptedGameInviteFromThisFriend, a3);
}

- (NSNumber)initiatedGameInviteToThisFriend
{
  return self->_initiatedGameInviteToThisFriend;
}

- (void)setInitiatedGameInviteToThisFriend:(id)a3
{
  objc_storeStrong((id *)&self->_initiatedGameInviteToThisFriend, a3);
}

- (NSNumber)automatchedTogether
{
  return self->_automatchedTogether;
}

- (void)setAutomatchedTogether:(id)a3
{
  objc_storeStrong((id *)&self->_automatchedTogether, a3);
}

- (int)achievementsVisibility
{
  return self->_achievementsVisibility;
}

- (void)setAchievementsVisibility:(int)a3
{
  self->_achievementsVisibility = a3;
}

- (int)gamesPlayedVisibility
{
  return self->_gamesPlayedVisibility;
}

- (void)setGamesPlayedVisibility:(int)a3
{
  self->_gamesPlayedVisibility = a3;
}

- (int)friendsVisibility
{
  return self->_friendsVisibility;
}

- (void)setFriendsVisibility:(int)a3
{
  self->_friendsVisibility = a3;
}

- (int)globalFriendListAccess
{
  return self->_globalFriendListAccess;
}

- (BOOL)isInContacts
{
  return self->_isInContacts;
}

- (void)setIsInContacts:(BOOL)a3
{
  self->_isInContacts = a3;
}

- (void)setOnboarding:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (int)contactsIntegrationConsent
{
  return self->_contactsIntegrationConsent;
}

- (void)setContactsIntegrationConsent:(int)a3
{
  self->_contactsIntegrationConsent = a3;
}

- (NSString)contactsAssociationID
{
  return self->_contactsAssociationID;
}

- (void)setContactsAssociationID:(id)a3
{
  objc_storeStrong((id *)&self->_contactsAssociationID, a3);
}

- (CNContact)contact
{
  return self->_contact;
}

- (NSDate)serviceLastUpdatedTimestamp
{
  return self->_serviceLastUpdatedTimestamp;
}

- (void)setServiceLastUpdatedTimestamp:(id)a3
{
  objc_storeStrong((id *)&self->_serviceLastUpdatedTimestamp, a3);
}

- (GKMessageInboxEntryInternal)inboxEntry
{
  return self->_inboxEntry;
}

- (void)setInboxEntry:(id)a3
{
  objc_storeStrong((id *)&self->_inboxEntry, a3);
}

- (id)sanitizeBeforeEncoding
{
  return self->_sanitizeBeforeEncoding;
}

- (void)setSanitizeBeforeEncoding:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 256);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_sanitizeBeforeEncoding, 0);
  objc_storeStrong((id *)&self->_inboxEntry, 0);
  objc_storeStrong((id *)&self->_onboarding, 0);
  objc_storeStrong((id *)&self->_lastFriendSuggestionsVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastContactsIntegrationConsentVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastProfilePrivacyVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_lastPersonalizationVersionDisplayed, 0);
  objc_storeStrong((id *)&self->_serviceLastUpdatedTimestamp, 0);
  objc_storeStrong((id *)&self->_automatchedTogether, 0);
  objc_storeStrong((id *)&self->_initiatedGameInviteToThisFriend, 0);
  objc_storeStrong((id *)&self->_acceptedGameInviteFromThisFriend, 0);
  objc_storeStrong((id *)&self->_friendPlayedNearby, 0);
  objc_storeStrong((id *)&self->_friendPlayedWith, 0);
  objc_storeStrong((id *)&self->_friendBiDirectional, 0);
  objc_storeStrong((id *)&self->_friendLevel, 0);
  objc_storeStrong((id *)&self->_messagesID, 0);
  objc_storeStrong((id *)&self->_photos, 0);
  objc_storeStrong((id *)&self->_avatarType, 0);
  objc_storeStrong((id *)&self->_alias, 0);
  objc_storeStrong((id *)&self->_contact, 0);
  objc_storeStrong((id *)&self->_contactsAssociationID, 0);
  objc_storeStrong((id *)&self->_scopedIDs, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
}

- (void)serverRepresentation
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_DEBUG, "serverRepresentation doesn't do what we think it should do", v1, 2u);
}

@end
