@implementation CSSpeakerRecognitionProxy

- (CSSpeakerRecognitionProxy)initWithDelegate:(id)a3
{
  id v4;
  CSSpeakerRecognitionProxy *v5;
  CSSSRXPCClient *v6;
  CSSSRXPCClient *ssrXPCClient;
  CSSpeakerRecognitionProxy *v8;
  NSObject *v9;
  objc_super v11;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)CSSpeakerRecognitionProxy;
  v5 = -[CSSpeakerRecognitionProxy init](&v11, sel_init);
  if (v5
    && (v6 = objc_alloc_init(CSSSRXPCClient),
        ssrXPCClient = v5->_ssrXPCClient,
        v5->_ssrXPCClient = v6,
        ssrXPCClient,
        -[CSSSRXPCClient setDelegate:](v5->_ssrXPCClient, "setDelegate:", v5),
        objc_storeWeak((id *)&v5->_delegate, v4),
        !v5->_ssrXPCClient))
  {
    v9 = *MEMORY[0x1E0D18F60];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "-[CSSpeakerRecognitionProxy initWithDelegate:]";
      _os_log_error_impl(&dword_1C2614000, v9, OS_LOG_TYPE_ERROR, "%s ERR: Failed to establish XPC connection!", buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    v8 = v5;
  }

  return v8;
}

- (void)startXPCConnection
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeakerRecognitionProxy startXPCConnection]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[CSSSRXPCClient startXPCConnection](self->_ssrXPCClient, "startXPCConnection");
}

- (void)invalidateXPCConnection
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[CSSpeakerRecognitionProxy invalidateXPCConnection]";
    _os_log_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v4, 0xCu);
  }
  -[CSSSRXPCClient invalidate](self->_ssrXPCClient, "invalidate");
}

- (void)dealloc
{
  objc_super v3;

  -[CSSpeakerRecognitionProxy invalidateXPCConnection](self, "invalidateXPCConnection");
  v3.receiver = self;
  v3.super_class = (Class)CSSpeakerRecognitionProxy;
  -[CSSpeakerRecognitionProxy dealloc](&v3, sel_dealloc);
}

- (void)didReceiveSpeakerRecognitionScoreCard:(id)a3
{
  id v4;
  NSObject *v5;
  CSSpeakerRecognitionProxyProtocol **p_delegate;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[CSSpeakerRecognitionProxy didReceiveSpeakerRecognitionScoreCard:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)p_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v11, "didReceiveSpeakerRecognitionScoreCard:", v4);

    }
  }

}

- (void)didFinishSpeakerRecognition:(id)a3
{
  id v4;
  NSObject *v5;
  CSSpeakerRecognitionProxyProtocol **p_delegate;
  id WeakRetained;
  void *v8;
  id v9;
  char v10;
  id v11;
  int v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *MEMORY[0x1E0D18F60];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0D18F60], OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[CSSpeakerRecognitionProxy didFinishSpeakerRecognition:]";
    _os_log_impl(&dword_1C2614000, v5, OS_LOG_TYPE_DEFAULT, "%s ", (uint8_t *)&v12, 0xCu);
  }
  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  if (WeakRetained)
  {
    v8 = WeakRetained;
    v9 = objc_loadWeakRetained((id *)p_delegate);
    v10 = objc_opt_respondsToSelector();

    if ((v10 & 1) != 0)
    {
      v11 = objc_loadWeakRetained((id *)p_delegate);
      objc_msgSend(v11, "didFinishSpeakerRecognition:", v4);

    }
  }

}

- (CSSSRXPCClient)ssrXPCClient
{
  return self->_ssrXPCClient;
}

- (void)setSsrXPCClient:(id)a3
{
  objc_storeStrong((id *)&self->_ssrXPCClient, a3);
}

- (CSSpeakerRecognitionProxyProtocol)delegate
{
  return (CSSpeakerRecognitionProxyProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ssrXPCClient, 0);
}

@end
