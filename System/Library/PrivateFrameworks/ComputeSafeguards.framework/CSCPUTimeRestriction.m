@implementation CSCPUTimeRestriction

- (CSCPUTimeRestriction)initWithThreshold:(id)a3 andTimeWindow:(id)a4
{
  NSNumber *v6;
  NSNumber *v7;
  NSNumber *cpuThreshold;
  NSNumber *v9;
  NSNumber *timeWindow;

  v6 = (NSNumber *)a3;
  v7 = (NSNumber *)a4;
  cpuThreshold = self->_cpuThreshold;
  self->_cpuThreshold = v6;
  v9 = v6;

  timeWindow = self->_timeWindow;
  self->_timeWindow = v7;

  return self;
}

- (BOOL)isEqual:(id)a3
{
  CSCPUTimeRestriction *v4;
  NSNumber *cpuThreshold;
  NSNumber *v6;
  BOOL v7;
  NSNumber *timeWindow;
  NSNumber *v9;

  v4 = (CSCPUTimeRestriction *)a3;
  if (v4 == self)
  {
    v7 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      cpuThreshold = self->_cpuThreshold;
      -[CSCPUTimeRestriction cpuThreshold](v4, "cpuThreshold");
      v6 = (NSNumber *)objc_claimAutoreleasedReturnValue();
      if (cpuThreshold == v6)
      {
        timeWindow = self->_timeWindow;
        -[CSCPUTimeRestriction timeWindow](v4, "timeWindow");
        v9 = (NSNumber *)objc_claimAutoreleasedReturnValue();
        v7 = timeWindow == v9;

      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3;

  v3 = -[NSNumber hash](self->_cpuThreshold, "hash");
  return -[NSNumber hash](self->_timeWindow, "hash") - v3 + 32 * v3 + 961;
}

- (BOOL)_shouldBeFatalOnViolation
{
  return _os_feature_enabled_impl();
}

- (BOOL)applyToProcess:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  _BOOL8 v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  int v17;
  int v18;
  int v19;
  double v20;
  double v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  BOOL v28;

  v4 = a3;
  v5 = objc_msgSend(v4, "currentPID");
  if ((_DWORD)v5 == -1)
  {
    +[CSLogger defaultCategory](CSLogger, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CSCPUTimeRestriction applyToProcess:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  }
  else
  {
    v6 = v5;
    v7 = (objc_msgSend(v4, "exemptFromMitigations") & 1) == 0
      && -[CSCPUTimeRestriction _shouldBeFatalOnViolation](self, "_shouldBeFatalOnViolation");
    +[CSLogger defaultCategory](CSLogger, "defaultCategory");
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[CSCPUTimeRestriction applyToProcess:].cold.3((uint64_t)self, v6, v16);

    -[NSNumber floatValue](self->_cpuThreshold, "floatValue");
    v18 = v17;
    -[NSNumber floatValue](self->_timeWindow, "floatValue");
    LODWORD(v20) = v19;
    LODWORD(v21) = v18;
    if (!+[CSCPUMonitorHelper setThreshold:overTimeWindow:forPID:withFatalEffect:](CSCPUMonitorHelper, "setThreshold:overTimeWindow:forPID:withFatalEffect:", v6, v7, v21, v20))
    {
      v28 = 1;
      goto LABEL_14;
    }
    +[CSLogger defaultCategory](CSLogger, "defaultCategory");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CSCPUTimeRestriction applyToProcess:].cold.2(v6, v8, v22, v23, v24, v25, v26, v27);
  }

  v28 = 0;
LABEL_14:

  return v28;
}

- (BOOL)releaseForProcess:(id)a3
{
  return +[CSCPUMonitorHelper clearMonitorForPID:](CSCPUMonitorHelper, "clearMonitorForPID:", objc_msgSend(a3, "currentPID")) != 0;
}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("CSCPUTimeRestriction with cpuThreshold: %@, timeWindow: %@"), self->_cpuThreshold, self->_timeWindow);
}

- (NSNumber)cpuThreshold
{
  return self->_cpuThreshold;
}

- (NSNumber)timeWindow
{
  return self->_timeWindow;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeWindow, 0);
  objc_storeStrong((id *)&self->_cpuThreshold, 0);
}

- (void)applyToProcess:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_2383F5000, a1, a3, "Attmpted applying thresholds on invalid PID: %d", a5, a6, a7, a8, 0);
}

- (void)applyToProcess:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_2383F5000, a2, a3, "Failed to apply thresholds on PID: %d", a5, a6, a7, a8, 0);
}

- (void)applyToProcess:(os_log_t)log .cold.3(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 8);
  v4 = *(_QWORD *)(a1 + 16);
  v5 = 138412802;
  v6 = v3;
  v7 = 2112;
  v8 = v4;
  v9 = 1024;
  v10 = a2;
  _os_log_debug_impl(&dword_2383F5000, log, OS_LOG_TYPE_DEBUG, "Configuring cpuMonitor with cpuThreshold: %@ and timeWindow:%@ for pid:%d", (uint8_t *)&v5, 0x1Cu);
}

@end
