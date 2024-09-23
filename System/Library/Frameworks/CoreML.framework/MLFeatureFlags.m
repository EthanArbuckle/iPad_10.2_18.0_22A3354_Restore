@implementation MLFeatureFlags

- (void)defineFeatures
{
  -[MLFeatureFlags addFeature:withControlName:defaultValue:](self, "addFeature:withControlName:defaultValue:", CFSTR("MPSGraph"), CFSTR("MPSGraph"), 1);
  -[MLFeatureFlags addFeature:withControlName:defaultValue:](self, "addFeature:withControlName:defaultValue:", CFSTR("MPSGraphFP16"), CFSTR("MPSGraphFP16"), 0);
}

- (BOOL)isMPSGraphEnabled
{
  return -[MLFeatureFlags isFeatureEnabled:](self, "isFeatureEnabled:", CFSTR("MPSGraph"));
}

- (BOOL)isMPSGraphFP16Enabled
{
  return -[MLFeatureFlags isFeatureEnabled:](self, "isFeatureEnabled:", CFSTR("MPSGraphFP16"));
}

- (MLFeatureFlags)init
{
  MLFeatureFlags *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  NSMutableDictionary *v5;
  NSMutableDictionary *flags;
  NSMutableDictionary *v7;
  NSMutableDictionary *overrideOriginalValues;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MLFeatureFlags;
  v2 = -[MLFeatureFlags init](&v10, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v3 = objc_claimAutoreleasedReturnValue();
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = (NSUserDefaults *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    flags = v2->_flags;
    v2->_flags = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    overrideOriginalValues = v2->_overrideOriginalValues;
    v2->_overrideOriginalValues = v7;

    -[MLFeatureFlags defineFeatures](v2, "defineFeatures");
  }
  return v2;
}

- (void)addFeature:(id)a3 withControlName:(id)a4 defaultValue:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];

  v5 = a5;
  v16[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a3;
  -[MLFeatureFlags flags](self, "flags");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setValue:forKey:", v8, v9);

  -[MLFeatureFlags controlKeyForFeature:](self, "controlKeyForFeature:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[MLFeatureFlags userDefaults](self, "userDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v11;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "registerDefaults:", v14);

}

- (BOOL)isFeatureEnabled:(id)a3
{
  MLFeatureFlags *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;

  v3 = self;
  -[MLFeatureFlags controlKeyForFeature:](self, "controlKeyForFeature:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "environment");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      if ((objc_msgSend(v7, "isEqualToString:", CFSTR("1")) & 1) != 0)
      {
        LOBYTE(v3) = 1;
      }
      else
      {
        v9 = objc_msgSend(v7, "isEqualToString:", CFSTR("YES"));
        LODWORD(v3) = v9 | objc_msgSend(v7, "isEqualToString:", CFSTR("true"));
      }
    }
    else
    {
      -[MLFeatureFlags userDefaults](v3, "userDefaults");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v3) = objc_msgSend(v8, "BOOLForKey:", v4);

    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }

  return (char)v3;
}

- (id)controlKeyForFeature:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MLFeatureFlags flags](self, "flags");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("features.%@"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)setOverride:(BOOL)a3 forFeature:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  const char *v14;

  v4 = a3;
  -[MLFeatureFlags controlKeyForFeature:](self, "controlKeyForFeature:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "environment");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[MLFeatureFlags overrideOriginalValues](self, "overrideOriginalValues");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v6);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        -[MLFeatureFlags overrideOriginalValues](self, "overrideOriginalValues");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setValue:forKey:", v9, v6);

      }
    }
    v13 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    if (v4)
      v14 = "1";
    else
      v14 = "0";
    setenv(v13, v14, 1);

  }
  return v6 != 0;
}

- (BOOL)removeOverrideForFeature:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  const char *v7;

  -[MLFeatureFlags controlKeyForFeature:](self, "controlKeyForFeature:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[MLFeatureFlags overrideOriginalValues](self, "overrideOriginalValues");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (const char *)objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
    if (v6)
      setenv(v7, (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String"), 1);
    else
      unsetenv(v7);

  }
  return v4 != 0;
}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (NSMutableDictionary)flags
{
  return self->_flags;
}

- (NSMutableDictionary)overrideOriginalValues
{
  return self->_overrideOriginalValues;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideOriginalValues, 0);
  objc_storeStrong((id *)&self->_flags, 0);
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

+ (id)sharedFeatureFlags
{
  if (sharedFeatureFlags_onceToken != -1)
    dispatch_once(&sharedFeatureFlags_onceToken, &__block_literal_global_21254);
  return (id)sharedFeatureFlags_s_featureFlags;
}

void __36__MLFeatureFlags_sharedFeatureFlags__block_invoke()
{
  MLFeatureFlags *v0;
  void *v1;

  v0 = objc_alloc_init(MLFeatureFlags);
  v1 = (void *)sharedFeatureFlags_s_featureFlags;
  sharedFeatureFlags_s_featureFlags = (uint64_t)v0;

}

@end
