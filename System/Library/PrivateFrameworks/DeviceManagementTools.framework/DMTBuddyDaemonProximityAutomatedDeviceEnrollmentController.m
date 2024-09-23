@implementation DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController

- (void)dealloc
{
  NSObject *v3;
  objc_class *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  _DMTLogGeneral_6();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v8 = v5;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_INFO, "%{public}@ dealloc'd", buf, 0xCu);

  }
  v6.receiver = self;
  v6.super_class = (Class)DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController;
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController dealloc](&v6, sel_dealloc);
}

- (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController)initWithBroadcastingProvider:(id)a3 enrollmentPrimitives:(id)a4 deviceInformationPrimitives:(id)a5 enrollmentInformationPrimitives:(id)a6 reachabilityPrimitives:(id)a7 wifiActivationPrimitives:(id)a8 wifiPrimitives:(id)a9 profileInstallationPrimitives:(id)a10 destructiveErasePrimitives:(id)a11 powerOffPrimitives:(id)a12 delegate:(id)a13
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  id v28;
  DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *v29;
  DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController *v30;
  DMTAutomatedDeviceEnroller *v31;
  DMTAutomatedDeviceEnroller *enroller;
  DMTTaskOperationBuilder *v33;
  DMTTaskOperationBuilder *operationBuilder;
  uint64_t v35;
  CATTaskServer *taskServer;
  id v39;
  id v41;
  id v42;
  objc_super v43;

  v41 = a3;
  v18 = a4;
  v39 = a5;
  v19 = a5;
  v20 = a6;
  v21 = a7;
  v42 = a8;
  v22 = a9;
  v23 = v18;
  v24 = a10;
  v25 = a11;
  v26 = v21;
  v27 = a12;
  v28 = a13;
  v43.receiver = self;
  v43.super_class = (Class)DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController;
  v29 = -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController init](&v43, sel_init);
  v30 = v29;
  if (v29)
  {
    objc_storeStrong((id *)&v29->_broadcastingProvider, a3);
    objc_storeWeak((id *)&v30->_delegate, v28);
    objc_storeStrong((id *)&v30->_deviceInformationPrimitives, v39);
    v31 = -[DMTAutomatedDeviceEnroller initWithEnrollmentPrimitives:enrollmentInformationPrimitives:reachabilityPrimitives:activationPrimitives:wifiPrimitives:profileInstallationPrimitives:destructiveErasePrimitives:nonDestructiveErasePrimitives:powerOffPrimitives:]([DMTAutomatedDeviceEnroller alloc], "initWithEnrollmentPrimitives:enrollmentInformationPrimitives:reachabilityPrimitives:activationPrimitives:wifiPrimitives:profileInstallationPrimitives:destructiveErasePrimitives:nonDestructiveErasePrimitives:powerOffPrimitives:", v23, v20, v26, v42, v22, v24, v25, 0, v27);
    enroller = v30->_enroller;
    v30->_enroller = v31;

    v33 = -[DMTTaskOperationBuilder initWithDeviceInfoPrimitives:enrollmentPrerequisiteReceiver:enrollmentInitiator:enrollmentStateProvider:]([DMTTaskOperationBuilder alloc], "initWithDeviceInfoPrimitives:enrollmentPrerequisiteReceiver:enrollmentInitiator:enrollmentStateProvider:", v19, v30->_enroller, v30->_enroller, v30->_enroller);
    operationBuilder = v30->_operationBuilder;
    v30->_operationBuilder = v33;

    v35 = objc_opt_new();
    taskServer = v30->_taskServer;
    v30->_taskServer = (CATTaskServer *)v35;

    -[CATTaskServer setDelegate:](v30->_taskServer, "setDelegate:", v30);
  }

  return v30;
}

+ (id)keyPathsForValuesAffectingBroadcasting
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", CFSTR("broadcaster.isBroadcasting"));
}

- (BOOL)isBroadcasting
{
  void *v2;
  char v3;

  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcaster](self, "broadcaster");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBroadcasting");

  return v3;
}

- (void)beginBroadcasting
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    v4 = -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController isBroadcasting](self, "isBroadcasting");
    _DMTLogGeneral_6();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        NSStringFromSelector(a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v7;
        _os_log_impl(&dword_21FD69000, v5, OS_LOG_TYPE_INFO, "Ignoring %{public}@, already broadcasting", (uint8_t *)&v12, 0xCu);

      }
    }
    else
    {
      if (v6)
      {
        NSStringFromSelector(a2);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v8;
        _os_log_impl(&dword_21FD69000, v5, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v12, 0xCu);

      }
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcastingProvider](self, "broadcastingProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "broadcaster");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController addHandlersToBroadcaster:](self, "addHandlersToBroadcaster:", v10);
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController setBroadcaster:](self, "setBroadcaster:", v10);
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcaster](self, "broadcaster");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "startBroadcasting");

    }
  }
  else
  {
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)endBroadcasting
{
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    v4 = -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController isBroadcasting](self, "isBroadcasting");
    _DMTLogGeneral_6();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v4)
    {
      if (v6)
      {
        NSStringFromSelector(a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v13 = v7;
        _os_log_impl(&dword_21FD69000, v5, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);

      }
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcaster](self, "broadcaster");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController removeHandlersFromBroadcaster:](self, "removeHandlersFromBroadcaster:", v8);

      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcaster](self, "broadcaster");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "invalidate");

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __77__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_endBroadcasting__block_invoke;
      block[3] = &unk_24E59FCE0;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
    else
    {
      if (v6)
      {
        NSStringFromSelector(a2);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v13 = v10;
        _os_log_impl(&dword_21FD69000, v5, OS_LOG_TYPE_INFO, "Ignoring %{public}@, not broadcasting", buf, 0xCu);

      }
    }
  }
  else
  {
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

uint64_t __77__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_endBroadcasting__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setBroadcaster:", 0);
}

- (void)beginEraseAndShutdown
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    _DMTLogGeneral_6();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v5;
      _os_log_impl(&dword_21FD69000, v4, OS_LOG_TYPE_INFO, "%{public}@", (uint8_t *)&v7, 0xCu);

    }
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "eraseAndShutDownWithExternalError:", 0);

  }
  else
  {
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }
}

- (void)addHandlersToBroadcaster:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[4];
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke;
  v10[3] = &unk_24E5A06E0;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v4, "setShowPinHandler:", v10);
  v8[0] = v5;
  v8[1] = 3221225472;
  v8[2] = __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke_2;
  v8[3] = &unk_24E5A01D0;
  objc_copyWeak(&v9, &location);
  objc_msgSend(v4, "setShowErrorHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke_3;
  v6[3] = &unk_24E5A0708;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "setPairedTransportHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "broadcasterUpdatedDisplayedPin:", v3);

}

void __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke_2(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "broadcasterEncounteredError:", v3);

}

void __87__DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController_addHandlersToBroadcaster___block_invoke_3(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "broadcasterHasPairedTransport:", v3);

}

- (void)removeHandlersFromBroadcaster:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "setShowPinHandler:", 0);
  objc_msgSend(v3, "setShowErrorHandler:", 0);
  objc_msgSend(v3, "setPairedTransportHandler:", 0);

}

- (void)beginObservingEnroller
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  NSStringFromSelector(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_21FD69000, v2, v3, "Already observing enroller, ignoring %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)endObservingEnrollerIfNeeded
{
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  if (-[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController isObservingEnroller](self, "isObservingEnroller"))
  {
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:forKeyPath:context:", self, CFSTR("enrollmentState"), CFSTR("EnrollmentControllerContext"));

    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController setObservingEnroller:](self, "setObservingEnroller:", 0);
  }
  else
  {
    _DMTLogGeneral_6();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138543362;
      v8 = v6;
      _os_log_impl(&dword_21FD69000, v5, OS_LOG_TYPE_INFO, "Not observing enroller, ignoring %{public}@", (uint8_t *)&v7, 0xCu);

    }
  }
}

- (void)broadcasterUpdatedDisplayedPin:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    if (-[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController isBroadcasting](self, "isBroadcasting"))
    {
      if (v5)
      {
        -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegate](self, "delegate");
        v6 = objc_claimAutoreleasedReturnValue();
        -[NSObject enrollmentController:needsToDisplayPin:](v6, "enrollmentController:needsToDisplayPin:", self, v5);
      }
      else
      {
        _DMTLogGeneral_6();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
          -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcasterUpdatedDisplayedPin:].cold.1();
      }

    }
    else
    {
      _DMTLogGeneral_6();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_21FD69000, v7, OS_LOG_TYPE_INFO, "Ignoring updated Pin, no longer broadcasting", v8, 2u);
      }

    }
  }
  else
  {
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }

}

- (void)broadcasterEncounteredError:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;

  v5 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    objc_msgSend(v5, "userInfo");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDD1398];
    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x24BDD1398]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "userInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v10, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "isEqualToString:", *MEMORY[0x24BE15738]) & 1) != 0)
      {
        v12 = objc_msgSend(v10, "code");

        if (v12 == 702)
        {
          _DMTLogGeneral_6();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcasterEncounteredError:].cold.2(v13);
LABEL_12:

          goto LABEL_13;
        }
      }
      else
      {

      }
    }
    _DMTLogGeneral_6();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController broadcasterEncounteredError:].cold.1(v5);

    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController endBroadcasting](self, "endBroadcasting");
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegate](self, "delegate");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject enrollmentController:hasBroadcastError:](v13, "enrollmentController:hasBroadcastError:", self, v5);
    goto LABEL_12;
  }
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
LABEL_13:

}

- (void)broadcasterHasPairedTransport:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread") & 1) != 0)
  {
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController beginObservingEnroller](self, "beginObservingEnroller");
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController taskServer](self, "taskServer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "connectWithClientTransport:", v8);

    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController makeStatusViewModelForCurrentEnrollerState](self, "makeStatusViewModelForCurrentEnrollerState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enrollmentControllerHasPaired:withInitialViewModel:", self, v7);

  }
  else
  {
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", a2, 0, 0);
  }

}

- (void)delegateSuccessfullEnrollment
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController setComplete:](self, "setComplete:", 1);
  _DMTLogGeneral_6();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_INFO, "Successfully enrolled", v6, 2u);
  }

  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController resetNetworking](self, "resetNetworking");
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController makeSuccessfulCompletionViewModel](self, "makeSuccessfulCompletionViewModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enrollmentController:hasCompletedWithViewModel:", self, v4);

}

- (void)handleServerFailureWithError:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;

  v4 = a3;
  if (!-[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController isComplete](self, "isComplete"))
  {
    _DMTLogGeneral_6();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController handleServerFailureWithError:].cold.3();

    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "enrollmentState");

    _DMTLogGeneral_6();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v7 >= 5)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController handleServerFailureWithError:].cold.1(v7);
      goto LABEL_12;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController handleServerFailureWithError:].cold.2(v7);

    if (!v4)
    {
      DMTErrorWithCodeAndUserInfo(90, 0);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegateEnrollmentError:](self, "delegateEnrollmentError:", v9);
LABEL_12:

      goto LABEL_13;
    }
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegateEnrollmentError:](self, "delegateEnrollmentError:", v4);
  }
LABEL_13:

}

- (void)delegateEnrollmentError:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController setComplete:](self, "setComplete:", 1);
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController resetNetworking](self, "resetNetworking");
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController makeFailureCompletionViewModelWithError:](self, "makeFailureCompletionViewModelWithError:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enrollmentController:hasCompletedWithViewModel:", self, v6);

}

- (void)delegateStatusUpdate
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  _DMTLogGeneral_6();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInteger:", objc_msgSend(v5, "enrollmentState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v6;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_DEFAULT, "Enroller changed status to: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController makeStatusViewModelForCurrentEnrollerState](self, "makeStatusViewModelForCurrentEnrollerState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enrollmentController:hasUpdatedWithViewModel:", self, v7);

}

- (void)resetNetworking
{
  id v3;

  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController endBroadcasting](self, "endBroadcasting");
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController endObservingEnrollerIfNeeded](self, "endObservingEnrollerIfNeeded");
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController taskServer](self, "taskServer");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disconnectAllClientSessions");

}

- (id)makeStatusViewModelForCurrentEnrollerState
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  DMTEnrollmentStatusViewModel *v13;
  DMTEnrollmentStatusViewModel *v15;

  v15 = [DMTEnrollmentStatusViewModel alloc];
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "organizationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "organizationType");
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController deviceInformationPrimitives](self, "deviceInformationPrimitives");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "deviceClass");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "enrollmentState");
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "networkName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[DMTEnrollmentStatusViewModel initWithOrganizationName:organizationType:localizedDeviceClass:enrollmentState:networkName:](v15, "initWithOrganizationName:organizationType:localizedDeviceClass:enrollmentState:networkName:", v4, v6, v8, v10, v12);

  return v13;
}

- (id)makeSuccessfulCompletionViewModel
{
  DMTEnrollmentCompletionViewModel *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = [DMTEnrollmentCompletionViewModel alloc];
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "organizationName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "organizationType");
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "mdmServerName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController deviceInformationPrimitives](self, "deviceInformationPrimitives");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "deviceClass");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[DMTEnrollmentCompletionViewModel initSuccessfulEnrollmentInOrganizationName:organizationType:mdmServerName:localizedDeviceClass:](v3, "initSuccessfulEnrollmentInOrganizationName:organizationType:mdmServerName:localizedDeviceClass:", v5, v7, v9, v11);

  return v12;
}

- (id)makeFailureCompletionViewModelWithError:(id)a3
{
  id v4;
  DMTEnrollmentCompletionViewModel *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = [DMTEnrollmentCompletionViewModel alloc];
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController deviceInformationPrimitives](self, "deviceInformationPrimitives");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deviceClass");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DMTEnrollmentCompletionViewModel initForEnrollmentFailureWithError:localizedDeviceClass:](v5, "initForEnrollmentFailureWithError:localizedDeviceClass:", v4, v7);

  return v8;
}

- (void)server:(id)a3 clientSession:(id)a4 didInterruptWithError:(id)a5
{
  id v6;
  NSObject *v7;

  v6 = a5;
  _DMTLogGeneral_6();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController server:clientSession:didInterruptWithError:].cold.1();

  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController handleServerFailureWithError:](self, "handleServerFailureWithError:", v6);
}

- (void)server:(id)a3 clientSessionDidDisconnect:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _DMTLogGeneral_6();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v8 = 138543362;
    v9 = v5;
    _os_log_impl(&dword_21FD69000, v6, OS_LOG_TYPE_INFO, "Client Session did disconnect: %{public}@", (uint8_t *)&v8, 0xCu);
  }

  DMTErrorWithCodeAndUserInfo(91, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController handleServerFailureWithError:](self, "handleServerFailureWithError:", v7);

}

- (void)serverDidInvalidate:(id)a3
{
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  _DMTLogGeneral_6();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21FD69000, v4, OS_LOG_TYPE_INFO, "Task Server invalidated", v6, 2u);
  }

  DMTErrorWithCodeAndUserInfo(90, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController handleServerFailureWithError:](self, "handleServerFailureWithError:", v5);

}

- (id)server:(id)a3 clientSession:(id)a4 operationForRequest:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  NSObject *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController operationBuilder](self, "operationBuilder");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a6) = objc_msgSend(v9, "validateRequest:error:", v8, a6);

  if ((_DWORD)a6)
  {
    _DMTLogGeneral_6();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v12;
      _os_log_impl(&dword_21FD69000, v10, OS_LOG_TYPE_INFO, "Creating operation for request: %{public}@", (uint8_t *)&v16, 0xCu);

    }
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController operationBuilder](self, "operationBuilder");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "taskOperationForRequest:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  objc_super v11;

  if (a6 == CFSTR("EnrollmentControllerContext"))
  {
    if (objc_msgSend(a3, "isEqualToString:", CFSTR("enrollmentState"), a4, a5))
    {
      -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "enrollmentState");

      if (v8 == 14)
      {
        -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController enroller](self, "enroller");
        v10 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "enrollmentError");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegateEnrollmentError:](self, "delegateEnrollmentError:", v9);

      }
      else if (v8 == 10)
      {
        -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegateSuccessfullEnrollment](self, "delegateSuccessfullEnrollment");
      }
      else
      {
        -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController delegateStatusUpdate](self, "delegateStatusUpdate");
      }
    }
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController;
    -[DMTBuddyDaemonProximityAutomatedDeviceEnrollmentController observeValueForKeyPath:ofObject:change:context:](&v11, sel_observeValueForKeyPath_ofObject_change_context_, a3, a4, a5);
  }
}

- (NSError)enrollmentError
{
  return self->_enrollmentError;
}

- (DMTRemoteSetupBroadcastingProvider)broadcastingProvider
{
  return self->_broadcastingProvider;
}

- (DMTDeviceInformationPrimitives)deviceInformationPrimitives
{
  return self->_deviceInformationPrimitives;
}

- (DMTAutomatedDeviceEnroller)enroller
{
  return self->_enroller;
}

- (DMTTaskOperationBuilder)operationBuilder
{
  return self->_operationBuilder;
}

- (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentControllerDelegate)delegate
{
  return (DMTBuddyDaemonProximityAutomatedDeviceEnrollmentControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (DMTRemoteSetupBroadcasting)broadcaster
{
  return self->_broadcaster;
}

- (void)setBroadcaster:(id)a3
{
  objc_storeStrong((id *)&self->_broadcaster, a3);
}

- (BOOL)isObservingEnroller
{
  return self->_observingEnroller;
}

- (void)setObservingEnroller:(BOOL)a3
{
  self->_observingEnroller = a3;
}

- (CATTaskServer)taskServer
{
  return self->_taskServer;
}

- (BOOL)isComplete
{
  return self->_complete;
}

- (void)setComplete:(BOOL)a3
{
  self->_complete = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskServer, 0);
  objc_storeStrong((id *)&self->_broadcaster, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_operationBuilder, 0);
  objc_storeStrong((id *)&self->_enroller, 0);
  objc_storeStrong((id *)&self->_deviceInformationPrimitives, 0);
  objc_storeStrong((id *)&self->_broadcastingProvider, 0);
  objc_storeStrong((id *)&self->_enrollmentError, 0);
}

- (void)broadcasterUpdatedDisplayedPin:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v2, v3, "%{public}@ was asked to dismiss the Pin, since we can't tell this apart from successful pairings, we'll ignore it", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)broadcasterEncounteredError:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "verboseDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_21FD69000, v2, v3, "Broadcaster has encountered error, forwarding to delegate: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)broadcasterEncounteredError:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21FD69000, log, OS_LOG_TYPE_DEBUG, "Broadcaster will invalidate due to successful pairing, ignoring error", v1, 2u);
}

- (void)handleServerFailureWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_2_0(&dword_21FD69000, v2, v3, "Current enrollment state is: %{public}@, ignoring failure, we're already independent", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)handleServerFailureWithError:(uint64_t)a1 .cold.2(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_0_2(&dword_21FD69000, v2, v3, "Tearing down due to enrollment state: %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)handleServerFailureWithError:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_21FD69000, v0, v1, "Handling server failure: %{public}@", v2);
}

- (void)server:clientSession:didInterruptWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_21FD69000, v0, v1, "Client Session interrupted: %{public}@", v2);
}

@end
