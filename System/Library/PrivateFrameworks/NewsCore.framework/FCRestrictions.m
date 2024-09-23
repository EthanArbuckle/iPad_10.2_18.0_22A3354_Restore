@implementation FCRestrictions

+ (int64_t)integerRepresentationOfShortVersionString:(id)a3
{
  void *v3;
  uint64_t v4;
  unint64_t v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 1000000 * objc_msgSend(v6, "integerValue");

    if (v5 != 1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v7 += 1000 * objc_msgSend(v8, "integerValue");

      if (v5 >= 3)
      {
        objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v7 += objc_msgSend(v9, "integerValue");

      }
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isNewsVersionAllowed:(int64_t)a3
{
  if (a3 < 1)
    return 1;
  if (-[FCRestrictions buildVersionNumber](self, "buildVersionNumber") < 1)
    return 1;
  return -[FCRestrictions buildVersionNumber](self, "buildVersionNumber") >= a3;
}

+ (id)sharedInstance
{
  if (qword_1ED0F7DD8 != -1)
    dispatch_once(&qword_1ED0F7DD8, &__block_literal_global_18);
  return (id)_MergedGlobals_143;
}

void __32__FCRestrictions_sharedInstance__block_invoke()
{
  FCRestrictions *v0;
  void *v1;

  v0 = objc_alloc_init(FCRestrictions);
  v1 = (void *)_MergedGlobals_143;
  _MergedGlobals_143 = (uint64_t)v0;

}

- (FCRestrictions)init
{
  FCRestrictions *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)FCRestrictions;
  v2 = -[FCRestrictions init](&v8, sel_init);
  if (v2)
  {
    v2->_testing = NSClassFromString(CFSTR("XCTest")) != 0;
    FCBundle();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = +[FCRestrictions integerRepresentationOfShortVersionString:](FCRestrictions, "integerRepresentationOfShortVersionString:", v4);
    if (v5 <= 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Build version string is missing or not valid (current value: %@)"), v4);
      *(_DWORD *)buf = 136315906;
      v10 = "-[FCRestrictions init]";
      v11 = 2080;
      v12 = "FCRestrictions.m";
      v13 = 1024;
      v14 = 49;
      v15 = 2114;
      v16 = v7;
      _os_log_error_impl(&dword_1A1B90000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

    }
    v2->_buildVersionNumber = v5;

  }
  return v2;
}

- (BOOL)isExplicitContentAllowed
{
  void *v4;
  char v5;

  if (-[FCRestrictions testing](self, "testing")
    && -[FCRestrictions isExplicitContentAllowedOverride](self, "isExplicitContentAllowedOverride") != -1)
  {
    return -[FCRestrictions isExplicitContentAllowedOverride](self, "isExplicitContentAllowedOverride") == 1;
  }
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isExplicitContentAllowedOutAsk:", 0);

  return v5;
}

- (void)t_startForcingExplicitContentDisallowed
{
  -[FCRestrictions setIsExplicitContentAllowedOverride:](self, "setIsExplicitContentAllowedOverride:", 0);
}

- (void)t_stopForcingExplicitContentDisallowed
{
  -[FCRestrictions setIsExplicitContentAllowedOverride:](self, "setIsExplicitContentAllowedOverride:", -1);
}

- (BOOL)isNewsVersionAllowedWithMinNewsVersion:(int64_t)a3 maxNewsVersion:(int64_t)a4
{
  if (-[FCRestrictions buildVersionNumber](self, "buildVersionNumber") < 1)
    return 1;
  if (-[FCRestrictions buildVersionNumber](self, "buildVersionNumber") >= a3)
    return -[FCRestrictions buildVersionNumber](self, "buildVersionNumber") <= a4;
  return 0;
}

- (BOOL)isContentAllowedInStorefrontID:(id)a3 withAllowedStorefrontIDs:(id)a4 blockedStorefrontIDs:(id)a5
{
  return !-[FCRestrictions isContentBlockedInStorefrontID:withAllowedStorefrontIDs:blockedStorefrontIDs:](self, "isContentBlockedInStorefrontID:withAllowedStorefrontIDs:blockedStorefrontIDs:", a3, a4, a5);
}

- (BOOL)isContentBlockedInStorefrontID:(id)a3 withAllowedStorefrontIDs:(id)a4 blockedStorefrontIDs:(id)a5
{
  id v7;
  id v8;
  int v9;

  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(a5, "containsObject:", v7) & 1) != 0)
  {
    LOBYTE(v9) = 1;
  }
  else if (objc_msgSend(v8, "count"))
  {
    v9 = objc_msgSend(v8, "containsObject:", v7) ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (int64_t)buildVersionNumber
{
  return self->_buildVersionNumber;
}

- (void)setBuildVersionNumber:(int64_t)a3
{
  self->_buildVersionNumber = a3;
}

- (BOOL)testing
{
  return self->_testing;
}

- (void)setTesting:(BOOL)a3
{
  self->_testing = a3;
}

- (int64_t)isExplicitContentAllowedOverride
{
  return self->_isExplicitContentAllowedOverride;
}

- (void)setIsExplicitContentAllowedOverride:(int64_t)a3
{
  self->_isExplicitContentAllowedOverride = a3;
}

@end
