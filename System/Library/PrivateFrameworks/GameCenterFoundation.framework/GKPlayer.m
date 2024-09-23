@implementation GKPlayer

- (GKPlayerInternal)internal
{
  return (GKPlayerInternal *)objc_getProperty(self, a2, 8, 1);
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKPlayer;
  if (-[GKPlayer respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKPlayer forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

- (GKPlayer)init
{
  void *v3;
  GKPlayer *v4;

  +[GKInternalRepresentation internalRepresentation](GKPlayerInternal, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKPlayer initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v3);

  return v4;
}

- (GKPlayer)initWithInternalRepresentation:(id)a3
{
  id v5;
  GKLocalPlayer *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  GKPlayer *v11;
  GKLocalPlayer *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  objc_super v22;

  v5 = a3;
  if (objc_msgSend(v5, "isLocalPlayer"))
  {
    v6 = objc_alloc_init(GKLocalPlayer);
    -[GKPlayer setInternal:](v6, "setInternal:", v5);
    +[GKLocalPlayer localPlayers](GKLocalPlayer, "localPlayers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7 && (v9 = objc_msgSend(v7, "indexOfObject:", v6), v9 != 0x7FFFFFFFFFFFFFFFLL))
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if ((GKApplicationLinkedOnOrAfter() & 1) != 0)
        goto LABEL_10;
      +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
      v10 = objc_claimAutoreleasedReturnValue();
    }
    v12 = (GKLocalPlayer *)v10;

    v6 = v12;
LABEL_10:
    objc_msgSend(v5, "scopedIDs");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = (void *)v13;
      -[GKPlayer internal](v6, "internal");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scopedIDs");
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(v5, "scopedIDs");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[GKPlayer internal](v6, "internal");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setScopedIDs:", v17);

      }
    }

    goto LABEL_14;
  }
  v22.receiver = self;
  v22.super_class = (Class)GKPlayer;
  v11 = -[GKPlayer init](&v22, sel_init);
  v6 = (GKLocalPlayer *)v11;
  if (v11)
    objc_storeStrong((id *)&v11->_internal, a3);
LABEL_14:
  v19 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v20 = GKOSLoggers();
    v19 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    -[GKPlayer initWithInternalRepresentation:].cold.1();

  return &v6->super;
}

+ (id)anonymousPlayer
{
  GKPlayer *v2;
  void *v3;
  GKPlayer *v4;

  v2 = [GKPlayer alloc];
  +[GKInternalRepresentation internalRepresentation](GKAnonymousPlayerInternal, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKPlayer initWithInternalRepresentation:](v2, "initWithInternalRepresentation:", v3);

  return v4;
}

+ (id)unknownPlayer
{
  GKPlayer *v2;
  void *v3;
  GKPlayer *v4;

  v2 = [GKPlayer alloc];
  +[GKInternalRepresentation internalRepresentation](GKUnknownPlayerInternal, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKPlayer initWithInternalRepresentation:](v2, "initWithInternalRepresentation:", v3);

  return v4;
}

+ (id)automatchPlayer
{
  GKPlayer *v2;
  void *v3;
  GKPlayer *v4;

  v2 = [GKPlayer alloc];
  +[GKInternalRepresentation internalRepresentation](GKAutomatchPlayerInternal, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKPlayer initWithInternalRepresentation:](v2, "initWithInternalRepresentation:", v3);

  return v4;
}

+ (GKPlayer)anonymousGuestPlayerWithIdentifier:(NSString *)guestIdentifier
{
  NSString *v3;
  void *v4;
  GKAnonymousGuestPlayerInternal *v5;
  void *v6;
  GKAnonymousGuestPlayerInternal *v7;
  GKPlayer *v8;

  v3 = guestIdentifier;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = [GKAnonymousGuestPlayerInternal alloc];
  objc_msgSend(v4, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[GKAnonymousGuestPlayerInternal initWithHostPlayerInternal:guestIdentifier:](v5, "initWithHostPlayerInternal:guestIdentifier:", v6, v3);

  v8 = -[GKPlayer initWithInternalRepresentation:]([GKPlayer alloc], "initWithInternalRepresentation:", v7);
  return v8;
}

- (GKPlayer)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  GKPlayer *v6;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("internal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[GKPlayer initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v5);
  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKPlayer internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("internal"));

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)GKPlayer;
  -[GKPlayer dealloc](&v4, sel_dealloc);
}

- (GKGame)lastPlayedGame
{
  GKGame *v3;
  void *v4;
  void *v5;
  GKGame *v6;

  v3 = [GKGame alloc];
  -[GKPlayer internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastPlayedGame");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKGame initWithInternalRepresentation:](v3, "initWithInternalRepresentation:", v5);

  return v6;
}

- ($C4B24A06E922887A36692F481211F72A)stats
{
  $C4B24A06E922887A36692F481211F72A *result;
  id v5;

  retstr->var8 = 0;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var6 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var2 = 0u;
  -[GKPlayer internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  retstr->var0 = objc_msgSend(v5, "numberOfFriends");
  retstr->var1 = objc_msgSend(v5, "numberOfFriendsInCommon");
  retstr->var2 = objc_msgSend(v5, "numberOfGames");
  retstr->var3 = objc_msgSend(v5, "numberOfGamesInCommon");
  retstr->var4 = objc_msgSend(v5, "numberOfAchievements");
  retstr->var5 = objc_msgSend(v5, "numberOfAchievementPoints");
  retstr->var6 = objc_msgSend(v5, "numberOfRequests");
  retstr->var7 = objc_msgSend(v5, "numberOfChallenges");
  retstr->var8 = objc_msgSend(v5, "numberOfTurns");

  return result;
}

- (NSString)messagesID
{
  void *v2;
  void *v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "messagesID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)isInContacts
{
  void *v2;
  char v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInContacts");

  return v3;
}

- (BOOL)isArcadeGame
{
  if (isArcadeGame_onceToken != -1)
    dispatch_once(&isArcadeGame_onceToken, &__block_literal_global_27);
  return isArcadeGame_isArcadeGame;
}

void __24__GKPlayer_isArcadeGame__block_invoke()
{
  void *v0;
  id v1;

  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "profileService");
  v1 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "getOcelotStateForCurrentAppWithHandler:", &__block_literal_global_22);
}

void __24__GKPlayer_isArcadeGame__block_invoke_2(uint64_t a1, char a2)
{
  isArcadeGame_isArcadeGame = a2;
}

- (NSString)playerID
{
  void *v4;
  void *v5;
  _QWORD block[5];

  if (-[GKPlayer isArcadeGame](self, "isArcadeGame"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __20__GKPlayer_playerID__block_invoke;
    block[3] = &unk_1E75B1590;
    block[4] = self;
    if (playerID_onceToken != -1)
      dispatch_once(&playerID_onceToken, block);
    return (NSString *)CFSTR("playerID is not available for Arcade games");
  }
  else
  {
    -[GKPlayer internal](self, "internal");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "playerID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSString *)v5;
  }
}

uint64_t __20__GKPlayer_playerID__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAndReportIllegalArcadeAccessTo:", CFSTR("playerID"));
}

+ (id)gameBundleID
{
  void *v2;
  void *v3;

  +[GKGame currentGame](GKGame, "currentGame");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)gamePlayerID
{
  void *v2;
  void *v3;

  -[GKPlayer vendibleScopedIDs](self, "vendibleScopedIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gamePlayerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (NSString)teamPlayerID
{
  void *v3;
  void *v4;
  _QWORD block[5];

  if (-[GKPlayer isArcadeGame](self, "isArcadeGame"))
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __24__GKPlayer_teamPlayerID__block_invoke;
    block[3] = &unk_1E75B1590;
    block[4] = self;
    if (teamPlayerID_onceToken != -1)
      dispatch_once(&teamPlayerID_onceToken, block);
  }
  -[GKPlayer vendibleScopedIDs](self, "vendibleScopedIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "teamPlayerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v4;
}

uint64_t __24__GKPlayer_teamPlayerID__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAndReportIllegalArcadeAccessTo:", CFSTR("teamPlayerID"));
}

- (void)logAndReportIllegalArcadeAccessTo:(id)a3
{
  id v3;
  void *v4;
  int v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[GKPreferences shared](GKPreferences, "shared");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isInternalBuild");

  v6 = os_log_GKGeneral;
  if (v5)
  {
    if (!os_log_GKGeneral)
    {
      v7 = GKOSLoggers();
      v6 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      -[GKPlayer logAndReportIllegalArcadeAccessTo:].cold.1();
  }
  else
  {
    if (!os_log_GKGeneral)
      v8 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKPlayer logAndReportIllegalArcadeAccessTo:].cold.2();
  }
  +[GKAPIReporter reporter](GKAPIReporter, "reporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("eventType");
  v11[1] = CFSTR("apiType");
  v12[0] = CFSTR("deprecatedAPIUsage");
  v12[1] = CFSTR("property");
  v11[2] = CFSTR("apiName");
  v12[2] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordPerformanceMetrics:", v10);

}

- (BOOL)scopedIDsArePersistent
{
  void *v2;
  char v3;

  -[GKPlayer vendibleScopedIDs](self, "vendibleScopedIDs");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "arePersistent");

  return v3;
}

- (id)vendibleScopedIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  dispatch_once_t *v11;
  uint64_t *p_block;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  GKPlayer *v17;
  uint64_t block;
  uint64_t v19;
  uint64_t (*v20)(uint64_t);
  void *v21;
  GKPlayer *v22;

  -[GKPlayer internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[GKPlayer gameBundleID](GKPlayer, "gameBundleID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKPlayer internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "scopedIDs");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v7, "isForPlayerID:gameBundleID:", v4, v5))
  {
    if (v7)
    {
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __29__GKPlayer_vendibleScopedIDs__block_invoke_2;
      v16 = &unk_1E75B1590;
      v17 = self;
      if (vendibleScopedIDs_onceToken_45 == -1)
        goto LABEL_8;
      v11 = &vendibleScopedIDs_onceToken_45;
      p_block = &v13;
    }
    else
    {
      if (!+[GKScopedIDs availableForPlayerID:](GKScopedIDs, "availableForPlayerID:", v4))
        goto LABEL_8;
      block = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __29__GKPlayer_vendibleScopedIDs__block_invoke;
      v21 = &unk_1E75B1590;
      v22 = self;
      if (vendibleScopedIDs_onceToken == -1)
        goto LABEL_8;
      v11 = &vendibleScopedIDs_onceToken;
      p_block = &block;
    }
    dispatch_once(v11, p_block);
LABEL_8:
    +[GKScopedIDs makeNonpersistentWithPlayerID:gameBundleID:](GKScopedIDs, "makeNonpersistentWithPlayerID:gameBundleID:", v4, v5, v13, v14, v15, v16, v17, block, v19, v20, v21, v22);
    v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  v8 = v7;
LABEL_9:
  v9 = v8;

  return v9;
}

uint64_t __29__GKPlayer_vendibleScopedIDs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAndReportScopedIDsError:", CFSTR("Nil"));
}

uint64_t __29__GKPlayer_vendibleScopedIDs__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "logAndReportScopedIDsError:", CFSTR("Invalid"));
}

- (void)logAndReportScopedIDsError:(id)a3
{
  id v4;
  void *v5;
  int v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  _QWORD v11[2];
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[GKPreferences shared](GKPreferences, "shared");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isInternalBuild");

  if (v6)
  {
    v7 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v8 = GKOSLoggers();
      v7 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[GKPlayer logAndReportScopedIDsError:].cold.1((uint64_t)v4, v7, self);
  }
  +[GKAPIReporter reporter](GKAPIReporter, "reporter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = CFSTR("eventType");
  v11[1] = CFSTR("errorType");
  v12[0] = CFSTR("scopedIDsError");
  v12[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "recordPerformanceMetrics:", v10);

}

- (void)updateScopedIDs:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  void (**v16)(_QWORD);
  id v17;
  void *v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  -[GKPlayer internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "playerID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (+[GKScopedIDs availableForPlayerID:](GKScopedIDs, "availableForPlayerID:", v6))
  {
    +[GKPlayer gameBundleID](GKPlayer, "gameBundleID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKPlayer internal](self, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "scopedIDs");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "arePersistent")
      && objc_msgSend(v9, "isForPlayerID:gameBundleID:", v6, v7))
    {
      if (!os_log_GKGeneral)
        v10 = GKOSLoggers();
      v11 = os_log_GKTrace;
      if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v6;
        v21 = 2112;
        v22 = v7;
        _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "Not updating persistent scoped ids for playerID: %@ gameBundleID: %@", buf, 0x16u);
      }
      v4[2](v4);
    }
    else
    {
      objc_initWeak((id *)buf, self);
      v18 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __28__GKPlayer_updateScopedIDs___block_invoke;
      v15[3] = &unk_1E75B4718;
      objc_copyWeak(&v17, (id *)buf);
      v15[4] = self;
      v16 = v4;
      +[GKPlayer loadScopedIDsForPlayerIDs:gameBundleID:handler:](GKPlayer, "loadScopedIDsForPlayerIDs:gameBundleID:handler:", v14, v7, v15);

      objc_destroyWeak(&v17);
      objc_destroyWeak((id *)buf);
    }

  }
  else
  {
    v12 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v13 = GKOSLoggers();
      v12 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[GKPlayer updateScopedIDs:].cold.1(v12, self);
    v4[2](v4);
  }

}

void __28__GKPlayer_updateScopedIDs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;

  v5 = a3;
  v6 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v6, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "internal");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setScopedIDs:", v9);

  if (v5)
  {
    if (!os_log_GKGeneral)
      v11 = GKOSLoggers();
    v12 = (void *)os_log_GKError;
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __28__GKPlayer_updateScopedIDs___block_invoke_cold_1(a1, v12, (uint64_t)v5);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)loadScopedIDsForPlayerIDs:(id)a3 gameBundleID:(id)a4 handler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (objc_msgSend(v7, "count"))
  {
    +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "profileService");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v17[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __59__GKPlayer_loadScopedIDsForPlayerIDs_gameBundleID_handler___block_invoke;
    v13[3] = &unk_1E75B2C78;
    v14 = v7;
    v15 = v8;
    v16 = v9;
    objc_msgSend(v11, "loadScopedPlayerIDs:gameBundleIDs:handler:", v14, v12, v13);

  }
  else
  {
    (*((void (**)(id, _QWORD, _QWORD))v9 + 2))(v9, MEMORY[0x1E0C9AA70], 0);
  }

}

void __59__GKPlayer_loadScopedIDsForPlayerIDs_gameBundleID_handler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  id v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = a1[4];
    v12 = a1[5];
    v13 = 138413058;
    v14 = v5;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v12;
    v19 = 2112;
    v20 = v6;
    _os_log_debug_impl(&dword_1BCDE3000, v7, OS_LOG_TYPE_DEBUG, "Loaded scoped ids: %@ for playerIDs: %@, gameBundleID: %@, error: %@", (uint8_t *)&v13, 0x2Au);
  }
  v9 = a1[6];
  if (v6)
  {
    (*(void (**)(uint64_t, _QWORD, id))(v9 + 16))(v9, MEMORY[0x1E0C9AA70], v6);
  }
  else
  {
    +[GKScopedIDs makePlayerIDtoScopedIDsDictFromScopedIDs:](GKScopedIDs, "makePlayerIDtoScopedIDsDictFromScopedIDs:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v9 + 16))(v9, v10, 0);

  }
}

- (NSNumber)friendLevel
{
  void *v2;
  void *v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "friendLevel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)friendBiDirectional
{
  void *v2;
  void *v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "friendBiDirectional");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)friendPlayedWith
{
  void *v2;
  void *v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "friendPlayedWith");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)friendPlayedNearby
{
  void *v2;
  void *v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "friendPlayedNearby");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)acceptedGameInviteFromThisFriend
{
  void *v2;
  void *v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "acceptedGameInviteFromThisFriend");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)initiatedGameInviteToThisFriend
{
  void *v2;
  void *v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "initiatedGameInviteToThisFriend");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSNumber)automatchedTogether
{
  void *v2;
  void *v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "automatchedTogether");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSNumber *)v3;
}

- (NSString)alias
{
  void *v2;
  void *v3;
  id v4;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alias");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v3, "length"))
  {
    if (alias_onceToken != -1)
      dispatch_once(&alias_onceToken, &__block_literal_global_55_1);
    v4 = (id)alias_sUnknownPlayerNickname;

    v3 = v4;
  }
  return (NSString *)v3;
}

void __17__GKPlayer_alias__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[GCFLocalizedStrings UNKNOWN_PLAYER_NICKNAME](_TtC20GameCenterFoundation19GCFLocalizedStrings, "UNKNOWN_PLAYER_NICKNAME");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)alias_sUnknownPlayerNickname;
  alias_sUnknownPlayerNickname = v0;

}

- (int64_t)avatarType
{
  void *v2;
  void *v3;
  int64_t v4;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "avatarType");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)setFriendLevel:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKPlayer internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFriendLevel:", v4);

}

- (void)setFriendBiDirectional:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKPlayer internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFriendBiDirectional:", v4);

}

- (void)setFriendPlayedWith:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKPlayer internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFriendPlayedWith:", v4);

}

- (void)setFriendPlayedNearby:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKPlayer internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFriendPlayedNearby:", v4);

}

- (void)setAcceptedGameInviteFromThisFriend:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKPlayer internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAcceptedGameInviteFromThisFriend:", v4);

}

- (void)setInitiatedGameInviteToThisFriend:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKPlayer internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInitiatedGameInviteToThisFriend:", v4);

}

- (void)setAutomatchedTogether:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[GKPlayer internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAutomatchedTogether:", v4);

}

- (BOOL)isInvitable
{
  void *v3;
  char v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[GKPlayer internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isLocalPlayer");

  if ((v4 & 1) != 0)
    return 0;
  -[GKPlayer internal](self, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "friendBiDirectional");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToNumber:", &unk_1E75FB070) & 1) != 0)
  {
    v5 = 1;
  }
  else
  {
    -[GKPlayer internal](self, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "friendPlayedWith");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isEqualToNumber:", &unk_1E75FB070) & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      -[GKPlayer internal](self, "internal");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "friendPlayedNearby");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v11, "isEqualToNumber:", &unk_1E75FB070);

    }
  }

  return v5;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  __CFString *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  __CFString *v39;
  void *v40;
  void *v41;
  objc_super v42;
  objc_super v43;
  objc_super v44;

  -[GKPlayer internal](self, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && objc_msgSend(MEMORY[0x1E0CB34D0], "_gkMainBundleIsGameCenterSystemProcess"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[GKPlayer internal](self, "internal");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "playerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("playerID:%@ "), v6);
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = &stru_1E75BB5A8;
  }

  -[GKPlayer internal](self, "internal");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GKPlayer internal](self, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v43.receiver = self;
      v43.super_class = (Class)GKPlayer;
      -[GKPlayer description](&v43, sel_description);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer alias](self, "alias");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer displayNameWithOptions:](self, "displayNameWithOptions:", 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer internal](self, "internal");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "date");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer internal](self, "internal");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "message");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("(%@alias:%@ name:%@ date:%@ message:%@)"), v7, v12, v13, v15, v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v42.receiver = self;
      v42.super_class = (Class)GKPlayer;
      -[GKPlayer description](&v42, sel_description);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer alias](self, "alias");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer gameBundleID](self, "gameBundleID");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer internal](self, "internal");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "scopedIDs");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "gamePlayerID");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer internal](self, "internal");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "scopedIDs");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "teamPlayerID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x1E0CB37E8];
      -[GKPlayer internal](self, "internal");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "scopedIDs");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "numberWithBool:", objc_msgSend(v32, "arePersistent"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer displayNameWithOptions:](self, "displayNameWithOptions:", 0);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer status](self, "status");
      v39 = v7;
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer friendBiDirectional](self, "friendBiDirectional");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer friendPlayedWith](self, "friendPlayedWith");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer friendPlayedNearby](self, "friendPlayedNearby");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer acceptedGameInviteFromThisFriend](self, "acceptedGameInviteFromThisFriend");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer initiatedGameInviteToThisFriend](self, "initiatedGameInviteToThisFriend");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKPlayer automatchedTogether](self, "automatchedTogether");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v30;
      objc_msgSend(v30, "stringByAppendingFormat:", CFSTR("(%@alias:%@ gameBundleID:%@ gamePlayerID:%@ teamPlayerID:%@ scopedIDsArePersistent:%@ name:%@ status:%@ friendBiDirectional:%@ friendPlayedWith:%@ friendPlayedNearby:%@ acceptedGameInviteFromThisFriend:%@ initiatedGameInviteToThisFriend:%@ automatchedTogether:%@)"), v39, v41, v40, v31, v38, v20, v29, v28, v21, v22, v23, v24, v25, v26);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = v39;
    }
  }
  else
  {
    v44.receiver = self;
    v44.super_class = (Class)GKPlayer;
    -[GKPlayer description](&v44, sel_description);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByAppendingString:", CFSTR(" ****** EMPTY ******"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v18;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKPlayer internal](self, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "internal");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v6, "isEqual:", v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)cacheKeyForPlayerID:(id)a3
{
  return a3;
}

- (NSString)cacheKey
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_opt_class();
  -[GKPlayer internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "playerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cacheKeyForPlayerID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)hasPhoto
{
  void *v2;
  void *v3;
  BOOL v4;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "photos");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (BOOL)isFamiliarFriend
{
  void *v2;
  BOOL v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "defaultFamiliarity") == 2;

  return v3;
}

+ (void)loadPlayersForIdentifiers:(NSArray *)identifiers withCompletionHandler:(void *)completionHandler
{
  NSArray *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSArray *v12;
  _QWORD v13[4];
  NSArray *v14;
  id v15;
  _QWORD *v16;
  id v17;
  _QWORD v18[5];
  _QWORD v19[3];
  char v20;

  v6 = identifiers;
  v7 = completionHandler;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m", 514, "+[GKPlayer loadPlayersForIdentifiers:withCompletionHandler:]");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x2020000000;
  v10 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke;
  v18[3] = &unk_1E75B4788;
  v18[4] = v19;
  objc_msgSend(v9, "perform:", v18);
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3;
  v13[3] = &unk_1E75B47B0;
  v16 = v19;
  v11 = v7;
  v15 = v11;
  v17 = a1;
  v12 = v6;
  v14 = v12;
  objc_msgSend(v9, "notifyOnMainQueueWithBlock:", v13);

  _Block_object_dispose(v19, 8);
}

void __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "profileService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E75B4760;
  v6 = *(_QWORD *)(a1 + 32);
  v9 = v3;
  v10 = v6;
  v7 = v3;
  objc_msgSend(v5, "getOcelotStateForCurrentAppWithHandler:", v8);

}

uint64_t __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2(uint64_t a1, char a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a2;
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
    goto LABEL_9;
  objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 31, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!*(_QWORD *)(a1 + 40))
  {

LABEL_9:
    objc_msgSend(*(id *)(a1 + 56), "_loadPlayersForIdentifiers:withCompletionHandler:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
    return;
  }
  if (!os_log_GKGeneral)
    v4 = GKOSLoggers();
  if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
    __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

+ (void)_loadPlayersForIdentifiers:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint8_t buf[16];

  v5 = a3;
  v6 = a4;
  if (!os_log_GKGeneral)
    v7 = GKOSLoggers();
  v8 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "GKPlayer: _loadPlayersForIdentifiers:", buf, 2u);
  }
  objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 1, &__block_literal_global_81);
  v9 = objc_msgSend(v5, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2;
  v27[3] = &unk_1E75B4818;
  v13 = v11;
  v28 = v13;
  v14 = v10;
  v29 = v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v27);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m", 570, "+[GKPlayer _loadPlayersForIdentifiers:withCompletionHandler:]");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 < 1)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 17, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setError:", v17);
  }
  else
  {
    v21[0] = v12;
    v21[1] = 3221225472;
    v21[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3;
    v21[3] = &unk_1E75B48B8;
    v22 = v14;
    v26 = v9;
    v23 = v13;
    v24 = v5;
    v25 = v16;
    objc_msgSend(v25, "perform:", v21);

    v17 = v22;
  }

  if (v6)
  {
    v18[0] = v12;
    v18[1] = 3221225472;
    v18[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_99;
    v18[3] = &unk_1E75B1BF0;
    v20 = v6;
    v19 = v16;
    objc_msgSend(v19, "notifyOnMainQueueWithBlock:", v18);

  }
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v2 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid parameter: 'identifiers' parameter must contain an array of playerIDs as NSString objects, received %@ instead."), objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "lastPathComponent");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v2, "stringWithFormat:", CFSTR("%@ ([obj isKindOfClass:[NSString class]])\n[%s (%s:%d)]"), v3, "+[GKPlayer _loadPlayersForIdentifiers:withCompletionHandler:]_block_invoke", objc_msgSend(v5, "UTF8String"), 548);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v6);
  }

}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  _BOOL4 v3;
  uint64_t v4;
  id v5;

  v5 = a2;
  v3 = +[GKPlayer isGuestPlayerID:](GKPlayer, "isGuestPlayerID:", v5);
  v4 = 40;
  if (v3)
    v4 = 32;
  objc_msgSend(*(id *)(a1 + v4), "addObject:", v5);

}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;

  v3 = a2;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "profileService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_4;
  v10[3] = &unk_1E75B4890;
  v16 = *(_QWORD *)(a1 + 64);
  v11 = v4;
  v7 = *(_QWORD *)(a1 + 32);
  v12 = *(id *)(a1 + 40);
  v13 = *(id *)(a1 + 48);
  v14 = *(id *)(a1 + 56);
  v15 = v3;
  v8 = v3;
  v9 = v4;
  objc_msgSend(v6, "getProfilesForPlayerIDs:handler:", v7, v10);

}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    if (!os_log_GKGeneral)
      v7 = GKOSLoggers();
    if (os_log_type_enabled((os_log_t)os_log_GKError, OS_LOG_TYPE_ERROR))
      __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_4_cold_1();
  }
  dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_93;
  v11[3] = &unk_1E75B4868;
  v19 = *(_QWORD *)(a1 + 72);
  v12 = *(id *)(a1 + 32);
  v13 = v5;
  v14 = *(id *)(a1 + 40);
  v15 = *(id *)(a1 + 48);
  v16 = *(id *)(a1 + 56);
  v17 = v6;
  v18 = *(id *)(a1 + 64);
  v9 = v6;
  v10 = v5;
  dispatch_async(v8, v11);

}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_93(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  GKPlayer *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  NSObject *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)(a1 + 88) + 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v5, "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "playerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, v7);

  }
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v8 = *(id *)(a1 + 40);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(v8);
        v13 = -[GKPlayer initWithInternalRepresentation:]([GKPlayer alloc], "initWithInternalRepresentation:", *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * i));
        -[GKPlayer internal](v13, "internal");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "playerID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if (v15)
          objc_msgSend(v2, "setObject:forKeyedSubscript:", v13, v15);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }

  v16 = *(void **)(a1 + 48);
  v17 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2_95;
  v28[3] = &unk_1E75B4840;
  v18 = v2;
  v29 = v18;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v28);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", *(_QWORD *)(a1 + 88));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = *(void **)(a1 + 56);
  v25[0] = v17;
  v25[1] = 3221225472;
  v25[2] = __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_96;
  v25[3] = &unk_1E75B4818;
  v21 = v18;
  v26 = v21;
  v22 = v19;
  v27 = v22;
  objc_msgSend(v20, "enumerateObjectsUsingBlock:", v25);
  v23 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v24 = GKOSLoggers();
    v23 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_93_cold_1((void **)(a1 + 48), v23, v22);
  objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v22, CFSTR("players"));
  objc_msgSend(*(id *)(a1 + 64), "setError:", *(_QWORD *)(a1 + 72));
  (*(void (**)(void))(*(_QWORD *)(a1 + 80) + 16))();

}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_2_95(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  GKAnonymousGuestPlayerInternal *v7;
  void *v8;
  GKAnonymousGuestPlayerInternal *v9;
  GKPlayer *v10;
  id v11;

  v11 = a2;
  objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("_"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = [GKAnonymousGuestPlayerInternal alloc];
    objc_msgSend(v6, "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[GKAnonymousGuestPlayerInternal initWithHostPlayerInternal:guestIdentifier:](v7, "initWithHostPlayerInternal:guestIdentifier:", v8, v5);

    v10 = -[GKPlayer initWithInternalRepresentation:]([GKPlayer alloc], "initWithInternalRepresentation:", v9);
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, v11);

  }
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_96(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
    v4 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v5 = GKOSLoggers();
      v4 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_96_cold_1(v3, v4);
  }

}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_99(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("players"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)_postChangeNotification
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__GKPlayer__postChangeNotification__block_invoke;
  block[3] = &unk_1E75B1590;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __35__GKPlayer__postChangeNotification__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", GKPlayerDidChangeNotificationName, *(_QWORD *)(a1 + 32));

}

- (void)postChangeNotification
{
  objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:", self);
  -[GKPlayer performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__postChangeNotification, 0, 0.1);
}

- (void)loadFriendsAsPlayersWithCompletionHandler:(id)a3
{
  -[GKPlayer loadCommonFriends:asPlayersWithCompletionHandler:](self, "loadCommonFriends:asPlayersWithCompletionHandler:", 0, a3);
}

- (void)loadFriendsWithFilter:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  GKPlayer *v14;
  id v15;
  _QWORD v16[5];
  id v17;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m", 664, "-[GKPlayer loadFriendsWithFilter:withCompletionHandler:]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke;
  v16[3] = &unk_1E75B1788;
  v16[4] = self;
  v9 = v7;
  v17 = v9;
  objc_msgSend(v9, "perform:", v16);
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E75B30F8;
  v13 = v9;
  v14 = self;
  v15 = v5;
  v10 = v5;
  v11 = v9;
  objc_msgSend(v11, "notifyOnMainQueueWithBlock:", v12);

}

void __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E75B1C58;
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "getCommonFriendsForPlayer:handler:", v6, v8);

}

uint64_t __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, CFSTR("friends"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("friends"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkValuesForKeyPath:", CFSTR("playerID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setFriends:", v2);

  objc_msgSend(*(id *)(a1 + 40), "postChangeNotification");
  objc_msgSend(v6, "_gkMapConcurrentlyWithBlock:", &__block_literal_global_106);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);

  }
}

GKPlayer *__56__GKPlayer_loadFriendsWithFilter_withCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  id v2;
  GKPlayer *v3;

  v2 = a2;
  v3 = -[GKPlayer initWithInternalRepresentation:]([GKPlayer alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

- (void)loadCommonFriends:(BOOL)a3 asPlayersWithCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  uint64_t *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  GKPlayer *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m", 690, "-[GKPlayer loadCommonFriends:asPlayersWithCompletionHandler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    v20 = MEMORY[0x1E0C809B0];
    v10 = __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke;
    v11 = &v20;
  }
  else
  {
    v19 = MEMORY[0x1E0C809B0];
    v10 = __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_3;
    v11 = &v19;
  }
  v11[1] = 3221225472;
  v11[2] = (uint64_t)v10;
  v11[3] = (uint64_t)&unk_1E75B1788;
  v11[4] = (uint64_t)self;
  v12 = v8;
  v11[5] = (uint64_t)v12;
  objc_msgSend(v12, "perform:", v11);

  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_5;
  v15[3] = &unk_1E75B30F8;
  v16 = v12;
  v17 = self;
  v18 = v6;
  v13 = v6;
  v14 = v12;
  objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v15);

}

void __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E75B1C58;
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "getCommonFriendsForPlayer:handler:", v6, v8);

}

uint64_t __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, CFSTR("friends"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "friendService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_4;
  v8[3] = &unk_1E75B1C58;
  v9 = *(id *)(a1 + 40);
  v10 = v3;
  v7 = v3;
  objc_msgSend(v5, "getFriendsForPlayer:handler:", v6, v8);

}

uint64_t __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_4(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  id v6;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(v5, "setObject:forKeyedSubscript:", a2, CFSTR("friends"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("friends"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_gkValuesForKeyPath:", CFSTR("playerID"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setFriends:", v2);

  objc_msgSend(*(id *)(a1 + 40), "postChangeNotification");
  objc_msgSend(v6, "_gkMapConcurrentlyWithBlock:", &__block_literal_global_107);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "error");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, void *))(v4 + 16))(v4, v3, v5);

  }
}

GKPlayer *__61__GKPlayer_loadCommonFriends_asPlayersWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  id v2;
  GKPlayer *v3;

  v2 = a2;
  v3 = -[GKPlayer initWithInternalRepresentation:]([GKPlayer alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

- (void)loadRecentMatchesForGame:(id)a3 block:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  GKPlayer *v18;
  id v19;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m", 730, "-[GKPlayer loadRecentMatchesForGame:block:]");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = MEMORY[0x1E0C809B0];
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke;
    v16[3] = &unk_1E75B1800;
    v17 = v6;
    v18 = self;
    v11 = v9;
    v19 = v11;
    objc_msgSend(v11, "perform:", v16);
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_4;
    v13[3] = &unk_1E75B1BF0;
    v14 = v11;
    v15 = v7;
    v12 = v11;
    objc_msgSend(v12, "notifyOnMainQueueWithBlock:", v13);

  }
}

void __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameStatService");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[4], "gameDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a1[5], "isLocalPlayer");
  if ((v7 & 1) != 0)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(a1[5], "internal");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_2;
  v10[3] = &unk_1E75B4968;
  v11 = a1[6];
  v12 = a1[4];
  v13 = v3;
  v9 = v3;
  objc_msgSend(v5, "getRecentMatchesForGameDescriptor:otherPlayer:handler:", v6, v8, v10);
  if ((v7 & 1) == 0)

}

void __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a2;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_3;
    v10[3] = &unk_1E75B4940;
    v8 = *(void **)(a1 + 32);
    v11 = *(id *)(a1 + 40);
    objc_msgSend(v6, "_gkMapConcurrentlyWithBlock:", v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, CFSTR("matches"));

  }
  objc_msgSend(*(id *)(a1 + 32), "setError:", v7);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

GKGameMatch *__43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  GKGameMatch *v4;

  v3 = a2;
  v4 = -[GKGameMatch initWithInternalRepresentation:game:]([GKGameMatch alloc], "initWithInternalRepresentation:game:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

void __43__GKPlayer_loadRecentMatchesForGame_block___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("matches"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

- (void)loadGamesPlayed:(id)a3
{
  -[GKPlayer loadGamesPlayedIncludingInstalledGames:completionHandler:](self, "loadGamesPlayedIncludingInstalledGames:completionHandler:", 0, a3);
}

- (void)loadGamesPlayedIncludingInstalledGames:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  BOOL v17;

  v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m", 760, "-[GKPlayer loadGamesPlayedIncludingInstalledGames:completionHandler:]");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke;
    v15[3] = &unk_1E75B34C0;
    v15[4] = self;
    v17 = a3;
    v10 = v8;
    v16 = v10;
    objc_msgSend(v10, "perform:", v15);
    v12[0] = v9;
    v12[1] = 3221225472;
    v12[2] = __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_4;
    v12[3] = &unk_1E75B1BF0;
    v13 = v10;
    v14 = v6;
    v11 = v10;
    objc_msgSend(v11, "notifyOnMainQueueWithBlock:", v12);

  }
}

void __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  _QWORD v11[4];
  id v12;
  uint64_t v13;
  id v14;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(unsigned __int8 *)(a1 + 48);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_2;
  v11[3] = &unk_1E75B4968;
  v8 = *(id *)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 32);
  v12 = v8;
  v13 = v9;
  v14 = v3;
  v10 = v3;
  objc_msgSend(v5, "getGamesForPlayer:includeInstalled:handler:", v6, v7, v11);

}

uint64_t __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_3;
  v12[3] = &unk_1E75B4990;
  v7 = *(void **)(a1 + 32);
  v12[4] = *(_QWORD *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  objc_msgSend(a2, "_gkMapConcurrentlyWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("games"));

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("seed"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

GKGameRecord *__69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  GKGameRecord *v4;

  v3 = a2;
  v4 = -[GKGameRecord initWithInternalRepresentation:player:]([GKGameRecord alloc], "initWithInternalRepresentation:player:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

void __69__GKPlayer_loadGamesPlayedIncludingInstalledGames_completionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("games"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("seed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);

}

- (void)loadGamesPlayedDetailsWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;

  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m", 783, "-[GKPlayer loadGamesPlayedDetailsWithCompletionHandler:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = MEMORY[0x1E0C809B0];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke;
    v13[3] = &unk_1E75B1788;
    v13[4] = self;
    v8 = v6;
    v14 = v8;
    objc_msgSend(v8, "perform:", v13);
    v10[0] = v7;
    v10[1] = 3221225472;
    v10[2] = __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_4;
    v10[3] = &unk_1E75B1BF0;
    v11 = v8;
    v12 = v4;
    v9 = v8;
    objc_msgSend(v9, "notifyOnMainQueueWithBlock:", v10);

  }
}

void __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  id v13;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_1E75B4968;
  v7 = *(id *)(a1 + 40);
  v8 = *(_QWORD *)(a1 + 32);
  v11 = v7;
  v12 = v8;
  v13 = v3;
  v9 = v3;
  objc_msgSend(v5, "getGamesWithAchievementStatsForPlayer:handler:", v6, v10);

}

uint64_t __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3, void *a4)
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  _QWORD v12[5];

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_3;
  v12[3] = &unk_1E75B4990;
  v7 = *(void **)(a1 + 32);
  v12[4] = *(_QWORD *)(a1 + 40);
  v8 = a4;
  v9 = a3;
  objc_msgSend(a2, "_gkMapConcurrentlyWithBlock:", v12);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, CFSTR("games"));

  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, CFSTR("seed"));
  objc_msgSend(*(id *)(a1 + 32), "setError:", v8);

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

GKGameRecord *__56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  GKGameRecord *v4;

  v3 = a2;
  v4 = -[GKGameRecord initWithInternalRepresentation:player:]([GKGameRecord alloc], "initWithInternalRepresentation:player:", v3, *(_QWORD *)(a1 + 32));

  return v4;
}

void __56__GKPlayer_loadGamesPlayedDetailsWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("games"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("seed"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *, void *))(v2 + 16))(v2, v5, v3, v4);

}

- (void)loadProfileWithCompletionHandler:(id)a3
{
  -[GKPlayer loadProfileDiscardingStaleData:completionHandler:](self, "loadProfileDiscardingStaleData:completionHandler:", 0, a3);
}

- (void)loadProfileDiscardingStaleData:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  id v18;
  BOOL v19;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/API/GKPlayer.m", 808, "-[GKPlayer loadProfileDiscardingStaleData:completionHandler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKPlayer internal](self, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "playerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = MEMORY[0x1E0C809B0];
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "userErrorForCode:underlyingError:", 8, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setError:", v12);

    if (!v6)
      goto LABEL_4;
    goto LABEL_3;
  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke;
  v16[3] = &unk_1E75B45B8;
  v16[4] = self;
  v17 = v10;
  v19 = a3;
  v18 = v8;
  objc_msgSend(v18, "perform:", v16);

  if (v6)
  {
LABEL_3:
    v13[0] = v11;
    v13[1] = 3221225472;
    v13[2] = __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke_3;
    v13[3] = &unk_1E75B1BF0;
    v15 = v6;
    v14 = v8;
    objc_msgSend(v14, "notifyOnMainQueueWithBlock:", v13);

  }
LABEL_4:

}

void __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  _QWORD v17[2];

  v17[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = *(id *)(a1 + 32);
  }
  else
  {
    +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  +[GKDaemonProxy proxyForPlayer:](GKDaemonProxy, "proxyForPlayer:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "profileService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v17, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(unsigned __int8 *)(a1 + 56);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke_2;
  v13[3] = &unk_1E75B2C78;
  v10 = *(id *)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 32);
  v14 = v10;
  v15 = v11;
  v16 = v3;
  v12 = v3;
  objc_msgSend(v7, "getProfilesForPlayerIDs:discardingStaleData:handler:", v8, v9, v13);

}

void __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
  if (objc_msgSend(v8, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "internal");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "onboarding");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOnboarding:", v7);

    objc_msgSend(*(id *)(a1 + 40), "setInternal:", v5);
    objc_msgSend(*(id *)(a1 + 40), "postChangeNotification");

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __61__GKPlayer_loadProfileDiscardingStaleData_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (void)loadCompletePlayersForPlayers:(id)a3 completionHandler:(id)a4
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a4;
  objc_msgSend(a3, "_gkMapWithBlock:", &__block_literal_global_120_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __60__GKPlayer_loadCompletePlayersForPlayers_completionHandler___block_invoke_2;
  v8[3] = &unk_1E75B1CF0;
  v9 = v5;
  v7 = v5;
  +[GKPlayer loadPlayersForIdentifiersPrivate:withCompletionHandler:](GKPlayer, "loadPlayersForIdentifiersPrivate:withCompletionHandler:", v6, v8);

}

id __60__GKPlayer_loadCompletePlayersForPlayers_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __60__GKPlayer_loadCompletePlayersForPlayers_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (id)displayNameWithOptions:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[GKPlayer internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "displayNameWithOptions:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSString)displayName
{
  return (NSString *)-[GKPlayer displayNameWithOptions:](self, "displayNameWithOptions:", 1);
}

- (id)sortName
{
  void *v2;
  void *v3;
  void *v4;

  -[GKPlayer displayNameWithOptions:](self, "displayNameWithOptions:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)searchName
{
  void *v2;
  void *v3;
  void *v4;

  -[GKPlayer displayNameWithOptions:](self, "displayNameWithOptions:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceCharacterSet");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKPlayer;
  objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[GKPlayerInternal instanceMethodSignatureForSelector:](GKPlayerInternal, "instanceMethodSignatureForSelector:", a3);
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return v7;
}

- (id)methodSignatureForSelector:(SEL)a3
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)GKPlayer;
  -[GKPlayer methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKPlayer forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  BOOL result;
  int v5;

  if (!a3)
    return 0;
  if (class_respondsToSelector((Class)a1, a3))
    return 1;
  v5 = GKApplicationLinkedOnOrAfter();
  result = 0;
  if (v5)
    return +[GKPlayerInternal instancesRespondToSelector:](GKPlayerInternal, "instancesRespondToSelector:", a3);
  return result;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKPlayer internal](self, "internal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 forUndefinedKey:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[GKPlayer internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (BOOL)isFriendablePlayer
{
  GKPlayer *v3;
  int v4;

  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v3 = (GKPlayer *)objc_claimAutoreleasedReturnValue();
  if (v3 == self
    || (-[GKPlayer isUnknownPlayer](self, "isUnknownPlayer") & 1) != 0
    || (-[GKPlayer isAnonymousPlayer](self, "isAnonymousPlayer") & 1) != 0)
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    v4 = -[GKPlayer isAutomatchPlayer](self, "isAutomatchPlayer") ^ 1;
  }

  return v4;
}

+ (BOOL)isGuestPlayerID:(id)a3
{
  id v3;
  void *v4;
  unint64_t v5;
  BOOL v7;

  v3 = a3;
  v4 = v3;
  if (v3 && objc_msgSend(v3, "length"))
  {
    v5 = objc_msgSend(v4, "rangeOfString:", CFSTR("_"));
    v7 = v5 != 0x7FFFFFFFFFFFFFFFLL && v5 > 2;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSAttributedString)whenString
{
  return self->_whenString;
}

- (void)setWhenString:(id)a3
{
  objc_storeStrong((id *)&self->_whenString, a3);
}

- (NSArray)friends
{
  return self->_friends;
}

- (void)setFriends:(id)a3
{
  objc_storeStrong((id *)&self->_friends, a3);
}

- (NSString)gameBundleID
{
  return self->_gameBundleID;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gameBundleID, 0);
  objc_storeStrong((id *)&self->_friends, 0);
  objc_storeStrong((id *)&self->_whenString, 0);
  objc_storeStrong((id *)&self->_internal, 0);
}

+ (id)playerFromPlayerID:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  +[GKInternalRepresentation internalRepresentation](GKPlayerInternal, "internalRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlayerID:", v3);

  +[GKPlayer canonicalizedPlayerForInternal:](_GKIncompletePlayer, "canonicalizedPlayerForInternal:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)canonicalizedPlayerForInternal:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  char v10;
  GKPlayer *v11;
  GKPlayer *v12;

  v3 = a3;
  +[GKLocalPlayer localPlayer](GKLocalPlayer, "localPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "playerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqualToString:", v7);

  if (v8)
  {
    objc_msgSend(v4, "internal");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isLocalPlayer");

    if ((v10 & 1) == 0)
      objc_msgSend(v4, "promotePlayerInternalToLocalPlayerInternal:", v4);
    v11 = v4;
  }
  else
  {
    v11 = -[GKPlayer initWithInternalRepresentation:]([GKPlayer alloc], "initWithInternalRepresentation:", v3);
  }
  v12 = v11;

  return v12;
}

- (NSString)referenceKey
{
  void *v2;
  void *v3;

  -[GKPlayer internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (id)minimalPlayer
{
  GKPlayer *v3;
  void *v4;
  void *v5;
  GKPlayer *v6;

  v3 = [GKPlayer alloc];
  -[GKPlayer internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimalInternal");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKPlayer initWithInternalRepresentation:](v3, "initWithInternalRepresentation:", v5);

  return v6;
}

- (void)initWithInternalRepresentation:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v0, v1, "Initialized player with internal representation: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)logAndReportIllegalArcadeAccessTo:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_1BCDE3000, v0, OS_LOG_TYPE_FAULT, "Arcade game is attempting to read '%@'", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

- (void)logAndReportIllegalArcadeAccessTo:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "ERROR: Illegal access to '%{public}@'", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

- (void)logAndReportScopedIDsError:(void *)a3 .cold.1(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(a3, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKPlayer gameBundleID](GKPlayer, "gameBundleID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138412802;
  v9 = a1;
  v10 = 2112;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_fault_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_FAULT, "%@ scoped ids for player: %@ game bundle id: %@", (uint8_t *)&v8, 0x20u);

  OUTLINED_FUNCTION_4();
}

- (void)updateScopedIDs:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v3, v5, "Attempting to load scoped ids for invalid internal: %@", v6);

}

void __28__GKPlayer_updateScopedIDs___block_invoke_cold_1(uint64_t a1, void *a2, uint64_t a3)
{
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "internal");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "playerID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKPlayer gameBundleID](GKPlayer, "gameBundleID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 138412802;
  v10 = v7;
  v11 = 2112;
  v12 = v8;
  v13 = 2112;
  v14 = a3;
  _os_log_error_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_ERROR, "Failed to load scoped ids for playerID: %@, gameBundleID: %@, error: %@", (uint8_t *)&v9, 0x20u);

}

void __60__GKPlayer_loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "***The current application is not allowed to use this API***:%@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_4_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0(&dword_1BCDE3000, v0, v1, "GKPlayer: _loadPlayersForIdentifiers: - Failed to get profiles and scoped IDs for Player IDs due to error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_93_cold_1(void **a1, void *a2, void *a3)
{
  void *v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *a1;
  v5 = a2;
  v6 = 134218240;
  v7 = objc_msgSend(v4, "count");
  v8 = 2048;
  v9 = objc_msgSend(a3, "count");
  _os_log_debug_impl(&dword_1BCDE3000, v5, OS_LOG_TYPE_DEBUG, "ScopedIDs number of Guests: %lu vs Friends: %lu", (uint8_t *)&v6, 0x16u);

}

void __61__GKPlayer__loadPlayersForIdentifiers_withCompletionHandler___block_invoke_3_96_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(a1, "gamePlayerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "teamPlayerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = a1;
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_DEBUG, "ScopedIDs for Player: %@ gameID: %@ teamID: %@", (uint8_t *)&v6, 0x20u);

  OUTLINED_FUNCTION_4();
}

@end
