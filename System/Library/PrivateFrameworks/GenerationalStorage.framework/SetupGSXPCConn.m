@implementation SetupGSXPCConn

void ___SetupGSXPCConn_block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

void ___SetupGSXPCConn_block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  _QWORD block[4];
  id v5;

  gs_default_log();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    ___SetupGSXPCConn_block_invoke_2_cold_1(v2);

  v3 = sDaemonTrackerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___SetupGSXPCConn_block_invoke_125;
  block[3] = &unk_1E9771AA0;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  dispatch_async(v3, block);
  objc_destroyWeak(&v5);
}

void ___SetupGSXPCConn_block_invoke_125(uint64_t a1)
{
  uint64_t v1;
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  v1 = sDaemonConn;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if ((id)v1 == WeakRetained)
  {
    v3 = (void *)sDaemonConn;
    sDaemonConn = 0;

    v4 = (void *)sDaemonProxy;
    sDaemonProxy = 0;

    +[GSStorageManager manager](GSStorageManager, "manager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_connectionWithDaemonWasLost");

  }
}

void ___SetupGSXPCConn_block_invoke_2_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D414C000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] revisiond died or is absent; retry connecting\n",
    v1,
    2u);
}

@end
