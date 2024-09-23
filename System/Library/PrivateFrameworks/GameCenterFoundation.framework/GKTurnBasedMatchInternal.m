@implementation GKTurnBasedMatchInternal

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_23 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_23, &__block_literal_global_64);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_23;
}

void __51__GKTurnBasedMatchInternal_secureCodedPropertyKeys__block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v16[23];
  _QWORD v17[25];

  v17[23] = *MEMORY[0x1E0C80C00];
  v16[0] = CFSTR("matchID");
  v17[0] = objc_opt_class();
  v16[1] = CFSTR("status");
  v17[1] = objc_opt_class();
  v16[2] = CFSTR("creationDate");
  v17[2] = objc_opt_class();
  v16[3] = CFSTR("currentPlayer");
  v17[3] = objc_opt_class();
  v16[4] = CFSTR("lastTurnDate");
  v17[4] = objc_opt_class();
  v16[5] = CFSTR("message");
  v17[5] = objc_opt_class();
  v16[6] = CFSTR("localizableMessage");
  v0 = (void *)MEMORY[0x1E0C99E60];
  v1 = objc_opt_class();
  v2 = objc_opt_class();
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  objc_msgSend(v0, "setWithObjects:", v1, v2, v3, v4, objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17[6] = v5;
  v16[7] = CFSTR("reason");
  v17[7] = objc_opt_class();
  v16[8] = CFSTR("minPlayers");
  v17[8] = objc_opt_class();
  v16[9] = CFSTR("maxPlayers");
  v17[9] = objc_opt_class();
  v16[10] = CFSTR("deletionDate");
  v17[10] = objc_opt_class();
  v16[11] = CFSTR("currentParticipant");
  v17[11] = objc_opt_class();
  v16[12] = CFSTR("turnNumber");
  v17[12] = objc_opt_class();
  v16[13] = CFSTR("lastTurnPlayerID");
  v17[13] = objc_opt_class();
  v16[14] = CFSTR("matchData");
  v17[14] = objc_opt_class();
  v16[15] = CFSTR("participants");
  v6 = (void *)MEMORY[0x1E0C99E60];
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v6, "setWithObjects:", v7, v8, objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[15] = v9;
  v16[16] = CFSTR("matchDataVersion");
  v17[16] = objc_opt_class();
  v16[17] = CFSTR("bundleID");
  v17[17] = objc_opt_class();
  v16[18] = CFSTR("bundleVersion");
  v17[18] = objc_opt_class();
  v16[19] = CFSTR("shortBundleVersion");
  v17[19] = objc_opt_class();
  v16[20] = CFSTR("platform");
  v17[20] = objc_opt_class();
  v16[21] = CFSTR("exchanges");
  v10 = (void *)MEMORY[0x1E0C99E60];
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  objc_msgSend(v10, "setWithObjects:", v11, v12, objc_opt_class(), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v17[21] = v13;
  v16[22] = CFSTR("game");
  v17[22] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v17, v16, 23);
  v14 = objc_claimAutoreleasedReturnValue();

  v15 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_23;
  secureCodedPropertyKeys_sSecureCodedKeys_23 = v14;

}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[GKTurnBasedMatchInternal matchID](self, "matchID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[GKTurnBasedMatchInternal lastTurnDate](self, "lastTurnDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "lastTurnDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTurnBasedMatchInternal matchID](self, "matchID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "matchID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "isEqualToString:", v9)
      && (v6 == v7 || objc_msgSend(v6, "isEqualToDate:", v7)))
    {
      -[GKTurnBasedMatchInternal status](self, "status");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "status");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "isEqualToString:", v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)localPlayerParticipantIndex
{
  void *v2;
  int64_t v3;

  -[GKTurnBasedMatchInternal participants](self, "participants");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObjectPassingTest:", &__block_literal_global_59_0);

  return v3;
}

uint64_t __55__GKTurnBasedMatchInternal_localPlayerParticipantIndex__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "player");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLocalPlayer");

  return v3;
}

- (int64_t)previousParticipantIndex
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  void *v15;
  int64_t v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[GKTurnBasedMatchInternal participants](self, "participants", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "lastTurnDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          if (!v6
            || (objc_msgSend(v9, "lastTurnDate"),
                v11 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v6, "lastTurnDate"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                v13 = objc_msgSend(v11, "compare:", v12),
                v12,
                v11,
                v13 == 1))
          {
            v14 = v9;

            v6 = v14;
          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  -[GKTurnBasedMatchInternal participants](self, "participants");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "indexOfObject:", v6);

  return v16;
}

- (int64_t)activeExchangeCount
{
  void *v3;
  int v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  BOOL v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int64_t v20;
  const __CFString *v21;
  char v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  uint64_t v27;
  id obj;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  -[GKTurnBasedMatchInternal status](self, "status");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("Active"));

  if (!v4)
    return 0;
  v5 = -[GKTurnBasedMatchInternal localPlayerParticipantIndex](self, "localPlayerParticipantIndex");
  -[GKTurnBasedMatchInternal exchanges](self, "exchanges");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v34;
    v10 = CFSTR("A");
    do
    {
      v11 = 0;
      v27 = v7;
      do
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
        objc_msgSend(v12, "statusString", v27);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", v10);

        if (v14)
          v15 = v5 == 0x7FFFFFFFFFFFFFFFLL;
        else
          v15 = 1;
        if (!v15)
        {
          objc_msgSend(v12, "replies");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = 0u;
          v30 = 0u;
          v31 = 0u;
          v32 = 0u;
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
          if (v17)
          {
            v18 = v17;
            v19 = v9;
            v20 = v8;
            v21 = v10;
            v22 = 0;
            v23 = *(_QWORD *)v30;
            do
            {
              for (i = 0; i != v18; ++i)
              {
                if (*(_QWORD *)v30 != v23)
                  objc_enumerationMutation(v16);
                v22 |= v5 == objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "recipientIndex");
              }
              v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
            }
            while (v18);
            v25 = (v22 & 1) == 0;
            v10 = v21;
            v8 = v20;
            v9 = v19;
            v7 = v27;
          }
          else
          {
            v25 = 1;
          }
          v8 += v25;

        }
        ++v11;
      }
      while (v11 != v7);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unsigned)state
{
  unsigned int state;
  void *v4;
  void *v5;
  int v6;
  int v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  int64_t v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  char v24;
  void *v25;
  int v26;
  void *v27;
  int v28;
  void *v29;
  void *v30;
  char v31;
  NSObject *v32;
  id v33;
  void *v34;
  int v35;

  state = self->_state;
  if (!state)
  {
    if (-[GKTurnBasedMatchInternal activeExchangeCount](self, "activeExchangeCount") > 0)
    {
      state = 2;
LABEL_38:
      self->_state = state;
      return state;
    }
    -[GKTurnBasedMatchInternal status](self, "status");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", CFSTR("Active")))
    {

    }
    else
    {
      -[GKTurnBasedMatchInternal status](self, "status");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("Matching"));

      if (!v6)
      {
        -[GKTurnBasedMatchInternal status](self, "status");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("Complete"));

        if ((v31 & 1) != 0)
        {
          state = 5;
        }
        else
        {
          v32 = os_log_GKGeneral;
          if (!os_log_GKGeneral)
          {
            v33 = GKOSLoggers();
            v32 = os_log_GKGeneral;
          }
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
            -[GKTurnBasedMatchInternal state].cold.1(v32, self);
          state = 3;
        }
        goto LABEL_38;
      }
    }
    v7 = -[GKTurnBasedMatchInternal currentParticipant](self, "currentParticipant");
    if (v7 < 0
      || (v8 = v7,
          -[GKTurnBasedMatchInternal participants](self, "participants"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v10 = objc_msgSend(v9, "count"),
          v9,
          v10 <= v8))
    {
      v12 = 0;
    }
    else
    {
      -[GKTurnBasedMatchInternal participants](self, "participants");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectAtIndexedSubscript:", v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v13 = -[GKTurnBasedMatchInternal localPlayerParticipantIndex](self, "localPlayerParticipantIndex");
    if (v13 < 0
      || (v14 = v13,
          -[GKTurnBasedMatchInternal participants](self, "participants"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "count"),
          v15,
          v14 >= v16))
    {
      v18 = 0;
    }
    else
    {
      -[GKTurnBasedMatchInternal participants](self, "participants");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "objectAtIndexedSubscript:", v14);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (v18)
      {
        objc_msgSend(v18, "status");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "isEqualToString:", CFSTR("Inactive"));

        if ((v20 & 1) != 0)
        {
          state = 5;
LABEL_37:

          goto LABEL_38;
        }
      }
    }
    objc_msgSend(v12, "player");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v21, "isGuestPlayer") & 1) != 0)
    {
      objc_msgSend(v12, "player");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "hostPlayerInternal");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isLocalPlayer");

      if ((v24 & 1) != 0)
      {
        state = 6;
        goto LABEL_37;
      }
    }
    else
    {

    }
    objc_msgSend(v12, "player");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "isLocalPlayer");

    if (v26)
    {
      objc_msgSend(v12, "status");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v28 = objc_msgSend(v27, "isEqualToString:", CFSTR("Invited"));

      if (v28)
        state = 1;
      else
        state = 3;
    }
    else
    {
      -[GKTurnBasedMatchInternal participants](self, "participants");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v29, "count"))
      {

        state = 4;
      }
      else
      {
        objc_msgSend(v12, "player");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v35 = objc_msgSend(v34, "isLocalPlayer");

        if (v35)
          state = 3;
        else
          state = 4;
      }
    }
    goto LABEL_37;
  }
  return state;
}

- (void)setState:(unsigned int)a3
{
  self->_state = a3;
}

- (id)descriptionSubstitutionMap
{
  return &unk_1E75FB2D0;
}

- (NSString)matchID
{
  return self->_matchID;
}

- (void)setMatchID:(id)a3
{
  objc_storeStrong((id *)&self->_matchID, a3);
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
  objc_storeStrong((id *)&self->_status, a3);
}

- (NSDate)creationDate
{
  return self->_creationDate;
}

- (void)setCreationDate:(id)a3
{
  objc_storeStrong((id *)&self->_creationDate, a3);
}

- (GKPlayerInternal)currentPlayer
{
  return self->_currentPlayer;
}

- (void)setCurrentPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_currentPlayer, a3);
}

- (NSDate)lastTurnDate
{
  return self->_lastTurnDate;
}

- (void)setLastTurnDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastTurnDate, a3);
}

- (NSString)message
{
  return self->_message;
}

- (void)setMessage:(id)a3
{
  objc_storeStrong((id *)&self->_message, a3);
}

- (NSDictionary)localizableMessage
{
  return self->_localizableMessage;
}

- (void)setLocalizableMessage:(id)a3
{
  objc_storeStrong((id *)&self->_localizableMessage, a3);
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
  objc_storeStrong((id *)&self->_reason, a3);
}

- (unsigned)minPlayers
{
  return self->_minPlayers;
}

- (void)setMinPlayers:(unsigned __int8)a3
{
  self->_minPlayers = a3;
}

- (unsigned)maxPlayers
{
  return self->_maxPlayers;
}

- (void)setMaxPlayers:(unsigned __int8)a3
{
  self->_maxPlayers = a3;
}

- (NSDate)deletionDate
{
  return self->_deletionDate;
}

- (void)setDeletionDate:(id)a3
{
  objc_storeStrong((id *)&self->_deletionDate, a3);
}

- (char)currentParticipant
{
  return self->_currentParticipant;
}

- (void)setCurrentParticipant:(char)a3
{
  self->_currentParticipant = a3;
}

- (unsigned)turnNumber
{
  return self->_turnNumber;
}

- (void)setTurnNumber:(unsigned int)a3
{
  self->_turnNumber = a3;
}

- (NSString)lastTurnPlayerID
{
  return self->_lastTurnPlayerID;
}

- (void)setLastTurnPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_lastTurnPlayerID, a3);
}

- (NSData)matchData
{
  return self->_matchData;
}

- (void)setMatchData:(id)a3
{
  objc_storeStrong((id *)&self->_matchData, a3);
}

- (NSArray)participants
{
  return self->_participants;
}

- (void)setParticipants:(id)a3
{
  objc_storeStrong((id *)&self->_participants, a3);
}

- (NSString)matchDataVersion
{
  return self->_matchDataVersion;
}

- (void)setMatchDataVersion:(id)a3
{
  objc_storeStrong((id *)&self->_matchDataVersion, a3);
}

- (NSString)bundleID
{
  return self->_bundleID;
}

- (void)setBundleID:(id)a3
{
  objc_storeStrong((id *)&self->_bundleID, a3);
}

- (NSString)bundleVersion
{
  return self->_bundleVersion;
}

- (void)setBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_bundleVersion, a3);
}

- (NSString)shortBundleVersion
{
  return self->_shortBundleVersion;
}

- (void)setShortBundleVersion:(id)a3
{
  objc_storeStrong((id *)&self->_shortBundleVersion, a3);
}

- (int64_t)platform
{
  return self->_platform;
}

- (void)setPlatform:(int64_t)a3
{
  self->_platform = a3;
}

- (NSArray)exchanges
{
  return self->_exchanges;
}

- (void)setExchanges:(id)a3
{
  objc_storeStrong((id *)&self->_exchanges, a3);
}

- (GKGameInternal)game
{
  return self->_game;
}

- (void)setGame:(id)a3
{
  objc_storeStrong((id *)&self->_game, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_exchanges, 0);
  objc_storeStrong((id *)&self->_game, 0);
  objc_storeStrong((id *)&self->_shortBundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleVersion, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_matchDataVersion, 0);
  objc_storeStrong((id *)&self->_matchData, 0);
  objc_storeStrong((id *)&self->_lastTurnPlayerID, 0);
  objc_storeStrong((id *)&self->_currentPlayer, 0);
  objc_storeStrong((id *)&self->_deletionDate, 0);
  objc_storeStrong((id *)&self->_lastTurnDate, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_localizableMessage, 0);
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_matchID, 0);
}

- (void)state
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "status");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_1BCDE3000, v3, OS_LOG_TYPE_DEBUG, "GKTurnBasedMatchInternal->state Unexpected match status encountered: %@", (uint8_t *)&v5, 0xCu);

}

@end
