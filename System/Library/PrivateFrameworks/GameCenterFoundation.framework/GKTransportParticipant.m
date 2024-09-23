@implementation GKTransportParticipant

+ (id)secureCodedPropertyKeys
{
  if (secureCodedPropertyKeys_onceToken_15 != -1)
    dispatch_once(&secureCodedPropertyKeys_onceToken_15, &__block_literal_global_55);
  return (id)secureCodedPropertyKeys_sSecureCodedKeys_15;
}

void __49__GKTransportParticipant_secureCodedPropertyKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[2];
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("playerID");
  v2[1] = CFSTR("pseudonym");
  v3[0] = objc_opt_class();
  v3[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 2);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)secureCodedPropertyKeys_sSecureCodedKeys_15;
  secureCodedPropertyKeys_sSecureCodedKeys_15 = v0;

}

- (GKTransportParticipant)initWithPlayerID:(id)a3 pseudonym:(id)a4
{
  id v6;
  id v7;
  GKTransportParticipant *v8;
  GKTransportParticipant *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)GKTransportParticipant;
  v8 = -[GKTransportParticipant init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[GKTransportParticipant setPlayerID:](v8, "setPlayerID:", v6);
    -[GKTransportParticipant setPseudonym:](v9, "setPseudonym:", v7);
  }

  return v9;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[GKTransportParticipant playerID](self, "playerID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTransportParticipant pseudonym](self, "pseudonym");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("GKTransportParticipant<%p>[%@, %@]"), self, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)participantsFrom:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  GKTransportParticipant *v20;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v22 = v6;
  v23 = v5;
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("pid"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("ps"));
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
          v17 = v15 == 0;
        else
          v17 = 1;
        if (v17)
        {
          if (!os_log_GKGeneral)
            v18 = GKOSLoggers();
          v19 = os_log_GKFastSync;
          if (os_log_type_enabled((os_log_t)os_log_GKFastSync, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v29 = v14;
            v30 = 2112;
            v31 = v16;
            _os_log_impl(&dword_1BCDE3000, v19, OS_LOG_TYPE_INFO, "UpdateAfterInviteeAcceptedUserInfo cannot init participant. playerID(%@) or pseudonym(%@) is nil.", buf, 0x16u);
          }
        }
        else
        {
          v20 = -[GKTransportParticipant initWithPlayerID:pseudonym:]([GKTransportParticipant alloc], "initWithPlayerID:pseudonym:", v14, v15);
          objc_msgSend(v7, "addObject:", v20);

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)serverRepresentation
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  -[GKTransportParticipant playerID](self, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[GKTransportParticipant pseudonym](self, "pseudonym");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (!v3 || !v4)
  {
    v6 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringWithFormat:", CFSTR("Invalid participant info for: %@. Call Stack: %@"), self, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/GameCenter/Frameworks/GameCenterFoundation/gamed/GKMultiplayerServiceInterface.m");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "lastPathComponent");
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ (playerID != nil && pseudonym != nil)\n[%s (%s:%d)]"), v8, "-[GKTransportParticipant serverRepresentation]", objc_msgSend(v10, "UTF8String"), 132);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", CFSTR("GameKit Exception"), CFSTR("%@"), v11);
  }
  v14[0] = CFSTR("pid");
  v14[1] = CFSTR("ps");
  v15[0] = v3;
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(v5, "playerID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[GKTransportParticipant playerID](self, "playerID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", v7))
    {
      objc_msgSend(v5, "pseudonym");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[GKTransportParticipant pseudonym](self, "pseudonym");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "isEqualToString:", v9);

    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;

  -[GKTransportParticipant playerID](self, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[GKTransportParticipant pseudonym](self, "pseudonym");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;

  return v6;
}

- (NSString)playerID
{
  return self->_playerID;
}

- (void)setPlayerID:(id)a3
{
  objc_storeStrong((id *)&self->_playerID, a3);
}

- (NSString)pseudonym
{
  return self->_pseudonym;
}

- (void)setPseudonym:(id)a3
{
  objc_storeStrong((id *)&self->_pseudonym, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pseudonym, 0);
  objc_storeStrong((id *)&self->_playerID, 0);
}

@end
