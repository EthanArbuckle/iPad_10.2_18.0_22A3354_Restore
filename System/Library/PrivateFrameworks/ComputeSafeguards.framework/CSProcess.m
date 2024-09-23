@implementation CSProcess

- (CSProcess)initWithIdentifier:(id)a3
{
  id v5;
  CSProcess *v6;
  CSProcess *v7;
  OS_dispatch_source *processMonitor;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSProcess;
  v6 = -[CSProcess init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_identifier, a3);
    v7->_currentPID = -1;
    v7->_exemptFromMitigations = 0;
    processMonitor = v7->_processMonitor;
    v7->_processMonitor = 0;

  }
  return v7;
}

- (CSProcess)initWithIdentifier:(id)a3 andPID:(int)a4
{
  CSProcess *v5;

  v5 = -[CSProcess initWithIdentifier:](self, "initWithIdentifier:", a3);
  v5->_currentPID = a4;
  -[CSProcess monitorForExit](v5, "monitorForExit");
  return v5;
}

- (void)setCurrentPID:(int)a3
{
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (a3 < 0)
  {
    processLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[CSProcess setCurrentPID:].cold.1((uint64_t)self, v4, v5, v6, v7, v8, v9, v10);

  }
  else
  {
    self->_currentPID = a3;
    -[CSProcess monitorForExit](self, "monitorForExit");
  }
}

- (void)dealloc
{
  NSObject *processMonitor;
  objc_super v4;

  processMonitor = self->_processMonitor;
  if (processMonitor)
    dispatch_source_cancel(processMonitor);
  v4.receiver = self;
  v4.super_class = (Class)CSProcess;
  -[CSProcess dealloc](&v4, sel_dealloc);
}

- (void)performCleanupOnExit
{
  OUTLINED_FUNCTION_5(&dword_2383F5000, a2, a3, "Attmpted cleanup on Process:%@ with no currentPID", a5, a6, a7, a8, 2u);
}

- (void)monitorForExit
{
  OUTLINED_FUNCTION_1_2(&dword_2383F5000, a2, a3, "Monitor for pid:%d already exists", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (BOOL)isRunning
{
  return self->_currentPID != -1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CSProcess with nameIdentifier: %@, pid: %d"), self->_identifier, self->_currentPID);
}

- (NSString)identifier
{
  return self->_identifier;
}

- (int)currentPID
{
  return self->_currentPID;
}

- (BOOL)exemptFromMitigations
{
  return self->_exemptFromMitigations;
}

- (void)setExemptFromMitigations:(BOOL)a3
{
  self->_exemptFromMitigations = a3;
}

- (OS_dispatch_source)processMonitor
{
  return self->_processMonitor;
}

- (void)setProcessMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_processMonitor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)setCurrentPID:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_2383F5000, a2, a3, "Attmpted setting invalid PID for Process:%@", a5, a6, a7, a8, 2u);
}

@end
