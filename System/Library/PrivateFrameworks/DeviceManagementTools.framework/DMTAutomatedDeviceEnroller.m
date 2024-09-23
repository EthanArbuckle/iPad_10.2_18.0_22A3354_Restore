@implementation DMTAutomatedDeviceEnroller

- (DMTAutomatedDeviceEnroller)initWithEnrollmentPrimitives:(id)a3 enrollmentInformationPrimitives:(id)a4 reachabilityPrimitives:(id)a5 activationPrimitives:(id)a6 wifiPrimitives:(id)a7 profileInstallationPrimitives:(id)a8 destructiveErasePrimitives:(id)a9 nonDestructiveErasePrimitives:(id)a10 powerOffPrimitives:(id)a11
{
  DMTAutomatedDeviceEnroller *v18;
  DMTAutomatedDeviceEnroller *v19;
  uint64_t v20;
  CATOperationQueue *operationQueue;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  objc_super v32;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v28 = a6;
  v27 = a7;
  v26 = a8;
  v25 = a9;
  v24 = a10;
  v23 = a11;
  v32.receiver = self;
  v32.super_class = (Class)DMTAutomatedDeviceEnroller;
  v18 = -[DMTAutomatedDeviceEnroller init](&v32, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_enrollmentPrimitives, a3);
    objc_storeStrong((id *)&v19->_enrollmentInformationPrimitives, a4);
    objc_storeStrong((id *)&v19->_reachabilityPrimitives, a5);
    objc_storeStrong((id *)&v19->_activationPrimitives, a6);
    objc_storeStrong((id *)&v19->_wifiPrimitives, a7);
    objc_storeStrong((id *)&v19->_profileInstallationPrimitives, a8);
    objc_storeStrong((id *)&v19->_destructiveErasePrimitives, a9);
    objc_storeStrong((id *)&v19->_nonDestructiveErasePrimitives, a10);
    objc_storeStrong((id *)&v19->_powerOffPrimitives, a11);
    v20 = objc_opt_new();
    operationQueue = v19->_operationQueue;
    v19->_operationQueue = (CATOperationQueue *)v20;

    v19->_enrollmentState = 0;
  }

  return v19;
}

- (void)setNetworkCredential:(id)a3 networkPayload:(id)a4 enrollmentNonce:(id)a5 postEnrollmentBehavior:(int64_t)a6 organizationName:(id)a7 organizationType:(int64_t)a8 mdmServerName:(id)a9 networkConfiguration:(int64_t)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  void *v24;
  uint8_t v25[16];

  v17 = a3;
  v18 = a4;
  v19 = a5;
  v20 = a7;
  v21 = a9;
  if (-[DMTAutomatedDeviceEnroller isFinalized](self, "isFinalized"))
  {
    _DMTLogGeneral_2();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[DMTAutomatedDeviceEnroller setNetworkCredential:networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:].cold.1(a2);

  }
  else
  {
    _DMTLogEnrollment();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v25 = 0;
      _os_log_impl(&dword_21FD69000, v23, OS_LOG_TYPE_DEFAULT, "Receiving enrollment prerequisites...", v25, 2u);
    }

    -[DMTAutomatedDeviceEnroller setEnrollmentState:](self, "setEnrollmentState:", 5);
    -[DMTAutomatedDeviceEnroller setOrganizationName:](self, "setOrganizationName:", v20);
    -[DMTAutomatedDeviceEnroller setOrganizationType:](self, "setOrganizationType:", a8);
    -[DMTAutomatedDeviceEnroller setMdmServerName:](self, "setMdmServerName:", v21);
    -[DMTAutomatedDeviceEnroller setNetworkCredential:](self, "setNetworkCredential:", v17);
    objc_msgSend(v17, "networkName");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMTAutomatedDeviceEnroller setNetworkName:](self, "setNetworkName:", v24);

    -[DMTAutomatedDeviceEnroller setNetworkPayload:](self, "setNetworkPayload:", v18);
    -[DMTAutomatedDeviceEnroller setEnrollmentNonce:](self, "setEnrollmentNonce:", v19);
    -[DMTAutomatedDeviceEnroller setPostEnrollmentBehavior:](self, "setPostEnrollmentBehavior:", a6);
    -[DMTAutomatedDeviceEnroller setNetworkConfiguration:](self, "setNetworkConfiguration:", a10);
  }

}

- (void)beginAutomatedDeviceEnrollment
{
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t v10[16];
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  if (-[DMTAutomatedDeviceEnroller isFinalized](self, "isFinalized"))
  {
    _DMTLogGeneral_2();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[DMTAutomatedDeviceEnroller setNetworkCredential:networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:].cold.1(a2);
LABEL_9:

    return;
  }
  _DMTLogEnrollment();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FD69000, v5, OS_LOG_TYPE_DEFAULT, "Beginning automated device enrollment...", buf, 2u);
  }

  if (-[DMTAutomatedDeviceEnroller enrollmentState](self, "enrollmentState") >= 6)
  {
    _DMTLogEnrollment();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl(&dword_21FD69000, v4, OS_LOG_TYPE_DEFAULT, "Enrollment already in-progress, ignoring call to begin enrollment", v12, 2u);
    }
    goto LABEL_9;
  }
  -[DMTAutomatedDeviceEnroller setEnrollmentState:](self, "setEnrollmentState:", 6);
  -[DMTAutomatedDeviceEnroller reachabilityPrimitives](self, "reachabilityPrimitives");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "reachable");

  _DMTLogEnrollment();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21FD69000, v8, OS_LOG_TYPE_DEFAULT, "Already reachable, skipping to enrollment", v11, 2u);
    }

    -[DMTAutomatedDeviceEnroller checkActivationStatus](self, "checkActivationStatus");
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21FD69000, v8, OS_LOG_TYPE_DEFAULT, "Not yet reachable, joining network...", v10, 2u);
    }

    -[DMTAutomatedDeviceEnroller joinNetwork](self, "joinNetwork");
  }
}

- (void)eraseAndRestartWithExternalError:(id)a3
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (-[DMTAutomatedDeviceEnroller isFinalized](self, "isFinalized"))
  {
    _DMTLogGeneral_2();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DMTAutomatedDeviceEnroller setNetworkCredential:networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:].cold.1(a2);

  }
  else
  {
    -[DMTAutomatedDeviceEnroller setFinalized:](self, "setFinalized:", 1);
    -[DMTAutomatedDeviceEnroller setEnrollmentState:](self, "setEnrollmentState:", 11);
    -[DMTAutomatedDeviceEnroller eraseAllContentAndSettingsWithExternalError:](self, "eraseAllContentAndSettingsWithExternalError:", v5);
  }

}

- (void)eraseAndShutDownWithExternalError:(id)a3
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (-[DMTAutomatedDeviceEnroller isFinalized](self, "isFinalized"))
  {
    _DMTLogGeneral_2();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DMTAutomatedDeviceEnroller setNetworkCredential:networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:].cold.1(a2);

  }
  else
  {
    -[DMTAutomatedDeviceEnroller setFinalized:](self, "setFinalized:", 1);
    -[DMTAutomatedDeviceEnroller setEnrollmentState:](self, "setEnrollmentState:", 12);
    -[DMTAutomatedDeviceEnroller eraseAllContentAndSettingsWithExternalError:](self, "eraseAllContentAndSettingsWithExternalError:", v5);
  }

}

- (void)eraseCurrentNetworkIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];

  -[DMTAutomatedDeviceEnroller installedNetworkPayloadIdentifier](self, "installedNetworkPayloadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[DMTAutomatedDeviceEnroller uninstallProfile](self, "uninstallProfile");
  }
  else
  {
    -[DMTAutomatedDeviceEnroller networkCredential](self, "networkCredential");
    v4 = objc_claimAutoreleasedReturnValue();
    if (v4
      && (v5 = (void *)v4,
          -[DMTAutomatedDeviceEnroller networkName](self, "networkName"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v7 = objc_msgSend(v6, "length"),
          v6,
          v5,
          v7))
    {
      -[DMTAutomatedDeviceEnroller disassociateWiFi](self, "disassociateWiFi");
    }
    else
    {
      _DMTLogGeneral_2();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_21FD69000, v8, OS_LOG_TYPE_INFO, "No network configuration needs to be erased", v9, 2u);
      }

    }
  }
}

- (DMTErasePrimitives)nonDestructiveErasePrimitives
{
  DMTErasePrimitives *nonDestructiveErasePrimitives;
  NSObject *v4;
  uint8_t v6[16];

  nonDestructiveErasePrimitives = self->_nonDestructiveErasePrimitives;
  if (!nonDestructiveErasePrimitives)
  {
    _DMTLogGeneral_2();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21FD69000, v4, OS_LOG_TYPE_INFO, "non-destructive erase primitives not found, substituting destructive primtives", v6, 2u);
    }

    nonDestructiveErasePrimitives = self->_destructiveErasePrimitives;
  }
  return nonDestructiveErasePrimitives;
}

- (void)tearDownWithFatalError:(id)a3
{
  -[DMTAutomatedDeviceEnroller setEnrollmentError:](self, "setEnrollmentError:", a3);
  -[DMTAutomatedDeviceEnroller setEnrollmentState:](self, "setEnrollmentState:", 14);
}

- (void)waitForReachabilityWithTimeout:(double)a3
{
  DMTWaitForKVOChangeOperation *v5;
  void *v6;
  DMTWaitForKVOChangeOperation *v7;
  DMTTimeoutOperation *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v5 = [DMTWaitForKVOChangeOperation alloc];
  -[DMTAutomatedDeviceEnroller reachabilityPrimitives](self, "reachabilityPrimitives");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMTWaitForKVOChangeOperation initWithObservedObject:keyPath:expectedValue:requireExpectedValue:](v5, "initWithObservedObject:keyPath:expectedValue:requireExpectedValue:", v6, CFSTR("reachable"), MEMORY[0x24BDBD1C8], 0);

  v8 = -[DMTTimeoutOperation initWithOperation:timeout:cancelsOnTimeout:]([DMTTimeoutOperation alloc], "initWithOperation:timeout:cancelsOnTimeout:", v7, 1, a3);
  -[DMTTimeoutOperation addTarget:selector:forOperationEvents:](v8, "addTarget:selector:forOperationEvents:", self, sel_timeoutOperationDidFinish_, 6);
  _DMTLogEnrollment();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v10;
    _os_log_impl(&dword_21FD69000, v9, OS_LOG_TYPE_DEFAULT, "Waiting for reachability for %{public}@ seconds", buf, 0xCu);

  }
  -[DMTAutomatedDeviceEnroller operationQueue](self, "operationQueue");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addOperations:waitUntilFinished:", v12, 0);

}

- (void)timeoutOperationDidFinish:(id)a3
{
  void *v4;
  char v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint8_t v11[16];

  -[DMTAutomatedDeviceEnroller reachabilityPrimitives](self, "reachabilityPrimitives", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "reachable");

  if ((v5 & 1) != 0)
  {
    _DMTLogEnrollment();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_21FD69000, v6, OS_LOG_TYPE_DEFAULT, "Internet connection acquired...", v11, 2u);
    }

    -[DMTAutomatedDeviceEnroller checkActivationStatus](self, "checkActivationStatus");
  }
  else
  {
    _DMTLogGeneral_2();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DMTAutomatedDeviceEnroller timeoutOperationDidFinish:].cold.1(v7, v8, v9);

    DMTEnrollmentTimeoutErrorForNetworkConfiguration(-[DMTAutomatedDeviceEnroller networkConfiguration](self, "networkConfiguration"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[DMTAutomatedDeviceEnroller tearDownWithFatalError:](self, "tearDownWithFatalError:", v10);

  }
}

- (void)joinNetwork
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(a1, "networkConfiguration"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5();
  _os_log_debug_impl(&dword_21FD69000, a2, OS_LOG_TYPE_DEBUG, "Unknown network configuration: %{public}@", v4, 0xCu);

  OUTLINED_FUNCTION_3_0();
}

- (void)verifyProfile
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  uint8_t buf[16];

  _DMTLogEnrollment();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_DEFAULT, "Validating Profile...", buf, 2u);
  }

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke;
  v6[3] = &unk_24E59FCE0;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BDD1478], "blockOperationWithBlock:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTAutomatedDeviceEnroller operationQueue](self, "operationQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addOperation:", v4);

}

void __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  id *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD block[4];
  id v13;
  id v14;
  id location;
  id v16;

  objc_msgSend(*(id *)(a1 + 32), "networkPayload");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  +[DMTConfigurationProfile configurationProfileWithData:error:](DMTConfigurationProfile, "configurationProfileWithData:error:", v2, &v16);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v16;

  objc_initWeak(&location, *(id *)(a1 + 32));
  if (!v3)
    goto LABEL_5;
  +[DMTConfigurationProfileValidatorBundles macBuddyNetworkProfileValidators](DMTConfigurationProfileValidatorBundles, "macBuddyNetworkProfileValidators");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v4;
  v6 = objc_msgSend(v3, "validateWithValidators:error:", v5, &v14);
  v7 = v14;

  if (!v6)
  {
    v4 = v7;
LABEL_5:
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke_3;
    v9[3] = &unk_24E5A01A8;
    v8 = &v11;
    objc_copyWeak(&v11, &location);
    v7 = v4;
    v10 = v7;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);

    goto LABEL_6;
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke_2;
  block[3] = &unk_24E5A0240;
  v8 = &v13;
  objc_copyWeak(&v13, &location);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
LABEL_6:
  objc_destroyWeak(v8);
  objc_destroyWeak(&location);

}

void __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "installProfile");

}

void __43__DMTAutomatedDeviceEnroller_verifyProfile__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "tearDownWithFatalError:", *(_QWORD *)(a1 + 32));

}

- (void)installProfile
{
  NSObject *v3;
  DMTInstallProfileOperation *v4;
  void *v5;
  void *v6;
  DMTInstallProfileOperation *v7;
  void *v8;
  uint8_t v9[16];

  _DMTLogEnrollment();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_DEFAULT, "Installing Profile...", v9, 2u);
  }

  v4 = [DMTInstallProfileOperation alloc];
  -[DMTAutomatedDeviceEnroller profileInstallationPrimitives](self, "profileInstallationPrimitives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTAutomatedDeviceEnroller networkPayload](self, "networkPayload");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMTInstallProfileOperation initWithProfileInstallationPrimitives:profileData:](v4, "initWithProfileInstallationPrimitives:profileData:", v5, v6);

  -[DMTInstallProfileOperation addTarget:selector:forOperationEvents:](v7, "addTarget:selector:forOperationEvents:", self, sel_profileInstallationDidFinish_, 6);
  -[DMTAutomatedDeviceEnroller operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v7);

}

- (void)profileInstallationDidFinish:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[16];

  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "error");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    -[DMTAutomatedDeviceEnroller tearDownWithFatalError:](self, "tearDownWithFatalError:", v9);
  }
  else
  {
    objc_msgSend(v4, "resultObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[DMTAutomatedDeviceEnroller setInstalledNetworkPayloadIdentifier:](self, "setInstalledNetworkPayloadIdentifier:", v6);
    -[DMTAutomatedDeviceEnroller reachabilityPrimitives](self, "reachabilityPrimitives");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v6) = objc_msgSend(v7, "reachable");

    if ((_DWORD)v6)
    {
      _DMTLogGeneral_2();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21FD69000, v8, OS_LOG_TYPE_INFO, "Already reachable, skipping to enrollment", buf, 2u);
      }

      -[DMTAutomatedDeviceEnroller enrollDevice](self, "enrollDevice");
    }
    else
    {
      -[DMTAutomatedDeviceEnroller waitForReachabilityWithTimeout:](self, "waitForReachabilityWithTimeout:", 30.0);
    }
  }
}

- (void)uninstallProfile
{
  NSObject *v3;
  DMTUninstallProfileOperation *v4;
  void *v5;
  void *v6;
  DMTUninstallProfileOperation *v7;
  void *v8;
  uint8_t v9[16];

  _DMTLogEnrollment();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_DEFAULT, "Uninstalling Profile...", v9, 2u);
  }

  v4 = [DMTUninstallProfileOperation alloc];
  -[DMTAutomatedDeviceEnroller profileInstallationPrimitives](self, "profileInstallationPrimitives");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTAutomatedDeviceEnroller installedNetworkPayloadIdentifier](self, "installedNetworkPayloadIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[DMTUninstallProfileOperation initWithProfileInstallationPrimitives:profileIdentifier:](v4, "initWithProfileInstallationPrimitives:profileIdentifier:", v5, v6);

  -[DMTUninstallProfileOperation addTarget:selector:forOperationEvents:](v7, "addTarget:selector:forOperationEvents:", self, sel_profileUninstallDidFinish_, 6);
  -[DMTAutomatedDeviceEnroller operationQueue](self, "operationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addOperation:", v7);

}

- (void)profileUninstallDidFinish:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v4 = a3;
  objc_msgSend(v4, "error");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    _DMTLogGeneral_2();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[DMTAutomatedDeviceEnroller profileUninstallDidFinish:].cold.1(self, v4);
  }
  else
  {
    -[DMTAutomatedDeviceEnroller setInstalledNetworkPayloadIdentifier:](self, "setInstalledNetworkPayloadIdentifier:", 0);
    _DMTLogEnrollment();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21FD69000, v6, OS_LOG_TYPE_DEFAULT, "Profile uninstalled successfully", v7, 2u);
    }
  }

}

- (void)joinNetworkUsingCredentials
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  _DMTLogEnrollment();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_DEFAULT, "Joining network using provided credentials...", buf, 2u);
  }

  -[DMTAutomatedDeviceEnroller wifiPrimitives](self, "wifiPrimitives");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTAutomatedDeviceEnroller networkCredential](self, "networkCredential");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__DMTAutomatedDeviceEnroller_joinNetworkUsingCredentials__block_invoke;
  v6[3] = &unk_24E5A0530;
  objc_copyWeak(&v7, &location);
  objc_msgSend(v4, "joinWiFiNetworkWithCredential:timeout:completion:", v5, v6, 60.0);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __57__DMTAutomatedDeviceEnroller_joinNetworkUsingCredentials__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__DMTAutomatedDeviceEnroller_joinNetworkUsingCredentials__block_invoke_2;
  block[3] = &unk_24E5A0508;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __57__DMTAutomatedDeviceEnroller_joinNetworkUsingCredentials__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didJoinNetworkWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)didJoinNetworkWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *v7;

  v6 = a4;
  if (a3)
  {
    -[DMTAutomatedDeviceEnroller waitForReachabilityWithTimeout:](self, "waitForReachabilityWithTimeout:", 30.0);
  }
  else
  {
    _DMTLogGeneral_2();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DMTAutomatedDeviceEnroller didJoinNetworkWithSuccess:error:].cold.1(self);

    -[DMTAutomatedDeviceEnroller tearDownWithFatalError:](self, "tearDownWithFatalError:", v6);
  }

}

- (void)disassociateWiFi
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id buf[2];

  _DMTLogGeneral_2();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_INFO, "Disassociating current WiFi network...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[DMTAutomatedDeviceEnroller wifiPrimitives](self, "wifiPrimitives");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __46__DMTAutomatedDeviceEnroller_disassociateWiFi__block_invoke;
  v5[3] = &unk_24E5A0530;
  objc_copyWeak(&v6, buf);
  objc_msgSend(v4, "disassociateWiFiNetworkWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __46__DMTAutomatedDeviceEnroller_disassociateWiFi__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__DMTAutomatedDeviceEnroller_disassociateWiFi__block_invoke_2;
  block[3] = &unk_24E5A0508;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __46__DMTAutomatedDeviceEnroller_disassociateWiFi__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "didDisassociateFromNetworkWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)didDisassociateFromNetworkWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v6 = a4;
  if (a3)
  {
    _DMTLogEnrollment();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21FD69000, v7, OS_LOG_TYPE_DEFAULT, "Disassociated current WiFi network successfully", v8, 2u);
    }
  }
  else
  {
    _DMTLogGeneral_2();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[DMTAutomatedDeviceEnroller didDisassociateFromNetworkWithSuccess:error:].cold.1(self);
  }

}

- (void)checkActivationStatus
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id buf[2];

  _DMTLogEnrollment();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_DEFAULT, "Checking activation status...", (uint8_t *)buf, 2u);
  }

  -[DMTAutomatedDeviceEnroller setEnrollmentState:](self, "setEnrollmentState:", 8);
  objc_initWeak(buf, self);
  -[DMTAutomatedDeviceEnroller activationPrimitives](self, "activationPrimitives");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __51__DMTAutomatedDeviceEnroller_checkActivationStatus__block_invoke;
  v5[3] = &unk_24E5A0530;
  objc_copyWeak(&v6, buf);
  objc_msgSend(v4, "fetchActivationStateWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __51__DMTAutomatedDeviceEnroller_checkActivationStatus__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__DMTAutomatedDeviceEnroller_checkActivationStatus__block_invoke_2;
  block[3] = &unk_24E5A0508;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __51__DMTAutomatedDeviceEnroller_checkActivationStatus__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activationStatusFetchComplete:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)activationStatusFetchComplete:(BOOL)a3 error:(id)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  _DMTLogEnrollment();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "verboseDescription");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v8;
    v13 = 2114;
    v14 = v9;
    _os_log_impl(&dword_21FD69000, v7, OS_LOG_TYPE_DEFAULT, "Activation status fetched: %{public}@, error: %{public}@", (uint8_t *)&v11, 0x16u);

  }
  if (v4)
  {
    _DMTLogEnrollment();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_21FD69000, v10, OS_LOG_TYPE_DEFAULT, "Device is already activated...", (uint8_t *)&v11, 2u);
    }

    -[DMTAutomatedDeviceEnroller checkIfAlreadyEnrolled](self, "checkIfAlreadyEnrolled");
  }
  else
  {
    -[DMTAutomatedDeviceEnroller activateDevice](self, "activateDevice");
  }

}

- (void)activateDevice
{
  NSObject *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id buf[2];

  _DMTLogEnrollment();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_DEFAULT, "Activating device...", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  -[DMTAutomatedDeviceEnroller activationPrimitives](self, "activationPrimitives");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __44__DMTAutomatedDeviceEnroller_activateDevice__block_invoke;
  v5[3] = &unk_24E5A0530;
  objc_copyWeak(&v6, buf);
  objc_msgSend(v4, "activateWithCompletion:", v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __44__DMTAutomatedDeviceEnroller_activateDevice__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__DMTAutomatedDeviceEnroller_activateDevice__block_invoke_2;
  block[3] = &unk_24E5A0508;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v9);
}

void __44__DMTAutomatedDeviceEnroller_activateDevice__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "activationCompleteWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));

}

- (void)activationCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *v8;
  uint8_t v9[16];

  v6 = a4;
  if (a3)
  {
    _DMTLogEnrollment();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21FD69000, v7, OS_LOG_TYPE_DEFAULT, "Device activation successful...", v9, 2u);
    }

    -[DMTAutomatedDeviceEnroller checkIfAlreadyEnrolled](self, "checkIfAlreadyEnrolled");
  }
  else
  {
    _DMTLogGeneral_2();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[DMTAutomatedDeviceEnroller activationCompleteWithSuccess:error:].cold.1();

    -[DMTAutomatedDeviceEnroller tearDownWithFatalError:](self, "tearDownWithFatalError:", v6);
  }

}

- (void)checkIfAlreadyEnrolled
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21FD69000, log, OS_LOG_TYPE_ERROR, "Device is already enrolled according to enrollmentInformationPrimitives...", v1, 2u);
}

- (void)enrollDevice
{
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[5];
  id v7;
  id buf[2];

  _DMTLogEnrollment();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21FD69000, v3, OS_LOG_TYPE_DEFAULT, "Starting enrollment...", (uint8_t *)buf, 2u);
  }

  -[DMTAutomatedDeviceEnroller setEnrollmentState:](self, "setEnrollmentState:", 9);
  objc_initWeak(buf, self);
  -[DMTAutomatedDeviceEnroller enrollmentPrimitives](self, "enrollmentPrimitives");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMTAutomatedDeviceEnroller enrollmentNonce](self, "enrollmentNonce");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __42__DMTAutomatedDeviceEnroller_enrollDevice__block_invoke;
  v6[3] = &unk_24E5A0580;
  v6[4] = self;
  objc_copyWeak(&v7, buf);
  objc_msgSend(v4, "enrollWithNonce:completionBlock:", v5, v6);

  objc_destroyWeak(&v7);
  objc_destroyWeak(buf);
}

void __42__DMTAutomatedDeviceEnroller_enrollDevice__block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  char v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;
  char v17;
  char v18;

  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(a1 + 32), "enrollmentInformationPrimitives");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEnrolled");

  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __42__DMTAutomatedDeviceEnroller_enrollDevice__block_invoke_2;
  v13[3] = &unk_24E5A0558;
  objc_copyWeak(&v16, (id *)(a1 + 40));
  v17 = a2;
  v18 = v10;
  v14 = v8;
  v15 = v7;
  v11 = v7;
  v12 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v13);

  objc_destroyWeak(&v16);
}

void __42__DMTAutomatedDeviceEnroller_enrollDevice__block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(_BYTE *)(a1 + 56) || !*(_BYTE *)(a1 + 57))
    {
      objc_msgSend(WeakRetained, "enrollmentCompleteWithResponse:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
    }
    else
    {
      v4 = *(_QWORD *)(a1 + 32);
      v7 = *MEMORY[0x24BDD1398];
      v8[0] = v4;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      DMTErrorWithCodeAndUserInfo(100, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v3, "enrollmentCompleteWithResponse:error:", *(_QWORD *)(a1 + 40), v6);
    }
  }

}

- (void)enrollmentCompleteWithResponse:(id)a3 error:(id)a4
{
  id v5;
  NSObject *v6;
  const __CFString *v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  _DMTLogEnrollment();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = CFSTR("NO");
    if (!v5)
      v7 = CFSTR("YES");
    v9 = 138543362;
    v10 = v7;
    _os_log_impl(&dword_21FD69000, v6, OS_LOG_TYPE_DEFAULT, "Enrollment complete: %{public}@", (uint8_t *)&v9, 0xCu);
  }

  -[DMTAutomatedDeviceEnroller setEnrollmentError:](self, "setEnrollmentError:", v5);
  if (v5)
    v8 = 14;
  else
    v8 = 10;
  -[DMTAutomatedDeviceEnroller setEnrollmentState:](self, "setEnrollmentState:", v8);
}

- (void)eraseAllContentAndSettingsWithExternalError:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    -[DMTAutomatedDeviceEnroller enrollmentError](self, "enrollmentError");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      -[DMTAutomatedDeviceEnroller nonDestructiveErasePrimitives](self, "nonDestructiveErasePrimitives");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_5;
    }
  }
  -[DMTAutomatedDeviceEnroller destructiveErasePrimitives](self, "destructiveErasePrimitives");
  v7 = objc_claimAutoreleasedReturnValue();
LABEL_5:
  v8 = (void *)v7;
  objc_initWeak(&location, self);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __74__DMTAutomatedDeviceEnroller_eraseAllContentAndSettingsWithExternalError___block_invoke;
  v9[3] = &unk_24E5A01D0;
  objc_copyWeak(&v10, &location);
  objc_msgSend(v8, "performEraseWithCompletion:", v9);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

void __74__DMTAutomatedDeviceEnroller_eraseAllContentAndSettingsWithExternalError___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
    objc_msgSend(WeakRetained, "performSelectorOnMainThread:withObject:waitUntilDone:", sel_eraseAllContentAndSettingsDidFinishWithError_, v5, 0);

}

- (void)eraseAllContentAndSettingsDidFinishWithError:(id)a3
{
  id v4;
  NSObject *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (v4)
  {
    _DMTLogGeneral_2();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[DMTAutomatedDeviceEnroller eraseAllContentAndSettingsDidFinishWithError:].cold.1();

  }
  v6 = -[DMTAutomatedDeviceEnroller enrollmentState](self, "enrollmentState");
  -[DMTAutomatedDeviceEnroller powerOffPrimitives](self, "powerOffPrimitives");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6 == 11)
    objc_msgSend(v7, "reboot");
  else
    objc_msgSend(v7, "shutDown");

}

- (DMTAutomatedDeviceEnrollmentPrimitives)enrollmentPrimitives
{
  return self->_enrollmentPrimitives;
}

- (DMTEnrollmentInformationPrimitives)enrollmentInformationPrimitives
{
  return self->_enrollmentInformationPrimitives;
}

- (DMTInternetReachabilityPrimitives)reachabilityPrimitives
{
  return self->_reachabilityPrimitives;
}

- (DMTActivationPrimitives)activationPrimitives
{
  return self->_activationPrimitives;
}

- (DMTWiFiPrimitives)wifiPrimitives
{
  return self->_wifiPrimitives;
}

- (DMTProfileInstallationPrimitives)profileInstallationPrimitives
{
  return self->_profileInstallationPrimitives;
}

- (DMTErasePrimitives)destructiveErasePrimitives
{
  return self->_destructiveErasePrimitives;
}

- (DMTPowerOffPrimitives)powerOffPrimitives
{
  return self->_powerOffPrimitives;
}

- (NSString)organizationName
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (void)setOrganizationName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (int64_t)organizationType
{
  return self->_organizationType;
}

- (void)setOrganizationType:(int64_t)a3
{
  self->_organizationType = a3;
}

- (NSString)mdmServerName
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setMdmServerName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSString)networkName
{
  return (NSString *)objc_getProperty(self, a2, 112, 1);
}

- (void)setNetworkName:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (int64_t)enrollmentState
{
  return self->_enrollmentState;
}

- (void)setEnrollmentState:(int64_t)a3
{
  self->_enrollmentState = a3;
}

- (NSError)enrollmentError
{
  return (NSError *)objc_getProperty(self, a2, 128, 1);
}

- (void)setEnrollmentError:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (CATOperationQueue)operationQueue
{
  return self->_operationQueue;
}

- (NSString)installedNetworkPayloadIdentifier
{
  return self->_installedNetworkPayloadIdentifier;
}

- (void)setInstalledNetworkPayloadIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 144);
}

- (BOOL)isFinalized
{
  return self->_finalized;
}

- (void)setFinalized:(BOOL)a3
{
  self->_finalized = a3;
}

- (DMTNetworkCredential)networkCredential
{
  return self->_networkCredential;
}

- (void)setNetworkCredential:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (NSData)networkPayload
{
  return self->_networkPayload;
}

- (void)setNetworkPayload:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 160);
}

- (NSString)enrollmentNonce
{
  return self->_enrollmentNonce;
}

- (void)setEnrollmentNonce:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 168);
}

- (int64_t)postEnrollmentBehavior
{
  return self->_postEnrollmentBehavior;
}

- (void)setPostEnrollmentBehavior:(int64_t)a3
{
  self->_postEnrollmentBehavior = a3;
}

- (int64_t)networkConfiguration
{
  return self->_networkConfiguration;
}

- (void)setNetworkConfiguration:(int64_t)a3
{
  self->_networkConfiguration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enrollmentNonce, 0);
  objc_storeStrong((id *)&self->_networkPayload, 0);
  objc_storeStrong((id *)&self->_networkCredential, 0);
  objc_storeStrong((id *)&self->_installedNetworkPayloadIdentifier, 0);
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_storeStrong((id *)&self->_enrollmentError, 0);
  objc_storeStrong((id *)&self->_networkName, 0);
  objc_storeStrong((id *)&self->_mdmServerName, 0);
  objc_storeStrong((id *)&self->_organizationName, 0);
  objc_storeStrong((id *)&self->_powerOffPrimitives, 0);
  objc_storeStrong((id *)&self->_destructiveErasePrimitives, 0);
  objc_storeStrong((id *)&self->_profileInstallationPrimitives, 0);
  objc_storeStrong((id *)&self->_wifiPrimitives, 0);
  objc_storeStrong((id *)&self->_activationPrimitives, 0);
  objc_storeStrong((id *)&self->_reachabilityPrimitives, 0);
  objc_storeStrong((id *)&self->_enrollmentInformationPrimitives, 0);
  objc_storeStrong((id *)&self->_enrollmentPrimitives, 0);
  objc_storeStrong((id *)&self->_nonDestructiveErasePrimitives, 0);
}

- (void)setNetworkCredential:(const char *)a1 networkPayload:enrollmentNonce:postEnrollmentBehavior:organizationName:organizationType:mdmServerName:networkConfiguration:.cold.1(const char *a1)
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
  OUTLINED_FUNCTION_0_2(&dword_21FD69000, v2, v3, "Already finalized, refusing to call %{public}@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3_0();
}

- (void)timeoutOperationDidFinish:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  void *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = &unk_24E5A9CF0;
  OUTLINED_FUNCTION_1_1(&dword_21FD69000, a1, a3, "Network unreachable after %{public}@ seconds, failing enrollment", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)profileUninstallDidFinish:(void *)a1 .cold.1(void *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(a1, "installedNetworkPayloadIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "error");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_1(&dword_21FD69000, v4, v5, "Failed to uninstall profile %{public}@ with error: %{public}@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1_0();
}

- (void)didJoinNetworkWithSuccess:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "networkCredential");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "networkName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_21FD69000, v3, v4, "Failed to join %{private}@ with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)didDisassociateFromNetworkWithSuccess:(void *)a1 error:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  objc_msgSend(a1, "networkCredential");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "networkName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_2_1(&dword_21FD69000, v3, v4, "Failed to disassociate network %{private}@ with error: %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_1_0();
}

- (void)activationCompleteWithSuccess:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_21FD69000, v0, v1, "Device activation failed: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)eraseAllContentAndSettingsDidFinishWithError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_5();
  OUTLINED_FUNCTION_1_1(&dword_21FD69000, v0, v1, "Erase All Content And Settings failed: %{public}@", v2);
  OUTLINED_FUNCTION_1();
}

@end
