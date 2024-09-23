@implementation DefaultGKVoiceChatService

- (BOOL)isInputMeteringEnabled
{
  void *v2;
  char v3;

  -[DefaultGKVoiceChatService service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInputMeteringEnabled");

  return v3;
}

- (void)setInputMeteringEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DefaultGKVoiceChatService service](self, "service");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInputMeteringEnabled:", v3);

}

- (float)inputMeterLevel
{
  void *v2;
  float v3;
  float v4;

  -[DefaultGKVoiceChatService service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "inputMeterLevel");
  v4 = v3;

  return v4;
}

- (BOOL)isMicrophoneMuted
{
  void *v2;
  char v3;

  -[DefaultGKVoiceChatService service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMicrophoneMuted");

  return v3;
}

- (void)setMicrophoneMuted:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DefaultGKVoiceChatService service](self, "service");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setMicrophoneMuted:", v3);

}

- (BOOL)isOutputMeteringEnabled
{
  void *v2;
  char v3;

  -[DefaultGKVoiceChatService service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isOutputMeteringEnabled");

  return v3;
}

- (void)setOutputMeteringEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[DefaultGKVoiceChatService service](self, "service");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setOutputMeteringEnabled:", v3);

}

- (float)outputMeterLevel
{
  void *v2;
  float v3;
  float v4;

  -[DefaultGKVoiceChatService service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "outputMeterLevel");
  v4 = v3;

  return v4;
}

- (float)remoteParticipantVolume
{
  void *v2;
  float v3;
  float v4;

  -[DefaultGKVoiceChatService service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteParticipantVolume");
  v4 = v3;

  return v4;
}

- (void)setRemoteParticipantVolume:(float)a3
{
  double v4;
  id v5;

  -[DefaultGKVoiceChatService service](self, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&v4 = a3;
  objc_msgSend(v5, "setRemoteParticipantVolume:", v4);

}

- (BOOL)acceptCallID:(int64_t)a3 error:(id *)a4
{
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = v7;
    -[DefaultGKVoiceChatService service](self, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412290;
    v15 = v10;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "[DefaultGKVoiceChatService] acceptCallID with %@", (uint8_t *)&v14, 0xCu);

  }
  -[DefaultGKVoiceChatService service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "acceptCallID:error:", a3, a4);

  return v12;
}

- (void)denyCallID:(int64_t)a3
{
  id v4;

  -[DefaultGKVoiceChatService service](self, "service");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "denyCallID:", a3);

}

- (id)getClient
{
  void *v2;
  void *v3;

  -[DefaultGKVoiceChatService service](self, "service");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "client");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)receivedData:(id)a3 fromParticipantID:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[DefaultGKVoiceChatService service](self, "service");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "receivedData:fromParticipantID:", v7, v6);

}

- (void)setClient:(id)a3 gkVoiceChatService:(id)a4
{
  void *v6;
  id v7;
  id v8;
  GKVoiceChatServicePrivate *v9;
  GKVoiceChatServicePrivate *service;
  NSObject *v11;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0D25C88];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "defaultVoiceChatService");
  v9 = (GKVoiceChatServicePrivate *)objc_claimAutoreleasedReturnValue();
  service = self->_service;
  self->_service = v9;

  v11 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v12 = GKOSLoggers();
    v11 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v13 = v11;
    -[DefaultGKVoiceChatService service](self, "service");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 138412290;
    v18 = v14;
    _os_log_impl(&dword_1BCDE3000, v13, OS_LOG_TYPE_INFO, "[DefaultGKVoiceChatService] initWithGKVoiceChatServicePrivate  = %@", (uint8_t *)&v17, 0xCu);

  }
  -[DefaultGKVoiceChatService service](self, "service");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setWrapperService:", v7);

  -[DefaultGKVoiceChatService service](self, "service");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClient:", v8);

}

- (BOOL)startVoiceChatWithParticipantID:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  int v14;
  void *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = os_log_GKGeneral;
  if (!os_log_GKGeneral)
  {
    v8 = GKOSLoggers();
    v7 = os_log_GKGeneral;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v9 = v7;
    -[DefaultGKVoiceChatService service](self, "service");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 138412546;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1BCDE3000, v9, OS_LOG_TYPE_INFO, "[DefaultGKVoiceChatService] %@: startVoiceChatWithParticipantID with %@", (uint8_t *)&v14, 0x16u);

  }
  -[DefaultGKVoiceChatService service](self, "service");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "startVoiceChatWithParticipantID:error:", v6, a4);

  return v12;
}

- (void)stopVoiceChatWithParticipantID:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DefaultGKVoiceChatService service](self, "service");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopVoiceChatWithParticipantID:", v4);

}

- (GKVoiceChatServicePrivate)service
{
  return self->_service;
}

- (void)setService:(id)a3
{
  objc_storeStrong((id *)&self->_service, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_service, 0);
}

@end
