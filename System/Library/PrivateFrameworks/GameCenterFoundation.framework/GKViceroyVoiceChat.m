@implementation GKViceroyVoiceChat

- (GKViceroyVoiceChat)initWithName:(id)a3 connection:(id)a4 gkSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  GKViceroyVoiceChat *v11;
  GKViceroyVoiceChat *v12;
  uint64_t v13;
  GKVoiceChatSession *voiceChatSession;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)GKViceroyVoiceChat;
  v11 = -[GKViceroyVoiceChat init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_connection, a4);
    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D25C90]), "initWithGKSession:sessionName:", v10, v8);
    voiceChatSession = v12->_voiceChatSession;
    v12->_voiceChatSession = (GKVoiceChatSession *)v13;

    -[GKVoiceChatSession setDelegate:](v12->_voiceChatSession, "setDelegate:", v12);
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[GKViceroyVoiceChat voiceChatSession](self, "voiceChatSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  v4.receiver = self;
  v4.super_class = (Class)GKViceroyVoiceChat;
  -[GKViceroyVoiceChat dealloc](&v4, sel_dealloc);
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[GKViceroyVoiceChat voiceChatSession](self, "voiceChatSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[GKViceroyVoiceChat voiceChatSession](self, "voiceChatSession");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setActiveSession:", v3);

}

- (BOOL)isActive
{
  void *v2;
  char v3;

  -[GKViceroyVoiceChat voiceChatSession](self, "voiceChatSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActiveSession");

  return v3;
}

- (void)setVolume:(float)a3
{
  double v4;
  id v5;

  -[GKViceroyVoiceChat voiceChatSession](self, "voiceChatSession");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setSessionVolume:", v4);

}

- (float)volume
{
  void *v2;
  float v3;
  float v4;

  -[GKViceroyVoiceChat voiceChatSession](self, "voiceChatSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionVolume");
  v4 = v3;

  return v4;
}

- (void)setMuted:(BOOL)a3 forPlayerID:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  id v11;

  v4 = a3;
  v6 = a4;
  -[GKViceroyVoiceChat connection](self, "connection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  v8 = objc_msgSend(v7, "convertParticipantID:toPeerID:", v6, &v11);

  v9 = v11;
  if (v8)
  {
    -[GKViceroyVoiceChat voiceChatSession](self, "voiceChatSession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setMute:forPeer:", v4, v9);

  }
}

- (void)setStateUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_weakStateUpdateDelegate, a3);
}

- (void)start
{
  id v2;

  -[GKViceroyVoiceChat voiceChatSession](self, "voiceChatSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startSession");

}

- (void)stop
{
  id v2;

  -[GKViceroyVoiceChat voiceChatSession](self, "voiceChatSession");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopSession");

}

- (void)gkVoiceChatSession:(id)a3 stateUpdate:(unint64_t)a4 forPeer:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  void *v12;
  id v13;

  v7 = a5;
  -[GKViceroyVoiceChat stateUpdateDelegate](self, "stateUpdateDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[GKViceroyVoiceChat connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 0;
    v10 = objc_msgSend(v9, "convertPeerID:toParticipantID:", v7, &v13);
    v11 = v13;

    if (v10)
    {
      -[GKViceroyVoiceChat stateUpdateDelegate](self, "stateUpdateDelegate");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "stateUpdate:forPlayerID:", a4, v11);

    }
  }

}

- (GKConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (GKVoiceChatSession)voiceChatSession
{
  return self->_voiceChatSession;
}

- (void)setVoiceChatSession:(id)a3
{
  objc_storeStrong((id *)&self->_voiceChatSession, a3);
}

- (GKViceroyVoiceChatStateUpdateDelegate)stateUpdateDelegate
{
  return (GKViceroyVoiceChatStateUpdateDelegate *)objc_loadWeakRetained((id *)&self->_weakStateUpdateDelegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_weakStateUpdateDelegate);
  objc_storeStrong((id *)&self->_voiceChatSession, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end
