@implementation AFSiriTask

- (id)_initWithRequest:(id)a3 remoteResponseListenerEndpoint:(id)a4 usageResultListenerEndpoint:(id)a5
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  AFSiriTask *v13;
  id *p_isa;
  objc_super v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  AFSiriTask *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v18 = "-[AFSiriTask _initWithRequest:remoteResponseListenerEndpoint:usageResultListenerEndpoint:]";
    v19 = 2048;
    v20 = self;
    _os_log_impl(&dword_19AF50000, v12, OS_LOG_TYPE_INFO, "%s <AFSiriTask %p>", buf, 0x16u);
  }
  v16.receiver = self;
  v16.super_class = (Class)AFSiriTask;
  v13 = -[AFSiriTask init](&v16, sel_init);
  p_isa = (id *)&v13->super.isa;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_request, a3);
    objc_storeStrong(p_isa + 2, a4);
    objc_storeStrong(p_isa + 3, a5);
  }

  return p_isa;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  AFSiriTask *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v6 = "-[AFSiriTask dealloc]";
    v7 = 2048;
    v8 = self;
    _os_log_impl(&dword_19AF50000, v3, OS_LOG_TYPE_INFO, "%s <AFSiriTask %p>", buf, 0x16u);
  }
  v4.receiver = self;
  v4.super_class = (Class)AFSiriTask;
  -[AFSiriTask dealloc](&v4, sel_dealloc);
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithString:", CFSTR("<"));
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v4);

  objc_msgSend(v3, "appendFormat:", CFSTR(": %p;"), self);
  objc_msgSend(v3, "appendString:", CFSTR(" request="));
  -[AFSiriRequest description](self->_request, "description");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:", v5);

  objc_msgSend(v3, "appendString:", CFSTR(">"));
  return (NSString *)v3;
}

- (id)request
{
  return self->_request;
}

- (id)_responseHandlerConnection
{
  void *v3;
  void *v4;
  NSObject *v5;
  NSXPCListenerEndpoint *remoteResponseListenerEndpoint;
  int v8;
  const char *v9;
  __int16 v10;
  NSXPCListenerEndpoint *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", self->_remoteResponseListenerEndpoint);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE3EDD68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRemoteObjectInterface:", v4);

  objc_msgSend(v3, "resume");
  if (!v3)
  {
    v5 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      remoteResponseListenerEndpoint = self->_remoteResponseListenerEndpoint;
      v8 = 136315394;
      v9 = "-[AFSiriTask _responseHandlerConnection]";
      v10 = 2112;
      v11 = remoteResponseListenerEndpoint;
      _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s Fatal error sending response - couldn't make XPC connection from endpoint: %@", (uint8_t *)&v8, 0x16u);
    }
  }
  return v3;
}

- (void)_invalidateConnectionAfterMessageSent:(id)a3
{
  id v3;
  id v4;
  _QWORD v5[4];
  id v6;

  v3 = a3;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__AFSiriTask__invalidateConnectionAfterMessageSent___block_invoke;
  v5[3] = &unk_1E3A36F30;
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "addBarrierBlock:", v5);

}

- (void)failWithError:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  void *v9;
  NSXPCListenerEndpoint *remoteResponseListenerEndpoint;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id v16;
  _BYTE location[12];
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = mach_absolute_time();
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)location = 136315394;
    *(_QWORD *)&location[4] = "-[AFSiriTask failWithError:]";
    v18 = 2114;
    v19 = v4;
    _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s %{public}@", location, 0x16u);
  }
  -[AFSiriTask _responseHandlerConnection](self, "_responseHandlerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)location, self);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __28__AFSiriTask_failWithError___block_invoke;
  v14 = &unk_1E3A36E38;
  objc_copyWeak(&v16, (id *)location);
  v8 = v4;
  v15 = v8;
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "handleFailureOfRequest:error:atTime:", self->_request, v8, v5, v11, v12, v13, v14);
  -[AFSiriTask _invalidateConnectionAfterMessageSent:](self, "_invalidateConnectionAfterMessageSent:", v7);
  remoteResponseListenerEndpoint = self->_remoteResponseListenerEndpoint;
  self->_remoteResponseListenerEndpoint = 0;

  objc_destroyWeak(&v16);
  objc_destroyWeak((id *)location);

}

- (void)completeWithResponse:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSXPCListenerEndpoint *remoteResponseListenerEndpoint;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = mach_absolute_time();
  v6 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v13 = "-[AFSiriTask completeWithResponse:]";
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_19AF50000, v6, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  -[AFSiriTask _responseHandlerConnection](self, "_responseHandlerConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __35__AFSiriTask_completeWithResponse___block_invoke;
  v10[3] = &unk_1E3A36E60;
  objc_copyWeak(&v11, (id *)buf);
  objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleSiriResponse:atTime:", v4, v5);
  -[AFSiriTask _invalidateConnectionAfterMessageSent:](self, "_invalidateConnectionAfterMessageSent:", v7);
  remoteResponseListenerEndpoint = self->_remoteResponseListenerEndpoint;
  self->_remoteResponseListenerEndpoint = 0;

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);

}

- (id)_usageResultHandlerConnection
{
  void *v2;
  void *v3;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithListenerEndpoint:", self->_usageResultListenerEndpoint);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE40E3F0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setRemoteObjectInterface:", v3);

  objc_msgSend(v2, "resume");
  return v2;
}

- (void)reportUsageResult:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSXPCListenerEndpoint *usageResultListenerEndpoint;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[AFSiriTask reportUsageResult:]";
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
  }
  -[AFSiriTask _usageResultHandlerConnection](self, "_usageResultHandlerConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak((id *)buf, self);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __32__AFSiriTask_reportUsageResult___block_invoke;
  v9[3] = &unk_1E3A36E60;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(v6, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleSiriTaskUsageResult:fromRequest:", v4, self->_request);
  -[AFSiriTask _invalidateConnectionAfterMessageSent:](self, "_invalidateConnectionAfterMessageSent:", v6);
  usageResultListenerEndpoint = self->_usageResultListenerEndpoint;
  self->_usageResultListenerEndpoint = 0;

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);

}

- (void)encodeWithBSXPCCoder:(id)a3
{
  id v4;
  AFSiriRequest *request;
  NSXPCListenerEndpoint *remoteResponseListenerEndpoint;
  void *v7;
  NSXPCListenerEndpoint *usageResultListenerEndpoint;
  void *v9;
  id v10;

  v4 = a3;
  request = self->_request;
  v10 = v4;
  if (request)
    objc_msgSend(v4, "encodeObject:forKey:", request, CFSTR("Request"));
  remoteResponseListenerEndpoint = self->_remoteResponseListenerEndpoint;
  if (remoteResponseListenerEndpoint)
  {
    -[NSXPCListenerEndpoint _endpoint](remoteResponseListenerEndpoint, "_endpoint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeXPCObject:forKey:", v7, CFSTR("RemoteResponseListenerEndpoint"));

  }
  usageResultListenerEndpoint = self->_usageResultListenerEndpoint;
  if (usageResultListenerEndpoint)
  {
    -[NSXPCListenerEndpoint _endpoint](usageResultListenerEndpoint, "_endpoint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeXPCObject:forKey:", v9, CFSTR("RemoteUsageResultListenerEndpoint"));

  }
}

- (AFSiriTask)initWithBSXPCCoder:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  id v12;
  objc_class *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  const char *v19;
  id v20;
  objc_class *v21;
  id v22;
  AFSiriTask *v23;
  _BYTE v25[24];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315138;
      *(_QWORD *)&v25[4] = "-[AFSiriTask initWithBSXPCCoder:]";
      _os_log_error_impl(&dword_19AF50000, v6, OS_LOG_TYPE_ERROR, "%s the encoded request failed to decode", v25, 0xCu);
    }
  }
  v7 = MEMORY[0x1E0C81308];
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("RemoteResponseListenerEndpoint"));
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v8)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315394;
      *(_QWORD *)&v25[4] = "-[AFSiriTask initWithBSXPCCoder:]";
      *(_WORD *)&v25[12] = 2114;
      *(_QWORD *)&v25[14] = 0;
      v11 = "%s no encoded response endpoint: %{public}@";
      goto LABEL_20;
    }
LABEL_9:
    v12 = 0;
    goto LABEL_11;
  }
  if (MEMORY[0x1A1AC0F84](v8) != v7)
  {
    v10 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315394;
      *(_QWORD *)&v25[4] = "-[AFSiriTask initWithBSXPCCoder:]";
      *(_WORD *)&v25[12] = 2114;
      *(_QWORD *)&v25[14] = v9;
      v11 = "%s the encoded response endpoint is in an unexpected format: %{public}@";
LABEL_20:
      _os_log_error_impl(&dword_19AF50000, v10, OS_LOG_TYPE_ERROR, v11, v25, 0x16u);
      goto LABEL_9;
    }
    goto LABEL_9;
  }
  v13 = (objc_class *)MEMORY[0x1E0CB3B60];
  v14 = v9;
  v12 = objc_alloc_init(v13);
  objc_msgSend(v12, "_setEndpoint:", v14);

LABEL_11:
  v15 = MEMORY[0x1E0C81308];
  objc_msgSend(v4, "decodeXPCObjectOfType:forKey:", MEMORY[0x1E0C81308], CFSTR("RemoteUsageResultListenerEndpoint"), *(_OWORD *)v25, *(_QWORD *)&v25[16], v26);
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v16)
  {
    if (MEMORY[0x1A1AC0F84](v16) == v15)
    {
      v21 = (objc_class *)MEMORY[0x1E0CB3B60];
      v22 = v17;
      v20 = objc_alloc_init(v21);
      objc_msgSend(v20, "_setEndpoint:", v22);

      goto LABEL_18;
    }
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315394;
      *(_QWORD *)&v25[4] = "-[AFSiriTask initWithBSXPCCoder:]";
      *(_WORD *)&v25[12] = 2114;
      *(_QWORD *)&v25[14] = v17;
      v19 = "%s the encoded usage results endpoint is in an unexpected format: %{public}@";
LABEL_22:
      _os_log_error_impl(&dword_19AF50000, v18, OS_LOG_TYPE_ERROR, v19, v25, 0x16u);
    }
  }
  else
  {
    v18 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 136315394;
      *(_QWORD *)&v25[4] = "-[AFSiriTask initWithBSXPCCoder:]";
      *(_WORD *)&v25[12] = 2114;
      *(_QWORD *)&v25[14] = 0;
      v19 = "%s no encoded usage results endpoint: %{public}@";
      goto LABEL_22;
    }
  }
  v20 = 0;
LABEL_18:
  v23 = -[AFSiriTask _initWithRequest:remoteResponseListenerEndpoint:usageResultListenerEndpoint:](self, "_initWithRequest:remoteResponseListenerEndpoint:usageResultListenerEndpoint:", v5, v12, v20, *(_QWORD *)v25, *(_OWORD *)&v25[8]);

  return v23;
}

- (void)encodeWithCoder:(id)a3
{
  AFSiriRequest *request;
  id v5;

  request = self->_request;
  v5 = a3;
  objc_msgSend(v5, "encodeObject:forKey:", request, CFSTR("Request"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_remoteResponseListenerEndpoint, CFSTR("RemoteResponseListenerEndpoint"));
  objc_msgSend(v5, "encodeObject:forKey:", self->_usageResultListenerEndpoint, CFSTR("RemoteUsageResultListenerEndpoint"));

}

- (AFSiriTask)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  AFSiriTask *v8;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("Request"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemoteResponseListenerEndpoint"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("RemoteUsageResultListenerEndpoint"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[AFSiriTask _initWithRequest:remoteResponseListenerEndpoint:usageResultListenerEndpoint:](self, "_initWithRequest:remoteResponseListenerEndpoint:usageResultListenerEndpoint:", v5, v6, v7);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_usageResultListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_remoteResponseListenerEndpoint, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

void __32__AFSiriTask_reportUsageResult___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 136315650;
    v8 = "-[AFSiriTask reportUsageResult:]_block_invoke";
    v9 = 2112;
    v10 = WeakRetained;
    v11 = 2114;
    v12 = v3;
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s Task %@ unable to communicate usage results to handler: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

void __35__AFSiriTask_completeWithResponse___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  id v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v7 = 136315650;
    v8 = "-[AFSiriTask completeWithResponse:]_block_invoke";
    v9 = 2112;
    v10 = WeakRetained;
    v11 = 2114;
    v12 = v3;
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s Task %@ completed, but was unable to communicate that to the response handler: %{public}@", (uint8_t *)&v7, 0x20u);

  }
}

void __28__AFSiriTask_failWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    v5 = v4;
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = *(_QWORD *)(a1 + 32);
    v8 = 136315906;
    v9 = "-[AFSiriTask failWithError:]_block_invoke";
    v10 = 2112;
    v11 = WeakRetained;
    v12 = 2114;
    v13 = v7;
    v14 = 2114;
    v15 = v3;
    _os_log_error_impl(&dword_19AF50000, v5, OS_LOG_TYPE_ERROR, "%s Task %@ failed with error %{public}@, but was unable to communicate that to the response handler: %{public}@", (uint8_t *)&v8, 0x2Au);

  }
}

uint64_t __52__AFSiriTask__invalidateConnectionAfterMessageSent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

+ (void)initialize
{
  if (AFLogInitIfNeeded_once != -1)
    dispatch_once(&AFLogInitIfNeeded_once, &__block_literal_global_2748);
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end
