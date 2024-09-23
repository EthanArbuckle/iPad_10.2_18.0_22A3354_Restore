@implementation CSExcessiveCPUViolationHandler

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance__sharedInstance;
}

void __48__CSExcessiveCPUViolationHandler_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CSExcessiveCPUViolationHandler _init]([CSExcessiveCPUViolationHandler alloc], "_init");
  v1 = (void *)sharedInstance__sharedInstance;
  sharedInstance__sharedInstance = (uint64_t)v0;

}

- (id)_init
{
  CSExcessiveCPUViolationHandler *v2;
  uint64_t v3;
  OS_os_log *logger;
  NSObject *v5;
  dispatch_queue_t v6;
  OS_dispatch_queue *queue;
  CSExcessiveCPUViolationHandler *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSExcessiveCPUViolationHandler;
  v2 = -[CSExcessiveCPUViolationHandler init](&v10, sel_init);
  if (v2)
  {
    +[CSLogger logForCategory:](CSLogger, "logForCategory:", CFSTR("CSExcessiveCPUViolationHandler"));
    v3 = objc_claimAutoreleasedReturnValue();
    logger = v2->_logger;
    v2->_logger = (OS_os_log *)v3;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = dispatch_queue_create("com.apple.computesafeguards.excessivecpuhandler", v5);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v6;

    v8 = v2;
  }

  return v2;
}

- (void)handleViolationByProcess:(id)a3 pid:(unint64_t)a4 path:(id)a5 endTime:(mach_timespec)a6 observedValue:(int64_t)a7 observationWindow:(int64_t)a8 limitValue:(int64_t)a9 limitWindow:(int64_t)a10 fatal:(BOOL)a11
{
  id v16;
  id v17;
  NSObject *logger;
  const char *v19;
  void *v20;
  void *v21;
  unsigned int tv_sec;
  void *v23;
  __CFString *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  id v50;
  _QWORD v52[8];
  _QWORD v53[8];
  uint8_t buf[4];
  const char *v55;
  __int16 v56;
  id v57;
  __int16 v58;
  unint64_t v59;
  __int16 v60;
  id v61;
  __int16 v62;
  double v63;
  __int16 v64;
  double v65;
  __int16 v66;
  int v67;
  __int16 v68;
  double v69;
  __int16 v70;
  unint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v16 = a3;
  v17 = a5;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_INFO))
  {
    v19 = (const char *)&unk_238400E56;
    if (a11)
      v19 = "(FATAL) ";
    *(_DWORD *)buf = 136317186;
    v55 = v19;
    v56 = 2112;
    v57 = v16;
    v60 = 2112;
    v66 = 1024;
    v58 = 2048;
    v59 = a4;
    v61 = v17;
    v62 = 2048;
    v63 = (double)a7 / 1000000000.0;
    v64 = 2048;
    v65 = (double)a8 / 1000000000.0;
    v67 = 100 * a7 / a8;
    v68 = 2048;
    v69 = (double)a9 / 1000000000.0;
    v70 = 2048;
    v71 = a10 / 0x3B9ACA00uLL;
    _os_log_impl(&dword_2383F5000, logger, OS_LOG_TYPE_INFO, "Received %sCPU violation: %@[%llu] (%@) used %.2fs of CPU over %.2f seconds (averaging %d%%), violating a CPU usage limit of %.2fs over %lld seconds.", buf, 0x58u);
  }
  if (v16)
  {
    +[CSProcessManager sharedInstanceWithEnrolledProcesses:andExemptions:](CSProcessManager, "sharedInstanceWithEnrolledProcesses:andExemptions:", 0, 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "identiferForPID:", a4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (v21)
    {
      v50 = v17;
      tv_sec = a6.tv_sec;
      +[CSRestrictionManager sharedInstanceWithDataProvider:](CSRestrictionManager, "sharedInstanceWithDataProvider:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "determineScenarioForProcess:", v21);
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue();

      if (!v24)
      {
        v25 = self->_logger;
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          -[CSExcessiveCPUViolationHandler handleViolationByProcess:pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:].cold.3(v25, v26, v27, v28, v29, v30, v31, v32);
        v24 = CFSTR("Unknown");
        tv_sec = a6.tv_sec;
      }
      v52[0] = CFSTR("ProcessName");
      v52[1] = CFSTR("ScenarioIdentifier");
      v53[0] = v16;
      v53[1] = v24;
      v52[2] = CFSTR("timestampEnd");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)tv_sec + (double)a6.tv_nsec * 0.000000001);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v53[2] = v33;
      v52[3] = CFSTR("ThresholdCPUUsage");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a9 / 0x3B9ACA00uLL);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v53[3] = v34;
      v52[4] = CFSTR("TimeWndowSize");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a10 / 0x3B9ACA00uLL);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v53[4] = v35;
      v52[5] = CFSTR("ObservedCPUUsage");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)a7 / 1000000000.0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v53[5] = v36;
      v52[6] = CFSTR("ObservedCPUUsageDuration");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", (double)a8 / 1000000000.0);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = (void *)v37;
      v52[7] = CFSTR("Mitigation");
      v39 = &unk_250A1A888;
      if (a11)
        v39 = &unk_250A1A870;
      v53[6] = v37;
      v53[7] = v39;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v53, v52, 8);
      v40 = (void *)objc_claimAutoreleasedReturnValue();

      -[CSExcessiveCPUViolationHandler logCPUViolationToPowerLogWithPayload:](self, "logCPUViolationToPowerLogWithPayload:", v40);
      v17 = v50;
    }
    else
    {
      v42 = self->_logger;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        -[CSExcessiveCPUViolationHandler handleViolationByProcess:pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:].cold.2(v42, v43, v44, v45, v46, v47, v48, v49);
    }

  }
  else
  {
    v41 = self->_logger;
    if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT))
      -[CSExcessiveCPUViolationHandler handleViolationByProcess:pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:].cold.1(v41);
  }

}

- (void)logCPUViolationToPowerLogWithPayload:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  _Unwind_Exception *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  if (logCPUViolationToPowerLogWithPayload__onceToken != -1)
    dispatch_once(&logCPUViolationToPowerLogWithPayload__onceToken, &__block_literal_global_30);
  v4 = logCPUViolationToPowerLogWithPayload__streamID;
  v5 = v3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v6 = getPPSSendTelemetrySymbolLoc_ptr;
  v12 = getPPSSendTelemetrySymbolLoc_ptr;
  if (!getPPSSendTelemetrySymbolLoc_ptr)
  {
    v7 = (void *)PowerLogLibrary();
    v6 = dlsym(v7, "PPSSendTelemetry");
    v10[3] = (uint64_t)v6;
    getPPSSendTelemetrySymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v9, 8);
  if (!v6)
  {
    v8 = (_Unwind_Exception *)-[CSExcessiveCPUViolationHandler logCPUViolationToPowerLogWithPayload:].cold.1();
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v8);
  }
  ((void (*)(uint64_t, id))v6)(v4, v5);

}

uint64_t __71__CSExcessiveCPUViolationHandler_logCPUViolationToPowerLogWithPayload___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t result;
  _Unwind_Exception *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getPPSCreateTelemetryIdentifierSymbolLoc_ptr;
  v7 = getPPSCreateTelemetryIdentifierSymbolLoc_ptr;
  if (!getPPSCreateTelemetryIdentifierSymbolLoc_ptr)
  {
    v1 = (void *)PowerLogLibrary();
    v0 = dlsym(v1, "PPSCreateTelemetryIdentifier");
    v5[3] = (uint64_t)v0;
    getPPSCreateTelemetryIdentifierSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v3 = (_Unwind_Exception *)-[CSExcessiveCPUViolationHandler logCPUViolationToPowerLogWithPayload:].cold.1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v3);
  }
  result = ((uint64_t (*)(const __CFString *, const __CFString *))v0)(CFSTR("XPCMetrics"), CFSTR("CPUViolations"));
  logCPUViolationToPowerLogWithPayload__streamID = result;
  return result;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)logger
{
  return self->_logger;
}

- (void)setLogger:(id)a3
{
  objc_storeStrong((id *)&self->_logger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)handleViolationByProcess:(os_log_t)log pid:path:endTime:observedValue:observationWindow:limitValue:limitWindow:fatal:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_2383F5000, log, OS_LOG_TYPE_FAULT, "No procName to use for logging violation.", v1, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)handleViolationByProcess:(uint64_t)a3 pid:(uint64_t)a4 path:(uint64_t)a5 endTime:(uint64_t)a6 observedValue:(uint64_t)a7 observationWindow:(uint64_t)a8 limitValue:limitWindow:fatal:.cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2383F5000, a1, a3, "ProcessIdentifier lookup failed. Ignoring report since this process isn't tracked by the system.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)handleViolationByProcess:(uint64_t)a3 pid:(uint64_t)a4 path:(uint64_t)a5 endTime:(uint64_t)a6 observedValue:(uint64_t)a7 observationWindow:(uint64_t)a8 limitValue:limitWindow:fatal:.cold.3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2383F5000, a1, a3, "No scenarioName to use, logging empty scenario name for violation.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (uint64_t)logCPUViolationToPowerLogWithPayload:.cold.1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[CSRestrictionManager applyRestrictionsToProcess:forScenario:].cold.1(v0);
}

@end
