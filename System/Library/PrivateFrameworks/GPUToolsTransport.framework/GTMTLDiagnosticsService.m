@implementation GTMTLDiagnosticsService

- (GTMTLDiagnosticsService)init
{
  GTMTLDiagnosticsService *v2;
  os_log_t v3;
  OS_os_log *log;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  GTObservableService *observers;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)GTMTLDiagnosticsService;
  v2 = -[GTMTLDiagnosticsService init](&v16, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.gputools.transport", "DiagnosticsService");
    log = v2->_log;
    v2->_log = (OS_os_log *)v3;

    v5 = v2->_log;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[GTMTLDiagnosticsService init].cold.1(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = objc_opt_new();
    observers = v2->_observers;
    v2->_observers = (GTObservableService *)v13;

  }
  return v2;
}

- (unint64_t)registerObserver:(id)a3
{
  return -[GTObservableService registerObserver:](self->_observers, "registerObserver:", a3);
}

- (void)deregisterObserver:(unint64_t)a3
{
  -[GTObservableService deregisterObserver:](self->_observers, "deregisterObserver:", a3);
}

- (void)deregisterObserversForConnection:(id)a3 path:(id)a4
{
  -[GTObservableService deregisterObserversForConnection:path:](self->_observers, "deregisterObserversForConnection:path:", a3, a4);
}

- (void)raiseRuntimeIssue:(id)a3
{
  id v4;
  NSObject *log;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    -[GTMTLDiagnosticsService raiseRuntimeIssue:].cold.3(log, v6, v7, v8, v9, v10, v11, v12);
    if (v4)
      goto LABEL_3;
  }
  else if (v4)
  {
LABEL_3:
    v13 = os_log_create("com.apple.runtime-issues", "Metal Diagnostics");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      -[GTMTLDiagnosticsService raiseRuntimeIssue:].cold.2(v4, v13);

    goto LABEL_9;
  }
  v14 = self->_log;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    -[GTMTLDiagnosticsService raiseRuntimeIssue:].cold.1(v14);
LABEL_9:

}

- (void)notifyDiagnosticsIssue:(id)a3
{
  id v4;
  GTObservableService *observers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __50__GTMTLDiagnosticsService_notifyDiagnosticsIssue___block_invoke;
  v7[3] = &unk_24F827A88;
  v8 = v4;
  v6 = v4;
  -[GTObservableService notifyAll:](observers, "notifyAll:", v7);

}

uint64_t __50__GTMTLDiagnosticsService_notifyDiagnosticsIssue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notifyDiagnosticsIssue:", *(_QWORD *)(a1 + 32));
}

- (void)notifyCommandBufferIssue:(id)a3
{
  id v4;
  GTObservableService *observers;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  observers = self->_observers;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __52__GTMTLDiagnosticsService_notifyCommandBufferIssue___block_invoke;
  v7[3] = &unk_24F827A88;
  v8 = v4;
  v6 = v4;
  -[GTObservableService notifyAll:](observers, "notifyAll:", v7);

}

uint64_t __52__GTMTLDiagnosticsService_notifyCommandBufferIssue___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "notifyCommandBufferIssue:", *(_QWORD *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_0_0(&dword_22D095000, a1, a3, "Create Diagnostics Service", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)raiseRuntimeIssue:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D095000, log, OS_LOG_TYPE_ERROR, "raiseRuntimeIssue: Invalid messagePrefix:(nil)", v1, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)raiseRuntimeIssue:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = objc_msgSend(objc_retainAutorelease(a1), "cStringUsingEncoding:", 4);
  _os_log_fault_impl(&dword_22D095000, a2, OS_LOG_TYPE_FAULT, "%s", (uint8_t *)&v3, 0xCu);
}

- (void)raiseRuntimeIssue:(uint64_t)a3 .cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_22D095000, a1, a3, "raiseRuntimeIssue", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
