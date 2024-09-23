@implementation GKMultiplayerDataSource

- (void)configureCollectionView:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)GKMultiplayerDataSource;
  v3 = a3;
  -[GKBasicCollectionViewDataSource configureCollectionView:](&v8, sel_configureCollectionView_, v3);
  v4 = objc_opt_class();
  +[GKMultiplayerParticipantCollectionViewCell reuseIdentifier](_TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell, "reuseIdentifier", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v4, v5);

  v6 = objc_opt_class();
  +[GKMultiplayerAddSlotCollectionViewCell reuseIdentifier](_TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell, "reuseIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellWithReuseIdentifier:", v6, v7);

  objc_msgSend(v3, "setContentInsetAdjustmentBehavior:", 2);
}

- (GKMultiplayerDataSource)initWithMetricsPageId:(id)a3
{
  id v5;
  GKMultiplayerDataSource *v6;
  void *v7;
  uint64_t v8;
  NSMutableOrderedSet *players;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSMutableDictionary *playerStatus;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSMutableOrderedSet *orderedPlayerIDList;
  GKMultiplayerParticipant *v20;
  GKMultiplayerParticipant *placeholderItem;
  objc_super v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)GKMultiplayerDataSource;
  v6 = -[GKBasicCollectionViewDataSource init](&v23, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0D25330], "localPlayer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E10]), "initWithObject:", v7);
    players = v6->_players;
    v6->_players = (NSMutableOrderedSet *)v8;

    v10 = objc_alloc(MEMORY[0x1E0C99E08]);
    objc_msgSend(v7, "referenceKey");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v11;
    v25[0] = &unk_1E5A5DFF8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, &v24, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v10, "initWithDictionary:", v12);
    playerStatus = v6->_playerStatus;
    v6->_playerStatus = (NSMutableDictionary *)v13;

    v6->_removingEnabled = 1;
    v6->_invitingEnabled = 1;
    v15 = objc_alloc(MEMORY[0x1E0C99E10]);
    objc_msgSend(v7, "internal");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "playerID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v15, "initWithObject:", v17);
    orderedPlayerIDList = v6->_orderedPlayerIDList;
    v6->_orderedPlayerIDList = (NSMutableOrderedSet *)v18;

    v20 = objc_alloc_init(GKMultiplayerParticipant);
    placeholderItem = v6->_placeholderItem;
    v6->_placeholderItem = v20;

    -[GKMultiplayerParticipant setIsPlaceHolderItem:](v6->_placeholderItem, "setIsPlaceHolderItem:", 1);
    v6->_automatchPlayerCountLock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v6->_pageId, a3);

  }
  return v6;
}

- (id)currentPlayers
{
  return (id)-[NSMutableOrderedSet array](self->_players, "array");
}

- (id)currentPlayersNotInvitedViaMessages
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerDataSource players](self, "players");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__GKMultiplayerDataSource_currentPlayersNotInvitedViaMessages__block_invoke;
  v7[3] = &unk_1E59C69C0;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __62__GKMultiplayerDataSource_currentPlayersNotInvitedViaMessages__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "internal");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "messagesID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

- (id)currentRemotePlayers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[GKMultiplayerDataSource players](self, "players", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isGuestPlayer") & 1) == 0 && (objc_msgSend(v9, "isLocalPlayer") & 1) == 0)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)guestPlayers
{
  void *v2;
  void *v3;

  -[GKMultiplayerDataSource currentPlayers](self, "currentPlayers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_gkGuestPlayersFromPlayers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)playersWithStatus:(int64_t)a3
{
  void *v5;
  NSMutableOrderedSet *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = self->_players;
  v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (-[GKMultiplayerDataSource statusForPlayer:](self, "statusForPlayer:", v11, (_QWORD)v13) == a3)
          objc_msgSend(v5, "addObject:", v11);
      }
      v8 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)connectingPlayers
{
  return -[GKMultiplayerDataSource playersWithStatus:](self, "playersWithStatus:", 6);
}

- (id)readyPlayers
{
  return -[GKMultiplayerDataSource playersWithStatus:](self, "playersWithStatus:", 7);
}

- (id)playersToBeInvited
{
  return -[GKMultiplayerDataSource playersWithStatus:](self, "playersWithStatus:", 11);
}

- (id)playersInvited
{
  return -[GKMultiplayerDataSource playersWithStatus:](self, "playersWithStatus:", 1);
}

- (id)shareplayPrepopulatedPlayers
{
  return -[GKMultiplayerDataSource playersWithStatus:](self, "playersWithStatus:", 20);
}

- (id)shareplayInvitedPlayers
{
  return -[GKMultiplayerDataSource playersWithStatus:](self, "playersWithStatus:", 21);
}

- (BOOL)havePendingPlayers
{
  int v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (-[GKMultiplayerDataSource automatchPlayerCount](self, "automatchPlayerCount") <= 0)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    -[NSMutableDictionary allValues](self->_playerStatus, "allValues", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v3 = 0;
      v7 = *(_QWORD *)v13;
LABEL_5:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v8), "integerValue");
        if (v9 - 1 <= 0x14)
          v3 |= 0x180C21u >> (v9 - 1);
        if (v9 <= 0x15 && ((1 << v9) & 0x301842) != 0)
          break;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v6)
            goto LABEL_5;
          break;
        }
      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3 & 1;
}

- (_NSRange)playerRange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSUInteger minPlayers;
  NSUInteger v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;
  _NSRange result;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GKMultiplayerDataSource participants](self, "participants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (!objc_msgSend(v10, "type") || objc_msgSend(v10, "type") == 2)
          ++v7;
      }
      v6 += v5;
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
  }

  if (v7 <= self->_minPlayers)
    minPlayers = self->_minPlayers;
  else
    minPlayers = v7;
  v12 = v6 - minPlayers;
  result.length = v12;
  result.location = minPlayers;
  return result;
}

- (NSArray)participants
{
  void *v2;
  void *v3;

  -[GKBasicCollectionViewDataSource items](self, "items");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_gkFilterWithBlock:", &__block_literal_global_28);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

id __39__GKMultiplayerDataSource_participants__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;

  v2 = a2;
  if ((objc_msgSend(v2, "isPlaceHolderItem") & 1) != 0)
    v3 = 0;
  else
    v3 = v2;

  return v3;
}

- (int64_t)maxAvailablePlayers
{
  int64_t maxPlayers;

  maxPlayers = self->_maxPlayers;
  return maxPlayers - -[NSMutableOrderedSet count](self->_players, "count");
}

- (id)participantForPlayer:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GKMultiplayerDataSource participants](self, "participants", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "player");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v4);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)participantForAutoMatchNumber:(int64_t)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[GKMultiplayerDataSource participants](self, "participants", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") == 1)
        {
          if (v7 == a3)
          {
            v11 = v10;
            goto LABEL_13;
          }
          ++v7;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (id)firstInvitedContactPlayer
{
  NSMutableOrderedSet *v2;
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = self->_players;
  v3 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v6, "contact", (_QWORD)v9);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v3 = v6;
          goto LABEL_11;
        }
      }
      v3 = (id)-[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_11:

  return v3;
}

- (int64_t)statusForPlayer:(id)a3
{
  NSMutableDictionary *playerStatus;
  void *v4;
  void *v5;
  int64_t v6;

  if (!a3)
    return 7;
  playerStatus = self->_playerStatus;
  objc_msgSend(a3, "referenceKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](playerStatus, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  return v6;
}

- (BOOL)participantShouldBeRemovable:(id)a3 atIndexPath:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  char v8;
  unint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  char v13;

  v5 = a3;
  if (-[GKMultiplayerDataSource removingEnabled](self, "removingEnabled"))
  {
    v6 = objc_msgSend(v5, "type");
    if (v6 == 1)
    {
      -[GKMultiplayerDataSource participants](self, "participants");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v10, "count");
      LOBYTE(v9) = v9 > -[GKMultiplayerDataSource minPlayers](self, "minPlayers");

    }
    else if (v6)
    {
      LOBYTE(v9) = 1;
    }
    else
    {
      objc_msgSend(v5, "player");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "isLocalPlayer");

      if ((v8 & 1) != 0)
      {
        LOBYTE(v9) = 0;
      }
      else
      {
        v11 = objc_msgSend(v5, "status");
        if (v11 >= 0x15)
          LOBYTE(v9) = 1;
        else
          LODWORD(v9) = (0xFEF3Fu >> v11) & 1;
      }
    }
    if (objc_msgSend(v5, "status") == 12
      || objc_msgSend(v5, "status") == 6
      || objc_msgSend(v5, "status") == 7
      || objc_msgSend(v5, "status") == 20 && objc_msgSend(v5, "type") != 1)
    {
      LOBYTE(v9) = 0;
    }
    if (objc_msgSend(v5, "status") == 6)
    {
      -[GKMultiplayerDataSource delegate](self, "delegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "isParticipantInvitedByLocalPlayer:", v5);

      LOBYTE(v9) = v13 | v9;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)recordButtonClickAction:(id)a3 targetId:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _QWORD v30[2];
  _QWORD v31[2];
  const __CFString *v32;
  void *v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v24 = a4;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  +[GKMultiplayerParticipant allStatuses](GKMultiplayerParticipant, "allStatuses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", (int)objc_msgSend(v12, "intValue"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)MEMORY[0x1E0CB37E8];
        -[GKMultiplayerDataSource playersWithStatus:](self, "playersWithStatus:", (int)objc_msgSend(v12, "intValue"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0D25238], "reporter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerDataSource pageId](self, "pageId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = CFSTR("location");
  v30[0] = CFSTR("playersCount");
  v19 = (void *)MEMORY[0x1E0CB37E8];
  -[GKMultiplayerDataSource players](self, "players");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v20, "count"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v30[1] = CFSTR("statusCounts");
  v31[0] = v21;
  v31[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v33, &v32, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "recordClickWithAction:targetId:targetType:pageId:pageType:additionalFields:", v25, v24, CFSTR("button"), v18, CFSTR("multiplayer"), v23);

}

- (void)recordRemoveFriendClickAction:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  const __CFString *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0D25238];
  v5 = a3;
  objc_msgSend(v4, "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerDataSource pageId](self, "pageId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = CFSTR("location");
  v11 = CFSTR("status");
  objc_msgSend(v5, "statusName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordClickWithAction:targetId:targetType:pageId:pageType:additionalFields:", CFSTR("remove"), CFSTR("removeFriend"), CFSTR("button"), v7, CFSTR("multiplayer"), v10);

}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
  void *v12;
  unint64_t v13;
  void *v14;
  void *v15;
  int64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _BOOL8 v22;
  _BOOL8 v23;
  void *v24;
  id v25;
  _QWORD v27[5];
  id v28;
  id v29;
  id location;
  _QWORD v31[5];

  v6 = a3;
  v7 = a4;
  -[GKMultiplayerDataSource delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "allowAutoMatch"))
    goto LABEL_6;
  v9 = objc_msgSend(v7, "item");
  -[GKBasicCollectionViewDataSource items](self, "items");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != objc_msgSend(v10, "count") - 1)
  {

LABEL_6:
    goto LABEL_7;
  }
  v11 = -[GKMultiplayerDataSource maxPlayers](self, "maxPlayers");
  -[GKMultiplayerDataSource participants](self, "participants");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");

  if (v11 <= v13)
  {
LABEL_7:
    +[GKMultiplayerParticipantCollectionViewCell reuseIdentifier](_TtC12GameCenterUI42GKMultiplayerParticipantCollectionViewCell, "reuseIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v18, v7);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "setSharePlayEnabled:", -[GKMultiplayerDataSource sharePlayEnabled](self, "sharePlayEnabled"));
    -[GKMultiplayerDataSource participants](self, "participants");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "item"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    -[GKMultiplayerDataSource refreshStatusForParticipant:](self, "refreshStatusForParticipant:", v20);
    v21 = objc_msgSend(v7, "item") + 1;
    v22 = -[GKMultiplayerDataSource removingEnabled](self, "removingEnabled");
    v23 = -[GKMultiplayerDataSource invitingEnabled](self, "invitingEnabled");
    -[GKMultiplayerDataSource delegate](self, "delegate");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "applyWithParticipant:number:isRemovingEnabled:isInvitingEnabled:layoutMode:", v20, v21, v22, v23, objc_msgSend(v24, "multiplayerCellLayoutMode"));

    objc_msgSend(v15, "setRemoveButtonHidden:", -[GKMultiplayerDataSource participantShouldBeRemovable:atIndexPath:](self, "participantShouldBeRemovable:atIndexPath:", v20, v7) ^ 1);
    objc_initWeak(&location, v15);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_3;
    v27[3] = &unk_1E59C6A50;
    v27[4] = self;
    objc_copyWeak(&v29, &location);
    v25 = v20;
    v28 = v25;
    objc_msgSend(v15, "setTapHandler:", v27);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);

    goto LABEL_8;
  }
  +[GKMultiplayerAddSlotCollectionViewCell reuseIdentifier](_TtC12GameCenterUI38GKMultiplayerAddSlotCollectionViewCell, "reuseIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v14, v7);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[GKMultiplayerDataSource maxPlayers](self, "maxPlayers");
  -[GKMultiplayerDataSource participants](self, "participants");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setMaximumAdditionalPlayers:", v16 - objc_msgSend(v17, "count"));

  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke;
  v31[3] = &unk_1E59C6A28;
  v31[4] = self;
  objc_msgSend(v15, "setAddSlotActionHandler:", v31);
LABEL_8:

  return v15;
}

void __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "participants");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count") + a2;

  objc_msgSend(*(id *)(a1 + 32), "players");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5 - objc_msgSend(v6, "count");

  if ((v7 & 0x8000000000000000) == 0)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v8 = *(void **)(a1 + 32);
    v13 = MEMORY[0x1E0C809B0];
    v14 = 3221225472;
    v15 = __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_2;
    v16 = &unk_1E59C48A0;
    objc_copyWeak(&v17, &location);
    objc_msgSend(v8, "setAutomatchPlayerCount:complete:", v7, &v13);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }
  objc_msgSend(MEMORY[0x1E0D253B0], "shared", v13, v14, v15, v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRecentNumberOfPlayers:", v5);

  objc_msgSend(MEMORY[0x1E0D253B0], "shared");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "game");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setRecentNumberOfPlayers:forBundleID:", v5, v12);

}

void __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didUpdateAutoMatchPlayerCount");

}

void __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_3(id *a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id location;

  switch(a2)
  {
    case 2:
      objc_msgSend(a1[4], "participants");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "count") - 1;

      objc_msgSend(a1[4], "players");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v5 - objc_msgSend(v6, "count");

      if ((v7 & 0x8000000000000000) == 0)
      {
        objc_initWeak(&location, a1[4]);
        v8 = a1[4];
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_5;
        v23[3] = &unk_1E59C48A0;
        objc_copyWeak(&v24, &location);
        objc_msgSend(v8, "setAutomatchPlayerCount:complete:", v7, v23);
        objc_destroyWeak(&v24);
        objc_destroyWeak(&location);
      }
      objc_msgSend(MEMORY[0x1E0D253B0], "shared");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setRecentNumberOfPlayers:", v5);

      objc_msgSend(MEMORY[0x1E0D253B0], "shared");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1[4], "game");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setRecentNumberOfPlayers:forBundleID:", v5, v12);

      goto LABEL_13;
    case 1:
      objc_msgSend(a1[5], "player");
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v14 = a1[4];
      if (v13)
      {
        objc_msgSend(v14, "delegate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "didTapRemoveParticipant:", a1[5]);

      }
      else
      {
        objc_msgSend(v14, "participants");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");
        objc_msgSend(a1[4], "players");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v17 + ~objc_msgSend(v18, "count");

        if ((v19 & 0x8000000000000000) == 0)
        {
          objc_initWeak(&location, a1[4]);
          v20 = a1[4];
          v25[0] = MEMORY[0x1E0C809B0];
          v25[1] = 3221225472;
          v25[2] = __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_4;
          v25[3] = &unk_1E59C48A0;
          objc_copyWeak(&v26, &location);
          objc_msgSend(v20, "setAutomatchPlayerCount:complete:", v19, v25);
          objc_destroyWeak(&v26);
          objc_destroyWeak(&location);
        }
      }
      objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "reportEvent:type:", *MEMORY[0x1E0D25068], *MEMORY[0x1E0D24DD0]);

LABEL_13:
      objc_msgSend(a1[4], "recordRemoveFriendClickAction:", a1[5]);
      return;
    case 0:
      objc_msgSend(a1[4], "delegate");
      v22 = (id)objc_claimAutoreleasedReturnValue();
      WeakRetained = objc_loadWeakRetained(a1 + 6);
      objc_msgSend(v22, "didTapInviteOnCell:", WeakRetained);

      break;
  }
}

void __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_4(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didUpdateAutoMatchPlayerCount");

}

void __65__GKMultiplayerDataSource_collectionView_cellForItemAtIndexPath___block_invoke_5(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "didUpdateAutoMatchPlayerCount");

}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  void *v5;
  int64_t v6;

  if (a4)
    return 0;
  -[GKBasicCollectionViewDataSource items](self, "items", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)collectionViewDebugDescription
{
  void *v3;
  void *v4;
  NSMutableOrderedSet *orderedPlayerIDList;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKMultiplayerDataSource currentPlayersDebugDescription](self, "currentPlayersDebugDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  orderedPlayerIDList = self->_orderedPlayerIDList;
  -[GKMultiplayerDataSource participants](self, "participants");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("CollectionView Debug Description - players: %@\n            orderedPlayerIDList: %@\n            participants: %@ \n"), v4, orderedPlayerIDList, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)currentPlayersDebugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKMultiplayerDataSource players](self, "players");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKMultiplayerDataSource playersDebugDescription:newStatus:](self, "playersDebugDescription:newStatus:", v5, -1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("current players: %@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)playersDebugDescription:(id)a3 newStatus:(int64_t)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v25;
  id obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(&stru_1E59EB978, "stringByAppendingFormat:", CFSTR("players: {\n"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v25 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v8)
    {
      v9 = v8;
      v27 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v29 != v27)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v7, "stringByAppendingFormat:", CFSTR("\t%@"), v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          -[GKMultiplayerDataSource playerStatus](self, "playerStatus");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "referenceKey");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "objectForKeyedSubscript:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (v15)
          {
            -[GKMultiplayerDataSource playerStatus](self, "playerStatus");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "referenceKey");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "objectForKeyedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("- current status: %@"), v19);
            v20 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v20;
          }
          if ((a4 & 0x8000000000000000) == 0)
          {
            +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", a4);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(" - new status: %@"), v21);
            v22 = objc_claimAutoreleasedReturnValue();

            v12 = (void *)v22;
          }
          objc_msgSend(v12, "stringByAppendingFormat:", CFSTR(",\n"));
          v7 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@}\n"), v7);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v25;
  }
  else
  {
    objc_msgSend(&stru_1E59EB978, "stringByAppendingFormat:", CFSTR("players: - No Players - "));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v23;
}

- (void)addPlayers:(id)a3 withStatus:(int64_t)a4 complete:(id)a5
{
  -[GKMultiplayerDataSource addPlayers:withStatus:replaceAutomatches:complete:](self, "addPlayers:withStatus:replaceAutomatches:complete:", a3, a4, 0, a5);
}

- (void)prepopulateConversationParticipants:(id)a3 complete:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v19 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v6;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v11);
        v13 = objc_alloc(MEMORY[0x1E0D25358]);
        -[GKMultiplayerDataSource game](self, "game");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = (void *)objc_msgSend(v13, "initWithParticipant:forBundleID:", v12, v15);

        if (v16)
        {
          objc_msgSend(v7, "addObject:", v16);
        }
        else
        {
          if (!*MEMORY[0x1E0D25460])
            v17 = (id)GKOSLoggers();
          v18 = *MEMORY[0x1E0D25470];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v12;
            _os_log_error_impl(&dword_1AB361000, v18, OS_LOG_TYPE_ERROR, "cannot convert TUConversationParticipant(%@) to GKPlayer.", buf, 0xCu);
          }
        }

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v9);
  }

  -[GKMultiplayerDataSource addPlayers:withStatus:replaceAutomatches:complete:](self, "addPlayers:withStatus:replaceAutomatches:complete:", v7, 20, 1, v19);
}

- (void)addPlayers:(id)a3 withStatus:(int64_t)a4 replaceAutomatches:(BOOL)a5 complete:(id)a6
{
  _BOOL4 v7;
  char *v10;
  id v11;
  void *v12;
  _QWORD *v13;
  id v14;
  os_log_t *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  id v25;
  id v26;
  char *v27;
  NSObject *v28;
  uint64_t v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  void *v33;
  _QWORD v34[4];
  id v35;
  GKMultiplayerDataSource *v36;
  id v37;
  _QWORD v38[5];
  char *v39;
  id v40;
  int64_t v41;
  BOOL v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  const __CFString *v48;
  uint64_t v49;

  v7 = a5;
  v49 = *MEMORY[0x1E0C80C00];
  v10 = (char *)a3;
  v11 = a6;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v14 = (id)GKOSLoggers();
  v15 = (os_log_t *)MEMORY[0x1E0D25438];
  v16 = (void *)*MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
  {
    v31 = (void *)MEMORY[0x1E0CB3940];
    v28 = v16;
    -[GKMultiplayerDataSource playersDebugDescription:newStatus:](self, "playersDebugDescription:newStatus:", v10, a4);
    v29 = objc_claimAutoreleasedReturnValue();
    v33 = (void *)v29;
    v30 = CFSTR("NO");
    if (v7)
      v30 = CFSTR("YES");
    objc_msgSend(v31, "stringWithFormat:", CFSTR("- START - uuid: %@, %@, replaceAutomatch: %@"), v12, v29, v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v44 = "-[GKMultiplayerDataSource addPlayers:withStatus:replaceAutomatches:complete:]";
    v45 = 2112;
    v46 = (uint64_t)v32;
    _os_log_debug_impl(&dword_1AB361000, v28, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

  }
  if (!*v13)
    v17 = (id)GKOSLoggers();
  if (os_log_type_enabled(*v15, OS_LOG_TYPE_DEBUG))
    -[GKMultiplayerDataSource addPlayers:withStatus:replaceAutomatches:complete:].cold.1();
  -[GKMultiplayerDataSource reportMultiplayerSelection:](self, "reportMultiplayerSelection:", v10);
  if (!*v13)
    v18 = (id)GKOSLoggers();
  v19 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v20 = v19;
    +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", a4);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = CFSTR("NO");
    *(_DWORD *)buf = 138412802;
    v44 = v10;
    v45 = 2112;
    if (v7)
      v23 = CFSTR("YES");
    v46 = v21;
    v47 = 2112;
    v48 = v23;
    _os_log_impl(&dword_1AB361000, v20, OS_LOG_TYPE_INFO, "add players: %@ - status: %@ - replaceAutomatch: %@", buf, 0x20u);

  }
  v24 = MEMORY[0x1E0C809B0];
  v38[0] = MEMORY[0x1E0C809B0];
  v38[1] = 3221225472;
  v38[2] = __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke;
  v38[3] = &unk_1E59C6A78;
  v38[4] = self;
  v39 = v10;
  v42 = v7;
  v41 = a4;
  v40 = v12;
  v34[0] = v24;
  v34[1] = 3221225472;
  v34[2] = __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke_2;
  v34[3] = &unk_1E59C6118;
  v35 = v40;
  v36 = self;
  v37 = v11;
  v25 = v11;
  v26 = v40;
  v27 = v10;
  -[GKCollectionViewDataSource notifyBatchUpdate:complete:](self, "notifyBatchUpdate:complete:", v38, v34);

}

uint64_t __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  void *v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "automatchPlayerCount");
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = *(id *)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "players", (_QWORD)v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "containsObject:", v8);

        if ((v10 & 1) == 0)
        {
          objc_msgSend(*(id *)(a1 + 32), "players");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "addObject:", v8);

          objc_msgSend(*(id *)(a1 + 32), "orderedPlayerIDList");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "internal");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "playerID");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "addObject:", v14);

          --v2;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAutomatchPlayerCount:", v2 & ~(v2 >> 63));
    v15 = objc_msgSend(*(id *)(a1 + 32), "automatchPlayerCount");
    if (v15 < objc_msgSend(*(id *)(a1 + 32), "automatchPlayersAddedByUser"))
    {
      v16 = *(_QWORD *)(a1 + 56);
      if (v16 <= 0x15 && ((1 << v16) & 0x200802) != 0)
        objc_msgSend(*(id *)(a1 + 32), "setAutomatchPlayerCount:", objc_msgSend(*(id *)(a1 + 32), "automatchPlayersAddedByUser"));
    }
    objc_msgSend(*(id *)(a1 + 32), "delegate", (_QWORD)v19);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "didUpdateAutoMatchPlayerCount");

  }
  objc_msgSend(*(id *)(a1 + 32), "setStatus:forPlayers:uuid:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v19);
  return objc_msgSend(*(id *)(a1 + 32), "updateParticipants");
}

uint64_t __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t result;

  if (!*MEMORY[0x1E0D25460])
    v2 = (id)GKOSLoggers();
  v3 = (void *)*MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke_2_cold_1(a1, v3);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)updateDataStructuresForRemovedPlayer:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  -[GKMultiplayerDataSource playerStatus](self, "playerStatus");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceKey");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObjectForKey:", v6);

  -[GKMultiplayerDataSource players](self, "players");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObject:", v4);

  -[GKMultiplayerDataSource orderedPlayerIDList](self, "orderedPlayerIDList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "internal");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "playerID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeObject:", v10);

  -[GKMultiplayerDataSource setAutomatchPlayerCount:](self, "setAutomatchPlayerCount:", -[GKMultiplayerDataSource automatchPlayerCount](self, "automatchPlayerCount") + 1);
}

- (void)removePlayers:(id)a3 complete:(id)a4
{
  char *v6;
  id v7;
  void *v8;
  _QWORD *v9;
  id v10;
  os_log_t *v11;
  void *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  char *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  GKMultiplayerDataSource *v25;
  id v26;
  _QWORD v27[4];
  char *v28;
  GKMultiplayerDataSource *v29;
  uint8_t buf[4];
  const char *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = (char *)a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v10 = (id)GKOSLoggers();
  v11 = (os_log_t *)MEMORY[0x1E0D25438];
  v12 = (void *)*MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
  {
    v19 = (void *)MEMORY[0x1E0CB3940];
    v20 = v12;
    -[GKMultiplayerDataSource playersDebugDescription:newStatus:](self, "playersDebugDescription:newStatus:", v6, -1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "stringWithFormat:", CFSTR("- START - uuid: %@, %@"), v8, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v31 = "-[GKMultiplayerDataSource removePlayers:complete:]";
    v32 = 2112;
    v33 = v22;
    _os_log_debug_impl(&dword_1AB361000, v20, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

  }
  if (!*v9)
    v13 = (id)GKOSLoggers();
  if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
    -[GKMultiplayerDataSource removePlayers:complete:].cold.1();
  if (!*v9)
    v14 = (id)GKOSLoggers();
  v15 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v31 = v6;
    _os_log_impl(&dword_1AB361000, v15, OS_LOG_TYPE_INFO, "remove players: %@", buf, 0xCu);
  }
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke;
  v27[3] = &unk_1E59C4708;
  v28 = v6;
  v29 = self;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke_2;
  v23[3] = &unk_1E59C6118;
  v24 = v8;
  v25 = self;
  v26 = v7;
  v16 = v7;
  v17 = v8;
  v18 = v6;
  -[GKCollectionViewDataSource notifyBatchUpdate:complete:](self, "notifyBatchUpdate:complete:", v27, v23);

}

uint64_t __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 40), "updateDataStructuresForRemovedPlayer:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6++), (_QWORD)v8);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "updateParticipants");
}

uint64_t __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t result;

  if (!*MEMORY[0x1E0D25460])
    v2 = (id)GKOSLoggers();
  v3 = (void *)*MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke_2_cold_1(a1, v3);
  result = *(_QWORD *)(a1 + 48);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (BOOL)shouldRevertStatus:(int64_t)a3
{
  return 0;
}

- (BOOL)shouldUpdateStatus:(int64_t)a3 withNewStatus:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  BOOL result;
  void *v9;

  objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0D25070];
  objc_msgSend(v6, "reportEvent:type:", *MEMORY[0x1E0D25070], *MEMORY[0x1E0D24E58]);

  if (a3 == a4)
    return 0;
  if (a3 == 6)
  {
    result = 0;
    if (a4 > 8)
    {
      if (a4 == 9)
        return result;
LABEL_11:
      if (a4 != 12)
        return 1;
    }
    else
    {
      if (!a4)
        return result;
      if (a4 != 1)
        return 1;
    }
LABEL_8:
    objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reportEvent:type:", v7, *MEMORY[0x1E0D24E60]);

    return 0;
  }
  if (a3 != 7)
    return 1;
  result = 0;
  switch(a4)
  {
    case 0:
    case 9:
      return result;
    case 1:
    case 6:
      goto LABEL_8;
    case 2:
    case 3:
    case 4:
    case 5:
    case 7:
    case 8:
      return 1;
    default:
      goto LABEL_11;
  }
  return result;
}

- (void)setStatus:(int64_t)a3 forPlayers:(id)a4 uuid:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  os_log_t *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  id v18;
  os_log_t v19;
  _BOOL4 v20;
  uint64_t v21;
  id v22;
  os_log_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  os_log_t v28;
  void *v29;
  NSObject *v30;
  void *v31;
  id v32;
  os_log_t v33;
  id v34;
  void *v35;
  NSObject *v36;
  void *v37;
  char *v38;
  void *v39;
  void *v40;
  id v41;
  os_log_t v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t i;
  void *v50;
  void *v51;
  int v52;
  id v53;
  void *v54;
  void *v55;
  NSObject *v56;
  void *v57;
  void *v58;
  NSObject *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  id v78;
  os_log_t v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t j;
  uint64_t v85;
  id v86;
  os_log_t v87;
  void *v88;
  NSObject *v89;
  void *v90;
  void *v91;
  int v92;
  id v93;
  os_log_t v94;
  void *v95;
  void *v96;
  id v97;
  GKMultiplayerDataSource *v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  uint8_t v115[128];
  uint8_t buf[4];
  const char *v117;
  __int16 v118;
  void *v119;
  __int16 v120;
  void *v121;
  _BYTE v122[128];
  _BYTE v123[128];
  uint64_t v124;

  v124 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v97 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v7, "count"));
  v96 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = 0u;
  v112 = 0u;
  v113 = 0u;
  v114 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
  v10 = (uint64_t *)MEMORY[0x1E0D25460];
  v11 = (os_log_t *)MEMORY[0x1E0D25438];
  v98 = self;
  v99 = v8;
  v101 = v9;
  if (v9)
  {
    v100 = *(_QWORD *)v112;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v112 != v100)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v111 + 1) + 8 * v12);
        -[GKMultiplayerDataSource playerStatus](self, "playerStatus");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "referenceKey");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "integerValue");

        if (!*v10)
          v18 = (id)GKOSLoggers();
        v19 = *v11;
        if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
        {
          v55 = (void *)MEMORY[0x1E0CB3940];
          v56 = v19;
          +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", v17);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "stringWithFormat:", CFSTR("- MIDDLE 1 - uuid: %@, Settings status for player: %@ with current status: %@"), v97, v13, v57);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 136315394;
          v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
          v118 = 2112;
          v119 = v58;
          _os_log_debug_impl(&dword_1AB361000, v56, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

        }
        v20 = -[GKMultiplayerDataSource shouldUpdateStatus:withNewStatus:](self, "shouldUpdateStatus:withNewStatus:", v17, a3);
        v21 = *v10;
        if (v20)
        {
          if (!v21)
            v22 = (id)GKOSLoggers();
          v23 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
          {
            v95 = (void *)MEMORY[0x1E0CB3940];
            v59 = v23;
            +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", v17);
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", a3);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "stringWithFormat:", CFSTR("- MIDDLE 2 - uuid: %@, should update status for player: %@ from status %@ to new status: %@"), v97, v13, v60, v61);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
            v118 = 2112;
            v119 = v62;
            _os_log_debug_impl(&dword_1AB361000, v59, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

          }
          -[GKMultiplayerDataSource players](self, "players");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = objc_msgSend(v24, "indexOfObject:", v13);

          v26 = *v10;
          if (v25 == 0x7FFFFFFFFFFFFFFFLL)
          {
            if (!v26)
              v27 = (id)GKOSLoggers();
            v28 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
            {
              v29 = (void *)MEMORY[0x1E0CB3940];
              v30 = v28;
              objc_msgSend(v29, "stringWithFormat:", CFSTR("- MIDDLE 5 - uuid: %@, cannot find index path for player: %@"), v97, v13);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
              v118 = 2112;
              v119 = v31;
              _os_log_debug_impl(&dword_1AB361000, v30, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

            }
          }
          else
          {
            if (!v26)
              v41 = (id)GKOSLoggers();
            v42 = *v11;
            if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
            {
              v68 = (void *)MEMORY[0x1E0CB3940];
              v69 = v42;
              objc_msgSend(v13, "referenceKey");
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", a3);
              v71 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v68, "stringWithFormat:", CFSTR("- MIDDLE 3 - uuid: %@, updating player: %@ with referencekey %@ to status: %@"), v97, v13, v70, v71);
              v72 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
              v118 = 2112;
              v119 = v72;
              _os_log_debug_impl(&dword_1AB361000, v69, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

            }
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            -[GKMultiplayerDataSource playerStatus](self, "playerStatus");
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "referenceKey");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, v45);

            v109 = 0u;
            v110 = 0u;
            v107 = 0u;
            v108 = 0u;
            -[GKMultiplayerDataSource participants](self, "participants");
            v36 = objc_claimAutoreleasedReturnValue();
            v46 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
            if (v46)
            {
              v47 = v46;
              v48 = *(_QWORD *)v108;
              while (2)
              {
                for (i = 0; i != v47; ++i)
                {
                  if (*(_QWORD *)v108 != v48)
                    objc_enumerationMutation(v36);
                  v50 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
                  objc_msgSend(v50, "player");
                  v51 = (void *)objc_claimAutoreleasedReturnValue();
                  v52 = objc_msgSend(v51, "isEqual:", v13);

                  if (v52)
                  {
                    objc_msgSend(v50, "setStatus:", a3);
                    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v25, 0);
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v96, "addObject:", v39);
                    v10 = (uint64_t *)MEMORY[0x1E0D25460];
                    if (!*MEMORY[0x1E0D25460])
                      v53 = (id)GKOSLoggers();
                    v11 = (os_log_t *)MEMORY[0x1E0D25438];
                    v54 = (void *)*MEMORY[0x1E0D25438];
                    self = v98;
                    v8 = v99;
                    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
                    {
                      v73 = (void *)MEMORY[0x1E0CB3940];
                      v74 = v54;
                      objc_msgSend(v73, "stringWithFormat:", CFSTR("- MIDDLE 4 - uuid: %@, marking index path row: %@ to refresh"), v97, v39);
                      v75 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)buf = 136315394;
                      v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
                      v118 = 2112;
                      v119 = v75;
                      _os_log_debug_impl(&dword_1AB361000, v74, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

                      v11 = (os_log_t *)MEMORY[0x1E0D25438];
                    }
                    goto LABEL_45;
                  }
                }
                v47 = -[NSObject countByEnumeratingWithState:objects:count:](v36, "countByEnumeratingWithState:objects:count:", &v107, v122, 16);
                if (v47)
                  continue;
                break;
              }
            }

            self = v98;
            v8 = v99;
            v11 = (os_log_t *)MEMORY[0x1E0D25438];
            v10 = (uint64_t *)MEMORY[0x1E0D25460];
          }
        }
        else
        {
          if (!v21)
            v32 = (id)GKOSLoggers();
          v33 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
          {
            v63 = (void *)MEMORY[0x1E0CB3940];
            v64 = v33;
            +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", v17);
            v65 = (void *)objc_claimAutoreleasedReturnValue();
            +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", a3);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "stringWithFormat:", CFSTR("- MIDDLE 6 - should not update status for player: %@ from status %@ to new status: %@"), v13, v65, v66);
            v67 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
            v118 = 2112;
            v119 = v67;
            _os_log_debug_impl(&dword_1AB361000, v64, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

            v10 = (uint64_t *)MEMORY[0x1E0D25460];
            v11 = (os_log_t *)MEMORY[0x1E0D25438];

          }
          if (!*v10)
            v34 = (id)GKOSLoggers();
          v35 = (void *)*MEMORY[0x1E0D25470];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
          {
            v36 = v35;
            objc_msgSend(v13, "internal");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "debugDescription");
            v38 = (char *)objc_claimAutoreleasedReturnValue();
            +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", v17);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", a3);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v117 = v38;
            v118 = 2112;
            v119 = v39;
            v120 = 2112;
            v121 = v40;
            _os_log_impl(&dword_1AB361000, v36, OS_LOG_TYPE_INFO, "Should not update datasource status for player: %@ - from: %@ - to: %@", buf, 0x20u);

            v11 = (os_log_t *)MEMORY[0x1E0D25438];
            v10 = (uint64_t *)MEMORY[0x1E0D25460];
LABEL_45:

          }
        }
        ++v12;
      }
      while (v12 != v101);
      v101 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v111, v123, 16);
    }
    while (v101);
  }

  v76 = objc_msgSend(v96, "count");
  v77 = *v10;
  if (v76)
  {
    if (!v77)
      v78 = (id)GKOSLoggers();
    v79 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
      -[GKMultiplayerDataSource setStatus:forPlayers:uuid:].cold.2(v79);
    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v80 = v96;
    v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
    if (v81)
    {
      v82 = v81;
      v83 = *(_QWORD *)v104;
      do
      {
        for (j = 0; j != v82; ++j)
        {
          if (*(_QWORD *)v104 != v83)
            objc_enumerationMutation(v80);
          v85 = *(_QWORD *)(*((_QWORD *)&v103 + 1) + 8 * j);
          if (!*MEMORY[0x1E0D25460])
            v86 = (id)GKOSLoggers();
          v87 = *v11;
          if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
          {
            v88 = (void *)MEMORY[0x1E0CB3940];
            v89 = v87;
            objc_msgSend(v88, "stringWithFormat:", CFSTR("- MIDDLE 8 - uuid: %@, \t\tRefreshing: %@"), v97, v85);
            v90 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315394;
            v117 = "-[GKMultiplayerDataSource setStatus:forPlayers:uuid:]";
            v118 = 2112;
            v119 = v90;
            _os_log_debug_impl(&dword_1AB361000, v89, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

            v11 = (os_log_t *)MEMORY[0x1E0D25438];
          }
        }
        v82 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v103, v115, 16);
      }
      while (v82);
    }

    objc_msgSend(MEMORY[0x1E0D253B0], "shared");
    v91 = (void *)objc_claimAutoreleasedReturnValue();
    v92 = objc_msgSend(v91, "multiplayerShouldAlwaysReloadCollectionView");

    if (v92)
      -[GKCollectionViewDataSource notifyDidReloadData](v98, "notifyDidReloadData");
    else
      -[GKCollectionViewDataSource notifyItemsRefreshedAtIndexPaths:](v98, "notifyItemsRefreshedAtIndexPaths:", v80);
    v8 = v99;
  }
  else
  {
    if (!v77)
      v93 = (id)GKOSLoggers();
    v94 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_DEBUG))
      -[GKMultiplayerDataSource setStatus:forPlayers:uuid:].cold.1(v94);
  }

}

- (void)setStatus:(int64_t)a3 forPlayers:(id)a4 complete:(id)a5
{
  char *v8;
  id v9;
  void *v10;
  _QWORD *v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  id v19;
  id v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *log;
  _QWORD v27[5];
  char *v28;
  id v29;
  id v30;
  int64_t v31;
  _QWORD v32[5];
  char *v33;
  id v34;
  int64_t v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = (char *)a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (_QWORD *)MEMORY[0x1E0D25460];
  if (!*MEMORY[0x1E0D25460])
    v12 = (id)GKOSLoggers();
  v13 = (void *)*MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
  {
    v22 = (void *)MEMORY[0x1E0CB3940];
    log = v13;
    -[GKMultiplayerDataSource playersDebugDescription:newStatus:](self, "playersDebugDescription:newStatus:", v8, a3);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKMultiplayerDataSource collectionViewDebugDescription](self, "collectionViewDebugDescription");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "stringWithFormat:", CFSTR("- START - uuid: %@, %@,\n %@"), v10, v25, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v37 = "-[GKMultiplayerDataSource setStatus:forPlayers:complete:]";
    v38 = 2112;
    v39 = v24;
    _os_log_debug_impl(&dword_1AB361000, log, OS_LOG_TYPE_DEBUG, "****** - GKCVC - %s \n%@", buf, 0x16u);

  }
  if (!*v11)
    v14 = (id)GKOSLoggers();
  v15 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v16 = v15;
    +[GKMultiplayerParticipant stringFromGKMultiplayerParticipantStatus:](GKMultiplayerParticipant, "stringFromGKMultiplayerParticipantStatus:", a3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v37 = v8;
    v38 = 2112;
    v39 = v17;
    _os_log_impl(&dword_1AB361000, v16, OS_LOG_TYPE_INFO, "Multiplayer datasource set players: %@ - status:%@", buf, 0x16u);

  }
  v18 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke;
  v32[3] = &unk_1E59C6060;
  v32[4] = self;
  v35 = a3;
  v33 = v8;
  v34 = v10;
  v27[0] = v18;
  v27[1] = 3221225472;
  v27[2] = __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_2;
  v27[3] = &unk_1E59C4CE0;
  v30 = v9;
  v31 = a3;
  v27[4] = self;
  v28 = v33;
  v29 = v34;
  v19 = v9;
  v20 = v34;
  v21 = v33;
  -[GKCollectionViewDataSource notifyBatchUpdate:complete:](self, "notifyBatchUpdate:complete:", v32, v27);

}

uint64_t __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setStatus:forPlayers:uuid:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  dispatch_time_t v3;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  v2 = a1 + 32;
  if (objc_msgSend(*(id *)(a1 + 32), "shouldRevertStatus:", *(_QWORD *)(a1 + 64)))
  {
    v3 = dispatch_time(0, (uint64_t)(*MEMORY[0x1E0D24E38] * 1000000000.0));
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_3;
    v8[3] = &unk_1E59C4708;
    v4 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v4;
    dispatch_after(v3, MEMORY[0x1E0C80D38], v8);

  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v5 = (id)GKOSLoggers();
    v6 = (void *)*MEMORY[0x1E0D25438];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
      __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_2_cold_1(a1, v2, v6);
    v7 = *(_QWORD *)(a1 + 56);
    if (v7)
      (*(void (**)(void))(v7 + 16))();
  }
}

void __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  uint64_t v7;

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_4;
  v5[3] = &unk_1E59C4708;
  v2 = *(void **)(a1 + 32);
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v7 = v4;
  objc_msgSend(v2, "notifyBatchUpdate:", v5);

}

uint64_t __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_4(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  int v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v12;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v12 != v5)
          objc_enumerationMutation(v2);
        v7 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v6);
        objc_msgSend(*(id *)(a1 + 40), "players", (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "containsObject:", v7);

        if (v9)
          objc_msgSend(*(id *)(a1 + 40), "updateDataStructuresForRemovedPlayer:", v7);
        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v4);
  }

  return objc_msgSend(*(id *)(a1 + 40), "updateParticipants");
}

- (void)setParticipantsWithPlayers:(id)a3 automatchPlayerCount:(int64_t)a4 shouldUpdateAutomatchPlayerCount:(BOOL)a5 andStatuses:(id)a6 complete:(id)a7
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  id v30;
  int64_t v32;
  id obj;
  id v34;
  _QWORD v35[5];
  id v36;
  int64_t v37;
  BOOL v38;
  _QWORD v39[6];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  __int16 v50;
  id v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v34 = a6;
  v30 = a7;
  if (!*MEMORY[0x1E0D25460])
    v12 = (id)GKOSLoggers();
  v13 = (void *)*MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    v14 = (void *)MEMORY[0x1E0CB37E8];
    v15 = v13;
    objc_msgSend(v14, "numberWithInteger:", a4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v47 = v11;
    v48 = 2112;
    v49 = v16;
    v50 = 2112;
    v51 = v34;
    _os_log_impl(&dword_1AB361000, v15, OS_LOG_TYPE_INFO, "players: %@ - automatchCount: %@ - statuses: %@", buf, 0x20u);

  }
  v32 = a4;
  v17 = (void *)MEMORY[0x1E0D252A8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %s"), "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterUI/iOS/Framework/GKMultiplayerDataSource.m", 673, "-[GKMultiplayerDataSource setParticipantsWithPlayers:automatchPlayerCount:shouldUpdateAutomatchPlayerCount:andStatuses:complete:]");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "dispatchGroupWithName:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v43 = 0u;
  v44 = 0u;
  v42 = 0u;
  v41 = 0u;
  obj = v11;
  v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v42;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v42 != v22)
          objc_enumerationMutation(obj);
        v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v23);
        -[GKMultiplayerDataSource players](self, "players");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "indexOfObject:", v24);

        objc_msgSend(v24, "referenceKey");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "objectForKey:", v26);
        v27 = (void *)objc_claimAutoreleasedReturnValue();

        v39[0] = MEMORY[0x1E0C809B0];
        v39[1] = 3221225472;
        v39[2] = __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_3;
        v39[3] = &unk_1E59C42A0;
        v39[4] = self;
        v39[5] = v24;
        v40 = v27;
        v28 = v27;
        objc_msgSend(v19, "perform:", v39);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v21);
  }

  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_5;
  v35[3] = &unk_1E59C6AA0;
  v38 = a5;
  v35[4] = self;
  v36 = v30;
  v37 = v32;
  v29 = v30;
  objc_msgSend(v19, "notifyOnMainQueueWithBlock:", v35);

}

void __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v10[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(*(id *)(a1 + 48), "integerValue");
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_4;
  v8[3] = &unk_1E59C4DA8;
  v9 = v3;
  v7 = v3;
  objc_msgSend(v4, "addPlayers:withStatus:complete:", v5, v6, v8);

}

uint64_t __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __129__GKMultiplayerDataSource_setParticipantsWithPlayers_automatchPlayerCount_shouldUpdateAutomatchPlayerCount_andStatuses_complete___block_invoke_5(uint64_t a1)
{
  uint64_t result;

  if (*(_BYTE *)(a1 + 56))
    objc_msgSend(*(id *)(a1 + 32), "setAutomatchPlayerCount:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "updateParticipants");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)revertFailedPlayers
{
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a1;
  OUTLINED_FUNCTION_8_0();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("- START - uuid: %@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v1, v5, "****** - GKCVC - %s \n%@", (uint8_t *)v6);

  OUTLINED_FUNCTION_0_5();
}

- (void)failedToInvitePlayers:(id)a3
{
  NSMutableOrderedSet *v4;
  void *v5;
  id v6;
  os_log_t *v7;
  void *v8;
  void *v9;
  NSMutableOrderedSet *players;
  NSMutableOrderedSet *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = (NSMutableOrderedSet *)a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!*MEMORY[0x1E0D25460])
    v6 = (id)GKOSLoggers();
  v7 = (os_log_t *)MEMORY[0x1E0D25438];
  v8 = (void *)*MEMORY[0x1E0D25438];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25438], OS_LOG_TYPE_DEBUG))
    -[GKMultiplayerDataSource failedToInvitePlayers:].cold.2(v8);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  players = v4;
  if (!v4)
    players = self->_players;
  v11 = players;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v12 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (-[GKMultiplayerDataSource statusForPlayer:](self, "statusForPlayer:", v16) == 1)
          objc_msgSend(v9, "addObject:", v16);
      }
      v13 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }
  if (objc_msgSend(v9, "count"))
  {
    if (!*MEMORY[0x1E0D25460])
      v17 = (id)GKOSLoggers();
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_DEBUG))
      -[GKMultiplayerDataSource failedToInvitePlayers:].cold.1();
    -[GKMultiplayerDataSource setStatus:forPlayers:complete:](self, "setStatus:forPlayers:complete:", 4, v9, 0);
  }

}

- (BOOL)canCancelCurrentMatchmaking
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  -[GKMultiplayerDataSource players](self, "players");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  -[GKMultiplayerDataSource readyPlayers](self, "readyPlayers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4 != objc_msgSend(v5, "count")
    || -[GKMultiplayerDataSource automatchPlayerCount](self, "automatchPlayerCount") > 0;

  return v6;
}

- (BOOL)haveNonGuestPlayers
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[GKMultiplayerDataSource players](self, "players", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v8 + 1) + 8 * i);
        if ((objc_msgSend(v6, "isGuestPlayer") & 1) == 0 && !objc_msgSend(v6, "isLocalPlayer"))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v3)
        continue;
      break;
    }
  }
LABEL_12:

  return v3;
}

- (void)setAutomatchPlayerCount:(int64_t)a3
{
  os_unfair_lock_s *p_automatchPlayerCountLock;
  void *v6;
  int v7;
  int64_t v8;

  p_automatchPlayerCountLock = &self->_automatchPlayerCountLock;
  os_unfair_lock_lock(&self->_automatchPlayerCountLock);
  -[GKMultiplayerDataSource delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "allowAutoMatch");

  if (v7)
    v8 = a3;
  else
    v8 = 0;
  self->_automatchPlayerCount = v8;
  os_unfair_lock_unlock(p_automatchPlayerCountLock);
}

- (void)setAutomatchPlayerCount:(int64_t)a3 complete:(id)a4
{
  _QWORD v4[6];

  if (self->_automatchPlayerCount != a3)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __60__GKMultiplayerDataSource_setAutomatchPlayerCount_complete___block_invoke;
    v4[3] = &unk_1E59C6850;
    v4[4] = self;
    v4[5] = a3;
    -[GKCollectionViewDataSource notifyBatchUpdate:complete:](self, "notifyBatchUpdate:complete:", v4, a4);
  }
}

uint64_t __60__GKMultiplayerDataSource_setAutomatchPlayerCount_complete___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "setAutomatchPlayerCount:", *(_QWORD *)(a1 + 40));
  v2 = objc_msgSend(*(id *)(a1 + 32), "implicitAutomatchPlayerCount");
  if (v2 > objc_msgSend(*(id *)(a1 + 32), "automatchPlayerCount"))
    objc_msgSend(*(id *)(a1 + 32), "setImplicitAutomatchPlayerCount:", objc_msgSend(*(id *)(a1 + 32), "automatchPlayerCount"));
  objc_msgSend(*(id *)(a1 + 32), "setAutomatchPlayersAddedByUser:", objc_msgSend(*(id *)(a1 + 32), "automatchPlayerCount")- objc_msgSend(*(id *)(a1 + 32), "implicitAutomatchPlayerCount"));
  return objc_msgSend(*(id *)(a1 + 32), "updateParticipants");
}

- (void)refreshStatusForParticipant:(id)a3
{
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  id v17;

  v17 = a3;
  -[GKMultiplayerDataSource delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCanceling");

  if (v6)
  {
    v7 = v17;
    v8 = 14;
LABEL_10:
    objc_msgSend(v7, "setStatus:", v8);
    goto LABEL_11;
  }
  if (objc_msgSend(v17, "type") == 1)
  {
    -[GKMultiplayerDataSource delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "allowAutoMatch");

    if (!v10)
    {
      v7 = v17;
      v8 = 0;
      goto LABEL_10;
    }
    -[GKMultiplayerDataSource delegate](self, "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStatus:", objc_msgSend(v11, "automatchParticipantStatus"));

  }
  else
  {
    -[GKMultiplayerDataSource players](self, "players");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "player");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "containsObject:", v13);

    if ((v14 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("GKMultiplayerDataSource.m"), 795, &stru_1E59EB978);

    }
    objc_msgSend(v17, "player");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setStatus:", -[GKMultiplayerDataSource statusForPlayer:](self, "statusForPlayer:", v15));

  }
LABEL_11:

}

- (void)didChangeMode
{
  id v3;

  -[GKMultiplayerDataSource refreshParticipantsStatuses](self, "refreshParticipantsStatuses");
  -[GKMultiplayerDataSource delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "didUpdateParticipants");

}

- (void)refreshParticipantsStatuses
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[GKMultiplayerDataSource participants](self, "participants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[GKMultiplayerDataSource refreshStatusForParticipant:](self, "refreshStatusForParticipant:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)updateParticipants
{
  uint64_t v0;
  NSObject *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8[6];
  uint64_t v9;

  OUTLINED_FUNCTION_4_0();
  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v4 = v3;
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "collectionViewDebugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("- START - uuid: %@, %@"), v0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v1, v7, "****** - GKCVC - %s \n%@", (uint8_t *)v8);

  OUTLINED_FUNCTION_0_5();
}

- (void)replacePlayers:(id)a3 withGKPlayers:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  GKMultiplayerDataSource *v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (!*MEMORY[0x1E0D25460])
    v11 = (id)GKOSLoggers();
  v12 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    v20 = v8;
    v21 = 2112;
    v22 = v9;
    _os_log_impl(&dword_1AB361000, v12, OS_LOG_TYPE_INFO, "Replace contactPlayers: %@ \nwith gkPlayers:%@", buf, 0x16u);
  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __74__GKMultiplayerDataSource_replacePlayers_withGKPlayers_completionHandler___block_invoke;
  v15[3] = &unk_1E59C54B8;
  v16 = v8;
  v17 = v9;
  v18 = self;
  v13 = v9;
  v14 = v8;
  -[GKCollectionViewDataSource notifyBatchUpdate:complete:](self, "notifyBatchUpdate:complete:", v15, v10);

}

void __74__GKMultiplayerDataSource_replacePlayers_withGKPlayers_completionHandler___block_invoke(id *a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSObject *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  uint8_t buf[4];
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "count");
  if (objc_msgSend(a1[5], "count") == v2)
  {
    if (v2 >= 1)
    {
      v4 = 0;
      *(_QWORD *)&v3 = 138412290;
      v32 = v3;
      v33 = v2;
      do
      {
        objc_msgSend(a1[4], "objectAtIndexedSubscript:", v4, v32);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1[6], "players");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = objc_msgSend(v6, "indexOfObject:", v5);

        if (v7 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (!*MEMORY[0x1E0D25460])
            v8 = (id)GKOSLoggers();
          v9 = *MEMORY[0x1E0D25470];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v32;
            v37 = v5;
            _os_log_error_impl(&dword_1AB361000, v9, OS_LOG_TYPE_ERROR, "error: tried to replace a player not in the data source: %@", buf, 0xCu);
          }
        }
        else
        {
          objc_msgSend(a1[5], "objectAtIndexedSubscript:", v4);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "playerStatus");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "internal");
          v35 = v5;
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "playerID");
          v34 = v7;
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "playerStatus");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "internal");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "playerID");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "setObject:forKeyedSubscript:", v14, v17);

          v18 = v10;
          v5 = v35;

          objc_msgSend(a1[6], "playerStatus");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "internal");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "playerID");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "removeObjectForKey:", v21);

          objc_msgSend(a1[6], "players");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "replaceObjectAtIndex:withObject:", v34, v10);

          objc_msgSend(a1[6], "orderedPlayerIDList");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "internal");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "playerID");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v23, "indexOfObject:", v25);

          if (v26 != 0x7FFFFFFFFFFFFFFFLL)
          {
            objc_msgSend(a1[6], "orderedPlayerIDList");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "internal");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "playerID");
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "replaceObjectAtIndex:withObject:", v26, v29);

          }
          v2 = v33;
        }

        ++v4;
      }
      while (v2 != v4);
    }
    objc_msgSend(a1[6], "updateParticipants");
  }
  else
  {
    if (!*MEMORY[0x1E0D25460])
      v30 = (id)GKOSLoggers();
    v31 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_ERROR))
      __74__GKMultiplayerDataSource_replacePlayers_withGKPlayers_completionHandler___block_invoke_cold_1(v31);
  }
}

- (void)replacePrepopulatedPlayerWithNormalPlayer:(id)a3 participantServerIdentifier:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(_QWORD);
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *v27;
  void *v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  id v35;
  uint8_t v36[128];
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(_QWORD))a5;
  if (!*MEMORY[0x1E0D25460])
    v11 = (id)GKOSLoggers();
  v12 = *MEMORY[0x1E0D25470];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v38 = v8;
    _os_log_impl(&dword_1AB361000, v12, OS_LOG_TYPE_INFO, "Replace a prepopulated player with normalPlayer:%@", buf, 0xCu);
  }
  v29 = v8;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[GKMultiplayerDataSource players](self, "players", self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v31;
LABEL_7:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v31 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v17);
      objc_msgSend(v18, "internal");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "playerID");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "isEqualToString:", v9);

      if ((v21 & 1) != 0)
        break;
      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v30, v36, 16);
        if (v15)
          goto LABEL_7;
        goto LABEL_13;
      }
    }
    v22 = v18;

    if (!v22)
      goto LABEL_16;
    v35 = v22;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v35, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v29;
    v34 = v29;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "replacePlayers:withGKPlayers:completionHandler:", v23, v25, v10);

  }
  else
  {
LABEL_13:

LABEL_16:
    v24 = v29;
    if (!*MEMORY[0x1E0D25460])
      v26 = (id)GKOSLoggers();
    v27 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v38 = v9;
      _os_log_impl(&dword_1AB361000, v27, OS_LOG_TYPE_INFO, "Cannot find matching prepopulated player for participantID: %@", buf, 0xCu);
    }
    if (v10)
      v10[2](v10);
  }

}

- (void)removePrepopulatedPlayersIfExisted:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  NSObject *v18;
  GKMultiplayerDataSource *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  id v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v20 = a4;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v19 = self;
  -[GKMultiplayerDataSource players](self, "players");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v13, "internal");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "playerID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v6, "containsObject:", v15);

        if (v16)
          objc_msgSend(v7, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
    }
    while (v10);
  }

  if (objc_msgSend(v7, "count"))
  {
    if (!*MEMORY[0x1E0D25460])
      v17 = (id)GKOSLoggers();
    v18 = *MEMORY[0x1E0D25470];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D25470], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl(&dword_1AB361000, v18, OS_LOG_TYPE_INFO, "found prepopulated players matching removed participants' server identifiers. serverIdentifiers: %@", buf, 0xCu);
    }
    -[GKMultiplayerDataSource removePlayers:complete:](v19, "removePlayers:complete:", v7, v20);
  }

}

- (void)clearDataSource
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[GKMultiplayerDataSource players](self, "players", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        -[GKMultiplayerDataSource updateDataStructuresForRemovedPlayer:](self, "updateDataStructuresForRemovedPlayer:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  -[GKMultiplayerDataSource updateParticipants](self, "updateParticipants");
}

- (void)restoreOrderOfPlayers
{
  void *v3;
  void *v4;
  NSMutableOrderedSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  -[NSMutableOrderedSet valueForKeyPath:](self->_players, "valueForKeyPath:", CFSTR("internal.playerID"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableOrderedSet unionOrderedSet:](self->_orderedPlayerIDList, "unionOrderedSet:", v3);
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSetWithCapacity:", -[NSMutableOrderedSet count](self->_players, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = self->_orderedPlayerIDList;
  v6 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        v10 = objc_msgSend(v3, "indexOfObject:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v9), (_QWORD)v12);
        if (v10 != 0x7FFFFFFFFFFFFFFFLL)
        {
          -[NSMutableOrderedSet objectAtIndexedSubscript:](self->_players, "objectAtIndexedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "addObject:", v11);

        }
        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableOrderedSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  -[GKMultiplayerDataSource setPlayers:](self, "setPlayers:", v4);
}

- (void)reportMultiplayerSelection:(id)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = a3;
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v21;
    v6 = *MEMORY[0x1E0D25090];
    v7 = *MEMORY[0x1E0D25080];
    v8 = *MEMORY[0x1E0D25098];
    v9 = *MEMORY[0x1E0D25088];
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v21 != v5)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "contact");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "reportEvent:type:", v6, v7);

        }
        objc_msgSend(v11, "friendPlayedWith");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {

        }
        else
        {
          objc_msgSend(v11, "friendPlayedNearby");
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
            goto LABEL_12;
        }
        objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "reportEvent:type:", v6, v8);

LABEL_12:
        objc_msgSend(v11, "friendBiDirectional");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          objc_msgSend(MEMORY[0x1E0D253C0], "reporter");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "reportEvent:type:", v6, v9);

        }
      }
      v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v4);
  }

}

- (GKMultiplayerDataSourceDelegate)delegate
{
  return (GKMultiplayerDataSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (int64_t)minPlayers
{
  return self->_minPlayers;
}

- (void)setMinPlayers:(int64_t)a3
{
  self->_minPlayers = a3;
}

- (int64_t)maxPlayers
{
  return self->_maxPlayers;
}

- (void)setMaxPlayers:(int64_t)a3
{
  self->_maxPlayers = a3;
}

- (int64_t)automatchPlayerCount
{
  return self->_automatchPlayerCount;
}

- (int64_t)implicitAutomatchPlayerCount
{
  return self->_implicitAutomatchPlayerCount;
}

- (void)setImplicitAutomatchPlayerCount:(int64_t)a3
{
  self->_implicitAutomatchPlayerCount = a3;
}

- (BOOL)automatchAddedToMinInHeader
{
  return self->_automatchAddedToMinInHeader;
}

- (void)setAutomatchAddedToMinInHeader:(BOOL)a3
{
  self->_automatchAddedToMinInHeader = a3;
}

- (BOOL)removingEnabled
{
  return self->_removingEnabled;
}

- (void)setRemovingEnabled:(BOOL)a3
{
  self->_removingEnabled = a3;
}

- (BOOL)invitingEnabled
{
  return self->_invitingEnabled;
}

- (void)setInvitingEnabled:(BOOL)a3
{
  self->_invitingEnabled = a3;
}

- (NSMutableOrderedSet)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_players, a3);
}

- (BOOL)autoMatching
{
  return self->_autoMatching;
}

- (BOOL)sharePlayEnabled
{
  return self->_sharePlayEnabled;
}

- (void)setSharePlayEnabled:(BOOL)a3
{
  self->_sharePlayEnabled = a3;
}

- (NSSet)selectedMessageGroups
{
  return self->_selectedMessageGroups;
}

- (void)setSelectedMessageGroups:(id)a3
{
  objc_storeStrong((id *)&self->_selectedMessageGroups, a3);
}

- (GKGame)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (NSMutableDictionary)playerStatus
{
  return self->_playerStatus;
}

- (void)setPlayerStatus:(id)a3
{
  objc_storeStrong((id *)&self->_playerStatus, a3);
}

- (NSMutableOrderedSet)orderedPlayerIDList
{
  return self->_orderedPlayerIDList;
}

- (void)setOrderedPlayerIDList:(id)a3
{
  objc_storeStrong((id *)&self->_orderedPlayerIDList, a3);
}

- (int64_t)automatchPlayersAddedByUser
{
  return self->_automatchPlayersAddedByUser;
}

- (void)setAutomatchPlayersAddedByUser:(int64_t)a3
{
  self->_automatchPlayersAddedByUser = a3;
}

- (GKMultiplayerParticipant)placeholderItem
{
  return self->_placeholderItem;
}

- (void)setPlaceholderItem:(id)a3
{
  objc_storeStrong((id *)&self->_placeholderItem, a3);
}

- (os_unfair_lock_s)automatchPlayerCountLock
{
  return self->_automatchPlayerCountLock;
}

- (void)setAutomatchPlayerCountLock:(os_unfair_lock_s)a3
{
  self->_automatchPlayerCountLock = a3;
}

- (NSString)pageId
{
  return self->_pageId;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pageId, 0);
  objc_storeStrong((id *)&self->_placeholderItem, 0);
  objc_storeStrong((id *)&self->_orderedPlayerIDList, 0);
  objc_storeStrong((id *)&self->_playerStatus, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_selectedMessageGroups, 0);
  objc_storeStrong((id *)&self->_players, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)addPlayers:withStatus:replaceAutomatches:complete:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8[6];
  uint64_t v9;

  OUTLINED_FUNCTION_4_0();
  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v4 = v3;
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "collectionViewDebugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("uuid: %@, %@"), v0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v1, v7, "****** - GKCVC - %s \n%@", (uint8_t *)v8);

  OUTLINED_FUNCTION_0_5();
}

void __77__GKMultiplayerDataSource_addPlayers_withStatus_replaceAutomatches_complete___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9[6];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "collectionViewDebugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("- END - uuid: %@, completed with %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v2, v8, "****** - GKCVC - %s \n%@", (uint8_t *)v9);

  OUTLINED_FUNCTION_0_5();
}

- (void)removePlayers:complete:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8[6];
  uint64_t v9;

  OUTLINED_FUNCTION_4_0();
  v9 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v4 = v3;
  objc_msgSend((id)OUTLINED_FUNCTION_7_0(), "collectionViewDebugDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("uuid: %@, %@"), v0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v1, v7, "****** - GKCVC - %s \n%@", (uint8_t *)v8);

  OUTLINED_FUNCTION_0_5();
}

void __50__GKMultiplayerDataSource_removePlayers_complete___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  int v9[6];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "collectionViewDebugDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("- END - uuid: %@, completed with %@"), v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v2, v8, "****** - GKCVC - %s \n%@", (uint8_t *)v9);

  OUTLINED_FUNCTION_0_5();
}

- (void)setStatus:(void *)a1 forPlayers:uuid:.cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a1;
  OUTLINED_FUNCTION_8_0();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("- MIDDLE 9 - uuid: %@, no refresh is needed as index path count is 0"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v1, v5, "****** - GKCVC - %s \n%@", (uint8_t *)v6);

  OUTLINED_FUNCTION_0_5();
}

- (void)setStatus:(void *)a1 forPlayers:uuid:.cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a1;
  OUTLINED_FUNCTION_8_0();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("- MIDDLE 7 - uuid: %@, refreshing index paths:"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v1, v5, "****** - GKCVC - %s \n%@", (uint8_t *)v6);

  OUTLINED_FUNCTION_0_5();
}

void __57__GKMultiplayerDataSource_setStatus_forPlayers_complete___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, void *a3)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int v10[6];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = *(_QWORD *)(a1 + 48);
  v6 = a3;
  objc_msgSend((id)OUTLINED_FUNCTION_6_0(), "collectionViewDebugDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("- END - uuid: %@, completed with %@"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v3, v9, "****** - GKCVC - %s \n%@", (uint8_t *)v10);

  OUTLINED_FUNCTION_0_5();
}

- (void)failedToInvitePlayers:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7[6];
  uint64_t v8;

  OUTLINED_FUNCTION_4_0();
  v8 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v4 = v3;
  objc_msgSend(v2, "stringWithFormat:", CFSTR("- END - uuid: %@, failedPlayers: %@"), v1, v0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v4, v6, "****** - GKCVC - %s \n%@", (uint8_t *)v7);

  OUTLINED_FUNCTION_0_5();
}

- (void)failedToInvitePlayers:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;
  int v6[6];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB3940];
  v3 = a1;
  OUTLINED_FUNCTION_8_0();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("- START - uuid: %@"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = 136315394;
  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_3(&dword_1AB361000, v1, v5, "****** - GKCVC - %s \n%@", (uint8_t *)v6);

  OUTLINED_FUNCTION_0_5();
}

void __74__GKMultiplayerDataSource_replacePlayers_withGKPlayers_completionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AB361000, log, OS_LOG_TYPE_ERROR, "replacePlayers: error: number of contact players and normal players doesn't match, can't replace!", v1, 2u);
}

@end
