@implementation ASDClipMetricsCoordinator

- (ASDClipMetricsCoordinator)init
{
  ASDClipMetricsCoordinator *v2;
  uint64_t v3;
  ASDClipServiceBroker *broker;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASDClipMetricsCoordinator;
  v2 = -[ASDClipMetricsCoordinator init](&v6, sel_init);
  if (v2)
  {
    +[ASDServiceBroker defaultBroker](ASDServiceBroker, "defaultBroker");
    v3 = objc_claimAutoreleasedReturnValue();
    broker = v2->_broker;
    v2->_broker = (ASDClipServiceBroker *)v3;

  }
  return v2;
}

- (void)sendClipCardMetricsEvent:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  ASDClipServiceBroker *broker;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint8_t buf[4];
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  broker = self->_broker;
  v19 = 0;
  -[ASDClipServiceBroker getClipServiceWithError:](broker, "getClipServiceWithError:", &v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v19;
  if (v9)
  {
    v11 = MEMORY[0x1E0C809B0];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __72__ASDClipMetricsCoordinator_sendClipCardMetricsEvent_completionHandler___block_invoke;
    v17[3] = &unk_1E37BDB60;
    v12 = v7;
    v18 = v12;
    objc_msgSend(v9, "synchronousRemoteObjectProxyWithErrorHandler:", v17);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v11;
    v15[1] = 3221225472;
    v15[2] = __72__ASDClipMetricsCoordinator_sendClipCardMetricsEvent_completionHandler___block_invoke_1;
    v15[3] = &unk_1E37BDB88;
    v16 = v12;
    objc_msgSend(v13, "clipCardMetricsEvent:withReplyHandler:", v6, v15);

  }
  else
  {
    ASDLogHandleForCategory(12);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v10;
      _os_log_error_impl(&dword_19A03B000, v14, OS_LOG_TYPE_ERROR, "Request to service failed with error: %@", buf, 0xCu);
    }

    (*((void (**)(id, _QWORD, id))v7 + 2))(v7, 0, v10);
  }

}

void __72__ASDClipMetricsCoordinator_sendClipCardMetricsEvent_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  ASDLogHandleForCategory(12);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_error_impl(&dword_19A03B000, v4, OS_LOG_TYPE_ERROR, "Request to make a connection with error: %@", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __72__ASDClipMetricsCoordinator_sendClipCardMetricsEvent_completionHandler___block_invoke_1(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_broker, 0);
}

@end
