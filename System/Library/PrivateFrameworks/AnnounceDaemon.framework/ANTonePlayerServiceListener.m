@implementation ANTonePlayerServiceListener

- (ANTonePlayerServiceListener)init
{
  ANTonePlayerServiceListener *v2;
  id v3;
  uint64_t v4;
  NSXPCListener *listener;
  NSObject *v6;
  objc_super v8;
  uint8_t buf[4];
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)ANTonePlayerServiceListener;
  v2 = -[ANTonePlayerServiceListener init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0CB3B58]);
    v4 = objc_msgSend(v3, "initWithMachServiceName:", *MEMORY[0x1E0CF7CF0]);
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v4;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    ANLogHandleTonePlayerServiceListener();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v6, OS_LOG_TYPE_DEFAULT, "%@Tone Player Service Listener Up!", buf, 0xCu);
    }

  }
  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id location;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  ANLogHandleTonePlayerServiceListener();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serviceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v24 = &stru_1E93913D0;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    _os_log_impl(&dword_1D23A0000, v8, OS_LOG_TYPE_DEFAULT, "%@New Connection Request From (PID = %@) For Service: (%@)", buf, 0x20u);

  }
  if ((objc_msgSend(MEMORY[0x1E0CF7DE8], "isAnnounceEnabled") & 1) == 0)
  {
    ANLogHandleTonePlayerServiceListener();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v24 = &stru_1E93913D0;
      _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_ERROR, "%@Rejecting connection. Announce not enabled.", buf, 0xCu);
    }
    goto LABEL_13;
  }
  if ((objc_msgSend(v7, "hasAnnounceEntitlement") & 1) == 0)
  {
    ANLogHandleTonePlayerServiceListener();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v16 = (void *)*MEMORY[0x1E0CF7EC0];
      *(_DWORD *)buf = 138412546;
      v24 = &stru_1E93913D0;
      v25 = 2112;
      v26 = v16;
      _os_log_impl(&dword_1D23A0000, v15, OS_LOG_TYPE_ERROR, "%@Missing Announce Entitlement: %@", buf, 0x16u);
    }
LABEL_13:

    v14 = 0;
    goto LABEL_14;
  }
  objc_msgSend(MEMORY[0x1E0CB3B50], "an_tonePlayerServiceInterface");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setExportedInterface:", v11);

  objc_msgSend(v7, "setExportedObject:", self);
  objc_initWeak(&location, v7);
  v12 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __66__ANTonePlayerServiceListener_listener_shouldAcceptNewConnection___block_invoke;
  v20[3] = &unk_1E938F518;
  objc_copyWeak(&v21, &location);
  objc_msgSend(v7, "setInterruptionHandler:", v20);
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __66__ANTonePlayerServiceListener_listener_shouldAcceptNewConnection___block_invoke_5;
  v18[3] = &unk_1E938F518;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v7, "setInvalidationHandler:", v18);
  objc_msgSend(v7, "resume");
  ANLogHandleTonePlayerServiceListener();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = &stru_1E93913D0;
    v25 = 2112;
    v26 = v7;
    _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@Connection Accepted: (%@)", buf, 0x16u);
  }

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
  v14 = 1;
LABEL_14:

  return v14;
}

void __66__ANTonePlayerServiceListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ANLogHandleTonePlayerServiceListener();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412546;
    v5 = &stru_1E93913D0;
    v6 = 2112;
    v7 = WeakRetained;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Interrupted: (%@)", (uint8_t *)&v4, 0x16u);

  }
}

void __66__ANTonePlayerServiceListener_listener_shouldAcceptNewConnection___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v4;
  const __CFString *v5;
  __int16 v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  ANLogHandleTonePlayerServiceListener();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v4 = 138412546;
    v5 = &stru_1E93913D0;
    v6 = 2112;
    v7 = WeakRetained;
    _os_log_impl(&dword_1D23A0000, v2, OS_LOG_TYPE_DEFAULT, "%@Connection Invalidated: (%@)", (uint8_t *)&v4, 0x16u);

  }
}

- (void)cleanForExit
{
  id v2;

  -[ANTonePlayerServiceListener listener](self, "listener");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "invalidate");

}

- (void)playTone:(unint64_t)a3 audioSessionID:(unsigned int)a4 endpointUUID:(id)a5 completionHandler:(id)a6
{
  uint64_t v7;
  id v10;
  void (**v11)(id, void *);
  void *v12;
  NSObject *v13;
  void *v14;
  ANTonePlayer *v15;
  void *v16;
  NSObject *v17;
  int v18;
  const __CFString *v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v7 = *(_QWORD *)&a4;
  v22 = *MEMORY[0x1E0C80C00];
  v10 = a5;
  v11 = (void (**)(id, void *))a6;
  -[ANTonePlayerServiceListener player](self, "player");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stop");

  ANLogHandleTonePlayerServiceListener();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138412546;
    v19 = &stru_1E93913D0;
    v20 = 2112;
    v21 = (unint64_t)v10;
    _os_log_impl(&dword_1D23A0000, v13, OS_LOG_TYPE_DEFAULT, "%@Received Request to play tone. Endpoint ID = %@", (uint8_t *)&v18, 0x16u);
  }

  -[ANTonePlayerServiceListener _fileURLForTone:](self, "_fileURLForTone:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = -[ANTonePlayer initWithAudioSessionID:endpointUUID:]([ANTonePlayer alloc], "initWithAudioSessionID:endpointUUID:", v7, v10);
    -[ANTonePlayerServiceListener setPlayer:](self, "setPlayer:", v15);

    -[ANTonePlayerServiceListener player](self, "player");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "playFileURL:completionHandler:", v14, v11);
  }
  else
  {
    ANLogHandleTonePlayerServiceListener();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v18 = 138412546;
      v19 = &stru_1E93913D0;
      v20 = 2048;
      v21 = a3;
      _os_log_impl(&dword_1D23A0000, v17, OS_LOG_TYPE_ERROR, "%@Failed to find URL for tone: %lu", (uint8_t *)&v18, 0x16u);
    }

    objc_msgSend(MEMORY[0x1E0CB35C8], "an_errorWithCode:component:", 1052, *MEMORY[0x1E0CF7C70]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v16);
  }

}

- (id)_fileURLForTone:(unint64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (a3)
  {
    v3 = 0;
  }
  else
  {
    v4 = (void *)MEMORY[0x1E0C99E98];
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathForResource:ofType:", CFSTR("AnnounceSent"), CFSTR("wav"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "fileURLWithPath:", v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (ANTonePlayer)player
{
  return self->_player;
}

- (void)setPlayer:(id)a3
{
  objc_storeStrong((id *)&self->_player, a3);
}

- (NSXPCListener)listener
{
  return self->_listener;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_player, 0);
}

@end
