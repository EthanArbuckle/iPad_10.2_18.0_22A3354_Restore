@implementation BLSHBacklightService

+ (id)serviceWithPlatformProvider:(id)a3 osInterfaceProvider:(id)a4 inactiveBudgetPolicy:(id)a5 localAssertionService:(id)a6 localOnly:(BOOL)a7
{
  _BOOL8 v7;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;

  v7 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithPlatformProvider:osInterfaceProvider:inactiveBudgetPolicy:localAssertionService:localOnly:", v15, v14, v13, v12, v7);

  return v16;
}

- (BLSHBacklightService)initWithPlatformProvider:(id)a3 osInterfaceProvider:(id)a4 inactiveBudgetPolicy:(id)a5 localAssertionService:(id)a6 localOnly:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BLSHBacklightService *v16;
  BLSHBacklightTransitionStateMachine *v17;
  BLSHBacklightTransitionStateMachine *transitionStateMachine;
  BLSHBacklightStateMachine *v19;
  BLSHBacklightStateMachine *stateMachine;
  uint64_t v21;
  BLSHXPCBacklightProxyHostServer *backlightXPCServer;
  uint64_t v23;
  BLSHDiagnosticsServer *diagnosticsServer;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  BLSHWatchdogTester *watchdogTester;
  BLSHCriticalAssertTester *v32;
  BLSHCriticalAssertTester *criticalAssertTester;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  BLSHWatchdogTester *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  objc_super v45;
  _QWORD v46[12];
  id v47[14];

  v47[12] = *(id *)MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v45.receiver = self;
  v45.super_class = (Class)BLSHBacklightService;
  v16 = -[BLSHBacklightService init](&v45, sel_init);
  if (v16)
  {
    v17 = -[BLSHBacklightTransitionStateMachine initWithPlatformProvider:osInterfaceProvider:inactiveBudgetPolicy:]([BLSHBacklightTransitionStateMachine alloc], "initWithPlatformProvider:osInterfaceProvider:inactiveBudgetPolicy:", v12, v13, v14);
    transitionStateMachine = v16->_transitionStateMachine;
    v16->_transitionStateMachine = v17;

    v19 = -[BLSHBacklightStateMachine initWithPlatformProvider:eventPerformer:osInterfaceProvider:]([BLSHBacklightStateMachine alloc], "initWithPlatformProvider:eventPerformer:osInterfaceProvider:", v12, v16->_transitionStateMachine, v13);
    stateMachine = v16->_stateMachine;
    v16->_stateMachine = v19;

    +[BLSHBacklightHost registerSharedBacklightHost:](BLSHBacklightHost, "registerSharedBacklightHost:", v16->_stateMachine);
    objc_msgSend(MEMORY[0x24BE0B848], "setDefaultBacklightProxy:", v16->_stateMachine);
    -[BLSHBacklightStateMachine registerHandlersForService:](v16->_stateMachine, "registerHandlersForService:", v15);
    -[BLSHBacklightTransitionStateMachine registerHandlersForService:](v16->_transitionStateMachine, "registerHandlersForService:", v15);
    if (!a7)
    {
      +[BLSHXPCBacklightProxyHostServer serverWithLocalBacklightProxy:](BLSHXPCBacklightProxyHostServer, "serverWithLocalBacklightProxy:", v16->_stateMachine);
      v21 = objc_claimAutoreleasedReturnValue();
      backlightXPCServer = v16->_backlightXPCServer;
      v16->_backlightXPCServer = (BLSHXPCBacklightProxyHostServer *)v21;

      if (os_variant_has_internal_diagnostics())
      {
        +[BLSHDiagnosticsServer serverWithFlipbookDiagnosticsProvider:](BLSHDiagnosticsServer, "serverWithFlipbookDiagnosticsProvider:", v16->_transitionStateMachine);
        v23 = objc_claimAutoreleasedReturnValue();
        diagnosticsServer = v16->_diagnosticsServer;
        v16->_diagnosticsServer = (BLSHDiagnosticsServer *)v23;

        v39 = [BLSHWatchdogTester alloc];
        v47[0] = v16->_transitionStateMachine;
        v46[0] = CFSTR("com.apple.BacklightServices.BLSHBacklightTransitionStateMachine.watchdogtest");
        v46[1] = CFSTR("com.apple.BacklightServices.BLSHBacklightDisplayStateMachine.watchdogtest");
        objc_msgSend(v47[0], "displayStateMachine");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v47[1] = v44;
        objc_msgSend(CFSTR("com.apple.BacklightServices.BLSHBacklightTransitionStateMachine.watchdogtest"), "stringByAppendingString:", 0x24D1C4248);
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        v46[2] = v43;
        v47[2] = v16->_transitionStateMachine;
        objc_msgSend(CFSTR("com.apple.BacklightServices.BLSHBacklightDisplayStateMachine.watchdogtest"), "stringByAppendingString:", 0x24D1C4248);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v46[3] = v42;
        -[BLSHBacklightTransitionStateMachine displayStateMachine](v16->_transitionStateMachine, "displayStateMachine");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        v47[3] = v41;
        objc_msgSend(CFSTR("com.apple.BacklightServices.BLSHBacklightDisplayStateMachine.watchdogtest"), "stringByAppendingString:", 0x24D1C4228);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v46[4] = v40;
        -[BLSHBacklightTransitionStateMachine displayStateMachine](v16->_transitionStateMachine, "displayStateMachine");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v46[5] = CFSTR("com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest");
        v47[4] = v38;
        v47[5] = v13;
        objc_msgSend(CFSTR("com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest"), "stringByAppendingString:", 0x24D1C4248);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v46[6] = v37;
        v47[6] = v13;
        objc_msgSend(CFSTR("com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest"), "stringByAppendingString:", 0x24D1C4268);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v46[7] = v36;
        v47[7] = v13;
        objc_msgSend(CFSTR("com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest"), "stringByAppendingString:", 0x24D1C4288);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v46[8] = v35;
        v47[8] = v13;
        objc_msgSend(CFSTR("com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest"), "stringByAppendingString:", 0x24D1C4228);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v46[9] = v25;
        -[BLSHBacklightTransitionStateMachine displayStateMachine](v16->_transitionStateMachine, "displayStateMachine");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v47[9] = v26;
        objc_msgSend(CFSTR("com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest"), "stringByAppendingString:", 0x24D1C42A8);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v46[10] = v27;
        v47[10] = v13;
        objc_msgSend(CFSTR("com.apple.BacklightServices.BLSHBacklightOSInterfaceProvider.watchdogtest"), "stringByAppendingString:", 0x24D1C42C8);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v46[11] = v28;
        v47[11] = v13;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 12);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = -[BLSHWatchdogTester initWithWatchdogProviderDelegate:testables:](v39, "initWithWatchdogProviderDelegate:testables:", v13, v29);
        watchdogTester = v16->_watchdogTester;
        v16->_watchdogTester = (BLSHWatchdogTester *)v30;

        v32 = -[BLSHCriticalAssertTester initWithNotificationName:]([BLSHCriticalAssertTester alloc], "initWithNotificationName:", CFSTR("com.apple.BacklightServices.criticalasserttest"));
        criticalAssertTester = v16->_criticalAssertTester;
        v16->_criticalAssertTester = v32;

      }
    }
  }

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_criticalAssertTester, 0);
  objc_storeStrong((id *)&self->_watchdogTester, 0);
  objc_storeStrong((id *)&self->_diagnosticsServer, 0);
  objc_storeStrong((id *)&self->_backlightXPCServer, 0);
  objc_storeStrong((id *)&self->_transitionStateMachine, 0);
  objc_storeStrong((id *)&self->_stateMachine, 0);
}

@end
