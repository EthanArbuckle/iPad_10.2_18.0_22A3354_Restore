@implementation GKGame

- (NSURL)storeURL
{
  void *v2;
  void *v3;

  -[GKGame internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "storeURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (GKUtilityService)utilityService
{
  void *v2;
  void *v3;

  +[GKDaemonProxy daemonProxy](GKDaemonProxy, "daemonProxy");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "utilityService");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GKUtilityService *)v3;
}

+ (BOOL)isPreferences
{
  if (isPreferences_onceToken != -1)
    dispatch_once(&isPreferences_onceToken, &__block_literal_global_6);
  return isPreferences_isPreferences;
}

void __23__GKGame_isPreferences__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isPreferences_isPreferences = objc_msgSend(v0, "_gkIsPreferences");

}

+ (BOOL)isFirstParty
{
  if (isFirstParty_onceToken != -1)
    dispatch_once(&isFirstParty_onceToken, &__block_literal_global_2);
  return isFirstParty_isFirstParty;
}

void __22__GKGame_isFirstParty__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isFirstParty_isFirstParty = objc_msgSend(v0, "_gkIsFirstParty");

}

+ (BOOL)isGameCenter
{
  if (isGameCenter_sDispatchOnceToken != -1)
    dispatch_once(&isGameCenter_sDispatchOnceToken, &__block_literal_global_3);
  return isGameCenter_sGameCenter;
}

void __22__GKGame_isGameCenter__block_invoke()
{
  id v0;

  +[GKGame currentGame](GKGame, "currentGame");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isGameCenter_sGameCenter = objc_msgSend(v0, "isGameCenter");

}

+ (BOOL)isNewsApp:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("com.apple.news");
  v7[1] = CFSTR("com.apple.news.gamecentertest");
  v3 = (void *)MEMORY[0x1E0C99D20];
  v4 = a3;
  objc_msgSend(v3, "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "containsObject:", v4);

  return (char)v3;
}

- (BOOL)isSpringBoard
{
  void *v2;
  char v3;

  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.springboard"));

  return v3;
}

- (BOOL)isGameControllerDaemon
{
  void *v2;
  char v3;

  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.GameController.gamecontrollerd"));

  return v3;
}

- (BOOL)isDaemon
{
  void *v2;
  char v3;

  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.gamed"));

  return v3;
}

- (BOOL)isGameCenter
{
  void *v2;
  char v3;

  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.gamecenter"));

  return v3;
}

- (BOOL)isAppStore
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("com.apple.AppStore"));
  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 | objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.TVAppStore"));

  return v6;
}

- (BOOL)isGameCenterHostingContainer
{
  void *v2;
  char v3;

  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("com.apple.GameCenterUI.GameCenterHostingContainer"));

  return v3;
}

- (BOOL)isContacts
{
  void *v2;
  void *v3;

  v2 = (void *)MEMORY[0x1E0CB34D0];
  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v2, "_gkBundleIdentifierIsRelatedToContactsUI:", v3);

  return (char)v2;
}

- (BOOL)isInternalTestApp
{
  void *v3;
  void *v4;

  if (isInternalTestApp_onceToken != -1)
    dispatch_once(&isInternalTestApp_onceToken, &__block_literal_global_6);
  v3 = (void *)isInternalTestApp_sInternalTestAppIdentifiers;
  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v3, "containsObject:", v4);

  return (char)v3;
}

void __27__GKGame_isInternalTestApp__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MEMORY[0x1E0C99E60];
  v4[0] = CFSTR("com.iosframeworksqa.GameKitTester");
  v4[1] = CFSTR("com.iosframeworksqa.GKTester2");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)isInternalTestApp_sInternalTestAppIdentifiers;
  isInternalTestApp_sInternalTestAppIdentifiers = v2;

}

- (BOOL)isNewsApp
{
  void *v2;
  BOOL v3;

  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[GKGame isNewsApp:](GKGame, "isNewsApp:", v2);

  return v3;
}

+ (id)currentGame
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __21__GKGame_currentGame__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (currentGame_sDispatchOnceToken != -1)
    dispatch_once(&currentGame_sDispatchOnceToken, block);
  return (id)currentGame_sCurrentGame;
}

void __21__GKGame_currentGame__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "createNonStaticCurrentGame");
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)currentGame_sCurrentGame;
  currentGame_sCurrentGame = v1;

}

+ (id)createNonStaticCurrentGame
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  GKGame *v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKInternalRepresentation internalRepresentation](GKGameInternal, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleIdentifier:", v4);

  objc_msgSend(v2, "_gkBundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBundleVersion:", v5);

  objc_msgSend(v2, "_gkBundleShortVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShortBundleVersion:", v6);

  objc_msgSend(v2, "_gkLocalizedName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setName:", v7);

  objc_msgSend(v3, "setPlatform:", +[GKGameDescriptor currentPlatform](GKGameDescriptor, "currentPlatform"));
  v8 = -[GKGame initWithInternalRepresentation:]([GKGame alloc], "initWithInternalRepresentation:", v3);

  return v8;
}

+ (id)currentGameIncludingGameCenter:(BOOL)a3
{
  NSObject *v4;
  id v5;

  if (currentGameIncludingGameCenter__sDispatchOnceToken != -1)
    dispatch_once(&currentGameIncludingGameCenter__sDispatchOnceToken, &__block_literal_global_10);
  if (currentGameIncludingGameCenter__isGameCenter && !a3)
  {
    v4 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v5 = GKOSLoggers();
      v4 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      +[GKGame currentGameIncludingGameCenter:].cold.1(v4);
  }
  return (id)currentGameIncludingGameCenter__sCurrentGame;
}

void __41__GKGame_currentGameIncludingGameCenter___block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  GKGame *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  +[GKInternalRepresentation internalRepresentation](GKGameInternal, "internalRepresentation");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBundleIdentifier:", v1);

  objc_msgSend(v8, "_gkBundleVersion");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBundleVersion:", v2);

  objc_msgSend(v8, "_gkBundleShortVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setShortBundleVersion:", v3);

  objc_msgSend(v8, "_gkLocalizedName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setName:", v4);

  objc_msgSend(v0, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentGameIncludingGameCenter__isGameCenter = objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.gamecenter"));

  objc_msgSend(v0, "setPlatform:", +[GKGameDescriptor currentPlatform](GKGameDescriptor, "currentPlatform"));
  v6 = -[GKGame initWithInternalRepresentation:]([GKGame alloc], "initWithInternalRepresentation:", v0);
  v7 = (void *)currentGameIncludingGameCenter__sCurrentGame;
  currentGameIncludingGameCenter__sCurrentGame = (uint64_t)v6;

}

+ (void)setCurrentGameFromInternal:(id)a3 serverEnvironment:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;

  v6 = a3;
  objc_msgSend(v6, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(a1, "currentGame");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEnvironment:", a4);
    objc_msgSend(v8, "setInternal:", v6);

  }
  else
  {
    v9 = os_log_GKGeneral;
    if (!os_log_GKGeneral)
    {
      v10 = GKOSLoggers();
      v9 = os_log_GKGeneral;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      +[GKGame setCurrentGameFromInternal:serverEnvironment:].cold.1((uint64_t)v6, v9, v11);
  }

}

- (GKGame)initWithInternalRepresentation:(id)a3
{
  id v4;
  GKGame *v5;
  GKGame *v6;
  objc_super v8;

  v4 = a3;
  if (!v4)
  {
    +[GKInternalRepresentation internalRepresentation](GKGameInternal, "internalRepresentation");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8.receiver = self;
  v8.super_class = (Class)GKGame;
  v5 = -[GKGame init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeStrong((id *)&v5->_internal, v4);

  return v6;
}

- (GKGame)init
{
  void *v3;
  GKGame *v4;

  +[GKInternalRepresentation internalRepresentation](GKGameInternal, "internalRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[GKGame initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v3);

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (GKGame)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  GKGame *v6;
  GKGame *v7;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("internal"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[GKGame initWithInternalRepresentation:](self, "initWithInternalRepresentation:", v5);
  if (v6)
  {
    v6->_environment = objc_msgSend(v4, "decodeIntegerForKey:", CFSTR("environment"));
    v7 = v6;
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[GKGame internal](self, "internal");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v4, CFSTR("internal"));

  objc_msgSend(v5, "encodeInteger:forKey:", -[GKGame environment](self, "environment"), CFSTR("environment"));
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKGame internal](self, "internal");
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
    -[GKGame internal](self, "internal");
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

- (id)description
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)GKGame;
  -[GKGame description](&v13, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGame bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGame adamID](self, "adamID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGame shortBundleVersion](self, "shortBundleVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGame bundleVersion](self, "bundleVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGame externalVersion](self, "externalVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGame name](self, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[GKGame name](self, "name");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("bundleID:%@ adamID:%@ shortBundleVersion:%@ bundleVersion:%@ externalVersion:%@ (%@)"), v4, v5, v6, v7, v8, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("bundleID:%@ adamID:%@ shortBundleVersion:%@ bundleVersion:%@ externalVersion:%@ (%@)"), v4, v5, v6, v7, v8, CFSTR("<no metadata>"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (GKGameDescriptor)gameDescriptor
{
  void *v2;
  void *v3;

  -[GKGame internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "gameDescriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (GKGameDescriptor *)v3;
}

- (NSDictionary)gameDescriptorDictionary
{
  void *v2;
  void *v3;

  -[GKGame internal](self, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "serverRepresentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (GKGameInfo)gameInfo
{
  GKGameInfo *result;
  id v5;

  retstr->var11 = 0;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var9 = 0u;
  -[GKGame internal](self, "internal");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  retstr->var0 = objc_msgSend(v5, "supportsLeaderboards");
  retstr->var1 = objc_msgSend(v5, "supportsLeaderboardSets");
  retstr->var2 = objc_msgSend(v5, "supportsAchievements");
  retstr->var3 = objc_msgSend(v5, "supportsMultiplayer");
  retstr->var5 = objc_msgSend(v5, "isArcadeGame");
  retstr->var6 = objc_msgSend(v5, "supportsChallenges");
  retstr->var7 = objc_msgSend(v5, "hasAggregateLeaderboard");
  retstr->var8 = objc_msgSend(v5, "numberOfCategories");
  retstr->var9 = objc_msgSend(v5, "numberOfLeaderboardSets");
  retstr->var10 = objc_msgSend(v5, "numberOfAchievements");
  retstr->var11 = objc_msgSend(v5, "maxAchievementPoints");
  retstr->var4 = objc_msgSend(v5, "supportsTurnBasedMultiplayer");

  return result;
}

+ (void)loadGamesWithBundleIDs:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKGame.m", 309, "+[GKGame loadGamesWithBundleIDs:withCompletionHandler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "count");
  v10 = MEMORY[0x1E0C809B0];
  if (v9 >= 1)
  {
    v11 = v9;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E75B1BC8;
    v19 = v13;
    v20 = v8;
    v22 = v11;
    v21 = v5;
    v14 = v13;
    objc_msgSend(v20, "perform:", v18);

  }
  if (v6)
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke_3;
    v15[3] = &unk_1E75B1BF0;
    v17 = v6;
    v16 = v8;
    objc_msgSend(v16, "notifyOnMainQueueWithBlock:", v15);

  }
}

void __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E75B1BA0;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(id *)(a1 + 40);
  v9 = *(void **)(a1 + 48);
  v8 = *(_QWORD *)(a1 + 56);
  v12 = v7;
  v15 = v8;
  v13 = v9;
  v14 = v3;
  v10 = v3;
  objc_msgSend(v5, "getGameMetadataForBundleIDs:handler:", v6, v11);

}

void __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  GKGameInternal *v14;
  GKGame *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "setError:", a3);
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", *(_QWORD *)(a1 + 56));
    objc_msgSend(v5, "_gkMapDictionaryWithKeyPath:", CFSTR("bundleIdentifier"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v16 = a1;
    v8 = *(id *)(a1 + 40);
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
          objc_msgSend(v7, "objectForKey:", v13, v16);
          v14 = (GKGameInternal *)objc_claimAutoreleasedReturnValue();
          if (!v14)
          {
            v14 = objc_alloc_init(GKGameInternal);
            -[GKGameDescriptor setBundleIdentifier:](v14, "setBundleIdentifier:", v13);
          }
          v15 = -[GKGame initWithInternalRepresentation:]([GKGame alloc], "initWithInternalRepresentation:", v14);
          objc_msgSend(v6, "addObject:", v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v10);
    }

    a1 = v16;
    objc_msgSend(*(id *)(v16 + 32), "setObject:forKeyedSubscript:", v6, CFSTR("games"));

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __55__GKGame_loadGamesWithBundleIDs_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("games"));
  v3 = objc_claimAutoreleasedReturnValue();
  v6 = (id)v3;
  if (v3)
    v4 = v3;
  else
    v4 = MEMORY[0x1E0C9AA60];
  objc_msgSend(*(id *)(a1 + 32), "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, void *))(v2 + 16))(v2, v4, v5);

}

+ (void)loadTopGamesWithCompletionHandler:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKGame.m", 353, "+[GKGame loadTopGamesWithCompletionHandler:]");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke;
    v12[3] = &unk_1E75B1C80;
    v7 = v5;
    v13 = v7;
    objc_msgSend(v7, "perform:", v12);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke_4;
    v9[3] = &unk_1E75B1BF0;
    v10 = v7;
    v11 = v3;
    v8 = v7;
    objc_msgSend(v8, "notifyOnMainQueueWithBlock:", v9);

  }
}

void __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E75B1C58;
  v8 = *(id *)(a1 + 32);
  v9 = v3;
  v6 = v3;
  objc_msgSend(v5, "getTopGamesWithHandler:", v7);

}

uint64_t __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "_gkMapConcurrentlyWithBlock:", &__block_literal_global_36_0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v7, CFSTR("games"));

  objc_msgSend(*(id *)(a1 + 32), "setError:", v6);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

GKGame *__44__GKGame_loadTopGamesWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  GKGame *v3;

  v2 = a2;
  v3 = -[GKGame initWithInternalRepresentation:]([GKGame alloc], "initWithInternalRepresentation:", v2);

  return v3;
}

void __44__GKGame_loadTopGamesWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  id v4;

  v2 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("games"));
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, void *))(v2 + 16))(v2, v4, v3);

}

+ (void)updateGames:(id)a3 withCompletionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  uint64_t v22;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/GKGame.m", 371, "+[GKGame updateGames:withCompletionHandler:]");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKDispatchGroup dispatchGroupWithName:](GKDispatchGroup, "dispatchGroupWithName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v5, "count");
  v10 = MEMORY[0x1E0C809B0];
  if (v9 >= 1)
  {
    v11 = v9;
    objc_msgSend(v5, "_gkDistinctValuesForKeyPath:", CFSTR("bundleIdentifier"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v18[0] = v10;
    v18[1] = 3221225472;
    v18[2] = __44__GKGame_updateGames_withCompletionHandler___block_invoke;
    v18[3] = &unk_1E75B1BC8;
    v19 = v13;
    v22 = v11;
    v20 = v5;
    v21 = v8;
    v14 = v13;
    objc_msgSend(v21, "perform:", v18);

  }
  if (v6)
  {
    v15[0] = v10;
    v15[1] = 3221225472;
    v15[2] = __44__GKGame_updateGames_withCompletionHandler___block_invoke_3;
    v15[3] = &unk_1E75B1BF0;
    v17 = v6;
    v16 = v8;
    objc_msgSend(v16, "notifyOnMainQueueWithBlock:", v15);

  }
}

void __44__GKGame_updateGames_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "gameServicePrivate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __44__GKGame_updateGames_withCompletionHandler___block_invoke_2;
  v8[3] = &unk_1E75B1BA0;
  v12 = *(_QWORD *)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = *(id *)(a1 + 48);
  v11 = v3;
  v7 = v3;
  objc_msgSend(v5, "getGameMetadataForBundleIDs:handler:", v6, v8);

}

void __44__GKGame_updateGames_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (objc_msgSend(v5, "count"))
  {
    v23 = v6;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", *(_QWORD *)(a1 + 56));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v8 = v5;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v13, "bundleIdentifier");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v7, "setObject:forKey:", v13, v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v10);
    }

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v15 = *(id *)(a1 + 32);
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v25 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * j);
          objc_msgSend(v20, "bundleIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          if (v21)
          {
            objc_msgSend(v7, "objectForKey:", v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            if (v22)
              objc_msgSend(v20, "setInternal:", v22);

          }
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v17);
    }

    v6 = v23;
  }
  objc_msgSend(*(id *)(a1 + 40), "setError:", v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

void __44__GKGame_updateGames_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "error");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

+ (id)instanceMethodSignatureForSelector:(SEL)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___GKGame;
  objc_msgSendSuper2(&v9, sel_instanceMethodSignatureForSelector_);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "instanceMethodSignatureForSelector:", a3);
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
  v10.super_class = (Class)GKGame;
  -[GKGame methodSignatureForSelector:](&v10, sel_methodSignatureForSelector_);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[GKGame forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "methodSignatureForSelector:", a3);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

- (BOOL)respondsToSelector:(SEL)a3
{
  char v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKGame;
  if (-[GKGame respondsToSelector:](&v8, sel_respondsToSelector_))
  {
    v5 = 1;
  }
  else
  {
    -[GKGame forwardingTargetForSelector:](self, "forwardingTargetForSelector:", a3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_opt_respondsToSelector();

  }
  return v5 & 1;
}

+ (BOOL)instancesRespondToSelector:(SEL)a3
{
  int v4;

  if (a3)
  {
    if (class_respondsToSelector((Class)a1, a3))
    {
      LOBYTE(v4) = 1;
    }
    else
    {
      v4 = GKApplicationLinkedOnOrAfter();
      if (v4)
        LOBYTE(v4) = +[GKGameInternal instancesRespondToSelector:](GKGameInternal, "instancesRespondToSelector:", a3);
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)valueForUndefinedKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[GKGame internal](self, "internal");
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
  -[GKGame internal](self, "internal");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValue:forKey:", v7, v6);

}

- (GKGameInternal)internal
{
  return (GKGameInternal *)objc_getProperty(self, a2, 8, 1);
}

- (void)setInternal:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (int64_t)environment
{
  return self->_environment;
}

- (void)setEnvironment:(int64_t)a3
{
  self->_environment = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internal, 0);
}

- (void)getGameMatchesIncludingCompatibleGames:(BOOL)a3 handler:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v4 = a3;
  v6 = a4;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gameStatService");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGame gameDescriptor](self, "gameDescriptor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__GKGame_GKEntitled__getGameMatchesIncludingCompatibleGames_handler___block_invoke;
  v11[3] = &unk_1E75B1C58;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  objc_msgSend(v8, "getRecentMatchesForGameDescriptor:includeCompatibleMultiplayerGames:handler:", v9, v4, v11);

}

void __69__GKGame_GKEntitled__getGameMatchesIncludingCompatibleGames_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  GKGameMatch *v15;
  GKGameMatch *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          v15 = [GKGameMatch alloc];
          v16 = -[GKGameMatch initWithInternalRepresentation:game:](v15, "initWithInternalRepresentation:game:", v14, *(_QWORD *)(a1 + 32), (_QWORD)v18);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v8, v6);

}

- (void)getGameMatchesForLeaderboard:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gameStatService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGame gameDescriptor](self, "gameDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__GKGame_GKEntitled__getGameMatchesForLeaderboard_handler___block_invoke;
  v12[3] = &unk_1E75B1C58;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "getRecentMatchesForGameDescriptor:leaderboardIdentifier:handler:", v10, v7, v12);

}

void __59__GKGame_GKEntitled__getGameMatchesForLeaderboard_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  GKGameMatch *v15;
  GKGameMatch *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          v15 = [GKGameMatch alloc];
          v16 = -[GKGameMatch initWithInternalRepresentation:game:](v15, "initWithInternalRepresentation:game:", v14, *(_QWORD *)(a1 + 32), (_QWORD)v18);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v8, v6);

}

- (void)getGameMatchesForAchievement:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;

  v6 = a4;
  v7 = a3;
  +[GKDaemonProxy proxyForLocalPlayer](GKDaemonProxy, "proxyForLocalPlayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gameStatService");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGame gameDescriptor](self, "gameDescriptor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__GKGame_GKEntitled__getGameMatchesForAchievement_handler___block_invoke;
  v12[3] = &unk_1E75B1C58;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "getRecentMatchesForGameDescriptor:achievementIdentifier:handler:", v10, v7, v12);

}

void __59__GKGame_GKEntitled__getGameMatchesForAchievement_handler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  GKGameMatch *v15;
  GKGameMatch *v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = objc_msgSend(v5, "count");
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v9 = v5;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v13);
          v15 = [GKGameMatch alloc];
          v16 = -[GKGameMatch initWithInternalRepresentation:game:](v15, "initWithInternalRepresentation:game:", v14, *(_QWORD *)(a1 + 32), (_QWORD)v18);
          objc_msgSend(v8, "addObject:", v16);

          ++v13;
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }
  v17 = *(_QWORD *)(a1 + 40);
  if (v17)
    (*(void (**)(uint64_t, void *, id))(v17 + 16))(v17, v8, v6);

}

+ (void)currentGameIncludingGameCenter:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = (void *)MEMORY[0x1E0CB3978];
  v2 = a1;
  objc_msgSend(v1, "callStackSymbols");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, v2, v4, "+[GKGame currentGame] called from Game Center %@.", (uint8_t *)&v5);

}

+ (void)setCurrentGameFromInternal:(uint64_t)a3 serverEnvironment:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_1(&dword_1BCDE3000, a2, a3, "setCurrentGameFromInternal: ignoring -- nil bundleIdentifier :%@", (uint8_t *)&v3);
}

@end
