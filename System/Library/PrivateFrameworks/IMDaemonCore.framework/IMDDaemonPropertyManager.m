@implementation IMDDaemonPropertyManager

- (NSDictionary)properties
{
  void *v2;
  void *v3;

  -[IMDDaemonPropertyManager mutableProperties](self, "mutableProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (NSDictionary)persistentProperties
{
  void *v2;
  void *v3;

  -[IMDDaemonPropertyManager mutablePersistentProperties](self, "mutablePersistentProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  return (NSDictionary *)v3;
}

- (NSMutableDictionary)mutableProperties
{
  return self->_mutableProperties;
}

- (NSMutableDictionary)mutablePersistentProperties
{
  return self->_mutablePersistentProperties;
}

+ (IMDDaemonPropertyManager)sharedManager
{
  if (qword_1ED9362B8 != -1)
    dispatch_once(&qword_1ED9362B8, &unk_1E922CB88);
  return (IMDDaemonPropertyManager *)(id)qword_1ED9362C8;
}

- (IMDDaemonPropertyManager)init
{
  IMDDaemonPropertyManager *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *mutableProperties;
  NSMutableDictionary *v5;
  NSMutableDictionary *mutablePersistentProperties;
  CFArrayRef v7;
  const __CFArray *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  void *v16;
  const __CFArray *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  objc_super v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v23.receiver = self;
  v23.super_class = (Class)IMDDaemonPropertyManager;
  v2 = -[IMDDaemonPropertyManager init](&v23, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutableProperties = v2->_mutableProperties;
    v2->_mutableProperties = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    mutablePersistentProperties = v2->_mutablePersistentProperties;
    v2->_mutablePersistentProperties = v5;

    v7 = CFPreferencesCopyKeyList((CFStringRef)*MEMORY[0x1E0C9B248], (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    if (-[__CFArray count](v7, "count"))
    {
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v18 = v7;
      v8 = v7;
      v9 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v20;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v20 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v12);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v13, "hasPrefix:", CFSTR("Setting.")))
            {
              v14 = v2->_mutablePersistentProperties;
              MEMORY[0x1D17E9EB8](v13);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "substringFromIndex:", 8);
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v15, v16);

            }
            ++v12;
          }
          while (v10 != v12);
          v10 = -[__CFArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        }
        while (v10);
      }

      v7 = v18;
    }

  }
  return v2;
}

- (void)setValue:(id)a3 ofProperty:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[IMDDaemonPropertyManager mutableProperties](self, "mutableProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, v6);

  if (v10)
  {
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "broadcasterForAllListeners");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "property:changedTo:from:", v6, v10, 0);

  }
}

- (id)valueOfProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMDDaemonPropertyManager mutableProperties](self, "mutableProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3 ofPersistentProperty:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  -[IMDDaemonPropertyManager mutablePersistentProperties](self, "mutablePersistentProperties");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v11, v6);

  objc_msgSend(CFSTR("Setting."), "stringByAppendingString:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    IMSetAppValueForKey();
  else
    IMRemoveAppValueForKey();
  if (v11)
  {
    +[IMDBroadcastController sharedProvider](IMDBroadcastController, "sharedProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "broadcasterForAllListeners");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "persistentProperty:changedTo:from:", v6, v11, 0);

  }
}

- (id)valueOfPersistentProperty:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[IMDDaemonPropertyManager mutablePersistentProperties](self, "mutablePersistentProperties");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setMutableProperties:(id)a3
{
  objc_storeStrong((id *)&self->_mutableProperties, a3);
}

- (void)setMutablePersistentProperties:(id)a3
{
  objc_storeStrong((id *)&self->_mutablePersistentProperties, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mutablePersistentProperties, 0);
  objc_storeStrong((id *)&self->_mutableProperties, 0);
}

@end
