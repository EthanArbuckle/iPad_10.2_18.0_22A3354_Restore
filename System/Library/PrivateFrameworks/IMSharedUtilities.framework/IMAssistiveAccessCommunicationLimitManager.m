@implementation IMAssistiveAccessCommunicationLimitManager

+ (IMAssistiveAccessCommunicationLimitManager)sharedManager
{
  if (qword_1ECFC7148 != -1)
    dispatch_once(&qword_1ECFC7148, &unk_1E3FB3BA8);
  return (IMAssistiveAccessCommunicationLimitManager *)(id)qword_1ECFC6F78;
}

- (BOOL)isAssistiveAccessRunning
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D10780], "sharedSystemShellSwitcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isClarityBoardEnabled");

  return v3;
}

- (BOOL)_shouldFilterMessagesForCommunicationLimit:(id)a3
{
  id v4;
  BOOL v5;
  NSObject *v6;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[IMAssistiveAccessCommunicationLimitManager isAssistiveAccessRunning](self, "isAssistiveAccessRunning"))
  {
LABEL_9:
    v5 = 0;
    goto LABEL_10;
  }
  if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D10738]) & 1) == 0
    && (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D10720]) & 1) == 0)
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D10730]) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0D10750], "commonLog");
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v8 = 138412290;
        v9 = v4;
        _os_log_impl(&dword_19E239000, v6, OS_LOG_TYPE_DEFAULT, "Unhandled Messages communication limit: %@", (uint8_t *)&v8, 0xCu);
      }

    }
    goto LABEL_9;
  }
  v5 = 1;
LABEL_10:

  return v5;
}

- (BOOL)shouldFilterIncomingMessages
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D10760], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "incomingCommunicationLimit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMAssistiveAccessCommunicationLimitManager _shouldFilterMessagesForCommunicationLimit:](self, "_shouldFilterMessagesForCommunicationLimit:", v4);

  return (char)self;
}

- (BOOL)shouldFilterOutgoingMessages
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0D10760], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "outgoingCommunicationLimit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMAssistiveAccessCommunicationLimitManager _shouldFilterMessagesForCommunicationLimit:](self, "_shouldFilterMessagesForCommunicationLimit:", v4);

  return (char)self;
}

- (NSArray)favoriteHandleStrings
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  -[IMAssistiveAccessCommunicationLimitManager _selectedContactFavoritesEntries](self, "_selectedContactFavoritesEntries");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = sub_19E2F6AA4;
  v6[3] = &unk_1E3FB8838;
  v6[4] = self;
  objc_msgSend(v3, "__imArrayByApplyingBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v4;
}

- (BOOL)_allowsHandleIDs:(id)a3 forCommunicationLimit:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (-[IMAssistiveAccessCommunicationLimitManager _shouldFilterMessagesForCommunicationLimit:](self, "_shouldFilterMessagesForCommunicationLimit:", v7))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v19;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v19 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          +[IMContactStore sharedInstance](IMContactStore, "sharedInstance", (_QWORD)v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "fetchCNContactForHandleWithID:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v14) = -[IMAssistiveAccessCommunicationLimitManager _isAllowedContact:forCommunicationLimit:](self, "_isAllowedContact:forCommunicationLimit:", v15, v7);
          if (!(_DWORD)v14)
          {
            v16 = 0;
            goto LABEL_13;
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        if (v10)
          continue;
        break;
      }
    }
    v16 = 1;
LABEL_13:

  }
  else
  {
    v16 = 1;
  }

  return v16;
}

- (BOOL)allowsConversationWithHandleIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D10760];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "incomingCommunicationLimit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMAssistiveAccessCommunicationLimitManager _allowsHandleIDs:forCommunicationLimit:](self, "_allowsHandleIDs:forCommunicationLimit:", v5, v7);

  return (char)self;
}

- (BOOL)allowsSendingToHandleIDs:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0D10760];
  v5 = a3;
  objc_msgSend(v4, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "outgoingCommunicationLimit");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[IMAssistiveAccessCommunicationLimitManager _allowsHandleIDs:forCommunicationLimit:](self, "_allowsHandleIDs:forCommunicationLimit:", v5, v7);

  return (char)self;
}

- (BOOL)_isAllowedContact:(id)a3 forCommunicationLimit:(id)a4
{
  id v6;
  id v7;
  BOOL v8;

  v6 = a3;
  v7 = a4;
  v8 = +[IMContactStore isCNContactAKnownContact:](IMContactStore, "isCNContactAKnownContact:", v6)
    && (!objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0D10738])
     || -[IMAssistiveAccessCommunicationLimitManager _isSelectedContact:](self, "_isSelectedContact:", v6));

  return v8;
}

- (BOOL)_isSelectedContact:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[IMAssistiveAccessCommunicationLimitManager _selectedContactFavoritesEntries](self, "_selectedContactFavoritesEntries", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "identifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "contactProperty");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "contact");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "identifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v10, "isEqual:", v13);

        if ((v14 & 1) != 0)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)_selectedContactFavoritesEntries
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[IMAssistiveAccessCommunicationLimitManager favorites](self, "favorites");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0C972F8]);
    +[IMContactStore sharedInstance](IMContactStore, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getContactStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v4, "initWithContactStore:", v6);
    -[IMAssistiveAccessCommunicationLimitManager setFavorites:](self, "setFavorites:", v7);

  }
  -[IMAssistiveAccessCommunicationLimitManager favorites](self, "favorites");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "entries");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "__imArrayByFilteringWithBlock:", &unk_1E3FB4768);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)_handleStringForFavoritesEntry:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  objc_msgSend(a3, "contactProperty");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "key");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C967C0]))
  {
    objc_msgSend(v3, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedStringValue");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C966A8]))
  {
    objc_msgSend(v3, "value");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1E3FBBA48;
  }

  return v6;
}

- (CNFavorites)favorites
{
  return self->_favorites;
}

- (void)setFavorites:(id)a3
{
  objc_storeStrong((id *)&self->_favorites, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favorites, 0);
}

@end
