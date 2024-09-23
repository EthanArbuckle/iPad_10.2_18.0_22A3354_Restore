@implementation AFSiriTaskContextProvider

- (AFSiriTaskContextProvider)initWithTaskmaster:(id)a3
{
  id v5;
  AFSiriTaskContextProvider *v6;
  AFSiriTaskContextProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AFSiriTaskContextProvider;
  v6 = -[AFSiriTaskContextProvider init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_taskmaster, a3);

  return v7;
}

- (void)getAppContextWithDeliveryHandler:(id)a3 completionHandler:(id)a4
{
  id v7;
  id v8;
  NSObject *v9;
  AFContextRequest *v10;
  NSObject *v11;
  AFSiriTaskmaster *taskmaster;
  AFSiriTaskmaster *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  SEL v17;
  uint8_t buf[4];
  const char *v19;
  __int16 v20;
  AFSiriTaskContextProvider *v21;
  __int16 v22;
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v19 = "-[AFSiriTaskContextProvider getAppContextWithDeliveryHandler:completionHandler:]";
    v20 = 2112;
    v21 = self;
    v22 = 2080;
    v23 = "-[AFSiriTaskContextProvider getAppContextWithDeliveryHandler:completionHandler:]";
    _os_log_impl(&dword_19AF50000, v9, OS_LOG_TYPE_INFO, "%s %@ %s", buf, 0x20u);
  }
  v10 = objc_alloc_init(AFContextRequest);
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    taskmaster = self->_taskmaster;
    *(_DWORD *)buf = 136315650;
    v19 = "-[AFSiriTaskContextProvider getAppContextWithDeliveryHandler:completionHandler:]";
    v20 = 2112;
    v21 = (AFSiriTaskContextProvider *)taskmaster;
    v22 = 2112;
    v23 = (const char *)v10;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s asking taskmaster=%@ to handle contextRequest=%@", buf, 0x20u);
  }
  v13 = self->_taskmaster;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __80__AFSiriTaskContextProvider_getAppContextWithDeliveryHandler_completionHandler___block_invoke;
  v15[3] = &unk_1E3A2F1D8;
  v16 = v8;
  v17 = a2;
  v15[4] = self;
  v14 = v8;
  -[AFSiriTaskmaster handleSiriRequest:deliveryHandler:completionHandler:](v13, "handleSiriRequest:deliveryHandler:completionHandler:", v10, v7, v15);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskmaster, 0);
}

void __80__AFSiriTaskContextProvider_getAppContextWithDeliveryHandler_completionHandler___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a1[6], a1[4], CFSTR("AFSiriTaskContextProvider.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("!response || [response isKindOfClass:[AFContextResponse class]]"));

    if (v6)
      goto LABEL_4;
  }
  else if (v6)
  {
LABEL_4:
    v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      v9 = *(_QWORD *)(a1[4] + 8);
      *(_DWORD *)buf = 136315650;
      v14 = "-[AFSiriTaskContextProvider getAppContextWithDeliveryHandler:completionHandler:]_block_invoke";
      v15 = 2112;
      v16 = v9;
      v17 = 2114;
      v18 = v6;
      _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s Unable to obtain context using %@: %{public}@", buf, 0x20u);
    }
    v8 = 0;
    goto LABEL_10;
  }
  objc_msgSend(v5, "_context");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1[4] + 8);
    *(_DWORD *)buf = 136315394;
    v14 = "-[AFSiriTaskContextProvider getAppContextWithDeliveryHandler:completionHandler:]_block_invoke";
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_19AF50000, v11, OS_LOG_TYPE_INFO, "%s %@ got context", buf, 0x16u);
  }
LABEL_10:
  (*(void (**)(void))(a1[5] + 16))();

}

@end
