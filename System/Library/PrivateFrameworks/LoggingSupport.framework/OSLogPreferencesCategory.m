@implementation OSLogPreferencesCategory

- (void)reset
{
  void *v3;
  id v4;

  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_resetCategory:", v3);

  }
}

- (void)setSignpostPersisted:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setSignpostPersisted:forCategory:", v3, v5);

  }
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)isLocked
{
  void *v2;
  char v3;

  -[OSLogPreferencesCategory subsystem](self, "subsystem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLocked");

  return v3;
}

- (OSLogPreferencesSubsystem)subsystem
{
  return self->_subsystem;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subsystem, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (OSLogPreferencesCategory)initWithName:(id)a3 subsystem:(id)a4
{
  id v6;
  id v7;
  OSLogPreferencesCategory *v8;
  uint64_t v9;
  NSString *name;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)OSLogPreferencesCategory;
  v8 = -[OSLogPreferencesCategory init](&v12, sel_init);
  if (v8)
  {
    v9 = objc_msgSend(v6, "copy");
    name = v8->_name;
    v8->_name = (NSString *)v9;

    objc_storeStrong((id *)&v8->_subsystem, a4);
  }

  return v8;
}

- (int64_t)effectiveEnabledLevel
{
  int64_t result;
  void *v4;
  int64_t v5;

  result = -[OSLogPreferencesCategory enabledLevel](self, "enabledLevel");
  if (result == 1)
  {
    result = -[OSLogPreferencesCategory defaultEnabledLevel](self, "defaultEnabledLevel");
    if (result == 1)
    {
      -[OSLogPreferencesCategory subsystem](self, "subsystem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "effectiveEnabledLevel");

      return v5;
    }
  }
  return result;
}

- (int64_t)effectivePersistedLevel
{
  int64_t result;
  void *v4;
  int64_t v5;

  result = -[OSLogPreferencesCategory persistedLevel](self, "persistedLevel");
  if (result == 1)
  {
    result = -[OSLogPreferencesCategory defaultPersistedLevel](self, "defaultPersistedLevel");
    if (result == 1)
    {
      -[OSLogPreferencesCategory subsystem](self, "subsystem");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "effectivePersistedLevel");

      return v5;
    }
  }
  return result;
}

- (int64_t)defaultEnabledLevel
{
  void *v3;
  void *v4;
  int64_t v5;

  -[OSLogPreferencesCategory subsystem](self, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogPreferencesCategory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_defaultEnabledLevelForCategory:", v4);

  return v5;
}

- (int64_t)defaultPersistedLevel
{
  void *v3;
  void *v4;
  int64_t v5;

  -[OSLogPreferencesCategory subsystem](self, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogPreferencesCategory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_defaultPersistedLevelForCategory:", v4);

  return v5;
}

- (int64_t)enabledLevel
{
  void *v3;
  void *v4;
  int64_t v5;

  -[OSLogPreferencesCategory subsystem](self, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogPreferencesCategory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_enabledLevelForCategory:", v4);

  return v5;
}

- (int64_t)persistedLevel
{
  void *v3;
  void *v4;
  int64_t v5;

  -[OSLogPreferencesCategory subsystem](self, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogPreferencesCategory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_persistedLevelForCategory:", v4);

  return v5;
}

- (BOOL)signpostEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[OSLogPreferencesCategory subsystem](self, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogPreferencesCategory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_signpostEnabledForCategory:", v4);

  return v5;
}

- (BOOL)signpostPersisted
{
  void *v3;
  void *v4;
  char v5;

  -[OSLogPreferencesCategory subsystem](self, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogPreferencesCategory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_signpostPersistedForCategory:", v4);

  return v5;
}

- (BOOL)signpostBacktracesEnabled
{
  void *v3;
  void *v4;
  char v5;

  -[OSLogPreferencesCategory subsystem](self, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogPreferencesCategory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_signpostBacktracesEnabledForCategory:", v4);

  return v5;
}

- (BOOL)signpostAllowStreaming
{
  void *v3;
  void *v4;
  char v5;

  -[OSLogPreferencesCategory subsystem](self, "subsystem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[OSLogPreferencesCategory name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "_signpostAllowStreamingForCategory:", v4);

  return v5;
}

- (void)setEnabledLevel:(int64_t)a3
{
  void *v5;
  id v6;

  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setEnabledLevel:forCategory:", a3, v5);

  }
}

- (void)setPersistedLevel:(int64_t)a3
{
  void *v5;
  id v6;

  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setPersistedLevel:forCategory:", a3, v5);

  }
}

- (void)setSignpostEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setSignpostEnabled:forCategory:", v3, v5);

  }
}

- (void)setSignpostBacktracesEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setSignpostBacktracesEnabled:forCategory:", v3, v5);

  }
}

- (void)setSignpostAllowStreaming:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  if (!-[OSLogPreferencesCategory isLocked](self, "isLocked"))
  {
    -[OSLogPreferencesCategory subsystem](self, "subsystem");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[OSLogPreferencesCategory name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setSignpostAllowStreaming:forCategory:", v3, v5);

  }
}

@end
