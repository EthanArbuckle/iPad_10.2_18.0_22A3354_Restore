@implementation GKVoiceChat

- (GKVoiceChat)initWithViceroyVoiceChat:(id)a3 players:(id)a4
{
  id v7;
  id v8;
  GKVoiceChat *v9;
  GKVoiceChat *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)GKVoiceChat;
  v9 = -[GKVoiceChat init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_gkVoiceChat, a3);
    -[GKViceroyVoiceChat setStateUpdateDelegate:](v10->_gkVoiceChat, "setStateUpdateDelegate:", v10);
    objc_msgSend(v8, "_gkValidatePlayersForReturnFromAPI");
    objc_storeStrong((id *)&v10->_players, a4);
  }
  +[GKReporter reporter](GKReporter, "reporter");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reportEvent:type:", CFSTR("com.apple.GameKit.match"), CFSTR("voiceChatInit"));

  +[GKAPIReporter reporter](GKAPIReporter, "reporter");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "recordVoiceChat");

  return v10;
}

- (void)start
{
  id v2;

  -[GKVoiceChat gkVoiceChat](self, "gkVoiceChat");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "start");

}

- (void)stop
{
  id v2;

  -[GKVoiceChat gkVoiceChat](self, "gkVoiceChat");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stop");

}

- (void)setPlayer:(GKPlayer *)player muted:(BOOL)isMuted
{
  _BOOL8 v4;
  GKPlayer *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = isMuted;
  v6 = player;
  -[GKVoiceChat gkVoiceChat](self, "gkVoiceChat");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[GKPlayer internal](v6, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "playerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setMuted:forPlayerID:", v4, v8);

}

- (void)setMute:(BOOL)isMuted forPlayer:(NSString *)playerID
{
  _BOOL8 v4;
  NSString *v6;
  id v7;

  v4 = isMuted;
  v6 = playerID;
  -[GKVoiceChat gkVoiceChat](self, "gkVoiceChat");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setMuted:forPlayerID:", v4, v6);

}

- (NSString)name
{
  void *v2;
  void *v3;

  -[GKVoiceChat gkVoiceChat](self, "gkVoiceChat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setActive:(BOOL)active
{
  _BOOL8 v3;
  id v4;

  v3 = active;
  -[GKVoiceChat gkVoiceChat](self, "gkVoiceChat");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActive:", v3);

}

- (BOOL)isActive
{
  void *v2;
  char v3;

  -[GKVoiceChat gkVoiceChat](self, "gkVoiceChat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActive");

  return v3;
}

- (void)setVolume:(float)volume
{
  double v4;
  id v5;

  -[GKVoiceChat gkVoiceChat](self, "gkVoiceChat");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = volume;
  objc_msgSend(v5, "setVolume:", v4);

}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[GKVoiceChat gkVoiceChat](self, "gkVoiceChat");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "volume");
  v4 = v3;

  return v4;
}

- (void)stateUpdate:(int64_t)a3 forPlayerID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD);
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, uint64_t, _BYTE *);
  void *v18;
  id v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  -[GKVoiceChat playerVoiceChatStateDidChangeHandler](self, "playerVoiceChatStateDidChangeHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v21 = 0;
    v22 = &v21;
    v23 = 0x3032000000;
    v24 = __Block_byref_object_copy__0;
    v25 = __Block_byref_object_dispose__0;
    v26 = 0;
    -[GKVoiceChat players](self, "players");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __39__GKVoiceChat_stateUpdate_forPlayerID___block_invoke;
    v18 = &unk_1E75B13C8;
    v9 = v6;
    v19 = v9;
    v20 = &v21;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", &v15);

    if (v22[5])
    {
      -[GKVoiceChat playerVoiceChatStateDidChangeHandler](self, "playerVoiceChatStateDidChangeHandler", v15, v16, v17, v18);
      v10 = objc_claimAutoreleasedReturnValue();
      ((void (*)(NSObject *, uint64_t, int64_t))v10[2].isa)(v10, v22[5], a3);
    }
    else
    {
      if (!os_log_GKGeneral)
        v13 = GKOSLoggers();
      v10 = (id)os_log_GKMatch;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[GKVoiceChat players](self, "players", v15, v16, v17, v18);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v28 = v9;
        v29 = 2112;
        v30 = v14;
        _os_log_impl(&dword_1BCDE3000, v10, OS_LOG_TYPE_INFO, "cannot find player for participant %@ (%@)", buf, 0x16u);

      }
    }

    _Block_object_dispose(&v21, 8);
  }
  else
  {
    -[GKVoiceChat playerStateUpdateHandler](self, "playerStateUpdateHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[GKVoiceChat playerStateUpdateHandler](self, "playerStateUpdateHandler");
      v12 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, int64_t))v12)[2](v12, v6, a3);

    }
  }

}

void __39__GKVoiceChat_stateUpdate_forPlayerID___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "internal");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "playerID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v9)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a4 = 1;
  }

}

+ (BOOL)isVoIPAllowed
{
  void *v2;
  void *v3;

  if ((isVoIPAllowed_voipStatusIsCached & 1) == 0)
  {
    v2 = (void *)MGCopyAnswer();
    v3 = v2;
    if (v2)
      isVoIPAllowed_voipIsAllowed = objc_msgSend(v2, "BOOLValue") ^ 1;
    isVoIPAllowed_voipStatusIsCached = 1;

  }
  return isVoIPAllowed_voipIsAllowed;
}

- (NSArray)playerIDs
{
  id v3;
  NSObject *v4;
  void *v6;
  void *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (GKApplicationLinkedOnOrAfter())
  {
    if (!os_log_GKGeneral)
      v3 = GKOSLoggers();
    v4 = os_log_GKDeveloper;
    if (os_log_type_enabled((os_log_t)os_log_GKDeveloper, OS_LOG_TYPE_ERROR))
      -[GKVoiceChat playerIDs].cold.1(v4);
    v8[0] = CFSTR("playerID is no longer available");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[GKVoiceChat players](self, "players");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_gkMapWithBlock:", &__block_literal_global);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return (NSArray *)v7;
  }
}

id __24__GKVoiceChat_playerIDs__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "internal");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "playerID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSArray)players
{
  return self->_players;
}

- (void)setPlayers:(id)a3
{
  objc_storeStrong((id *)&self->_players, a3);
}

- (void)playerStateUpdateHandler
{
  return self->_playerStateUpdateHandler;
}

- (void)setPlayerStateUpdateHandler:(void *)playerStateUpdateHandler
{
  objc_setProperty_nonatomic_copy(self, a2, playerStateUpdateHandler, 16);
}

- (void)playerVoiceChatStateDidChangeHandler
{
  return self->_playerVoiceChatStateDidChangeHandler;
}

- (void)setPlayerVoiceChatStateDidChangeHandler:(void *)playerVoiceChatStateDidChangeHandler
{
  objc_setProperty_nonatomic_copy(self, a2, playerVoiceChatStateDidChangeHandler, 24);
}

- (GKViceroyVoiceChat)gkVoiceChat
{
  return self->_gkVoiceChat;
}

- (void)setGkVoiceChat:(id)a3
{
  objc_storeStrong((id *)&self->_gkVoiceChat, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_gkVoiceChat, 0);
  objc_storeStrong(&self->_playerVoiceChatStateDidChangeHandler, 0);
  objc_storeStrong(&self->_playerStateUpdateHandler, 0);
  objc_storeStrong((id *)&self->_players, 0);
}

- (void)playerIDs
{
  int v1;
  const char *v2;
  __int16 v3;
  const __CFString *v4;
  __int16 v5;
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = 136446722;
  v2 = "-[GKVoiceChat playerIDs]";
  v3 = 2114;
  v4 = CFSTR("14.0");
  v5 = 2114;
  v6 = CFSTR("11.0");
  _os_log_error_impl(&dword_1BCDE3000, log, OS_LOG_TYPE_ERROR, "WARNING: %{public}s is obsoleted. Game Center doesn't invoke this obsoleted method from iOS/tvOS %{public}@ and macOS %{public}@ onwards", (uint8_t *)&v1, 0x20u);
}

@end
