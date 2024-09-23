@implementation CellularDataDiagnosticsSuiteController

- (void)start
{
  void *v3;
  SpeedTestConfig *v4;
  SpeedTestConfig *cellularTestStartRef;
  SpeedTestConfig *v6;
  _QWORD v7[5];

  -[DKDiagnosticController result](self, "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStatusCode:", &unk_24E06FCA0);

  v4 = objc_alloc_init(SpeedTestConfig);
  cellularTestStartRef = self->cellularTestStartRef;
  self->cellularTestStartRef = v4;

  v6 = self->cellularTestStartRef;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __47__CellularDataDiagnosticsSuiteController_start__block_invoke;
  v7[3] = &unk_24E06F860;
  v7[4] = self;
  -[SpeedTestConfig startDownloadTest:](v6, "startDownloadTest:", v7);
}

uint64_t __47__CellularDataDiagnosticsSuiteController_start__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t result;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  DiagnosticsKitLogHandleForCategory();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_21C698000, v2, OS_LOG_TYPE_INFO, "CellularThroughput: speed test passed", (uint8_t *)&v8, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "result");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setStatusCode:", &unk_24E06FCB8);

  DiagnosticsKitLogHandleForCategory();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "result");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "statusCode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v6;
    _os_log_impl(&dword_21C698000, v4, OS_LOG_TYPE_INFO, "CellularThroughput: status code: %@", (uint8_t *)&v8, 0xCu);

  }
  result = objc_msgSend(*(id *)(a1 + 32), "isCancelled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setFinished:", 1);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cellularTestStartRef, 0);
}

@end
