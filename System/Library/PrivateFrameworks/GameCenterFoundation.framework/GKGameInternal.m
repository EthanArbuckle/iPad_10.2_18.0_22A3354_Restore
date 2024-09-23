@implementation GKGameInternal

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[GKGameDescriptor bundleIdentifier](self, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKGameDescriptor bundleIdentifier](self, "bundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_16 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_16, &__block_literal_global_57);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_16;
}

void __41__GKGameInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[17];
  _QWORD v13[18];

  v13[17] = *MEMORY[0x1E0C80C00];
  v13[0] = objc_opt_class();
  v13[1] = objc_opt_class();
  v13[2] = objc_opt_class();
  v13[3] = objc_opt_class();
  v13[4] = objc_opt_class();
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, objc_opt_class(), 0, CFSTR("bundleIdentifier"), CFSTR("bundleVersion"), CFSTR("adamID"), CFSTR("externalVersion"), CFSTR("name"), CFSTR("icons"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13[5] = v3;
  v12[6] = CFSTR("defaultLeaderboardIdentifier");
  v13[6] = objc_opt_class();
  v12[7] = CFSTR("flags");
  v13[7] = objc_opt_class();
  v12[8] = CFSTR("numberOfLeaderboards");
  v13[8] = objc_opt_class();
  v12[9] = CFSTR("numberOfLeaderboardSets");
  v13[9] = objc_opt_class();
  v12[10] = CFSTR("numberOfAchievements");
  v13[10] = objc_opt_class();
  v12[11] = CFSTR("maxAchievementPoints");
  v13[11] = objc_opt_class();
  v12[12] = CFSTR("shortBundleVersion");
  v13[12] = objc_opt_class();
  v12[13] = CFSTR("platform");
  v13[13] = objc_opt_class();
  v12[14] = CFSTR("compatiblePlatforms");
  v4 = (void *)MEMORY[0x1E0C99E60];
  v5 = objc_opt_class();
  objc_msgSend(v4, "setWithObjects:", v5, objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13[14] = v6;
  v12[15] = CFSTR("supportedTransports");
  v7 = (void *)MEMORY[0x1E0C99E60];
  v8 = objc_opt_class();
  objc_msgSend(v7, "setWithObjects:", v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[15] = v9;
  v12[16] = CFSTR("isArcadeGame");
  v13[16] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 17);
  v10 = objc_claimAutoreleasedReturnValue();

  v11 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_16;
  secureCodedPropertyKeys_sSecureCodedKeys_16 = v10;

}

- (id)description
{
  int64_t v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = -[GKGameDescriptor platform](self, "platform");
  if ((unint64_t)(v3 - 1) > 4)
    v4 = CFSTR("unknown");
  else
    v4 = off_1E75B7CC8[v3 - 1];
  v8.receiver = self;
  v8.super_class = (Class)GKGameInternal;
  -[GKGameDescriptor description](&v8, sel_description);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingFormat:", CFSTR(" (%@)"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)isPrerendered
{
  return *((_BYTE *)&self->_flags.var0 + 1) & 1;
}

- (void)setPrerendered:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 256;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFFFFEFF | v3;
}

- (BOOL)supportsLeaderboards
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 1) & 1;
}

- (void)setSupportsLeaderboards:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 512;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFFFFDFF | v3;
}

- (BOOL)supportsLeaderboardSets
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 2) & 1;
}

- (void)setSupportsLeaderboardSets:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 1024;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFFFFBFF | v3;
}

- (BOOL)hasAggregateLeaderboard
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 3) & 1;
}

- (void)setHasAggregateLeaderboard:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 2048;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFFFF7FF | v3;
}

- (BOOL)supportsAchievements
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 4) & 1;
}

- (void)setSupportsAchievements:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 4096;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFFFEFFF | v3;
}

- (BOOL)supportsMultiplayer
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 5) & 1;
}

- (void)setSupportsMultiplayer:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x2000;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFFFDFFF | v3;
}

- (BOOL)canBeIndexed
{
  return -[GKGameInternal supportsAchievements](self, "supportsAchievements")
      || -[GKGameInternal supportsLeaderboards](self, "supportsLeaderboards")
      || -[GKGameInternal supportsLeaderboardSets](self, "supportsLeaderboardSets")
      || -[GKGameInternal supportsMultiplayer](self, "supportsMultiplayer")
      || -[GKGameInternal supportsTurnBasedMultiplayer](self, "supportsTurnBasedMultiplayer");
}

- (BOOL)isValid
{
  return (*((unsigned __int8 *)&self->_flags.var0 + 1) >> 6) & 1;
}

- (void)setValid:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x4000;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFFFBFFF | v3;
}

- (BOOL)supportsTurnBasedMultiplayer
{
  return BYTE2(self->_flags._value) & 1;
}

- (void)setSupportsTurnBasedMultiplayer:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x10000;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFFEFFFF | v3;
}

- (unsigned)flags
{
  return self->_flags._value;
}

- (void)setFlags:(unsigned int)a3
{
  self->_flags._value = a3;
}

- (GKGameDescriptor)gameDescriptor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[GKGameDescriptor bundleIdentifier](self, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameDescriptor bundleVersion](self, "bundleVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameDescriptor shortBundleVersion](self, "shortBundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameDescriptor adamID](self, "adamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[GKGameDescriptor gameDescriptorWithBundleID:bundleVersion:shortBundleVersion:adamID:](GKGameDescriptor, "gameDescriptorWithBundleID:bundleVersion:shortBundleVersion:adamID:", v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[GKGameDescriptor externalVersion](self, "externalVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExternalVersion:", v8);

  objc_msgSend(v7, "setPlatform:", -[GKGameDescriptor platform](self, "platform"));
  return (GKGameDescriptor *)v7;
}

- (BOOL)isArcadeGame
{
  return (BYTE2(self->_flags._value) >> 1) & 1;
}

- (BOOL)supportsChallenges
{
  void *v2;
  unsigned int value;
  BOOL v5;

  value = self->_flags._value;
  if ((value & 0x40000) == 0)
  {
    +[GKPreferences shared](GKPreferences, "shared");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v2, "supportsChallenges"))
    {
      v5 = 0;
      goto LABEL_9;
    }
  }
  if (-[GKGameInternal supportsLeaderboards](self, "supportsLeaderboards")
    || -[GKGameInternal supportsLeaderboardSets](self, "supportsLeaderboardSets"))
  {
    v5 = 1;
    if ((value & 0x40000) != 0)
      return v5;
    goto LABEL_9;
  }
  v5 = -[GKGameInternal supportsAchievements](self, "supportsAchievements");
  if ((value & 0x40000) == 0)
LABEL_9:

  return v5;
}

- (void)setIsArcadeGame:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x20000;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFFDFFFF | v3;
}

- (void)setSupportsChallenges:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x40000;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFFBFFFF | v3;
}

- (BOOL)supportsLeaderboardChallenges
{
  return (BYTE2(self->_flags._value) >> 3) & 1;
}

- (void)setSupportsLeaderboardChallenges:(BOOL)a3
{
  int v3;

  if (a3)
    v3 = 0x80000;
  else
    v3 = 0;
  self->_flags._value = self->_flags._value & 0xFFF7FFFF | v3;
}

+ (id)createGamedGameInternal
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setBundleIdentifier:", CFSTR("com.apple.gamed"));
  objc_msgSend(v2, "setName:", CFSTR("gamed"));
  return v2;
}

+ (id)createGameControllerDaemonGameInternal
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setBundleIdentifier:", CFSTR("com.apple.GameController.gamecontrollerd"));
  objc_msgSend(v2, "setName:", CFSTR("gamecontrollerd"));
  return v2;
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (NSDictionary)icons
{
  return self->_icons;
}

- (void)setIcons:(id)a3
{
  objc_storeStrong((id *)&self->_icons, a3);
}

- (NSString)defaultLeaderboardIdentifier
{
  return self->_defaultLeaderboardIdentifier;
}

- (void)setDefaultLeaderboardIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_defaultLeaderboardIdentifier, a3);
}

- (unsigned)numberOfLeaderboards
{
  return self->_numberOfLeaderboards;
}

- (void)setNumberOfLeaderboards:(unsigned __int16)a3
{
  self->_numberOfLeaderboards = a3;
}

- (unsigned)numberOfLeaderboardSets
{
  return self->_numberOfLeaderboardSets;
}

- (void)setNumberOfLeaderboardSets:(unsigned __int16)a3
{
  self->_numberOfLeaderboardSets = a3;
}

- (unsigned)numberOfAchievements
{
  return self->_numberOfAchievements;
}

- (void)setNumberOfAchievements:(unsigned __int16)a3
{
  self->_numberOfAchievements = a3;
}

- (unsigned)maxAchievementPoints
{
  return self->_maxAchievementPoints;
}

- (void)setMaxAchievementPoints:(unsigned __int16)a3
{
  self->_maxAchievementPoints = a3;
}

- (NSSet)compatiblePlatforms
{
  return self->_compatiblePlatforms;
}

- (void)setCompatiblePlatforms:(id)a3
{
  objc_storeStrong((id *)&self->_compatiblePlatforms, a3);
}

- (NSSet)supportedTransports
{
  return self->_supportedTransports;
}

- (void)setSupportedTransports:(id)a3
{
  objc_storeStrong((id *)&self->_supportedTransports, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supportedTransports, 0);
  objc_storeStrong((id *)&self->_compatiblePlatforms, 0);
  objc_storeStrong((id *)&self->_defaultLeaderboardIdentifier, 0);
  objc_storeStrong((id *)&self->_icons, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (NSURL)storeURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E98];
  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKGameDescriptor adamID](self, "adamID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("https://apps.apple.com/app/id%@"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v6;
}

- (id)storeItemURLForURL:(id)a3 gamePlatform:(int64_t)a4 extraQueryParams:(id)a5
{
  id v7;
  id v8;
  const __CFString *v9;
  id v10;
  void *v11;
  void *v12;

  v7 = a3;
  v8 = a5;
  switch(a4)
  {
    case 1:
    case 3:
    case 5:
      v9 = CFSTR("itunes");
      goto LABEL_4;
    case 2:
      v9 = CFSTR("macappstore");
LABEL_4:
      objc_msgSend(v7, "_gkURLByReplacingSchemeWithScheme:", v9);
      v10 = (id)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v10 = v7;
      break;
  }
  v11 = v10;
  objc_msgSend(v10, "_gkURLByAddingQueryParameters:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)storeItemURLForGamePlatform:(int64_t)a3 withContext:(id)a4 withHandler:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD);
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint8_t v15[16];

  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD))a5;
  if (!os_log_GKGeneral)
    v10 = GKOSLoggers();
  v11 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v15 = 0;
    _os_log_impl(&dword_1BCDE3000, v11, OS_LOG_TYPE_INFO, "GKGameInternal: storeItemURLForGamePlatform:", v15, 2u);
  }
  -[GKGameInternal storeURL](self, "storeURL");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    if (a3 == 3)
    {
      objc_msgSend(v12, "_gkURLByReplacingSchemeWithScheme:", CFSTR("com.apple.TVAppStore"));
      v14 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v14;
    }
    v9[2](v9, v13, 0);
  }

}

@end
