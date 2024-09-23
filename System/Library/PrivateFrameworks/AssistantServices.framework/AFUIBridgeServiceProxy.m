@implementation AFUIBridgeServiceProxy

- (AFUIBridgeServiceProxy)initWithClient:(id)a3
{
  id v4;
  AFUIBridgeServiceProxy *v5;
  AFUIBridgeServiceProxy *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)AFUIBridgeServiceProxy;
  v5 = -[AFUIBridgeServiceProxy init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_client, v4);

  return v6;
}

- (void)uiBridgeServiceWillStartAttending
{
  AFUIBridgeClient **p_client;
  id WeakRetained;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v5, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__AFUIBridgeServiceProxy_uiBridgeServiceWillStartAttending__block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceWillStartAttending]";
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

- (void)uiBridgeServiceDidStart
{
  AFUIBridgeClient **p_client;
  id WeakRetained;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v5, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__AFUIBridgeServiceProxy_uiBridgeServiceDidStart__block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceDidStart]";
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

- (void)uiBridgeServiceDidStartAttending
{
  AFUIBridgeClient **p_client;
  id WeakRetained;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v5, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__AFUIBridgeServiceProxy_uiBridgeServiceDidStartAttending__block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceDidStartAttending]";
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

- (void)uiBridgeServiceDidStartAttendingWithRootRequestId:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    v6 = objc_loadWeakRetained((id *)&self->_client);
    objc_msgSend(v6, "delegateQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __76__AFUIBridgeServiceProxy_uiBridgeServiceDidStartAttendingWithRootRequestId___block_invoke;
    v9[3] = &unk_1E3A36FC8;
    v9[4] = self;
    v10 = v4;
    dispatch_async(v7, v9);

  }
  else
  {
    v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[AFUIBridgeServiceProxy uiBridgeServiceDidStartAttendingWithRootRequestId:]";
      _os_log_debug_impl(&dword_19AF50000, v8, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }

}

- (void)uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:(unint64_t)a3
{
  AFUIBridgeClient **p_client;
  id WeakRetained;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v7, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __80__AFUIBridgeServiceProxy_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason___block_invoke;
    v10[3] = &unk_1E3A353C0;
    v10[4] = self;
    v10[5] = a3;
    dispatch_async(v8, v10);

  }
  else
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[AFUIBridgeServiceProxy uiBridgeServiceDidStopAttendingUnexpectedlyWithReason:]";
      _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

- (void)uiBridgeServiceDetectedSiriDirectedSpeech
{
  AFUIBridgeClient **p_client;
  id WeakRetained;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v5, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSiriDirectedSpeech__block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceDetectedSiriDirectedSpeech]";
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

- (void)uiBridgeServiceDetectedSpeechStart
{
  AFUIBridgeClient **p_client;
  id WeakRetained;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v5, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSpeechStart__block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceDetectedSpeechStart]";
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

- (void)uiBridgeServiceDetectedSpeechStart:(BOOL)a3
{
  AFUIBridgeClient **p_client;
  id WeakRetained;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v7, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __61__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSpeechStart___block_invoke;
    v10[3] = &unk_1E3A34D68;
    v10[4] = self;
    v11 = a3;
    dispatch_async(v8, v10);

  }
  else
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[AFUIBridgeServiceProxy uiBridgeServiceDetectedSpeechStart:]";
      _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

- (void)uiBridgeServiceReceivedSpeechMitigationResult:(unint64_t)a3
{
  AFUIBridgeClient **p_client;
  id WeakRetained;
  id v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD v10[6];
  uint8_t buf[4];
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v7, "delegateQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __72__AFUIBridgeServiceProxy_uiBridgeServiceReceivedSpeechMitigationResult___block_invoke;
    v10[3] = &unk_1E3A353C0;
    v10[4] = self;
    v10[5] = a3;
    dispatch_async(v8, v10);

  }
  else
  {
    v9 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v12 = "-[AFUIBridgeServiceProxy uiBridgeServiceReceivedSpeechMitigationResult:]";
      _os_log_debug_impl(&dword_19AF50000, v9, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

- (void)uiBridgeServiceReceivedShowAssetsDownloadPrompt
{
  AFUIBridgeClient **p_client;
  id WeakRetained;
  id v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  p_client = &self->_client;
  WeakRetained = objc_loadWeakRetained((id *)&self->_client);

  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)p_client);
    objc_msgSend(v5, "delegateQueue");
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __73__AFUIBridgeServiceProxy_uiBridgeServiceReceivedShowAssetsDownloadPrompt__block_invoke;
    block[3] = &unk_1E3A36F30;
    block[4] = self;
    dispatch_async(v6, block);

  }
  else
  {
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v10 = "-[AFUIBridgeServiceProxy uiBridgeServiceReceivedShowAssetsDownloadPrompt]";
      _os_log_debug_impl(&dword_19AF50000, v7, OS_LOG_TYPE_DEBUG, "%s UIBridgeClient deallocated, dropping XPC message", buf, 0xCu);
    }
  }
}

- (AFUIBridgeClient)client
{
  return (AFUIBridgeClient *)objc_loadWeakRetained((id *)&self->_client);
}

- (void)setClient:(id)a3
{
  objc_storeWeak((id *)&self->_client, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_client);
}

void __73__AFUIBridgeServiceProxy_uiBridgeServiceReceivedShowAssetsDownloadPrompt__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiBridgeClientReceivedShowAssetsDownloadPrompt:", WeakRetained);

  }
}

void __72__AFUIBridgeServiceProxy_uiBridgeServiceReceivedSpeechMitigationResult___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiBridgeClient:receivedSpeechMitigationResult:", WeakRetained, *(_QWORD *)(a1 + 40));

  }
}

void __61__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSpeechStart___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiBridgeClient:detectedSpeechStartWithShouldDuckTTS:", WeakRetained, *(unsigned __int8 *)(a1 + 40));

  }
}

void __60__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSpeechStart__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiBridgeClientDetectedSpeechStart:", WeakRetained);

  }
}

void __67__AFUIBridgeServiceProxy_uiBridgeServiceDetectedSiriDirectedSpeech__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiBridgeClientDetectedSiriDirectedSpeech:", WeakRetained);

  }
}

void __80__AFUIBridgeServiceProxy_uiBridgeServiceDidStopAttendingUnexpectedlyWithReason___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiBridgeClient:didStopAttendingUnexpectedlyWithReason:", WeakRetained, *(_QWORD *)(a1 + 40));

  }
}

void __76__AFUIBridgeServiceProxy_uiBridgeServiceDidStartAttendingWithRootRequestId___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiBridgeClientDidStartAttending:withRootRequestId:", WeakRetained, *(_QWORD *)(a1 + 40));

  }
}

void __58__AFUIBridgeServiceProxy_uiBridgeServiceDidStartAttending__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiBridgeClientDidStartAttending:", WeakRetained);

  }
}

void __49__AFUIBridgeServiceProxy_uiBridgeServiceDidStart__block_invoke(uint64_t a1)
{
  void *v1;
  char v2;
  void *v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "delegate");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_opt_respondsToSelector();

  if ((v2 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "uiBridgeClientDidStartAttending:", WeakRetained);

  }
}

void __59__AFUIBridgeServiceProxy_uiBridgeServiceWillStartAttending__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  void *v4;
  id v5;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(WeakRetained, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(v4, "uiBridgeClientWillStartAttending:", v5);

  }
}

@end
