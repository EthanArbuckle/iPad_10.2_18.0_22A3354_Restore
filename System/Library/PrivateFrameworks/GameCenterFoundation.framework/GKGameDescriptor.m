@implementation GKGameDescriptor

+ (GKGameDescriptor)gameDescriptorWithBundleID:(id)a3 bundleVersion:(id)a4 shortBundleVersion:(id)a5 adamID:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  GKGameDescriptor *v14;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = objc_alloc_init(GKGameDescriptor);
  -[GKGameDescriptor setBundleIdentifier:](v14, "setBundleIdentifier:", v13);

  -[GKGameDescriptor setBundleVersion:](v14, "setBundleVersion:", v12);
  -[GKGameDescriptor setShortBundleVersion:](v14, "setShortBundleVersion:", v11);

  -[GKGameDescriptor setAdamID:](v14, "setAdamID:", v10);
  -[GKGameDescriptor setPlatform:](v14, "setPlatform:", objc_msgSend(a1, "currentPlatform"));
  return v14;
}

+ (int64_t)gamePlatformFromServerGameDescriptorString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ios")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("xros")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("macos")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("appletvos")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("watchos")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)gamePlatformFromServerPushString:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("i")) & 1) != 0)
  {
    v4 = 1;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("r")) & 1) != 0)
  {
    v4 = 5;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("m")) & 1) != 0)
  {
    v4 = 2;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("t")) & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isEqualToString:", CFSTR("w")))
  {
    v4 = 4;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (int64_t)currentPlatform
{
  return 1;
}

+ (id)currentPlatformServerString
{
  return CFSTR("ios");
}

+ (id)currentPlatformServerPushString
{
  return CFSTR("i");
}

+ (BOOL)supportsPlatform:(int64_t)a3
{
  void *v4;
  void *v5;
  char v6;

  +[GKGameDescriptor supportedPlatforms](GKGameDescriptor, "supportedPlatforms");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "containsObject:", v5);

  return v6;
}

+ (id)supportedPlatforms
{
  return &unk_1E75FAEA8;
}

- (GKGameDescriptor)initWithDictionary:(id)a3
{
  id v4;
  GKGameDescriptor *v5;
  uint64_t v6;
  NSString *bundleIdentifier;
  uint64_t v8;
  NSString *bundleVersion;
  uint64_t v10;
  NSNumber *adamID;
  uint64_t v12;
  NSNumber *externalVersion;
  uint64_t v14;
  NSString *shortBundleVersion;
  void *v16;
  void *v17;
  objc_super v19;

  v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)GKGameDescriptor;
  v5 = -[GKGameDescriptor init](&v19, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle-id"));
    v6 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v6;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("bundle-version"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v5->_bundleVersion;
    v5->_bundleVersion = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("adam-id"));
    v10 = objc_claimAutoreleasedReturnValue();
    adamID = v5->_adamID;
    v5->_adamID = (NSNumber *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("external-version"));
    v12 = objc_claimAutoreleasedReturnValue();
    externalVersion = v5->_externalVersion;
    v5->_externalVersion = (NSNumber *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("short-bundle-version"));
    v14 = objc_claimAutoreleasedReturnValue();
    shortBundleVersion = v5->_shortBundleVersion;
    v5->_shortBundleVersion = (NSString *)v14;

    v16 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("platform"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_platform = objc_msgSend(v16, "gamePlatformFromServerGameDescriptorString:", v17);

  }
  return v5;
}

- (GKGameDescriptor)initWithPushDictionary:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  GKGameDescriptor *v7;
  uint64_t v8;
  NSString *bundleIdentifier;
  uint64_t v10;
  NSString *bundleVersion;
  uint64_t v12;
  NSNumber *adamID;
  uint64_t v14;
  NSString *shortBundleVersion;
  void *v16;
  void *v17;
  objc_super v19;
  uint8_t buf[16];

  v4 = a3;
  if (!os_log_GKGeneral)
    v5 = GKOSLoggers();
  v6 = os_log_GKTrace;
  if (os_log_type_enabled((os_log_t)os_log_GKTrace, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCDE3000, v6, OS_LOG_TYPE_INFO, "GKGameDescriptor: initWithPushDictionary", buf, 2u);
  }
  v19.receiver = self;
  v19.super_class = (Class)GKGameDescriptor;
  v7 = -[GKGameDescriptor init](&v19, sel_init);
  if (v7)
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("i"));
    v8 = objc_claimAutoreleasedReturnValue();
    bundleIdentifier = v7->_bundleIdentifier;
    v7->_bundleIdentifier = (NSString *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("v"));
    v10 = objc_claimAutoreleasedReturnValue();
    bundleVersion = v7->_bundleVersion;
    v7->_bundleVersion = (NSString *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("a"));
    v12 = objc_claimAutoreleasedReturnValue();
    adamID = v7->_adamID;
    v7->_adamID = (NSNumber *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("V"));
    v14 = objc_claimAutoreleasedReturnValue();
    shortBundleVersion = v7->_shortBundleVersion;
    v7->_shortBundleVersion = (NSString *)v14;

    v16 = (void *)objc_opt_class();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("p"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v7->_platform = objc_msgSend(v16, "gamePlatformFromServerPushString:", v17);

  }
  return v7;
}

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_0 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_0, &__block_literal_global_11);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_0;
}

void __43__GKGameDescriptor_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("adamID");
  v3[0] = objc_opt_class();
  v2[1] = CFSTR("externalVersion");
  v3[1] = objc_opt_class();
  v2[2] = CFSTR("bundleIdentifier");
  v3[2] = objc_opt_class();
  v2[3] = CFSTR("bundleVersion");
  v3[3] = objc_opt_class();
  v2[4] = CFSTR("shortBundleVersion");
  v3[4] = objc_opt_class();
  v2[5] = CFSTR("platform");
  v3[5] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_0;
  secureCodedPropertyKeys_sSecureCodedKeys_0 = v0;

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)stringForPlatform:(int64_t)a3
{
  NSObject *v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if ((unint64_t)(a3 - 1) < 5)
    return off_1E75B1F10[a3 - 1];
  v5 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v6 = GKOSLoggers();
    v5 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)MEMORY[0x1E0CB37E8];
    v8 = v5;
    objc_msgSend(v7, "numberWithInteger:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_1BCDE3000, v8, OS_LOG_TYPE_INFO, "No platform string for specified GKGamePlatform value (%@), defaulting to iOS.", (uint8_t *)&v10, 0xCu);

  }
  return CFSTR("ios");
}

- (id)dictionaryForRequest
{
  void *v3;
  void *v4;
  NSNumber *adamID;
  NSNumber *externalVersion;
  NSString *bundleIdentifier;
  NSString *bundleVersion;
  NSString *shortBundleVersion;
  void *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  adamID = self->_adamID;
  if (adamID)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", adamID, CFSTR("adam-id"));
  externalVersion = self->_externalVersion;
  if (externalVersion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", externalVersion, CFSTR("external-version"));
  bundleIdentifier = self->_bundleIdentifier;
  if (bundleIdentifier)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", bundleIdentifier, CFSTR("bundle-id"));
  bundleVersion = self->_bundleVersion;
  if (bundleVersion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", bundleVersion, CFSTR("bundle-version"));
  shortBundleVersion = self->_shortBundleVersion;
  if (shortBundleVersion)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", shortBundleVersion, CFSTR("short-bundle-version"));
  objc_msgSend((id)objc_opt_class(), "stringForPlatform:", -[GKGameDescriptor platform](self, "platform"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v4, "setObject:forKeyedSubscript:", v10, CFSTR("platform"));
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)GKGameDescriptor;
  -[GKInternalRepresentation description](&v12, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameDescriptor bundleIdentifier](self, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameDescriptor bundleVersion](self, "bundleVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameDescriptor adamID](self, "adamID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameDescriptor externalVersion](self, "externalVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKGameDescriptor shortBundleVersion](self, "shortBundleVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[GKGameDescriptor platform](self, "platform"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("bundleIdentifier:%@\nbundleVersion:%@\nadamID:%@\nexternalVersion:%@\nshortBundleVersion:%@\nplatform:%@"), v4, v5, v6, v7, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void)setBundleIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSNumber)adamID
{
  return self->_adamID;
}

- (void)setAdamID:(id)a3
{
  objc_storeStrong((id *)&self->_adamID, a3);
}

- (NSNumber)externalVersion
{
  return self->_externalVersion;
}

- (void)setExternalVersion:(id)a3
{
  objc_storeStrong((id *)&self->_externalVersion, a3);
}

- (NSString)shortBundleVersion
{
  return self->_shortBundleVersion;
}

- (void)setShortBundleVersion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shortBundleVersion, 0);
  objc_storeStrong((id *)&self->_externalVersion, 0);
  objc_storeStrong((id *)&self->_adamID, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
}

@end
