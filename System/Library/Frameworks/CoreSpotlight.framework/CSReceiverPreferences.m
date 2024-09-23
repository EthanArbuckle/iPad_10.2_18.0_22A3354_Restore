@implementation CSReceiverPreferences

- (CSReceiverPreferences)init
{
  CSReceiverPreferences *v2;
  CSReceiverPreferences *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSReceiverPreferences;
  v2 = -[CSReceiverPreferences init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CoreSpotlightPreferences setState_key:](v2, "setState_key:", CFSTR("CSReceiverBundleIdentifierState"));
    -[CoreSpotlightPreferences setNotification_key:](v3, "setNotification_key:", "com.apple.corespotlight.receiver.bundle.changed");
  }
  return v3;
}

- (NSDictionary)dictionary
{
  __CFString *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  -[CoreSpotlightPreferences state_key](self, "state_key");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)CFPreferencesCopyValue(v2, CFSTR("com.apple.corespotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v5 = (id)MEMORY[0x1E0C9AA70];
    return (NSDictionary *)v5;
  }
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  v7 = (uint64_t)v5;
  if (v6)
  {
    v8 = v6;
    v9 = 0;
    v10 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v10)
          objc_enumerationMutation(v5);
        v12 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[CSXPCConnection appIdentifierFromTeamAppTuple:](CSXPCConnection, "appIdentifierFromTeamAppTuple:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v13, "length"))
          {
            objc_msgSend(v4, "removeObjectForKey:", v12);
            objc_msgSend(v4, "objectForKeyedSubscript:", v13);
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v14)
            {
              objc_msgSend(v5, "objectForKeyedSubscript:", v12);
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v13);

            }
            v9 = 1;
          }

        }
        else
        {
          objc_msgSend(v4, "removeObjectForKey:", v12, (_QWORD)v17);
          v9 = 1;
        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);

    if ((v9 & 1) == 0)
      goto LABEL_19;
    v7 = objc_msgSend(v4, "copy");
  }

  v5 = (id)v7;
LABEL_19:

  return (NSDictionary *)v5;
}

- (void)disableBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    -[CSReceiverPreferences dictionary](self, "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v5, "BOOLValue"))
    {
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v7);
      -[CoreSpotlightPreferences saveState:](self, "saveState:", v6);

    }
  }

}

- (void)enableBundleIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    -[CSReceiverPreferences dictionary](self, "dictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend(v5, "BOOLValue") & 1) == 0)
    {
      v6 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v7);
      -[CoreSpotlightPreferences saveState:](self, "saveState:", v6);

    }
  }

}

@end
