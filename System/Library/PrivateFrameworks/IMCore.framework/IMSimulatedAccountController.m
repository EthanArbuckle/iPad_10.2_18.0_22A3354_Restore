@implementation IMSimulatedAccountController

- (void)setSimulatedAccounts:(id)a3 forServiceNamed:(id)a4
{
  -[NSMutableDictionary setObject:forKey:](self->_simulatedAccountsPerService, "setObject:forKey:", a3, a4);
}

- (id)activeAccounts
{
  id v3;
  NSMutableDictionary *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = self->_simulatedAccountsPerService;
  v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKey:](self->_simulatedAccountsPerService, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v8), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObjectsFromArray:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)activeIMessageAccount
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_simulatedAccountsPerService, "objectForKey:", *MEMORY[0x1E0D38F68]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)activeSMSAccount
{
  void *v2;
  void *v3;

  -[NSMutableDictionary objectForKey:](self->_simulatedAccountsPerService, "objectForKey:", *MEMORY[0x1E0D38F58]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (IMSimulatedAccountController)init
{
  IMSimulatedAccountController *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *simulatedAccountsPerService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)IMSimulatedAccountController;
  v2 = -[IMAccountController init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    simulatedAccountsPerService = v2->_simulatedAccountsPerService;
    v2->_simulatedAccountsPerService = v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulatedAccountsPerService, 0);
}

@end
