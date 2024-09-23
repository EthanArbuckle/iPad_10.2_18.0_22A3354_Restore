@implementation AFAttentionAwarenessController

- (AFAttentionAwarenessController)initWithIdentifier:(id)a3
{
  id v4;
  AFAttentionAwarenessController *v5;
  uint64_t v6;
  NSString *identifier;
  id v8;
  AWAttentionAwarenessClient *v9;
  AWAttentionAwarenessClient *attentionClient;
  NSObject *v11;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *attentionQueue;
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)AFAttentionAwarenessController;
  v5 = -[AFAttentionAwarenessController init](&v16, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    v8 = objc_alloc_init((Class)getAWAttentionAwarenessConfigurationClass());
    objc_msgSend(v8, "setIdentifier:", CFSTR("com.apple.siri.AFAttentionAwarenessController"));
    objc_msgSend(v8, "setEventMask:", 128);
    v9 = (AWAttentionAwarenessClient *)objc_alloc_init((Class)getAWAttentionAwarenessClientClass());
    attentionClient = v5->_attentionClient;
    v5->_attentionClient = v9;

    -[AWAttentionAwarenessClient setConfiguration:](v5->_attentionClient, "setConfiguration:", v8);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_USER_INTERACTIVE, 0);
    v12 = objc_claimAutoreleasedReturnValue();

    v13 = dispatch_queue_create((const char *)attention_awareness_queue_label, v12);
    attentionQueue = v5->_attentionQueue;
    v5->_attentionQueue = (OS_dispatch_queue *)v13;

  }
  return v5;
}

- (void)requestAttentionStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  NSObject *attentionQueue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    attentionQueue = self->_attentionQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __70__AFAttentionAwarenessController_requestAttentionStateWithCompletion___block_invoke;
    v7[3] = &unk_1E3A36FA0;
    v7[4] = self;
    v8 = v4;
    dispatch_async(attentionQueue, v7);

  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_attentionQueue, 0);
  objc_storeStrong((id *)&self->_attentionClient, 0);
}

void __70__AFAttentionAwarenessController_requestAttentionStateWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void (*v13)(void);
  void *v14;
  char v15;
  id v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  id v29;
  __int16 v30;
  void *v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[AFAttentionAwarenessController requestAttentionStateWithCompletion:]_block_invoke";
    _os_log_debug_impl(&dword_19AF50000, v2, OS_LOG_TYPE_DEBUG, "%s #attention awareness start", buf, 0xCu);
  }
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v25 = 0;
  v4 = objc_msgSend(v3, "resumeWithError:", &v25);
  v5 = v25;
  if ((v4 & 1) == 0)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[AFAttentionAwarenessController requestAttentionStateWithCompletion:]_block_invoke";
      v28 = 2112;
      v29 = v5;
      _os_log_debug_impl(&dword_19AF50000, v6, OS_LOG_TYPE_DEBUG, "%s #attention awareness sync resumeWithError failed: %@", buf, 0x16u);
    }
  }
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v23 = 0;
  v24 = 0;
  v8 = objc_msgSend(v7, "pollForAttentionWithTimeout:event:error:", &v24, &v23, 0.5);
  v9 = v24;
  v10 = v23;
  v11 = (void *)AFSiriLogContextConnection;
  v12 = os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG);
  if (v8)
  {
    if (v12)
    {
      v18 = v11;
      objc_msgSend(v10, "debugDescription");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315650;
      v27 = "-[AFAttentionAwarenessController requestAttentionStateWithCompletion:]_block_invoke";
      v28 = 2112;
      v29 = v9;
      v30 = 2112;
      v31 = v19;
      _os_log_debug_impl(&dword_19AF50000, v18, OS_LOG_TYPE_DEBUG, "%s #attention sync awareness state event: %@, error: %@", buf, 0x20u);

    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  else
  {
    if (v12)
    {
      v20 = v11;
      objc_msgSend(v10, "debugDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      v27 = "-[AFAttentionAwarenessController requestAttentionStateWithCompletion:]_block_invoke";
      v28 = 2112;
      v29 = v21;
      _os_log_debug_impl(&dword_19AF50000, v20, OS_LOG_TYPE_DEBUG, "%s #attention sync awareness error: %@", buf, 0x16u);

    }
    v13 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
  }
  v13();
  v14 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v22 = 0;
  v15 = objc_msgSend(v14, "suspendWithError:", &v22);
  v16 = v22;
  if ((v15 & 1) == 0)
  {
    v17 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315394;
      v27 = "-[AFAttentionAwarenessController requestAttentionStateWithCompletion:]_block_invoke";
      v28 = 2112;
      v29 = v16;
      _os_log_debug_impl(&dword_19AF50000, v17, OS_LOG_TYPE_DEBUG, "%s #attention sync suspendWithError failed: %@", buf, 0x16u);
    }
  }

}

@end
