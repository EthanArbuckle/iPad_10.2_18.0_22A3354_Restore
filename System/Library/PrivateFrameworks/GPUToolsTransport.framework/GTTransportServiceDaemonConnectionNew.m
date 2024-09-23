@implementation GTTransportServiceDaemonConnectionNew

void __GTTransportServiceDaemonConnectionNew_block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "dispatchMessage:replyConnection:", v5, WeakRetained);

}

void __GTTransportServiceDaemonConnectionNew_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)MEMORY[0x22E30CE54](a2);
  v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v10 = 136315138;
    v11 = v3;
    _os_log_impl(&dword_22D095000, v4, OS_LOG_TYPE_INFO, "Connection: Error:%s", (uint8_t *)&v10, 0xCu);
  }
  free(v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)MEMORY[0x22E30CE54]();

    v9 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = 136315138;
      v11 = v8;
      _os_log_impl(&dword_22D095000, v9, OS_LOG_TYPE_INFO, "Connection: Disconnect:%s", (uint8_t *)&v10, 0xCu);
    }
    free(v8);
  }

}

@end
