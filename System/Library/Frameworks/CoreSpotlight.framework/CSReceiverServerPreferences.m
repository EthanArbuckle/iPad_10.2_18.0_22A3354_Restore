@implementation CSReceiverServerPreferences

- (CSReceiverServerPreferences)init
{
  CSReceiverServerPreferences *v2;
  CSReceiverServerPreferences *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CSReceiverServerPreferences;
  v2 = -[CSReceiverServerPreferences init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    -[CoreSpotlightPreferences setState_key:](v2, "setState_key:", CFSTR("CSReceiverServiceIdentifierState"));
    -[CoreSpotlightPreferences setNotification_key:](v3, "setNotification_key:", "com.apple.corespotlight.receiver.service.changed");
  }
  return v3;
}

- (NSSet)disabledServices
{
  void *v3;
  __CFString *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_opt_new();
  -[CoreSpotlightPreferences state_key](self, "state_key");
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)CFPreferencesCopyValue(v4, CFSTR("com.apple.corespotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v5;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            objc_msgSend(v3, "addObject:", v11, (_QWORD)v13);
          ++v10;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
  return (NSSet *)v3;
}

- (void)disableService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    -[CSReceiverServerPreferences disabledServices](self, "disabledServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "containsObject:", v7) & 1) == 0)
    {
      v5 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v5, "addObject:", v7);
      objc_msgSend(v5, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreSpotlightPreferences saveState:](self, "saveState:", v6);

    }
  }

}

- (void)enableService:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (objc_msgSend(v7, "length"))
  {
    -[CSReceiverServerPreferences disabledServices](self, "disabledServices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "containsObject:", v7))
    {
      v5 = (void *)objc_msgSend(v4, "mutableCopy");
      objc_msgSend(v5, "removeObject:", v7);
      objc_msgSend(v5, "allObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[CoreSpotlightPreferences saveState:](self, "saveState:", v6);

    }
  }

}

@end
