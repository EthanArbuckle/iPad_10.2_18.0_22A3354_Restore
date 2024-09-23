@implementation DOCTagLocalStorage

void __43__DOCTagLocalStorage_sharedAppGroupStorage__block_invoke()
{
  DOCTagLocalStorage *v0;
  void *v1;

  v0 = objc_alloc_init(DOCTagLocalStorage);
  v1 = (void *)sharedAppGroupStorage_shared;
  sharedAppGroupStorage_shared = (uint64_t)v0;

}

- (DOCTagLocalStorage)init
{
  DOCTagLocalStorage *v2;
  uint64_t v3;
  NSUserDefaults *userDefaults;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DOCTagLocalStorage;
  v2 = -[DOCTagLocalStorage init](&v6, sel_init);
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCF50]), "initWithSuiteName:", CFSTR("com.apple.DocumentManager.defaults"));
  userDefaults = v2->_userDefaults;
  v2->_userDefaults = (NSUserDefaults *)v3;

  return v2;
}

+ (id)sharedAppGroupStorage
{
  if (sharedAppGroupStorage_onceToken != -1)
    dispatch_once(&sharedAppGroupStorage_onceToken, &__block_literal_global_206);
  return (id)sharedAppGroupStorage_shared;
}

- (int64_t)tagSerialNumber
{
  void *v2;
  int64_t v3;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("FinderTagSerialNumber"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (NSOrderedSet)discoveredTags
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("FinderTagsDiscovered"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagLocalStorage _unarchivedTagsFromData:](self, "_unarchivedTagsFromData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = v4;
  else
    v6 = objc_alloc_init(MEMORY[0x24BDBCEE0]);
  v7 = v6;

  return (NSOrderedSet *)v7;
}

- (NSOrderedSet)userTags
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;

  -[NSUserDefaults objectForKey:](self->_userDefaults, "objectForKey:", CFSTR("FinderTagsUser"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DOCTagLocalStorage _unarchivedTagsFromData:](self, "_unarchivedTagsFromData:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    +[DOCTag tagsLoadedFromUserDefaults](DOCTag, "tagsLoadedFromUserDefaults");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSOrderedSet *)v7;
}

- (id)_unarchivedTagsFromData:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (!v3)
  {
    v15 = 0;
    goto LABEL_12;
  }
  v4 = objc_alloc(MEMORY[0x24BDBCF20]);
  v5 = (void *)objc_msgSend(v4, "initWithObjects:", objc_msgSend(MEMORY[0x24BDBCF00], "classForKeyedUnarchiver"), objc_opt_class(), 0);
  v26 = 0;
  objc_msgSend(MEMORY[0x24BDD1620], "unarchivedObjectOfClasses:fromData:error:", v5, v3, &v26);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v26;
  if (v7)
  {
    v8 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v8 = docLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DOCTagLocalStorage _unarchivedTagsFromData:].cold.1((uint64_t)v7, v8, v9, v10, v11, v12, v13, v14);
    v15 = 0;
LABEL_8:
    v16 = v5;
LABEL_9:

    v6 = v16;
    v5 = v7;
    goto LABEL_10;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v16 = v6;
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v23;
      while (2)
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v23 != v20)
            objc_enumerationMutation(v16);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            v15 = 0;
            v7 = v5;
            goto LABEL_9;
          }
        }
        v19 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        if (v19)
          continue;
        break;
      }
    }

    v15 = v16;
    goto LABEL_8;
  }
  v15 = 0;
LABEL_10:

LABEL_12:
  return v15;
}

- (void)setTagSerialNumber:(int64_t)a3
{
  NSUserDefaults *userDefaults;
  id v4;

  userDefaults = self->_userDefaults;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSUserDefaults setObject:forKey:](userDefaults, "setObject:forKey:", v4, CFSTR("FinderTagSerialNumber"));

}

- (void)setUserTags:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v5)
  {
    v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DOCTagLocalStorage setUserTags:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v4, CFSTR("FinderTagsUser"));
  }

}

- (void)setDiscoveredTags:(id)a3
{
  void *v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;

  v13 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", a3, 1, &v13);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v13;
  if (v5)
  {
    v6 = docLogHandle;
    if (!docLogHandle)
    {
      DOCInitLogging();
      v6 = docLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DOCTagLocalStorage setDiscoveredTags:].cold.1((uint64_t)v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else
  {
    -[NSUserDefaults setObject:forKey:](self->_userDefaults, "setObject:forKey:", v4, CFSTR("FinderTagsDiscovered"));
  }

}

- (NSUserDefaults)userDefaults
{
  return self->_userDefaults;
}

- (void)setUserDefaults:(id)a3
{
  objc_storeStrong((id *)&self->_userDefaults, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefaults, 0);
}

- (void)_unarchivedTagsFromData:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2090A2000, a2, a3, "Failed to create unarchiver for tags from data %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setUserTags:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2090A2000, a2, a3, "Failed to archive tags: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)setDiscoveredTags:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2090A2000, a2, a3, "Failed to archive discovered tags: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
