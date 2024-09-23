@implementation GKVoiceChatService

- (GKVoiceChatService)init
{
  GKVoiceChatService *v2;
  uint64_t v3;
  GKViceroyVoiceChatService *voiceChatService;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)GKVoiceChatService;
  v2 = -[GKVoiceChatService init](&v6, sel_init);
  if (v2)
  {
    +[GKViceroyVoiceChatServiceFactory makeService](GKViceroyVoiceChatServiceFactory, "makeService");
    v3 = objc_claimAutoreleasedReturnValue();
    voiceChatService = v2->_voiceChatService;
    v2->_voiceChatService = (GKViceroyVoiceChatService *)v3;

  }
  return v2;
}

+ (void)initialize
{
  objc_opt_class();
}

+ (GKVoiceChatService)defaultVoiceChatService
{
  void *v2;
  void *v3;
  GKVoiceChatService *v4;
  void *v5;

  v2 = (void *)defaultVoiceChatService__GKVoiceChatService;
  if (!defaultVoiceChatService__GKVoiceChatService)
  {
    objc_opt_class();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v3);
    if (!defaultVoiceChatService__GKVoiceChatService)
    {
      v4 = objc_alloc_init(GKVoiceChatService);
      v5 = (void *)defaultVoiceChatService__GKVoiceChatService;
      defaultVoiceChatService__GKVoiceChatService = (uint64_t)v4;

    }
    objc_sync_exit(v3);

    v2 = (void *)defaultVoiceChatService__GKVoiceChatService;
  }
  return (GKVoiceChatService *)v2;
}

- (id)client
{
  void *v2;
  void *v3;

  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setClient:(id)client
{
  id v4;
  id v5;

  v4 = client;
  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClient:gkVoiceChatService:", v4, self);

}

- (BOOL)startVoiceChatWithParticipantID:(NSString *)participantID error:(NSError *)error
{
  NSString *v6;
  void *v7;

  v6 = participantID;
  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = objc_msgSend(v7, "startVoiceChatWithParticipantID:error:", v6, error);

  return (char)error;
}

- (void)stopVoiceChatWithParticipantID:(NSString *)participantID
{
  NSString *v4;
  id v5;

  v4 = participantID;
  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopVoiceChatWithParticipantID:", v4);

}

- (BOOL)acceptCallID:(NSInteger)callID error:(NSError *)error
{
  unsigned int v5;
  void *v6;

  v5 = callID;
  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(error) = objc_msgSend(v6, "acceptCallID:error:", v5, error);

  return (char)error;
}

- (void)denyCallID:(NSInteger)callID
{
  unsigned int v3;
  id v4;

  v3 = callID;
  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "denyCallID:", v3);

}

- (void)receivedData:(NSData *)arbitraryData fromParticipantID:(NSString *)participantID
{
  NSString *v6;
  NSData *v7;
  id v8;

  v6 = participantID;
  v7 = arbitraryData;
  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "receivedData:fromParticipantID:", v7, v6);

}

- (void)setMicrophoneMuted:(BOOL)microphoneMuted
{
  _BOOL8 v3;
  id v4;

  v3 = microphoneMuted;
  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMicrophoneMuted:", v3);

}

- (BOOL)isMicrophoneMuted
{
  void *v2;
  char v3;

  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMicrophoneMuted");

  return v3;
}

- (float)remoteParticipantVolume
{
  void *v2;
  float v3;
  float v4;

  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteParticipantVolume");
  v4 = v3;

  return v4;
}

- (void)setRemoteParticipantVolume:(float)remoteParticipantVolume
{
  double v4;
  id v5;

  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = remoteParticipantVolume;
  objc_msgSend(v5, "setRemoteParticipantVolume:", v4);

}

- (BOOL)isOutputMeteringEnabled
{
  void *v2;
  char v3;

  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOutputMeteringEnabled");

  return v3;
}

- (void)setOutputMeteringEnabled:(BOOL)outputMeteringEnabled
{
  _BOOL8 v3;
  id v4;

  v3 = outputMeteringEnabled;
  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutputMeteringEnabled:", v3);

}

- (BOOL)isInputMeteringEnabled
{
  void *v2;
  char v3;

  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInputMeteringEnabled");

  return v3;
}

- (void)setInputMeteringEnabled:(BOOL)inputMeteringEnabled
{
  _BOOL8 v3;
  id v4;

  v3 = inputMeteringEnabled;
  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInputMeteringEnabled:", v3);

}

- (float)outputMeterLevel
{
  void *v2;
  float v3;
  float v4;

  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputMeterLevel");
  v4 = v3;

  return v4;
}

- (float)inputMeterLevel
{
  void *v2;
  float v3;
  float v4;

  -[GKVoiceChatService voiceChatService](self, "voiceChatService");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputMeterLevel");
  v4 = v3;

  return v4;
}

+ (BOOL)isVoIPAllowed
{
  return +[GKVoiceChat isVoIPAllowed](GKVoiceChat, "isVoIPAllowed");
}

- (GKViceroyVoiceChatService)voiceChatService
{
  return self->_voiceChatService;
}

- (void)setVoiceChatService:(id)a3
{
  objc_storeStrong((id *)&self->_voiceChatService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceChatService, 0);
}

@end
